@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|9|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|66|rel_count|100|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|SDATE|$[(date("YYYYMM01"))now1()]|3|9|RFK||{0|}}
{30001002|XXparameter|EDATE|$[(date("YYYYMMDD"))datetime_add_months((date("YYYYMMDD"))SDATE,1)]|3|9|RFK||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|history_update|schakal1|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1440000|809000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{2|1|1|}Job 'history_update' Execution Status Report

Job completed successfully at Friday, August 19, 2022 16:03:13
Run performed by user schakal1
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Shiva QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010501005|XXGpvertex|5|0|9|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|/etl/data/qa/serial/orca/rxclaim/main/jsing195/dbc/netezza.rxclaim_sandbox_odbc2.main.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|SQLFile|drop table sandbox.admin.sh_030_f_claim_transaction_extn;|3|1|l|@{0|}}
}}@0|Run SQL|208000|60000|0|0|0|0|29|Run SQL|Ab Initio Software|Built-in 2.2:|1|100|0||6||4161|1|{1|0|}}}
{2010203004|XXGoport|6|0|11|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|7|0|13|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|8|0|15|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|9|0|17|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|10|0|19|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|11|0|21|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|12|0|23|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|13|0|26|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|14|0|29|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|15|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|16|0|35|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|17|0|40|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|SQLFile|create table sandbox.admin.sh_030_f_claim_transaction_extn as select CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID,MBR_SK,SRC_ENV_SK,CIT_MAC_LST,CIT_PATPAY_AMT_FNL,CIT_PATPAY_AMT_CASH_INFM,CLAIM_NBR_ENCRP from ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN DISTRIBUTE ON ( CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID,SRC_ENV_SK);|3|1|l|@{0|}}
{30001002|XXparameter|DBConfigFile|/etl/data/qa/serial/orca/rxclaim/main/jsing195/dbc/netezza.rxclaim_sandbox_odbc2.main.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN\\r\\n * On: Thu Aug 18 10:34:57 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) splty_pgm_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_pgm_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) phr_ntwk_qlfr = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_stat = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_set_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_proc_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_ben_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_dflt_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_1 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_3 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_accum_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) cntrbtn_basis_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntrbtn_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cntrbtn_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_1 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_1 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_2 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_2 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_3 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_3 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_4 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_4 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_prgm_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rxnorm_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) payer_type = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) prim_pbr_id_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) rsp_pln_id = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) hlth_pln_fnd_asst_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_ing_cost_cntrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pat_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_ing_cost_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) part_fill_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntngnt_stat_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) ndc_plan_dflt_list = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) gpi_plan_dflt_list = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) part_fill_seg_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) sbm_prescribed_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) tax_sched_nm = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sbm_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") filled_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) sav_pln_drg_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) sav_clt_pat_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_clm_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_client_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_client_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_dispnsr_type_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) phr_dispnsr_type_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) silent_pa_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("sandbox.admin.sh_030_f_claim_transaction_extn", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM sandbox.admin.sh_030_f_claim_transaction_extn\\r\\n * On: Thu Aug 18 10:35:04 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
}}@1|Run SQL|408000|120000|0|0|0|0|49|Run SQL-1|Ab Initio Software|Built-in 2.2:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|18|0|42|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|19|0|44|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|20|0|46|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|21|0|48|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|22|0|50|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|23|0|52|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|24|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|25|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|26|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|27|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|28|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|29|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|/etl/data/qa/serial/orca/rxclaim/main/jsing195/dbc/netezza.rxclaim_n24_sandbox_odbc3.main.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|SQLFile|drop table sandbox.admin.sh_030_f_claim_transaction_extn;|3|1|l|@{0|}}
}}@0|Run SQL|198000|240000|0|0|0|0|30|Run SQL-2|Ab Initio Software|Built-in 2.2:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|30|0|73|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|31|0|75|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|77|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|79|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|81|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|35|0|83|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|36|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|37|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|38|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|39|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|40|0|97|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|41|0|102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|SQLFile|create table sandbox.admin.sh_030_f_claim_transaction_extn as select CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID,MBR_SK,SRC_ENV_SK,CIT_MAC_LST,CIT_PATPAY_AMT_FNL,CIT_PATPAY_AMT_CASH_INFM,CLAIM_NBR_ENCRP from ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN DISTRIBUTE ON ( CLAIM_NBR,CLAIM_SEQ_NBR,CLAIM_STAT_ID,SRC_ENV_SK);|3|1|l|@{0|}}
{30001002|XXparameter|DBConfigFile|/etl/data/qa/serial/orca/rxclaim/main/jsing195/dbc/netezza.rxclaim_n24_sandbox_odbc3.main.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN\\r\\n * On: Thu Aug 18 10:36:36 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) splty_pgm_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_pgm_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) phr_ntwk_qlfr = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_stat = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_set_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_proc_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_ben_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_dflt_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_1 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_3 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_accum_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) cntrbtn_basis_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntrbtn_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cntrbtn_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_1 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_1 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_2 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_2 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_3 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_3 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_4 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_4 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_prgm_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rxnorm_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) payer_type = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) prim_pbr_id_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) rsp_pln_id = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) hlth_pln_fnd_asst_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_ing_cost_cntrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pat_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_ing_cost_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) part_fill_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntngnt_stat_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) ndc_plan_dflt_list = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) gpi_plan_dflt_list = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) part_fill_seg_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) sbm_prescribed_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) tax_sched_nm = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sbm_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") filled_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) sav_pln_drg_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) sav_clt_pat_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_clm_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_client_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_client_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_dispnsr_type_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) phr_dispnsr_type_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) silent_pa_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("sandbox.admin.sh_030_f_claim_transaction_extn", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM sandbox.admin.sh_030_f_claim_transaction_extn\\r\\n * On: Thu Aug 18 10:36:43 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
}}@1|Run SQL|398000|300000|0|0|0|0|28|Run SQL-3|Ab Initio Software|Built-in 2.2:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|42|0|104|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|43|0|106|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|44|0|108|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|45|0|110|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|46|0|112|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|47|0|114|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|48|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|49|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|50|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|51|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|52|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|53|0|133|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|SQLFile|UPDATE ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN F
SET
F.CIT_MAC_LST = S.CIT_MAC_LST,
F.CIT_PATPAY_AMT_FNL =S.CIT_PATPAY_AMT_FNL,
F.CIT_PATPAY_AMT_CASH_INFM =S.CIT_PATPAY_AMT_CASH_INFM,
F.CLAIM_NBR_ENCRP=S.CLAIM_NBR_ENCRP
FROM SANDBOX.ADMIN.SH_030_F_CLAIM_TRANSACTION_EXTN S
WHERE 
F.CLAIM_NBR = S.CLAIM_NBR AND 
F.CLAIM_SEQ_NBR = S.CLAIM_SEQ_NBR AND 
F.CLAIM_STAT_ID = S.CLAIM_STAT_ID AND
F.SRC_ENV_SK = S.SRC_ENV_SK AND 
F.SBM_DT_SK >='$\{SDATE\}' AND F.SBM_DT_SK <'$\{EDATE\}';|3|3|c|@{0|}}
{30001002|XXparameter|DBConfigFile|$DB_RXCLAIM_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION_EXTN\\r\\n * On: Thu Aug 18 10:34:57 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) splty_pgm_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_pgm_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) phr_ntwk_qlfr = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_stat = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_set_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_rule_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_srvc_proc_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_ben_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_dflt_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_1 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) frm_mgmt_srvc_lst_lvl_3 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_rtl_mail_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_accum_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) cntrbtn_basis_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntrbtn_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cntrbtn_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cntrbtn_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_1 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_1 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_2 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_2 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_3 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_3 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) bnft_stg_qlfr_4 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) bnft_stg_amt_4 = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) splty_prgm_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rxnorm_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) payer_type = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) prim_pbr_id_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) rsp_pln_id = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) hlth_pln_fnd_asst_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_ing_cost_cntrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pat_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_disp_fee_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_ing_cost_ctrctd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_pln_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) part_fill_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntngnt_stat_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) ndc_plan_dflt_list = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) gpi_plan_dflt_list = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) part_fill_seg_ind = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) sbm_prescribed_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) tax_sched_nm = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sbm_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") filled_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_clt_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) sav_pln_drg_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) sav_clt_pat_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_clm_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) adpt_price_client_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sav_client_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_dispnsr_type_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) phr_dispnsr_type_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) silent_pa_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("sandbox.admin.sh_030_f_claim_transaction_extn", "constant") map_dataset 1 mapping [record dataset_path _interp_("", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM sandbox.admin.sh_030_f_claim_transaction_extn\\r\\n * On: Thu Aug 18 10:35:04 2022\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cit_mac_lst = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_fnl = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cit_patpay_amt_cash_infm = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr_encrp = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
}}@1|Run SQL|603000|215000|0|0|0|0|52|Run SQL:Update Statements|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|135|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|55|0|137|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|56|0|139|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|57|0|141|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|143|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|59|0|145|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|60|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|61|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|62|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|63|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010110002|XXGconstant|65|0|164|0|{@{}@{1|536181|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Run_SQL|}1|5|}
{2010212001|XXGvertex_oport_oport|5|0|10|0|{0|out|}5|6|}
{2010212001|XXGvertex_oport_oport|6|0|12|0|{1|reject|}5|7|}
{2010212001|XXGvertex_oport_oport|7|0|14|0|{2|error|}5|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{3|log|}5|9|}
{2010211001|XXGvertex_iport_iport|9|0|18|0|{0|in|}5|10|}
{2010007001|XXGobject_proto_object|10|0|20|0|{}5|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{0|out|}11|12|}
{2010006001|XXGobject_psameas_object|12|0|24|0|{metadata|out_metadata|1|0|}12|11|}
{2010212001|XXGvertex_oport_oport|13|0|25|0|{1|reject|}11|13|}
{2010006001|XXGobject_psameas_object|14|0|27|0|{metadata|reject_metadata|1|0|}13|11|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{2|error|}11|14|}
{2010006001|XXGobject_psameas_object|16|0|30|0|{metadata|error_metadata|1|0|}14|11|}
{2010212001|XXGvertex_oport_oport|17|0|31|0|{3|log|}11|15|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{metadata|log_metadata|1|0|}15|11|}
{2010211001|XXGvertex_iport_iport|19|0|34|0|{0|in|}11|16|}
{2010006001|XXGobject_psameas_object|20|0|36|0|{metadata|in_metadata|1|0|}16|11|}
{2010006001|XXGobject_psameas_object|21|0|37|0|{out_metadata|in_metadata|0|0|}5|5|}
{2010006001|XXGobject_psameas_object|22|0|38|0|{reject_metadata|in_metadata|0|0|}5|5|}
{2010601001|XXGgraph_vertex_vertex|23|0|39|0|{Run_SQL_1|}1|17|}
{2010212001|XXGvertex_oport_oport|24|0|41|0|{0|out|}17|18|}
{2010212001|XXGvertex_oport_oport|25|0|43|0|{1|reject|}17|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{2|error|}17|20|}
{2010212001|XXGvertex_oport_oport|27|0|47|0|{3|log|}17|21|}
{2010211001|XXGvertex_iport_iport|28|0|49|0|{0|in|}17|22|}
{2010007001|XXGobject_proto_object|29|0|51|0|{}17|23|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{0|out|}23|24|}
{2010006001|XXGobject_psameas_object|31|0|55|0|{metadata|out_metadata|1|0|}24|23|}
{2010212001|XXGvertex_oport_oport|32|0|56|0|{1|reject|}23|25|}
{2010006001|XXGobject_psameas_object|33|0|58|0|{metadata|reject_metadata|1|0|}25|23|}
{2010212001|XXGvertex_oport_oport|34|0|59|0|{2|error|}23|26|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{metadata|error_metadata|1|0|}26|23|}
{2010212001|XXGvertex_oport_oport|36|0|62|0|{3|log|}23|27|}
{2010006001|XXGobject_psameas_object|37|0|64|0|{metadata|log_metadata|1|0|}27|23|}
{2010211001|XXGvertex_iport_iport|38|0|65|0|{0|in|}23|28|}
{2010006001|XXGobject_psameas_object|39|0|67|0|{metadata|in_metadata|1|0|}28|23|}
{2010006001|XXGobject_psameas_object|40|0|68|0|{out_metadata|in_metadata|0|0|}17|17|}
{2010006001|XXGobject_psameas_object|41|0|69|0|{reject_metadata|in_metadata|0|0|}17|17|}
{2010601001|XXGgraph_vertex_vertex|42|0|70|0|{Run_SQL_2|}1|29|}
{2010212001|XXGvertex_oport_oport|43|0|72|0|{0|out|}29|30|}
{2010212001|XXGvertex_oport_oport|44|0|74|0|{1|reject|}29|31|}
{2010212001|XXGvertex_oport_oport|45|0|76|0|{2|error|}29|32|}
{2010212001|XXGvertex_oport_oport|46|0|78|0|{3|log|}29|33|}
{2010211001|XXGvertex_iport_iport|47|0|80|0|{0|in|}29|34|}
{2010007001|XXGobject_proto_object|48|0|82|0|{}29|35|}
{2010212001|XXGvertex_oport_oport|49|0|84|0|{0|out|}35|36|}
{2010006001|XXGobject_psameas_object|50|0|86|0|{metadata|out_metadata|1|0|}36|35|}
{2010212001|XXGvertex_oport_oport|51|0|87|0|{1|reject|}35|37|}
{2010006001|XXGobject_psameas_object|52|0|89|0|{metadata|reject_metadata|1|0|}37|35|}
{2010212001|XXGvertex_oport_oport|53|0|90|0|{2|error|}35|38|}
{2010006001|XXGobject_psameas_object|54|0|92|0|{metadata|error_metadata|1|0|}38|35|}
{2010212001|XXGvertex_oport_oport|55|0|93|0|{3|log|}35|39|}
{2010006001|XXGobject_psameas_object|56|0|95|0|{metadata|log_metadata|1|0|}39|35|}
{2010211001|XXGvertex_iport_iport|57|0|96|0|{0|in|}35|40|}
{2010006001|XXGobject_psameas_object|58|0|98|0|{metadata|in_metadata|1|0|}40|35|}
{2010006001|XXGobject_psameas_object|59|0|99|0|{out_metadata|in_metadata|0|0|}29|29|}
{2010006001|XXGobject_psameas_object|60|0|100|0|{reject_metadata|in_metadata|0|0|}29|29|}
{2010601001|XXGgraph_vertex_vertex|61|0|101|0|{Run_SQL_3|}1|41|}
{2010212001|XXGvertex_oport_oport|62|0|103|0|{0|out|}41|42|}
{2010212001|XXGvertex_oport_oport|63|0|105|0|{1|reject|}41|43|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{2|error|}41|44|}
{2010212001|XXGvertex_oport_oport|65|0|109|0|{3|log|}41|45|}
{2010211001|XXGvertex_iport_iport|66|0|111|0|{0|in|}41|46|}
{2010007001|XXGobject_proto_object|67|0|113|0|{}41|47|}
{2010212001|XXGvertex_oport_oport|68|0|115|0|{0|out|}47|48|}
{2010006001|XXGobject_psameas_object|69|0|117|0|{metadata|out_metadata|1|0|}48|47|}
{2010212001|XXGvertex_oport_oport|70|0|118|0|{1|reject|}47|49|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{metadata|reject_metadata|1|0|}49|47|}
{2010212001|XXGvertex_oport_oport|72|0|121|0|{2|error|}47|50|}
{2010006001|XXGobject_psameas_object|73|0|123|0|{metadata|error_metadata|1|0|}50|47|}
{2010212001|XXGvertex_oport_oport|74|0|124|0|{3|log|}47|51|}
{2010006001|XXGobject_psameas_object|75|0|126|0|{metadata|log_metadata|1|0|}51|47|}
{2010211001|XXGvertex_iport_iport|76|0|127|0|{0|in|}47|52|}
{2010006001|XXGobject_psameas_object|77|0|129|0|{metadata|in_metadata|1|0|}52|47|}
{2010006001|XXGobject_psameas_object|78|0|130|0|{out_metadata|in_metadata|0|0|}41|41|}
{2010006001|XXGobject_psameas_object|79|0|131|0|{reject_metadata|in_metadata|0|0|}41|41|}
{2010601001|XXGgraph_vertex_vertex|80|0|132|0|{Run_SQL_Update_Statements|}1|53|}
{2010212001|XXGvertex_oport_oport|81|0|134|0|{0|out|}53|54|}
{2010212001|XXGvertex_oport_oport|82|0|136|0|{1|reject|}53|55|}
{2010212001|XXGvertex_oport_oport|83|0|138|0|{2|error|}53|56|}
{2010212001|XXGvertex_oport_oport|84|0|140|0|{3|log|}53|57|}
{2010211001|XXGvertex_iport_iport|85|0|142|0|{0|in|}53|58|}
{2010007001|XXGobject_proto_object|86|0|144|0|{}53|59|}
{2010212001|XXGvertex_oport_oport|87|0|146|0|{0|out|}59|60|}
{2010006001|XXGobject_psameas_object|88|0|148|0|{metadata|out_metadata|1|0|}60|59|}
{2010212001|XXGvertex_oport_oport|89|0|149|0|{1|reject|}59|61|}
{2010006001|XXGobject_psameas_object|90|0|151|0|{metadata|reject_metadata|1|0|}61|59|}
{2010212001|XXGvertex_oport_oport|91|0|152|0|{2|error|}59|62|}
{2010006001|XXGobject_psameas_object|92|0|154|0|{metadata|error_metadata|1|0|}62|59|}
{2010212001|XXGvertex_oport_oport|93|0|155|0|{3|log|}59|63|}
{2010006001|XXGobject_psameas_object|94|0|157|0|{metadata|log_metadata|1|0|}63|59|}
{2010211001|XXGvertex_iport_iport|95|0|158|0|{0|in|}59|64|}
{2010006001|XXGobject_psameas_object|96|0|160|0|{metadata|in_metadata|1|0|}64|59|}
{2010006001|XXGobject_psameas_object|97|0|161|0|{out_metadata|in_metadata|0|0|}53|53|}
{2010006001|XXGobject_psameas_object|98|0|162|0|{reject_metadata|in_metadata|0|0|}53|53|}
{2010109001|XXGobject_property_value|99|0|163|0|{0|TrackingThumbprint|72|}1|65|}
