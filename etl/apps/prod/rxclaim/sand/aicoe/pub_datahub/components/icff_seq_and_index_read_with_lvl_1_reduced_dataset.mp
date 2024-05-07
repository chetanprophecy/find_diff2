@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|129|rel_count|215|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|comment_00|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|comment_01|# BEGIN QUERY ENGINE v2 INTERFACE PARAMETERS      #|3|1|Kl||{0|}}
{30001002|XXparameter|comment_02|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|DATA_SOURCE_DML|$AI_DML/optum.rxclaim.v8.target.dml|7|9|RFKf||{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED|/app02/abinitio/ab_appconf_root_dir.datahub/main/users/msingh/edw/datahub/dml/optum.rxclaim.v8.target_reduced.dml|7|9|FK|This is the first level reduced dml , Supply the path of this dml via input parameter|{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED_STEP2|$[string_replace(DATA_SOURCE_DML_REDUCED, "_reduced.dml", "_reduced_step2.dml")]|3|9|K|The step broken  strip down version of main dataset , Highly optimized , highly focussed on performence|{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_REDUCED_STEP3|$[string_replace(DATA_SOURCE_DML_REDUCED, "_reduced.dml", "_reduced_step3.dml")]|3|9|K|@{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME|msingh_optum_v8|3|9|RFK||{0|}}
{30001002|XXparameter|DATA_URL|/app02/abinitio/ai_data_mount_2/data/mfs/mfs_4way/edw/datahub/main/msingh|18|9|RFK||{0|}}
{30001002|XXparameter|AB_SQL_DML_PREAMBLE||20|9|FK||{0|}}
{30001002|XXparameter|OUTPUT_DML|record
  decimal(15)  RxCLAIM_Number;
end|7|9|FK||{0|}}
{30001002|XXparameter|OUTPUT_COL_NM|$[record_info_item(OUTPUT_DML,item = "name") ]|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_COL|$[record_info_item(read_file(DATA_SOURCE_DML_REDUCED),item = "name")]|3|9|K|@{0|}}
{30001002|XXparameter|AB_SQL_RESERVED_FIELDS_DML|record
end|7|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_REQUESTED_FIELDS_DML|record
  decimal(15)  RxCLAIM_Number;
end|7|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_FILTER_EXPRESSION|1|20|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_FILTER_EXPRESSION_FIELDS_DML|record
end|7|9|RFK||{0|}}
{30001002|XXparameter|FILTER_COLUMN_NM|$[record_info_item(DATA_SOURCE_FILTER_EXPRESSION_FIELDS_DML,item = "name") ]|3|9|FK|@{0|}}
{30001002|XXparameter|DATA_SOURCE_QE_VECTOR_CONSTRUCTOR|[ vector ]|20|9|RFK||{0|}}
{30001002|XXparameter|DATA_SOURCE_QE_EXPRESSION|1|20|9|RFK||{0|}}
{30001002|XXparameter|AB_SQL_USERNAME|msingh|3|9|FK||{0|}}
{30001002|XXparameter|security_filter|1|20|9|FK||{0|}}
{30001002|XXparameter|security_mapping||8|9|FK||{0|}}
{30001002|XXparameter|comment_40|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|comment_41|# END     QUERY ENGINE v2 INTERFACE PARAMETERS     #|3|1|Kl||{0|}}
{30001002|XXparameter|comment_42|####################################|3|1|Kl||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|LEN_OF_DIFF_WITH_FILTER_COL|$[ if(length_of(vector_difference(FILTER_COLUMN_NM,REDUCED_COL))==0  and OUTPUT_COL_NM[0]=="_ab_subgraph_dummy" ) 1
else if (length_of(vector_difference(FILTER_COLUMN_NM,REDUCED_COL))==0 ) 1
else if( DATA_SOURCE_QE_EXPRESSION == '1' && OUTPUT_COL_NM[0]!="_ab_subgraph_dummy") 99
else 2
//A dummy subgraph is created when select count * is queried
// If dataset id is 1 reduced dataset will be read 
]|3|9|K|@{0|}}
{30001002|XXparameter|LEN_OF_DIFF_WITH_OUTPUT_COL|$[ if(length_of(vector_difference(OUTPUT_COL_NM,REDUCED_COL))==0  or OUTPUT_COL_NM[0]=="_ab_subgraph_dummy" ) 1
else if( DATA_SOURCE_QE_EXPRESSION == '1' && OUTPUT_COL_NM[0]!="_ab_subgraph_dummy") 99
else 2
//A dummy subgraph is created when select count * is queried
// If dataset id is 1 reduced dataset will be read 
]|3|9|K|@{0|}}
{30001002|XXparameter|USE_REDUCED_DATASET_ID|$[ if(LEN_OF_DIFF_WITH_OUTPUT_COL > LEN_OF_DIFF_WITH_FILTER_COL ) LEN_OF_DIFF_WITH_OUTPUT_COL else LEN_OF_DIFF_WITH_FILTER_COL ]|3|9|K|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_EXPANDED|$[ if(USE_REDUCED_DATASET_ID== 1 ) expand_type(read_file(DATA_SOURCE_DML_REDUCED)) 
else expand_type(DATA_SOURCE_DML)
]|3|9|RK||{0|}}
{30001002|XXparameter|AB_QE_QUERY_FIELDS_DML|include "~$ABSQL_DML/qe_term_type.dml";

metadata type = 
record
  qe_term_type[decimal(6,0)] _ab_qe_query;
end;|3|9|RK||{0|}}
{30001002|XXparameter|AB_QE_QUERY_FIELDS_DML_RESOLVED|$[ expand_type(AB_QE_QUERY_FIELDS_DML) ]|7|9|RK||{0|}}
{30001002|XXparameter|AB_SUBGRAPH_PLUMBING_FIELDS_DML|$[ join_types(AB_QE_QUERY_FIELDS_DML_RESOLVED, AB_SQL_RESERVED_FIELDS_DML) ]|7|9|RK||{0|}}
{30001002|XXparameter|DATA_SOURCE_AND_PLUMBING_FIELDS_DML|$[ DATA_SOURCE_DML_EXPANDED ]|7|9|RK||{0|}}
{30001002|XXparameter|FINAL_FILTER_EXPRESSION|($\{security_filter\}) && ($\{DATA_SOURCE_FILTER_EXPRESSION\}) && ($\{DATA_SOURCE_QE_EXPRESSION\})|20|9|RK||{0|}}
{30001002|XXparameter|USER_PARAMETERS|########################################|3|1|Kl|@{0|}}
{30001002|XXparameter|INDEX_COL|Date_Submitted|3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|ICFF_KEY|RxCLAIM_Number|3|9|FK|@{0|}}
{30001002|XXparameter|FILE_SUBDIR|optum.rxclaim|3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_MASK|optum.rxclaim.v8_|3|9|FK|The Mask of icff files|{0|}}
{30001002|XXparameter|MIN_TXN_DATE|20130101|3|2|RFK$|Start date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$[(date("YYYYMMDD")) now1()]|3|9|RFK|End date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|DATA_PATH|$[string_replace(DATA_URL, "mfile:", "")]|3|9|REK|@{0|}}
{30001002|XXparameter|PICK_FILE_ONE|$[
begin
let decimal(",") count_file_vec_len=length_of(directory_listing(string_concat(DATA_PATH,"/",FILE_SUBDIR,"/"), string_concat(FILE_MASK,"*.dat.gz")) );
result :: directory_listing(string_concat(DATA_PATH,"/",FILE_SUBDIR,"/"), string_concat(FILE_MASK,"*.dat.gz"))[count_file_vec_len - 1];
end
]|3|9|K|This file has to be read|{0|}}
{30001002|XXparameter|mpcmodtime|1455395258|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@456000|52000|0|0|1510000|554000|26|icff_seq_and_index_read_with_lvl_1_reduced_dataset|Mukesh.Singh||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1510000|648000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|0|}Job 'icff_seq_and_index_read_with_lvl_1_reduced_dataset' Execution Status Report

Job completed successfully at Thursday, May 12, 2016 15:45:10
Run performed by user hitesh.yadav
||@@@@31634943|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@EGV-DEV||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@80|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Component will split record based
 on icff key so that for every 
icff key it perform one 
lookup at a time|662000|507000|0|0|0|0|2256|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Component will split record based
Lookup operation ICFF is performed 
here .|927000|522000|0|0|0|0|2257|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@If Query is not using ICFF key 
This router will route to 
sequential scan method|657000|87000|0|0|0|0|2258|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Date               Author                Description
02/03/16      Mukesh (Exusia)   Initial version|49000|50000|0|0|0|0|2281|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial Rounded MT Bold|0|120|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{8|227000|229000|247000|229000|269000|229000|290000|229000|}2303|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}2301|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}1888|530|}}
{2010243001|XXGwatcher|16|0|31|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}2297|17|}}
{2010243001|XXGwatcher|18|0|35|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}2290|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{12|1103000|224000|1123000|224000|1154000|224000|1154000|239000|1185000|239000|1206000|239000|}2291|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}2296|17|}}
{2010243001|XXGwatcher|22|0|43|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}2294|17|}}
{2010501005|XXGpvertex|24|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@540000|195000|723000|204000|54000|41000|1804|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|25|0|49|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|26|0|52|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|27|0|55|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|28|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|29|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|30|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|/* This type is optional.*/
// type temporary_type = NULL_TYPE;


/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
  out :: 1 + in.end_date - in.start_date;
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.day :: in.start_date + index;
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$ABSQL_DML/qe_term_type.dml";
metadata type = 
record
  date("YYYY-MM-DD") day;
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@281000|155000|301000|175000|123000|107000|2302|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|31|0|65|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|32|0|68|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|33|0|70|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|34|0|72|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|35|0|74|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|77|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|37|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|39|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|40|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|41|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|94|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|include "~$ABSQL_DML/qe_term_type.dml";

out::reformat(in)=
begin
  let utf8 string('')[decimal(6,0)] term_dates = allocate();
  //resonable defaults - for the possible time period for which the daily files exist
  //TODO - walk directory structure to figure out available date ranges. Optionally parameterize so that can be configured from Query>It admin UI.
  
  let date("YYYYMMDD") start_date = '$\{MIN_TXN_DATE\}'; 
  let date("YYYYMMDD") end_date = '$\{MAX_TXN_DATE\}'; 

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{INDEX_COL\}')
        begin
           let date("YYYYMMDD") val = (datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string(''))term.field_values[0];
           if ((term.field_op == '<=' or term.field_op == '<') and (end_date > val))
              end_date = val;
           else if ((term.field_op == '>=' or term.field_op == '>') and (start_date < val))
              start_date = val;
           else if (term.field_op == '=')
             begin
               start_date = val;
               end_date = val;
             end;
        end;
  end;
  
  //Below code will only execute if the Query has date submitted with OR
  //Example: select count(*) from <table> where date_submitted = '2016-01-10' or date_submitted = '2016-02-10'
  if(length_of(vector_select(in._ab_qe_query, 
                                (qe_term_type) [record field_name "$\{INDEX_COL\}", field_op "", field_values [vector], field_connective_op "OR", field_connective_op_lvl 0], 
                                \{field_name; field_connective_op\})) != 0)
  begin
          //Get all dates to fix the date range issue for OR clause in the SQL query.
          for(let i, i < length_of(vector_select(in._ab_qe_query, 
                                        (qe_term_type) [record field_name "$\{INDEX_COL\}", field_op "", field_values [vector], field_connective_op "", field_connective_op_lvl 0], 
                                        \{field_name\})))
          begin
          term_dates = vector_union(term_dates, vector_select(in._ab_qe_query, 
                                        (qe_term_type) [record field_name "$\{INDEX_COL\}", field_op "", field_values [vector], field_connective_op "", field_connective_op_lvl 0], 
                                        \{field_name\})[i].field_values);
          end
  
          //Fix start and end dates
          if((datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string('')) vector_min(term_dates) < start_date)
                start_date = (datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string('')) vector_min(term_dates);
          if((datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string('')) vector_max(term_dates) > end_date)
                end_date = (datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN"))(string('')) vector_max(term_dates);
  end
  
  out.start_date :: start_date;
  out.end_date :: end_date;
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$ABSQL_DML/qe_term_type.dml";

metadata type = 
record
  date("YYYY-MM-DD") start_date;
  date("YYYY-MM-DD") end_date; 
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|reject0_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|Layout||3|2|s$|@{0|}}
}}@0|@74367|167317|94000|187000|123000|89000|2304|Reformat Query|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|43|0|96|0|{@{}@216000|224000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|44|0|99|0|{@{}@109000|275000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|45|0|101|0|{@{}@149000|275000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|46|0|103|0|{@{}@189000|275000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|105|0|{@{}@84000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|107|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1271210992|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|49|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|50|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|51|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|52|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|53|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|54|0|127|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|select||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1127000|190000|1217000|185000|132000|107000|1887|Final Filter and Masking|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|55|0|129|0|{@{}@1348000|234000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|56|0|131|0|{@{}@1239000|291000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|57|0|133|0|{@{}@1279000|291000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|58|0|135|0|{@{}@1319000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|137|0|{@{}@1207000|234000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|141|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|out0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = "string('\\\\n')"
metadata type: reject = in
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|61|0|143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|62|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|63|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|65|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|66|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|//Identify which data or index file to use , based on output of query
let string("\\x01") FILE_SUB_DIR=  if( $\{USE_REDUCED_DATASET_ID\} == 99 ) "/$\{FILE_SUBDIR\}"
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 1 ) "/$\{FILE_SUBDIR\}_reduced"  
                                   else  "/$\{FILE_SUBDIR\}" ;
let lookup_identifier_type current_lookup = allocate() ; 

out::finished(in, index) =
begin
let decimal("") key_val=string_lrtrim(in.key);
let string("") path=string_concat("$\{DATA_PATH\}", FILE_SUB_DIR , "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day);
let string("") datafile=this_partition_path(path + ".dat.gz");
let string("") indexfile=this_partition_path(path + ".idx");
current_lookup = first_without_error(lookup_load(datafile,indexfile, "ICFF_TEMPLATE_LVL1"),lookup_not_loaded());
out :: if (index == 0 and current_lookup != lookup_not_loaded() ) is_null(lookup(current_lookup,"ICFF_TEMPLATE_LVL1",key_val))  //In case missing data or index file lookup not loaded function will save the day.
       else if (current_lookup != lookup_not_loaded()) is_null(lookup_next(current_lookup,"ICFF_TEMPLATE_LVL1"))
       else 1;
end;

out::normalize(in, index) =
begin
//get the record format for lookup  
let
$\{DATA_SOURCE_DML_EXPANDED\} lookup_record_type=NULL;
lookup_previous(current_lookup,"ICFF_TEMPLATE_LVL1"); // Go back to where finished was prior to calling lookup or lookup_next
lookup_record_type = lookup_next(current_lookup,"ICFF_TEMPLATE_LVL1");
 
//Output the record

out.* :1: lookup_record_type.*;

end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|$[ DATA_SOURCE_DML_EXPANDED ]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/rt270p.dat.gz|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|@948000|397000|0|0|0|0|2295|Normalize :Index SCAN by lookup|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|67|0|161|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|68|0|164|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|69|0|166|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|70|0|168|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|71|0|170|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|72|0|173|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|73|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|74|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|75|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|76|0|184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|77|0|187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|190|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|include "~$ABSQL_DML/qe_term_type.dml";
 let decimal("") val=0;
 let integer(3) i=0;
out :: length(in) =
begin

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
        begin
            val = length_of(term.field_values);
        end;
  end;
  out :: val;
end;

out :: normalize(in, index) =
begin
let qe_term_type ab_query_value;
let string("")[10000] ivec = allocate();
for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
          begin
           for(i ,i <= index ) 
              begin
                ivec[index] = term.field_values[index];
               end;
           end;
    end;
out.day :: in.day;
out.key :: ivec[index];
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata|record
  date("YYYY-MM-DD") day;
  string("") key;
end|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata|include "~$ABSQL_DML/qe_term_type.dml";
metadata type = 
record
  date("YYYY-MM-DD") day;
  qe_term_type[decimal(6,0)] _ab_qe_query;
  integer(8) _ab_seqno;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@687000|400000|0|0|0|0|2298|Normalize :Split index col|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|79|0|192|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|80|0|195|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|81|0|197|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|82|0|199|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|201|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|204|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|85|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|86|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|90|0|230|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$DATA_SOURCE_DML_EXPANDED|3|2|$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
}}@0|@512000|45500|0|0|0|0|2284|ICFF_TEMPLATE_LVL1|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010503005|XXGfvertex|91|0|232|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|92|0|236|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|type input_type = $\{DATA_SOURCE_DML_EXPANDED\};


let string("\\x01") FILE_SUB_DIR=  if( $\{USE_REDUCED_DATASET_ID\} == 99 ) "/$\{FILE_SUBDIR\}"
                                  else if( $\{USE_REDUCED_DATASET_ID\} == 1 ) "/$\{FILE_SUBDIR\}_reduced"  
                                   else  "/$\{FILE_SUBDIR\}" ;


/*extract filename from input record*/
filename::get_filename(in)=
begin
  let dt_rec = decode_date_record(in.day);
  
  filename :: if( $\{USE_REDUCED_DATASET_ID\} == 99 )  string_concat(this_partition_path("$\{DATA_PATH\}"), FILE_SUB_DIR ,"/","$\{PICK_FILE_ONE\}" ) 
               else string_concat(this_partition_path("$\{DATA_PATH\}"), FILE_SUB_DIR , "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day, ".dat.gz");
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,filename,in)=
begin
  out.* :: read.*;
  out.* :1: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$\{DATA_URL\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|file_missing|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@911000|14000|866000|179000|227000|113000|2292|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|93|0|238|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|94|0|241|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|95|0|243|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|96|0|245|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|97|0|247|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|98|0|249|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|99|0|251|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|100|0|254|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|fileerror_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003023|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = "string('\\\\n')"
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|101|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|102|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|103|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|104|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|105|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|106|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|108|0|281|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|output_index|include "~$ABSQL_DML/qe_term_type.dml";
 let decimal("") val=0;
/*Function returning index of output port*/
output_index_out::output_index(in)=
begin

  for (let qe_term_type term in in._ab_qe_query)
  begin
    if (term.field_name == '$\{ICFF_KEY\}')
        begin
            val = length_of(term.field_values);
        end;
  end;
  output_index_out:: if ( val >  400 or val == 0 ) 0  else 1;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@693000|155000|0|0|0|0|2249|Router : Index or seq|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|283|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|110|0|286|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|111|0|289|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|112|0|291|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|113|0|293|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|114|0|295|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|115|0|297|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|116|0|299|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|117|0|302|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|118|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|119|0|308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|120|0|312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|121|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|122|0|318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|123|0|321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|124|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|126|0|336|0|{@{}@0|0|0|0|out|.3860294117647059|@@@14736|0|}}
{2010202004|XXGiport|127|0|339|0|{@{}@0|0|0|0|in|.3951310861423221|@@@14096|0|}}
{2010110002|XXGconstant|128|0|342|0|{@{}@{1|8921952|}}}
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
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_2|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_3|}1|15|}
{2010244001|XXGflow_watcher_watcher|15|0|30|0|{}15|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_4|}1|17|}
{2010244001|XXGflow_watcher_watcher|17|0|34|0|{}17|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_5|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_6|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_7|}1|21|}
{2010244001|XXGflow_watcher_watcher|21|0|42|0|{}21|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_8|}1|23|}
{2010601001|XXGgraph_vertex_vertex|23|0|46|0|{Broadcast|}1|24|}
{2010212001|XXGvertex_oport_oport|24|0|48|0|{0|out|}24|25|}
{2010213001|XXGoport_dst_flow|25|0|50|0|{0|}25|15|}
{2010211001|XXGvertex_iport_iport|26|0|51|0|{0|in|}24|26|}
{2010214001|XXGiport_src_flow|27|0|53|0|{0|}26|14|}
{2010007001|XXGobject_proto_object|28|0|54|0|{}24|27|}
{2010212001|XXGvertex_oport_oport|29|0|56|0|{0|out|}27|28|}
{2010006001|XXGobject_psameas_object|30|0|58|0|{metadata|out_metadata|1|0|}28|27|}
{2010211001|XXGvertex_iport_iport|31|0|59|0|{0|in|}27|29|}
{2010006001|XXGobject_psameas_object|32|0|61|0|{metadata|in_metadata|1|0|}29|27|}
{2010006001|XXGobject_psameas_object|33|0|62|0|{in_metadata|out_metadata|0|0|}24|30|}
{2010212001|XXGvertex_oport_oport|34|0|64|0|{0|out|}30|31|}
{2010213001|XXGoport_dst_flow|35|0|66|0|{0|}31|14|}
{2010212001|XXGvertex_oport_oport|36|0|67|0|{1|reject|}30|32|}
{2010212001|XXGvertex_oport_oport|37|0|69|0|{2|error|}30|33|}
{2010212001|XXGvertex_oport_oport|38|0|71|0|{3|log|}30|34|}
{2010211001|XXGvertex_iport_iport|39|0|73|0|{0|in|}30|35|}
{2010214001|XXGiport_src_flow|40|0|75|0|{0|}35|13|}
{2010007001|XXGobject_proto_object|41|0|76|0|{}30|36|}
{2010212001|XXGvertex_oport_oport|42|0|78|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|43|0|80|0|{metadata|out_metadata|1|0|}37|36|}
{2010212001|XXGvertex_oport_oport|44|0|81|0|{1|reject|}36|38|}
{2010006001|XXGobject_psameas_object|45|0|83|0|{metadata|reject_metadata|1|0|}38|36|}
{2010212001|XXGvertex_oport_oport|46|0|84|0|{2|error|}36|39|}
{2010006001|XXGobject_psameas_object|47|0|86|0|{metadata|error_metadata|1|0|}39|36|}
{2010212001|XXGvertex_oport_oport|48|0|87|0|{3|log|}36|40|}
{2010006001|XXGobject_psameas_object|49|0|89|0|{metadata|log_metadata|1|0|}40|36|}
{2010211001|XXGvertex_iport_iport|50|0|90|0|{0|in|}36|41|}
{2010006001|XXGobject_psameas_object|51|0|92|0|{metadata|in_metadata|1|0|}41|36|}
{2010006001|XXGobject_psameas_object|52|0|93|0|{in_metadata|out0_metadata|0|0|}30|42|}
{2010212001|XXGvertex_oport_oport|53|0|95|0|{0|out0|}42|43|}
{2010213001|XXGoport_dst_flow|54|0|97|0|{0|}43|13|}
{2010212001|XXGvertex_oport_oport|55|0|98|0|{1|reject0|}42|44|}
{2010212001|XXGvertex_oport_oport|56|0|100|0|{2|error0|}42|45|}
{2010212001|XXGvertex_oport_oport|57|0|102|0|{3|log|}42|46|}
{2010211001|XXGvertex_iport_iport|58|0|104|0|{0|in|}42|47|}
{2010007001|XXGobject_proto_object|59|0|106|0|{}42|48|}
{2010212001|XXGvertex_oport_oport|60|0|108|0|{0|out0|}48|49|}
{2010006001|XXGobject_psameas_object|61|0|110|0|{metadata|out0_metadata|1|0|}49|48|}
{2010006001|XXGobject_psameas_object|62|0|111|0|{transform0|transform0|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|63|0|112|0|{1|reject0|}48|50|}
{2010006001|XXGobject_psameas_object|64|0|114|0|{metadata|reject0_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|65|0|115|0|{2|error0|}48|51|}
{2010006001|XXGobject_psameas_object|66|0|117|0|{metadata|error0_metadata|1|0|}51|48|}
{2010212001|XXGvertex_oport_oport|67|0|118|0|{3|log|}48|52|}
{2010006001|XXGobject_psameas_object|68|0|120|0|{metadata|log_metadata|1|0|}52|48|}
{2010211001|XXGvertex_iport_iport|69|0|121|0|{0|in|}48|53|}
{2010006001|XXGobject_psameas_object|70|0|123|0|{metadata|in_metadata|1|0|}53|48|}
{2010006001|XXGobject_psameas_object|71|0|124|0|{reject_metadata|out0_metadata|0|0|}30|42|}
{2010006001|XXGobject_psameas_object|72|0|125|0|{out_metadata|out_metadata|0|0|}24|30|}
{2010601001|XXGgraph_vertex_vertex|73|0|126|0|{Final_Filter_and_Masking|}1|54|}
{2010212001|XXGvertex_oport_oport|74|0|128|0|{0|out0|}54|55|}
{2010212001|XXGvertex_oport_oport|75|0|130|0|{1|reject0|}54|56|}
{2010212001|XXGvertex_oport_oport|76|0|132|0|{2|error0|}54|57|}
{2010212001|XXGvertex_oport_oport|77|0|134|0|{3|log|}54|58|}
{2010211001|XXGvertex_iport_iport|78|0|136|0|{0|in|}54|59|}
{2010214001|XXGiport_src_flow|79|0|138|0|{0|}59|20|}
{2010214001|XXGiport_src_flow|80|0|139|0|{1|}59|23|}
{2010007001|XXGobject_proto_object|81|0|140|0|{}54|60|}
{2010212001|XXGvertex_oport_oport|82|0|142|0|{0|out0|}60|61|}
{2010006001|XXGobject_psameas_object|83|0|144|0|{metadata|out0_metadata|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|84|0|145|0|{transform0|transform0|1|0|}61|60|}
{2010212001|XXGvertex_oport_oport|85|0|146|0|{1|reject0|}60|62|}
{2010006001|XXGobject_psameas_object|86|0|148|0|{metadata|reject0_metadata|1|0|}62|60|}
{2010212001|XXGvertex_oport_oport|87|0|149|0|{2|error0|}60|63|}
{2010006001|XXGobject_psameas_object|88|0|151|0|{metadata|error0_metadata|1|0|}63|60|}
{2010212001|XXGvertex_oport_oport|89|0|152|0|{3|log|}60|64|}
{2010006001|XXGobject_psameas_object|90|0|154|0|{metadata|log_metadata|1|0|}64|60|}
{2010211001|XXGvertex_iport_iport|91|0|155|0|{0|in|}60|65|}
{2010006001|XXGobject_psameas_object|92|0|157|0|{metadata|in_metadata|1|0|}65|60|}
{2010006001|XXGobject_psameas_object|93|0|158|0|{Layout|Layout|0|0|}54|66|}
{2010212001|XXGvertex_oport_oport|94|0|160|0|{0|out|}66|67|}
{2010213001|XXGoport_dst_flow|95|0|162|0|{0|}67|23|}
{2010212001|XXGvertex_oport_oport|96|0|163|0|{1|reject|}66|68|}
{2010212001|XXGvertex_oport_oport|97|0|165|0|{2|error|}66|69|}
{2010212001|XXGvertex_oport_oport|98|0|167|0|{3|log|}66|70|}
{2010211001|XXGvertex_iport_iport|99|0|169|0|{0|in|}66|71|}
{2010214001|XXGiport_src_flow|100|0|171|0|{0|}71|17|}
{2010007001|XXGobject_proto_object|101|0|172|0|{}66|72|}
{2010212001|XXGvertex_oport_oport|102|0|174|0|{0|out|}72|73|}
{2010006001|XXGobject_psameas_object|103|0|176|0|{metadata|out_metadata|1|0|}73|72|}
{2010212001|XXGvertex_oport_oport|104|0|177|0|{1|reject|}72|74|}
{2010006001|XXGobject_psameas_object|105|0|179|0|{metadata|reject_metadata|1|0|}74|72|}
{2010212001|XXGvertex_oport_oport|106|0|180|0|{2|error|}72|75|}
{2010006001|XXGobject_psameas_object|107|0|182|0|{metadata|error_metadata|1|0|}75|72|}
{2010212001|XXGvertex_oport_oport|108|0|183|0|{3|log|}72|76|}
{2010006001|XXGobject_psameas_object|109|0|185|0|{metadata|log_metadata|1|0|}76|72|}
{2010211001|XXGvertex_iport_iport|110|0|186|0|{0|in|}72|77|}
{2010006001|XXGobject_psameas_object|111|0|188|0|{metadata|in_metadata|1|0|}77|72|}
{2010006001|XXGobject_psameas_object|112|0|189|0|{in_metadata|out_metadata|0|0|}66|78|}
{2010212001|XXGvertex_oport_oport|113|0|191|0|{0|out|}78|79|}
{2010213001|XXGoport_dst_flow|114|0|193|0|{0|}79|17|}
{2010212001|XXGvertex_oport_oport|115|0|194|0|{1|reject|}78|80|}
{2010212001|XXGvertex_oport_oport|116|0|196|0|{2|error|}78|81|}
{2010212001|XXGvertex_oport_oport|117|0|198|0|{3|log|}78|82|}
{2010211001|XXGvertex_iport_iport|118|0|200|0|{0|in|}78|83|}
{2010214001|XXGiport_src_flow|119|0|202|0|{0|}83|21|}
{2010007001|XXGobject_proto_object|120|0|203|0|{}78|84|}
{2010212001|XXGvertex_oport_oport|121|0|205|0|{0|out|}84|85|}
{2010006001|XXGobject_psameas_object|122|0|207|0|{metadata|out_metadata|1|0|}85|84|}
{2010212001|XXGvertex_oport_oport|123|0|208|0|{1|reject|}84|86|}
{2010006001|XXGobject_psameas_object|124|0|210|0|{metadata|reject_metadata|1|0|}86|84|}
{2010212001|XXGvertex_oport_oport|125|0|211|0|{2|error|}84|87|}
{2010006001|XXGobject_psameas_object|126|0|213|0|{metadata|error_metadata|1|0|}87|84|}
{2010212001|XXGvertex_oport_oport|127|0|214|0|{3|log|}84|88|}
{2010006001|XXGobject_psameas_object|128|0|216|0|{metadata|log_metadata|1|0|}88|84|}
{2010211001|XXGvertex_iport_iport|129|0|217|0|{0|in|}84|89|}
{2010006001|XXGobject_psameas_object|130|0|219|0|{metadata|in_metadata|1|0|}89|84|}
{2010006001|XXGobject_psameas_object|131|0|220|0|{Layout|Layout|0|0|}78|66|}
{2010006001|XXGobject_psameas_object|132|0|221|0|{reject_metadata|in_metadata|0|0|}78|78|}
{2010006001|XXGobject_psameas_object|133|0|222|0|{reject_metadata|out_metadata|0|0|}66|78|}
{2010006001|XXGobject_psameas_object|134|0|223|0|{in_metadata|out_metadata|0|0|}54|66|}
{2010006001|XXGobject_psameas_object|135|0|224|0|{out0_metadata|OUTPUT_DML|1|0|}54|1|}
{2010006001|XXGobject_psameas_object|136|0|225|0|{reject0_metadata|out_metadata|0|0|}54|66|}
{2010006001|XXGobject_psameas_object|137|0|226|0|{select|FINAL_FILTER_EXPRESSION|1|0|}54|1|}
{2010006001|XXGobject_psameas_object|138|0|227|0|{transform0|security_mapping|1|0|}54|1|}
{2010601001|XXGgraph_vertex_vertex|139|0|228|0|{Generate_Days_in_Range|}1|30|}
{2010601001|XXGgraph_vertex_vertex|140|0|229|0|{ICFF_TEMPLATE_LVL1|}1|90|}
{2010007001|XXGobject_proto_object|141|0|231|0|{}90|91|}
{2010601001|XXGgraph_vertex_vertex|142|0|233|0|{Normalize_Index_SCAN_by_lookup|}1|66|}
{2010601001|XXGgraph_vertex_vertex|143|0|234|0|{Normalize_Split_index_col|}1|78|}
{2010601001|XXGgraph_vertex_vertex|144|0|235|0|{Read_Multiple_Files|}1|92|}
{2010212001|XXGvertex_oport_oport|145|0|237|0|{0|out|}92|93|}
{2010213001|XXGoport_dst_flow|146|0|239|0|{0|}93|20|}
{2010212001|XXGvertex_oport_oport|147|0|240|0|{1|filereject|}92|94|}
{2010212001|XXGvertex_oport_oport|148|0|242|0|{2|fileerror|}92|95|}
{2010212001|XXGvertex_oport_oport|149|0|244|0|{3|reject|}92|96|}
{2010212001|XXGvertex_oport_oport|150|0|246|0|{4|error|}92|97|}
{2010212001|XXGvertex_oport_oport|151|0|248|0|{5|log|}92|98|}
{2010211001|XXGvertex_iport_iport|152|0|250|0|{0|in|}92|99|}
{2010214001|XXGiport_src_flow|153|0|252|0|{0|}99|19|}
{2010007001|XXGobject_proto_object|154|0|253|0|{}92|100|}
{2010212001|XXGvertex_oport_oport|155|0|255|0|{0|out|}100|101|}
{2010006001|XXGobject_psameas_object|156|0|257|0|{metadata|out_metadata|1|0|}101|100|}
{2010212001|XXGvertex_oport_oport|157|0|258|0|{1|filereject|}100|102|}
{2010006001|XXGobject_psameas_object|158|0|260|0|{metadata|filereject_metadata|1|0|}102|100|}
{2010212001|XXGvertex_oport_oport|159|0|261|0|{2|fileerror|}100|103|}
{2010006001|XXGobject_psameas_object|160|0|263|0|{metadata|fileerror_metadata|1|0|}103|100|}
{2010212001|XXGvertex_oport_oport|161|0|264|0|{3|reject|}100|104|}
{2010006001|XXGobject_psameas_object|162|0|266|0|{metadata|reject_metadata|1|0|}104|100|}
{2010212001|XXGvertex_oport_oport|163|0|267|0|{4|error|}100|105|}
{2010006001|XXGobject_psameas_object|164|0|269|0|{metadata|error_metadata|1|0|}105|100|}
{2010212001|XXGvertex_oport_oport|165|0|270|0|{5|log|}100|106|}
{2010006001|XXGobject_psameas_object|166|0|272|0|{metadata|log_metadata|1|0|}106|100|}
{2010211001|XXGvertex_iport_iport|167|0|273|0|{0|in|}100|107|}
{2010006001|XXGobject_psameas_object|168|0|275|0|{metadata|in_metadata|1|0|}107|100|}
{2010006001|XXGobject_psameas_object|169|0|276|0|{filereject_metadata|out_metadata|0|0|}92|30|}
{2010006001|XXGobject_psameas_object|170|0|277|0|{in_metadata|out_metadata|0|0|}92|30|}
{2010006001|XXGobject_psameas_object|171|0|278|0|{out_metadata|DATA_SOURCE_AND_PLUMBING_FIELDS_DML|1|0|}92|1|}
{2010601001|XXGgraph_vertex_vertex|172|0|279|0|{Reformat_Query|}1|42|}
{2010601001|XXGgraph_vertex_vertex|173|0|280|0|{Router_Index_or_seq|}1|108|}
{2010212001|XXGvertex_oport_oport|174|0|282|0|{0|out0|}108|109|}
{2010213001|XXGoport_dst_flow|175|0|284|0|{0|}109|19|}
{2010212001|XXGvertex_oport_oport|176|0|285|0|{1|out1|}108|110|}
{2010213001|XXGoport_dst_flow|177|0|287|0|{0|}110|21|}
{2010212001|XXGvertex_oport_oport|178|0|288|0|{2|reject0|}108|111|}
{2010212001|XXGvertex_oport_oport|179|0|290|0|{3|reject1|}108|112|}
{2010212001|XXGvertex_oport_oport|180|0|292|0|{4|error0|}108|113|}
{2010212001|XXGvertex_oport_oport|181|0|294|0|{5|error1|}108|114|}
{2010212001|XXGvertex_oport_oport|182|0|296|0|{6|log|}108|115|}
{2010211001|XXGvertex_iport_iport|183|0|298|0|{0|in|}108|116|}
{2010214001|XXGiport_src_flow|184|0|300|0|{0|}116|15|}
{2010007001|XXGobject_proto_object|185|0|301|0|{}108|117|}
{2010212001|XXGvertex_oport_oport|186|0|303|0|{0|out0|}117|118|}
{2010006001|XXGobject_psameas_object|187|0|305|0|{metadata|out0_metadata|1|0|}118|117|}
{2010006001|XXGobject_psameas_object|188|0|306|0|{transform0|transform0|1|0|}118|117|}
{2010212001|XXGvertex_oport_oport|189|0|307|0|{1|out1|}117|119|}
{2010006001|XXGobject_psameas_object|190|0|309|0|{metadata|out1_metadata|1|0|}119|117|}
{2010006001|XXGobject_psameas_object|191|0|310|0|{transform1|transform1|1|0|}119|117|}
{2010212001|XXGvertex_oport_oport|192|0|311|0|{2|reject0|}117|120|}
{2010006001|XXGobject_psameas_object|193|0|313|0|{metadata|reject0_metadata|1|0|}120|117|}
{2010212001|XXGvertex_oport_oport|194|0|314|0|{3|reject1|}117|121|}
{2010006001|XXGobject_psameas_object|195|0|316|0|{metadata|reject1_metadata|1|0|}121|117|}
{2010212001|XXGvertex_oport_oport|196|0|317|0|{4|error0|}117|122|}
{2010006001|XXGobject_psameas_object|197|0|319|0|{metadata|error0_metadata|1|0|}122|117|}
{2010212001|XXGvertex_oport_oport|198|0|320|0|{5|error1|}117|123|}
{2010006001|XXGobject_psameas_object|199|0|322|0|{metadata|error1_metadata|1|0|}123|117|}
{2010212001|XXGvertex_oport_oport|200|0|323|0|{6|log|}117|124|}
{2010006001|XXGobject_psameas_object|201|0|325|0|{metadata|log_metadata|1|0|}124|117|}
{2010211001|XXGvertex_iport_iport|202|0|326|0|{0|in|}117|125|}
{2010006001|XXGobject_psameas_object|203|0|328|0|{metadata|in_metadata|1|0|}125|117|}
{2010006001|XXGobject_psameas_object|204|0|329|0|{Layout|Layout|0|0|}108|92|}
{2010006001|XXGobject_psameas_object|205|0|330|0|{in_metadata|out_metadata|0|0|}108|30|}
{2010006001|XXGobject_psameas_object|206|0|331|0|{out0_metadata|out_metadata|0|0|}108|30|}
{2010006001|XXGobject_psameas_object|207|0|332|0|{out1_metadata|in_metadata|0|0|}108|78|}
{2010006001|XXGobject_psameas_object|208|0|333|0|{reject0_metadata|out_metadata|0|0|}108|30|}
{2010006001|XXGobject_psameas_object|209|0|334|0|{reject1_metadata|out_metadata|0|0|}108|30|}
{2010212001|XXGvertex_oport_oport|210|0|335|0|{0|out|}1|126|}
{2010216002|XXGoport_binding_oport|211|0|337|0|{.5|.5|{12|1358000|239000|1378000|239000|1443000|239000|1443000|229000|1509000|229000|1529000|229000|}2300|}126|55|}
{2010211001|XXGvertex_iport_iport|212|0|338|0|{0|in|}1|127|}
{2010215002|XXGiport_binding_iport|213|0|340|0|{.5|.5|{12|84000|229000|64000|229000|52000|229000|52000|234000|40000|234000|20000|234000|}2299|}127|47|}
{2010109001|XXGobject_property_value|214|0|341|0|{0|TrackingThumbprint|72|}1|128|}
