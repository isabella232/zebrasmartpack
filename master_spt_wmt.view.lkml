view: master_spt_wmt {
  label: "Smartpack"
  sql_table_name: `es-s2dl-core-p.smart_pack_looker_poc.master_spt_wmt`
    ;;
#   ===========================        FILTERS         =============================
#   ===========================       DIMENSIONS       =============================
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

#   ===========================  DERIVED DIMENSIONS =============================
  dimension: starting_hour {
    type: number
    sql: extract(hour from ${load_opened_raw});;
  }

  dimension: starting_shift {
    type: string
    case: {
      when: {
        label: "1st Shift"
        sql: ${starting_hour} between 7 and 17 ;;
      }
      when: {
        label: "2nd Shift"
        sql: ${starting_hour} > 17 OR ${starting_hour} <= 3 ;;
      }
      else: "Unclassified"
    }
  }

  dimension: idle_time_hours {
    type: number
    sql: ${idle_time_percentage}*${load_duration_hours} ;;
    value_format_name: decimal_2
  }

  dimension: estimated_wall_depth {
    type: number
    sql: ${number_of_walls}*${average_wall_depth} ;;
    value_format_name: decimal_2
  }

  dimension: fullness_net {
    type: number
    sql: ${fullness_end}-${fullness_start} ;;
    value_format_name: percent_0
  }

  dimension: is_variant {
    type: yesno
    description: "Loads flagged with nuanced data - e.g. negative duration hours, negative net fullness, incompatible open/closed load times, etc"
    sql: ${load_duration_hours}<0 OR ${fullness_net}<0 OR ${average_wall_depth}<0 ;;
  }


#   ===========================     MEASURES        =============================
  measure: total_loads {
    type: count
    description: "Count of loads"
    drill_fields: [drill_detail_base*]
  }

  measure: total_load_duration_hours {
    type: sum
    sql: ${load_duration_hours} ;;
    value_format_name: decimal_2
    drill_fields: [drill_detail_base*]
  }

  measure: total_idle_time_hours {
    type: sum
    sql: ${idle_time_hours} ;;
    value_format_name: decimal_2
    drill_fields: [drill_detail_base*]
  }

  measure: idle_time {
    type: number
    sql: ${total_idle_time_hours}/NULLIF(${total_load_duration_hours},0) ;;
    value_format_name: percent_0
    drill_fields: [drill_detail_base*]
  }

  measure: total_number_of_walls {
    type: sum
    sql: ${number_of_walls} ;;
    drill_fields: [drill_detail_base*]
  }

  measure: average_number_of_walls {
    type: number
    sql: ${total_number_of_walls}/NULLIF(${total_loads},0) ;;
    value_format_name: decimal_1
    drill_fields: [drill_detail_base*]
  }

  measure: total_estimated_wall_depth {
    type: sum
    sql: ${estimated_wall_depth} ;;
    drill_fields: [drill_detail_base*]
  }

  measure: overall_average_wall_depth {
    type: number
    sql: ${total_estimated_wall_depth}/NULLIF(${total_number_of_walls},0) ;;
    value_format_name: decimal_2
    drill_fields: [drill_detail_base*]
  }

  measure: total_doors {
    type: count_distinct
    sql: ${door_number} ;;
    drill_fields: [drill_detail_base*]
  }

  measure: total_fullness {
    type: sum
    sql: ${fullness_net} ;;
    hidden: yes
  }

  measure: average_fullness_per_load {
    type: number
    sql: ${total_fullness}/NULLIF(${total_loads},0) ;;
    value_format_name: percent_0
    drill_fields: [drill_detail_base*]

  }

#   ===========================        SETS         =============================
set: drill_detail_base {
  fields: [load_id, door_number, sorter_configuration.gaylords, sorter_configuration.name, sorter_configuration.scac
    , load_opened_time, load_closed_time, fullness_start, fullness_end, fullness_net, idle_time_percentage, load_duration_hours
    , number_of_walls, average_wall_depth, average_wall_height_percent]
}

}
