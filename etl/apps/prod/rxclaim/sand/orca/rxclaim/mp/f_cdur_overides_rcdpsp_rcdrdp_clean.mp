@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|157|rel_count|289|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS||24|3|Kc||{0|}}
{30001002|XXparameter|AB_CATALOG||3|2|EK$|Catalog file containing all the lookups that will be used in the XFR|{0|}}
{30001002|XXparameter|TARGET_NAME||3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_CLEAN_NAME|$[ re_replace(TARGET_NAME,"_rcdrdp","")]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_NAME, "[.].*", "") ]|3|9|RK|@{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|EFK||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|OUTPUT_CLEAN_FILE_PATH|$[AI_MFS+"/clean."+TARGET_SYSTEM+"/clean."+TARGET_NAME+"."+RUN_ID+".dat.gz"]|3|9|RK|Ful path of the input file to be transformed. This supports file patterns also, e.g. $AI_SERIAL_PENDING/source.*.YYYYMMDD.dat|{0|}}
{30001002|XXparameter|OUTPUT_CLEAN_FILE_DML|$[AI_DML+"/clean."+TARGET_SYSTEM+"/clean."+TARGET_NAME+".dml"]|18|9|RK|File containing the record format of the input file.|{0|}}
{30001002|XXparameter|MAPPING_XFR||3|9|RFK|@{0|}}
{30001002|XXparameter|LOOKUP_KEY_RCDRDP|\{rxclaimnbr; clmseqnbr; src_env_sk\}|3|9|FK|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_RCDRDP|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/one/rcdrdp.reduced.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_DML_RCDRDP|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.rcdrdp.reduced.dml|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_LOOKUP_DATASET_DML_RCDRDP|$[read_type(LOOKUP_ICFF_FILE_DML_RCDRDP)]|3|9|K|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_RCEX1P|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/one/f_claim_transaction.reduced.dat.gz|3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_ICFF_FILE_DML_RCEX1P|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.reduced.dml|3|9|K|@{0|}}
{30001002|XXparameter|IDS_LOOKUP_DATASET_DML_RCEX1P|$[read_type(LOOKUP_ICFF_FILE_DML_RCEX1P)]|3|9|K|@{0|}}
{30001002|XXparameter|INPUT_CLEAN_DML|$[AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + INPUT_CLEAN_NAME + ".dml" ]|3|9|RK|@{0|}}
{30001002|XXparameter|INPUT_CLEAN_FILE|$[ "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + INPUT_CLEAN_NAME + "." + RUN_ID + ".dat.gz" ]|3|9|RK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|926000|588000|0|produce|anwar.parvez|Created 6/12/2015 2:24:18 PM|1|100|-1||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1400000|709000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'f_cdur_overides_rcdpsp_rcdrdp_clean' Execution Status Report

Job completed successfully at Thursday, August 10, 2017 05:56:09
Run performed by user schatt14
||
||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|32768|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@ |14500|100000|0|0|0|0|12218|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}13132|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}13133|529|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}13136|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}13134|529|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}13128|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}13121|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13130|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}13137|17|}}
{2010501005|XXGpvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$[join_types('record   unsigned integer(8)  dxf_hk_part1 =  0;
  unsigned integer(8)  dxf_hk_part2 =  0; decimal("\\x01",0)   src_env_sk = NULL("");   end; ', read_file("$OUTPUT_CLEAN_FILE_DML")) ]|3|9||@{0|}}
{30001002|XXparameter|transform0|$\{MAPPING_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata|$OUTPUT_CLEAN_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|output_index|output_index_out :: output_index(in) =
begin
  output_index_out :: if(in.claim_match_ind=="Y") 0 else 1;
end;|3|1|l|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|214000|320000|0|0|0|0|13129|Drop unused fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|16|0|31|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|17|0|34|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|18|0|37|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|19|0|39|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|20|0|41|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|21|0|43|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|22|0|45|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|23|0|47|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|24|0|50|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|25|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|26|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|27|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|28|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|29|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|30|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|31|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|33|0|78|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_CLEAN_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_CLEAN_FILE_PATH", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_CLEAN_FILE_PATH|3|2|$|@{0|}}
}}@1|@1108000|638500|0|0|0|0|13113|OUTPUT clean|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|34|0|80|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|35|0|83|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|36|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|37|0|88|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|file:$INPUT_CLEAN_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_CLEAN_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_CLEAN_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@40000|480000|0|0|0|0|13131|INPUT clean|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|38|0|90|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|39|0|93|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|40|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|41|0|100|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|!is_null(d3iqhr)|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|690000|280000|0|0|0|0|13116|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|42|0|102|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|43|0|105|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|44|0|108|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|45|0|110|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|46|0|112|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|114|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|117|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
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
{2010203004|XXGoport|49|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|50|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|51|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|52|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|53|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|55|0|137|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
  let hash_key_combine_type dxf_hk = reinterpret(get_hash(in,$LOOKUP_KEY_RCDRDP));
  out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
  out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|60000|38000|0|0|0|0|13026|Get Hash for RCDRDP match|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|139|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|57|0|141|0|{@{}@384|.5|.5|{0|}13031|17|}}
{2010203004|XXGoport|58|0|143|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|59|0|145|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|60|0|147|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|61|0|149|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|62|0|151|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|63|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|64|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|65|0|160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|66|0|163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|67|0|166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|68|0|173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|include "$\{PUB_DXF_DML\}/generic_data_types.dml" ;
let string("") datafile=this_partition_path("$\{LOOKUP_ICFF_FILE_RCDRDP\}");
let string("") indexfile=this_partition_path(string_replace("$\{LOOKUP_ICFF_FILE_RCDRDP\}",".dat.gz", ".idx"));
let  unsigned integer(8) v_hash_key_half=0;
let  $\{IDS_LOOKUP_DATASET_DML_RCDRDP\} lookup_record_type=allocate_with_defaults();
let $\{IDS_LOOKUP_DATASET_DML_RCDRDP\} lookup_record_value = allocate_with_nulls();
let $\{IDS_LOOKUP_DATASET_DML_RCDRDP\}[int] lookup_record_vec = [vector];
let $\{IDS_LOOKUP_DATASET_DML_RCDRDP\}[int] lookup_record_vec_final = [vector];
let $\{IDS_LOOKUP_DATASET_DML_RCDRDP\} exact_next_record_value=allocate_with_nulls();
let lookup_identifier_type current_lookup = lookup_not_loaded();
let RCDRDP = lookup_make_template( lookup_record_type,\{dxf_hk_part1\},load_once = 1, keep_on_disk = 1, block_compressed = 1);

out::length(in)=
begin
        let int v_lkp_cnt = 0;
        if (current_lookup == lookup_not_loaded()) 
                current_lookup = lookup_load(datafile /*\@ eme_dataset_location: "$\{LOOKUP_ICFF_FILE_RCDRDP\}" \@*/,indexfile, RCDRDP);
        v_lkp_cnt = lookup_count(current_lookup, RCDRDP, in.dxf_hk_part1);
        lookup_record_vec = [vector];
        lookup_record_vec_final = [vector];
        if(v_lkp_cnt > 0) begin
                lookup_record_value = lookup_last(current_lookup, RCDRDP, in.dxf_hk_part1);
                if(lookup_record_value.dxf_hk_part2 == in.dxf_hk_part2)
                  lookup_record_vec = vector_append(lookup_record_vec, lookup_record_value);
                for (let int k = 1, k < v_lkp_cnt)
                begin 
                  exact_next_record_value = lookup_previous(current_lookup,RCDRDP);
                  if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                  begin
                    lookup_record_vec = vector_append(lookup_record_vec, exact_next_record_value);
                  end
                end
        end
        if(length_of(lookup_record_vec) > 0) begin
                for (let int j = 0, j < length_of(lookup_record_vec))
                begin
                        if(!is_null(in.aolast) && !is_null(lookup_record_vec[j].d3l7st) && lookup_record_vec[j].d3l7st == in.aolast)
                        begin
                               lookup_record_vec_final = vector_append(lookup_record_vec_final, lookup_record_vec[j]);
                        end
                end
        end
        
        out :: if(length_of(lookup_record_vec_final) == 0) 1 else length_of(lookup_record_vec_final);
end;


out :: normalize(in, index) =
begin
        out.* :1: if(length_of(lookup_record_vec_final) > 0) lookup_record_vec_final[index].*;
        out.* :2: in.*;
        out.d3irhr :1: if(length_of(lookup_record_vec_final) > 0) if(lookup_record_vec_final[index].d3irhr<0) lookup_record_vec_final[index].d3irhr else (1000-lookup_record_vec_final[index].d3irhr);
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/rt270p.dat.gz|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$OUTPUT_CLEAN_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@644000|25000|0|0|0|0|13028|Normalize :Get matched records from lkp with RCDRDP|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|69|0|175|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|70|0|177|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|71|0|179|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|72|0|181|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|73|0|183|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|74|0|185|0|{@{}@384|.5|.5|{0|}13032|17|}}
{2010501005|XXGpvertex|75|0|187|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|76|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|77|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|78|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|79|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|80|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|81|0|209|0|{Subgraph created from graph "f_cdur_overides_rcdpsp_rcdrdp_clean"|{}@0|@1115500|124250|0|0|0|0|13138|Find Conflicting Product details|anwar.parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|885000|196000|3|}}
{2010210004|XXGflow|82|0|211|0|{@{}@384|.5|.5|{0|}13022|17|}}
{2010210004|XXGflow|83|0|213|0|{@{}@384|.5|.5|{0|}13020|17|}}
{2010501005|XXGpvertex|84|0|215|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$[join_types('record  unsigned integer(8)  dxf_hk_part1 =  0;
  unsigned integer(8)  dxf_hk_part2 =  0; end',read_file("$OUTPUT_CLEAN_FILE_DML"))]|3|9||@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

out :: reformat(in) =
begin
  let hash_key_combine_type dxf_hk = reinterpret(get_hash(in,\{d3iqhr;d3irhr;claimsts ;src_env_sk\}));
  out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
  out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|40000|30000|0|0|0|0|13023|Get Hash for RCEX1P match|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|85|0|217|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|86|0|220|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|87|0|222|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|88|0|224|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|226|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|228|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|92|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|93|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|94|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|95|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|96|0|249|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "$\{PUB_DXF_DML\}/generic_data_types.dml" ;
let string("") datafile=this_partition_path("$\{LOOKUP_ICFF_FILE_RCEX1P\}");
let string("") indexfile=this_partition_path(string_replace("$\{LOOKUP_ICFF_FILE_RCEX1P\}",".dat.gz", ".idx"));
let  unsigned integer(8) v_hash_key_half=0;
let lookup_identifier_type current_lookup = lookup_not_loaded();
let  $\{IDS_LOOKUP_DATASET_DML_RCEX1P\} lookup_record_type=allocate_with_defaults();
let $\{IDS_LOOKUP_DATASET_DML_RCEX1P\} lookup_record_value = allocate_with_nulls();
let $\{IDS_LOOKUP_DATASET_DML_RCEX1P\} exact_record_value=allocate_with_defaults();
let $\{IDS_LOOKUP_DATASET_DML_RCEX1P\} exact_next_record_value=allocate_with_nulls();
let  hash_key_type v_record_hash_from_in=allocate_with_defaults();
let hash_key_type  v_record_hash_from_lkp=allocate_with_defaults(); 
let RCEX1P = lookup_make_template( lookup_record_type,\{dxf_hk_part1\},load_once = 1, keep_on_disk = 1, block_compressed = 1);

out::reformat(in)=
begin
        let decimal("\\x01",0)  conflict_prod_sk = NULL;
        let decimal("\\x01",0)  compound_sk = NULL;
        let integer(2) match_count=0;
        if (current_lookup == lookup_not_loaded()) 
                current_lookup = lookup_load(datafile /*\@ eme_dataset_location: "$\{LOOKUP_ICFF_FILE_RCEX1P\}" \@*/,indexfile, RCEX1P); //Structured comment for eme dataset for dependency analysis error .
        lookup_record_value = if((!is_null(in.claimsts) && !is_null(in.d3iqhr)) && in.claimsts == 'P' && in.d3iqhr > 0 )
                                first_defined(lookup_last(current_lookup, RCEX1P, in.dxf_hk_part1),allocate_with_defaults() )
                              else
                                allocate_with_defaults();
        exact_record_value=allocate_with_defaults();
        if( (!is_null(in.claimsts) && !is_null(in.d3iqhr)) && in.claimsts == 'P' && in.d3iqhr > 0 )
                begin
                        if (lookup_record_value.dxf_hk_part1 ==0 ) 
                                exact_record_value = allocate_with_defaults() ; // No Match found on half hash key 
                        else if  (in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2) 
                                exact_record_value = lookup_record_value;  //A match is found on dxf part1 as well as dxf part2 keys, this is an exact match in first inetration itself 
                        else                                                              //A Match is found on half hash key but not on full hash key, find exact match inside iteration.
                                begin
                                        match_count = lookup_count(current_lookup, RCEX1P, in.dxf_hk_part1);
                                                begin block exact_record_match
                                                        for (let int k=0, k < match_count)
                                                                begin 
                                                                        exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, RCEX1P, in.dxf_hk_part1) else lookup_previous(current_lookup,RCEX1P);
                                                                        if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                                                                begin
                                                                                        exact_record_value = exact_next_record_value;
                                                                                        exit  exact_record_match;
                                                                                end                                                                                                                 
                                                                end
                                                end block exact_record_match
                                end 
                end
                            
        conflict_prod_sk = if(!is_null(exact_record_value.prod_sk)) 
                                 exact_record_value.prod_sk;       
        compound_sk = if(!is_null(exact_record_value.compound_sk)) 
                                 exact_record_value.compound_sk;
        out.prod_id :: if(!is_null(conflict_prod_sk)) lookup("D_PRODUCT lkp",conflict_prod_sk).prod_id else "";
        out.prod_id_qlfr_cd :: if(!is_null(conflict_prod_sk)) lookup("D_PRODUCT lkp",conflict_prod_sk).prod_id_qlfr_cd else "";
        out.compound_cd :: if(!is_null(conflict_prod_sk)) lookup("L_COMPOUND lkp",conflict_prod_sk).compound_cd else "";
        out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_CLEAN_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|689000|30000|0|0|0|0|13014|Get matching conflict products|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|97|0|251|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|98|0|253|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|99|0|255|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|100|0|257|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|259|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|262|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|103|0|264|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|104|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|105|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|106|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|108|0|283|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key|\{dxf_hk_part1\}|19|2|RF$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout||9|8|RF=||{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout||9|8|RFs=||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@307500|48500|0|0|481000|303000|13021|PBKS:\{dxf_hk_part1\}-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|364000|3|}}
{2010210004|XXGflow|109|0|285|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}11|36|}}
{2010501005|XXGpvertex|110|0|287|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@96000|171000|81000|138000|136000|68000|12|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|111|0|289|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|112|0|292|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|294|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|114|0|296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|115|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|116|0|306|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@327000|148504|327000|139000|114000|65000|10|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|117|0|308|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|118|0|310|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|313|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|120|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|121|0|318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|122|0|326|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|123|0|330|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010203004|XXGoport|124|0|336|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|125|0|340|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|126|0|344|0|{Subgraph created from graph "f_cdur_overides_rcdpsp_rcdrdp_clean"|{}@0|@477500|140250|0|0|0|0|13135|Find matching Conflict claims|anwar.parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|857000|214000|3|}}
{2010600005|XXGgraph|127|0|350|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key|\{dxf_hk_part1\}|19|2|RF$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout||9|8|RF=||{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout||9|8|RFs=||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@336000|51500|0|0|481000|303000|13033|PBKS:\{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|364000|3|}}
{2010210004|XXGflow|128|0|352|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}7|36|}}
{2010501005|XXGpvertex|129|0|354|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@126000|171000|81000|138000|136000|68000|8|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|130|0|356|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|131|0|359|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|132|0|361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|133|0|363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|134|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|373|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@327000|148504|327000|139000|114000|65000|6|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|136|0|375|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|137|0|377|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|138|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|139|0|382|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|140|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|141|0|393|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|142|0|397|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010203004|XXGoport|143|0|403|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|144|0|407|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|145|0|411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|1318000|375000|0|0|0|0|13123|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|146|0|413|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|147|0|416|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|148|0|421|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|149|0|423|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|150|0|426|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010600005|XXGgraph|151|0|434|0|{Subgraph created from graph "f_cdur_overides_rcdpsp_rcdrdp_clean"|{}@0|@265000|81500|0|0|0|0|13094|Serial Lookups|anwar.parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|395000|168000|3|}}
{2010503005|XXGfvertex|152|0|436|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.ids_common/lookup.ids_common.d_product.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/lookup.ids_common/lookup.ids_common.d_product.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|$AI_DML/lookup.ids_common/lookup.ids_common.d_product.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_sk\}|3|2|$|@{0|}}
}}@0|@61000|85000|0|0|0|0|12805|D_PRODUCT lkp|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|153|0|438|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|154|0|440|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.ids_rxclaim/lookup.ids_rxclaim.l_compound.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/lookup.ids_rxclaim/lookup.ids_rxclaim.l_compound.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|$AI_DML/lookup.ids_rxclaim/lookup.ids_rxclaim.l_compound.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{compound_sk\}|3|2|$|@{0|}}
}}@0|@266000|85000|0|0|0|0|12806|L_COMPOUND lkp|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|155|0|442|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010110002|XXGconstant|156|0|444|0|{@{}@{1|6258578|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_4|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_5|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_6|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_7|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_8|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_9|}1|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{Drop_unused_fields|}1|15|}
{2010212001|XXGvertex_oport_oport|15|0|30|0|{0|out0|}15|16|}
{2010213001|XXGoport_dst_flow|16|0|32|0|{0|}16|8|}
{2010212001|XXGvertex_oport_oport|17|0|33|0|{1|out1|}15|17|}
{2010213001|XXGoport_dst_flow|18|0|35|0|{0|}17|11|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{2|reject0|}15|18|}
{2010212001|XXGvertex_oport_oport|20|0|38|0|{3|reject1|}15|19|}
{2010212001|XXGvertex_oport_oport|21|0|40|0|{4|error0|}15|20|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{5|error1|}15|21|}
{2010212001|XXGvertex_oport_oport|23|0|44|0|{6|log|}15|22|}
{2010211001|XXGvertex_iport_iport|24|0|46|0|{0|in|}15|23|}
{2010214001|XXGiport_src_flow|25|0|48|0|{0|}23|13|}
{2010007001|XXGobject_proto_object|26|0|49|0|{}15|24|}
{2010212001|XXGvertex_oport_oport|27|0|51|0|{0|out0|}24|25|}
{2010006001|XXGobject_psameas_object|28|0|53|0|{metadata|out0_metadata|1|0|}25|24|}
{2010006001|XXGobject_psameas_object|29|0|54|0|{transform0|transform0|1|0|}25|24|}
{2010212001|XXGvertex_oport_oport|30|0|55|0|{1|out1|}24|26|}
{2010006001|XXGobject_psameas_object|31|0|57|0|{metadata|out1_metadata|1|0|}26|24|}
{2010006001|XXGobject_psameas_object|32|0|58|0|{transform1|transform1|1|0|}26|24|}
{2010212001|XXGvertex_oport_oport|33|0|59|0|{2|reject0|}24|27|}
{2010006001|XXGobject_psameas_object|34|0|61|0|{metadata|reject0_metadata|1|0|}27|24|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{3|reject1|}24|28|}
{2010006001|XXGobject_psameas_object|36|0|64|0|{metadata|reject1_metadata|1|0|}28|24|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{4|error0|}24|29|}
{2010006001|XXGobject_psameas_object|38|0|67|0|{metadata|error0_metadata|1|0|}29|24|}
{2010212001|XXGvertex_oport_oport|39|0|68|0|{5|error1|}24|30|}
{2010006001|XXGobject_psameas_object|40|0|70|0|{metadata|error1_metadata|1|0|}30|24|}
{2010212001|XXGvertex_oport_oport|41|0|71|0|{6|log|}24|31|}
{2010006001|XXGobject_psameas_object|42|0|73|0|{metadata|log_metadata|1|0|}31|24|}
{2010211001|XXGvertex_iport_iport|43|0|74|0|{0|in|}24|32|}
{2010006001|XXGobject_psameas_object|44|0|76|0|{metadata|in_metadata|1|0|}32|24|}
{2010006001|XXGobject_psameas_object|45|0|77|0|{Layout|Layout|0|0|}15|33|}
{2010211001|XXGvertex_iport_iport|46|0|79|0|{0|write|}33|34|}
{2010214001|XXGiport_src_flow|47|0|81|0|{0|}34|7|}
{2010007001|XXGobject_proto_object|48|0|82|0|{}33|35|}
{2010211001|XXGvertex_iport_iport|49|0|84|0|{0|write|}35|36|}
{2010006001|XXGobject_psameas_object|50|0|86|0|{metadata|write_metadata|1|0|}36|35|}
{2010006001|XXGobject_psameas_object|51|0|87|0|{in_metadata|read_metadata|0|0|}15|37|}
{2010212001|XXGvertex_oport_oport|52|0|89|0|{0|read|}37|38|}
{2010213001|XXGoport_dst_flow|53|0|91|0|{0|}38|13|}
{2010007001|XXGobject_proto_object|54|0|92|0|{}37|39|}
{2010212001|XXGvertex_oport_oport|55|0|94|0|{0|read|}39|40|}
{2010006001|XXGobject_psameas_object|56|0|96|0|{metadata|read_metadata|1|0|}40|39|}
{2010006001|XXGobject_psameas_object|57|0|97|0|{reject0_metadata|read_metadata|0|0|}15|37|}
{2010006001|XXGobject_psameas_object|58|0|98|0|{reject1_metadata|read_metadata|0|0|}15|37|}
{2010601001|XXGgraph_vertex_vertex|59|0|99|0|{Filter_by_Expression|}1|41|}
{2010212001|XXGvertex_oport_oport|60|0|101|0|{0|out|}41|42|}
{2010213001|XXGoport_dst_flow|61|0|103|0|{0|}42|9|}
{2010212001|XXGvertex_oport_oport|62|0|104|0|{1|deselect|}41|43|}
{2010213001|XXGoport_dst_flow|63|0|106|0|{0|}43|12|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{2|reject|}41|44|}
{2010212001|XXGvertex_oport_oport|65|0|109|0|{3|error|}41|45|}
{2010212001|XXGvertex_oport_oport|66|0|111|0|{4|log|}41|46|}
{2010211001|XXGvertex_iport_iport|67|0|113|0|{0|in|}41|47|}
{2010214001|XXGiport_src_flow|68|0|115|0|{0|}47|10|}
{2010007001|XXGobject_proto_object|69|0|116|0|{}41|48|}
{2010212001|XXGvertex_oport_oport|70|0|118|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{metadata|out_metadata|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|72|0|121|0|{1|deselect|}48|50|}
{2010006001|XXGobject_psameas_object|73|0|123|0|{metadata|deselect_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|74|0|124|0|{2|reject|}48|51|}
{2010006001|XXGobject_psameas_object|75|0|126|0|{metadata|reject_metadata|1|0|}51|48|}
{2010212001|XXGvertex_oport_oport|76|0|127|0|{3|error|}48|52|}
{2010006001|XXGobject_psameas_object|77|0|129|0|{metadata|error_metadata|1|0|}52|48|}
{2010212001|XXGvertex_oport_oport|78|0|130|0|{4|log|}48|53|}
{2010006001|XXGobject_psameas_object|79|0|132|0|{metadata|log_metadata|1|0|}53|48|}
{2010211001|XXGvertex_iport_iport|80|0|133|0|{0|in|}48|54|}
{2010006001|XXGobject_psameas_object|81|0|135|0|{metadata|in_metadata|1|0|}54|48|}
{2010006001|XXGobject_psameas_object|82|0|136|0|{Layout|Layout|0|0|}41|55|}
{2010212001|XXGvertex_oport_oport|83|0|138|0|{0|out0|}55|56|}
{2010213001|XXGoport_dst_flow|84|0|140|0|{0|}56|57|}
{2010212001|XXGvertex_oport_oport|85|0|142|0|{1|reject0|}55|58|}
{2010212001|XXGvertex_oport_oport|86|0|144|0|{2|error0|}55|59|}
{2010212001|XXGvertex_oport_oport|87|0|146|0|{3|log|}55|60|}
{2010211001|XXGvertex_iport_iport|88|0|148|0|{0|in|}55|61|}
{2010007001|XXGobject_proto_object|89|0|150|0|{}55|62|}
{2010212001|XXGvertex_oport_oport|90|0|152|0|{0|out0|}62|63|}
{2010006001|XXGobject_psameas_object|91|0|154|0|{metadata|out0_metadata|1|0|}63|62|}
{2010006001|XXGobject_psameas_object|92|0|155|0|{transform0|transform0|1|0|}63|62|}
{2010212001|XXGvertex_oport_oport|93|0|156|0|{1|reject0|}62|64|}
{2010006001|XXGobject_psameas_object|94|0|158|0|{metadata|reject0_metadata|1|0|}64|62|}
{2010212001|XXGvertex_oport_oport|95|0|159|0|{2|error0|}62|65|}
{2010006001|XXGobject_psameas_object|96|0|161|0|{metadata|error0_metadata|1|0|}65|62|}
{2010212001|XXGvertex_oport_oport|97|0|162|0|{3|log|}62|66|}
{2010006001|XXGobject_psameas_object|98|0|164|0|{metadata|log_metadata|1|0|}66|62|}
{2010211001|XXGvertex_iport_iport|99|0|165|0|{0|in|}62|67|}
{2010006001|XXGobject_psameas_object|100|0|167|0|{metadata|in_metadata|1|0|}67|62|}
{2010006001|XXGobject_psameas_object|101|0|168|0|{Layout|Layout|0|0|}55|33|}
{2010006001|XXGobject_psameas_object|102|0|169|0|{in_metadata|out0_metadata|0|0|}55|15|}
{2010006001|XXGobject_psameas_object|103|0|170|0|{out0_metadata|out0_metadata|0|0|}55|15|}
{2010006001|XXGobject_psameas_object|104|0|171|0|{reject0_metadata|out0_metadata|0|0|}55|15|}
{2010006001|XXGobject_psameas_object|105|0|172|0|{deselect_metadata|out_metadata|0|0|}41|68|}
{2010212001|XXGvertex_oport_oport|106|0|174|0|{0|out|}68|69|}
{2010212001|XXGvertex_oport_oport|107|0|176|0|{1|reject|}68|70|}
{2010212001|XXGvertex_oport_oport|108|0|178|0|{2|error|}68|71|}
{2010212001|XXGvertex_oport_oport|109|0|180|0|{3|log|}68|72|}
{2010211001|XXGvertex_iport_iport|110|0|182|0|{0|in|}68|73|}
{2010214001|XXGiport_src_flow|111|0|184|0|{0|}73|74|}
{2010007001|XXGobject_proto_object|112|0|186|0|{}68|75|}
{2010212001|XXGvertex_oport_oport|113|0|188|0|{0|out|}75|76|}
{2010006001|XXGobject_psameas_object|114|0|190|0|{metadata|out_metadata|1|0|}76|75|}
{2010212001|XXGvertex_oport_oport|115|0|191|0|{1|reject|}75|77|}
{2010006001|XXGobject_psameas_object|116|0|193|0|{metadata|reject_metadata|1|0|}77|75|}
{2010212001|XXGvertex_oport_oport|117|0|194|0|{2|error|}75|78|}
{2010006001|XXGobject_psameas_object|118|0|196|0|{metadata|error_metadata|1|0|}78|75|}
{2010212001|XXGvertex_oport_oport|119|0|197|0|{3|log|}75|79|}
{2010006001|XXGobject_psameas_object|120|0|199|0|{metadata|log_metadata|1|0|}79|75|}
{2010211001|XXGvertex_iport_iport|121|0|200|0|{0|in|}75|80|}
{2010006001|XXGobject_psameas_object|122|0|202|0|{metadata|in_metadata|1|0|}80|75|}
{2010006001|XXGobject_psameas_object|123|0|203|0|{in_metadata|out0_metadata|0|0|}68|15|}
{2010006001|XXGobject_psameas_object|124|0|204|0|{reject_metadata|out0_metadata|0|0|}68|15|}
{2010006001|XXGobject_psameas_object|125|0|205|0|{in_metadata|out_metadata|0|0|}41|68|}
{2010006001|XXGobject_psameas_object|126|0|206|0|{out_metadata|out_metadata|0|0|}41|68|}
{2010006001|XXGobject_psameas_object|127|0|207|0|{reject_metadata|out_metadata|0|0|}41|68|}
{2010601001|XXGgraph_vertex_vertex|128|0|208|0|{Find_Conflicting_Product_details|}1|81|}
{2010604001|XXGgraph_flow_flow|129|0|210|0|{Flow_3|}81|82|}
{2010604001|XXGgraph_flow_flow|130|0|212|0|{Flow_6|}81|83|}
{2010601001|XXGgraph_vertex_vertex|131|0|214|0|{Get_Hash_for_RCEX1P_match|}81|84|}
{2010212001|XXGvertex_oport_oport|132|0|216|0|{0|out0|}84|85|}
{2010213001|XXGoport_dst_flow|133|0|218|0|{0|}85|82|}
{2010212001|XXGvertex_oport_oport|134|0|219|0|{1|reject0|}84|86|}
{2010212001|XXGvertex_oport_oport|135|0|221|0|{2|error0|}84|87|}
{2010212001|XXGvertex_oport_oport|136|0|223|0|{3|log|}84|88|}
{2010211001|XXGvertex_iport_iport|137|0|225|0|{0|in|}84|89|}
{2010007001|XXGobject_proto_object|138|0|227|0|{}84|90|}
{2010212001|XXGvertex_oport_oport|139|0|229|0|{0|out0|}90|91|}
{2010006001|XXGobject_psameas_object|140|0|231|0|{metadata|out0_metadata|1|0|}91|90|}
{2010006001|XXGobject_psameas_object|141|0|232|0|{transform0|transform0|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|142|0|233|0|{1|reject0|}90|92|}
{2010006001|XXGobject_psameas_object|143|0|235|0|{metadata|reject0_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|144|0|236|0|{2|error0|}90|93|}
{2010006001|XXGobject_psameas_object|145|0|238|0|{metadata|error0_metadata|1|0|}93|90|}
{2010212001|XXGvertex_oport_oport|146|0|239|0|{3|log|}90|94|}
{2010006001|XXGobject_psameas_object|147|0|241|0|{metadata|log_metadata|1|0|}94|90|}
{2010211001|XXGvertex_iport_iport|148|0|242|0|{0|in|}90|95|}
{2010006001|XXGobject_psameas_object|149|0|244|0|{metadata|in_metadata|1|0|}95|90|}
{2010006001|XXGobject_psameas_object|150|0|245|0|{Layout|Layout|0|0|}84|55|}
{2010006001|XXGobject_psameas_object|151|0|246|0|{in_metadata|out_metadata|0|0|}84|68|}
{2010006001|XXGobject_psameas_object|152|0|247|0|{reject0_metadata|out_metadata|0|0|}84|68|}
{2010601001|XXGgraph_vertex_vertex|153|0|248|0|{Get_matching_conflict_products|}81|96|}
{2010212001|XXGvertex_oport_oport|154|0|250|0|{0|out0|}96|97|}
{2010212001|XXGvertex_oport_oport|155|0|252|0|{1|reject0|}96|98|}
{2010212001|XXGvertex_oport_oport|156|0|254|0|{2|error0|}96|99|}
{2010212001|XXGvertex_oport_oport|157|0|256|0|{3|log|}96|100|}
{2010211001|XXGvertex_iport_iport|158|0|258|0|{0|in|}96|101|}
{2010214001|XXGiport_src_flow|159|0|260|0|{0|}101|83|}
{2010007001|XXGobject_proto_object|160|0|261|0|{}96|102|}
{2010212001|XXGvertex_oport_oport|161|0|263|0|{0|out0|}102|103|}
{2010006001|XXGobject_psameas_object|162|0|265|0|{metadata|out0_metadata|1|0|}103|102|}
{2010006001|XXGobject_psameas_object|163|0|266|0|{transform0|transform0|1|0|}103|102|}
{2010212001|XXGvertex_oport_oport|164|0|267|0|{1|reject0|}102|104|}
{2010006001|XXGobject_psameas_object|165|0|269|0|{metadata|reject0_metadata|1|0|}104|102|}
{2010212001|XXGvertex_oport_oport|166|0|270|0|{2|error0|}102|105|}
{2010006001|XXGobject_psameas_object|167|0|272|0|{metadata|error0_metadata|1|0|}105|102|}
{2010212001|XXGvertex_oport_oport|168|0|273|0|{3|log|}102|106|}
{2010006001|XXGobject_psameas_object|169|0|275|0|{metadata|log_metadata|1|0|}106|102|}
{2010211001|XXGvertex_iport_iport|170|0|276|0|{0|in|}102|107|}
{2010006001|XXGobject_psameas_object|171|0|278|0|{metadata|in_metadata|1|0|}107|102|}
{2010006001|XXGobject_psameas_object|172|0|279|0|{Layout|Layout|0|0|}96|33|}
{2010006001|XXGobject_psameas_object|173|0|280|0|{in_metadata|out0_metadata|0|0|}96|84|}
{2010006001|XXGobject_psameas_object|174|0|281|0|{reject0_metadata|out0_metadata|0|0|}96|84|}
{2010601001|XXGgraph_vertex_vertex|175|0|282|0|{PBKS_dxf_hk_part1_1|}81|108|}
{2010604001|XXGgraph_flow_flow|176|0|284|0|{Flow_1|}108|109|}
{2010601001|XXGgraph_vertex_vertex|177|0|286|0|{Partition_by_Key|}108|110|}
{2010212001|XXGvertex_oport_oport|178|0|288|0|{0|out|}110|111|}
{2010213001|XXGoport_dst_flow|179|0|290|0|{0|}111|109|}
{2010211001|XXGvertex_iport_iport|180|0|291|0|{0|in|}110|112|}
{2010007001|XXGobject_proto_object|181|0|293|0|{}110|113|}
{2010212001|XXGvertex_oport_oport|182|0|295|0|{0|out|}113|114|}
{2010006001|XXGobject_psameas_object|183|0|297|0|{metadata|out_metadata|1|0|}114|113|}
{2010211001|XXGvertex_iport_iport|184|0|298|0|{0|in|}113|115|}
{2010006001|XXGobject_psameas_object|185|0|300|0|{metadata|in_metadata|1|0|}115|113|}
{2010006001|XXGobject_psameas_object|186|0|301|0|{Layout|InputLayout|1|0|}110|108|}
{2010006001|XXGobject_psameas_object|187|0|302|0|{in_metadata|out0_metadata|0|0|}110|84|}
{2010006001|XXGobject_psameas_object|188|0|303|0|{key|Key|1|0|}110|108|}
{2010006001|XXGobject_psameas_object|189|0|304|0|{out_metadata|out0_metadata|0|0|}110|84|}
{2010601001|XXGgraph_vertex_vertex|190|0|305|0|{Sort|}108|116|}
{2010212001|XXGvertex_oport_oport|191|0|307|0|{0|out|}116|117|}
{2010211001|XXGvertex_iport_iport|192|0|309|0|{0|in|}116|118|}
{2010214001|XXGiport_src_flow|193|0|311|0|{0|}118|109|}
{2010007001|XXGobject_proto_object|194|0|312|0|{}116|119|}
{2010212001|XXGvertex_oport_oport|195|0|314|0|{0|out|}119|120|}
{2010006001|XXGobject_psameas_object|196|0|316|0|{metadata|out_metadata|1|0|}120|119|}
{2010211001|XXGvertex_iport_iport|197|0|317|0|{0|in|}119|121|}
{2010006001|XXGobject_psameas_object|198|0|319|0|{metadata|in_metadata|1|0|}121|119|}
{2010006001|XXGobject_psameas_object|199|0|320|0|{Layout|OutputLayout|1|0|}116|108|}
{2010006001|XXGobject_psameas_object|200|0|321|0|{in_metadata|out0_metadata|0|0|}116|84|}
{2010006001|XXGobject_psameas_object|201|0|322|0|{key|Key|1|0|}116|108|}
{2010006001|XXGobject_psameas_object|202|0|323|0|{max_core|Max_core|1|0|}116|108|}
{2010006001|XXGobject_psameas_object|203|0|324|0|{out_metadata|out0_metadata|0|0|}116|84|}
{2010212001|XXGvertex_oport_oport|204|0|325|0|{0|out0|}108|122|}
{2010216002|XXGoport_binding_oport|205|0|327|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}122|117|}
{2010213001|XXGoport_dst_flow|206|0|328|0|{0|}122|83|}
{2010211001|XXGvertex_iport_iport|207|0|329|0|{0|in0|}108|123|}
{2010215002|XXGiport_binding_iport|208|0|331|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}123|112|}
{2010214001|XXGiport_src_flow|209|0|332|0|{0|}123|82|}
{2010006001|XXGobject_psameas_object|210|0|333|0|{InputLayout|Layout|0|0|}108|55|}
{2010006001|XXGobject_psameas_object|211|0|334|0|{OutputLayout|Layout|0|0|}108|33|}
{2010212001|XXGvertex_oport_oport|212|0|335|0|{0|out0|}81|124|}
{2010216002|XXGoport_binding_oport|213|0|337|0|{.5|.5|{0|}13018|}124|97|}
{2010213001|XXGoport_dst_flow|214|0|338|0|{0|}124|14|}
{2010211001|XXGvertex_iport_iport|215|0|339|0|{0|in0|}81|125|}
{2010215002|XXGiport_binding_iport|216|0|341|0|{.5|.5|{0|}13017|}125|89|}
{2010214001|XXGiport_src_flow|217|0|342|0|{0|}125|9|}
{2010601001|XXGgraph_vertex_vertex|218|0|343|0|{Find_matching_Conflict_claims|}1|126|}
{2010604001|XXGgraph_flow_flow|219|0|345|0|{Flow_1|}126|57|}
{2010604001|XXGgraph_flow_flow|220|0|346|0|{Flow_4|}126|74|}
{2010601001|XXGgraph_vertex_vertex|221|0|347|0|{Get_Hash_for_RCDRDP_match|}126|55|}
{2010601001|XXGgraph_vertex_vertex|222|0|348|0|{Normalize_Get_matched_records_from_lkp_with_RCDRDP|}126|68|}
{2010601001|XXGgraph_vertex_vertex|223|0|349|0|{PBKS_dxf_hk_part1_|}126|127|}
{2010604001|XXGgraph_flow_flow|224|0|351|0|{Flow_1|}127|128|}
{2010601001|XXGgraph_vertex_vertex|225|0|353|0|{Partition_by_Key|}127|129|}
{2010212001|XXGvertex_oport_oport|226|0|355|0|{0|out|}129|130|}
{2010213001|XXGoport_dst_flow|227|0|357|0|{0|}130|128|}
{2010211001|XXGvertex_iport_iport|228|0|358|0|{0|in|}129|131|}
{2010007001|XXGobject_proto_object|229|0|360|0|{}129|132|}
{2010212001|XXGvertex_oport_oport|230|0|362|0|{0|out|}132|133|}
{2010006001|XXGobject_psameas_object|231|0|364|0|{metadata|out_metadata|1|0|}133|132|}
{2010211001|XXGvertex_iport_iport|232|0|365|0|{0|in|}132|134|}
{2010006001|XXGobject_psameas_object|233|0|367|0|{metadata|in_metadata|1|0|}134|132|}
{2010006001|XXGobject_psameas_object|234|0|368|0|{Layout|InputLayout|1|0|}129|127|}
{2010006001|XXGobject_psameas_object|235|0|369|0|{in_metadata|out0_metadata|0|0|}129|15|}
{2010006001|XXGobject_psameas_object|236|0|370|0|{key|Key|1|0|}129|127|}
{2010006001|XXGobject_psameas_object|237|0|371|0|{out_metadata|out0_metadata|0|0|}129|15|}
{2010601001|XXGgraph_vertex_vertex|238|0|372|0|{Sort|}127|135|}
{2010212001|XXGvertex_oport_oport|239|0|374|0|{0|out|}135|136|}
{2010211001|XXGvertex_iport_iport|240|0|376|0|{0|in|}135|137|}
{2010214001|XXGiport_src_flow|241|0|378|0|{0|}137|128|}
{2010007001|XXGobject_proto_object|242|0|379|0|{}135|138|}
{2010212001|XXGvertex_oport_oport|243|0|381|0|{0|out|}138|139|}
{2010006001|XXGobject_psameas_object|244|0|383|0|{metadata|out_metadata|1|0|}139|138|}
{2010211001|XXGvertex_iport_iport|245|0|384|0|{0|in|}138|140|}
{2010006001|XXGobject_psameas_object|246|0|386|0|{metadata|in_metadata|1|0|}140|138|}
{2010006001|XXGobject_psameas_object|247|0|387|0|{Layout|OutputLayout|1|0|}135|127|}
{2010006001|XXGobject_psameas_object|248|0|388|0|{in_metadata|out0_metadata|0|0|}135|15|}
{2010006001|XXGobject_psameas_object|249|0|389|0|{key|Key|1|0|}135|127|}
{2010006001|XXGobject_psameas_object|250|0|390|0|{max_core|Max_core|1|0|}135|127|}
{2010006001|XXGobject_psameas_object|251|0|391|0|{out_metadata|out0_metadata|0|0|}135|15|}
{2010212001|XXGvertex_oport_oport|252|0|392|0|{0|out0|}127|141|}
{2010216002|XXGoport_binding_oport|253|0|394|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}5|}141|136|}
{2010213001|XXGoport_dst_flow|254|0|395|0|{0|}141|74|}
{2010211001|XXGvertex_iport_iport|255|0|396|0|{0|in0|}127|142|}
{2010215002|XXGiport_binding_iport|256|0|398|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}4|}142|131|}
{2010214001|XXGiport_src_flow|257|0|399|0|{0|}142|57|}
{2010006001|XXGobject_psameas_object|258|0|400|0|{InputLayout|Layout|0|0|}127|55|}
{2010006001|XXGobject_psameas_object|259|0|401|0|{OutputLayout|Layout|0|0|}127|68|}
{2010212001|XXGvertex_oport_oport|260|0|402|0|{0|out0|}126|143|}
{2010216002|XXGoport_binding_oport|261|0|404|0|{.5|.5|{0|}13030|}143|69|}
{2010213001|XXGoport_dst_flow|262|0|405|0|{0|}143|10|}
{2010211001|XXGvertex_iport_iport|263|0|406|0|{0|in0|}126|144|}
{2010215002|XXGiport_binding_iport|264|0|408|0|{.5|.5|{0|}13029|}144|61|}
{2010214001|XXGiport_src_flow|265|0|409|0|{0|}144|8|}
{2010601001|XXGgraph_vertex_vertex|266|0|410|0|{Gather|}1|145|}
{2010212001|XXGvertex_oport_oport|267|0|412|0|{0|out|}145|146|}
{2010213001|XXGoport_dst_flow|268|0|414|0|{0|}146|7|}
{2010211001|XXGvertex_iport_iport|269|0|415|0|{0|in|}145|147|}
{2010214001|XXGiport_src_flow|270|0|417|0|{0|}147|14|}
{2010214001|XXGiport_src_flow|271|0|418|0|{1|}147|12|}
{2010214001|XXGiport_src_flow|272|0|419|0|{2|}147|11|}
{2010007001|XXGobject_proto_object|273|0|420|0|{}145|148|}
{2010212001|XXGvertex_oport_oport|274|0|422|0|{0|out|}148|149|}
{2010006001|XXGobject_psameas_object|275|0|424|0|{metadata|out_metadata|1|0|}149|148|}
{2010211001|XXGvertex_iport_iport|276|0|425|0|{0|in|}148|150|}
{2010006001|XXGobject_psameas_object|277|0|427|0|{metadata|in_metadata|1|0|}150|148|}
{2010006001|XXGobject_psameas_object|278|0|428|0|{Layout|Layout|0|0|}145|33|}
{2010006001|XXGobject_psameas_object|279|0|429|0|{in_metadata|out0_metadata|0|0|}145|96|}
{2010006001|XXGobject_psameas_object|280|0|430|0|{out_metadata|out0_metadata|0|0|}145|96|}
{2010601001|XXGgraph_vertex_vertex|281|0|431|0|{INPUT_clean|}1|37|}
{2010601001|XXGgraph_vertex_vertex|282|0|432|0|{OUTPUT_clean|}1|33|}
{2010601001|XXGgraph_vertex_vertex|283|0|433|0|{Serial_Lookups|}1|151|}
{2010601001|XXGgraph_vertex_vertex|284|0|435|0|{D_PRODUCT_lkp|}151|152|}
{2010007001|XXGobject_proto_object|285|0|437|0|{}152|153|}
{2010601001|XXGgraph_vertex_vertex|286|0|439|0|{L_COMPOUND_lkp|}151|154|}
{2010007001|XXGobject_proto_object|287|0|441|0|{}154|155|}
{2010109001|XXGobject_property_value|288|0|443|0|{0|TrackingThumbprint|72|}1|156|}
