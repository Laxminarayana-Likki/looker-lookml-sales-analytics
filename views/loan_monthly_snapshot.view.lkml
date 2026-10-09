view: loan_monthly_snapshot {
  sql_table_name: banking.loan_monthly_snapshot ;;

  dimension: snapshot_id { primary_key: yes type: number sql: ${TABLE}.snapshot_id ;; }
  dimension: loan_id { type: number sql: ${TABLE}.loan_id ;; }
  dimension_group: snapshot { type: time timeframes: [date, month, quarter, year] sql: ${TABLE}.snapshot_date ;; }
  dimension: outstanding_balance { type: number value_format_name: "usd" sql: ${TABLE}.outstanding_balance ;; }
  dimension: delinquency_days { type: number sql: ${TABLE}.delinquency_days ;; }
  dimension: risk_grade { type: string sql: ${TABLE}.risk_grade ;; }
  measure: count { type: count }
  measure: snapshot_balance { type: sum sql: ${outstanding_balance} ;; value_format_name: "usd" }
  measure: avg_delinquency_days { type: average sql: ${delinquency_days} ;; }
}
