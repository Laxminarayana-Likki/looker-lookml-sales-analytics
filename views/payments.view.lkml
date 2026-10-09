view: payments {
  sql_table_name: banking.payments ;;

  dimension: payment_id { primary_key: yes type: number sql: ${TABLE}.payment_id ;; }
  dimension: loan_id { type: number sql: ${TABLE}.loan_id ;; }
  dimension: payment_status { type: string sql: ${TABLE}.payment_status ;; }
  dimension: payment_method { type: string sql: ${TABLE}.payment_method ;; }
  dimension: amount { type: number value_format_name: "usd" sql: ${TABLE}.amount ;; }
  dimension_group: payment { type: time timeframes: [date, month, year] sql: ${TABLE}.payment_date ;; }

  measure: count { type: count }
  measure: total_payments { type: sum sql: ${amount} ;; value_format_name: "usd" }
  measure: successful_payments { type: sum filters: [payment_status: "Successful"] sql: ${amount} ;; value_format_name: "usd" }
  measure: failed_payments { type: sum filters: [payment_status: "Failed"] sql: ${amount} ;; value_format_name: "usd" }
}
