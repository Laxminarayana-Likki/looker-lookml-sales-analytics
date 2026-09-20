- dashboard: sales_dashboard
  title: Sales Analytics Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next

  description: >
    Sales performance dashboard showing revenue, orders, customers,
    products, and monthly sales trends.

  elements:

  # 1. Total Revenue
  - title: Total Revenue
    name: total_revenue
    model: sales
    explore: orders
    type: single_value
    fields:
      - orders.total_revenue
    filters:
      orders.order_date: "this year"
    sorts:
      - orders.total_revenue desc
    limit: 500
    column_limit: 50
    listen:
      Date: orders.order_date

  # 2. Total Orders
  - title: Total Orders
    name: total_orders
    model: sales
    explore: orders
    type: single_value
    fields:
      - orders.order_count
    filters:
      orders.order_date: "this year"
    listen:
      Date: orders.order_date

  # 3. Total Customers
  - title: Total Customers
    name: total_customers
    model: sales
    explore: orders
    type: single_value
    fields:
      - customers.customer_count
    filters:
      orders.order_date: "this year"
    listen:
      Date: orders.order_date

  # 4. Average Order Value
  - title: Average Order Value
    name: average_order_value
    model: sales
    explore: orders
    type: single_value
    fields:
      - orders.average_order_value
    filters:
      orders.order_date: "this year"
    listen:
      Date: orders.order_date

  # 5. Monthly Revenue Trend
  - title: Monthly Revenue Trend
    name: monthly_revenue_trend
    model: sales
    explore: orders
    type: looker_line
    fields:
      - orders.order_month
      - orders.total_revenue
    sorts:
      - orders.order_month
    limit: 500
    x_axis_gridlines: true
    y_axis_gridlines: true
    point_style: circle
    listen:
      Date: orders.order_date

  # 6. Revenue by Product
  - title: Revenue by Product
    name: revenue_by_product
    model: sales
    explore: orders
    type: looker_bar
    fields:
      - products.product_name
      - orders.total_revenue
    sorts:
      - orders.total_revenue desc
    limit: 10
    listen:
      Date: orders.order_date

  # 7. Revenue by Customer
  - title: Top Customers by Revenue
    name: top_customers
    model: sales
    explore: orders
    type: looker_bar
    fields:
      - customers.customer_name
      - orders.total_revenue
    sorts:
      - orders.total_revenue desc
    limit: 10
    listen:
      Date: orders.order_date

  # 8. Orders by Status
  - title: Orders by Status
    name: orders_by_status
    model: sales
    explore: orders
    type: looker_pie
    fields:
      - orders.order_status
      - orders.order_count
    sorts:
      - orders.order_count desc
    limit: 20
    listen:
      Date: orders.order_date

  # Dashboard Filters
  filters:

  - name: Date
    title: Order Date
    type: date_filter
    default_value: "this year"
    allow_multiple_values: true
    required: false
