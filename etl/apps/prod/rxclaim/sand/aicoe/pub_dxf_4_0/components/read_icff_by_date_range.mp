@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|164|rel_count|234|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|TARGET_NAME|\{SYSTEM\}.\{SOURCE\}         //This must be set appropriately in the private pet|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_LOWER|$[string_downcase(TARGET_NAME)]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[string_split(TARGET_LOWER, ".")[0]]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_TABLE|$[string_split(TARGET_LOWER, ".")[1]]|3|9|RK|@{0|}}
{30001002|XXparameter|START_DATE|$[(datetime("YYYYMMDD"))now1()]|3|9|RFK||{0|}}
{30001002|XXparameter|END_DATE|$[(datetime("YYYYMMDD"))now1()]|3|9|RFK||{0|}}
{30001002|XXparameter|RIIDR_DATA_PATH|$[PUB_DATAHUB_MFS_LOOKUP]|3|9|RFK|Added this parameter , so that this component can be used in other priv project and can be overridden from query IT admin console|{0|}}
{30001002|XXparameter|RIIDR_FILE_SUBDIR|/ids/many/|3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_DML|$[PUB_DATAHUB_DML + "/" + TARGET_SYSTEM + "/" + TARGET_LOWER + ".dml"]|3|9|RK|@{0|}}
{30001002|XXparameter|SELECT_MAX_TIMESTAMP|True|13|9|RFK|@{0|}}
{30001002|XXparameter|INTERMEDIATE_DML|$[
add_field(read_file(FILE_DML), "max_insert_ts", 'datetime("YYYYMMDDHH24MISS")');
]|3|9|RK|@{0|}}
{30001002|XXparameter|INSERT_TS_FILED_NAME|insert_timestamp|3|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|RIIDR_DATA_SOURCE_NAME|claimsinfo_rxclaim|3|9|RFK|Target split ICFF name |{0|}}
{30001002|XXparameter|RIIDR_INDEX_COL|mxtdnb|3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|ignore_sql_errors|3|1|Kl|@{0|}}
{30001002|XXparameter|OUTPUT_SELECT_OPERATOR|==|15|9|FK|@{3|==|>|>=|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|agg_app16_carrier_summary|gunit.kaur|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|744000|335000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'read_icff_by_date_range' Execution Status Report

Job completed successfully at Monday, September 21, 2020 18:49:42
Run performed by user gsonar
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}82|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}79|17|}}
{2010501005|XXGpvertex|7|0|13|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$SELECT_MAX_TIMESTAMP|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|559000|134000|0|0|0|0|86|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|8|0|15|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|9|0|17|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|10|0|19|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|11|0|21|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|12|0|23|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|13|0|26|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indexes_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|28|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|15|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|16|0|35|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|17|0|38|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|18|0|41|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|19|0|44|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Read Multiple Files|531000|262500|866000|179000|227000|113000|10693|Read Multiple Split ICFF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|20|0|46|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2452|0|}}
{2010203004|XXGoport|21|0|48|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|50|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|23|0|52|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|24|0|54|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|25|0|56|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|58|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1556|0|}}
{2010210004|XXGflow|27|0|60|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}10688|530|}}
{2010501005|XXGpvertex|28|0|62|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Normalize|206000|253500|301000|175000|123000|107000|10691|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|29|0|64|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|30|0|66|0|{@{}@384|.5|.5|{0|}10685|17|}}
{2010203004|XXGoport|31|0|68|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|70|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|72|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|74|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|35|0|76|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010501005|XXGpvertex|36|0|78|0|{|{}@0|Create Data|56000|273000|0|0|0|0|10694|generate record- Kicker|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|80|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|83|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|39|0|85|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|40|0|90|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::rollup(in)=
begin
out.* :: in.*;
out.max_insert_ts :: max(in.$INSERT_TS_FILED_NAME);
end;

out::output_select(out)=
begin
out ::  out.$INSERT_TS_FILED_NAME $OUTPUT_SELECT_OPERATOR out.max_insert_ts;
end;|3|9||@{0|}}
{30001002|XXparameter|condition|$SELECT_MAX_TIMESTAMP|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$INTERMEDIATE_DML|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|328000|135000|0|0|0|0|87|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|41|0|92|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|42|0|95|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|43|0|97|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|44|0|99|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|101|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|46|0|104|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted or grouped.|{0|}}
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
{30001002|XXparameter|major_key.condition|param grouped-input True param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|47|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|48|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|52|0|126|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DATAHUB_COMPONENTS/read_icff_by_index_and_date_range.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML|$FILE_DML|3|9|f|@{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME||3|8|=|@{0|}}
{30001002|XXparameter|INDEX_COL||3|8|=|@{0|}}
{30001002|XXparameter|FILE_SUBDIR||3|8|=|@{0|}}
{30001002|XXparameter|FILE_MASK|$[TARGET_TABLE + "."]|3|9||@{0|}}
{30001002|XXparameter|MIN_TXN_DATE||3|8|=|@{0|}}
{30001002|XXparameter|MAX_TXN_DATE||3|8|=|@{0|}}
{30001002|XXparameter|DATA_PATH||3|8|=|@{0|}}
}}@0|@35000|123000|0|0|0|0|88|read icff by index and date range|Generic User|@1|100|0|@6|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|863000|673000|5|}}
{2010240003|XXGlegend|53|0|128|0|{@{}@

|114000|399000|0|0|0|0|10665|}}
{2010242002|XXGface|54|0|130|0|{@{}@Arial|32768|110|1|}}
{2010240003|XXGlegend|55|0|132|0|{@{}@ |204000|84000|0|0|0|0|10553|}}
{2010242002|XXGface|56|0|134|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|57|0|136|0|{@{}@This Subgraph will read split ICFF files,
from the path , mask , date range and location specified 
via input parameters. 

Purpose : 
This Subgraph can be used as maintenence subgraph for 
all target split ICFF created for Query It datasets.To specifically read ,
update and delete anything  based on index and date range.|189000|19000|0|0|0|0|10671|}}
{2010242002|XXGface|58|0|138|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|59|0|140|0|{@{}@

DATA_SOURCE_DML                         	$AI_DML/rt200p_enriched.dml
DATA_SOURCE_NAME	                      claimsinfo_rxclaim
INDEX_COL	                                      mxtdnb
FILE_SUBDIR	                                   rxclaim_adjud
FILE_MASK	                                      rxclaim_adjudication_
MIN_TXN_DATE	                                 20150704
MAX_TXN_DATE	                              $[(date("YYYYMMDD")) now1()]
DATA_PATH	                                      $AI_MFS
|174000|481000|0|0|0|0|10657|}}
{2010242002|XXGface|60|0|142|0|{@{}@Arial Narrow|0|100|1|}}
{2010240003|XXGlegend|61|0|144|0|{@{}@Parameter Name|167000|455000|0|0|0|0|10655|}}
{2010242002|XXGface|62|0|146|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|63|0|148|0|{@{}@Default Value (eg.)|382000|455000|0|0|0|0|10656|}}
{2010242002|XXGface|64|0|150|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010501005|XXGpvertex|65|0|155|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Broadcast|400000|288500|723000|204000|54000|41000|10690|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|157|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|67|0|160|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|68|0|168|0|{|{}@0|@10000|12500|0|0|0|0|10676|Version Log||@1|100|-1|@6|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|661000|393000|7|}}
{2010240003|XXGlegend|69|0|170|0|{@{}@Date|92000|46000|0|0|0|0|7|}}
{2010242002|XXGface|70|0|172|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|71|0|174|0|{@{}@Aug 31 2015|82000|68000|0|0|0|0|33|}}
{2010242002|XXGface|72|0|176|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|73|0|178|0|{@{}@This Subgraph will read split files based on index and date range 
from the location provided by user as input parameter|337000|63000|0|0|0|0|31|}}
{2010242002|XXGface|74|0|180|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|75|0|182|0|{@{}@Author|197000|46000|0|0|0|0|25|}}
{2010242002|XXGface|76|0|184|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|77|0|186|0|{@{}@Mukesh Singh|192000|68000|0|0|0|0|26|}}
{2010242002|XXGface|78|0|188|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|79|0|190|0|{@{}@Description|337000|46000|0|0|0|0|32|}}
{2010242002|XXGface|80|0|192|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|81|0|194|0|{@{}@Version|17000|46000|0|0|0|0|29|}}
{2010242002|XXGface|82|0|196|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|83|0|198|0|{@{}@1.0|17000|68000|0|0|0|0|30|}}
{2010242002|XXGface|84|0|200|0|{@{}@Arial Narrow|0|100|0|}}
{2010203004|XXGoport|85|0|203|0|{@{}@0|0|0|0|out0|.4101040118870728|@@@14352|0|}}
{2010600005|XXGgraph|86|0|207|0|{select * from datalake_qa.claimsinfo_rxclaim where mxtdnb > '2015-08-15'|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|____Pass_as_input_parameter_____________|@3|2|K$|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML||7|9|RFKf||{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME||3|9|RFK|Target split ICFF name |{0|}}
{30001002|XXparameter|INDEX_COL||3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|FILE_SUBDIR||3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_MASK||3|9|FK|The Mask of icff files|{0|}}
{30001002|XXparameter|MIN_TXN_DATE|19000101|3|9|RFK|Start date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$[(date("YYYYMMDD")) now1()]|3|9|RFK|End date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|DATA_PATH|$AI_MFS|3|9|RFK|Added this parameter , so that this component can be used in other priv project and can be overridden from query IT admin console|{0|}}
{30001002|XXparameter|FILE_MISSING|Notify (Continue, with a reject record and error message)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|DAYS_DML|//include "~$ABSQL_DML/qe_term_type.dml";
//metadata type = 
record
  date("YYYY-MM-DD") day;
end;|7|1|RFl||{0|}}
{30001002|XXparameter|CALCULATE_DAYS_XFR|/* This type is optional.*/
// type temporary_type = NULL_TYPE;


/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/

 let date("YYYYMMDD") start_date = '$\{MIN_TXN_DATE\}'; 
 let date("YYYYMMDD") end_date = '$\{MAX_TXN_DATE\}'; 
  
out::length(in)=
begin
  out :: 1 + end_date - start_date;
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.day :: start_date + index;
  out.* :: in.*;
end;|8|3|RFOc|Required and optional DML functions|{0|}}
{30001002|XXparameter|____Run_time_parameter___________|@3|2|K$|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_EXPANDED|$DATA_SOURCE_DML|7|9|RK||{0|}}
{30001002|XXparameter|RMF_XFR|type input_type = $\{DATA_SOURCE_DML_EXPANDED\};


/*extract filename from input record*/
filename::get_filename(in)=
begin
  let dt_rec = decode_date_record(in.day);
  
  filename :: string_concat(this_partition_path("$\{DATA_PATH\}"), "/$\{FILE_SUBDIR\}", "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day, ".dat.gz");
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,filename,in)=
begin
  out.* :: read.*;
  out.* :1: in.*;
end;|8|3|RFOc|Package containing transforms and data types|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1600694368|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|read_icff_by_index_and_date_range||@1|100|-1|@6|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|863000|673000|7|}}
{2010240003|XXGlegend|87|0|209|0|{@{}@

|114000|399000|0|0|0|0|10665|}}
{2010242002|XXGface|88|0|211|0|{@{}@Arial|32768|110|1|}}
{2010240003|XXGlegend|89|0|213|0|{@{}@ |204000|84000|0|0|0|0|10553|}}
{2010242002|XXGface|90|0|215|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|91|0|217|0|{@{}@This Subgraph will read split ICFF files,
from the path , mask , date range and location specified 
via input parameters. 

Purpose : 
This Subgraph can be used as maintenence subgraph for 
all target split ICFF created for Query It datasets.To specifically read ,
update and delete anything  based on index and date range.|189000|19000|0|0|0|0|10671|}}
{2010242002|XXGface|92|0|219|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|93|0|221|0|{@{}@

DATA_SOURCE_DML                         	$AI_DML/rt200p_enriched.dml
DATA_SOURCE_NAME	                      claimsinfo_rxclaim
INDEX_COL	                                      mxtdnb
FILE_SUBDIR	                                   rxclaim_adjud
FILE_MASK	                                      rxclaim_adjudication_
MIN_TXN_DATE	                                 20150704
MAX_TXN_DATE	                              $[(date("YYYYMMDD")) now1()]
DATA_PATH	                                      $AI_MFS
|174000|481000|0|0|0|0|10657|}}
{2010242002|XXGface|94|0|223|0|{@{}@Arial Narrow|0|100|1|}}
{2010240003|XXGlegend|95|0|225|0|{@{}@Parameter Name|167000|455000|0|0|0|0|10655|}}
{2010242002|XXGface|96|0|227|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|97|0|229|0|{@{}@Default Value (eg.)|382000|455000|0|0|0|0|10656|}}
{2010242002|XXGface|98|0|231|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010210004|XXGflow|99|0|233|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010210004|XXGflow|100|0|235|0|{@{}@384|.5|.5|{0|}10685|17|}}
{2010210004|XXGflow|101|0|237|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}10688|530|}}
{2010501005|XXGpvertex|102|0|239|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|9|Pf|@{0|}}
}}@0|Broadcast|400000|288500|723000|204000|54000|41000|10690|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|103|0|241|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|104|0|244|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|247|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|107|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|108|0|255|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|Normalize|206000|253500|301000|175000|123000|107000|10691|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|257|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|110|0|260|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|111|0|262|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|112|0|264|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|113|0|266|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|114|0|269|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|115|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|116|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|117|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|118|0|280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|119|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|288|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|file_missing||3|8|=|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$\{DATA_PATH\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$DATA_SOURCE_DML|3|9||@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|Read Multiple Files|531000|262500|866000|179000|227000|113000|10693|Read Multiple Split ICFF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|121|0|290|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2452|0|}}
{2010203004|XXGoport|122|0|292|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|294|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|124|0|296|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|125|0|298|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|126|0|300|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|127|0|302|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1556|0|}}
{2010501005|XXGpvertex|128|0|305|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
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
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if the input file is not readable or is otherwise unavailable|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Fail|3|13|Kv|What to do if the input file is not readable or is otherwise unavailable|{0|}}
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
{30001002|XXparameter|stream_raw_data|False|13|1|FKl|If True, streams raw data from input files|{0|}}
{30001002|XXparameter|stream_raw_data.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|interpret_hadoop_data|False|13|1|Fl|If true, component will interpret data according to the selected Hadoop file format.|{0|}}
{30001002|XXparameter|interpret_hadoop_data.condition|version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact interpret_hadoop_data True param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RC File. Column numbers are zero-based.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|predicate_condition|value format parquet True value format orc True value format * False default constant True|13|13|v|Hidden condition for deciding predicate-filter visibility|{0|}}
{30001002|XXparameter|predicate_filter||20|2|FK$|Pushdown predicate filter for orc and parquet|{0|}}
{30001002|XXparameter|predicate_filter.display_name|predicate-filter|3|9|P|@{0|}}
{30001002|XXparameter|predicate_filter.keyword|predicate-filter|3|9|P|@{0|}}
{30001002|XXparameter|predicate_filter.condition|param predicate_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|read_options||3|2|FK$|Additional options to pass to the Hadoop reader. The format is a comma separated list of name=value pairs.|{0|}}
{30001002|XXparameter|read_options.display_name|read-options|3|9|P|@{0|}}
{30001002|XXparameter|read_options.keyword|read-options|3|9|P|@{0|}}
{30001002|XXparameter|read_options.condition|param interpret_hadoop_data True|3|15|P?|@{0|}}
{30001002|XXparameter|config_file||28|2|FK$|The configuration file for the multiplexer.|{0|}}
{30001002|XXparameter|config_file.display_name|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.keyword|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.condition|version 4.0.1.r5.0.0:|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|param_exact stream_raw_data False param_exact format uninterpreted version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact stream_raw_data False param_exact read-blocks False param_exact format uninterpreted version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact stream_raw_data False param_exact read_as_single_record False param_exact format uninterpreted version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|type1|filename_type filename "string('', charset='x-ab-internal')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|9|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional long out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(void(integer(4)) rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('', charset='x-ab-internal')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in; in=optional_null()|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation9|optional integer(8) out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation9_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9_analysis.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = "string('\\\\n')"
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Read Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|129|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2452|0|}}
{2010203004|XXGoport|130|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|131|0|313|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|132|0|316|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|133|0|319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|134|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|135|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1556|0|}}
{2010600005|XXGgraph|136|0|330|0|{|{}@0|@10000|12500|0|0|0|0|10676|Version Log||@1|100|-1|@6|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|661000|393000|7|}}
{2010240003|XXGlegend|137|0|332|0|{@{}@Date|92000|46000|0|0|0|0|7|}}
{2010242002|XXGface|138|0|334|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|139|0|336|0|{@{}@Aug 31 2015|82000|68000|0|0|0|0|33|}}
{2010242002|XXGface|140|0|338|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|141|0|340|0|{@{}@This Subgraph will read split files based on index and date range 
from the location provided by user as input parameter|337000|63000|0|0|0|0|31|}}
{2010242002|XXGface|142|0|342|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|143|0|344|0|{@{}@Author|197000|46000|0|0|0|0|25|}}
{2010242002|XXGface|144|0|346|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|145|0|348|0|{@{}@Mukesh Singh|192000|68000|0|0|0|0|26|}}
{2010242002|XXGface|146|0|350|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|147|0|352|0|{@{}@Description|337000|46000|0|0|0|0|32|}}
{2010242002|XXGface|148|0|354|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|149|0|356|0|{@{}@Version|17000|46000|0|0|0|0|29|}}
{2010242002|XXGface|150|0|358|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|151|0|360|0|{@{}@1.0|17000|68000|0|0|0|0|30|}}
{2010242002|XXGface|152|0|362|0|{@{}@Arial Narrow|0|100|0|}}
{2010501005|XXGpvertex|153|0|364|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|num_records|1|3|9||@{0|}}
{30001002|XXparameter|transform|out :: create(index) =
begin
  out.start_date :: 1; //assigned Random
  out.end_date :: 1;//assigned Random
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:.|3|9||@{0|}}
{30001002|XXparameter|out_metadata|metadata type = 
record
  date("YYYY-MM-DD") start_date;
  date("YYYY-MM-DD") end_date; 
end;|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|56000|273000|0|0|0|0|10694|generate record- Kicker|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|154|0|366|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|155|0|369|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|156|0|371|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|157|0|373|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|start_index|1|1|2|F$|Value to pass as index on first call to create()|{0|}}
{30001002|XXparameter|start_index.display_name|start-index|3|9|P|@{0|}}
{30001002|XXparameter|start_index.condition|version 3.3.4.r13.0:|3|15|P?|@{0|}}
{30001002|XXparameter|start_index_non_default|value start-index 1 False default constant True|13|13|Rv|Automatically set to True if start-index != 1|{0|}}
{30001002|XXparameter|start_index_non_default.display_name|start-index-non-default|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl|sameas start-index default dollar_substitution 1|1|13|Kv|Passed for use as index on first call to create() only if not defaulted|{0|}}
{30001002|XXparameter|start_index_impl.display_name|start-index-impl|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl.keyword|start-index-impl|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl.condition|param start-index-non-default True|3|15|P?|@{0|}}
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
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
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
{30001002|XXparameter|operation1|out::create(long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|158|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|159|0|378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|160|0|381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|161|0|384|0|{@{}@0|0|0|0|out0|.4101040118870728|@@@14352|0|}}
{2010203004|XXGoport|162|0|393|0|{@{}@0|0|0|0|out0|.6882845188284519|@@@14352|0|}}
{2010110002|XXGconstant|163|0|396|0|{@{}@{1|9438726|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_2|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_3|}1|6|}
{2010601001|XXGgraph_vertex_vertex|6|0|12|0|{Reformat|}1|7|}
{2010212001|XXGvertex_oport_oport|7|0|14|0|{0|out0|}7|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{1|reject0|}7|9|}
{2010212001|XXGvertex_oport_oport|9|0|18|0|{2|error0|}7|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{3|log|}7|11|}
{2010211001|XXGvertex_iport_iport|11|0|22|0|{0|in|}7|12|}
{2010214001|XXGiport_src_flow|12|0|24|0|{0|}12|6|}
{2010007001|XXGobject_proto_object|13|0|25|0|{}7|13|}
{2010212001|XXGvertex_oport_oport|14|0|27|0|{0|out0|}13|14|}
{2010006001|XXGobject_psameas_object|15|0|29|0|{metadata|out0_metadata|1|0|}14|13|}
{2010006001|XXGobject_psameas_object|16|0|30|0|{transform0|transform0|1|0|}14|13|}
{2010212001|XXGvertex_oport_oport|17|0|31|0|{1|reject0|}13|15|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{metadata|reject0_metadata|1|0|}15|13|}
{2010212001|XXGvertex_oport_oport|19|0|34|0|{2|error0|}13|16|}
{2010006001|XXGobject_psameas_object|20|0|36|0|{metadata|error0_metadata|1|0|}16|13|}
{2010212001|XXGvertex_oport_oport|21|0|37|0|{3|log|}13|17|}
{2010006001|XXGobject_psameas_object|22|0|39|0|{metadata|log_metadata|1|0|}17|13|}
{2010211001|XXGvertex_iport_iport|23|0|40|0|{0|in|}13|18|}
{2010006001|XXGobject_psameas_object|24|0|42|0|{metadata|in_metadata|1|0|}18|13|}
{2010006001|XXGobject_psameas_object|25|0|43|0|{Layout|Layout|0|0|}7|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{0|out|}19|20|}
{2010212001|XXGvertex_oport_oport|27|0|47|0|{1|filereject|}19|21|}
{2010212001|XXGvertex_oport_oport|28|0|49|0|{2|fileerror|}19|22|}
{2010212001|XXGvertex_oport_oport|29|0|51|0|{3|reject|}19|23|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{4|error|}19|24|}
{2010212001|XXGvertex_oport_oport|31|0|55|0|{5|log|}19|25|}
{2010211001|XXGvertex_iport_iport|32|0|57|0|{0|in|}19|26|}
{2010214001|XXGiport_src_flow|33|0|59|0|{0|}26|27|}
{2010006001|XXGobject_psameas_object|34|0|61|0|{filereject_metadata|out_metadata|0|0|}19|28|}
{2010212001|XXGvertex_oport_oport|35|0|63|0|{0|out|}28|29|}
{2010213001|XXGoport_dst_flow|36|0|65|0|{0|}29|30|}
{2010212001|XXGvertex_oport_oport|37|0|67|0|{1|reject|}28|31|}
{2010212001|XXGvertex_oport_oport|38|0|69|0|{2|error|}28|32|}
{2010212001|XXGvertex_oport_oport|39|0|71|0|{3|log|}28|33|}
{2010211001|XXGvertex_iport_iport|40|0|73|0|{0|in|}28|34|}
{2010214001|XXGiport_src_flow|41|0|75|0|{0|}34|35|}
{2010006001|XXGobject_psameas_object|42|0|77|0|{Layout|Layout|0|0|}28|36|}
{2010212001|XXGvertex_oport_oport|43|0|79|0|{0|out|}36|37|}
{2010213001|XXGoport_dst_flow|44|0|81|0|{0|}37|35|}
{2010212001|XXGvertex_oport_oport|45|0|82|0|{1|error|}36|38|}
{2010212001|XXGvertex_oport_oport|46|0|84|0|{2|log|}36|39|}
{2010006001|XXGobject_psameas_object|47|0|86|0|{in_metadata|out_metadata|0|0|}28|36|}
{2010006001|XXGobject_psameas_object|48|0|87|0|{reject_metadata|out_metadata|0|0|}28|36|}
{2010006001|XXGobject_psameas_object|49|0|88|0|{in_metadata|out_metadata|0|0|}19|28|}
{2010006001|XXGobject_psameas_object|50|0|89|0|{in_metadata|out_metadata|0|0|}7|40|}
{2010212001|XXGvertex_oport_oport|51|0|91|0|{0|out|}40|41|}
{2010213001|XXGoport_dst_flow|52|0|93|0|{0|}41|6|}
{2010212001|XXGvertex_oport_oport|53|0|94|0|{1|reject|}40|42|}
{2010212001|XXGvertex_oport_oport|54|0|96|0|{2|error|}40|43|}
{2010212001|XXGvertex_oport_oport|55|0|98|0|{3|log|}40|44|}
{2010211001|XXGvertex_iport_iport|56|0|100|0|{0|in|}40|45|}
{2010214001|XXGiport_src_flow|57|0|102|0|{0|}45|5|}
{2010007001|XXGobject_proto_object|58|0|103|0|{}40|46|}
{2010212001|XXGvertex_oport_oport|59|0|105|0|{0|out|}46|47|}
{2010006001|XXGobject_psameas_object|60|0|107|0|{metadata|out_metadata|1|0|}47|46|}
{2010212001|XXGvertex_oport_oport|61|0|108|0|{1|reject|}46|48|}
{2010006001|XXGobject_psameas_object|62|0|110|0|{metadata|reject_metadata|1|0|}48|46|}
{2010212001|XXGvertex_oport_oport|63|0|111|0|{2|error|}46|49|}
{2010006001|XXGobject_psameas_object|64|0|113|0|{metadata|error_metadata|1|0|}49|46|}
{2010212001|XXGvertex_oport_oport|65|0|114|0|{3|log|}46|50|}
{2010006001|XXGobject_psameas_object|66|0|116|0|{metadata|log_metadata|1|0|}50|46|}
{2010211001|XXGvertex_iport_iport|67|0|117|0|{0|in|}46|51|}
{2010006001|XXGobject_psameas_object|68|0|119|0|{metadata|in_metadata|1|0|}51|46|}
{2010006001|XXGobject_psameas_object|69|0|120|0|{Layout|Layout|0|0|}40|19|}
{2010006001|XXGobject_psameas_object|70|0|121|0|{in_metadata|out_metadata|0|0|}40|19|}
{2010006001|XXGobject_psameas_object|71|0|122|0|{reject_metadata|out_metadata|0|0|}40|19|}
{2010006001|XXGobject_psameas_object|72|0|123|0|{reject0_metadata|out_metadata|0|0|}7|40|}
{2010601001|XXGgraph_vertex_vertex|73|0|124|0|{Rollup|}1|40|}
{2010601001|XXGgraph_vertex_vertex|74|0|125|0|{read_icff_by_index_and_date_range|}1|52|}
{2010605001|XXGgraph_legend_legend|75|0|127|0|{0|}52|53|}
{2010241001|XXGlegend_face_face|76|0|129|0|{}53|54|}
{2010605001|XXGgraph_legend_legend|77|0|131|0|{1|}52|55|}
{2010241001|XXGlegend_face_face|78|0|133|0|{}55|56|}
{2010605001|XXGgraph_legend_legend|79|0|135|0|{2|}52|57|}
{2010241001|XXGlegend_face_face|80|0|137|0|{}57|58|}
{2010605001|XXGgraph_legend_legend|81|0|139|0|{3|}52|59|}
{2010241001|XXGlegend_face_face|82|0|141|0|{}59|60|}
{2010605001|XXGgraph_legend_legend|83|0|143|0|{4|}52|61|}
{2010241001|XXGlegend_face_face|84|0|145|0|{}61|62|}
{2010605001|XXGgraph_legend_legend|85|0|147|0|{5|}52|63|}
{2010241001|XXGlegend_face_face|86|0|149|0|{}63|64|}
{2010604001|XXGgraph_flow_flow|87|0|151|0|{Flow_1|}52|35|}
{2010604001|XXGgraph_flow_flow|88|0|152|0|{Flow_5|}52|30|}
{2010604001|XXGgraph_flow_flow|89|0|153|0|{Flow_6|}52|27|}
{2010601001|XXGgraph_vertex_vertex|90|0|154|0|{Broadcast|}52|65|}
{2010212001|XXGvertex_oport_oport|91|0|156|0|{0|out|}65|66|}
{2010213001|XXGoport_dst_flow|92|0|158|0|{0|}66|27|}
{2010211001|XXGvertex_iport_iport|93|0|159|0|{0|in|}65|67|}
{2010214001|XXGiport_src_flow|94|0|161|0|{0|}67|30|}
{2010006001|XXGobject_psameas_object|95|0|162|0|{Layout|Layout|0|0|}65|36|}
{2010006001|XXGobject_psameas_object|96|0|163|0|{in_metadata|out_metadata|0|0|}65|28|}
{2010006001|XXGobject_psameas_object|97|0|164|0|{out_metadata|out_metadata|0|0|}65|28|}
{2010601001|XXGgraph_vertex_vertex|98|0|165|0|{Generate_Days_in_Range|}52|28|}
{2010601001|XXGgraph_vertex_vertex|99|0|166|0|{Read_Multiple_Split_ICFF|}52|19|}
{2010601001|XXGgraph_vertex_vertex|100|0|167|0|{Version_Log|}52|68|}
{2010605001|XXGgraph_legend_legend|101|0|169|0|{0|}68|69|}
{2010241001|XXGlegend_face_face|102|0|171|0|{}69|70|}
{2010605001|XXGgraph_legend_legend|103|0|173|0|{1|}68|71|}
{2010241001|XXGlegend_face_face|104|0|175|0|{}71|72|}
{2010605001|XXGgraph_legend_legend|105|0|177|0|{2|}68|73|}
{2010241001|XXGlegend_face_face|106|0|179|0|{}73|74|}
{2010605001|XXGgraph_legend_legend|107|0|181|0|{3|}68|75|}
{2010241001|XXGlegend_face_face|108|0|183|0|{}75|76|}
{2010605001|XXGgraph_legend_legend|109|0|185|0|{4|}68|77|}
{2010241001|XXGlegend_face_face|110|0|187|0|{}77|78|}
{2010605001|XXGgraph_legend_legend|111|0|189|0|{5|}68|79|}
{2010241001|XXGlegend_face_face|112|0|191|0|{}79|80|}
{2010605001|XXGgraph_legend_legend|113|0|193|0|{6|}68|81|}
{2010241001|XXGlegend_face_face|114|0|195|0|{}81|82|}
{2010605001|XXGgraph_legend_legend|115|0|197|0|{7|}68|83|}
{2010241001|XXGlegend_face_face|116|0|199|0|{}83|84|}
{2010601001|XXGgraph_vertex_vertex|117|0|201|0|{generate_record_Kicker|}52|36|}
{2010212001|XXGvertex_oport_oport|118|0|202|0|{0|out0|}52|85|}
{2010216002|XXGoport_binding_oport|119|0|204|0|{.5|.5|{0|}10692|}85|20|}
{2010213001|XXGoport_dst_flow|120|0|205|0|{0|}85|5|}
{2010007001|XXGobject_proto_object|121|0|206|0|{}52|86|}
{2010605001|XXGgraph_legend_legend|122|0|208|0|{0|}86|87|}
{2010241001|XXGlegend_face_face|123|0|210|0|{}87|88|}
{2010605001|XXGgraph_legend_legend|124|0|212|0|{1|}86|89|}
{2010241001|XXGlegend_face_face|125|0|214|0|{}89|90|}
{2010605001|XXGgraph_legend_legend|126|0|216|0|{2|}86|91|}
{2010241001|XXGlegend_face_face|127|0|218|0|{}91|92|}
{2010605001|XXGgraph_legend_legend|128|0|220|0|{3|}86|93|}
{2010241001|XXGlegend_face_face|129|0|222|0|{}93|94|}
{2010605001|XXGgraph_legend_legend|130|0|224|0|{4|}86|95|}
{2010241001|XXGlegend_face_face|131|0|226|0|{}95|96|}
{2010605001|XXGgraph_legend_legend|132|0|228|0|{5|}86|97|}
{2010241001|XXGlegend_face_face|133|0|230|0|{}97|98|}
{2010604001|XXGgraph_flow_flow|134|0|232|0|{Flow_1|}86|99|}
{2010604001|XXGgraph_flow_flow|135|0|234|0|{Flow_5|}86|100|}
{2010604001|XXGgraph_flow_flow|136|0|236|0|{Flow_6|}86|101|}
{2010601001|XXGgraph_vertex_vertex|137|0|238|0|{Broadcast|}86|102|}
{2010212001|XXGvertex_oport_oport|138|0|240|0|{0|out|}102|103|}
{2010213001|XXGoport_dst_flow|139|0|242|0|{0|}103|101|}
{2010211001|XXGvertex_iport_iport|140|0|243|0|{0|in|}102|104|}
{2010214001|XXGiport_src_flow|141|0|245|0|{0|}104|100|}
{2010007001|XXGobject_proto_object|142|0|246|0|{}102|105|}
{2010212001|XXGvertex_oport_oport|143|0|248|0|{0|out|}105|106|}
{2010006001|XXGobject_psameas_object|144|0|250|0|{metadata|out_metadata|1|0|}106|105|}
{2010211001|XXGvertex_iport_iport|145|0|251|0|{0|in|}105|107|}
{2010006001|XXGobject_psameas_object|146|0|253|0|{metadata|in_metadata|1|0|}107|105|}
{2010601001|XXGgraph_vertex_vertex|147|0|254|0|{Generate_Days_in_Range|}86|108|}
{2010212001|XXGvertex_oport_oport|148|0|256|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|149|0|258|0|{0|}109|100|}
{2010212001|XXGvertex_oport_oport|150|0|259|0|{1|reject|}108|110|}
{2010212001|XXGvertex_oport_oport|151|0|261|0|{2|error|}108|111|}
{2010212001|XXGvertex_oport_oport|152|0|263|0|{3|log|}108|112|}
{2010211001|XXGvertex_iport_iport|153|0|265|0|{0|in|}108|113|}
{2010214001|XXGiport_src_flow|154|0|267|0|{0|}113|99|}
{2010007001|XXGobject_proto_object|155|0|268|0|{}108|114|}
{2010212001|XXGvertex_oport_oport|156|0|270|0|{0|out|}114|115|}
{2010006001|XXGobject_psameas_object|157|0|272|0|{metadata|out_metadata|1|0|}115|114|}
{2010212001|XXGvertex_oport_oport|158|0|273|0|{1|reject|}114|116|}
{2010006001|XXGobject_psameas_object|159|0|275|0|{metadata|reject_metadata|1|0|}116|114|}
{2010212001|XXGvertex_oport_oport|160|0|276|0|{2|error|}114|117|}
{2010006001|XXGobject_psameas_object|161|0|278|0|{metadata|error_metadata|1|0|}117|114|}
{2010212001|XXGvertex_oport_oport|162|0|279|0|{3|log|}114|118|}
{2010006001|XXGobject_psameas_object|163|0|281|0|{metadata|log_metadata|1|0|}118|114|}
{2010211001|XXGvertex_iport_iport|164|0|282|0|{0|in|}114|119|}
{2010006001|XXGobject_psameas_object|165|0|284|0|{metadata|in_metadata|1|0|}119|114|}
{2010006001|XXGobject_psameas_object|166|0|285|0|{out_metadata|DAYS_DML|1|0|}108|86|}
{2010006001|XXGobject_psameas_object|167|0|286|0|{transform|CALCULATE_DAYS_XFR|1|0|}108|86|}
{2010601001|XXGgraph_vertex_vertex|168|0|287|0|{Read_Multiple_Split_ICFF|}86|120|}
{2010212001|XXGvertex_oport_oport|169|0|289|0|{0|out|}120|121|}
{2010212001|XXGvertex_oport_oport|170|0|291|0|{1|filereject|}120|122|}
{2010212001|XXGvertex_oport_oport|171|0|293|0|{2|fileerror|}120|123|}
{2010212001|XXGvertex_oport_oport|172|0|295|0|{3|reject|}120|124|}
{2010212001|XXGvertex_oport_oport|173|0|297|0|{4|error|}120|125|}
{2010212001|XXGvertex_oport_oport|174|0|299|0|{5|log|}120|126|}
{2010211001|XXGvertex_iport_iport|175|0|301|0|{0|in|}120|127|}
{2010214001|XXGiport_src_flow|176|0|303|0|{0|}127|101|}
{2010007001|XXGobject_proto_object|177|0|304|0|{}120|128|}
{2010212001|XXGvertex_oport_oport|178|0|306|0|{0|out|}128|129|}
{2010006001|XXGobject_psameas_object|179|0|308|0|{metadata|out_metadata|1|0|}129|128|}
{2010212001|XXGvertex_oport_oport|180|0|309|0|{1|filereject|}128|130|}
{2010006001|XXGobject_psameas_object|181|0|311|0|{metadata|filereject_metadata|1|0|}130|128|}
{2010212001|XXGvertex_oport_oport|182|0|312|0|{2|fileerror|}128|131|}
{2010006001|XXGobject_psameas_object|183|0|314|0|{metadata|fileerror_metadata|1|0|}131|128|}
{2010212001|XXGvertex_oport_oport|184|0|315|0|{3|reject|}128|132|}
{2010006001|XXGobject_psameas_object|185|0|317|0|{metadata|reject_metadata|1|0|}132|128|}
{2010212001|XXGvertex_oport_oport|186|0|318|0|{4|error|}128|133|}
{2010006001|XXGobject_psameas_object|187|0|320|0|{metadata|error_metadata|1|0|}133|128|}
{2010212001|XXGvertex_oport_oport|188|0|321|0|{5|log|}128|134|}
{2010006001|XXGobject_psameas_object|189|0|323|0|{metadata|log_metadata|1|0|}134|128|}
{2010211001|XXGvertex_iport_iport|190|0|324|0|{0|in|}128|135|}
{2010006001|XXGobject_psameas_object|191|0|326|0|{metadata|in_metadata|1|0|}135|128|}
{2010006001|XXGobject_psameas_object|192|0|327|0|{file_missing|FILE_MISSING|1|0|}120|86|}
{2010006001|XXGobject_psameas_object|193|0|328|0|{transform|RMF_XFR|1|0|}120|86|}
{2010601001|XXGgraph_vertex_vertex|194|0|329|0|{Version_Log|}86|136|}
{2010605001|XXGgraph_legend_legend|195|0|331|0|{0|}136|137|}
{2010241001|XXGlegend_face_face|196|0|333|0|{}137|138|}
{2010605001|XXGgraph_legend_legend|197|0|335|0|{1|}136|139|}
{2010241001|XXGlegend_face_face|198|0|337|0|{}139|140|}
{2010605001|XXGgraph_legend_legend|199|0|339|0|{2|}136|141|}
{2010241001|XXGlegend_face_face|200|0|341|0|{}141|142|}
{2010605001|XXGgraph_legend_legend|201|0|343|0|{3|}136|143|}
{2010241001|XXGlegend_face_face|202|0|345|0|{}143|144|}
{2010605001|XXGgraph_legend_legend|203|0|347|0|{4|}136|145|}
{2010241001|XXGlegend_face_face|204|0|349|0|{}145|146|}
{2010605001|XXGgraph_legend_legend|205|0|351|0|{5|}136|147|}
{2010241001|XXGlegend_face_face|206|0|353|0|{}147|148|}
{2010605001|XXGgraph_legend_legend|207|0|355|0|{6|}136|149|}
{2010241001|XXGlegend_face_face|208|0|357|0|{}149|150|}
{2010605001|XXGgraph_legend_legend|209|0|359|0|{7|}136|151|}
{2010241001|XXGlegend_face_face|210|0|361|0|{}151|152|}
{2010601001|XXGgraph_vertex_vertex|211|0|363|0|{generate_record_Kicker|}86|153|}
{2010212001|XXGvertex_oport_oport|212|0|365|0|{0|out|}153|154|}
{2010213001|XXGoport_dst_flow|213|0|367|0|{0|}154|99|}
{2010212001|XXGvertex_oport_oport|214|0|368|0|{1|error|}153|155|}
{2010212001|XXGvertex_oport_oport|215|0|370|0|{2|log|}153|156|}
{2010007001|XXGobject_proto_object|216|0|372|0|{}153|157|}
{2010212001|XXGvertex_oport_oport|217|0|374|0|{0|out|}157|158|}
{2010006001|XXGobject_psameas_object|218|0|376|0|{metadata|out_metadata|1|0|}158|157|}
{2010212001|XXGvertex_oport_oport|219|0|377|0|{1|error|}157|159|}
{2010006001|XXGobject_psameas_object|220|0|379|0|{metadata|error_metadata|1|0|}159|157|}
{2010212001|XXGvertex_oport_oport|221|0|380|0|{2|log|}157|160|}
{2010006001|XXGobject_psameas_object|222|0|382|0|{metadata|log_metadata|1|0|}160|157|}
{2010212001|XXGvertex_oport_oport|223|0|383|0|{0|out0|}86|161|}
{2010216002|XXGoport_binding_oport|224|0|385|0|{.5|.5|{0|}10692|}161|121|}
{2010006001|XXGobject_psameas_object|225|0|386|0|{DATA_PATH|RIIDR_DATA_PATH|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|226|0|387|0|{DATA_SOURCE_NAME|RIIDR_DATA_SOURCE_NAME|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|227|0|388|0|{FILE_SUBDIR|RIIDR_FILE_SUBDIR|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|228|0|389|0|{INDEX_COL|RIIDR_INDEX_COL|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|229|0|390|0|{MAX_TXN_DATE|END_DATE|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|230|0|391|0|{MIN_TXN_DATE|START_DATE|1|0|}52|1|}
{2010212001|XXGvertex_oport_oport|231|0|392|0|{0|out0|}1|162|}
{2010216002|XXGoport_binding_oport|232|0|394|0|{.5|.5|{0|}83|}162|8|}
{2010109001|XXGobject_property_value|233|0|395|0|{0|TrackingThumbprint|72|}1|163|}
