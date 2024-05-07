@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|24|rel_count|37|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|True|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|_propagation|@3|1|HKl|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!_ab_implements|$[[vector _interp_("$\{PUB_DXF_COMPONENTS\}/defaulting.mgi", "pdl")]]|3|9|P|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|SOURCE_TABLE_NK_FIELDS||3|9|FK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|defaulting_string_values|rjadha14|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1074000|675000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{1|1|}@|||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Implementation:
>> The pub_dxf parameter SOURCE_TABLE_NK_FIELDS retreives the NK fields 
from AI_META/default_null_to_dash.meta
>> The reformat component uses above paramter and checks fields is of string
type.
>> If field is tring type then check for NULL and blank value if TRUE applies default
value as '-' else passes as it is.
>> This will get disables if entry is not present in meta file.|18000|431000|0|0|0|0|39|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|16711680|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@This subgraph implements defaulting the string fields which are NK from source table
This is to be applied only to records from a particular list of sources.

|17000|104000|0|0|0|0|40|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|100|0|}}
{2010501005|XXGpvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in)=
begin
  //let string("")[int] src_tbl_nk_cols = string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",",");
  
  
  out.(*, form  == 'string' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :1: if(string_lrtrim(in.*) == "" ) "-" ;
  out.(*, form  == 'string' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :2: first_defined(in.*,"-");
  out.(*, form  == 'decimal' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :3: if(decimal_strip(in.*) == 0) 0 ;
  out.(*, form  == 'decimal' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :4: first_defined(in.*,0);
  out.(*, form  == 'int' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :5: first_defined(in.*,0);
  out.(*, form  == 'date' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :6: if(string_lrtrim(in.*) == "" ) (date("YYYYMMDD")) "19000101"  ;
  out.(*, form  == 'date' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :7: first_defined(in.*,(date("YYYYMMDD"))"19000101");
  out.(*, form  == 'datetime' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :8: if(string_lrtrim(in.*) == "" ) (datetime("YYYYMMDDHH24MISS")) "19000101000000"  ;
  out.(*, form  == 'datetime' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :9: first_defined(in.*,(datetime("YYYYMMDD HH24:MI:SS"))"19000101 00:00:00");
  out.(*, form  == 'time' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :10: if(string_lrtrim(in.*) == "" ) (datetime("HH24:MI:SS"))"00:00:00"  ;
  out.(*, form  == 'time' and name  member string_split_no_empty($"SOURCE_TABLE_NK_FIELDS",","))  :11: first_defined(in.*,(datetime("HH24:MI:SS"))"00:00:00");
 
  out.* :12: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|442000|284500|0|0|0|0|41|Defaulting NK Fields of String Type|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|10|0|19|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|11|0|21|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|12|0|23|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|13|0|25|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|14|0|27|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|15|0|29|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout||9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|16|0|31|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|17|0|35|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|18|0|38|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|19|0|41|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|20|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|21|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|.5037037037037037|@@@14736|0|}}
{2010202004|XXGiport|22|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|.5051851851851852|@@@14224|0|}}
{2010110002|XXGconstant|23|0|59|0|{@{}@{1|1903781|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{Defaulting_NK_Fields_of_String_Type|}1|9|}
{2010212001|XXGvertex_oport_oport|9|0|18|0|{0|out0|}9|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{1|reject0|}9|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{2|error0|}9|12|}
{2010212001|XXGvertex_oport_oport|12|0|24|0|{3|log|}9|13|}
{2010211001|XXGvertex_iport_iport|13|0|26|0|{0|in|}9|14|}
{2010007001|XXGobject_proto_object|14|0|28|0|{}9|15|}
{2010212001|XXGvertex_oport_oport|15|0|30|0|{0|out0|}15|16|}
{2010006001|XXGobject_psameas_object|16|0|32|0|{metadata|out0_metadata|1|0|}16|15|}
{2010006001|XXGobject_psameas_object|17|0|33|0|{transform0|transform0|1|0|}16|15|}
{2010212001|XXGvertex_oport_oport|18|0|34|0|{1|reject0|}15|17|}
{2010006001|XXGobject_psameas_object|19|0|36|0|{metadata|reject0_metadata|1|0|}17|15|}
{2010212001|XXGvertex_oport_oport|20|0|37|0|{2|error0|}15|18|}
{2010006001|XXGobject_psameas_object|21|0|39|0|{metadata|error0_metadata|1|0|}18|15|}
{2010212001|XXGvertex_oport_oport|22|0|40|0|{3|log|}15|19|}
{2010006001|XXGobject_psameas_object|23|0|42|0|{metadata|log_metadata|1|0|}19|15|}
{2010211001|XXGvertex_iport_iport|24|0|43|0|{0|in|}15|20|}
{2010006001|XXGobject_psameas_object|25|0|45|0|{metadata|in_metadata|1|0|}20|15|}
{2010006001|XXGobject_psameas_object|26|0|46|0|{Layout|Layout|0|0|}9|1|}
{2010006001|XXGobject_psameas_object|27|0|47|0|{in_metadata|out0_metadata|0|0|}9|1|}
{2010006001|XXGobject_psameas_object|28|0|48|0|{out0_metadata|out0_metadata|0|0|}9|1|}
{2010006001|XXGobject_psameas_object|29|0|49|0|{reject0_metadata|out0_metadata|0|0|}9|1|}
{2010212001|XXGvertex_oport_oport|30|0|50|0|{0|out0|}1|21|}
{2010216002|XXGoport_binding_oport|31|0|52|0|{.5|.5|{0|}2|}21|10|}
{2010006001|XXGobject_psameas_object|32|0|53|0|{metadata|out0_metadata|1|0|}21|1|}
{2010211001|XXGvertex_iport_iport|33|0|54|0|{0|in0|}1|22|}
{2010215002|XXGiport_binding_iport|34|0|56|0|{.5|.5|{0|}1|}22|14|}
{2010006001|XXGobject_psameas_object|35|0|57|0|{metadata|in0_metadata|1|0|}22|1|}
{2010109001|XXGobject_property_value|36|0|58|0|{0|TrackingThumbprint|72|}1|23|}
