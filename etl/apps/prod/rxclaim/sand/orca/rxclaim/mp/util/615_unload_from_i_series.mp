~
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|40|rel_count|61|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|$AI_RUN|3|9|FK|@{0|}}
{30001002|XXparameter|TABLE_NM|$TABLE_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|DBC|$DB_CCTA_DBC|3|9|RFK|@{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.get_db_multi.default.xfr|3|9|FK||{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|$SOURCE_LOGICAL_NAME|3|9|RFK|@{0|}}
{30001002|XXparameter|START_CHANGES_TIME|$[(datetime("YYYY-MM-DD HH24:MI:SS")) now()]|3|9|RFK|@{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[(datetime("YYYY-MM-DD HH24:MI:SS")) now()]|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|rxclaim_ctrx|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DATASET|rcex1p|3|9|RFK|@{0|}}
{30001002|XXparameter|DXF_SRC_SYS_ID|615|3|9|FK|@{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." +SOURCE_SYSTEM +"." +SOURCE_DATASET + ".dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." +SOURCE_SYSTEM +"." +SOURCE_DATASET + "." + RUN_ID +  ".dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|WHERE_CLAUSE|where 1 =1|3|9|RFK|@{0|}}
{30001002|XXparameter|SLCT_STMT|$[ " Select * from " + TABLE_NM + "  " + WHERE_CLAUSE ]|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DB_LAYOUT|$AI_SERIAL|3|9|RFK|@{0|}}
{30001002|XXparameter|DML|$(m_db gendml $DBC -select "$\{SLCT_STMT\}")|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|unload_from_i_series|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|913000|391000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job '615_unload_from_i_series' Execution Status Report

||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM DEV||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@If unload is happening other than primary logical schema , Pass dxf_src_sys_id
as input parametr explicitly|207000|329000|0|0|0|0|17121|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}17150|19|}}
{2010243001|XXGwatcher|8|0|15|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}17151|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}17148|2066|}}
{2010503005|XXGfvertex|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|mfile:$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CLEAN_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
}}@0|@759000|170000|0|0|0|0|17149|Clean File|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|12|0|23|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|13|0|26|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|14|0|28|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|15|0|31|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$READ_DB_NORMALIZE_XFR_FILE|8|9|RFKfj|Required and optional DML functions|{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||7|8|RF=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@287952|132880|683000|208000|145000|126000|17152|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|16|0|33|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|17|0|36|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|18|0|38|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|19|0|40|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|20|0|42|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|21|0|45|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|22|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|23|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|24|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|25|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010505005|XXGtvertex|27|0|62|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|config_file|$DBC|3|2|f$|@{0|}}
{30001002|XXparameter|table_spec|$SLCT_STMT|3|2|$|@{0|}}
{30001002|XXparameter|nza_interface|external_table|3|1|l|@{0|}}
{30001002|XXparameter|logfile|$AI_SERIAL_LOG/td_log.unload.$TARGET_LOWER.log|3|2|$|@{0|}}
{30001002|XXparameter|native_options|$\{SOURCE_DATA_DB_NATIVE_OPTIONS\}|3|3|c|@{0|}}
{30001002|XXparameter|dbms|odbc|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$SOURCE_DB_LAYOUT|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$\{DML\}|3|3|cj|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("CLMPRDEXT2.RCE11804", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_ORXCLAIM\}/tables/odbc/clmprdext2.rce11804", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM CLMPRDEXT2.RCE11804\\r\\n * On: Thu May 31 14:50:13 2018\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=16, sign_reserved) rxclaimnbr /*DECIMAL(15) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) clmseqnbr /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=9) scarrierid /*CHAR(9) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=11, sign_reserved) carrproc /*NUMERIC(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) acctbencde /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) versionnbr /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) groupplan /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) grpclibenf /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=4) groupsic /*CHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) clmrespsts /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) mbrlstnme /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) mbrfstnme /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrmdinit /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) mbrprsncde /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrrelcde /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrsex /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) mbrbirth /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) mbrage /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) mbrzip /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=9) socsecnbr /*CHAR(9) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=18) durkey /*CHAR(18) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) durflag /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) mbrfamlyid /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrfamlind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrfamltyp /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) cobind /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) mbrplan /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) mbrprodcde /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) mbrridercd /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) carenetid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) carequalid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) carefacid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) carefacnam /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) mbrpcphys /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) pprsfstnme /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) pprslstnme /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) pprsmdinit /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) pprsspccde /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbraltinfl /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) mbraltincd /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) mbraltinid /*CHAR(20) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) mbrmeddte /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mbrmedtype /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) mbrhiccde /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) cardholder /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) patlastnme /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=12) patfrstnme /*CHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) personcde /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) relationcd /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) sexcode /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) birthdte /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) eligclarif /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) custloc /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) prmcareprv /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) prmcareprq /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) facilityid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) othcoverag /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) binnumber /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) processor /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) transcde /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) datesbm /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) timesbm /*DECIMAL(6) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) orgpdsbmdt /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) rvdatesbm /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=2, sign_reserved) clmcounter /*DECIMAL(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=2, sign_reserved) genericctr /*DECIMAL(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=2, sign_reserved) formlryctr /*DECIMAL(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxnumberql /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) refill /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) dispstatus /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) productid /*CHAR(20) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=10, sign_reserved) productkey /*DECIMAL(9) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=6, sign_reserved) metricqty /*DECIMAL(5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) psc /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) writtendte /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=3, sign_reserved) nbrflsauth /*DECIMAL(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) origincde /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmclarcd1 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) pamcnbr /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) pamccde /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) prauthnbr /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) prauthrsn /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) prauthfdte /*DECIMAL(7) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) prauthtdte /*DECIMAL(7) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) labelname /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=70) prodname /*CHAR(70) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=5) drugmfgrid /*CHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) drugmfgr /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=14) gpinumber /*CHAR(14) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=60) genericnme /*CHAR(60) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) prdpacuom /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) prdpacsize /*DECIMAL(11,3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) ddid /*DECIMAL(6) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=6, sign_reserved) gcn /*DECIMAL(5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) gcnseq /*DECIMAL(6) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=11, sign_reserved) kdc /*DECIMAL(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=8) ahfs /*CHAR(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) drugdeacod /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxotcind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) multsrccde /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) genindover /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) prdreimind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) brndtrdnme /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) fdatheraeq /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) metricstrg /*DECIMAL(11,3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) drgstrguom /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) adminroute /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=4) dosageform /*CHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mntdrugcde /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) thrdpartyx /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) drgunitdos /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) sbmunitdos /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) altprodtyp /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) altprodcde /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) srxnetwrk /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) srxnettype /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) rxnetwork /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) rxnetwrknm /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=9) rxnetcarr /*CHAR(9) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) regioncde /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phraffil /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) netprior /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) nettype /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=6, sign_reserved) netseq /*DECIMAL(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) paycntr /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrndclst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrgpilst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) srvprovidq /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) npiprov /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=12) prvncpdpid /*CHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmsrvprql /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=55) srvprovnme /*CHAR(55) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) provlockql /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) provlockid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) storenbr /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) affiliatin /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=12) payeeid /*CHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) disprclass /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) disprother /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) pharmzip /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) presnetwid /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) prescriber /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) prescridql /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) npiprescr /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) prescdeaid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) preslstnme /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) presfstnme /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) presmdinit /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=6) presspccde /*CHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) presspccdq /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) planqual /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) plnndclist /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) plngpilist /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) plnpndclst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) plnpgpilst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) plandrugst /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) planfrmlry /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) plnfnlpsch /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) phrdcschid /*CHAR(13) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) phrdcschsq /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) cltdcschid /*CHAR(13) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) cltdcschsq /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=14) phrdccscid /*CHAR(14) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) phrdccscsq /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=14) cltdccscid /*CHAR(14) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) cltdccscsq /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) phrprtscid /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) cltprtscid /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrrmschid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltrmschid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) prdpflstid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) prfprdscid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) formulary /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) formlrflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=3, sign_reserved) tiervalue /*DECIMAL(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) contherapy /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=40) message1 /*CHAR(40) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=40) message2 /*CHAR(40) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=40) message3 /*CHAR(40) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=3, sign_reserved) rejcnt /*DECIMAL(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) rejcde1 /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) rejcde2 /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) rejcde3 /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=8) rjcplanid /*CHAR(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) durconflct /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) durintervn /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) duroutcome /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) lvlservice /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) diagnosis /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) diagnosisq /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) rvdurcnflc /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) rvdurintrv /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) rvduroutcm /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) rvlvlservc /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) drgcnflct1 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) severity1 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpharm1 /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) dteprvfil1 /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) qtyprvfil1 /*DECIMAL(11,3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) database1 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpresc1 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) freetext1 /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) drgcnflct2 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) severity2 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpharm2 /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) dteprvfil2 /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) qtyprvfil2 /*DECIMAL(11,3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) database2 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpresc2 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) freetext2 /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) drgcnflct3 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) severity3 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpharm3 /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) dteprvfil3 /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) qtyprvfil3 /*DECIMAL(11,3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) database3 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) othrpresc3 /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) freetext3 /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) feetype /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) awpunitcst /*DECIMAL(13,5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) wacunitcst /*DECIMAL(13,5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) geapuntcst /*DECIMAL(13,5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) ctypeucost /*DECIMAL(13,5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) basiscost /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) priceqty /*DECIMAL(11,3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) prodayssup /*DECIMAL(3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) proqty /*DECIMAL(11,3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rvincntvsb /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmingrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmdispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmpslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmfslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmpatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmamtdue /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmproffee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmtothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=2, sign_reserved) sbmopamtct /*DECIMAL(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmopamtql /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) usualncust /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) denialdte /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) othrpayor /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calingrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) caldispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calfstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) caldueamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calwithhld /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calfcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calprodsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calatrtax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calexcebft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calatrded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calcob /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) caltothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calproffee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calothpaya /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) calcostsrc /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) caladmnfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phringrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrdispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrppstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrfstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrwithhld /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrpprcs /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrprcst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrptps /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) unused1 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrcopaysc /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=3, sign_reserved) phrcopayss /*DECIMAL(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrfcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrprodsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phratrtax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrexcebft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phratrded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrcob /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrtothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrproffee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrothpaya /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) phrcostsrc /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrcosttyp /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) phrprctype /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=7, sign_reserved) phrrate /*DECIMAL(5,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posingrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posdispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posfslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posdueamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) poswithhld /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) poscopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posprodsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posatrtax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posexcebft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posatrded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) postothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posproffee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posothpaya /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) poscostsrc /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) clientflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltingrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltdispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltwithhld /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltprcs /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltprcst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltptps /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) unused2 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltcopays /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=3, sign_reserved) cltcopayss /*DECIMAL(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltfcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltprodsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltfstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltatrtax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltexcebft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltatrded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clttothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltproffee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltcob /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltothpaya /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) cltcostsrc /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltcosttyp /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cltprctype /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=7, sign_reserved) cltrate /*DECIMAL(5,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) cltprscstp /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=18) cltprschnm /*CHAR(18) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltprocfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpatstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltplnstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltprvnsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpscbrnd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpscnonp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltpscbrnp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltcovgap /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltingcstc /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cltdspfeec /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspprocfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppatstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspplnstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspprvnsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppscbrnd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppscnonp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppscbrnp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspcovgap /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspingcstc /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspdspfeec /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) payertype /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) rspreimbur /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspingrcst /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspdispfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspfslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspslstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppatpay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspdueamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspfcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsppcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspcopay /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspprodsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspatrtax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspexcebft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspincentv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspatrded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsptothamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspprofee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspothpaya /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspaccuded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsprembft /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rspremded /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=8) rspplanid /*CHAR(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) inddedptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) inddedrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famdedptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famdedrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) dedsched /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) dedaccc /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) dedflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indlbftut /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indlbftptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indlbftrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famlbftut /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famlbftptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famlbftrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) lftbftmsch /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) lftbftaccc /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) lftbftflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indbftut /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indbmaxptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fambftut /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fambmaxptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indbmaxrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fambmaxrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) bftmaxschd /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) bftmaxaccc /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) bftmaxflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indoopptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famoopptd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) indooprem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) famooprem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) oopsched /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) oopaccc /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) oopflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) contribut /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) contbasis /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) contsched /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) contacccd /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) contflag /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxtflag /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) reimbursmt /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) hldclmflag /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) hldclmdays /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) partdflag /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) cobextflg /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) paextflg /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) hsaextind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) ffpmedrmst /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) ffpmedpxst /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) ffpmedmsst /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=25) incidentid /*CHAR(25) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) etcnbr /*CHAR(30) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) dteinjury /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) adduser /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) chguser /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) dmruserid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) prauserid /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) claimrefid /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) eobdenov /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) eobpdov /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=14) mantrknbr /*CHAR(14) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) manrecvdte /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) pasauthtyp /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) pasauthid /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) pasreqtype /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) pasreqfrom /*DECIMAL(8) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) pasreqthru /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) pasbasisrq /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=12) pasrepfn /*CHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) pasrepln /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=30) passtreet /*CHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) pascity /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) passtate /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) paszip /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) paspanbr /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) pasauthnbr /*CHAR(20) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) passdocct /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) clientdef1 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) clientdef2 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) clientdef3 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) clientdef4 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) clientdef5 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv1 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv2 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv3 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv4 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv5 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv6 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv7 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cctreserv8 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) cctreserv9 /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) cctresrv10 /*CHAR(20) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cctresrv12 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cctresrv13 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cctresrv14 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) userfield /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) messagecd1 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) messagecd2 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) messagecd3 /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=9, sign_reserved) extractdte /*DECIMAL(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=21) batchctrl /*CHAR(21) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) clntid /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) clntsgmnt /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) clntregion /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) pprstate /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmplsrvce /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmpatresd /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) chgdate /*DECIMAL(7) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) chgtime /*DECIMAL(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmcmpdtyp /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmclarcd2 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmclarcd3 /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=11) adminrtesn /*CHAR(11) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) nda /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) anda /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) andaor /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxnormcode /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mntsource /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mntcarpror /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) mntgpilist /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cpqspcprg /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) cpqspcpgin /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) cpqspcschd /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxnetwrkql /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxnetprcql /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=3) prsstate /*CHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) sbmrphid /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) sbmrphidql /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=8) plantype /*CHAR(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) lstqualndc /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) lstqualgpi /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) ctschedid /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) prbasischd /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) regdisor /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) drugststbl /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) transben /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) pharsrvtyp /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) benunitcst /*DECIMAL(13,5) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbmmdpdamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calprocfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpatstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calplnstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calprvnsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpscbrnd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpscnonp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calpscbrnp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calcovgap /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) calingcstc /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) caldspfeec /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrprocfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpatstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrplnstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrprvnsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpscbrnd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpscnonp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrpscbrnp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrcovgap /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phringcstc /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phrdspfeec /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posprocfee /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospatstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posplnstax /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posprvnsel /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospscbrnd /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospscnonp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pospscbrnp /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) poscovgap /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posingcstc /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) posdspfeec /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) cltptpst /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=13) phrptpst /*CHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) benstgql1 /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) benstgamt1 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) benstgql2 /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) benstgamt2 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) benstgql3 /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) benstgamt3 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) benstgql4 /*CHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) benstgamt4 /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) estgensav /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) spdacctrem /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) hlthplnamt /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) delayrsncd /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) medcdind /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) medcdid /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=15) medcdagnbr /*CHAR(15) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=20) medcdtcn /*CHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) fmstier /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) fmsstatus /*CHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) fmsdfltind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmsbenlst /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmslstlvl3 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmslstlvl2 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmslstlvl1 /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmsruleset /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) fmsrule /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=2) fmsproccd /*CHAR(2) NOT NULL*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
}}@0|@85000|165000|70000|105000|60000|60000|17139|Unload - From Iseries|Kimbo Mundy|Built-in 2.2:|1|100|0||6||32769|}}
{2010203004|XXGoport|28|0|64|0|{@{}@129000|129000|11000|11000|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|29|0|67|0|{@{}@94000|164000|11000|11000|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|30|0|69|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|neoview_interface|utility|15|1|Fl|Unload data via api, utility or transporter|{3|api|utility|transporter|}}
{30001002|XXparameter|neoview_interface.condition|param_exact dbms neoview mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|neoview__interface|utility|15|1|Fl|Load data using api, utility, bulkload or transporter|{4|api|utility|bulkload|transporter|}}
{30001002|XXparameter|neoview__interface.condition|param_exact dbms neoview mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_neo|value dbms ims False value dbms neoview False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_neo_or_iqutil|value not_ims_or_neo False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value neoview__interface bulkload True value neoview__interface transporter True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms neoview True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface utility True value nza__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value neoview__interface utility True value neoview__interface api False value neoview__interface transporter False value neoview_interface utility True value neoview_interface api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface utility True value nza__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value neoview__interface utility True value neoview__interface api False value neoview__interface transporter True value neoview_interface utility True value neoview_interface api False value neoview_interface transporter True default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_ims_or_adabas True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas neoview_interface sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface sameas neoview__interface sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_ims_or_adabas True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_ims_or_adabas True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_neo_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_ims_or_adabas True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_ims_or_adabas True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface api True value ims_interface utility False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|FKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface utility True value nza__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|param_exact nza_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|param_exact nza_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|neoview_util_out|value neoview__interface utility True value neoview__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|neoview_util_out.condition|param_exact dbms neoview mode output|3|15|P?|@{0|}}
{30001002|XXparameter|neoview_util_in|value neoview_interface utility True value neoview_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|neoview_util_in.condition|param_exact dbms neoview mode input|3|15|P?|@{0|}}
{30001002|XXparameter|use_neoview_bulk_out|value neoview__interface bulkload True value neoview__interface utility False value neoview__interface api False value neoview__interface transporter False default constant False|13|13|v||{0|}}
{30001002|XXparameter|use_neoview_transporter_out|value neoview__interface transporter True value neoview__interface utility False value neoview__interface api False value neoview__interface bulkload False default constant False|13|13|v||{0|}}
{30001002|XXparameter|use_neoview_transporter_out.condition|param_exact dbms neoview mode output|3|15|P?|@{0|}}
{30001002|XXparameter|use_neoview_transporter_in|value neoview_interface transporter True value neoview_interface utility False value neoview_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|use_neoview_transporter_in.condition|param_exact dbms neoview mode input|3|15|P?|@{0|}}
{30001002|XXparameter|use_neoview_transporter_common|value neoview__interface transporter True value neoview_interface transporter True default constant False|13|13|v||{0|}}
{30001002|XXparameter|use_neoview_transporter_common.condition|param_exact dbms neoview|3|15|P?|@{0|}}
{30001002|XXparameter|insert_rowset_size||1|2|FK$|Number of records to insert in one batch|{0|}}
{30001002|XXparameter|insert_rowset_size.condition|param_exact use_neoview_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|operation|insert|15|1|RFKl|Type of SQL operation|{4|insert|update|upsert|delete|}}
{30001002|XXparameter|operation.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|crossoveryear||1|2|FK$|How to interpret 2-digit year formats|{0|}}
{30001002|XXparameter|crossoveryear.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|enabletriggers|True|13|1|FKl|Determines if triggers are enabled during load|{0|}}
{30001002|XXparameter|enabletriggers.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|forcestaging|False|13|1|FKl|Determines if staging table will be used|{0|}}
{30001002|XXparameter|forcestaging.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|noaudit|False|13|1|FKl|Set to true for non-transactional load|{0|}}
{30001002|XXparameter|noaudit.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|sorted|False|13|1|FKl|Asserts whether input is sorted|{0|}}
{30001002|XXparameter|sorted.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|parallelstreams||1|2|FK$|Number of internal data connections|{0|}}
{30001002|XXparameter|parallelstreams.condition|param_exact use_neoview_transporter_out True|3|15|P?|@{0|}}
{30001002|XXparameter|retries||1|2|FK$|Number of times to retry failed connection attempts|{0|}}
{30001002|XXparameter|retries.condition|param_exact use_neoview_transporter_common True|3|15|P?|@{0|}}
{30001002|XXparameter|rowsetsize||1|2|FK$|Number of records transferred per batch|{0|}}
{30001002|XXparameter|rowsetsize.condition|param_exact use_neoview_transporter_common True|3|15|P?|@{0|}}
{30001002|XXparameter|neoview_tenacity||1|2|FK$|Wait time before retrying failed connection|{0|}}
{30001002|XXparameter|neoview_tenacity.condition|param_exact use_neoview_transporter_common True|3|15|P?|@{0|}}
{30001002|XXparameter|timeout|86400|1|2|FK$|Max wait time for reading from or writing to a pipe|{0|}}
{30001002|XXparameter|timeout.condition|param_exact use_neoview_transporter_common True|3|15|P?|@{0|}}
{30001002|XXparameter|extra_transporter_options_file||17|2|FKf$|Additional lines for transporter control file 'options' section|{0|}}
{30001002|XXparameter|extra_transporter_options_file.condition|param_exact use_neoview_transporter_common True|3|15|P?|@{0|}}
{30001002|XXparameter|neo_util_in|value neoview__interface utility False value neoview__interface api False value neoview_interface utility True value neoview_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|neo_util_out|value neoview__interface utility True value neoview__interface api False value neoview_interface utility False value neoview_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|use_partitioning_table|True|13|1|FKl|If true, specify '-pt <driving table>' to gcmd|{0|}}
{30001002|XXparameter|use_partitioning_table.condition|param_exact neo_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|batchSize||1|2|FK$|batch size (-ts flag to gcmd)|{0|}}
{30001002|XXparameter|batchSize.condition|param_exact neo_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset|@28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset|@28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset|@28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset|@28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset|@28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset|@28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset|@28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset|@28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface utility True value greenplum__interface api False value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data loading (e.g. DIRECT).  Use this carefully to experiment with loading options: there is no guarantee that the modified statement will work or result in a better performance.  Read the database documentation and watch logs to understand the possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_encoding||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ ENCODING 'encoding' ] ...  The value of 'encoding' in the above optional clause, without single quotes.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_encoding.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms db2eee False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|}}
{2010203004|XXGoport|31|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|32|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|33|0|79|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|557000|177500|0|0|0|0|17128|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|34|0|81|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|35|0|84|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|87|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|37|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|38|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|39|0|99|0|{@{}@{1|7606645|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010244001|XXGflow_watcher_watcher|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Clean_File|}1|11|}
{2010211001|XXGvertex_iport_iport|11|0|22|0|{0|write|}11|12|}
{2010214001|XXGiport_src_flow|12|0|24|0|{0|}12|10|}
{2010007001|XXGobject_proto_object|13|0|25|0|{}11|13|}
{2010211001|XXGvertex_iport_iport|14|0|27|0|{0|write|}13|14|}
{2010006001|XXGobject_psameas_object|15|0|29|0|{metadata|write_metadata|1|0|}14|13|}
{2010601001|XXGgraph_vertex_vertex|16|0|30|0|{Normalize_Add_Job_ID_Record_Count|}1|15|}
{2010212001|XXGvertex_oport_oport|17|0|32|0|{0|out|}15|16|}
{2010213001|XXGoport_dst_flow|18|0|34|0|{0|}16|9|}
{2010212001|XXGvertex_oport_oport|19|0|35|0|{1|reject|}15|17|}
{2010212001|XXGvertex_oport_oport|20|0|37|0|{2|error|}15|18|}
{2010212001|XXGvertex_oport_oport|21|0|39|0|{3|log|}15|19|}
{2010211001|XXGvertex_iport_iport|22|0|41|0|{0|in|}15|20|}
{2010214001|XXGiport_src_flow|23|0|43|0|{0|}20|7|}
{2010007001|XXGobject_proto_object|24|0|44|0|{}15|21|}
{2010212001|XXGvertex_oport_oport|25|0|46|0|{0|out|}21|22|}
{2010006001|XXGobject_psameas_object|26|0|48|0|{metadata|out_metadata|1|0|}22|21|}
{2010212001|XXGvertex_oport_oport|27|0|49|0|{1|reject|}21|23|}
{2010006001|XXGobject_psameas_object|28|0|51|0|{metadata|reject_metadata|1|0|}23|21|}
{2010212001|XXGvertex_oport_oport|29|0|52|0|{2|error|}21|24|}
{2010006001|XXGobject_psameas_object|30|0|54|0|{metadata|error_metadata|1|0|}24|21|}
{2010212001|XXGvertex_oport_oport|31|0|55|0|{3|log|}21|25|}
{2010006001|XXGobject_psameas_object|32|0|57|0|{metadata|log_metadata|1|0|}25|21|}
{2010211001|XXGvertex_iport_iport|33|0|58|0|{0|in|}21|26|}
{2010006001|XXGobject_psameas_object|34|0|60|0|{metadata|in_metadata|1|0|}26|21|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{in_metadata|read_metadata|0|0|}15|27|}
{2010212001|XXGvertex_oport_oport|36|0|63|0|{0|read|}27|28|}
{2010213001|XXGoport_dst_flow|37|0|65|0|{0|}28|7|}
{2010212001|XXGvertex_oport_oport|38|0|66|0|{1|log|}27|29|}
{2010007001|XXGobject_proto_object|39|0|68|0|{}27|30|}
{2010212001|XXGvertex_oport_oport|40|0|70|0|{0|read|}30|31|}
{2010006001|XXGobject_psameas_object|41|0|72|0|{metadata|read_metadata|1|0|}31|30|}
{2010212001|XXGvertex_oport_oport|42|0|73|0|{1|log|}30|32|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{metadata|log_metadata|1|0|}32|30|}
{2010006001|XXGobject_psameas_object|44|0|76|0|{out_metadata|write_metadata|0|0|}15|11|}
{2010006001|XXGobject_psameas_object|45|0|77|0|{reject_metadata|out_metadata|0|0|}15|15|}
{2010601001|XXGgraph_vertex_vertex|46|0|78|0|{Partition_by_Round_robin|}1|33|}
{2010212001|XXGvertex_oport_oport|47|0|80|0|{0|out|}33|34|}
{2010213001|XXGoport_dst_flow|48|0|82|0|{0|}34|10|}
{2010211001|XXGvertex_iport_iport|49|0|83|0|{0|in|}33|35|}
{2010214001|XXGiport_src_flow|50|0|85|0|{0|}35|9|}
{2010007001|XXGobject_proto_object|51|0|86|0|{}33|36|}
{2010212001|XXGvertex_oport_oport|52|0|88|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|53|0|90|0|{metadata|out_metadata|1|0|}37|36|}
{2010211001|XXGvertex_iport_iport|54|0|91|0|{0|in|}36|38|}
{2010006001|XXGobject_psameas_object|55|0|93|0|{metadata|in_metadata|1|0|}38|36|}
{2010006001|XXGobject_psameas_object|56|0|94|0|{Layout|Layout|0|0|}33|15|}
{2010006001|XXGobject_psameas_object|57|0|95|0|{in_metadata|write_metadata|0|0|}33|11|}
{2010006001|XXGobject_psameas_object|58|0|96|0|{out_metadata|write_metadata|0|0|}33|11|}
{2010601001|XXGgraph_vertex_vertex|59|0|97|0|{Unload_From_Iseries|}1|27|}
{2010109001|XXGobject_property_value|60|0|98|0|{0|TrackingThumbprint|72|}1|39|}
