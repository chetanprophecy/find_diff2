@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|29|rel_count|45|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|False|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|BLOCKED_SKS_VEC|$[
  if(ENABLE_OUTBOUND_SUPPRESSION)
  begin
    let lines = string_split_no_empty(DATA_SUPPRESSION_KEYS_OUTBOUND, "\\n");
    let string("")[] sks_vec = [vector];
    for(let line in lines)
    begin
      let pieces = string_split(line, "\|");
      if(pieces[0] == "sks")
        sks_vec = string_split_no_empty(pieces[1], ",");
    end
    result :: (long[])(decimal("")[])sks_vec;
  end
  else
    [vector]
]|3|9|RK|Vector containing src_env_sk values whose data should be filtered out. We look for the SKs key ("sks") in the pub_dxf level parameter DATA_SUPPRESSION_KEYS_OUTBOUND, and get the list of SKs from there|{0|}}
{30001002|XXparameter|AB_DML_DEFS|/*
  This function builds the filter expression based on information extracted from
  pub_dxf level parameter DATA_SUPPRESSION_KEYS_OUTBOUND.

  One of the keys (sks) is supposed to be applied on either 'dxf_src_sys_id' or 
  'src_env_sk', and for this reason we need the DML of the input data to be
  passed to this function.

  If the filter expression can not be constructed for any reason, the default
  return value is "1", which will pass all data through. However, in order to
  save CPU time, it is recommended to disable the filter component in case the
  returned expression is "1".
*/

out :: build_filter_expr(dml, blocked_sks, exp_lkp_contents) =
begin
  let field_names = record_info_item(dml, "name"); 
  out :: if(("dxf_src_sys_id" member field_names) and (is_blank(exp_lkp_contents)))
                "in.dxf_src_sys_id not member " + string_representation(blocked_sks)
            else if (("dxf_src_sys_id" member field_names) and (!is_blank(exp_lkp_contents)))
                "in.dxf_src_sys_id not member " + string_representation(blocked_sks) + " and " + exp_lkp_contents
            else if(("src_env_sk" member field_names) and (is_blank(exp_lkp_contents)))
                "in.src_env_sk not member " + string_representation(blocked_sks)
            else if(("src_env_sk" member field_names) and (!is_blank(exp_lkp_contents)))
                "in.src_env_sk not member " + string_representation(blocked_sks) + " and " + exp_lkp_contents     
            else if(!is_blank(exp_lkp_contents))
                exp_lkp_contents
            else if(is_blank(exp_lkp_contents))
                "1";
end|3|9|K|@{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!_ab_implements|$[[vector _interp_("$\{PUB_DXF_COMPONENTS\}/data_suppression.outbound.mgi", "pdl")]]|3|9|P|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|data_suppression.outbound|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1299000|600000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}@|||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrd02143 - RHEL 7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@This subgraph implements the data suppression filter
for outbound data, which is a global setting applied to
all distribution objects.

This filter should be applied to jobs that reads from
IDS or IDS events so that the unwanted/restricted data
can be dropped as early as possible.|27000|59000|0|0|0|0|36|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Implementation:
>> The graph relies on parameters defined at pub_dxf level in order
to build the filter expression(s)
>> The parameter DATA_SUPPRESSION_KEYS_OUTBOUND
contains key-value pairs
>> In the first iteration, we have only used one key - sks - which
represents the list of src_env_sk values that should be filtered
out. In future, if data is to be additionally filtered on a list of
another property's values, we will defined another key for it
>> Deselect port is required, because making it optional was
causing issues with port propagation. Possibly an Ab Initio bug|28000|371000|0|0|0|0|37|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|16711680|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@FBE disabled if ENABLE_OUTBOUND_SUPPRESSION is set
to False, or if the resolved filter expression is "1"|488000|370000|0|0|0|0|32|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010501005|XXGpvertex|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|use_package|True|3|1|l|@{0|}}
{30001002|XXparameter|package|select_out::select(in)=
begin
  select_out :: $[build_filter_expr(out0_metadata, BLOCKED_SKS_VEC,EXPRESSION_LOOKUP_CONTENTS)];
end;|3|9||@{0|}}
{30001002|XXparameter|condition|$[ENABLE_OUTBOUND_SUPPRESSION && build_filter_expr(out0_metadata, BLOCKED_SKS_VEC,EXPRESSION_LOOKUP_CONTENTS) != "1"]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|489000|221000|0|0|0|0|41|Apply Global Outbound Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|12|0|23|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|13|0|25|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|14|0|27|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|15|0|29|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|16|0|31|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|17|0|33|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|18|0|35|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
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
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout||9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|19|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|20|0|40|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|21|0|43|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|24|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|25|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|.24210526315789474|@@@14736|0|}}
{2010203004|XXGoport|26|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|.7298245614035088|@@@14736|0|}}
{2010202004|XXGiport|27|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|.4982456140350877|@@@14224|0|}}
{2010110002|XXGconstant|28|0|72|0|{@{}@{1|6866139|}}}
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
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{Apply_Global_Outbound_Filter|}1|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{0|out|}11|12|}
{2010212001|XXGvertex_oport_oport|12|0|24|0|{1|deselect|}11|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{2|reject|}11|14|}
{2010212001|XXGvertex_oport_oport|14|0|28|0|{3|error|}11|15|}
{2010212001|XXGvertex_oport_oport|15|0|30|0|{4|log|}11|16|}
{2010211001|XXGvertex_iport_iport|16|0|32|0|{0|in|}11|17|}
{2010007001|XXGobject_proto_object|17|0|34|0|{}11|18|}
{2010212001|XXGvertex_oport_oport|18|0|36|0|{0|out|}18|19|}
{2010006001|XXGobject_psameas_object|19|0|38|0|{metadata|out_metadata|1|0|}19|18|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{1|deselect|}18|20|}
{2010006001|XXGobject_psameas_object|21|0|41|0|{metadata|deselect_metadata|1|0|}20|18|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{2|reject|}18|21|}
{2010006001|XXGobject_psameas_object|23|0|44|0|{metadata|reject_metadata|1|0|}21|18|}
{2010212001|XXGvertex_oport_oport|24|0|45|0|{3|error|}18|22|}
{2010006001|XXGobject_psameas_object|25|0|47|0|{metadata|error_metadata|1|0|}22|18|}
{2010212001|XXGvertex_oport_oport|26|0|48|0|{4|log|}18|23|}
{2010006001|XXGobject_psameas_object|27|0|50|0|{metadata|log_metadata|1|0|}23|18|}
{2010211001|XXGvertex_iport_iport|28|0|51|0|{0|in|}18|24|}
{2010006001|XXGobject_psameas_object|29|0|53|0|{metadata|in_metadata|1|0|}24|18|}
{2010006001|XXGobject_psameas_object|30|0|54|0|{Layout|Layout|0|0|}11|1|}
{2010006001|XXGobject_psameas_object|31|0|55|0|{deselect_metadata|out0_metadata|0|0|}11|1|}
{2010006001|XXGobject_psameas_object|32|0|56|0|{in_metadata|out0_metadata|0|0|}11|1|}
{2010006001|XXGobject_psameas_object|33|0|57|0|{out_metadata|out0_metadata|0|0|}11|1|}
{2010006001|XXGobject_psameas_object|34|0|58|0|{reject_metadata|out0_metadata|0|0|}11|1|}
{2010212001|XXGvertex_oport_oport|35|0|59|0|{0|out0|}1|25|}
{2010216002|XXGoport_binding_oport|36|0|61|0|{.5|.5|{0|}39|}25|12|}
{2010006001|XXGobject_psameas_object|37|0|62|0|{metadata|out0_metadata|1|0|}25|1|}
{2010212001|XXGvertex_oport_oport|38|0|63|0|{1|deselect|}1|26|}
{2010216002|XXGoport_binding_oport|39|0|65|0|{.5|.5|{0|}40|}26|13|}
{2010006001|XXGobject_psameas_object|40|0|66|0|{metadata|deselect_metadata|1|0|}26|1|}
{2010211001|XXGvertex_iport_iport|41|0|67|0|{0|in0|}1|27|}
{2010215002|XXGiport_binding_iport|42|0|69|0|{.5|.5|{0|}38|}27|17|}
{2010006001|XXGobject_psameas_object|43|0|70|0|{metadata|in0_metadata|1|0|}27|1|}
{2010109001|XXGobject_property_value|44|0|71|0|{0|TrackingThumbprint|72|}1|28|}
