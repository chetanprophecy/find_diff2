@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|100|rel_count|175|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|Final_correction|dpalabha|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|952000|481000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'INC12207125_f_claim_txn_correction' Execution Status Report

Job completed successfully at Tuesday, December 10, 2019 05:54:41
Run performed by user dpalabha
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@QA Server||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}17858|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}17856|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}17853|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}17854|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}17850|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}17848|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}17846|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}17831|17|}}
{2010501005|XXGpvertex|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|lookup_match("Suppressed file-1", dxf_hk_part1,dxf_hk_part2)!=1|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|158000|271500|0|0|0|0|17852|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|27|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|15|0|30|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|16|0|33|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|17|0|35|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|18|0|37|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|19|0|39|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|20|0|42|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|21|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|22|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|23|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|24|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|25|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|27|0|62|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/reject_records.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/reject_records.dat|3|2|$|@{0|}}
}}@1|@398000|410500|0|0|0|0|17859|Reject File|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|28|0|64|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|29|0|67|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|30|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|31|0|72|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|record 
unsigned integer(8) dxf_hk_part1=0;
unsigned integer(8) dxf_hk_part2=0;
  integer(8)  dxf_sk = 0;
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/xref.f_claim_transaction.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/xref.f_claim_transaction.dat.gz|3|2|$|@{0|}}
}}@1|@27000|299500|0|0|0|0|17857|PROD XREF FILE-1|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|32|0|74|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|33|0|77|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|34|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|35|0|86|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/corrected_xref.f_claim_transaction.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/corrected_xref.f_claim_transaction.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@1|@864000|225000|0|0|0|0|17849|IDS ICFF|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|36|0|88|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|37|0|91|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|38|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|39|0|96|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/corrected_xref.f_claim_transaction.idx", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/corrected_xref.f_claim_transaction.idx|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@1|@864000|365000|0|0|0|0|17851|IDS Index File|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|40|0|98|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|41|0|101|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|42|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|43|0|106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|dxf_hk_part1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@640000|245000|0|0|0|0|17842|Write Block-Compressed Lookup-dxf_hk_part1|Ab Initio Software|Built-in 2.14.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|44|0|108|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|45|0|111|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|46|0|114|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|47|0|116|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|119|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|49|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|50|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|51|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|52|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|53|0|136|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@388000|264500|0|0|481000|303000|17855|PBKS\{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|54|0|138|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|55|0|140|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|142|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|57|0|145|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|58|0|149|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|59|0|151|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|60|0|153|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|61|0|158|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|62|0|162|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|63|0|166|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|64|0|168|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|65|0|170|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|172|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|67|0|175|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|68|0|177|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|69|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|70|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|187|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|189|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|73|0|191|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|194|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|75|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|76|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|77|0|205|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|78|0|208|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|79|0|214|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|259000|169000|0|0|0|0|17830|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|80|0|216|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|81|0|219|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|82|0|221|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|83|0|223|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|225|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|228|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|86|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|87|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|88|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|89|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|91|0|246|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|=|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.ids_rxclaim/load.split.f_claim_transaction.f_claim_transaction.supp_updates.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.ids_rxclaim/load.split.f_claim_transaction.f_claim_transaction.supp_updates.dat|3|2|$|@{0|}}
}}@0|@483000|176500|0|0|0|0|17832|Suppressed file-1|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|92|0|248|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|93|0|251|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|94|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|95|0|256|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.ids_rxclaim/load.split.f_claim_transaction.f_claim_transaction.supp_updates.20191113094601.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.ids_rxclaim/load.split.f_claim_transaction.f_claim_transaction.supp_updates.20191113094601.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  unsigned integer(8)     dxf_hk_part1 =     0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)     dxf_hk_part2 =     0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)     dxf_sk =     0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)      claim_nbr = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)      claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0)      carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      sbm_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      pbr_spclty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      pcp_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      custom_client_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      gender_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      age_band_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      phr_state_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      relationship_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      fmly_type_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      phr_pmt_cntr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      hm_dlvry_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      phr_afflt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      cost_basis_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      cost_type_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      final_pln_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)      admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      cob_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      location_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      client_benefit_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      clt_prc_typ_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      daw_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      dsg_frm_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      pln_drg_stat_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)      rej_cd1_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd2_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd3_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      orig_carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      orig_mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      orig_cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)      orig_carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)      orig_account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)      orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)      orig_member_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0)      claim_seq_nbr_src = NULL("") /*INTEGER*/;
  decimal("\\x01",0)      claim_cntr = NULL("") /*SMALLINT*/;
  date("YYYYMMDD")("\\x01")      sbm_dt = NULL("") /*DATE*/;
  decimal("\\x01",0)      sbm_mn_id = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      hm_dlvry_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      mbr_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      refill_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      daw_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      days_sply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)      drg_qty = NULL("") /*DECIMAL(11,3)*/;
  date("YYYYMMDD")("\\x01")      filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)      rx_nbr = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)      awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      wac_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      geap_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_cost_type_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      grp_pln_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_usual_customary_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      family_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      individual_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      ded_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      ben_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      rebate_claims_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)      prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)      refill_max = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)      bin_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      processor_cntrl_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      grp_nbr_submd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      brnd_trade_nm_flag = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=15, sign_reserved)      prc_qty = NULL("") /*DECIMAL(13,3)*/;
  decimal("\\x01",0)      gen_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)      formulary_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)      tier_level = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      grp_clt_ben_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      cust_loc = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      pbr_id_qlfr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      sbm_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      dx_cd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      dx_cd_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)      cms_pbp_id = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)      cms_contract_id = NULL("") /*VARCHAR(5)*/;
  decimal("\\x01",0)      rej_cnt = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)      rsp_msg_1 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)      rsp_msg_2 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)      rsp_msg_3 = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)      adj_rxcount_stnd_days_sply = NULL("") /*INTEGER*/;
  decimal("\\x01",0)      adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_acct_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ben_ded_accum_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      begin_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      end_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rx_origin_cd_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      anda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      tot_covered_drg_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      tot_troop_amt = NULL("") /*DECIMAL(9,2)*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")      sbm_tm = NULL("") /*TIME(6)*/;
  decimal("\\x01",0)      ajc_code_key = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      inn_max_out_of_pocket_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      phr_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      clt_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)      payee_id = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01",0)      contract_pbp_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)      specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01",0)      patient_age = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      zero_balance_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      nat_drg_cd_mfr_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)      subm_clfctn_cd = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0)      mbr_carrier_uid = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      residence_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)      phr_rate = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)      clt_rate = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      clawback_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      super_ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)      tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      awp_unit_cost_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      awp_extended_cost_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      clt_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      clt_formulary_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      formulary_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      risk_pool_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      risk_pool_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      prior_auth_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      prior_auth_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      rxsol_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      rxsol_formulary_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      claim_origination_code_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      claim_origin_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      coverage_lvl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      reversal_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      recent_clm_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      ntpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      origin_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      reported_gap_discount_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)      clt_id = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)      cag_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      mbr_eligty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      mbr_eligty_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      ln_of_buss = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      mbr_dt_of_brth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      phr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      phr_svc_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ben_max_accum_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ben_ded_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      care_ntwrk_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      care_ntwrk_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      clt_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)      clt_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      clt_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      clt_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)      clt_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      clt_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      clt_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      clt_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      clt_prc_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cntngnt_thrpc_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)      cntngnt_thrpy_sched = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      dur_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=18)      dur_key = NULL("") /*VARCHAR(18)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      elig_clfctn_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_acc_benefit_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      frm_mgmt_svcs_tier = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      formulary_prtcol_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)      group_sic = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      hsa_extrct_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_benefit_max_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      accum_oop = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      maint_gpi_list = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      med_ffp_ind_ms_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      med_ffp_ind_px_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      med_ffp_ind_rm_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ndc_list_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      out_of_perd_rvrsl_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      out_of_pocket_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      phr_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      phr_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      phr_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)      phr_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)      phr_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_ntwrk_gpi_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_ntwrk_ndc_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      phr_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      phr_prc_tbl_sched = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      pln_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      pln_fnl_prc_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      pref_prod_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      prc_bsis_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      prod_remb_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      prv_lock_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      prv_lock_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      rgnl_dsstr_ovrd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      trn_ben_ovrd_sched = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      pbr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=16)      submd_rph_id = NULL("") /*VARCHAR(16)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      submd_rph_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      adj_medspn_prod_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      cmpd_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      fda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      medspn_carr_prod_ovrd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      prod_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      tran_add_user_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      adjtd_claim_stat = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")      chg_dttm_tcd = NULL("") /*TIMESTAMP(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      chg_usr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)      claim_ref_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      claim_resp_stat_cd = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")      submd_claim_dttm = NULL("") /*TIMESTAMP(6)*/;
  date("YYYYMMDD")("\\x01")      injury_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      orig_pmt_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      sub_reversal_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      delay_rsn_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      dispng_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      dmr_usr_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)      extr_txn_cntl_nbr = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)      incdnt_id = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01",0)      manl_claim_trk_dt_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)      manl_claim_trk_nbr = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      agcy_nbr = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)      medcd_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      medcd_ind = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)      sbrogtn_tcn = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)      pmt_txn_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      pl_of_svc_submd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)      pror_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      rx_nbr_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      srvc_lvl_of_effrt = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      srvc_lvl_typ = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      subm_clfctn_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      subm_clfctn_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      txn_cd_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      u_c_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      vers_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_defd_fld1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_defd_fld2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      clt_defd_fld3 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      sxc_defd_fld1 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      sxc_defd_fld2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      sxc_defd_fld3 = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01",0)      rdc_ingrd_cost_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)      zro_bal_claims_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      estd_gen_sav = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      basis_of_reim_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_atr_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_incentive_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_other_pmt_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_psc_brnp_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      client_pricing_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_pct_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_flat_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      spclty_phr_corp_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      spclty_phr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      clt_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      mail_ordr_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      retl_90_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      mail_ordr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_amt_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_copay_flat_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_copay_pct_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      phr_prc_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      phr_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      mail_ordr_cntr = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      retl_90_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      post_adjud_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      post_adjud_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      subm_yr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)      care_fac_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      subm_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)      subm_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01",0)      filled_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)      filled_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rvrsl_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_remn_ben = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_remn_ded = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_ingrd_cost_cntrctd_remb = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_ppay_amt_psc_brnd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      subm_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      subm_mcd_pd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      subm_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      subm_oth_covrg_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      subm_oth_payr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      cmpo_last_seq = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)      corp_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)      rptg_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  decimal("\\x01",0)      brnd_bsis_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      rebill_cost_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      rebill_cost_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      rebill_cost_typ_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_dispng_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)      rebill_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  decimal("\\x01",0)      rebill_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      rebill_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      rebill_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_incent_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_ingrd_cost_pd = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)      rebill_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)      rebill_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      rebill_prc_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_sls_tax_pd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rebill_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      msg_cd_1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      msg_cd_2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      msg_cd_3 = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)      rebill_drug_cost_percent = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      acct_benefit_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")      birth_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_atr_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cal_cost_src_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_cov_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_dsp_fee_c_r_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_exc_benefit_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_flat_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_flat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_ingred_cost_con_reimb_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_per_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_plan_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_perc_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_tot_other_amt = NULL("") /*DECIMAL(9,2)*/;
  date("YYYYMMDD")("\\x01")      chg_date = NULL("") /*DATE*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")      chg_time = NULL("") /*TIME(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)      cfi_csg_client_seg_cd = NULL("") /*VARCHAR(3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      drug_conflict_1_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      drug_conflict_2_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      drug_conflict_3_cd = NULL("") /*VARCHAR(2)*/;
  date("YYYYMMDD")("\\x01")      prev_fill_1_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      prev_fill_2_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      prev_fill_3_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      fam_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ind_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      life_benefit_max_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      life_benefit_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      life_benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      oop_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      oop_sched_used_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)      ptnt_first_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)      ptnt_last_nm = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      flat_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      price_tbl_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      atr_priv_ntw_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      atr_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      atr_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      pln_formulary = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      final_price_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      prior_auth_used_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")      prior_auth_from_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")      prior_auth_thru_dt = NULL("") /*DATE*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)      prev_fill_1_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)      prev_fill_2_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)      prev_fill_3_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_atr_priv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_atr_ppay_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      reversal_dur_conflict_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      reversal_dur_intrv_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      reversal_dur_outcm_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      qual_serv_prov_id = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      spend_acct_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      mbr_pln = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cob_extract_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      sbm_unit_dose_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      tcd_sbm_perct_salestax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      prim_pbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      prim_pbr_mid_init = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)      prim_pbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      mbr_prim_pbr_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)      prim_pbr_state = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      sbm_clarfctn_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cal_admin_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_cvg_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_proc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_dispensing_fee_cont = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_atr_sales_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      pst_cost_source_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_other_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_prvd_ntwk_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_psc_npfm_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_ingred_ctd_reim_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      pst_psc_brand_npfm_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_ctd_reim_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      rsp_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      benchmrk_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0)      prorated_days_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=16, sign_reserved)      metric_nbr_qty = NULL("") /*DECIMAL(14,3)*/;
  decimal("\\x01",0)      rej_cd4_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd5_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd6_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd7_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd8_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd9_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      rej_cd10_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drg_coverage_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cpp_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      prior_pbm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      non_rxclaim_adj_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      orx_dispensed_ind = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)      dlvry_chanl = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)      awp_flg = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_intgr_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      pdt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      subm_prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)      subm_prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)      mbr_prior_auth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)      drg_spend_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)      troop_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      oop_applied_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      day_90_prog_type = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      day_90_retail_prog_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      copay_category_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      care_fac_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)      src_env_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01")   /*Folowing Fields have been added for inclusion of CDUR [ Overrides and Events] : 20160804
decimal("\\x01",0) sbm_yr = NULL("") INTEGER;
decimal("\\x01".2, maximum_length=11, sign_reserved) clr_ingred_cost_paid DECIMAL(9,2) NOT NULL;
decimal("\\x01".2, maximum_length=11, sign_reserved) clr_dispensing_fee DECIMAL(9,2) NOT NULL;
decimal("\\x01".2, maximum_length=11, sign_reserved) clr_sales_tax_paid DECIMAL(9,2) NOT NULL;
decimal("\\x01".2, maximum_length=11, sign_reserved) clr_patient_pay_amt DECIMAL(9,2) NOT NULL;
decimal("\\x01".2, maximum_length=11, sign_reserved) clr_due_amt DECIMAL(9,2) NOT NULL;
decimal("\\x01",0) days_of_supply SMALLINT NOT NULL;
decimal("\\x01".3, maximum_length=13, sign_reserved) drug_quantity DECIMAL(11,3) NOT NULL;
decimal("\\x01",0) cnflct_prod_sk = NULL("") BIGINT;
string("\\x01",charset="iso-8859-15", maximum_length=40) dur_msg = NULL("") VARCHAR(40);

Following field is added for history processing of OLR and ORCHARD
DATE*/    ids_file_dt = NULL("");
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
  end d_carrier;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
  end d_carr_acct;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
  end d_cag;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(20)*/;
  end d_mbr;
  record
    date("YYYYMMDD")("\\x01")  cal_day_dt = NULL("") /*DATE*/;
  end d_sbm_dt;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=6)  pbr_spclty_cd = NULL("") /*VARCHAR(6)*/;
  end pbr_spclty;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=15)  pcp_id = NULL("") /*VARCHAR(15) NOT NULL*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  pcp_specialty_id = NULL("") /*VARCHAR(6) NOT NULL*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end prim_pcp;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  custom_client_ind = NULL("") /*CHAR(1)*/;
  end cst_clnt_ind;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=12)  phr_id = NULL("") /*VARCHAR(12) NOT NULL*/;
  end pharmacy;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  gender_cd = NULL("") /*CHAR(1)*/;
  end gender;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  drg_nm_extn_id = NULL("") /*VARCHAR(10)*/;
  end drug;
  record
    decimal("\\x01",0)  age = NULL("") /*SMALLINT*/;
  end age_bnd;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  state_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  end phr_state;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  relationship_cd = NULL("") /*CHAR(1)*/;
  end l_relnshp;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  fmly_type_cd = NULL("") /*CHAR(1)*/;
  end fmly_typ;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=12)  phr_pmt_cntr_id = NULL("") /*VARCHAR(12)*/;
  end phr_pmt_cntr;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=20)  prod_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  end prod;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_afflt_cd = NULL("") /*VARCHAR(6)*/;
  end prscrbr_affl;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=8)  ahfs_cd = NULL("") /*VARCHAR(8)*/;
  end ahfs_cd;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  cost_basis_cd = NULL("") /*VARCHAR(2)*/;
  end cost_basis;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  cost_type_cd = NULL("") /*VARCHAR(10)*/;
  end cost_type;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drug_rx_otc_ind = NULL("") /*CHAR(1)*/;
  end drug_rx_otc;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drug_maint_cd = NULL("") /*CHAR(1)*/;
  end drug_maint;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_cd = NULL("") /*VARCHAR(10)*/;
    date("YYYYMMDD")("\\x01")  pln_eff_dt = NULL("") /*DATE*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT NOT NULL*/;
  end final_pln;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  admin_rte_id = NULL("") /*VARCHAR(2)*/;
  end admin_rte;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  cob_ind = NULL("") /*VARCHAR(2)*/;
  end cob_in;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=14)  gpi_id = NULL("") /*VARCHAR(14)*/;
  end gpi;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  gnrc_mdspn_ind = NULL("") /*CHAR(1)*/;
  end gnrc_mdspn;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  gnrc_mdspn_ind = NULL("") /*CHAR(1)*/;
  end gnrc_in;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  location_cd = NULL("") /*VARCHAR(2)*/;
  end location;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  client_benefit_cd = NULL("") /*VARCHAR(10)*/;
  end client_benefit;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  dea_cd = NULL("") /*VARCHAR(2)*/;
  end dea;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  daw_cd = NULL("") /*CHAR(1)*/;
  end daw;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  claim_stat_id = NULL("") /*CHAR(1)*/;
  end clm_stat;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  compound_cd = NULL("") /*CHAR(1)*/;
  end compound;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  pln_drg_stat_cd = NULL("") /*CHAR(1)*/;
  end pln_drg_stat;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd1;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd2;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd3;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
  end org_carrier;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(20)*/;
  end org_mbr;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
  end org_cag;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  clam_origin_cd = NULL("") /*CHAR(1)*/;
  end rx_org;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  price_src_cd = NULL("") /*CHAR(1)*/;
  end phr_prc;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    decimal("\\x01",0)  sequence_no = NULL("") /*INTEGER*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  plan_cd = NULL("") /*VARCHAR(10)*/;
  end cntrct_pbp;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=2)  residence_cd = NULL("") /*VARCHAR(2)*/;
  end res_cd;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  clawback_stat_cd = NULL("") /*CHAR(1)*/;
  end clawback;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  dmr_ind = NULL("") /*CHAR(1)*/;
  end dmr_ind;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  injectable_ind = NULL /*CHAR(1) NOT NULL*/;
  end injct_ind;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  formulary_id = NULL("") /*CHAR(1)*/;
  end frmlry;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  prior_auth_id = NULL("") /*CHAR(1)*/;
  end prior_auth;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  risk_pool_id = NULL("") /*CHAR(1)*/;
  end risk_pool;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  rxsol_formulary_id = NULL /*CHAR(1) NOT NULL*/;
  end rxsol_frmlry;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  clam_origin_cd = NULL("") /*CHAR(1)*/;
  end clm_orgn_cd;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  employer_group_id = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=50)  client_id = NULL("") /*VARCHAR(50)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  client_rgn_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  client_seg_cd = NULL("") /*VARCHAR(3)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_cag_adj;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(20)*/;
    decimal("\\x01",0)  mast_prsn_id = NULL("") /*BIGINT*/;
    string("\\x01",charset="iso-8859-15", maximum_length=50)  clt_id = NULL("") /*VARCHAR(50)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_alt_ins_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  mbr_alt_ins_id = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_alt_ins_mbr_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  mbr_ssn_nbr = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_supp_id1 = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  mbr_supp_id1_typ = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_supp_id2 = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  mbr_supp_id2_typ = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_age_band = NULL("") /*CHAR(1)*/;
    decimal("\\x01",0)  mbr_calc_age = NULL("") /*SMALLINT*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_cdhldr = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  mbr_clsfctn1 = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  mbr_clsfctn2 = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_clsfctn3 = NULL("") /*CHAR(1)*/;
    date("YYYYMMDD")("\\x01")  mbr_dt_of_brth = NULL("") /*DATE*/;
    string("\\x01",charset="iso-8859-15", maximum_length=11)  mbr_hic_cd = NULL("") /*VARCHAR(11)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id_encrpd = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  mbr_first_nm = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=25)  mbr_last_nm = NULL("") /*VARCHAR(25)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_mid_init_nm = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  mbr_prsn_cd = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_relshp_cd = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  mbr_rdr = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_sex = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  mbr_zip = NULL("") /*VARCHAR(15)*/;
    date("YYYYMMDD")("\\x01")  mbr_mcre_covrg_from_dt = NULL("") /*DATE*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_mcre_covrg_typ = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_fam_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_fam_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  mbr_fam_typ_cd = NULL("") /*CHAR(1)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_mem_adj;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(18)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  clt_prod_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  clt_rdr_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_cd = NULL("") /*VARCHAR(10)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_mbr_elgt;
  record
    date("YYYYMMDD")("\\x01")  cal_day_dt = NULL("") /*DATE*/;
  end mbr_dob;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=15)  submd_phr_id = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  submd_phr_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  rslvd_phr_id = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  rslvd_phr_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=12)  phr_ncpdp_id = NULL("") /*VARCHAR(12)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  phr_npi_no = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=55)  phr_nm = NULL("") /*VARCHAR(55)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_ntwrk_id = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=25)  phr_ntwrk_nm = NULL("") /*VARCHAR(25)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  phr_ntwrk_prity_cd = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  phr_ntwrk_qlfr_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  phr_ntwrk_typ_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=9)  phr_ntwrk_carr_nm = NULL("") /*VARCHAR(9)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  phr_ntwrk_prcs_qlfr_ind = NULL("") /*CHAR(1)*/;
    decimal("\\x01",0)  phr_ntwrk_seq_no = NULL("") /*INTEGER*/;
    string("\\x01",charset="iso-8859-15", maximum_length=9)  phr_super_carr_nm = NULL("") /*VARCHAR(9)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  phr_super_ntwrk_typ_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_super_ntwrk_id = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_affl_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=35)  phr_affl_nm = NULL("") /*VARCHAR(35)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=12)  phr_pmt_centr_nm = NULL("") /*VARCHAR(12)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  phr_rgn_nm = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_prnt_org_nm = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  phr_ntwrk_clsfctn_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  phr_zip_cd = NULL("") /*VARCHAR(15)*/;
  end d_phrm_adj;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_cd = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_cd_fnl = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=8)  pln_typ_id = NULL("") /*VARCHAR(8)*/;
    date("YYYYMMDD")("\\x01")  pln_fnl_eff_dt = NULL("") /*DATE*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_gpi_list = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_grp_cd = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_ndc_list = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_pref_gpi_list_nm = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_pref_ndc_list_nm = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pln_qlfr = NULL("") /*VARCHAR(10)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_pln_adjd;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=15)  pbr_id = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=15)  pbr_dea_id = NULL("") /*VARCHAR(15)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  pbr_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  pbr_id_st_cd = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  pbr_npi = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=25)  pbr_first_nm = NULL("") /*VARCHAR(25)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  pbr_mid_init_nm = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=35)  pbr_last_nm = NULL("") /*VARCHAR(35)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  pbr_spclty_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  pbr_spclty_cd_qlfr_cd = NULL("") /*VARCHAR(3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  pbr_ntwrk_id = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=3)  pbr_st_cd = NULL("") /*VARCHAR(3)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_pres_adjud;
  record
    date("YYYYMMDD")("\\x01")  cal_day_dt = NULL("") /*DATE*/;
  end manl_claim_trk;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=20)  prod_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  prod_id_qlfr = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=70)  prod_nm = NULL("") /*VARCHAR(70)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=8)  ahfs_cd = NULL("") /*VARCHAR(8)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=11)  drg_admin_rte_hitsb_desc = NULL("") /*VARCHAR(11)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=4)  drg_clsfctn_cd = NULL("") /*VARCHAR(4)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_dea_cd = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=80)  drg_drg_intrctn_desc = NULL("") /*VARCHAR(80)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  drg_grp_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  drg_lbl_nm = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_maint_cd = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_maint_src = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  drg_mfrr_nm = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=5)  drg_ndc_lblr_cd = NULL("") /*VARCHAR(5)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  drg_ndc_pkg_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=4)  drg_ndc_prod_cd = NULL("") /*VARCHAR(4)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=11)  drg_ndc_id = NULL("") /*VARCHAR(11)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_rx_otc_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=13)  drg_stat_cd = NULL("") /*VARCHAR(13)*/;
    decimal("\\x01".3, maximum_length=13, sign_reserved)  drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  drg_sub_class_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
    decimal("\\x01",0)  gcn_no = NULL("") /*INTEGER*/;
    decimal("\\x01",0)  gcn_seq_no = NULL("") /*INTEGER*/;
    string("\\x01",charset="iso-8859-15", maximum_length=60)  gen_nm = NULL("") /*VARCHAR(60)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  gen_medspn_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  gen_ind_ovrd_ind = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  gpi_list_qlfr_nm = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=14)  gpi_no = NULL("") /*VARCHAR(14)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  drg_grp_gpi_02_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=4)  drg_class_gpi_04_cd = NULL("") /*VARCHAR(4)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=6)  drg_sub_class_gpi_06_cd = NULL("") /*VARCHAR(6)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=8)  drg_bsic_nm_gpi_08_cd = NULL("") /*VARCHAR(8)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  drg_extd_nm_gpi_10_cd = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=12)  drg_dosag_frm_gpi_12_cd = NULL("") /*VARCHAR(12)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=80)  dise_cat_nm = NULL("") /*VARCHAR(80)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=80)  thrpc_class_nm = NULL("") /*VARCHAR(80)*/;
    decimal("\\x01".5, maximum_length=15, sign_reserved)  wac_amt = NULL("") /*DECIMAL(13,5)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=13)  wkrs_comp_alt_prod_cd = NULL("") /*VARCHAR(13)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=1)  wkrs_comp_alt_prod_typ_cd = NULL("") /*CHAR(1)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  prod_pref_list_id = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)  admin_rte_cd = NULL("") /*VARCHAR(2)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=4)  dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  end d_prod_adj;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  care_fac_id = NULL("") /*VARCHAR(10)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=25)  care_fac_nm = NULL("") /*VARCHAR(25)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=50)  clt_id = NULL("") /*VARCHAR(50)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end d_cr_fc_adj;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  brand_generic_cd = NULL("") /*CHAR(1)*/;
  end brnd_bsis;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=4)  dsg_frm_id = NULL("") /*VARCHAR(4)*/;
  end dsg_frm;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd4;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd5;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd6;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd7;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd8;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd9;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=3)  rej_cd = NULL("") /*VARCHAR(3)*/;
  end rej_cd10;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  brand_generic_cd = NULL("") /*CHAR(1)*/;
  end ajc_cd_key;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_super_ntwrk_id = NULL("") /*VARCHAR(6)*/;
  end super_netwrk;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  benefit_phase_cd = NULL("") /*CHAR(1)*/;
  end bgn_bnft_phase;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  benefit_phase_cd = NULL("") /*CHAR(1)*/;
  end end_bnft_phase;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  price_src_cd = NULL("") /*CHAR(1)*/;
  end clt_prc_src;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=10)  client_price_type = NULL("") /*VARCHAR(10)*/;
  end l_clt_prc_typ;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(20)*/;
    decimal("\\x01",0)  seq_nbr = NULL("") /*INTEGER*/;
  end mbr_eligibilty;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=1)  hm_dlvry_ind = NULL("") /*CHAR(1) NOT NULL*/;
  end mail_srvc;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=30)  employer_group_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=20)  mbr_id = NULL("") /*VARCHAR(18)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=11)  prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  end mbr_prior_auth;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=6)  phr_ntwrk_id = NULL("") /*VARCHAR(6)*/;
    decimal("\\x01",0)  phr_ntwrk_seq_no = NULL("") /*INTEGER*/;
  end netwrk;
  record
    string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=10)  care_fac_id = NULL("") /*VARCHAR(10) NOT NULL*/;
    decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT NOT NULL*/;
  end d_cr_fc;
  datetime("YYYYMMDDHH24MISS")("\\x01")  ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)  ids_create_uid = NULL("");
  decimal("\\x01", maximum_length=20)  ids_create_run_id =  0;
  datetime("YYYYMMDDHH24MISS")("\\x01")  ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)  ids_updt_uid = NULL("");
  decimal("\\x01", maximum_length=20)  ids_updt_run_id =  0;
  string("\\x01", maximum_length=2)  ids_rec_stat_cd = NULL("");
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
}}@0|@117000|174500|0|0|0|0|17847|Suppressed file|Ab Initio Software|@1|10000|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|96|0|258|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|97|0|261|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|98|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|99|0|273|0|{@{}@{1|7890660|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_18|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_19|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_8|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_9|}1|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Filter_by_Expression|}1|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|14|0|28|0|{0|}14|7|}
{2010212001|XXGvertex_oport_oport|15|0|29|0|{1|deselect|}13|15|}
{2010213001|XXGoport_dst_flow|16|0|31|0|{0|}15|5|}
{2010212001|XXGvertex_oport_oport|17|0|32|0|{2|reject|}13|16|}
{2010212001|XXGvertex_oport_oport|18|0|34|0|{3|error|}13|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{4|log|}13|18|}
{2010211001|XXGvertex_iport_iport|20|0|38|0|{0|in|}13|19|}
{2010214001|XXGiport_src_flow|21|0|40|0|{0|}19|6|}
{2010007001|XXGobject_proto_object|22|0|41|0|{}13|20|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{0|out|}20|21|}
{2010006001|XXGobject_psameas_object|24|0|45|0|{metadata|out_metadata|1|0|}21|20|}
{2010212001|XXGvertex_oport_oport|25|0|46|0|{1|deselect|}20|22|}
{2010006001|XXGobject_psameas_object|26|0|48|0|{metadata|deselect_metadata|1|0|}22|20|}
{2010212001|XXGvertex_oport_oport|27|0|49|0|{2|reject|}20|23|}
{2010006001|XXGobject_psameas_object|28|0|51|0|{metadata|reject_metadata|1|0|}23|20|}
{2010212001|XXGvertex_oport_oport|29|0|52|0|{3|error|}20|24|}
{2010006001|XXGobject_psameas_object|30|0|54|0|{metadata|error_metadata|1|0|}24|20|}
{2010212001|XXGvertex_oport_oport|31|0|55|0|{4|log|}20|25|}
{2010006001|XXGobject_psameas_object|32|0|57|0|{metadata|log_metadata|1|0|}25|20|}
{2010211001|XXGvertex_iport_iport|33|0|58|0|{0|in|}20|26|}
{2010006001|XXGobject_psameas_object|34|0|60|0|{metadata|in_metadata|1|0|}26|20|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{Layout|Layout|0|0|}13|27|}
{2010211001|XXGvertex_iport_iport|36|0|63|0|{0|write|}27|28|}
{2010214001|XXGiport_src_flow|37|0|65|0|{0|}28|5|}
{2010007001|XXGobject_proto_object|38|0|66|0|{}27|29|}
{2010211001|XXGvertex_iport_iport|39|0|68|0|{0|write|}29|30|}
{2010006001|XXGobject_psameas_object|40|0|70|0|{metadata|write_metadata|1|0|}30|29|}
{2010006001|XXGobject_psameas_object|41|0|71|0|{write_metadata|read_metadata|0|0|}27|31|}
{2010212001|XXGvertex_oport_oport|42|0|73|0|{0|read|}31|32|}
{2010213001|XXGoport_dst_flow|43|0|75|0|{0|}32|6|}
{2010007001|XXGobject_proto_object|44|0|76|0|{}31|33|}
{2010212001|XXGvertex_oport_oport|45|0|78|0|{0|read|}33|34|}
{2010006001|XXGobject_psameas_object|46|0|80|0|{metadata|read_metadata|1|0|}34|33|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{deselect_metadata|read_metadata|0|0|}13|31|}
{2010006001|XXGobject_psameas_object|48|0|82|0|{in_metadata|read_metadata|0|0|}13|31|}
{2010006001|XXGobject_psameas_object|49|0|83|0|{out_metadata|read_metadata|0|0|}13|31|}
{2010006001|XXGobject_psameas_object|50|0|84|0|{reject_metadata|read_metadata|0|0|}13|31|}
{2010601001|XXGgraph_vertex_vertex|51|0|85|0|{IDS_ICFF|}1|35|}
{2010211001|XXGvertex_iport_iport|52|0|87|0|{0|write|}35|36|}
{2010214001|XXGiport_src_flow|53|0|89|0|{0|}36|10|}
{2010007001|XXGobject_proto_object|54|0|90|0|{}35|37|}
{2010211001|XXGvertex_iport_iport|55|0|92|0|{0|write|}37|38|}
{2010006001|XXGobject_psameas_object|56|0|94|0|{metadata|write_metadata|1|0|}38|37|}
{2010601001|XXGgraph_vertex_vertex|57|0|95|0|{IDS_Index_File|}1|39|}
{2010211001|XXGvertex_iport_iport|58|0|97|0|{0|write|}39|40|}
{2010214001|XXGiport_src_flow|59|0|99|0|{0|}40|9|}
{2010007001|XXGobject_proto_object|60|0|100|0|{}39|41|}
{2010211001|XXGvertex_iport_iport|61|0|102|0|{0|write|}41|42|}
{2010006001|XXGobject_psameas_object|62|0|104|0|{metadata|write_metadata|1|0|}42|41|}
{2010006001|XXGobject_psameas_object|63|0|105|0|{write_metadata|index_metadata|0|0|}39|43|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{0|out|}43|44|}
{2010213001|XXGoport_dst_flow|65|0|109|0|{0|}44|10|}
{2010212001|XXGvertex_oport_oport|66|0|110|0|{1|index|}43|45|}
{2010213001|XXGoport_dst_flow|67|0|112|0|{0|}45|9|}
{2010212001|XXGvertex_oport_oport|68|0|113|0|{2|address|}43|46|}
{2010211001|XXGvertex_iport_iport|69|0|115|0|{0|in|}43|47|}
{2010214001|XXGiport_src_flow|70|0|117|0|{0|}47|8|}
{2010007001|XXGobject_proto_object|71|0|118|0|{}43|48|}
{2010212001|XXGvertex_oport_oport|72|0|120|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|73|0|122|0|{metadata|out_metadata|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|74|0|123|0|{1|index|}48|50|}
{2010006001|XXGobject_psameas_object|75|0|125|0|{metadata|index_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|76|0|126|0|{2|address|}48|51|}
{2010006001|XXGobject_psameas_object|77|0|128|0|{metadata|address_metadata|1|0|}51|48|}
{2010211001|XXGvertex_iport_iport|78|0|129|0|{0|in|}48|52|}
{2010006001|XXGobject_psameas_object|79|0|131|0|{metadata|in_metadata|1|0|}52|48|}
{2010006001|XXGobject_psameas_object|80|0|132|0|{Layout|Layout|0|0|}43|35|}
{2010006001|XXGobject_psameas_object|81|0|133|0|{in_metadata|read_metadata|0|0|}43|31|}
{2010006001|XXGobject_psameas_object|82|0|134|0|{out_metadata|write_metadata|0|0|}43|35|}
{2010601001|XXGgraph_vertex_vertex|83|0|135|0|{PBKS_dxf_hk_part1_|}1|53|}
{2010604001|XXGgraph_flow_flow|84|0|137|0|{Flow_1|}53|54|}
{2010601001|XXGgraph_vertex_vertex|85|0|139|0|{Partition_by_Key|}53|55|}
{2010212001|XXGvertex_oport_oport|86|0|141|0|{0|out|}55|56|}
{2010213001|XXGoport_dst_flow|87|0|143|0|{0|}56|54|}
{2010211001|XXGvertex_iport_iport|88|0|144|0|{0|in|}55|57|}
{2010006001|XXGobject_psameas_object|89|0|146|0|{in_metadata|read_metadata|0|0|}55|31|}
{2010006001|XXGobject_psameas_object|90|0|147|0|{out_metadata|read_metadata|0|0|}55|31|}
{2010601001|XXGgraph_vertex_vertex|91|0|148|0|{Sort|}53|58|}
{2010212001|XXGvertex_oport_oport|92|0|150|0|{0|out|}58|59|}
{2010211001|XXGvertex_iport_iport|93|0|152|0|{0|in|}58|60|}
{2010214001|XXGiport_src_flow|94|0|154|0|{0|}60|54|}
{2010006001|XXGobject_psameas_object|95|0|155|0|{in_metadata|read_metadata|0|0|}58|31|}
{2010006001|XXGobject_psameas_object|96|0|156|0|{out_metadata|read_metadata|0|0|}58|31|}
{2010212001|XXGvertex_oport_oport|97|0|157|0|{0|out0|}53|61|}
{2010216002|XXGoport_binding_oport|98|0|159|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}61|59|}
{2010213001|XXGoport_dst_flow|99|0|160|0|{0|}61|8|}
{2010211001|XXGvertex_iport_iport|100|0|161|0|{0|in0|}53|62|}
{2010215002|XXGiport_binding_iport|101|0|163|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}62|57|}
{2010214001|XXGiport_src_flow|102|0|164|0|{0|}62|7|}
{2010007001|XXGobject_proto_object|103|0|165|0|{}53|63|}
{2010604001|XXGgraph_flow_flow|104|0|167|0|{Flow_1|}63|64|}
{2010601001|XXGgraph_vertex_vertex|105|0|169|0|{Partition_by_Key|}63|65|}
{2010212001|XXGvertex_oport_oport|106|0|171|0|{0|out|}65|66|}
{2010213001|XXGoport_dst_flow|107|0|173|0|{0|}66|64|}
{2010211001|XXGvertex_iport_iport|108|0|174|0|{0|in|}65|67|}
{2010007001|XXGobject_proto_object|109|0|176|0|{}65|68|}
{2010212001|XXGvertex_oport_oport|110|0|178|0|{0|out|}68|69|}
{2010006001|XXGobject_psameas_object|111|0|180|0|{metadata|out_metadata|1|0|}69|68|}
{2010211001|XXGvertex_iport_iport|112|0|181|0|{0|in|}68|70|}
{2010006001|XXGobject_psameas_object|113|0|183|0|{metadata|in_metadata|1|0|}70|68|}
{2010006001|XXGobject_psameas_object|114|0|184|0|{Layout|InputLayout|1|0|}65|63|}
{2010006001|XXGobject_psameas_object|115|0|185|0|{key|Key|1|0|}65|63|}
{2010601001|XXGgraph_vertex_vertex|116|0|186|0|{Sort|}63|71|}
{2010212001|XXGvertex_oport_oport|117|0|188|0|{0|out|}71|72|}
{2010211001|XXGvertex_iport_iport|118|0|190|0|{0|in|}71|73|}
{2010214001|XXGiport_src_flow|119|0|192|0|{0|}73|64|}
{2010007001|XXGobject_proto_object|120|0|193|0|{}71|74|}
{2010212001|XXGvertex_oport_oport|121|0|195|0|{0|out|}74|75|}
{2010006001|XXGobject_psameas_object|122|0|197|0|{metadata|out_metadata|1|0|}75|74|}
{2010211001|XXGvertex_iport_iport|123|0|198|0|{0|in|}74|76|}
{2010006001|XXGobject_psameas_object|124|0|200|0|{metadata|in_metadata|1|0|}76|74|}
{2010006001|XXGobject_psameas_object|125|0|201|0|{Layout|OutputLayout|1|0|}71|63|}
{2010006001|XXGobject_psameas_object|126|0|202|0|{key|Key|1|0|}71|63|}
{2010006001|XXGobject_psameas_object|127|0|203|0|{max_core|Max_core|1|0|}71|63|}
{2010212001|XXGvertex_oport_oport|128|0|204|0|{0|out0|}63|77|}
{2010216002|XXGoport_binding_oport|129|0|206|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}77|72|}
{2010211001|XXGvertex_iport_iport|130|0|207|0|{0|in0|}63|78|}
{2010215002|XXGiport_binding_iport|131|0|209|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}78|67|}
{2010006001|XXGobject_psameas_object|132|0|210|0|{InputLayout|Layout|0|0|}53|27|}
{2010006001|XXGobject_psameas_object|133|0|211|0|{OutputLayout|Layout|0|0|}53|35|}
{2010601001|XXGgraph_vertex_vertex|134|0|212|0|{PROD_XREF_FILE_1|}1|31|}
{2010601001|XXGgraph_vertex_vertex|135|0|213|0|{Reformat|}1|79|}
{2010212001|XXGvertex_oport_oport|136|0|215|0|{0|out0|}79|80|}
{2010213001|XXGoport_dst_flow|137|0|217|0|{0|}80|12|}
{2010212001|XXGvertex_oport_oport|138|0|218|0|{1|reject0|}79|81|}
{2010212001|XXGvertex_oport_oport|139|0|220|0|{2|error0|}79|82|}
{2010212001|XXGvertex_oport_oport|140|0|222|0|{3|log|}79|83|}
{2010211001|XXGvertex_iport_iport|141|0|224|0|{0|in|}79|84|}
{2010214001|XXGiport_src_flow|142|0|226|0|{0|}84|11|}
{2010007001|XXGobject_proto_object|143|0|227|0|{}79|85|}
{2010212001|XXGvertex_oport_oport|144|0|229|0|{0|out0|}85|86|}
{2010006001|XXGobject_psameas_object|145|0|231|0|{metadata|out0_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|146|0|232|0|{transform0|transform0|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|147|0|233|0|{1|reject0|}85|87|}
{2010006001|XXGobject_psameas_object|148|0|235|0|{metadata|reject0_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|149|0|236|0|{2|error0|}85|88|}
{2010006001|XXGobject_psameas_object|150|0|238|0|{metadata|error0_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|151|0|239|0|{3|log|}85|89|}
{2010006001|XXGobject_psameas_object|152|0|241|0|{metadata|log_metadata|1|0|}89|85|}
{2010211001|XXGvertex_iport_iport|153|0|242|0|{0|in|}85|90|}
{2010006001|XXGobject_psameas_object|154|0|244|0|{metadata|in_metadata|1|0|}90|85|}
{2010006001|XXGobject_psameas_object|155|0|245|0|{Layout|Layout|0|0|}79|91|}
{2010211001|XXGvertex_iport_iport|156|0|247|0|{0|write|}91|92|}
{2010214001|XXGiport_src_flow|157|0|249|0|{0|}92|12|}
{2010007001|XXGobject_proto_object|158|0|250|0|{}91|93|}
{2010211001|XXGvertex_iport_iport|159|0|252|0|{0|write|}93|94|}
{2010006001|XXGobject_psameas_object|160|0|254|0|{metadata|write_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|161|0|255|0|{write_metadata|read_metadata|0|0|}91|95|}
{2010212001|XXGvertex_oport_oport|162|0|257|0|{0|read|}95|96|}
{2010213001|XXGoport_dst_flow|163|0|259|0|{0|}96|11|}
{2010007001|XXGobject_proto_object|164|0|260|0|{}95|97|}
{2010212001|XXGvertex_oport_oport|165|0|262|0|{0|read|}97|98|}
{2010006001|XXGobject_psameas_object|166|0|264|0|{metadata|read_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|167|0|265|0|{in_metadata|read_metadata|0|0|}79|95|}
{2010006001|XXGobject_psameas_object|168|0|266|0|{out0_metadata|read_metadata|0|0|}79|95|}
{2010006001|XXGobject_psameas_object|169|0|267|0|{reject0_metadata|read_metadata|0|0|}79|95|}
{2010601001|XXGgraph_vertex_vertex|170|0|268|0|{Reject_File|}1|27|}
{2010601001|XXGgraph_vertex_vertex|171|0|269|0|{Suppressed_file|}1|95|}
{2010601001|XXGgraph_vertex_vertex|172|0|270|0|{Suppressed_file_1|}1|91|}
{2010601001|XXGgraph_vertex_vertex|173|0|271|0|{Write_Block_Compressed_Lookup_dxf_hk_part1|}1|43|}
{2010109001|XXGobject_property_value|174|0|272|0|{0|TrackingThumbprint|72|}1|99|}
