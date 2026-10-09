view: properties {
  sql_table_name: banking.properties ;;

  dimension: property_id { primary_key: yes type: number sql: ${TABLE}.property_id ;; }
  dimension: property_type { type: string sql: ${TABLE}.property_type ;; }
  dimension: city { type: string sql: ${TABLE}.city ;; }
  dimension: state { type: string sql: ${TABLE}.state ;; }
  dimension: zip_code { type: string sql: ${TABLE}.zip_code ;; }
  dimension: market_value { type: number value_format_name: "usd" sql: ${TABLE}.market_value ;; }
  dimension: occupancy_status { type: string sql: ${TABLE}.occupancy_status ;; }
  measure: count { type: count }
  measure: total_market_value { type: sum sql: ${market_value} ;; value_format_name: "usd" }
  measure: avg_market_value { type: average sql: ${market_value} ;; value_format_name: "usd" }
}
