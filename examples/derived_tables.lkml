# Derived table examples.
view: monthly_portfolio_example {
  derived_table: {
    sql:
      SELECT
        DATE_TRUNC(origination_date, MONTH) AS month,
        COUNT(*) AS loan_count,
        SUM(outstanding_balance) AS balance
      FROM banking.loans
      GROUP BY 1 ;;
    persist_for: "24 hours"
  }

  dimension_group: month { type: time timeframes: [date, month] sql: ${TABLE}.month ;; }
  dimension: loan_count { type: number sql: ${TABLE}.loan_count ;; }
  dimension: balance { type: number value_format_name: "usd" sql: ${TABLE}.balance ;; }
}
