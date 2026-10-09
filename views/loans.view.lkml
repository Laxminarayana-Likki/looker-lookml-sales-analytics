view: loans {
  sql_table_name: banking.loans ;;

  dimension: loan_id { primary_key: yes type: number sql: ${TABLE}.loan_id ;; }
  dimension: customer_id { type: number sql: ${TABLE}.customer_id ;; }
  dimension: branch_id { type: number sql: ${TABLE}.branch_id ;; }
  dimension: property_id { type: number sql: ${TABLE}.property_id ;; }
  dimension: loan_type { type: string sql: ${TABLE}.loan_type ;; }
  dimension: status { type: string sql: ${TABLE}.status ;; }
  dimension: risk_grade { type: string sql: ${TABLE}.risk_grade ;; }
  dimension: interest_rate { type: number value_format_name: "percent_2" sql: ${TABLE}.interest_rate ;; }
  dimension: original_amount { type: number value_format_name: "usd" sql: ${TABLE}.original_amount ;; }
  dimension: outstanding_balance { type: number value_format_name: "usd" sql: ${TABLE}.outstanding_balance ;; }
  dimension_group: origination { type: time timeframes: [date, month, quarter, year] sql: ${TABLE}.origination_date ;; }
  dimension_group: maturity { type: time timeframes: [date, month, year] sql: ${TABLE}.maturity_date ;; }

  measure: count { type: count }
  measure: total_original_amount { type: sum sql: ${original_amount} ;; value_format_name: "usd" }
  measure: total_outstanding { type: sum sql: ${outstanding_balance} ;; value_format_name: "usd" }
  measure: avg_loan_size { type: average sql: ${original_amount} ;; value_format_name: "usd" }
  measure: avg_interest_rate { type: average sql: ${interest_rate} ;; value_format_name: "percent_2" }
  measure: delinquent_loans { type: count filters: [status: "Delinquent"] }
  measure: delinquent_balance { type: sum filters: [status: "Delinquent"] sql: ${outstanding_balance} ;; value_format_name: "usd" }
  measure: active_loans { type: count filters: [status: "Active"] }
  measure: portfolio_ltv { type: number sql: SAFE_DIVIDE(${total_outstanding}, NULLIF(${latest_valuation.total_market_value},0)) ;; value_format_name: "percent_2" }
}
