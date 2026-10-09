- dashboard: property_risk
  title: Property Risk
  layout: newspaper
  elements:
  - title: Property Market Value
    type: single_value
    model: banking
    explore: properties
    fields: [properties.total_market_value]
  - title: Properties by Type
    type: column
    model: banking
    explore: properties
    fields: [properties.property_type, properties.count]
  - title: Valuation by Method
    type: column
    model: banking
    explore: properties
    fields: [valuations.valuation_method, valuations.total_market_value]
