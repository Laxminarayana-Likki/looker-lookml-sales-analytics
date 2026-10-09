CREATE TABLE banking.properties (
  property_id INT64, property_type STRING, city STRING, state STRING,
  zip_code STRING, market_value NUMERIC, occupancy_status STRING
);

INSERT INTO banking.properties VALUES
(501,'Single Family','Austin','TX','78701',350000,'Owner Occupied'),
(502,'Condo','Los Angeles','CA','90001',275000,'Owner Occupied'),
(503,'Single Family','Buffalo','NY','14201',150000,'Rental');
