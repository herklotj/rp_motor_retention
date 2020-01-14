view: v_prem_earned_recon {
  sql_table_name: aapricing.v_prem_earned_recon ;;

  dimension_group: acc_month {
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
    sql: ${TABLE}.acc_month ;;
  }

  dimension: earned_premium_aap {
    type: number
    sql: ${TABLE}.earned_premium_aap ;;
  }

  dimension: earned_premium_pmid {
    type: number
    value_format_name: id
    sql: ${TABLE}.earned_premium_pmid ;;
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
    sql: ${TABLE}.uw_month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: pmid_earned_prem {
    type:  sum
    sql: ${TABLE}.earned_premium_pmid ;;
    value_format: "#.00;($#.00)"
  }
  measure: aap_earned_prem {
    type:  sum
    sql: ${TABLE}.earned_premium_aap ;;
    value_format: "#.00;($#.00)"
  }
  measure: ice_earned_prem {
    type:  sum
    sql: ${TABLE}.earned_premium_ice ;;
    value_format: "#.00;($#.00)"
  }
  measure: difference {
    type: average
    sql: 1-${TABLE}.earned_premium_pmid/${TABLE}.earned_premium_aap ;;
    value_format: "0.00%"
      }
  measure: difference_ice {
    type: average
    sql: 1-${TABLE}.earned_premium_pmid/${TABLE}.earned_premium_ice ;;
    value_format: "0.0000%"
    }
}
