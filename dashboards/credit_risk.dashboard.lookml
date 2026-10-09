- dashboard: credit_risk
  title: Credit Risk
  layout: newspaper
  elements:
  - title: Delinquent Balance
    type: single_value
    model: banking
    explore: loans
    fields: [loans.delinquent_balance]
  - title: Balance by Risk Grade
    type: column
    model: banking
    explore: loans
    fields: [loans.risk_grade, loans.total_outstanding]
    sorts: [loans.total_outstanding desc]
