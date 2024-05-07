@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|151|rel_count|265|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|SOURCE|argus.claim|3|9|RFK||{0|}}
{30001002|XXparameter|LOGICAL_FILENAMES|0008-cpp-chrg.dat|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_BASE|$[ re_replace(SOURCE, '\\\\..*', '')]|3|9|RK||{0|}}
{30001002|XXparameter|SOURCE_DML|$AI_DML/$SOURCE_BASE/$SOURCE.dml|3|9|RFK||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|CLEAN_DML|$AI_DML/$SOURCE_BASE/$SOURCE.dml|3|2|FK$||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP|3|2|RFK$||{0|}}
{30001002|XXparameter|FLATTEN_XFR|$AI_XFR/get.ftp.write.rsv_normalize.xfr|3|9|RFK||{0|}}
{30001002|XXparameter|_parameters_of_Row_Counts_per_file|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_source_file|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Manifest|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filter_by_Expression|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Read_Multiple_Files|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Rollup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Trash|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_View_Data|@34|9|FHK|@{0|}}
{30001002|XXparameter|DROP_HEADER_EXPRESSION|1|3|2|RFK$||{0|}}
{30001002|XXparameter|_parameters_of_Drop_Headers|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Flatten|@34|9|FHK|@{0|}}
{30001002|XXparameter|FILE_LIST_OR_PATTERN_LIST|file_list|15|2|RFK$||{2|file_list|pattern_list|}}
{30001002|XXparameter|PATTERN_LIST_FILTER|vector_sum(for (let pat in re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')):
             re_index(logical_filename, pat) > 0) > 0|3|9|RK||{0|}}
{30001002|XXparameter|FILE_LIST_FILTER|logical_filename member re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')|3|9|RK||{0|}}
{30001002|XXparameter|FIELD_SEPARATOR|,|3|2|RFK$||{0|}}
{30001002|XXparameter|RECORD_SEPARATOR|'\\r\\n'|3|2|RFK$||{0|}}
{30001002|XXparameter|QUOTE_CHARACTER|'|3|2|RFK$||{0|}}
{30001002|XXparameter|_parameters_of_Reformat|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Read_Separated_Values|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Redefine_Format|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Partition_by_Round_robin_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.0.6.6|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|1044000|612000|0|get.ftp.write.read_separated_values|davidmiller||1|10|0||6||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1043000|612000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.1|{1|1|}Job 'get.ftp.write.read_separated_values' Execution Status Report

Compilation of graph "get.ftp.write.read_separated_values" started at Tuesday, October 23, 2012 13:53:57

Job "get.ftp.write.read_separated_values" Execution started at Tuesday, October 23, 2012 13:54:00
Job completed successfully at Tuesday, October 23, 2012 13:54:04

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:04
Run performed by user davidmiller
Total data moved through all flows: 1 records (275 bytes)
Total CPU time (all processes): 2 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@dev - abi||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{12|537000|114000|557000|114000|557000|201000|7000|201000|7000|289000|28000|289000|}6320|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{12|680000|569000|680000|569000|696000|569000|696000|574000|713000|574000|720000|574000|}6304|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{8|626000|269000|646000|269000|678000|269000|699000|269000|}6317|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{8|830000|269000|850000|269000|901000|269000|922000|269000|}6328|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{8|436000|269000|456000|269000|459000|269000|480000|269000|}6323|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{8|298000|269000|318000|269000|349000|269000|370000|269000|}6326|18|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{8|166000|269000|196000|269000|205000|269000|226000|269000|}6325|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{8|333000|114000|353000|114000|381000|114000|402000|114000|}6332|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{8|679000|419000|699000|419000|801000|419000|822000|419000|}6293|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.46000000834465027|.5|{12|1043000|269000|1063000|269000|1063000|338000|586000|338000|586000|419000|607000|419000|}6329|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{12|166000|309000|186000|309000|196000|309000|196000|454000|206000|454000|227000|454000|}6334|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{8|348000|454000|368000|454000|400000|454000|421000|454000|}6335|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{8|108000|114000|128000|114000|158000|114000|179000|114000|}6331|17|}}
{2010501005|XXGpvertex|18|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$DROP_HEADER_EXPRESSION|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@690000|223000|710000|224000|110000|87000|6319|Drop Headers|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|19|0|37|0|{@{}@819000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|21|0|42|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|44|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|46|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|48|0|{@{}@700000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|25|0|51|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|26|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|27|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|28|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|29|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|30|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|32|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@811000|374000|833000|394000|56000|50000|6294|source file|Ab Initio Software||1|20|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|33|0|73|0|{@{}@823000|414000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|34|0|76|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|35|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|36|0|85|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$[if (FILE_LIST_OR_PATTERN_LIST == 'file_list')
    FILE_LIST_FILTER 
  else PATTERN_LIST_FILTER]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@170000|71000|190000|72000|133000|87000|6333|Filter by Expression|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|87|0|{@{}@322000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|90|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|39|0|92|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|40|0|94|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|41|0|96|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|98|0|{@{}@180000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|101|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|44|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|45|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|46|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|47|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|50|0|121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/get.audit.ftp_row_counts.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@410000|409000|432000|429000|56000|50000|6276|Row Counts per file|Ab Initio Software||1|500|0||6||33025|-1|-1|}}
{2010202004|XXGiport|51|0|123|0|{@{}@422000|449000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|52|0|126|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332536923|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|53|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|54|0|131|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$WORKDIR/manifest.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/manifest.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$AI_DML/get.manifest.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@20000|67000|42000|87000|56000|50000|6306|Manifest|Ab Initio Software||1|20|0||6||33025|-1|-1|}}
{2010203004|XXGoport|55|0|133|0|{@{}@97000|109000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|56|0|136|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1332536911|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|57|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|58|0|144|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$FLATTEN_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@913000|221000|933000|230000|100000|76000|6330|Flatten|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|59|0|146|0|{@{}@1032000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|60|0|149|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|61|0|151|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|62|0|153|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|63|0|155|0|{@{}@923000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|64|0|158|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|65|0|160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|66|0|163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|68|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|69|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|70|0|179|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@227000|241000|237000|250000|51000|41000|6327|Partition by Round-robin-1|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|71|0|181|0|{@{}@287000|264000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|72|0|184|0|{@{}@227000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|187|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|74|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|75|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|76|0|196|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.*:: in.data.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform1|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$SOURCE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out1_metadata|$AI_DML/get.manifest.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@0|@19000|243000|39000|252000|117000|76000|6322|Reformat|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|77|0|198|0|{@{}@155000|264000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|78|0|201|0|{@{}@155000|304000|11000|11000|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|79|0|204|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|80|0|206|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|81|0|208|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|82|0|210|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|83|0|212|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|214|0|{@{}@29000|284000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|217|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
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
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|87|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|88|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|89|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|90|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|91|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|92|0|239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|94|0|246|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$[string_join(for (let inc in first_defined(record_info(read_type(SOURCE_DML))[0].includes, [vector])): 'include "' + string_replace(inc, AI_DML, '~$AI_DML') + '";', '\\n')]

filename :: get_filename(in) =
begin
  filename :: in.file_to_read;
end;

type input_type=$[add_fields('record\\nend', for(let f in record_info(read_type(SOURCE_DML)))f.includes = NULL;: f)];

out :: reformat(read, filename, in) =
begin
  out.ftp_path :: in.ftp_path;
  out.filename :: in.filename;
  out.file_size :: in.file_size;
  out.last_modified :: in.last_modified;
  out.logical_filename :: in.logical_filename;
  out.file_start_date :: in.file_start_date;
  out.file_end_date :: in.file_end_date;
  out.get_start_date :: in.get_start_date;
  out.get_end_date :: in.get_end_date;
  out.file_to_read :: in.file_to_read;
  out.data.* :: read.*;
end;|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/get.ftp_file.$SOURCE.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$[add_field(read_type("$AI_DML/get.manifest.dml"), "data", add_fields("record\\nend", record_info(read_type(SOURCE_DML))))]|3|9||@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@393000|73000|413000|74000|114000|106000|6307|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|95|0|248|0|{@{}@526000|109000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|96|0|251|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|97|0|253|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|98|0|255|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|99|0|257|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|100|0|259|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|261|0|{@{}@403000|109000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|264|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
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
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading an input file|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
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
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|103|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|104|0|269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|105|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|106|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|107|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|108|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|109|0|284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|110|0|294|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|field_separator|$FIELD_SEPARATOR|3|2|$|@{0|}}
{30001002|XXparameter|record_separator|$RECORD_SEPARATOR|3|2|$|@{0|}}
{30001002|XXparameter|quote_character|$QUOTE_CHARACTER|3|2|$|@{0|}}
{30001002|XXparameter|add_fields_if_needed|True|3|1|l|@{0|}}
{30001002|XXparameter|ignore_extra_fields|True|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Read_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@471000|217000|491000|218000|125000|106000|6314|Read Separated Values|Ab Initio Software|Built-in 2.11:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|111|0|296|0|{@{}@615000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|112|0|299|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010202004|XXGiport|113|0|301|0|{@{}@481000|264000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|114|0|304|0|{Reads comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-sv|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/read-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|add_fields_if_needed|False|13|1|FKl|Pad record with blank fields if necessary|{0|}}
{30001002|XXparameter|add_fields_if_needed.display_name|add-fields-if-needed|3|9|P|@{0|}}
{30001002|XXparameter|add_fields_if_needed.keyword|add-fields-if-needed|3|9|P|@{0|}}
{30001002|XXparameter|ignore_extra_fields|False|13|1|FKl|Ignore extra fields if present|{0|}}
{30001002|XXparameter|ignore_extra_fields.display_name|ignore-extra-fields|3|9|P|@{0|}}
{30001002|XXparameter|ignore_extra_fields.keyword|ignore-extra-fields|3|9|P|@{0|}}
{30001002|XXparameter|skip_header_record|False|13|1|FKl|Skip header record|{0|}}
{30001002|XXparameter|skip_header_record.display_name|skip-header-record|3|9|P|@{0|}}
{30001002|XXparameter|skip_header_record.keyword|skip-header-record|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one|False|13|1|FKl|Treat adjacent field delimiters as one|{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.display_name|treat-adjacent-delimiters-as-one|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.keyword|treat-adjacent-delimiters-as-one|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.condition|version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|remove_bom|False|13|1|FKl|Remove the byte-order-mark if it exists at the beginning of the data.|{0|}}
{30001002|XXparameter|remove_bom.display_name|remove-bom|3|9|P|@{0|}}
{30001002|XXparameter|remove_bom.keyword|remove-bom|3|9|P|@{0|}}
{30001002|XXparameter|remove_bom.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|initial_quote_only|False|13|1|FKl|Only interpret quote characters in a field if the first character in the field is a quote.|{0|}}
{30001002|XXparameter|initial_quote_only.display_name|initial-quote-only|3|9|P|@{0|}}
{30001002|XXparameter|initial_quote_only.keyword|initial-quote-only|3|9|P|@{0|}}
{30001002|XXparameter|initial_quote_only.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=all_to_all(in); out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537123|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|115|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|116|0|309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010202004|XXGiport|117|0|312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|118|0|316|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata|string(1)|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Redefine_Format.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@368000|242000|381000|251000|45000|41000|6324|Redefine Format|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|318|0|{@{}@425000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|120|0|321|0|{@{}@371000|264000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|121|0|324|0|{Copies data records from its input to its output without changing the values.  Use Redefine Format to change a record format or rename fields.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|copy|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537065|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|122|0|326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|123|0|329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|124|0|337|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@608000|390000|618000|399000|51000|41000|6292|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|125|0|339|0|{@{}@668000|414000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|126|0|342|0|{@{}@608000|414000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|127|0|345|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|128|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|129|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|130|0|356|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sorted_input|False|3|9||@{0|}}
{30001002|XXparameter|key|\{file_to_read\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.* :: in.*;
  out.source :: $["'" + SOURCE + "'"];
  out.record_count :: count();
  out.run_date:: now1();
  out.ftp_file_size :: in.file_size;
  out.ftp_file_last_modified :: in.last_modified;
end;|3|9||@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@218000|407000|238000|416000|100000|76000|6336|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|131|0|358|0|{@{}@337000|449000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|132|0|361|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|133|0|363|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|134|0|365|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|135|0|367|0|{@{}@228000|449000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|136|0|370|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|137|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|138|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|139|0|378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|140|0|381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|141|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|142|0|392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@694176|512363|731000|540000|56000|72000|6305|Trash|Ab Initio Software|Built-in|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|143|0|394|0|{@{}@721000|569000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|144|0|397|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537065|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|145|0|399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|146|0|402|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$[ string_split(read_file(directory_listing(WORKDIR + "/" + directory_listing(WORKDIR, "get_*.*")[0], "manifest.dat")[0]), "\|")[9] ]|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$[ string_split(read_file(directory_listing(WORKDIR + \\"/\\" + directory_listing(WORKDIR, \\"get_*.*\\")[0], \\"manifest.dat\\")[0]), \\"\|\\")[9] ]", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SOURCE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@591605|524385|614000|544000|56000|50000|6303|View Data|Ab Initio Software||1493500|-1|-1||6||164161|-1|-1|}}
{2010203004|XXGoport|147|0|404|0|{@{}@669000|564000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|148|0|407|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|149|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010110002|XXGconstant|150|0|414|0|{@{}@{1|9477360|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_13|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_14|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_2|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_6|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_7|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_8|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_9|}1|17|}
{2010601001|XXGgraph_vertex_vertex|17|0|34|0|{Drop_Headers|}1|18|}
{2010212001|XXGvertex_oport_oport|18|0|36|0|{0|out|}18|19|}
{2010213001|XXGoport_dst_flow|19|0|38|0|{0|}19|8|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{1|deselect|}18|20|}
{2010212001|XXGvertex_oport_oport|21|0|41|0|{2|reject|}18|21|}
{2010212001|XXGvertex_oport_oport|22|0|43|0|{3|error|}18|22|}
{2010212001|XXGvertex_oport_oport|23|0|45|0|{4|log|}18|23|}
{2010211001|XXGvertex_iport_iport|24|0|47|0|{0|in|}18|24|}
{2010214001|XXGiport_src_flow|25|0|49|0|{0|}24|7|}
{2010007001|XXGobject_proto_object|26|0|50|0|{}18|25|}
{2010212001|XXGvertex_oport_oport|27|0|52|0|{0|out|}25|26|}
{2010006001|XXGobject_psameas_object|28|0|54|0|{metadata|out_metadata|1|0|}26|25|}
{2010212001|XXGvertex_oport_oport|29|0|55|0|{1|deselect|}25|27|}
{2010006001|XXGobject_psameas_object|30|0|57|0|{metadata|deselect_metadata|1|0|}27|25|}
{2010212001|XXGvertex_oport_oport|31|0|58|0|{2|reject|}25|28|}
{2010006001|XXGobject_psameas_object|32|0|60|0|{metadata|reject_metadata|1|0|}28|25|}
{2010212001|XXGvertex_oport_oport|33|0|61|0|{3|error|}25|29|}
{2010006001|XXGobject_psameas_object|34|0|63|0|{metadata|error_metadata|1|0|}29|25|}
{2010212001|XXGvertex_oport_oport|35|0|64|0|{4|log|}25|30|}
{2010006001|XXGobject_psameas_object|36|0|66|0|{metadata|log_metadata|1|0|}30|25|}
{2010211001|XXGvertex_iport_iport|37|0|67|0|{0|in|}25|31|}
{2010006001|XXGobject_psameas_object|38|0|69|0|{metadata|in_metadata|1|0|}31|25|}
{2010006001|XXGobject_psameas_object|39|0|70|0|{Layout|Layout|0|0|}18|32|}
{2010211001|XXGvertex_iport_iport|40|0|72|0|{0|write|}32|33|}
{2010214001|XXGiport_src_flow|41|0|74|0|{0|}33|13|}
{2010007001|XXGobject_proto_object|42|0|75|0|{}32|34|}
{2010211001|XXGvertex_iport_iport|43|0|77|0|{0|write|}34|35|}
{2010006001|XXGobject_psameas_object|44|0|79|0|{metadata|write_metadata|1|0|}35|34|}
{2010006001|XXGobject_psameas_object|45|0|80|0|{deselect_metadata|write_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{in_metadata|write_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|47|0|82|0|{out_metadata|write_metadata|0|0|}18|32|}
{2010006001|XXGobject_psameas_object|48|0|83|0|{reject_metadata|write_metadata|0|0|}18|32|}
{2010601001|XXGgraph_vertex_vertex|49|0|84|0|{Filter_by_Expression|}1|36|}
{2010212001|XXGvertex_oport_oport|50|0|86|0|{0|out|}36|37|}
{2010213001|XXGoport_dst_flow|51|0|88|0|{0|}37|12|}
{2010212001|XXGvertex_oport_oport|52|0|89|0|{1|deselect|}36|38|}
{2010212001|XXGvertex_oport_oport|53|0|91|0|{2|reject|}36|39|}
{2010212001|XXGvertex_oport_oport|54|0|93|0|{3|error|}36|40|}
{2010212001|XXGvertex_oport_oport|55|0|95|0|{4|log|}36|41|}
{2010211001|XXGvertex_iport_iport|56|0|97|0|{0|in|}36|42|}
{2010214001|XXGiport_src_flow|57|0|99|0|{0|}42|17|}
{2010007001|XXGobject_proto_object|58|0|100|0|{}36|43|}
{2010212001|XXGvertex_oport_oport|59|0|102|0|{0|out|}43|44|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{metadata|out_metadata|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|61|0|105|0|{1|deselect|}43|45|}
{2010006001|XXGobject_psameas_object|62|0|107|0|{metadata|deselect_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|63|0|108|0|{2|reject|}43|46|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{metadata|reject_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|65|0|111|0|{3|error|}43|47|}
{2010006001|XXGobject_psameas_object|66|0|113|0|{metadata|error_metadata|1|0|}47|43|}
{2010212001|XXGvertex_oport_oport|67|0|114|0|{4|log|}43|48|}
{2010006001|XXGobject_psameas_object|68|0|116|0|{metadata|log_metadata|1|0|}48|43|}
{2010211001|XXGvertex_iport_iport|69|0|117|0|{0|in|}43|49|}
{2010006001|XXGobject_psameas_object|70|0|119|0|{metadata|in_metadata|1|0|}49|43|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{Layout|Layout|0|0|}36|50|}
{2010211001|XXGvertex_iport_iport|72|0|122|0|{0|write|}50|51|}
{2010214001|XXGiport_src_flow|73|0|124|0|{0|}51|16|}
{2010007001|XXGobject_proto_object|74|0|125|0|{}50|52|}
{2010211001|XXGvertex_iport_iport|75|0|127|0|{0|write|}52|53|}
{2010006001|XXGobject_psameas_object|76|0|129|0|{metadata|write_metadata|1|0|}53|52|}
{2010006001|XXGobject_psameas_object|77|0|130|0|{deselect_metadata|read_metadata|0|0|}36|54|}
{2010212001|XXGvertex_oport_oport|78|0|132|0|{0|read|}54|55|}
{2010213001|XXGoport_dst_flow|79|0|134|0|{0|}55|17|}
{2010007001|XXGobject_proto_object|80|0|135|0|{}54|56|}
{2010212001|XXGvertex_oport_oport|81|0|137|0|{0|read|}56|57|}
{2010006001|XXGobject_psameas_object|82|0|139|0|{metadata|read_metadata|1|0|}57|56|}
{2010006001|XXGobject_psameas_object|83|0|140|0|{in_metadata|read_metadata|0|0|}36|54|}
{2010006001|XXGobject_psameas_object|84|0|141|0|{out_metadata|read_metadata|0|0|}36|54|}
{2010006001|XXGobject_psameas_object|85|0|142|0|{reject_metadata|read_metadata|0|0|}36|54|}
{2010601001|XXGgraph_vertex_vertex|86|0|143|0|{Flatten|}1|58|}
{2010212001|XXGvertex_oport_oport|87|0|145|0|{0|out|}58|59|}
{2010213001|XXGoport_dst_flow|88|0|147|0|{0|}59|14|}
{2010212001|XXGvertex_oport_oport|89|0|148|0|{1|reject|}58|60|}
{2010212001|XXGvertex_oport_oport|90|0|150|0|{2|error|}58|61|}
{2010212001|XXGvertex_oport_oport|91|0|152|0|{3|log|}58|62|}
{2010211001|XXGvertex_iport_iport|92|0|154|0|{0|in|}58|63|}
{2010214001|XXGiport_src_flow|93|0|156|0|{0|}63|8|}
{2010007001|XXGobject_proto_object|94|0|157|0|{}58|64|}
{2010212001|XXGvertex_oport_oport|95|0|159|0|{0|out|}64|65|}
{2010006001|XXGobject_psameas_object|96|0|161|0|{metadata|out_metadata|1|0|}65|64|}
{2010212001|XXGvertex_oport_oport|97|0|162|0|{1|reject|}64|66|}
{2010006001|XXGobject_psameas_object|98|0|164|0|{metadata|reject_metadata|1|0|}66|64|}
{2010212001|XXGvertex_oport_oport|99|0|165|0|{2|error|}64|67|}
{2010006001|XXGobject_psameas_object|100|0|167|0|{metadata|error_metadata|1|0|}67|64|}
{2010212001|XXGvertex_oport_oport|101|0|168|0|{3|log|}64|68|}
{2010006001|XXGobject_psameas_object|102|0|170|0|{metadata|log_metadata|1|0|}68|64|}
{2010211001|XXGvertex_iport_iport|103|0|171|0|{0|in|}64|69|}
{2010006001|XXGobject_psameas_object|104|0|173|0|{metadata|in_metadata|1|0|}69|64|}
{2010006001|XXGobject_psameas_object|105|0|174|0|{Layout|Layout|0|0|}58|32|}
{2010006001|XXGobject_psameas_object|106|0|175|0|{in_metadata|write_metadata|0|0|}58|32|}
{2010006001|XXGobject_psameas_object|107|0|176|0|{out_metadata|write_metadata|0|0|}58|32|}
{2010601001|XXGgraph_vertex_vertex|108|0|177|0|{Manifest|}1|54|}
{2010601001|XXGgraph_vertex_vertex|109|0|178|0|{Partition_by_Round_robin_1|}1|70|}
{2010212001|XXGvertex_oport_oport|110|0|180|0|{0|out|}70|71|}
{2010213001|XXGoport_dst_flow|111|0|182|0|{0|}71|10|}
{2010211001|XXGvertex_iport_iport|112|0|183|0|{0|in|}70|72|}
{2010214001|XXGiport_src_flow|113|0|185|0|{0|}72|11|}
{2010007001|XXGobject_proto_object|114|0|186|0|{}70|73|}
{2010212001|XXGvertex_oport_oport|115|0|188|0|{0|out|}73|74|}
{2010006001|XXGobject_psameas_object|116|0|190|0|{metadata|out_metadata|1|0|}74|73|}
{2010211001|XXGvertex_iport_iport|117|0|191|0|{0|in|}73|75|}
{2010006001|XXGobject_psameas_object|118|0|193|0|{metadata|in_metadata|1|0|}75|73|}
{2010006001|XXGobject_psameas_object|119|0|194|0|{Layout|Layout|0|0|}70|50|}
{2010006001|XXGobject_psameas_object|120|0|195|0|{in_metadata|out0_metadata|0|0|}70|76|}
{2010212001|XXGvertex_oport_oport|121|0|197|0|{0|out0|}76|77|}
{2010213001|XXGoport_dst_flow|122|0|199|0|{0|}77|11|}
{2010212001|XXGvertex_oport_oport|123|0|200|0|{1|out1|}76|78|}
{2010213001|XXGoport_dst_flow|124|0|202|0|{0|}78|15|}
{2010212001|XXGvertex_oport_oport|125|0|203|0|{2|reject0|}76|79|}
{2010212001|XXGvertex_oport_oport|126|0|205|0|{3|reject1|}76|80|}
{2010212001|XXGvertex_oport_oport|127|0|207|0|{4|error0|}76|81|}
{2010212001|XXGvertex_oport_oport|128|0|209|0|{5|error1|}76|82|}
{2010212001|XXGvertex_oport_oport|129|0|211|0|{6|log|}76|83|}
{2010211001|XXGvertex_iport_iport|130|0|213|0|{0|in|}76|84|}
{2010214001|XXGiport_src_flow|131|0|215|0|{0|}84|5|}
{2010007001|XXGobject_proto_object|132|0|216|0|{}76|85|}
{2010212001|XXGvertex_oport_oport|133|0|218|0|{0|out0|}85|86|}
{2010006001|XXGobject_psameas_object|134|0|220|0|{metadata|out0_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|135|0|221|0|{transform0|transform0|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|136|0|222|0|{1|out1|}85|87|}
{2010006001|XXGobject_psameas_object|137|0|224|0|{metadata|out1_metadata|1|0|}87|85|}
{2010006001|XXGobject_psameas_object|138|0|225|0|{transform1|transform1|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|139|0|226|0|{2|reject0|}85|88|}
{2010006001|XXGobject_psameas_object|140|0|228|0|{metadata|reject0_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|141|0|229|0|{3|reject1|}85|89|}
{2010006001|XXGobject_psameas_object|142|0|231|0|{metadata|reject1_metadata|1|0|}89|85|}
{2010212001|XXGvertex_oport_oport|143|0|232|0|{4|error0|}85|90|}
{2010006001|XXGobject_psameas_object|144|0|234|0|{metadata|error0_metadata|1|0|}90|85|}
{2010212001|XXGvertex_oport_oport|145|0|235|0|{5|error1|}85|91|}
{2010006001|XXGobject_psameas_object|146|0|237|0|{metadata|error1_metadata|1|0|}91|85|}
{2010212001|XXGvertex_oport_oport|147|0|238|0|{6|log|}85|92|}
{2010006001|XXGobject_psameas_object|148|0|240|0|{metadata|log_metadata|1|0|}92|85|}
{2010211001|XXGvertex_iport_iport|149|0|241|0|{0|in|}85|93|}
{2010006001|XXGobject_psameas_object|150|0|243|0|{metadata|in_metadata|1|0|}93|85|}
{2010006001|XXGobject_psameas_object|151|0|244|0|{Layout|Layout|0|0|}76|50|}
{2010006001|XXGobject_psameas_object|152|0|245|0|{in_metadata|out_metadata|0|0|}76|94|}
{2010212001|XXGvertex_oport_oport|153|0|247|0|{0|out|}94|95|}
{2010213001|XXGoport_dst_flow|154|0|249|0|{0|}95|5|}
{2010212001|XXGvertex_oport_oport|155|0|250|0|{1|filereject|}94|96|}
{2010212001|XXGvertex_oport_oport|156|0|252|0|{2|fileerror|}94|97|}
{2010212001|XXGvertex_oport_oport|157|0|254|0|{3|reject|}94|98|}
{2010212001|XXGvertex_oport_oport|158|0|256|0|{4|error|}94|99|}
{2010212001|XXGvertex_oport_oport|159|0|258|0|{5|log|}94|100|}
{2010211001|XXGvertex_iport_iport|160|0|260|0|{0|in|}94|101|}
{2010214001|XXGiport_src_flow|161|0|262|0|{0|}101|12|}
{2010007001|XXGobject_proto_object|162|0|263|0|{}94|102|}
{2010212001|XXGvertex_oport_oport|163|0|265|0|{0|out|}102|103|}
{2010006001|XXGobject_psameas_object|164|0|267|0|{metadata|out_metadata|1|0|}103|102|}
{2010212001|XXGvertex_oport_oport|165|0|268|0|{1|filereject|}102|104|}
{2010006001|XXGobject_psameas_object|166|0|270|0|{metadata|filereject_metadata|1|0|}104|102|}
{2010212001|XXGvertex_oport_oport|167|0|271|0|{2|fileerror|}102|105|}
{2010006001|XXGobject_psameas_object|168|0|273|0|{metadata|fileerror_metadata|1|0|}105|102|}
{2010212001|XXGvertex_oport_oport|169|0|274|0|{3|reject|}102|106|}
{2010006001|XXGobject_psameas_object|170|0|276|0|{metadata|reject_metadata|1|0|}106|102|}
{2010212001|XXGvertex_oport_oport|171|0|277|0|{4|error|}102|107|}
{2010006001|XXGobject_psameas_object|172|0|279|0|{metadata|error_metadata|1|0|}107|102|}
{2010212001|XXGvertex_oport_oport|173|0|280|0|{5|log|}102|108|}
{2010006001|XXGobject_psameas_object|174|0|282|0|{metadata|log_metadata|1|0|}108|102|}
{2010211001|XXGvertex_iport_iport|175|0|283|0|{0|in|}102|109|}
{2010006001|XXGobject_psameas_object|176|0|285|0|{metadata|in_metadata|1|0|}109|102|}
{2010006001|XXGobject_psameas_object|177|0|286|0|{Layout|Layout|0|0|}94|50|}
{2010006001|XXGobject_psameas_object|178|0|287|0|{filereject_metadata|read_metadata|0|0|}94|54|}
{2010006001|XXGobject_psameas_object|179|0|288|0|{in_metadata|read_metadata|0|0|}94|54|}
{2010006001|XXGobject_psameas_object|180|0|289|0|{reject0_metadata|out_metadata|0|0|}76|94|}
{2010006001|XXGobject_psameas_object|181|0|290|0|{reject1_metadata|out_metadata|0|0|}76|94|}
{2010006001|XXGobject_psameas_object|182|0|291|0|{out_metadata|out0_metadata|0|0|}70|76|}
{2010601001|XXGgraph_vertex_vertex|183|0|292|0|{Read_Multiple_Files|}1|94|}
{2010601001|XXGgraph_vertex_vertex|184|0|293|0|{Read_Separated_Values|}1|110|}
{2010212001|XXGvertex_oport_oport|185|0|295|0|{0|out|}110|111|}
{2010213001|XXGoport_dst_flow|186|0|297|0|{0|}111|7|}
{2010212001|XXGvertex_oport_oport|187|0|298|0|{1|reject|}110|112|}
{2010211001|XXGvertex_iport_iport|188|0|300|0|{0|in|}110|113|}
{2010214001|XXGiport_src_flow|189|0|302|0|{0|}113|9|}
{2010007001|XXGobject_proto_object|190|0|303|0|{}110|114|}
{2010212001|XXGvertex_oport_oport|191|0|305|0|{0|out|}114|115|}
{2010006001|XXGobject_psameas_object|192|0|307|0|{metadata|out_metadata|1|0|}115|114|}
{2010212001|XXGvertex_oport_oport|193|0|308|0|{1|reject|}114|116|}
{2010006001|XXGobject_psameas_object|194|0|310|0|{metadata|reject_metadata|1|0|}116|114|}
{2010211001|XXGvertex_iport_iport|195|0|311|0|{0|in|}114|117|}
{2010006001|XXGobject_psameas_object|196|0|313|0|{metadata|in_metadata|1|0|}117|114|}
{2010006001|XXGobject_psameas_object|197|0|314|0|{Layout|Layout|0|0|}110|32|}
{2010006001|XXGobject_psameas_object|198|0|315|0|{in_metadata|out_metadata|0|0|}110|118|}
{2010212001|XXGvertex_oport_oport|199|0|317|0|{0|out|}118|119|}
{2010213001|XXGoport_dst_flow|200|0|319|0|{0|}119|9|}
{2010211001|XXGvertex_iport_iport|201|0|320|0|{0|in|}118|120|}
{2010214001|XXGiport_src_flow|202|0|322|0|{0|}120|10|}
{2010007001|XXGobject_proto_object|203|0|323|0|{}118|121|}
{2010212001|XXGvertex_oport_oport|204|0|325|0|{0|out|}121|122|}
{2010006001|XXGobject_psameas_object|205|0|327|0|{metadata|out_metadata|1|0|}122|121|}
{2010211001|XXGvertex_iport_iport|206|0|328|0|{0|in|}121|123|}
{2010006001|XXGobject_psameas_object|207|0|330|0|{metadata|in_metadata|1|0|}123|121|}
{2010006001|XXGobject_psameas_object|208|0|331|0|{Layout|Layout|0|0|}118|32|}
{2010006001|XXGobject_psameas_object|209|0|332|0|{in_metadata|out0_metadata|0|0|}118|76|}
{2010006001|XXGobject_psameas_object|210|0|333|0|{out_metadata|write_metadata|0|0|}110|32|}
{2010601001|XXGgraph_vertex_vertex|211|0|334|0|{Redefine_Format|}1|118|}
{2010601001|XXGgraph_vertex_vertex|212|0|335|0|{Reformat|}1|76|}
{2010601001|XXGgraph_vertex_vertex|213|0|336|0|{Replicate|}1|124|}
{2010212001|XXGvertex_oport_oport|214|0|338|0|{0|out|}124|125|}
{2010213001|XXGoport_dst_flow|215|0|340|0|{0|}125|13|}
{2010211001|XXGvertex_iport_iport|216|0|341|0|{0|in|}124|126|}
{2010214001|XXGiport_src_flow|217|0|343|0|{0|}126|14|}
{2010007001|XXGobject_proto_object|218|0|344|0|{}124|127|}
{2010212001|XXGvertex_oport_oport|219|0|346|0|{0|out|}127|128|}
{2010006001|XXGobject_psameas_object|220|0|348|0|{metadata|out_metadata|1|0|}128|127|}
{2010211001|XXGvertex_iport_iport|221|0|349|0|{0|in|}127|129|}
{2010006001|XXGobject_psameas_object|222|0|351|0|{metadata|in_metadata|1|0|}129|127|}
{2010006001|XXGobject_psameas_object|223|0|352|0|{Layout|Layout|0|0|}124|32|}
{2010006001|XXGobject_psameas_object|224|0|353|0|{in_metadata|write_metadata|0|0|}124|32|}
{2010006001|XXGobject_psameas_object|225|0|354|0|{out_metadata|write_metadata|0|0|}124|32|}
{2010601001|XXGgraph_vertex_vertex|226|0|355|0|{Rollup|}1|130|}
{2010212001|XXGvertex_oport_oport|227|0|357|0|{0|out|}130|131|}
{2010213001|XXGoport_dst_flow|228|0|359|0|{0|}131|16|}
{2010212001|XXGvertex_oport_oport|229|0|360|0|{1|reject|}130|132|}
{2010212001|XXGvertex_oport_oport|230|0|362|0|{2|error|}130|133|}
{2010212001|XXGvertex_oport_oport|231|0|364|0|{3|log|}130|134|}
{2010211001|XXGvertex_iport_iport|232|0|366|0|{0|in|}130|135|}
{2010214001|XXGiport_src_flow|233|0|368|0|{0|}135|15|}
{2010007001|XXGobject_proto_object|234|0|369|0|{}130|136|}
{2010212001|XXGvertex_oport_oport|235|0|371|0|{0|out|}136|137|}
{2010006001|XXGobject_psameas_object|236|0|373|0|{metadata|out_metadata|1|0|}137|136|}
{2010212001|XXGvertex_oport_oport|237|0|374|0|{1|reject|}136|138|}
{2010006001|XXGobject_psameas_object|238|0|376|0|{metadata|reject_metadata|1|0|}138|136|}
{2010212001|XXGvertex_oport_oport|239|0|377|0|{2|error|}136|139|}
{2010006001|XXGobject_psameas_object|240|0|379|0|{metadata|error_metadata|1|0|}139|136|}
{2010212001|XXGvertex_oport_oport|241|0|380|0|{3|log|}136|140|}
{2010006001|XXGobject_psameas_object|242|0|382|0|{metadata|log_metadata|1|0|}140|136|}
{2010211001|XXGvertex_iport_iport|243|0|383|0|{0|in|}136|141|}
{2010006001|XXGobject_psameas_object|244|0|385|0|{metadata|in_metadata|1|0|}141|136|}
{2010006001|XXGobject_psameas_object|245|0|386|0|{Layout|Layout|0|0|}130|50|}
{2010006001|XXGobject_psameas_object|246|0|387|0|{in_metadata|out1_metadata|0|0|}130|76|}
{2010006001|XXGobject_psameas_object|247|0|388|0|{out_metadata|write_metadata|0|0|}130|50|}
{2010006001|XXGobject_psameas_object|248|0|389|0|{reject_metadata|out1_metadata|0|0|}130|76|}
{2010601001|XXGgraph_vertex_vertex|249|0|390|0|{Row_Counts_per_file|}1|50|}
{2010601001|XXGgraph_vertex_vertex|250|0|391|0|{Trash|}1|142|}
{2010211001|XXGvertex_iport_iport|251|0|393|0|{0|in|}142|143|}
{2010214001|XXGiport_src_flow|252|0|395|0|{0|}143|6|}
{2010007001|XXGobject_proto_object|253|0|396|0|{}142|144|}
{2010211001|XXGvertex_iport_iport|254|0|398|0|{0|in|}144|145|}
{2010006001|XXGobject_psameas_object|255|0|400|0|{metadata|in_metadata|1|0|}145|144|}
{2010006001|XXGobject_psameas_object|256|0|401|0|{in_metadata|read_metadata|0|0|}142|146|}
{2010212001|XXGvertex_oport_oport|257|0|403|0|{0|read|}146|147|}
{2010213001|XXGoport_dst_flow|258|0|405|0|{0|}147|6|}
{2010007001|XXGobject_proto_object|259|0|406|0|{}146|148|}
{2010212001|XXGvertex_oport_oport|260|0|408|0|{0|read|}148|149|}
{2010006001|XXGobject_psameas_object|261|0|410|0|{metadata|read_metadata|1|0|}149|148|}
{2010601001|XXGgraph_vertex_vertex|262|0|411|0|{View_Data|}1|146|}
{2010601001|XXGgraph_vertex_vertex|263|0|412|0|{source_file|}1|32|}
{2010109001|XXGobject_property_value|264|0|413|0|{0|TrackingThumbprint|72|}1|150|}
