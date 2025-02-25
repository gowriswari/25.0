# If necessary, uncomment the line below to include explore_source.
# include: "gowri_1.model.lkml"

view: native_derived_table_test {
  derived_table: {
    #datagroup_trigger: gowri_1_default_datagroup
    explore_source: order_items {
      column: age { field: users.age }
      column: email { field: users.email }
      column: count { field: users.count }
    }
  }
  dimension: age {
    description: ""
    type: number
  }
  dimension: email {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
}
