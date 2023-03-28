view: _dt_user_order_facts {
  view_label: "Users"
  derived_table: {
    sql: SELECT
        user_id,
        COUNT(DISTINCT order_id) AS lifetime_orders,
        SUM(sale_price) AS lifetime_revenue
      FROM `looker-labs.thelook_ecommerce.order_items`
      GROUP BY user_id
       ;;
  }

  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_orders {
    hidden: yes
    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }

  dimension: lifetime_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  measure: average_lifetime_revenue {
    type: average
    sql: ${lifetime_revenue} ;;
    value_format_name: usd
  }

  measure: average_lifetime_orders {
    type: average
    sql: ${lifetime_orders} ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [user_id, lifetime_orders, lifetime_revenue]
  }
}
