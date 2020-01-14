view: v_postal_region {
  # # You can specify the table name if it's different from the view name:
sql_table_name: aapricing.v_postal_region ;;

  dimension: postcode_area {
    type: string
    map_layer_name: uk_postcode_areas
    sql: ${TABLE}.postcode_area ;;
  }
  measure: postal_region {
    type: sum
    sql: ${TABLE}.postal_region ;;
  }
}
