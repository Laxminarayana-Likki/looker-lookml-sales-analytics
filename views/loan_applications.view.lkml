view: loan_applications {
  sql_table_name: banking.loan_applications ;;

  dimension: application_id { primary_key: yes type: number sql: ${TABLE}.application_id ;; }
  dimension: customer_id { type: number sql: ${TABLE}.customer_id ;; }
  dimension: branch_id { type: number sql: ${TABLE}.branch_id ;; }
  dimension: application_status { type: string sql: ${TABLE}.application_status ;; }
  dimension: loan_type { type: string sql: ${TABLE}.loan_type ;; }
  dimension: requested_amount { type: number value_format_name: "usd" sql: ${TABLE}.requested_amount ;; }
  dimension: approved_amount { type: number value_format_name: "usd" sql: ${TABLE}.approved_amount ;; }
  dimension_group: application { type: time timeframes: [date, month, year] sql: ${TABLE}.application_date ;; }

  measure: count { type: count }
  measure: approved_count { type: count filters: [application_status: "Approved"] }
  measure: rejected_count { type: count filters: [application_status: "Rejected"] }
  measure: approval_rate { type: number sql: SAFE_DIVIDE(${approved_count}, NULLIF(${count},0)) ;; value_format_name: "percent_2" }
  measure: total_requested { type: sum sql: ${requested_amount} ;; value_format_name: "usd" }
  measure: total_approved { type: sum sql: ${approved_amount} ;; value_format_name: "usd" }
}
