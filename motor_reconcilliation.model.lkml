connection: "echo_aapricing"

# include all the views
include: "*.view"

datagroup: motor_reconcilliation_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: motor_reconcilliation_default_datagroup

explore: v_prem_earned_recon {}

explore: v_prem_written_recon {}
