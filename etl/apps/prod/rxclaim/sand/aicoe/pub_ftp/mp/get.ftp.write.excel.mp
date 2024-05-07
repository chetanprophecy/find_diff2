@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|136|rel_count|242|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_Partition_by_Round_robin|@34|9|FHK|@{0|}}
{30001002|XXparameter|SOURCE|phs.specialty_list_ndc|3|9|RFK||{0|}}
{30001002|XXparameter|LOGICAL_FILENAMES|Specialty_NDC_\\\\d\{8\}\\\\.xlsx|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_BASE|$[ re_replace(SOURCE, '\\\\..*', '')]|3|9|RK||{0|}}
{30001002|XXparameter|SOURCE_DML|$AI_DML/phs/phs.specialty_list_ndc.excel.dml|3|9|RFK||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|CLEAN_DML|$AI_DML/$SOURCE_BASE/$SOURCE.dml|3|2|FK$||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP|3|2|RFK$||{0|}}
{30001002|XXparameter|FLATTEN_XFR|$AI_XFR/get.ftp.write.standard_normalize.xfr|3|9|RFK||{0|}}
{30001002|XXparameter|_parameters_of_Replicate_1|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Rollup|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Row_Counts_per_file|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Manifest|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Filter_by_Expression|@34|9|FHK|@{0|}}
{30001002|XXparameter|DROP_HEADER_EXPRESSION|1|3|9|RFK||{0|}}
{30001002|XXparameter|FILE_LIST_OR_PATTERN_LIST|pattern_list|15|2|RFK$||{2|file_list|pattern_list|}}
{30001002|XXparameter|PATTERN_LIST_FILTER|vector_sum(for (let pat in re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')):
             re_index(logical_filename, pat) > 0) > 0|3|9|RK||{0|}}
{30001002|XXparameter|FILE_LIST_FILTER|logical_filename member re_split($["'" + LOGICAL_FILENAMES + "'"], '(\\r\\n)\|(\\n)')|3|9|RK||{0|}}
{30001002|XXparameter|_parameters_of_Flatten|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Drop_Headers|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_source_file|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Replicate_2|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Read_Excel_Flow|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Reformat|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Lookup_Audit_Fields|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.0.6.6|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|992000|432000|0|get.ftp.write.excel|davidmiller||1|10|0||6||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|991000|432000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.1|{1|1|}Job 'get.ftp.write.excel' Execution Status Report

Compilation of graph "get.ftp.write.excel" started at Tuesday, October 23, 2012 22:02:11

Job "get.ftp.write.excel" Execution started at Tuesday, October 23, 2012 22:02:13
***** Job execution failed at Tuesday, October 23, 2012 22:02:29 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:16
Run performed by user davidmiller
Total data moved through all flows: 1 records (340 bytes)
Total CPU time (all processes): 2 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@dev - abi||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{8|333000|99000|333000|99000|361000|99000|368000|99000|}6267|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{8|798000|99000|818000|99000|832000|99000|853000|99000|}6301|18|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{8|289000|289000|319000|289000|356000|289000|377000|289000|}6314|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{12|991000|99000|1011000|99000|1011000|196000|18000|196000|18000|294000|39000|294000|}6304|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{8|170000|294000|190000|294000|196000|294000|217000|294000|}6305|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{8|506000|99000|526000|99000|527000|99000|548000|99000|}6291|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{8|498000|289000|518000|289000|526000|289000|547000|289000|}6315|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{8|679000|99000|699000|99000|705000|99000|726000|99000|}6300|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{8|619000|289000|639000|289000|656000|289000|677000|289000|}6312|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.17741934955120087|{12|289000|299000|309000|299000|326000|299000|326000|394000|406000|394000|427000|394000|}6317|19|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{8|548000|394000|568000|394000|600000|394000|621000|394000|}6318|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{8|108000|99000|128000|99000|158000|99000|179000|99000|}6294|17|}}
{2010501005|XXGpvertex|17|0|33|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$DROP_HEADER_EXPRESSION|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@30000|248000|50000|249000|110000|87000|6306|Drop Headers|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|18|0|35|0|{@{}@159000|289000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|19|0|38|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|20|0|40|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|21|0|42|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|22|0|44|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|23|0|46|0|{@{}@40000|289000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|24|0|49|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|25|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|26|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|27|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|28|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|29|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|31|0|69|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_PENDING|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@218000|266099|228000|275000|51000|41000|6303|Replicate-1|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|32|0|71|0|{@{}@278000|284000|11000|21000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|33|0|75|0|{@{}@218000|289000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|34|0|78|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655971|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|35|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|36|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|37|0|86|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|type manifest_type = $[read_type(AI_DML + '/get.manifest.dml')];


/*Reformat operation*/
out::reformat(in)=
begin
  let manifest_type m = lookup('Manifest', in.filename);
  out.data.* :: in.*;
  out.* :: m.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$[add_field(read_type("$AI_DML/get.manifest.dml"), "data", add_fields("record\\nend", record_info(read_type(SOURCE_DML))))]|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@844000|45000|864000|46000|117000|106000|6302|Lookup Audit Fields|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|88|0|{@{}@980000|94000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|91|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|40|0|93|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|95|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|97|0|{@{}@854000|94000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|100|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|44|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|45|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|49|0|119|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sheet_header_row|1|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|// Specify filename, xls_content, or both.  If only filename is
// specified, then Read_Excel_Flow will read the specified filename.
// If only xls_content is specified, then Read_Excel_Flow will process
// the xls_content as though it contained the contents of an xls or
// xlsx file.  If both filename and xls_content are specified, then
// Read_Excel_Flow will process the xls_content, and tag each output
// record with the specified filename.
utf8 record
  string('\\t') filename = ''; 
  void(big endian integer(4)) xls_content = '';
end|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$SOURCE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Excel/Read_Excel_Flow.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@539000|54000|559000|55000|110000|106000|6293|Read Excel Flow|Ab Initio Software|Built-in 2.13.m8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|50|0|121|0|{@{}@668000|94000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|51|0|124|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|52|0|126|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|53|0|128|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|130|0|{@{}@549000|94000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|55|0|133|0|{Read Excel content from input flow|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Read_Excel_Flow|3|1|Hl||{0|}}
{30001002|XXparameter|image__|excel-connector.ksh|3|2|H$||{0|}}
{30001002|XXparameter|sheet_selection|by-index|15|1|Fl||{3|by-name|by-index|all|}}
{30001002|XXparameter|sheet_selection.display_name|sheet-selection|3|9|P|@{0|}}
{30001002|XXparameter|sheet_selection.update_clauses|update_value all|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name|Sheet1|3|2|RFK$|Name of sheet in Excel|{0|}}
{30001002|XXparameter|sheet_name.display_name|sheet-name|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name.keyword|sheet-name|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name.condition|param sheet-selection by-name|3|15|P?|@{0|}}
{30001002|XXparameter|sheet_index|1|1|2|RFK$|Index of sheet in Excel, starting at 1|{0|}}
{30001002|XXparameter|sheet_index.display_name|sheet-index|3|9|P|@{0|}}
{30001002|XXparameter|sheet_index.keyword|sheet-index|3|9|P|@{0|}}
{30001002|XXparameter|sheet_index.condition|param sheet-selection by-index|3|15|P?|@{0|}}
{30001002|XXparameter|sheet_header_row|0|1|2|RFK$|Excel row number containing column names.  Rows up to and including header-row will not be read.  Set to 0 if there is no header row|{0|}}
{30001002|XXparameter|sheet_header_row.display_name|sheet-header-row|3|9|P|@{0|}}
{30001002|XXparameter|sheet_header_row.keyword|sheet-header-row|3|9|P|@{0|}}
{30001002|XXparameter|sheet_header_row.condition|param sheet-selection by-*|3|15|P?|@{0|}}
{30001002|XXparameter|utf8|True|13|1|FKl|Use UTF-8 encoding for output (recommended).  Otherwise, encoding will be locale specific.|{0|}}
{30001002|XXparameter|utf8.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter|\\0|3|2|FK$|Delimiter of last field or record.|{0|}}
{30001002|XXparameter|record_delimiter.display_name|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.keyword|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.update_clauses|update_value \\n|3|9|P|@{0|}}
{30001002|XXparameter|old_style_quoting|False|13|1|Fl|Quote quotes, tabs, and newlines for backwards compatibility with ReadSeparatedValues|{0|}}
{30001002|XXparameter|old_style_quoting.display_name|old-style-quoting|3|9|P|@{0|}}
{30001002|XXparameter|old_style_quoting.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting|True|13|1|Kl|inverse of old-style-quoting|{0|}}
{30001002|XXparameter|no_quoting.display_name|no-quoting|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting.keyword|no-quoting|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting.condition|param old-style-quoting False|3|15|P?|@{0|}}
{30001002|XXparameter|formula_results|True|13|1|FKl|Extract formula results instead of the formula itself|{0|}}
{30001002|XXparameter|formula_results.display_name|formula-results|3|9|P|@{0|}}
{30001002|XXparameter|formula_results.keyword|formula-results|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation|never|15|1|FKl|Use scientific notation for output of numbers|{3|never|sometimes|always|}}
{30001002|XXparameter|scientific_notation.display_name|scientific-notation|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation.keyword|scientific-notation|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation.update_clauses|update_value sometimes|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows|True|13|1|FKl|Ignore rows that have no cell values|{0|}}
{30001002|XXparameter|skip_empty_rows.display_name|skip-empty-rows|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows.keyword|skip-empty-rows|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|use_format|False|13|1|FKl|Extract format information associated with the cell. Use gendml after changing this.|{0|}}
{30001002|XXparameter|use_format.display_name|use-format|3|9|P|@{0|}}
{30001002|XXparameter|use_format.keyword|use-format|3|9|P|@{0|}}
{30001002|XXparameter|use_format.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes|*|3|2|RFK$|Format attributes of the cell. See $AB_COMPONENTS/Interchange/Excel/excel_utils.dml for syntax.|{0|}}
{30001002|XXparameter|format_attributes.display_name|format-attributes|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes.keyword|format-attributes|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes.condition|param use-format True|3|15|P?|@{0|}}
{30001002|XXparameter|JAVA_HOME||3|2|FK$|Home directory for Java installation; if unset, $JAVA_HOME is used.|{0|}}
{30001002|XXparameter|command_options||3|2|FK$|Advanced options that are only required in unusual situations|{0|}}
{30001002|XXparameter|command_options.display_name|command-options|3|9|P|@{0|}}
{30001002|XXparameter|command_options.keyword|command-options|3|9|P|@{0|}}
{30001002|XXparameter|java_options|-Xmx768m|3|2|FK$|Options passed directly to Java, e.g. '-Xmx512m'|{0|}}
{30001002|XXparameter|java_options.display_name|java-options|3|9|P|@{0|}}
{30001002|XXparameter|java_options.keyword|java-options|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.2.m9|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|file_missing_keyword file-missing sheet_missing_keyword sheet-missing invalid_excel_file_keyword invalid-excel-file limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332536929|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: in = "// Specify filename, xls_content, or both.  If only filename is
// specified, then Read_Excel_Flow will read the specified filename.
// If only xls_content is specified, then Read_Excel_Flow will process
// the xls_content as though it contained the contents of an xls or
// xlsx file.  If both filename and xls_content are specified, then
// Read_Excel_Flow will process the xls_content, and tag each output
// record with the specified filename.
utf8 record
  string('\\\\t') filename = ''; 
  void(big endian integer(4)) xls_content = '';
end"
metadata type: out = "utf8 record string('\\\\t') filename = ''; string('\\\\t') sheet; string('\\\\0') line; end"
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|56|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|57|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|58|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|59|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|60|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|61|0|150|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0201|3|2|$|@{0|}}
{30001002|XXparameter|key|\{file_to_read\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$WORKDIR/manifest.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/manifest.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$AI_DML/get.manifest.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@20000|52000|42000|72000|56000|50000|6295|Manifest|Ab Initio Software||1|20|0||6||33025|-1|-1|}}
{2010203004|XXGoport|62|0|152|0|{@{}@97000|94000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|63|0|155|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|64|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|65|0|167|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$[if (FILE_LIST_OR_PATTERN_LIST == 'file_list')
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
}}@0|@170000|56000|190000|57000|133000|87000|6230|Filter by Expression|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|169|0|{@{}@322000|94000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|67|0|172|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|68|0|174|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|69|0|176|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|70|0|178|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|71|0|180|0|{@{}@180000|94000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|72|0|183|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|73|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|74|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|75|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|76|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|77|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|79|0|208|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$FLATTEN_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@368000|241000|388000|250000|100000|76000|6316|Flatten|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|210|0|{@{}@487000|284000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|81|0|213|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|82|0|215|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|83|0|217|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|219|0|{@{}@378000|284000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|222|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|86|0|224|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|88|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|89|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|91|0|239|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_PENDING/source.fixed.$SOURCE.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@666000|244000|688000|264000|56000|50000|6313|source file|Ab Initio Software||1|20|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|92|0|241|0|{@{}@678000|284000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|93|0|244|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|94|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|95|0|254|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@726604|69000|737000|78000|51000|41000|6299|Partition by Round-robin|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|256|0|{@{}@787000|94000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|97|0|259|0|{@{}@727000|94000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|98|0|262|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1314655975|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|99|0|264|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|100|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|101|0|274|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.filename :: in.file_to_read;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|@359000|50000|379000|59000|117000|76000|6269|Reformat|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|102|0|276|0|{@{}@495000|94000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|103|0|279|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|104|0|281|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|105|0|283|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|106|0|285|0|{@{}@369000|94000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|107|0|288|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537107|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|108|0|290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|109|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|110|0|297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|111|0|300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|112|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|311|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@548000|260000|558000|269000|51000|41000|6308|Replicate-2|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|313|0|{@{}@608000|284000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|115|0|316|0|{@{}@548000|284000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|116|0|319|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|117|0|321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|118|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|119|0|330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sorted_input|False|3|9||@{0|}}
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
}}@0|@418000|347000|438000|356000|100000|76000|6319|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|120|0|332|0|{@{}@537000|389000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|121|0|335|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|122|0|337|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|123|0|339|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|341|0|{@{}@428000|389000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|125|0|344|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|126|0|346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|127|0|349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|128|0|352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|129|0|355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|130|0|358|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|131|0|361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/audit.row_counts.$\{SOURCE\}.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/get.audit.ftp_row_counts.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@610000|349000|632000|369000|56000|50000|6307|Row Counts per file|Ab Initio Software||1|20|0||6||33025|-1|-1|}}
{2010202004|XXGiport|132|0|363|0|{@{}@622000|389000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|133|0|366|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|134|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010110002|XXGconstant|135|0|376|0|{@{}@{1|9475974|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_6|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_7|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_8|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_9|}1|16|}
{2010601001|XXGgraph_vertex_vertex|16|0|32|0|{Drop_Headers|}1|17|}
{2010212001|XXGvertex_oport_oport|17|0|34|0|{0|out|}17|18|}
{2010213001|XXGoport_dst_flow|18|0|36|0|{0|}18|9|}
{2010212001|XXGvertex_oport_oport|19|0|37|0|{1|deselect|}17|19|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{2|reject|}17|20|}
{2010212001|XXGvertex_oport_oport|21|0|41|0|{3|error|}17|21|}
{2010212001|XXGvertex_oport_oport|22|0|43|0|{4|log|}17|22|}
{2010211001|XXGvertex_iport_iport|23|0|45|0|{0|in|}17|23|}
{2010214001|XXGiport_src_flow|24|0|47|0|{0|}23|8|}
{2010007001|XXGobject_proto_object|25|0|48|0|{}17|24|}
{2010212001|XXGvertex_oport_oport|26|0|50|0|{0|out|}24|25|}
{2010006001|XXGobject_psameas_object|27|0|52|0|{metadata|out_metadata|1|0|}25|24|}
{2010212001|XXGvertex_oport_oport|28|0|53|0|{1|deselect|}24|26|}
{2010006001|XXGobject_psameas_object|29|0|55|0|{metadata|deselect_metadata|1|0|}26|24|}
{2010212001|XXGvertex_oport_oport|30|0|56|0|{2|reject|}24|27|}
{2010006001|XXGobject_psameas_object|31|0|58|0|{metadata|reject_metadata|1|0|}27|24|}
{2010212001|XXGvertex_oport_oport|32|0|59|0|{3|error|}24|28|}
{2010006001|XXGobject_psameas_object|33|0|61|0|{metadata|error_metadata|1|0|}28|24|}
{2010212001|XXGvertex_oport_oport|34|0|62|0|{4|log|}24|29|}
{2010006001|XXGobject_psameas_object|35|0|64|0|{metadata|log_metadata|1|0|}29|24|}
{2010211001|XXGvertex_iport_iport|36|0|65|0|{0|in|}24|30|}
{2010006001|XXGobject_psameas_object|37|0|67|0|{metadata|in_metadata|1|0|}30|24|}
{2010006001|XXGobject_psameas_object|38|0|68|0|{Layout|Layout|0|0|}17|31|}
{2010212001|XXGvertex_oport_oport|39|0|70|0|{0|out|}31|32|}
{2010213001|XXGoport_dst_flow|40|0|72|0|{0|}32|7|}
{2010213001|XXGoport_dst_flow|41|0|73|0|{1|}32|14|}
{2010211001|XXGvertex_iport_iport|42|0|74|0|{0|in|}31|33|}
{2010214001|XXGiport_src_flow|43|0|76|0|{0|}33|9|}
{2010007001|XXGobject_proto_object|44|0|77|0|{}31|34|}
{2010212001|XXGvertex_oport_oport|45|0|79|0|{0|out|}34|35|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{metadata|out_metadata|1|0|}35|34|}
{2010211001|XXGvertex_iport_iport|47|0|82|0|{0|in|}34|36|}
{2010006001|XXGobject_psameas_object|48|0|84|0|{metadata|in_metadata|1|0|}36|34|}
{2010006001|XXGobject_psameas_object|49|0|85|0|{in_metadata|out0_metadata|0|0|}31|37|}
{2010212001|XXGvertex_oport_oport|50|0|87|0|{0|out0|}37|38|}
{2010213001|XXGoport_dst_flow|51|0|89|0|{0|}38|8|}
{2010212001|XXGvertex_oport_oport|52|0|90|0|{1|reject0|}37|39|}
{2010212001|XXGvertex_oport_oport|53|0|92|0|{2|error0|}37|40|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{3|log|}37|41|}
{2010211001|XXGvertex_iport_iport|55|0|96|0|{0|in|}37|42|}
{2010214001|XXGiport_src_flow|56|0|98|0|{0|}42|6|}
{2010007001|XXGobject_proto_object|57|0|99|0|{}37|43|}
{2010212001|XXGvertex_oport_oport|58|0|101|0|{0|out0|}43|44|}
{2010006001|XXGobject_psameas_object|59|0|103|0|{metadata|out0_metadata|1|0|}44|43|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{transform0|transform0|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|61|0|105|0|{1|reject0|}43|45|}
{2010006001|XXGobject_psameas_object|62|0|107|0|{metadata|reject0_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|63|0|108|0|{2|error0|}43|46|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{metadata|error0_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|65|0|111|0|{3|log|}43|47|}
{2010006001|XXGobject_psameas_object|66|0|113|0|{metadata|log_metadata|1|0|}47|43|}
{2010211001|XXGvertex_iport_iport|67|0|114|0|{0|in|}43|48|}
{2010006001|XXGobject_psameas_object|68|0|116|0|{metadata|in_metadata|1|0|}48|43|}
{2010006001|XXGobject_psameas_object|69|0|117|0|{Layout|Layout|0|0|}37|31|}
{2010006001|XXGobject_psameas_object|70|0|118|0|{in_metadata|out_metadata|0|0|}37|49|}
{2010212001|XXGvertex_oport_oport|71|0|120|0|{0|out|}49|50|}
{2010213001|XXGoport_dst_flow|72|0|122|0|{0|}50|12|}
{2010212001|XXGvertex_oport_oport|73|0|123|0|{1|reject|}49|51|}
{2010212001|XXGvertex_oport_oport|74|0|125|0|{2|error|}49|52|}
{2010212001|XXGvertex_oport_oport|75|0|127|0|{3|log|}49|53|}
{2010211001|XXGvertex_iport_iport|76|0|129|0|{0|in|}49|54|}
{2010214001|XXGiport_src_flow|77|0|131|0|{0|}54|10|}
{2010007001|XXGobject_proto_object|78|0|132|0|{}49|55|}
{2010212001|XXGvertex_oport_oport|79|0|134|0|{0|out|}55|56|}
{2010006001|XXGobject_psameas_object|80|0|136|0|{metadata|out_metadata|1|0|}56|55|}
{2010212001|XXGvertex_oport_oport|81|0|137|0|{1|reject|}55|57|}
{2010006001|XXGobject_psameas_object|82|0|139|0|{metadata|reject_metadata|1|0|}57|55|}
{2010212001|XXGvertex_oport_oport|83|0|140|0|{2|error|}55|58|}
{2010006001|XXGobject_psameas_object|84|0|142|0|{metadata|error_metadata|1|0|}58|55|}
{2010212001|XXGvertex_oport_oport|85|0|143|0|{3|log|}55|59|}
{2010006001|XXGobject_psameas_object|86|0|145|0|{metadata|log_metadata|1|0|}59|55|}
{2010211001|XXGvertex_iport_iport|87|0|146|0|{0|in|}55|60|}
{2010006001|XXGobject_psameas_object|88|0|148|0|{metadata|in_metadata|1|0|}60|55|}
{2010006001|XXGobject_psameas_object|89|0|149|0|{Layout|Layout|0|0|}49|61|}
{2010212001|XXGvertex_oport_oport|90|0|151|0|{0|read|}61|62|}
{2010213001|XXGoport_dst_flow|91|0|153|0|{0|}62|16|}
{2010007001|XXGobject_proto_object|92|0|154|0|{}61|63|}
{2010212001|XXGvertex_oport_oport|93|0|156|0|{0|read|}63|64|}
{2010006001|XXGobject_psameas_object|94|0|158|0|{metadata|read_metadata|1|0|}64|63|}
{2010006001|XXGobject_psameas_object|95|0|159|0|{reject_metadata|in_metadata|0|0|}49|49|}
{2010006001|XXGobject_psameas_object|96|0|160|0|{reject0_metadata|out_metadata|0|0|}37|49|}
{2010006001|XXGobject_psameas_object|97|0|161|0|{out_metadata|out0_metadata|0|0|}31|37|}
{2010006001|XXGobject_psameas_object|98|0|162|0|{deselect_metadata|out0_metadata|0|0|}17|37|}
{2010006001|XXGobject_psameas_object|99|0|163|0|{in_metadata|out0_metadata|0|0|}17|37|}
{2010006001|XXGobject_psameas_object|100|0|164|0|{out_metadata|out0_metadata|0|0|}17|37|}
{2010006001|XXGobject_psameas_object|101|0|165|0|{reject_metadata|out0_metadata|0|0|}17|37|}
{2010601001|XXGgraph_vertex_vertex|102|0|166|0|{Filter_by_Expression|}1|65|}
{2010212001|XXGvertex_oport_oport|103|0|168|0|{0|out|}65|66|}
{2010213001|XXGoport_dst_flow|104|0|170|0|{0|}66|5|}
{2010212001|XXGvertex_oport_oport|105|0|171|0|{1|deselect|}65|67|}
{2010212001|XXGvertex_oport_oport|106|0|173|0|{2|reject|}65|68|}
{2010212001|XXGvertex_oport_oport|107|0|175|0|{3|error|}65|69|}
{2010212001|XXGvertex_oport_oport|108|0|177|0|{4|log|}65|70|}
{2010211001|XXGvertex_iport_iport|109|0|179|0|{0|in|}65|71|}
{2010214001|XXGiport_src_flow|110|0|181|0|{0|}71|16|}
{2010007001|XXGobject_proto_object|111|0|182|0|{}65|72|}
{2010212001|XXGvertex_oport_oport|112|0|184|0|{0|out|}72|73|}
{2010006001|XXGobject_psameas_object|113|0|186|0|{metadata|out_metadata|1|0|}73|72|}
{2010212001|XXGvertex_oport_oport|114|0|187|0|{1|deselect|}72|74|}
{2010006001|XXGobject_psameas_object|115|0|189|0|{metadata|deselect_metadata|1|0|}74|72|}
{2010212001|XXGvertex_oport_oport|116|0|190|0|{2|reject|}72|75|}
{2010006001|XXGobject_psameas_object|117|0|192|0|{metadata|reject_metadata|1|0|}75|72|}
{2010212001|XXGvertex_oport_oport|118|0|193|0|{3|error|}72|76|}
{2010006001|XXGobject_psameas_object|119|0|195|0|{metadata|error_metadata|1|0|}76|72|}
{2010212001|XXGvertex_oport_oport|120|0|196|0|{4|log|}72|77|}
{2010006001|XXGobject_psameas_object|121|0|198|0|{metadata|log_metadata|1|0|}77|72|}
{2010211001|XXGvertex_iport_iport|122|0|199|0|{0|in|}72|78|}
{2010006001|XXGobject_psameas_object|123|0|201|0|{metadata|in_metadata|1|0|}78|72|}
{2010006001|XXGobject_psameas_object|124|0|202|0|{Layout|Layout|0|0|}65|61|}
{2010006001|XXGobject_psameas_object|125|0|203|0|{deselect_metadata|read_metadata|0|0|}65|61|}
{2010006001|XXGobject_psameas_object|126|0|204|0|{in_metadata|read_metadata|0|0|}65|61|}
{2010006001|XXGobject_psameas_object|127|0|205|0|{out_metadata|read_metadata|0|0|}65|61|}
{2010006001|XXGobject_psameas_object|128|0|206|0|{reject_metadata|read_metadata|0|0|}65|61|}
{2010601001|XXGgraph_vertex_vertex|129|0|207|0|{Flatten|}1|79|}
{2010212001|XXGvertex_oport_oport|130|0|209|0|{0|out|}79|80|}
{2010213001|XXGoport_dst_flow|131|0|211|0|{0|}80|11|}
{2010212001|XXGvertex_oport_oport|132|0|212|0|{1|reject|}79|81|}
{2010212001|XXGvertex_oport_oport|133|0|214|0|{2|error|}79|82|}
{2010212001|XXGvertex_oport_oport|134|0|216|0|{3|log|}79|83|}
{2010211001|XXGvertex_iport_iport|135|0|218|0|{0|in|}79|84|}
{2010214001|XXGiport_src_flow|136|0|220|0|{0|}84|7|}
{2010007001|XXGobject_proto_object|137|0|221|0|{}79|85|}
{2010212001|XXGvertex_oport_oport|138|0|223|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|139|0|225|0|{metadata|out_metadata|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|140|0|226|0|{1|reject|}85|87|}
{2010006001|XXGobject_psameas_object|141|0|228|0|{metadata|reject_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|142|0|229|0|{2|error|}85|88|}
{2010006001|XXGobject_psameas_object|143|0|231|0|{metadata|error_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|144|0|232|0|{3|log|}85|89|}
{2010006001|XXGobject_psameas_object|145|0|234|0|{metadata|log_metadata|1|0|}89|85|}
{2010211001|XXGvertex_iport_iport|146|0|235|0|{0|in|}85|90|}
{2010006001|XXGobject_psameas_object|147|0|237|0|{metadata|in_metadata|1|0|}90|85|}
{2010006001|XXGobject_psameas_object|148|0|238|0|{Layout|Layout|0|0|}79|91|}
{2010211001|XXGvertex_iport_iport|149|0|240|0|{0|write|}91|92|}
{2010214001|XXGiport_src_flow|150|0|242|0|{0|}92|13|}
{2010007001|XXGobject_proto_object|151|0|243|0|{}91|93|}
{2010211001|XXGvertex_iport_iport|152|0|245|0|{0|write|}93|94|}
{2010006001|XXGobject_psameas_object|153|0|247|0|{metadata|write_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|154|0|248|0|{in_metadata|out0_metadata|0|0|}79|37|}
{2010006001|XXGobject_psameas_object|155|0|249|0|{out_metadata|write_metadata|0|0|}79|91|}
{2010006001|XXGobject_psameas_object|156|0|250|0|{reject_metadata|out0_metadata|0|0|}79|37|}
{2010601001|XXGgraph_vertex_vertex|157|0|251|0|{Lookup_Audit_Fields|}1|37|}
{2010601001|XXGgraph_vertex_vertex|158|0|252|0|{Manifest|}1|61|}
{2010601001|XXGgraph_vertex_vertex|159|0|253|0|{Partition_by_Round_robin|}1|95|}
{2010212001|XXGvertex_oport_oport|160|0|255|0|{0|out|}95|96|}
{2010213001|XXGoport_dst_flow|161|0|257|0|{0|}96|6|}
{2010211001|XXGvertex_iport_iport|162|0|258|0|{0|in|}95|97|}
{2010214001|XXGiport_src_flow|163|0|260|0|{0|}97|12|}
{2010007001|XXGobject_proto_object|164|0|261|0|{}95|98|}
{2010212001|XXGvertex_oport_oport|165|0|263|0|{0|out|}98|99|}
{2010006001|XXGobject_psameas_object|166|0|265|0|{metadata|out_metadata|1|0|}99|98|}
{2010211001|XXGvertex_iport_iport|167|0|266|0|{0|in|}98|100|}
{2010006001|XXGobject_psameas_object|168|0|268|0|{metadata|in_metadata|1|0|}100|98|}
{2010006001|XXGobject_psameas_object|169|0|269|0|{Layout|Layout|0|0|}95|61|}
{2010006001|XXGobject_psameas_object|170|0|270|0|{in_metadata|out_metadata|0|0|}95|49|}
{2010006001|XXGobject_psameas_object|171|0|271|0|{out_metadata|out_metadata|0|0|}95|49|}
{2010601001|XXGgraph_vertex_vertex|172|0|272|0|{Read_Excel_Flow|}1|49|}
{2010601001|XXGgraph_vertex_vertex|173|0|273|0|{Reformat|}1|101|}
{2010212001|XXGvertex_oport_oport|174|0|275|0|{0|out0|}101|102|}
{2010213001|XXGoport_dst_flow|175|0|277|0|{0|}102|10|}
{2010212001|XXGvertex_oport_oport|176|0|278|0|{1|reject0|}101|103|}
{2010212001|XXGvertex_oport_oport|177|0|280|0|{2|error0|}101|104|}
{2010212001|XXGvertex_oport_oport|178|0|282|0|{3|log|}101|105|}
{2010211001|XXGvertex_iport_iport|179|0|284|0|{0|in|}101|106|}
{2010214001|XXGiport_src_flow|180|0|286|0|{0|}106|5|}
{2010007001|XXGobject_proto_object|181|0|287|0|{}101|107|}
{2010212001|XXGvertex_oport_oport|182|0|289|0|{0|out0|}107|108|}
{2010006001|XXGobject_psameas_object|183|0|291|0|{metadata|out0_metadata|1|0|}108|107|}
{2010006001|XXGobject_psameas_object|184|0|292|0|{transform0|transform0|1|0|}108|107|}
{2010212001|XXGvertex_oport_oport|185|0|293|0|{1|reject0|}107|109|}
{2010006001|XXGobject_psameas_object|186|0|295|0|{metadata|reject0_metadata|1|0|}109|107|}
{2010212001|XXGvertex_oport_oport|187|0|296|0|{2|error0|}107|110|}
{2010006001|XXGobject_psameas_object|188|0|298|0|{metadata|error0_metadata|1|0|}110|107|}
{2010212001|XXGvertex_oport_oport|189|0|299|0|{3|log|}107|111|}
{2010006001|XXGobject_psameas_object|190|0|301|0|{metadata|log_metadata|1|0|}111|107|}
{2010211001|XXGvertex_iport_iport|191|0|302|0|{0|in|}107|112|}
{2010006001|XXGobject_psameas_object|192|0|304|0|{metadata|in_metadata|1|0|}112|107|}
{2010006001|XXGobject_psameas_object|193|0|305|0|{Layout|Layout|0|0|}101|61|}
{2010006001|XXGobject_psameas_object|194|0|306|0|{in_metadata|read_metadata|0|0|}101|61|}
{2010006001|XXGobject_psameas_object|195|0|307|0|{out0_metadata|in_metadata|0|0|}101|49|}
{2010006001|XXGobject_psameas_object|196|0|308|0|{reject0_metadata|read_metadata|0|0|}101|61|}
{2010601001|XXGgraph_vertex_vertex|197|0|309|0|{Replicate_1|}1|31|}
{2010601001|XXGgraph_vertex_vertex|198|0|310|0|{Replicate_2|}1|113|}
{2010212001|XXGvertex_oport_oport|199|0|312|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|200|0|314|0|{0|}114|13|}
{2010211001|XXGvertex_iport_iport|201|0|315|0|{0|in|}113|115|}
{2010214001|XXGiport_src_flow|202|0|317|0|{0|}115|11|}
{2010007001|XXGobject_proto_object|203|0|318|0|{}113|116|}
{2010212001|XXGvertex_oport_oport|204|0|320|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|205|0|322|0|{metadata|out_metadata|1|0|}117|116|}
{2010211001|XXGvertex_iport_iport|206|0|323|0|{0|in|}116|118|}
{2010006001|XXGobject_psameas_object|207|0|325|0|{metadata|in_metadata|1|0|}118|116|}
{2010006001|XXGobject_psameas_object|208|0|326|0|{Layout|Layout|0|0|}113|91|}
{2010006001|XXGobject_psameas_object|209|0|327|0|{in_metadata|write_metadata|0|0|}113|91|}
{2010006001|XXGobject_psameas_object|210|0|328|0|{out_metadata|write_metadata|0|0|}113|91|}
{2010601001|XXGgraph_vertex_vertex|211|0|329|0|{Rollup|}1|119|}
{2010212001|XXGvertex_oport_oport|212|0|331|0|{0|out|}119|120|}
{2010213001|XXGoport_dst_flow|213|0|333|0|{0|}120|15|}
{2010212001|XXGvertex_oport_oport|214|0|334|0|{1|reject|}119|121|}
{2010212001|XXGvertex_oport_oport|215|0|336|0|{2|error|}119|122|}
{2010212001|XXGvertex_oport_oport|216|0|338|0|{3|log|}119|123|}
{2010211001|XXGvertex_iport_iport|217|0|340|0|{0|in|}119|124|}
{2010214001|XXGiport_src_flow|218|0|342|0|{0|}124|14|}
{2010007001|XXGobject_proto_object|219|0|343|0|{}119|125|}
{2010212001|XXGvertex_oport_oport|220|0|345|0|{0|out|}125|126|}
{2010006001|XXGobject_psameas_object|221|0|347|0|{metadata|out_metadata|1|0|}126|125|}
{2010212001|XXGvertex_oport_oport|222|0|348|0|{1|reject|}125|127|}
{2010006001|XXGobject_psameas_object|223|0|350|0|{metadata|reject_metadata|1|0|}127|125|}
{2010212001|XXGvertex_oport_oport|224|0|351|0|{2|error|}125|128|}
{2010006001|XXGobject_psameas_object|225|0|353|0|{metadata|error_metadata|1|0|}128|125|}
{2010212001|XXGvertex_oport_oport|226|0|354|0|{3|log|}125|129|}
{2010006001|XXGobject_psameas_object|227|0|356|0|{metadata|log_metadata|1|0|}129|125|}
{2010211001|XXGvertex_iport_iport|228|0|357|0|{0|in|}125|130|}
{2010006001|XXGobject_psameas_object|229|0|359|0|{metadata|in_metadata|1|0|}130|125|}
{2010006001|XXGobject_psameas_object|230|0|360|0|{Layout|Layout|0|0|}119|131|}
{2010211001|XXGvertex_iport_iport|231|0|362|0|{0|write|}131|132|}
{2010214001|XXGiport_src_flow|232|0|364|0|{0|}132|15|}
{2010007001|XXGobject_proto_object|233|0|365|0|{}131|133|}
{2010211001|XXGvertex_iport_iport|234|0|367|0|{0|write|}133|134|}
{2010006001|XXGobject_psameas_object|235|0|369|0|{metadata|write_metadata|1|0|}134|133|}
{2010006001|XXGobject_psameas_object|236|0|370|0|{in_metadata|out0_metadata|0|0|}119|37|}
{2010006001|XXGobject_psameas_object|237|0|371|0|{out_metadata|write_metadata|0|0|}119|131|}
{2010006001|XXGobject_psameas_object|238|0|372|0|{reject_metadata|out0_metadata|0|0|}119|37|}
{2010601001|XXGgraph_vertex_vertex|239|0|373|0|{Row_Counts_per_file|}1|131|}
{2010601001|XXGgraph_vertex_vertex|240|0|374|0|{source_file|}1|91|}
{2010109001|XXGobject_property_value|241|0|375|0|{0|TrackingThumbprint|72|}1|135|}
