include: "../views/*.view.lkml"

explore: users {
  join: _dt_user_order_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id} = ${_dt_user_order_facts.user_id} ;;
  }
}
