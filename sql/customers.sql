CREATE TABLE banking.customers (
  customer_id INT64,
  customer_name STRING,
  segment STRING,
  state STRING,
  created_at TIMESTAMP
);

INSERT INTO banking.customers VALUES
(1,'Alice Johnson','Retail','TX','2025-01-10'),
(2,'Bob Smith','Retail','CA','2025-02-15'),
(3,'Carol Lee','Premium','NY','2025-03-20');
