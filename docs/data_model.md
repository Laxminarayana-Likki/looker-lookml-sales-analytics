# Data Model

Customers 1-to-many Loans.
Branches 1-to-many Loans.
Properties 1-to-many Loans.
Loans 1-to-many Payments.
Properties 1-to-many Valuations.
Properties 1-to-many Liens.
Loans 1-to-many Monthly Snapshots.

Important modeling rule: declare relationships correctly and use primary keys so Looker can apply symmetric aggregates where supported.
