CREATE TABLE banking.valuations (
  valuation_id INT64, property_id INT64, valuation_method STRING,
  market_value NUMERIC, valuation_date DATE
);

INSERT INTO banking.valuations VALUES
(1,501,'AVM',350000,'2025-05-01'),
(2,501,'Appraisal',360000,'2025-06-15'),
(3,502,'Appraisal',275000,'2025-06-10'),
(4,503,'AVM',150000,'2025-06-12');
