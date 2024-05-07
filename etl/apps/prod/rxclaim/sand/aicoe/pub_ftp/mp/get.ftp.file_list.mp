@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|186|rel_count|326|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|GET_PHASE|$AI_PHASE|15|9|FK||{4|dev|qa|uat|prod|}}
{30001002|XXparameter|PROTOCOL|GET_PHASE|3|10|FKd||{0|}}
{30001002|XXparameter|PROTOCOL:dev|sftp|3|2|$|@{0|}}
{30001002|XXparameter|PROTOCOL:qa|sftp|3|2|$|@{0|}}
{30001002|XXparameter|PROTOCOL:uat|sftp|3|2|$|@{0|}}
{30001002|XXparameter|PROTOCOL:prod|ftp|3|2|$|@{0|}}
{30001002|XXparameter|FTP_HOST|GET_PHASE|3|10|RFKd||{0|}}
{30001002|XXparameter|FTP_HOST:dev|ashttabqa01|3|9||@{0|}}
{30001002|XXparameter|FTP_HOST:qa|ashttabqa01|3|9||@{0|}}
{30001002|XXparameter|FTP_HOST:uat|ashttabqa01|3|9||@{0|}}
{30001002|XXparameter|FTP_HOST:prod|ftp.argushealth.com|3|9||@{0|}}
{30001002|XXparameter|FTP_USER|GET_PHASE|3|10|RFKd||{0|}}
{30001002|XXparameter|FTP_USER:dev|abi|3|9||@{0|}}
{30001002|XXparameter|FTP_USER:qa|abi|3|9||@{0|}}
{30001002|XXparameter|FTP_USER:uat|abi|3|9||@{0|}}
{30001002|XXparameter|FTP_USER:prod|some user|3|9||@{0|}}
{30001002|XXparameter|FTP_EPW|GET_PHASE|3|10|RFKd||{0|}}
{30001002|XXparameter|FTP_EPW:dev|YL1iJ9q3lZ6ruRWNyNvw0s|3|9||@{0|}}
{30001002|XXparameter|FTP_EPW:qa|YL1iJ9q3lZ6ruRWNyNvw0s|3|9||@{0|}}
{30001002|XXparameter|FTP_EPW:uat|YL1iJ9q3lZ6ruRWNyNvw0s|3|9||@{0|}}
{30001002|XXparameter|FTP_EPW:prod|some encrypted password|3|9||@{0|}}
{30001002|XXparameter|DATA_DATE|20131023|3|2|RFK$||{0|}}
{30001002|XXparameter|FILE_PATTERN|^BRAND_GENERIC_(\\d\{14\})\\.zip$|3|3|RFKc||{0|}}
{30001002|XXparameter|LOGICAL_FILENAME|brand_generic|3|9|RFK||{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS|GET_PHASE|3|10|RFKd||{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS:dev|/app02/abinitio/ftp/argus/PCT/Daily/$[(date('yyyymmdd'))(START_DATE - 5)]/|3|9||@{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS:qa|/app02/abinitio/ftp/argus/PCT/Daily/$[(date('yyyymmdd'))(START_DATE - 5)]/|3|9||@{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS:uat|/app02/abinitio/ftp/argus/PCT/Daily/$[(date('yyyymmdd'))(START_DATE - 5)]/|3|9||@{0|}}
{30001002|XXparameter|FTP_FILE_LOCATIONS:prod|/PCT/Daily/$[(date('yyyymmdd'))(START_DATE - 5)]/|3|9||@{0|}}
{30001002|XXparameter|SFTP_FILE_LOCATIONS|$[string_join(for (let loc in re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")): 'ls  '+ loc, '\\n')]|3|9|RK||{0|}}
{30001002|XXparameter|SFTP_FILE_LOCATIONS_LONG|$[string_join(for (let loc in re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")): 'ls -l '+ loc, '\\n')]|3|9|RK||{0|}}
{30001002|XXparameter|PGP_PASS_PHRASE||3|9|FK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_Normalize_File_Vector|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Create_Vector_of_Files_That_Match_FILE_PATTERN|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filenames|@34|9|FHK|@{0|}}
{30001002|XXparameter|ZIP_PASS_PHRASE||3|2|FK$||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|DATE_LOGIC_FORMAT|'yymmdd'|3|2|RFK$||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP/$AB_PSET_NAME.$DATA_DATE|3|2|RFK$||{0|}}
{30001002|XXparameter|_parameters_of_FTP_file_list|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_file_list|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Gather|@34|9|FHK|@{0|}}
{30001002|XXparameter|FTP_FUSE_XFR|$AI_XFR/get.ftp.sxc.ftp_fuse.xfr|3|2|RFK$||{0|}}
{30001002|XXparameter|_parameters_of_Reformat|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.1.5.5|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|752000|404000|0|get.ftp.file_list|davidmiller||1|10|0||6||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|751000|404000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.7|{1|1|}Job 'get.ftp.file_list' Execution Status Report

||||@|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Normal - 3.5||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{12|158000|69000|178000|69000|211000|69000|211000|109000|245000|109000|266000|109000|}6444|529|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{12|576000|114000|596000|114000|596000|231000|274000|231000|274000|349000|295000|349000|}6454|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{12|168000|159000|188000|159000|216000|159000|216000|119000|245000|119000|266000|119000|}6451|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{8|432000|349000|452000|349000|459000|349000|480000|349000|}6447|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{8|337000|114000|357000|114000|375000|114000|396000|114000|}6453|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{8|627000|349000|647000|349000|653000|349000|674000|349000|}6449|17|}}
{2010501005|XXGpvertex|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|type file_type = record
  string(int) path;
  string(int) filename;
  datetime('YYYY-MM-DD HH24:MI') last_modified;
  decimal('') file_size;
end;

out::rollup(in)=
begin
  let string('\\n')[int] path_vec_unix;
  let string('\\n')[int] path_vec_windows;
  let string('\\n') unix_file;
  let string('\\n') windows_file;
  let string('\\n') file;
  let string(int) file_pattern = $["'" + string_replace(FILE_PATTERN, '\\\\', '\\\\\\\\') + "'"];
  let file_type f;
  let file_type[int] output = allocate();
  for (f in in.filenames)
  begin
    /* Check if file is on unix or windows */
    path_vec_unix = string_split(f.filename, '/');
    path_vec_windows = string_split(f.filename, '\\\\');
    unix_file = path_vec_unix[length_of(path_vec_unix) - 1];
    windows_file = path_vec_windows[length_of(path_vec_windows) - 1];
    file = if (length_of(unix_file) > length_of(windows_file)) windows_file else unix_file;
    
    if(re_index(file, file_pattern) != 0 or re_index(f.path + file, file_pattern) != 0 )
      output = vector_append(output, [record path f.path, filename file, last_modified f.last_modified, file_size f.file_size]);
  end
  
  out.filenames :: vector_concatenation(output);
end;|3|9||@{0|}}
{30001002|XXparameter|max_core|367108864|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  record
    string(int) path;
    string(int) filename;
    datetime('YYYY-MM-DD HH24:MI') last_modified;
    decimal('') file_size;
  end[int] filenames;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@387075|33075|407000|53000|159000|127000|6455|Create Vector of Files That Match FILE_PATTERN|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|12|0|23|0|{@{}@565000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|13|0|26|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|14|0|28|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|15|0|30|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|16|0|32|0|{@{}@397000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|17|0|35|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional int out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional int out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|int input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|int output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
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
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|18|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|19|0|40|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|20|0|43|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|21|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|22|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|23|0|52|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$WORKDIR/get.ftp_filenames.$LOGICAL_FILENAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/get.ftp_filenames.$LOGICAL_FILENAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
  string('\\n') physical_filename;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@663473|304903|685000|325000|56000|50000|6450|Filenames|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|24|0|54|0|{@{}@675000|344000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|25|0|57|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|26|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|27|0|62|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$FTP_FUSE_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|record
  record
    string(int) path;
    string(int) filename;
    datetime('YYYY-MM-DD HH24:MI') last_modified;
    decimal('') file_size;
  end[int] filenames;
end|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@738000|250000|758000|270000|90000|69000|6248|Fuse|Ab Initio Software|Built-in 2.10:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|64|0|{@{}@847000|299000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|29|0|66|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|30|0|68|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|31|0|70|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|32|0|72|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|33|0|74|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|76|0|{@{}@748000|284000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010210004|XXGflow|35|0|78|0|{@{}@384|.5|.5|{12|552000|279000|572000|279000|649000|279000|649000|289000|726000|289000|747000|289000|}6246|1041|}}
{2010202004|XXGiport|36|0|80|0|{@{}@748000|314000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010210004|XXGflow|37|0|82|0|{@{}@384|.5|0.0|{12|281000|289000|301000|289000|301000|289000|301000|319000|716000|319000|747000|319000|}6247|1041|}}
{2010501005|XXGpvertex|38|0|84|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|39|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|40|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|42|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|43|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|44|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|46|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|47|0|111|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|filename :: get_filename(in) =
begin
  filename :: in.file_name;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|input_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|read_as_single_record|True|3|1|l|@{0|}}
{30001002|XXparameter|rhost|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|epw|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|options|-longlist -tolerate-error-codes 450|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|string(big endian integer(8))|3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/FTP/FTP_Multiple_From.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
}}@0|@422000|230000|442000|250000|100000|60000|6240|Get Directory Listing|Ab Initio Software|Built-in 2.15.2.r24:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|48|0|113|0|{@{}@541000|274000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|49|0|116|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|50|0|118|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|51|0|120|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|52|0|122|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|53|0|124|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|126|0|{@{}@432000|274000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|55|0|128|0|{@{}@384|.5|.5|{8|281000|279000|311000|279000|410000|279000|431000|279000|}6238|17|}}
{2010501005|XXGpvertex|56|0|130|0|{Transfers multiple files with data records from a computer not running the Co>Operating System.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|ftp-multiple-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|filter|None (Read all records)|15|1|Fl|Limits the number of records read from each file|{2|None (Read all records)|Range (Read a subset of records from each file)|}}
{30001002|XXparameter|skip_count|0|1|2|FK$|Number of initial records to skip|{0|}}
{30001002|XXparameter|skip_count.display_name|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.keyword|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|read_count|0|1|2|FK$|Number of records to read from each file|{0|}}
{30001002|XXparameter|read_count.display_name|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.keyword|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
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
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is empty|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if FTP can not initiate the transfer (connected but the input file is missing, not readable or otherwise unavailable)|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if FTP can not initiate the transfer (connected but file is missing, not readable or otherwise unavailable)|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading records from the input file (FTP transfer successful, but the contents have have errors)|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation3|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation3_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|rhost||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|type|-binary|15|1|RFOl|Type of file transfer, use -ascii or -binary|{2|-binary|-ascii|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|pw||3|2|FK$|Remote password|{0|}}
{30001002|XXparameter|epw||3|2|FK$|Encrypted remote password|{0|}}
{30001002|XXparameter|acct||3|2|FK$|Remote account password|{0|}}
{30001002|XXparameter|passive|True|13|1|FKl|Connect to FTP server in passive mode|{0|}}
{30001002|XXparameter|port||1|2|FK$|FTP server port if non-default|{0|}}
{30001002|XXparameter|ssl|False|13|1|Fl|Use SSL/TLS to secure FTP|{0|}}
{30001002|XXparameter|ssl.condition|version 2.15.4.r31:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_control_protection|explicit-ssl|15|1|FKl|Whether and how to protect the control channel (including login) with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_control_protection.display_name|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.keyword|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_data_protection|no-ssl|15|1|FKl|Whether and how to protect FTP data transfers with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_data_protection.display_name|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.keyword|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|options||16|2|FO$|Additional component options|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation4|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655964|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|57|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|58|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|59|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|60|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|61|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|62|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|63|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|64|0|154|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(re_split(FTP_FILE_LOCATIONS, "[\\r\\n]+")) ]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] file_name_vec = re_split("$\{FTP_FILE_LOCATIONS\}", "[\\r\\n]+");

out :: create(index) =
begin
  out.file_name :: file_name_vec[index - 1];
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file_name;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
}}@0|@35000|236023|55000|256000|60000|60000|6250|Enumerate Locations|Ab Initio Software|Built-in 2.15.2:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|156|0|{@{}@114000|279000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|66|0|158|0|{@{}@384|.5|.5|{8|125000|284000|145000|284000|189000|284000|210000|284000|}6249|17|}}
{2010203004|XXGoport|67|0|160|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|68|0|162|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|69|0|164|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|FHO$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|FHO$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|FHO$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|FHO$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(integer(8) index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655977|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|70|0|166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|72|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|73|0|180|0|{Subgraph created from graph "get.ftp.ftp_list"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Get_Directory_Listing|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Fuse|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Enumerate_Locations|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate|@34|9|FHK|@{0|}}
{30001002|XXparameter|condition|$[PROTOCOL == 'ftp']|3|9|F||{0|}}
}}@0|@11500|12500|32000|33000|934000|586000|6445|FTP file list|davidmiller||1|100|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.12433011829853058|933000|586000|7|}}
{2010501005|XXGpvertex|74|0|189|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@211000|253000|221000|262000|50000|41000|6226|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|191|0|{@{}@270000|274000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|76|0|195|0|{@{}@211000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|77|0|198|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|78|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|79|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|80|0|209|0|{@{}@147000|64000|11000|11000|out0|.5|@@@14736|0|}}
{2010501005|XXGpvertex|81|0|214|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@267000|84000|277000|93000|50000|41000|6277|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|82|0|216|0|{@{}@326000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|83|0|219|0|{@{}@267000|104000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|84|0|223|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|85|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|86|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|87|0|234|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
  out :: length_of(in.filenames);
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.ftp_host :: $[ "'" + FTP_HOST + "'"];
  out.ftp_user :: $[ "'" + FTP_USER + "'"];
  out.ftp_epw :: $[ "'" + FTP_EPW + "'"];
  out.ftp_path :: in.filenames[index].path;
  out.physical_filename:: in.filenames[index].filename;
  out.file_size :: in.filenames[index].file_size;
  out.last_modified :: in.filenames[index].last_modified;
  out.logical_filename :: $[ "'" + LOGICAL_FILENAME + "'"];
  out.sequence :: next_in_sequence();
  out.pgp_pass_phrase :: $[ "'" + PGP_PASS_PHRASE + "'"];
  out.protocol :: $[ "'" + PROTOCOL + "'"];
  out.zip_pass_phrase :: $[ "'" + ZIP_PASS_PHRASE + "'"];
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$PUB_FTP_DML/get.file_list.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@285774|276903|306000|297000|116000|107000|6448|Normalize File Vector|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|236|0|{@{}@421000|344000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|89|0|239|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|241|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|91|0|243|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|245|0|{@{}@296000|344000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|93|0|248|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655976|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|94|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|95|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|96|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|97|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|98|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|99|0|268|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.physical_filename :: string_concat(in.ftp_path,in.physical_filename);
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@471000|296500|491000|317000|126000|69000|6432|Reformat|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|270|0|{@{}@616000|344000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|101|0|273|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|102|0|275|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|103|0|277|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|279|0|{@{}@481000|344000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|282|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052550|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|107|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|108|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|109|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|110|0|297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|111|0|304|0|{Subgraph created from graph "get.ftp.ftp_list"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_parameters_of_Filter_by_Expression|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_From_short_list_|@34|9|FHK|@{0|}}
{30001002|XXparameter|condition|$[PROTOCOL == 'sftp']|3|9|F||{0|}}
{30001002|XXparameter|_parameters_of__dev_null|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of__dev_null_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_SFTP_From_long_list_|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filter_by_Expression_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Fuse|@34|9|FHK|@{0|}}
}}@0|@11500|96500|32000|119000|1068000|690000|6452|SFTP file list|davidmiller||1|100|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.11808809638023376|1067000|689000|7|}}
{2010210004|XXGflow|112|0|306|0|{@{}@384|.5|.5|{8|165000|114000|185000|114000|304000|114000|325000|114000|}6333|17|}}
{2010210004|XXGflow|113|0|308|0|{@{}@384|.5|.5|{8|150000|364000|170000|364000|279000|364000|300000|364000|}6330|17|}}
{2010210004|XXGflow|114|0|310|0|{@{}@384|.5|.5|{12|345000|484000|365000|484000|465000|484000|465000|269000|565000|269000|586000|269000|}6328|17|}}
{2010210004|XXGflow|115|0|312|0|{@{}@384|.5|.5|{12|345000|244000|365000|244000|460000|244000|460000|239000|555000|239000|586000|239000|}6327|17|}}
{2010210004|XXGflow|116|0|314|0|{@{}@384|.5|.5|{10|104000|156000|104000|176000|104000|244000|171000|244000|192000|244000|}6334|17|}}
{2010210004|XXGflow|117|0|316|0|{@{}@384|.5|.5|{10|89000|406000|89000|426000|89000|484000|156000|484000|177000|484000|}6331|17|}}
{2010501005|XXGpvertex|118|0|318|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|event_type == 'reply'|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@183000|181000|203000|201000|132000|89000|6324|Filter by Expression|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|320|0|{@{}@334000|239000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|120|0|323|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|121|0|325|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|122|0|327|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|123|0|329|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|331|0|{@{}@193000|239000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|125|0|334|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
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
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|126|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|127|0|339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|128|0|342|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|129|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|130|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|131|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|132|0|355|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|source_file|$SFTP_FILE_LOCATIONS|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|program|$PUB_FTP_BIN/sftp.ksh|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-get-ls.script|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_From.mpc|3|2|Pf$|@{0|}}
}}@0|@35000|66000|55000|86000|100000|60000|6335|SFTP From (short list)|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|133|0|357|0|{@{}@154000|109000|11000|11000|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|134|0|360|0|{@{}@99000|145000|11000|11000|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|135|0|363|0|{Transfers files of data records from a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|source_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|source_file.display_name|source-file|3|9|P|@{0|}}
{30001002|XXparameter|source_file.keyword|source-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|136|0|365|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|137|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|138|0|374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|event_type == 'reply'|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@168000|421000|188000|441000|147000|89000|6321|Filter by Expression-1|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|139|0|376|0|{@{}@334000|479000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|140|0|379|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|141|0|381|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|142|0|383|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|143|0|385|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|144|0|387|0|{@{}@178000|479000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|145|0|390|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
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
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|146|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|147|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|148|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|149|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|150|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|151|0|407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|152|0|411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|source_file|$SFTP_FILE_LOCATIONS_LONG|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|program|$PUB_FTP_BIN/sftp.ksh|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-get-ls.script|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_From.mpc|3|2|Pf$|@{0|}}
}}@0|@20000|316000|40000|336000|100000|60000|6332|SFTP From (long list)|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|413|0|{@{}@139000|359000|11000|11000|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|154|0|416|0|{@{}@84000|395000|11000|11000|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|155|0|419|0|{Transfers files of data records from a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|source_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|source_file.display_name|source-file|3|9|P|@{0|}}
{30001002|XXparameter|source_file.keyword|source-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|156|0|421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|157|0|424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|158|0|430|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/*Function combining one record from each input to produce one record on the output.*/
out::fuse(in0,in1)=
begin
  let string(int)[int] short_reply = if (is_defined(in0)) string_split(in0.event_text, '\\r\\n') else [vector];
  let string(int)[int] short_filenames = if (is_defined(in0)) vector_slice(for (let line in short_reply): if (!starts_with(line, 'sftp> ls')) line, 1, length_of(short_reply)) else [vector];
  let string(int)[int] long_reply = if (is_defined(in1)) string_split(in1.event_text, '\\r\\n') else [vector];
  let string(int)[int] long_filenames = if (is_defined(in1)) vector_slice(for (let line in long_reply): if (!starts_with(line, 'sftp> ls')) line, 1, length_of(long_reply)) else [vector];
  let   record
    string(int) path;
    string(int) filename;
    datetime('YYYY-MM-DD HH24:MI') last_modified;
    decimal('') file_size;
  end[int] filenames = allocate();
  
  for (let int i, i < length_of(short_filenames))
    if (!is_blank(short_filenames[i]))
    begin
      let string(int)[int] matches = re_get_matches(long_filenames[i], '.\{10\}[[:space:]]+[[:digit:]]+[[:space:]]+[[:alnum:]]+[[:space:]]+[[:alnum:]]+[[:space:]]+([[:digit:]]+)[[:space:]]+([[:alpha:]]\{3\}[[:space:]]+[[:digit:]]\{1,2\}[[:space:]]+(?:[[:digit:]]\{4\}\|(?:[[:digit:]]\{2\}:[[:digit:]]\{2\})))[[:space:]]+(.+)');
      let decimal('') size = (decimal(''))matches[1];
      let string(int) filename = matches[3];
      let string(int)[int] last_modified_matches = re_get_matches(matches[2], '([[:alpha:]]\{3\})[[:space:]]+([[:digit:]]\{1,2\})[[:space:]]+([[:digit:]]\{4\}\|(?:([[:digit:]]\{2\}):([[:digit:]]\{2\})))');
      let long last_modified_month = date_month((date('MMM'))last_modified_matches[1]);
      let long last_modified_day = (decimal(''))last_modified_matches[2];
      let long last_modified_year = if (length_of(last_modified_matches) == 4) (decimal(''))last_modified_matches[3] else date_year(today1());
      let long last_modified_hour = if (length_of(last_modified_matches) == 6) (decimal(''))last_modified_matches[4] else 0;
      let long last_modified_minute = if (length_of(last_modified_matches) == 6) (decimal(''))last_modified_matches[5] else 0;
      let datetime('YYYY-MM-DD HH24:MI') last_modified = encode_datetime(last_modified_year, last_modified_month, last_modified_day, last_modified_hour, last_modified_minute);
    
      filenames = vector_append(filenames, [record path re_match_replace(short_filenames[i], '(.*/)(.*)', '$1' ), filename filename, last_modified last_modified, file_size size]);
    end
  
  out.filenames :: filenames;
end;|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@577000|198000|597000|218000|90000|69000|6329|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|159|0|432|0|{@{}@686000|249000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|160|0|434|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|161|0|436|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|162|0|438|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|163|0|440|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|164|0|442|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|165|0|444|0|{@{}@587000|234000|11000|11000|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|166|0|447|0|{@{}@587000|264000|11000|11000|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|167|0|450|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|168|0|452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|169|0|455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|170|0|458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|171|0|461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|172|0|464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|173|0|467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|470|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|175|0|473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010503005|XXGfvertex|176|0|484|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/dev/null|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/dev/null", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@314000|68000|336000|88000|56000|50000|6326|/dev/null|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|177|0|486|0|{@{}@326000|109000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|178|0|489|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|179|0|491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|180|0|495|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/dev/null|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/dev/null", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@289000|318000|311000|338000|56000|50000|6289|/dev/null-1|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|181|0|497|0|{@{}@301000|359000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|182|0|500|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|183|0|502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|184|0|506|0|{@{}@157000|154000|11000|11000|out0|.5|@@@14736|0|}}
{2010110002|XXGconstant|185|0|510|0|{@{}@{1|4358955|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_5|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_6|}1|10|}
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Create_Vector_of_Files_That_Match_FILE_PATTERN|}1|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{0|out|}11|12|}
{2010213001|XXGoport_dst_flow|12|0|24|0|{0|}12|6|}
{2010212001|XXGvertex_oport_oport|13|0|25|0|{1|reject|}11|13|}
{2010212001|XXGvertex_oport_oport|14|0|27|0|{2|error|}11|14|}
{2010212001|XXGvertex_oport_oport|15|0|29|0|{3|log|}11|15|}
{2010211001|XXGvertex_iport_iport|16|0|31|0|{0|in|}11|16|}
{2010214001|XXGiport_src_flow|17|0|33|0|{0|}16|9|}
{2010007001|XXGobject_proto_object|18|0|34|0|{}11|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{0|out|}17|18|}
{2010006001|XXGobject_psameas_object|20|0|38|0|{metadata|out_metadata|1|0|}18|17|}
{2010212001|XXGvertex_oport_oport|21|0|39|0|{1|reject|}17|19|}
{2010006001|XXGobject_psameas_object|22|0|41|0|{metadata|reject_metadata|1|0|}19|17|}
{2010212001|XXGvertex_oport_oport|23|0|42|0|{2|error|}17|20|}
{2010006001|XXGobject_psameas_object|24|0|44|0|{metadata|error_metadata|1|0|}20|17|}
{2010212001|XXGvertex_oport_oport|25|0|45|0|{3|log|}17|21|}
{2010006001|XXGobject_psameas_object|26|0|47|0|{metadata|log_metadata|1|0|}21|17|}
{2010211001|XXGvertex_iport_iport|27|0|48|0|{0|in|}17|22|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{metadata|in_metadata|1|0|}22|17|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{Layout|Layout|0|0|}11|23|}
{2010211001|XXGvertex_iport_iport|30|0|53|0|{0|write|}23|24|}
{2010214001|XXGiport_src_flow|31|0|55|0|{0|}24|10|}
{2010007001|XXGobject_proto_object|32|0|56|0|{}23|25|}
{2010211001|XXGvertex_iport_iport|33|0|58|0|{0|write|}25|26|}
{2010006001|XXGobject_psameas_object|34|0|60|0|{metadata|write_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{in_metadata|out_metadata|0|0|}11|27|}
{2010212001|XXGvertex_oport_oport|36|0|63|0|{0|out|}27|28|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{1|reject0|}27|29|}
{2010212001|XXGvertex_oport_oport|38|0|67|0|{2|reject1|}27|30|}
{2010212001|XXGvertex_oport_oport|39|0|69|0|{3|error0|}27|31|}
{2010212001|XXGvertex_oport_oport|40|0|71|0|{4|error1|}27|32|}
{2010212001|XXGvertex_oport_oport|41|0|73|0|{5|log|}27|33|}
{2010211001|XXGvertex_iport_iport|42|0|75|0|{0|in0|}27|34|}
{2010214001|XXGiport_src_flow|43|0|77|0|{0|}34|35|}
{2010211001|XXGvertex_iport_iport|44|0|79|0|{1|in1|}27|36|}
{2010214001|XXGiport_src_flow|45|0|81|0|{0|}36|37|}
{2010007001|XXGobject_proto_object|46|0|83|0|{}27|38|}
{2010212001|XXGvertex_oport_oport|47|0|85|0|{0|out|}38|39|}
{2010006001|XXGobject_psameas_object|48|0|87|0|{metadata|out_metadata|1|0|}39|38|}
{2010212001|XXGvertex_oport_oport|49|0|88|0|{1|reject0|}38|40|}
{2010006001|XXGobject_psameas_object|50|0|90|0|{metadata|reject0_metadata|1|0|}40|38|}
{2010212001|XXGvertex_oport_oport|51|0|91|0|{2|reject1|}38|41|}
{2010006001|XXGobject_psameas_object|52|0|93|0|{metadata|reject1_metadata|1|0|}41|38|}
{2010212001|XXGvertex_oport_oport|53|0|94|0|{3|error0|}38|42|}
{2010006001|XXGobject_psameas_object|54|0|96|0|{metadata|error0_metadata|1|0|}42|38|}
{2010212001|XXGvertex_oport_oport|55|0|97|0|{4|error1|}38|43|}
{2010006001|XXGobject_psameas_object|56|0|99|0|{metadata|error1_metadata|1|0|}43|38|}
{2010212001|XXGvertex_oport_oport|57|0|100|0|{5|log|}38|44|}
{2010006001|XXGobject_psameas_object|58|0|102|0|{metadata|log_metadata|1|0|}44|38|}
{2010211001|XXGvertex_iport_iport|59|0|103|0|{0|in0|}38|45|}
{2010006001|XXGobject_psameas_object|60|0|105|0|{metadata|in0_metadata|1|0|}45|38|}
{2010211001|XXGvertex_iport_iport|61|0|106|0|{1|in1|}38|46|}
{2010006001|XXGobject_psameas_object|62|0|108|0|{metadata|in1_metadata|1|0|}46|38|}
{2010006001|XXGobject_psameas_object|63|0|109|0|{Layout|Layout|0|0|}27|23|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{in0_metadata|out_metadata|0|0|}27|47|}
{2010212001|XXGvertex_oport_oport|65|0|112|0|{0|out|}47|48|}
{2010213001|XXGoport_dst_flow|66|0|114|0|{0|}48|35|}
{2010212001|XXGvertex_oport_oport|67|0|115|0|{1|filereject|}47|49|}
{2010212001|XXGvertex_oport_oport|68|0|117|0|{2|fileerror|}47|50|}
{2010212001|XXGvertex_oport_oport|69|0|119|0|{3|reject|}47|51|}
{2010212001|XXGvertex_oport_oport|70|0|121|0|{4|error|}47|52|}
{2010212001|XXGvertex_oport_oport|71|0|123|0|{5|log|}47|53|}
{2010211001|XXGvertex_iport_iport|72|0|125|0|{0|in|}47|54|}
{2010214001|XXGiport_src_flow|73|0|127|0|{0|}54|55|}
{2010007001|XXGobject_proto_object|74|0|129|0|{}47|56|}
{2010212001|XXGvertex_oport_oport|75|0|131|0|{0|out|}56|57|}
{2010006001|XXGobject_psameas_object|76|0|133|0|{metadata|out_metadata|1|0|}57|56|}
{2010212001|XXGvertex_oport_oport|77|0|134|0|{1|filereject|}56|58|}
{2010006001|XXGobject_psameas_object|78|0|136|0|{metadata|filereject_metadata|1|0|}58|56|}
{2010212001|XXGvertex_oport_oport|79|0|137|0|{2|fileerror|}56|59|}
{2010006001|XXGobject_psameas_object|80|0|139|0|{metadata|fileerror_metadata|1|0|}59|56|}
{2010212001|XXGvertex_oport_oport|81|0|140|0|{3|reject|}56|60|}
{2010006001|XXGobject_psameas_object|82|0|142|0|{metadata|reject_metadata|1|0|}60|56|}
{2010212001|XXGvertex_oport_oport|83|0|143|0|{4|error|}56|61|}
{2010006001|XXGobject_psameas_object|84|0|145|0|{metadata|error_metadata|1|0|}61|56|}
{2010212001|XXGvertex_oport_oport|85|0|146|0|{5|log|}56|62|}
{2010006001|XXGobject_psameas_object|86|0|148|0|{metadata|log_metadata|1|0|}62|56|}
{2010211001|XXGvertex_iport_iport|87|0|149|0|{0|in|}56|63|}
{2010006001|XXGobject_psameas_object|88|0|151|0|{metadata|in_metadata|1|0|}63|56|}
{2010006001|XXGobject_psameas_object|89|0|152|0|{Layout|Layout|0|0|}47|23|}
{2010006001|XXGobject_psameas_object|90|0|153|0|{filereject_metadata|out_metadata|0|0|}47|64|}
{2010212001|XXGvertex_oport_oport|91|0|155|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|92|0|157|0|{0|}65|66|}
{2010212001|XXGvertex_oport_oport|93|0|159|0|{1|error|}64|67|}
{2010212001|XXGvertex_oport_oport|94|0|161|0|{2|log|}64|68|}
{2010007001|XXGobject_proto_object|95|0|163|0|{}64|69|}
{2010212001|XXGvertex_oport_oport|96|0|165|0|{0|out|}69|70|}
{2010006001|XXGobject_psameas_object|97|0|167|0|{metadata|out_metadata|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|98|0|168|0|{1|error|}69|71|}
{2010006001|XXGobject_psameas_object|99|0|170|0|{metadata|error_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|100|0|171|0|{2|log|}69|72|}
{2010006001|XXGobject_psameas_object|101|0|173|0|{metadata|log_metadata|1|0|}72|69|}
{2010006001|XXGobject_psameas_object|102|0|174|0|{in_metadata|out_metadata|0|0|}47|64|}
{2010006001|XXGobject_psameas_object|103|0|175|0|{in1_metadata|out_metadata|0|0|}27|64|}
{2010006001|XXGobject_psameas_object|104|0|176|0|{reject0_metadata|out_metadata|0|0|}27|47|}
{2010006001|XXGobject_psameas_object|105|0|177|0|{reject1_metadata|out_metadata|0|0|}27|64|}
{2010006001|XXGobject_psameas_object|106|0|178|0|{reject_metadata|out_metadata|0|0|}11|27|}
{2010601001|XXGgraph_vertex_vertex|107|0|179|0|{FTP_file_list|}1|73|}
{2010604001|XXGgraph_flow_flow|108|0|181|0|{Flow_3|}73|35|}
{2010604001|XXGgraph_flow_flow|109|0|182|0|{Flow_5|}73|66|}
{2010604001|XXGgraph_flow_flow|110|0|183|0|{Flow_6|}73|55|}
{2010604001|XXGgraph_flow_flow|111|0|184|0|{Flow_7|}73|37|}
{2010601001|XXGgraph_vertex_vertex|112|0|185|0|{Enumerate_Locations|}73|64|}
{2010601001|XXGgraph_vertex_vertex|113|0|186|0|{Fuse|}73|27|}
{2010601001|XXGgraph_vertex_vertex|114|0|187|0|{Get_Directory_Listing|}73|47|}
{2010601001|XXGgraph_vertex_vertex|115|0|188|0|{Replicate|}73|74|}
{2010212001|XXGvertex_oport_oport|116|0|190|0|{0|out|}74|75|}
{2010213001|XXGoport_dst_flow|117|0|192|0|{0|}75|55|}
{2010213001|XXGoport_dst_flow|118|0|193|0|{1|}75|37|}
{2010211001|XXGvertex_iport_iport|119|0|194|0|{0|in|}74|76|}
{2010214001|XXGiport_src_flow|120|0|196|0|{0|}76|66|}
{2010007001|XXGobject_proto_object|121|0|197|0|{}74|77|}
{2010212001|XXGvertex_oport_oport|122|0|199|0|{0|out|}77|78|}
{2010006001|XXGobject_psameas_object|123|0|201|0|{metadata|out_metadata|1|0|}78|77|}
{2010211001|XXGvertex_iport_iport|124|0|202|0|{0|in|}77|79|}
{2010006001|XXGobject_psameas_object|125|0|204|0|{metadata|in_metadata|1|0|}79|77|}
{2010006001|XXGobject_psameas_object|126|0|205|0|{Layout|Layout|0|0|}74|23|}
{2010006001|XXGobject_psameas_object|127|0|206|0|{in_metadata|out_metadata|0|0|}74|64|}
{2010006001|XXGobject_psameas_object|128|0|207|0|{out_metadata|out_metadata|0|0|}74|64|}
{2010212001|XXGvertex_oport_oport|129|0|208|0|{0|out0|}73|80|}
{2010216002|XXGoport_binding_oport|130|0|210|0|{.5|.5|{12|857000|304000|877000|304000|904000|304000|904000|314000|931000|314000|951000|314000|}0|}80|28|}
{2010213001|XXGoport_dst_flow|131|0|211|0|{0|}80|5|}
{2010601001|XXGgraph_vertex_vertex|132|0|212|0|{Filenames|}1|23|}
{2010601001|XXGgraph_vertex_vertex|133|0|213|0|{Gather|}1|81|}
{2010212001|XXGvertex_oport_oport|134|0|215|0|{0|out|}81|82|}
{2010213001|XXGoport_dst_flow|135|0|217|0|{0|}82|9|}
{2010211001|XXGvertex_iport_iport|136|0|218|0|{0|in|}81|83|}
{2010214001|XXGiport_src_flow|137|0|220|0|{0|}83|5|}
{2010214001|XXGiport_src_flow|138|0|221|0|{1|}83|7|}
{2010007001|XXGobject_proto_object|139|0|222|0|{}81|84|}
{2010212001|XXGvertex_oport_oport|140|0|224|0|{0|out|}84|85|}
{2010006001|XXGobject_psameas_object|141|0|226|0|{metadata|out_metadata|1|0|}85|84|}
{2010211001|XXGvertex_iport_iport|142|0|227|0|{0|in|}84|86|}
{2010006001|XXGobject_psameas_object|143|0|229|0|{metadata|in_metadata|1|0|}86|84|}
{2010006001|XXGobject_psameas_object|144|0|230|0|{Layout|Layout|0|0|}81|23|}
{2010006001|XXGobject_psameas_object|145|0|231|0|{in_metadata|out_metadata|0|0|}81|27|}
{2010006001|XXGobject_psameas_object|146|0|232|0|{out_metadata|out_metadata|0|0|}81|27|}
{2010601001|XXGgraph_vertex_vertex|147|0|233|0|{Normalize_File_Vector|}1|87|}
{2010212001|XXGvertex_oport_oport|148|0|235|0|{0|out|}87|88|}
{2010213001|XXGoport_dst_flow|149|0|237|0|{0|}88|8|}
{2010212001|XXGvertex_oport_oport|150|0|238|0|{1|reject|}87|89|}
{2010212001|XXGvertex_oport_oport|151|0|240|0|{2|error|}87|90|}
{2010212001|XXGvertex_oport_oport|152|0|242|0|{3|log|}87|91|}
{2010211001|XXGvertex_iport_iport|153|0|244|0|{0|in|}87|92|}
{2010214001|XXGiport_src_flow|154|0|246|0|{0|}92|6|}
{2010007001|XXGobject_proto_object|155|0|247|0|{}87|93|}
{2010212001|XXGvertex_oport_oport|156|0|249|0|{0|out|}93|94|}
{2010006001|XXGobject_psameas_object|157|0|251|0|{metadata|out_metadata|1|0|}94|93|}
{2010212001|XXGvertex_oport_oport|158|0|252|0|{1|reject|}93|95|}
{2010006001|XXGobject_psameas_object|159|0|254|0|{metadata|reject_metadata|1|0|}95|93|}
{2010212001|XXGvertex_oport_oport|160|0|255|0|{2|error|}93|96|}
{2010006001|XXGobject_psameas_object|161|0|257|0|{metadata|error_metadata|1|0|}96|93|}
{2010212001|XXGvertex_oport_oport|162|0|258|0|{3|log|}93|97|}
{2010006001|XXGobject_psameas_object|163|0|260|0|{metadata|log_metadata|1|0|}97|93|}
{2010211001|XXGvertex_iport_iport|164|0|261|0|{0|in|}93|98|}
{2010006001|XXGobject_psameas_object|165|0|263|0|{metadata|in_metadata|1|0|}98|93|}
{2010006001|XXGobject_psameas_object|166|0|264|0|{Layout|Layout|0|0|}87|23|}
{2010006001|XXGobject_psameas_object|167|0|265|0|{in_metadata|out_metadata|0|0|}87|11|}
{2010006001|XXGobject_psameas_object|168|0|266|0|{reject_metadata|out_metadata|0|0|}87|11|}
{2010601001|XXGgraph_vertex_vertex|169|0|267|0|{Reformat|}1|99|}
{2010212001|XXGvertex_oport_oport|170|0|269|0|{0|out0|}99|100|}
{2010213001|XXGoport_dst_flow|171|0|271|0|{0|}100|10|}
{2010212001|XXGvertex_oport_oport|172|0|272|0|{1|reject0|}99|101|}
{2010212001|XXGvertex_oport_oport|173|0|274|0|{2|error0|}99|102|}
{2010212001|XXGvertex_oport_oport|174|0|276|0|{3|log|}99|103|}
{2010211001|XXGvertex_iport_iport|175|0|278|0|{0|in|}99|104|}
{2010214001|XXGiport_src_flow|176|0|280|0|{0|}104|8|}
{2010007001|XXGobject_proto_object|177|0|281|0|{}99|105|}
{2010212001|XXGvertex_oport_oport|178|0|283|0|{0|out0|}105|106|}
{2010006001|XXGobject_psameas_object|179|0|285|0|{metadata|out0_metadata|1|0|}106|105|}
{2010006001|XXGobject_psameas_object|180|0|286|0|{transform0|transform0|1|0|}106|105|}
{2010212001|XXGvertex_oport_oport|181|0|287|0|{1|reject0|}105|107|}
{2010006001|XXGobject_psameas_object|182|0|289|0|{metadata|reject0_metadata|1|0|}107|105|}
{2010212001|XXGvertex_oport_oport|183|0|290|0|{2|error0|}105|108|}
{2010006001|XXGobject_psameas_object|184|0|292|0|{metadata|error0_metadata|1|0|}108|105|}
{2010212001|XXGvertex_oport_oport|185|0|293|0|{3|log|}105|109|}
{2010006001|XXGobject_psameas_object|186|0|295|0|{metadata|log_metadata|1|0|}109|105|}
{2010211001|XXGvertex_iport_iport|187|0|296|0|{0|in|}105|110|}
{2010006001|XXGobject_psameas_object|188|0|298|0|{metadata|in_metadata|1|0|}110|105|}
{2010006001|XXGobject_psameas_object|189|0|299|0|{Layout|Layout|0|0|}99|23|}
{2010006001|XXGobject_psameas_object|190|0|300|0|{in_metadata|out_metadata|0|0|}99|87|}
{2010006001|XXGobject_psameas_object|191|0|301|0|{out0_metadata|write_metadata|0|0|}99|23|}
{2010006001|XXGobject_psameas_object|192|0|302|0|{reject0_metadata|out_metadata|0|0|}99|87|}
{2010601001|XXGgraph_vertex_vertex|193|0|303|0|{SFTP_file_list|}1|111|}
{2010604001|XXGgraph_flow_flow|194|0|305|0|{Flow_1|}111|112|}
{2010604001|XXGgraph_flow_flow|195|0|307|0|{Flow_2|}111|113|}
{2010604001|XXGgraph_flow_flow|196|0|309|0|{Flow_3|}111|114|}
{2010604001|XXGgraph_flow_flow|197|0|311|0|{Flow_4|}111|115|}
{2010604001|XXGgraph_flow_flow|198|0|313|0|{Flow_5|}111|116|}
{2010604001|XXGgraph_flow_flow|199|0|315|0|{Flow_7|}111|117|}
{2010601001|XXGgraph_vertex_vertex|200|0|317|0|{Filter_by_Expression|}111|118|}
{2010212001|XXGvertex_oport_oport|201|0|319|0|{0|out|}118|119|}
{2010213001|XXGoport_dst_flow|202|0|321|0|{0|}119|115|}
{2010212001|XXGvertex_oport_oport|203|0|322|0|{1|deselect|}118|120|}
{2010212001|XXGvertex_oport_oport|204|0|324|0|{2|reject|}118|121|}
{2010212001|XXGvertex_oport_oport|205|0|326|0|{3|error|}118|122|}
{2010212001|XXGvertex_oport_oport|206|0|328|0|{4|log|}118|123|}
{2010211001|XXGvertex_iport_iport|207|0|330|0|{0|in|}118|124|}
{2010214001|XXGiport_src_flow|208|0|332|0|{0|}124|116|}
{2010007001|XXGobject_proto_object|209|0|333|0|{}118|125|}
{2010212001|XXGvertex_oport_oport|210|0|335|0|{0|out|}125|126|}
{2010006001|XXGobject_psameas_object|211|0|337|0|{metadata|out_metadata|1|0|}126|125|}
{2010212001|XXGvertex_oport_oport|212|0|338|0|{1|deselect|}125|127|}
{2010006001|XXGobject_psameas_object|213|0|340|0|{metadata|deselect_metadata|1|0|}127|125|}
{2010212001|XXGvertex_oport_oport|214|0|341|0|{2|reject|}125|128|}
{2010006001|XXGobject_psameas_object|215|0|343|0|{metadata|reject_metadata|1|0|}128|125|}
{2010212001|XXGvertex_oport_oport|216|0|344|0|{3|error|}125|129|}
{2010006001|XXGobject_psameas_object|217|0|346|0|{metadata|error_metadata|1|0|}129|125|}
{2010212001|XXGvertex_oport_oport|218|0|347|0|{4|log|}125|130|}
{2010006001|XXGobject_psameas_object|219|0|349|0|{metadata|log_metadata|1|0|}130|125|}
{2010211001|XXGvertex_iport_iport|220|0|350|0|{0|in|}125|131|}
{2010006001|XXGobject_psameas_object|221|0|352|0|{metadata|in_metadata|1|0|}131|125|}
{2010006001|XXGobject_psameas_object|222|0|353|0|{Layout|Layout|0|0|}118|23|}
{2010006001|XXGobject_psameas_object|223|0|354|0|{deselect_metadata|log_metadata|0|0|}118|132|}
{2010212001|XXGvertex_oport_oport|224|0|356|0|{0|out|}132|133|}
{2010213001|XXGoport_dst_flow|225|0|358|0|{0|}133|112|}
{2010212001|XXGvertex_oport_oport|226|0|359|0|{1|log|}132|134|}
{2010213001|XXGoport_dst_flow|227|0|361|0|{0|}134|116|}
{2010007001|XXGobject_proto_object|228|0|362|0|{}132|135|}
{2010212001|XXGvertex_oport_oport|229|0|364|0|{0|out|}135|136|}
{2010006001|XXGobject_psameas_object|230|0|366|0|{metadata|out_metadata|1|0|}136|135|}
{2010212001|XXGvertex_oport_oport|231|0|367|0|{1|log|}135|137|}
{2010006001|XXGobject_psameas_object|232|0|369|0|{metadata|log_metadata|1|0|}137|135|}
{2010006001|XXGobject_psameas_object|233|0|370|0|{in_metadata|log_metadata|0|0|}118|132|}
{2010006001|XXGobject_psameas_object|234|0|371|0|{out_metadata|log_metadata|0|0|}118|132|}
{2010006001|XXGobject_psameas_object|235|0|372|0|{reject_metadata|log_metadata|0|0|}118|132|}
{2010601001|XXGgraph_vertex_vertex|236|0|373|0|{Filter_by_Expression_1|}111|138|}
{2010212001|XXGvertex_oport_oport|237|0|375|0|{0|out|}138|139|}
{2010213001|XXGoport_dst_flow|238|0|377|0|{0|}139|114|}
{2010212001|XXGvertex_oport_oport|239|0|378|0|{1|deselect|}138|140|}
{2010212001|XXGvertex_oport_oport|240|0|380|0|{2|reject|}138|141|}
{2010212001|XXGvertex_oport_oport|241|0|382|0|{3|error|}138|142|}
{2010212001|XXGvertex_oport_oport|242|0|384|0|{4|log|}138|143|}
{2010211001|XXGvertex_iport_iport|243|0|386|0|{0|in|}138|144|}
{2010214001|XXGiport_src_flow|244|0|388|0|{0|}144|117|}
{2010007001|XXGobject_proto_object|245|0|389|0|{}138|145|}
{2010212001|XXGvertex_oport_oport|246|0|391|0|{0|out|}145|146|}
{2010006001|XXGobject_psameas_object|247|0|393|0|{metadata|out_metadata|1|0|}146|145|}
{2010212001|XXGvertex_oport_oport|248|0|394|0|{1|deselect|}145|147|}
{2010006001|XXGobject_psameas_object|249|0|396|0|{metadata|deselect_metadata|1|0|}147|145|}
{2010212001|XXGvertex_oport_oport|250|0|397|0|{2|reject|}145|148|}
{2010006001|XXGobject_psameas_object|251|0|399|0|{metadata|reject_metadata|1|0|}148|145|}
{2010212001|XXGvertex_oport_oport|252|0|400|0|{3|error|}145|149|}
{2010006001|XXGobject_psameas_object|253|0|402|0|{metadata|error_metadata|1|0|}149|145|}
{2010212001|XXGvertex_oport_oport|254|0|403|0|{4|log|}145|150|}
{2010006001|XXGobject_psameas_object|255|0|405|0|{metadata|log_metadata|1|0|}150|145|}
{2010211001|XXGvertex_iport_iport|256|0|406|0|{0|in|}145|151|}
{2010006001|XXGobject_psameas_object|257|0|408|0|{metadata|in_metadata|1|0|}151|145|}
{2010006001|XXGobject_psameas_object|258|0|409|0|{Layout|Layout|0|0|}138|23|}
{2010006001|XXGobject_psameas_object|259|0|410|0|{deselect_metadata|log_metadata|0|0|}138|152|}
{2010212001|XXGvertex_oport_oport|260|0|412|0|{0|out|}152|153|}
{2010213001|XXGoport_dst_flow|261|0|414|0|{0|}153|113|}
{2010212001|XXGvertex_oport_oport|262|0|415|0|{1|log|}152|154|}
{2010213001|XXGoport_dst_flow|263|0|417|0|{0|}154|117|}
{2010007001|XXGobject_proto_object|264|0|418|0|{}152|155|}
{2010212001|XXGvertex_oport_oport|265|0|420|0|{0|out|}155|156|}
{2010006001|XXGobject_psameas_object|266|0|422|0|{metadata|out_metadata|1|0|}156|155|}
{2010212001|XXGvertex_oport_oport|267|0|423|0|{1|log|}155|157|}
{2010006001|XXGobject_psameas_object|268|0|425|0|{metadata|log_metadata|1|0|}157|155|}
{2010006001|XXGobject_psameas_object|269|0|426|0|{in_metadata|log_metadata|0|0|}138|152|}
{2010006001|XXGobject_psameas_object|270|0|427|0|{out_metadata|log_metadata|0|0|}138|152|}
{2010006001|XXGobject_psameas_object|271|0|428|0|{reject_metadata|log_metadata|0|0|}138|152|}
{2010601001|XXGgraph_vertex_vertex|272|0|429|0|{Fuse|}111|158|}
{2010212001|XXGvertex_oport_oport|273|0|431|0|{0|out|}158|159|}
{2010212001|XXGvertex_oport_oport|274|0|433|0|{1|reject0|}158|160|}
{2010212001|XXGvertex_oport_oport|275|0|435|0|{2|reject1|}158|161|}
{2010212001|XXGvertex_oport_oport|276|0|437|0|{3|error0|}158|162|}
{2010212001|XXGvertex_oport_oport|277|0|439|0|{4|error1|}158|163|}
{2010212001|XXGvertex_oport_oport|278|0|441|0|{5|log|}158|164|}
{2010211001|XXGvertex_iport_iport|279|0|443|0|{0|in0|}158|165|}
{2010214001|XXGiport_src_flow|280|0|445|0|{0|}165|115|}
{2010211001|XXGvertex_iport_iport|281|0|446|0|{1|in1|}158|166|}
{2010214001|XXGiport_src_flow|282|0|448|0|{0|}166|114|}
{2010007001|XXGobject_proto_object|283|0|449|0|{}158|167|}
{2010212001|XXGvertex_oport_oport|284|0|451|0|{0|out|}167|168|}
{2010006001|XXGobject_psameas_object|285|0|453|0|{metadata|out_metadata|1|0|}168|167|}
{2010212001|XXGvertex_oport_oport|286|0|454|0|{1|reject0|}167|169|}
{2010006001|XXGobject_psameas_object|287|0|456|0|{metadata|reject0_metadata|1|0|}169|167|}
{2010212001|XXGvertex_oport_oport|288|0|457|0|{2|reject1|}167|170|}
{2010006001|XXGobject_psameas_object|289|0|459|0|{metadata|reject1_metadata|1|0|}170|167|}
{2010212001|XXGvertex_oport_oport|290|0|460|0|{3|error0|}167|171|}
{2010006001|XXGobject_psameas_object|291|0|462|0|{metadata|error0_metadata|1|0|}171|167|}
{2010212001|XXGvertex_oport_oport|292|0|463|0|{4|error1|}167|172|}
{2010006001|XXGobject_psameas_object|293|0|465|0|{metadata|error1_metadata|1|0|}172|167|}
{2010212001|XXGvertex_oport_oport|294|0|466|0|{5|log|}167|173|}
{2010006001|XXGobject_psameas_object|295|0|468|0|{metadata|log_metadata|1|0|}173|167|}
{2010211001|XXGvertex_iport_iport|296|0|469|0|{0|in0|}167|174|}
{2010006001|XXGobject_psameas_object|297|0|471|0|{metadata|in0_metadata|1|0|}174|167|}
{2010211001|XXGvertex_iport_iport|298|0|472|0|{1|in1|}167|175|}
{2010006001|XXGobject_psameas_object|299|0|474|0|{metadata|in1_metadata|1|0|}175|167|}
{2010006001|XXGobject_psameas_object|300|0|475|0|{Layout|Layout|0|0|}158|23|}
{2010006001|XXGobject_psameas_object|301|0|476|0|{in0_metadata|log_metadata|0|0|}158|132|}
{2010006001|XXGobject_psameas_object|302|0|477|0|{in1_metadata|log_metadata|0|0|}158|152|}
{2010006001|XXGobject_psameas_object|303|0|478|0|{out_metadata|out_metadata|0|0|}158|27|}
{2010006001|XXGobject_psameas_object|304|0|479|0|{reject0_metadata|log_metadata|0|0|}158|132|}
{2010006001|XXGobject_psameas_object|305|0|480|0|{reject1_metadata|log_metadata|0|0|}158|152|}
{2010601001|XXGgraph_vertex_vertex|306|0|481|0|{SFTP_From_long_list_|}111|152|}
{2010601001|XXGgraph_vertex_vertex|307|0|482|0|{SFTP_From_short_list_|}111|132|}
{2010601001|XXGgraph_vertex_vertex|308|0|483|0|{_dev_null|}111|176|}
{2010211001|XXGvertex_iport_iport|309|0|485|0|{0|write|}176|177|}
{2010214001|XXGiport_src_flow|310|0|487|0|{0|}177|112|}
{2010007001|XXGobject_proto_object|311|0|488|0|{}176|178|}
{2010211001|XXGvertex_iport_iport|312|0|490|0|{0|write|}178|179|}
{2010006001|XXGobject_psameas_object|313|0|492|0|{metadata|write_metadata|1|0|}179|178|}
{2010006001|XXGobject_psameas_object|314|0|493|0|{write_metadata|out_metadata|0|0|}176|132|}
{2010601001|XXGgraph_vertex_vertex|315|0|494|0|{_dev_null_1|}111|180|}
{2010211001|XXGvertex_iport_iport|316|0|496|0|{0|write|}180|181|}
{2010214001|XXGiport_src_flow|317|0|498|0|{0|}181|113|}
{2010007001|XXGobject_proto_object|318|0|499|0|{}180|182|}
{2010211001|XXGvertex_iport_iport|319|0|501|0|{0|write|}182|183|}
{2010006001|XXGobject_psameas_object|320|0|503|0|{metadata|write_metadata|1|0|}183|182|}
{2010006001|XXGobject_psameas_object|321|0|504|0|{write_metadata|out_metadata|0|0|}180|152|}
{2010212001|XXGvertex_oport_oport|322|0|505|0|{0|out0|}111|184|}
{2010216002|XXGoport_binding_oport|323|0|507|0|{.5|.5|{12|696000|254000|716000|254000|892000|254000|892000|364000|1068000|364000|1088000|364000|}0|}184|159|}
{2010213001|XXGoport_dst_flow|324|0|508|0|{0|}184|7|}
{2010109001|XXGobject_property_value|325|0|509|0|{0|TrackingThumbprint|72|}1|185|}
