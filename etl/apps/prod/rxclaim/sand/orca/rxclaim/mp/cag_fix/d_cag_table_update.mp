@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|86|rel_count|125|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|20200218021900|3|9|REFK|@{0|}}
{30001002|XXparameter|TABLE|d_cag|3|9|RFK|@{0|}}
{30001002|XXparameter|DROP_PREV_TEMP_TABLES|1|13|9|RFK|@{0|}}
{30001002|XXparameter|WORK_TABLE|$["agg_sk_"+TABLE]|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET|ODBC2|3|9|RFK|@{0|}}
{30001002|XXparameter|DBMS|$[if (TARGET == 'ODBC2') DB_RXCLAIM_DBC else DB_RXCLAIM_N24_DBC ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DBMS_STAGING|$[if (TARGET == 'ODBC2') DB_RXCLAIM_STAGING_DBC else DB_RXCLAIM_STAGING_N24_DBC ]|3|9|RFK|@{0|}}
{30001002|XXparameter|BACKUP_TABLE|$["BDI_180_"+TABLE]|3|9|RFK|@{0|}}
{30001002|XXparameter|ENV|$AI_PHASE|15|9|RFK|@{3|qa|prod|dev|}}
{30001002|XXparameter|SCHEMA|$[if (ENV == 'qa') 'ORX_IDW_DM_QA_PMT' else if (ENV=='prod') 'ORX_IDW_DM_PRD' else if(ENV == 'dev') 'ORX_IDW_DM_DEV']|3|9|RFK|@{0|}}
{30001002|XXparameter|SCHEMA_STAGING|$[if (ENV == 'qa') 'ORX_IDW_DM_ETL_QA_PMT' else if (ENV=='prod') 'ORX_IDW_DM_ETL_PRD' else if(ENV == 'dev') 'ORX_IDW_DM_ETL_DEV']|3|9|RFK|@{0|}}
{30001002|XXparameter|BACKUP_SQL|INSERT INTO $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE
select * from $SCHEMA.ADMIN.$TABLE;|3|9|RFK|@{0|}}
{30001002|XXparameter|BACKUP_TABLE_UNMODIFIED|$["BDI_180_UNMOD_"+TABLE]|3|9|RFK|@{0|}}
{30001002|XXparameter|DROP_TEMP_SQL|DROP TABLE $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE_UNMODIFIED ;
DROP TABLE $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE ;|3|9|RFK|@{0|}}
{30001002|XXparameter|CREATE_SQL|CREATE TABLE $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE
(
	CAG_SK BIGINT NOT NULL,
	DAR_LOB_SK BIGINT NOT NULL DEFAULT -1,
	ACCTG_LOB_SK BIGINT NOT NULL DEFAULT -1,
	CLIENT_SK BIGINT NOT NULL,
	CARRIER_SK BIGINT NOT NULL,
	CARRIER_ACCT_SK BIGINT NOT NULL,
	CLIENT_ID CHARACTER VARYING(50) NOT NULL,
	CARRIER_ID CHARACTER VARYING(30) NOT NULL DEFAULT '-'::"NVARCHAR",
	ACCOUNT_ID CHARACTER VARYING(40) NOT NULL DEFAULT '-'::"NVARCHAR",
	EMPLOYER_GROUP_ID CHARACTER VARYING(30) NOT NULL DEFAULT '-'::"NVARCHAR",
	CLIENT_NM CHARACTER VARYING(50) NOT NULL,
	CARRIER_NM CHARACTER VARYING(50) NOT NULL,
	ACCOUNT_NM CHARACTER VARYING(50) NOT NULL,
	EMPLOYER_GROUP_NM CHARACTER VARYING(50) NOT NULL,
	PVCY_EXCL_IND BYTEINT NOT NULL,
	PA_SITE_NM CHARACTER VARYING(50),
	CARRIER_CATEGORY_ID CHARACTER(1) NOT NULL,
	CARRIER_CATEGORY_DESC CHARACTER VARYING(50) NOT NULL,
	CARRIER_STATE_CD CHARACTER VARYING(2) NOT NULL,
	ACCT_CLIENT_TYPE_ID CHARACTER VARYING(30) NOT NULL,
	ACCT_CLIENT_TYPE_DESC CHARACTER VARYING(100) NOT NULL,
	ACCT_PRODUCT_TYPE_ID CHARACTER VARYING(30) NOT NULL,
	ACCT_PRODUCT_TYPE_DESC CHARACTER VARYING(100) NOT NULL,
	ACCT_PRODUCT_LINE_ID CHARACTER VARYING(30) NOT NULL,
	ACCT_PRODUCT_LINE_DESC CHARACTER VARYING(100) NOT NULL,
	CONTRACT_NUM CHARACTER VARYING(5) NOT NULL,
	PBP_ID CHARACTER VARYING(3) NOT NULL,
	GPS_PLAN_CD CHARACTER VARYING(3) NOT NULL,
	ORACLE_CLIENT_CD CHARACTER VARYING(50) NOT NULL,
	CLAIM_SUFFIX_CD CHARACTER VARYING(2) NOT NULL,
	CUSTOM_NO CHARACTER VARYING(12) NOT NULL,
	FUNDING_ARRANGMENT_CD CHARACTER(1) NOT NULL,
	PLAN_VARIATION_CD CHARACTER VARYING(4) NOT NULL,
	POLICY_NO CHARACTER VARYING(7) NOT NULL,
	REPORTING_CD CHARACTER VARYING(4) NOT NULL,
	PRODUCT_CD CHARACTER VARYING(3) NOT NULL,
	SEGMENT_IND CHARACTER VARYING(4) NOT NULL,
	HMO_ACCT_DVSN_CD CHARACTER VARYING(3) NOT NULL,
	CLAIM_ACCOUNT_CD CHARACTER VARYING(3) NOT NULL,
	SOLD_MARKET_SITE_CD CHARACTER VARYING(5) NOT NULL,
	SITUS_STATE_CD CHARACTER VARYING(2) NOT NULL,
	PLATFORM_IND CHARACTER(1) NOT NULL,
	CLIENT_CARRIER_ID CHARACTER VARYING(4) NOT NULL,
	SHARED_ARRANGEMENT_IND CHARACTER VARYING(2) NOT NULL,
	SALES_OFFICE_CD CHARACTER VARYING(3) NOT NULL,
	ACCUMULATOR_IND CHARACTER(1) NOT NULL,
	ERISA_ID CHARACTER(1) NOT NULL,
	RENEWAL_DT DATE NOT NULL,
	IPLAN_IND CHARACTER(1) NOT NULL,
	LEGAL_ENTITY_CD CHARACTER VARYING(5) NOT NULL,
	FRANCHISE_NO CHARACTER VARYING(7) NOT NULL,
	LEAD_PARTNER_CD CHARACTER VARYING(4) NOT NULL,
	COC_CD CHARACTER(1) NOT NULL,
	MIGRATION_IND BYTEINT NOT NULL,
	MIGRATION_EFFECTIVE_DT DATE NOT NULL,
	PRODUCT_CLASSIFIER_ID CHARACTER VARYING(5) NOT NULL,
	PHARMACY_RIDER_CD CHARACTER VARYING(4) NOT NULL,
	COB_IND CHARACTER VARYING(20) NOT NULL,
	COB_EFFECTIVE_DT DATE NOT NULL,
	TRANSACTION_TS TIMESTAMP NOT NULL,
	OBLIGOR_CD CHARACTER VARYING(2) NOT NULL,
	SPECIALITY_IND CHARACTER(1) NOT NULL,
	SPCLTY_EFF_DT DATE NOT NULL,
	PICK_LOB_CD CHARACTER VARYING(10) NOT NULL,
	GL_PRODUCT_CD CHARACTER VARYING(6) NOT NULL,
	GL_CUSTOMER_CD CHARACTER VARYING(7) NOT NULL,
	PRODUCT_ID CHARACTER VARYING(8) NOT NULL,
	HM_DLVRY_ONLY_IND CHARACTER(1) NOT NULL DEFAULT '-'::"NVARCHAR",
	HM_DLVRY_STAT_IND CHARACTER(1) NOT NULL DEFAULT '-'::"NVARCHAR",
	REBATES_ONLY_IND CHARACTER(1) NOT NULL DEFAULT '-'::"NVARCHAR",
	REBATES_STAT_IND CHARACTER(1),
	SRC_ENV_SK BIGINT NOT NULL DEFAULT -1,
	INSERT_TS TIMESTAMP NOT NULL,
	UPDATE_TS TIMESTAMP NOT NULL,
	INSERT_UID CHARACTER VARYING(20),
	UPDATE_UID CHARACTER VARYING(20),
	RUN_ID BIGINT,
	REC_STAT_CD BYTEINT,
	BSEG_SRV_TYP CHARACTER VARYING(50),
	BSEG_BUS_TYP CHARACTER VARYING(50),
	BSEG_CLT_TYP CHARACTER VARYING(50)
)
DISTRIBUTE ON RANDOM;|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|INSERT_TEMP_SQL|INSERT INTO $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE
SELECT * from $SCHEMA.ADMIN.$TABLE 
WHERE CAG_SK in (SELECT wrong_cag_sk from $SCHEMA_STAGING.ADMIN.$WORK_TABLE );|3|9|RFK|@{0|}}
{30001002|XXparameter|COPY_SQL|CREATE TABLE $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE_UNMODIFIED as
SELECT * from $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE;|3|9|RFK|@{0|}}
{30001002|XXparameter|DELETE_SQL|DELETE from $SCHEMA.ADMIN.$TABLE 
WHERE CAG_SK in (SELECT wrong_cag_sk from $SCHEMA_STAGING.ADMIN.$WORK_TABLE );|3|9|RFK|@{0|}}
{30001002|XXparameter|UPDATE_SQL|UPDATE $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE T 
SET T.cag_sk = W.correct_cag_sk
FROM $SCHEMA_STAGING.ADMIN.$WORK_TABLE W
where T.cag_sk = W.wrong_cag_sk;|3|9|RFK|@{0|}}
{30001002|XXparameter|INSERT_SQL|INSERT INTO $SCHEMA.ADMIN.$TABLE 
select * from (
select * from $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE B_T
minus
select B.* from $SCHEMA_STAGING.ADMIN.$BACKUP_TABLE B
inner join $SCHEMA.ADMIN.$TABLE D
on B.CARRIER_ID = D.CARRIER_ID
and B.ACCOUNT_ID = D.ACCOUNT_ID
and B.EMPLOYER_GROUP_ID = D.EMPLOYER_GROUP_ID)s;|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|backup_table|bdigumar|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1311000|413000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{8|1|1|1|1|1|1|1|1|}Job 'backup_table' Execution Status Report

||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010501005|XXGpvertex|5|0|9|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$BACKUP_SQL|3|9|j|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Run SQL|373000|120000|0|0|0|0|29|Backup Table|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
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
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$CREATE_SQL|3|9|j|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Run SQL|188000|105000|0|0|0|0|41|Create temp table with random distribution|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
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
{2010501005|XXGpvertex|25|0|59|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$DELETE_SQL|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@5|Run SQL|737000|93000|0|0|0|0|34|Delete records that require cag_sk update|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|26|0|61|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|27|0|63|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|28|0|65|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|29|0|67|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|30|0|69|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|31|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|35|0|84|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$DROP_TEMP_SQL|3|9|j|@{0|}}
{30001002|XXparameter|condition|$DROP_PREV_TEMP_TABLES|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Run SQL|13000|110000|0|0|0|0|40|Drop existing temp tables|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|36|0|86|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|37|0|88|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|38|0|90|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|39|0|92|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|40|0|94|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|41|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|42|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|45|0|109|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$INSERT_TEMP_SQL|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Run SQL|512000|103000|0|0|0|0|35|Insert records that require cag_sk update to temp table|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|111|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|113|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|115|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|117|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|50|0|119|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|51|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|52|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|53|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|55|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$COPY_SQL|3|9|j|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Run SQL|368000|250000|0|0|0|0|42|Unmodified copy of Backup Table|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|136|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|57|0|138|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|58|0|140|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|142|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|60|0|144|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|61|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|62|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|63|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|65|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS_STAGING|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$UPDATE_SQL|3|9|j|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@6|Run SQL|916000|106000|0|0|0|0|43|Update cag_sk to correct value in temp table|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|161|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|163|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|68|0|165|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|69|0|167|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|70|0|169|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|71|0|171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|72|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|73|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|75|0|184|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|DBConfigFile|$DBMS|3|9|f|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|9||@{0|}}
{30001002|XXparameter|SQLFile|$INSERT_SQL|3|9|j|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@7|Run SQL|1121000|101000|0|0|0|0|37|insert deleted records with correct cag_sk|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|76|0|186|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|77|0|188|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|78|0|190|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|192|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|80|0|194|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|82|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|83|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|205|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010110002|XXGconstant|85|0|209|0|{@{}@{1|1622565|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Backup_Table|}1|5|}
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
{2010601001|XXGgraph_vertex_vertex|19|0|33|0|{Create_temp_table_with_random_distribution|}1|15|}
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
{2010601001|XXGgraph_vertex_vertex|34|0|58|0|{Delete_records_that_require_cag_sk_update|}1|25|}
{2010212001|XXGvertex_oport_oport|35|0|60|0|{0|reject|}25|26|}
{2010212001|XXGvertex_oport_oport|36|0|62|0|{1|error|}25|27|}
{2010212001|XXGvertex_oport_oport|37|0|64|0|{2|log|}25|28|}
{2010211001|XXGvertex_iport_iport|38|0|66|0|{0|in|}25|29|}
{2010007001|XXGobject_proto_object|39|0|68|0|{}25|30|}
{2010212001|XXGvertex_oport_oport|40|0|70|0|{0|reject|}30|31|}
{2010006001|XXGobject_psameas_object|41|0|72|0|{metadata|reject_metadata|1|0|}31|30|}
{2010212001|XXGvertex_oport_oport|42|0|73|0|{1|error|}30|32|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{metadata|error_metadata|1|0|}32|30|}
{2010212001|XXGvertex_oport_oport|44|0|76|0|{2|log|}30|33|}
{2010006001|XXGobject_psameas_object|45|0|78|0|{metadata|log_metadata|1|0|}33|30|}
{2010211001|XXGvertex_iport_iport|46|0|79|0|{0|in|}30|34|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{metadata|in_metadata|1|0|}34|30|}
{2010006001|XXGobject_psameas_object|48|0|82|0|{reject_metadata|in_metadata|0|0|}25|25|}
{2010601001|XXGgraph_vertex_vertex|49|0|83|0|{Drop_existing_temp_tables|}1|35|}
{2010212001|XXGvertex_oport_oport|50|0|85|0|{0|reject|}35|36|}
{2010212001|XXGvertex_oport_oport|51|0|87|0|{1|error|}35|37|}
{2010212001|XXGvertex_oport_oport|52|0|89|0|{2|log|}35|38|}
{2010211001|XXGvertex_iport_iport|53|0|91|0|{0|in|}35|39|}
{2010007001|XXGobject_proto_object|54|0|93|0|{}35|40|}
{2010212001|XXGvertex_oport_oport|55|0|95|0|{0|reject|}40|41|}
{2010006001|XXGobject_psameas_object|56|0|97|0|{metadata|reject_metadata|1|0|}41|40|}
{2010212001|XXGvertex_oport_oport|57|0|98|0|{1|error|}40|42|}
{2010006001|XXGobject_psameas_object|58|0|100|0|{metadata|error_metadata|1|0|}42|40|}
{2010212001|XXGvertex_oport_oport|59|0|101|0|{2|log|}40|43|}
{2010006001|XXGobject_psameas_object|60|0|103|0|{metadata|log_metadata|1|0|}43|40|}
{2010211001|XXGvertex_iport_iport|61|0|104|0|{0|in|}40|44|}
{2010006001|XXGobject_psameas_object|62|0|106|0|{metadata|in_metadata|1|0|}44|40|}
{2010006001|XXGobject_psameas_object|63|0|107|0|{reject_metadata|in_metadata|0|0|}35|35|}
{2010601001|XXGgraph_vertex_vertex|64|0|108|0|{Insert_records_that_require_cag_sk_update_to_temp_table|}1|45|}
{2010212001|XXGvertex_oport_oport|65|0|110|0|{0|reject|}45|46|}
{2010212001|XXGvertex_oport_oport|66|0|112|0|{1|error|}45|47|}
{2010212001|XXGvertex_oport_oport|67|0|114|0|{2|log|}45|48|}
{2010211001|XXGvertex_iport_iport|68|0|116|0|{0|in|}45|49|}
{2010007001|XXGobject_proto_object|69|0|118|0|{}45|50|}
{2010212001|XXGvertex_oport_oport|70|0|120|0|{0|reject|}50|51|}
{2010006001|XXGobject_psameas_object|71|0|122|0|{metadata|reject_metadata|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|72|0|123|0|{1|error|}50|52|}
{2010006001|XXGobject_psameas_object|73|0|125|0|{metadata|error_metadata|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|74|0|126|0|{2|log|}50|53|}
{2010006001|XXGobject_psameas_object|75|0|128|0|{metadata|log_metadata|1|0|}53|50|}
{2010211001|XXGvertex_iport_iport|76|0|129|0|{0|in|}50|54|}
{2010006001|XXGobject_psameas_object|77|0|131|0|{metadata|in_metadata|1|0|}54|50|}
{2010006001|XXGobject_psameas_object|78|0|132|0|{reject_metadata|in_metadata|0|0|}45|45|}
{2010601001|XXGgraph_vertex_vertex|79|0|133|0|{Unmodified_copy_of_Backup_Table|}1|55|}
{2010212001|XXGvertex_oport_oport|80|0|135|0|{0|reject|}55|56|}
{2010212001|XXGvertex_oport_oport|81|0|137|0|{1|error|}55|57|}
{2010212001|XXGvertex_oport_oport|82|0|139|0|{2|log|}55|58|}
{2010211001|XXGvertex_iport_iport|83|0|141|0|{0|in|}55|59|}
{2010007001|XXGobject_proto_object|84|0|143|0|{}55|60|}
{2010212001|XXGvertex_oport_oport|85|0|145|0|{0|reject|}60|61|}
{2010006001|XXGobject_psameas_object|86|0|147|0|{metadata|reject_metadata|1|0|}61|60|}
{2010212001|XXGvertex_oport_oport|87|0|148|0|{1|error|}60|62|}
{2010006001|XXGobject_psameas_object|88|0|150|0|{metadata|error_metadata|1|0|}62|60|}
{2010212001|XXGvertex_oport_oport|89|0|151|0|{2|log|}60|63|}
{2010006001|XXGobject_psameas_object|90|0|153|0|{metadata|log_metadata|1|0|}63|60|}
{2010211001|XXGvertex_iport_iport|91|0|154|0|{0|in|}60|64|}
{2010006001|XXGobject_psameas_object|92|0|156|0|{metadata|in_metadata|1|0|}64|60|}
{2010006001|XXGobject_psameas_object|93|0|157|0|{reject_metadata|in_metadata|0|0|}55|55|}
{2010601001|XXGgraph_vertex_vertex|94|0|158|0|{Update_cag_sk_to_correct_value_in_temp_table|}1|65|}
{2010212001|XXGvertex_oport_oport|95|0|160|0|{0|reject|}65|66|}
{2010212001|XXGvertex_oport_oport|96|0|162|0|{1|error|}65|67|}
{2010212001|XXGvertex_oport_oport|97|0|164|0|{2|log|}65|68|}
{2010211001|XXGvertex_iport_iport|98|0|166|0|{0|in|}65|69|}
{2010007001|XXGobject_proto_object|99|0|168|0|{}65|70|}
{2010212001|XXGvertex_oport_oport|100|0|170|0|{0|reject|}70|71|}
{2010006001|XXGobject_psameas_object|101|0|172|0|{metadata|reject_metadata|1|0|}71|70|}
{2010212001|XXGvertex_oport_oport|102|0|173|0|{1|error|}70|72|}
{2010006001|XXGobject_psameas_object|103|0|175|0|{metadata|error_metadata|1|0|}72|70|}
{2010212001|XXGvertex_oport_oport|104|0|176|0|{2|log|}70|73|}
{2010006001|XXGobject_psameas_object|105|0|178|0|{metadata|log_metadata|1|0|}73|70|}
{2010211001|XXGvertex_iport_iport|106|0|179|0|{0|in|}70|74|}
{2010006001|XXGobject_psameas_object|107|0|181|0|{metadata|in_metadata|1|0|}74|70|}
{2010006001|XXGobject_psameas_object|108|0|182|0|{reject_metadata|in_metadata|0|0|}65|65|}
{2010601001|XXGgraph_vertex_vertex|109|0|183|0|{insert_deleted_records_with_correct_cag_sk|}1|75|}
{2010212001|XXGvertex_oport_oport|110|0|185|0|{0|reject|}75|76|}
{2010212001|XXGvertex_oport_oport|111|0|187|0|{1|error|}75|77|}
{2010212001|XXGvertex_oport_oport|112|0|189|0|{2|log|}75|78|}
{2010211001|XXGvertex_iport_iport|113|0|191|0|{0|in|}75|79|}
{2010007001|XXGobject_proto_object|114|0|193|0|{}75|80|}
{2010212001|XXGvertex_oport_oport|115|0|195|0|{0|reject|}80|81|}
{2010006001|XXGobject_psameas_object|116|0|197|0|{metadata|reject_metadata|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|117|0|198|0|{1|error|}80|82|}
{2010006001|XXGobject_psameas_object|118|0|200|0|{metadata|error_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|119|0|201|0|{2|log|}80|83|}
{2010006001|XXGobject_psameas_object|120|0|203|0|{metadata|log_metadata|1|0|}83|80|}
{2010211001|XXGvertex_iport_iport|121|0|204|0|{0|in|}80|84|}
{2010006001|XXGobject_psameas_object|122|0|206|0|{metadata|in_metadata|1|0|}84|80|}
{2010006001|XXGobject_psameas_object|123|0|207|0|{reject_metadata|in_metadata|0|0|}75|75|}
{2010109001|XXGobject_property_value|124|0|208|0|{0|TrackingThumbprint|72|}1|85|}
