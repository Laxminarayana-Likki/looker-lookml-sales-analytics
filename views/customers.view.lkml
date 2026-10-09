view: customers {
  sql_table_name: banking.customers ;;

  dimension: customer_id { primary_key: yes type: number sql: ${TABLE}.customer_id ;; }
  dimension: customer_name { type: string sql: ${TABLE}.customer_name ;; }
  dimension: segment { type: string sql: ${TABLE}.segment ;; }
  dimension: state { type: string sql: ${TABLE}.state ;; }
  dimension_group: created { type: time timeframes: [date, week, month, year] sql: ${TABLE}.created_at ;; }

  measure: count { type: count }
  measure: distinct_customers { type: count_distinct sql: ${customer_id} ;; }
}
