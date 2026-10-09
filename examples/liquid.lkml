# Liquid example: dynamic labels and conditional SQL.
view: liquid_example {
  sql_table_name: banking.loans ;;

  parameter: display_mode {
    type: unquoted
    allowed_value: { label: "Portfolio" value: "portfolio" }
    allowed_value: { label: "Risk" value: "risk" }
  }

  dimension: dynamic_label {
    label: "{% if display_mode._parameter_value == "'risk'" %}Risk Grade{% else %}Loan Type{% endif %}"
    sql:
      {% if display_mode._parameter_value == "'risk'" %}
        ${TABLE}.risk_grade
      {% else %}
        ${TABLE}.loan_type
      {% endif %} ;;
  }
}
