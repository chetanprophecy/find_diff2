@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|281|rel_count|514|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_DATASET|ids_common.d_product|3|9|FK|@{0|}}
{30001002|XXparameter|SUB_AREA|$[string_split(IDS_DATASET,".")[0]]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_NAME|$[string_split(IDS_DATASET,".")[1]]|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|one|3|9|RFK|@{0|}}
{30001002|XXparameter|TABLE_TYPE|$[get_ids_table_type(IDS_DATASET)]|3|9|RK|@{0|}}
{30001002|XXparameter|STORAGE_TYPE|$[get_ids_table_properties(IDS_DATASET).storage_type]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|NATURAL_KEY|\{d3p2nb; d3oinb; d3jjnb; src_env_sk\}|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|RFK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_DEDUP|False|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_INDEX|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".idx"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.dat.gz"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_INDEX|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.idx"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_NEW|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".dat.gz_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_INDEX_NEW|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".idx_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_FILE_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.dat.gz_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE_ARCHIVE|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.idx_new"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".dat.gz_bkp_update_sk"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_INDEX_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".idx_bkp_update_sk"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.dat.gz_bkp_update_sk"]|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_BASE_FL_ARCHIVE_INDEX_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/"+DATASET_IDENTIFIER+"/" + IDS_NAME +".archive.idx_bkp_update_sk"]|3|9|REFK|@{0|}}
{30001002|XXparameter|DML_FL|$PUB_DATAHUB_DML/$SUB_AREA/$IDS_DATASET.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_READ_DML|$DML_FL|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF|$[if(STORAGE_TYPE=="icff" or DATASET_IDENTIFIER == "many") 
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat.gz" 
else if (STORAGE_TYPE!="icff" && DATASET_IDENTIFIER != "many" )
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_IDX|$[IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".idx"]|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_NEW|$[if(STORAGE_TYPE=="icff" or DATASET_IDENTIFIER == "many") 
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat.gz_new" 
else if (STORAGE_TYPE!="icff" && DATASET_IDENTIFIER != "many" )
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat_new" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_IDX_NEW|$[IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".idx_new"]|3|9|REFK|@{0|}}
{30001002|XXparameter|XREF_BKP|$[if(STORAGE_TYPE=="icff" or DATASET_IDENTIFIER == "many") 
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat.gz_bkp_update_sk" 
else if (STORAGE_TYPE!="icff" && DATASET_IDENTIFIER != "many" )
IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".dat_bkp_update_sk" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_IDX_BKP|$[IDS_PATH+"/ids/" + SUB_AREA + "/xref/xref." + IDS_NAME +".idx_bkp_add_sk"]|3|9|REFK|@{0|}}
{30001002|XXparameter|LOOKUP_FILE|$[AI_SERIAL_TEMP+"/"+string_upcase(IDS_NAME)+"_DUPS.dat"]|3|9|RFK|@{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[AI_SERIAL_TEMP+"/"+string_upcase(IDS_NAME)+"_DUPS.dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|LOOKUP_DML|$[read_file(LOOKUP_DML_FILE)]|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|rcdrdp_reduced_hask_key_update|bdigumar|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2019000|846000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'd_product_ids_and_xref_sk_update' Execution Status Report

Job completed successfully at Friday, October 02, 2020 00:50:31
Run performed by user bdigumar
||m_cp $XREF $XREF_BKP;
m_cp $XREF_IDX $XREF_IDX_BKP;

m_cp $INPUT_BASE_FL $INPUT_BASE_FL_BKP;
m_cp $INPUT_BASE_FL_INDEX $INPUT_BASE_FL_INDEX_BKP;
|m_cp $XREF_NEW $XREF;
m_cp $XREF_IDX_NEW $XREF_IDX;

m_cp $INPUT_BASE_FL_NEW $INPUT_BASE_FL;
m_cp $INPUT_BASE_FL_INDEX_NEW $INPUT_BASE_FL_INDEX;
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@|0|140|8|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@1. Adds missing DXF_SK from IDS and Archive IDS to XREF
2. Start script takes backup of existing files and process over writes existing IDS|202000|45000|0|0|0|0|13932|}}
{2010242002|XXGface|6|0|11|0|{@{}@|0|140|8|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}14667|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}14676|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}14816|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@0|.5|.5|{0|}14803|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14644|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|.5|{0|}14623|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14682|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14683|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@0|.5|.5|{0|}14643|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@0|.5|.5|{0|}14681|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@0|.5|.5|{0|}14665|2065|}}
{2010210004|XXGflow|18|0|35|0|{@{}@0|.5|.5|{0|}14672|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@0|.5|.5|{0|}14809|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@0|.5|.5|{0|}14811|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}14806|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@0|.5|.5|{0|}14807|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@0|.5|.5|{0|}14671|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@0|.5|.5|{0|}14679|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@0|.5|.5|{0|}14814|20|}}
{2010210004|XXGflow|26|0|51|0|{@{}@0|.5|.5|{0|}14668|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@0|.5|.5|{0|}14678|17|}}
{2010501005|XXGpvertex|28|0|55|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|1762000|770000|0|0|0|0|14813|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|29|0|57|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|30|0|60|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|31|0|63|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|32|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|33|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|34|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_IDX_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_IDX_NEW|3|2|$|@{0|}}
}}@1|@475000|230000|0|0|0|0|11038|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|35|0|73|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|36|0|75|0|{@{}@384|.5|.5|{0|}11037|17|}}
{2010503005|XXGfvertex|37|0|77|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|38|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|39|0|82|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@266000|125000|0|0|0|0|11034|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|84|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|41|0|86|0|{@{}@384|.5|.5|{0|}11035|17|}}
{2010203004|XXGoport|42|0|88|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|43|0|91|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|44|0|93|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of indexes|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|key0||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|45|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|47|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|107|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.dxf_hk.dxf_hk_part1 :: in.dxf_hk_part1;
out.dxf_hk.dxf_hk_part2 :: in.dxf_hk_part2;
out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1415000|745000|0|0|0|0|14800|Reformat-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|49|0|109|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|50|0|112|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|51|0|114|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|52|0|116|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|53|0|118|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|54|0|121|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
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
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|55|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|56|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|57|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|58|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|60|0|140|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  end;|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[STORAGE_TYPE!="icff" && DATASET_IDENTIFIER != "many" ]|3|9||@{0|}}
}}@0|@23000|645000|0|0|0|0|14817|Existing XREF|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|61|0|142|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|62|0|145|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|63|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|64|0|152|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|1023000|375000|0|0|0|0|14645|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|65|0|154|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|66|0|157|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|67|0|160|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|162|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|69|0|164|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|166|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|71|0|169|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|72|0|171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|73|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|74|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|75|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|76|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|77|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|78|0|189|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/duplicate_d_product.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/duplicate_d_product.dat.gz|3|2|$|@{0|}}
}}@1|Input File|1264000|536500|0|0|0|0|14666|Input File|Ab Initio Software|@1|10000|-1||6||257|-1|-1|}}
{2010202004|XXGiport|79|0|191|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|80|0|194|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|81|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|82|0|199|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_BASE_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_BASE_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_READ_DML|3|2|f$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@23000|390000|0|0|0|0|14662|Existing IDS ICFF|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|83|0|201|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|84|0|204|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|85|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|86|0|213|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; dxf_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|1226000|715000|0|0|0|0|14808|Dedup Sorted-1|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|215|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|88|0|218|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|89|0|220|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|222|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|91|0|224|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|226|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|93|0|229|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|94|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|95|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|96|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|97|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|98|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|99|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|100|0|254|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|866000|662500|0|0|0|0|14437|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|101|0|256|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|102|0|259|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|103|0|263|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|104|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|105|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|106|0|276|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|lookup_match("Lookup File", dxf_sk)|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|175000|365000|0|0|0|0|14669|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|107|0|278|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|108|0|281|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|109|0|284|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|110|0|286|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|111|0|288|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|112|0|290|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|293|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|114|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|115|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|116|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|117|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|118|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|119|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|318|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|lookup_match("Lookup File", dxf_sk)|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|287000|625000|0|0|0|0|14677|Filter by Expression-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|121|0|320|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|122|0|323|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|123|0|326|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|124|0|328|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|125|0|330|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|126|0|332|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|127|0|335|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|128|0|337|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|129|0|340|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|130|0|343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|131|0|346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|132|0|349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|133|0|352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|134|0|360|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_BASE_FL_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_BASE_FL_NEW|3|2|$|@{0|}}
}}@1|@1728000|320000|0|0|0|0|14664|IDS ICFF Data File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|135|0|362|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|136|0|365|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|137|0|367|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|138|0|370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_BASE_FL_INDEX_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_BASE_FL_INDEX_NEW|3|2|$|@{0|}}
}}@1|@1744000|485000|0|0|0|0|14651|IDS ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|139|0|372|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|140|0|375|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|141|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|142|0|380|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@1472000|365000|0|0|0|0|14684|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|143|0|382|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|144|0|385|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|145|0|388|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|146|0|390|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|147|0|393|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|148|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|149|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|150|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|151|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|152|0|411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/d_product_sk_cross_reference.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|RecordFormat|/* DML Generated by IDS Table DML Onboarding Process for table: D_PRODUCT
 * On: WED DEC 05 2018 05:52:33
 */

record
  decimal("\\x01",0)   old_prod_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   new_prod_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
    datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  string(1)  newline = NULL("");
end;|3|9||@{0|}}
{30001002|XXparameter|key|\{new_prod_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/d_product_sk_cross_reference.dat|3|2|$|@{0|}}
}}@0|Lookup File|316000|224000|0|0|0|0|14670|Lookup File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010503005|XXGfvertex|153|0|413|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Lookup File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|154|0|415|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1; dxf_hk_part2; dxf_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1003000|715000|0|0|481000|303000|14805|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|155|0|417|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|156|0|419|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|157|0|421|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|158|0|424|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|428|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|160|0|430|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|161|0|432|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|162|0|437|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|163|0|441|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|164|0|445|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|165|0|447|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|166|0|449|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|167|0|451|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|168|0|454|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|456|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|170|0|458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|171|0|461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|466|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|173|0|468|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|174|0|470|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|175|0|473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|176|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|177|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|178|0|484|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|179|0|487|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|180|0|492|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@600000|370000|0|0|481000|303000|14622|Partition by Key and Sort-4|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|181|0|494|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|182|0|496|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|183|0|498|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|184|0|501|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|185|0|505|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|186|0|507|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|187|0|509|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|188|0|514|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|189|0|518|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|190|0|523|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|191|0|525|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|192|0|527|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|193|0|529|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|194|0|532|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|195|0|534|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|196|0|536|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|197|0|539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|198|0|544|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|199|0|546|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|200|0|548|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|201|0|551|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|202|0|553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|203|0|556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|204|0|562|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|205|0|565|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|206|0|570|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1210000|365000|0|0|481000|303000|14636|Partition by Key and Sort-5|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|207|0|572|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|208|0|574|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|209|0|576|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|210|0|579|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|211|0|583|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|585|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|213|0|587|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|214|0|592|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|215|0|596|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|216|0|600|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|217|0|602|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|218|0|604|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|219|0|606|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|220|0|609|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|221|0|611|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|222|0|613|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|223|0|616|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|224|0|621|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|225|0|623|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|226|0|625|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|628|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|228|0|630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|229|0|633|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|230|0|639|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|231|0|642|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|232|0|647|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.dxf_sk :: lookup("Lookup File", in.dxf_sk).old_prod_sk;
out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|415000|280000|0|0|0|0|14673|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|233|0|649|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|234|0|652|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|235|0|654|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|236|0|656|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|237|0|658|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|238|0|661|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
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
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|239|0|663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|240|0|667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|241|0|670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|242|0|673|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|243|0|676|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|244|0|683|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.dxf_sk :: lookup("Lookup File", in.dxf_sk).old_prod_sk;
out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|592000|565000|0|0|0|0|14680|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|245|0|685|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|246|0|688|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|247|0|690|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|248|0|692|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|249|0|694|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|250|0|697|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
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
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|251|0|699|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|252|0|703|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|253|0|706|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|254|0|709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|255|0|712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|256|0|720|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|1590000|752000|0|0|0|0|14810|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|257|0|722|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|258|0|725|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|259|0|728|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|260|0|730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|261|0|733|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|739|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort within Groups|856000|365000|0|0|0|0|14625|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|263|0|741|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|264|0|744|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|265|0|747|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|major_key||19|2|RFK$|Input is assumed to be sorted on this key|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key||19|2|RFK$|Input will be sorted within groups on this key|{0|}}
{30001002|XXparameter|minor_key.display_name|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key.keyword|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|max_core|10485760|1|2|FK$|maximum memory usage in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted|false|13|1|FKl|Allows input not sorted by major key|{0|}}
{30001002|XXparameter|allow_unsorted.display_name|allow-unsorted|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted.keyword|allow-unsorted|3|9|P|@{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort within Groups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|266|0|749|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|267|0|752|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|268|0|759|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[STORAGE_TYPE!="icff" && DATASET_IDENTIFIER != "many" ]|3|9|F||{0|}}
}}@0|@1857500|723000|0|0|0|0|14815|Write Non ICFF Xref LookUp|Mukesh Singh|Created 6/22/2016 2:01:24 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|694000|276000|3|}}
{2010240003|XXGlegend|269|0|761|0|{@{}@This type of xref is created only for 
dimensions that has less than 10m record

Write index do not support idx append , everytime a new index file has to be created|16000|16000|0|0|0|0|10783|}}
{2010242002|XXGface|270|0|763|0|{@{}@Arial|32768|100|1|}}
{2010600005|XXGgraph|271|0|765|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="MPP"]|3|9|F||{0|}}
}}@0|@166500|142500|0|0|0|0|10954|for MPP Server Architecture|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1311000|467000|3|}}
{2010240003|XXGlegend|272|0|767|0|{@{}@This file will only read one partition of data , since every partion 
will have same data due to usage of brodcast while creating main data file|201000|340000|0|0|0|0|10889|}}
{2010242002|XXGface|273|0|769|0|{@{}@Arial Narrow|32768|100|0|}}
{2010503005|XXGfvertex|274|0|774|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NEW", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NEW|3|2|$|@{0|}}
}}@1|@471000|100000|0|0|0|0|11036|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|275|0|776|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|276|0|779|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|277|0|781|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|278|0|786|0|{@{}@0|0|0|0|in0|.5353319057815846|@@@13840|0|}}
{2010202004|XXGiport|279|0|789|0|{@{}@0|0|0|0|in0|.7101449275362319|@@@13840|0|}}
{2010110002|XXGconstant|280|0|793|0|{@{}@{1|8005841|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_14|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_15|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_16|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_17|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_18|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_19|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_2|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_20|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_21|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_22|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_4|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_5|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_6|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_7|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_8|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_9|}1|27|}
{2010601001|XXGgraph_vertex_vertex|27|0|54|0|{Broadcast|}1|28|}
{2010212001|XXGvertex_oport_oport|28|0|56|0|{0|out|}28|29|}
{2010213001|XXGoport_dst_flow|29|0|58|0|{0|}29|25|}
{2010211001|XXGvertex_iport_iport|30|0|59|0|{0|in|}28|30|}
{2010214001|XXGiport_src_flow|31|0|61|0|{0|}30|20|}
{2010007001|XXGobject_proto_object|32|0|62|0|{}28|31|}
{2010212001|XXGvertex_oport_oport|33|0|64|0|{0|out|}31|32|}
{2010006001|XXGobject_psameas_object|34|0|66|0|{metadata|out_metadata|1|0|}32|31|}
{2010211001|XXGvertex_iport_iport|35|0|67|0|{0|in|}31|33|}
{2010006001|XXGobject_psameas_object|36|0|69|0|{metadata|in_metadata|1|0|}33|31|}
{2010006001|XXGobject_psameas_object|37|0|70|0|{Layout|Layout|0|0|}28|34|}
{2010211001|XXGvertex_iport_iport|38|0|72|0|{0|write|}34|35|}
{2010214001|XXGiport_src_flow|39|0|74|0|{0|}35|36|}
{2010007001|XXGobject_proto_object|40|0|76|0|{}34|37|}
{2010211001|XXGvertex_iport_iport|41|0|78|0|{0|write|}37|38|}
{2010006001|XXGobject_psameas_object|42|0|80|0|{metadata|write_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|43|0|81|0|{write_metadata|index0_metadata|0|0|}34|39|}
{2010212001|XXGvertex_oport_oport|44|0|83|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|45|0|85|0|{0|}40|41|}
{2010212001|XXGvertex_oport_oport|46|0|87|0|{1|index0|}39|42|}
{2010213001|XXGoport_dst_flow|47|0|89|0|{0|}42|36|}
{2010211001|XXGvertex_iport_iport|48|0|90|0|{0|in|}39|43|}
{2010007001|XXGobject_proto_object|49|0|92|0|{}39|44|}
{2010212001|XXGvertex_oport_oport|50|0|94|0|{0|out|}44|45|}
{2010006001|XXGobject_psameas_object|51|0|96|0|{metadata|out_metadata|1|0|}45|44|}
{2010212001|XXGvertex_oport_oport|52|0|97|0|{1|index0|}44|46|}
{2010006001|XXGobject_psameas_object|53|0|99|0|{key0|key0|1|0|}46|44|}
{2010006001|XXGobject_psameas_object|54|0|100|0|{metadata|index0_metadata|1|0|}46|44|}
{2010211001|XXGvertex_iport_iport|55|0|101|0|{0|in|}44|47|}
{2010006001|XXGobject_psameas_object|56|0|103|0|{metadata|in_metadata|1|0|}47|44|}
{2010006001|XXGobject_psameas_object|57|0|104|0|{Layout|Layout|0|0|}39|34|}
{2010006001|XXGobject_psameas_object|58|0|105|0|{in_metadata|out_metadata|0|0|}39|39|}
{2010006001|XXGobject_psameas_object|59|0|106|0|{in_metadata|out0_metadata|0|0|}28|48|}
{2010212001|XXGvertex_oport_oport|60|0|108|0|{0|out0|}48|49|}
{2010213001|XXGoport_dst_flow|61|0|110|0|{0|}49|19|}
{2010212001|XXGvertex_oport_oport|62|0|111|0|{1|reject0|}48|50|}
{2010212001|XXGvertex_oport_oport|63|0|113|0|{2|error0|}48|51|}
{2010212001|XXGvertex_oport_oport|64|0|115|0|{3|log|}48|52|}
{2010211001|XXGvertex_iport_iport|65|0|117|0|{0|in|}48|53|}
{2010214001|XXGiport_src_flow|66|0|119|0|{0|}53|22|}
{2010007001|XXGobject_proto_object|67|0|120|0|{}48|54|}
{2010212001|XXGvertex_oport_oport|68|0|122|0|{0|out0|}54|55|}
{2010006001|XXGobject_psameas_object|69|0|124|0|{metadata|out0_metadata|1|0|}55|54|}
{2010006001|XXGobject_psameas_object|70|0|125|0|{transform0|transform0|1|0|}55|54|}
{2010212001|XXGvertex_oport_oport|71|0|126|0|{1|reject0|}54|56|}
{2010006001|XXGobject_psameas_object|72|0|128|0|{metadata|reject0_metadata|1|0|}56|54|}
{2010212001|XXGvertex_oport_oport|73|0|129|0|{2|error0|}54|57|}
{2010006001|XXGobject_psameas_object|74|0|131|0|{metadata|error0_metadata|1|0|}57|54|}
{2010212001|XXGvertex_oport_oport|75|0|132|0|{3|log|}54|58|}
{2010006001|XXGobject_psameas_object|76|0|134|0|{metadata|log_metadata|1|0|}58|54|}
{2010211001|XXGvertex_iport_iport|77|0|135|0|{0|in|}54|59|}
{2010006001|XXGobject_psameas_object|78|0|137|0|{metadata|in_metadata|1|0|}59|54|}
{2010006001|XXGobject_psameas_object|79|0|138|0|{Layout|Layout|0|0|}48|34|}
{2010006001|XXGobject_psameas_object|80|0|139|0|{in_metadata|read_metadata|0|0|}48|60|}
{2010212001|XXGvertex_oport_oport|81|0|141|0|{0|read|}60|61|}
{2010213001|XXGoport_dst_flow|82|0|143|0|{0|}61|9|}
{2010007001|XXGobject_proto_object|83|0|144|0|{}60|62|}
{2010212001|XXGvertex_oport_oport|84|0|146|0|{0|read|}62|63|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{metadata|read_metadata|1|0|}63|62|}
{2010006001|XXGobject_psameas_object|86|0|149|0|{reject0_metadata|read_metadata|0|0|}48|60|}
{2010006001|XXGobject_psameas_object|87|0|150|0|{out_metadata|out0_metadata|0|0|}28|48|}
{2010601001|XXGgraph_vertex_vertex|88|0|151|0|{Dedup_Sorted|}1|64|}
{2010212001|XXGvertex_oport_oport|89|0|153|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|90|0|155|0|{0|}65|11|}
{2010212001|XXGvertex_oport_oport|91|0|156|0|{1|dup|}64|66|}
{2010213001|XXGoport_dst_flow|92|0|158|0|{0|}66|17|}
{2010212001|XXGvertex_oport_oport|93|0|159|0|{2|reject|}64|67|}
{2010212001|XXGvertex_oport_oport|94|0|161|0|{3|error|}64|68|}
{2010212001|XXGvertex_oport_oport|95|0|163|0|{4|log|}64|69|}
{2010211001|XXGvertex_iport_iport|96|0|165|0|{0|in|}64|70|}
{2010214001|XXGiport_src_flow|97|0|167|0|{0|}70|15|}
{2010007001|XXGobject_proto_object|98|0|168|0|{}64|71|}
{2010212001|XXGvertex_oport_oport|99|0|170|0|{0|out|}71|72|}
{2010006001|XXGobject_psameas_object|100|0|172|0|{metadata|out_metadata|1|0|}72|71|}
{2010212001|XXGvertex_oport_oport|101|0|173|0|{1|dup|}71|73|}
{2010006001|XXGobject_psameas_object|102|0|175|0|{metadata|dup_metadata|1|0|}73|71|}
{2010212001|XXGvertex_oport_oport|103|0|176|0|{2|reject|}71|74|}
{2010006001|XXGobject_psameas_object|104|0|178|0|{metadata|reject_metadata|1|0|}74|71|}
{2010212001|XXGvertex_oport_oport|105|0|179|0|{3|error|}71|75|}
{2010006001|XXGobject_psameas_object|106|0|181|0|{metadata|error_metadata|1|0|}75|71|}
{2010212001|XXGvertex_oport_oport|107|0|182|0|{4|log|}71|76|}
{2010006001|XXGobject_psameas_object|108|0|184|0|{metadata|log_metadata|1|0|}76|71|}
{2010211001|XXGvertex_iport_iport|109|0|185|0|{0|in|}71|77|}
{2010006001|XXGobject_psameas_object|110|0|187|0|{metadata|in_metadata|1|0|}77|71|}
{2010006001|XXGobject_psameas_object|111|0|188|0|{Layout|Layout|0|0|}64|78|}
{2010211001|XXGvertex_iport_iport|112|0|190|0|{0|write|}78|79|}
{2010214001|XXGiport_src_flow|113|0|192|0|{0|}79|17|}
{2010007001|XXGobject_proto_object|114|0|193|0|{}78|80|}
{2010211001|XXGvertex_iport_iport|115|0|195|0|{0|write|}80|81|}
{2010006001|XXGobject_psameas_object|116|0|197|0|{metadata|write_metadata|1|0|}81|80|}
{2010006001|XXGobject_psameas_object|117|0|198|0|{write_metadata|read_metadata|0|0|}78|82|}
{2010212001|XXGvertex_oport_oport|118|0|200|0|{0|read|}82|83|}
{2010213001|XXGoport_dst_flow|119|0|202|0|{0|}83|7|}
{2010007001|XXGobject_proto_object|120|0|203|0|{}82|84|}
{2010212001|XXGvertex_oport_oport|121|0|205|0|{0|read|}84|85|}
{2010006001|XXGobject_psameas_object|122|0|207|0|{metadata|read_metadata|1|0|}85|84|}
{2010006001|XXGobject_psameas_object|123|0|208|0|{dup_metadata|read_metadata|0|0|}64|82|}
{2010006001|XXGobject_psameas_object|124|0|209|0|{in_metadata|read_metadata|0|0|}64|82|}
{2010006001|XXGobject_psameas_object|125|0|210|0|{out_metadata|read_metadata|0|0|}64|82|}
{2010006001|XXGobject_psameas_object|126|0|211|0|{reject_metadata|read_metadata|0|0|}64|82|}
{2010601001|XXGgraph_vertex_vertex|127|0|212|0|{Dedup_Sorted_1|}1|86|}
{2010212001|XXGvertex_oport_oport|128|0|214|0|{0|out|}86|87|}
{2010213001|XXGoport_dst_flow|129|0|216|0|{0|}87|22|}
{2010212001|XXGvertex_oport_oport|130|0|217|0|{1|dup|}86|88|}
{2010212001|XXGvertex_oport_oport|131|0|219|0|{2|reject|}86|89|}
{2010212001|XXGvertex_oport_oport|132|0|221|0|{3|error|}86|90|}
{2010212001|XXGvertex_oport_oport|133|0|223|0|{4|log|}86|91|}
{2010211001|XXGvertex_iport_iport|134|0|225|0|{0|in|}86|92|}
{2010214001|XXGiport_src_flow|135|0|227|0|{0|}92|21|}
{2010007001|XXGobject_proto_object|136|0|228|0|{}86|93|}
{2010212001|XXGvertex_oport_oport|137|0|230|0|{0|out|}93|94|}
{2010006001|XXGobject_psameas_object|138|0|232|0|{metadata|out_metadata|1|0|}94|93|}
{2010212001|XXGvertex_oport_oport|139|0|233|0|{1|dup|}93|95|}
{2010006001|XXGobject_psameas_object|140|0|235|0|{metadata|dup_metadata|1|0|}95|93|}
{2010212001|XXGvertex_oport_oport|141|0|236|0|{2|reject|}93|96|}
{2010006001|XXGobject_psameas_object|142|0|238|0|{metadata|reject_metadata|1|0|}96|93|}
{2010212001|XXGvertex_oport_oport|143|0|239|0|{3|error|}93|97|}
{2010006001|XXGobject_psameas_object|144|0|241|0|{metadata|error_metadata|1|0|}97|93|}
{2010212001|XXGvertex_oport_oport|145|0|242|0|{4|log|}93|98|}
{2010006001|XXGobject_psameas_object|146|0|244|0|{metadata|log_metadata|1|0|}98|93|}
{2010211001|XXGvertex_iport_iport|147|0|245|0|{0|in|}93|99|}
{2010006001|XXGobject_psameas_object|148|0|247|0|{metadata|in_metadata|1|0|}99|93|}
{2010006001|XXGobject_psameas_object|149|0|248|0|{Layout|Layout|0|0|}86|34|}
{2010006001|XXGobject_psameas_object|150|0|249|0|{dup_metadata|read_metadata|0|0|}86|60|}
{2010006001|XXGobject_psameas_object|151|0|250|0|{in_metadata|read_metadata|0|0|}86|60|}
{2010006001|XXGobject_psameas_object|152|0|251|0|{out_metadata|read_metadata|0|0|}86|60|}
{2010006001|XXGobject_psameas_object|153|0|252|0|{reject_metadata|read_metadata|0|0|}86|60|}
{2010601001|XXGgraph_vertex_vertex|154|0|253|0|{Dummy_Replicate|}1|100|}
{2010212001|XXGvertex_oport_oport|155|0|255|0|{0|out|}100|101|}
{2010213001|XXGoport_dst_flow|156|0|257|0|{0|}101|10|}
{2010211001|XXGvertex_iport_iport|157|0|258|0|{0|in|}100|102|}
{2010214001|XXGiport_src_flow|158|0|260|0|{0|}102|24|}
{2010214001|XXGiport_src_flow|159|0|261|0|{1|}102|8|}
{2010007001|XXGobject_proto_object|160|0|262|0|{}100|103|}
{2010212001|XXGvertex_oport_oport|161|0|264|0|{0|out|}103|104|}
{2010006001|XXGobject_psameas_object|162|0|266|0|{metadata|out_metadata|1|0|}104|103|}
{2010211001|XXGvertex_iport_iport|163|0|267|0|{0|in|}103|105|}
{2010006001|XXGobject_psameas_object|164|0|269|0|{metadata|in_metadata|1|0|}105|103|}
{2010006001|XXGobject_psameas_object|165|0|270|0|{Layout|Layout|0|0|}100|60|}
{2010006001|XXGobject_psameas_object|166|0|271|0|{in_metadata|read_metadata|0|0|}100|60|}
{2010006001|XXGobject_psameas_object|167|0|272|0|{out_metadata|read_metadata|0|0|}100|60|}
{2010601001|XXGgraph_vertex_vertex|168|0|273|0|{Existing_IDS_ICFF|}1|82|}
{2010601001|XXGgraph_vertex_vertex|169|0|274|0|{Existing_XREF|}1|60|}
{2010601001|XXGgraph_vertex_vertex|170|0|275|0|{Filter_by_Expression|}1|106|}
{2010212001|XXGvertex_oport_oport|171|0|277|0|{0|out|}106|107|}
{2010213001|XXGoport_dst_flow|172|0|279|0|{0|}107|23|}
{2010212001|XXGvertex_oport_oport|173|0|280|0|{1|deselect|}106|108|}
{2010213001|XXGoport_dst_flow|174|0|282|0|{0|}108|26|}
{2010212001|XXGvertex_oport_oport|175|0|283|0|{2|reject|}106|109|}
{2010212001|XXGvertex_oport_oport|176|0|285|0|{3|error|}106|110|}
{2010212001|XXGvertex_oport_oport|177|0|287|0|{4|log|}106|111|}
{2010211001|XXGvertex_iport_iport|178|0|289|0|{0|in|}106|112|}
{2010214001|XXGiport_src_flow|179|0|291|0|{0|}112|7|}
{2010007001|XXGobject_proto_object|180|0|292|0|{}106|113|}
{2010212001|XXGvertex_oport_oport|181|0|294|0|{0|out|}113|114|}
{2010006001|XXGobject_psameas_object|182|0|296|0|{metadata|out_metadata|1|0|}114|113|}
{2010212001|XXGvertex_oport_oport|183|0|297|0|{1|deselect|}113|115|}
{2010006001|XXGobject_psameas_object|184|0|299|0|{metadata|deselect_metadata|1|0|}115|113|}
{2010212001|XXGvertex_oport_oport|185|0|300|0|{2|reject|}113|116|}
{2010006001|XXGobject_psameas_object|186|0|302|0|{metadata|reject_metadata|1|0|}116|113|}
{2010212001|XXGvertex_oport_oport|187|0|303|0|{3|error|}113|117|}
{2010006001|XXGobject_psameas_object|188|0|305|0|{metadata|error_metadata|1|0|}117|113|}
{2010212001|XXGvertex_oport_oport|189|0|306|0|{4|log|}113|118|}
{2010006001|XXGobject_psameas_object|190|0|308|0|{metadata|log_metadata|1|0|}118|113|}
{2010211001|XXGvertex_iport_iport|191|0|309|0|{0|in|}113|119|}
{2010006001|XXGobject_psameas_object|192|0|311|0|{metadata|in_metadata|1|0|}119|113|}
{2010006001|XXGobject_psameas_object|193|0|312|0|{Layout|Layout|0|0|}106|82|}
{2010006001|XXGobject_psameas_object|194|0|313|0|{deselect_metadata|read_metadata|0|0|}106|82|}
{2010006001|XXGobject_psameas_object|195|0|314|0|{in_metadata|read_metadata|0|0|}106|82|}
{2010006001|XXGobject_psameas_object|196|0|315|0|{out_metadata|read_metadata|0|0|}106|82|}
{2010006001|XXGobject_psameas_object|197|0|316|0|{reject_metadata|read_metadata|0|0|}106|82|}
{2010601001|XXGgraph_vertex_vertex|198|0|317|0|{Filter_by_Expression_1|}1|120|}
{2010212001|XXGvertex_oport_oport|199|0|319|0|{0|out|}120|121|}
{2010213001|XXGoport_dst_flow|200|0|321|0|{0|}121|27|}
{2010212001|XXGvertex_oport_oport|201|0|322|0|{1|deselect|}120|122|}
{2010213001|XXGoport_dst_flow|202|0|324|0|{0|}122|8|}
{2010212001|XXGvertex_oport_oport|203|0|325|0|{2|reject|}120|123|}
{2010212001|XXGvertex_oport_oport|204|0|327|0|{3|error|}120|124|}
{2010212001|XXGvertex_oport_oport|205|0|329|0|{4|log|}120|125|}
{2010211001|XXGvertex_iport_iport|206|0|331|0|{0|in|}120|126|}
{2010214001|XXGiport_src_flow|207|0|333|0|{0|}126|9|}
{2010007001|XXGobject_proto_object|208|0|334|0|{}120|127|}
{2010212001|XXGvertex_oport_oport|209|0|336|0|{0|out|}127|128|}
{2010006001|XXGobject_psameas_object|210|0|338|0|{metadata|out_metadata|1|0|}128|127|}
{2010212001|XXGvertex_oport_oport|211|0|339|0|{1|deselect|}127|129|}
{2010006001|XXGobject_psameas_object|212|0|341|0|{metadata|deselect_metadata|1|0|}129|127|}
{2010212001|XXGvertex_oport_oport|213|0|342|0|{2|reject|}127|130|}
{2010006001|XXGobject_psameas_object|214|0|344|0|{metadata|reject_metadata|1|0|}130|127|}
{2010212001|XXGvertex_oport_oport|215|0|345|0|{3|error|}127|131|}
{2010006001|XXGobject_psameas_object|216|0|347|0|{metadata|error_metadata|1|0|}131|127|}
{2010212001|XXGvertex_oport_oport|217|0|348|0|{4|log|}127|132|}
{2010006001|XXGobject_psameas_object|218|0|350|0|{metadata|log_metadata|1|0|}132|127|}
{2010211001|XXGvertex_iport_iport|219|0|351|0|{0|in|}127|133|}
{2010006001|XXGobject_psameas_object|220|0|353|0|{metadata|in_metadata|1|0|}133|127|}
{2010006001|XXGobject_psameas_object|221|0|354|0|{Layout|Layout|0|0|}120|60|}
{2010006001|XXGobject_psameas_object|222|0|355|0|{deselect_metadata|read_metadata|0|0|}120|60|}
{2010006001|XXGobject_psameas_object|223|0|356|0|{in_metadata|read_metadata|0|0|}120|60|}
{2010006001|XXGobject_psameas_object|224|0|357|0|{out_metadata|read_metadata|0|0|}120|60|}
{2010006001|XXGobject_psameas_object|225|0|358|0|{reject_metadata|read_metadata|0|0|}120|60|}
{2010601001|XXGgraph_vertex_vertex|226|0|359|0|{IDS_ICFF_Data_File|}1|134|}
{2010211001|XXGvertex_iport_iport|227|0|361|0|{0|write|}134|135|}
{2010214001|XXGiport_src_flow|228|0|363|0|{0|}135|13|}
{2010007001|XXGobject_proto_object|229|0|364|0|{}134|136|}
{2010211001|XXGvertex_iport_iport|230|0|366|0|{0|write|}136|137|}
{2010006001|XXGobject_psameas_object|231|0|368|0|{metadata|write_metadata|1|0|}137|136|}
{2010601001|XXGgraph_vertex_vertex|232|0|369|0|{IDS_ICFF_Index_File|}1|138|}
{2010211001|XXGvertex_iport_iport|233|0|371|0|{0|write|}138|139|}
{2010214001|XXGiport_src_flow|234|0|373|0|{0|}139|14|}
{2010007001|XXGobject_proto_object|235|0|374|0|{}138|140|}
{2010211001|XXGvertex_iport_iport|236|0|376|0|{0|write|}140|141|}
{2010006001|XXGobject_psameas_object|237|0|378|0|{metadata|write_metadata|1|0|}141|140|}
{2010006001|XXGobject_psameas_object|238|0|379|0|{write_metadata|index_metadata|0|0|}138|142|}
{2010212001|XXGvertex_oport_oport|239|0|381|0|{0|out|}142|143|}
{2010213001|XXGoport_dst_flow|240|0|383|0|{0|}143|13|}
{2010212001|XXGvertex_oport_oport|241|0|384|0|{1|index|}142|144|}
{2010213001|XXGoport_dst_flow|242|0|386|0|{0|}144|14|}
{2010212001|XXGvertex_oport_oport|243|0|387|0|{2|address|}142|145|}
{2010211001|XXGvertex_iport_iport|244|0|389|0|{0|in|}142|146|}
{2010214001|XXGiport_src_flow|245|0|391|0|{0|}146|16|}
{2010007001|XXGobject_proto_object|246|0|392|0|{}142|147|}
{2010212001|XXGvertex_oport_oport|247|0|394|0|{0|out|}147|148|}
{2010006001|XXGobject_psameas_object|248|0|396|0|{metadata|out_metadata|1|0|}148|147|}
{2010212001|XXGvertex_oport_oport|249|0|397|0|{1|index|}147|149|}
{2010006001|XXGobject_psameas_object|250|0|399|0|{metadata|index_metadata|1|0|}149|147|}
{2010212001|XXGvertex_oport_oport|251|0|400|0|{2|address|}147|150|}
{2010006001|XXGobject_psameas_object|252|0|402|0|{metadata|address_metadata|1|0|}150|147|}
{2010211001|XXGvertex_iport_iport|253|0|403|0|{0|in|}147|151|}
{2010006001|XXGobject_psameas_object|254|0|405|0|{metadata|in_metadata|1|0|}151|147|}
{2010006001|XXGobject_psameas_object|255|0|406|0|{Layout|Layout|0|0|}142|134|}
{2010006001|XXGobject_psameas_object|256|0|407|0|{in_metadata|read_metadata|0|0|}142|82|}
{2010006001|XXGobject_psameas_object|257|0|408|0|{out_metadata|write_metadata|0|0|}142|134|}
{2010601001|XXGgraph_vertex_vertex|258|0|409|0|{Input_File|}1|78|}
{2010601001|XXGgraph_vertex_vertex|259|0|410|0|{Lookup_File|}1|152|}
{2010007001|XXGobject_proto_object|260|0|412|0|{}152|153|}
{2010601001|XXGgraph_vertex_vertex|261|0|414|0|{Partition_by_Key_and_Sort|}1|154|}
{2010604001|XXGgraph_flow_flow|262|0|416|0|{Flow_1|}154|155|}
{2010601001|XXGgraph_vertex_vertex|263|0|418|0|{Partition_by_Key|}154|156|}
{2010212001|XXGvertex_oport_oport|264|0|420|0|{0|out|}156|157|}
{2010213001|XXGoport_dst_flow|265|0|422|0|{0|}157|155|}
{2010211001|XXGvertex_iport_iport|266|0|423|0|{0|in|}156|158|}
{2010006001|XXGobject_psameas_object|267|0|425|0|{in_metadata|read_metadata|0|0|}156|60|}
{2010006001|XXGobject_psameas_object|268|0|426|0|{out_metadata|read_metadata|0|0|}156|60|}
{2010601001|XXGgraph_vertex_vertex|269|0|427|0|{Sort|}154|159|}
{2010212001|XXGvertex_oport_oport|270|0|429|0|{0|out|}159|160|}
{2010211001|XXGvertex_iport_iport|271|0|431|0|{0|in|}159|161|}
{2010214001|XXGiport_src_flow|272|0|433|0|{0|}161|155|}
{2010006001|XXGobject_psameas_object|273|0|434|0|{in_metadata|read_metadata|0|0|}159|60|}
{2010006001|XXGobject_psameas_object|274|0|435|0|{out_metadata|read_metadata|0|0|}159|60|}
{2010212001|XXGvertex_oport_oport|275|0|436|0|{0|out0|}154|162|}
{2010216002|XXGoport_binding_oport|276|0|438|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}162|160|}
{2010213001|XXGoport_dst_flow|277|0|439|0|{0|}162|21|}
{2010211001|XXGvertex_iport_iport|278|0|440|0|{0|in0|}154|163|}
{2010215002|XXGiport_binding_iport|279|0|442|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}163|158|}
{2010214001|XXGiport_src_flow|280|0|443|0|{0|}163|10|}
{2010007001|XXGobject_proto_object|281|0|444|0|{}154|164|}
{2010604001|XXGgraph_flow_flow|282|0|446|0|{Flow_1|}164|165|}
{2010601001|XXGgraph_vertex_vertex|283|0|448|0|{Partition_by_Key|}164|166|}
{2010212001|XXGvertex_oport_oport|284|0|450|0|{0|out|}166|167|}
{2010213001|XXGoport_dst_flow|285|0|452|0|{0|}167|165|}
{2010211001|XXGvertex_iport_iport|286|0|453|0|{0|in|}166|168|}
{2010007001|XXGobject_proto_object|287|0|455|0|{}166|169|}
{2010212001|XXGvertex_oport_oport|288|0|457|0|{0|out|}169|170|}
{2010006001|XXGobject_psameas_object|289|0|459|0|{metadata|out_metadata|1|0|}170|169|}
{2010211001|XXGvertex_iport_iport|290|0|460|0|{0|in|}169|171|}
{2010006001|XXGobject_psameas_object|291|0|462|0|{metadata|in_metadata|1|0|}171|169|}
{2010006001|XXGobject_psameas_object|292|0|463|0|{Layout|InputLayout|1|0|}166|164|}
{2010006001|XXGobject_psameas_object|293|0|464|0|{key|Key|1|0|}166|164|}
{2010601001|XXGgraph_vertex_vertex|294|0|465|0|{Sort|}164|172|}
{2010212001|XXGvertex_oport_oport|295|0|467|0|{0|out|}172|173|}
{2010211001|XXGvertex_iport_iport|296|0|469|0|{0|in|}172|174|}
{2010214001|XXGiport_src_flow|297|0|471|0|{0|}174|165|}
{2010007001|XXGobject_proto_object|298|0|472|0|{}172|175|}
{2010212001|XXGvertex_oport_oport|299|0|474|0|{0|out|}175|176|}
{2010006001|XXGobject_psameas_object|300|0|476|0|{metadata|out_metadata|1|0|}176|175|}
{2010211001|XXGvertex_iport_iport|301|0|477|0|{0|in|}175|177|}
{2010006001|XXGobject_psameas_object|302|0|479|0|{metadata|in_metadata|1|0|}177|175|}
{2010006001|XXGobject_psameas_object|303|0|480|0|{Layout|OutputLayout|1|0|}172|164|}
{2010006001|XXGobject_psameas_object|304|0|481|0|{key|Key|1|0|}172|164|}
{2010006001|XXGobject_psameas_object|305|0|482|0|{max_core|Max_core|1|0|}172|164|}
{2010212001|XXGvertex_oport_oport|306|0|483|0|{0|out0|}164|178|}
{2010216002|XXGoport_binding_oport|307|0|485|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}178|173|}
{2010211001|XXGvertex_iport_iport|308|0|486|0|{0|in0|}164|179|}
{2010215002|XXGiport_binding_iport|309|0|488|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}179|168|}
{2010006001|XXGobject_psameas_object|310|0|489|0|{InputLayout|Layout|0|0|}154|60|}
{2010006001|XXGobject_psameas_object|311|0|490|0|{OutputLayout|Layout|0|0|}154|34|}
{2010601001|XXGgraph_vertex_vertex|312|0|491|0|{Partition_by_Key_and_Sort_4|}1|180|}
{2010604001|XXGgraph_flow_flow|313|0|493|0|{Flow_1|}180|181|}
{2010601001|XXGgraph_vertex_vertex|314|0|495|0|{Partition_by_Key|}180|182|}
{2010212001|XXGvertex_oport_oport|315|0|497|0|{0|out|}182|183|}
{2010213001|XXGoport_dst_flow|316|0|499|0|{0|}183|181|}
{2010211001|XXGvertex_iport_iport|317|0|500|0|{0|in|}182|184|}
{2010006001|XXGobject_psameas_object|318|0|502|0|{in_metadata|read_metadata|0|0|}182|82|}
{2010006001|XXGobject_psameas_object|319|0|503|0|{out_metadata|read_metadata|0|0|}182|82|}
{2010601001|XXGgraph_vertex_vertex|320|0|504|0|{Sort|}180|185|}
{2010212001|XXGvertex_oport_oport|321|0|506|0|{0|out|}185|186|}
{2010211001|XXGvertex_iport_iport|322|0|508|0|{0|in|}185|187|}
{2010214001|XXGiport_src_flow|323|0|510|0|{0|}187|181|}
{2010006001|XXGobject_psameas_object|324|0|511|0|{in_metadata|read_metadata|0|0|}185|82|}
{2010006001|XXGobject_psameas_object|325|0|512|0|{out_metadata|read_metadata|0|0|}185|82|}
{2010212001|XXGvertex_oport_oport|326|0|513|0|{0|out0|}180|188|}
{2010216002|XXGoport_binding_oport|327|0|515|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}188|186|}
{2010213001|XXGoport_dst_flow|328|0|516|0|{0|}188|12|}
{2010211001|XXGvertex_iport_iport|329|0|517|0|{0|in0|}180|189|}
{2010215002|XXGiport_binding_iport|330|0|519|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}189|184|}
{2010214001|XXGiport_src_flow|331|0|520|0|{0|}189|18|}
{2010214001|XXGiport_src_flow|332|0|521|0|{1|}189|26|}
{2010007001|XXGobject_proto_object|333|0|522|0|{}180|190|}
{2010604001|XXGgraph_flow_flow|334|0|524|0|{Flow_1|}190|191|}
{2010601001|XXGgraph_vertex_vertex|335|0|526|0|{Partition_by_Key|}190|192|}
{2010212001|XXGvertex_oport_oport|336|0|528|0|{0|out|}192|193|}
{2010213001|XXGoport_dst_flow|337|0|530|0|{0|}193|191|}
{2010211001|XXGvertex_iport_iport|338|0|531|0|{0|in|}192|194|}
{2010007001|XXGobject_proto_object|339|0|533|0|{}192|195|}
{2010212001|XXGvertex_oport_oport|340|0|535|0|{0|out|}195|196|}
{2010006001|XXGobject_psameas_object|341|0|537|0|{metadata|out_metadata|1|0|}196|195|}
{2010211001|XXGvertex_iport_iport|342|0|538|0|{0|in|}195|197|}
{2010006001|XXGobject_psameas_object|343|0|540|0|{metadata|in_metadata|1|0|}197|195|}
{2010006001|XXGobject_psameas_object|344|0|541|0|{Layout|InputLayout|1|0|}192|190|}
{2010006001|XXGobject_psameas_object|345|0|542|0|{key|Key|1|0|}192|190|}
{2010601001|XXGgraph_vertex_vertex|346|0|543|0|{Sort|}190|198|}
{2010212001|XXGvertex_oport_oport|347|0|545|0|{0|out|}198|199|}
{2010211001|XXGvertex_iport_iport|348|0|547|0|{0|in|}198|200|}
{2010214001|XXGiport_src_flow|349|0|549|0|{0|}200|191|}
{2010007001|XXGobject_proto_object|350|0|550|0|{}198|201|}
{2010212001|XXGvertex_oport_oport|351|0|552|0|{0|out|}201|202|}
{2010006001|XXGobject_psameas_object|352|0|554|0|{metadata|out_metadata|1|0|}202|201|}
{2010211001|XXGvertex_iport_iport|353|0|555|0|{0|in|}201|203|}
{2010006001|XXGobject_psameas_object|354|0|557|0|{metadata|in_metadata|1|0|}203|201|}
{2010006001|XXGobject_psameas_object|355|0|558|0|{Layout|OutputLayout|1|0|}198|190|}
{2010006001|XXGobject_psameas_object|356|0|559|0|{key|Key|1|0|}198|190|}
{2010006001|XXGobject_psameas_object|357|0|560|0|{max_core|Max_core|1|0|}198|190|}
{2010212001|XXGvertex_oport_oport|358|0|561|0|{0|out0|}190|204|}
{2010216002|XXGoport_binding_oport|359|0|563|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}204|199|}
{2010211001|XXGvertex_iport_iport|360|0|564|0|{0|in0|}190|205|}
{2010215002|XXGiport_binding_iport|361|0|566|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}205|194|}
{2010006001|XXGobject_psameas_object|362|0|567|0|{InputLayout|Layout|0|0|}180|82|}
{2010006001|XXGobject_psameas_object|363|0|568|0|{OutputLayout|Layout|0|0|}180|78|}
{2010601001|XXGgraph_vertex_vertex|364|0|569|0|{Partition_by_Key_and_Sort_5|}1|206|}
{2010604001|XXGgraph_flow_flow|365|0|571|0|{Flow_1|}206|207|}
{2010601001|XXGgraph_vertex_vertex|366|0|573|0|{Partition_by_Key|}206|208|}
{2010212001|XXGvertex_oport_oport|367|0|575|0|{0|out|}208|209|}
{2010213001|XXGoport_dst_flow|368|0|577|0|{0|}209|207|}
{2010211001|XXGvertex_iport_iport|369|0|578|0|{0|in|}208|210|}
{2010006001|XXGobject_psameas_object|370|0|580|0|{in_metadata|read_metadata|0|0|}208|82|}
{2010006001|XXGobject_psameas_object|371|0|581|0|{out_metadata|read_metadata|0|0|}208|82|}
{2010601001|XXGgraph_vertex_vertex|372|0|582|0|{Sort|}206|211|}
{2010212001|XXGvertex_oport_oport|373|0|584|0|{0|out|}211|212|}
{2010211001|XXGvertex_iport_iport|374|0|586|0|{0|in|}211|213|}
{2010214001|XXGiport_src_flow|375|0|588|0|{0|}213|207|}
{2010006001|XXGobject_psameas_object|376|0|589|0|{in_metadata|read_metadata|0|0|}211|82|}
{2010006001|XXGobject_psameas_object|377|0|590|0|{out_metadata|read_metadata|0|0|}211|82|}
{2010212001|XXGvertex_oport_oport|378|0|591|0|{0|out0|}206|214|}
{2010216002|XXGoport_binding_oport|379|0|593|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}214|212|}
{2010213001|XXGoport_dst_flow|380|0|594|0|{0|}214|16|}
{2010211001|XXGvertex_iport_iport|381|0|595|0|{0|in0|}206|215|}
{2010215002|XXGiport_binding_iport|382|0|597|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}215|210|}
{2010214001|XXGiport_src_flow|383|0|598|0|{0|}215|11|}
{2010007001|XXGobject_proto_object|384|0|599|0|{}206|216|}
{2010604001|XXGgraph_flow_flow|385|0|601|0|{Flow_1|}216|217|}
{2010601001|XXGgraph_vertex_vertex|386|0|603|0|{Partition_by_Key|}216|218|}
{2010212001|XXGvertex_oport_oport|387|0|605|0|{0|out|}218|219|}
{2010213001|XXGoport_dst_flow|388|0|607|0|{0|}219|217|}
{2010211001|XXGvertex_iport_iport|389|0|608|0|{0|in|}218|220|}
{2010007001|XXGobject_proto_object|390|0|610|0|{}218|221|}
{2010212001|XXGvertex_oport_oport|391|0|612|0|{0|out|}221|222|}
{2010006001|XXGobject_psameas_object|392|0|614|0|{metadata|out_metadata|1|0|}222|221|}
{2010211001|XXGvertex_iport_iport|393|0|615|0|{0|in|}221|223|}
{2010006001|XXGobject_psameas_object|394|0|617|0|{metadata|in_metadata|1|0|}223|221|}
{2010006001|XXGobject_psameas_object|395|0|618|0|{Layout|InputLayout|1|0|}218|216|}
{2010006001|XXGobject_psameas_object|396|0|619|0|{key|Key|1|0|}218|216|}
{2010601001|XXGgraph_vertex_vertex|397|0|620|0|{Sort|}216|224|}
{2010212001|XXGvertex_oport_oport|398|0|622|0|{0|out|}224|225|}
{2010211001|XXGvertex_iport_iport|399|0|624|0|{0|in|}224|226|}
{2010214001|XXGiport_src_flow|400|0|626|0|{0|}226|217|}
{2010007001|XXGobject_proto_object|401|0|627|0|{}224|227|}
{2010212001|XXGvertex_oport_oport|402|0|629|0|{0|out|}227|228|}
{2010006001|XXGobject_psameas_object|403|0|631|0|{metadata|out_metadata|1|0|}228|227|}
{2010211001|XXGvertex_iport_iport|404|0|632|0|{0|in|}227|229|}
{2010006001|XXGobject_psameas_object|405|0|634|0|{metadata|in_metadata|1|0|}229|227|}
{2010006001|XXGobject_psameas_object|406|0|635|0|{Layout|OutputLayout|1|0|}224|216|}
{2010006001|XXGobject_psameas_object|407|0|636|0|{key|Key|1|0|}224|216|}
{2010006001|XXGobject_psameas_object|408|0|637|0|{max_core|Max_core|1|0|}224|216|}
{2010212001|XXGvertex_oport_oport|409|0|638|0|{0|out0|}216|230|}
{2010216002|XXGoport_binding_oport|410|0|640|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}230|225|}
{2010211001|XXGvertex_iport_iport|411|0|641|0|{0|in0|}216|231|}
{2010215002|XXGiport_binding_iport|412|0|643|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}231|220|}
{2010006001|XXGobject_psameas_object|413|0|644|0|{InputLayout|Layout|0|0|}206|78|}
{2010006001|XXGobject_psameas_object|414|0|645|0|{OutputLayout|Layout|0|0|}206|134|}
{2010601001|XXGgraph_vertex_vertex|415|0|646|0|{Reformat|}1|232|}
{2010212001|XXGvertex_oport_oport|416|0|648|0|{0|out0|}232|233|}
{2010213001|XXGoport_dst_flow|417|0|650|0|{0|}233|18|}
{2010212001|XXGvertex_oport_oport|418|0|651|0|{1|reject0|}232|234|}
{2010212001|XXGvertex_oport_oport|419|0|653|0|{2|error0|}232|235|}
{2010212001|XXGvertex_oport_oport|420|0|655|0|{3|log|}232|236|}
{2010211001|XXGvertex_iport_iport|421|0|657|0|{0|in|}232|237|}
{2010214001|XXGiport_src_flow|422|0|659|0|{0|}237|23|}
{2010007001|XXGobject_proto_object|423|0|660|0|{}232|238|}
{2010212001|XXGvertex_oport_oport|424|0|662|0|{0|out0|}238|239|}
{2010006001|XXGobject_psameas_object|425|0|664|0|{metadata|out0_metadata|1|0|}239|238|}
{2010006001|XXGobject_psameas_object|426|0|665|0|{transform0|transform0|1|0|}239|238|}
{2010212001|XXGvertex_oport_oport|427|0|666|0|{1|reject0|}238|240|}
{2010006001|XXGobject_psameas_object|428|0|668|0|{metadata|reject0_metadata|1|0|}240|238|}
{2010212001|XXGvertex_oport_oport|429|0|669|0|{2|error0|}238|241|}
{2010006001|XXGobject_psameas_object|430|0|671|0|{metadata|error0_metadata|1|0|}241|238|}
{2010212001|XXGvertex_oport_oport|431|0|672|0|{3|log|}238|242|}
{2010006001|XXGobject_psameas_object|432|0|674|0|{metadata|log_metadata|1|0|}242|238|}
{2010211001|XXGvertex_iport_iport|433|0|675|0|{0|in|}238|243|}
{2010006001|XXGobject_psameas_object|434|0|677|0|{metadata|in_metadata|1|0|}243|238|}
{2010006001|XXGobject_psameas_object|435|0|678|0|{Layout|Layout|0|0|}232|82|}
{2010006001|XXGobject_psameas_object|436|0|679|0|{in_metadata|read_metadata|0|0|}232|82|}
{2010006001|XXGobject_psameas_object|437|0|680|0|{out0_metadata|read_metadata|0|0|}232|82|}
{2010006001|XXGobject_psameas_object|438|0|681|0|{reject0_metadata|read_metadata|0|0|}232|82|}
{2010601001|XXGgraph_vertex_vertex|439|0|682|0|{Reformat_1|}1|244|}
{2010212001|XXGvertex_oport_oport|440|0|684|0|{0|out0|}244|245|}
{2010213001|XXGoport_dst_flow|441|0|686|0|{0|}245|24|}
{2010212001|XXGvertex_oport_oport|442|0|687|0|{1|reject0|}244|246|}
{2010212001|XXGvertex_oport_oport|443|0|689|0|{2|error0|}244|247|}
{2010212001|XXGvertex_oport_oport|444|0|691|0|{3|log|}244|248|}
{2010211001|XXGvertex_iport_iport|445|0|693|0|{0|in|}244|249|}
{2010214001|XXGiport_src_flow|446|0|695|0|{0|}249|27|}
{2010007001|XXGobject_proto_object|447|0|696|0|{}244|250|}
{2010212001|XXGvertex_oport_oport|448|0|698|0|{0|out0|}250|251|}
{2010006001|XXGobject_psameas_object|449|0|700|0|{metadata|out0_metadata|1|0|}251|250|}
{2010006001|XXGobject_psameas_object|450|0|701|0|{transform0|transform0|1|0|}251|250|}
{2010212001|XXGvertex_oport_oport|451|0|702|0|{1|reject0|}250|252|}
{2010006001|XXGobject_psameas_object|452|0|704|0|{metadata|reject0_metadata|1|0|}252|250|}
{2010212001|XXGvertex_oport_oport|453|0|705|0|{2|error0|}250|253|}
{2010006001|XXGobject_psameas_object|454|0|707|0|{metadata|error0_metadata|1|0|}253|250|}
{2010212001|XXGvertex_oport_oport|455|0|708|0|{3|log|}250|254|}
{2010006001|XXGobject_psameas_object|456|0|710|0|{metadata|log_metadata|1|0|}254|250|}
{2010211001|XXGvertex_iport_iport|457|0|711|0|{0|in|}250|255|}
{2010006001|XXGobject_psameas_object|458|0|713|0|{metadata|in_metadata|1|0|}255|250|}
{2010006001|XXGobject_psameas_object|459|0|714|0|{Layout|Layout|0|0|}244|60|}
{2010006001|XXGobject_psameas_object|460|0|715|0|{in_metadata|read_metadata|0|0|}244|60|}
{2010006001|XXGobject_psameas_object|461|0|716|0|{out0_metadata|read_metadata|0|0|}244|60|}
{2010006001|XXGobject_psameas_object|462|0|717|0|{reject0_metadata|read_metadata|0|0|}244|60|}
{2010601001|XXGgraph_vertex_vertex|463|0|718|0|{Reformat_3|}1|48|}
{2010601001|XXGgraph_vertex_vertex|464|0|719|0|{Sort|}1|256|}
{2010212001|XXGvertex_oport_oport|465|0|721|0|{0|out|}256|257|}
{2010213001|XXGoport_dst_flow|466|0|723|0|{0|}257|20|}
{2010211001|XXGvertex_iport_iport|467|0|724|0|{0|in|}256|258|}
{2010214001|XXGiport_src_flow|468|0|726|0|{0|}258|19|}
{2010007001|XXGobject_proto_object|469|0|727|0|{}256|259|}
{2010212001|XXGvertex_oport_oport|470|0|729|0|{0|out|}259|260|}
{2010006001|XXGobject_psameas_object|471|0|731|0|{metadata|out_metadata|1|0|}260|259|}
{2010211001|XXGvertex_iport_iport|472|0|732|0|{0|in|}259|261|}
{2010006001|XXGobject_psameas_object|473|0|734|0|{metadata|in_metadata|1|0|}261|259|}
{2010006001|XXGobject_psameas_object|474|0|735|0|{Layout|Layout|0|0|}256|34|}
{2010006001|XXGobject_psameas_object|475|0|736|0|{in_metadata|out0_metadata|0|0|}256|48|}
{2010006001|XXGobject_psameas_object|476|0|737|0|{out_metadata|out0_metadata|0|0|}256|48|}
{2010601001|XXGgraph_vertex_vertex|477|0|738|0|{Sort_within_Groups|}1|262|}
{2010212001|XXGvertex_oport_oport|478|0|740|0|{0|out|}262|263|}
{2010213001|XXGoport_dst_flow|479|0|742|0|{0|}263|15|}
{2010211001|XXGvertex_iport_iport|480|0|743|0|{0|in|}262|264|}
{2010214001|XXGiport_src_flow|481|0|745|0|{0|}264|12|}
{2010007001|XXGobject_proto_object|482|0|746|0|{}262|265|}
{2010212001|XXGvertex_oport_oport|483|0|748|0|{0|out|}265|266|}
{2010006001|XXGobject_psameas_object|484|0|750|0|{metadata|out_metadata|1|0|}266|265|}
{2010211001|XXGvertex_iport_iport|485|0|751|0|{0|in|}265|267|}
{2010006001|XXGobject_psameas_object|486|0|753|0|{metadata|in_metadata|1|0|}267|265|}
{2010006001|XXGobject_psameas_object|487|0|754|0|{Layout|Layout|0|0|}262|78|}
{2010006001|XXGobject_psameas_object|488|0|755|0|{in_metadata|read_metadata|0|0|}262|82|}
{2010006001|XXGobject_psameas_object|489|0|756|0|{out_metadata|read_metadata|0|0|}262|82|}
{2010601001|XXGgraph_vertex_vertex|490|0|757|0|{Write_Block_Compressed_Lookup|}1|142|}
{2010601001|XXGgraph_vertex_vertex|491|0|758|0|{Write_Non_ICFF_Xref_LookUp|}1|268|}
{2010605001|XXGgraph_legend_legend|492|0|760|0|{0|}268|269|}
{2010241001|XXGlegend_face_face|493|0|762|0|{}269|270|}
{2010601001|XXGgraph_vertex_vertex|494|0|764|0|{for_MPP_Server_Architecture|}268|271|}
{2010605001|XXGgraph_legend_legend|495|0|766|0|{0|}271|272|}
{2010241001|XXGlegend_face_face|496|0|768|0|{}272|273|}
{2010604001|XXGgraph_flow_flow|497|0|770|0|{Flow_4|}271|41|}
{2010604001|XXGgraph_flow_flow|498|0|771|0|{Flow_5|}271|36|}
{2010601001|XXGgraph_vertex_vertex|499|0|772|0|{Write_Lookup|}271|39|}
{2010601001|XXGgraph_vertex_vertex|500|0|773|0|{Xref_Data_file|}271|274|}
{2010211001|XXGvertex_iport_iport|501|0|775|0|{0|write|}274|275|}
{2010214001|XXGiport_src_flow|502|0|777|0|{0|}275|41|}
{2010007001|XXGobject_proto_object|503|0|778|0|{}274|276|}
{2010211001|XXGvertex_iport_iport|504|0|780|0|{0|write|}276|277|}
{2010006001|XXGobject_psameas_object|505|0|782|0|{metadata|write_metadata|1|0|}277|276|}
{2010006001|XXGobject_psameas_object|506|0|783|0|{write_metadata|out_metadata|0|0|}274|39|}
{2010601001|XXGgraph_vertex_vertex|507|0|784|0|{Xref_Index_file|}271|34|}
{2010211001|XXGvertex_iport_iport|508|0|785|0|{0|in0|}271|278|}
{2010215002|XXGiport_binding_iport|509|0|787|0|{.5|.5|{0|}11031|}278|43|}
{2010211001|XXGvertex_iport_iport|510|0|788|0|{0|in0|}268|279|}
{2010215002|XXGiport_binding_iport|511|0|790|0|{.5|.5|{0|}10949|}279|278|}
{2010214001|XXGiport_src_flow|512|0|791|0|{0|}279|25|}
{2010109001|XXGobject_property_value|513|0|792|0|{0|TrackingThumbprint|72|}1|280|}
