@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|138|rel_count|280|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RUN_ID|0|3|9|FK|@{0|}}
{30001002|XXparameter|EVENT_INS_FILE_F_CLM|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction.f_claim_transaction.insert.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|EVENT_INS_FILE_F_CLM_P90|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction.f_claim_transaction.update.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|EVENT_UPDT_FILE_F_CLM|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.insert.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|EVENT_UPDT_FILE_F_CLM_P90|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.update.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|F_CLM_INPUT_DML|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|F_CLM_INPUT_90_DML|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|ACTN_FLAG_F_CLM_DML|$[ re_replace(re_replace(read_file(F_CLM_INPUT_DML)," +"," "),"string\\\\(1\\\\) newline.*end",'string(1) actn_flag;\\n &')]|3|9|RFK|@{0|}}
{30001002|XXparameter|ACTN_FLAG_F_CLM_90_DML|$[ re_replace(re_replace(read_file(F_CLM_INPUT_90_DML)," +"," "),"string\\\\(1\\\\) newline.*end",'string(1) actn_flag;\\n &')]|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|EVENT_INS_FILE_F_CLM_P90_NEW|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.insert_new.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|EVENT_UPDT_FILE_F_CLM_P90_NEW|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.update_new.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
}}@0|@0|0|0|0|0|0|0|Join_f_claim_90_events_process|ssunkar2|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1505000|577000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'Join_f_claim_90_events_process' Execution Status Report

Job completed successfully at Monday, September 25, 2017 04:34:58
Run performed by user ssunkar2
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV_OP||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}692|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}712|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}705|17|}}
{2010243001|XXGwatcher|8|0|15|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}690|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}707|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}696|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}700|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}701|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}708|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}703|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}710|2065|}}
{2010501005|XXGpvertex|17|0|33|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|in0_metadata|$ACTN_FLAG_F_CLM_DML|3|9||@{0|}}
{30001002|XXparameter|in1_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in2_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|join_type|Explicit|3|1|l|@{0|}}
{30001002|XXparameter|record_match_required2|False|3|1|l|@{0|}}
{30001002|XXparameter|record_match_required1|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1, in2) =
begin
  out.*::in0.*; /*CHAR(1)*/
  out.day_90_prog_type :: first_defined(first_defined(in1.day_90_prog_type,in2.day_90_prog_type),"N");
  out.day_90_retail_prog_ind :: first_defined(first_defined(in1.day_90_retail_prog_ind,in2.day_90_retail_prog_ind),"N");
  out.day_90_retail_grace_fill :: first_defined(first_defined(in1.day_90_retail_grace_fill,in2.day_90_retail_grace_fill),"N");
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|771000|160000|0|0|0|0|704|Join|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|18|0|35|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|19|0|38|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|21|0|42|0|{@{}@0|0|0|0|unused2|0.0|count|unused|2|1168|0|}}
{2010203004|XXGoport|22|0|44|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|23|0|46|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|24|0|48|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|25|0|50|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|26|0|52|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|27|0|54|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|28|0|56|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|29|0|58|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|30|0|62|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010202004|XXGiport|31|0|65|0|{@{}@0|0|0|0|in2|0.0|count|in|2|1808|0|}}
{2010501005|XXGpvertex|32|0|68|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required2|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required2|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup2|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select2||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not2|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional2|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional2|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional2|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional2|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword2|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword2|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword2|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword2|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key2||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|record_match_required2.display_name|record-match-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required2.display_name|record-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.display_name|record-match-required-not2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional2.display_name|record-required-positional2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional2.display_name|matchoptional-positional2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional2.display_name|dedup-positional2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional2.display_name|select-positional2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword2.display_name|record-required-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.display_name|matchoptional-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword2.display_name|dedup-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword2.display_name|select-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key2.display_name|override-key2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|33|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|34|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|35|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|36|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused2|0.0|count|unused|2|1168|0|}}
{2010203004|XXGoport|37|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|38|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|39|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|40|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|42|0|97|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|43|0|100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|45|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010202004|XXGiport|46|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|record_match_required2||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required2.display_name|record-match-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required2.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required2||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required2.display_name|record-required2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required2.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup2||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup2.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select2||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select2.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not2.display_name|record-match-required-not2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not2.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional2||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional2.display_name|record-required-positional2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional2.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional2||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional2.display_name|matchoptional-positional2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional2.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional2||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional2.display_name|dedup-positional2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional2||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional2.display_name|select-positional2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional2.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword2||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword2.display_name|record-required-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword2.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword2||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword2.display_name|matchoptional-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword2.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword2||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword2.display_name|dedup-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword2||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword2.display_name|select-keyword2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword2.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key2||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key2.display_name|override-key2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key2.condition|version 2.1:|3|15|P?|@{0|}}
}}@0|0|0|0|in2|0.0|count|in|2|1808|0|}}
{2010503005|XXGfvertex|47|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_INS_FILE_F_CLM_P90_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_INS_FILE_F_CLM_P90_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
}}@0|@1282000|95000|0|0|0|0|711|f_claim_90_ins|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|48|0|159|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|49|0|162|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|50|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|51|0|173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.actn_flag:: "I";
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$ACTN_FLAG_F_CLM_DML|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|256000|54500|0|0|0|0|633|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|52|0|175|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|53|0|178|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|54|0|180|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|55|0|182|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|184|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|187|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
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
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|58|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|59|0|193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|61|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|63|0|206|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_INS_FILE_F_CLM", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_INS_FILE_F_CLM|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0) claim_nbr /*BIGINT NOT NULL*/;
  decimal("\\x01",0) claim_seq_nbr /*INTEGER NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0) carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) sbm_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pbr_spclty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pcp_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) custom_client_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gender_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) age_band_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_state_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) relationship_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) fmly_type_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_pmt_cntr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mail_srvc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_afflt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cost_basis_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cost_type_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cob_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) location_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) client_benefit_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) clt_prc_typ_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) daw_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dsg_frm_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pln_drg_stat_sk /*BIGINT NOT NULL*/;
  decimal("\\x01",0) rej_cd1_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd2_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd3_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) orig_carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40) orig_account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) orig_member_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) claim_seq_nbr_src = NULL("") /*INTEGER*/;
  decimal("\\x01",0) claim_cntr = NULL("") /*SMALLINT*/;
  date("YYYYMMDD")("\\x01") sbm_dt = NULL("") /*DATE*/;
  decimal("\\x01",0) sbm_mn_id = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) mail_srvc_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) mbr_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) refill_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) daw_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) days_sply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_qty = NULL("") /*DECIMAL(11,3)*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved) awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) wac_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) geap_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_cost_type_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) grp_pln_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_usual_customary_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) family_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) individual_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ded_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ben_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) rebate_claims_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11) prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0) refill_max = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) bin_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) processor_cntrl_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) grp_nbr_submd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) brnd_trade_nm_flag = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=15, sign_reserved) prc_qty = NULL("") /*DECIMAL(13,3)*/;
  decimal("\\x01",0) gen_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) formulary_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) tier_level = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) grp_clt_ben_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cust_loc = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) pbr_id_qlfr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) dx_cd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) dx_cd_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3) cms_pbp_id = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) cms_contract_id = NULL("") /*VARCHAR(5)*/;
  decimal("\\x01",0) rej_cnt = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) rsp_msg_1 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) rsp_msg_2 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) rsp_msg_3 = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0) adj_rxcount_stnd_days_sply = NULL("") /*INTEGER*/;
  decimal("\\x01",0) adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_acct_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) ben_ded_accum_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0) begin_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) end_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rx_origin_cd_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) anda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) tot_covered_drg_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) tot_troop_amt = NULL("") /*DECIMAL(9,2)*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01") sbm_tm = NULL("") /*TIME(6)*/;
  decimal("\\x01",0) ajc_code_key = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) inn_max_out_of_pocket_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) phr_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) clt_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) payee_id = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01",0) contract_pbp_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved) plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved) plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved) supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved) min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0) compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01",0) patient_age = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) zero_balance_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) nat_drg_cd_mfr_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) subm_clfctn_cd = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0) mbr_carrier_uid = NULL("") /*BIGINT*/;
  decimal("\\x01",0) residence_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) phr_rate = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) clt_rate = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) clawback_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) super_ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved) tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved) clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved) app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) awp_unit_cost_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) awp_extended_cost_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) clt_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) clt_formulary_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) formulary_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) risk_pool_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) risk_pool_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) prior_auth_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prior_auth_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) rxsol_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) rxsol_formulary_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) claim_origination_code_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_origin_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) coverage_lvl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) reversal_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) recent_clm_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ntpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) origin_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) reported_gap_discount_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) clt_id = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0) cag_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_eligty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_eligty_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ln_of_buss = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_dt_of_brth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) phr_svc_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) ben_max_accum_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) ben_ded_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) care_ntwrk_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) care_ntwrk_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0) clt_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) clt_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) clt_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) clt_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) clt_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) clt_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) clt_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) clt_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) clt_prc_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cntngnt_thrpc_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) cntngnt_thrpy_sched = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) dur_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=18) dur_key = NULL("") /*VARCHAR(18)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) elig_clfctn_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_acc_benefit_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) frm_mgmt_svcs_tier = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) formulary_prtcol_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4) group_sic = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) hsa_extrct_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_benefit_max_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) accum_oop = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) maint_gpi_list = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) med_ffp_ind_ms_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) med_ffp_ind_px_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) med_ffp_ind_rm_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) ndc_list_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) out_of_perd_rvrsl_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) out_of_pocket_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0) phr_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) phr_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) phr_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) phr_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) phr_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_ntwrk_gpi_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_ntwrk_ndc_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) phr_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) phr_prc_tbl_sched = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) pln_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) pln_fnl_prc_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) pref_prod_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prc_bsis_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prod_remb_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) prv_lock_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prv_lock_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) rgnl_dsstr_ovrd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) trn_ben_ovrd_sched = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0) pbr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=16) submd_rph_id = NULL("") /*VARCHAR(16)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) submd_rph_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) adj_medspn_prod_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmpd_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) fda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) medspn_carr_prod_ovrd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) prod_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) tran_add_user_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) adjtd_claim_stat = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") chg_dttm_tcd = NULL("") /*TIMESTAMP(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) chg_usr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) claim_ref_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_resp_stat_cd = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01") submd_claim_dttm = NULL("") /*TIMESTAMP(6)*/;
  date("YYYYMMDD")("\\x01") injury_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") orig_pmt_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") sub_reversal_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) delay_rsn_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) dispng_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) dmr_usr_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) extr_txn_cntl_nbr = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25) incdnt_id = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01",0) manl_claim_trk_dt_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) manl_claim_trk_nbr = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) agcy_nbr = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) medcd_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) medcd_ind = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) sbrogtn_tcn = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) pmt_txn_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) pl_of_svc_submd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) pror_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) rx_nbr_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) srvc_lvl_of_effrt = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) srvc_lvl_typ = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) subm_clfctn_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) subm_clfctn_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) txn_cd_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) u_c_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) vers_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_defd_fld1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_defd_fld2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) clt_defd_fld3 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) sxc_defd_fld1 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) sxc_defd_fld2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) sxc_defd_fld3 = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01",0) rdc_ingrd_cost_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01",0) zro_bal_claims_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) estd_gen_sav = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) basis_of_reim_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_atr_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_incentive_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_other_pmt_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_psc_brnp_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) client_pricing_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_pct_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_flat_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) spclty_phr_corp_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) spclty_phr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) mail_ordr_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) retl_90_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) mail_ordr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_amt_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_copay_flat_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_copay_pct_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) phr_prc_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phr_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) mail_ordr_cntr = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) retl_90_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) post_adjud_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) post_adjud_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) subm_yr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) care_fac_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) subm_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) subm_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01",0) filled_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8) filled_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rvrsl_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_remn_ben = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_remn_ded = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_ingrd_cost_cntrctd_remb = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_ppay_amt_psc_brnd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) subm_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) subm_mcd_pd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) subm_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) subm_oth_covrg_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) subm_oth_payr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0) cmpo_last_seq = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9) corp_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9) rptg_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  decimal("\\x01",0) brnd_bsis_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) rebill_cost_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) rebill_cost_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) rebill_cost_typ_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_dispng_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14) rebill_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  decimal("\\x01",0) rebill_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) rebill_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) rebill_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_incent_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_ingrd_cost_pd = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13) rebill_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0) rebill_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) rebill_prc_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_sls_tax_pd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rebill_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) msg_cd_1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) msg_cd_2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) msg_cd_3 = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) rebill_drug_cost_percent = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) acct_benefit_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01") birth_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_atr_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cal_cost_src_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_cov_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_dsp_fee_c_r_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_exc_benefit_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_flat_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_flat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_ingred_cost_con_reimb_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_per_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_plan_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_perc_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_tot_other_amt = NULL("") /*DECIMAL(9,2)*/;
  date("YYYYMMDD")("\\x01") chg_date = NULL("") /*DATE*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01") chg_time = NULL("") /*TIME(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3) cfi_csg_client_seg_cd = NULL("") /*VARCHAR(3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) client_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) client_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) client_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) client_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drug_conflict_1_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drug_conflict_2_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drug_conflict_3_cd = NULL("") /*VARCHAR(2)*/;
  date("YYYYMMDD")("\\x01") prev_fill_1_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") prev_fill_2_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") prev_fill_3_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) fam_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) ind_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) life_benefit_max_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) life_benefit_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) life_benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) oop_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) oop_sched_used_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25) ptnt_first_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25) ptnt_last_nm = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) flat_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) price_tbl_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) atr_priv_ntw_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) atr_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) atr_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) pln_formulary = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) final_price_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) prior_auth_used_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01") prior_auth_from_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") prior_auth_thru_dt = NULL("") /*DATE*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) prev_fill_1_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) prev_fill_2_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) prev_fill_3_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_atr_priv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_atr_ppay_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) reversal_dur_conflict_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) reversal_dur_intrv_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) reversal_dur_outcm_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) qual_serv_prov_id = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) spend_acct_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) mbr_pln = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cob_extract_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) sbm_unit_dose_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) tcd_sbm_perct_salestax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) prim_pbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prim_pbr_mid_init = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25) prim_pbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) mbr_prim_pbr_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3) prim_pbr_state = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) sbm_clarfctn_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cal_admin_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_cvg_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_proc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_dispensing_fee_cont = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_atr_sales_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) pst_cost_source_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_other_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_prvd_ntwk_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_psc_npfm_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_ingred_ctd_reim_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) pst_psc_brand_npfm_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_ctd_reim_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rsp_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) benchmrk_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0) prorated_days_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=16, sign_reserved) metric_nbr_qty = NULL("") /*DECIMAL(14,3)*/;
  decimal("\\x01",0) rej_cd4_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd5_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd6_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd7_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd8_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd9_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) rej_cd10_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_coverage_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cpp_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prior_pbm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) non_rxclaim_adj_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@0|@45000|65000|0|0|0|0|693|f_claim_insert|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|64|0|208|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|65|0|211|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|66|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|67|0|217|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.actn_flag :: "U";
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$ACTN_FLAG_F_CLM_DML|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|250000|160000|0|0|0|0|655|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|219|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|69|0|222|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|70|0|224|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|71|0|226|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|228|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|231|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
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
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|74|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|75|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|76|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|77|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|79|0|250|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_UPDT_FILE_F_CLM", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_UPDT_FILE_F_CLM|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
}}@0|@46000|169500|0|0|0|0|691|f_claim_update|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010203004|XXGoport|80|0|252|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|81|0|255|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|82|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|83|0|261|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.actn_flag :: "I";
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|select|day_90_prog_type!="N" and day_90_retail_prog_ind!="N" and day_90_retail_grace_fill!="N"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|254000|280000|0|0|0|0|709|Reformat-2|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|263|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|85|0|266|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|86|0|268|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|87|0|270|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|88|0|272|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|89|0|275|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
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
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|90|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|91|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|92|0|284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|93|0|287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|95|0|294|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("EVENT_INS_FILE_F_CLM_P90", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|EVENT_INS_FILE_F_CLM_P90|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
}}@0|@56000|289500|0|0|0|0|694|f_claim_90_insert|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|96|0|296|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|97|0|299|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|98|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|99|0|305|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.actn_flag :: "U";
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|select|day_90_prog_type!="N" and day_90_retail_prog_ind!="N" and day_90_retail_grace_fill!="N"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|254000|395000|0|0|0|0|697|Reformat-4|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|307|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|101|0|310|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|102|0|312|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|103|0|314|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|316|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|319|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
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
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|107|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|108|0|328|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|109|0|331|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|111|0|338|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_UPDT_FILE_F_CLM_P90", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_UPDT_FILE_F_CLM_P90|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
}}@0|@56000|399500|0|0|0|0|695|f_claim_90_update|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010203004|XXGoport|112|0|340|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|113|0|343|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|114|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|115|0|349|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|$ACTN_FLAG_F_CLM_90_DML|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out1_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform1|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|output_indexes|output_indices_out :: output_indexes(in) =
begin
  output_indices_out :: if(in.actn_flag == "I" ) [vector 0 ] else [vector 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|966000|180000|0|0|0|0|706|Reformat-5|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|116|0|351|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|117|0|354|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|118|0|357|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|119|0|359|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|120|0|361|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|121|0|363|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|122|0|365|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|123|0|367|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|124|0|370|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
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
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|125|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|126|0|376|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|127|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|128|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|129|0|386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|130|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|131|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|132|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|133|0|403|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_UPDT_FILE_F_CLM_P90_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$EVENT_UPDT_FILE_F_CLM_P90_NEW|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
}}@0|@1284000|310500|0|0|0|0|713|f_claim_90_upd|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|134|0|405|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|135|0|408|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|136|0|410|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010110002|XXGconstant|137|0|416|0|{@{}@{1|3281792|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_13|}1|7|}
{2010244001|XXGflow_watcher_watcher|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_6|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_7|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_8|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_9|}1|16|}
{2010601001|XXGgraph_vertex_vertex|16|0|32|0|{Join|}1|17|}
{2010212001|XXGvertex_oport_oport|17|0|34|0|{0|out|}17|18|}
{2010213001|XXGoport_dst_flow|18|0|36|0|{0|}18|7|}
{2010212001|XXGvertex_oport_oport|19|0|37|0|{1|unused0|}17|19|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{2|unused1|}17|20|}
{2010212001|XXGvertex_oport_oport|21|0|41|0|{3|unused2|}17|21|}
{2010212001|XXGvertex_oport_oport|22|0|43|0|{4|reject0|}17|22|}
{2010212001|XXGvertex_oport_oport|23|0|45|0|{5|reject1|}17|23|}
{2010212001|XXGvertex_oport_oport|24|0|47|0|{6|reject2|}17|24|}
{2010212001|XXGvertex_oport_oport|25|0|49|0|{7|error0|}17|25|}
{2010212001|XXGvertex_oport_oport|26|0|51|0|{8|error1|}17|26|}
{2010212001|XXGvertex_oport_oport|27|0|53|0|{9|error2|}17|27|}
{2010212001|XXGvertex_oport_oport|28|0|55|0|{10|log|}17|28|}
{2010211001|XXGvertex_iport_iport|29|0|57|0|{0|in0|}17|29|}
{2010214001|XXGiport_src_flow|30|0|59|0|{0|}29|12|}
{2010214001|XXGiport_src_flow|31|0|60|0|{1|}29|13|}
{2010211001|XXGvertex_iport_iport|32|0|61|0|{1|in1|}17|30|}
{2010214001|XXGiport_src_flow|33|0|63|0|{0|}30|14|}
{2010211001|XXGvertex_iport_iport|34|0|64|0|{2|in2|}17|31|}
{2010214001|XXGiport_src_flow|35|0|66|0|{0|}31|15|}
{2010007001|XXGobject_proto_object|36|0|67|0|{}17|32|}
{2010212001|XXGvertex_oport_oport|37|0|69|0|{0|out|}32|33|}
{2010006001|XXGobject_psameas_object|38|0|71|0|{metadata|out_metadata|1|0|}33|32|}
{2010212001|XXGvertex_oport_oport|39|0|72|0|{1|unused0|}32|34|}
{2010006001|XXGobject_psameas_object|40|0|74|0|{metadata|unused0_metadata|1|0|}34|32|}
{2010212001|XXGvertex_oport_oport|41|0|75|0|{2|unused1|}32|35|}
{2010006001|XXGobject_psameas_object|42|0|77|0|{metadata|unused1_metadata|1|0|}35|32|}
{2010212001|XXGvertex_oport_oport|43|0|78|0|{3|unused2|}32|36|}
{2010006001|XXGobject_psameas_object|44|0|80|0|{metadata|unused2_metadata|1|0|}36|32|}
{2010212001|XXGvertex_oport_oport|45|0|81|0|{4|reject0|}32|37|}
{2010006001|XXGobject_psameas_object|46|0|83|0|{metadata|reject0_metadata|1|0|}37|32|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{5|reject1|}32|38|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{metadata|reject1_metadata|1|0|}38|32|}
{2010212001|XXGvertex_oport_oport|49|0|87|0|{6|reject2|}32|39|}
{2010006001|XXGobject_psameas_object|50|0|89|0|{metadata|reject2_metadata|1|0|}39|32|}
{2010212001|XXGvertex_oport_oport|51|0|90|0|{7|error0|}32|40|}
{2010006001|XXGobject_psameas_object|52|0|92|0|{metadata|error0_metadata|1|0|}40|32|}
{2010212001|XXGvertex_oport_oport|53|0|93|0|{8|error1|}32|41|}
{2010006001|XXGobject_psameas_object|54|0|95|0|{metadata|error1_metadata|1|0|}41|32|}
{2010212001|XXGvertex_oport_oport|55|0|96|0|{9|error2|}32|42|}
{2010006001|XXGobject_psameas_object|56|0|98|0|{metadata|error2_metadata|1|0|}42|32|}
{2010212001|XXGvertex_oport_oport|57|0|99|0|{10|log|}32|43|}
{2010006001|XXGobject_psameas_object|58|0|101|0|{metadata|log_metadata|1|0|}43|32|}
{2010211001|XXGvertex_iport_iport|59|0|102|0|{0|in0|}32|44|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|61|0|105|0|{dedup0|dedup0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|62|0|106|0|{dedup_keyword0|dedup_keyword0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|63|0|107|0|{dedup_positional0|dedup_positional0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|64|0|108|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|65|0|109|0|{matchoptional_positional0|matchoptional_positional0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|66|0|110|0|{metadata|in0_metadata|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|67|0|111|0|{override_key0|override_key0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|68|0|112|0|{record_match_required0|record_match_required0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|69|0|113|0|{record_match_required_not0|record_match_required_not0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|70|0|114|0|{record_required0|record_required0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|71|0|115|0|{record_required_keyword0|record_required_keyword0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|72|0|116|0|{record_required_positional0|record_required_positional0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|73|0|117|0|{select0|select0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|74|0|118|0|{select_keyword0|select_keyword0|1|0|}44|32|}
{2010006001|XXGobject_psameas_object|75|0|119|0|{select_positional0|select_positional0|1|0|}44|32|}
{2010211001|XXGvertex_iport_iport|76|0|120|0|{1|in1|}32|45|}
{2010006001|XXGobject_psameas_object|77|0|122|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|78|0|123|0|{dedup1|dedup1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|79|0|124|0|{dedup_keyword1|dedup_keyword1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|80|0|125|0|{dedup_positional1|dedup_positional1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|81|0|126|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|82|0|127|0|{matchoptional_positional1|matchoptional_positional1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|83|0|128|0|{metadata|in1_metadata|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|84|0|129|0|{override_key1|override_key1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|85|0|130|0|{record_match_required1|record_match_required1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|86|0|131|0|{record_match_required_not1|record_match_required_not1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|87|0|132|0|{record_required1|record_required1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|88|0|133|0|{record_required_keyword1|record_required_keyword1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|89|0|134|0|{record_required_positional1|record_required_positional1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|90|0|135|0|{select1|select1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|91|0|136|0|{select_keyword1|select_keyword1|1|0|}45|32|}
{2010006001|XXGobject_psameas_object|92|0|137|0|{select_positional1|select_positional1|1|0|}45|32|}
{2010211001|XXGvertex_iport_iport|93|0|138|0|{2|in2|}32|46|}
{2010006001|XXGobject_psameas_object|94|0|140|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|95|0|141|0|{dedup2|dedup2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|96|0|142|0|{dedup_keyword2|dedup_keyword2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|97|0|143|0|{dedup_positional2|dedup_positional2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|98|0|144|0|{matchoptional_keyword2|matchoptional_keyword2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|99|0|145|0|{matchoptional_positional2|matchoptional_positional2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|100|0|146|0|{metadata|in2_metadata|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|101|0|147|0|{override_key2|override_key2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|102|0|148|0|{record_match_required2|record_match_required2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|103|0|149|0|{record_match_required_not2|record_match_required_not2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|104|0|150|0|{record_required2|record_required2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|105|0|151|0|{record_required_keyword2|record_required_keyword2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|106|0|152|0|{record_required_positional2|record_required_positional2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|107|0|153|0|{select2|select2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|108|0|154|0|{select_keyword2|select_keyword2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|109|0|155|0|{select_positional2|select_positional2|1|0|}46|32|}
{2010006001|XXGobject_psameas_object|110|0|156|0|{Layout|Layout|0|0|}17|47|}
{2010211001|XXGvertex_iport_iport|111|0|158|0|{0|write|}47|48|}
{2010214001|XXGiport_src_flow|112|0|160|0|{0|}48|16|}
{2010007001|XXGobject_proto_object|113|0|161|0|{}47|49|}
{2010211001|XXGvertex_iport_iport|114|0|163|0|{0|write|}49|50|}
{2010006001|XXGobject_psameas_object|115|0|165|0|{metadata|write_metadata|1|0|}50|49|}
{2010006001|XXGobject_psameas_object|116|0|166|0|{reject0_metadata|in0_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|117|0|167|0|{reject1_metadata|in1_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|118|0|168|0|{reject2_metadata|in2_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|119|0|169|0|{unused0_metadata|in0_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|120|0|170|0|{unused1_metadata|in1_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|121|0|171|0|{unused2_metadata|in2_metadata|0|0|}17|17|}
{2010601001|XXGgraph_vertex_vertex|122|0|172|0|{Reformat|}1|51|}
{2010212001|XXGvertex_oport_oport|123|0|174|0|{0|out0|}51|52|}
{2010213001|XXGoport_dst_flow|124|0|176|0|{0|}52|12|}
{2010212001|XXGvertex_oport_oport|125|0|177|0|{1|reject0|}51|53|}
{2010212001|XXGvertex_oport_oport|126|0|179|0|{2|error0|}51|54|}
{2010212001|XXGvertex_oport_oport|127|0|181|0|{3|log|}51|55|}
{2010211001|XXGvertex_iport_iport|128|0|183|0|{0|in|}51|56|}
{2010214001|XXGiport_src_flow|129|0|185|0|{0|}56|5|}
{2010007001|XXGobject_proto_object|130|0|186|0|{}51|57|}
{2010212001|XXGvertex_oport_oport|131|0|188|0|{0|out0|}57|58|}
{2010006001|XXGobject_psameas_object|132|0|190|0|{metadata|out0_metadata|1|0|}58|57|}
{2010006001|XXGobject_psameas_object|133|0|191|0|{transform0|transform0|1|0|}58|57|}
{2010212001|XXGvertex_oport_oport|134|0|192|0|{1|reject0|}57|59|}
{2010006001|XXGobject_psameas_object|135|0|194|0|{metadata|reject0_metadata|1|0|}59|57|}
{2010212001|XXGvertex_oport_oport|136|0|195|0|{2|error0|}57|60|}
{2010006001|XXGobject_psameas_object|137|0|197|0|{metadata|error0_metadata|1|0|}60|57|}
{2010212001|XXGvertex_oport_oport|138|0|198|0|{3|log|}57|61|}
{2010006001|XXGobject_psameas_object|139|0|200|0|{metadata|log_metadata|1|0|}61|57|}
{2010211001|XXGvertex_iport_iport|140|0|201|0|{0|in|}57|62|}
{2010006001|XXGobject_psameas_object|141|0|203|0|{metadata|in_metadata|1|0|}62|57|}
{2010006001|XXGobject_psameas_object|142|0|204|0|{Layout|Layout|0|0|}51|47|}
{2010006001|XXGobject_psameas_object|143|0|205|0|{in_metadata|read_metadata|0|0|}51|63|}
{2010212001|XXGvertex_oport_oport|144|0|207|0|{0|read|}63|64|}
{2010213001|XXGoport_dst_flow|145|0|209|0|{0|}64|5|}
{2010007001|XXGobject_proto_object|146|0|210|0|{}63|65|}
{2010212001|XXGvertex_oport_oport|147|0|212|0|{0|read|}65|66|}
{2010006001|XXGobject_psameas_object|148|0|214|0|{metadata|read_metadata|1|0|}66|65|}
{2010006001|XXGobject_psameas_object|149|0|215|0|{reject0_metadata|read_metadata|0|0|}51|63|}
{2010601001|XXGgraph_vertex_vertex|150|0|216|0|{Reformat_1|}1|67|}
{2010212001|XXGvertex_oport_oport|151|0|218|0|{0|out0|}67|68|}
{2010213001|XXGoport_dst_flow|152|0|220|0|{0|}68|13|}
{2010212001|XXGvertex_oport_oport|153|0|221|0|{1|reject0|}67|69|}
{2010212001|XXGvertex_oport_oport|154|0|223|0|{2|error0|}67|70|}
{2010212001|XXGvertex_oport_oport|155|0|225|0|{3|log|}67|71|}
{2010211001|XXGvertex_iport_iport|156|0|227|0|{0|in|}67|72|}
{2010214001|XXGiport_src_flow|157|0|229|0|{0|}72|9|}
{2010007001|XXGobject_proto_object|158|0|230|0|{}67|73|}
{2010212001|XXGvertex_oport_oport|159|0|232|0|{0|out0|}73|74|}
{2010006001|XXGobject_psameas_object|160|0|234|0|{metadata|out0_metadata|1|0|}74|73|}
{2010006001|XXGobject_psameas_object|161|0|235|0|{transform0|transform0|1|0|}74|73|}
{2010212001|XXGvertex_oport_oport|162|0|236|0|{1|reject0|}73|75|}
{2010006001|XXGobject_psameas_object|163|0|238|0|{metadata|reject0_metadata|1|0|}75|73|}
{2010212001|XXGvertex_oport_oport|164|0|239|0|{2|error0|}73|76|}
{2010006001|XXGobject_psameas_object|165|0|241|0|{metadata|error0_metadata|1|0|}76|73|}
{2010212001|XXGvertex_oport_oport|166|0|242|0|{3|log|}73|77|}
{2010006001|XXGobject_psameas_object|167|0|244|0|{metadata|log_metadata|1|0|}77|73|}
{2010211001|XXGvertex_iport_iport|168|0|245|0|{0|in|}73|78|}
{2010006001|XXGobject_psameas_object|169|0|247|0|{metadata|in_metadata|1|0|}78|73|}
{2010006001|XXGobject_psameas_object|170|0|248|0|{Layout|Layout|0|0|}67|47|}
{2010006001|XXGobject_psameas_object|171|0|249|0|{in_metadata|read_metadata|0|0|}67|79|}
{2010212001|XXGvertex_oport_oport|172|0|251|0|{0|read|}79|80|}
{2010213001|XXGoport_dst_flow|173|0|253|0|{0|}80|9|}
{2010007001|XXGobject_proto_object|174|0|254|0|{}79|81|}
{2010212001|XXGvertex_oport_oport|175|0|256|0|{0|read|}81|82|}
{2010006001|XXGobject_psameas_object|176|0|258|0|{metadata|read_metadata|1|0|}82|81|}
{2010006001|XXGobject_psameas_object|177|0|259|0|{reject0_metadata|read_metadata|0|0|}67|79|}
{2010601001|XXGgraph_vertex_vertex|178|0|260|0|{Reformat_2|}1|83|}
{2010212001|XXGvertex_oport_oport|179|0|262|0|{0|out0|}83|84|}
{2010213001|XXGoport_dst_flow|180|0|264|0|{0|}84|14|}
{2010212001|XXGvertex_oport_oport|181|0|265|0|{1|reject0|}83|85|}
{2010212001|XXGvertex_oport_oport|182|0|267|0|{2|error0|}83|86|}
{2010212001|XXGvertex_oport_oport|183|0|269|0|{3|log|}83|87|}
{2010211001|XXGvertex_iport_iport|184|0|271|0|{0|in|}83|88|}
{2010214001|XXGiport_src_flow|185|0|273|0|{0|}88|10|}
{2010007001|XXGobject_proto_object|186|0|274|0|{}83|89|}
{2010212001|XXGvertex_oport_oport|187|0|276|0|{0|out0|}89|90|}
{2010006001|XXGobject_psameas_object|188|0|278|0|{metadata|out0_metadata|1|0|}90|89|}
{2010006001|XXGobject_psameas_object|189|0|279|0|{transform0|transform0|1|0|}90|89|}
{2010212001|XXGvertex_oport_oport|190|0|280|0|{1|reject0|}89|91|}
{2010006001|XXGobject_psameas_object|191|0|282|0|{metadata|reject0_metadata|1|0|}91|89|}
{2010212001|XXGvertex_oport_oport|192|0|283|0|{2|error0|}89|92|}
{2010006001|XXGobject_psameas_object|193|0|285|0|{metadata|error0_metadata|1|0|}92|89|}
{2010212001|XXGvertex_oport_oport|194|0|286|0|{3|log|}89|93|}
{2010006001|XXGobject_psameas_object|195|0|288|0|{metadata|log_metadata|1|0|}93|89|}
{2010211001|XXGvertex_iport_iport|196|0|289|0|{0|in|}89|94|}
{2010006001|XXGobject_psameas_object|197|0|291|0|{metadata|in_metadata|1|0|}94|89|}
{2010006001|XXGobject_psameas_object|198|0|292|0|{Layout|Layout|0|0|}83|47|}
{2010006001|XXGobject_psameas_object|199|0|293|0|{in_metadata|read_metadata|0|0|}83|95|}
{2010212001|XXGvertex_oport_oport|200|0|295|0|{0|read|}95|96|}
{2010213001|XXGoport_dst_flow|201|0|297|0|{0|}96|10|}
{2010007001|XXGobject_proto_object|202|0|298|0|{}95|97|}
{2010212001|XXGvertex_oport_oport|203|0|300|0|{0|read|}97|98|}
{2010006001|XXGobject_psameas_object|204|0|302|0|{metadata|read_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|205|0|303|0|{reject0_metadata|read_metadata|0|0|}83|95|}
{2010601001|XXGgraph_vertex_vertex|206|0|304|0|{Reformat_4|}1|99|}
{2010212001|XXGvertex_oport_oport|207|0|306|0|{0|out0|}99|100|}
{2010213001|XXGoport_dst_flow|208|0|308|0|{0|}100|15|}
{2010212001|XXGvertex_oport_oport|209|0|309|0|{1|reject0|}99|101|}
{2010212001|XXGvertex_oport_oport|210|0|311|0|{2|error0|}99|102|}
{2010212001|XXGvertex_oport_oport|211|0|313|0|{3|log|}99|103|}
{2010211001|XXGvertex_iport_iport|212|0|315|0|{0|in|}99|104|}
{2010214001|XXGiport_src_flow|213|0|317|0|{0|}104|11|}
{2010007001|XXGobject_proto_object|214|0|318|0|{}99|105|}
{2010212001|XXGvertex_oport_oport|215|0|320|0|{0|out0|}105|106|}
{2010006001|XXGobject_psameas_object|216|0|322|0|{metadata|out0_metadata|1|0|}106|105|}
{2010006001|XXGobject_psameas_object|217|0|323|0|{transform0|transform0|1|0|}106|105|}
{2010212001|XXGvertex_oport_oport|218|0|324|0|{1|reject0|}105|107|}
{2010006001|XXGobject_psameas_object|219|0|326|0|{metadata|reject0_metadata|1|0|}107|105|}
{2010212001|XXGvertex_oport_oport|220|0|327|0|{2|error0|}105|108|}
{2010006001|XXGobject_psameas_object|221|0|329|0|{metadata|error0_metadata|1|0|}108|105|}
{2010212001|XXGvertex_oport_oport|222|0|330|0|{3|log|}105|109|}
{2010006001|XXGobject_psameas_object|223|0|332|0|{metadata|log_metadata|1|0|}109|105|}
{2010211001|XXGvertex_iport_iport|224|0|333|0|{0|in|}105|110|}
{2010006001|XXGobject_psameas_object|225|0|335|0|{metadata|in_metadata|1|0|}110|105|}
{2010006001|XXGobject_psameas_object|226|0|336|0|{Layout|Layout|0|0|}99|47|}
{2010006001|XXGobject_psameas_object|227|0|337|0|{in_metadata|read_metadata|0|0|}99|111|}
{2010212001|XXGvertex_oport_oport|228|0|339|0|{0|read|}111|112|}
{2010213001|XXGoport_dst_flow|229|0|341|0|{0|}112|11|}
{2010007001|XXGobject_proto_object|230|0|342|0|{}111|113|}
{2010212001|XXGvertex_oport_oport|231|0|344|0|{0|read|}113|114|}
{2010006001|XXGobject_psameas_object|232|0|346|0|{metadata|read_metadata|1|0|}114|113|}
{2010006001|XXGobject_psameas_object|233|0|347|0|{reject0_metadata|read_metadata|0|0|}99|111|}
{2010601001|XXGgraph_vertex_vertex|234|0|348|0|{Reformat_5|}1|115|}
{2010212001|XXGvertex_oport_oport|235|0|350|0|{0|out0|}115|116|}
{2010213001|XXGoport_dst_flow|236|0|352|0|{0|}116|16|}
{2010212001|XXGvertex_oport_oport|237|0|353|0|{1|out1|}115|117|}
{2010213001|XXGoport_dst_flow|238|0|355|0|{0|}117|6|}
{2010212001|XXGvertex_oport_oport|239|0|356|0|{2|reject0|}115|118|}
{2010212001|XXGvertex_oport_oport|240|0|358|0|{3|reject1|}115|119|}
{2010212001|XXGvertex_oport_oport|241|0|360|0|{4|error0|}115|120|}
{2010212001|XXGvertex_oport_oport|242|0|362|0|{5|error1|}115|121|}
{2010212001|XXGvertex_oport_oport|243|0|364|0|{6|log|}115|122|}
{2010211001|XXGvertex_iport_iport|244|0|366|0|{0|in|}115|123|}
{2010214001|XXGiport_src_flow|245|0|368|0|{0|}123|7|}
{2010007001|XXGobject_proto_object|246|0|369|0|{}115|124|}
{2010212001|XXGvertex_oport_oport|247|0|371|0|{0|out0|}124|125|}
{2010006001|XXGobject_psameas_object|248|0|373|0|{metadata|out0_metadata|1|0|}125|124|}
{2010006001|XXGobject_psameas_object|249|0|374|0|{transform0|transform0|1|0|}125|124|}
{2010212001|XXGvertex_oport_oport|250|0|375|0|{1|out1|}124|126|}
{2010006001|XXGobject_psameas_object|251|0|377|0|{metadata|out1_metadata|1|0|}126|124|}
{2010006001|XXGobject_psameas_object|252|0|378|0|{transform1|transform1|1|0|}126|124|}
{2010212001|XXGvertex_oport_oport|253|0|379|0|{2|reject0|}124|127|}
{2010006001|XXGobject_psameas_object|254|0|381|0|{metadata|reject0_metadata|1|0|}127|124|}
{2010212001|XXGvertex_oport_oport|255|0|382|0|{3|reject1|}124|128|}
{2010006001|XXGobject_psameas_object|256|0|384|0|{metadata|reject1_metadata|1|0|}128|124|}
{2010212001|XXGvertex_oport_oport|257|0|385|0|{4|error0|}124|129|}
{2010006001|XXGobject_psameas_object|258|0|387|0|{metadata|error0_metadata|1|0|}129|124|}
{2010212001|XXGvertex_oport_oport|259|0|388|0|{5|error1|}124|130|}
{2010006001|XXGobject_psameas_object|260|0|390|0|{metadata|error1_metadata|1|0|}130|124|}
{2010212001|XXGvertex_oport_oport|261|0|391|0|{6|log|}124|131|}
{2010006001|XXGobject_psameas_object|262|0|393|0|{metadata|log_metadata|1|0|}131|124|}
{2010211001|XXGvertex_iport_iport|263|0|394|0|{0|in|}124|132|}
{2010006001|XXGobject_psameas_object|264|0|396|0|{metadata|in_metadata|1|0|}132|124|}
{2010006001|XXGobject_psameas_object|265|0|397|0|{Layout|Layout|0|0|}115|47|}
{2010006001|XXGobject_psameas_object|266|0|398|0|{reject0_metadata|in_metadata|0|0|}115|115|}
{2010006001|XXGobject_psameas_object|267|0|399|0|{reject1_metadata|in_metadata|0|0|}115|115|}
{2010601001|XXGgraph_vertex_vertex|268|0|400|0|{f_claim_90_ins|}1|47|}
{2010601001|XXGgraph_vertex_vertex|269|0|401|0|{f_claim_90_insert|}1|95|}
{2010601001|XXGgraph_vertex_vertex|270|0|402|0|{f_claim_90_upd|}1|133|}
{2010211001|XXGvertex_iport_iport|271|0|404|0|{0|write|}133|134|}
{2010214001|XXGiport_src_flow|272|0|406|0|{0|}134|6|}
{2010007001|XXGobject_proto_object|273|0|407|0|{}133|135|}
{2010211001|XXGvertex_iport_iport|274|0|409|0|{0|write|}135|136|}
{2010006001|XXGobject_psameas_object|275|0|411|0|{metadata|write_metadata|1|0|}136|135|}
{2010601001|XXGgraph_vertex_vertex|276|0|412|0|{f_claim_90_update|}1|111|}
{2010601001|XXGgraph_vertex_vertex|277|0|413|0|{f_claim_insert|}1|63|}
{2010601001|XXGgraph_vertex_vertex|278|0|414|0|{f_claim_update|}1|79|}
{2010109001|XXGobject_property_value|279|0|415|0|{0|TrackingThumbprint|72|}1|137|}
