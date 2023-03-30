view: _dt_inventory_item_facts {
  view_label: "Inventory Items"
  derived_table: {
    explore_source: order_items {
      column: inventory_item_id {}
      column: sale_price {}
      column: cost { field: inventory_items.cost }
      bind_all_filters: yes
    }
  }
  dimension: inventory_item_id {
    primary_key: yes
    hidden: yes
  }
  dimension: sale_price {
    hidden: yes
    type: number
  }
  dimension: cost {
    hidden: yes
    type: number
  }
  dimension: product_margin {
    type: number
    sql: ${sale_price} - ${cost} ;;
    value_format_name: usd
  }
  measure: total_product_margin {
    type: sum
    sql: ${product_margin} ;;
    value_format_name: usd
  }
}
