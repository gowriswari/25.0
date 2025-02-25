include:gowri_11.view

view: users {
  extends: [gowri_11]
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    link: {
      label: "testtt"
      url: "explore/gowri_1/orders?fields=users.city"
    }
  }
  #dimension: first_name {
  #  type: string
  #  sql: ${TABLE}.first_name ;;
 # }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  ## parameter testing ###
  parameter: gowri_liquid_parameter{
    type:unquoted
    allowed_value: {
      label: "Break down by year"
      value: "year"
    }
    allowed_value: {
      label: "Break down by month"
      value: "month"
    }
  }
  dimension: param_test {
    sql: {% if  gowri_liquid_parameter._parameter_value == 'year' %}
              ${created_year}
         {% elsif gowri_liquid_parameter._parameter_value == 'month'%}
              ${created_month}
         {% else %}
              ${created_date}
          {% endif %} ;;

    html:
    {% if  gowri_liquid_parameter._parameter_value == 'year' %}
          <font color = "red"> {{ rendered_value }} </font>
          {% elsif gowri_liquid_parameter._parameter_value == 'month'%}
          <font color = "darkgreen"> {{rendered_value}} </font>
          {% else %}
          <font color = "blue"> {{rendered_value}} </font>
          {% endif %}
          ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
