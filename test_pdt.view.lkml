
view: test_pdt {

# If necessary, uncomment the line below to include explore_source.
    derived_table: {
      datagroup_trigger: some_datagroup
      create_process: {
        sql_step: CREATE TABLE ${SQL_TABLE_NAME} (
                         user_id int(11),
                         count int(11)
                       ) ;;
        sql_step: INSERT INTO ${SQL_TABLE_NAME}(user_id,count)
                        SELECT user_id , COUNT(*) AS count
                         FROM order
                         GROUP BY user_id ;;
      }
      explore_source: order_items {
        column: id { field: orders.id }
        column: user_id { field: orders.user_id }
        column: count { field: orders.count }
        column: brand { field: products.brand }
      }
    }
    dimension: id {
      description: ""
      type: number
    }
    dimension: user_id {
      description: ""
      type: number
    }
    dimension: count {
      description: ""
      type: number
    }
    dimension: brand {
      description: ""
    }
  }
