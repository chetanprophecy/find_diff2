@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|520|rel_count|784|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|/*
fk_map_type has been defined to interpret the contents of the "FK_MAP" parameter.
*/
type fk_map_type =
record
  string("\|") keying_target_system;
  string("\|") fsk_field;
  string("\|") nk_fields;
  string("\|") sk_lookup_name;
end;|3|9|RK|Provides functions to use in PDL.|{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|@3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM_LOWER|$[string_downcase(TARGET_SYSTEM)]|3|9|REK|@{0|}}
{30001002|XXparameter|ILM_NAME||3|9|RFK|@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|SPLIT_DML_FILE|$[
AI_DML + "/split." + string_split(TARGET_SYSTEM_LOWER, ".")[0] + "/split." + TARGET_SYSTEM_LOWER + ".dml"
]|3|9|RK|@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|FK_MAP|AB_PARAMETER_ENV|3|10|FKd|An optional list of settings used to derive surrogate keys from the natural keys in the ILM.  Each line has: the name of the foreign SK field, the name of the ILM subrecord with the NK info, the name of the SK lookup, the name of the table pointed to by the SK, including it's "logical" schema name.  The elements are comma separated, and there must be a trailing comma at the end of each line as well.|{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|FK_MAP_FKL|AB_PARAMETER_ENV|3|10|Kd|An optional list of settings used to derive surrogate keys from the natural keys in the ILM.  Each line has: the name of the foreign SK field, the name of the ILM subrecord with the NK info, the name of the SK lookup, the name of the table pointed to by the SK, including it's "logical" schema name.  The elements are comma separated, and there must be a trailing comma at the end of each line as well.|{0|}}
{30001002|XXparameter|FBE_PKG|AB_PARAMETER_ENV|8|10|RKd|Package containing transforms and data types|{0|}}
{30001002|XXparameter|FBE_PKG:eme|select_out::select(in)=
begin
  select_out :: 1;
end;|3|9||@{0|}}
{30001002|XXparameter|FBE_PKG:sandbox|$[
begin

let string("")[int] fbe_expressions = [vector];
let string("") fbe_pkg_xfr = make_transform("select", [vector make_arg("in")], [vector make_arg("select_out")]);
let string("") fk_map_parameter = FK_MAP;
let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

for(let fk_map_type map in fk_maps) begin
fbe_expressions = vector_append(fbe_expressions, "in." + map.fsk_field + " != 0");
end

fbe_pkg_xfr = if(length_of(fk_maps)>0) add_rule(fbe_pkg_xfr, "select_out", "if(" + string_join(fbe_expressions, '&&') + ") 0 else 1") else "";

result :: fbe_pkg_xfr;

end
]|3|9||@{0|}}
{30001002|XXparameter|FK_MAP:eme|target\|fsk_field\|nk_field\|sk_lookup_name|3|9||@{0|}}
{30001002|XXparameter|FK_MAP:sandbox||3|9||@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME:eme|$[
AI_MFS + "/split/interim." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + "\{RUN_ID\}" + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME:sandbox|$[
AI_MFS + "/split/interim." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + RUN_ID + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE:eme|$[
AI_MFS + "/split/split." + "\{ILM\}"+ "." + TARGET_SYSTEM_LOWER + "." + "\{RUN_ID\}" + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|FINAL_SPLIT_FILE:sandbox|$[
AI_MFS + "/split/split." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + RUN_ID + ".dat.gz"
]|3|9||@{0|}}
{30001002|XXparameter|CUSTOM_MLKP_IDS_LIST||3|9|FK|@{0|}}
{30001002|XXparameter|FK_MAP_FKL:eme|$[
begin

let string("") fk_map_parameter = FK_MAP;

let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

let string("")[int] fk_map_uke_vec = [vector];

for(let fk_map_type map in fk_maps) begin
fk_map_uke_vec = vector_append(fk_map_uke_vec, map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"); 
end

result :: string_join(fk_map_uke_vec, "\\n");
end
]|3|9||@{0|}}
{30001002|XXparameter|FK_MAP_FKL:sandbox|$[
begin

let string("") fk_map_parameter = FK_MAP;

let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

let string("")[int] fk_map_uke_vec = [vector];

for(let fk_map_type map in fk_maps) begin
  if(file_information(AI_MFS + "/placeholder/processed/placeholder." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + map.sk_lookup_name + "." + RUN_ID + ".dat.gz").found)
    fk_map_uke_vec = vector_append(fk_map_uke_vec, map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"); 
  else if(file_information(AI_MFS + "/placeholder/placeholder." + ILM_NAME + "." + TARGET_SYSTEM_LOWER + "." + map.sk_lookup_name + "." + RUN_ID + ".dat.gz").found) begin
    fk_map_uke_vec = vector_append(fk_map_uke_vec, map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"); 
    force_error("ERROR: Placeholder file for " + map.sk_lookup_name + " has not been processed!");
  end
end

result :: string_join(fk_map_uke_vec, "\\n");
end
]|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|keying|Gunit Kaur|Created 1/31/2017 9:25:31 AM|1|100|-1|@9|@2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1151000|681000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'keying' Execution Status Report

Job completed successfully at Monday, September 28, 2020 17:17:17
Run performed by user gsonar
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|128|360|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@KEYING- SECOND PASS OF FSK LOOKUP|26000|70000|0|0|0|0|14158|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|360|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}14213|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}14220|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14218|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}14201|2065|}}
{2010243001|XXGwatcher|11|0|21|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14222|17|}}
{2010243001|XXGwatcher|13|0|25|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14215|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14221|17|}}
{2010503005|XXGfvertex|16|0|31|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$FINAL_SPLIT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FINAL_SPLIT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
}}@1|Output File|882000|207000|0|0|0|0|14230|Add records to split file for which FSK is reperformed|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|17|0|33|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|18|0|36|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|19|0|38|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|20|0|41|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|733000|220000|0|0|0|0|14231|Dummy|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|21|0|43|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|22|0|46|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|23|0|49|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|24|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|25|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|26|0|60|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|select_expr||3|9||@{0|}}
{30001002|XXparameter|use_package|True|3|1|l|@{0|}}
{30001002|XXparameter|package||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|181000|320000|0|0|0|0|14232|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|27|0|62|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|28|0|65|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|29|0|68|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|30|0|70|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|31|0|72|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|74|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|33|0|77|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select); deselect=filter_xfr(package.select);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|34|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|35|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|36|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|37|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|38|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|39|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|40|0|97|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$FINAL_SPLIT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FINAL_SPLIT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
}}@0|Output File|403000|617000|0|0|0|0|14235|Split file with records for which lookup is not re-performed|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|41|0|99|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|42|0|102|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|43|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|44|0|112|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
force_abort("ERROR: Unexpected non-matching records found for dimension " 
                + in.dimension 
                + "!\\nSample HK Value :\\ndxf_hk_part1 = " 
                + string_representation(in.fsk_hk.dxf_hk_part1) 
                + "\\ndxf_hk_part2 = "
                + string_representation(in.fsk_hk.dxf_hk_part2));
out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|limit|10|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|852000|299000|0|0|0|0|14233|RFMT: Abort graph in case of non-matching records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|114|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|46|0|117|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|47|0|119|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|48|0|121|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|123|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|126|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|51|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|52|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|53|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|54|0|138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|145|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|Normalize|1332000|590000|0|0|0|0|14217|NORM: Split non-matching records from each dimension|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|57|0|147|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|58|0|149|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|59|0|151|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|60|0|153|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|61|0|155|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|62|0|157|0|{@{}@384|.5|.5|{0|}1396|17|}}
{2010501005|XXGpvertex|63|0|160|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@1|Reformat|1001000|465000|0|0|0|0|14219|RFMT: Distinguish Non-Matching Records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|162|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|65|0|164|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|66|0|167|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|67|0|169|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|68|0|171|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|69|0|173|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|70|0|175|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|71|0|177|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|72|0|179|0|{@{}@384|.5|.5|{0|}14207|17|}}
{2010501005|XXGpvertex|73|0|182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
}}@1|Fuse|990000|250000|0|0|0|0|14214|FUSE: Merge All Lookup Records|Ab Initio Software|Built-in 2.10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|74|0|184|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|75|0|187|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|76|0|189|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|77|0|191|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|193|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|79|0|195|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|80|0|197|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010210004|XXGflow|81|0|199|0|{@{}@384|.5|.5|{0|}14205|17|}}
{2010202004|XXGiport|82|0|201|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010210004|XXGflow|83|0|203|0|{@{}@384|.5|.5|{0|}14212|17|}}
{2010501005|XXGpvertex|84|0|206|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Rollup|1219000|560000|0|0|0|0|1011|RLP: Merge records representing the same entity|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|85|0|208|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|86|0|210|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|212|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|214|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|216|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|90|0|218|0|{@{}@384|.5|.5|{0|}991|17|}}
{2010501005|XXGpvertex|91|0|221|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Normalize|615000|235000|0|0|0|0|1004|NORM: Multiply input records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|92|0|223|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|93|0|225|0|{@{}@384|.5|.5|{0|}911|17|}}
{2010203004|XXGoport|94|0|227|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|95|0|229|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|96|0|231|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|97|0|233|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|98|0|235|0|{@{}@384|.5|.5|{0|}995|17|}}
{2010501005|XXGpvertex|99|0|238|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|115000|227000|0|0|0|0|1009|RFMT: Split file and generate hash_key and partition and record numbers|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|240|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|101|0|243|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|102|0|245|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|103|0|247|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|249|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|252|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|65000|300000|0|0|0|0|14220|RFMT: Split ICFF and Regular Lookup records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|106|0|254|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|107|0|256|0|{@{}@384|.5|.5|{0|}14201|17|}}
{2010203004|XXGoport|108|0|258|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|109|0|260|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|110|0|262|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|111|0|264|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|112|0|281|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$SPLIT_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{SPLIT_FILE_NAME\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SPLIT_DML_FILE|3|2|f$|@{0|}}
}}@0|Input File|34000|337000|0|0|0|0|14234|Split File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|113|0|283|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|114|0|286|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|115|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|116|0|292|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|Trash|1067000|330000|0|0|0|0|14236|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|117|0|294|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|118|0|297|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|119|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|120|0|304|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@65000|180000|0|0|0|0|14159|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|832000|382000|3|}}
{2010240003|XXGlegend|121|0|306|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|122|0|308|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|123|0|310|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|124|0|312|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|125|0|314|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|126|0|316|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|127|0|318|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|128|0|320|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|129|0|322|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|130|0|324|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|131|0|326|0|{@{}@May 27 2016|82000|268000|0|0|0|0|1513|}}
{2010242002|XXGface|132|0|328|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|133|0|330|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|134|0|332|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|135|0|334|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1514|}}
{2010242002|XXGface|136|0|336|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|137|0|338|0|{@{}@Summary:

This graph performs the second pass of lookup, which must be performed after loading all placholders.
If lookup continues to remain unsuccessful, the graph will fail.|15000|42500|0|0|0|0|1512|}}
{2010242002|XXGface|138|0|340|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|139|0|342|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|140000|0|0|0|0|1480|}}
{2010242002|XXGface|140|0|344|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|141|0|346|0|{@{}@2.0|17000|288000|0|0|0|0|1521|}}
{2010242002|XXGface|142|0|348|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|143|0|350|0|{@{}@Nov 03 2016|82000|288000|0|0|0|0|1522|}}
{2010242002|XXGface|144|0|352|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|145|0|354|0|{@{}@Mukesh Singh (Exusia)|187000|288000|0|0|0|0|1516|}}
{2010242002|XXGface|146|0|356|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|147|0|358|0|{@{}@Custom/Reduced lookup, DA|412000|288000|0|0|0|0|1523|}}
{2010242002|XXGface|148|0|360|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|149|0|362|0|{@{}@3.0|17000|308000|0|0|0|0|1525|}}
{2010242002|XXGface|150|0|364|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|151|0|366|0|{@{}@Dec 13 2016|82000|308000|0|0|0|0|1524|}}
{2010242002|XXGface|152|0|368|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|153|0|370|0|{@{}@Gunit Kaur (Exusia)|187000|308000|0|0|0|0|1526|}}
{2010242002|XXGface|154|0|372|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|155|0|374|0|{@{}@FK MAP reduction based on presence and absence of placholder files|412000|308000|0|0|0|0|1527|}}
{2010242002|XXGface|156|0|376|0|{@{}@Candara|0|100|0|}}
{2010600005|XXGgraph|157|0|378|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/foreign_key_lookup.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|TARGET|$TARGET_SYSTEM_LOWER|3|9||@{0|}}
{30001002|XXparameter|FK_MAP|$FK_MAP_FKL|3|9||@{0|}}
}}@0|@441000|295000|0|0|0|0|14237|foreign key lookup|Manav Jindal|Created 1/31/2017 9:20:18 AM|1|100|0|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1707000|760000|5|}}
{2010240003|XXGlegend|158|0|380|0|{@{}@This subgraph extracts the surrogate key 
for every pair of natural keys passed to it|44000|60000|0|0|0|0|14169|}}
{2010242002|XXGface|159|0|382|0|{@{}@Arial|128|220|1|}}
{2010210004|XXGflow|160|0|386|0|{@{}@384|.5|.5|{0|}14211|17|}}
{2010210004|XXGflow|161|0|391|0|{@{}@384|.5|.5|{0|}14202|17|}}
{2010503005|XXGfvertex|162|0|394|0|{|{}@0|Lookup Template|1129000|119500|0|0|0|0|14215|ICFF HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010600005|XXGgraph|163|0|396|0|{Subgraph created from graph "Universal Key Extraction_optimized"|{}@0|@637750|228750|0|0|0|0|14191|MUltifile Lookup|gunit.kaur|Created 5/6/2016 11:13:41 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1442000|725000|3|}}
{2010240003|XXGlegend|164|0|398|0|{@{}@This subgraph takes the split file as input and extracts the 
universal key for every pair of natural keys passed to it|44000|60000|0|0|0|0|536|}}
{2010242002|XXGface|165|0|400|0|{@{}@Arial|128|140|1|}}
{2010210004|XXGflow|166|0|402|0|{@{}@384|.5|.5|{0|}1000|17|}}
{2010210004|XXGflow|167|0|404|0|{@{}@384|.5|.5|{0|}988|20|}}
{2010210004|XXGflow|168|0|408|0|{@{}@384|.5|.5|{0|}999|529|}}
{2010501005|XXGpvertex|169|0|412|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Partition by Expression|773000|560000|0|0|0|0|1005|PBE: Repartition records as per their previous partition order|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|170|0|414|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|171|0|417|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|172|0|419|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|421|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|423|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|175|0|430|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1000000|255000|0|0|481000|303000|1006|PBKS: \{hash_key\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|176|0|432|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|177|0|434|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|178|0|436|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|179|0|439|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|442|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|181|0|444|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|182|0|446|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|183|0|450|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|184|0|454|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|185|0|460|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|514500|572500|0|0|0|0|1007|RFMT: Extract universal key for multiplied records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|186|0|462|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|187|0|465|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|188|0|467|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|189|0|469|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|190|0|471|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|191|0|480|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|1020000|588000|0|0|0|0|1012|SORT \{record_nbr\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|192|0|482|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|193|0|485|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|194|0|491|0|{@{}@0|0|0|0|out1|.8094804010938924|@@@14352|0|}}
{2010202004|XXGiport|195|0|495|0|{@{}@0|0|0|0|in0|.28167730173199634|@@@13840|0|}}
{2010503005|XXGfvertex|196|0|502|0|{|{}@0|Lookup Template|899000|119500|0|0|0|0|14222|Regular HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010600005|XXGgraph|197|0|504|0|{Subgraph created from graph "Universal Key Extraction_multi_serial"|{}@0|@636000|437000|0|0|0|0|14213|Regular Serial Lookup|gunit.kaur|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|735000|458000|7|}}
{2010501005|XXGpvertex|198|0|506|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
}}@1|Reformat|180000|165000|0|0|0|0|685|RFMT: Extract Universal Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|199|0|508|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|200|0|510|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|201|0|512|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|202|0|514|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|203|0|516|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|204|0|522|0|{@{}@0|0|0|0|out0|.5043668122270742|@@@14352|0|}}
{2010202004|XXGiport|205|0|526|0|{@{}@0|0|0|0|in0|.4978165938864629|@@@13840|0|}}
{2010501005|XXGpvertex|206|0|530|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|338000|360000|0|0|0|0|14223|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|207|0|532|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|208|0|536|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|209|0|542|0|{|{}@0|@100000|150000|0|0|0|0|14159|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|980000|429000|3|}}
{2010240003|XXGlegend|210|0|544|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|211|0|546|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|212|0|548|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|213|0|550|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|214|0|552|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|215|0|554|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|216|0|556|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|217|0|558|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|218|0|560|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|219|0|562|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|220|0|564|0|{@{}@May 19 2016|82000|268000|0|0|0|0|1486|}}
{2010242002|XXGface|221|0|566|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|222|0|568|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|223|0|570|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|224|0|572|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1514|}}
{2010242002|XXGface|225|0|574|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|226|0|576|0|{@{}@Summary:

This subgraph extracts the surrogate key for every pair of natural keys passed to it.|15000|42500|0|0|0|0|1512|}}
{2010242002|XXGface|227|0|578|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|228|0|580|0|{@{}@2.0|17000|288000|0|0|0|0|1485|}}
{2010242002|XXGface|229|0|582|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|230|0|584|0|{@{}@May 30 2016|82000|288000|0|0|0|0|1515|}}
{2010242002|XXGface|231|0|586|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|232|0|588|0|{@{}@Gunit Kaur (Exusia)|187000|288000|0|0|0|0|1476|}}
{2010242002|XXGface|233|0|590|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|234|0|592|0|{@{}@Placholder generation conditionalized to dimension tables only, Special proccesing added for d_date|412000|288000|0|0|0|0|1516|}}
{2010242002|XXGface|235|0|594|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|236|0|596|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|105000|0|0|0|0|1522|}}
{2010242002|XXGface|237|0|598|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|238|0|600|0|{@{}@3.0|17000|308000|0|0|0|0|1491|}}
{2010242002|XXGface|239|0|602|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|240|0|604|0|{@{}@Aug 24 2016|82000|308000|0|0|0|0|1517|}}
{2010242002|XXGface|241|0|606|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|242|0|608|0|{@{}@Gunit Kaur (Exusia)|187000|308000|0|0|0|0|1493|}}
{2010242002|XXGface|243|0|610|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|244|0|612|0|{@{}@MICFF Normalize length reduction, Reduction of lookup calls|412000|308000|0|0|0|0|1518|}}
{2010242002|XXGface|245|0|614|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|246|0|616|0|{@{}@4.0|17000|328000|0|0|0|0|1499|}}
{2010242002|XXGface|247|0|618|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|248|0|620|0|{@{}@Aug 29 2016|82000|328000|0|0|0|0|1519|}}
{2010242002|XXGface|249|0|622|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|250|0|624|0|{@{}@Gunit Kaur (Exusia)|187000|328000|0|0|0|0|1496|}}
{2010242002|XXGface|251|0|626|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|252|0|628|0|{@{}@Flow buffering handled, redundant joins eliminated, Fuse component added|412000|328000|0|0|0|0|1520|}}
{2010242002|XXGface|253|0|630|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|254|0|632|0|{@{}@5.0|17000|348000|0|0|0|0|1505|}}
{2010242002|XXGface|255|0|634|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|256|0|636|0|{@{}@Nov 07 2016|82000|348000|0|0|0|0|1521|}}
{2010242002|XXGface|257|0|638|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|258|0|640|0|{@{}@Mukesh Singh (Exusia)|187000|348000|0|0|0|0|1503|}}
{2010242002|XXGface|259|0|642|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|260|0|644|0|{@{}@Custom/Reduced lookup, DA|412000|348000|0|0|0|0|1504|}}
{2010242002|XXGface|261|0|646|0|{@{}@Candara|0|100|0|}}
{2010203004|XXGoport|262|0|648|0|{@{}@0|0|0|0|all|.3297442799461642|@@@14352|0|}}
{2010203004|XXGoport|263|0|652|0|{@{}@0|0|0|0|non_matching|.8092105263157895|@@@14352|0|}}
{2010202004|XXGiport|264|0|656|0|{@{}@0|0|0|0|in0|.47203274215552526|@@@13840|0|}}
{2010600005|XXGgraph|265|0|660|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|TARGET|$[""]|3|9|RFK|@{0|}}
{30001002|XXparameter|FK_MAP||3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_FILE_CONTENT|$[read_file(PUB_DXF_META + "/ids_table_properties.dat")]|3|9|K|Read the ids_table_properties file and cache it so any calls to functions do not have to go back to the file system. This is for startup and GDE performance.|{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_FILE_LINES|$[ begin
  /* Retain only the entries that will be required for this instance of the subgraph, i.e. the TARGET, and any tables required for FSKs */

  let string("\\x01")[] required_tables = [vector];
  if(not is_blank(TARGET)) required_tables = vector_append(required_tables, TARGET);
  for(let map in re_split_no_empty(FK_MAP, "[\\r\\n]+"))
    required_tables = vector_append(required_tables, string_split(map, "\|")[2]);

  result :: for(let line in string_split_no_empty(IDS_TABLE_PROPERTIES_FILE_CONTENT, "\\n")):
              if(not starts_with(line, "#") and string_prefix(line, string_index(line, "\|")-1) member required_tables) line;
  //result :: for(let line in string_split_no_empty(IDS_TABLE_PROPERTIES_FILE_CONTENT, "\\n")):string_prefix(line, string_index(line, "\|")-1) ;
end ]|3|9|K|Make a vector of all lines that are required for this run. Then we override the ids_table_properties functions to use this vector instead of reading the file from disk|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_DML/generic_data_types.dml";

/*
   The functions from ids_table_properties.xfr are all replicated here after reading that fxr file,
   and the function that reads from the properties file (get_all_ids_table_properties) is overridden
   to use the content of a parameter rather than read the properties meta file from the disk for
   each function call.
*/

$[ begin
  let pkg = read_package(PUB_DXF_XFR + "/ids/ids_table_properties.xfr");
  let string("\\x01")[] ret = [vector];
  for(let pc in pkg.members)
    if(pc.form == "transform")
      if(pc.name == "get_all_ids_table_properties")
      begin
        let string("\\x01") val = pc.value;
        val = string_replace(val, "read_file(get_ids_table_properties_file_path())", string_representation(""));
        val = string_replace(val, "string_split_no_empty(contents, \\"\\\\n\\")", string_representation(IDS_TABLE_PROPERTIES_FILE_LINES));
        ret = vector_append(ret, val);
      end
      else
        ret = vector_append(ret, pc.value);
  result :: string_join(ret, "\\n");
end]

/*
fk_map_type has been defined to interpret the contents of the "FK_MAP" parameter.
*/
type fk_map_type =
record
  string("\|") fsk_field;
  string("\|") nk_fields;
  string("\|") sk_lookup_name;
end;

/*
table_type_info_type has been defined to interpret the contents of the "TABLE_TYPE_INFO" parameter.
*/
type placeholder_flag_info =
record
  string("\|") table_name;
  string("\|") placeholder_flag;
end;|3|9|RK|Provides functions to use in PDL.|{0|}}
{30001002|XXparameter|FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|ILM_NAME|$[ ILM_NAME ]|3|9|RFK|@{0|}}
{30001002|XXparameter|DIM_INFO||3|9|FK|@{0|}}
{30001002|XXparameter|CUSTOM_MLKP_IDS_LIST|$[CUSTOM_MLKP_IDS_LIST]|3|9|FK|@{0|}}
{30001002|XXparameter|MLKP_FK_MAP|$[
begin
let string("")[int] custom_mlkp_vec_list=if(!is_blank(CUSTOM_MLKP_IDS_LIST)) string_split(CUSTOM_MLKP_IDS_LIST,",") else [vector];
//Parameter was added to remove custom ids ICFF SK lookup from below list .
let string("")[int] v_final_out_map_string_vec=allocate_with_defaults();
let int i=0;

let string("")[int] out_map_string_vec = [vector];
let string("")[1] blank_element_vec = [vector ""];
let string("") one_map = "";		
let string("") storage_type = "";

for(let fk_map_type map in FK_MAP_REC_VEC) begin
storage_type = get_ids_table_properties(map.sk_lookup_name).storage_type;
if(is_blank(storage_type)) force_error("ERROR: No entry found for the table " + map.sk_lookup_name + " in the ids_table_properties meta file");
one_map = if((string_upcase(storage_type) == "ICFF") && (map.sk_lookup_name not member custom_mlkp_vec_list )  ) map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"
                        else "";
out_map_string_vec = vector_append(out_map_string_vec, one_map); 
end
//v_final_out_map_string_vec=if(!is_blank(CUSTOM_MLKP_IDS_LIST)) for vector_difference(out_map_string_vec,custom_mlkp_vec_list) else out_map_string_vec ;
result :: string_join(vector_difference(out_map_string_vec, blank_element_vec), "\\n");
end
]|3|9|K|@{0|}}
{30001002|XXparameter|MLKP_FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(MLKP_FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|MLKP_PLACEHOLDER_FLAG|$[
begin
        let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
        let string("")[int] placeholder_flag_vec = [vector];

        for(let fk_map_type map in fk_maps) begin
                placeholder_flag_vec = vector_append(placeholder_flag_vec, map.sk_lookup_name + "\|" + (string(""))(decimal(""))do_create_placeholder(map.sk_lookup_name));
        end

        result :: string_join(placeholder_flag_vec, "\\n");
end
]|3|9|RK|@{0|}}
{30001002|XXparameter|MICFF_LKPDIR|$[PUB_DATAHUB_MFS_LOOKUP + "/ids/"]|3|9|RK|@{0|}}
{30001002|XXparameter|SLKP_FK_MAP|$[
begin

let string("")[int] out_map_string_vec = [vector];
let string("")[1] blank_element_vec = [vector ""];
let string("") one_map = "";		
let string("") storage_type = "";

for(let fk_map_type map in FK_MAP_REC_VEC) begin
storage_type = get_ids_table_properties(map.sk_lookup_name).storage_type;
if(is_blank(storage_type)) force_error("ERROR: No entry found for the table " + map.sk_lookup_name + " in the ids_table_properties meta file");
one_map = if(string_upcase(storage_type) == "REGULAR") map.fsk_field + "\|" + map.nk_fields + "\|" + map.sk_lookup_name + "\|"
                        else "";
out_map_string_vec = vector_append(out_map_string_vec, one_map); 
end

result :: string_join(vector_difference(out_map_string_vec, blank_element_vec), "\\n");
end
]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_FK_MAP_REC_VEC|$[ begin
  let fk_map_lines = re_split_no_empty(SLKP_FK_MAP, "[\\r\\n]+");
  result :: for ( let string("") line in fk_map_lines ) : reinterpret_as(fk_map_type, line);
end ]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_LKPDIR|$[PUB_DATAHUB_DXF_LOOKUP + "/ids/"]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML_FILE|$[
AI_DML + "/split." + string_split(TARGET, ".")[0] + "/split." + TARGET + ".dml"
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[read_type(TARGET_DML_FILE)]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_SUBRECORD_NAME|$[
begin
let dml_field_info_vec target_dml_info = record_info(TARGET_DML);
let string("") subrecord_name_vec = "";
for(let dml_field_info field in target_dml_info) subrecord_name_vec = if(!is_null(field.typename) and starts_with(field.typename, "split_")) field.name else subrecord_name_vec;
result :: subrecord_name_vec;
end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|UNIQUE_RECORD_IDENTIFIER_KEYS|\{record_nbr\}|19|9|R|Field to partition on|{0|}}
{30001002|XXparameter|IDENTIFIER_FIELDS_DML|/*
This parameter creates output DML with "parition_nbr" and "record_nbr" fields added 
to the split file DML. These fields are used as unique record identifiers which will
be useful to merge the split records later in the component.
*/
$[
begin

let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") micff_slkp_split_dml = TARGET_DML;   
let dml_field_info_item_vec field_name_info = record_info_item(micff_slkp_split_dml, "name");

let decimal("") index = vector_search(field_name_info, "newline");

micff_slkp_split_dml = if(index != -1) remove_fields(micff_slkp_split_dml, [vector "newline"]) else micff_slkp_split_dml;

//Add additional required fields
micff_slkp_split_dml = add_fields(micff_slkp_split_dml, [vector          
                make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("partition_nbr", "decimal(\\"\\")", comment = "Unique record identifier field containing partition number of input record.", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("record_nbr", "decimal(\\"\\")", comment = "Unique record identifier field containing record number of input record.", include_vec = [vector $PUB_DXF_DML + "/generic_data_types.dml"])
                ,make_field("newline", "string(1)", "\\"\\\\n\\"")
        ], generic_types);
                        

result :: if(string_index(micff_slkp_split_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + micff_slkp_split_dml + ";" 
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + micff_slkp_split_dml;

end
]|7|9|RK||{0|}}
{30001002|XXparameter|MLKP_SPLIT_RFMT_DML|/*
This parameter creates output DML reduced fields. It keeps only the FSK fields
coming from the split file and drops the rest of the fields. It adds a field,
"dim_match_stat" which is a vector of a user defined record type to hold some 
information about the dimension from which lookup needs to be perfomed such as
the match status, the table type, the hk value and the dimension name.
*/
$[
begin
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") norm_dml = "record\\nend";

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        norm_dml = add_field(norm_dml, string_split(map.fsk_field, ".")[1], "decimal('\\\\x01')", "", "", 0, NULL, generic_types);       
end

//Add additional required fields
norm_dml = add_fields(norm_dml, [vector
                        make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = generic_types)
                        ,make_field("fsk_field_vec", "string(\\"\\")[int]", include_vec = generic_types)
                        ,make_field("partition_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("record_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                        ], generic_types);


result :: 'include "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type=' + norm_dml + ';';
end
]|7|9|RF||{0|}}
{30001002|XXparameter|MLKP_SPLIT_RFMT_XFR|/*
This parameter generates the xfr which populates the fields in the DML created
by the parameter "MICFF_SPLIT_RFMT_DML".
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let decimal("") index_of_prev_map = -1;
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", 
                        "[vector]", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_hk_vec", "hash_key_combine_type[int]", 
                        "[vector]", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_field_vec", "string(\\"\\")[int]", 
                        "[vector]", include_vec = generic_types);

//Assignment of hash_key_details field
for(let fk_map_type map in fk_maps) begin

        index_of_prev_map = index_of(map) - 1;

        rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_hk", "hash_key_combine_type", 
                        "reinterpret_as(hash_key_combine_type, hash_value(in, '\{" + map.nk_fields + "\}', 'murmur'))",
                        include_vec = generic_types);
                        
        /*Check if this is not the first iteration of the current loop*/
        if(index_of_prev_map != -1) 
                /*If hk value for current and previous iteration is the same, populate only fsk_field_vec, else populate both fsk_field_vec and dim_match_stat.
                This is to ensure that dim_match_stat only gets populated for unique dimensions.*/
                rfmt_xfr = add_statement(rfmt_xfr, "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hk == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_hk)
                                                      fsk_field_vec[length_of(fsk_field_vec)-1] = string_concat(fsk_field_vec[length_of(fsk_field_vec)-1], ';', '" + map.fsk_field + "');
                                                    else begin 
                                                      fsk_field_vec = vector_append(fsk_field_vec,'" + map.fsk_field + "');
                                                      dim_match_stat = vector_append(dim_match_stat, [record dimension '" + map.sk_lookup_name + "' nk_subrec '" + map.nk_fields + "' dim_match_flag 0 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hk]);
                                                    end;", include_vec = generic_types);
        else begin
        /*If this is the first iteration of current loop, populate both fsk_field_vec and dim_match_stat.*/
                rfmt_xfr = add_statement(rfmt_xfr, "fsk_field_vec = vector_append(fsk_field_vec,'" + map.fsk_field + "');", include_vec = generic_types);
                rfmt_xfr = add_statement(rfmt_xfr, "dim_match_stat = vector_append(dim_match_stat, [record dimension '" + map.sk_lookup_name + "' nk_subrec '" + map.nk_fields + "' dim_match_flag 0 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hk]);", include_vec = generic_types);
        end
        
end

rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "dim_match_stat", 
                        include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.fsk_field_vec", 
                        "fsk_field_vec", 
                        include_vec = generic_types);

if(length_of(fk_maps) > 0)
rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in." + string_split(fk_maps[0].fsk_field,".")[0] + ".*", priority = 1,
                        include_vec = generic_types);
                        
rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in.*", priority = 2,
                        include_vec = generic_types);

result :: string_concat(include_type, rfmt_xfr);

end
]|8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|MLKP_MULTIPLY_DML|/*
This parameter creates the multiply DML which is the output of the Normalize
component in the Multifile lookup subgraph. The DML contains the same fields as its
input DML, which points to the parameter, "MICFF_SPLIT_RFMT_DML", except that
the vector in "MICFF_SPLIT_RFMT_DML" is normalized here.
*/
$[
begin
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") norm_dml = "record\\nend";

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        norm_dml = add_field(norm_dml, string_split(map.fsk_field, ".")[1], 'decimal("\\\\x01")', include_vec = generic_types);       
end

//Add additional required fields
norm_dml = add_fields(norm_dml, [vector
                        make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end", include_vec = generic_types)
                        ,make_field("fsk_field", "string(\\"\\")", include_vec = generic_types)
                        ,make_field("partition_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("record_nbr", "decimal(\\"\\")", include_vec = generic_types)
                        ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                        ], generic_types);


result :: 'include "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type=' + norm_dml + ';';
end
]|7|9|RF||{0|}}
{30001002|XXparameter|MLKP_NORM_XFR|/*
This is used in the normalize component in the Multifile lookup subgraph.
*/

out::length(in)=
begin
  out::length_of(in.dim_match_stat); /*Length is same as the number of entries in the "MLKP_FK_MAP" parameter*/
end;

out::normalize(in, index)=
begin
  out.dim_match_stat :: in.dim_match_stat[index];
  out.fsk_field :: in.fsk_field_vec[index];
  out.* :: in.*;
end;|8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|MLKP_RFMT_XFR|/*
This parameter generates the xfr for the Reformat compoent in the Multifile lookup subgraph,
which looks up the "hash_key" value being received from the input in the corresponding 
dimension, the name of which is available in the input field, "dimension". The looked up
value is assigned to the corresponding surrogate key, the name of which is available in 
the input field "sk_field_name".
*/


/*lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("/etl/data/dev//mfs/mfs_4way/aicoe/pub_datahub/lookup/rxclaim_bc/ids/ids_common/one/d_cag.dat.gz"),this_partition_path("/etl/data/dev//mfs/mfs_4way/aicoe/pub_datahub/lookup/rxclaim_bc/ids/ids_common/one/d_cag.idx"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 */
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\ninclude "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";\\n\\n';
let string("") lkp_global = "";
let decimal("") index_of_prev_map = -1;
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml", $PUB_DXF_XFR + "/ids/ids_table_properties.xfr"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);

let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});

lkp_global = lkp_global + 'let string("")[int] dim_placeholder_flags_vec = string_split("' + MLKP_PLACEHOLDER_FLAG + '", "\\\\n");\\n' + 
             'let string("")[int] dimenstion_names_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[0];\\n' + 
             'let decimal("")[int] placeholder_flags_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[1];\\n';

rfmt_xfr = add_local(rfmt_xfr, "flag", "decimal(\\"\\")", 
                        "1", "Flag to hold indictor of non-matching lookup.", generic_types);
rfmt_xfr = add_local(rfmt_xfr, "count", "decimal(\\"\\")", 
                        "0", "Variable to hold count of lookup matches.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "lkp_record", "xref_lookup_type", comment = "Variable to hold looked up record.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "plchldr_dim_index", "decimal(\\"\\\\x01\\")", 'vector_search(dimenstion_names_vec, in.dim_match_stat.dimension)',       
                        comment = "Variable to hold the index of placeholder flag information.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "surogate_key", "decimal(\\"\\\\x01\\")", '((placeholder_flags_vec[plchldr_dim_index])?"0":"-1")',       
                        comment = "Variable to hold the looked up surrogate key.", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "fsk_vec", "string(\\"\\")[int]", 
                        "string_split(in.fsk_field, ';')", "Vector to hold multiple FSKs mapped to the same dimension.", generic_types);
                        
for(let fk_map_type map in fk_maps) begin
  index_of_prev_map = index_of(map) - 1;
  
  rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_found", "decimal(\\"\\")", 
                        '"' + map.fsk_field + '" member fsk_vec', "Flag set to true if FSK field is present in FSK_VEC", generic_types);
  
  lkp_global = lkp_global + '\\nlet lookup_identifier_type ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_not_loaded();\\n\\n';

  if(index_of_prev_map == -1) begin
        rfmt_xfr = add_statement(rfmt_xfr, '  if(' + string_split(map.fsk_field, ".")[1] + '_found && ' + string_split(map.fsk_field, ".")[1] + '_lkp_id == lookup_not_loaded()) begin ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_load(this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".dat.gz"),
                               this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".idx"), "ICFF HK UK Lookup Template", -1); end', include_vec = generic_types);
  end
  else begin
        rfmt_xfr = add_statement(rfmt_xfr, '  if("' + map.sk_lookup_name + '" == "' + fk_maps[index_of_prev_map].sk_lookup_name + '" && ' + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + '_found)' + 
                string_split(map.fsk_field, ".")[1] + '_lkp_id = ' + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + '_lkp_id;
  else begin
    if(' + string_split(map.fsk_field, ".")[1] + '_found && ' + string_split(map.fsk_field, ".")[1] + '_lkp_id == lookup_not_loaded()) begin ' + string_split(map.fsk_field, ".")[1] + '_lkp_id = lookup_load(this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".dat.gz"),
      this_partition_path("' + MICFF_LKPDIR + '" + string_split(in.dim_match_stat.dimension, ".")[0] + "/xref/xref." + string_split(in.dim_match_stat.dimension, ".")[1] + ".idx"), "ICFF HK UK Lookup Template", -1); end
  end', include_vec = generic_types);
  end
end

for(let fk_map_type map in fk_maps) begin
  index_of_prev_map = index_of(map) - 1;
  if(index_of_prev_map == -1) begin                             
        rfmt_xfr = add_statement(rfmt_xfr, "  if(" + string_split(map.fsk_field, ".")[1] + "_found) begin 
        count = lookup_count(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
        if(count != 0) begin 
          lkp_record = lookup_last(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
          if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
            surogate_key = lkp_record.dxf_sk;
            flag = 0;
          end
          else begin block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
            for(let int i = 0, i < count - 1) begin 
              lkp_record = lookup_previous(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template');
              if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
                surogate_key = lkp_record.dxf_sk;
                flag = 0;
                exit " + string_split(map.fsk_field, ".")[1] + "_exact_rec;
              end;
            end;
          end block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
        end
        else flag = 1;
      end", include_vec = generic_types);
  end
  else begin
    //Actual lookup statement
        rfmt_xfr = add_statement(rfmt_xfr, "  if('" + map.sk_lookup_name + "' != '" + fk_maps[index_of_prev_map].sk_lookup_name + "' \|\| not " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_found) begin
      if(" + string_split(map.fsk_field, ".")[1] + "_found) begin 
        count = lookup_count(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
        if(count != 0) begin 
          lkp_record = lookup_last(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template', in.dim_match_stat.fsk_hk.dxf_hk_part1);
          if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
            surogate_key = lkp_record.dxf_sk;
            flag = 0;
          end
          else begin block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
            for(let int i = 0, i < count - 1) begin 
              lkp_record = lookup_previous(" + string_split(map.fsk_field, ".")[1] + "_lkp_id, 'ICFF HK UK Lookup Template');
              if(lkp_record.dxf_hk_part2 == in.dim_match_stat.fsk_hk.dxf_hk_part2) begin
                surogate_key = lkp_record.dxf_sk;
                flag = 0;
                exit " + string_split(map.fsk_field, ".")[1] + "_exact_rec;
              end;
            end;
          end block " + string_split(map.fsk_field, ".")[1] + "_exact_rec
        end
        else flag = 1;
      end
    end", include_vec = generic_types); 
  end
end

//Surrogate Key assignment
for(let fk_map_type map in fk_maps) 
        rfmt_xfr = add_rule(rfmt_xfr, "out." + string_split(map.fsk_field, ".")[1], 
                        "if(" + string_split(map.fsk_field, ".")[1] + "_found) surogate_key 
                        else in." + string_split(map.fsk_field, ".")[1], 
                        comment = "Assignement of looked up universal key to the appropriate field.", include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "[record dimension in.dim_match_stat.dimension nk_subrec in.dim_match_stat.nk_subrec dim_match_flag flag fsk_hk in.dim_match_stat.fsk_hk]", 1, include_vec = generic_types);                       

rfmt_xfr = add_rule(rfmt_xfr, "out.*", 
                        "in.*", include_vec = generic_types);

result :: string_concat(include_type, "\\n", lkp_global, rfmt_xfr);

end
]|8|9|RFO|Reformat transform|{0|}}
{30001002|XXparameter|MLKP_ROLLUP_XFR|/*
This parameter creates the xfr for the Rollup component in the Multifile Lookup subgraph 
which aggregates the multiplied records which represent the same entity, by grouping
on the unique record identifier fields, i.e. "record_nbr"(additional field created 
and populated in Normalize).
Note: The field "partition_nbr" which is also added for unqiue identification of the 
record, need not be used, since the records are being repartitioned as per their 
original partitions using Partition by Expression component before this Rollup.
*/
$[
begin

//Temporary type definition
let string("") include_type = 
'\\ninclude "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_XFR + "/ids/ids_table_properties.xfr"];
let fk_map_type[int] fk_maps = vector_sort(MLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let string("") globals = 'let string("")[int] dim_placeholder_flags_vec = string_split("' + MLKP_PLACEHOLDER_FLAG + '", "\\\\n");\\n' + 
             'let string("")[int] dimenstion_names_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[0];\\n' + 
             'let decimal("")[int] placeholder_flags_vec = for(let flag in dim_placeholder_flags_vec) : string_split(flag, "\|")[1];\\n';

let string("") rlp_xfr = make_transform("rollup", [vector make_arg("in")], [vector make_arg("out")]);

rlp_xfr = add_local(rlp_xfr, "plchldr_dim_index", "decimal(\\"\\\\x01\\")", 'vector_search(dimenstion_names_vec, in.dim_match_stat.dimension)',       
                        comment = "Variable to hold the index of placeholder flag information.", include_vec = generic_types);

rlp_xfr = add_local(rlp_xfr, "fsk_vec", "string(\\"\\")[int]", 
                        "string_split(in.fsk_field, ';')", "Vector to hold multiple FSKs mapped to the same dimension.");

rlp_xfr = add_local(rlp_xfr, "is_unmatched_and_placeholder", "", 
                        "placeholder_flags_vec[plchldr_dim_index] && in.dim_match_stat.dim_match_flag == 1", "Flag that signifies whether there is a mismatch and a placeholder is required.");

rlp_xfr = add_rule(rlp_xfr, "out.dim_match_stat", 
                        "accumulation(in.dim_match_stat, is_unmatched_and_placeholder)", include_vec = generic_types);
rlp_xfr = add_rule(rlp_xfr, "out.fsk_field_vec", 
                        "accumulation(in.fsk_field, is_unmatched_and_placeholder)", , include_vec = generic_types);
        
for(let fk_map_type map in fk_maps) 
rlp_xfr = add_rule(rlp_xfr, "out." + string_split(map.fsk_field, ".")[1], 
                        "first(in." + string_split(map.fsk_field, ".")[1] + ", vector_search(fsk_vec, '" + map.fsk_field + "') != -1)");
                        
rlp_xfr = add_rule(rlp_xfr, "out.*", "in.*");

result :: string_concat(include_type, "\\n", globals, "\\n", rlp_xfr);
end
]|8|9|RFO|Required and optional DML functions|{0|}}
{30001002|XXparameter|MLKP_SK_COUNT|$[ (decimal(""))length_of(MLKP_FK_MAP_REC_VEC) ]|3|9|K|@{0|}}
{30001002|XXparameter|SLKP_RFMT_XFR|/*
This parameter generates the xfr for the Reformat compoent in the Serial Lookup Subgraph,
which looks the "hash_key" value being calculated locally in the corresponding dimension
and assigns the looked up "universal key" value to the corresponding surrogate key.
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);
let string("") fk_map_parameter = SLKP_FK_MAP;
let fk_map_type[int] fk_maps = vector_sort(SLKP_FK_MAP_REC_VEC, \{sk_lookup_name\});
let string("") globals = "";
let dml_field_info_vec target_dml_info = [vector];
let dml_field_info_vec date_rec_info = [vector];
let string('') date_format = '';
let string('') date_field_name = '';
let decimal('') uk_default = '';
let decimal('') index_of_prev_map = '';
let placeholder_flag = 0;

rfmt_xfr = add_local(rfmt_xfr, "count", "decimal(\\"\\")", 
                        include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "lkp_record", "xref_serial_lookup_type", comment = "Variable to hold the looked up record", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat_rec", "  record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end", include_vec = generic_types);
rfmt_xfr = add_local(rfmt_xfr, "dim_match_stat_vec", "  record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", "[vector]", include_vec = generic_types);


for(let fk_map_type map in fk_maps) begin

        index_of_prev_map = index_of(map) - 1;
        rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_surrogate_key", "decimal(\\"\\")",(string("")) uk_default, include_vec = generic_types);                
                
        /*Check if current lookup is d_date.*/
        if(!ends_with(map.sk_lookup_name, "d_date")) begin

                /*Obtain placeholder flag for current lookup file to identify if a placeholder record needs to be generated.*/
                placeholder_flag = do_create_placeholder(map.sk_lookup_name);
                uk_default = (placeholder_flag?0:-1);

                rfmt_xfr = add_local(rfmt_xfr, string_split(map.fsk_field, ".")[1] + "_hash_key", "hash_key_combine_type", 
                        "reinterpret_as(hash_key_combine_type, hash_value(in, '\{" + map.nk_fields + "\}', 'murmur'))", "Local variables of the to hold hash value.", include_vec = generic_types);
                
                /*Check if current iteration is not the first iteration of this loop, and if lookup name for current iteration is same as that of the previous iteration.*/
                if(index_of_prev_map != -1 and map.sk_lookup_name == fk_maps[index_of_prev_map].sk_lookup_name)
                        /*If the lookup name of current and previous iteration is the same, populate the current iteration's lookup identifier from the previous iteration's lookup identifier.
                        This will eliminate another call to lookup load for the same lookups.*/
                        globals = string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_lkp_identifier;\\n");
                else
                        /*If the lookup name of current and previous iteration is different, generate the lookup load statement for the new lookup table.*/
                        globals = if(DXF_SERVER_ARCHITECTURE == "SMP") string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = lookup_load('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".dat', '" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".idx', 'Regular HK UK Lookup Template');\\t\\t/*Local variables of the to hold identifier for lookup.*/\\n")
                                  else string_concat(globals, "let lookup_identifier_type " + string_split(map.fsk_field, ".")[1] + "_lkp_identifier = lookup_load(this_partition_path('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".dat'), this_partition_path('" + SLKP_LKPDIR + "/" + string_split(map.sk_lookup_name, ".")[0] + "/xref/xref." +  string_split(map.sk_lookup_name, ".")[1] + ".idx'), 'Regular HK UK Lookup Template');\\t\\t/*Local variables of the to hold identifier for lookup.*/\\n");

                /*Check if current iteration is not the first iteration of this loop, and if lookup name for current iteration is not d_date.*/
                if(index_of_prev_map != -1 and !ends_with(fk_maps[index_of_prev_map].sk_lookup_name, "d_date"))
                        /*Check if placeholder flag has been turned off, in which case dim_match stat need not be populated.*/
                        if(placeholder_flag == 0)
                                rfmt_xfr = add_statement(rfmt_xfr, 
                                                         "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hash_key == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1]  + "_hash_key) "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_surrogate_key; else begin "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");
                                                         end",
                                                         include_vec = generic_types);
                        else
                        /*If placeholder flag has been turned on, generate the code to populate dim_match_stat.*/
                                rfmt_xfr = add_statement(rfmt_xfr, 
                                                         "if('" + map.sk_lookup_name + "' == '" + fk_maps[index_of_prev_map].sk_lookup_name + "' and " + string_split(map.fsk_field, ".")[1] + "_hash_key == " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1]  + "_hash_key) "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = " + string_split(fk_maps[index_of_prev_map].fsk_field, ".")[1] + "_surrogate_key; else begin "
                                                           + string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");
                                                           if(" + string_split(map.fsk_field, ".")[1] + "_surrogate_key == " + (string(""))(decimal(""))uk_default + ") begin
                                                             dim_match_stat_rec = [record dimension \\"" + map.sk_lookup_name + "\\" nk_subrec \\"" + map.nk_fields + "\\"dim_match_flag 1 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hash_key];
                                                             dim_match_stat_vec = vector_append(dim_match_stat_vec, dim_match_stat_rec);
                                                           end
                                                         end",
                                                         include_vec = generic_types);
                else begin
                        /*If the current iteration is the first iteration of the loop, generate lookup statements without checking the details of the previous iteration.*/
                        rfmt_xfr = add_statement(rfmt_xfr, 
                                                 string_split(map.fsk_field, ".")[1] + "_surrogate_key = first_defined(lookup(" + string_split(map.fsk_field, ".")[1] + "_lkp_identifier, 'Regular HK UK Lookup Template', " + string_split(map.fsk_field, ".")[1] + "_hash_key).dxf_sk, " + (string(""))(decimal(""))uk_default + ");", 
                                                 include_vec = generic_types);
                        /*If placeholder flag has been turned on, generate the code to populate dim_match_stat.*/
                        if(placeholder_flag == 1)
                                rfmt_xfr = add_statement(rfmt_xfr, "if(" + string_split(map.fsk_field, ".")[1] + "_surrogate_key == " + (string(""))(decimal(""))uk_default + ") begin
                                                                     dim_match_stat_rec = [record dimension \\"" + map.sk_lookup_name + "\\" nk_subrec \\"" + map.nk_fields + "\\" dim_match_flag 1 fsk_hk " + string_split(map.fsk_field, ".")[1] + "_hash_key];
                                                                     dim_match_stat_vec = vector_append(dim_match_stat_vec, dim_match_stat_rec);
                                                                   end", include_vec = generic_types);
                end
        end
        else begin
                /*Generate transform for d_date.*/
                target_dml_info = record_info(TARGET_DML);
                date_rec_info = record_info(target_dml_info[vector_search(target_dml_info, [record name map.nk_fields dml_type "" default "" condition "" nullable 0 nullflag 0 form "" comment NULL scomment "" typename "" offset NULL includes NULL], \{name\})].dml_type);
                date_format = date_rec_info[0].dml_type;
                date_field_name = date_rec_info[0].name;
                rfmt_xfr = add_statement(rfmt_xfr, string_split(map.fsk_field, ".")[1] + '_surrogate_key = if(is_null(in.' + map.nk_fields + '.' + date_field_name + ') or is_blank(in.' + map.nk_fields + '.' + date_field_name + ')) (decimal(""))(string(""))(date("YYYYMMDD"))"19000101" else (decimal(""))(string(""))(date("YYYYMMDD"))(' + date_format + ')in.' + map.nk_fields + '.' + date_field_name + ';', include_vec = generic_types);                      
        end

        rfmt_xfr = add_rule(rfmt_xfr, 
                            "out." + map.fsk_field,
                            string_split(map.fsk_field, ".")[1] + "_surrogate_key",
                            comment = "Assignement of looked up universal key to the appropriate field.", 
                            include_vec = generic_types);

end


rfmt_xfr = add_rule(rfmt_xfr, "out.dim_match_stat", 
                        "dim_match_stat_vec", include_vec = generic_types);

rfmt_xfr = add_rule(rfmt_xfr, "out.*", "in.*", include_vec = generic_types);

result :: string_concat(include_type, globals, rfmt_xfr);

end
]|8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|SLKP_SK_COUNT|$[ (decimal(""))length_of(SLKP_FK_MAP_REC_VEC) ]|3|9|K|@{0|}}
{30001002|XXparameter|SK_COUNT|$[
MLKP_SK_COUNT + SLKP_SK_COUNT
]|3|9|RK|@{0|}}
{30001002|XXparameter|MERGE_ALL_LKPS_XFR|/*
This parameter creates the xfr for the fuse which merges all the records that
were split to be looked up using various approaches.
*/
$[
begin

let string("") include_type = '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n';

let string("") fuse_xfr = make_transform("fuse", [vector make_arg("in0"), make_arg("in1")], [vector make_arg("out")]);

for(let fk_map_type map in MLKP_FK_MAP_REC_VEC) begin
        fuse_xfr = add_rule(fuse_xfr, "out." + map.fsk_field, 
                        "in0." + string_split(map.fsk_field, ".")[1],
                        comment = "Assignement of surrogate key to appropriate out field.");
end

for(let fk_map_type map in SLKP_FK_MAP_REC_VEC) begin
        fuse_xfr = add_rule(fuse_xfr, "out." + map.fsk_field, 
                        "in1." + map.fsk_field,
                        comment = "Assignement of surrogate key to appropriate out field.");
end

fuse_xfr = add_rule(fuse_xfr, "out.dim_match_stat", "vector_concat(in0.dim_match_stat, in1.dim_match_stat)");

/*fuse_xfr = add_rule(fuse_xfr, "out.dim_match_stat", "vector_concat(for(let dim in in0.dim_match_stat) : if(dim.dim_match_flag == 1 and dim.table_type not member [vector 'fact', 'reference_static']) dim,
                                                                   for(let dim in in1.dim_match_stat) : if(dim.dim_match_flag == 1 and dim.table_type not member [vector 'fact', 'reference_static']) dim)"
                                                                   );*/
fuse_xfr = add_rule(fuse_xfr, "out.*", "in1.*");

result :: string_concat(include_type, fuse_xfr);

end
]|8|9|RFO|Required DML function|{0|}}
{30001002|XXparameter|DISTINGUISH_OUTINDEXES|//Output Index xfr to obtain a separate copy of non-matching records.
output_indices_out::output_indexes(in)=
begin
  output_indices_out :: if(length_of(in.dim_match_stat) == 0) [vector 0] else [vector 0, 1];
end;|8|9|RK|Output index vector computation|{0|}}
{30001002|XXparameter|DISTINGUISH_DML|/*
Distinguish dml which contains the same fields as the target, with the addition of
"dim_match_stat" and "target". (Required for processing of non-matching record.
*/
$[
begin

let string("") distinguish_dml = TARGET_DML;
let dml_field_info_item_vec field_name_info = record_info_item(distinguish_dml, "name");
let decimal("") index = vector_search(field_name_info, "newline");
let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];

distinguish_dml = if(index != -1) remove_fields(distinguish_dml, [vector "newline"]) else distinguish_dml;

index = vector_search(field_name_info, "newline");

distinguish_dml = add_fields(distinguish_dml, [vector 
                make_field("dim_match_stat", "record\\n    string(\\"\\") dimension;\\n    string(\\"\\") nk_subrec;\\n    decimal(\\"\\") dim_match_flag;\\n    hash_key_combine_type fsk_hk;\\n  end[int]", include_vec = generic_types)
                ,make_field("target", "string('')", include_vec = generic_types)
                ,make_field("newline", "string(1)", "\\"\\\\n\\"", include_vec = generic_types)
                ]);

result :: if(string_index(distinguish_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + distinguish_dml + ";" 
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + distinguish_dml;
end
]|7|9|RK||{0|}}
{30001002|XXparameter|DISTINGUISH_XFR|/*
Distinguish xfr to separate out only those records for which the match
status is 1, indicating a non-matching record.
*/

include "~$PUB_DXF_DML/generic_data_types.dml";

out::reformat(in)=
begin
  let record
    string("") dimension;
    string("") nk_subrec;
    decimal("") dim_match_flag;
    hash_key_combine_type fsk_hk;
  end[int] dim_match_stat_vec = for(let dim_match_entry in in.dim_match_stat):
                                    if(dim_match_entry.dim_match_flag == 1) dim_match_entry;
  out.target :: $"TARGET";
  out.dim_match_stat :: dim_match_stat_vec;
  out.* :: in.*;
end;|8|9|RO|Reformat transform|{0|}}
{30001002|XXparameter|NON_MATCHING_DML|//DML of the non-matching port
$[
begin

let dml_include_vec generic_types = [vector $PUB_DXF_DML + "/generic_data_types.dml"];
let string("") non_matching_dml = "record\\nend";
let string("") final_non_matching_dml = "";
//let string("") fk_map_parameter = MLKP_FK_MAP + "\\r\\n" + SLKP_FK_MAP;
//let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

non_matching_dml = add_fields(non_matching_dml, [vector
                        make_field("fsk_hk", "hash_key_combine_type", include_vec = generic_types)
                        ,make_field("out_fields", "  record\\n    string(\\"\\") field_name;\\n    string(\\"\\") field_value;\\n  end[int]", include_vec = generic_types)
                        ,make_field("dimension", "string(\\"\\")", comment = "Name of the dimension to which the hash_key in the above field will correspond.", include_vec = generic_types)
                        ,make_field("target", "string(\\"\\")", comment = "Name of the target from which the non-matching record has been produced.", include_vec = generic_types)
                        ], generic_types);

final_non_matching_dml = if(string_index(non_matching_dml, "metadata type") == 0) '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\nmetadata type = \\n' + non_matching_dml + ";"
                else '\\ninclude "~$PUB_DXF_DML/generic_data_types.dml";\\n\\n' + non_matching_dml;
                
result :: join_types(read_type(PUB_DXF_DML + "/split_header.type2.dml"), join_types(read_file(PUB_DXF_DML + "/dxf_header.dml"), final_non_matching_dml));

end
]|7|9|RK|@{0|}}
{30001002|XXparameter|NON_MATCHING_XFR|/*
Generates XFR for populating data for non-matching records (Layout 
of the same is as specified in NON-MATCHING DML parameter).
*/
$[
begin
let string("") include_type = 'include "~$PUB_DXF_XFR/bre_helper.map.xfr";';
let string("") length_function = make_transform("length", [vector make_arg("in")], [vector make_arg("out")]);
let string("") normalize_function = make_transform("normalize", [vector make_arg("in"), make_arg("index")], [vector make_arg("out")]);
//let string("") output_select_function = make_transform("output_select", [vector make_arg("final")], [vector make_arg("out")]);
let string("") globals = "";
//let string("") fk_map_parameter = MLKP_FK_MAP + "\\r\\n" + SLKP_FK_MAP;
//let fk_map_type[int] fk_maps = for ( let string("") line in re_split_no_empty(fk_map_parameter, "[\\r\\n]+") ) : reinterpret_as(fk_map_type, line);

if(!is_blank(DIM_INFO)) begin 

globals = 'let string("") dim_info_parameter = "' + DIM_INFO + '";
let  record
    string("\|") dim_name;
    string("\|") nk_subrec;
    string("\|") dim_fields_not_in_split_file;
    string("\|") dim_fields_in_split_file;
    string("\|") fsk_field;
end[int]dim_info=for ( let string("") line in re_split_no_empty(dim_info_parameter, "[\\n]+") ) : reinterpret_as(record string("\|") dim_name; string("\|") nk_subrec; string("\|") dim_fields_not_in_split_file; string("\|") dim_fields_in_split_file; string("\|") fsk_field; end, line);';


length_function = add_rule(length_function, "out", 'length_of(in.dim_match_stat)');
normalize_function = add_rule(normalize_function, "out.*", is_blank(TARGET_SUBRECORD_NAME) ? "in.*" : "in." + TARGET_SUBRECORD_NAME + ".*");

normalize_function = add_local(normalize_function, 'out_fields', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the field name, field value pair to be assigned to the out_fields output field.");
normalize_function = add_local(normalize_function, 'out_field_in_split_file', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the output dimension fields which need to be pulled from split file.");
normalize_function = add_local(normalize_function, 'out_field_not_in_split_file', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Variable to hold the output dimension fields which are not present in the split file and need to be assigned blank value.");
normalize_function = add_local(normalize_function, 'out_sk_fields', "  record\\n    string('\\\\x01') field_name;\\n    string('\\\\x01') field_value;\\n  end[int]", "[vector]", comment = "Output SK field which needs to be assigned default value i.e. '0' here.");


normalize_function = add_local(normalize_function, 'dim_index', 'decimal("")', "-1");
normalize_function = add_local(normalize_function, 'dim_fields_not_in_split_file', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'dim_fields_in_split_file', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'sk_fields', 'string("")[int]', "[vector]");
normalize_function = add_local(normalize_function, 'field_nm', 'string("")', "");
normalize_function = add_local(normalize_function, 'default', 'string("")', "");


normalize_function = add_statement(normalize_function, 'dim_index = vector_search(dim_info, [record dim_name in.dim_match_stat[index].dimension nk_subrec in.dim_match_stat[index].nk_subrec dim_fields_not_in_split_file "" dim_fields_in_split_file "" fsk_field ""], \{dim_name;nk_subrec\});');

normalize_function = add_statement(normalize_function, 'dim_fields_not_in_split_file = string_split_no_empty(dim_info[dim_index].dim_fields_not_in_split_file, ";");');

normalize_function = add_statement(normalize_function, 'dim_fields_in_split_file = string_split_no_empty(dim_info[dim_index].dim_fields_in_split_file, ";");');

normalize_function = add_statement(normalize_function, 'sk_fields = string_split_no_empty(dim_info[dim_index].fsk_field, ";");');

normalize_function = add_statement(normalize_function, 'out_field_not_in_split_file = for(let string("") field in dim_fields_not_in_split_file) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value ""];');
normalize_function = add_statement(normalize_function, 'out_field_in_split_file = for(let string("") field in dim_fields_in_split_file) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value first_defined((string(""))eval(in,field), "")];');
normalize_function = add_statement(normalize_function, 'out_sk_fields = for(let string("") field in sk_fields) field_nm = if(length_of(string_split(field, ".")) == 2) string_split(field, ".")[1] else field; : [record field_name field_nm field_value "0"];');
normalize_function = add_statement(normalize_function, 'out_fields = vector_concat(vector_concat(out_field_not_in_split_file,out_field_in_split_file), out_sk_fields);');

normalize_function = add_rule(normalize_function, "out.out_fields", "out_fields");
normalize_function = add_rule(normalize_function, "out.dimension", "in.dim_match_stat[index].dimension");
normalize_function = add_rule(normalize_function, "out.fsk_hk", "in.dim_match_stat[index].fsk_hk");
normalize_function = add_rule(normalize_function, "out.target", "in.target");

end
else 
begin
length_function = add_rule(length_function, "out", 'length_of(in.dim_match_stat)');
normalize_function = add_rules(normalize_function, [vector make_rule('out.out_fields', '[vector]')
                        ,make_rule("out.fsk_hk", 'in.dim_match_stat[index].fsk_hk')
                        ,make_rule("out.dimension", 'in.dim_match_stat[index].dimension')
                        ,make_rule("out.target", '"-"')
                        ,is_blank(TARGET_SUBRECORD_NAME) ? make_rule("out.*", "in.*") : make_rule("out.*", "in." + TARGET_SUBRECORD_NAME + ".*")]);

end;

result :: include_type + "\\n\\n" + globals + "\\n\\n" + length_function + "\\n" + normalize_function;

end
]|8|9|RK|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|all|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1600343702|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|foreign_key_lookup|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1707000|760000|3|}}
{2010240003|XXGlegend|266|0|662|0|{@{}@This subgraph extracts the surrogate key 
for every pair of natural keys passed to it|44000|60000|0|0|0|0|14169|}}
{2010242002|XXGface|267|0|664|0|{@{}@Arial|128|220|1|}}
{2010210004|XXGflow|268|0|666|0|{@{}@384|.5|.5|{0|}14205|17|}}
{2010210004|XXGflow|269|0|668|0|{@{}@384|.5|.5|{0|}14201|17|}}
{2010210004|XXGflow|270|0|670|0|{@{}@384|.5|.5|{0|}14211|17|}}
{2010210004|XXGflow|271|0|672|0|{@{}@384|.5|.5|{0|}1396|17|}}
{2010210004|XXGflow|272|0|674|0|{@{}@384|.5|.5|{0|}14212|17|}}
{2010210004|XXGflow|273|0|676|0|{@{}@384|.5|.5|{0|}14207|17|}}
{2010210004|XXGflow|274|0|678|0|{@{}@384|.5|.5|{0|}14202|17|}}
{2010501005|XXGpvertex|275|0|680|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0) 0
else if((decimal(""))MLKP_SK_COUNT  == 0 && (decimal(""))SLKP_SK_COUNT  == 0) 0
else 1
]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$IDENTIFIER_FIELDS_DML|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Fuse|990000|250000|0|0|0|0|14214|FUSE: Merge All Lookup Records|Ab Initio Software|Built-in 2.10:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|276|0|682|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|277|0|685|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|278|0|687|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|279|0|689|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|280|0|691|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|281|0|693|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|282|0|695|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|283|0|698|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|284|0|701|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Fuse|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|285|0|703|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|286|0|706|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|287|0|709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|288|0|712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|289|0|715|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|290|0|718|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|291|0|721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|292|0|724|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010503005|XXGfvertex|293|0|728|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";
 
metadata type = xref_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
}}@0|Lookup Template|1129000|119500|0|0|0|0|14215|ICFF HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|294|0|730|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Lookup Template|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|295|0|732|0|{Subgraph created from graph "Universal Key Extraction_optimized"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|NORM_XFR||8|8|RFO=|Required and optional DML functions|{0|}}
{30001002|XXparameter|RFMT_XFR||8|8|RFO=|Reformat transform|{0|}}
{30001002|XXparameter|ROLLUP_XFR||8|8|RFO=|Required and optional DML functions|{0|}}
{30001002|XXparameter|MULTIPLY_DML||7|8|RF=||{0|}}
{30001002|XXparameter|SPLIT_RFMT_XFR||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|SPLIT_RFMT_DML||7|8|RF=||{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@637750|228750|0|0|0|0|14191|MUltifile Lookup|gunit.kaur|Created 5/6/2016 11:13:41 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1442000|725000|3|}}
{2010240003|XXGlegend|296|0|734|0|{@{}@This subgraph takes the split file as input and extracts the 
universal key for every pair of natural keys passed to it|44000|60000|0|0|0|0|536|}}
{2010242002|XXGface|297|0|736|0|{@{}@Arial|128|140|1|}}
{2010210004|XXGflow|298|0|738|0|{@{}@384|.5|.5|{0|}1000|17|}}
{2010210004|XXGflow|299|0|740|0|{@{}@384|.5|.5|{0|}988|20|}}
{2010210004|XXGflow|300|0|742|0|{@{}@384|.5|.5|{0|}995|17|}}
{2010210004|XXGflow|301|0|744|0|{@{}@384|.5|.5|{0|}911|17|}}
{2010210004|XXGflow|302|0|746|0|{@{}@384|.5|.5|{0|}999|529|}}
{2010210004|XXGflow|303|0|748|0|{@{}@384|.5|.5|{0|}991|17|}}
{2010501005|XXGpvertex|304|0|750|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|615000|235000|0|0|0|0|1004|NORM: Multiply input records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|305|0|752|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|306|0|755|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|307|0|757|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|308|0|759|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|309|0|761|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|310|0|764|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|311|0|766|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|312|0|769|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|313|0|772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|314|0|775|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|315|0|778|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|316|0|783|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|function|partition_nbr|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Partition by Expression|773000|560000|0|0|0|0|1005|PBE: Repartition records as per their previous partition order|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|317|0|785|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|318|0|788|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|319|0|790|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|320|0|792|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|321|0|794|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|322|0|797|0|{Distributes data records to its output flow partitions according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|function-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|function||20|2|RFO$|Function to partition on|{0|}}
{30001002|XXparameter|function.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_function|-use_package|3|2|RO$|Replaces function as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_function.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the partition_index() function defined in the package to specify the partition index.|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) index_out::partition_index(in)|3|2|H$|Use this instead of the function parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) index_out::partition_index(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|version 2.16: param logging True|3|15|P?|@{0|}}
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
{30001002|XXparameter|port_analysis|reject=in;out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|323|0|799|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|324|0|802|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|325|0|805|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|326|0|808|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|327|0|811|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|328|0|814|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/Sort/Partition_by_Key_and_Sort.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|Key|\{dim_match_stat.fsk_hk.dxf_hk_part1\}|3|9||@{0|}}
{30001002|XXparameter|Max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
}}@0|@1000000|255000|0|0|481000|303000|1006|PBKS: \{hash_key\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|329|0|816|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|330|0|818|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|331|0|820|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|332|0|823|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|333|0|826|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|334|0|828|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|335|0|830|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|336|0|834|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|337|0|838|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|338|0|842|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|9|RFs||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|9|RFs||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|339|0|844|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|340|0|846|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|341|0|848|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|342|0|851|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|343|0|853|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|344|0|855|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|345|0|858|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|346|0|863|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|347|0|865|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|348|0|867|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|349|0|870|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|350|0|872|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|351|0|875|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|352|0|881|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|353|0|884|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|354|0|887|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|514500|572500|0|0|0|0|1007|RFMT: Extract universal key for multiplied records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|355|0|889|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|356|0|892|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|357|0|894|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|358|0|896|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|359|0|898|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|360|0|901|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|361|0|903|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|362|0|907|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|363|0|910|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|364|0|913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|365|0|916|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|366|0|920|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|115000|227000|0|0|0|0|1009|RFMT: Split file and generate hash_key and partition and record numbers|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|367|0|922|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|368|0|925|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|369|0|927|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|370|0|929|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|371|0|931|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|372|0|933|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|373|0|935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|374|0|939|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|375|0|942|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|376|0|945|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|377|0|948|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|378|0|953|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$UNIQUE_RECORD_IDENTIFIER_KEYS|3|9||@{0|}}
{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|1219000|560000|0|0|0|0|1011|RLP: Merge records representing the same entity|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|379|0|955|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|380|0|957|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|381|0|959|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|382|0|961|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|383|0|963|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|384|0|966|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|385|0|968|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|386|0|971|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|387|0|974|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|388|0|977|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|389|0|980|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|390|0|985|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$UNIQUE_RECORD_IDENTIFIER_KEYS|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_HALF|3|2|$|@{0|}}
}}@0|Sort|1020000|588000|0|0|0|0|1012|SORT \{record_nbr\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|391|0|987|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|392|0|990|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|393|0|993|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|394|0|995|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|395|0|998|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|396|0|1001|0|{@{}@0|0|0|0|out1|.8094804010938924|@@@14352|0|}}
{2010202004|XXGiport|397|0|1005|0|{@{}@0|0|0|0|in0|.28167730173199634|@@@13840|0|}}
{2010501005|XXGpvertex|398|0|1015|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|$NON_MATCHING_XFR|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$NON_MATCHING_DML|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Normalize|1332000|590000|0|0|0|0|14217|NORM: Split non-matching records from each dimension|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|399|0|1017|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|400|0|1019|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|401|0|1021|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|402|0|1023|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|403|0|1025|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|404|0|1028|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|405|0|1030|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|406|0|1033|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|407|0|1036|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|408|0|1039|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|409|0|1042|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|410|0|1045|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|3|c|@{0|}}
{30001002|XXparameter|transform1|$DISTINGUISH_XFR|3|9||@{0|}}
{30001002|XXparameter|output_indexes|$DISTINGUISH_OUTINDEXES|3|9||@{0|}}
{30001002|XXparameter|out1_metadata|$DISTINGUISH_DML|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|1001000|465000|0|0|0|0|14219|RFMT: Distinguish Non-Matching Records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|411|0|1047|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|412|0|1049|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|413|0|1052|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|414|0|1054|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|415|0|1056|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|416|0|1058|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|417|0|1060|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|418|0|1062|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|419|0|1065|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|420|0|1067|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|421|0|1071|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|422|0|1075|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|423|0|1078|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|424|0|1081|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|425|0|1084|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|426|0|1087|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|427|0|1090|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|428|0|1093|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_DML/generic_data_types.dml";
/*Reformat operation*/
out::reformat(in)=
begin
out.partition_nbr :: this_partition();
out.record_nbr :: invocation_number();
out.dim_match_stat :: allocate_with_defaults();
out.* :1: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$IDENTIFIER_FIELDS_DML|3|9||@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|65000|300000|0|0|0|0|14220|RFMT: Split ICFF and Regular Lookup records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|429|0|1095|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|430|0|1098|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|431|0|1100|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|432|0|1102|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|433|0|1104|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|434|0|1106|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|435|0|1108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|436|0|1112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|437|0|1115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|438|0|1118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|439|0|1121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|440|0|1124|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";
 
metadata type = xref_serial_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
}}@0|Lookup Template|899000|119500|0|0|0|0|14222|Regular HK UK Lookup Template|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|441|0|1126|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Lookup Template|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|442|0|1128|0|{Subgraph created from graph "Universal Key Extraction_multi_serial"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RFMT_XFR||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))SLKP_SK_COUNT  == 0) 0 else 1
]|3|9|F||{0|}}
}}@0|@636000|437000|0|0|0|0|14213|Regular Serial Lookup|gunit.kaur|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|735000|458000|7|}}
{2010501005|XXGpvertex|443|0|1130|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|output_indexes||3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|180000|165000|0|0|0|0|685|RFMT: Extract Universal Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|444|0|1132|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|445|0|1134|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|446|0|1136|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|447|0|1138|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|448|0|1140|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|449|0|1142|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|450|0|1144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|451|0|1148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|452|0|1151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|453|0|1154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|454|0|1157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|455|0|1161|0|{@{}@0|0|0|0|out0|.5043668122270742|@@@14352|0|}}
{2010202004|XXGiport|456|0|1165|0|{@{}@0|0|0|0|in0|.4978165938864629|@@@13840|0|}}
{2010501005|XXGpvertex|457|0|1170|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[
if((decimal(""))MLKP_SK_COUNT  == 0 \|\| (decimal(""))SLKP_SK_COUNT  == 0) 0 else 1
]|3|9||@{0|}}
}}@0|Replicate|338000|360000|0|0|0|0|14223|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|458|0|1172|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|459|0|1176|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|460|0|1179|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
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
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|461|0|1181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|462|0|1184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|463|0|1187|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@100000|150000|0|0|0|0|14159|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|980000|429000|3|}}
{2010240003|XXGlegend|464|0|1189|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|465|0|1191|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|466|0|1193|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|467|0|1195|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|468|0|1197|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|469|0|1199|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|470|0|1201|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|471|0|1203|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|472|0|1205|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|473|0|1207|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|474|0|1209|0|{@{}@May 19 2016|82000|268000|0|0|0|0|1486|}}
{2010242002|XXGface|475|0|1211|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|476|0|1213|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|477|0|1215|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|478|0|1217|0|{@{}@Gunit Kaur (Exusia)|187000|268000|0|0|0|0|1514|}}
{2010242002|XXGface|479|0|1219|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|480|0|1221|0|{@{}@Summary:

This subgraph extracts the surrogate key for every pair of natural keys passed to it.|15000|42500|0|0|0|0|1512|}}
{2010242002|XXGface|481|0|1223|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|482|0|1225|0|{@{}@2.0|17000|288000|0|0|0|0|1485|}}
{2010242002|XXGface|483|0|1227|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|484|0|1229|0|{@{}@May 30 2016|82000|288000|0|0|0|0|1515|}}
{2010242002|XXGface|485|0|1231|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|486|0|1233|0|{@{}@Gunit Kaur (Exusia)|187000|288000|0|0|0|0|1476|}}
{2010242002|XXGface|487|0|1235|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|488|0|1237|0|{@{}@Placholder generation conditionalized to dimension tables only, Special proccesing added for d_date|412000|288000|0|0|0|0|1516|}}
{2010242002|XXGface|489|0|1239|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|490|0|1241|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|105000|0|0|0|0|1522|}}
{2010242002|XXGface|491|0|1243|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|492|0|1245|0|{@{}@3.0|17000|308000|0|0|0|0|1491|}}
{2010242002|XXGface|493|0|1247|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|494|0|1249|0|{@{}@Aug 24 2016|82000|308000|0|0|0|0|1517|}}
{2010242002|XXGface|495|0|1251|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|496|0|1253|0|{@{}@Gunit Kaur (Exusia)|187000|308000|0|0|0|0|1493|}}
{2010242002|XXGface|497|0|1255|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|498|0|1257|0|{@{}@MICFF Normalize length reduction, Reduction of lookup calls|412000|308000|0|0|0|0|1518|}}
{2010242002|XXGface|499|0|1259|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|500|0|1261|0|{@{}@4.0|17000|328000|0|0|0|0|1499|}}
{2010242002|XXGface|501|0|1263|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|502|0|1265|0|{@{}@Aug 29 2016|82000|328000|0|0|0|0|1519|}}
{2010242002|XXGface|503|0|1267|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|504|0|1269|0|{@{}@Gunit Kaur (Exusia)|187000|328000|0|0|0|0|1496|}}
{2010242002|XXGface|505|0|1271|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|506|0|1273|0|{@{}@Flow buffering handled, redundant joins eliminated, Fuse component added|412000|328000|0|0|0|0|1520|}}
{2010242002|XXGface|507|0|1275|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|508|0|1277|0|{@{}@5.0|17000|348000|0|0|0|0|1505|}}
{2010242002|XXGface|509|0|1279|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|510|0|1281|0|{@{}@Nov 07 2016|82000|348000|0|0|0|0|1521|}}
{2010242002|XXGface|511|0|1283|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|512|0|1285|0|{@{}@Mukesh Singh (Exusia)|187000|348000|0|0|0|0|1503|}}
{2010242002|XXGface|513|0|1287|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|514|0|1289|0|{@{}@Custom/Reduced lookup, DA|412000|348000|0|0|0|0|1504|}}
{2010242002|XXGface|515|0|1291|0|{@{}@Candara|0|100|0|}}
{2010203004|XXGoport|516|0|1293|0|{@{}@0|0|0|0|all|.3297442799461642|@@@14352|0|}}
{2010203004|XXGoport|517|0|1296|0|{@{}@0|0|0|0|non_matching|.8092105263157895|@@@14352|0|}}
{2010202004|XXGiport|518|0|1299|0|{@{}@0|0|0|0|in0|.47203274215552526|@@@13840|0|}}
{2010110002|XXGconstant|519|0|1302|0|{@{}@{1|9364755|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_4|}1|10|}
{2010244001|XXGflow_watcher_watcher|10|0|20|0|{}10|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010244001|XXGflow_watcher_watcher|12|0|24|0|{}12|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_6|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_7|}1|15|}
{2010601001|XXGgraph_vertex_vertex|15|0|30|0|{Add_records_to_split_file_for_which_FSK_is_reperformed|}1|16|}
{2010211001|XXGvertex_iport_iport|16|0|32|0|{0|write|}16|17|}
{2010214001|XXGiport_src_flow|17|0|34|0|{0|}17|10|}
{2010007001|XXGobject_proto_object|18|0|35|0|{}16|18|}
{2010211001|XXGvertex_iport_iport|19|0|37|0|{0|write|}18|19|}
{2010006001|XXGobject_psameas_object|20|0|39|0|{metadata|write_metadata|1|0|}19|18|}
{2010601001|XXGgraph_vertex_vertex|21|0|40|0|{Dummy|}1|20|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{0|out|}20|21|}
{2010213001|XXGoport_dst_flow|23|0|44|0|{0|}21|10|}
{2010211001|XXGvertex_iport_iport|24|0|45|0|{0|in|}20|22|}
{2010214001|XXGiport_src_flow|25|0|47|0|{0|}22|15|}
{2010007001|XXGobject_proto_object|26|0|48|0|{}20|23|}
{2010212001|XXGvertex_oport_oport|27|0|50|0|{0|out|}23|24|}
{2010006001|XXGobject_psameas_object|28|0|52|0|{metadata|out_metadata|1|0|}24|23|}
{2010211001|XXGvertex_iport_iport|29|0|53|0|{0|in|}23|25|}
{2010006001|XXGobject_psameas_object|30|0|55|0|{metadata|in_metadata|1|0|}25|23|}
{2010006001|XXGobject_psameas_object|31|0|56|0|{Layout|Layout|0|0|}20|16|}
{2010006001|XXGobject_psameas_object|32|0|57|0|{in_metadata|write_metadata|0|0|}20|16|}
{2010006001|XXGobject_psameas_object|33|0|58|0|{out_metadata|write_metadata|0|0|}20|16|}
{2010601001|XXGgraph_vertex_vertex|34|0|59|0|{Filter_by_Expression|}1|26|}
{2010212001|XXGvertex_oport_oport|35|0|61|0|{0|out|}26|27|}
{2010213001|XXGoport_dst_flow|36|0|63|0|{0|}27|8|}
{2010212001|XXGvertex_oport_oport|37|0|64|0|{1|deselect|}26|28|}
{2010213001|XXGoport_dst_flow|38|0|66|0|{0|}28|14|}
{2010212001|XXGvertex_oport_oport|39|0|67|0|{2|reject|}26|29|}
{2010212001|XXGvertex_oport_oport|40|0|69|0|{3|error|}26|30|}
{2010212001|XXGvertex_oport_oport|41|0|71|0|{4|log|}26|31|}
{2010211001|XXGvertex_iport_iport|42|0|73|0|{0|in|}26|32|}
{2010214001|XXGiport_src_flow|43|0|75|0|{0|}32|7|}
{2010007001|XXGobject_proto_object|44|0|76|0|{}26|33|}
{2010212001|XXGvertex_oport_oport|45|0|78|0|{0|out|}33|34|}
{2010006001|XXGobject_psameas_object|46|0|80|0|{metadata|out_metadata|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|47|0|81|0|{1|deselect|}33|35|}
{2010006001|XXGobject_psameas_object|48|0|83|0|{metadata|deselect_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|49|0|84|0|{2|reject|}33|36|}
{2010006001|XXGobject_psameas_object|50|0|86|0|{metadata|reject_metadata|1|0|}36|33|}
{2010212001|XXGvertex_oport_oport|51|0|87|0|{3|error|}33|37|}
{2010006001|XXGobject_psameas_object|52|0|89|0|{metadata|error_metadata|1|0|}37|33|}
{2010212001|XXGvertex_oport_oport|53|0|90|0|{4|log|}33|38|}
{2010006001|XXGobject_psameas_object|54|0|92|0|{metadata|log_metadata|1|0|}38|33|}
{2010211001|XXGvertex_iport_iport|55|0|93|0|{0|in|}33|39|}
{2010006001|XXGobject_psameas_object|56|0|95|0|{metadata|in_metadata|1|0|}39|33|}
{2010006001|XXGobject_psameas_object|57|0|96|0|{Layout|Layout|0|0|}26|40|}
{2010211001|XXGvertex_iport_iport|58|0|98|0|{0|write|}40|41|}
{2010214001|XXGiport_src_flow|59|0|100|0|{0|}41|14|}
{2010007001|XXGobject_proto_object|60|0|101|0|{}40|42|}
{2010211001|XXGvertex_iport_iport|61|0|103|0|{0|write|}42|43|}
{2010006001|XXGobject_psameas_object|62|0|105|0|{metadata|write_metadata|1|0|}43|42|}
{2010006001|XXGobject_psameas_object|63|0|106|0|{deselect_metadata|write_metadata|0|0|}26|40|}
{2010006001|XXGobject_psameas_object|64|0|107|0|{in_metadata|write_metadata|0|0|}26|40|}
{2010006001|XXGobject_psameas_object|65|0|108|0|{out_metadata|write_metadata|0|0|}26|40|}
{2010006001|XXGobject_psameas_object|66|0|109|0|{package|FBE_PKG|1|0|}26|1|}
{2010006001|XXGobject_psameas_object|67|0|110|0|{reject_metadata|write_metadata|0|0|}26|40|}
{2010601001|XXGgraph_vertex_vertex|68|0|111|0|{RFMT_Abort_graph_in_case_of_non_matching_records|}1|44|}
{2010212001|XXGvertex_oport_oport|69|0|113|0|{0|out0|}44|45|}
{2010213001|XXGoport_dst_flow|70|0|115|0|{0|}45|9|}
{2010212001|XXGvertex_oport_oport|71|0|116|0|{1|reject0|}44|46|}
{2010212001|XXGvertex_oport_oport|72|0|118|0|{2|error0|}44|47|}
{2010212001|XXGvertex_oport_oport|73|0|120|0|{3|log|}44|48|}
{2010211001|XXGvertex_iport_iport|74|0|122|0|{0|in|}44|49|}
{2010214001|XXGiport_src_flow|75|0|124|0|{0|}49|12|}
{2010007001|XXGobject_proto_object|76|0|125|0|{}44|50|}
{2010212001|XXGvertex_oport_oport|77|0|127|0|{0|out0|}50|51|}
{2010006001|XXGobject_psameas_object|78|0|129|0|{metadata|out0_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|79|0|130|0|{transform0|transform0|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|80|0|131|0|{1|reject0|}50|52|}
{2010006001|XXGobject_psameas_object|81|0|133|0|{metadata|reject0_metadata|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|82|0|134|0|{2|error0|}50|53|}
{2010006001|XXGobject_psameas_object|83|0|136|0|{metadata|error0_metadata|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|84|0|137|0|{3|log|}50|54|}
{2010006001|XXGobject_psameas_object|85|0|139|0|{metadata|log_metadata|1|0|}54|50|}
{2010211001|XXGvertex_iport_iport|86|0|140|0|{0|in|}50|55|}
{2010006001|XXGobject_psameas_object|87|0|142|0|{metadata|in_metadata|1|0|}55|50|}
{2010006001|XXGobject_psameas_object|88|0|143|0|{Layout|Layout|0|0|}44|16|}
{2010006001|XXGobject_psameas_object|89|0|144|0|{in_metadata|out_metadata|0|0|}44|56|}
{2010212001|XXGvertex_oport_oport|90|0|146|0|{0|out|}56|57|}
{2010212001|XXGvertex_oport_oport|91|0|148|0|{1|reject|}56|58|}
{2010212001|XXGvertex_oport_oport|92|0|150|0|{2|error|}56|59|}
{2010212001|XXGvertex_oport_oport|93|0|152|0|{3|log|}56|60|}
{2010211001|XXGvertex_iport_iport|94|0|154|0|{0|in|}56|61|}
{2010214001|XXGiport_src_flow|95|0|156|0|{0|}61|62|}
{2010006001|XXGobject_psameas_object|96|0|158|0|{Layout|Layout|0|0|}56|16|}
{2010006001|XXGobject_psameas_object|97|0|159|0|{in_metadata|out1_metadata|0|0|}56|63|}
{2010212001|XXGvertex_oport_oport|98|0|161|0|{0|out0|}63|64|}
{2010212001|XXGvertex_oport_oport|99|0|163|0|{1|out1|}63|65|}
{2010213001|XXGoport_dst_flow|100|0|165|0|{0|}65|62|}
{2010212001|XXGvertex_oport_oport|101|0|166|0|{2|reject0|}63|66|}
{2010212001|XXGvertex_oport_oport|102|0|168|0|{3|reject1|}63|67|}
{2010212001|XXGvertex_oport_oport|103|0|170|0|{4|error0|}63|68|}
{2010212001|XXGvertex_oport_oport|104|0|172|0|{5|error1|}63|69|}
{2010212001|XXGvertex_oport_oport|105|0|174|0|{6|log|}63|70|}
{2010211001|XXGvertex_iport_iport|106|0|176|0|{0|in|}63|71|}
{2010214001|XXGiport_src_flow|107|0|178|0|{0|}71|72|}
{2010006001|XXGobject_psameas_object|108|0|180|0|{Layout|Layout|0|0|}63|16|}
{2010006001|XXGobject_psameas_object|109|0|181|0|{in_metadata|out_metadata|0|0|}63|73|}
{2010212001|XXGvertex_oport_oport|110|0|183|0|{0|out|}73|74|}
{2010213001|XXGoport_dst_flow|111|0|185|0|{0|}74|72|}
{2010212001|XXGvertex_oport_oport|112|0|186|0|{1|reject0|}73|75|}
{2010212001|XXGvertex_oport_oport|113|0|188|0|{2|reject1|}73|76|}
{2010212001|XXGvertex_oport_oport|114|0|190|0|{3|error0|}73|77|}
{2010212001|XXGvertex_oport_oport|115|0|192|0|{4|error1|}73|78|}
{2010212001|XXGvertex_oport_oport|116|0|194|0|{5|log|}73|79|}
{2010211001|XXGvertex_iport_iport|117|0|196|0|{0|in0|}73|80|}
{2010214001|XXGiport_src_flow|118|0|198|0|{0|}80|81|}
{2010211001|XXGvertex_iport_iport|119|0|200|0|{1|in1|}73|82|}
{2010214001|XXGiport_src_flow|120|0|202|0|{0|}82|83|}
{2010006001|XXGobject_psameas_object|121|0|204|0|{Layout|Layout|0|0|}73|16|}
{2010006001|XXGobject_psameas_object|122|0|205|0|{in0_metadata|out_metadata|0|0|}73|84|}
{2010212001|XXGvertex_oport_oport|123|0|207|0|{0|out|}84|85|}
{2010212001|XXGvertex_oport_oport|124|0|209|0|{1|reject|}84|86|}
{2010212001|XXGvertex_oport_oport|125|0|211|0|{2|error|}84|87|}
{2010212001|XXGvertex_oport_oport|126|0|213|0|{3|log|}84|88|}
{2010211001|XXGvertex_iport_iport|127|0|215|0|{0|in|}84|89|}
{2010214001|XXGiport_src_flow|128|0|217|0|{0|}89|90|}
{2010006001|XXGobject_psameas_object|129|0|219|0|{Layout|Layout|0|0|}84|16|}
{2010006001|XXGobject_psameas_object|130|0|220|0|{in_metadata|out_metadata|0|0|}84|91|}
{2010212001|XXGvertex_oport_oport|131|0|222|0|{0|out|}91|92|}
{2010213001|XXGoport_dst_flow|132|0|224|0|{0|}92|93|}
{2010212001|XXGvertex_oport_oport|133|0|226|0|{1|reject|}91|94|}
{2010212001|XXGvertex_oport_oport|134|0|228|0|{2|error|}91|95|}
{2010212001|XXGvertex_oport_oport|135|0|230|0|{3|log|}91|96|}
{2010211001|XXGvertex_iport_iport|136|0|232|0|{0|in|}91|97|}
{2010214001|XXGiport_src_flow|137|0|234|0|{0|}97|98|}
{2010006001|XXGobject_psameas_object|138|0|236|0|{Layout|Layout|0|0|}91|16|}
{2010006001|XXGobject_psameas_object|139|0|237|0|{in_metadata|out0_metadata|0|0|}91|99|}
{2010212001|XXGvertex_oport_oport|140|0|239|0|{0|out0|}99|100|}
{2010213001|XXGoport_dst_flow|141|0|241|0|{0|}100|98|}
{2010212001|XXGvertex_oport_oport|142|0|242|0|{1|reject0|}99|101|}
{2010212001|XXGvertex_oport_oport|143|0|244|0|{2|error0|}99|102|}
{2010212001|XXGvertex_oport_oport|144|0|246|0|{3|log|}99|103|}
{2010211001|XXGvertex_iport_iport|145|0|248|0|{0|in|}99|104|}
{2010006001|XXGobject_psameas_object|146|0|250|0|{Layout|Layout|0|0|}99|16|}
{2010006001|XXGobject_psameas_object|147|0|251|0|{in_metadata|out0_metadata|0|0|}99|105|}
{2010212001|XXGvertex_oport_oport|148|0|253|0|{0|out0|}105|106|}
{2010213001|XXGoport_dst_flow|149|0|255|0|{0|}106|107|}
{2010212001|XXGvertex_oport_oport|150|0|257|0|{1|reject0|}105|108|}
{2010212001|XXGvertex_oport_oport|151|0|259|0|{2|error0|}105|109|}
{2010212001|XXGvertex_oport_oport|152|0|261|0|{3|log|}105|110|}
{2010211001|XXGvertex_iport_iport|153|0|263|0|{0|in|}105|111|}
{2010006001|XXGobject_psameas_object|154|0|265|0|{Layout|Layout|0|0|}105|16|}
{2010006001|XXGobject_psameas_object|155|0|266|0|{in_metadata|write_metadata|0|0|}105|40|}
{2010006001|XXGobject_psameas_object|156|0|267|0|{reject0_metadata|write_metadata|0|0|}105|40|}
{2010006001|XXGobject_psameas_object|157|0|268|0|{reject0_metadata|out0_metadata|0|0|}99|105|}
{2010006001|XXGobject_psameas_object|158|0|269|0|{reject_metadata|out0_metadata|0|0|}91|99|}
{2010006001|XXGobject_psameas_object|159|0|270|0|{reject_metadata|out_metadata|0|0|}84|91|}
{2010006001|XXGobject_psameas_object|160|0|271|0|{in1_metadata|out0_metadata|0|0|}73|105|}
{2010006001|XXGobject_psameas_object|161|0|272|0|{reject0_metadata|out_metadata|0|0|}73|84|}
{2010006001|XXGobject_psameas_object|162|0|273|0|{reject1_metadata|out0_metadata|0|0|}73|105|}
{2010006001|XXGobject_psameas_object|163|0|274|0|{out0_metadata|write_metadata|0|0|}63|16|}
{2010006001|XXGobject_psameas_object|164|0|275|0|{reject0_metadata|out_metadata|0|0|}63|73|}
{2010006001|XXGobject_psameas_object|165|0|276|0|{reject1_metadata|out_metadata|0|0|}63|73|}
{2010006001|XXGobject_psameas_object|166|0|277|0|{reject_metadata|out1_metadata|0|0|}56|63|}
{2010006001|XXGobject_psameas_object|167|0|278|0|{out0_metadata|out_metadata|0|0|}44|56|}
{2010006001|XXGobject_psameas_object|168|0|279|0|{reject0_metadata|out_metadata|0|0|}44|56|}
{2010601001|XXGgraph_vertex_vertex|169|0|280|0|{Split_File|}1|112|}
{2010212001|XXGvertex_oport_oport|170|0|282|0|{0|read|}112|113|}
{2010213001|XXGoport_dst_flow|171|0|284|0|{0|}113|7|}
{2010007001|XXGobject_proto_object|172|0|285|0|{}112|114|}
{2010212001|XXGvertex_oport_oport|173|0|287|0|{0|read|}114|115|}
{2010006001|XXGobject_psameas_object|174|0|289|0|{metadata|read_metadata|1|0|}115|114|}
{2010601001|XXGgraph_vertex_vertex|175|0|290|0|{Split_file_with_records_for_which_lookup_is_not_re_performed|}1|40|}
{2010601001|XXGgraph_vertex_vertex|176|0|291|0|{Trash|}1|116|}
{2010211001|XXGvertex_iport_iport|177|0|293|0|{0|in|}116|117|}
{2010214001|XXGiport_src_flow|178|0|295|0|{0|}117|9|}
{2010007001|XXGobject_proto_object|179|0|296|0|{}116|118|}
{2010211001|XXGvertex_iport_iport|180|0|298|0|{0|in|}118|119|}
{2010006001|XXGobject_psameas_object|181|0|300|0|{metadata|in_metadata|1|0|}119|118|}
{2010006001|XXGobject_psameas_object|182|0|301|0|{Layout|Layout|0|0|}116|16|}
{2010006001|XXGobject_psameas_object|183|0|302|0|{in_metadata|out_metadata|0|0|}116|56|}
{2010601001|XXGgraph_vertex_vertex|184|0|303|0|{Version_Log|}1|120|}
{2010605001|XXGgraph_legend_legend|185|0|305|0|{0|}120|121|}
{2010241001|XXGlegend_face_face|186|0|307|0|{}121|122|}
{2010605001|XXGgraph_legend_legend|187|0|309|0|{1|}120|123|}
{2010241001|XXGlegend_face_face|188|0|311|0|{}123|124|}
{2010605001|XXGgraph_legend_legend|189|0|313|0|{2|}120|125|}
{2010241001|XXGlegend_face_face|190|0|315|0|{}125|126|}
{2010605001|XXGgraph_legend_legend|191|0|317|0|{3|}120|127|}
{2010241001|XXGlegend_face_face|192|0|319|0|{}127|128|}
{2010605001|XXGgraph_legend_legend|193|0|321|0|{4|}120|129|}
{2010241001|XXGlegend_face_face|194|0|323|0|{}129|130|}
{2010605001|XXGgraph_legend_legend|195|0|325|0|{5|}120|131|}
{2010241001|XXGlegend_face_face|196|0|327|0|{}131|132|}
{2010605001|XXGgraph_legend_legend|197|0|329|0|{6|}120|133|}
{2010241001|XXGlegend_face_face|198|0|331|0|{}133|134|}
{2010605001|XXGgraph_legend_legend|199|0|333|0|{7|}120|135|}
{2010241001|XXGlegend_face_face|200|0|335|0|{}135|136|}
{2010605001|XXGgraph_legend_legend|201|0|337|0|{8|}120|137|}
{2010241001|XXGlegend_face_face|202|0|339|0|{}137|138|}
{2010605001|XXGgraph_legend_legend|203|0|341|0|{9|}120|139|}
{2010241001|XXGlegend_face_face|204|0|343|0|{}139|140|}
{2010605001|XXGgraph_legend_legend|205|0|345|0|{10|}120|141|}
{2010241001|XXGlegend_face_face|206|0|347|0|{}141|142|}
{2010605001|XXGgraph_legend_legend|207|0|349|0|{11|}120|143|}
{2010241001|XXGlegend_face_face|208|0|351|0|{}143|144|}
{2010605001|XXGgraph_legend_legend|209|0|353|0|{12|}120|145|}
{2010241001|XXGlegend_face_face|210|0|355|0|{}145|146|}
{2010605001|XXGgraph_legend_legend|211|0|357|0|{13|}120|147|}
{2010241001|XXGlegend_face_face|212|0|359|0|{}147|148|}
{2010605001|XXGgraph_legend_legend|213|0|361|0|{14|}120|149|}
{2010241001|XXGlegend_face_face|214|0|363|0|{}149|150|}
{2010605001|XXGgraph_legend_legend|215|0|365|0|{15|}120|151|}
{2010241001|XXGlegend_face_face|216|0|367|0|{}151|152|}
{2010605001|XXGgraph_legend_legend|217|0|369|0|{16|}120|153|}
{2010241001|XXGlegend_face_face|218|0|371|0|{}153|154|}
{2010605001|XXGgraph_legend_legend|219|0|373|0|{17|}120|155|}
{2010241001|XXGlegend_face_face|220|0|375|0|{}155|156|}
{2010601001|XXGgraph_vertex_vertex|221|0|377|0|{foreign_key_lookup|}1|157|}
{2010605001|XXGgraph_legend_legend|222|0|379|0|{0|}157|158|}
{2010241001|XXGlegend_face_face|223|0|381|0|{}158|159|}
{2010604001|XXGgraph_flow_flow|224|0|383|0|{Flow_1|}157|81|}
{2010604001|XXGgraph_flow_flow|225|0|384|0|{Flow_2|}157|107|}
{2010604001|XXGgraph_flow_flow|226|0|385|0|{Flow_3|}157|160|}
{2010604001|XXGgraph_flow_flow|227|0|387|0|{Flow_4|}157|62|}
{2010604001|XXGgraph_flow_flow|228|0|388|0|{Flow_5|}157|83|}
{2010604001|XXGgraph_flow_flow|229|0|389|0|{Flow_6|}157|72|}
{2010604001|XXGgraph_flow_flow|230|0|390|0|{Flow_7|}157|161|}
{2010601001|XXGgraph_vertex_vertex|231|0|392|0|{FUSE_Merge_All_Lookup_Records|}157|73|}
{2010601001|XXGgraph_vertex_vertex|232|0|393|0|{ICFF_HK_UK_Lookup_Template|}157|162|}
{2010601001|XXGgraph_vertex_vertex|233|0|395|0|{MUltifile_Lookup|}157|163|}
{2010605001|XXGgraph_legend_legend|234|0|397|0|{0|}163|164|}
{2010241001|XXGlegend_face_face|235|0|399|0|{}164|165|}
{2010604001|XXGgraph_flow_flow|236|0|401|0|{Flow_1|}163|166|}
{2010604001|XXGgraph_flow_flow|237|0|403|0|{Flow_2|}163|167|}
{2010604001|XXGgraph_flow_flow|238|0|405|0|{Flow_3|}163|98|}
{2010604001|XXGgraph_flow_flow|239|0|406|0|{Flow_4|}163|93|}
{2010604001|XXGgraph_flow_flow|240|0|407|0|{Flow_5|}163|168|}
{2010604001|XXGgraph_flow_flow|241|0|409|0|{Flow_6|}163|90|}
{2010601001|XXGgraph_vertex_vertex|242|0|410|0|{NORM_Multiply_input_records|}163|91|}
{2010601001|XXGgraph_vertex_vertex|243|0|411|0|{PBE_Repartition_records_as_per_their_previous_partition_order|}163|169|}
{2010212001|XXGvertex_oport_oport|244|0|413|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|245|0|415|0|{0|}170|167|}
{2010212001|XXGvertex_oport_oport|246|0|416|0|{1|reject|}169|171|}
{2010212001|XXGvertex_oport_oport|247|0|418|0|{2|error|}169|172|}
{2010212001|XXGvertex_oport_oport|248|0|420|0|{3|log|}169|173|}
{2010211001|XXGvertex_iport_iport|249|0|422|0|{0|in|}169|174|}
{2010214001|XXGiport_src_flow|250|0|424|0|{0|}174|166|}
{2010006001|XXGobject_psameas_object|251|0|425|0|{Layout|Layout|0|0|}169|16|}
{2010006001|XXGobject_psameas_object|252|0|426|0|{in_metadata|out_metadata|0|0|}169|91|}
{2010006001|XXGobject_psameas_object|253|0|427|0|{out_metadata|out_metadata|0|0|}169|91|}
{2010006001|XXGobject_psameas_object|254|0|428|0|{reject_metadata|out_metadata|0|0|}169|91|}
{2010601001|XXGgraph_vertex_vertex|255|0|429|0|{PBKS_hash_key_|}163|175|}
{2010604001|XXGgraph_flow_flow|256|0|431|0|{Flow_1|}175|176|}
{2010601001|XXGgraph_vertex_vertex|257|0|433|0|{Partition_by_Key|}175|177|}
{2010212001|XXGvertex_oport_oport|258|0|435|0|{0|out|}177|178|}
{2010213001|XXGoport_dst_flow|259|0|437|0|{0|}178|176|}
{2010211001|XXGvertex_iport_iport|260|0|438|0|{0|in|}177|179|}
{2010006001|XXGobject_psameas_object|261|0|440|0|{out_metadata|out_metadata|0|0|}177|91|}
{2010601001|XXGgraph_vertex_vertex|262|0|441|0|{Sort|}175|180|}
{2010212001|XXGvertex_oport_oport|263|0|443|0|{0|out|}180|181|}
{2010211001|XXGvertex_iport_iport|264|0|445|0|{0|in|}180|182|}
{2010214001|XXGiport_src_flow|265|0|447|0|{0|}182|176|}
{2010006001|XXGobject_psameas_object|266|0|448|0|{in_metadata|out_metadata|0|0|}180|91|}
{2010212001|XXGvertex_oport_oport|267|0|449|0|{0|out0|}175|183|}
{2010216002|XXGoport_binding_oport|268|0|451|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}183|181|}
{2010213001|XXGoport_dst_flow|269|0|452|0|{0|}183|168|}
{2010211001|XXGvertex_iport_iport|270|0|453|0|{0|in0|}175|184|}
{2010215002|XXGiport_binding_iport|271|0|455|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}184|179|}
{2010214001|XXGiport_src_flow|272|0|456|0|{0|}184|93|}
{2010006001|XXGobject_psameas_object|273|0|457|0|{InputLayout|Layout|0|0|}175|16|}
{2010006001|XXGobject_psameas_object|274|0|458|0|{OutputLayout|Layout|0|0|}175|16|}
{2010601001|XXGgraph_vertex_vertex|275|0|459|0|{RFMT_Extract_universal_key_for_multiplied_records|}163|185|}
{2010212001|XXGvertex_oport_oport|276|0|461|0|{0|out0|}185|186|}
{2010213001|XXGoport_dst_flow|277|0|463|0|{0|}186|166|}
{2010212001|XXGvertex_oport_oport|278|0|464|0|{1|reject0|}185|187|}
{2010212001|XXGvertex_oport_oport|279|0|466|0|{2|error0|}185|188|}
{2010212001|XXGvertex_oport_oport|280|0|468|0|{3|log|}185|189|}
{2010211001|XXGvertex_iport_iport|281|0|470|0|{0|in|}185|190|}
{2010214001|XXGiport_src_flow|282|0|472|0|{0|}190|168|}
{2010006001|XXGobject_psameas_object|283|0|473|0|{Layout|Layout|0|0|}185|16|}
{2010006001|XXGobject_psameas_object|284|0|474|0|{in_metadata|out_metadata|0|0|}185|91|}
{2010006001|XXGobject_psameas_object|285|0|475|0|{out0_metadata|out_metadata|0|0|}185|91|}
{2010006001|XXGobject_psameas_object|286|0|476|0|{reject0_metadata|out_metadata|0|0|}185|91|}
{2010601001|XXGgraph_vertex_vertex|287|0|477|0|{RFMT_Split_file_and_generate_hash_key_and_partition_and_record_numbers|}163|99|}
{2010601001|XXGgraph_vertex_vertex|288|0|478|0|{RLP_Merge_records_representing_the_same_entity|}163|84|}
{2010601001|XXGgraph_vertex_vertex|289|0|479|0|{SORT_record_nbr_|}163|191|}
{2010212001|XXGvertex_oport_oport|290|0|481|0|{0|out|}191|192|}
{2010213001|XXGoport_dst_flow|291|0|483|0|{0|}192|90|}
{2010211001|XXGvertex_iport_iport|292|0|484|0|{0|in|}191|193|}
{2010214001|XXGiport_src_flow|293|0|486|0|{0|}193|167|}
{2010006001|XXGobject_psameas_object|294|0|487|0|{Layout|Layout|0|0|}191|16|}
{2010006001|XXGobject_psameas_object|295|0|488|0|{in_metadata|out_metadata|0|0|}191|91|}
{2010006001|XXGobject_psameas_object|296|0|489|0|{out_metadata|out_metadata|0|0|}191|91|}
{2010212001|XXGvertex_oport_oport|297|0|490|0|{0|out1|}163|194|}
{2010216002|XXGoport_binding_oport|298|0|492|0|{.5|.5|{0|}1010|}194|85|}
{2010213001|XXGoport_dst_flow|299|0|493|0|{0|}194|81|}
{2010211001|XXGvertex_iport_iport|300|0|494|0|{0|in0|}163|195|}
{2010215002|XXGiport_binding_iport|301|0|496|0|{.5|.5|{0|}1008|}195|104|}
{2010214001|XXGiport_src_flow|302|0|497|0|{0|}195|161|}
{2010601001|XXGgraph_vertex_vertex|303|0|498|0|{NORM_Split_non_matching_records_from_each_dimension|}157|56|}
{2010601001|XXGgraph_vertex_vertex|304|0|499|0|{RFMT_Distinguish_Non_Matching_Records|}157|63|}
{2010601001|XXGgraph_vertex_vertex|305|0|500|0|{RFMT_Split_ICFF_and_Regular_Lookup_records|}157|105|}
{2010601001|XXGgraph_vertex_vertex|306|0|501|0|{Regular_HK_UK_Lookup_Template|}157|196|}
{2010601001|XXGgraph_vertex_vertex|307|0|503|0|{Regular_Serial_Lookup|}157|197|}
{2010601001|XXGgraph_vertex_vertex|308|0|505|0|{RFMT_Extract_Universal_Key|}197|198|}
{2010212001|XXGvertex_oport_oport|309|0|507|0|{0|out0|}198|199|}
{2010212001|XXGvertex_oport_oport|310|0|509|0|{1|reject0|}198|200|}
{2010212001|XXGvertex_oport_oport|311|0|511|0|{2|error0|}198|201|}
{2010212001|XXGvertex_oport_oport|312|0|513|0|{3|log|}198|202|}
{2010211001|XXGvertex_iport_iport|313|0|515|0|{0|in|}198|203|}
{2010006001|XXGobject_psameas_object|314|0|517|0|{Layout|Layout|0|0|}198|16|}
{2010006001|XXGobject_psameas_object|315|0|518|0|{in_metadata|out0_metadata|0|0|}198|105|}
{2010006001|XXGobject_psameas_object|316|0|519|0|{out0_metadata|out0_metadata|0|0|}198|105|}
{2010006001|XXGobject_psameas_object|317|0|520|0|{reject0_metadata|out0_metadata|0|0|}198|105|}
{2010212001|XXGvertex_oport_oport|318|0|521|0|{0|out0|}197|204|}
{2010216002|XXGoport_binding_oport|319|0|523|0|{.5|.5|{0|}683|}204|199|}
{2010213001|XXGoport_dst_flow|320|0|524|0|{0|}204|83|}
{2010211001|XXGvertex_iport_iport|321|0|525|0|{0|in0|}197|205|}
{2010215002|XXGiport_binding_iport|322|0|527|0|{.5|.5|{0|}684|}205|203|}
{2010214001|XXGiport_src_flow|323|0|528|0|{0|}205|160|}
{2010601001|XXGgraph_vertex_vertex|324|0|529|0|{Replicate|}157|206|}
{2010212001|XXGvertex_oport_oport|325|0|531|0|{0|out|}206|207|}
{2010213001|XXGoport_dst_flow|326|0|533|0|{0|}207|161|}
{2010213001|XXGoport_dst_flow|327|0|534|0|{1|}207|160|}
{2010211001|XXGvertex_iport_iport|328|0|535|0|{0|in|}206|208|}
{2010214001|XXGiport_src_flow|329|0|537|0|{0|}208|107|}
{2010006001|XXGobject_psameas_object|330|0|538|0|{Layout|Layout|0|0|}206|16|}
{2010006001|XXGobject_psameas_object|331|0|539|0|{in_metadata|out0_metadata|0|0|}206|105|}
{2010006001|XXGobject_psameas_object|332|0|540|0|{out_metadata|out0_metadata|0|0|}206|105|}
{2010601001|XXGgraph_vertex_vertex|333|0|541|0|{Version_Log|}157|209|}
{2010605001|XXGgraph_legend_legend|334|0|543|0|{0|}209|210|}
{2010241001|XXGlegend_face_face|335|0|545|0|{}210|211|}
{2010605001|XXGgraph_legend_legend|336|0|547|0|{1|}209|212|}
{2010241001|XXGlegend_face_face|337|0|549|0|{}212|213|}
{2010605001|XXGgraph_legend_legend|338|0|551|0|{2|}209|214|}
{2010241001|XXGlegend_face_face|339|0|553|0|{}214|215|}
{2010605001|XXGgraph_legend_legend|340|0|555|0|{3|}209|216|}
{2010241001|XXGlegend_face_face|341|0|557|0|{}216|217|}
{2010605001|XXGgraph_legend_legend|342|0|559|0|{4|}209|218|}
{2010241001|XXGlegend_face_face|343|0|561|0|{}218|219|}
{2010605001|XXGgraph_legend_legend|344|0|563|0|{5|}209|220|}
{2010241001|XXGlegend_face_face|345|0|565|0|{}220|221|}
{2010605001|XXGgraph_legend_legend|346|0|567|0|{6|}209|222|}
{2010241001|XXGlegend_face_face|347|0|569|0|{}222|223|}
{2010605001|XXGgraph_legend_legend|348|0|571|0|{7|}209|224|}
{2010241001|XXGlegend_face_face|349|0|573|0|{}224|225|}
{2010605001|XXGgraph_legend_legend|350|0|575|0|{8|}209|226|}
{2010241001|XXGlegend_face_face|351|0|577|0|{}226|227|}
{2010605001|XXGgraph_legend_legend|352|0|579|0|{9|}209|228|}
{2010241001|XXGlegend_face_face|353|0|581|0|{}228|229|}
{2010605001|XXGgraph_legend_legend|354|0|583|0|{10|}209|230|}
{2010241001|XXGlegend_face_face|355|0|585|0|{}230|231|}
{2010605001|XXGgraph_legend_legend|356|0|587|0|{11|}209|232|}
{2010241001|XXGlegend_face_face|357|0|589|0|{}232|233|}
{2010605001|XXGgraph_legend_legend|358|0|591|0|{12|}209|234|}
{2010241001|XXGlegend_face_face|359|0|593|0|{}234|235|}
{2010605001|XXGgraph_legend_legend|360|0|595|0|{13|}209|236|}
{2010241001|XXGlegend_face_face|361|0|597|0|{}236|237|}
{2010605001|XXGgraph_legend_legend|362|0|599|0|{14|}209|238|}
{2010241001|XXGlegend_face_face|363|0|601|0|{}238|239|}
{2010605001|XXGgraph_legend_legend|364|0|603|0|{15|}209|240|}
{2010241001|XXGlegend_face_face|365|0|605|0|{}240|241|}
{2010605001|XXGgraph_legend_legend|366|0|607|0|{16|}209|242|}
{2010241001|XXGlegend_face_face|367|0|609|0|{}242|243|}
{2010605001|XXGgraph_legend_legend|368|0|611|0|{17|}209|244|}
{2010241001|XXGlegend_face_face|369|0|613|0|{}244|245|}
{2010605001|XXGgraph_legend_legend|370|0|615|0|{18|}209|246|}
{2010241001|XXGlegend_face_face|371|0|617|0|{}246|247|}
{2010605001|XXGgraph_legend_legend|372|0|619|0|{19|}209|248|}
{2010241001|XXGlegend_face_face|373|0|621|0|{}248|249|}
{2010605001|XXGgraph_legend_legend|374|0|623|0|{20|}209|250|}
{2010241001|XXGlegend_face_face|375|0|625|0|{}250|251|}
{2010605001|XXGgraph_legend_legend|376|0|627|0|{21|}209|252|}
{2010241001|XXGlegend_face_face|377|0|629|0|{}252|253|}
{2010605001|XXGgraph_legend_legend|378|0|631|0|{22|}209|254|}
{2010241001|XXGlegend_face_face|379|0|633|0|{}254|255|}
{2010605001|XXGgraph_legend_legend|380|0|635|0|{23|}209|256|}
{2010241001|XXGlegend_face_face|381|0|637|0|{}256|257|}
{2010605001|XXGgraph_legend_legend|382|0|639|0|{24|}209|258|}
{2010241001|XXGlegend_face_face|383|0|641|0|{}258|259|}
{2010605001|XXGgraph_legend_legend|384|0|643|0|{25|}209|260|}
{2010241001|XXGlegend_face_face|385|0|645|0|{}260|261|}
{2010212001|XXGvertex_oport_oport|386|0|647|0|{0|all|}157|262|}
{2010216002|XXGoport_binding_oport|387|0|649|0|{.5|.5|{0|}14218|}262|64|}
{2010213001|XXGoport_dst_flow|388|0|650|0|{0|}262|15|}
{2010212001|XXGvertex_oport_oport|389|0|651|0|{1|non_matching|}157|263|}
{2010216002|XXGoport_binding_oport|390|0|653|0|{.5|.5|{0|}14216|}263|57|}
{2010213001|XXGoport_dst_flow|391|0|654|0|{0|}263|12|}
{2010211001|XXGvertex_iport_iport|392|0|655|0|{0|in0|}157|264|}
{2010215002|XXGiport_binding_iport|393|0|657|0|{.5|.5|{0|}14221|}264|111|}
{2010214001|XXGiport_src_flow|394|0|658|0|{0|}264|8|}
{2010007001|XXGobject_proto_object|395|0|659|0|{}157|265|}
{2010605001|XXGgraph_legend_legend|396|0|661|0|{0|}265|266|}
{2010241001|XXGlegend_face_face|397|0|663|0|{}266|267|}
{2010604001|XXGgraph_flow_flow|398|0|665|0|{Flow_1|}265|268|}
{2010604001|XXGgraph_flow_flow|399|0|667|0|{Flow_2|}265|269|}
{2010604001|XXGgraph_flow_flow|400|0|669|0|{Flow_3|}265|270|}
{2010604001|XXGgraph_flow_flow|401|0|671|0|{Flow_4|}265|271|}
{2010604001|XXGgraph_flow_flow|402|0|673|0|{Flow_5|}265|272|}
{2010604001|XXGgraph_flow_flow|403|0|675|0|{Flow_6|}265|273|}
{2010604001|XXGgraph_flow_flow|404|0|677|0|{Flow_7|}265|274|}
{2010601001|XXGgraph_vertex_vertex|405|0|679|0|{FUSE_Merge_All_Lookup_Records|}265|275|}
{2010212001|XXGvertex_oport_oport|406|0|681|0|{0|out|}275|276|}
{2010213001|XXGoport_dst_flow|407|0|683|0|{0|}276|273|}
{2010212001|XXGvertex_oport_oport|408|0|684|0|{1|reject0|}275|277|}
{2010212001|XXGvertex_oport_oport|409|0|686|0|{2|reject1|}275|278|}
{2010212001|XXGvertex_oport_oport|410|0|688|0|{3|error0|}275|279|}
{2010212001|XXGvertex_oport_oport|411|0|690|0|{4|error1|}275|280|}
{2010212001|XXGvertex_oport_oport|412|0|692|0|{5|log|}275|281|}
{2010211001|XXGvertex_iport_iport|413|0|694|0|{0|in0|}275|282|}
{2010214001|XXGiport_src_flow|414|0|696|0|{0|}282|268|}
{2010211001|XXGvertex_iport_iport|415|0|697|0|{1|in1|}275|283|}
{2010214001|XXGiport_src_flow|416|0|699|0|{0|}283|272|}
{2010007001|XXGobject_proto_object|417|0|700|0|{}275|284|}
{2010212001|XXGvertex_oport_oport|418|0|702|0|{0|out|}284|285|}
{2010006001|XXGobject_psameas_object|419|0|704|0|{metadata|out_metadata|1|0|}285|284|}
{2010212001|XXGvertex_oport_oport|420|0|705|0|{1|reject0|}284|286|}
{2010006001|XXGobject_psameas_object|421|0|707|0|{metadata|reject0_metadata|1|0|}286|284|}
{2010212001|XXGvertex_oport_oport|422|0|708|0|{2|reject1|}284|287|}
{2010006001|XXGobject_psameas_object|423|0|710|0|{metadata|reject1_metadata|1|0|}287|284|}
{2010212001|XXGvertex_oport_oport|424|0|711|0|{3|error0|}284|288|}
{2010006001|XXGobject_psameas_object|425|0|713|0|{metadata|error0_metadata|1|0|}288|284|}
{2010212001|XXGvertex_oport_oport|426|0|714|0|{4|error1|}284|289|}
{2010006001|XXGobject_psameas_object|427|0|716|0|{metadata|error1_metadata|1|0|}289|284|}
{2010212001|XXGvertex_oport_oport|428|0|717|0|{5|log|}284|290|}
{2010006001|XXGobject_psameas_object|429|0|719|0|{metadata|log_metadata|1|0|}290|284|}
{2010211001|XXGvertex_iport_iport|430|0|720|0|{0|in0|}284|291|}
{2010006001|XXGobject_psameas_object|431|0|722|0|{metadata|in0_metadata|1|0|}291|284|}
{2010211001|XXGvertex_iport_iport|432|0|723|0|{1|in1|}284|292|}
{2010006001|XXGobject_psameas_object|433|0|725|0|{metadata|in1_metadata|1|0|}292|284|}
{2010006001|XXGobject_psameas_object|434|0|726|0|{transform|MERGE_ALL_LKPS_XFR|1|0|}275|265|}
{2010601001|XXGgraph_vertex_vertex|435|0|727|0|{ICFF_HK_UK_Lookup_Template|}265|293|}
{2010007001|XXGobject_proto_object|436|0|729|0|{}293|294|}
{2010601001|XXGgraph_vertex_vertex|437|0|731|0|{MUltifile_Lookup|}265|295|}
{2010605001|XXGgraph_legend_legend|438|0|733|0|{0|}295|296|}
{2010241001|XXGlegend_face_face|439|0|735|0|{}296|297|}
{2010604001|XXGgraph_flow_flow|440|0|737|0|{Flow_1|}295|298|}
{2010604001|XXGgraph_flow_flow|441|0|739|0|{Flow_2|}295|299|}
{2010604001|XXGgraph_flow_flow|442|0|741|0|{Flow_3|}295|300|}
{2010604001|XXGgraph_flow_flow|443|0|743|0|{Flow_4|}295|301|}
{2010604001|XXGgraph_flow_flow|444|0|745|0|{Flow_5|}295|302|}
{2010604001|XXGgraph_flow_flow|445|0|747|0|{Flow_6|}295|303|}
{2010601001|XXGgraph_vertex_vertex|446|0|749|0|{NORM_Multiply_input_records|}295|304|}
{2010212001|XXGvertex_oport_oport|447|0|751|0|{0|out|}304|305|}
{2010213001|XXGoport_dst_flow|448|0|753|0|{0|}305|301|}
{2010212001|XXGvertex_oport_oport|449|0|754|0|{1|reject|}304|306|}
{2010212001|XXGvertex_oport_oport|450|0|756|0|{2|error|}304|307|}
{2010212001|XXGvertex_oport_oport|451|0|758|0|{3|log|}304|308|}
{2010211001|XXGvertex_iport_iport|452|0|760|0|{0|in|}304|309|}
{2010214001|XXGiport_src_flow|453|0|762|0|{0|}309|300|}
{2010007001|XXGobject_proto_object|454|0|763|0|{}304|310|}
{2010212001|XXGvertex_oport_oport|455|0|765|0|{0|out|}310|311|}
{2010006001|XXGobject_psameas_object|456|0|767|0|{metadata|out_metadata|1|0|}311|310|}
{2010212001|XXGvertex_oport_oport|457|0|768|0|{1|reject|}310|312|}
{2010006001|XXGobject_psameas_object|458|0|770|0|{metadata|reject_metadata|1|0|}312|310|}
{2010212001|XXGvertex_oport_oport|459|0|771|0|{2|error|}310|313|}
{2010006001|XXGobject_psameas_object|460|0|773|0|{metadata|error_metadata|1|0|}313|310|}
{2010212001|XXGvertex_oport_oport|461|0|774|0|{3|log|}310|314|}
{2010006001|XXGobject_psameas_object|462|0|776|0|{metadata|log_metadata|1|0|}314|310|}
{2010211001|XXGvertex_iport_iport|463|0|777|0|{0|in|}310|315|}
{2010006001|XXGobject_psameas_object|464|0|779|0|{metadata|in_metadata|1|0|}315|310|}
{2010006001|XXGobject_psameas_object|465|0|780|0|{out_metadata|MULTIPLY_DML|1|0|}304|295|}
{2010006001|XXGobject_psameas_object|466|0|781|0|{transform|NORM_XFR|1|0|}304|295|}
{2010601001|XXGgraph_vertex_vertex|467|0|782|0|{PBE_Repartition_records_as_per_their_previous_partition_order|}295|316|}
{2010212001|XXGvertex_oport_oport|468|0|784|0|{0|out|}316|317|}
{2010213001|XXGoport_dst_flow|469|0|786|0|{0|}317|299|}
{2010212001|XXGvertex_oport_oport|470|0|787|0|{1|reject|}316|318|}
{2010212001|XXGvertex_oport_oport|471|0|789|0|{2|error|}316|319|}
{2010212001|XXGvertex_oport_oport|472|0|791|0|{3|log|}316|320|}
{2010211001|XXGvertex_iport_iport|473|0|793|0|{0|in|}316|321|}
{2010214001|XXGiport_src_flow|474|0|795|0|{0|}321|298|}
{2010007001|XXGobject_proto_object|475|0|796|0|{}316|322|}
{2010212001|XXGvertex_oport_oport|476|0|798|0|{0|out|}322|323|}
{2010006001|XXGobject_psameas_object|477|0|800|0|{metadata|out_metadata|1|0|}323|322|}
{2010212001|XXGvertex_oport_oport|478|0|801|0|{1|reject|}322|324|}
{2010006001|XXGobject_psameas_object|479|0|803|0|{metadata|reject_metadata|1|0|}324|322|}
{2010212001|XXGvertex_oport_oport|480|0|804|0|{2|error|}322|325|}
{2010006001|XXGobject_psameas_object|481|0|806|0|{metadata|error_metadata|1|0|}325|322|}
{2010212001|XXGvertex_oport_oport|482|0|807|0|{3|log|}322|326|}
{2010006001|XXGobject_psameas_object|483|0|809|0|{metadata|log_metadata|1|0|}326|322|}
{2010211001|XXGvertex_iport_iport|484|0|810|0|{0|in|}322|327|}
{2010006001|XXGobject_psameas_object|485|0|812|0|{metadata|in_metadata|1|0|}327|322|}
{2010601001|XXGgraph_vertex_vertex|486|0|813|0|{PBKS_hash_key_|}295|328|}
{2010604001|XXGgraph_flow_flow|487|0|815|0|{Flow_1|}328|329|}
{2010601001|XXGgraph_vertex_vertex|488|0|817|0|{Partition_by_Key|}328|330|}
{2010212001|XXGvertex_oport_oport|489|0|819|0|{0|out|}330|331|}
{2010213001|XXGoport_dst_flow|490|0|821|0|{0|}331|329|}
{2010211001|XXGvertex_iport_iport|491|0|822|0|{0|in|}330|332|}
{2010006001|XXGobject_psameas_object|492|0|824|0|{in_metadata|out_metadata|0|0|}330|304|}
{2010601001|XXGgraph_vertex_vertex|493|0|825|0|{Sort|}328|333|}
{2010212001|XXGvertex_oport_oport|494|0|827|0|{0|out|}333|334|}
{2010211001|XXGvertex_iport_iport|495|0|829|0|{0|in|}333|335|}
{2010214001|XXGiport_src_flow|496|0|831|0|{0|}335|329|}
{2010006001|XXGobject_psameas_object|497|0|832|0|{out_metadata|out_metadata|0|0|}333|304|}
{2010212001|XXGvertex_oport_oport|498|0|833|0|{0|out0|}328|336|}
{2010216002|XXGoport_binding_oport|499|0|835|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}336|334|}
{2010213001|XXGoport_dst_flow|500|0|836|0|{0|}336|302|}
{2010211001|XXGvertex_iport_iport|501|0|837|0|{0|in0|}328|337|}
{2010215002|XXGiport_binding_iport|502|0|839|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}337|332|}
{2010214001|XXGiport_src_flow|503|0|840|0|{0|}337|301|}
{2010007001|XXGobject_proto_object|504|0|841|0|{}328|338|}
{2010604001|XXGgraph_flow_flow|505|0|843|0|{Flow_1|}338|339|}
{2010601001|XXGgraph_vertex_vertex|506|0|845|0|{Partition_by_Key|}338|340|}
{2010212001|XXGvertex_oport_oport|507|0|847|0|{0|out|}340|341|}
{2010213001|XXGoport_dst_flow|508|0|849|0|{0|}341|339|}
{2010211001|XXGvertex_iport_iport|509|0|850|0|{0|in|}340|342|}
{2010007001|XXGobject_proto_object|510|0|852|0|{}340|343|}
{2010212001|XXGvertex_oport_oport|511|0|854|0|{0|out|}343|344|}
{2010006001|XXGobject_psameas_object|512|0|856|0|{metadata|out_metadata|1|0|}344|343|}
{2010211001|XXGvertex_iport_iport|513|0|857|0|{0|in|}343|345|}
{2010006001|XXGobject_psameas_object|514|0|859|0|{metadata|in_metadata|1|0|}345|343|}
{2010006001|XXGobject_psameas_object|515|0|860|0|{Layout|InputLayout|1|0|}340|338|}
{2010006001|XXGobject_psameas_object|516|0|861|0|{key|Key|1|0|}340|338|}
{2010601001|XXGgraph_vertex_vertex|517|0|862|0|{Sort|}338|346|}
{2010212001|XXGvertex_oport_oport|518|0|864|0|{0|out|}346|347|}
{2010211001|XXGvertex_iport_iport|519|0|866|0|{0|in|}346|348|}
{2010214001|XXGiport_src_flow|520|0|868|0|{0|}348|339|}
{2010007001|XXGobject_proto_object|521|0|869|0|{}346|349|}
{2010212001|XXGvertex_oport_oport|522|0|871|0|{0|out|}349|350|}
{2010006001|XXGobject_psameas_object|523|0|873|0|{metadata|out_metadata|1|0|}350|349|}
{2010211001|XXGvertex_iport_iport|524|0|874|0|{0|in|}349|351|}
{2010006001|XXGobject_psameas_object|525|0|876|0|{metadata|in_metadata|1|0|}351|349|}
{2010006001|XXGobject_psameas_object|526|0|877|0|{Layout|OutputLayout|1|0|}346|338|}
{2010006001|XXGobject_psameas_object|527|0|878|0|{key|Key|1|0|}346|338|}
{2010006001|XXGobject_psameas_object|528|0|879|0|{max_core|Max_core|1|0|}346|338|}
{2010212001|XXGvertex_oport_oport|529|0|880|0|{0|out0|}338|352|}
{2010216002|XXGoport_binding_oport|530|0|882|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}352|347|}
{2010211001|XXGvertex_iport_iport|531|0|883|0|{0|in0|}338|353|}
{2010215002|XXGiport_binding_iport|532|0|885|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}353|342|}
{2010601001|XXGgraph_vertex_vertex|533|0|886|0|{RFMT_Extract_universal_key_for_multiplied_records|}295|354|}
{2010212001|XXGvertex_oport_oport|534|0|888|0|{0|out0|}354|355|}
{2010213001|XXGoport_dst_flow|535|0|890|0|{0|}355|298|}
{2010212001|XXGvertex_oport_oport|536|0|891|0|{1|reject0|}354|356|}
{2010212001|XXGvertex_oport_oport|537|0|893|0|{2|error0|}354|357|}
{2010212001|XXGvertex_oport_oport|538|0|895|0|{3|log|}354|358|}
{2010211001|XXGvertex_iport_iport|539|0|897|0|{0|in|}354|359|}
{2010214001|XXGiport_src_flow|540|0|899|0|{0|}359|302|}
{2010007001|XXGobject_proto_object|541|0|900|0|{}354|360|}
{2010212001|XXGvertex_oport_oport|542|0|902|0|{0|out0|}360|361|}
{2010006001|XXGobject_psameas_object|543|0|904|0|{metadata|out0_metadata|1|0|}361|360|}
{2010006001|XXGobject_psameas_object|544|0|905|0|{transform0|transform0|1|0|}361|360|}
{2010212001|XXGvertex_oport_oport|545|0|906|0|{1|reject0|}360|362|}
{2010006001|XXGobject_psameas_object|546|0|908|0|{metadata|reject0_metadata|1|0|}362|360|}
{2010212001|XXGvertex_oport_oport|547|0|909|0|{2|error0|}360|363|}
{2010006001|XXGobject_psameas_object|548|0|911|0|{metadata|error0_metadata|1|0|}363|360|}
{2010212001|XXGvertex_oport_oport|549|0|912|0|{3|log|}360|364|}
{2010006001|XXGobject_psameas_object|550|0|914|0|{metadata|log_metadata|1|0|}364|360|}
{2010211001|XXGvertex_iport_iport|551|0|915|0|{0|in|}360|365|}
{2010006001|XXGobject_psameas_object|552|0|917|0|{metadata|in_metadata|1|0|}365|360|}
{2010006001|XXGobject_psameas_object|553|0|918|0|{transform0|RFMT_XFR|1|0|}354|295|}
{2010601001|XXGgraph_vertex_vertex|554|0|919|0|{RFMT_Split_file_and_generate_hash_key_and_partition_and_record_numbers|}295|366|}
{2010212001|XXGvertex_oport_oport|555|0|921|0|{0|out0|}366|367|}
{2010213001|XXGoport_dst_flow|556|0|923|0|{0|}367|300|}
{2010212001|XXGvertex_oport_oport|557|0|924|0|{1|reject0|}366|368|}
{2010212001|XXGvertex_oport_oport|558|0|926|0|{2|error0|}366|369|}
{2010212001|XXGvertex_oport_oport|559|0|928|0|{3|log|}366|370|}
{2010211001|XXGvertex_iport_iport|560|0|930|0|{0|in|}366|371|}
{2010007001|XXGobject_proto_object|561|0|932|0|{}366|372|}
{2010212001|XXGvertex_oport_oport|562|0|934|0|{0|out0|}372|373|}
{2010006001|XXGobject_psameas_object|563|0|936|0|{metadata|out0_metadata|1|0|}373|372|}
{2010006001|XXGobject_psameas_object|564|0|937|0|{transform0|transform0|1|0|}373|372|}
{2010212001|XXGvertex_oport_oport|565|0|938|0|{1|reject0|}372|374|}
{2010006001|XXGobject_psameas_object|566|0|940|0|{metadata|reject0_metadata|1|0|}374|372|}
{2010212001|XXGvertex_oport_oport|567|0|941|0|{2|error0|}372|375|}
{2010006001|XXGobject_psameas_object|568|0|943|0|{metadata|error0_metadata|1|0|}375|372|}
{2010212001|XXGvertex_oport_oport|569|0|944|0|{3|log|}372|376|}
{2010006001|XXGobject_psameas_object|570|0|946|0|{metadata|log_metadata|1|0|}376|372|}
{2010211001|XXGvertex_iport_iport|571|0|947|0|{0|in|}372|377|}
{2010006001|XXGobject_psameas_object|572|0|949|0|{metadata|in_metadata|1|0|}377|372|}
{2010006001|XXGobject_psameas_object|573|0|950|0|{out0_metadata|SPLIT_RFMT_DML|1|0|}366|295|}
{2010006001|XXGobject_psameas_object|574|0|951|0|{transform0|SPLIT_RFMT_XFR|1|0|}366|295|}
{2010601001|XXGgraph_vertex_vertex|575|0|952|0|{RLP_Merge_records_representing_the_same_entity|}295|378|}
{2010212001|XXGvertex_oport_oport|576|0|954|0|{0|out|}378|379|}
{2010212001|XXGvertex_oport_oport|577|0|956|0|{1|reject|}378|380|}
{2010212001|XXGvertex_oport_oport|578|0|958|0|{2|error|}378|381|}
{2010212001|XXGvertex_oport_oport|579|0|960|0|{3|log|}378|382|}
{2010211001|XXGvertex_iport_iport|580|0|962|0|{0|in|}378|383|}
{2010214001|XXGiport_src_flow|581|0|964|0|{0|}383|303|}
{2010007001|XXGobject_proto_object|582|0|965|0|{}378|384|}
{2010212001|XXGvertex_oport_oport|583|0|967|0|{0|out|}384|385|}
{2010006001|XXGobject_psameas_object|584|0|969|0|{metadata|out_metadata|1|0|}385|384|}
{2010212001|XXGvertex_oport_oport|585|0|970|0|{1|reject|}384|386|}
{2010006001|XXGobject_psameas_object|586|0|972|0|{metadata|reject_metadata|1|0|}386|384|}
{2010212001|XXGvertex_oport_oport|587|0|973|0|{2|error|}384|387|}
{2010006001|XXGobject_psameas_object|588|0|975|0|{metadata|error_metadata|1|0|}387|384|}
{2010212001|XXGvertex_oport_oport|589|0|976|0|{3|log|}384|388|}
{2010006001|XXGobject_psameas_object|590|0|978|0|{metadata|log_metadata|1|0|}388|384|}
{2010211001|XXGvertex_iport_iport|591|0|979|0|{0|in|}384|389|}
{2010006001|XXGobject_psameas_object|592|0|981|0|{metadata|in_metadata|1|0|}389|384|}
{2010006001|XXGobject_psameas_object|593|0|982|0|{out_metadata|SPLIT_RFMT_DML|1|0|}378|295|}
{2010006001|XXGobject_psameas_object|594|0|983|0|{transform|ROLLUP_XFR|1|0|}378|295|}
{2010601001|XXGgraph_vertex_vertex|595|0|984|0|{SORT_record_nbr_|}295|390|}
{2010212001|XXGvertex_oport_oport|596|0|986|0|{0|out|}390|391|}
{2010213001|XXGoport_dst_flow|597|0|988|0|{0|}391|303|}
{2010211001|XXGvertex_iport_iport|598|0|989|0|{0|in|}390|392|}
{2010214001|XXGiport_src_flow|599|0|991|0|{0|}392|299|}
{2010007001|XXGobject_proto_object|600|0|992|0|{}390|393|}
{2010212001|XXGvertex_oport_oport|601|0|994|0|{0|out|}393|394|}
{2010006001|XXGobject_psameas_object|602|0|996|0|{metadata|out_metadata|1|0|}394|393|}
{2010211001|XXGvertex_iport_iport|603|0|997|0|{0|in|}393|395|}
{2010006001|XXGobject_psameas_object|604|0|999|0|{metadata|in_metadata|1|0|}395|393|}
{2010212001|XXGvertex_oport_oport|605|0|1000|0|{0|out1|}295|396|}
{2010216002|XXGoport_binding_oport|606|0|1002|0|{.5|.5|{0|}1010|}396|379|}
{2010213001|XXGoport_dst_flow|607|0|1003|0|{0|}396|268|}
{2010211001|XXGvertex_iport_iport|608|0|1004|0|{0|in0|}295|397|}
{2010215002|XXGiport_binding_iport|609|0|1006|0|{.5|.5|{0|}1008|}397|371|}
{2010214001|XXGiport_src_flow|610|0|1007|0|{0|}397|274|}
{2010006001|XXGobject_psameas_object|611|0|1008|0|{MULTIPLY_DML|MLKP_MULTIPLY_DML|1|0|}295|265|}
{2010006001|XXGobject_psameas_object|612|0|1009|0|{NORM_XFR|MLKP_NORM_XFR|1|0|}295|265|}
{2010006001|XXGobject_psameas_object|613|0|1010|0|{RFMT_XFR|MLKP_RFMT_XFR|1|0|}295|265|}
{2010006001|XXGobject_psameas_object|614|0|1011|0|{ROLLUP_XFR|MLKP_ROLLUP_XFR|1|0|}295|265|}
{2010006001|XXGobject_psameas_object|615|0|1012|0|{SPLIT_RFMT_DML|MLKP_SPLIT_RFMT_DML|1|0|}295|265|}
{2010006001|XXGobject_psameas_object|616|0|1013|0|{SPLIT_RFMT_XFR|MLKP_SPLIT_RFMT_XFR|1|0|}295|265|}
{2010601001|XXGgraph_vertex_vertex|617|0|1014|0|{NORM_Split_non_matching_records_from_each_dimension|}265|398|}
{2010212001|XXGvertex_oport_oport|618|0|1016|0|{0|out|}398|399|}
{2010212001|XXGvertex_oport_oport|619|0|1018|0|{1|reject|}398|400|}
{2010212001|XXGvertex_oport_oport|620|0|1020|0|{2|error|}398|401|}
{2010212001|XXGvertex_oport_oport|621|0|1022|0|{3|log|}398|402|}
{2010211001|XXGvertex_iport_iport|622|0|1024|0|{0|in|}398|403|}
{2010214001|XXGiport_src_flow|623|0|1026|0|{0|}403|271|}
{2010007001|XXGobject_proto_object|624|0|1027|0|{}398|404|}
{2010212001|XXGvertex_oport_oport|625|0|1029|0|{0|out|}404|405|}
{2010006001|XXGobject_psameas_object|626|0|1031|0|{metadata|out_metadata|1|0|}405|404|}
{2010212001|XXGvertex_oport_oport|627|0|1032|0|{1|reject|}404|406|}
{2010006001|XXGobject_psameas_object|628|0|1034|0|{metadata|reject_metadata|1|0|}406|404|}
{2010212001|XXGvertex_oport_oport|629|0|1035|0|{2|error|}404|407|}
{2010006001|XXGobject_psameas_object|630|0|1037|0|{metadata|error_metadata|1|0|}407|404|}
{2010212001|XXGvertex_oport_oport|631|0|1038|0|{3|log|}404|408|}
{2010006001|XXGobject_psameas_object|632|0|1040|0|{metadata|log_metadata|1|0|}408|404|}
{2010211001|XXGvertex_iport_iport|633|0|1041|0|{0|in|}404|409|}
{2010006001|XXGobject_psameas_object|634|0|1043|0|{metadata|in_metadata|1|0|}409|404|}
{2010601001|XXGgraph_vertex_vertex|635|0|1044|0|{RFMT_Distinguish_Non_Matching_Records|}265|410|}
{2010212001|XXGvertex_oport_oport|636|0|1046|0|{0|out0|}410|411|}
{2010212001|XXGvertex_oport_oport|637|0|1048|0|{1|out1|}410|412|}
{2010213001|XXGoport_dst_flow|638|0|1050|0|{0|}412|271|}
{2010212001|XXGvertex_oport_oport|639|0|1051|0|{2|reject0|}410|413|}
{2010212001|XXGvertex_oport_oport|640|0|1053|0|{3|reject1|}410|414|}
{2010212001|XXGvertex_oport_oport|641|0|1055|0|{4|error0|}410|415|}
{2010212001|XXGvertex_oport_oport|642|0|1057|0|{5|error1|}410|416|}
{2010212001|XXGvertex_oport_oport|643|0|1059|0|{6|log|}410|417|}
{2010211001|XXGvertex_iport_iport|644|0|1061|0|{0|in|}410|418|}
{2010214001|XXGiport_src_flow|645|0|1063|0|{0|}418|273|}
{2010007001|XXGobject_proto_object|646|0|1064|0|{}410|419|}
{2010212001|XXGvertex_oport_oport|647|0|1066|0|{0|out0|}419|420|}
{2010006001|XXGobject_psameas_object|648|0|1068|0|{metadata|out0_metadata|1|0|}420|419|}
{2010006001|XXGobject_psameas_object|649|0|1069|0|{transform0|transform0|1|0|}420|419|}
{2010212001|XXGvertex_oport_oport|650|0|1070|0|{1|out1|}419|421|}
{2010006001|XXGobject_psameas_object|651|0|1072|0|{metadata|out1_metadata|1|0|}421|419|}
{2010006001|XXGobject_psameas_object|652|0|1073|0|{transform1|transform1|1|0|}421|419|}
{2010212001|XXGvertex_oport_oport|653|0|1074|0|{2|reject0|}419|422|}
{2010006001|XXGobject_psameas_object|654|0|1076|0|{metadata|reject0_metadata|1|0|}422|419|}
{2010212001|XXGvertex_oport_oport|655|0|1077|0|{3|reject1|}419|423|}
{2010006001|XXGobject_psameas_object|656|0|1079|0|{metadata|reject1_metadata|1|0|}423|419|}
{2010212001|XXGvertex_oport_oport|657|0|1080|0|{4|error0|}419|424|}
{2010006001|XXGobject_psameas_object|658|0|1082|0|{metadata|error0_metadata|1|0|}424|419|}
{2010212001|XXGvertex_oport_oport|659|0|1083|0|{5|error1|}419|425|}
{2010006001|XXGobject_psameas_object|660|0|1085|0|{metadata|error1_metadata|1|0|}425|419|}
{2010212001|XXGvertex_oport_oport|661|0|1086|0|{6|log|}419|426|}
{2010006001|XXGobject_psameas_object|662|0|1088|0|{metadata|log_metadata|1|0|}426|419|}
{2010211001|XXGvertex_iport_iport|663|0|1089|0|{0|in|}419|427|}
{2010006001|XXGobject_psameas_object|664|0|1091|0|{metadata|in_metadata|1|0|}427|419|}
{2010601001|XXGgraph_vertex_vertex|665|0|1092|0|{RFMT_Split_ICFF_and_Regular_Lookup_records|}265|428|}
{2010212001|XXGvertex_oport_oport|666|0|1094|0|{0|out0|}428|429|}
{2010213001|XXGoport_dst_flow|667|0|1096|0|{0|}429|269|}
{2010212001|XXGvertex_oport_oport|668|0|1097|0|{1|reject0|}428|430|}
{2010212001|XXGvertex_oport_oport|669|0|1099|0|{2|error0|}428|431|}
{2010212001|XXGvertex_oport_oport|670|0|1101|0|{3|log|}428|432|}
{2010211001|XXGvertex_iport_iport|671|0|1103|0|{0|in|}428|433|}
{2010007001|XXGobject_proto_object|672|0|1105|0|{}428|434|}
{2010212001|XXGvertex_oport_oport|673|0|1107|0|{0|out0|}434|435|}
{2010006001|XXGobject_psameas_object|674|0|1109|0|{metadata|out0_metadata|1|0|}435|434|}
{2010006001|XXGobject_psameas_object|675|0|1110|0|{transform0|transform0|1|0|}435|434|}
{2010212001|XXGvertex_oport_oport|676|0|1111|0|{1|reject0|}434|436|}
{2010006001|XXGobject_psameas_object|677|0|1113|0|{metadata|reject0_metadata|1|0|}436|434|}
{2010212001|XXGvertex_oport_oport|678|0|1114|0|{2|error0|}434|437|}
{2010006001|XXGobject_psameas_object|679|0|1116|0|{metadata|error0_metadata|1|0|}437|434|}
{2010212001|XXGvertex_oport_oport|680|0|1117|0|{3|log|}434|438|}
{2010006001|XXGobject_psameas_object|681|0|1119|0|{metadata|log_metadata|1|0|}438|434|}
{2010211001|XXGvertex_iport_iport|682|0|1120|0|{0|in|}434|439|}
{2010006001|XXGobject_psameas_object|683|0|1122|0|{metadata|in_metadata|1|0|}439|434|}
{2010601001|XXGgraph_vertex_vertex|684|0|1123|0|{Regular_HK_UK_Lookup_Template|}265|440|}
{2010007001|XXGobject_proto_object|685|0|1125|0|{}440|441|}
{2010601001|XXGgraph_vertex_vertex|686|0|1127|0|{Regular_Serial_Lookup|}265|442|}
{2010601001|XXGgraph_vertex_vertex|687|0|1129|0|{RFMT_Extract_Universal_Key|}442|443|}
{2010212001|XXGvertex_oport_oport|688|0|1131|0|{0|out0|}443|444|}
{2010212001|XXGvertex_oport_oport|689|0|1133|0|{1|reject0|}443|445|}
{2010212001|XXGvertex_oport_oport|690|0|1135|0|{2|error0|}443|446|}
{2010212001|XXGvertex_oport_oport|691|0|1137|0|{3|log|}443|447|}
{2010211001|XXGvertex_iport_iport|692|0|1139|0|{0|in|}443|448|}
{2010007001|XXGobject_proto_object|693|0|1141|0|{}443|449|}
{2010212001|XXGvertex_oport_oport|694|0|1143|0|{0|out0|}449|450|}
{2010006001|XXGobject_psameas_object|695|0|1145|0|{metadata|out0_metadata|1|0|}450|449|}
{2010006001|XXGobject_psameas_object|696|0|1146|0|{transform0|transform0|1|0|}450|449|}
{2010212001|XXGvertex_oport_oport|697|0|1147|0|{1|reject0|}449|451|}
{2010006001|XXGobject_psameas_object|698|0|1149|0|{metadata|reject0_metadata|1|0|}451|449|}
{2010212001|XXGvertex_oport_oport|699|0|1150|0|{2|error0|}449|452|}
{2010006001|XXGobject_psameas_object|700|0|1152|0|{metadata|error0_metadata|1|0|}452|449|}
{2010212001|XXGvertex_oport_oport|701|0|1153|0|{3|log|}449|453|}
{2010006001|XXGobject_psameas_object|702|0|1155|0|{metadata|log_metadata|1|0|}453|449|}
{2010211001|XXGvertex_iport_iport|703|0|1156|0|{0|in|}449|454|}
{2010006001|XXGobject_psameas_object|704|0|1158|0|{metadata|in_metadata|1|0|}454|449|}
{2010006001|XXGobject_psameas_object|705|0|1159|0|{transform0|RFMT_XFR|1|0|}443|442|}
{2010212001|XXGvertex_oport_oport|706|0|1160|0|{0|out0|}442|455|}
{2010216002|XXGoport_binding_oport|707|0|1162|0|{.5|.5|{0|}683|}455|444|}
{2010213001|XXGoport_dst_flow|708|0|1163|0|{0|}455|272|}
{2010211001|XXGvertex_iport_iport|709|0|1164|0|{0|in0|}442|456|}
{2010215002|XXGiport_binding_iport|710|0|1166|0|{.5|.5|{0|}684|}456|448|}
{2010214001|XXGiport_src_flow|711|0|1167|0|{0|}456|270|}
{2010006001|XXGobject_psameas_object|712|0|1168|0|{RFMT_XFR|SLKP_RFMT_XFR|1|0|}442|265|}
{2010601001|XXGgraph_vertex_vertex|713|0|1169|0|{Replicate|}265|457|}
{2010212001|XXGvertex_oport_oport|714|0|1171|0|{0|out|}457|458|}
{2010213001|XXGoport_dst_flow|715|0|1173|0|{0|}458|274|}
{2010213001|XXGoport_dst_flow|716|0|1174|0|{1|}458|270|}
{2010211001|XXGvertex_iport_iport|717|0|1175|0|{0|in|}457|459|}
{2010214001|XXGiport_src_flow|718|0|1177|0|{0|}459|269|}
{2010007001|XXGobject_proto_object|719|0|1178|0|{}457|460|}
{2010212001|XXGvertex_oport_oport|720|0|1180|0|{0|out|}460|461|}
{2010006001|XXGobject_psameas_object|721|0|1182|0|{metadata|out_metadata|1|0|}461|460|}
{2010211001|XXGvertex_iport_iport|722|0|1183|0|{0|in|}460|462|}
{2010006001|XXGobject_psameas_object|723|0|1185|0|{metadata|in_metadata|1|0|}462|460|}
{2010601001|XXGgraph_vertex_vertex|724|0|1186|0|{Version_Log|}265|463|}
{2010605001|XXGgraph_legend_legend|725|0|1188|0|{0|}463|464|}
{2010241001|XXGlegend_face_face|726|0|1190|0|{}464|465|}
{2010605001|XXGgraph_legend_legend|727|0|1192|0|{1|}463|466|}
{2010241001|XXGlegend_face_face|728|0|1194|0|{}466|467|}
{2010605001|XXGgraph_legend_legend|729|0|1196|0|{2|}463|468|}
{2010241001|XXGlegend_face_face|730|0|1198|0|{}468|469|}
{2010605001|XXGgraph_legend_legend|731|0|1200|0|{3|}463|470|}
{2010241001|XXGlegend_face_face|732|0|1202|0|{}470|471|}
{2010605001|XXGgraph_legend_legend|733|0|1204|0|{4|}463|472|}
{2010241001|XXGlegend_face_face|734|0|1206|0|{}472|473|}
{2010605001|XXGgraph_legend_legend|735|0|1208|0|{5|}463|474|}
{2010241001|XXGlegend_face_face|736|0|1210|0|{}474|475|}
{2010605001|XXGgraph_legend_legend|737|0|1212|0|{6|}463|476|}
{2010241001|XXGlegend_face_face|738|0|1214|0|{}476|477|}
{2010605001|XXGgraph_legend_legend|739|0|1216|0|{7|}463|478|}
{2010241001|XXGlegend_face_face|740|0|1218|0|{}478|479|}
{2010605001|XXGgraph_legend_legend|741|0|1220|0|{8|}463|480|}
{2010241001|XXGlegend_face_face|742|0|1222|0|{}480|481|}
{2010605001|XXGgraph_legend_legend|743|0|1224|0|{9|}463|482|}
{2010241001|XXGlegend_face_face|744|0|1226|0|{}482|483|}
{2010605001|XXGgraph_legend_legend|745|0|1228|0|{10|}463|484|}
{2010241001|XXGlegend_face_face|746|0|1230|0|{}484|485|}
{2010605001|XXGgraph_legend_legend|747|0|1232|0|{11|}463|486|}
{2010241001|XXGlegend_face_face|748|0|1234|0|{}486|487|}
{2010605001|XXGgraph_legend_legend|749|0|1236|0|{12|}463|488|}
{2010241001|XXGlegend_face_face|750|0|1238|0|{}488|489|}
{2010605001|XXGgraph_legend_legend|751|0|1240|0|{13|}463|490|}
{2010241001|XXGlegend_face_face|752|0|1242|0|{}490|491|}
{2010605001|XXGgraph_legend_legend|753|0|1244|0|{14|}463|492|}
{2010241001|XXGlegend_face_face|754|0|1246|0|{}492|493|}
{2010605001|XXGgraph_legend_legend|755|0|1248|0|{15|}463|494|}
{2010241001|XXGlegend_face_face|756|0|1250|0|{}494|495|}
{2010605001|XXGgraph_legend_legend|757|0|1252|0|{16|}463|496|}
{2010241001|XXGlegend_face_face|758|0|1254|0|{}496|497|}
{2010605001|XXGgraph_legend_legend|759|0|1256|0|{17|}463|498|}
{2010241001|XXGlegend_face_face|760|0|1258|0|{}498|499|}
{2010605001|XXGgraph_legend_legend|761|0|1260|0|{18|}463|500|}
{2010241001|XXGlegend_face_face|762|0|1262|0|{}500|501|}
{2010605001|XXGgraph_legend_legend|763|0|1264|0|{19|}463|502|}
{2010241001|XXGlegend_face_face|764|0|1266|0|{}502|503|}
{2010605001|XXGgraph_legend_legend|765|0|1268|0|{20|}463|504|}
{2010241001|XXGlegend_face_face|766|0|1270|0|{}504|505|}
{2010605001|XXGgraph_legend_legend|767|0|1272|0|{21|}463|506|}
{2010241001|XXGlegend_face_face|768|0|1274|0|{}506|507|}
{2010605001|XXGgraph_legend_legend|769|0|1276|0|{22|}463|508|}
{2010241001|XXGlegend_face_face|770|0|1278|0|{}508|509|}
{2010605001|XXGgraph_legend_legend|771|0|1280|0|{23|}463|510|}
{2010241001|XXGlegend_face_face|772|0|1282|0|{}510|511|}
{2010605001|XXGgraph_legend_legend|773|0|1284|0|{24|}463|512|}
{2010241001|XXGlegend_face_face|774|0|1286|0|{}512|513|}
{2010605001|XXGgraph_legend_legend|775|0|1288|0|{25|}463|514|}
{2010241001|XXGlegend_face_face|776|0|1290|0|{}514|515|}
{2010212001|XXGvertex_oport_oport|777|0|1292|0|{0|all|}265|516|}
{2010216002|XXGoport_binding_oport|778|0|1294|0|{.5|.5|{0|}14218|}516|411|}
{2010212001|XXGvertex_oport_oport|779|0|1295|0|{1|non_matching|}265|517|}
{2010216002|XXGoport_binding_oport|780|0|1297|0|{.5|.5|{0|}14216|}517|399|}
{2010211001|XXGvertex_iport_iport|781|0|1298|0|{0|in0|}265|518|}
{2010215002|XXGiport_binding_iport|782|0|1300|0|{.5|.5|{0|}14221|}518|433|}
{2010109001|XXGobject_property_value|783|0|1301|0|{0|TrackingThumbprint|72|}1|519|}
