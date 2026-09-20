view: liquid_example {

  sql_table_name: analytics.orders ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  measure: total_sales {
    type: sum
    sql: ${TABLE}.sales_amount ;;
    value_format_name: usd
  }

  parameter: display_field {
    label: "Display Field"
    type: unquoted

    allowed_value: {
      label: "Customer"
      value: "customer"
    }

    allowed_value: {
      label: "Product"
      value: "product"
    }
  }

  dimension: selected_dimension {
    label: "Selected Dimension"
    type: string

    sql:
      {% if display_field._parameter_value == "'customer'" %}
        ${customer_name}

      {% elsif display_field._parameter_value == "'product'" %}
        ${product_name}

      {% else %}
        'Unknown'
      {% endif %} ;;
  }
}
