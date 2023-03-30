include: "../views/*.view.lkml"

explore: order_items {
  join: inventory_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }
  join: _dt_inventory_item_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${inventory_items.id} = ${_dt_inventory_item_facts.inventory_item_id} ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }
}
