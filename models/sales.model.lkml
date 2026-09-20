connection: "bigquery_connection"

include: "/views/*.view.lkml"

explore: orders {

  label: "Sales Analytics"

  join: customers {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${orders.product_id} = ${products.product_id} ;;
  }
}
