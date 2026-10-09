- dashboard: origination
  title: Loan Origination
  layout: newspaper
  elements:
  - title: Applications
    type: single_value
    model: banking
    explore: loan_applications
    fields: [loan_applications.count]
  - title: Approval Rate
    type: single_value
    model: banking
    explore: loan_applications
    fields: [loan_applications.approval_rate]
  - title: Requested vs Approved
    type: column
    model: banking
    explore: loan_applications
    fields: [loan_applications.application_month, loan_applications.total_requested, loan_applications.total_approved]
