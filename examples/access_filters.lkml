explore: orders_secure {

  from: orders

  access_filter: {
    field: orders.region
    user_attribute: user_region
  }

}
