view: branches {
  sql_table_name: banking.branches ;;

  dimension: branch_id { primary_key: yes type: number sql: ${TABLE}.branch_id ;; }
  dimension: branch_name { type: string sql: ${TABLE}.branch_name ;; }
  dimension: city { type: string sql: ${TABLE}.city ;; }
  dimension: state { type: string sql: ${TABLE}.state ;; }
  dimension: region { type: string sql: ${TABLE}.region ;; }
  measure: count { type: count }
}
