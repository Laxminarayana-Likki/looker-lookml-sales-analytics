CREATE TABLE banking.loan_monthly_snapshot (
  snapshot_id INT64, loan_id INT64, snapshot_date DATE,
  outstanding_balance NUMERIC, delinquency_days INT64, risk_grade STRING
);

INSERT INTO banking.loan_monthly_snapshot VALUES
(1,1001,'2025-05-31',285000,0,'A'),
(2,1001,'2025-06-30',280000,0,'A'),
(3,1002,'2025-05-31',245000,30,'C'),
(4,1002,'2025-06-30',240000,45,'C'),
(5,1003,'2025-06-30',100000,0,'B');
