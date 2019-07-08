view: master_spt_wmt {
  label: "Smartpack"
  sql_table_name: `es-s2dl-core-p.smart_pack_looker_poc.master_spt_wmt`
    ;;

  dimension: average_wall_depth{
    type: number
    sql: ${TABLE}.avg_wall_depth ;;
  }

  dimension: average_wall_height_percent {
    type: number
    sql: ${TABLE}.avg_wall_height_percent ;;
    value_format_name: percent_2
  }

  dimension: door_number {
    type: number
    sql: ${TABLE}.door_number ;;
  }

  dimension: fullness_end {
    type: number
    sql: ${TABLE}.end_fullness_mc ;;
    value_format_name: percent_2
  }

  dimension: idle_time_percentage {
    type: number
    sql: ${TABLE}.idle_time_percentage ;;
    value_format_name: percent_2
  }

  dimension: load_classification {
    type: number
    sql: ${TABLE}.load_classification ;;
  }

  dimension_group: load_closed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.load_closed AS TIMESTAMP) ;;
  }

  dimension: load_duration_hours {
    type: number
    sql: ${TABLE}.load_duration_hours ;;
  }

  dimension: load_id {
    type: number
    sql: ${TABLE}.load_id ;;
  }

  dimension_group: load_opened {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.load_opened AS TIMESTAMP) ;;
  }

  dimension: load_rate_walls_per_hour {
    type: number
    sql: ${TABLE}.load_rate_walls_per_hour ;;
  }

  dimension: number_of_walls {
    type: number
    sql: ${TABLE}.number_of_walls ;;
  }

  dimension: reason_code {
    type: number
    sql: ${TABLE}.reason_code ;;
  }

  dimension: fullness_start {
    type: number
    sql: ${TABLE}.start_fullness_mc ;;
    value_format_name: percent_2
  }

  dimension: trailer_type {
    type: string
    sql: ${TABLE}.trailer_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
