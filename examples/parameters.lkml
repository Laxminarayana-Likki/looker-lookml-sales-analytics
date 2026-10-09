# Example parameter: choose a reporting metric.
view: parameter_example {
  derived_table: { sql: SELECT 1 AS id ;;; }

  dimension: id { primary_key: yes type: number sql: ${TABLE}.id ;; }

  parameter: metric_choice {
    type: unquoted
    allowed_value: { label: "Original Amount" value: "original_amount" }
    allowed_value: { label: "Outstanding Balance" value: "outstanding_balance" }
  }

  measure: selected_metric {
    type: number
    sql:
      {% if metric_choice._parameter_value == "'original_amount'" %}
        100
      {% else %}
        80
      {% endif %} ;;
  }
}
