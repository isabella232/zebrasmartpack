connection: "s2dl-dev"

include: "*.view"



explore: master_spt_wmt {
  label: "SmartPack Trailer"

  join: sorter_configuration {
    relationship: many_to_one
    type: left_outer
    sql_on: ${master_spt_wmt.door_number} = ${sorter_configuration.door} ;;
  }
}
