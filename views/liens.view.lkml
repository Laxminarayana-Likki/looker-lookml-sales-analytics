view: liens {
  sql_table_name: banking.liens ;;

  dimension: lien_id { primary_key: yes type: number sql: ${TABLE}.lien_id ;; }
  dimension: property_id { type: number sql: ${TABLE}.property_id ;; }
  dimension: lien_type { type: string sql: ${TABLE}.lien_type ;; }
  dimension: lien_holder { type: string sql: ${TABLE}.lien_holder ;; }
  dimension: lien_amount { type: number value_format_name: "usd" sql: ${TABLE}.lien_amount ;; }
  dimension: lien_status { type: string sql: ${TABLE}.lien_status ;; }
  measure: count { type: count }
  measure: total_lien_amount { type: sum sql: ${lien_amount} ;; value_format_name: "usd" }
}
