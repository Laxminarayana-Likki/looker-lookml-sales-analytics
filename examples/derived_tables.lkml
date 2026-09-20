view: monthly_sales_summary {

  derived_table: {

    sql:
      SELECT
        DATE_TRUNC(order_date, MONTH) AS order_month,
        COUNT(DISTINCT order_id) AS order_count,
        COUNT(DISTINCT customer_id) AS customer_count,
        SUM(sales_amount) AS total_sales
      FROM `analytics.orders`
      GROUP BY 1
      ORDER BY 1 ;;

    persist_for: "24 hours"
  }

  dimension_group: order_month {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_month ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.order_count ;;
  }

  dimension: customer_count {
    type: number
    sql: ${TABLE}.customer_count ;;
  }

  measure: total_sales {
    type: sum
    sql: ${TABLE}.total_sales ;;
    value_format_name: usd
  }
}
