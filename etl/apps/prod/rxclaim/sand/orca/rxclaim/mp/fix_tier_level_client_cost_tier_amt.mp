@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|45|rel_count|54|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|BEGIN_TS|201401|3|9|RFK|@{0|}}
{30001002|XXparameter|END_TS|201403|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_STG_DBC|AI_PHASE|3|10|RFKd|@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:dev|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:qa|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:integration|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:uat|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:prod|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC:stage|$DB_RXCLAIM_DB/netezza.rxclaim.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC|AI_PHASE|3|10|RFKd|@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:dev|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:qa|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:integration|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:uat|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:prod|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC:stage|$DB_RXCLAIM_DB/netezza.rxclaim.main.dbc|3|9||@{0|}}
{30001002|XXparameter|RUN_ID|$[now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24|AI_PHASE|3|10|RFKd|@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:dev|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:qa|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:integration|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:uat|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:prod|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_STG_DBC_N24:stage|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24|AI_PHASE|3|10|RFKd|@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:dev|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:qa|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:integration|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:uat|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:prod|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DBC_N24:stage|$DB_RXCLAIM_DB/netezza.rxclaim_n24.main.dbc|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|fix_d_rb_clm_attr_cat_cd|ptondare|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|802000|365000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'fix_tier_level_client_cost_tier_amt' Execution Status Report

Job completed successfully at Friday, March 16, 2018 08:17:40
Run performed by user ptondare
||echo "***************************************************************"
echo "                           Important Parameters"
echo "***************************************************************"

echo "Run id : $RUN_ID";
echo "Begin Ts : $BEGIN_TS";
echo "End Ts : $END_TS";

echo "***************************************************************"
|echo "***************************************************************"
echo "                           Executing end script"
echo "***************************************************************"

if [ $mpjret -eq 0 ]

then

echo "Graph Succeeded"

else

echo "Graph Failed"



fi
echo "***************************************************************"
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010501005|XXGpvertex|5|0|9|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$TARGET_MAIN_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|UPDATE $\{DB_RXCLAIM_DB_NAME\}.ADMIN.F_CLAIM_TRX_MONTH FM
SET TIER_LEVEL = F.TIER_LEVEL ,
CLIENT_COST_TIER_AMT = F.CLIENT_COST_TIER_AMT
FROM $\{DB_RXCLAIM_DB_NAME\}.ADMIN.F_CLAIM_TRANSACTION F
WHERE F.CLAIM_NBR = FM.CLAIM_NBR
AND F.CLAIM_SEQ_NBR = FM.CLAIM_SEQ_NBR
AND F.CLAIM_STAT_ID = FM.CLAIM_STAT_ID
AND F.SRC_ENV_SK = FM.SRC_ENV_SK
AND F.SUBM_YR_MNTH BETWEEN $BEGIN_TS AND $END_TS
;|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Run SQL|556000|128500|0|0|0|0|14067|Update_table_MAKO|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|6|0|11|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|7|0|13|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|8|0|15|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|9|0|17|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|10|0|19|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/db_v2/bin/db-runsql|3|2|H$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If true, makes this a Continuous Run SQL component|{0|}}
{30001002|XXparameter|continuous.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|DBConfigFile||22|2|RFOf$|Database Description File|{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|transaction_group||3|2|FK$|Name of the transaction group for participation in a shared transaction. Graph folding must be enabled.|{0|}}
{30001002|XXparameter|transaction_group.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|interface|api|15|1|FKl|Run commands using utility or via api|{2|api|utility|}}
{30001002|XXparameter|ansimode|True|13|1|FKl|Teradata: Use ANSI semantics if True; BTET semantics if False|{0|}}
{30001002|XXparameter|ansimode.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_drop_table_errors|False|13|1|FKl|Ignore failures from drop table statements|{0|}}
{30001002|XXparameter|ignore_drop_table_errors.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|0|1|2|FK$|Maximum errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|param_exact interface api version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|SQLFile|~null|32|2|FOf$|File with SQL to run|{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata param_exact interface api version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options_impl|value dbms netezza True value dbms mssql True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|native_options_impl.condition|param_exact interface utility|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database SQL utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact native_options_impl True version 3.0.5.1:|3|15|P?|@{0|}}
{30001002|XXparameter|analyze_dependencies|True|13|1|Fl|Perform dependency analysis on the SQL in this component|{0|}}
{30001002|XXparameter|sql_analysis|SQLFile|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects|False|13|1|Fl|In transactional section only, always rollback on reject|{0|}}
{30001002|XXparameter|rollback_all_rejects.condition|param reject-threshold Never*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword|value reject-threshold Abort* False value reject-threshold Use* False sameas rollback_all_rejects default constant False|13|13|Kv|transactional reject behavior|{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|num_errors maximum_errors limit_keyword limit ramp_keyword ramp rollback_all_rejects_keyword rollback_all_rejects|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname|value continuous True db-runsql-continuous value continuous False db-runsql|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|LayoutFlags|idb|3|2|H$|Enable Database Layouts|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? nobatch,publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata_local|value_in_version :3.2.5.r23 recordstring(';')astmt;end value_in_version 3.2.5.r24: recordstring(';',charset='x-ab-internal')astmt;end|7|13|v|SQL statement format|{0|}}
{30001002|XXparameter|in_metadata|$in_metadata_local|7|2|F$|SQL statement format|{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 78 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|11|0|21|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|13|0|27|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|14|0|30|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|15|0|34|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$TARGET_MAIN_DBC_N24|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|UPDATE $\{DB_RXCLAIM_DB_NAME\}.ADMIN.F_CLAIM_TRX_MONTH FM
SET TIER_LEVEL = F.TIER_LEVEL ,
CLIENT_COST_TIER_AMT = F.CLIENT_COST_TIER_AMT
FROM $\{DB_RXCLAIM_DB_NAME\}.ADMIN.F_CLAIM_TRANSACTION F
WHERE F.CLAIM_NBR = FM.CLAIM_NBR
AND F.CLAIM_SEQ_NBR = FM.CLAIM_SEQ_NBR
AND F.CLAIM_STAT_ID = FM.CLAIM_STAT_ID
AND F.SRC_ENV_SK = FM.SRC_ENV_SK
AND F.SUBM_YR_MNTH BETWEEN $BEGIN_TS AND $END_TS
;|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Run SQL|571000|258500|0|0|0|0|14068|Update_table_N24|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|16|0|36|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|17|0|38|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|18|0|40|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|19|0|42|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|20|0|44|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/db_v2/bin/db-runsql|3|2|H$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If true, makes this a Continuous Run SQL component|{0|}}
{30001002|XXparameter|continuous.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|DBConfigFile||22|2|RFOf$|Database Description File|{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|transaction_group||3|2|FK$|Name of the transaction group for participation in a shared transaction. Graph folding must be enabled.|{0|}}
{30001002|XXparameter|transaction_group.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|interface|api|15|1|FKl|Run commands using utility or via api|{2|api|utility|}}
{30001002|XXparameter|ansimode|True|13|1|FKl|Teradata: Use ANSI semantics if True; BTET semantics if False|{0|}}
{30001002|XXparameter|ansimode.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_drop_table_errors|False|13|1|FKl|Ignore failures from drop table statements|{0|}}
{30001002|XXparameter|ignore_drop_table_errors.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|0|1|2|FK$|Maximum errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|param_exact interface api version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|SQLFile|~null|32|2|FOf$|File with SQL to run|{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata param_exact interface api version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options_impl|value dbms netezza True value dbms mssql True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|native_options_impl.condition|param_exact interface utility|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database SQL utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact native_options_impl True version 3.0.5.1:|3|15|P?|@{0|}}
{30001002|XXparameter|analyze_dependencies|True|13|1|Fl|Perform dependency analysis on the SQL in this component|{0|}}
{30001002|XXparameter|sql_analysis|SQLFile|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects|False|13|1|Fl|In transactional section only, always rollback on reject|{0|}}
{30001002|XXparameter|rollback_all_rejects.condition|param reject-threshold Never*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword|value reject-threshold Abort* False value reject-threshold Use* False sameas rollback_all_rejects default constant False|13|13|Kv|transactional reject behavior|{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|num_errors maximum_errors limit_keyword limit ramp_keyword ramp rollback_all_rejects_keyword rollback_all_rejects|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname|value continuous True db-runsql-continuous value continuous False db-runsql|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|LayoutFlags|idb|3|2|H$|Enable Database Layouts|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? nobatch,publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata_local|value_in_version :3.2.5.r23 recordstring(';')astmt;end value_in_version 3.2.5.r24: recordstring(';',charset='x-ab-internal')astmt;end|7|13|v|SQL statement format|{0|}}
{30001002|XXparameter|in_metadata|$in_metadata_local|7|2|F$|SQL statement format|{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 78 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|21|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010600005|XXGgraph|25|0|59|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@220000|80000|0|0|0|0|14064|Version Log|Swayam Mishra|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|996000|497000|3|}}
{2010240003|XXGlegend|26|0|61|0|{@{}@Date|92000|231000|0|0|0|0|1460|}}
{2010242002|XXGface|27|0|63|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|28|0|65|0|{@{}@Author|217000|231000|0|0|0|0|1459|}}
{2010242002|XXGface|29|0|67|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|30|0|69|0|{@{}@Description|417000|231000|0|0|0|0|1458|}}
{2010242002|XXGface|31|0|71|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|32|0|73|0|{@{}@Version|17000|231000|0|0|0|0|1443|}}
{2010242002|XXGface|33|0|75|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|34|0|77|0|{@{}@Initial version|412000|248000|0|0|0|0|1476|}}
{2010242002|XXGface|35|0|79|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|36|0|81|0|{@{}@Jan 17 2018|82000|248000|0|0|0|0|1485|}}
{2010242002|XXGface|37|0|83|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|38|0|85|0|{@{}@1.0|17000|248000|0|0|0|0|1474|}}
{2010242002|XXGface|39|0|87|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|40|0|89|0|{@{}@Prasad Tondare (Exusia)|187000|248000|0|0|0|0|1486|}}
{2010242002|XXGface|41|0|91|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|42|0|93|0|{@{}@Summary:

This graph takes the quarter range from input and updates the f_claim_trx_month for tier_level and client_cost_tier_amt. This graph is for one time activity.
|15000|42500|0|0|0|0|1487|}}
{2010242002|XXGface|43|0|95|0|{@{}@Candara|0|100|0|}}
{2010110002|XXGconstant|44|0|97|0|{@{}@{1|2011884|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Update_table_MAKO|}1|5|}
{2010212001|XXGvertex_oport_oport|5|0|10|0|{0|reject|}5|6|}
{2010212001|XXGvertex_oport_oport|6|0|12|0|{1|error|}5|7|}
{2010212001|XXGvertex_oport_oport|7|0|14|0|{2|log|}5|8|}
{2010211001|XXGvertex_iport_iport|8|0|16|0|{0|in|}5|9|}
{2010007001|XXGobject_proto_object|9|0|18|0|{}5|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|reject|}10|11|}
{2010006001|XXGobject_psameas_object|11|0|22|0|{metadata|reject_metadata|1|0|}11|10|}
{2010212001|XXGvertex_oport_oport|12|0|23|0|{1|error|}10|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|error_metadata|1|0|}12|10|}
{2010212001|XXGvertex_oport_oport|14|0|26|0|{2|log|}10|13|}
{2010006001|XXGobject_psameas_object|15|0|28|0|{metadata|log_metadata|1|0|}13|10|}
{2010211001|XXGvertex_iport_iport|16|0|29|0|{0|in|}10|14|}
{2010006001|XXGobject_psameas_object|17|0|31|0|{metadata|in_metadata|1|0|}14|10|}
{2010006001|XXGobject_psameas_object|18|0|32|0|{reject_metadata|in_metadata|0|0|}5|5|}
{2010601001|XXGgraph_vertex_vertex|19|0|33|0|{Update_table_N24|}1|15|}
{2010212001|XXGvertex_oport_oport|20|0|35|0|{0|reject|}15|16|}
{2010212001|XXGvertex_oport_oport|21|0|37|0|{1|error|}15|17|}
{2010212001|XXGvertex_oport_oport|22|0|39|0|{2|log|}15|18|}
{2010211001|XXGvertex_iport_iport|23|0|41|0|{0|in|}15|19|}
{2010007001|XXGobject_proto_object|24|0|43|0|{}15|20|}
{2010212001|XXGvertex_oport_oport|25|0|45|0|{0|reject|}20|21|}
{2010006001|XXGobject_psameas_object|26|0|47|0|{metadata|reject_metadata|1|0|}21|20|}
{2010212001|XXGvertex_oport_oport|27|0|48|0|{1|error|}20|22|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{metadata|error_metadata|1|0|}22|20|}
{2010212001|XXGvertex_oport_oport|29|0|51|0|{2|log|}20|23|}
{2010006001|XXGobject_psameas_object|30|0|53|0|{metadata|log_metadata|1|0|}23|20|}
{2010211001|XXGvertex_iport_iport|31|0|54|0|{0|in|}20|24|}
{2010006001|XXGobject_psameas_object|32|0|56|0|{metadata|in_metadata|1|0|}24|20|}
{2010006001|XXGobject_psameas_object|33|0|57|0|{reject_metadata|in_metadata|0|0|}15|15|}
{2010601001|XXGgraph_vertex_vertex|34|0|58|0|{Version_Log|}1|25|}
{2010605001|XXGgraph_legend_legend|35|0|60|0|{0|}25|26|}
{2010241001|XXGlegend_face_face|36|0|62|0|{}26|27|}
{2010605001|XXGgraph_legend_legend|37|0|64|0|{1|}25|28|}
{2010241001|XXGlegend_face_face|38|0|66|0|{}28|29|}
{2010605001|XXGgraph_legend_legend|39|0|68|0|{2|}25|30|}
{2010241001|XXGlegend_face_face|40|0|70|0|{}30|31|}
{2010605001|XXGgraph_legend_legend|41|0|72|0|{3|}25|32|}
{2010241001|XXGlegend_face_face|42|0|74|0|{}32|33|}
{2010605001|XXGgraph_legend_legend|43|0|76|0|{4|}25|34|}
{2010241001|XXGlegend_face_face|44|0|78|0|{}34|35|}
{2010605001|XXGgraph_legend_legend|45|0|80|0|{5|}25|36|}
{2010241001|XXGlegend_face_face|46|0|82|0|{}36|37|}
{2010605001|XXGgraph_legend_legend|47|0|84|0|{6|}25|38|}
{2010241001|XXGlegend_face_face|48|0|86|0|{}38|39|}
{2010605001|XXGgraph_legend_legend|49|0|88|0|{7|}25|40|}
{2010241001|XXGlegend_face_face|50|0|90|0|{}40|41|}
{2010605001|XXGgraph_legend_legend|51|0|92|0|{8|}25|42|}
{2010241001|XXGlegend_face_face|52|0|94|0|{}42|43|}
{2010109001|XXGobject_property_value|53|0|96|0|{0|TrackingThumbprint|72|}1|44|}
