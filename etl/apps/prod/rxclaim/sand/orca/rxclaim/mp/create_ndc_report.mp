@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|762|rel_count|1426|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|20181017000000|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE|$AI_SERIAL/ndc_reports/clean.ndc_algorithm_extract.$\{RUN_ID\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DML|$AI_DML/clean.rboinmfil/clean.ndc_algorithm_extract_normalize.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE||3|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE_DML|$AI_DML/clean.rboinmfil/clean.ndc_algorithm_extract_normalize.dml|3|9|FK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|RUN_TYPE|_GENERIC|3|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|adhoc_ndc_algo_report|gsonar|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1273000|378000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{4|1|1|1|1|}Job 'create_ndc_report' Execution Status Report


Job "create_ndc_report" Execution started at Monday, February 21, 2022 04:21:01
Job completed successfully at Monday, February 21, 2022 04:21:11

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:10
Run performed by user peitukal
Total data moved through all flows: 21674 records (7158166 bytes)
Total CPU time (all processes): 12 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Normal - 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}734|2577|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}732|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}721|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}726|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}727|2065|}}
{2010503005|XXGfvertex|10|0|19|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/raw.rxcui_assignment_ndc_extract.interim.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/raw.rxcui_assignment_ndc_extract.interim.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@1|@948000|275000|0|0|0|0|725|Intermediate File-1|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|11|0|21|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|12|0|24|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|13|0|27|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|14|0|29|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|15|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|16|0|36|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rccmsp_ndc.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rccmsp_ndc.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|$AI_DML/lookup.rxclaim/lookup.rccmsp_ndc.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
}}@0|@1156000|64000|0|0|0|0|729|RCCMSP|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010503005|XXGfvertex|17|0|38|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010503005|XXGfvertex|18|0|40|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE|3|2|$|@{0|}}
}}@0|@39000|275000|0|0|0|0|735|Raw RXCUI With All Elements|Ab Initio Software|@1|1000000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|19|0|42|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|20|0|45|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|21|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|22|0|50|0|{Subgraph created from graph "adhoc_ndc_algo_report"|{}@0|@1088250|252750|0|0|0|0|733|Write Reports-1|gsonar|Created 11/27/2017 1:04:30 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|675000|332000|3|}}
{2010210004|XXGflow|23|0|52|0|{@{}@384|.5|.5|{0|}506|17|}}
{2010210004|XXGflow|24|0|54|0|{@{}@384|.5|.5|{0|}504|529|}}
{2010210004|XXGflow|25|0|56|0|{@{}@384|.5|.5|{0|}480|17|}}
{2010501005|XXGpvertex|26|0|58|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$AI_DML/clean.rboinmfil/report_ready.rxcui_assignment_ndc_extract.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.*::in.*;
out.dxf_src_sys_id::(decimal(""))in.dxf_src_sys_id;
out.rxcui::(decimal(""))in.rxcui;
out.alter_ndc_count::(decimal("")) in.alter_ndc_count;
 out.alter_ndc_claim_count_sum:: (decimal("")) in.alter_ndc_claim_count_sum;
 out.proxy_ndc_count:: (decimal("")) in.proxy_ndc_count;
  out.proxy_ndc_claim_count_sum::(decimal("")) in.proxy_ndc_claim_count_sum;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|40000|191500|0|0|0|0|481|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|27|0|60|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|28|0|63|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|29|0|65|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|30|0|67|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|69|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|32|0|71|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|33|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|34|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|35|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|36|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|37|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|38|0|89|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
 
    out.line :: string_concat(in.dxf_src_sys_id,",Source Environment,Alt NDC List Name,Proxy Ndc,Alternate Ndc,RXCUI,RXCUI Type Code,MSC,Active Ind , Part D Ind, Eff Dt, Term Dt,ND1 NDC List Name,Proxy NDC Lable Name,NDC List Disc,Alt NDC Count,Alt NDC Claim Count,Unit Cost Amt,Claim qty Percent,Claim qty cuml Percentage,Weight mean all Awp,Threshold Price,Threshold Price Percent,Weighted std dev,Threshold Price Ind,First rec Price,Second rec Price,all Awp ceil,final Price,Package Size,UOM,Description,QTY,Total QTY");
end;|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|563000|104000|0|0|0|0|673|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|39|0|91|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|40|0|93|0|{@{}@384|.5|.5|{0|}672|1041|}}
{2010203004|XXGoport|41|0|95|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|42|0|97|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|99|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|101|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|45|0|103|0|{@{}@384|.5|.5|{0|}671|17|}}
{2010501005|XXGpvertex|46|0|105|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|47|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|48|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|122|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
  string(3)  dxf_src_sys_id ;
  string("\\x01", maximum_length=30)  rxt_src_envrt_nm = NULL("");
  string("\\x01", maximum_length=10) awx9vg= NULL(""); //from rccpdp
  string(unsigned integer(1),maximum_length=11)  proxy_ndc /*CHAR(11) NOT NULL*/; //RCND2P
  string(unsigned integer(1),maximum_length=11)  altr_ndc /*CHAR(11) NOT NULL*/;
  string(8)  rxcui /*INTEGER NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  rxcui_type_cd /*CHAR(1) NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  msc /*CHAR(1) NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  active_ind /*CHAR(1) NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  partd_ind /*CHAR(1) NOT NULL*/;
  date("YYYY-MM-DD")  eff_dt /*DATE NOT NULL*/;
  date("YYYY-MM-DD")  term_dt /*DATE NOT NULL*/;
  string("\\x01", maximum_length=10) afq7hb = NULL("");//ND1 NDC List Name
  string("\\x01", maximum_length=30) aftwig = NULL("");  // Proxy NDC Lable Name 
  string("\\x01", maximum_length=25) aetvig = NULL("");//from rcnd1p  NDC List Disc
  string(8) alter_ndc_count;
  decimal("\\x01") claim_count=0;
  decimal("\\x01".5, maximum_length=15, sign_reserved) unit_cost_amt = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".11) claim_qty_percent=0;
  decimal("\\x01".11) claim_qty_cuml_percentage=0;
  decimal("\\x01".11) weight_mean_all_awp=0;
  decimal("\\x01".11) threshold_price=0;
  decimal("\\x01".11) threshold_price_percent=0;
  decimal("\\x01".11) weighted_std_dev=0;
  string(1) threshold_price_ind= NULL("");
  decimal("\\x01".11) first_rec_price=0;
  decimal("\\x01".11) second_rec_price=0;
  decimal("\\x01".11) all_awp_ceil=0;
  decimal("\\x01".11) final_price=0;  
  decimal("\\x01".3, maximum_length=11) package_size = NULL("");
  string("\\x01", maximum_length=2) alt_ndc_uom = NULL("");
  string("\\x01", maximum_length=10) alt_ndc_desc = NULL("");
  decimal("\\x01",0, maximum_length=6) qty = NULL("");
  decimal("\\x01".3, maximum_length=15) total_qty = NULL("");
  string("\\n") newline='\\n';
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform0|type src_env=record
string(3) id;
string(6) name;
end;
/*Reformat operation*/


out::reformat(in)=
begin



let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];


out.rxt_src_envrt_nm::string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id in.dxf_src_sys_id name ""],\{id\})].name);
out.*::in.*;


end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|245000|200000|0|0|0|0|676|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|53|0|124|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|54|0|126|0|{@{}@384|.5|.5|{0|}675|17|}}
{2010203004|XXGoport|55|0|128|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|56|0|130|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|57|0|132|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|134|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|59|0|136|0|{@{}@384|.5|.5|{0|}674|17|}}
{2010501005|XXGpvertex|60|0|138|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|61|0|140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|62|0|144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|63|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|65|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|66|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Write Separated Values|571000|272000|0|0|0|0|679|Write Separated Values-1|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|67|0|161|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|68|0|163|0|{@{}@384|.5|.5|{0|}678|1041|}}
{2010202004|XXGiport|69|0|165|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010210004|XXGflow|70|0|167|0|{@{}@384|.5|.5|{0|}677|17|}}
{2010501005|XXGpvertex|71|0|169|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|72|0|171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|73|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|74|0|182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|236000|207500|0|0|0|0|449|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|75|0|184|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|76|0|188|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|77|0|191|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|78|0|193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|79|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|80|0|202|0|{Subgraph created from graph "adhoc_ndc_algo_report"|{}@0|@434000|170500|0|0|0|0|505|wmf:write report combined|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1122000|454000|7|}}
{2010210004|XXGflow|81|0|206|0|{@{}@384|.5|.5|{0|}680|17|}}
{2010501005|XXGpvertex|82|0|212|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Concatenate|798000|215000|0|0|0|0|659|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|83|0|214|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|84|0|217|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|85|0|221|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|87|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|88|0|233|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|457000|210000|0|0|0|0|651|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|89|0|235|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|90|0|239|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|91|0|242|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|92|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|93|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|94|0|254|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; awx9vg; proxy_ndc; unit_cost_amt\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|66000|200000|0|0|0|0|524|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|95|0|256|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|96|0|259|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|97|0|261|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|98|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|99|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|100|0|272|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;

/*extract filename from input record*/
filename::get_filename(in)=
begin




//let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];
let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

let src_env_name=string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name);



filename::"$\{AI_SERIAL\}"+"/ndc_reports/ALT_NDC_COMBINED_REPORT_"+src_env_name+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;


/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::string_substring(in.line,5,string_length(in.line));
end;|3|3|c|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Write Multiple Files|944500|185000|0|0|0|0|681|Write Multiple Files-3|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|101|0|274|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|102|0|276|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|103|0|278|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|280|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|283|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|107|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|108|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|109|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|110|0|301|0|{@{}@0|0|0|0|in0|.531317494600432|@@@13840|0|}}
{2010600005|XXGgraph|111|0|305|0|{Subgraph created from graph "adhoc_ndc_algo_report"|{}@0|@432500|25000|0|0|0|0|507|wmf:write report src_env seperated|gsonar|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|977000|920000|7|}}
{2010210004|XXGflow|112|0|307|0|{@{}@384|.5|.5|{0|}852|17|}}
{2010210004|XXGflow|113|0|309|0|{@{}@384|.5|.5|{0|}919|529|}}
{2010243001|XXGwatcher|114|0|311|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|115|0|313|0|{@{}@384|.5|.5|{0|}853|17|}}
{2010210004|XXGflow|116|0|315|0|{@{}@384|.5|.5|{0|}913|17|}}
{2010210004|XXGflow|117|0|317|0|{@{}@384|.5|.5|{0|}915|17|}}
{2010210004|XXGflow|118|0|319|0|{@{}@384|.5|.5|{0|}917|529|}}
{2010600005|XXGgraph|119|0|321|0|{Subgraph created from graph "wmf:write report src_env seperated"|{}@0|@577500|632500|0|0|0|0|920|Brand Price Level Report|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|629000|389000|7|}}
{2010210004|XXGflow|120|0|323|0|{@{}@384|.5|.5|{0|}601|529|}}
{2010210004|XXGflow|121|0|325|0|{@{}@384|.5|.5|{0|}580|529|}}
{2010210004|XXGflow|122|0|327|0|{@{}@384|.5|.5|{0|}579|529|}}
{2010210004|XXGflow|123|0|329|0|{@{}@384|.5|.5|{0|}600|529|}}
{2010210004|XXGflow|124|0|331|0|{@{}@384|.5|.5|{0|}598|17|}}
{2010243001|XXGwatcher|125|0|333|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|126|0|335|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$AI_DML/report/ndc.brand_price_level_report.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.dxf_src_sys_id::(decimal(""))in.dxf_src_sys_id;
out.ndc_list_id::string_repad(string_ltrim(in.awx9vg),10,' ');
out.claim_qty::in.claim_count;
out.percentage::string_substring(in.claim_qty_cuml_percentage,1,4);
out.curr_map_awp_prc::in.unit_cost_amt;
out.representative_ndc::in.altr_ndc;
out.proxy_ndc_nbr::in.proxy_ndc;
out.proxy_ndc_lbl_nm::in.aftwig;
out.*::in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|50000|181500|0|0|0|0|599|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|127|0|337|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|128|0|340|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|129|0|342|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|130|0|344|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|131|0|346|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|132|0|348|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|133|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|134|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|135|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|136|0|360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|137|0|363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|138|0|366|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/processed/BRAND_PRICE_LEVEL_REPORT_DUPLICATES_$RUN_ID.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/processed/BRAND_PRICE_LEVEL_REPORT_DUPLICATES_$RUN_ID.txt|3|2|$|@{0|}}
}}@2|@432000|70000|0|0|0|0|729|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|139|0|368|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|140|0|370|0|{@{}@384|.5|.5|{0|}733|17|}}
{2010503005|XXGfvertex|141|0|372|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|142|0|374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|143|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|275000|195000|0|0|0|0|488|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|144|0|382|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|145|0|388|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|146|0|391|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|147|0|393|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|148|0|396|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|149|0|402|0|{Subgraph created from graph "Brand Price Level Report"|{}@0|@433000|61500|0|0|0|0|581|reports with duplicates|gsonar|@1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|531000|328000|7|}}
{2010210004|XXGflow|150|0|404|0|{@{}@384|.5|.5|{0|}558|17|}}
{2010210004|XXGflow|151|0|406|0|{@{}@384|.5|.5|{0|}565|17|}}
{2010210004|XXGflow|152|0|408|0|{@{}@384|.5|.5|{0|}563|17|}}
{2010501005|XXGpvertex|153|0|410|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Do computation*/
out::rollup(in)=
begin
out.line::in.dxf_src_sys_id;
end;|3|1|l|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|64000|42000|0|0|0|0|560|Rollup-2|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|154|0|412|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|155|0|415|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|156|0|417|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|157|0|419|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|158|0|421|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|423|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|160|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|161|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|162|0|431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|163|0|434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|164|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|165|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(6) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[6] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/BRAND_PRICE_LEVEL_REPORT_WITH_DUPLICATES_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::"NDC List Id,Proxy NDC Number,Proxy NDC Label Name,Current Mapped AWP Price,Claim Quantity,Cumulative Claim Quantity Percentage,Representative NDC";
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|record
string("\\n") line;
end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|permissions|744|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|259000|30000|0|0|0|0|566|Write Multiple Files-4|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|166|0|444|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|167|0|446|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|168|0|448|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|169|0|450|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|453|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|171|0|455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|172|0|458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|175|0|470|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{proxy_ndc_nbr; curr_map_awp_prc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|40000|177000|0|0|0|0|544|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|176|0|472|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|177|0|475|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|178|0|477|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|179|0|479|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|180|0|482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|181|0|489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(6) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[6] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/BRAND_PRICE_LEVEL_REPORT_WITH_DUPLICATES_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::string_substring(in.line,5,string_length(in.line));
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Write Multiple Files|344000|165000|0|0|0|0|564|Write Multiple Files-5|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|182|0|491|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|183|0|493|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|184|0|495|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|185|0|497|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|186|0|500|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|187|0|502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|188|0|505|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|189|0|508|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|190|0|511|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|191|0|515|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Write Separated Values|182000|157000|0|0|0|0|559|Write Separated Values-2|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|192|0|517|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|193|0|520|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|194|0|523|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|195|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|196|0|528|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|197|0|535|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|198|0|539|0|{@{}@0|0|0|0|in1|0.0|@@@9744|0|}}
{2010600005|XXGgraph|199|0|543|0|{Subgraph created from graph "Brand Price Level Report"|{}@0|@440250|216500|0|0|0|0|602|reports without duplicates|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1038000|328000|7|}}
{2010210004|XXGflow|200|0|545|0|{@{}@384|.5|.5|{0|}633|17|}}
{2010243001|XXGwatcher|201|0|547|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|202|0|549|0|{@{}@384|.5|.5|{0|}643|17|}}
{2010210004|XXGflow|203|0|551|0|{@{}@384|.5|.5|{0|}635|17|}}
{2010210004|XXGflow|204|0|553|0|{@{}@384|.5|.5|{0|}641|17|}}
{2010501005|XXGpvertex|205|0|555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Do computation*/
out::rollup(in)=
begin
out.line::in.dxf_src_sys_id;
end;|3|1|l|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|319500|42000|0|0|0|0|632|Rollup-3|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|206|0|557|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|207|0|560|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|208|0|562|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|209|0|564|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|210|0|566|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|211|0|568|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|212|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|213|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|214|0|576|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|215|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|216|0|582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|217|0|587|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



//let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];
let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/BRAND_PRICE_LEVEL_REPORT_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::"NDC List Id,Proxy NDC Number,Proxy NDC Label Name,Current Mapped AWP Price,Claim Quantity,Cumulative Claim Quantity Percentage,MSC,Package Size,UOM,Description,Qty,Total Qty,Representative NDC";
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|record
string("\\n") line;
end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|permissions|744|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|514500|30000|0|0|0|0|644|Write Multiple Files-6|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|218|0|589|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|219|0|591|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|220|0|593|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|221|0|595|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|222|0|598|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|223|0|600|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|224|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|225|0|606|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|226|0|609|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|615|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; curr_map_awp_prc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Sort|510500|187000|0|0|0|0|615|Sort-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|617|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|229|0|620|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|230|0|623|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|231|0|625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|232|0|628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|233|0|635|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



//let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];
let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/BRAND_PRICE_LEVEL_REPORT_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::string_substring(in.line,5,string_length(in.line));
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Write Multiple Files|880500|175000|0|0|0|0|642|Write Multiple Files-7|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|234|0|637|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|235|0|639|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|236|0|641|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|237|0|643|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|238|0|646|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|239|0|648|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|240|0|651|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|241|0|654|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|242|0|657|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|243|0|661|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Write Separated Values|678500|167000|0|0|0|0|636|Write Separated Values-3|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|663|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|245|0|666|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|246|0|669|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|247|0|671|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|248|0|674|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|249|0|681|0|{Subgraph created from graph "NDC Reports"|{}@0|@40000|112000|0|0|0|0|634|dedup  record|gsonar|Created 12/4/2017 9:05:14 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|523000|158000|3|}}
{2010210004|XXGflow|250|0|684|0|{@{}@384|.5|.5|{0|}732|17|}}
{2010501005|XXGpvertex|251|0|686|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; proxy_ndc_lbl_nm; curr_map_awp_prc; claim_qty; percentage; representative_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Dedup Sorted|219000|30000|0|0|0|0|734|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|252|0|688|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|253|0|690|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|254|0|693|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|255|0|695|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|256|0|697|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|257|0|699|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|258|0|702|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|259|0|704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|260|0|707|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|261|0|710|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|262|0|713|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|263|0|716|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|264|0|719|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|265|0|728|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; proxy_ndc_lbl_nm; curr_map_awp_prc; claim_qty; percentage; representative_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|40000|40000|0|0|0|0|722|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|266|0|730|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|267|0|733|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|268|0|735|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|269|0|737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|270|0|740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|271|0|746|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|272|0|750|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|273|0|753|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|274|0|757|0|{@{}@0|0|0|0|in1|0.0|@@@9744|0|}}
{2010202004|XXGiport|275|0|761|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|276|0|765|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|(proxy_ndc!=altr_ndc and unit_cost_amt==final_price)|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|176000|251000|0|0|0|0|854|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|277|0|767|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|278|0|770|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|279|0|772|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|280|0|774|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|281|0|776|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|282|0|778|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|283|0|781|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|284|0|783|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|285|0|786|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|286|0|789|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|287|0|792|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|288|0|795|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|289|0|798|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|290|0|801|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/processed/ALT_NDC_LIST_DUPLICATES_$RUN_ID.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/processed/ALT_NDC_LIST_DUPLICATES_$RUN_ID.txt|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@2|@452000|125000|0|0|0|0|729|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|291|0|803|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|292|0|805|0|{@{}@384|.5|.5|{0|}733|17|}}
{2010503005|XXGfvertex|293|0|807|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|294|0|809|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|295|0|812|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$AI_DML/report/ndc.alternate_ndc_list.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
let int count=lookup_count("RCCMSP",(decimal(""))in.dxf_src_sys_id);
let date("CYYMMDD") v_ndc_thru_dt=(date("CYYMMDD"))string_lrtrim((string(""))if(lookup_nth("RCCMSP",0).ajp7ce>lookup_nth("RCCMSP",1).ajp7ce) (date("CYYMMDD"))datetime_add((date("CYYMMDD"))(string(""))(decimal(""))lookup_nth("RCCMSP",0).ajp7ce, -1) else (date("CYYMMDD"))datetime_add((date("CYYMMDD"))(string(""))(decimal(""))lookup_nth("RCCMSP",1).ajp7ce, -1));

out.dxf_src_sys_id::(decimal(""))in.dxf_src_sys_id;
out.alternate_ndc::string_repad(string_ltrim(in.altr_ndc),11,' ');
out.ndc::string_repad(string_ltrim(in.proxy_ndc),11,' ');
out.ndc_frm_dt::(date("CYYMMDD"))now1();
out.ndc_thru_dt::v_ndc_thru_dt;
out.ndc_list_desc::string_repad(string_ltrim(in.aetvig),25,' ');
out.ndc_list_id::string_repad(string_ltrim(in.awx9vg),10,' ');
out.ndc_lable_name::string_repad(string_ltrim(in.aftwig),25,' ');
//out.newline::"\\n";
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|30000|166500|0|0|0|0|538|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|296|0|814|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|297|0|816|0|{@{}@384|.5|.5|{0|}537|529|}}
{2010203004|XXGoport|298|0|818|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|299|0|820|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|300|0|822|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|301|0|824|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|302|0|826|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|303|0|828|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|304|0|832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|305|0|835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|306|0|838|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|307|0|841|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|308|0|851|0|{Subgraph created from graph "wmf:write report src_env seperated"|{}@0|@657500|130750|0|0|0|0|914|NDC Reports|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|711000|401000|7|}}
{2010210004|XXGflow|309|0|854|0|{@{}@384|.5|.5|{0|}539|529|}}
{2010210004|XXGflow|310|0|856|0|{@{}@384|.5|.5|{0|}533|17|}}
{2010210004|XXGflow|311|0|858|0|{@{}@384|.5|.5|{0|}515|17|}}
{2010501005|XXGpvertex|312|0|861|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|219000|184000|0|0|0|0|488|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|313|0|863|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|314|0|867|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|315|0|870|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|316|0|872|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|317|0|875|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|318|0|881|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/ALT_NDC_LIST_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id in.dxf_src_sys_id name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".txt";
end;

/* This function is optional. */
/*Create output record*/

type output_type=record
string(10) ndc_list_id;
string(25) ndc_list_desc;
string(11) ndc;
string(25) ndc_lable_name;
string(11) alternate_ndc;
date("CYYMMDD") ndc_frm_dt;
date("CYYMMDD")ndc_thru_dt;
string(2) newline="\\r\\n" ;
end; /*Metadata for records written to output files*/

write::reformat(in)=
begin
write.newline::"\\r\\n";
write.*::in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|535000|23000|0|0|0|0|540|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|319|0|883|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|320|0|885|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|321|0|887|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|322|0|889|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|323|0|892|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|324|0|894|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|325|0|897|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|326|0|900|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|327|0|903|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|328|0|909|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(6) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[6] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/ALT_NDC_LIST_WITH_DUPLICATES_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id in.dxf_src_sys_id name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".txt";
end;

/* This function is optional. */
/*Create output record*/

type output_type=record
string(10) ndc_list_id;
string(25) ndc_list_desc;
string(11) ndc;
string(25) ndc_lable_name;
string(11) alternate_ndc;
date("CYYMMDD") ndc_frm_dt;
date("CYYMMDD")ndc_thru_dt;
string(2) newline="\\r\\n" ;
end; /*Metadata for records written to output files*/

write::reformat(in)=
begin
write.newline::"\\r\\n";
write.*::in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|535000|248000|0|0|0|0|516|Write Multiple Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|329|0|911|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|330|0|913|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|331|0|915|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|332|0|917|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|333|0|920|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|334|0|922|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|335|0|925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|336|0|928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|337|0|931|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|338|0|937|0|{Subgraph created from graph "NDC Reports"|{}@0|@340500|20000|0|0|0|0|535|dedup  record|gsonar|Created 12/4/2017 9:05:14 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|586000|229000|3|}}
{2010210004|XXGflow|339|0|940|0|{@{}@384|.5|.5|{0|}732|17|}}
{2010501005|XXGpvertex|340|0|942|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; ndc_list_desc; ndc; ndc_lable_name; alternate_ndc; ndc_frm_dt; ndc_thru_dt\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Dedup Sorted|219000|30000|0|0|0|0|734|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|341|0|944|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|342|0|946|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|343|0|949|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|344|0|951|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|345|0|953|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|346|0|955|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|347|0|958|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|348|0|960|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|349|0|963|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|350|0|966|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|351|0|969|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|352|0|972|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|353|0|975|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|354|0|984|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; ndc_list_desc; ndc; ndc_lable_name; alternate_ndc; ndc_frm_dt; ndc_thru_dt\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|40000|40000|0|0|0|0|723|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|355|0|986|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|356|0|989|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|357|0|991|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|358|0|993|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|359|0|996|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|360|0|1002|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|361|0|1006|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|362|0|1010|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|363|0|1014|0|{Subgraph created from graph "wmf:write report src_env seperated"|{}@0|@643000|323250|0|0|0|0|916|Proxy Level Reports|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|686000|465000|7|}}
{2010210004|XXGflow|364|0|1016|0|{@{}@384|.5|.5|{0|}604|529|}}
{2010210004|XXGflow|365|0|1018|0|{@{}@384|.5|.5|{0|}624|529|}}
{2010210004|XXGflow|366|0|1020|0|{@{}@384|.5|.5|{0|}623|529|}}
{2010210004|XXGflow|367|0|1022|0|{@{}@384|.5|.5|{0|}621|17|}}
{2010210004|XXGflow|368|0|1024|0|{@{}@384|.5|.5|{0|}605|529|}}
{2010501005|XXGpvertex|369|0|1026|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$AI_DML/report/ndc.proxy_level_report.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.dxf_src_sys_id::in.dxf_src_sys_id;
out.ndc_list_id::string_repad(string_ltrim(in.awx9vg),10,' ');
out.altr_ndc::in.altr_ndc;
out.proxy_ndc_nbr::in.proxy_ndc;
out.proxy_ndc_lbl_nm::in.aftwig;
out.final_rmd_prc::in.final_price;
out.proxy_chg::in.proxy_ndc==in.altr_ndc?"N":"Y";
out.recommendation::in.final_price==in.first_rec_price?"Mean + StDev":"85% Cumulative" ;//Need to change
out.*::in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|40000|231500|0|0|0|0|622|Reformat-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|370|0|1028|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|371|0|1031|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|372|0|1033|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|373|0|1035|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|374|0|1037|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|375|0|1039|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|376|0|1041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|377|0|1045|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|378|0|1048|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|379|0|1051|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|380|0|1054|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|381|0|1057|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/processed/PROXY_LEVEL_REPORT_DUPLICATES_$RUN_ID.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/processed/PROXY_LEVEL_REPORT_DUPLICATES_$RUN_ID.txt|3|2|$|@{0|}}
}}@2|@432000|85000|0|0|0|0|731|Output File|Ab Initio Software|@1|100|-1||6||257|-1|-1|}}
{2010202004|XXGiport|382|0|1059|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|383|0|1061|0|{@{}@384|.5|.5|{0|}730|17|}}
{2010503005|XXGfvertex|384|0|1063|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|385|0|1065|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|386|0|1071|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|250000|250000|0|0|0|0|512|Replicate-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|387|0|1073|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|388|0|1079|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|389|0|1082|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|390|0|1084|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|391|0|1087|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|392|0|1093|0|{Subgraph created from graph "Proxy Level Reports"|{}@0|@448000|81500|0|0|0|0|606|reports with duplicates|gsonar|@1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|541000|328000|7|}}
{2010210004|XXGflow|393|0|1095|0|{@{}@384|.5|.5|{0|}581|17|}}
{2010210004|XXGflow|394|0|1097|0|{@{}@384|.5|.5|{0|}572|17|}}
{2010210004|XXGflow|395|0|1099|0|{@{}@384|.5|.5|{0|}575|17|}}
{2010501005|XXGpvertex|396|0|1101|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Do computation*/
out::rollup(in)=
begin
out.line::in.dxf_src_sys_id;
end;|3|1|l|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|84000|42000|0|0|0|0|567|Rollup-2|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|397|0|1103|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|398|0|1106|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|399|0|1108|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|400|0|1110|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|401|0|1112|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|402|0|1114|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|403|0|1116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|404|0|1119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|405|0|1122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|406|0|1125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|407|0|1128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|408|0|1132|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(6) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[6] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/PROXY_LEVEL_REPORT_WITH_DUPLICATES_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*



/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::"NDC List Id,Proxy NDC Number,Proxy NDC Label Name,Final Recommended Price,Alternate NDC,Recommendation,Proxy Change";
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|record
string("\\n") line;
end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|permissions|744|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|274000|30000|0|0|0|0|582|Write Multiple Files-5|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|409|0|1134|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1136|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|411|0|1138|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|412|0|1140|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|413|0|1143|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|414|0|1145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|415|0|1148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|416|0|1151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|417|0|1154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|418|0|1159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{proxy_ndc_nbr; final_rmd_prc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|Sort|40000|177000|0|0|0|0|571|Sort-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|419|0|1161|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|420|0|1164|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|421|0|1166|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|422|0|1168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|423|0|1171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|424|0|1176|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(6) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



let src_env[6] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/PROXY_LEVEL_REPORT_WITH_DUPLICATES_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*




filename::get_filename(in)=
begin
filename::"$\{AI_SERIAL\}"+"/reports/PROXY_LEVEL_REPORT."+string_substring(in.line,1,3)+".csv";
end;*/

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::string_substring(in.line,5,string_length(in.line));
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Write Multiple Files|354000|165000|0|0|0|0|576|Write Multiple Files-4|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|425|0|1178|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|426|0|1180|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|427|0|1182|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|428|0|1184|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|429|0|1187|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|430|0|1189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|431|0|1192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|432|0|1195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|433|0|1198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|434|0|1201|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@3|Write Separated Values|182000|157000|0|0|0|0|574|Write Separated Values-2|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|435|0|1203|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|436|0|1206|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|437|0|1209|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|438|0|1211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|439|0|1214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|440|0|1221|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|441|0|1225|0|{@{}@0|0|0|0|in1|0.0|@@@9744|0|}}
{2010600005|XXGgraph|442|0|1229|0|{Subgraph created from graph "Proxy Level Reports"|{}@0|@450250|331500|0|0|0|0|625|reports without duplicates|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|746000|648000|7|}}
{2010210004|XXGflow|443|0|1231|0|{@{}@384|.5|.5|{0|}636|17|}}
{2010210004|XXGflow|444|0|1233|0|{@{}@384|.5|.5|{0|}645|17|}}
{2010210004|XXGflow|445|0|1235|0|{@{}@384|.5|.5|{0|}647|17|}}
{2010210004|XXGflow|446|0|1237|0|{@{}@384|.5|.5|{0|}632|17|}}
{2010501005|XXGpvertex|447|0|1239|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Do computation*/
out::rollup(in)=
begin
out.line::in.dxf_src_sys_id;
end;|3|1|l|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|104500|132000|0|0|0|0|640|Rollup-1|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|448|0|1241|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|449|0|1244|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|450|0|1246|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|451|0|1248|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|452|0|1250|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|453|0|1252|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|454|0|1254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|455|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|456|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|457|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|458|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|459|0|1271|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



//let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];
let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/PROXY_LEVEL_REPORT_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*



/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::"NDC List Id,Proxy NDC Number,Proxy NDC Label Name,Final Recommended Price,Alternate NDC,Recommendation,MSC,Package Size,UOM,Description,Qty,Total Qty,Proxy Change";
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|record
string("\\n") line;
end;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|permissions|744|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Files|294500|120000|0|0|0|0|646|Write Multiple Files-2|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|460|0|1273|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|461|0|1275|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|462|0|1277|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|463|0|1279|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|464|0|1282|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|465|0|1284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|466|0|1287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|467|0|1290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|468|0|1293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|469|0|1299|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; final_rmd_prc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|240500|322000|0|0|0|0|599|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|470|0|1301|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|471|0|1304|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|472|0|1307|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|473|0|1309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|474|0|1312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|475|0|1319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type src_env=record
string(3) id;
string(15) name;
end;
/*extract filename from input record*/
filename::get_filename(in)=
begin



//let src_env[7] src_env_vec=[vector [record id "500" name "A6"],[record id "510" name "A5"],[record id "530" name "A2_INM"],[record id "560" name "A6_CIG"],[record id "580" name "CCTA"],[record id "480" name "BK1"],[record id "620" name "A5_KSR"]];
let src_env[7] src_env_vec=[vector [record id "500" name string_concat("A6","$\{RUN_TYPE\}")],[record id "510" name string_concat("A5","$\{RUN_TYPE\}")],[record id "530" name string_concat("A2_INM","$\{RUN_TYPE\}")],[record id "560" name string_concat("A6_CIG","$\{RUN_TYPE\}")],[record id "580" name string_concat("CCTA","$\{RUN_TYPE\}")],[record id "480" name string_concat("BK1","$\{RUN_TYPE\}")],[record id "620" name string_concat("A5_KSR","$\{RUN_TYPE\}")]];

filename::"$\{AI_SERIAL\}"+"/ndc_reports/PROXY_LEVEL_REPORT_"+string_lrtrim(src_env_vec[vector_search(src_env_vec,[record id string_substring(in.line,1,3) name ""],\{id\})].name)+"_"+string_substring((string(""))"$\{RUN_ID\}",1,8)+".csv";
end;
/*




filename::get_filename(in)=
begin
filename::"$\{AI_SERIAL\}"+"/reports/PROXY_LEVEL_REPORT."+string_substring(in.line,1,3)+".csv";
end;*/

/* This function is optional. */
/*Create output record*/
write::reformat(in)=
begin
write.line::string_substring(in.line,5,string_length(in.line));
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Write Multiple Files|549500|310000|0|0|0|0|648|Write Multiple Files-3|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|476|0|1321|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|477|0|1323|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|478|0|1325|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|479|0|1327|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|480|0|1330|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|orc|parquet|seqfile|avro|texttable|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{7|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param hadoopy_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|RFK$|Location of schema file, prefix with file: or hdfs:|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|481|0|1332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|482|0|1335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|483|0|1338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|484|0|1341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|485|0|1345|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Write Separated Values|377500|302000|0|0|0|0|637|Write Separated Values-1|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|486|0|1347|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|487|0|1350|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|488|0|1353|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|489|0|1355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|490|0|1358|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|491|0|1365|0|{Subgraph created from graph "NDC Reports"|{}@0|@45000|302000|0|0|0|0|633|dedup  record|gsonar|Created 12/4/2017 9:05:14 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|523000|158000|3|}}
{2010210004|XXGflow|492|0|1368|0|{@{}@384|.5|.5|{0|}725|17|}}
{2010501005|XXGpvertex|493|0|1370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; proxy_ndc_lbl_nm; final_rmd_prc; altr_ndc; recommendation; proxy_chg\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Dedup Sorted|219000|30000|0|0|0|0|727|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|494|0|1372|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|495|0|1374|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|496|0|1377|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|497|0|1379|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|498|0|1381|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|499|0|1383|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|500|0|1386|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|501|0|1388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|502|0|1391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|503|0|1394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|504|0|1397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|505|0|1400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|506|0|1403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|507|0|1412|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; ndc_list_id; proxy_ndc_nbr; proxy_ndc_lbl_nm; final_rmd_prc; altr_ndc; recommendation; proxy_chg\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|40000|40000|0|0|0|0|724|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|508|0|1414|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|509|0|1417|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|510|0|1419|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|511|0|1421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|512|0|1424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|513|0|1430|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|514|0|1434|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|515|0|1437|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|516|0|1441|0|{@{}@0|0|0|0|in1|0.0|@@@9744|0|}}
{2010202004|XXGiport|517|0|1445|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|518|0|1449|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|488000|280000|0|0|0|0|702|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|519|0|1451|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|520|0|1455|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|521|0|1458|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|522|0|1460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|523|0|1463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|524|0|1469|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|57000|383000|0|0|0|0|801|Replicate-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|525|0|1471|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|526|0|1475|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|527|0|1477|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|528|0|1479|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|529|0|1482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|530|0|1485|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/processed/brand_report.$RUN_ID.rej|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@2|@656000|65000|0|0|0|0|885|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|531|0|1487|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|532|0|1489|0|{@{}@384|.5|.5|{0|}888|17|}}
{2010243001|XXGwatcher|533|0|1491|0|{@{}@1|100|-1||0|}}
{2010503005|XXGfvertex|534|0|1493|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|535|0|1495|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|536|0|1501|0|{Subgraph created from graph "wmf:write report src_env seperated"|{}@0|@311000|475500|0|0|0|0|918|fbe:jn:remove proxy with final price|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|978000|473000|7|}}
{2010210004|XXGflow|537|0|1503|0|{@{}@384|.5|.5|{0|}889|17|}}
{2010210004|XXGflow|538|0|1506|0|{@{}@384|.5|.5|{0|}881|1041|}}
{2010243001|XXGwatcher|539|0|1508|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|540|0|1510|0|{@{}@384|.5|.24629080295562744|{0|}882|1041|}}
{2010243001|XXGwatcher|541|0|1512|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|542|0|1514|0|{@{}@384|.5|.5|{0|}883|17|}}
{2010210004|XXGflow|543|0|1516|0|{@{}@384|.5|.5|{0|}893|17|}}
{2010243001|XXGwatcher|544|0|1518|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|545|0|1520|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|(proxy_ndc == altr_ndc and unit_cost_amt == final_price)|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|415000|190000|0|0|0|0|880|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|546|0|1522|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|547|0|1525|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|548|0|1528|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|549|0|1530|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|550|0|1532|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|551|0|1534|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|552|0|1537|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|553|0|1539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|554|0|1542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|555|0|1545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|556|0|1548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|557|0|1551|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|558|0|1554|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|559|0|1562|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|(proxy_ndc==altr_ndc and claim_count==0 and string_lrtrim(alter_ndc_claim_count_sum)=="0" )|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|281000|46000|0|0|0|0|890|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|560|0|1564|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|561|0|1567|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|562|0|1570|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|563|0|1572|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|564|0|1574|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|565|0|1576|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|566|0|1579|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|567|0|1581|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|568|0|1584|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|569|0|1587|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|570|0|1590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|571|0|1593|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|572|0|1596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|573|0|1604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|driving|1|3|2|$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; awx9vg; proxy_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|transform|/*Join transform*/
out::join(in0,in1)=
begin
  out.* :: in1.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Join|716000|194000|0|0|0|0|884|Join|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|574|0|1606|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|575|0|1609|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|576|0|1611|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|577|0|1613|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|578|0|1615|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|579|0|1617|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|580|0|1619|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|581|0|1621|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|582|0|1623|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|583|0|1626|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|584|0|1629|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|585|0|1631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|586|0|1634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|587|0|1637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|588|0|1640|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|589|0|1643|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|590|0|1646|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|591|0|1649|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|592|0|1652|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|593|0|1655|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|594|0|1673|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|595|0|1700|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; awx9vg; proxy_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|64000|55000|0|0|0|0|894|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|596|0|1702|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|597|0|1705|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|598|0|1707|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|599|0|1709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|600|0|1712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|601|0|1718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Trash|875000|189000|0|0|0|0|875|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|602|0|1720|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|603|0|1723|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|604|0|1725|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|605|0|1730|0|{@{}@0|0|0|0|out0|0.0|@@@9232|0|}}
{2010202004|XXGiport|606|0|1734|0|{@{}@0|0|0|0|in0|.16246498599439776|@@@13840|0|}}
{2010202004|XXGiport|607|0|1738|0|{@{}@0|0|0|0|in0|.6156763590391909|@@@13840|0|}}
{2010202004|XXGiport|608|0|1742|0|{@{}@0|0|0|0|in0|.5045662100456622|@@@13840|0|}}
{2010600005|XXGgraph|609|0|1746|0|{Subgraph created from graph "adhoc_ndc_algo_report"|{}@0|@642000|245000|0|0|0|0|728|ddp:remove unique proxy==ndc-1|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|656000|278000|7|}}
{2010210004|XXGflow|610|0|1748|0|{@{}@384|.5|.5|{0|}483|17|}}
{2010243001|XXGwatcher|611|0|1750|0|{@{}@1|100|-1|@0|}}
{2010210004|XXGflow|612|0|1752|0|{@{}@384|.5586206912994385|.5|{0|}478|1041|}}
{2010243001|XXGwatcher|613|0|1754|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|614|0|1756|0|{@{}@384|.5|.5|{0|}475|17|}}
{2010210004|XXGflow|615|0|1758|0|{@{}@384|.5|.5|{0|}479|1041|}}
{2010600005|XXGgraph|616|0|1760|0|{Subgraph created from graph "ddp:remove unique proxy==ndc"|{}@0|@485875|10250|0|0|0|0|484|Convert to CSV|gsonar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|916000|347000|7|}}
{2010210004|XXGflow|617|0|1762|0|{@{}@384|.5|.5|{0|}496|17|}}
{2010210004|XXGflow|618|0|1764|0|{@{}@384|.5|.5|{0|}497|17|}}
{2010210004|XXGflow|619|0|1766|0|{@{}@384|.5|.5|{0|}504|17|}}
{2010210004|XXGflow|620|0|1768|0|{@{}@384|.5|.5|{0|}500|17|}}
{2010210004|XXGflow|621|0|1770|0|{@{}@384|.5|.5|{0|}502|17|}}
{2010501005|XXGpvertex|622|0|1772|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Concatenate|721000|223000|0|0|0|0|485|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|623|0|1774|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|624|0|1777|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|625|0|1781|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|626|0|1783|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|627|0|1786|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|628|0|1789|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/ndc.discarded_unique_proxy_ndc_$RUN_ID.csv", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/ndc.discarded_unique_proxy_ndc_$RUN_ID.csv|3|2|$|@{0|}}
}}@1|@806000|224000|0|0|0|0|501|Output File|Ab Initio Software|@1|1000|-1||6||257|-1|-1|}}
{2010202004|XXGiport|629|0|1791|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|630|0|1794|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|631|0|1796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|632|0|1799|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.line :: "dxf_src_sys_id,proxy_ndc,altr_ndc,rxcui,msc,active_ind,partd_ind,eff_dt,term_dt,rxcui_type_cd,unit_cost_amt,afq7hb,afq8hb,aftwig,aetvig,awx9vg,rxt_src_envrt_nm,claim_count,alter_ndc_count,alter_ndc_claim_count_sum,proxy_ndc_count,proxy_ndc_claim_count_sum,claim_qty_percent,claim_qty_cuml_percentage,weight_mean_all_awp,threshold_price,threshold_price_percent,weighted_std_dev,threshold_price_ind,first_rec_price,second_rec_price,all_awp_ceil,final_price,newline";
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Create Data|581000|65000|0|0|0|0|505|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|633|0|1801|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|634|0|1804|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|635|0|1806|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|636|0|1808|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|637|0|1810|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|638|0|1813|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|639|0|1816|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|640|0|1824|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
  
  string(3) dxf_src_sys_id ; /*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/
  string(unsigned integer(1),maximum_length=11)  proxy_ndc /*CHAR(11) NOT NULL*/; //RCND2P
  string(unsigned integer(1),maximum_length=11)  altr_ndc /*CHAR(11) NOT NULL*/;
  string(8)  rxcui /*INTEGER NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  msc /*CHAR(1) NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  active_ind /*CHAR(1) NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  partd_ind /*CHAR(1) NOT NULL*/;
  date("YYYY-MM-DD")  eff_dt /*DATE NOT NULL*/;
  date("YYYY-MM-DD")  term_dt /*DATE NOT NULL*/;
  string(unsigned integer(1),maximum_length=1)  rxcui_type_cd /*CHAR(1) NOT NULL*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) unit_cost_amt = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01", maximum_length=10) afq7hb = NULL("");
string("\\x01", maximum_length=5) afq8hb = NULL("");
string("\\x01", maximum_length=30) aftwig = NULL("");
string("\\x01", maximum_length=25) aetvig = NULL("");//from rcnd1p
string("\\x01", maximum_length=10) awx9vg= NULL(""); //from rccpdp
string("\\x01", maximum_length=30)  rxt_src_envrt_nm = NULL("");
  decimal("\\x01") claim_count=0;
  string(8) alter_ndc_count;
  string(8) alter_ndc_claim_count_sum;
  string(8) proxy_ndc_count;
  string(8) proxy_ndc_claim_count_sum;
  decimal("\\x01".11) claim_qty_percent=0;
  decimal("\\x01".11) claim_qty_cuml_percentage=0;
  decimal("\\x01".11) weight_mean_all_awp=0;
  decimal("\\x01".11) threshold_price=0;
  decimal("\\x01".11) threshold_price_percent=0;
  decimal("\\x01".11) weighted_std_dev=0;
  string(1) threshold_price_ind= NULL("");
  decimal("\\x01".11) first_rec_price=0;
  decimal("\\x01".11) second_rec_price=0;
  decimal("\\x01".11) all_awp_ceil=0;
  decimal("\\x01".11) final_price=0;
  string("\\n") newline='\\n';
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.*::in.*;
out.dxf_src_sys_id::(decimal(""))in.dxf_src_sys_id;
out.rxcui::(decimal(""))in.rxcui;
out.alter_ndc_count::(decimal("")) in.alter_ndc_count;
 out.alter_ndc_claim_count_sum:: (decimal("")) in.alter_ndc_claim_count_sum;
 out.proxy_ndc_count:: (decimal("")) in.proxy_ndc_count;
  out.proxy_ndc_claim_count_sum::(decimal("")) in.proxy_ndc_claim_count_sum;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|25000|197000|0|0|0|0|503|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|641|0|1826|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|642|0|1829|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|643|0|1831|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|644|0|1833|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|645|0|1835|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|646|0|1837|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|647|0|1839|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|648|0|1843|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|649|0|1846|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|650|0|1849|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|651|0|1852|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|652|0|1858|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{proxy_ndc; unit_cost_amt\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort|236000|195000|0|0|0|0|494|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|653|0|1860|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|654|0|1863|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|655|0|1866|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|656|0|1868|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|657|0|1871|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|658|0|1877|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Write_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator|,|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\n") line;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Write Separated Values|466750|183500|0|0|0|0|498|Write Separated Values-1|Ab Initio Software|Built-in 2.15.2.r25:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|659|0|1879|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|660|0|1882|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|661|0|1885|0|{Writes comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Separated_Values|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character (defaults to 'none')|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields|False|13|1|FKl|Do not field-delimit empty fields at the end of a record.|{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.display_name|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|remove_trailing_empty_fields.keyword|remove-trailing-empty-fields|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record|False|13|1|FKl|Generate a header record using the input dml record field names. If the input dml is not a record, 'data' is used as the single column name.|{0|}}
{30001002|XXparameter|provide_header_record.display_name|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_header_record.keyword|provide-header-record|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom|False|13|1|FKl|If the charset is unicode or utf8, generate a byte order marker. No effect otherwise.|{0|}}
{30001002|XXparameter|provide_bom.display_name|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|provide_bom.keyword|provide-bom|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting|When needed|15|1|FKl|Specification of when to quote fields.|{4|When needed|Always|Never|Always including empty|}}
{30001002|XXparameter|field_quoting.display_name|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.keyword|field-quoting|3|9|P|@{0|}}
{30001002|XXparameter|field_quoting.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|trim_fields|None|15|1|FKl|Specification of whether or not to trim whitespace from a field, and if so how.|{4|None|Left|Right|Both|}}
{30001002|XXparameter|trim_fields.display_name|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.keyword|trim-fields|3|9|P|@{0|}}
{30001002|XXparameter|trim_fields.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Write Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|662|0|1887|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|663|0|1890|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|664|0|1895|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|665|0|1899|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; proxy_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|keep|unique-only|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|50000|160000|0|0|0|0|473|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|666|0|1901|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|667|0|1904|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|668|0|1907|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|669|0|1909|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|670|0|1911|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|671|0|1913|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|672|0|1915|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|673|0|1917|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|674|0|1920|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|675|0|1923|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|676|0|1926|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|677|0|1929|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|678|0|1932|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|679|0|1940|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|proxy_ndc==altr_ndc and threshold_price_ind=='Y'|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|230000|30000|0|0|0|0|477|FBE|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|680|0|1942|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|681|0|1945|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|682|0|1948|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|683|0|1950|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|684|0|1952|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|685|0|1954|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|686|0|1957|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|687|0|1959|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|688|0|1962|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|689|0|1965|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|690|0|1968|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|691|0|1971|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|692|0|1974|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|693|0|1982|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; proxy_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|488000|205000|0|0|0|0|480|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|694|0|1984|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|695|0|1986|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|696|0|1990|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|697|0|1992|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|698|0|1995|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|699|0|2001|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|700|0|2005|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|701|0|2009|0|{Subgraph created from graph "adhoc_ndc_algo_report"|{}@0|@187000|242500|0|0|0|0|718|ddp:remove unique rxcui|gsonar|Created 11/27/2017 1:02:09 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|890000|391000|3|}}
{2010210004|XXGflow|702|0|2011|0|{@{}@384|.5|.5|{0|}485|17|}}
{2010210004|XXGflow|703|0|2013|0|{@{}@384|.5|.5|{0|}473|17|}}
{2010210004|XXGflow|704|0|2015|0|{@{}@384|.5|.5|{0|}481|17|}}
{2010210004|XXGflow|705|0|2017|0|{@{}@384|.5|.5|{0|}474|17|}}
{2010210004|XXGflow|706|0|2019|0|{@{}@384|.5|.5|{0|}486|17|}}
{2010501005|XXGpvertex|707|0|2021|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|proxy_ndc!=altr_ndc|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|537000|50000|0|0|0|0|482|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|708|0|2023|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|709|0|2026|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|710|0|2028|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|711|0|2030|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|712|0|2032|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|713|0|2034|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|714|0|2037|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|715|0|2039|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|716|0|2042|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|717|0|2045|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|718|0|2048|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|719|0|2051|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|720|0|2054|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|721|0|2062|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|750000|293000|0|0|0|0|458|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|722|0|2064|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|723|0|2066|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|724|0|2070|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|725|0|2072|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|726|0|2075|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|727|0|2081|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; rxcui\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|40000|135000|0|0|0|0|470|SRT:rxcui|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|728|0|2083|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|729|0|2086|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|730|0|2088|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|731|0|2090|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|732|0|2093|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|733|0|2096|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/ndc_reports/raw.rxcui_assignment_ndc_extract.dropped_unique_rxcui.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/ndc_reports/raw.rxcui_assignment_ndc_extract.dropped_unique_rxcui.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@432000|70000|0|0|0|0|487|Unique RXCUI|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|734|0|2098|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|735|0|2101|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|736|0|2104|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|737|0|2106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|738|0|2109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|739|0|2117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; rxcui\}|3|2|$|@{0|}}
{30001002|XXparameter|keep|unique-only|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|231000|105000|0|0|0|0|475|ddp:Pull non unique rxcui|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|740|0|2119|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|741|0|2122|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|742|0|2125|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|743|0|2127|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|744|0|2129|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|745|0|2131|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|746|0|2134|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|747|0|2136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|748|0|2139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|749|0|2142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|750|0|2145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|751|0|2148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|752|0|2151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|753|0|2159|0|{@{}@0|0|0|0|out0|.4380952380952381|@@@14352|0|}}
{2010202004|XXGiport|754|0|2163|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|755|0|2167|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_src_sys_id; proxy_ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort|426000|266000|0|0|0|0|723|srt:proxy_ndc|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|756|0|2169|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|757|0|2172|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|758|0|2175|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|759|0|2177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|760|0|2180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|761|0|2186|0|{@{}@{1|3881609|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_5|}1|9|}
{2010601001|XXGgraph_vertex_vertex|9|0|18|0|{Intermediate_File_1|}1|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|read|}10|11|}
{2010213001|XXGoport_dst_flow|11|0|22|0|{0|}11|6|}
{2010211001|XXGvertex_iport_iport|12|0|23|0|{0|write|}10|12|}
{2010214001|XXGiport_src_flow|13|0|25|0|{0|}12|9|}
{2010007001|XXGobject_proto_object|14|0|26|0|{}10|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{0|read|}13|14|}
{2010006001|XXGobject_psameas_object|16|0|30|0|{metadata|read_metadata|1|0|}14|13|}
{2010211001|XXGvertex_iport_iport|17|0|31|0|{0|write|}13|15|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{metadata|write_metadata|1|0|}15|13|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{read_metadata|write_metadata|0|0|}10|10|}
{2010601001|XXGgraph_vertex_vertex|20|0|35|0|{RCCMSP|}1|16|}
{2010007001|XXGobject_proto_object|21|0|37|0|{}16|17|}
{2010601001|XXGgraph_vertex_vertex|22|0|39|0|{Raw_RXCUI_With_All_Elements|}1|18|}
{2010212001|XXGvertex_oport_oport|23|0|41|0|{0|read|}18|19|}
{2010213001|XXGoport_dst_flow|24|0|43|0|{0|}19|5|}
{2010007001|XXGobject_proto_object|25|0|44|0|{}18|20|}
{2010212001|XXGvertex_oport_oport|26|0|46|0|{0|read|}20|21|}
{2010006001|XXGobject_psameas_object|27|0|48|0|{metadata|read_metadata|1|0|}21|20|}
{2010601001|XXGgraph_vertex_vertex|28|0|49|0|{Write_Reports_1|}1|22|}
{2010604001|XXGgraph_flow_flow|29|0|51|0|{Flow_1|}22|23|}
{2010604001|XXGgraph_flow_flow|30|0|53|0|{Flow_2|}22|24|}
{2010604001|XXGgraph_flow_flow|31|0|55|0|{Flow_3|}22|25|}
{2010601001|XXGgraph_vertex_vertex|32|0|57|0|{Reformat|}22|26|}
{2010212001|XXGvertex_oport_oport|33|0|59|0|{0|out0|}26|27|}
{2010213001|XXGoport_dst_flow|34|0|61|0|{0|}27|25|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{1|reject0|}26|28|}
{2010212001|XXGvertex_oport_oport|36|0|64|0|{2|error0|}26|29|}
{2010212001|XXGvertex_oport_oport|37|0|66|0|{3|log|}26|30|}
{2010211001|XXGvertex_iport_iport|38|0|68|0|{0|in|}26|31|}
{2010007001|XXGobject_proto_object|39|0|70|0|{}26|32|}
{2010212001|XXGvertex_oport_oport|40|0|72|0|{0|out0|}32|33|}
{2010006001|XXGobject_psameas_object|41|0|74|0|{metadata|out0_metadata|1|0|}33|32|}
{2010006001|XXGobject_psameas_object|42|0|75|0|{transform0|transform0|1|0|}33|32|}
{2010212001|XXGvertex_oport_oport|43|0|76|0|{1|reject0|}32|34|}
{2010006001|XXGobject_psameas_object|44|0|78|0|{metadata|reject0_metadata|1|0|}34|32|}
{2010212001|XXGvertex_oport_oport|45|0|79|0|{2|error0|}32|35|}
{2010006001|XXGobject_psameas_object|46|0|81|0|{metadata|error0_metadata|1|0|}35|32|}
{2010212001|XXGvertex_oport_oport|47|0|82|0|{3|log|}32|36|}
{2010006001|XXGobject_psameas_object|48|0|84|0|{metadata|log_metadata|1|0|}36|32|}
{2010211001|XXGvertex_iport_iport|49|0|85|0|{0|in|}32|37|}
{2010006001|XXGobject_psameas_object|50|0|87|0|{metadata|in_metadata|1|0|}37|32|}
{2010006001|XXGobject_psameas_object|51|0|88|0|{Layout|Layout|0|0|}26|38|}
{2010212001|XXGvertex_oport_oport|52|0|90|0|{0|out|}38|39|}
{2010213001|XXGoport_dst_flow|53|0|92|0|{0|}39|40|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{1|reject|}38|41|}
{2010212001|XXGvertex_oport_oport|55|0|96|0|{2|error|}38|42|}
{2010212001|XXGvertex_oport_oport|56|0|98|0|{3|log|}38|43|}
{2010211001|XXGvertex_iport_iport|57|0|100|0|{0|in|}38|44|}
{2010214001|XXGiport_src_flow|58|0|102|0|{0|}44|45|}
{2010007001|XXGobject_proto_object|59|0|104|0|{}38|46|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{0|out|}46|47|}
{2010006001|XXGobject_psameas_object|61|0|108|0|{metadata|out_metadata|1|0|}47|46|}
{2010212001|XXGvertex_oport_oport|62|0|109|0|{1|reject|}46|48|}
{2010006001|XXGobject_psameas_object|63|0|111|0|{metadata|reject_metadata|1|0|}48|46|}
{2010212001|XXGvertex_oport_oport|64|0|112|0|{2|error|}46|49|}
{2010006001|XXGobject_psameas_object|65|0|114|0|{metadata|error_metadata|1|0|}49|46|}
{2010212001|XXGvertex_oport_oport|66|0|115|0|{3|log|}46|50|}
{2010006001|XXGobject_psameas_object|67|0|117|0|{metadata|log_metadata|1|0|}50|46|}
{2010211001|XXGvertex_iport_iport|68|0|118|0|{0|in|}46|51|}
{2010006001|XXGobject_psameas_object|69|0|120|0|{metadata|in_metadata|1|0|}51|46|}
{2010006001|XXGobject_psameas_object|70|0|121|0|{in_metadata|out0_metadata|0|0|}38|52|}
{2010212001|XXGvertex_oport_oport|71|0|123|0|{0|out0|}52|53|}
{2010213001|XXGoport_dst_flow|72|0|125|0|{0|}53|54|}
{2010212001|XXGvertex_oport_oport|73|0|127|0|{1|reject0|}52|55|}
{2010212001|XXGvertex_oport_oport|74|0|129|0|{2|error0|}52|56|}
{2010212001|XXGvertex_oport_oport|75|0|131|0|{3|log|}52|57|}
{2010211001|XXGvertex_iport_iport|76|0|133|0|{0|in|}52|58|}
{2010214001|XXGiport_src_flow|77|0|135|0|{0|}58|59|}
{2010007001|XXGobject_proto_object|78|0|137|0|{}52|60|}
{2010212001|XXGvertex_oport_oport|79|0|139|0|{0|out0|}60|61|}
{2010006001|XXGobject_psameas_object|80|0|141|0|{metadata|out0_metadata|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|81|0|142|0|{transform0|transform0|1|0|}61|60|}
{2010212001|XXGvertex_oport_oport|82|0|143|0|{1|reject0|}60|62|}
{2010006001|XXGobject_psameas_object|83|0|145|0|{metadata|reject0_metadata|1|0|}62|60|}
{2010212001|XXGvertex_oport_oport|84|0|146|0|{2|error0|}60|63|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{metadata|error0_metadata|1|0|}63|60|}
{2010212001|XXGvertex_oport_oport|86|0|149|0|{3|log|}60|64|}
{2010006001|XXGobject_psameas_object|87|0|151|0|{metadata|log_metadata|1|0|}64|60|}
{2010211001|XXGvertex_iport_iport|88|0|152|0|{0|in|}60|65|}
{2010006001|XXGobject_psameas_object|89|0|154|0|{metadata|in_metadata|1|0|}65|60|}
{2010006001|XXGobject_psameas_object|90|0|155|0|{Layout|Layout|0|0|}52|38|}
{2010006001|XXGobject_psameas_object|91|0|156|0|{in_metadata|out0_metadata|0|0|}52|26|}
{2010006001|XXGobject_psameas_object|92|0|157|0|{reject0_metadata|out0_metadata|0|0|}52|26|}
{2010006001|XXGobject_psameas_object|93|0|158|0|{out_metadata|out_metadata|0|0|}38|66|}
{2010212001|XXGvertex_oport_oport|94|0|160|0|{0|out|}66|67|}
{2010213001|XXGoport_dst_flow|95|0|162|0|{0|}67|68|}
{2010211001|XXGvertex_iport_iport|96|0|164|0|{0|in|}66|69|}
{2010214001|XXGiport_src_flow|97|0|166|0|{0|}69|70|}
{2010007001|XXGobject_proto_object|98|0|168|0|{}66|71|}
{2010212001|XXGvertex_oport_oport|99|0|170|0|{0|out|}71|72|}
{2010006001|XXGobject_psameas_object|100|0|172|0|{metadata|out_metadata|1|0|}72|71|}
{2010211001|XXGvertex_iport_iport|101|0|173|0|{0|in|}71|73|}
{2010006001|XXGobject_psameas_object|102|0|175|0|{metadata|in_metadata|1|0|}73|71|}
{2010006001|XXGobject_psameas_object|103|0|176|0|{Layout|Layout|0|0|}66|38|}
{2010006001|XXGobject_psameas_object|104|0|177|0|{in_metadata|out0_metadata|0|0|}66|52|}
{2010006001|XXGobject_psameas_object|105|0|178|0|{reject_metadata|out0_metadata|0|0|}38|52|}
{2010006001|XXGobject_psameas_object|106|0|179|0|{in_metadata|write_metadata|0|0|}26|10|}
{2010006001|XXGobject_psameas_object|107|0|180|0|{reject0_metadata|write_metadata|0|0|}26|10|}
{2010601001|XXGgraph_vertex_vertex|108|0|181|0|{Replicate|}22|74|}
{2010212001|XXGvertex_oport_oport|109|0|183|0|{0|out|}74|75|}
{2010213001|XXGoport_dst_flow|110|0|185|0|{0|}75|23|}
{2010213001|XXGoport_dst_flow|111|0|186|0|{1|}75|24|}
{2010211001|XXGvertex_iport_iport|112|0|187|0|{0|in|}74|76|}
{2010214001|XXGiport_src_flow|113|0|189|0|{0|}76|25|}
{2010007001|XXGobject_proto_object|114|0|190|0|{}74|77|}
{2010212001|XXGvertex_oport_oport|115|0|192|0|{0|out|}77|78|}
{2010006001|XXGobject_psameas_object|116|0|194|0|{metadata|out_metadata|1|0|}78|77|}
{2010211001|XXGvertex_iport_iport|117|0|195|0|{0|in|}77|79|}
{2010006001|XXGobject_psameas_object|118|0|197|0|{metadata|in_metadata|1|0|}79|77|}
{2010006001|XXGobject_psameas_object|119|0|198|0|{Layout|Layout|0|0|}74|38|}
{2010006001|XXGobject_psameas_object|120|0|199|0|{in_metadata|out0_metadata|0|0|}74|26|}
{2010006001|XXGobject_psameas_object|121|0|200|0|{out_metadata|out0_metadata|0|0|}74|26|}
{2010601001|XXGgraph_vertex_vertex|122|0|201|0|{wmf_write_report_combined|}22|80|}
{2010604001|XXGgraph_flow_flow|123|0|203|0|{Flow_1|}80|68|}
{2010604001|XXGgraph_flow_flow|124|0|204|0|{Flow_2|}80|40|}
{2010604001|XXGgraph_flow_flow|125|0|205|0|{Flow_3|}80|81|}
{2010604001|XXGgraph_flow_flow|126|0|207|0|{Flow_4|}80|70|}
{2010604001|XXGgraph_flow_flow|127|0|208|0|{Flow_5|}80|59|}
{2010604001|XXGgraph_flow_flow|128|0|209|0|{Flow_6|}80|45|}
{2010604001|XXGgraph_flow_flow|129|0|210|0|{Flow_7|}80|54|}
{2010601001|XXGgraph_vertex_vertex|130|0|211|0|{Concatenate|}80|82|}
{2010212001|XXGvertex_oport_oport|131|0|213|0|{0|out|}82|83|}
{2010213001|XXGoport_dst_flow|132|0|215|0|{0|}83|81|}
{2010211001|XXGvertex_iport_iport|133|0|216|0|{0|in|}82|84|}
{2010214001|XXGiport_src_flow|134|0|218|0|{0|}84|40|}
{2010214001|XXGiport_src_flow|135|0|219|0|{1|}84|68|}
{2010007001|XXGobject_proto_object|136|0|220|0|{}82|85|}
{2010212001|XXGvertex_oport_oport|137|0|222|0|{0|out|}85|86|}
{2010006001|XXGobject_psameas_object|138|0|224|0|{metadata|out_metadata|1|0|}86|85|}
{2010211001|XXGvertex_iport_iport|139|0|225|0|{0|in|}85|87|}
{2010006001|XXGobject_psameas_object|140|0|227|0|{metadata|in_metadata|1|0|}87|85|}
{2010006001|XXGobject_psameas_object|141|0|228|0|{Layout|Layout|0|0|}82|38|}
{2010006001|XXGobject_psameas_object|142|0|229|0|{in_metadata|out_metadata|0|0|}82|66|}
{2010006001|XXGobject_psameas_object|143|0|230|0|{out_metadata|out_metadata|0|0|}82|66|}
{2010601001|XXGgraph_vertex_vertex|144|0|231|0|{Reformat|}80|52|}
{2010601001|XXGgraph_vertex_vertex|145|0|232|0|{Replicate|}80|88|}
{2010212001|XXGvertex_oport_oport|146|0|234|0|{0|out|}88|89|}
{2010213001|XXGoport_dst_flow|147|0|236|0|{0|}89|45|}
{2010213001|XXGoport_dst_flow|148|0|237|0|{1|}89|70|}
{2010211001|XXGvertex_iport_iport|149|0|238|0|{0|in|}88|90|}
{2010214001|XXGiport_src_flow|150|0|240|0|{0|}90|54|}
{2010007001|XXGobject_proto_object|151|0|241|0|{}88|91|}
{2010212001|XXGvertex_oport_oport|152|0|243|0|{0|out|}91|92|}
{2010006001|XXGobject_psameas_object|153|0|245|0|{metadata|out_metadata|1|0|}92|91|}
{2010211001|XXGvertex_iport_iport|154|0|246|0|{0|in|}91|93|}
{2010006001|XXGobject_psameas_object|155|0|248|0|{metadata|in_metadata|1|0|}93|91|}
{2010006001|XXGobject_psameas_object|156|0|249|0|{Layout|Layout|0|0|}88|38|}
{2010006001|XXGobject_psameas_object|157|0|250|0|{in_metadata|out0_metadata|0|0|}88|52|}
{2010006001|XXGobject_psameas_object|158|0|251|0|{out_metadata|out0_metadata|0|0|}88|52|}
{2010601001|XXGgraph_vertex_vertex|159|0|252|0|{Rollup|}80|38|}
{2010601001|XXGgraph_vertex_vertex|160|0|253|0|{Sort|}80|94|}
{2010212001|XXGvertex_oport_oport|161|0|255|0|{0|out|}94|95|}
{2010213001|XXGoport_dst_flow|162|0|257|0|{0|}95|59|}
{2010211001|XXGvertex_iport_iport|163|0|258|0|{0|in|}94|96|}
{2010007001|XXGobject_proto_object|164|0|260|0|{}94|97|}
{2010212001|XXGvertex_oport_oport|165|0|262|0|{0|out|}97|98|}
{2010006001|XXGobject_psameas_object|166|0|264|0|{metadata|out_metadata|1|0|}98|97|}
{2010211001|XXGvertex_iport_iport|167|0|265|0|{0|in|}97|99|}
{2010006001|XXGobject_psameas_object|168|0|267|0|{metadata|in_metadata|1|0|}99|97|}
{2010006001|XXGobject_psameas_object|169|0|268|0|{Layout|Layout|0|0|}94|38|}
{2010006001|XXGobject_psameas_object|170|0|269|0|{in_metadata|out0_metadata|0|0|}94|26|}
{2010006001|XXGobject_psameas_object|171|0|270|0|{out_metadata|out0_metadata|0|0|}94|26|}
{2010601001|XXGgraph_vertex_vertex|172|0|271|0|{Write_Multiple_Files_3|}80|100|}
{2010212001|XXGvertex_oport_oport|173|0|273|0|{0|reject|}100|101|}
{2010212001|XXGvertex_oport_oport|174|0|275|0|{1|error|}100|102|}
{2010212001|XXGvertex_oport_oport|175|0|277|0|{2|log|}100|103|}
{2010211001|XXGvertex_iport_iport|176|0|279|0|{0|in|}100|104|}
{2010214001|XXGiport_src_flow|177|0|281|0|{0|}104|81|}
{2010007001|XXGobject_proto_object|178|0|282|0|{}100|105|}
{2010212001|XXGvertex_oport_oport|179|0|284|0|{0|reject|}105|106|}
{2010006001|XXGobject_psameas_object|180|0|286|0|{metadata|reject_metadata|1|0|}106|105|}
{2010212001|XXGvertex_oport_oport|181|0|287|0|{1|error|}105|107|}
{2010006001|XXGobject_psameas_object|182|0|289|0|{metadata|error_metadata|1|0|}107|105|}
{2010212001|XXGvertex_oport_oport|183|0|290|0|{2|log|}105|108|}
{2010006001|XXGobject_psameas_object|184|0|292|0|{metadata|log_metadata|1|0|}108|105|}
{2010211001|XXGvertex_iport_iport|185|0|293|0|{0|in|}105|109|}
{2010006001|XXGobject_psameas_object|186|0|295|0|{metadata|in_metadata|1|0|}109|105|}
{2010006001|XXGobject_psameas_object|187|0|296|0|{Layout|Layout|0|0|}100|38|}
{2010006001|XXGobject_psameas_object|188|0|297|0|{in_metadata|out_metadata|0|0|}100|66|}
{2010006001|XXGobject_psameas_object|189|0|298|0|{reject_metadata|out_metadata|0|0|}100|66|}
{2010601001|XXGgraph_vertex_vertex|190|0|299|0|{Write_Separated_Values_1|}80|66|}
{2010211001|XXGvertex_iport_iport|191|0|300|0|{0|in0|}80|110|}
{2010215002|XXGiport_binding_iport|192|0|302|0|{.5|.5|{0|}668|}110|96|}
{2010214001|XXGiport_src_flow|193|0|303|0|{0|}110|24|}
{2010601001|XXGgraph_vertex_vertex|194|0|304|0|{wmf_write_report_src_env_seperated|}22|111|}
{2010604001|XXGgraph_flow_flow|195|0|306|0|{Flow_1|}111|112|}
{2010604001|XXGgraph_flow_flow|196|0|308|0|{Flow_10|}111|113|}
{2010244001|XXGflow_watcher_watcher|197|0|310|0|{}113|114|}
{2010604001|XXGgraph_flow_flow|198|0|312|0|{Flow_2|}111|115|}
{2010604001|XXGgraph_flow_flow|199|0|314|0|{Flow_3|}111|116|}
{2010604001|XXGgraph_flow_flow|200|0|316|0|{Flow_4|}111|117|}
{2010604001|XXGgraph_flow_flow|201|0|318|0|{Flow_5|}111|118|}
{2010601001|XXGgraph_vertex_vertex|202|0|320|0|{Brand_Price_Level_Report|}111|119|}
{2010604001|XXGgraph_flow_flow|203|0|322|0|{Flow_10|}119|120|}
{2010604001|XXGgraph_flow_flow|204|0|324|0|{Flow_2|}119|121|}
{2010604001|XXGgraph_flow_flow|205|0|326|0|{Flow_3|}119|122|}
{2010604001|XXGgraph_flow_flow|206|0|328|0|{Flow_5|}119|123|}
{2010604001|XXGgraph_flow_flow|207|0|330|0|{Flow_7|}119|124|}
{2010244001|XXGflow_watcher_watcher|208|0|332|0|{}124|125|}
{2010601001|XXGgraph_vertex_vertex|209|0|334|0|{Reformat_1|}119|126|}
{2010212001|XXGvertex_oport_oport|210|0|336|0|{0|out0|}126|127|}
{2010213001|XXGoport_dst_flow|211|0|338|0|{0|}127|124|}
{2010212001|XXGvertex_oport_oport|212|0|339|0|{1|reject0|}126|128|}
{2010212001|XXGvertex_oport_oport|213|0|341|0|{2|error0|}126|129|}
{2010212001|XXGvertex_oport_oport|214|0|343|0|{3|log|}126|130|}
{2010211001|XXGvertex_iport_iport|215|0|345|0|{0|in|}126|131|}
{2010007001|XXGobject_proto_object|216|0|347|0|{}126|132|}
{2010212001|XXGvertex_oport_oport|217|0|349|0|{0|out0|}132|133|}
{2010006001|XXGobject_psameas_object|218|0|351|0|{metadata|out0_metadata|1|0|}133|132|}
{2010006001|XXGobject_psameas_object|219|0|352|0|{transform0|transform0|1|0|}133|132|}
{2010212001|XXGvertex_oport_oport|220|0|353|0|{1|reject0|}132|134|}
{2010006001|XXGobject_psameas_object|221|0|355|0|{metadata|reject0_metadata|1|0|}134|132|}
{2010212001|XXGvertex_oport_oport|222|0|356|0|{2|error0|}132|135|}
{2010006001|XXGobject_psameas_object|223|0|358|0|{metadata|error0_metadata|1|0|}135|132|}
{2010212001|XXGvertex_oport_oport|224|0|359|0|{3|log|}132|136|}
{2010006001|XXGobject_psameas_object|225|0|361|0|{metadata|log_metadata|1|0|}136|132|}
{2010211001|XXGvertex_iport_iport|226|0|362|0|{0|in|}132|137|}
{2010006001|XXGobject_psameas_object|227|0|364|0|{metadata|in_metadata|1|0|}137|132|}
{2010006001|XXGobject_psameas_object|228|0|365|0|{Layout|Layout|0|0|}126|138|}
{2010211001|XXGvertex_iport_iport|229|0|367|0|{0|write|}138|139|}
{2010214001|XXGiport_src_flow|230|0|369|0|{0|}139|140|}
{2010007001|XXGobject_proto_object|231|0|371|0|{}138|141|}
{2010211001|XXGvertex_iport_iport|232|0|373|0|{0|write|}141|142|}
{2010006001|XXGobject_psameas_object|233|0|375|0|{metadata|write_metadata|1|0|}142|141|}
{2010006001|XXGobject_psameas_object|234|0|376|0|{write_metadata|out0_metadata|0|0|}138|126|}
{2010006001|XXGobject_psameas_object|235|0|377|0|{in_metadata|out0_metadata|0|0|}126|26|}
{2010006001|XXGobject_psameas_object|236|0|378|0|{reject0_metadata|out0_metadata|0|0|}126|26|}
{2010601001|XXGgraph_vertex_vertex|237|0|379|0|{Replicate_1|}119|143|}
{2010212001|XXGvertex_oport_oport|238|0|381|0|{0|out|}143|144|}
{2010213001|XXGoport_dst_flow|239|0|383|0|{0|}144|122|}
{2010213001|XXGoport_dst_flow|240|0|384|0|{1|}144|121|}
{2010213001|XXGoport_dst_flow|241|0|385|0|{2|}144|123|}
{2010213001|XXGoport_dst_flow|242|0|386|0|{3|}144|120|}
{2010211001|XXGvertex_iport_iport|243|0|387|0|{0|in|}143|145|}
{2010214001|XXGiport_src_flow|244|0|389|0|{0|}145|124|}
{2010007001|XXGobject_proto_object|245|0|390|0|{}143|146|}
{2010212001|XXGvertex_oport_oport|246|0|392|0|{0|out|}146|147|}
{2010006001|XXGobject_psameas_object|247|0|394|0|{metadata|out_metadata|1|0|}147|146|}
{2010211001|XXGvertex_iport_iport|248|0|395|0|{0|in|}146|148|}
{2010006001|XXGobject_psameas_object|249|0|397|0|{metadata|in_metadata|1|0|}148|146|}
{2010006001|XXGobject_psameas_object|250|0|398|0|{Layout|Layout|0|0|}143|138|}
{2010006001|XXGobject_psameas_object|251|0|399|0|{in_metadata|out0_metadata|0|0|}143|126|}
{2010006001|XXGobject_psameas_object|252|0|400|0|{out_metadata|out0_metadata|0|0|}143|126|}
{2010601001|XXGgraph_vertex_vertex|253|0|401|0|{reports_with_duplicates|}119|149|}
{2010604001|XXGgraph_flow_flow|254|0|403|0|{Flow_1|}149|150|}
{2010604001|XXGgraph_flow_flow|255|0|405|0|{Flow_18|}149|151|}
{2010604001|XXGgraph_flow_flow|256|0|407|0|{Flow_4|}149|152|}
{2010601001|XXGgraph_vertex_vertex|257|0|409|0|{Rollup_2|}149|153|}
{2010212001|XXGvertex_oport_oport|258|0|411|0|{0|out|}153|154|}
{2010213001|XXGoport_dst_flow|259|0|413|0|{0|}154|151|}
{2010212001|XXGvertex_oport_oport|260|0|414|0|{1|reject|}153|155|}
{2010212001|XXGvertex_oport_oport|261|0|416|0|{2|error|}153|156|}
{2010212001|XXGvertex_oport_oport|262|0|418|0|{3|log|}153|157|}
{2010211001|XXGvertex_iport_iport|263|0|420|0|{0|in|}153|158|}
{2010007001|XXGobject_proto_object|264|0|422|0|{}153|159|}
{2010212001|XXGvertex_oport_oport|265|0|424|0|{0|out|}159|160|}
{2010006001|XXGobject_psameas_object|266|0|426|0|{metadata|out_metadata|1|0|}160|159|}
{2010212001|XXGvertex_oport_oport|267|0|427|0|{1|reject|}159|161|}
{2010006001|XXGobject_psameas_object|268|0|429|0|{metadata|reject_metadata|1|0|}161|159|}
{2010212001|XXGvertex_oport_oport|269|0|430|0|{2|error|}159|162|}
{2010006001|XXGobject_psameas_object|270|0|432|0|{metadata|error_metadata|1|0|}162|159|}
{2010212001|XXGvertex_oport_oport|271|0|433|0|{3|log|}159|163|}
{2010006001|XXGobject_psameas_object|272|0|435|0|{metadata|log_metadata|1|0|}163|159|}
{2010211001|XXGvertex_iport_iport|273|0|436|0|{0|in|}159|164|}
{2010006001|XXGobject_psameas_object|274|0|438|0|{metadata|in_metadata|1|0|}164|159|}
{2010006001|XXGobject_psameas_object|275|0|439|0|{Layout|Layout|0|0|}153|138|}
{2010006001|XXGobject_psameas_object|276|0|440|0|{in_metadata|out0_metadata|0|0|}153|126|}
{2010006001|XXGobject_psameas_object|277|0|441|0|{out_metadata|in_metadata|0|0|}153|165|}
{2010212001|XXGvertex_oport_oport|278|0|443|0|{0|reject|}165|166|}
{2010212001|XXGvertex_oport_oport|279|0|445|0|{1|error|}165|167|}
{2010212001|XXGvertex_oport_oport|280|0|447|0|{2|log|}165|168|}
{2010211001|XXGvertex_iport_iport|281|0|449|0|{0|in|}165|169|}
{2010214001|XXGiport_src_flow|282|0|451|0|{0|}169|151|}
{2010007001|XXGobject_proto_object|283|0|452|0|{}165|170|}
{2010212001|XXGvertex_oport_oport|284|0|454|0|{0|reject|}170|171|}
{2010006001|XXGobject_psameas_object|285|0|456|0|{metadata|reject_metadata|1|0|}171|170|}
{2010212001|XXGvertex_oport_oport|286|0|457|0|{1|error|}170|172|}
{2010006001|XXGobject_psameas_object|287|0|459|0|{metadata|error_metadata|1|0|}172|170|}
{2010212001|XXGvertex_oport_oport|288|0|460|0|{2|log|}170|173|}
{2010006001|XXGobject_psameas_object|289|0|462|0|{metadata|log_metadata|1|0|}173|170|}
{2010211001|XXGvertex_iport_iport|290|0|463|0|{0|in|}170|174|}
{2010006001|XXGobject_psameas_object|291|0|465|0|{metadata|in_metadata|1|0|}174|170|}
{2010006001|XXGobject_psameas_object|292|0|466|0|{Layout|Layout|0|0|}165|138|}
{2010006001|XXGobject_psameas_object|293|0|467|0|{reject_metadata|in_metadata|0|0|}165|165|}
{2010006001|XXGobject_psameas_object|294|0|468|0|{reject_metadata|out0_metadata|0|0|}153|126|}
{2010601001|XXGgraph_vertex_vertex|295|0|469|0|{Sort|}149|175|}
{2010212001|XXGvertex_oport_oport|296|0|471|0|{0|out|}175|176|}
{2010213001|XXGoport_dst_flow|297|0|473|0|{0|}176|150|}
{2010211001|XXGvertex_iport_iport|298|0|474|0|{0|in|}175|177|}
{2010007001|XXGobject_proto_object|299|0|476|0|{}175|178|}
{2010212001|XXGvertex_oport_oport|300|0|478|0|{0|out|}178|179|}
{2010006001|XXGobject_psameas_object|301|0|480|0|{metadata|out_metadata|1|0|}179|178|}
{2010211001|XXGvertex_iport_iport|302|0|481|0|{0|in|}178|180|}
{2010006001|XXGobject_psameas_object|303|0|483|0|{metadata|in_metadata|1|0|}180|178|}
{2010006001|XXGobject_psameas_object|304|0|484|0|{Layout|Layout|0|0|}175|138|}
{2010006001|XXGobject_psameas_object|305|0|485|0|{in_metadata|out0_metadata|0|0|}175|126|}
{2010006001|XXGobject_psameas_object|306|0|486|0|{out_metadata|out0_metadata|0|0|}175|126|}
{2010601001|XXGgraph_vertex_vertex|307|0|487|0|{Write_Multiple_Files_4|}149|165|}
{2010601001|XXGgraph_vertex_vertex|308|0|488|0|{Write_Multiple_Files_5|}149|181|}
{2010212001|XXGvertex_oport_oport|309|0|490|0|{0|reject|}181|182|}
{2010212001|XXGvertex_oport_oport|310|0|492|0|{1|error|}181|183|}
{2010212001|XXGvertex_oport_oport|311|0|494|0|{2|log|}181|184|}
{2010211001|XXGvertex_iport_iport|312|0|496|0|{0|in|}181|185|}
{2010214001|XXGiport_src_flow|313|0|498|0|{0|}185|152|}
{2010007001|XXGobject_proto_object|314|0|499|0|{}181|186|}
{2010212001|XXGvertex_oport_oport|315|0|501|0|{0|reject|}186|187|}
{2010006001|XXGobject_psameas_object|316|0|503|0|{metadata|reject_metadata|1|0|}187|186|}
{2010212001|XXGvertex_oport_oport|317|0|504|0|{1|error|}186|188|}
{2010006001|XXGobject_psameas_object|318|0|506|0|{metadata|error_metadata|1|0|}188|186|}
{2010212001|XXGvertex_oport_oport|319|0|507|0|{2|log|}186|189|}
{2010006001|XXGobject_psameas_object|320|0|509|0|{metadata|log_metadata|1|0|}189|186|}
{2010211001|XXGvertex_iport_iport|321|0|510|0|{0|in|}186|190|}
{2010006001|XXGobject_psameas_object|322|0|512|0|{metadata|in_metadata|1|0|}190|186|}
{2010006001|XXGobject_psameas_object|323|0|513|0|{Layout|Layout|0|0|}181|138|}
{2010006001|XXGobject_psameas_object|324|0|514|0|{in_metadata|out_metadata|0|0|}181|191|}
{2010212001|XXGvertex_oport_oport|325|0|516|0|{0|out|}191|192|}
{2010213001|XXGoport_dst_flow|326|0|518|0|{0|}192|152|}
{2010211001|XXGvertex_iport_iport|327|0|519|0|{0|in|}191|193|}
{2010214001|XXGiport_src_flow|328|0|521|0|{0|}193|150|}
{2010007001|XXGobject_proto_object|329|0|522|0|{}191|194|}
{2010212001|XXGvertex_oport_oport|330|0|524|0|{0|out|}194|195|}
{2010006001|XXGobject_psameas_object|331|0|526|0|{metadata|out_metadata|1|0|}195|194|}
{2010211001|XXGvertex_iport_iport|332|0|527|0|{0|in|}194|196|}
{2010006001|XXGobject_psameas_object|333|0|529|0|{metadata|in_metadata|1|0|}196|194|}
{2010006001|XXGobject_psameas_object|334|0|530|0|{Layout|Layout|0|0|}191|138|}
{2010006001|XXGobject_psameas_object|335|0|531|0|{in_metadata|out0_metadata|0|0|}191|126|}
{2010006001|XXGobject_psameas_object|336|0|532|0|{reject_metadata|out_metadata|0|0|}181|191|}
{2010601001|XXGgraph_vertex_vertex|337|0|533|0|{Write_Separated_Values_2|}149|191|}
{2010211001|XXGvertex_iport_iport|338|0|534|0|{0|in0|}149|197|}
{2010215002|XXGiport_binding_iport|339|0|536|0|{.5|.5|{0|}567|}197|158|}
{2010214001|XXGiport_src_flow|340|0|537|0|{0|}197|122|}
{2010211001|XXGvertex_iport_iport|341|0|538|0|{1|in1|}149|198|}
{2010215002|XXGiport_binding_iport|342|0|540|0|{.5|.5|{0|}568|}198|177|}
{2010214001|XXGiport_src_flow|343|0|541|0|{0|}198|121|}
{2010601001|XXGgraph_vertex_vertex|344|0|542|0|{reports_without_duplicates|}119|199|}
{2010604001|XXGgraph_flow_flow|345|0|544|0|{Flow_1|}199|200|}
{2010244001|XXGflow_watcher_watcher|346|0|546|0|{}200|201|}
{2010604001|XXGgraph_flow_flow|347|0|548|0|{Flow_19|}199|202|}
{2010604001|XXGgraph_flow_flow|348|0|550|0|{Flow_3|}199|203|}
{2010604001|XXGgraph_flow_flow|349|0|552|0|{Flow_8|}199|204|}
{2010601001|XXGgraph_vertex_vertex|350|0|554|0|{Rollup_3|}199|205|}
{2010212001|XXGvertex_oport_oport|351|0|556|0|{0|out|}205|206|}
{2010213001|XXGoport_dst_flow|352|0|558|0|{0|}206|202|}
{2010212001|XXGvertex_oport_oport|353|0|559|0|{1|reject|}205|207|}
{2010212001|XXGvertex_oport_oport|354|0|561|0|{2|error|}205|208|}
{2010212001|XXGvertex_oport_oport|355|0|563|0|{3|log|}205|209|}
{2010211001|XXGvertex_iport_iport|356|0|565|0|{0|in|}205|210|}
{2010007001|XXGobject_proto_object|357|0|567|0|{}205|211|}
{2010212001|XXGvertex_oport_oport|358|0|569|0|{0|out|}211|212|}
{2010006001|XXGobject_psameas_object|359|0|571|0|{metadata|out_metadata|1|0|}212|211|}
{2010212001|XXGvertex_oport_oport|360|0|572|0|{1|reject|}211|213|}
{2010006001|XXGobject_psameas_object|361|0|574|0|{metadata|reject_metadata|1|0|}213|211|}
{2010212001|XXGvertex_oport_oport|362|0|575|0|{2|error|}211|214|}
{2010006001|XXGobject_psameas_object|363|0|577|0|{metadata|error_metadata|1|0|}214|211|}
{2010212001|XXGvertex_oport_oport|364|0|578|0|{3|log|}211|215|}
{2010006001|XXGobject_psameas_object|365|0|580|0|{metadata|log_metadata|1|0|}215|211|}
{2010211001|XXGvertex_iport_iport|366|0|581|0|{0|in|}211|216|}
{2010006001|XXGobject_psameas_object|367|0|583|0|{metadata|in_metadata|1|0|}216|211|}
{2010006001|XXGobject_psameas_object|368|0|584|0|{Layout|Layout|0|0|}205|138|}
{2010006001|XXGobject_psameas_object|369|0|585|0|{in_metadata|out0_metadata|0|0|}205|126|}
{2010006001|XXGobject_psameas_object|370|0|586|0|{out_metadata|in_metadata|0|0|}205|217|}
{2010212001|XXGvertex_oport_oport|371|0|588|0|{0|reject|}217|218|}
{2010212001|XXGvertex_oport_oport|372|0|590|0|{1|error|}217|219|}
{2010212001|XXGvertex_oport_oport|373|0|592|0|{2|log|}217|220|}
{2010211001|XXGvertex_iport_iport|374|0|594|0|{0|in|}217|221|}
{2010214001|XXGiport_src_flow|375|0|596|0|{0|}221|202|}
{2010007001|XXGobject_proto_object|376|0|597|0|{}217|222|}
{2010212001|XXGvertex_oport_oport|377|0|599|0|{0|reject|}222|223|}
{2010006001|XXGobject_psameas_object|378|0|601|0|{metadata|reject_metadata|1|0|}223|222|}
{2010212001|XXGvertex_oport_oport|379|0|602|0|{1|error|}222|224|}
{2010006001|XXGobject_psameas_object|380|0|604|0|{metadata|error_metadata|1|0|}224|222|}
{2010212001|XXGvertex_oport_oport|381|0|605|0|{2|log|}222|225|}
{2010006001|XXGobject_psameas_object|382|0|607|0|{metadata|log_metadata|1|0|}225|222|}
{2010211001|XXGvertex_iport_iport|383|0|608|0|{0|in|}222|226|}
{2010006001|XXGobject_psameas_object|384|0|610|0|{metadata|in_metadata|1|0|}226|222|}
{2010006001|XXGobject_psameas_object|385|0|611|0|{Layout|Layout|0|0|}217|138|}
{2010006001|XXGobject_psameas_object|386|0|612|0|{reject_metadata|in_metadata|0|0|}217|217|}
{2010006001|XXGobject_psameas_object|387|0|613|0|{reject_metadata|out0_metadata|0|0|}205|126|}
{2010601001|XXGgraph_vertex_vertex|388|0|614|0|{Sort_2|}199|227|}
{2010212001|XXGvertex_oport_oport|389|0|616|0|{0|out|}227|228|}
{2010213001|XXGoport_dst_flow|390|0|618|0|{0|}228|203|}
{2010211001|XXGvertex_iport_iport|391|0|619|0|{0|in|}227|229|}
{2010214001|XXGiport_src_flow|392|0|621|0|{0|}229|200|}
{2010007001|XXGobject_proto_object|393|0|622|0|{}227|230|}
{2010212001|XXGvertex_oport_oport|394|0|624|0|{0|out|}230|231|}
{2010006001|XXGobject_psameas_object|395|0|626|0|{metadata|out_metadata|1|0|}231|230|}
{2010211001|XXGvertex_iport_iport|396|0|627|0|{0|in|}230|232|}
{2010006001|XXGobject_psameas_object|397|0|629|0|{metadata|in_metadata|1|0|}232|230|}
{2010006001|XXGobject_psameas_object|398|0|630|0|{Layout|Layout|0|0|}227|138|}
{2010006001|XXGobject_psameas_object|399|0|631|0|{in_metadata|out0_metadata|0|0|}227|126|}
{2010006001|XXGobject_psameas_object|400|0|632|0|{out_metadata|out0_metadata|0|0|}227|126|}
{2010601001|XXGgraph_vertex_vertex|401|0|633|0|{Write_Multiple_Files_6|}199|217|}
{2010601001|XXGgraph_vertex_vertex|402|0|634|0|{Write_Multiple_Files_7|}199|233|}
{2010212001|XXGvertex_oport_oport|403|0|636|0|{0|reject|}233|234|}
{2010212001|XXGvertex_oport_oport|404|0|638|0|{1|error|}233|235|}
{2010212001|XXGvertex_oport_oport|405|0|640|0|{2|log|}233|236|}
{2010211001|XXGvertex_iport_iport|406|0|642|0|{0|in|}233|237|}
{2010214001|XXGiport_src_flow|407|0|644|0|{0|}237|204|}
{2010007001|XXGobject_proto_object|408|0|645|0|{}233|238|}
{2010212001|XXGvertex_oport_oport|409|0|647|0|{0|reject|}238|239|}
{2010006001|XXGobject_psameas_object|410|0|649|0|{metadata|reject_metadata|1|0|}239|238|}
{2010212001|XXGvertex_oport_oport|411|0|650|0|{1|error|}238|240|}
{2010006001|XXGobject_psameas_object|412|0|652|0|{metadata|error_metadata|1|0|}240|238|}
{2010212001|XXGvertex_oport_oport|413|0|653|0|{2|log|}238|241|}
{2010006001|XXGobject_psameas_object|414|0|655|0|{metadata|log_metadata|1|0|}241|238|}
{2010211001|XXGvertex_iport_iport|415|0|656|0|{0|in|}238|242|}
{2010006001|XXGobject_psameas_object|416|0|658|0|{metadata|in_metadata|1|0|}242|238|}
{2010006001|XXGobject_psameas_object|417|0|659|0|{Layout|Layout|0|0|}233|138|}
{2010006001|XXGobject_psameas_object|418|0|660|0|{in_metadata|out_metadata|0|0|}233|243|}
{2010212001|XXGvertex_oport_oport|419|0|662|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|420|0|664|0|{0|}244|204|}
{2010211001|XXGvertex_iport_iport|421|0|665|0|{0|in|}243|245|}
{2010214001|XXGiport_src_flow|422|0|667|0|{0|}245|203|}
{2010007001|XXGobject_proto_object|423|0|668|0|{}243|246|}
{2010212001|XXGvertex_oport_oport|424|0|670|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|425|0|672|0|{metadata|out_metadata|1|0|}247|246|}
{2010211001|XXGvertex_iport_iport|426|0|673|0|{0|in|}246|248|}
{2010006001|XXGobject_psameas_object|427|0|675|0|{metadata|in_metadata|1|0|}248|246|}
{2010006001|XXGobject_psameas_object|428|0|676|0|{Layout|Layout|0|0|}243|138|}
{2010006001|XXGobject_psameas_object|429|0|677|0|{in_metadata|out0_metadata|0|0|}243|126|}
{2010006001|XXGobject_psameas_object|430|0|678|0|{reject_metadata|out_metadata|0|0|}233|243|}
{2010601001|XXGgraph_vertex_vertex|431|0|679|0|{Write_Separated_Values_3|}199|243|}
{2010601001|XXGgraph_vertex_vertex|432|0|680|0|{dedup_record|}199|249|}
{2010604001|XXGgraph_flow_flow|433|0|682|0|{Flow_1|}249|140|}
{2010604001|XXGgraph_flow_flow|434|0|683|0|{Flow_6|}249|250|}
{2010601001|XXGgraph_vertex_vertex|435|0|685|0|{Dedup_Sorted|}249|251|}
{2010212001|XXGvertex_oport_oport|436|0|687|0|{0|out|}251|252|}
{2010212001|XXGvertex_oport_oport|437|0|689|0|{1|dup|}251|253|}
{2010213001|XXGoport_dst_flow|438|0|691|0|{0|}253|140|}
{2010212001|XXGvertex_oport_oport|439|0|692|0|{2|reject|}251|254|}
{2010212001|XXGvertex_oport_oport|440|0|694|0|{3|error|}251|255|}
{2010212001|XXGvertex_oport_oport|441|0|696|0|{4|log|}251|256|}
{2010211001|XXGvertex_iport_iport|442|0|698|0|{0|in|}251|257|}
{2010214001|XXGiport_src_flow|443|0|700|0|{0|}257|250|}
{2010007001|XXGobject_proto_object|444|0|701|0|{}251|258|}
{2010212001|XXGvertex_oport_oport|445|0|703|0|{0|out|}258|259|}
{2010006001|XXGobject_psameas_object|446|0|705|0|{metadata|out_metadata|1|0|}259|258|}
{2010212001|XXGvertex_oport_oport|447|0|706|0|{1|dup|}258|260|}
{2010006001|XXGobject_psameas_object|448|0|708|0|{metadata|dup_metadata|1|0|}260|258|}
{2010212001|XXGvertex_oport_oport|449|0|709|0|{2|reject|}258|261|}
{2010006001|XXGobject_psameas_object|450|0|711|0|{metadata|reject_metadata|1|0|}261|258|}
{2010212001|XXGvertex_oport_oport|451|0|712|0|{3|error|}258|262|}
{2010006001|XXGobject_psameas_object|452|0|714|0|{metadata|error_metadata|1|0|}262|258|}
{2010212001|XXGvertex_oport_oport|453|0|715|0|{4|log|}258|263|}
{2010006001|XXGobject_psameas_object|454|0|717|0|{metadata|log_metadata|1|0|}263|258|}
{2010211001|XXGvertex_iport_iport|455|0|718|0|{0|in|}258|264|}
{2010006001|XXGobject_psameas_object|456|0|720|0|{metadata|in_metadata|1|0|}264|258|}
{2010006001|XXGobject_psameas_object|457|0|721|0|{Layout|Layout|0|0|}251|138|}
{2010006001|XXGobject_psameas_object|458|0|722|0|{dup_metadata|out0_metadata|0|0|}251|126|}
{2010006001|XXGobject_psameas_object|459|0|723|0|{in_metadata|out0_metadata|0|0|}251|126|}
{2010006001|XXGobject_psameas_object|460|0|724|0|{out_metadata|out0_metadata|0|0|}251|126|}
{2010006001|XXGobject_psameas_object|461|0|725|0|{reject_metadata|out0_metadata|0|0|}251|126|}
{2010601001|XXGgraph_vertex_vertex|462|0|726|0|{Output_File|}249|138|}
{2010601001|XXGgraph_vertex_vertex|463|0|727|0|{Sort|}249|265|}
{2010212001|XXGvertex_oport_oport|464|0|729|0|{0|out|}265|266|}
{2010213001|XXGoport_dst_flow|465|0|731|0|{0|}266|250|}
{2010211001|XXGvertex_iport_iport|466|0|732|0|{0|in|}265|267|}
{2010007001|XXGobject_proto_object|467|0|734|0|{}265|268|}
{2010212001|XXGvertex_oport_oport|468|0|736|0|{0|out|}268|269|}
{2010006001|XXGobject_psameas_object|469|0|738|0|{metadata|out_metadata|1|0|}269|268|}
{2010211001|XXGvertex_iport_iport|470|0|739|0|{0|in|}268|270|}
{2010006001|XXGobject_psameas_object|471|0|741|0|{metadata|in_metadata|1|0|}270|268|}
{2010006001|XXGobject_psameas_object|472|0|742|0|{Layout|Layout|0|0|}265|138|}
{2010006001|XXGobject_psameas_object|473|0|743|0|{in_metadata|out0_metadata|0|0|}265|126|}
{2010006001|XXGobject_psameas_object|474|0|744|0|{out_metadata|out0_metadata|0|0|}265|126|}
{2010212001|XXGvertex_oport_oport|475|0|745|0|{0|out0|}249|271|}
{2010216002|XXGoport_binding_oport|476|0|747|0|{.5|.5|{0|}736|}271|252|}
{2010213001|XXGoport_dst_flow|477|0|748|0|{0|}271|200|}
{2010211001|XXGvertex_iport_iport|478|0|749|0|{0|in0|}249|272|}
{2010215002|XXGiport_binding_iport|479|0|751|0|{.5|.5|{0|}735|}272|267|}
{2010211001|XXGvertex_iport_iport|480|0|752|0|{0|in0|}199|273|}
{2010215002|XXGiport_binding_iport|481|0|754|0|{.5|.5|{0|}628|}273|272|}
{2010214001|XXGiport_src_flow|482|0|755|0|{0|}273|123|}
{2010211001|XXGvertex_iport_iport|483|0|756|0|{1|in1|}199|274|}
{2010215002|XXGiport_binding_iport|484|0|758|0|{.5|.5|{0|}629|}274|210|}
{2010214001|XXGiport_src_flow|485|0|759|0|{0|}274|120|}
{2010211001|XXGvertex_iport_iport|486|0|760|0|{0|in0|}119|275|}
{2010215002|XXGiport_binding_iport|487|0|762|0|{.5|.5|{0|}592|}275|131|}
{2010214001|XXGiport_src_flow|488|0|763|0|{0|}275|113|}
{2010601001|XXGgraph_vertex_vertex|489|0|764|0|{Filter_by_Expression|}111|276|}
{2010212001|XXGvertex_oport_oport|490|0|766|0|{0|out|}276|277|}
{2010213001|XXGoport_dst_flow|491|0|768|0|{0|}277|115|}
{2010212001|XXGvertex_oport_oport|492|0|769|0|{1|deselect|}276|278|}
{2010212001|XXGvertex_oport_oport|493|0|771|0|{2|reject|}276|279|}
{2010212001|XXGvertex_oport_oport|494|0|773|0|{3|error|}276|280|}
{2010212001|XXGvertex_oport_oport|495|0|775|0|{4|log|}276|281|}
{2010211001|XXGvertex_iport_iport|496|0|777|0|{0|in|}276|282|}
{2010214001|XXGiport_src_flow|497|0|779|0|{0|}282|112|}
{2010007001|XXGobject_proto_object|498|0|780|0|{}276|283|}
{2010212001|XXGvertex_oport_oport|499|0|782|0|{0|out|}283|284|}
{2010006001|XXGobject_psameas_object|500|0|784|0|{metadata|out_metadata|1|0|}284|283|}
{2010212001|XXGvertex_oport_oport|501|0|785|0|{1|deselect|}283|285|}
{2010006001|XXGobject_psameas_object|502|0|787|0|{metadata|deselect_metadata|1|0|}285|283|}
{2010212001|XXGvertex_oport_oport|503|0|788|0|{2|reject|}283|286|}
{2010006001|XXGobject_psameas_object|504|0|790|0|{metadata|reject_metadata|1|0|}286|283|}
{2010212001|XXGvertex_oport_oport|505|0|791|0|{3|error|}283|287|}
{2010006001|XXGobject_psameas_object|506|0|793|0|{metadata|error_metadata|1|0|}287|283|}
{2010212001|XXGvertex_oport_oport|507|0|794|0|{4|log|}283|288|}
{2010006001|XXGobject_psameas_object|508|0|796|0|{metadata|log_metadata|1|0|}288|283|}
{2010211001|XXGvertex_iport_iport|509|0|797|0|{0|in|}283|289|}
{2010006001|XXGobject_psameas_object|510|0|799|0|{metadata|in_metadata|1|0|}289|283|}
{2010006001|XXGobject_psameas_object|511|0|800|0|{Layout|Layout|0|0|}276|290|}
{2010211001|XXGvertex_iport_iport|512|0|802|0|{0|write|}290|291|}
{2010214001|XXGiport_src_flow|513|0|804|0|{0|}291|292|}
{2010007001|XXGobject_proto_object|514|0|806|0|{}290|293|}
{2010211001|XXGvertex_iport_iport|515|0|808|0|{0|write|}293|294|}
{2010006001|XXGobject_psameas_object|516|0|810|0|{metadata|write_metadata|1|0|}294|293|}
{2010006001|XXGobject_psameas_object|517|0|811|0|{write_metadata|out0_metadata|0|0|}290|295|}
{2010212001|XXGvertex_oport_oport|518|0|813|0|{0|out0|}295|296|}
{2010213001|XXGoport_dst_flow|519|0|815|0|{0|}296|297|}
{2010212001|XXGvertex_oport_oport|520|0|817|0|{1|reject0|}295|298|}
{2010212001|XXGvertex_oport_oport|521|0|819|0|{2|error0|}295|299|}
{2010212001|XXGvertex_oport_oport|522|0|821|0|{3|log|}295|300|}
{2010211001|XXGvertex_iport_iport|523|0|823|0|{0|in|}295|301|}
{2010007001|XXGobject_proto_object|524|0|825|0|{}295|302|}
{2010212001|XXGvertex_oport_oport|525|0|827|0|{0|out0|}302|303|}
{2010006001|XXGobject_psameas_object|526|0|829|0|{metadata|out0_metadata|1|0|}303|302|}
{2010006001|XXGobject_psameas_object|527|0|830|0|{transform0|transform0|1|0|}303|302|}
{2010212001|XXGvertex_oport_oport|528|0|831|0|{1|reject0|}302|304|}
{2010006001|XXGobject_psameas_object|529|0|833|0|{metadata|reject0_metadata|1|0|}304|302|}
{2010212001|XXGvertex_oport_oport|530|0|834|0|{2|error0|}302|305|}
{2010006001|XXGobject_psameas_object|531|0|836|0|{metadata|error0_metadata|1|0|}305|302|}
{2010212001|XXGvertex_oport_oport|532|0|837|0|{3|log|}302|306|}
{2010006001|XXGobject_psameas_object|533|0|839|0|{metadata|log_metadata|1|0|}306|302|}
{2010211001|XXGvertex_iport_iport|534|0|840|0|{0|in|}302|307|}
{2010006001|XXGobject_psameas_object|535|0|842|0|{metadata|in_metadata|1|0|}307|302|}
{2010006001|XXGobject_psameas_object|536|0|843|0|{Layout|Layout|0|0|}295|290|}
{2010006001|XXGobject_psameas_object|537|0|844|0|{in_metadata|out0_metadata|0|0|}295|26|}
{2010006001|XXGobject_psameas_object|538|0|845|0|{reject0_metadata|out0_metadata|0|0|}295|26|}
{2010006001|XXGobject_psameas_object|539|0|846|0|{deselect_metadata|out0_metadata|0|0|}276|26|}
{2010006001|XXGobject_psameas_object|540|0|847|0|{in_metadata|out0_metadata|0|0|}276|26|}
{2010006001|XXGobject_psameas_object|541|0|848|0|{out_metadata|out0_metadata|0|0|}276|26|}
{2010006001|XXGobject_psameas_object|542|0|849|0|{reject_metadata|out0_metadata|0|0|}276|26|}
{2010601001|XXGgraph_vertex_vertex|543|0|850|0|{NDC_Reports|}111|308|}
{2010604001|XXGgraph_flow_flow|544|0|852|0|{Flow_1|}308|297|}
{2010604001|XXGgraph_flow_flow|545|0|853|0|{Flow_2|}308|309|}
{2010604001|XXGgraph_flow_flow|546|0|855|0|{Flow_3|}308|310|}
{2010604001|XXGgraph_flow_flow|547|0|857|0|{Flow_4|}308|311|}
{2010601001|XXGgraph_vertex_vertex|548|0|859|0|{Reformat|}308|295|}
{2010601001|XXGgraph_vertex_vertex|549|0|860|0|{Replicate|}308|312|}
{2010212001|XXGvertex_oport_oport|550|0|862|0|{0|out|}312|313|}
{2010213001|XXGoport_dst_flow|551|0|864|0|{0|}313|310|}
{2010213001|XXGoport_dst_flow|552|0|865|0|{1|}313|311|}
{2010211001|XXGvertex_iport_iport|553|0|866|0|{0|in|}312|314|}
{2010214001|XXGiport_src_flow|554|0|868|0|{0|}314|297|}
{2010007001|XXGobject_proto_object|555|0|869|0|{}312|315|}
{2010212001|XXGvertex_oport_oport|556|0|871|0|{0|out|}315|316|}
{2010006001|XXGobject_psameas_object|557|0|873|0|{metadata|out_metadata|1|0|}316|315|}
{2010211001|XXGvertex_iport_iport|558|0|874|0|{0|in|}315|317|}
{2010006001|XXGobject_psameas_object|559|0|876|0|{metadata|in_metadata|1|0|}317|315|}
{2010006001|XXGobject_psameas_object|560|0|877|0|{Layout|Layout|0|0|}312|290|}
{2010006001|XXGobject_psameas_object|561|0|878|0|{in_metadata|out0_metadata|0|0|}312|295|}
{2010006001|XXGobject_psameas_object|562|0|879|0|{out_metadata|out0_metadata|0|0|}312|295|}
{2010601001|XXGgraph_vertex_vertex|563|0|880|0|{Write_Multiple_Files|}308|318|}
{2010212001|XXGvertex_oport_oport|564|0|882|0|{0|reject|}318|319|}
{2010212001|XXGvertex_oport_oport|565|0|884|0|{1|error|}318|320|}
{2010212001|XXGvertex_oport_oport|566|0|886|0|{2|log|}318|321|}
{2010211001|XXGvertex_iport_iport|567|0|888|0|{0|in|}318|322|}
{2010214001|XXGiport_src_flow|568|0|890|0|{0|}322|309|}
{2010007001|XXGobject_proto_object|569|0|891|0|{}318|323|}
{2010212001|XXGvertex_oport_oport|570|0|893|0|{0|reject|}323|324|}
{2010006001|XXGobject_psameas_object|571|0|895|0|{metadata|reject_metadata|1|0|}324|323|}
{2010212001|XXGvertex_oport_oport|572|0|896|0|{1|error|}323|325|}
{2010006001|XXGobject_psameas_object|573|0|898|0|{metadata|error_metadata|1|0|}325|323|}
{2010212001|XXGvertex_oport_oport|574|0|899|0|{2|log|}323|326|}
{2010006001|XXGobject_psameas_object|575|0|901|0|{metadata|log_metadata|1|0|}326|323|}
{2010211001|XXGvertex_iport_iport|576|0|902|0|{0|in|}323|327|}
{2010006001|XXGobject_psameas_object|577|0|904|0|{metadata|in_metadata|1|0|}327|323|}
{2010006001|XXGobject_psameas_object|578|0|905|0|{Layout|Layout|0|0|}318|290|}
{2010006001|XXGobject_psameas_object|579|0|906|0|{in_metadata|out0_metadata|0|0|}318|295|}
{2010006001|XXGobject_psameas_object|580|0|907|0|{reject_metadata|out0_metadata|0|0|}318|295|}
{2010601001|XXGgraph_vertex_vertex|581|0|908|0|{Write_Multiple_Files_1|}308|328|}
{2010212001|XXGvertex_oport_oport|582|0|910|0|{0|reject|}328|329|}
{2010212001|XXGvertex_oport_oport|583|0|912|0|{1|error|}328|330|}
{2010212001|XXGvertex_oport_oport|584|0|914|0|{2|log|}328|331|}
{2010211001|XXGvertex_iport_iport|585|0|916|0|{0|in|}328|332|}
{2010214001|XXGiport_src_flow|586|0|918|0|{0|}332|311|}
{2010007001|XXGobject_proto_object|587|0|919|0|{}328|333|}
{2010212001|XXGvertex_oport_oport|588|0|921|0|{0|reject|}333|334|}
{2010006001|XXGobject_psameas_object|589|0|923|0|{metadata|reject_metadata|1|0|}334|333|}
{2010212001|XXGvertex_oport_oport|590|0|924|0|{1|error|}333|335|}
{2010006001|XXGobject_psameas_object|591|0|926|0|{metadata|error_metadata|1|0|}335|333|}
{2010212001|XXGvertex_oport_oport|592|0|927|0|{2|log|}333|336|}
{2010006001|XXGobject_psameas_object|593|0|929|0|{metadata|log_metadata|1|0|}336|333|}
{2010211001|XXGvertex_iport_iport|594|0|930|0|{0|in|}333|337|}
{2010006001|XXGobject_psameas_object|595|0|932|0|{metadata|in_metadata|1|0|}337|333|}
{2010006001|XXGobject_psameas_object|596|0|933|0|{Layout|Layout|0|0|}328|290|}
{2010006001|XXGobject_psameas_object|597|0|934|0|{in_metadata|out0_metadata|0|0|}328|295|}
{2010006001|XXGobject_psameas_object|598|0|935|0|{reject_metadata|out0_metadata|0|0|}328|295|}
{2010601001|XXGgraph_vertex_vertex|599|0|936|0|{dedup_record|}308|338|}
{2010604001|XXGgraph_flow_flow|600|0|938|0|{Flow_1|}338|292|}
{2010604001|XXGgraph_flow_flow|601|0|939|0|{Flow_6|}338|339|}
{2010601001|XXGgraph_vertex_vertex|602|0|941|0|{Dedup_Sorted|}338|340|}
{2010212001|XXGvertex_oport_oport|603|0|943|0|{0|out|}340|341|}
{2010212001|XXGvertex_oport_oport|604|0|945|0|{1|dup|}340|342|}
{2010213001|XXGoport_dst_flow|605|0|947|0|{0|}342|292|}
{2010212001|XXGvertex_oport_oport|606|0|948|0|{2|reject|}340|343|}
{2010212001|XXGvertex_oport_oport|607|0|950|0|{3|error|}340|344|}
{2010212001|XXGvertex_oport_oport|608|0|952|0|{4|log|}340|345|}
{2010211001|XXGvertex_iport_iport|609|0|954|0|{0|in|}340|346|}
{2010214001|XXGiport_src_flow|610|0|956|0|{0|}346|339|}
{2010007001|XXGobject_proto_object|611|0|957|0|{}340|347|}
{2010212001|XXGvertex_oport_oport|612|0|959|0|{0|out|}347|348|}
{2010006001|XXGobject_psameas_object|613|0|961|0|{metadata|out_metadata|1|0|}348|347|}
{2010212001|XXGvertex_oport_oport|614|0|962|0|{1|dup|}347|349|}
{2010006001|XXGobject_psameas_object|615|0|964|0|{metadata|dup_metadata|1|0|}349|347|}
{2010212001|XXGvertex_oport_oport|616|0|965|0|{2|reject|}347|350|}
{2010006001|XXGobject_psameas_object|617|0|967|0|{metadata|reject_metadata|1|0|}350|347|}
{2010212001|XXGvertex_oport_oport|618|0|968|0|{3|error|}347|351|}
{2010006001|XXGobject_psameas_object|619|0|970|0|{metadata|error_metadata|1|0|}351|347|}
{2010212001|XXGvertex_oport_oport|620|0|971|0|{4|log|}347|352|}
{2010006001|XXGobject_psameas_object|621|0|973|0|{metadata|log_metadata|1|0|}352|347|}
{2010211001|XXGvertex_iport_iport|622|0|974|0|{0|in|}347|353|}
{2010006001|XXGobject_psameas_object|623|0|976|0|{metadata|in_metadata|1|0|}353|347|}
{2010006001|XXGobject_psameas_object|624|0|977|0|{Layout|Layout|0|0|}340|290|}
{2010006001|XXGobject_psameas_object|625|0|978|0|{dup_metadata|out0_metadata|0|0|}340|295|}
{2010006001|XXGobject_psameas_object|626|0|979|0|{in_metadata|out0_metadata|0|0|}340|295|}
{2010006001|XXGobject_psameas_object|627|0|980|0|{out_metadata|out0_metadata|0|0|}340|295|}
{2010006001|XXGobject_psameas_object|628|0|981|0|{reject_metadata|out0_metadata|0|0|}340|295|}
{2010601001|XXGgraph_vertex_vertex|629|0|982|0|{Output_File|}338|290|}
{2010601001|XXGgraph_vertex_vertex|630|0|983|0|{Sort|}338|354|}
{2010212001|XXGvertex_oport_oport|631|0|985|0|{0|out|}354|355|}
{2010213001|XXGoport_dst_flow|632|0|987|0|{0|}355|339|}
{2010211001|XXGvertex_iport_iport|633|0|988|0|{0|in|}354|356|}
{2010007001|XXGobject_proto_object|634|0|990|0|{}354|357|}
{2010212001|XXGvertex_oport_oport|635|0|992|0|{0|out|}357|358|}
{2010006001|XXGobject_psameas_object|636|0|994|0|{metadata|out_metadata|1|0|}358|357|}
{2010211001|XXGvertex_iport_iport|637|0|995|0|{0|in|}357|359|}
{2010006001|XXGobject_psameas_object|638|0|997|0|{metadata|in_metadata|1|0|}359|357|}
{2010006001|XXGobject_psameas_object|639|0|998|0|{Layout|Layout|0|0|}354|290|}
{2010006001|XXGobject_psameas_object|640|0|999|0|{in_metadata|out0_metadata|0|0|}354|295|}
{2010006001|XXGobject_psameas_object|641|0|1000|0|{out_metadata|out0_metadata|0|0|}354|295|}
{2010212001|XXGvertex_oport_oport|642|0|1001|0|{0|out0|}338|360|}
{2010216002|XXGoport_binding_oport|643|0|1003|0|{.5|.5|{0|}736|}360|341|}
{2010213001|XXGoport_dst_flow|644|0|1004|0|{0|}360|309|}
{2010211001|XXGvertex_iport_iport|645|0|1005|0|{0|in0|}338|361|}
{2010215002|XXGiport_binding_iport|646|0|1007|0|{.5|.5|{0|}735|}361|356|}
{2010214001|XXGiport_src_flow|647|0|1008|0|{0|}361|310|}
{2010211001|XXGvertex_iport_iport|648|0|1009|0|{0|in0|}308|362|}
{2010215002|XXGiport_binding_iport|649|0|1011|0|{.5|.5|{0|}536|}362|301|}
{2010214001|XXGiport_src_flow|650|0|1012|0|{0|}362|116|}
{2010601001|XXGgraph_vertex_vertex|651|0|1013|0|{Proxy_Level_Reports|}111|363|}
{2010604001|XXGgraph_flow_flow|652|0|1015|0|{Flow_10|}363|364|}
{2010604001|XXGgraph_flow_flow|653|0|1017|0|{Flow_2|}363|365|}
{2010604001|XXGgraph_flow_flow|654|0|1019|0|{Flow_4|}363|366|}
{2010604001|XXGgraph_flow_flow|655|0|1021|0|{Flow_8|}363|367|}
{2010604001|XXGgraph_flow_flow|656|0|1023|0|{Flow_9|}363|368|}
{2010601001|XXGgraph_vertex_vertex|657|0|1025|0|{Reformat_2|}363|369|}
{2010212001|XXGvertex_oport_oport|658|0|1027|0|{0|out0|}369|370|}
{2010213001|XXGoport_dst_flow|659|0|1029|0|{0|}370|367|}
{2010212001|XXGvertex_oport_oport|660|0|1030|0|{1|reject0|}369|371|}
{2010212001|XXGvertex_oport_oport|661|0|1032|0|{2|error0|}369|372|}
{2010212001|XXGvertex_oport_oport|662|0|1034|0|{3|log|}369|373|}
{2010211001|XXGvertex_iport_iport|663|0|1036|0|{0|in|}369|374|}
{2010007001|XXGobject_proto_object|664|0|1038|0|{}369|375|}
{2010212001|XXGvertex_oport_oport|665|0|1040|0|{0|out0|}375|376|}
{2010006001|XXGobject_psameas_object|666|0|1042|0|{metadata|out0_metadata|1|0|}376|375|}
{2010006001|XXGobject_psameas_object|667|0|1043|0|{transform0|transform0|1|0|}376|375|}
{2010212001|XXGvertex_oport_oport|668|0|1044|0|{1|reject0|}375|377|}
{2010006001|XXGobject_psameas_object|669|0|1046|0|{metadata|reject0_metadata|1|0|}377|375|}
{2010212001|XXGvertex_oport_oport|670|0|1047|0|{2|error0|}375|378|}
{2010006001|XXGobject_psameas_object|671|0|1049|0|{metadata|error0_metadata|1|0|}378|375|}
{2010212001|XXGvertex_oport_oport|672|0|1050|0|{3|log|}375|379|}
{2010006001|XXGobject_psameas_object|673|0|1052|0|{metadata|log_metadata|1|0|}379|375|}
{2010211001|XXGvertex_iport_iport|674|0|1053|0|{0|in|}375|380|}
{2010006001|XXGobject_psameas_object|675|0|1055|0|{metadata|in_metadata|1|0|}380|375|}
{2010006001|XXGobject_psameas_object|676|0|1056|0|{Layout|Layout|0|0|}369|381|}
{2010211001|XXGvertex_iport_iport|677|0|1058|0|{0|write|}381|382|}
{2010214001|XXGiport_src_flow|678|0|1060|0|{0|}382|383|}
{2010007001|XXGobject_proto_object|679|0|1062|0|{}381|384|}
{2010211001|XXGvertex_iport_iport|680|0|1064|0|{0|write|}384|385|}
{2010006001|XXGobject_psameas_object|681|0|1066|0|{metadata|write_metadata|1|0|}385|384|}
{2010006001|XXGobject_psameas_object|682|0|1067|0|{write_metadata|out0_metadata|0|0|}381|369|}
{2010006001|XXGobject_psameas_object|683|0|1068|0|{in_metadata|out0_metadata|0|0|}369|26|}
{2010006001|XXGobject_psameas_object|684|0|1069|0|{reject0_metadata|out0_metadata|0|0|}369|26|}
{2010601001|XXGgraph_vertex_vertex|685|0|1070|0|{Replicate_2|}363|386|}
{2010212001|XXGvertex_oport_oport|686|0|1072|0|{0|out|}386|387|}
{2010213001|XXGoport_dst_flow|687|0|1074|0|{0|}387|364|}
{2010213001|XXGoport_dst_flow|688|0|1075|0|{1|}387|366|}
{2010213001|XXGoport_dst_flow|689|0|1076|0|{2|}387|365|}
{2010213001|XXGoport_dst_flow|690|0|1077|0|{3|}387|368|}
{2010211001|XXGvertex_iport_iport|691|0|1078|0|{0|in|}386|388|}
{2010214001|XXGiport_src_flow|692|0|1080|0|{0|}388|367|}
{2010007001|XXGobject_proto_object|693|0|1081|0|{}386|389|}
{2010212001|XXGvertex_oport_oport|694|0|1083|0|{0|out|}389|390|}
{2010006001|XXGobject_psameas_object|695|0|1085|0|{metadata|out_metadata|1|0|}390|389|}
{2010211001|XXGvertex_iport_iport|696|0|1086|0|{0|in|}389|391|}
{2010006001|XXGobject_psameas_object|697|0|1088|0|{metadata|in_metadata|1|0|}391|389|}
{2010006001|XXGobject_psameas_object|698|0|1089|0|{Layout|Layout|0|0|}386|381|}
{2010006001|XXGobject_psameas_object|699|0|1090|0|{in_metadata|out0_metadata|0|0|}386|369|}
{2010006001|XXGobject_psameas_object|700|0|1091|0|{out_metadata|out0_metadata|0|0|}386|369|}
{2010601001|XXGgraph_vertex_vertex|701|0|1092|0|{reports_with_duplicates|}363|392|}
{2010604001|XXGgraph_flow_flow|702|0|1094|0|{Flow_18|}392|393|}
{2010604001|XXGgraph_flow_flow|703|0|1096|0|{Flow_6|}392|394|}
{2010604001|XXGgraph_flow_flow|704|0|1098|0|{Flow_7|}392|395|}
{2010601001|XXGgraph_vertex_vertex|705|0|1100|0|{Rollup_2|}392|396|}
{2010212001|XXGvertex_oport_oport|706|0|1102|0|{0|out|}396|397|}
{2010213001|XXGoport_dst_flow|707|0|1104|0|{0|}397|393|}
{2010212001|XXGvertex_oport_oport|708|0|1105|0|{1|reject|}396|398|}
{2010212001|XXGvertex_oport_oport|709|0|1107|0|{2|error|}396|399|}
{2010212001|XXGvertex_oport_oport|710|0|1109|0|{3|log|}396|400|}
{2010211001|XXGvertex_iport_iport|711|0|1111|0|{0|in|}396|401|}
{2010007001|XXGobject_proto_object|712|0|1113|0|{}396|402|}
{2010212001|XXGvertex_oport_oport|713|0|1115|0|{0|out|}402|403|}
{2010006001|XXGobject_psameas_object|714|0|1117|0|{metadata|out_metadata|1|0|}403|402|}
{2010212001|XXGvertex_oport_oport|715|0|1118|0|{1|reject|}402|404|}
{2010006001|XXGobject_psameas_object|716|0|1120|0|{metadata|reject_metadata|1|0|}404|402|}
{2010212001|XXGvertex_oport_oport|717|0|1121|0|{2|error|}402|405|}
{2010006001|XXGobject_psameas_object|718|0|1123|0|{metadata|error_metadata|1|0|}405|402|}
{2010212001|XXGvertex_oport_oport|719|0|1124|0|{3|log|}402|406|}
{2010006001|XXGobject_psameas_object|720|0|1126|0|{metadata|log_metadata|1|0|}406|402|}
{2010211001|XXGvertex_iport_iport|721|0|1127|0|{0|in|}402|407|}
{2010006001|XXGobject_psameas_object|722|0|1129|0|{metadata|in_metadata|1|0|}407|402|}
{2010006001|XXGobject_psameas_object|723|0|1130|0|{in_metadata|out0_metadata|0|0|}396|369|}
{2010006001|XXGobject_psameas_object|724|0|1131|0|{out_metadata|in_metadata|0|0|}396|408|}
{2010212001|XXGvertex_oport_oport|725|0|1133|0|{0|reject|}408|409|}
{2010212001|XXGvertex_oport_oport|726|0|1135|0|{1|error|}408|410|}
{2010212001|XXGvertex_oport_oport|727|0|1137|0|{2|log|}408|411|}
{2010211001|XXGvertex_iport_iport|728|0|1139|0|{0|in|}408|412|}
{2010214001|XXGiport_src_flow|729|0|1141|0|{0|}412|393|}
{2010007001|XXGobject_proto_object|730|0|1142|0|{}408|413|}
{2010212001|XXGvertex_oport_oport|731|0|1144|0|{0|reject|}413|414|}
{2010006001|XXGobject_psameas_object|732|0|1146|0|{metadata|reject_metadata|1|0|}414|413|}
{2010212001|XXGvertex_oport_oport|733|0|1147|0|{1|error|}413|415|}
{2010006001|XXGobject_psameas_object|734|0|1149|0|{metadata|error_metadata|1|0|}415|413|}
{2010212001|XXGvertex_oport_oport|735|0|1150|0|{2|log|}413|416|}
{2010006001|XXGobject_psameas_object|736|0|1152|0|{metadata|log_metadata|1|0|}416|413|}
{2010211001|XXGvertex_iport_iport|737|0|1153|0|{0|in|}413|417|}
{2010006001|XXGobject_psameas_object|738|0|1155|0|{metadata|in_metadata|1|0|}417|413|}
{2010006001|XXGobject_psameas_object|739|0|1156|0|{reject_metadata|in_metadata|0|0|}408|408|}
{2010006001|XXGobject_psameas_object|740|0|1157|0|{reject_metadata|out0_metadata|0|0|}396|369|}
{2010601001|XXGgraph_vertex_vertex|741|0|1158|0|{Sort_1|}392|418|}
{2010212001|XXGvertex_oport_oport|742|0|1160|0|{0|out|}418|419|}
{2010213001|XXGoport_dst_flow|743|0|1162|0|{0|}419|394|}
{2010211001|XXGvertex_iport_iport|744|0|1163|0|{0|in|}418|420|}
{2010007001|XXGobject_proto_object|745|0|1165|0|{}418|421|}
{2010212001|XXGvertex_oport_oport|746|0|1167|0|{0|out|}421|422|}
{2010006001|XXGobject_psameas_object|747|0|1169|0|{metadata|out_metadata|1|0|}422|421|}
{2010211001|XXGvertex_iport_iport|748|0|1170|0|{0|in|}421|423|}
{2010006001|XXGobject_psameas_object|749|0|1172|0|{metadata|in_metadata|1|0|}423|421|}
{2010006001|XXGobject_psameas_object|750|0|1173|0|{in_metadata|out0_metadata|0|0|}418|369|}
{2010006001|XXGobject_psameas_object|751|0|1174|0|{out_metadata|out0_metadata|0|0|}418|369|}
{2010601001|XXGgraph_vertex_vertex|752|0|1175|0|{Write_Multiple_Files_4|}392|424|}
{2010212001|XXGvertex_oport_oport|753|0|1177|0|{0|reject|}424|425|}
{2010212001|XXGvertex_oport_oport|754|0|1179|0|{1|error|}424|426|}
{2010212001|XXGvertex_oport_oport|755|0|1181|0|{2|log|}424|427|}
{2010211001|XXGvertex_iport_iport|756|0|1183|0|{0|in|}424|428|}
{2010214001|XXGiport_src_flow|757|0|1185|0|{0|}428|395|}
{2010007001|XXGobject_proto_object|758|0|1186|0|{}424|429|}
{2010212001|XXGvertex_oport_oport|759|0|1188|0|{0|reject|}429|430|}
{2010006001|XXGobject_psameas_object|760|0|1190|0|{metadata|reject_metadata|1|0|}430|429|}
{2010212001|XXGvertex_oport_oport|761|0|1191|0|{1|error|}429|431|}
{2010006001|XXGobject_psameas_object|762|0|1193|0|{metadata|error_metadata|1|0|}431|429|}
{2010212001|XXGvertex_oport_oport|763|0|1194|0|{2|log|}429|432|}
{2010006001|XXGobject_psameas_object|764|0|1196|0|{metadata|log_metadata|1|0|}432|429|}
{2010211001|XXGvertex_iport_iport|765|0|1197|0|{0|in|}429|433|}
{2010006001|XXGobject_psameas_object|766|0|1199|0|{metadata|in_metadata|1|0|}433|429|}
{2010006001|XXGobject_psameas_object|767|0|1200|0|{in_metadata|out_metadata|0|0|}424|434|}
{2010212001|XXGvertex_oport_oport|768|0|1202|0|{0|out|}434|435|}
{2010213001|XXGoport_dst_flow|769|0|1204|0|{0|}435|395|}
{2010211001|XXGvertex_iport_iport|770|0|1205|0|{0|in|}434|436|}
{2010214001|XXGiport_src_flow|771|0|1207|0|{0|}436|394|}
{2010007001|XXGobject_proto_object|772|0|1208|0|{}434|437|}
{2010212001|XXGvertex_oport_oport|773|0|1210|0|{0|out|}437|438|}
{2010006001|XXGobject_psameas_object|774|0|1212|0|{metadata|out_metadata|1|0|}438|437|}
{2010211001|XXGvertex_iport_iport|775|0|1213|0|{0|in|}437|439|}
{2010006001|XXGobject_psameas_object|776|0|1215|0|{metadata|in_metadata|1|0|}439|437|}
{2010006001|XXGobject_psameas_object|777|0|1216|0|{in_metadata|out0_metadata|0|0|}434|369|}
{2010006001|XXGobject_psameas_object|778|0|1217|0|{reject_metadata|out_metadata|0|0|}424|434|}
{2010601001|XXGgraph_vertex_vertex|779|0|1218|0|{Write_Multiple_Files_5|}392|408|}
{2010601001|XXGgraph_vertex_vertex|780|0|1219|0|{Write_Separated_Values_2|}392|434|}
{2010211001|XXGvertex_iport_iport|781|0|1220|0|{0|in0|}392|440|}
{2010215002|XXGiport_binding_iport|782|0|1222|0|{.5|.5|{0|}583|}440|401|}
{2010214001|XXGiport_src_flow|783|0|1223|0|{0|}440|364|}
{2010211001|XXGvertex_iport_iport|784|0|1224|0|{1|in1|}392|441|}
{2010215002|XXGiport_binding_iport|785|0|1226|0|{.5|.5|{0|}584|}441|420|}
{2010214001|XXGiport_src_flow|786|0|1227|0|{0|}441|368|}
{2010601001|XXGgraph_vertex_vertex|787|0|1228|0|{reports_without_duplicates|}363|442|}
{2010604001|XXGgraph_flow_flow|788|0|1230|0|{Flow_1|}442|443|}
{2010604001|XXGgraph_flow_flow|789|0|1232|0|{Flow_17|}442|444|}
{2010604001|XXGgraph_flow_flow|790|0|1234|0|{Flow_3|}442|445|}
{2010604001|XXGgraph_flow_flow|791|0|1236|0|{Flow_5|}442|446|}
{2010601001|XXGgraph_vertex_vertex|792|0|1238|0|{Rollup_1|}442|447|}
{2010212001|XXGvertex_oport_oport|793|0|1240|0|{0|out|}447|448|}
{2010213001|XXGoport_dst_flow|794|0|1242|0|{0|}448|444|}
{2010212001|XXGvertex_oport_oport|795|0|1243|0|{1|reject|}447|449|}
{2010212001|XXGvertex_oport_oport|796|0|1245|0|{2|error|}447|450|}
{2010212001|XXGvertex_oport_oport|797|0|1247|0|{3|log|}447|451|}
{2010211001|XXGvertex_iport_iport|798|0|1249|0|{0|in|}447|452|}
{2010007001|XXGobject_proto_object|799|0|1251|0|{}447|453|}
{2010212001|XXGvertex_oport_oport|800|0|1253|0|{0|out|}453|454|}
{2010006001|XXGobject_psameas_object|801|0|1255|0|{metadata|out_metadata|1|0|}454|453|}
{2010212001|XXGvertex_oport_oport|802|0|1256|0|{1|reject|}453|455|}
{2010006001|XXGobject_psameas_object|803|0|1258|0|{metadata|reject_metadata|1|0|}455|453|}
{2010212001|XXGvertex_oport_oport|804|0|1259|0|{2|error|}453|456|}
{2010006001|XXGobject_psameas_object|805|0|1261|0|{metadata|error_metadata|1|0|}456|453|}
{2010212001|XXGvertex_oport_oport|806|0|1262|0|{3|log|}453|457|}
{2010006001|XXGobject_psameas_object|807|0|1264|0|{metadata|log_metadata|1|0|}457|453|}
{2010211001|XXGvertex_iport_iport|808|0|1265|0|{0|in|}453|458|}
{2010006001|XXGobject_psameas_object|809|0|1267|0|{metadata|in_metadata|1|0|}458|453|}
{2010006001|XXGobject_psameas_object|810|0|1268|0|{Layout|Layout|0|0|}447|381|}
{2010006001|XXGobject_psameas_object|811|0|1269|0|{in_metadata|out0_metadata|0|0|}447|369|}
{2010006001|XXGobject_psameas_object|812|0|1270|0|{out_metadata|in_metadata|0|0|}447|459|}
{2010212001|XXGvertex_oport_oport|813|0|1272|0|{0|reject|}459|460|}
{2010212001|XXGvertex_oport_oport|814|0|1274|0|{1|error|}459|461|}
{2010212001|XXGvertex_oport_oport|815|0|1276|0|{2|log|}459|462|}
{2010211001|XXGvertex_iport_iport|816|0|1278|0|{0|in|}459|463|}
{2010214001|XXGiport_src_flow|817|0|1280|0|{0|}463|444|}
{2010007001|XXGobject_proto_object|818|0|1281|0|{}459|464|}
{2010212001|XXGvertex_oport_oport|819|0|1283|0|{0|reject|}464|465|}
{2010006001|XXGobject_psameas_object|820|0|1285|0|{metadata|reject_metadata|1|0|}465|464|}
{2010212001|XXGvertex_oport_oport|821|0|1286|0|{1|error|}464|466|}
{2010006001|XXGobject_psameas_object|822|0|1288|0|{metadata|error_metadata|1|0|}466|464|}
{2010212001|XXGvertex_oport_oport|823|0|1289|0|{2|log|}464|467|}
{2010006001|XXGobject_psameas_object|824|0|1291|0|{metadata|log_metadata|1|0|}467|464|}
{2010211001|XXGvertex_iport_iport|825|0|1292|0|{0|in|}464|468|}
{2010006001|XXGobject_psameas_object|826|0|1294|0|{metadata|in_metadata|1|0|}468|464|}
{2010006001|XXGobject_psameas_object|827|0|1295|0|{Layout|Layout|0|0|}459|381|}
{2010006001|XXGobject_psameas_object|828|0|1296|0|{reject_metadata|in_metadata|0|0|}459|459|}
{2010006001|XXGobject_psameas_object|829|0|1297|0|{reject_metadata|out0_metadata|0|0|}447|369|}
{2010601001|XXGgraph_vertex_vertex|830|0|1298|0|{Sort|}442|469|}
{2010212001|XXGvertex_oport_oport|831|0|1300|0|{0|out|}469|470|}
{2010213001|XXGoport_dst_flow|832|0|1302|0|{0|}470|443|}
{2010211001|XXGvertex_iport_iport|833|0|1303|0|{0|in|}469|471|}
{2010214001|XXGiport_src_flow|834|0|1305|0|{0|}471|446|}
{2010007001|XXGobject_proto_object|835|0|1306|0|{}469|472|}
{2010212001|XXGvertex_oport_oport|836|0|1308|0|{0|out|}472|473|}
{2010006001|XXGobject_psameas_object|837|0|1310|0|{metadata|out_metadata|1|0|}473|472|}
{2010211001|XXGvertex_iport_iport|838|0|1311|0|{0|in|}472|474|}
{2010006001|XXGobject_psameas_object|839|0|1313|0|{metadata|in_metadata|1|0|}474|472|}
{2010006001|XXGobject_psameas_object|840|0|1314|0|{Layout|Layout|0|0|}469|381|}
{2010006001|XXGobject_psameas_object|841|0|1315|0|{in_metadata|out0_metadata|0|0|}469|369|}
{2010006001|XXGobject_psameas_object|842|0|1316|0|{out_metadata|out0_metadata|0|0|}469|369|}
{2010601001|XXGgraph_vertex_vertex|843|0|1317|0|{Write_Multiple_Files_2|}442|459|}
{2010601001|XXGgraph_vertex_vertex|844|0|1318|0|{Write_Multiple_Files_3|}442|475|}
{2010212001|XXGvertex_oport_oport|845|0|1320|0|{0|reject|}475|476|}
{2010212001|XXGvertex_oport_oport|846|0|1322|0|{1|error|}475|477|}
{2010212001|XXGvertex_oport_oport|847|0|1324|0|{2|log|}475|478|}
{2010211001|XXGvertex_iport_iport|848|0|1326|0|{0|in|}475|479|}
{2010214001|XXGiport_src_flow|849|0|1328|0|{0|}479|445|}
{2010007001|XXGobject_proto_object|850|0|1329|0|{}475|480|}
{2010212001|XXGvertex_oport_oport|851|0|1331|0|{0|reject|}480|481|}
{2010006001|XXGobject_psameas_object|852|0|1333|0|{metadata|reject_metadata|1|0|}481|480|}
{2010212001|XXGvertex_oport_oport|853|0|1334|0|{1|error|}480|482|}
{2010006001|XXGobject_psameas_object|854|0|1336|0|{metadata|error_metadata|1|0|}482|480|}
{2010212001|XXGvertex_oport_oport|855|0|1337|0|{2|log|}480|483|}
{2010006001|XXGobject_psameas_object|856|0|1339|0|{metadata|log_metadata|1|0|}483|480|}
{2010211001|XXGvertex_iport_iport|857|0|1340|0|{0|in|}480|484|}
{2010006001|XXGobject_psameas_object|858|0|1342|0|{metadata|in_metadata|1|0|}484|480|}
{2010006001|XXGobject_psameas_object|859|0|1343|0|{Layout|Layout|0|0|}475|381|}
{2010006001|XXGobject_psameas_object|860|0|1344|0|{in_metadata|out_metadata|0|0|}475|485|}
{2010212001|XXGvertex_oport_oport|861|0|1346|0|{0|out|}485|486|}
{2010213001|XXGoport_dst_flow|862|0|1348|0|{0|}486|445|}
{2010211001|XXGvertex_iport_iport|863|0|1349|0|{0|in|}485|487|}
{2010214001|XXGiport_src_flow|864|0|1351|0|{0|}487|443|}
{2010007001|XXGobject_proto_object|865|0|1352|0|{}485|488|}
{2010212001|XXGvertex_oport_oport|866|0|1354|0|{0|out|}488|489|}
{2010006001|XXGobject_psameas_object|867|0|1356|0|{metadata|out_metadata|1|0|}489|488|}
{2010211001|XXGvertex_iport_iport|868|0|1357|0|{0|in|}488|490|}
{2010006001|XXGobject_psameas_object|869|0|1359|0|{metadata|in_metadata|1|0|}490|488|}
{2010006001|XXGobject_psameas_object|870|0|1360|0|{Layout|Layout|0|0|}485|381|}
{2010006001|XXGobject_psameas_object|871|0|1361|0|{in_metadata|out0_metadata|0|0|}485|369|}
{2010006001|XXGobject_psameas_object|872|0|1362|0|{reject_metadata|out_metadata|0|0|}475|485|}
{2010601001|XXGgraph_vertex_vertex|873|0|1363|0|{Write_Separated_Values_1|}442|485|}
{2010601001|XXGgraph_vertex_vertex|874|0|1364|0|{dedup_record|}442|491|}
{2010604001|XXGgraph_flow_flow|875|0|1366|0|{Flow_1|}491|383|}
{2010604001|XXGgraph_flow_flow|876|0|1367|0|{Flow_6|}491|492|}
{2010601001|XXGgraph_vertex_vertex|877|0|1369|0|{Dedup_Sorted|}491|493|}
{2010212001|XXGvertex_oport_oport|878|0|1371|0|{0|out|}493|494|}
{2010212001|XXGvertex_oport_oport|879|0|1373|0|{1|dup|}493|495|}
{2010213001|XXGoport_dst_flow|880|0|1375|0|{0|}495|383|}
{2010212001|XXGvertex_oport_oport|881|0|1376|0|{2|reject|}493|496|}
{2010212001|XXGvertex_oport_oport|882|0|1378|0|{3|error|}493|497|}
{2010212001|XXGvertex_oport_oport|883|0|1380|0|{4|log|}493|498|}
{2010211001|XXGvertex_iport_iport|884|0|1382|0|{0|in|}493|499|}
{2010214001|XXGiport_src_flow|885|0|1384|0|{0|}499|492|}
{2010007001|XXGobject_proto_object|886|0|1385|0|{}493|500|}
{2010212001|XXGvertex_oport_oport|887|0|1387|0|{0|out|}500|501|}
{2010006001|XXGobject_psameas_object|888|0|1389|0|{metadata|out_metadata|1|0|}501|500|}
{2010212001|XXGvertex_oport_oport|889|0|1390|0|{1|dup|}500|502|}
{2010006001|XXGobject_psameas_object|890|0|1392|0|{metadata|dup_metadata|1|0|}502|500|}
{2010212001|XXGvertex_oport_oport|891|0|1393|0|{2|reject|}500|503|}
{2010006001|XXGobject_psameas_object|892|0|1395|0|{metadata|reject_metadata|1|0|}503|500|}
{2010212001|XXGvertex_oport_oport|893|0|1396|0|{3|error|}500|504|}
{2010006001|XXGobject_psameas_object|894|0|1398|0|{metadata|error_metadata|1|0|}504|500|}
{2010212001|XXGvertex_oport_oport|895|0|1399|0|{4|log|}500|505|}
{2010006001|XXGobject_psameas_object|896|0|1401|0|{metadata|log_metadata|1|0|}505|500|}
{2010211001|XXGvertex_iport_iport|897|0|1402|0|{0|in|}500|506|}
{2010006001|XXGobject_psameas_object|898|0|1404|0|{metadata|in_metadata|1|0|}506|500|}
{2010006001|XXGobject_psameas_object|899|0|1405|0|{Layout|Layout|0|0|}493|381|}
{2010006001|XXGobject_psameas_object|900|0|1406|0|{dup_metadata|out0_metadata|0|0|}493|369|}
{2010006001|XXGobject_psameas_object|901|0|1407|0|{in_metadata|out0_metadata|0|0|}493|369|}
{2010006001|XXGobject_psameas_object|902|0|1408|0|{out_metadata|out0_metadata|0|0|}493|369|}
{2010006001|XXGobject_psameas_object|903|0|1409|0|{reject_metadata|out0_metadata|0|0|}493|369|}
{2010601001|XXGgraph_vertex_vertex|904|0|1410|0|{Output_File|}491|381|}
{2010601001|XXGgraph_vertex_vertex|905|0|1411|0|{Sort|}491|507|}
{2010212001|XXGvertex_oport_oport|906|0|1413|0|{0|out|}507|508|}
{2010213001|XXGoport_dst_flow|907|0|1415|0|{0|}508|492|}
{2010211001|XXGvertex_iport_iport|908|0|1416|0|{0|in|}507|509|}
{2010007001|XXGobject_proto_object|909|0|1418|0|{}507|510|}
{2010212001|XXGvertex_oport_oport|910|0|1420|0|{0|out|}510|511|}
{2010006001|XXGobject_psameas_object|911|0|1422|0|{metadata|out_metadata|1|0|}511|510|}
{2010211001|XXGvertex_iport_iport|912|0|1423|0|{0|in|}510|512|}
{2010006001|XXGobject_psameas_object|913|0|1425|0|{metadata|in_metadata|1|0|}512|510|}
{2010006001|XXGobject_psameas_object|914|0|1426|0|{Layout|Layout|0|0|}507|381|}
{2010006001|XXGobject_psameas_object|915|0|1427|0|{in_metadata|out0_metadata|0|0|}507|369|}
{2010006001|XXGobject_psameas_object|916|0|1428|0|{out_metadata|out0_metadata|0|0|}507|369|}
{2010212001|XXGvertex_oport_oport|917|0|1429|0|{0|out0|}491|513|}
{2010216002|XXGoport_binding_oport|918|0|1431|0|{.5|.5|{0|}733|}513|494|}
{2010213001|XXGoport_dst_flow|919|0|1432|0|{0|}513|446|}
{2010211001|XXGvertex_iport_iport|920|0|1433|0|{0|in0|}491|514|}
{2010215002|XXGiport_binding_iport|921|0|1435|0|{.5|.5|{0|}732|}514|509|}
{2010211001|XXGvertex_iport_iport|922|0|1436|0|{0|in0|}442|515|}
{2010215002|XXGiport_binding_iport|923|0|1438|0|{.5|.5|{0|}630|}515|452|}
{2010214001|XXGiport_src_flow|924|0|1439|0|{0|}515|366|}
{2010211001|XXGvertex_iport_iport|925|0|1440|0|{1|in1|}442|516|}
{2010215002|XXGiport_binding_iport|926|0|1442|0|{.5|.5|{0|}631|}516|514|}
{2010214001|XXGiport_src_flow|927|0|1443|0|{0|}516|365|}
{2010211001|XXGvertex_iport_iport|928|0|1444|0|{0|in0|}363|517|}
{2010215002|XXGiport_binding_iport|929|0|1446|0|{.5|.5|{0|}615|}517|374|}
{2010214001|XXGiport_src_flow|930|0|1447|0|{0|}517|117|}
{2010601001|XXGgraph_vertex_vertex|931|0|1448|0|{Replicate|}111|518|}
{2010212001|XXGvertex_oport_oport|932|0|1450|0|{0|out|}518|519|}
{2010213001|XXGoport_dst_flow|933|0|1452|0|{0|}519|116|}
{2010213001|XXGoport_dst_flow|934|0|1453|0|{1|}519|117|}
{2010211001|XXGvertex_iport_iport|935|0|1454|0|{0|in|}518|520|}
{2010214001|XXGiport_src_flow|936|0|1456|0|{0|}520|115|}
{2010007001|XXGobject_proto_object|937|0|1457|0|{}518|521|}
{2010212001|XXGvertex_oport_oport|938|0|1459|0|{0|out|}521|522|}
{2010006001|XXGobject_psameas_object|939|0|1461|0|{metadata|out_metadata|1|0|}522|521|}
{2010211001|XXGvertex_iport_iport|940|0|1462|0|{0|in|}521|523|}
{2010006001|XXGobject_psameas_object|941|0|1464|0|{metadata|in_metadata|1|0|}523|521|}
{2010006001|XXGobject_psameas_object|942|0|1465|0|{Layout|Layout|0|0|}518|290|}
{2010006001|XXGobject_psameas_object|943|0|1466|0|{in_metadata|out0_metadata|0|0|}518|26|}
{2010006001|XXGobject_psameas_object|944|0|1467|0|{out_metadata|out0_metadata|0|0|}518|26|}
{2010601001|XXGgraph_vertex_vertex|945|0|1468|0|{Replicate_3|}111|524|}
{2010212001|XXGvertex_oport_oport|946|0|1470|0|{0|out|}524|525|}
{2010213001|XXGoport_dst_flow|947|0|1472|0|{0|}525|112|}
{2010213001|XXGoport_dst_flow|948|0|1473|0|{1|}525|118|}
{2010211001|XXGvertex_iport_iport|949|0|1474|0|{0|in|}524|526|}
{2010007001|XXGobject_proto_object|950|0|1476|0|{}524|527|}
{2010212001|XXGvertex_oport_oport|951|0|1478|0|{0|out|}527|528|}
{2010006001|XXGobject_psameas_object|952|0|1480|0|{metadata|out_metadata|1|0|}528|527|}
{2010211001|XXGvertex_iport_iport|953|0|1481|0|{0|in|}527|529|}
{2010006001|XXGobject_psameas_object|954|0|1483|0|{metadata|in_metadata|1|0|}529|527|}
{2010006001|XXGobject_psameas_object|955|0|1484|0|{Layout|Layout|0|0|}524|530|}
{2010211001|XXGvertex_iport_iport|956|0|1486|0|{0|write|}530|531|}
{2010214001|XXGiport_src_flow|957|0|1488|0|{0|}531|532|}
{2010244001|XXGflow_watcher_watcher|958|0|1490|0|{}532|533|}
{2010007001|XXGobject_proto_object|959|0|1492|0|{}530|534|}
{2010211001|XXGvertex_iport_iport|960|0|1494|0|{0|write|}534|535|}
{2010006001|XXGobject_psameas_object|961|0|1496|0|{metadata|write_metadata|1|0|}535|534|}
{2010006001|XXGobject_psameas_object|962|0|1497|0|{write_metadata|out0_metadata|0|0|}530|26|}
{2010006001|XXGobject_psameas_object|963|0|1498|0|{in_metadata|out0_metadata|0|0|}524|26|}
{2010006001|XXGobject_psameas_object|964|0|1499|0|{out_metadata|out0_metadata|0|0|}524|26|}
{2010601001|XXGgraph_vertex_vertex|965|0|1500|0|{fbe_jn_remove_proxy_with_final_price|}111|536|}
{2010604001|XXGgraph_flow_flow|966|0|1502|0|{Flow_1|}536|537|}
{2010604001|XXGgraph_flow_flow|967|0|1504|0|{Flow_11|}536|532|}
{2010604001|XXGgraph_flow_flow|968|0|1505|0|{Flow_6|}536|538|}
{2010244001|XXGflow_watcher_watcher|969|0|1507|0|{}538|539|}
{2010604001|XXGgraph_flow_flow|970|0|1509|0|{Flow_7|}536|540|}
{2010244001|XXGflow_watcher_watcher|971|0|1511|0|{}540|541|}
{2010604001|XXGgraph_flow_flow|972|0|1513|0|{Flow_8|}536|542|}
{2010604001|XXGgraph_flow_flow|973|0|1515|0|{Flow_9|}536|543|}
{2010244001|XXGflow_watcher_watcher|974|0|1517|0|{}543|544|}
{2010601001|XXGgraph_vertex_vertex|975|0|1519|0|{Filter_by_Expression_1|}536|545|}
{2010212001|XXGvertex_oport_oport|976|0|1521|0|{0|out|}545|546|}
{2010213001|XXGoport_dst_flow|977|0|1523|0|{0|}546|538|}
{2010212001|XXGvertex_oport_oport|978|0|1524|0|{1|deselect|}545|547|}
{2010213001|XXGoport_dst_flow|979|0|1526|0|{0|}547|540|}
{2010212001|XXGvertex_oport_oport|980|0|1527|0|{2|reject|}545|548|}
{2010212001|XXGvertex_oport_oport|981|0|1529|0|{3|error|}545|549|}
{2010212001|XXGvertex_oport_oport|982|0|1531|0|{4|log|}545|550|}
{2010211001|XXGvertex_iport_iport|983|0|1533|0|{0|in|}545|551|}
{2010214001|XXGiport_src_flow|984|0|1535|0|{0|}551|537|}
{2010007001|XXGobject_proto_object|985|0|1536|0|{}545|552|}
{2010212001|XXGvertex_oport_oport|986|0|1538|0|{0|out|}552|553|}
{2010006001|XXGobject_psameas_object|987|0|1540|0|{metadata|out_metadata|1|0|}553|552|}
{2010212001|XXGvertex_oport_oport|988|0|1541|0|{1|deselect|}552|554|}
{2010006001|XXGobject_psameas_object|989|0|1543|0|{metadata|deselect_metadata|1|0|}554|552|}
{2010212001|XXGvertex_oport_oport|990|0|1544|0|{2|reject|}552|555|}
{2010006001|XXGobject_psameas_object|991|0|1546|0|{metadata|reject_metadata|1|0|}555|552|}
{2010212001|XXGvertex_oport_oport|992|0|1547|0|{3|error|}552|556|}
{2010006001|XXGobject_psameas_object|993|0|1549|0|{metadata|error_metadata|1|0|}556|552|}
{2010212001|XXGvertex_oport_oport|994|0|1550|0|{4|log|}552|557|}
{2010006001|XXGobject_psameas_object|995|0|1552|0|{metadata|log_metadata|1|0|}557|552|}
{2010211001|XXGvertex_iport_iport|996|0|1553|0|{0|in|}552|558|}
{2010006001|XXGobject_psameas_object|997|0|1555|0|{metadata|in_metadata|1|0|}558|552|}
{2010006001|XXGobject_psameas_object|998|0|1556|0|{Layout|Layout|0|0|}545|530|}
{2010006001|XXGobject_psameas_object|999|0|1557|0|{deselect_metadata|out0_metadata|0|0|}545|26|}
{2010006001|XXGobject_psameas_object|1000|0|1558|0|{in_metadata|out0_metadata|0|0|}545|26|}
{2010006001|XXGobject_psameas_object|1001|0|1559|0|{out_metadata|out0_metadata|0|0|}545|26|}
{2010006001|XXGobject_psameas_object|1002|0|1560|0|{reject_metadata|out0_metadata|0|0|}545|26|}
{2010601001|XXGgraph_vertex_vertex|1003|0|1561|0|{Filter_by_Expression_2|}536|559|}
{2010212001|XXGvertex_oport_oport|1004|0|1563|0|{0|out|}559|560|}
{2010213001|XXGoport_dst_flow|1005|0|1565|0|{0|}560|532|}
{2010212001|XXGvertex_oport_oport|1006|0|1566|0|{1|deselect|}559|561|}
{2010213001|XXGoport_dst_flow|1007|0|1568|0|{0|}561|537|}
{2010212001|XXGvertex_oport_oport|1008|0|1569|0|{2|reject|}559|562|}
{2010212001|XXGvertex_oport_oport|1009|0|1571|0|{3|error|}559|563|}
{2010212001|XXGvertex_oport_oport|1010|0|1573|0|{4|log|}559|564|}
{2010211001|XXGvertex_iport_iport|1011|0|1575|0|{0|in|}559|565|}
{2010214001|XXGiport_src_flow|1012|0|1577|0|{0|}565|543|}
{2010007001|XXGobject_proto_object|1013|0|1578|0|{}559|566|}
{2010212001|XXGvertex_oport_oport|1014|0|1580|0|{0|out|}566|567|}
{2010006001|XXGobject_psameas_object|1015|0|1582|0|{metadata|out_metadata|1|0|}567|566|}
{2010212001|XXGvertex_oport_oport|1016|0|1583|0|{1|deselect|}566|568|}
{2010006001|XXGobject_psameas_object|1017|0|1585|0|{metadata|deselect_metadata|1|0|}568|566|}
{2010212001|XXGvertex_oport_oport|1018|0|1586|0|{2|reject|}566|569|}
{2010006001|XXGobject_psameas_object|1019|0|1588|0|{metadata|reject_metadata|1|0|}569|566|}
{2010212001|XXGvertex_oport_oport|1020|0|1589|0|{3|error|}566|570|}
{2010006001|XXGobject_psameas_object|1021|0|1591|0|{metadata|error_metadata|1|0|}570|566|}
{2010212001|XXGvertex_oport_oport|1022|0|1592|0|{4|log|}566|571|}
{2010006001|XXGobject_psameas_object|1023|0|1594|0|{metadata|log_metadata|1|0|}571|566|}
{2010211001|XXGvertex_iport_iport|1024|0|1595|0|{0|in|}566|572|}
{2010006001|XXGobject_psameas_object|1025|0|1597|0|{metadata|in_metadata|1|0|}572|566|}
{2010006001|XXGobject_psameas_object|1026|0|1598|0|{Layout|Layout|0|0|}559|530|}
{2010006001|XXGobject_psameas_object|1027|0|1599|0|{deselect_metadata|out0_metadata|0|0|}559|26|}
{2010006001|XXGobject_psameas_object|1028|0|1600|0|{in_metadata|out0_metadata|0|0|}559|26|}
{2010006001|XXGobject_psameas_object|1029|0|1601|0|{out_metadata|out0_metadata|0|0|}559|26|}
{2010006001|XXGobject_psameas_object|1030|0|1602|0|{reject_metadata|out0_metadata|0|0|}559|26|}
{2010601001|XXGgraph_vertex_vertex|1031|0|1603|0|{Join|}536|573|}
{2010212001|XXGvertex_oport_oport|1032|0|1605|0|{0|out|}573|574|}
{2010213001|XXGoport_dst_flow|1033|0|1607|0|{0|}574|542|}
{2010212001|XXGvertex_oport_oport|1034|0|1608|0|{1|unused0|}573|575|}
{2010212001|XXGvertex_oport_oport|1035|0|1610|0|{2|unused1|}573|576|}
{2010212001|XXGvertex_oport_oport|1036|0|1612|0|{3|reject0|}573|577|}
{2010212001|XXGvertex_oport_oport|1037|0|1614|0|{4|reject1|}573|578|}
{2010212001|XXGvertex_oport_oport|1038|0|1616|0|{5|error0|}573|579|}
{2010212001|XXGvertex_oport_oport|1039|0|1618|0|{6|error1|}573|580|}
{2010212001|XXGvertex_oport_oport|1040|0|1620|0|{7|log|}573|581|}
{2010211001|XXGvertex_iport_iport|1041|0|1622|0|{0|in0|}573|582|}
{2010214001|XXGiport_src_flow|1042|0|1624|0|{0|}582|538|}
{2010211001|XXGvertex_iport_iport|1043|0|1625|0|{1|in1|}573|583|}
{2010214001|XXGiport_src_flow|1044|0|1627|0|{0|}583|540|}
{2010007001|XXGobject_proto_object|1045|0|1628|0|{}573|584|}
{2010212001|XXGvertex_oport_oport|1046|0|1630|0|{0|out|}584|585|}
{2010006001|XXGobject_psameas_object|1047|0|1632|0|{metadata|out_metadata|1|0|}585|584|}
{2010212001|XXGvertex_oport_oport|1048|0|1633|0|{1|unused0|}584|586|}
{2010006001|XXGobject_psameas_object|1049|0|1635|0|{metadata|unused0_metadata|1|0|}586|584|}
{2010212001|XXGvertex_oport_oport|1050|0|1636|0|{2|unused1|}584|587|}
{2010006001|XXGobject_psameas_object|1051|0|1638|0|{metadata|unused1_metadata|1|0|}587|584|}
{2010212001|XXGvertex_oport_oport|1052|0|1639|0|{3|reject0|}584|588|}
{2010006001|XXGobject_psameas_object|1053|0|1641|0|{metadata|reject0_metadata|1|0|}588|584|}
{2010212001|XXGvertex_oport_oport|1054|0|1642|0|{4|reject1|}584|589|}
{2010006001|XXGobject_psameas_object|1055|0|1644|0|{metadata|reject1_metadata|1|0|}589|584|}
{2010212001|XXGvertex_oport_oport|1056|0|1645|0|{5|error0|}584|590|}
{2010006001|XXGobject_psameas_object|1057|0|1647|0|{metadata|error0_metadata|1|0|}590|584|}
{2010212001|XXGvertex_oport_oport|1058|0|1648|0|{6|error1|}584|591|}
{2010006001|XXGobject_psameas_object|1059|0|1650|0|{metadata|error1_metadata|1|0|}591|584|}
{2010212001|XXGvertex_oport_oport|1060|0|1651|0|{7|log|}584|592|}
{2010006001|XXGobject_psameas_object|1061|0|1653|0|{metadata|log_metadata|1|0|}592|584|}
{2010211001|XXGvertex_iport_iport|1062|0|1654|0|{0|in0|}584|593|}
{2010006001|XXGobject_psameas_object|1063|0|1656|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1064|0|1657|0|{dedup0|dedup0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1065|0|1658|0|{dedup_keyword0|dedup_keyword0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1066|0|1659|0|{dedup_positional0|dedup_positional0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1067|0|1660|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1068|0|1661|0|{matchoptional_positional0|matchoptional_positional0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1069|0|1662|0|{metadata|in0_metadata|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1070|0|1663|0|{override_key0|override_key0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1071|0|1664|0|{record_match_required0|record_match_required0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1072|0|1665|0|{record_match_required_not0|record_match_required_not0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1073|0|1666|0|{record_required0|record_required0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1074|0|1667|0|{record_required_keyword0|record_required_keyword0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1075|0|1668|0|{record_required_positional0|record_required_positional0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1076|0|1669|0|{select0|select0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1077|0|1670|0|{select_keyword0|select_keyword0|1|0|}593|584|}
{2010006001|XXGobject_psameas_object|1078|0|1671|0|{select_positional0|select_positional0|1|0|}593|584|}
{2010211001|XXGvertex_iport_iport|1079|0|1672|0|{1|in1|}584|594|}
{2010006001|XXGobject_psameas_object|1080|0|1674|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1081|0|1675|0|{dedup1|dedup1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1082|0|1676|0|{dedup_keyword1|dedup_keyword1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1083|0|1677|0|{dedup_positional1|dedup_positional1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1084|0|1678|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1085|0|1679|0|{matchoptional_positional1|matchoptional_positional1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1086|0|1680|0|{metadata|in1_metadata|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1087|0|1681|0|{override_key1|override_key1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1088|0|1682|0|{record_match_required1|record_match_required1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1089|0|1683|0|{record_match_required_not1|record_match_required_not1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1090|0|1684|0|{record_required1|record_required1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1091|0|1685|0|{record_required_keyword1|record_required_keyword1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1092|0|1686|0|{record_required_positional1|record_required_positional1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1093|0|1687|0|{select1|select1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1094|0|1688|0|{select_keyword1|select_keyword1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1095|0|1689|0|{select_positional1|select_positional1|1|0|}594|584|}
{2010006001|XXGobject_psameas_object|1096|0|1690|0|{Layout|Layout|0|0|}573|530|}
{2010006001|XXGobject_psameas_object|1097|0|1691|0|{in0_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1098|0|1692|0|{in1_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1099|0|1693|0|{out_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1100|0|1694|0|{reject0_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1101|0|1695|0|{reject1_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1102|0|1696|0|{unused0_metadata|out0_metadata|0|0|}573|26|}
{2010006001|XXGobject_psameas_object|1103|0|1697|0|{unused1_metadata|out0_metadata|0|0|}573|26|}
{2010601001|XXGgraph_vertex_vertex|1104|0|1698|0|{Output_File|}536|530|}
{2010601001|XXGgraph_vertex_vertex|1105|0|1699|0|{Sort|}536|595|}
{2010212001|XXGvertex_oport_oport|1106|0|1701|0|{0|out|}595|596|}
{2010213001|XXGoport_dst_flow|1107|0|1703|0|{0|}596|543|}
{2010211001|XXGvertex_iport_iport|1108|0|1704|0|{0|in|}595|597|}
{2010007001|XXGobject_proto_object|1109|0|1706|0|{}595|598|}
{2010212001|XXGvertex_oport_oport|1110|0|1708|0|{0|out|}598|599|}
{2010006001|XXGobject_psameas_object|1111|0|1710|0|{metadata|out_metadata|1|0|}599|598|}
{2010211001|XXGvertex_iport_iport|1112|0|1711|0|{0|in|}598|600|}
{2010006001|XXGobject_psameas_object|1113|0|1713|0|{metadata|in_metadata|1|0|}600|598|}
{2010006001|XXGobject_psameas_object|1114|0|1714|0|{Layout|Layout|0|0|}595|530|}
{2010006001|XXGobject_psameas_object|1115|0|1715|0|{in_metadata|out0_metadata|0|0|}595|26|}
{2010006001|XXGobject_psameas_object|1116|0|1716|0|{out_metadata|out0_metadata|0|0|}595|26|}
{2010601001|XXGgraph_vertex_vertex|1117|0|1717|0|{Trash|}536|601|}
{2010211001|XXGvertex_iport_iport|1118|0|1719|0|{0|in|}601|602|}
{2010214001|XXGiport_src_flow|1119|0|1721|0|{0|}602|542|}
{2010007001|XXGobject_proto_object|1120|0|1722|0|{}601|603|}
{2010211001|XXGvertex_iport_iport|1121|0|1724|0|{0|in|}603|604|}
{2010006001|XXGobject_psameas_object|1122|0|1726|0|{metadata|in_metadata|1|0|}604|603|}
{2010006001|XXGobject_psameas_object|1123|0|1727|0|{Layout|Layout|0|0|}601|530|}
{2010006001|XXGobject_psameas_object|1124|0|1728|0|{in_metadata|out0_metadata|0|0|}601|26|}
{2010212001|XXGvertex_oport_oport|1125|0|1729|0|{0|out0|}536|605|}
{2010216002|XXGoport_binding_oport|1126|0|1731|0|{.5|.5|{0|}896|}605|576|}
{2010213001|XXGoport_dst_flow|1127|0|1732|0|{0|}605|113|}
{2010211001|XXGvertex_iport_iport|1128|0|1733|0|{0|in0|}536|606|}
{2010215002|XXGiport_binding_iport|1129|0|1735|0|{.5|.5|{0|}895|}606|597|}
{2010214001|XXGiport_src_flow|1130|0|1736|0|{0|}606|118|}
{2010211001|XXGvertex_iport_iport|1131|0|1737|0|{0|in0|}111|607|}
{2010215002|XXGiport_binding_iport|1132|0|1739|0|{.5|.5|{0|}892|}607|526|}
{2010214001|XXGiport_src_flow|1133|0|1740|0|{0|}607|23|}
{2010211001|XXGvertex_iport_iport|1134|0|1741|0|{0|in0|}22|608|}
{2010215002|XXGiport_binding_iport|1135|0|1743|0|{.5|.5|{0|}499|}608|31|}
{2010214001|XXGiport_src_flow|1136|0|1744|0|{0|}608|6|}
{2010601001|XXGgraph_vertex_vertex|1137|0|1745|0|{ddp_remove_unique_proxy_ndc_1|}1|609|}
{2010604001|XXGgraph_flow_flow|1138|0|1747|0|{Flow_1|}609|610|}
{2010244001|XXGflow_watcher_watcher|1139|0|1749|0|{}610|611|}
{2010604001|XXGgraph_flow_flow|1140|0|1751|0|{Flow_14|}609|612|}
{2010244001|XXGflow_watcher_watcher|1141|0|1753|0|{}612|613|}
{2010604001|XXGgraph_flow_flow|1142|0|1755|0|{Flow_17|}609|614|}
{2010604001|XXGgraph_flow_flow|1143|0|1757|0|{Flow_18|}609|615|}
{2010601001|XXGgraph_vertex_vertex|1144|0|1759|0|{Convert_to_CSV|}609|616|}
{2010604001|XXGgraph_flow_flow|1145|0|1761|0|{Flow_1|}616|617|}
{2010604001|XXGgraph_flow_flow|1146|0|1763|0|{Flow_2|}616|618|}
{2010604001|XXGgraph_flow_flow|1147|0|1765|0|{Flow_3|}616|619|}
{2010604001|XXGgraph_flow_flow|1148|0|1767|0|{Flow_4|}616|620|}
{2010604001|XXGgraph_flow_flow|1149|0|1769|0|{Flow_5|}616|621|}
{2010601001|XXGgraph_vertex_vertex|1150|0|1771|0|{Concatenate|}616|622|}
{2010212001|XXGvertex_oport_oport|1151|0|1773|0|{0|out|}622|623|}
{2010213001|XXGoport_dst_flow|1152|0|1775|0|{0|}623|620|}
{2010211001|XXGvertex_iport_iport|1153|0|1776|0|{0|in|}622|624|}
{2010214001|XXGiport_src_flow|1154|0|1778|0|{0|}624|619|}
{2010214001|XXGiport_src_flow|1155|0|1779|0|{1|}624|618|}
{2010007001|XXGobject_proto_object|1156|0|1780|0|{}622|625|}
{2010212001|XXGvertex_oport_oport|1157|0|1782|0|{0|out|}625|626|}
{2010006001|XXGobject_psameas_object|1158|0|1784|0|{metadata|out_metadata|1|0|}626|625|}
{2010211001|XXGvertex_iport_iport|1159|0|1785|0|{0|in|}625|627|}
{2010006001|XXGobject_psameas_object|1160|0|1787|0|{metadata|in_metadata|1|0|}627|625|}
{2010006001|XXGobject_psameas_object|1161|0|1788|0|{Layout|Layout|0|0|}622|628|}
{2010211001|XXGvertex_iport_iport|1162|0|1790|0|{0|write|}628|629|}
{2010214001|XXGiport_src_flow|1163|0|1792|0|{0|}629|620|}
{2010007001|XXGobject_proto_object|1164|0|1793|0|{}628|630|}
{2010211001|XXGvertex_iport_iport|1165|0|1795|0|{0|write|}630|631|}
{2010006001|XXGobject_psameas_object|1166|0|1797|0|{metadata|write_metadata|1|0|}631|630|}
{2010006001|XXGobject_psameas_object|1167|0|1798|0|{write_metadata|out_metadata|0|0|}628|632|}
{2010212001|XXGvertex_oport_oport|1168|0|1800|0|{0|out|}632|633|}
{2010213001|XXGoport_dst_flow|1169|0|1802|0|{0|}633|619|}
{2010212001|XXGvertex_oport_oport|1170|0|1803|0|{1|error|}632|634|}
{2010212001|XXGvertex_oport_oport|1171|0|1805|0|{2|log|}632|635|}
{2010007001|XXGobject_proto_object|1172|0|1807|0|{}632|636|}
{2010212001|XXGvertex_oport_oport|1173|0|1809|0|{0|out|}636|637|}
{2010006001|XXGobject_psameas_object|1174|0|1811|0|{metadata|out_metadata|1|0|}637|636|}
{2010212001|XXGvertex_oport_oport|1175|0|1812|0|{1|error|}636|638|}
{2010006001|XXGobject_psameas_object|1176|0|1814|0|{metadata|error_metadata|1|0|}638|636|}
{2010212001|XXGvertex_oport_oport|1177|0|1815|0|{2|log|}636|639|}
{2010006001|XXGobject_psameas_object|1178|0|1817|0|{metadata|log_metadata|1|0|}639|636|}
{2010006001|XXGobject_psameas_object|1179|0|1818|0|{Layout|Layout|0|0|}632|628|}
{2010006001|XXGobject_psameas_object|1180|0|1819|0|{in_metadata|out_metadata|0|0|}622|632|}
{2010006001|XXGobject_psameas_object|1181|0|1820|0|{out_metadata|out_metadata|0|0|}622|632|}
{2010601001|XXGgraph_vertex_vertex|1182|0|1821|0|{Create_Data|}616|632|}
{2010601001|XXGgraph_vertex_vertex|1183|0|1822|0|{Output_File|}616|628|}
{2010601001|XXGgraph_vertex_vertex|1184|0|1823|0|{Reformat|}616|640|}
{2010212001|XXGvertex_oport_oport|1185|0|1825|0|{0|out0|}640|641|}
{2010213001|XXGoport_dst_flow|1186|0|1827|0|{0|}641|621|}
{2010212001|XXGvertex_oport_oport|1187|0|1828|0|{1|reject0|}640|642|}
{2010212001|XXGvertex_oport_oport|1188|0|1830|0|{2|error0|}640|643|}
{2010212001|XXGvertex_oport_oport|1189|0|1832|0|{3|log|}640|644|}
{2010211001|XXGvertex_iport_iport|1190|0|1834|0|{0|in|}640|645|}
{2010007001|XXGobject_proto_object|1191|0|1836|0|{}640|646|}
{2010212001|XXGvertex_oport_oport|1192|0|1838|0|{0|out0|}646|647|}
{2010006001|XXGobject_psameas_object|1193|0|1840|0|{metadata|out0_metadata|1|0|}647|646|}
{2010006001|XXGobject_psameas_object|1194|0|1841|0|{transform0|transform0|1|0|}647|646|}
{2010212001|XXGvertex_oport_oport|1195|0|1842|0|{1|reject0|}646|648|}
{2010006001|XXGobject_psameas_object|1196|0|1844|0|{metadata|reject0_metadata|1|0|}648|646|}
{2010212001|XXGvertex_oport_oport|1197|0|1845|0|{2|error0|}646|649|}
{2010006001|XXGobject_psameas_object|1198|0|1847|0|{metadata|error0_metadata|1|0|}649|646|}
{2010212001|XXGvertex_oport_oport|1199|0|1848|0|{3|log|}646|650|}
{2010006001|XXGobject_psameas_object|1200|0|1850|0|{metadata|log_metadata|1|0|}650|646|}
{2010211001|XXGvertex_iport_iport|1201|0|1851|0|{0|in|}646|651|}
{2010006001|XXGobject_psameas_object|1202|0|1853|0|{metadata|in_metadata|1|0|}651|646|}
{2010006001|XXGobject_psameas_object|1203|0|1854|0|{Layout|Layout|0|0|}640|628|}
{2010006001|XXGobject_psameas_object|1204|0|1855|0|{in_metadata|write_metadata|0|0|}640|10|}
{2010006001|XXGobject_psameas_object|1205|0|1856|0|{reject0_metadata|write_metadata|0|0|}640|10|}
{2010601001|XXGgraph_vertex_vertex|1206|0|1857|0|{Sort|}616|652|}
{2010212001|XXGvertex_oport_oport|1207|0|1859|0|{0|out|}652|653|}
{2010213001|XXGoport_dst_flow|1208|0|1861|0|{0|}653|617|}
{2010211001|XXGvertex_iport_iport|1209|0|1862|0|{0|in|}652|654|}
{2010214001|XXGiport_src_flow|1210|0|1864|0|{0|}654|621|}
{2010007001|XXGobject_proto_object|1211|0|1865|0|{}652|655|}
{2010212001|XXGvertex_oport_oport|1212|0|1867|0|{0|out|}655|656|}
{2010006001|XXGobject_psameas_object|1213|0|1869|0|{metadata|out_metadata|1|0|}656|655|}
{2010211001|XXGvertex_iport_iport|1214|0|1870|0|{0|in|}655|657|}
{2010006001|XXGobject_psameas_object|1215|0|1872|0|{metadata|in_metadata|1|0|}657|655|}
{2010006001|XXGobject_psameas_object|1216|0|1873|0|{Layout|Layout|0|0|}652|628|}
{2010006001|XXGobject_psameas_object|1217|0|1874|0|{in_metadata|out0_metadata|0|0|}652|640|}
{2010006001|XXGobject_psameas_object|1218|0|1875|0|{out_metadata|out0_metadata|0|0|}652|640|}
{2010601001|XXGgraph_vertex_vertex|1219|0|1876|0|{Write_Separated_Values_1|}616|658|}
{2010212001|XXGvertex_oport_oport|1220|0|1878|0|{0|out|}658|659|}
{2010213001|XXGoport_dst_flow|1221|0|1880|0|{0|}659|618|}
{2010211001|XXGvertex_iport_iport|1222|0|1881|0|{0|in|}658|660|}
{2010214001|XXGiport_src_flow|1223|0|1883|0|{0|}660|617|}
{2010007001|XXGobject_proto_object|1224|0|1884|0|{}658|661|}
{2010212001|XXGvertex_oport_oport|1225|0|1886|0|{0|out|}661|662|}
{2010006001|XXGobject_psameas_object|1226|0|1888|0|{metadata|out_metadata|1|0|}662|661|}
{2010211001|XXGvertex_iport_iport|1227|0|1889|0|{0|in|}661|663|}
{2010006001|XXGobject_psameas_object|1228|0|1891|0|{metadata|in_metadata|1|0|}663|661|}
{2010006001|XXGobject_psameas_object|1229|0|1892|0|{Layout|Layout|0|0|}658|628|}
{2010006001|XXGobject_psameas_object|1230|0|1893|0|{in_metadata|out0_metadata|0|0|}658|640|}
{2010211001|XXGvertex_iport_iport|1231|0|1894|0|{0|in0|}616|664|}
{2010215002|XXGiport_binding_iport|1232|0|1896|0|{.5|.5|{0|}506|}664|645|}
{2010214001|XXGiport_src_flow|1233|0|1897|0|{0|}664|610|}
{2010601001|XXGgraph_vertex_vertex|1234|0|1898|0|{Dedup_Sorted|}609|665|}
{2010212001|XXGvertex_oport_oport|1235|0|1900|0|{0|out|}665|666|}
{2010213001|XXGoport_dst_flow|1236|0|1902|0|{0|}666|614|}
{2010212001|XXGvertex_oport_oport|1237|0|1903|0|{1|dup|}665|667|}
{2010213001|XXGoport_dst_flow|1238|0|1905|0|{0|}667|615|}
{2010212001|XXGvertex_oport_oport|1239|0|1906|0|{2|reject|}665|668|}
{2010212001|XXGvertex_oport_oport|1240|0|1908|0|{3|error|}665|669|}
{2010212001|XXGvertex_oport_oport|1241|0|1910|0|{4|log|}665|670|}
{2010211001|XXGvertex_iport_iport|1242|0|1912|0|{0|in|}665|671|}
{2010007001|XXGobject_proto_object|1243|0|1914|0|{}665|672|}
{2010212001|XXGvertex_oport_oport|1244|0|1916|0|{0|out|}672|673|}
{2010006001|XXGobject_psameas_object|1245|0|1918|0|{metadata|out_metadata|1|0|}673|672|}
{2010212001|XXGvertex_oport_oport|1246|0|1919|0|{1|dup|}672|674|}
{2010006001|XXGobject_psameas_object|1247|0|1921|0|{metadata|dup_metadata|1|0|}674|672|}
{2010212001|XXGvertex_oport_oport|1248|0|1922|0|{2|reject|}672|675|}
{2010006001|XXGobject_psameas_object|1249|0|1924|0|{metadata|reject_metadata|1|0|}675|672|}
{2010212001|XXGvertex_oport_oport|1250|0|1925|0|{3|error|}672|676|}
{2010006001|XXGobject_psameas_object|1251|0|1927|0|{metadata|error_metadata|1|0|}676|672|}
{2010212001|XXGvertex_oport_oport|1252|0|1928|0|{4|log|}672|677|}
{2010006001|XXGobject_psameas_object|1253|0|1930|0|{metadata|log_metadata|1|0|}677|672|}
{2010211001|XXGvertex_iport_iport|1254|0|1931|0|{0|in|}672|678|}
{2010006001|XXGobject_psameas_object|1255|0|1933|0|{metadata|in_metadata|1|0|}678|672|}
{2010006001|XXGobject_psameas_object|1256|0|1934|0|{Layout|Layout|0|0|}665|10|}
{2010006001|XXGobject_psameas_object|1257|0|1935|0|{dup_metadata|write_metadata|0|0|}665|10|}
{2010006001|XXGobject_psameas_object|1258|0|1936|0|{in_metadata|write_metadata|0|0|}665|10|}
{2010006001|XXGobject_psameas_object|1259|0|1937|0|{out_metadata|write_metadata|0|0|}665|10|}
{2010006001|XXGobject_psameas_object|1260|0|1938|0|{reject_metadata|write_metadata|0|0|}665|10|}
{2010601001|XXGgraph_vertex_vertex|1261|0|1939|0|{FBE|}609|679|}
{2010212001|XXGvertex_oport_oport|1262|0|1941|0|{0|out|}679|680|}
{2010213001|XXGoport_dst_flow|1263|0|1943|0|{0|}680|610|}
{2010212001|XXGvertex_oport_oport|1264|0|1944|0|{1|deselect|}679|681|}
{2010213001|XXGoport_dst_flow|1265|0|1946|0|{0|}681|612|}
{2010212001|XXGvertex_oport_oport|1266|0|1947|0|{2|reject|}679|682|}
{2010212001|XXGvertex_oport_oport|1267|0|1949|0|{3|error|}679|683|}
{2010212001|XXGvertex_oport_oport|1268|0|1951|0|{4|log|}679|684|}
{2010211001|XXGvertex_iport_iport|1269|0|1953|0|{0|in|}679|685|}
{2010214001|XXGiport_src_flow|1270|0|1955|0|{0|}685|614|}
{2010007001|XXGobject_proto_object|1271|0|1956|0|{}679|686|}
{2010212001|XXGvertex_oport_oport|1272|0|1958|0|{0|out|}686|687|}
{2010006001|XXGobject_psameas_object|1273|0|1960|0|{metadata|out_metadata|1|0|}687|686|}
{2010212001|XXGvertex_oport_oport|1274|0|1961|0|{1|deselect|}686|688|}
{2010006001|XXGobject_psameas_object|1275|0|1963|0|{metadata|deselect_metadata|1|0|}688|686|}
{2010212001|XXGvertex_oport_oport|1276|0|1964|0|{2|reject|}686|689|}
{2010006001|XXGobject_psameas_object|1277|0|1966|0|{metadata|reject_metadata|1|0|}689|686|}
{2010212001|XXGvertex_oport_oport|1278|0|1967|0|{3|error|}686|690|}
{2010006001|XXGobject_psameas_object|1279|0|1969|0|{metadata|error_metadata|1|0|}690|686|}
{2010212001|XXGvertex_oport_oport|1280|0|1970|0|{4|log|}686|691|}
{2010006001|XXGobject_psameas_object|1281|0|1972|0|{metadata|log_metadata|1|0|}691|686|}
{2010211001|XXGvertex_iport_iport|1282|0|1973|0|{0|in|}686|692|}
{2010006001|XXGobject_psameas_object|1283|0|1975|0|{metadata|in_metadata|1|0|}692|686|}
{2010006001|XXGobject_psameas_object|1284|0|1976|0|{Layout|Layout|0|0|}679|10|}
{2010006001|XXGobject_psameas_object|1285|0|1977|0|{deselect_metadata|write_metadata|0|0|}679|10|}
{2010006001|XXGobject_psameas_object|1286|0|1978|0|{in_metadata|write_metadata|0|0|}679|10|}
{2010006001|XXGobject_psameas_object|1287|0|1979|0|{out_metadata|write_metadata|0|0|}679|10|}
{2010006001|XXGobject_psameas_object|1288|0|1980|0|{reject_metadata|write_metadata|0|0|}679|10|}
{2010601001|XXGgraph_vertex_vertex|1289|0|1981|0|{Merge|}609|693|}
{2010212001|XXGvertex_oport_oport|1290|0|1983|0|{0|out|}693|694|}
{2010211001|XXGvertex_iport_iport|1291|0|1985|0|{0|in|}693|695|}
{2010214001|XXGiport_src_flow|1292|0|1987|0|{0|}695|612|}
{2010214001|XXGiport_src_flow|1293|0|1988|0|{1|}695|615|}
{2010007001|XXGobject_proto_object|1294|0|1989|0|{}693|696|}
{2010212001|XXGvertex_oport_oport|1295|0|1991|0|{0|out|}696|697|}
{2010006001|XXGobject_psameas_object|1296|0|1993|0|{metadata|out_metadata|1|0|}697|696|}
{2010211001|XXGvertex_iport_iport|1297|0|1994|0|{0|in|}696|698|}
{2010006001|XXGobject_psameas_object|1298|0|1996|0|{metadata|in_metadata|1|0|}698|696|}
{2010006001|XXGobject_psameas_object|1299|0|1997|0|{Layout|Layout|0|0|}693|10|}
{2010006001|XXGobject_psameas_object|1300|0|1998|0|{in_metadata|write_metadata|0|0|}693|10|}
{2010006001|XXGobject_psameas_object|1301|0|1999|0|{out_metadata|write_metadata|0|0|}693|10|}
{2010212001|XXGvertex_oport_oport|1302|0|2000|0|{0|out0|}609|699|}
{2010216002|XXGoport_binding_oport|1303|0|2002|0|{.5|.5|{0|}486|}699|694|}
{2010213001|XXGoport_dst_flow|1304|0|2003|0|{0|}699|9|}
{2010211001|XXGvertex_iport_iport|1305|0|2004|0|{0|in0|}609|700|}
{2010215002|XXGiport_binding_iport|1306|0|2006|0|{.5|.5|{0|}485|}700|671|}
{2010214001|XXGiport_src_flow|1307|0|2007|0|{0|}700|8|}
{2010601001|XXGgraph_vertex_vertex|1308|0|2008|0|{ddp_remove_unique_rxcui|}1|701|}
{2010604001|XXGgraph_flow_flow|1309|0|2010|0|{Flow_1|}701|702|}
{2010604001|XXGgraph_flow_flow|1310|0|2012|0|{Flow_12|}701|703|}
{2010604001|XXGgraph_flow_flow|1311|0|2014|0|{Flow_2|}701|704|}
{2010604001|XXGgraph_flow_flow|1312|0|2016|0|{Flow_3|}701|705|}
{2010604001|XXGgraph_flow_flow|1313|0|2018|0|{Flow_4|}701|706|}
{2010601001|XXGgraph_vertex_vertex|1314|0|2020|0|{Filter_by_Expression|}701|707|}
{2010212001|XXGvertex_oport_oport|1315|0|2022|0|{0|out|}707|708|}
{2010213001|XXGoport_dst_flow|1316|0|2024|0|{0|}708|704|}
{2010212001|XXGvertex_oport_oport|1317|0|2025|0|{1|deselect|}707|709|}
{2010212001|XXGvertex_oport_oport|1318|0|2027|0|{2|reject|}707|710|}
{2010212001|XXGvertex_oport_oport|1319|0|2029|0|{3|error|}707|711|}
{2010212001|XXGvertex_oport_oport|1320|0|2031|0|{4|log|}707|712|}
{2010211001|XXGvertex_iport_iport|1321|0|2033|0|{0|in|}707|713|}
{2010214001|XXGiport_src_flow|1322|0|2035|0|{0|}713|706|}
{2010007001|XXGobject_proto_object|1323|0|2036|0|{}707|714|}
{2010212001|XXGvertex_oport_oport|1324|0|2038|0|{0|out|}714|715|}
{2010006001|XXGobject_psameas_object|1325|0|2040|0|{metadata|out_metadata|1|0|}715|714|}
{2010212001|XXGvertex_oport_oport|1326|0|2041|0|{1|deselect|}714|716|}
{2010006001|XXGobject_psameas_object|1327|0|2043|0|{metadata|deselect_metadata|1|0|}716|714|}
{2010212001|XXGvertex_oport_oport|1328|0|2044|0|{2|reject|}714|717|}
{2010006001|XXGobject_psameas_object|1329|0|2046|0|{metadata|reject_metadata|1|0|}717|714|}
{2010212001|XXGvertex_oport_oport|1330|0|2047|0|{3|error|}714|718|}
{2010006001|XXGobject_psameas_object|1331|0|2049|0|{metadata|error_metadata|1|0|}718|714|}
{2010212001|XXGvertex_oport_oport|1332|0|2050|0|{4|log|}714|719|}
{2010006001|XXGobject_psameas_object|1333|0|2052|0|{metadata|log_metadata|1|0|}719|714|}
{2010211001|XXGvertex_iport_iport|1334|0|2053|0|{0|in|}714|720|}
{2010006001|XXGobject_psameas_object|1335|0|2055|0|{metadata|in_metadata|1|0|}720|714|}
{2010006001|XXGobject_psameas_object|1336|0|2056|0|{Layout|Layout|0|0|}707|10|}
{2010006001|XXGobject_psameas_object|1337|0|2057|0|{deselect_metadata|read_metadata|0|0|}707|18|}
{2010006001|XXGobject_psameas_object|1338|0|2058|0|{in_metadata|read_metadata|0|0|}707|18|}
{2010006001|XXGobject_psameas_object|1339|0|2059|0|{out_metadata|read_metadata|0|0|}707|18|}
{2010006001|XXGobject_psameas_object|1340|0|2060|0|{reject_metadata|read_metadata|0|0|}707|18|}
{2010601001|XXGgraph_vertex_vertex|1341|0|2061|0|{Gather|}701|721|}
{2010212001|XXGvertex_oport_oport|1342|0|2063|0|{0|out|}721|722|}
{2010211001|XXGvertex_iport_iport|1343|0|2065|0|{0|in|}721|723|}
{2010214001|XXGiport_src_flow|1344|0|2067|0|{0|}723|704|}
{2010214001|XXGiport_src_flow|1345|0|2068|0|{1|}723|705|}
{2010007001|XXGobject_proto_object|1346|0|2069|0|{}721|724|}
{2010212001|XXGvertex_oport_oport|1347|0|2071|0|{0|out|}724|725|}
{2010006001|XXGobject_psameas_object|1348|0|2073|0|{metadata|out_metadata|1|0|}725|724|}
{2010211001|XXGvertex_iport_iport|1349|0|2074|0|{0|in|}724|726|}
{2010006001|XXGobject_psameas_object|1350|0|2076|0|{metadata|in_metadata|1|0|}726|724|}
{2010006001|XXGobject_psameas_object|1351|0|2077|0|{Layout|Layout|0|0|}721|10|}
{2010006001|XXGobject_psameas_object|1352|0|2078|0|{in_metadata|read_metadata|0|0|}721|18|}
{2010006001|XXGobject_psameas_object|1353|0|2079|0|{out_metadata|read_metadata|0|0|}721|18|}
{2010601001|XXGgraph_vertex_vertex|1354|0|2080|0|{SRT_rxcui|}701|727|}
{2010212001|XXGvertex_oport_oport|1355|0|2082|0|{0|out|}727|728|}
{2010213001|XXGoport_dst_flow|1356|0|2084|0|{0|}728|703|}
{2010211001|XXGvertex_iport_iport|1357|0|2085|0|{0|in|}727|729|}
{2010007001|XXGobject_proto_object|1358|0|2087|0|{}727|730|}
{2010212001|XXGvertex_oport_oport|1359|0|2089|0|{0|out|}730|731|}
{2010006001|XXGobject_psameas_object|1360|0|2091|0|{metadata|out_metadata|1|0|}731|730|}
{2010211001|XXGvertex_iport_iport|1361|0|2092|0|{0|in|}730|732|}
{2010006001|XXGobject_psameas_object|1362|0|2094|0|{metadata|in_metadata|1|0|}732|730|}
{2010006001|XXGobject_psameas_object|1363|0|2095|0|{Layout|Layout|0|0|}727|733|}
{2010212001|XXGvertex_oport_oport|1364|0|2097|0|{0|read|}733|734|}
{2010213001|XXGoport_dst_flow|1365|0|2099|0|{0|}734|706|}
{2010211001|XXGvertex_iport_iport|1366|0|2100|0|{0|write|}733|735|}
{2010214001|XXGiport_src_flow|1367|0|2102|0|{0|}735|702|}
{2010007001|XXGobject_proto_object|1368|0|2103|0|{}733|736|}
{2010212001|XXGvertex_oport_oport|1369|0|2105|0|{0|read|}736|737|}
{2010006001|XXGobject_psameas_object|1370|0|2107|0|{metadata|read_metadata|1|0|}737|736|}
{2010211001|XXGvertex_iport_iport|1371|0|2108|0|{0|write|}736|738|}
{2010006001|XXGobject_psameas_object|1372|0|2110|0|{metadata|write_metadata|1|0|}738|736|}
{2010006001|XXGobject_psameas_object|1373|0|2111|0|{read_metadata|read_metadata|0|0|}733|18|}
{2010006001|XXGobject_psameas_object|1374|0|2112|0|{write_metadata|read_metadata|0|0|}733|18|}
{2010006001|XXGobject_psameas_object|1375|0|2113|0|{in_metadata|read_metadata|0|0|}727|18|}
{2010006001|XXGobject_psameas_object|1376|0|2114|0|{out_metadata|read_metadata|0|0|}727|18|}
{2010601001|XXGgraph_vertex_vertex|1377|0|2115|0|{Unique_RXCUI|}701|733|}
{2010601001|XXGgraph_vertex_vertex|1378|0|2116|0|{ddp_Pull_non_unique_rxcui|}701|739|}
{2010212001|XXGvertex_oport_oport|1379|0|2118|0|{0|out|}739|740|}
{2010213001|XXGoport_dst_flow|1380|0|2120|0|{0|}740|702|}
{2010212001|XXGvertex_oport_oport|1381|0|2121|0|{1|dup|}739|741|}
{2010213001|XXGoport_dst_flow|1382|0|2123|0|{0|}741|705|}
{2010212001|XXGvertex_oport_oport|1383|0|2124|0|{2|reject|}739|742|}
{2010212001|XXGvertex_oport_oport|1384|0|2126|0|{3|error|}739|743|}
{2010212001|XXGvertex_oport_oport|1385|0|2128|0|{4|log|}739|744|}
{2010211001|XXGvertex_iport_iport|1386|0|2130|0|{0|in|}739|745|}
{2010214001|XXGiport_src_flow|1387|0|2132|0|{0|}745|703|}
{2010007001|XXGobject_proto_object|1388|0|2133|0|{}739|746|}
{2010212001|XXGvertex_oport_oport|1389|0|2135|0|{0|out|}746|747|}
{2010006001|XXGobject_psameas_object|1390|0|2137|0|{metadata|out_metadata|1|0|}747|746|}
{2010212001|XXGvertex_oport_oport|1391|0|2138|0|{1|dup|}746|748|}
{2010006001|XXGobject_psameas_object|1392|0|2140|0|{metadata|dup_metadata|1|0|}748|746|}
{2010212001|XXGvertex_oport_oport|1393|0|2141|0|{2|reject|}746|749|}
{2010006001|XXGobject_psameas_object|1394|0|2143|0|{metadata|reject_metadata|1|0|}749|746|}
{2010212001|XXGvertex_oport_oport|1395|0|2144|0|{3|error|}746|750|}
{2010006001|XXGobject_psameas_object|1396|0|2146|0|{metadata|error_metadata|1|0|}750|746|}
{2010212001|XXGvertex_oport_oport|1397|0|2147|0|{4|log|}746|751|}
{2010006001|XXGobject_psameas_object|1398|0|2149|0|{metadata|log_metadata|1|0|}751|746|}
{2010211001|XXGvertex_iport_iport|1399|0|2150|0|{0|in|}746|752|}
{2010006001|XXGobject_psameas_object|1400|0|2152|0|{metadata|in_metadata|1|0|}752|746|}
{2010006001|XXGobject_psameas_object|1401|0|2153|0|{Layout|Layout|0|0|}739|733|}
{2010006001|XXGobject_psameas_object|1402|0|2154|0|{dup_metadata|read_metadata|0|0|}739|18|}
{2010006001|XXGobject_psameas_object|1403|0|2155|0|{in_metadata|read_metadata|0|0|}739|18|}
{2010006001|XXGobject_psameas_object|1404|0|2156|0|{out_metadata|read_metadata|0|0|}739|18|}
{2010006001|XXGobject_psameas_object|1405|0|2157|0|{reject_metadata|read_metadata|0|0|}739|18|}
{2010212001|XXGvertex_oport_oport|1406|0|2158|0|{0|out0|}701|753|}
{2010216002|XXGoport_binding_oport|1407|0|2160|0|{.5|.5|{0|}489|}753|722|}
{2010213001|XXGoport_dst_flow|1408|0|2161|0|{0|}753|7|}
{2010211001|XXGvertex_iport_iport|1409|0|2162|0|{0|in0|}701|754|}
{2010215002|XXGiport_binding_iport|1410|0|2164|0|{.5|.5|{0|}488|}754|729|}
{2010214001|XXGiport_src_flow|1411|0|2165|0|{0|}754|5|}
{2010601001|XXGgraph_vertex_vertex|1412|0|2166|0|{srt_proxy_ndc|}1|755|}
{2010212001|XXGvertex_oport_oport|1413|0|2168|0|{0|out|}755|756|}
{2010213001|XXGoport_dst_flow|1414|0|2170|0|{0|}756|8|}
{2010211001|XXGvertex_iport_iport|1415|0|2171|0|{0|in|}755|757|}
{2010214001|XXGiport_src_flow|1416|0|2173|0|{0|}757|7|}
{2010007001|XXGobject_proto_object|1417|0|2174|0|{}755|758|}
{2010212001|XXGvertex_oport_oport|1418|0|2176|0|{0|out|}758|759|}
{2010006001|XXGobject_psameas_object|1419|0|2178|0|{metadata|out_metadata|1|0|}759|758|}
{2010211001|XXGvertex_iport_iport|1420|0|2179|0|{0|in|}758|760|}
{2010006001|XXGobject_psameas_object|1421|0|2181|0|{metadata|in_metadata|1|0|}760|758|}
{2010006001|XXGobject_psameas_object|1422|0|2182|0|{Layout|Layout|0|0|}755|10|}
{2010006001|XXGobject_psameas_object|1423|0|2183|0|{in_metadata|write_metadata|0|0|}755|10|}
{2010006001|XXGobject_psameas_object|1424|0|2184|0|{out_metadata|write_metadata|0|0|}755|10|}
{2010109001|XXGobject_property_value|1425|0|2185|0|{0|TrackingThumbprint|72|}1|761|}
