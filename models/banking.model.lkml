connection: "banking_analytics"

include: "/views/*.view.lkml"

explore: loans {
  label: "Loan Portfolio"
  description: "Core loan portfolio analytics."
  join: customers { relationship: many_to_one sql_on: ${loans.customer_id} = ${customers.customer_id} ;; }
  join: branches { relationship: many_to_one sql_on: ${loans.branch_id} = ${branches.branch_id} ;; }
  join: properties { relationship: many_to_one sql_on: ${loans.property_id} = ${properties.property_id} ;; }
  join: payments { relationship: one_to_many sql_on: ${loans.loan_id} = ${payments.loan_id} ;; }
  join: loan_monthly_snapshot { relationship: one_to_many sql_on: ${loans.loan_id} = ${loan_monthly_snapshot.loan_id} ;; }
  join: latest_valuation { relationship: one_to_one sql_on: ${loans.property_id} = ${latest_valuation.property_id} ;; }
}

explore: loan_applications {
  label: "Loan Origination"
  join: customers { relationship: many_to_one sql_on: ${loan_applications.customer_id} = ${customers.customer_id} ;; }
  join: branches { relationship: many_to_one sql_on: ${loan_applications.branch_id} = ${branches.branch_id} ;; }
}

explore: properties {
  label: "Property Risk"
  join: valuations { relationship: one_to_many sql_on: ${properties.property_id} = ${valuations.property_id} ;; }
  join: liens { relationship: one_to_many sql_on: ${properties.property_id} = ${liens.property_id} ;; }
  join: loans { relationship: one_to_many sql_on: ${properties.property_id} = ${loans.property_id} ;; }
}
