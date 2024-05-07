@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|54|rel_count|68|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|DIM_INFO||3|9|RFK|@{0|}}
{30001002|XXparameter|RUN_ID|$[RUN_ID]|3|9|RFK|@{0|}}
{30001002|XXparameter|ILM_NAME|$[ILM_NAME]|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_LOOKUP_TYPE_DML|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|7|9|RK|@{0|}}
{30001002|XXparameter|OUT_DML|/*
This DML is the output DML of Reformat component. It contians the two fields,
dimension and target which are used to determine the name of the palceholder
file in the WMF compoenent. Additionally it contains the split type 2 header
fields, dxf header fields, IDS audit fields and dxf hk and sk fields. Also, 
it contains the field target_fields_line, which holds the data to be stored 
'\\x01' delimited target fields.
*/

$[join_types('record\\n  string("") dimension /*Name of the dimension to which the hash_key in the above field will correspond.*/;\\n  string("") target /*Name of the target from which the non-matching record has been produced.*/;\\nend',
        join_types(
               join_types(read_type(PUB_DXF_DML + "/split_header.type2.dml"), 
                                join_types(read_type(PUB_DXF_DML + "/dxf_header.dml"), 
                        XREF_LOOKUP_TYPE_DML)
                ), 
        'record\\n  string("\\\\n") target_fields_line;\\nend')
)]|7|9|RK|@{0|}}
{30001002|XXparameter|IGNORE_FIELDS_VEC|$[ record_info_item(
                 join_types(
                   read_type(PUB_DXF_DML + "/split_header.type2.dml"),
                   join_types(
                     join_types(read_type(PUB_DXF_DML + "/dxf_header.dml"), XREF_LOOKUP_TYPE_DML), 
                     'record\\n  string(1) newline = "\\\\n";end'
                   )
                 ),
                "name")
]|3|9|RK|@{0|}}
{30001002|XXparameter|RFMT_XFR|$[
begin

let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
let string("")[int] fields_to_ignore = IGNORE_FIELDS_VEC;
rfmt_xfr = add_local(rfmt_xfr, "dim_info_vec", 'string("")[int]', 'string_split_no_empty("'+ DIM_INFO +'", "\\r\\n")', comment = "A string vector to hold the information contained in the DIM_INFO parameter."); 

rfmt_xfr = add_local(rfmt_xfr, "dim_info_rec_vec", '  record\\n    string("\|") target;\\n    string("\|") target_field_names;\\n  end[int]', 'for ( let string("") line in dim_info_vec) : reinterpret_as(record string("\|") target; string("\|") target_field_names; end, line)', comment = "A vector to hold the value of DIM_INFO parameter interpreted by a user defined type."); 

rfmt_xfr = add_local(rfmt_xfr, "record_to_add", 'string("")', "\\"\\"", comment = "A variable to hold the record linwhich will be used to populate the field target_fields_line."); 
rfmt_xfr = add_local(rfmt_xfr, "fields_to_ignore", 'string("")[int]', "string_split_no_empty('" + string_join(IGNORE_FIELDS_VEC, "\|") + "', '\|')", comment = "A list of fields to be ignored while creating the target fields line. This includes integer fields which are receivied as is from the input non matching dml."); 
rfmt_xfr = add_local(rfmt_xfr, "index", 'decimal("")', '0', comment = "A variable to hold the index of the vector dim_info_rec_vec, at which the details of the input dimension record has been found."); 

rfmt_xfr = add_local(rfmt_xfr, "dimension_field_name_info_vec", 'dml_field_item_info_vec', 'string_split(dim_info_rec_vec[vector_search(dim_info_rec_vec, [record target in.dimension target_field_names "" target_field_typenames ""], \{target\})].target_field_names, ";")', comment = "A vector to hold the fields of the dimesntion for which the current input record is being processed."); 

rfmt_xfr = add_statement(rfmt_xfr, 'for(let string("") field in dimension_field_name_info_vec) 
begin
                        index = vector_search(in.out_fields, [record field_name field field_value ""], \{field_name\});
                        
                        if(field not member fields_to_ignore && index != -1) 
                                record_to_add = string_concat(record_to_add, in.out_fields[index].field_value, "\\\\x01") ;
                                                
end', comment = "A statement to append values of target fields to the record line.");

rfmt_xfr = add_rule(rfmt_xfr, "out.dimension", "in.dimension");
rfmt_xfr = add_rule(rfmt_xfr, "out.target", "in.target");
rfmt_xfr = add_rule(rfmt_xfr, "out.dxf_hk_part1", "in.fsk_hk.dxf_hk_part1");
rfmt_xfr = add_rule(rfmt_xfr, "out.dxf_hk_part2", "in.fsk_hk.dxf_hk_part2");
rfmt_xfr = add_rule(rfmt_xfr, "out.dxf_sk", "0");
rfmt_xfr = add_rule(rfmt_xfr, "out.target_fields_line", "record_to_add");
rfmt_xfr = add_rule(rfmt_xfr, "out.*", "in.*");

result :: rfmt_xfr;
end
]|8|9|RK|@{0|}}
{30001002|XXparameter|WMF_XFR|$[
begin
let string("") op_type = "/*The below output_type has been defined using the OUT_TYPE parameter, after
the removal of the two fields, dimension and target.*/
type output_type = " + remove_fields(OUT_DML, [vector "dimension", "target"]) + ";";
let string("") get_filename_xfr = make_transform("get_filename", [vector make_arg("in")], [vector make_arg("filename")]);
get_filename_xfr = add_rule(get_filename_xfr, "filename", '"mfile:' + AI_MFS + '/placeholder/placeholder." + "' + ILM_NAME + '." + in.target + "." + in.dimension + ".' + RUN_ID + '.dat.gz"');
result :: op_type + "\\n" + get_filename_xfr;
end
]|8|9|RK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|create_placeholder_files|Gunit Kaur|Created 1/31/2017 9:21:28 AM|1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1159000|625000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'create_placeholder_files' Execution Status Report

Job completed successfully at Tuesday, June 28, 2016 03:38:51
Run performed by user jubayer.borbhuyan
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev-4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|128|220|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@This subgraph creates placeholder files for different dimension.|54000|45000|0|0|0|0|14160|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|220|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}7302|17|}}
{2010243001|XXGwatcher|8|0|15|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|$RFMT_XFR|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$OUT_DML|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|93000|240000|0|0|0|0|14163|RFMT: Construct record for inserting in dimension|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|10|0|19|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|11|0|22|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|12|0|24|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|13|0|26|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|14|0|28|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|15|0|30|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|16|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|17|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|18|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|19|0|42|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|20|0|45|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|21|0|48|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@75000|105000|0|0|0|0|14165|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|692000|349000|3|}}
{2010240003|XXGlegend|22|0|50|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|23|0|52|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|24|0|54|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|25|0|56|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|26|0|58|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|27|0|60|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|28|0|62|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|29|0|64|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|30|0|66|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|31|0|68|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|32|0|70|0|{@{}@May 19 2016|82000|268000|0|0|0|0|1486|}}
{2010242002|XXGface|33|0|72|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|34|0|74|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|35|0|76|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|36|0|78|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1514|}}
{2010242002|XXGface|37|0|80|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|38|0|82|0|{@{}@Summary:

This subgraph creates placeholder files for different dimension.|15000|42500|0|0|0|0|1523|}}
{2010242002|XXGface|39|0|84|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|40|0|86|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|105000|0|0|0|0|1522|}}
{2010242002|XXGface|41|0|88|0|{@{}@Candara|0|100|0|}}
{2010501005|XXGpvertex|42|0|90|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|$WMF_XFR|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Write Multiple Files|516000|261000|0|0|0|0|14164|WMF: Write dimension placeholder files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|43|0|92|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|44|0|94|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|45|0|96|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|46|0|98|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|47|0|101|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|config_file||28|2|FK$|The configuration file for the multiplexer.|{0|}}
{30001002|XXparameter|config_file.display_name|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.keyword|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.condition|version 4.0.1.r5.0.0:|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file, prefix with file: or hdfs:|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|write_stripped|Do not strip; retain length prefix or delimiter|15|1|Fl|Controls whether any size prefix or delimiter is removed from records before they are written to the file|{2|Do not strip; retain length prefix or delimiter|Strip length prefix or delimiter|}}
{30001002|XXparameter|write_stripped.display_name|write-stripped|3|9|P|@{0|}}
{30001002|XXparameter|write_stripped.condition|version 2.14.9:|3|15|P?|@{0|}}
{30001002|XXparameter|write_raw_data|value write-stripped Do* 0 value write-stripped Strip* 1 default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|permissions|660|3|2|FK$|unix-style numeric permissions mask for newly created files|{0|}}
{30001002|XXparameter|file_limits|Files (Limited by number of output files)|15|1|Fl|Limits the number of files that can be open simultaneously|{3|None (No limits on resource usage)|Memory (Limited by total memory usage)|Files (Limited by number of output files)|}}
{30001002|XXparameter|file_limits.display_name|file-limits|3|9|P|@{0|}}
{30001002|XXparameter|max_core|13107200|1|2|FK$|Maximum memory usage (for file output buffers) in bytes. This corresponds to 100 open files|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param file-limits Memory*|3|15|P?|@{0|}}
{30001002|XXparameter|max_files|100|1|2|FK$|Maximum number of simultaneously open files|{0|}}
{30001002|XXparameter|max_files.display_name|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.keyword|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.condition|param file-limits Files*|3|15|P?|@{0|}}
{30001002|XXparameter|create_directories|False|13|1|FKl|If True, create any parent directories as necessary|{0|}}
{30001002|XXparameter|create_directories.display_name|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.keyword|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|atomic|False|13|1|FKl|If True, file is spooled to temporary, and then renamed atomically|{0|}}
{30001002|XXparameter|atomic.condition|param overwrite True version 3.1.3.r16.0:|3|15|P?|@{0|}}
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
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|48|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|52|0|117|0|{@{}@0|0|0|0|in0|.6624|@@@13840|0|}}
{2010110002|XXGconstant|53|0|120|0|{@{}@{1|4353531|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010244001|XXGflow_watcher_watcher|7|0|14|0|{}7|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{RFMT_Construct_record_for_inserting_in_dimension|}1|9|}
{2010212001|XXGvertex_oport_oport|9|0|18|0|{0|out0|}9|10|}
{2010213001|XXGoport_dst_flow|10|0|20|0|{0|}10|7|}
{2010212001|XXGvertex_oport_oport|11|0|21|0|{1|reject0|}9|11|}
{2010212001|XXGvertex_oport_oport|12|0|23|0|{2|error0|}9|12|}
{2010212001|XXGvertex_oport_oport|13|0|25|0|{3|log|}9|13|}
{2010211001|XXGvertex_iport_iport|14|0|27|0|{0|in|}9|14|}
{2010007001|XXGobject_proto_object|15|0|29|0|{}9|15|}
{2010212001|XXGvertex_oport_oport|16|0|31|0|{0|out0|}15|16|}
{2010006001|XXGobject_psameas_object|17|0|33|0|{metadata|out0_metadata|1|0|}16|15|}
{2010006001|XXGobject_psameas_object|18|0|34|0|{transform0|transform0|1|0|}16|15|}
{2010212001|XXGvertex_oport_oport|19|0|35|0|{1|reject0|}15|17|}
{2010006001|XXGobject_psameas_object|20|0|37|0|{metadata|reject0_metadata|1|0|}17|15|}
{2010212001|XXGvertex_oport_oport|21|0|38|0|{2|error0|}15|18|}
{2010006001|XXGobject_psameas_object|22|0|40|0|{metadata|error0_metadata|1|0|}18|15|}
{2010212001|XXGvertex_oport_oport|23|0|41|0|{3|log|}15|19|}
{2010006001|XXGobject_psameas_object|24|0|43|0|{metadata|log_metadata|1|0|}19|15|}
{2010211001|XXGvertex_iport_iport|25|0|44|0|{0|in|}15|20|}
{2010006001|XXGobject_psameas_object|26|0|46|0|{metadata|in_metadata|1|0|}20|15|}
{2010601001|XXGgraph_vertex_vertex|27|0|47|0|{Version_Log|}1|21|}
{2010605001|XXGgraph_legend_legend|28|0|49|0|{0|}21|22|}
{2010241001|XXGlegend_face_face|29|0|51|0|{}22|23|}
{2010605001|XXGgraph_legend_legend|30|0|53|0|{1|}21|24|}
{2010241001|XXGlegend_face_face|31|0|55|0|{}24|25|}
{2010605001|XXGgraph_legend_legend|32|0|57|0|{2|}21|26|}
{2010241001|XXGlegend_face_face|33|0|59|0|{}26|27|}
{2010605001|XXGgraph_legend_legend|34|0|61|0|{3|}21|28|}
{2010241001|XXGlegend_face_face|35|0|63|0|{}28|29|}
{2010605001|XXGgraph_legend_legend|36|0|65|0|{4|}21|30|}
{2010241001|XXGlegend_face_face|37|0|67|0|{}30|31|}
{2010605001|XXGgraph_legend_legend|38|0|69|0|{5|}21|32|}
{2010241001|XXGlegend_face_face|39|0|71|0|{}32|33|}
{2010605001|XXGgraph_legend_legend|40|0|73|0|{6|}21|34|}
{2010241001|XXGlegend_face_face|41|0|75|0|{}34|35|}
{2010605001|XXGgraph_legend_legend|42|0|77|0|{7|}21|36|}
{2010241001|XXGlegend_face_face|43|0|79|0|{}36|37|}
{2010605001|XXGgraph_legend_legend|44|0|81|0|{8|}21|38|}
{2010241001|XXGlegend_face_face|45|0|83|0|{}38|39|}
{2010605001|XXGgraph_legend_legend|46|0|85|0|{9|}21|40|}
{2010241001|XXGlegend_face_face|47|0|87|0|{}40|41|}
{2010601001|XXGgraph_vertex_vertex|48|0|89|0|{WMF_Write_dimension_placeholder_files|}1|42|}
{2010212001|XXGvertex_oport_oport|49|0|91|0|{0|reject|}42|43|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{1|error|}42|44|}
{2010212001|XXGvertex_oport_oport|51|0|95|0|{2|log|}42|45|}
{2010211001|XXGvertex_iport_iport|52|0|97|0|{0|in|}42|46|}
{2010214001|XXGiport_src_flow|53|0|99|0|{0|}46|7|}
{2010007001|XXGobject_proto_object|54|0|100|0|{}42|47|}
{2010212001|XXGvertex_oport_oport|55|0|102|0|{0|reject|}47|48|}
{2010006001|XXGobject_psameas_object|56|0|104|0|{metadata|reject_metadata|1|0|}48|47|}
{2010212001|XXGvertex_oport_oport|57|0|105|0|{1|error|}47|49|}
{2010006001|XXGobject_psameas_object|58|0|107|0|{metadata|error_metadata|1|0|}49|47|}
{2010212001|XXGvertex_oport_oport|59|0|108|0|{2|log|}47|50|}
{2010006001|XXGobject_psameas_object|60|0|110|0|{metadata|log_metadata|1|0|}50|47|}
{2010211001|XXGvertex_iport_iport|61|0|111|0|{0|in|}47|51|}
{2010006001|XXGobject_psameas_object|62|0|113|0|{metadata|in_metadata|1|0|}51|47|}
{2010006001|XXGobject_psameas_object|63|0|114|0|{in_metadata|out0_metadata|0|0|}42|9|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{reject_metadata|out0_metadata|0|0|}42|9|}
{2010211001|XXGvertex_iport_iport|65|0|116|0|{0|in0|}1|52|}
{2010215002|XXGiport_binding_iport|66|0|118|0|{.5|.5|{0|}14161|}52|14|}
{2010109001|XXGobject_property_value|67|0|119|0|{0|TrackingThumbprint|72|}1|53|}
