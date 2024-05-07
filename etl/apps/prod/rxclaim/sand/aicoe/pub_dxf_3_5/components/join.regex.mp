@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|79|rel_count|117|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|NON_DRIVER_LOOKUP_FILE||18|9|RFK|@{0|}}
{30001002|XXparameter|NON_DRIVER_LKP_KEY||19|9|RF|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|NON_DRIVER_LKP_REGEX_KEY|$[make_key(for(let key in key_info(NON_DRIVER_LKP_KEY)) key.modifiers = if(vector_search(key.modifiers, "regex") == -1) vector_append(key.modifiers, "regex") else key.modifiers;  : key)]|19|9|RK|@{0|}}
{30001002|XXparameter|OVERRIDE_LKP_KEY|$NON_DRIVER_LKP_KEY|19|9|FK|@{0|}}
{30001002|XXparameter|NON_DRIVER_OUTPUT_DML||7|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_DML|@7|9|RFK|@{0|}}
{30001002|XXparameter|NON_DRIVER_OUTPUT_DML_MODIFIED|$[
begin
let key_fields = for(let key in key_info(NON_DRIVER_LKP_KEY)) : key.field_name;  
result :: add_fields("record\\nend", for(let field in record_info(NON_DRIVER_OUTPUT_DML)) field.dml_type = if(vector_search(key_fields, field.name) != -1) 'string("\\\\x01")' else field.dml_type; : field);
end
]|7|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_DML_MODIFIED|$[
begin
let key_fields = for(let key in key_info(OVERRIDE_LKP_KEY)) : key.field_name; 
let non_driver_regex_key_fields = for(let key in key_info(NON_DRIVER_LKP_REGEX_KEY)) : key.field_name; 
let out_dml = add_fields("record\\nend", for(let field in record_info(OUTPUT_DML)) field.dml_type = if(vector_search(key_fields, field.name) != -1) 'string("\\\\x01")' else field.dml_type; : field);
let dml_field_info_vec lkp_fields = [vector];

for(let field in record_info(NON_DRIVER_OUTPUT_DML)) 
if(vector_search(non_driver_regex_key_fields, field.name) != -1) begin 
field.name = "lkp_" + field.name;
lkp_fields = vector_append(lkp_fields, field);
end

out_dml = add_fields(out_dml, lkp_fields);
result :: out_dml;
end
]|7|9|RK|@{0|}}
{30001002|XXparameter|RFMT_LKP_XFR|$[
begin

let rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);

for(let key in key_info(NON_DRIVER_LKP_KEY))
  rfmt_xfr = add_rule(rfmt_xfr, "out." + key.field_name, "re_replace(in." + key.field_name + ", '[*]+', '*')");

rfmt_xfr = add_rule(rfmt_xfr, "out.*", "in.*");

result :: rfmt_xfr;

end
]|8|9|RO|Reformat transform|{0|}}
{30001002|XXparameter|NORM_XFR|$[
begin

let global = "type non_driver_t = " + NON_DRIVER_OUTPUT_DML;
let length_xfr = make_transform("length", [vector make_arg("in")], [vector make_arg("out")]);
let norm_xfr = make_transform("normalize", [vector make_arg("in"), make_arg("index")], [vector make_arg("out")]);
let output_select_xfr = make_transform("output_select", [vector make_arg("final")], [vector make_arg("out")]);
let string("")[int] out_sel_exprs = [vector];

let non_driver_regex_key_fields = for(let key in key_info(NON_DRIVER_LKP_REGEX_KEY)) : key.field_name; 
let lkp_in_fields = for(let key in key_info(OVERRIDE_LKP_KEY)) : "in." + key.field_name;

global = global + "\\n\\nlet non_driver_t lkp_record = allocate_with_defaults();";

length_xfr = add_rule(length_xfr, "out", "lookup_count('LKP: Non Driver', " + string_join(lkp_in_fields, ",") + ")");

for(let key in non_driver_regex_key_fields) 
norm_xfr = add_rule(norm_xfr, "out.lkp_" + key, "lkp_record." + key);

norm_xfr = add_statement(norm_xfr, "lkp_record = lookup_next('LKP: Non Driver');");
norm_xfr = add_rule(norm_xfr, "out.*", "in.*", 1);
norm_xfr = add_rule(norm_xfr, "out.*", "lkp_record.*", 2);

out_sel_exprs = for(let key in non_driver_regex_key_fields) : "string_like(final." + string_split(lkp_in_fields[index_of(key)], ".")[1] + ", string_replace(final.lkp_" + key + ", '*', '%'))";

output_select_xfr = add_rule(output_select_xfr, "out", string_join(out_sel_exprs, "&&"));

result :: global+ "\\n\\n" + length_xfr + "\\n" + norm_xfr + "\\n" + output_select_xfr;

end
]|8|9|RK|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|join.regex|Gunit Kaur|Created 2/1/2017 6:20:59 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|538000|481000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'join.regex' Execution Status Report

Job completed successfully at Tuesday, February 07, 2017 02:23:02
Run performed by user gkaur109
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@gkaur109||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}74|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}68|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}73|17|}}
{2010501005|XXGpvertex|8|0|15|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|123000|232000|0|0|0|0|64|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|9|0|17|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|10|0|20|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|11|0|22|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|13|0|27|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|14|0|30|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$NON_DRIVER_LOOKUP_FILE", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$NON_DRIVER_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
}}@0|@450000|226000|0|0|0|0|52|LKP: Non Driver|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|15|0|32|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|16|0|35|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|17|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|18|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
}}@1|Normalize|90000|354000|0|0|0|0|69|NORM: Get all lookup matches|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|19|0|45|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|20|0|48|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|21|0|50|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|22|0|52|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|23|0|54|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|24|0|56|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|25|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|26|0|61|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|27|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|28|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|29|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|30|0|75|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|243000|213000|0|0|0|0|75|RFMT:|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|31|0|77|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|32|0|80|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|33|0|82|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|34|0|84|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|35|0|86|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|89|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|37|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|38|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|39|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|40|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|41|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|110|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@1|Reformat|283000|377000|0|0|0|0|53|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|43|0|112|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|44|0|114|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|45|0|116|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|46|0|118|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|120|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|123|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|49|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|50|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|51|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|52|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|53|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|54|0|143|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@85000|30000|0|0|0|0|14157|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|719000|285000|3|}}
{2010240003|XXGlegend|55|0|145|0|{@{}@Date|92000|211000|0|0|0|0|1511|}}
{2010242002|XXGface|56|0|147|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|57|0|149|0|{@{}@Author|217000|211000|0|0|0|0|1529|}}
{2010242002|XXGface|58|0|151|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|59|0|153|0|{@{}@Description|417000|211000|0|0|0|0|1510|}}
{2010242002|XXGface|60|0|155|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|61|0|157|0|{@{}@Version|17000|211000|0|0|0|0|1486|}}
{2010242002|XXGface|62|0|159|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|63|0|161|0|{@{}@Initial version|412000|228000|0|0|0|0|1513|}}
{2010242002|XXGface|64|0|163|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|65|0|165|0|{@{}@Oct 10 2016|82000|228000|0|0|0|0|1531|}}
{2010242002|XXGface|66|0|167|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|67|0|169|0|{@{}@1.0|17000|228000|0|0|0|0|1485|}}
{2010242002|XXGface|68|0|171|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|69|0|173|0|{@{}@Gunit Kaur (Exusia)|187000|228000|0|0|0|0|1532|}}
{2010242002|XXGface|70|0|175|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|71|0|177|0|{@{}@Summary:

This component performs regex join between 2 inputs i.e. regular expression pattern matching is used while joining.|15000|42500|0|0|0|0|1481|}}
{2010242002|XXGface|72|0|179|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|73|0|181|0|{@{}@High Level & ETL Design conceived by:
Manav Jindal|18000|120000|0|0|0|0|1530|}}
{2010242002|XXGface|74|0|183|0|{@{}@Candara|0|100|0|}}
{2010203004|XXGoport|75|0|185|0|{@{}@0|0|0|0|out0|.6615384615384615|@@@14352|0|}}
{2010202004|XXGiport|76|0|188|0|{@{}@0|0|0|0|in1|.28205128205128205|@@@13840|0|}}
{2010202004|XXGiport|77|0|191|0|{@{}@0|0|0|0|in0|.7589743589743589|@@@13840|0|}}
{2010110002|XXGconstant|78|0|194|0|{@{}@{1|5595901|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010601001|XXGgraph_vertex_vertex|7|0|14|0|{Gather|}1|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{0|out|}8|9|}
{2010213001|XXGoport_dst_flow|9|0|18|0|{0|}9|7|}
{2010211001|XXGvertex_iport_iport|10|0|19|0|{0|in|}8|10|}
{2010007001|XXGobject_proto_object|11|0|21|0|{}8|11|}
{2010212001|XXGvertex_oport_oport|12|0|23|0|{0|out|}11|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|out_metadata|1|0|}12|11|}
{2010211001|XXGvertex_iport_iport|14|0|26|0|{0|in|}11|13|}
{2010006001|XXGobject_psameas_object|15|0|28|0|{metadata|in_metadata|1|0|}13|11|}
{2010006001|XXGobject_psameas_object|16|0|29|0|{Layout|Layout|0|0|}8|14|}
{2010211001|XXGvertex_iport_iport|17|0|31|0|{0|write|}14|15|}
{2010214001|XXGiport_src_flow|18|0|33|0|{0|}15|5|}
{2010007001|XXGobject_proto_object|19|0|34|0|{}14|16|}
{2010211001|XXGvertex_iport_iport|20|0|36|0|{0|write|}16|17|}
{2010006001|XXGobject_psameas_object|21|0|38|0|{metadata|write_metadata|1|0|}17|16|}
{2010006001|XXGobject_psameas_object|22|0|39|0|{key|NON_DRIVER_LKP_REGEX_KEY|1|0|}14|1|}
{2010006001|XXGobject_psameas_object|23|0|40|0|{write_metadata|NON_DRIVER_OUTPUT_DML_MODIFIED|1|0|}14|1|}
{2010601001|XXGgraph_vertex_vertex|24|0|41|0|{LKP_Non_Driver|}1|14|}
{2010601001|XXGgraph_vertex_vertex|25|0|42|0|{NORM_Get_all_lookup_matches|}1|18|}
{2010212001|XXGvertex_oport_oport|26|0|44|0|{0|out|}18|19|}
{2010213001|XXGoport_dst_flow|27|0|46|0|{0|}19|6|}
{2010212001|XXGvertex_oport_oport|28|0|47|0|{1|reject|}18|20|}
{2010212001|XXGvertex_oport_oport|29|0|49|0|{2|error|}18|21|}
{2010212001|XXGvertex_oport_oport|30|0|51|0|{3|log|}18|22|}
{2010211001|XXGvertex_iport_iport|31|0|53|0|{0|in|}18|23|}
{2010007001|XXGobject_proto_object|32|0|55|0|{}18|24|}
{2010212001|XXGvertex_oport_oport|33|0|57|0|{0|out|}24|25|}
{2010006001|XXGobject_psameas_object|34|0|59|0|{metadata|out_metadata|1|0|}25|24|}
{2010212001|XXGvertex_oport_oport|35|0|60|0|{1|reject|}24|26|}
{2010006001|XXGobject_psameas_object|36|0|62|0|{metadata|reject_metadata|1|0|}26|24|}
{2010212001|XXGvertex_oport_oport|37|0|63|0|{2|error|}24|27|}
{2010006001|XXGobject_psameas_object|38|0|65|0|{metadata|error_metadata|1|0|}27|24|}
{2010212001|XXGvertex_oport_oport|39|0|66|0|{3|log|}24|28|}
{2010006001|XXGobject_psameas_object|40|0|68|0|{metadata|log_metadata|1|0|}28|24|}
{2010211001|XXGvertex_iport_iport|41|0|69|0|{0|in|}24|29|}
{2010006001|XXGobject_psameas_object|42|0|71|0|{metadata|in_metadata|1|0|}29|24|}
{2010006001|XXGobject_psameas_object|43|0|72|0|{out_metadata|OUTPUT_DML_MODIFIED|1|0|}18|1|}
{2010006001|XXGobject_psameas_object|44|0|73|0|{transform|NORM_XFR|1|0|}18|1|}
{2010601001|XXGgraph_vertex_vertex|45|0|74|0|{RFMT_|}1|30|}
{2010212001|XXGvertex_oport_oport|46|0|76|0|{0|out0|}30|31|}
{2010213001|XXGoport_dst_flow|47|0|78|0|{0|}31|5|}
{2010212001|XXGvertex_oport_oport|48|0|79|0|{1|reject0|}30|32|}
{2010212001|XXGvertex_oport_oport|49|0|81|0|{2|error0|}30|33|}
{2010212001|XXGvertex_oport_oport|50|0|83|0|{3|log|}30|34|}
{2010211001|XXGvertex_iport_iport|51|0|85|0|{0|in|}30|35|}
{2010214001|XXGiport_src_flow|52|0|87|0|{0|}35|7|}
{2010007001|XXGobject_proto_object|53|0|88|0|{}30|36|}
{2010212001|XXGvertex_oport_oport|54|0|90|0|{0|out0|}36|37|}
{2010006001|XXGobject_psameas_object|55|0|92|0|{metadata|out0_metadata|1|0|}37|36|}
{2010006001|XXGobject_psameas_object|56|0|93|0|{transform0|transform0|1|0|}37|36|}
{2010212001|XXGvertex_oport_oport|57|0|94|0|{1|reject0|}36|38|}
{2010006001|XXGobject_psameas_object|58|0|96|0|{metadata|reject0_metadata|1|0|}38|36|}
{2010212001|XXGvertex_oport_oport|59|0|97|0|{2|error0|}36|39|}
{2010006001|XXGobject_psameas_object|60|0|99|0|{metadata|error0_metadata|1|0|}39|36|}
{2010212001|XXGvertex_oport_oport|61|0|100|0|{3|log|}36|40|}
{2010006001|XXGobject_psameas_object|62|0|102|0|{metadata|log_metadata|1|0|}40|36|}
{2010211001|XXGvertex_iport_iport|63|0|103|0|{0|in|}36|41|}
{2010006001|XXGobject_psameas_object|64|0|105|0|{metadata|in_metadata|1|0|}41|36|}
{2010006001|XXGobject_psameas_object|65|0|106|0|{Layout|Layout|0|0|}30|14|}
{2010006001|XXGobject_psameas_object|66|0|107|0|{out0_metadata|write_metadata|0|0|}30|14|}
{2010006001|XXGobject_psameas_object|67|0|108|0|{transform0|RFMT_LKP_XFR|1|0|}30|1|}
{2010601001|XXGgraph_vertex_vertex|68|0|109|0|{Reformat|}1|42|}
{2010212001|XXGvertex_oport_oport|69|0|111|0|{0|out0|}42|43|}
{2010212001|XXGvertex_oport_oport|70|0|113|0|{1|reject0|}42|44|}
{2010212001|XXGvertex_oport_oport|71|0|115|0|{2|error0|}42|45|}
{2010212001|XXGvertex_oport_oport|72|0|117|0|{3|log|}42|46|}
{2010211001|XXGvertex_iport_iport|73|0|119|0|{0|in|}42|47|}
{2010214001|XXGiport_src_flow|74|0|121|0|{0|}47|6|}
{2010007001|XXGobject_proto_object|75|0|122|0|{}42|48|}
{2010212001|XXGvertex_oport_oport|76|0|124|0|{0|out0|}48|49|}
{2010006001|XXGobject_psameas_object|77|0|126|0|{metadata|out0_metadata|1|0|}49|48|}
{2010006001|XXGobject_psameas_object|78|0|127|0|{transform0|transform0|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|79|0|128|0|{1|reject0|}48|50|}
{2010006001|XXGobject_psameas_object|80|0|130|0|{metadata|reject0_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|81|0|131|0|{2|error0|}48|51|}
{2010006001|XXGobject_psameas_object|82|0|133|0|{metadata|error0_metadata|1|0|}51|48|}
{2010212001|XXGvertex_oport_oport|83|0|134|0|{3|log|}48|52|}
{2010006001|XXGobject_psameas_object|84|0|136|0|{metadata|log_metadata|1|0|}52|48|}
{2010211001|XXGvertex_iport_iport|85|0|137|0|{0|in|}48|53|}
{2010006001|XXGobject_psameas_object|86|0|139|0|{metadata|in_metadata|1|0|}53|48|}
{2010006001|XXGobject_psameas_object|87|0|140|0|{in_metadata|out_metadata|0|0|}42|18|}
{2010006001|XXGobject_psameas_object|88|0|141|0|{reject0_metadata|out_metadata|0|0|}42|18|}
{2010601001|XXGgraph_vertex_vertex|89|0|142|0|{Version_Log|}1|54|}
{2010605001|XXGgraph_legend_legend|90|0|144|0|{0|}54|55|}
{2010241001|XXGlegend_face_face|91|0|146|0|{}55|56|}
{2010605001|XXGgraph_legend_legend|92|0|148|0|{1|}54|57|}
{2010241001|XXGlegend_face_face|93|0|150|0|{}57|58|}
{2010605001|XXGgraph_legend_legend|94|0|152|0|{2|}54|59|}
{2010241001|XXGlegend_face_face|95|0|154|0|{}59|60|}
{2010605001|XXGgraph_legend_legend|96|0|156|0|{3|}54|61|}
{2010241001|XXGlegend_face_face|97|0|158|0|{}61|62|}
{2010605001|XXGgraph_legend_legend|98|0|160|0|{4|}54|63|}
{2010241001|XXGlegend_face_face|99|0|162|0|{}63|64|}
{2010605001|XXGgraph_legend_legend|100|0|164|0|{5|}54|65|}
{2010241001|XXGlegend_face_face|101|0|166|0|{}65|66|}
{2010605001|XXGgraph_legend_legend|102|0|168|0|{6|}54|67|}
{2010241001|XXGlegend_face_face|103|0|170|0|{}67|68|}
{2010605001|XXGgraph_legend_legend|104|0|172|0|{7|}54|69|}
{2010241001|XXGlegend_face_face|105|0|174|0|{}69|70|}
{2010605001|XXGgraph_legend_legend|106|0|176|0|{8|}54|71|}
{2010241001|XXGlegend_face_face|107|0|178|0|{}71|72|}
{2010605001|XXGgraph_legend_legend|108|0|180|0|{9|}54|73|}
{2010241001|XXGlegend_face_face|109|0|182|0|{}73|74|}
{2010212001|XXGvertex_oport_oport|110|0|184|0|{0|out0|}1|75|}
{2010216002|XXGoport_binding_oport|111|0|186|0|{.5|.5|{0|}72|}75|43|}
{2010211001|XXGvertex_iport_iport|112|0|187|0|{0|in1|}1|76|}
{2010215002|XXGiport_binding_iport|113|0|189|0|{.5|.5|{0|}70|}76|23|}
{2010211001|XXGvertex_iport_iport|114|0|190|0|{1|in0|}1|77|}
{2010215002|XXGiport_binding_iport|115|0|192|0|{.5|.5|{0|}71|}77|10|}
{2010109001|XXGobject_property_value|116|0|193|0|{0|TrackingThumbprint|72|}1|78|}
