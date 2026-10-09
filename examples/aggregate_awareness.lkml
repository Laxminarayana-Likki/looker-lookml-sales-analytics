# Aggregate awareness example.
explore: loans_with_aggregate {
  label: "Loans - Aggregate Awareness Example"

  aggregate_table: monthly_branch_rollup {
    query: {
      dimensions: [loans.origination_month, branches.branch_id, loans.loan_type]
      measures: [loans.count, loans.total_outstanding, loans.total_original_amount]
      filters: [loans.status: "Active"]
    }
    materialization: {
      datagroup_trigger: banking_daily
    }
  }
}
