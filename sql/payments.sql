CREATE TABLE banking.payments (
  payment_id INT64, loan_id INT64, payment_status STRING,
  payment_method STRING, amount NUMERIC, payment_date DATE
);

INSERT INTO banking.payments VALUES
(9001,1001,'Successful','ACH',2200,'2025-06-01'),
(9002,1002,'Failed','ACH',1800,'2025-06-02'),
(9003,1003,'Successful','Card',1200,'2025-06-03');
