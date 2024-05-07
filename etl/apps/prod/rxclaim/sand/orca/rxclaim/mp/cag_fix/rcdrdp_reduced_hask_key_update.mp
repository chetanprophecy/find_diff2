@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|168|rel_count|297|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_DATASET|ids_rxclaim.rcdrdp.reduced|3|9|FK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|BASE_IDS|$[string_concat(string_split(IDS_DATASET,".")[0],"." ,string_split(IDS_DATASET,".")[1])]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS|rcdrdp.reduced|3|9|RFK|@{0|}}
{30001002|XXparameter|SUB_AREA|$[string_split(IDS_DATASET,".")[0]]|3|9|RFK|@{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(BASE_IDS)]|3|9|RFK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|\{d3p2nb; d3oinb; src_env_sk\}|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|RFK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_DEDUP|False|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_INDEX|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".idx"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_INDEX|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.idx"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_FILE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".dat.gz_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".idx_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_FILE_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.dat.gz_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.idx_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".dat.gz_bkp_f_cdur_events"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_INDEX_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".idx_bkp_f_cdur_events"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.dat.gz_bkp_f_cdur_events"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_INDEX_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS +".archive.idx_bkp_f_cdur_events"]|3|9|REFK|@{0|}}
{30001002|XXparameter|DML_FL|$PUB_DATAHUB_DML/$SUB_AREA/$IDS_DATASET.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_READ_DML|$DML_FL|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|rcdrdp_reduced_hask_key_update|bdigumar|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1192000|610000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'rcdrdp_reduced_hask_key_update' Execution Status Report

|||m_mv $INPUT_BASE_FL $INPUT_BASE_FL_BKP;
m_mv $INPUT_BASE_FL_INDEX $INPUT_BASE_FL_INDEX_BKP;
m_mv $INPUT_BASE_FL_ARCHIVE $INPUT_BASE_FL_ARCHIVE_BKP;
m_mv $INPUT_BASE_FL_ARCHIVE_INDEX $INPUT_BASE_FL_ARCHIVE_INDEX_BKP;

m_mv $ICFF_FILE $INPUT_BASE_FL;
m_mv $ICFF_INDEX_FILE $INPUT_BASE_FL_INDEX;
m_mv $ICFF_FILE_ARCHIVE $INPUT_BASE_FL_ARCHIVE;
m_mv $ICFF_INDEX_FILE_ARCHIVE $INPUT_BASE_FL_ARCHIVE_INDEX;
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@|0|140|8|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@1. Recreates hash value on NK of RCDRDP for IDS and Archive IDS
2. End script takes backup of existing files and renames new files to original IDS|202000|45000|0|0|0|0|13842|}}
{2010242002|XXGface|6|0|11|0|{@{}@|0|140|8|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}13847|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}13851|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}13834|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}13845|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}13853|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}13850|2065|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13799|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}13802|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}13843|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}13813|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}13815|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}13848|17|}}
{2010503005|XXGfvertex|19|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE_ARCHIVE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@1089000|360000|0|0|0|0|13846|Archive IDS File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|20|0|39|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|42|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|22|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|23|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE_ARCHIVE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@1104000|540000|0|0|0|0|13854|Archive Idx File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|24|0|49|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|25|0|52|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|26|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|27|0|57|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@830000|430000|0|0|0|0|13816|Write Block-Compressed Lookup-1|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|59|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|29|0|62|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|30|0|65|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|31|0|67|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|32|0|70|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|33|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|34|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|35|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|36|0|81|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|86|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk =reinterpret(get_hash(in, '$\{NATURAL_KEY\}')) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;

   out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|185000|155000|0|0|0|0|13849|Create Hash Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|88|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|91|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|40|0|93|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|95|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|97|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|100|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|44|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|45|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|49|0|118|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_BASE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_BASE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_READ_DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@28000|185000|0|0|0|0|13831|Existing IDS ICFF|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|50|0|120|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|51|0|123|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|52|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|53|0|130|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk =reinterpret(get_hash(in, '$\{NATURAL_KEY\}')) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;

   out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|205000|450000|0|0|0|0|13852|Create Hash Key-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|132|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|55|0|135|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|56|0|137|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|57|0|139|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|141|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|59|0|144|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|60|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|61|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|62|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|63|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|64|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|65|0|162|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_BASE_FL_ARCHIVE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_BASE_FL_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_READ_DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@33000|480000|0|0|0|0|13833|Existing Archive IDS ICFF|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|66|0|164|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|67|0|167|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|68|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|69|0|176|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ FILTER_EXPR !=""]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|360000|165000|0|0|0|0|13796|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|178|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|181|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|72|0|183|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|73|0|185|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|74|0|187|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|75|0|189|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|76|0|192|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|77|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|78|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|79|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|80|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|81|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|82|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|83|0|217|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ FILTER_EXPR !=""]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|380000|460000|0|0|0|0|13812|Filter by Expression-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|219|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|85|0|222|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|86|0|224|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|226|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|228|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|230|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|233|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|91|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|93|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|94|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|95|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|96|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|97|0|258|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@1069000|65000|0|0|0|0|13844|IDS File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|98|0|260|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|99|0|263|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|100|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|101|0|268|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@1084000|245000|0|0|0|0|13835|Idx File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|102|0|270|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|103|0|273|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|104|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|105|0|278|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@810000|135000|0|0|0|0|13803|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|106|0|280|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|107|0|283|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|108|0|286|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|109|0|288|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|110|0|291|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|111|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|112|0|296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|113|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|114|0|302|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|115|0|307|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@603000|140000|0|0|481000|303000|13801|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|116|0|309|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|117|0|311|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|118|0|313|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|119|0|316|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|320|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|121|0|322|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|122|0|324|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|123|0|329|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|124|0|333|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|125|0|337|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|126|0|339|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|127|0|341|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|343|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|129|0|346|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|348|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|131|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|132|0|353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|133|0|358|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|134|0|360|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|135|0|362|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|136|0|365|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|137|0|367|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|138|0|370|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|139|0|376|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|140|0|379|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|141|0|384|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@623000|435000|0|0|481000|303000|13814|Partition by Key and Sort-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|142|0|386|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|143|0|388|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|144|0|390|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|145|0|393|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|146|0|397|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|147|0|399|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|148|0|401|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|149|0|406|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|150|0|410|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|151|0|414|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|152|0|416|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|153|0|418|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|154|0|420|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|155|0|423|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|156|0|425|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|157|0|427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|158|0|430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|435|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|160|0|437|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|161|0|439|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|162|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|163|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|164|0|447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|165|0|453|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|166|0|456|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|167|0|463|0|{@{}@{1|2449229|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_10|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_11|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_12|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_13|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_2|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_5|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_6|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_7|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_8|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_9|}1|18|}
{2010601001|XXGgraph_vertex_vertex|18|0|36|0|{Archive_IDS_File|}1|19|}
{2010211001|XXGvertex_iport_iport|19|0|38|0|{0|write|}19|20|}
{2010214001|XXGiport_src_flow|20|0|40|0|{0|}20|10|}
{2010007001|XXGobject_proto_object|21|0|41|0|{}19|21|}
{2010211001|XXGvertex_iport_iport|22|0|43|0|{0|write|}21|22|}
{2010006001|XXGobject_psameas_object|23|0|45|0|{metadata|write_metadata|1|0|}22|21|}
{2010601001|XXGgraph_vertex_vertex|24|0|46|0|{Archive_Idx_File|}1|23|}
{2010211001|XXGvertex_iport_iport|25|0|48|0|{0|write|}23|24|}
{2010214001|XXGiport_src_flow|26|0|50|0|{0|}24|11|}
{2010007001|XXGobject_proto_object|27|0|51|0|{}23|25|}
{2010211001|XXGvertex_iport_iport|28|0|53|0|{0|write|}25|26|}
{2010006001|XXGobject_psameas_object|29|0|55|0|{metadata|write_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|30|0|56|0|{write_metadata|index_metadata|0|0|}23|27|}
{2010212001|XXGvertex_oport_oport|31|0|58|0|{0|out|}27|28|}
{2010213001|XXGoport_dst_flow|32|0|60|0|{0|}28|10|}
{2010212001|XXGvertex_oport_oport|33|0|61|0|{1|index|}27|29|}
{2010213001|XXGoport_dst_flow|34|0|63|0|{0|}29|11|}
{2010212001|XXGvertex_oport_oport|35|0|64|0|{2|address|}27|30|}
{2010211001|XXGvertex_iport_iport|36|0|66|0|{0|in|}27|31|}
{2010214001|XXGiport_src_flow|37|0|68|0|{0|}31|17|}
{2010007001|XXGobject_proto_object|38|0|69|0|{}27|32|}
{2010212001|XXGvertex_oport_oport|39|0|71|0|{0|out|}32|33|}
{2010006001|XXGobject_psameas_object|40|0|73|0|{metadata|out_metadata|1|0|}33|32|}
{2010212001|XXGvertex_oport_oport|41|0|74|0|{1|index|}32|34|}
{2010006001|XXGobject_psameas_object|42|0|76|0|{metadata|index_metadata|1|0|}34|32|}
{2010212001|XXGvertex_oport_oport|43|0|77|0|{2|address|}32|35|}
{2010006001|XXGobject_psameas_object|44|0|79|0|{metadata|address_metadata|1|0|}35|32|}
{2010211001|XXGvertex_iport_iport|45|0|80|0|{0|in|}32|36|}
{2010006001|XXGobject_psameas_object|46|0|82|0|{metadata|in_metadata|1|0|}36|32|}
{2010006001|XXGobject_psameas_object|47|0|83|0|{Layout|Layout|0|0|}27|19|}
{2010006001|XXGobject_psameas_object|48|0|84|0|{out_metadata|write_metadata|0|0|}27|19|}
{2010601001|XXGgraph_vertex_vertex|49|0|85|0|{Create_Hash_Key|}1|37|}
{2010212001|XXGvertex_oport_oport|50|0|87|0|{0|out0|}37|38|}
{2010213001|XXGoport_dst_flow|51|0|89|0|{0|}38|18|}
{2010212001|XXGvertex_oport_oport|52|0|90|0|{1|reject0|}37|39|}
{2010212001|XXGvertex_oport_oport|53|0|92|0|{2|error0|}37|40|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{3|log|}37|41|}
{2010211001|XXGvertex_iport_iport|55|0|96|0|{0|in|}37|42|}
{2010214001|XXGiport_src_flow|56|0|98|0|{0|}42|7|}
{2010007001|XXGobject_proto_object|57|0|99|0|{}37|43|}
{2010212001|XXGvertex_oport_oport|58|0|101|0|{0|out0|}43|44|}
{2010006001|XXGobject_psameas_object|59|0|103|0|{metadata|out0_metadata|1|0|}44|43|}
{2010006001|XXGobject_psameas_object|60|0|104|0|{transform0|transform0|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|61|0|105|0|{1|reject0|}43|45|}
{2010006001|XXGobject_psameas_object|62|0|107|0|{metadata|reject0_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|63|0|108|0|{2|error0|}43|46|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{metadata|error0_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|65|0|111|0|{3|log|}43|47|}
{2010006001|XXGobject_psameas_object|66|0|113|0|{metadata|log_metadata|1|0|}47|43|}
{2010211001|XXGvertex_iport_iport|67|0|114|0|{0|in|}43|48|}
{2010006001|XXGobject_psameas_object|68|0|116|0|{metadata|in_metadata|1|0|}48|43|}
{2010006001|XXGobject_psameas_object|69|0|117|0|{Layout|Layout|0|0|}37|49|}
{2010212001|XXGvertex_oport_oport|70|0|119|0|{0|read|}49|50|}
{2010213001|XXGoport_dst_flow|71|0|121|0|{0|}50|7|}
{2010007001|XXGobject_proto_object|72|0|122|0|{}49|51|}
{2010212001|XXGvertex_oport_oport|73|0|124|0|{0|read|}51|52|}
{2010006001|XXGobject_psameas_object|74|0|126|0|{metadata|read_metadata|1|0|}52|51|}
{2010006001|XXGobject_psameas_object|75|0|127|0|{in_metadata|read_metadata|0|0|}37|49|}
{2010006001|XXGobject_psameas_object|76|0|128|0|{reject0_metadata|read_metadata|0|0|}37|49|}
{2010601001|XXGgraph_vertex_vertex|77|0|129|0|{Create_Hash_Key_1|}1|53|}
{2010212001|XXGvertex_oport_oport|78|0|131|0|{0|out0|}53|54|}
{2010213001|XXGoport_dst_flow|79|0|133|0|{0|}54|8|}
{2010212001|XXGvertex_oport_oport|80|0|134|0|{1|reject0|}53|55|}
{2010212001|XXGvertex_oport_oport|81|0|136|0|{2|error0|}53|56|}
{2010212001|XXGvertex_oport_oport|82|0|138|0|{3|log|}53|57|}
{2010211001|XXGvertex_iport_iport|83|0|140|0|{0|in|}53|58|}
{2010214001|XXGiport_src_flow|84|0|142|0|{0|}58|12|}
{2010007001|XXGobject_proto_object|85|0|143|0|{}53|59|}
{2010212001|XXGvertex_oport_oport|86|0|145|0|{0|out0|}59|60|}
{2010006001|XXGobject_psameas_object|87|0|147|0|{metadata|out0_metadata|1|0|}60|59|}
{2010006001|XXGobject_psameas_object|88|0|148|0|{transform0|transform0|1|0|}60|59|}
{2010212001|XXGvertex_oport_oport|89|0|149|0|{1|reject0|}59|61|}
{2010006001|XXGobject_psameas_object|90|0|151|0|{metadata|reject0_metadata|1|0|}61|59|}
{2010212001|XXGvertex_oport_oport|91|0|152|0|{2|error0|}59|62|}
{2010006001|XXGobject_psameas_object|92|0|154|0|{metadata|error0_metadata|1|0|}62|59|}
{2010212001|XXGvertex_oport_oport|93|0|155|0|{3|log|}59|63|}
{2010006001|XXGobject_psameas_object|94|0|157|0|{metadata|log_metadata|1|0|}63|59|}
{2010211001|XXGvertex_iport_iport|95|0|158|0|{0|in|}59|64|}
{2010006001|XXGobject_psameas_object|96|0|160|0|{metadata|in_metadata|1|0|}64|59|}
{2010006001|XXGobject_psameas_object|97|0|161|0|{Layout|Layout|0|0|}53|65|}
{2010212001|XXGvertex_oport_oport|98|0|163|0|{0|read|}65|66|}
{2010213001|XXGoport_dst_flow|99|0|165|0|{0|}66|12|}
{2010007001|XXGobject_proto_object|100|0|166|0|{}65|67|}
{2010212001|XXGvertex_oport_oport|101|0|168|0|{0|read|}67|68|}
{2010006001|XXGobject_psameas_object|102|0|170|0|{metadata|read_metadata|1|0|}68|67|}
{2010006001|XXGobject_psameas_object|103|0|171|0|{in_metadata|read_metadata|0|0|}53|65|}
{2010006001|XXGobject_psameas_object|104|0|172|0|{reject0_metadata|read_metadata|0|0|}53|65|}
{2010601001|XXGgraph_vertex_vertex|105|0|173|0|{Existing_Archive_IDS_ICFF|}1|65|}
{2010601001|XXGgraph_vertex_vertex|106|0|174|0|{Existing_IDS_ICFF|}1|49|}
{2010601001|XXGgraph_vertex_vertex|107|0|175|0|{Filter_by_Expression_1|}1|69|}
{2010212001|XXGvertex_oport_oport|108|0|177|0|{0|out|}69|70|}
{2010213001|XXGoport_dst_flow|109|0|179|0|{0|}70|13|}
{2010212001|XXGvertex_oport_oport|110|0|180|0|{1|deselect|}69|71|}
{2010212001|XXGvertex_oport_oport|111|0|182|0|{2|reject|}69|72|}
{2010212001|XXGvertex_oport_oport|112|0|184|0|{3|error|}69|73|}
{2010212001|XXGvertex_oport_oport|113|0|186|0|{4|log|}69|74|}
{2010211001|XXGvertex_iport_iport|114|0|188|0|{0|in|}69|75|}
{2010214001|XXGiport_src_flow|115|0|190|0|{0|}75|18|}
{2010007001|XXGobject_proto_object|116|0|191|0|{}69|76|}
{2010212001|XXGvertex_oport_oport|117|0|193|0|{0|out|}76|77|}
{2010006001|XXGobject_psameas_object|118|0|195|0|{metadata|out_metadata|1|0|}77|76|}
{2010212001|XXGvertex_oport_oport|119|0|196|0|{1|deselect|}76|78|}
{2010006001|XXGobject_psameas_object|120|0|198|0|{metadata|deselect_metadata|1|0|}78|76|}
{2010212001|XXGvertex_oport_oport|121|0|199|0|{2|reject|}76|79|}
{2010006001|XXGobject_psameas_object|122|0|201|0|{metadata|reject_metadata|1|0|}79|76|}
{2010212001|XXGvertex_oport_oport|123|0|202|0|{3|error|}76|80|}
{2010006001|XXGobject_psameas_object|124|0|204|0|{metadata|error_metadata|1|0|}80|76|}
{2010212001|XXGvertex_oport_oport|125|0|205|0|{4|log|}76|81|}
{2010006001|XXGobject_psameas_object|126|0|207|0|{metadata|log_metadata|1|0|}81|76|}
{2010211001|XXGvertex_iport_iport|127|0|208|0|{0|in|}76|82|}
{2010006001|XXGobject_psameas_object|128|0|210|0|{metadata|in_metadata|1|0|}82|76|}
{2010006001|XXGobject_psameas_object|129|0|211|0|{Layout|Layout|0|0|}69|49|}
{2010006001|XXGobject_psameas_object|130|0|212|0|{deselect_metadata|out0_metadata|0|0|}69|37|}
{2010006001|XXGobject_psameas_object|131|0|213|0|{in_metadata|out0_metadata|0|0|}69|37|}
{2010006001|XXGobject_psameas_object|132|0|214|0|{out_metadata|out0_metadata|0|0|}69|37|}
{2010006001|XXGobject_psameas_object|133|0|215|0|{reject_metadata|out0_metadata|0|0|}69|37|}
{2010601001|XXGgraph_vertex_vertex|134|0|216|0|{Filter_by_Expression_2|}1|83|}
{2010212001|XXGvertex_oport_oport|135|0|218|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|136|0|220|0|{0|}84|16|}
{2010212001|XXGvertex_oport_oport|137|0|221|0|{1|deselect|}83|85|}
{2010212001|XXGvertex_oport_oport|138|0|223|0|{2|reject|}83|86|}
{2010212001|XXGvertex_oport_oport|139|0|225|0|{3|error|}83|87|}
{2010212001|XXGvertex_oport_oport|140|0|227|0|{4|log|}83|88|}
{2010211001|XXGvertex_iport_iport|141|0|229|0|{0|in|}83|89|}
{2010214001|XXGiport_src_flow|142|0|231|0|{0|}89|8|}
{2010007001|XXGobject_proto_object|143|0|232|0|{}83|90|}
{2010212001|XXGvertex_oport_oport|144|0|234|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|145|0|236|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|146|0|237|0|{1|deselect|}90|92|}
{2010006001|XXGobject_psameas_object|147|0|239|0|{metadata|deselect_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|148|0|240|0|{2|reject|}90|93|}
{2010006001|XXGobject_psameas_object|149|0|242|0|{metadata|reject_metadata|1|0|}93|90|}
{2010212001|XXGvertex_oport_oport|150|0|243|0|{3|error|}90|94|}
{2010006001|XXGobject_psameas_object|151|0|245|0|{metadata|error_metadata|1|0|}94|90|}
{2010212001|XXGvertex_oport_oport|152|0|246|0|{4|log|}90|95|}
{2010006001|XXGobject_psameas_object|153|0|248|0|{metadata|log_metadata|1|0|}95|90|}
{2010211001|XXGvertex_iport_iport|154|0|249|0|{0|in|}90|96|}
{2010006001|XXGobject_psameas_object|155|0|251|0|{metadata|in_metadata|1|0|}96|90|}
{2010006001|XXGobject_psameas_object|156|0|252|0|{Layout|Layout|0|0|}83|65|}
{2010006001|XXGobject_psameas_object|157|0|253|0|{deselect_metadata|out0_metadata|0|0|}83|53|}
{2010006001|XXGobject_psameas_object|158|0|254|0|{in_metadata|out0_metadata|0|0|}83|53|}
{2010006001|XXGobject_psameas_object|159|0|255|0|{out_metadata|out0_metadata|0|0|}83|53|}
{2010006001|XXGobject_psameas_object|160|0|256|0|{reject_metadata|out0_metadata|0|0|}83|53|}
{2010601001|XXGgraph_vertex_vertex|161|0|257|0|{IDS_File|}1|97|}
{2010211001|XXGvertex_iport_iport|162|0|259|0|{0|write|}97|98|}
{2010214001|XXGiport_src_flow|163|0|261|0|{0|}98|15|}
{2010007001|XXGobject_proto_object|164|0|262|0|{}97|99|}
{2010211001|XXGvertex_iport_iport|165|0|264|0|{0|write|}99|100|}
{2010006001|XXGobject_psameas_object|166|0|266|0|{metadata|write_metadata|1|0|}100|99|}
{2010601001|XXGgraph_vertex_vertex|167|0|267|0|{Idx_File|}1|101|}
{2010211001|XXGvertex_iport_iport|168|0|269|0|{0|write|}101|102|}
{2010214001|XXGiport_src_flow|169|0|271|0|{0|}102|9|}
{2010007001|XXGobject_proto_object|170|0|272|0|{}101|103|}
{2010211001|XXGvertex_iport_iport|171|0|274|0|{0|write|}103|104|}
{2010006001|XXGobject_psameas_object|172|0|276|0|{metadata|write_metadata|1|0|}104|103|}
{2010006001|XXGobject_psameas_object|173|0|277|0|{write_metadata|index_metadata|0|0|}101|105|}
{2010212001|XXGvertex_oport_oport|174|0|279|0|{0|out|}105|106|}
{2010213001|XXGoport_dst_flow|175|0|281|0|{0|}106|15|}
{2010212001|XXGvertex_oport_oport|176|0|282|0|{1|index|}105|107|}
{2010213001|XXGoport_dst_flow|177|0|284|0|{0|}107|9|}
{2010212001|XXGvertex_oport_oport|178|0|285|0|{2|address|}105|108|}
{2010211001|XXGvertex_iport_iport|179|0|287|0|{0|in|}105|109|}
{2010214001|XXGiport_src_flow|180|0|289|0|{0|}109|14|}
{2010007001|XXGobject_proto_object|181|0|290|0|{}105|110|}
{2010212001|XXGvertex_oport_oport|182|0|292|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|183|0|294|0|{metadata|out_metadata|1|0|}111|110|}
{2010212001|XXGvertex_oport_oport|184|0|295|0|{1|index|}110|112|}
{2010006001|XXGobject_psameas_object|185|0|297|0|{metadata|index_metadata|1|0|}112|110|}
{2010212001|XXGvertex_oport_oport|186|0|298|0|{2|address|}110|113|}
{2010006001|XXGobject_psameas_object|187|0|300|0|{metadata|address_metadata|1|0|}113|110|}
{2010211001|XXGvertex_iport_iport|188|0|301|0|{0|in|}110|114|}
{2010006001|XXGobject_psameas_object|189|0|303|0|{metadata|in_metadata|1|0|}114|110|}
{2010006001|XXGobject_psameas_object|190|0|304|0|{Layout|Layout|0|0|}105|97|}
{2010006001|XXGobject_psameas_object|191|0|305|0|{out_metadata|write_metadata|0|0|}105|97|}
{2010601001|XXGgraph_vertex_vertex|192|0|306|0|{Partition_by_Key_and_Sort|}1|115|}
{2010604001|XXGgraph_flow_flow|193|0|308|0|{Flow_1|}115|116|}
{2010601001|XXGgraph_vertex_vertex|194|0|310|0|{Partition_by_Key|}115|117|}
{2010212001|XXGvertex_oport_oport|195|0|312|0|{0|out|}117|118|}
{2010213001|XXGoport_dst_flow|196|0|314|0|{0|}118|116|}
{2010211001|XXGvertex_iport_iport|197|0|315|0|{0|in|}117|119|}
{2010006001|XXGobject_psameas_object|198|0|317|0|{in_metadata|out0_metadata|0|0|}117|37|}
{2010006001|XXGobject_psameas_object|199|0|318|0|{out_metadata|out0_metadata|0|0|}117|37|}
{2010601001|XXGgraph_vertex_vertex|200|0|319|0|{Sort|}115|120|}
{2010212001|XXGvertex_oport_oport|201|0|321|0|{0|out|}120|121|}
{2010211001|XXGvertex_iport_iport|202|0|323|0|{0|in|}120|122|}
{2010214001|XXGiport_src_flow|203|0|325|0|{0|}122|116|}
{2010006001|XXGobject_psameas_object|204|0|326|0|{in_metadata|out0_metadata|0|0|}120|37|}
{2010006001|XXGobject_psameas_object|205|0|327|0|{out_metadata|out0_metadata|0|0|}120|37|}
{2010212001|XXGvertex_oport_oport|206|0|328|0|{0|out0|}115|123|}
{2010216002|XXGoport_binding_oport|207|0|330|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}123|121|}
{2010213001|XXGoport_dst_flow|208|0|331|0|{0|}123|14|}
{2010211001|XXGvertex_iport_iport|209|0|332|0|{0|in0|}115|124|}
{2010215002|XXGiport_binding_iport|210|0|334|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}124|119|}
{2010214001|XXGiport_src_flow|211|0|335|0|{0|}124|13|}
{2010007001|XXGobject_proto_object|212|0|336|0|{}115|125|}
{2010604001|XXGgraph_flow_flow|213|0|338|0|{Flow_1|}125|126|}
{2010601001|XXGgraph_vertex_vertex|214|0|340|0|{Partition_by_Key|}125|127|}
{2010212001|XXGvertex_oport_oport|215|0|342|0|{0|out|}127|128|}
{2010213001|XXGoport_dst_flow|216|0|344|0|{0|}128|126|}
{2010211001|XXGvertex_iport_iport|217|0|345|0|{0|in|}127|129|}
{2010007001|XXGobject_proto_object|218|0|347|0|{}127|130|}
{2010212001|XXGvertex_oport_oport|219|0|349|0|{0|out|}130|131|}
{2010006001|XXGobject_psameas_object|220|0|351|0|{metadata|out_metadata|1|0|}131|130|}
{2010211001|XXGvertex_iport_iport|221|0|352|0|{0|in|}130|132|}
{2010006001|XXGobject_psameas_object|222|0|354|0|{metadata|in_metadata|1|0|}132|130|}
{2010006001|XXGobject_psameas_object|223|0|355|0|{Layout|InputLayout|1|0|}127|125|}
{2010006001|XXGobject_psameas_object|224|0|356|0|{key|Key|1|0|}127|125|}
{2010601001|XXGgraph_vertex_vertex|225|0|357|0|{Sort|}125|133|}
{2010212001|XXGvertex_oport_oport|226|0|359|0|{0|out|}133|134|}
{2010211001|XXGvertex_iport_iport|227|0|361|0|{0|in|}133|135|}
{2010214001|XXGiport_src_flow|228|0|363|0|{0|}135|126|}
{2010007001|XXGobject_proto_object|229|0|364|0|{}133|136|}
{2010212001|XXGvertex_oport_oport|230|0|366|0|{0|out|}136|137|}
{2010006001|XXGobject_psameas_object|231|0|368|0|{metadata|out_metadata|1|0|}137|136|}
{2010211001|XXGvertex_iport_iport|232|0|369|0|{0|in|}136|138|}
{2010006001|XXGobject_psameas_object|233|0|371|0|{metadata|in_metadata|1|0|}138|136|}
{2010006001|XXGobject_psameas_object|234|0|372|0|{Layout|OutputLayout|1|0|}133|125|}
{2010006001|XXGobject_psameas_object|235|0|373|0|{key|Key|1|0|}133|125|}
{2010006001|XXGobject_psameas_object|236|0|374|0|{max_core|Max_core|1|0|}133|125|}
{2010212001|XXGvertex_oport_oport|237|0|375|0|{0|out0|}125|139|}
{2010216002|XXGoport_binding_oport|238|0|377|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}139|134|}
{2010211001|XXGvertex_iport_iport|239|0|378|0|{0|in0|}125|140|}
{2010215002|XXGiport_binding_iport|240|0|380|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}140|129|}
{2010006001|XXGobject_psameas_object|241|0|381|0|{InputLayout|Layout|0|0|}115|49|}
{2010006001|XXGobject_psameas_object|242|0|382|0|{OutputLayout|Layout|0|0|}115|97|}
{2010601001|XXGgraph_vertex_vertex|243|0|383|0|{Partition_by_Key_and_Sort_1|}1|141|}
{2010604001|XXGgraph_flow_flow|244|0|385|0|{Flow_1|}141|142|}
{2010601001|XXGgraph_vertex_vertex|245|0|387|0|{Partition_by_Key|}141|143|}
{2010212001|XXGvertex_oport_oport|246|0|389|0|{0|out|}143|144|}
{2010213001|XXGoport_dst_flow|247|0|391|0|{0|}144|142|}
{2010211001|XXGvertex_iport_iport|248|0|392|0|{0|in|}143|145|}
{2010006001|XXGobject_psameas_object|249|0|394|0|{in_metadata|out0_metadata|0|0|}143|53|}
{2010006001|XXGobject_psameas_object|250|0|395|0|{out_metadata|out0_metadata|0|0|}143|53|}
{2010601001|XXGgraph_vertex_vertex|251|0|396|0|{Sort|}141|146|}
{2010212001|XXGvertex_oport_oport|252|0|398|0|{0|out|}146|147|}
{2010211001|XXGvertex_iport_iport|253|0|400|0|{0|in|}146|148|}
{2010214001|XXGiport_src_flow|254|0|402|0|{0|}148|142|}
{2010006001|XXGobject_psameas_object|255|0|403|0|{in_metadata|out0_metadata|0|0|}146|53|}
{2010006001|XXGobject_psameas_object|256|0|404|0|{out_metadata|out0_metadata|0|0|}146|53|}
{2010212001|XXGvertex_oport_oport|257|0|405|0|{0|out0|}141|149|}
{2010216002|XXGoport_binding_oport|258|0|407|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}149|147|}
{2010213001|XXGoport_dst_flow|259|0|408|0|{0|}149|17|}
{2010211001|XXGvertex_iport_iport|260|0|409|0|{0|in0|}141|150|}
{2010215002|XXGiport_binding_iport|261|0|411|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}150|145|}
{2010214001|XXGiport_src_flow|262|0|412|0|{0|}150|16|}
{2010007001|XXGobject_proto_object|263|0|413|0|{}141|151|}
{2010604001|XXGgraph_flow_flow|264|0|415|0|{Flow_1|}151|152|}
{2010601001|XXGgraph_vertex_vertex|265|0|417|0|{Partition_by_Key|}151|153|}
{2010212001|XXGvertex_oport_oport|266|0|419|0|{0|out|}153|154|}
{2010213001|XXGoport_dst_flow|267|0|421|0|{0|}154|152|}
{2010211001|XXGvertex_iport_iport|268|0|422|0|{0|in|}153|155|}
{2010007001|XXGobject_proto_object|269|0|424|0|{}153|156|}
{2010212001|XXGvertex_oport_oport|270|0|426|0|{0|out|}156|157|}
{2010006001|XXGobject_psameas_object|271|0|428|0|{metadata|out_metadata|1|0|}157|156|}
{2010211001|XXGvertex_iport_iport|272|0|429|0|{0|in|}156|158|}
{2010006001|XXGobject_psameas_object|273|0|431|0|{metadata|in_metadata|1|0|}158|156|}
{2010006001|XXGobject_psameas_object|274|0|432|0|{Layout|InputLayout|1|0|}153|151|}
{2010006001|XXGobject_psameas_object|275|0|433|0|{key|Key|1|0|}153|151|}
{2010601001|XXGgraph_vertex_vertex|276|0|434|0|{Sort|}151|159|}
{2010212001|XXGvertex_oport_oport|277|0|436|0|{0|out|}159|160|}
{2010211001|XXGvertex_iport_iport|278|0|438|0|{0|in|}159|161|}
{2010214001|XXGiport_src_flow|279|0|440|0|{0|}161|152|}
{2010007001|XXGobject_proto_object|280|0|441|0|{}159|162|}
{2010212001|XXGvertex_oport_oport|281|0|443|0|{0|out|}162|163|}
{2010006001|XXGobject_psameas_object|282|0|445|0|{metadata|out_metadata|1|0|}163|162|}
{2010211001|XXGvertex_iport_iport|283|0|446|0|{0|in|}162|164|}
{2010006001|XXGobject_psameas_object|284|0|448|0|{metadata|in_metadata|1|0|}164|162|}
{2010006001|XXGobject_psameas_object|285|0|449|0|{Layout|OutputLayout|1|0|}159|151|}
{2010006001|XXGobject_psameas_object|286|0|450|0|{key|Key|1|0|}159|151|}
{2010006001|XXGobject_psameas_object|287|0|451|0|{max_core|Max_core|1|0|}159|151|}
{2010212001|XXGvertex_oport_oport|288|0|452|0|{0|out0|}151|165|}
{2010216002|XXGoport_binding_oport|289|0|454|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}165|160|}
{2010211001|XXGvertex_iport_iport|290|0|455|0|{0|in0|}151|166|}
{2010215002|XXGiport_binding_iport|291|0|457|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}166|155|}
{2010006001|XXGobject_psameas_object|292|0|458|0|{InputLayout|Layout|0|0|}141|65|}
{2010006001|XXGobject_psameas_object|293|0|459|0|{OutputLayout|Layout|0|0|}141|19|}
{2010601001|XXGgraph_vertex_vertex|294|0|460|0|{Write_Block_Compressed_Lookup|}1|105|}
{2010601001|XXGgraph_vertex_vertex|295|0|461|0|{Write_Block_Compressed_Lookup_1|}1|27|}
{2010109001|XXGobject_property_value|296|0|462|0|{0|TrackingThumbprint|72|}1|167|}
