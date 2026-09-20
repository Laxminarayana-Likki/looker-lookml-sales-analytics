view: customers {

  sql_table_name: analytics.customers ;;

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: signup_date {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    sql: ${TABLE}.signup_date ;;
  }

  measure: customer_count {
    type: count_distinct
    sql: ${customer_id} ;;
  }
}
