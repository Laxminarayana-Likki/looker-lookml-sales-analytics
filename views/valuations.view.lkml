view: valuations {
  sql_table_name: banking.valuations ;;

  dimension: valuation_id { primary_key: yes type: number sql: ${TABLE}.valuation_id ;; }
  dimension: property_id { type: number sql: ${TABLE}.property_id ;; }
  dimension: valuation_method { type: string sql: ${TABLE}.valuation_method ;; }
  dimension: market_value { type: number value_format_name: "usd" sql: ${TABLE}.market_value ;; }
  dimension_group: valuation { type: time timeframes: [date, month, year] sql: ${TABLE}.valuation_date ;; }
  measure: count { type: count }
  measure: total_market_value { type: sum sql: ${market_value} ;; value_format_name: "usd" }
  measure: avg_market_value { type: average sql: ${market_value} ;; value_format_name: "usd" }
}
