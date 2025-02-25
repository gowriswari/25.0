view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    suggest_explore: orders
    suggest_dimension: orders.id
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;

  }
  measure: test {
    type: sum
    sql: ${sale_price} ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
  parameter: test_parameter {
    type: unquoted
    allowed_value: {
      label: "sale price"
      value: "sale_price"
    }
    allowed_value: {
      label: "inventory_item_id"
      value: "inventory_item_id"
    }
  }
  measure: test_param_measure {
    type: sum
    sql: ${TABLE}.{% parameter test_parameter %} ;;

  }
}
