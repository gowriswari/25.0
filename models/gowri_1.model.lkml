connection: "thelook"

# include all the views
include: "/views/**/*.view.lkml"
include: "/views/native_derived_table_test.view.lkml"

#datagroup: gowri_1_default_datagroup {
 # sql_trigger: SELECT MAX(id) FROM etl_log;;
 # max_cache_age: "1 hour"
#}
#datagroup: gowri_test1 {
#  max_cache_age: "5 minutes"
#  sql_trigger: SELECT max(users.id) from demo_db.users ;;
#}
#persist_with: gowri_1_default_datagroup

access_grant: explore_testing_ua {
  user_attribute: users_2
  allowed_values: [ "users" ]
}
explore: billion_orders {
  join: orders {
    type: left_outer
    sql_on: ${billion_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  #required_access_grants: [explore_testing_ua]
}

explore: bud {}

explore: budget {}

explore: budgets {}

explore: buds {}

explore: connection_reg_r3 {}

explore: countries {}

explore: customer {}

explore: day_of_week {}

explore: dept {}

explore: dummy {}

explore: employees {}

explore: events {
  #join: users {
  #  type: left_outer
  #  sql_on: ${events.user_id} = ${users.id} ;;
   # relationship: many_to_one
  #}
  description: "Start here for Event analysis"
  fields: [ALL_FIELDS*, -users.first_name]
  from: events
  view_name: events
  extends: [check]
  join: orders {
    type: left_outer
    sql_on: ${events.user_id} = ${orders.id} ;;
    relationship: many_to_one
  }
}

explore: fakeorders {
  join: orders {
    type: left_outer
    sql_on: ${fakeorders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: fatal_error_user_derived_base {}

explore: flights {}

explore: foo {}

explore: human {}

explore: hundred_million_orders {

  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

}

explore: hundred_million_orders_wide {
  #extension: required
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders_wide.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
######## extension testing on explores with events explore extending with users view ####
explore: check {
  extension: required
  join: users {
    type: left_outer
    sql_on: ${events.user_id}=${users.id} ;;
    relationship: one_to_many
  }
}
##############
explore: incremental_pdts_test {}

explore: ints {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: jdbc_connection_usage {}

explore: jdbc_result_set_usage {}

explore: jdbc_statement_usage {}

explore: korean {}

explore: korean_string {}

explore: map_layer {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
 # required_access_grants: [explore_testing_ua]
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_vijaya {
  join: orders {
    type: left_outer
    sql_on: ${order_items_vijaya.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items_vijaya.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_status_vijaya {}

explore: pegdates {}

explore: person {}

explore: persons {
  #extends: [order_items]
}

explore: persons2 {}

explore: products {
 # extends: [order_items]
}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}

explore: sample_data {}

explore: sample_table {}

explore: sandbox_scratch {}

explore: saralooker {
  join: users {
    type: left_outer
    sql_on: ${saralooker.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: schema_migrations {}

explore: sequel_database_usage_v1 {}

explore: sequel_database_usage_v2 {}

explore: sindhu {
  join: users {
    type: left_outer
    sql_on: ${sindhu.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: special_charaters {}

explore: demo_db_temporary {}

explore: ten_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${ten_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: test {}

explore: testing_blob {}

explore: testing_blob_type {}

explore: test_bit {}

explore: test_bits {}

explore: test_date {}

explore: test_lav {}

explore: test_space_in_column_name {}

explore: thor {}

explore: users {
  access_filter: {
    field: users.id
    user_attribute: ids
  }
}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
explore: native_derived_table_test {

}
################ aggregate tables ############

########################################

explore: viet {}

explore: vvimgsrc1onerroralert2ll {}

explore: xin_test_for_bug2 {}

explore: xss_test {}

explore: xss_test_1 {}

explore: xss_test_10 {}

explore: xss_test_11 {}

explore: xss_test_12 {}

explore: xss_test_13 {}

explore: xss_test_14 {}

explore: xss_test_15 {}

explore: xss_test_16 {}

explore: xss_test_2 {}

explore: xss_test_4 {}

explore: xss_test_5 {}

explore: xss_test_6 {}

explore: xss_test_7 {}

explore: xss_test_8 {}

explore: xss_test_9 {}
