view: orders {

  sql_table_name: analytics.orders ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: order_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sales_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.sales_amount ;;
  }

  measure: order_count {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
  }

  measure: total_sales {
    type: sum
    value_format_name: usd
    sql: ${sales_amount} ;;
  }

  measure: average_sales {
    type: average
    value_format_name: usd
    sql: ${sales_amount} ;;
  }
}
