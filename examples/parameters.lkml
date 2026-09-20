view: sales_parameter_example {

  sql_table_name: analytics.orders ;;

  dimension_group: order_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_date ;;
  }

  parameter: date_granularity {
    label: "Date Granularity"
    type: unquoted
    allowed_value: {
      label: "Day"
      value: "date"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Quarter"
      value: "quarter"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
  }

  dimension: selected_date {
    label: "Selected Date"
    type: date
    sql:
      CASE
        WHEN {% parameter date_granularity %} = 'date'
          THEN ${order_date_date}

        WHEN {% parameter date_granularity %} = 'week'
          THEN ${order_date_week}

        WHEN {% parameter date_granularity %} = 'month'
          THEN ${order_date_month}

        WHEN {% parameter date_granularity %} = 'quarter'
          THEN ${order_date_quarter}

        WHEN {% parameter date_granularity %} = 'year'
          THEN ${order_date_year}
      END ;;
  }
}
