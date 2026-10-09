view: latest_valuation {
  derived_table: {
    sql:
      SELECT property_id, market_value AS total_market_value, valuation_date
      FROM banking.valuations
      QUALIFY ROW_NUMBER() OVER (PARTITION BY property_id ORDER BY valuation_date DESC) = 1 ;;
  }

  dimension: property_id { primary_key: yes type: number sql: ${TABLE}.property_id ;; }
  dimension: total_market_value { type: number value_format_name: "usd" sql: ${TABLE}.total_market_value ;; }
  dimension_group: valuation { type: time timeframes: [date, month, year] sql: ${TABLE}.valuation_date ;; }
  measure: count { type: count }
  measure: total_market_value { type: sum sql: ${total_market_value} ;; value_format_name: "usd" }
}
