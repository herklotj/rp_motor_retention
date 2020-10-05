view: v_prem_written_recon {
  sql_table_name: aapricing.v_prem_written_recon ;;

  dimension: net_premium_aap {
    type: number
    sql: ${TABLE}.net_premium_aap ;;
  }

  dimension: pmid_net_written_premimum {
    type: number
    sql: ${TABLE}.pmid_net_written_premimum ;;
  }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme ;;
  }

  dimension_group: uw_month {
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
    sql: CAST(${TABLE}.uw_month AS TIMESTAMP WITHOUT TIME ZONE);;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: net_prem_pmid {
    type:  sum
    sql: ${TABLE}.pmid_net_written_premimum ;;
    value_format: "#.00;($#.00)"
    }

    measure: net_prem_aap {
      type:  sum
      sql: ${TABLE}.net_premium_aap ;;
      value_format: "#.00;($#.00)"
  }

  measure: net_prem_ice {
    type:  sum
    sql: ${TABLE}.net_premium_ice ;;
    value_format: "#.00;($#.00)"
  }

  measure: difference {
    type:  average
    sql:1- ${TABLE}.pmid_net_written_premimum /${TABLE}.net_premium_aap ;;
    value_format: "0.0000%"
  }
  measure: difference_ice {
    type:  average
    sql:1- ${TABLE}.pmid_net_written_premimum /${TABLE}.net_premium_ice ;;
    value_format: "0.0000%"
  }
}
