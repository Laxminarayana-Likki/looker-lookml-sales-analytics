CREATE TABLE banking.loans (
  loan_id INT64, customer_id INT64, branch_id INT64, property_id INT64,
  loan_type STRING, status STRING, risk_grade STRING, interest_rate NUMERIC,
  original_amount NUMERIC, outstanding_balance NUMERIC,
  origination_date DATE, maturity_date DATE
);

INSERT INTO banking.loans VALUES
(1001,1,101,501,'Mortgage','Active','A',0.0625,300000,280000,'2025-01-15','2055-01-15'),
(1002,2,102,502,'Mortgage','Delinquent','C',0.0710,250000,240000,'2025-02-20','2055-02-20'),
(1003,3,101,503,'Home Equity','Active','B',0.0650,120000,100000,'2025-03-12','2040-03-12');
