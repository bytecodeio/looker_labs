# If necessary, uncomment the line below to include explore_source.
# include: "order_items.explore.lkml"

view: add_a_unique_name_1680027065 {
  derived_table: {
    explore_source: order_items {
      column: category { field: products.category }
      column: total_sales {}
      column: total_cost { field: products.total_cost }
    }
  }
  dimension: category {
    description: ""
  }
  dimension: total_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_cost {
    description: ""
    type: number
  }
}
