view: order_items {
  sql_table_name: `looker-labs.thelook_ecommerce.order_items` ;;

  dimension: id {
    primary_key: yes
    # hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    hidden: no
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [users.gender,users.traffic_source,inventory_items.product_category,count,total_sales]
  }

  measure: average_sales_price {
    type: average
    sql: ${sale_price}  ;;
    value_format_name: usd
  }

  measure: distinct_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: orders_this_year {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      created_date: "this year to day"
    ]
    value_format_name: decimal_0
  }

  measure: orders_last_year {
    type: count_distinct
    sql: ${order_id} ;;
    filters: [
      created_date: "last year",
      created_time: "before 365 days ago"
    ]
    value_format_name: decimal_0
  }

  measure: total_sales {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }
}
