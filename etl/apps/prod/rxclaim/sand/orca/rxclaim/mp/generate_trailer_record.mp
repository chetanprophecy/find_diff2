@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|35|rel_count|56|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|SOURCE_FILE|/etl/data/dev/serial/orca/rxclaim/main/rxclaim_bc/20180908_eob_file_201808_PDPIND_U2Z_TEST1.out|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|generate_trailer_record|ptondare|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1003000|292000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|0|0|}Job 'generate_trailer_record' Execution Status Report

Job completed successfully at Monday, November 05, 2018 04:15:28
Run performed by user ptondare
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}80|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}77|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}81|17|}}
{2010503005|XXGfvertex|8|0|15|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|record
string(2) record_identifier;

if(record_identifier == "HD")
record
string(8) run_date;
string(8) period_beginning_date;
string(8) period_ending_date;
string(2) edss_access_code;
string("\\n") newline;
end HEADER;
else if(record_identifier == "MD")
record
string(9) carrier_id;
string(15) account_id;
string(15) group_id;
string(6) rxpcn;
string(10) rxbin;
string(15) submited_group;
string(18) member_id;
string(15) member_first_name;
string(1) member_middle_initial;
string(25) member_last_name;
string(40) member_street_address_line_1;
string(20) member_city;
string(2) member_state;
string(5) member_zip_code;
string(4) member_zip_code___4;
string(10) plan_annual_deductible;
string(10) member__and_qualified_others__drug_spend_in_annual_deductible_benefit_phase;
string(10) deductible_phase_amount_remaining_before_next_benefit_phase;
string(10) initial_coverage_amount__limit_;
string(10) member__and_qualified_others__drug_spend_in_initial_coverage_benefit_phase;
string(10) initial_coverage_phase_amount_remaining_before_entering_coverage_gap_benefit_phase;
string(10) member__and_qualified_others_troop_in_coverage_gap_benefit_phase;
string(10) coverage_gap_amount__limit_;
string(10) coverage_gap_benefit_phase_amount_remaining_before_entering_catastrophic_benefit_phase;
string(10) yeartodate_total_drug_cost;
string(10) monthtodate_total_drug_cost;
string(10) yeartodate_troop_amount;
string(10) monthtodate_troop_amount;
string(11) monthtodate_plan_and_others_paid;
string(11) yeartodate_plan_and_others_paid;
string(8) financial_information_reporting__fir__adjustment_date_from_previous_plan;
string(10) financial_information_reporting_adjustments_to_troop_from_previous_plan;
string(10) financial_information_reporting_adjustments_to_drug_spend_from_previous_plan;
string(2) member_subsidy_level_indicator;
string(1) benefit_phase_indicator;
string(10) mtd_preferred_mail_savings;
string(10) ytd_preferred_mail_savings;
string(10) amount_paid_that_does_not_count_toward_troop_mtd;
string(10) amount_paid_that_does_not_count_toward_troop_ytd;
string(40) address_line_2;
string(40) address_line_3;
string(10) total_plan_paid_in_deductible_stage;
string(10) total_you_others_on_your_behalf_paid_in_deductible;
string(10) total_you_others_on_your_behalf_paid_in_deductible_period_that_counted_toward_your_outofpocket_costs__troop_;
string(10) total_you_others_on_your_behalf_paid_in_deductible_period_that_didnt_count_toward_your_outofpocket_costs__troop_;
string(10) total_drug_costs_left_to_move_to_the_initial_coverage_period;
string(10) total_plan_paid_in_initial_coverage_period;
string(10) total_you_others_on_your_behalf_paid_in_initial_coverage_period;
string(10) total_you_others_on_your_behalf_paid_in_initial_coverage_period_that_counted_toward_your_outofpocket_costs__troop_;
string(10) total_you_others_on_your_behalf_paid_in_initial_coverage_period_that_did_not_count_toward_your_outofpocket_costs__troop_;
string(10) total_drug_costs_left_before_the_coverage_gap;
string(10) total_plan_paid_in_coverage_gap;
string(10) total_you_others_on_your_behalf_paid_in_coverage_gap;
string(10) total_you_others_on_your_behalf_paid_in_coverage_gap_that_counted_toward_your_outofpocket_costs__troop_;
string(10) total_you_others_on_your_behalf_paid_in_coverage_gap_that_did_not_count_toward_your_outofpocket_costs__troop_;
string(10) outofpocket_costs__troop__left_before_catastrophic_coverage;
string(10) total_plan_paid_in_catastrophic_coverage;
string(10) total_you_others_on_your_behalf_paid_in_catastrophic_coverage;
string(3) language_indicator;
string(6) duncan_logo_id;
string(2) eob_mail_vs_online_indicator;
string(8) run_date;
string(8) period_beginning_date;
string(8) period_ending_date;
string(2) edss_access_code;
string(10) yeartodate_amount_paid_by_you;
string(10) yeartodate_amount_paid_by_others;
string(10) yeartodate_plan_paid;
string(10) yeartodate_others_paid_that_counted_towards_troop;
string(1) _fir_deductible_flag_;
string(1) split_tier_dual_coverage_indicator;
string(12) moop_member_pay;
string(11) filler__11_bytes_;
string("\\n") newline;
end MEMBER_RECORD;
else if(record_identifier == "PD")
record
string(9) carrier_id;
string(15) account_id;
string(15) group_id;
string(60) eob_plan_name;
string(10) catastrophic_coverage_threshold_4050;
string(10) catastrophic_copayment_coinsurance_amounts_value__1;
string(10) catastrophic_copayment_coinsurance_amounts_value__2;
string(10) catastrophic_copayment_coinsurance_amounts_value__3;
string(10) customer_service_toll_free_number;
string(10) customer_service_ttytdd;
string(60) website;
string(60) customer_service_hours_of_operation;
string(10) mail_service_toll_free_number;
string(10) mail_service_ttytdd;
string(60) mail_service_hours_of_operation;
string(6) duncan_logo_id;
string(40) return_address_line_1;
string(20) return_address_city;
string(2) return_address_state;
string(5) return_address_zip;
string(4) return_address_zip___4;
string(2) coverage_in_the_gap_indicator;
string(2) medicare_plan_type_;
string(5) contract_id;
string(3) pbp_id;
string(15) message_code;
string(20) plan_type;
string(40) return_address_line_2;
string(10) deductible_amount;
string(1) split_tier_indicator;
string(1) suppress_section_2_indicator;
string(10) troop_amount;
string(16) filler_for_16_bytes;
string("\\n") newline;
end PLAN_RECORD;
else if(record_identifier == "CD")
record
string(9) carrier_id;
string(15) account_id;
string(15) group_id;
string(18) member_id;
string(15) rxclaim_number;
string(3) sequence_number;
string(1) claim_status;
string(15) provider_id;
string(60) pharmacy_name_;
string(1) out_of_network_pharmacy_indicator;
string(55) pharmacy_address_1;
string(55) pharmacy_address_2;
string(30) pharmacy_city;
string(2) pharmacy_state_abbreviation;
string(9) rx_number_filler;
string(2) refill_number;
string(8) fill_date;
string(8) submit_date;
string(30) product_name___dosage;
string(12) dispensed_quantity;
string(3) days_supply;
string(10) patient_pay_before_lics;
string(4) drug_tier;
string(10) retail_price__uc_w_;
string(10) total_drug_cost_;
string(1) drug_coverage_status_code;
string(1) eap_drug_flag;
string(10) amount_paid_by_plan;
string(10) amount_paid_by_you;
string(10) plro__cob_payer_amount_;
string(10) others_paid;
string(10) lics_adjustment_amount;
string(10) preferred_mail_service_savings;
string(30) lower_cost_drug_name_1;
string(30) lower_cost_drug_name_2;
string(30) lower_cost_drug_name_3;
string(30) lower_cost_drug_range_of_savings;
string(10) other_troop;
string(10) monthtodate_amount_paid_by_you;
string(10) monthtodate_amount_paid_by_others;
string(10) monthtodate_plan_paid;
string(10) monthtodate_total_drug_cost;
string(10) monthtodate_retail_price;
string(10) yeartodate_amount_paid_by_you;
string(10) yeartodate_amount_paid_by_others;
string(10) yeartodate_plan_paid;
string(10) yeartodate_total_drug_cost;
string(10) yeartodate_retail_price;
string(10) monthtodate_cob_payer_amount;
string(10) yeartodate_cob_payer_amount;
string(10) monthtodate_others_paid_that_counted_towards_troop;
string(10) yeartodate_others_paid_that_counted_towards_troop;
string(10) gap_discount_amount;
string(2) formulary_change_code_id;
string(12) rxnumber;
string(8) formulary_change_effective_date;
string("\\n") filler;

end CLAIM_RECORD;
else if(record_identifier == "BD")
record
string(9) carrier_id;
string(15) account_id;
string(15) group_id;
string(18) member_id;
string(15) rxclaim_number;
string(3) sequence_number;
string(1) claim_status;
string(15) provider_id;
string(60) pharmacy_name_;
string(1) out_of_network_pharmacy_indicator;
string(55) pharmacy_address_1;
string(55) pharmacy_address_2;
string(30) pharmacy_city;
string(2) pharmacy_state_abbreviation;
string(9) rx_number_filler;
string(2) refill_number;
string(8) fill_date;
string(8) submit_date;
string(30) product_name___dosage;
string(12) dispensed_quantity;
string(3) days_supply;
string(10) patient_pay_before_lics;
string(4) drug_tier;
string(10) retail_price__uc_w_;
string(10) total_drug_cost_;
string(1) drug_coverage_status_code;
string(1) eap_drug_flag;
string(10) amount_paid_by_plan;
string(10) amount_paid_by_you;
string(10) plro__cob_payer_amount_;
string(10) others_paid;
string(10) lics_adjustment_amount;
string(10) preferred_mail_service_savings;
string(30) lower_cost_drug_name_1;
string(30) lower_cost_drug_name_2;
string(30) lower_cost_drug_name_3;
string(30) lower_cost_drug_range_of_savings;
string(10) other_troop;
string(10) monthtodate_amount_paid_by_you;
string(10) monthtodate_amount_paid_by_others;
string(10) monthtodate_plan_paid;
string(10) monthtodate_total_drug_cost;
string(10) monthtodate_retail_price;
string(10) yeartodate_amount_paid_by_you;
string(10) yeartodate_amount_paid_by_others;
string(10) yeartodate_plan_paid;
string(10) yeartodate_total_drug_cost;
string(10) yeartodate_retail_price;
string(10) monthtodate_cob_payer_amount;
string(10) yeartodate_cob_payer_amount;
string(10) monthtodate_others_paid_that_counted_towards_troop;
string(10) yeartodate_others_paid_that_counted_towards_troop;
string(10) gap_discount_amount;
string(2) formulary_change_code_id;
string(12) rxnumber;
string(8) formulary_change_effective_date;
string("\\n") filler;

end BONUS_RECORD;
else if(record_identifier == "FD")
record
string(9) carrier_id;
string(15) account_id;
string(15) group_id;
string(18) member_id;
string(10) type_of_change;
string(60) affected_drug;
string(50) description_of_change;
string(50) reason_for_change;
string(60) alternative_drug;
string(50) alternative_drug_copayment___coinsurance;
string(8) effective_date;
string(30) variable_text_drug_name_in_the_event_of_change_to_preferred_or_tiered_cost_sharing_stauts_;
string(1) data_trigger_to_identify_negative_change_identifier_asterisk_at_print_vendor;
string(1) data_trigger_to_identify_prior_authorization_statement_per_cms_model;
string(1) data_trigger_to_identify_quantity_limits_statement_and_variable_drug_name_per_cms_model;
string(1) data_trigger_to_identify_step_therapy_statement_per_cms_model;
string(2) formulary_change_code_id;
string(1) affected_drug_current_tier;
string(1) affected_drug_new_tier;
string(60) quantity_limits_description;
string(0) manufacturer_name;
string(6) filler;
string("\\n") newline;
end FORMULARY_RECORD;
else if(record_identifier == "TD")
record
string(9) member_record_count;
string(9) plan_detail_record_count;
string(9) claim_detail_record_count;
string(9) bonus_detail_record_count;
string(9) formulary_record_count;
string("\\n") newline;
end TRAILER;
end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE|3|2|$|@{0|}}
}}@0|@340000|180000|0|0|0|0|79|IFIL : SRC FILE|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|9|0|17|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|10|0|20|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|11|0|22|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|12|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|record
string(2) record_identifier;
string(9) member_record_count;
string(9) plan_detail_record_count;
string(9) claim_detail_record_count;
string(9) bonus_detail_record_count;
string(9) formulary_record_count;
string("\\n") newline = "";
end ;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@1|@915000|179500|0|0|0|0|78|OFIL : SRC FILE|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|13|0|27|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|14|0|30|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|15|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|16|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.record_identifier :: "TD";
  out.member_record_count :: string_pad(string_lrtrim((decimal(9))count(in.record_identifier,in.record_identifier == "MD")),9);
  out.plan_detail_record_count ::  string_pad(string_lrtrim((decimal(9))count(in.record_identifier,in.record_identifier == "PD")),9);
  out.claim_detail_record_count ::  string_pad(string_lrtrim((decimal(9))count(in.record_identifier,in.record_identifier == "CD")),9);
  out.bonus_detail_record_count ::  string_pad(string_lrtrim((decimal(9))count(in.record_identifier,in.record_identifier == "BD")),9);
  out.formulary_record_count ::  string_pad(string_lrtrim((decimal(9))count(in.record_identifier,in.record_identifier == "FD")),9);
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|577000|145000|0|0|0|0|82|RLP :  Create Trailer Records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|17|0|37|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|18|0|40|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|19|0|42|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|20|0|44|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|21|0|46|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|22|0|49|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define rollup groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|output_without_input|Never|15|1|FKl|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|output_without_input.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation7|optional out::output_without_input()|3|2|H$|Output when there are no input records|{0|}}
{30001002|XXparameter|operation7.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|rollup|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 2.11.7.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|rollup|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-rollup|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); out=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|23|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|24|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|25|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|26|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|27|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|28|0|70|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|801000|190000|0|0|0|0|65|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|29|0|72|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|30|0|75|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|31|0|78|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|32|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|33|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|34|0|89|0|{@{}@{1|1312787|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010601001|XXGgraph_vertex_vertex|7|0|14|0|{IFIL_SRC_FILE|}1|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{0|read|}8|9|}
{2010213001|XXGoport_dst_flow|9|0|18|0|{0|}9|5|}
{2010007001|XXGobject_proto_object|10|0|19|0|{}8|10|}
{2010212001|XXGvertex_oport_oport|11|0|21|0|{0|read|}10|11|}
{2010006001|XXGobject_psameas_object|12|0|23|0|{metadata|read_metadata|1|0|}11|10|}
{2010601001|XXGgraph_vertex_vertex|13|0|24|0|{OFIL_SRC_FILE|}1|12|}
{2010211001|XXGvertex_iport_iport|14|0|26|0|{0|write|}12|13|}
{2010214001|XXGiport_src_flow|15|0|28|0|{0|}13|6|}
{2010007001|XXGobject_proto_object|16|0|29|0|{}12|14|}
{2010211001|XXGvertex_iport_iport|17|0|31|0|{0|write|}14|15|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{metadata|write_metadata|1|0|}15|14|}
{2010601001|XXGgraph_vertex_vertex|19|0|34|0|{RLP_Create_Trailer_Records|}1|16|}
{2010212001|XXGvertex_oport_oport|20|0|36|0|{0|out|}16|17|}
{2010213001|XXGoport_dst_flow|21|0|38|0|{0|}17|7|}
{2010212001|XXGvertex_oport_oport|22|0|39|0|{1|reject|}16|18|}
{2010212001|XXGvertex_oport_oport|23|0|41|0|{2|error|}16|19|}
{2010212001|XXGvertex_oport_oport|24|0|43|0|{3|log|}16|20|}
{2010211001|XXGvertex_iport_iport|25|0|45|0|{0|in|}16|21|}
{2010214001|XXGiport_src_flow|26|0|47|0|{0|}21|5|}
{2010007001|XXGobject_proto_object|27|0|48|0|{}16|22|}
{2010212001|XXGvertex_oport_oport|28|0|50|0|{0|out|}22|23|}
{2010006001|XXGobject_psameas_object|29|0|52|0|{metadata|out_metadata|1|0|}23|22|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{1|reject|}22|24|}
{2010006001|XXGobject_psameas_object|31|0|55|0|{metadata|reject_metadata|1|0|}24|22|}
{2010212001|XXGvertex_oport_oport|32|0|56|0|{2|error|}22|25|}
{2010006001|XXGobject_psameas_object|33|0|58|0|{metadata|error_metadata|1|0|}25|22|}
{2010212001|XXGvertex_oport_oport|34|0|59|0|{3|log|}22|26|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{metadata|log_metadata|1|0|}26|22|}
{2010211001|XXGvertex_iport_iport|36|0|62|0|{0|in|}22|27|}
{2010006001|XXGobject_psameas_object|37|0|64|0|{metadata|in_metadata|1|0|}27|22|}
{2010006001|XXGobject_psameas_object|38|0|65|0|{Layout|Layout|0|0|}16|12|}
{2010006001|XXGobject_psameas_object|39|0|66|0|{in_metadata|read_metadata|0|0|}16|8|}
{2010006001|XXGobject_psameas_object|40|0|67|0|{out_metadata|write_metadata|0|0|}16|12|}
{2010006001|XXGobject_psameas_object|41|0|68|0|{reject_metadata|read_metadata|0|0|}16|8|}
{2010601001|XXGgraph_vertex_vertex|42|0|69|0|{Replicate|}1|28|}
{2010212001|XXGvertex_oport_oport|43|0|71|0|{0|out|}28|29|}
{2010213001|XXGoport_dst_flow|44|0|73|0|{0|}29|6|}
{2010211001|XXGvertex_iport_iport|45|0|74|0|{0|in|}28|30|}
{2010214001|XXGiport_src_flow|46|0|76|0|{0|}30|7|}
{2010007001|XXGobject_proto_object|47|0|77|0|{}28|31|}
{2010212001|XXGvertex_oport_oport|48|0|79|0|{0|out|}31|32|}
{2010006001|XXGobject_psameas_object|49|0|81|0|{metadata|out_metadata|1|0|}32|31|}
{2010211001|XXGvertex_iport_iport|50|0|82|0|{0|in|}31|33|}
{2010006001|XXGobject_psameas_object|51|0|84|0|{metadata|in_metadata|1|0|}33|31|}
{2010006001|XXGobject_psameas_object|52|0|85|0|{Layout|Layout|0|0|}28|12|}
{2010006001|XXGobject_psameas_object|53|0|86|0|{in_metadata|write_metadata|0|0|}28|12|}
{2010006001|XXGobject_psameas_object|54|0|87|0|{out_metadata|write_metadata|0|0|}28|12|}
{2010109001|XXGobject_property_value|55|0|88|0|{0|TrackingThumbprint|72|}1|34|}
