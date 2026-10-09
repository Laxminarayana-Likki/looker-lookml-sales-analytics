- dashboard: executive_portfolio
  title: Executive Portfolio
  layout: newspaper
  elements:
  - title: Outstanding Balance
    type: single_value
    model: banking
    explore: loans
    fields: [loans.total_outstanding]
  - title: Active Loans
    type: single_value
    model: banking
    explore: loans
    fields: [loans.active_loans]
  - title: Delinquent Balance
    type: single_value
    model: banking
    explore: loans
    fields: [loans.delinquent_balance]
  - title: Balance by Loan Type
    type: column
    model: banking
    explore: loans
    fields: [loans.loan_type, loans.total_outstanding]
    sorts: [loans.total_outstanding desc]
