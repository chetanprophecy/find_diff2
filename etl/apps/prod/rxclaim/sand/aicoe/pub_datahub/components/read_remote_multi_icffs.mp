@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|117|rel_count|200|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|DATA_SOURCE_DML|$DATA_SOURCE_DML|7|9|RFKf||{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME|$DATA_SOURCE_NAME|3|9|RFK|Target split ICFF name |{0|}}
{30001002|XXparameter|INDEX_COL|$INDEX_COL|3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|FILE_SUBDIR|$FILE_SUBDIR|3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_MASK|$FILE_MASK|3|9|FK|The Mask of icff files|{0|}}
{30001002|XXparameter|MIN_TXN_DATE|$MIN_TXN_DATE|3|9|RFK|Start date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$MAX_TXN_DATE|3|9|RFK|End date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|DATA_PATH|$DATA_PATH|3|9|RFK|Added this parameter , so that this component can be used in other priv project and can be overridden from query IT admin console|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.4.1|3|9|P|@{0|}}
{30001002|XXparameter|REMOTE_LAYOUT|$REMOTE_LAYOUT|3|9|FK|@{0|}}
{30001002|XXparameter|LOCAL_LAYOUT|$LOCAL_LAYOUT|3|9|FK|@{0|}}
{30001002|XXparameter|REMOTE_LAYOUT_DEPTH|$REMOTE_LAYOUT_DEPTH|1|9|FK|@{0|}}
{30001002|XXparameter|LOCAL_LAYOUT_DEPTH|$LOCAL_LAYOUT_DEPTH|1|9|FK|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_EXPANDED|$DATA_SOURCE_DML|7|9|RK|@{0|}}
{30001002|XXparameter|DATA_SOURCE_XFR|$PUB_DATAHUB_XFR/read_remote_multi_icffs_default_rmf.xfr|3|9|FK|The XFR to use by the RMF compoinent : default $PUB_DATAHUB_XFR/read_remote_multi_icffs_default_rmf.xfr|{0|}}
{30001002|XXparameter|OUTPUT_DML|$DATA_SOURCE_DML|3|9|RFK|The DML to which the data needs to be read into, output DML for the RMF component : default DATA_SOURCE_DML|{0|}}
{30001002|XXparameter|RMF_ERROR_FILE|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|RMF_LOG_FILE|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|RMF_ERROR_FILE:eme|$[  AI_SERIAL_LOG + '/' + DATA_SOURCE_NAME + '__rmf_errors__MIN_TXN_DATE__MAX_TXN_DATE.err']|3|9||@{0|}}
{30001002|XXparameter|RMF_ERROR_FILE:sandbox|$[  AI_SERIAL_LOG + '/' + DATA_SOURCE_NAME + '__rmf_errors__' + (string("")) MIN_TXN_DATE + '__' +  (string("")) MAX_TXN_DATE + (string(""))  (date("YYYYMMDD")) now1() + '.err']|3|9||@{0|}}
{30001002|XXparameter|RMF_LOG_FILE:eme|$[ AI_SERIAL_LOG + '/' + DATA_SOURCE_NAME + '__rmf_log__MIN_TXN_DATE__MAX_TXN_DATE.log']|3|9||@{0|}}
{30001002|XXparameter|RMF_LOG_FILE:sandbox|$[  AI_SERIAL_LOG + '/' + DATA_SOURCE_NAME + '__rmf_log__' +  (string("")) MIN_TXN_DATE + '__' + (string(""))  MAX_TXN_DATE +  (string(""))  (date("YYYYMMDD")) now1() + '.log']|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|read_remote_multi_icffs|girish.sonar|@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1891000|784000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'read_remote_multi_icffs' Execution Status Report

Job completed successfully at Sunday, June 26, 2016 13:03:06
Run performed by user ajrambar.kad
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Egvd_Normal||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@

DATA_SOURCE_DML                         	$AI_DML/rt200p_enriched.dml
DATA_SOURCE_NAME	                      claimsinfo_rxclaim
INDEX_COL	                                      mxtdnb
FILE_SUBDIR	                                   rxclaim_adjud
FILE_MASK	                                      rxclaim_adjudication_
MIN_TXN_DATE	                                 20150704
MAX_TXN_DATE	                              $[(date("YYYYMMDD")) now1()]
DATA_PATH	                                      $AI_MFS
REMOTE_LAYOUT                            $REMOTE_LAYOUT
LOCAL_LAYOUT                               $LOCAL_LAYOUT
REMOTE_LAYOUT_DEPTH              $REMOTE_LAYOUT_DEPTH
LOCAL_LAYOUT_DEPTH                 $LOCAL_LAYOUT_DEPTH
|169000|461000|0|0|0|0|11664|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Narrow|0|100|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Parameter Name|162000|435000|0|0|0|0|11609|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Default Value (eg.)|377000|435000|0|0|0|0|11610|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@For Serial Layouts in both REMOTE and LOCAL systems
|1086000|443000|0|0|0|0|11913|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}11919|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}11886|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}11924|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}11927|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}11637|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.11827956885099411|{0|}11885|2065|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}11889|2580|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}11888|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}11817|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}11926|19|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}11918|530|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}11923|19|}}
{2010501005|XXGpvertex|25|0|49|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@455000|248500|723000|204000|54000|41000|11819|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|26|0|51|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|27|0|54|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|28|0|57|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|29|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|30|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|31|0|65|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
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
}}@0|@76000|233000|0|0|0|0|11638|generate record- Kicker|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|32|0|67|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|33|0|70|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|34|0|72|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|35|0|74|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|36|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|37|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|38|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|39|0|85|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/* This type is optional.*/
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
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|include "~$ABSQL_DML/qe_term_type.dml";
metadata type = 
record
  date("YYYY-MM-DD") day;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@246000|208500|301000|175000|123000|107000|11636|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|87|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|41|0|90|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|42|0|92|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|94|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|96|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|99|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|46|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|47|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|48|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|49|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|50|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|51|0|120|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ REMOTE_LAYOUT_DEPTH == 1 and LOCAL_LAYOUT_DEPTH == 1]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1211500|370000|0|0|0|0|11887|Dummy : Both Serial Layouts|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|122|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|53|0|125|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|54|0|128|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|55|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|56|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|57|0|136|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$\{LOCAL_LAYOUT\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@1426500|250000|0|0|0|0|11875|Replicate-on local layout|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|58|0|138|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|59|0|140|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|60|0|144|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|61|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|62|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|63|0|152|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$DATA_SOURCE_XFR|3|3|fcj|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$\{DATA_PATH\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$OUTPUT_DML|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|file_missing|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_group||3|1|l|@{0|}}
{30001002|XXparameter|log_group||3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@641000|217500|866000|179000|227000|113000|11922|Read Multiple Split ICFF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|154|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|157|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|159|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|162|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|164|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|69|0|166|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|169|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|172|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003023|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|72|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|73|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|74|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|75|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|76|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|77|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|79|0|201|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_group||3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Handle Errors|618000|452000|0|0|0|0|11928|Handle Errors|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|80|0|203|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|81|0|205|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|82|0|208|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|210|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|84|0|213|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying this Handle Errors component.|{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of escalated errors to log.|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|type1|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type for log_error and final_log_output|{0|}}
{30001002|XXparameter|num_operations|2|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(in)|3|2|H$|Called to transform the input to the error port.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(in)|3|2|H$|Called on every input record.|{0|}}
{30001002|XXparameter|port_analysis|escalate=exact(in); error=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|escalate_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|escalate,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/error-info.dml")
metadata type: escalate = in
metadata type: error = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Handle Errors|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|85|0|215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|86|0|218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|87|0|221|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|88|0|224|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|89|0|227|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$RMF_ERROR_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$RMF_ERROR_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@656000|626000|0|0|0|0|11916|RMF_ERROR_FILE|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|90|0|229|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|91|0|232|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|92|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|93|0|240|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group||3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Handle Logs|847000|448000|0|0|0|0|11925|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|94|0|242|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|95|0|245|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|96|0|248|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name identifying this Handle Logs component.|{0|}}
{30001002|XXparameter|port_analysis|log=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/log-info.dml")
metadata type: log = in|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Handle Logs|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|97|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|98|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|99|0|256|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$RMF_LOG_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$RMF_LOG_FILE|3|2|$|@{0|}}
}}@0|@866000|621000|0|0|0|0|11895|RMF_LOG_FILE|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|100|0|258|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|101|0|261|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|102|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|103|0|268|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ REMOTE_LAYOUT_DEPTH != 1 or LOCAL_LAYOUT_DEPTH != 1]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|1206500|245000|0|0|0|0|11890|PBRR :One Or more Multi Layout|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|270|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|105|0|273|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|106|0|276|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|107|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|108|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|109|0|290|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@991500|250000|0|0|0|0|11830|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|110|0|292|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|111|0|296|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|112|0|299|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|113|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|114|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|115|0|312|0|{@{}@0|0|0|0|out0|.3649932157394844|@@@14352|0|}}
{2010110002|XXGconstant|116|0|315|0|{@{}@{1|6059329|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010605001|XXGgraph_legend_legend|8|0|16|0|{2|}1|9|}
{2010241001|XXGlegend_face_face|9|0|18|0|{}9|10|}
{2010605001|XXGgraph_legend_legend|10|0|20|0|{3|}1|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_13|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_15|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_16|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_2|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_3|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_4|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_5|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_6|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_7|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_8|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_9|}1|24|}
{2010601001|XXGgraph_vertex_vertex|24|0|48|0|{Broadcast|}1|25|}
{2010212001|XXGvertex_oport_oport|25|0|50|0|{0|out|}25|26|}
{2010213001|XXGoport_dst_flow|26|0|52|0|{0|}26|23|}
{2010211001|XXGvertex_iport_iport|27|0|53|0|{0|in|}25|27|}
{2010214001|XXGiport_src_flow|28|0|55|0|{0|}27|21|}
{2010007001|XXGobject_proto_object|29|0|56|0|{}25|28|}
{2010212001|XXGvertex_oport_oport|30|0|58|0|{0|out|}28|29|}
{2010006001|XXGobject_psameas_object|31|0|60|0|{metadata|out_metadata|1|0|}29|28|}
{2010211001|XXGvertex_iport_iport|32|0|61|0|{0|in|}28|30|}
{2010006001|XXGobject_psameas_object|33|0|63|0|{metadata|in_metadata|1|0|}30|28|}
{2010006001|XXGobject_psameas_object|34|0|64|0|{Layout|Layout|0|0|}25|31|}
{2010212001|XXGvertex_oport_oport|35|0|66|0|{0|out|}31|32|}
{2010213001|XXGoport_dst_flow|36|0|68|0|{0|}32|17|}
{2010212001|XXGvertex_oport_oport|37|0|69|0|{1|error|}31|33|}
{2010212001|XXGvertex_oport_oport|38|0|71|0|{2|log|}31|34|}
{2010007001|XXGobject_proto_object|39|0|73|0|{}31|35|}
{2010212001|XXGvertex_oport_oport|40|0|75|0|{0|out|}35|36|}
{2010006001|XXGobject_psameas_object|41|0|77|0|{metadata|out_metadata|1|0|}36|35|}
{2010212001|XXGvertex_oport_oport|42|0|78|0|{1|error|}35|37|}
{2010006001|XXGobject_psameas_object|43|0|80|0|{metadata|error_metadata|1|0|}37|35|}
{2010212001|XXGvertex_oport_oport|44|0|81|0|{2|log|}35|38|}
{2010006001|XXGobject_psameas_object|45|0|83|0|{metadata|log_metadata|1|0|}38|35|}
{2010006001|XXGobject_psameas_object|46|0|84|0|{in_metadata|out_metadata|0|0|}25|39|}
{2010212001|XXGvertex_oport_oport|47|0|86|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|48|0|88|0|{0|}40|21|}
{2010212001|XXGvertex_oport_oport|49|0|89|0|{1|reject|}39|41|}
{2010212001|XXGvertex_oport_oport|50|0|91|0|{2|error|}39|42|}
{2010212001|XXGvertex_oport_oport|51|0|93|0|{3|log|}39|43|}
{2010211001|XXGvertex_iport_iport|52|0|95|0|{0|in|}39|44|}
{2010214001|XXGiport_src_flow|53|0|97|0|{0|}44|17|}
{2010007001|XXGobject_proto_object|54|0|98|0|{}39|45|}
{2010212001|XXGvertex_oport_oport|55|0|100|0|{0|out|}45|46|}
{2010006001|XXGobject_psameas_object|56|0|102|0|{metadata|out_metadata|1|0|}46|45|}
{2010212001|XXGvertex_oport_oport|57|0|103|0|{1|reject|}45|47|}
{2010006001|XXGobject_psameas_object|58|0|105|0|{metadata|reject_metadata|1|0|}47|45|}
{2010212001|XXGvertex_oport_oport|59|0|106|0|{2|error|}45|48|}
{2010006001|XXGobject_psameas_object|60|0|108|0|{metadata|error_metadata|1|0|}48|45|}
{2010212001|XXGvertex_oport_oport|61|0|109|0|{3|log|}45|49|}
{2010006001|XXGobject_psameas_object|62|0|111|0|{metadata|log_metadata|1|0|}49|45|}
{2010211001|XXGvertex_iport_iport|63|0|112|0|{0|in|}45|50|}
{2010006001|XXGobject_psameas_object|64|0|114|0|{metadata|in_metadata|1|0|}50|45|}
{2010006001|XXGobject_psameas_object|65|0|115|0|{Layout|Layout|0|0|}39|31|}
{2010006001|XXGobject_psameas_object|66|0|116|0|{in_metadata|out_metadata|0|0|}39|31|}
{2010006001|XXGobject_psameas_object|67|0|117|0|{reject_metadata|out_metadata|0|0|}39|31|}
{2010006001|XXGobject_psameas_object|68|0|118|0|{out_metadata|out_metadata|0|0|}25|39|}
{2010601001|XXGgraph_vertex_vertex|69|0|119|0|{Dummy_Both_Serial_Layouts|}1|51|}
{2010212001|XXGvertex_oport_oport|70|0|121|0|{0|out|}51|52|}
{2010213001|XXGoport_dst_flow|71|0|123|0|{0|}52|14|}
{2010211001|XXGvertex_iport_iport|72|0|124|0|{0|in|}51|53|}
{2010214001|XXGiport_src_flow|73|0|126|0|{0|}53|18|}
{2010007001|XXGobject_proto_object|74|0|127|0|{}51|54|}
{2010212001|XXGvertex_oport_oport|75|0|129|0|{0|out|}54|55|}
{2010006001|XXGobject_psameas_object|76|0|131|0|{metadata|out_metadata|1|0|}55|54|}
{2010211001|XXGvertex_iport_iport|77|0|132|0|{0|in|}54|56|}
{2010006001|XXGobject_psameas_object|78|0|134|0|{metadata|in_metadata|1|0|}56|54|}
{2010006001|XXGobject_psameas_object|79|0|135|0|{Layout|Layout|0|0|}51|57|}
{2010212001|XXGvertex_oport_oport|80|0|137|0|{0|out|}57|58|}
{2010211001|XXGvertex_iport_iport|81|0|139|0|{0|in|}57|59|}
{2010214001|XXGiport_src_flow|82|0|141|0|{0|}59|19|}
{2010214001|XXGiport_src_flow|83|0|142|0|{1|}59|14|}
{2010007001|XXGobject_proto_object|84|0|143|0|{}57|60|}
{2010212001|XXGvertex_oport_oport|85|0|145|0|{0|out|}60|61|}
{2010006001|XXGobject_psameas_object|86|0|147|0|{metadata|out_metadata|1|0|}61|60|}
{2010211001|XXGvertex_iport_iport|87|0|148|0|{0|in|}60|62|}
{2010006001|XXGobject_psameas_object|88|0|150|0|{metadata|in_metadata|1|0|}62|60|}
{2010006001|XXGobject_psameas_object|89|0|151|0|{in_metadata|out_metadata|0|0|}57|63|}
{2010212001|XXGvertex_oport_oport|90|0|153|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|91|0|155|0|{0|}64|13|}
{2010212001|XXGvertex_oport_oport|92|0|156|0|{1|filereject|}63|65|}
{2010212001|XXGvertex_oport_oport|93|0|158|0|{2|fileerror|}63|66|}
{2010213001|XXGoport_dst_flow|94|0|160|0|{0|}66|22|}
{2010212001|XXGvertex_oport_oport|95|0|161|0|{3|reject|}63|67|}
{2010212001|XXGvertex_oport_oport|96|0|163|0|{4|error|}63|68|}
{2010212001|XXGvertex_oport_oport|97|0|165|0|{5|log|}63|69|}
{2010213001|XXGoport_dst_flow|98|0|167|0|{0|}69|24|}
{2010211001|XXGvertex_iport_iport|99|0|168|0|{0|in|}63|70|}
{2010214001|XXGiport_src_flow|100|0|170|0|{0|}70|23|}
{2010007001|XXGobject_proto_object|101|0|171|0|{}63|71|}
{2010212001|XXGvertex_oport_oport|102|0|173|0|{0|out|}71|72|}
{2010006001|XXGobject_psameas_object|103|0|175|0|{metadata|out_metadata|1|0|}72|71|}
{2010212001|XXGvertex_oport_oport|104|0|176|0|{1|filereject|}71|73|}
{2010006001|XXGobject_psameas_object|105|0|178|0|{metadata|filereject_metadata|1|0|}73|71|}
{2010212001|XXGvertex_oport_oport|106|0|179|0|{2|fileerror|}71|74|}
{2010006001|XXGobject_psameas_object|107|0|181|0|{metadata|fileerror_metadata|1|0|}74|71|}
{2010212001|XXGvertex_oport_oport|108|0|182|0|{3|reject|}71|75|}
{2010006001|XXGobject_psameas_object|109|0|184|0|{metadata|reject_metadata|1|0|}75|71|}
{2010212001|XXGvertex_oport_oport|110|0|185|0|{4|error|}71|76|}
{2010006001|XXGobject_psameas_object|111|0|187|0|{metadata|error_metadata|1|0|}76|71|}
{2010212001|XXGvertex_oport_oport|112|0|188|0|{5|log|}71|77|}
{2010006001|XXGobject_psameas_object|113|0|190|0|{metadata|log_metadata|1|0|}77|71|}
{2010211001|XXGvertex_iport_iport|114|0|191|0|{0|in|}71|78|}
{2010006001|XXGobject_psameas_object|115|0|193|0|{metadata|in_metadata|1|0|}78|71|}
{2010006001|XXGobject_psameas_object|116|0|194|0|{filereject_metadata|out_metadata|0|0|}63|39|}
{2010006001|XXGobject_psameas_object|117|0|195|0|{in_metadata|out_metadata|0|0|}63|39|}
{2010006001|XXGobject_psameas_object|118|0|196|0|{out_metadata|out_metadata|0|0|}57|63|}
{2010006001|XXGobject_psameas_object|119|0|197|0|{in_metadata|out_metadata|0|0|}51|63|}
{2010006001|XXGobject_psameas_object|120|0|198|0|{out_metadata|out_metadata|0|0|}51|63|}
{2010601001|XXGgraph_vertex_vertex|121|0|199|0|{Generate_Days_in_Range|}1|39|}
{2010601001|XXGgraph_vertex_vertex|122|0|200|0|{Handle_Errors|}1|79|}
{2010212001|XXGvertex_oport_oport|123|0|202|0|{0|escalate|}79|80|}
{2010212001|XXGvertex_oport_oport|124|0|204|0|{1|error|}79|81|}
{2010213001|XXGoport_dst_flow|125|0|206|0|{0|}81|16|}
{2010212001|XXGvertex_oport_oport|126|0|207|0|{2|log|}79|82|}
{2010211001|XXGvertex_iport_iport|127|0|209|0|{0|in|}79|83|}
{2010214001|XXGiport_src_flow|128|0|211|0|{0|}83|22|}
{2010007001|XXGobject_proto_object|129|0|212|0|{}79|84|}
{2010212001|XXGvertex_oport_oport|130|0|214|0|{0|escalate|}84|85|}
{2010006001|XXGobject_psameas_object|131|0|216|0|{metadata|escalate_metadata|1|0|}85|84|}
{2010212001|XXGvertex_oport_oport|132|0|217|0|{1|error|}84|86|}
{2010006001|XXGobject_psameas_object|133|0|219|0|{metadata|error_metadata|1|0|}86|84|}
{2010212001|XXGvertex_oport_oport|134|0|220|0|{2|log|}84|87|}
{2010006001|XXGobject_psameas_object|135|0|222|0|{metadata|log_metadata|1|0|}87|84|}
{2010211001|XXGvertex_iport_iport|136|0|223|0|{0|in|}84|88|}
{2010006001|XXGobject_psameas_object|137|0|225|0|{metadata|in_metadata|1|0|}88|84|}
{2010006001|XXGobject_psameas_object|138|0|226|0|{Layout|Layout|0|0|}79|89|}
{2010211001|XXGvertex_iport_iport|139|0|228|0|{0|write|}89|90|}
{2010214001|XXGiport_src_flow|140|0|230|0|{0|}90|16|}
{2010007001|XXGobject_proto_object|141|0|231|0|{}89|91|}
{2010211001|XXGvertex_iport_iport|142|0|233|0|{0|write|}91|92|}
{2010006001|XXGobject_psameas_object|143|0|235|0|{metadata|write_metadata|1|0|}92|91|}
{2010006001|XXGobject_psameas_object|144|0|236|0|{write_metadata|in_metadata|0|0|}89|79|}
{2010006001|XXGobject_psameas_object|145|0|237|0|{error_metadata|in_metadata|0|0|}79|79|}
{2010006001|XXGobject_psameas_object|146|0|238|0|{escalate_metadata|in_metadata|0|0|}79|79|}
{2010601001|XXGgraph_vertex_vertex|147|0|239|0|{Handle_Logs|}1|93|}
{2010212001|XXGvertex_oport_oport|148|0|241|0|{0|log|}93|94|}
{2010213001|XXGoport_dst_flow|149|0|243|0|{0|}94|15|}
{2010211001|XXGvertex_iport_iport|150|0|244|0|{0|in|}93|95|}
{2010214001|XXGiport_src_flow|151|0|246|0|{0|}95|24|}
{2010007001|XXGobject_proto_object|152|0|247|0|{}93|96|}
{2010212001|XXGvertex_oport_oport|153|0|249|0|{0|log|}96|97|}
{2010006001|XXGobject_psameas_object|154|0|251|0|{metadata|log_metadata|1|0|}97|96|}
{2010211001|XXGvertex_iport_iport|155|0|252|0|{0|in|}96|98|}
{2010006001|XXGobject_psameas_object|156|0|254|0|{metadata|in_metadata|1|0|}98|96|}
{2010006001|XXGobject_psameas_object|157|0|255|0|{Layout|Layout|0|0|}93|99|}
{2010211001|XXGvertex_iport_iport|158|0|257|0|{0|write|}99|100|}
{2010214001|XXGiport_src_flow|159|0|259|0|{0|}100|15|}
{2010007001|XXGobject_proto_object|160|0|260|0|{}99|101|}
{2010211001|XXGvertex_iport_iport|161|0|262|0|{0|write|}101|102|}
{2010006001|XXGobject_psameas_object|162|0|264|0|{metadata|write_metadata|1|0|}102|101|}
{2010006001|XXGobject_psameas_object|163|0|265|0|{write_metadata|in_metadata|0|0|}99|93|}
{2010006001|XXGobject_psameas_object|164|0|266|0|{log_metadata|in_metadata|0|0|}93|93|}
{2010601001|XXGgraph_vertex_vertex|165|0|267|0|{PBRR_One_Or_more_Multi_Layout|}1|103|}
{2010212001|XXGvertex_oport_oport|166|0|269|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|167|0|271|0|{0|}104|19|}
{2010211001|XXGvertex_iport_iport|168|0|272|0|{0|in|}103|105|}
{2010214001|XXGiport_src_flow|169|0|274|0|{0|}105|20|}
{2010007001|XXGobject_proto_object|170|0|275|0|{}103|106|}
{2010212001|XXGvertex_oport_oport|171|0|277|0|{0|out|}106|107|}
{2010006001|XXGobject_psameas_object|172|0|279|0|{metadata|out_metadata|1|0|}107|106|}
{2010211001|XXGvertex_iport_iport|173|0|280|0|{0|in|}106|108|}
{2010006001|XXGobject_psameas_object|174|0|282|0|{metadata|in_metadata|1|0|}108|106|}
{2010006001|XXGobject_psameas_object|175|0|283|0|{Layout|Layout|0|0|}103|63|}
{2010006001|XXGobject_psameas_object|176|0|284|0|{in_metadata|out_metadata|0|0|}103|63|}
{2010006001|XXGobject_psameas_object|177|0|285|0|{out_metadata|out_metadata|0|0|}103|63|}
{2010601001|XXGgraph_vertex_vertex|178|0|286|0|{RMF_ERROR_FILE|}1|89|}
{2010601001|XXGgraph_vertex_vertex|179|0|287|0|{RMF_LOG_FILE|}1|99|}
{2010601001|XXGgraph_vertex_vertex|180|0|288|0|{Read_Multiple_Split_ICFF|}1|63|}
{2010601001|XXGgraph_vertex_vertex|181|0|289|0|{Replicate|}1|109|}
{2010212001|XXGvertex_oport_oport|182|0|291|0|{0|out|}109|110|}
{2010213001|XXGoport_dst_flow|183|0|293|0|{0|}110|20|}
{2010213001|XXGoport_dst_flow|184|0|294|0|{1|}110|18|}
{2010211001|XXGvertex_iport_iport|185|0|295|0|{0|in|}109|111|}
{2010214001|XXGiport_src_flow|186|0|297|0|{0|}111|13|}
{2010007001|XXGobject_proto_object|187|0|298|0|{}109|112|}
{2010212001|XXGvertex_oport_oport|188|0|300|0|{0|out|}112|113|}
{2010006001|XXGobject_psameas_object|189|0|302|0|{metadata|out_metadata|1|0|}113|112|}
{2010211001|XXGvertex_iport_iport|190|0|303|0|{0|in|}112|114|}
{2010006001|XXGobject_psameas_object|191|0|305|0|{metadata|in_metadata|1|0|}114|112|}
{2010006001|XXGobject_psameas_object|192|0|306|0|{Layout|Layout|0|0|}109|63|}
{2010006001|XXGobject_psameas_object|193|0|307|0|{in_metadata|out_metadata|0|0|}109|63|}
{2010006001|XXGobject_psameas_object|194|0|308|0|{out_metadata|out_metadata|0|0|}109|63|}
{2010601001|XXGgraph_vertex_vertex|195|0|309|0|{Replicate_on_local_layout|}1|57|}
{2010601001|XXGgraph_vertex_vertex|196|0|310|0|{generate_record_Kicker|}1|31|}
{2010212001|XXGvertex_oport_oport|197|0|311|0|{0|out0|}1|115|}
{2010216002|XXGoport_binding_oport|198|0|313|0|{.5|.5|{0|}11917|}115|58|}
{2010109001|XXGobject_property_value|199|0|314|0|{0|TrackingThumbprint|72|}1|116|}
