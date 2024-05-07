@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|9|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|304|rel_count|553|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INCIDENT_NO|TSK003372552|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_NAME|d_member_eligibility|3|9|RFK|@{0|}}
{30001002|XXparameter|FLTR_EXPR|first_defined(carrier_id,'NA')=='SCUFCW'|3|9|FK||{0|}}
{30001002|XXparameter|WHERE_CLAUSE|carrier_id='SCUFCW'|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_QUERY|select * from $TABLE_NAME where $WHERE_CLAUSE|3|9|FK||{0|}}
{30001002|XXparameter|TABLE_DML|$DB_RXCLAIM_DML/rxclaim/rxclaim.$TABLE_NAME.dml|3|9|FK||{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|FK||{0|}}
{30001002|XXparameter|SUBJECT_AREA|$(if [ -e $PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/$TABLE_NAME.dat.gz ] 
then
echo "ids_common"
else
echo "ids_rxclaim"
fi
)|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES_HEADER|$(sed -n 12p $PUB_DXF_META/ids_table_properties.dat)|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_TABLE_PROPERTIES|$(awk -F "\|" -v var1=$SUBJECT_AREA.$TABLE_NAME '\{if($1==var1) print $0 \}' $PUB_DXF_META/ids_table_properties.dat)|3|9|RFK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$(echo $IDS_TABLE_PROPERTIES\|cut -d "\|" -f5)|3|9|RFK|@{0|}}
{30001002|XXparameter|PRIMARY_KEY|$(echo $IDS_TABLE_PROPERTIES\|cut -d "\|" -f4)|3|9|RFK|@{0|}}
{30001002|XXparameter|PRIMARY_KEY1|$[string_filter_out(PRIMARY_KEY,"\{\}")]|3|9|FK||{0|}}
{30001002|XXparameter|DO_DEFAULTING|True|13|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE_REQ|$(ls -lrt $PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.dat.gz \| wc -l)|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_ARCH_FILE_INDEX|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.archive.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/one/$\{TABLE_NAME\}.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SUBJECT_AREA/xref/xref.$\{TABLE_NAME\}.idx|3|9|RFK|@{0|}}
{30001002|XXparameter|HASH_RECORD|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = hash_key_combine_type;|7|9|K|Value will come from generic_data_types.dml file defined in PUB_DXF_DML location|{0|}}
{30001002|XXparameter|XREF_LOOKUP_TYPE_DML|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|7|9|RK|@{0|}}
{30001002|XXparameter|XREF_KEY_FILE_DML|$[join_types(HASH_RECORD,'record\\n integer(8) dxf_sk=0;  \\n end')]|3|9|FK||{0|}}
{30001002|XXparameter|TARGET_NK_DML|$\{PUB_DATAHUB_DML\}/$\{SUBJECT_AREA\}/$\{SUBJECT_AREA\}.$\{TABLE_NAME\}.dml|3|9|FK|@{0|}}
{30001002|XXparameter|JOIN_XFR|/*Join transform*/
out::join(in0,in1)=
begin
out.*::in1.*;
end;|3|9|FK|@{0|}}
{30001002|XXparameter|JOIN_KEY|$[
begin
result :: if(TABLE_NAME=="l_src_env") string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "insert_ts", "update_ts", "insert_uid", "update_uid", "newline"]), "name"), "; ")
else if (TABLE_NAME=="d_product") string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "spclty_prod_corp_ind", "spclty_prod_corp_nm","fdb_hicl_seq_no", "fdb_hic3_seq_no", "fdb_hic3_cd","insert_ts", "update_ts", "insert_uid", "update_uid", "run_id", "rec_stat_cd", "newline" ]), "name"), "; ")
else string_join(record_info_item(remove_fields(read_file(DB_RXCLAIM_DML + "/rxclaim/rxclaim." + TABLE_NAME + ".dml"), [vector "insert_ts", "update_ts", "insert_uid", "update_uid", "run_id", "rec_stat_cd", "newline" ]), "name"), "; ");
end
]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE1|$AI_SERIAL/$\{TABLE_NAME\}_table_data.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE|/etl/data/qa//serial/orca/rxclaim/main/sshaik70/$\{TABLE_NAME\}_table_data.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_ENTITY|$TABLE_NAME|3|9|FK||{0|}}
{30001002|XXparameter|IDS_META_STRING|$[SUBJECT_AREA + "." + TARGET_ENTITY]|3|9|FK|This string will be used to get value from ids meta property file|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|IS_WRITE_MFS_XREF_ICFF|$[if(get_ids_table_properties(IDS_META_STRING).storage_type=="icff") "Y" else "N" ]|3|9|FK|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_META_STRING)]|3|9|EFK|@{0|}}
{30001002|XXparameter|xx|$DXF_SERVER_ARCHITECTURE|3|9|RFK||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|d_member_diagnosis|gkudte|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1436000|674000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{2|1|1|}Job 'table_to_ids_d_member_diagnosis' Execution Status Report

Job completed successfully at Friday, January 12, 2024 10:37:53
Run performed by user gkudte
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Optum-QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}687|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}692|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|0.0|{0|}681|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}684|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}679|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|0.0|{0|}683|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|0.0|{0|}689|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|0.0|{0|}603|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@0|.5|.5|{0|}690|17|}}
{2010503005|XXGfvertex|14|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@1149000|344500|0|0|0|0|685|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|15|0|29|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|16|0|32|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|17|0|35|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|18|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|19|0|40|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|20|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@1161000|604500|0|0|0|0|686|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|21|0|45|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|22|0|48|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|23|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|24|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|869000|404500|0|0|0|0|682|Write Block-Compressed Lookup-1|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|25|0|55|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|26|0|58|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|27|0|61|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|28|0|63|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|29|0|66|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|30|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|31|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|32|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|33|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|34|0|81|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$PUB_DATAHUB_DML/nk/ids_rxclaim/ids_rxclaim.d_member_diagnosis.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, $"NATURAL_KEY"));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
 // out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
   out.dxf_sk::in.$PRIMARY_KEY1;
   out.ids_create_dttm::in.insert_ts;
   out.ids_create_run_id::in.run_id;
   out.ids_create_uid::in.insert_uid;
   out.ids_rec_stat_cd::in.rec_stat_cd;
   out.ids_updt_dttm::in.update_ts;
   out.ids_updt_run_id::in.run_id;
   out.ids_updt_uid::in.update_uid;
   out.dxf_src_sys_id::in.src_env_sk;
   
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|213000|175000|0|0|0|0|691|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|35|0|83|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|36|0|86|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|37|0|88|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|38|0|90|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|39|0|92|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|40|0|95|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|41|0|97|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|42|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|43|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|44|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010505005|XXGtvertex|46|0|113|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_N24_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$TABLE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|table_spec|$TABLE_QUERY|3|9||@{0|}}
}}@0|@59000|192500|0|0|0|0|693|IDW_TABLE_ODBC2-1|Ab Initio Software|Built-in 2.2:|1|100|0||6||36865|}}
{2010203004|XXGoport|47|0|115|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|48|0|118|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|49|0|120|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface sameas hana__interface sameas hbase__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family+colname|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|50|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|51|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|52|0|134|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@413000|181000|0|0|481000|303000|680|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|53|0|136|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|54|0|138|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|55|0|140|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|56|0|143|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|147|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|58|0|149|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|59|0|151|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|60|0|156|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|61|0|160|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|62|0|164|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|63|0|166|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|64|0|168|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|170|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|66|0|173|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|175|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|68|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|69|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|70|0|185|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|71|0|187|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|72|0|189|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|74|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|75|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|76|0|203|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|77|0|206|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|78|0|212|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$XREF_KEY_FILE_DML|3|9||@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.dxf_hk_part1 :: in.dxf_hk_part1;
  out.dxf_hk_part2 :: in.dxf_hk_part2;
  out.dxf_sk :: in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|760000|75000|0|0|0|0|604|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|79|0|214|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|80|0|217|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|81|0|219|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|82|0|221|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|223|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|226|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|85|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|86|0|232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|87|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|88|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|90|0|244|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|85000|0|0|0|0|10621|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|91|0|246|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|92|0|248|0|{@{}@384|.5|.5|{0|}10620|2065|}}
{2010202004|XXGiport|93|0|250|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|94|0|252|0|{@{}@384|.5|.5|{0|}10622|17|}}
{2010503005|XXGfvertex|95|0|254|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|96|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|97|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|98|0|264|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|654000|210000|0|0|0|0|577|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|99|0|266|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|100|0|270|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|101|0|273|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|102|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|103|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|104|0|284|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_NK_DML\}|3|2|f$|@{0|}}
}}@1|@1349000|344500|0|0|0|0|486|View Data-1|Ab Initio Software|@1|1000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|105|0|286|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|106|0|289|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|107|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|108|0|295|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
}}@0|@1214000|52500|0|0|0|0|688|Write Xref files|Mukesh Singh|Created 5/4/2016 8:35:29 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|972000|480000|3|}}
{2010240003|XXGlegend|109|0|297|0|{@{}@This kind of Xref will be created for very
 large dimension and FACT datasets|461000|28000|0|0|0|0|10705|}}
{2010242002|XXGface|110|0|299|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|111|0|301|0|{@{}@This kind of Xref will be created for small to medium 
 sized dimensions|451000|408000|0|0|0|0|10706|}}
{2010242002|XXGface|112|0|303|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|113|0|305|0|{@{}@384|.5|.5|{0|}10774|529|}}
{2010210004|XXGflow|114|0|307|0|{@{}@384|.5|.5|{0|}10834|17|}}
{2010210004|XXGflow|115|0|309|0|{@{}@384|.5|.5|{0|}10868|17|}}
{2010210004|XXGflow|116|0|311|0|{@{}@384|.5|.5|{0|}10866|17|}}
{2010501005|XXGpvertex|117|0|313|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|438000|211500|0|0|0|0|10775|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|118|0|315|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|119|0|319|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|120|0|322|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|121|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|122|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|123|0|331|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|81000|176500|0|0|0|0|10835|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|124|0|333|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|125|0|336|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|126|0|338|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|127|0|340|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|128|0|342|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|129|0|344|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|130|0|346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|131|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|132|0|353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|133|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|134|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|135|0|367|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|306000|215000|0|0|0|0|10765|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|136|0|369|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|137|0|372|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|138|0|375|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|139|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|140|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|141|0|386|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@589000|70000|0|0|0|0|10869|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|631000|309000|3|}}
{2010210004|XXGflow|142|0|390|0|{@{}@384|.5|.5|{0|}10617|17|}}
{2010503005|XXGfvertex|143|0|392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@1|@514000|85000|0|0|0|0|10571|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|144|0|394|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|145|0|397|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|146|0|399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|147|0|402|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|45000|100000|0|0|0|0|10608|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|148|0|404|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|149|0|407|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|150|0|410|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|151|0|412|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|152|0|414|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|153|0|416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|154|0|419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|155|0|422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|156|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|157|0|432|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@354000|220000|0|0|0|0|10618|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|158|0|434|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|159|0|437|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|160|0|439|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|161|0|443|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|162|0|447|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="N" && DATASET_IDENTIFIER != "many" ]|3|9|F||{0|}}
}}@0|@597500|267000|0|0|0|0|10867|Write Non ICFF Xref LookUp|Mukesh Singh|Created 6/22/2016 2:01:24 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1466000|451000|3|}}
{2010240003|XXGlegend|163|0|449|0|{@{}@This type of xref is created only for 
dimensions that has less than 10m record

Write index do not support idx append , everytime a new index file has to be created|18000|36000|0|0|0|0|10783|}}
{2010242002|XXGface|164|0|451|0|{@{}@Arial|32768|100|1|}}
{2010210004|XXGflow|165|0|453|0|{@{}@384|.5|.5|{0|}10960|529|}}
{2010210004|XXGflow|166|0|455|0|{@{}@384|.5|.5|{0|}10970|17|}}
{2010210004|XXGflow|167|0|457|0|{@{}@384|.5|.5|{0|}10972|17|}}
{2010501005|XXGpvertex|168|0|459|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.dxf_hk.dxf_hk_part1 :: in.dxf_hk_part1;
  out.dxf_hk.dxf_hk_part2 :: in.dxf_hk_part2;
  out.dxf_sk :: in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|100000|175000|0|0|0|0|10891|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|169|0|461|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|170|0|464|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|171|0|466|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|172|0|468|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|173|0|470|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|174|0|472|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|175|0|474|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|176|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|177|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|178|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|179|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|492|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@1|Write Lookup|601000|90000|0|0|0|0|11018|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|181|0|494|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|182|0|496|0|{@{}@384|.5|.5|{0|}11021|17|}}
{2010203004|XXGoport|183|0|498|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010210004|XXGflow|184|0|500|0|{@{}@384|.5|.5|{0|}11023|17|}}
{2010202004|XXGiport|185|0|502|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|186|0|504|0|{@{}@384|.5|.5|{0|}10985|17|}}
{2010501005|XXGpvertex|187|0|506|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|188|0|508|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|189|0|511|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|190|0|515|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|191|0|518|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@1|@855000|220000|0|0|0|0|11024|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|192|0|520|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|193|0|523|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|194|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|195|0|531|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|327000|195000|0|0|0|0|10963|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|196|0|533|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|197|0|537|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|198|0|540|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|199|0|542|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|200|0|545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|201|0|551|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="MPP"]|3|9|F||{0|}}
}}@0|@623500|62500|0|0|0|0|10971|for MPP Server Architecture|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|912000|427000|3|}}
{2010240003|XXGlegend|202|0|553|0|{@{}@This file will only read one partition of data , since every partion 
will have same data due to usage of brodcast while creating main data file|16000|340000|0|0|0|0|10889|}}
{2010242002|XXGface|203|0|555|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|204|0|557|0|{@{}@384|.5|.5|{0|}10867|1041|}}
{2010210004|XXGflow|205|0|559|0|{@{}@384|.5|.5|{0|}10900|17|}}
{2010210004|XXGflow|206|0|561|0|{@{}@384|.5|.5|{0|}10954|17|}}
{2010210004|XXGflow|207|0|563|0|{@{}@384|.5|.5|{0|}10960|17|}}
{2010210004|XXGflow|208|0|565|0|{@{}@384|.5|.5|{0|}10962|17|}}
{2010210004|XXGflow|209|0|567|0|{@{}@384|.5|.5|{0|}10899|17|}}
{2010210004|XXGflow|210|0|569|0|{@{}@384|.5|.5|{0|}10937|20|}}
{2010210004|XXGflow|211|0|571|0|{@{}@384|.5|.5|{0|}10905|1044|}}
{2010501005|XXGpvertex|212|0|573|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|470000|115000|0|0|0|0|10871|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|213|0|575|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|214|0|578|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|215|0|581|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|216|0|583|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|217|0|586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|218|0|590|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@1|Write Lookup|586000|85000|0|0|0|0|10949|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|219|0|592|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|220|0|595|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|221|0|598|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|222|0|601|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|223|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|224|0|606|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|225|0|610|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|226|0|613|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@1|@795000|190000|0|0|0|0|10963|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|227|0|615|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|228|0|618|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|229|0|620|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|230|0|626|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|245000|115000|0|0|0|0|10859|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|231|0|628|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|232|0|631|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|233|0|635|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|234|0|637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|235|0|640|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|236|0|646|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|215000|250000|0|0|0|0|10906|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|237|0|648|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|238|0|651|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|239|0|654|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
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
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|240|0|656|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|241|0|659|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|242|0|662|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INPUT_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_INPUT_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[XREF_FILE_EXIST]|3|9||@{0|}}
}}@0|@56000|240000|0|0|0|0|10955|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|243|0|664|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|244|0|667|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|245|0|669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|246|0|676|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|98000|106500|0|0|0|0|10866|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|247|0|678|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|248|0|681|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|249|0|683|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|250|0|685|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|251|0|688|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|252|0|694|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|321000|92500|0|0|0|0|10901|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|253|0|696|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|254|0|699|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|255|0|702|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|256|0|704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|257|0|707|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|258|0|714|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@1|@791000|85000|0|0|0|0|10961|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|259|0|716|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|260|0|719|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|261|0|721|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|262|0|726|0|{@{}@0|0|0|0|in0|.49848024316109424|@@@13840|0|}}
{2010600005|XXGgraph|263|0|730|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="SMP"]|3|9|F||{0|}}
}}@0|@628500|237500|0|0|0|0|10973|for SMP Server Architecture|Mukesh Singh|Created 6/24/2016 3:07:05 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|955000|351000|3|}}
{2010210004|XXGflow|264|0|732|0|{@{}@384|.5|.5|{0|}11019|17|}}
{2010210004|XXGflow|265|0|734|0|{@{}@384|.5|.5|{0|}10998|17|}}
{2010210004|XXGflow|266|0|736|0|{@{}@384|.5|.5|{0|}11000|19|}}
{2010210004|XXGflow|267|0|741|0|{@{}@384|.5|.5|{0|}10999|18|}}
{2010501005|XXGpvertex|268|0|743|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|450000|115000|0|0|0|0|10978|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|269|0|745|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|270|0|748|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|271|0|751|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|272|0|753|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|273|0|756|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|274|0|762|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|202000|260000|0|0|0|0|10905|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|275|0|764|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|276|0|767|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|277|0|770|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
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
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|278|0|772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|279|0|775|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|280|0|778|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|@56000|250000|0|0|0|0|11020|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|281|0|780|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|282|0|783|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|283|0|785|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|284|0|792|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|79000|87500|0|0|0|0|10955|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|285|0|794|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|286|0|797|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|287|0|799|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|288|0|801|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|289|0|804|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|290|0|810|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|266000|92500|0|0|0|0|11001|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|291|0|812|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|292|0|815|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|293|0|819|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|294|0|821|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|295|0|824|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|296|0|831|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@1|@846000|90000|0|0|0|0|11022|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|297|0|833|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|298|0|836|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|299|0|838|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|300|0|843|0|{@{}@0|0|0|0|in0|.39886039886039887|@@@13840|0|}}
{2010202004|XXGiport|301|0|847|0|{@{}@0|0|0|0|in0|.56282722513089|@@@13840|0|}}
{2010202004|XXGiport|302|0|851|0|{@{}@0|0|0|0|in0|.5318181818181819|@@@13840|0|}}
{2010110002|XXGconstant|303|0|855|0|{@{}@{1|7746924|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_2|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_26|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_30|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_31|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_4|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_9|}1|13|}
{2010601001|XXGgraph_vertex_vertex|13|0|26|0|{IDS_ICFF|}1|14|}
{2010212001|XXGvertex_oport_oport|14|0|28|0|{0|read|}14|15|}
{2010213001|XXGoport_dst_flow|15|0|30|0|{0|}15|8|}
{2010211001|XXGvertex_iport_iport|16|0|31|0|{0|write|}14|16|}
{2010214001|XXGiport_src_flow|17|0|33|0|{0|}16|10|}
{2010007001|XXGobject_proto_object|18|0|34|0|{}14|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{0|read|}17|18|}
{2010006001|XXGobject_psameas_object|20|0|38|0|{metadata|read_metadata|1|0|}18|17|}
{2010211001|XXGvertex_iport_iport|21|0|39|0|{0|write|}17|19|}
{2010006001|XXGobject_psameas_object|22|0|41|0|{metadata|write_metadata|1|0|}19|17|}
{2010601001|XXGgraph_vertex_vertex|23|0|42|0|{IDS_Index_File|}1|20|}
{2010211001|XXGvertex_iport_iport|24|0|44|0|{0|write|}20|21|}
{2010214001|XXGiport_src_flow|25|0|46|0|{0|}21|11|}
{2010007001|XXGobject_proto_object|26|0|47|0|{}20|22|}
{2010211001|XXGvertex_iport_iport|27|0|49|0|{0|write|}22|23|}
{2010006001|XXGobject_psameas_object|28|0|51|0|{metadata|write_metadata|1|0|}23|22|}
{2010006001|XXGobject_psameas_object|29|0|52|0|{write_metadata|index_metadata|0|0|}20|24|}
{2010212001|XXGvertex_oport_oport|30|0|54|0|{0|out|}24|25|}
{2010213001|XXGoport_dst_flow|31|0|56|0|{0|}25|10|}
{2010212001|XXGvertex_oport_oport|32|0|57|0|{1|index|}24|26|}
{2010213001|XXGoport_dst_flow|33|0|59|0|{0|}26|11|}
{2010212001|XXGvertex_oport_oport|34|0|60|0|{2|address|}24|27|}
{2010211001|XXGvertex_iport_iport|35|0|62|0|{0|in|}24|28|}
{2010214001|XXGiport_src_flow|36|0|64|0|{0|}28|7|}
{2010007001|XXGobject_proto_object|37|0|65|0|{}24|29|}
{2010212001|XXGvertex_oport_oport|38|0|67|0|{0|out|}29|30|}
{2010006001|XXGobject_psameas_object|39|0|69|0|{metadata|out_metadata|1|0|}30|29|}
{2010212001|XXGvertex_oport_oport|40|0|70|0|{1|index|}29|31|}
{2010006001|XXGobject_psameas_object|41|0|72|0|{metadata|index_metadata|1|0|}31|29|}
{2010212001|XXGvertex_oport_oport|42|0|73|0|{2|address|}29|32|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{metadata|address_metadata|1|0|}32|29|}
{2010211001|XXGvertex_iport_iport|44|0|76|0|{0|in|}29|33|}
{2010006001|XXGobject_psameas_object|45|0|78|0|{metadata|in_metadata|1|0|}33|29|}
{2010006001|XXGobject_psameas_object|46|0|79|0|{Layout|Layout|0|0|}24|14|}
{2010006001|XXGobject_psameas_object|47|0|80|0|{in_metadata|out0_metadata|0|0|}24|34|}
{2010212001|XXGvertex_oport_oport|48|0|82|0|{0|out0|}34|35|}
{2010213001|XXGoport_dst_flow|49|0|84|0|{0|}35|13|}
{2010212001|XXGvertex_oport_oport|50|0|85|0|{1|reject0|}34|36|}
{2010212001|XXGvertex_oport_oport|51|0|87|0|{2|error0|}34|37|}
{2010212001|XXGvertex_oport_oport|52|0|89|0|{3|log|}34|38|}
{2010211001|XXGvertex_iport_iport|53|0|91|0|{0|in|}34|39|}
{2010214001|XXGiport_src_flow|54|0|93|0|{0|}39|6|}
{2010007001|XXGobject_proto_object|55|0|94|0|{}34|40|}
{2010212001|XXGvertex_oport_oport|56|0|96|0|{0|out0|}40|41|}
{2010006001|XXGobject_psameas_object|57|0|98|0|{metadata|out0_metadata|1|0|}41|40|}
{2010006001|XXGobject_psameas_object|58|0|99|0|{transform0|transform0|1|0|}41|40|}
{2010212001|XXGvertex_oport_oport|59|0|100|0|{1|reject0|}40|42|}
{2010006001|XXGobject_psameas_object|60|0|102|0|{metadata|reject0_metadata|1|0|}42|40|}
{2010212001|XXGvertex_oport_oport|61|0|103|0|{2|error0|}40|43|}
{2010006001|XXGobject_psameas_object|62|0|105|0|{metadata|error0_metadata|1|0|}43|40|}
{2010212001|XXGvertex_oport_oport|63|0|106|0|{3|log|}40|44|}
{2010006001|XXGobject_psameas_object|64|0|108|0|{metadata|log_metadata|1|0|}44|40|}
{2010211001|XXGvertex_iport_iport|65|0|109|0|{0|in|}40|45|}
{2010006001|XXGobject_psameas_object|66|0|111|0|{metadata|in_metadata|1|0|}45|40|}
{2010006001|XXGobject_psameas_object|67|0|112|0|{Layout|Layout|0|0|}34|46|}
{2010212001|XXGvertex_oport_oport|68|0|114|0|{0|read|}46|47|}
{2010213001|XXGoport_dst_flow|69|0|116|0|{0|}47|6|}
{2010212001|XXGvertex_oport_oport|70|0|117|0|{1|log|}46|48|}
{2010007001|XXGobject_proto_object|71|0|119|0|{}46|49|}
{2010212001|XXGvertex_oport_oport|72|0|121|0|{0|read|}49|50|}
{2010006001|XXGobject_psameas_object|73|0|123|0|{metadata|read_metadata|1|0|}50|49|}
{2010212001|XXGvertex_oport_oport|74|0|124|0|{1|log|}49|51|}
{2010006001|XXGobject_psameas_object|75|0|126|0|{metadata|log_metadata|1|0|}51|49|}
{2010006001|XXGobject_psameas_object|76|0|127|0|{Layout|table_spec|0|1|}49|49|}
{2010006001|XXGobject_psameas_object|77|0|128|0|{Layout|table_spec|0|1|}46|46|}
{2010006001|XXGobject_psameas_object|78|0|129|0|{in_metadata|read_metadata|0|0|}34|46|}
{2010006001|XXGobject_psameas_object|79|0|130|0|{reject0_metadata|read_metadata|0|0|}34|46|}
{2010006001|XXGobject_psameas_object|80|0|131|0|{out_metadata|write_metadata|0|0|}24|14|}
{2010601001|XXGgraph_vertex_vertex|81|0|132|0|{IDW_TABLE_ODBC2_1|}1|46|}
{2010601001|XXGgraph_vertex_vertex|82|0|133|0|{PBKS_ICFF_KEY_|}1|52|}
{2010604001|XXGgraph_flow_flow|83|0|135|0|{Flow_1|}52|53|}
{2010601001|XXGgraph_vertex_vertex|84|0|137|0|{Partition_by_Key|}52|54|}
{2010212001|XXGvertex_oport_oport|85|0|139|0|{0|out|}54|55|}
{2010213001|XXGoport_dst_flow|86|0|141|0|{0|}55|53|}
{2010211001|XXGvertex_iport_iport|87|0|142|0|{0|in|}54|56|}
{2010006001|XXGobject_psameas_object|88|0|144|0|{in_metadata|out0_metadata|0|0|}54|34|}
{2010006001|XXGobject_psameas_object|89|0|145|0|{out_metadata|out0_metadata|0|0|}54|34|}
{2010601001|XXGgraph_vertex_vertex|90|0|146|0|{Sort|}52|57|}
{2010212001|XXGvertex_oport_oport|91|0|148|0|{0|out|}57|58|}
{2010211001|XXGvertex_iport_iport|92|0|150|0|{0|in|}57|59|}
{2010214001|XXGiport_src_flow|93|0|152|0|{0|}59|53|}
{2010006001|XXGobject_psameas_object|94|0|153|0|{in_metadata|out0_metadata|0|0|}57|34|}
{2010006001|XXGobject_psameas_object|95|0|154|0|{out_metadata|out0_metadata|0|0|}57|34|}
{2010212001|XXGvertex_oport_oport|96|0|155|0|{0|out0|}52|60|}
{2010216002|XXGoport_binding_oport|97|0|157|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}60|58|}
{2010213001|XXGoport_dst_flow|98|0|158|0|{0|}60|9|}
{2010211001|XXGvertex_iport_iport|99|0|159|0|{0|in0|}52|61|}
{2010215002|XXGiport_binding_iport|100|0|161|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}61|56|}
{2010214001|XXGiport_src_flow|101|0|162|0|{0|}61|13|}
{2010007001|XXGobject_proto_object|102|0|163|0|{}52|62|}
{2010604001|XXGgraph_flow_flow|103|0|165|0|{Flow_1|}62|63|}
{2010601001|XXGgraph_vertex_vertex|104|0|167|0|{Partition_by_Key|}62|64|}
{2010212001|XXGvertex_oport_oport|105|0|169|0|{0|out|}64|65|}
{2010213001|XXGoport_dst_flow|106|0|171|0|{0|}65|63|}
{2010211001|XXGvertex_iport_iport|107|0|172|0|{0|in|}64|66|}
{2010007001|XXGobject_proto_object|108|0|174|0|{}64|67|}
{2010212001|XXGvertex_oport_oport|109|0|176|0|{0|out|}67|68|}
{2010006001|XXGobject_psameas_object|110|0|178|0|{metadata|out_metadata|1|0|}68|67|}
{2010211001|XXGvertex_iport_iport|111|0|179|0|{0|in|}67|69|}
{2010006001|XXGobject_psameas_object|112|0|181|0|{metadata|in_metadata|1|0|}69|67|}
{2010006001|XXGobject_psameas_object|113|0|182|0|{Layout|InputLayout|1|0|}64|62|}
{2010006001|XXGobject_psameas_object|114|0|183|0|{key|Key|1|0|}64|62|}
{2010601001|XXGgraph_vertex_vertex|115|0|184|0|{Sort|}62|70|}
{2010212001|XXGvertex_oport_oport|116|0|186|0|{0|out|}70|71|}
{2010211001|XXGvertex_iport_iport|117|0|188|0|{0|in|}70|72|}
{2010214001|XXGiport_src_flow|118|0|190|0|{0|}72|63|}
{2010007001|XXGobject_proto_object|119|0|191|0|{}70|73|}
{2010212001|XXGvertex_oport_oport|120|0|193|0|{0|out|}73|74|}
{2010006001|XXGobject_psameas_object|121|0|195|0|{metadata|out_metadata|1|0|}74|73|}
{2010211001|XXGvertex_iport_iport|122|0|196|0|{0|in|}73|75|}
{2010006001|XXGobject_psameas_object|123|0|198|0|{metadata|in_metadata|1|0|}75|73|}
{2010006001|XXGobject_psameas_object|124|0|199|0|{Layout|OutputLayout|1|0|}70|62|}
{2010006001|XXGobject_psameas_object|125|0|200|0|{key|Key|1|0|}70|62|}
{2010006001|XXGobject_psameas_object|126|0|201|0|{max_core|Max_core|1|0|}70|62|}
{2010212001|XXGvertex_oport_oport|127|0|202|0|{0|out0|}62|76|}
{2010216002|XXGoport_binding_oport|128|0|204|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}76|71|}
{2010211001|XXGvertex_iport_iport|129|0|205|0|{0|in0|}62|77|}
{2010215002|XXGiport_binding_iport|130|0|207|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}77|66|}
{2010006001|XXGobject_psameas_object|131|0|208|0|{InputLayout|Layout|0|0|}52|46|}
{2010006001|XXGobject_psameas_object|132|0|209|0|{OutputLayout|Layout|0|0|}52|14|}
{2010601001|XXGgraph_vertex_vertex|133|0|210|0|{RFMT_Get_Hash_and_src_env_rank|}1|34|}
{2010601001|XXGgraph_vertex_vertex|134|0|211|0|{Reformat|}1|78|}
{2010212001|XXGvertex_oport_oport|135|0|213|0|{0|out0|}78|79|}
{2010213001|XXGoport_dst_flow|136|0|215|0|{0|}79|5|}
{2010212001|XXGvertex_oport_oport|137|0|216|0|{1|reject0|}78|80|}
{2010212001|XXGvertex_oport_oport|138|0|218|0|{2|error0|}78|81|}
{2010212001|XXGvertex_oport_oport|139|0|220|0|{3|log|}78|82|}
{2010211001|XXGvertex_iport_iport|140|0|222|0|{0|in|}78|83|}
{2010214001|XXGiport_src_flow|141|0|224|0|{0|}83|12|}
{2010007001|XXGobject_proto_object|142|0|225|0|{}78|84|}
{2010212001|XXGvertex_oport_oport|143|0|227|0|{0|out0|}84|85|}
{2010006001|XXGobject_psameas_object|144|0|229|0|{metadata|out0_metadata|1|0|}85|84|}
{2010006001|XXGobject_psameas_object|145|0|230|0|{transform0|transform0|1|0|}85|84|}
{2010212001|XXGvertex_oport_oport|146|0|231|0|{1|reject0|}84|86|}
{2010006001|XXGobject_psameas_object|147|0|233|0|{metadata|reject0_metadata|1|0|}86|84|}
{2010212001|XXGvertex_oport_oport|148|0|234|0|{2|error0|}84|87|}
{2010006001|XXGobject_psameas_object|149|0|236|0|{metadata|error0_metadata|1|0|}87|84|}
{2010212001|XXGvertex_oport_oport|150|0|237|0|{3|log|}84|88|}
{2010006001|XXGobject_psameas_object|151|0|239|0|{metadata|log_metadata|1|0|}88|84|}
{2010211001|XXGvertex_iport_iport|152|0|240|0|{0|in|}84|89|}
{2010006001|XXGobject_psameas_object|153|0|242|0|{metadata|in_metadata|1|0|}89|84|}
{2010006001|XXGobject_psameas_object|154|0|243|0|{Layout|Layout|0|0|}78|90|}
{2010212001|XXGvertex_oport_oport|155|0|245|0|{0|read|}90|91|}
{2010213001|XXGoport_dst_flow|156|0|247|0|{0|}91|92|}
{2010211001|XXGvertex_iport_iport|157|0|249|0|{0|write|}90|93|}
{2010214001|XXGiport_src_flow|158|0|251|0|{0|}93|94|}
{2010007001|XXGobject_proto_object|159|0|253|0|{}90|95|}
{2010212001|XXGvertex_oport_oport|160|0|255|0|{0|read|}95|96|}
{2010006001|XXGobject_psameas_object|161|0|257|0|{metadata|read_metadata|1|0|}96|95|}
{2010211001|XXGvertex_iport_iport|162|0|258|0|{0|write|}95|97|}
{2010006001|XXGobject_psameas_object|163|0|260|0|{metadata|write_metadata|1|0|}97|95|}
{2010006001|XXGobject_psameas_object|164|0|261|0|{in_metadata|out0_metadata|0|0|}78|34|}
{2010006001|XXGobject_psameas_object|165|0|262|0|{reject0_metadata|out0_metadata|0|0|}78|34|}
{2010601001|XXGgraph_vertex_vertex|166|0|263|0|{Replicate|}1|98|}
{2010212001|XXGvertex_oport_oport|167|0|265|0|{0|out|}98|99|}
{2010213001|XXGoport_dst_flow|168|0|267|0|{0|}99|12|}
{2010213001|XXGoport_dst_flow|169|0|268|0|{1|}99|7|}
{2010211001|XXGvertex_iport_iport|170|0|269|0|{0|in|}98|100|}
{2010214001|XXGiport_src_flow|171|0|271|0|{0|}100|9|}
{2010007001|XXGobject_proto_object|172|0|272|0|{}98|101|}
{2010212001|XXGvertex_oport_oport|173|0|274|0|{0|out|}101|102|}
{2010006001|XXGobject_psameas_object|174|0|276|0|{metadata|out_metadata|1|0|}102|101|}
{2010211001|XXGvertex_iport_iport|175|0|277|0|{0|in|}101|103|}
{2010006001|XXGobject_psameas_object|176|0|279|0|{metadata|in_metadata|1|0|}103|101|}
{2010006001|XXGobject_psameas_object|177|0|280|0|{Layout|Layout|0|0|}98|14|}
{2010006001|XXGobject_psameas_object|178|0|281|0|{in_metadata|out0_metadata|0|0|}98|34|}
{2010006001|XXGobject_psameas_object|179|0|282|0|{out_metadata|out0_metadata|0|0|}98|34|}
{2010601001|XXGgraph_vertex_vertex|180|0|283|0|{View_Data_1|}1|104|}
{2010211001|XXGvertex_iport_iport|181|0|285|0|{0|write|}104|105|}
{2010214001|XXGiport_src_flow|182|0|287|0|{0|}105|8|}
{2010007001|XXGobject_proto_object|183|0|288|0|{}104|106|}
{2010211001|XXGvertex_iport_iport|184|0|290|0|{0|write|}106|107|}
{2010006001|XXGobject_psameas_object|185|0|292|0|{metadata|write_metadata|1|0|}107|106|}
{2010601001|XXGgraph_vertex_vertex|186|0|293|0|{Write_Block_Compressed_Lookup_1|}1|24|}
{2010601001|XXGgraph_vertex_vertex|187|0|294|0|{Write_Xref_files|}1|108|}
{2010605001|XXGgraph_legend_legend|188|0|296|0|{0|}108|109|}
{2010241001|XXGlegend_face_face|189|0|298|0|{}109|110|}
{2010605001|XXGgraph_legend_legend|190|0|300|0|{1|}108|111|}
{2010241001|XXGlegend_face_face|191|0|302|0|{}111|112|}
{2010604001|XXGgraph_flow_flow|192|0|304|0|{Flow_1|}108|113|}
{2010604001|XXGgraph_flow_flow|193|0|306|0|{Flow_2|}108|114|}
{2010604001|XXGgraph_flow_flow|194|0|308|0|{Flow_3|}108|115|}
{2010604001|XXGgraph_flow_flow|195|0|310|0|{Flow_4|}108|116|}
{2010601001|XXGgraph_vertex_vertex|196|0|312|0|{Dummy_Replicate|}108|117|}
{2010212001|XXGvertex_oport_oport|197|0|314|0|{0|out|}117|118|}
{2010213001|XXGoport_dst_flow|198|0|316|0|{0|}118|115|}
{2010213001|XXGoport_dst_flow|199|0|317|0|{1|}118|116|}
{2010211001|XXGvertex_iport_iport|200|0|318|0|{0|in|}117|119|}
{2010214001|XXGiport_src_flow|201|0|320|0|{0|}119|113|}
{2010007001|XXGobject_proto_object|202|0|321|0|{}117|120|}
{2010212001|XXGvertex_oport_oport|203|0|323|0|{0|out|}120|121|}
{2010006001|XXGobject_psameas_object|204|0|325|0|{metadata|out_metadata|1|0|}121|120|}
{2010211001|XXGvertex_iport_iport|205|0|326|0|{0|in|}120|122|}
{2010006001|XXGobject_psameas_object|206|0|328|0|{metadata|in_metadata|1|0|}122|120|}
{2010006001|XXGobject_psameas_object|207|0|329|0|{Layout|Layout|0|0|}117|90|}
{2010006001|XXGobject_psameas_object|208|0|330|0|{in_metadata|out0_metadata|0|0|}117|123|}
{2010212001|XXGvertex_oport_oport|209|0|332|0|{0|out0|}123|124|}
{2010213001|XXGoport_dst_flow|210|0|334|0|{0|}124|114|}
{2010212001|XXGvertex_oport_oport|211|0|335|0|{1|reject0|}123|125|}
{2010212001|XXGvertex_oport_oport|212|0|337|0|{2|error0|}123|126|}
{2010212001|XXGvertex_oport_oport|213|0|339|0|{3|log|}123|127|}
{2010211001|XXGvertex_iport_iport|214|0|341|0|{0|in|}123|128|}
{2010007001|XXGobject_proto_object|215|0|343|0|{}123|129|}
{2010212001|XXGvertex_oport_oport|216|0|345|0|{0|out0|}129|130|}
{2010006001|XXGobject_psameas_object|217|0|347|0|{metadata|out0_metadata|1|0|}130|129|}
{2010006001|XXGobject_psameas_object|218|0|348|0|{transform0|transform0|1|0|}130|129|}
{2010212001|XXGvertex_oport_oport|219|0|349|0|{1|reject0|}129|131|}
{2010006001|XXGobject_psameas_object|220|0|351|0|{metadata|reject0_metadata|1|0|}131|129|}
{2010212001|XXGvertex_oport_oport|221|0|352|0|{2|error0|}129|132|}
{2010006001|XXGobject_psameas_object|222|0|354|0|{metadata|error0_metadata|1|0|}132|129|}
{2010212001|XXGvertex_oport_oport|223|0|355|0|{3|log|}129|133|}
{2010006001|XXGobject_psameas_object|224|0|357|0|{metadata|log_metadata|1|0|}133|129|}
{2010211001|XXGvertex_iport_iport|225|0|358|0|{0|in|}129|134|}
{2010006001|XXGobject_psameas_object|226|0|360|0|{metadata|in_metadata|1|0|}134|129|}
{2010006001|XXGobject_psameas_object|227|0|361|0|{Layout|Layout|0|0|}123|90|}
{2010006001|XXGobject_psameas_object|228|0|362|0|{in_metadata|out0_metadata|0|0|}123|78|}
{2010006001|XXGobject_psameas_object|229|0|363|0|{reject0_metadata|out0_metadata|0|0|}123|78|}
{2010006001|XXGobject_psameas_object|230|0|364|0|{out_metadata|out0_metadata|0|0|}117|123|}
{2010601001|XXGgraph_vertex_vertex|231|0|365|0|{RFMT_Drop_columns|}108|123|}
{2010601001|XXGgraph_vertex_vertex|232|0|366|0|{Replicate|}108|135|}
{2010212001|XXGvertex_oport_oport|233|0|368|0|{0|out|}135|136|}
{2010213001|XXGoport_dst_flow|234|0|370|0|{0|}136|113|}
{2010211001|XXGvertex_iport_iport|235|0|371|0|{0|in|}135|137|}
{2010214001|XXGiport_src_flow|236|0|373|0|{0|}137|114|}
{2010007001|XXGobject_proto_object|237|0|374|0|{}135|138|}
{2010212001|XXGvertex_oport_oport|238|0|376|0|{0|out|}138|139|}
{2010006001|XXGobject_psameas_object|239|0|378|0|{metadata|out_metadata|1|0|}139|138|}
{2010211001|XXGvertex_iport_iport|240|0|379|0|{0|in|}138|140|}
{2010006001|XXGobject_psameas_object|241|0|381|0|{metadata|in_metadata|1|0|}140|138|}
{2010006001|XXGobject_psameas_object|242|0|382|0|{Layout|Layout|0|0|}135|90|}
{2010006001|XXGobject_psameas_object|243|0|383|0|{in_metadata|out0_metadata|0|0|}135|123|}
{2010006001|XXGobject_psameas_object|244|0|384|0|{out_metadata|out0_metadata|0|0|}135|123|}
{2010601001|XXGgraph_vertex_vertex|245|0|385|0|{Write_Multifile_Xref_ICFF_LookUp|}108|141|}
{2010604001|XXGgraph_flow_flow|246|0|387|0|{Flow_2|}141|92|}
{2010604001|XXGgraph_flow_flow|247|0|388|0|{Flow_6|}141|94|}
{2010604001|XXGgraph_flow_flow|248|0|389|0|{Flow_7|}141|142|}
{2010601001|XXGgraph_vertex_vertex|249|0|391|0|{View_Data|}141|143|}
{2010211001|XXGvertex_iport_iport|250|0|393|0|{0|write|}143|144|}
{2010214001|XXGiport_src_flow|251|0|395|0|{0|}144|92|}
{2010007001|XXGobject_proto_object|252|0|396|0|{}143|145|}
{2010211001|XXGvertex_iport_iport|253|0|398|0|{0|write|}145|146|}
{2010006001|XXGobject_psameas_object|254|0|400|0|{metadata|write_metadata|1|0|}146|145|}
{2010601001|XXGgraph_vertex_vertex|255|0|401|0|{Write_Block_Compressed_Lookup|}141|147|}
{2010212001|XXGvertex_oport_oport|256|0|403|0|{0|out|}147|148|}
{2010213001|XXGoport_dst_flow|257|0|405|0|{0|}148|94|}
{2010212001|XXGvertex_oport_oport|258|0|406|0|{1|index|}147|149|}
{2010213001|XXGoport_dst_flow|259|0|408|0|{0|}149|142|}
{2010212001|XXGvertex_oport_oport|260|0|409|0|{2|address|}147|150|}
{2010211001|XXGvertex_iport_iport|261|0|411|0|{0|in|}147|151|}
{2010007001|XXGobject_proto_object|262|0|413|0|{}147|152|}
{2010212001|XXGvertex_oport_oport|263|0|415|0|{0|out|}152|153|}
{2010006001|XXGobject_psameas_object|264|0|417|0|{metadata|out_metadata|1|0|}153|152|}
{2010212001|XXGvertex_oport_oport|265|0|418|0|{1|index|}152|154|}
{2010006001|XXGobject_psameas_object|266|0|420|0|{metadata|index_metadata|1|0|}154|152|}
{2010212001|XXGvertex_oport_oport|267|0|421|0|{2|address|}152|155|}
{2010006001|XXGobject_psameas_object|268|0|423|0|{metadata|address_metadata|1|0|}155|152|}
{2010211001|XXGvertex_iport_iport|269|0|424|0|{0|in|}152|156|}
{2010006001|XXGobject_psameas_object|270|0|426|0|{metadata|in_metadata|1|0|}156|152|}
{2010006001|XXGobject_psameas_object|271|0|427|0|{Layout|Layout|0|0|}147|90|}
{2010006001|XXGobject_psameas_object|272|0|428|0|{in_metadata|out0_metadata|0|0|}147|123|}
{2010006001|XXGobject_psameas_object|273|0|429|0|{out_metadata|write_metadata|0|0|}147|90|}
{2010601001|XXGgraph_vertex_vertex|274|0|430|0|{Xref_ICFF_Data_File|}141|90|}
{2010601001|XXGgraph_vertex_vertex|275|0|431|0|{Xref_ICFF_Index_File|}141|157|}
{2010211001|XXGvertex_iport_iport|276|0|433|0|{0|write|}157|158|}
{2010214001|XXGiport_src_flow|277|0|435|0|{0|}158|142|}
{2010007001|XXGobject_proto_object|278|0|436|0|{}157|159|}
{2010211001|XXGvertex_iport_iport|279|0|438|0|{0|write|}159|160|}
{2010006001|XXGobject_psameas_object|280|0|440|0|{metadata|write_metadata|1|0|}160|159|}
{2010006001|XXGobject_psameas_object|281|0|441|0|{write_metadata|index_metadata|0|0|}157|147|}
{2010211001|XXGvertex_iport_iport|282|0|442|0|{0|in0|}141|161|}
{2010215002|XXGiport_binding_iport|283|0|444|0|{.5|.5|{0|}10590|}161|151|}
{2010214001|XXGiport_src_flow|284|0|445|0|{0|}161|115|}
{2010601001|XXGgraph_vertex_vertex|285|0|446|0|{Write_Non_ICFF_Xref_LookUp|}108|162|}
{2010605001|XXGgraph_legend_legend|286|0|448|0|{0|}162|163|}
{2010241001|XXGlegend_face_face|287|0|450|0|{}163|164|}
{2010604001|XXGgraph_flow_flow|288|0|452|0|{Flow_1|}162|165|}
{2010604001|XXGgraph_flow_flow|289|0|454|0|{Flow_2|}162|166|}
{2010604001|XXGgraph_flow_flow|290|0|456|0|{Flow_3|}162|167|}
{2010601001|XXGgraph_vertex_vertex|291|0|458|0|{Reformat|}162|168|}
{2010212001|XXGvertex_oport_oport|292|0|460|0|{0|out0|}168|169|}
{2010213001|XXGoport_dst_flow|293|0|462|0|{0|}169|165|}
{2010212001|XXGvertex_oport_oport|294|0|463|0|{1|reject0|}168|170|}
{2010212001|XXGvertex_oport_oport|295|0|465|0|{2|error0|}168|171|}
{2010212001|XXGvertex_oport_oport|296|0|467|0|{3|log|}168|172|}
{2010211001|XXGvertex_iport_iport|297|0|469|0|{0|in|}168|173|}
{2010007001|XXGobject_proto_object|298|0|471|0|{}168|174|}
{2010212001|XXGvertex_oport_oport|299|0|473|0|{0|out0|}174|175|}
{2010006001|XXGobject_psameas_object|300|0|475|0|{metadata|out0_metadata|1|0|}175|174|}
{2010006001|XXGobject_psameas_object|301|0|476|0|{transform0|transform0|1|0|}175|174|}
{2010212001|XXGvertex_oport_oport|302|0|477|0|{1|reject0|}174|176|}
{2010006001|XXGobject_psameas_object|303|0|479|0|{metadata|reject0_metadata|1|0|}176|174|}
{2010212001|XXGvertex_oport_oport|304|0|480|0|{2|error0|}174|177|}
{2010006001|XXGobject_psameas_object|305|0|482|0|{metadata|error0_metadata|1|0|}177|174|}
{2010212001|XXGvertex_oport_oport|306|0|483|0|{3|log|}174|178|}
{2010006001|XXGobject_psameas_object|307|0|485|0|{metadata|log_metadata|1|0|}178|174|}
{2010211001|XXGvertex_iport_iport|308|0|486|0|{0|in|}174|179|}
{2010006001|XXGobject_psameas_object|309|0|488|0|{metadata|in_metadata|1|0|}179|174|}
{2010006001|XXGobject_psameas_object|310|0|489|0|{Layout|Layout|0|0|}168|90|}
{2010006001|XXGobject_psameas_object|311|0|490|0|{in_metadata|out0_metadata|0|0|}168|123|}
{2010006001|XXGobject_psameas_object|312|0|491|0|{out0_metadata|out_metadata|0|0|}168|180|}
{2010212001|XXGvertex_oport_oport|313|0|493|0|{0|out|}180|181|}
{2010213001|XXGoport_dst_flow|314|0|495|0|{0|}181|182|}
{2010212001|XXGvertex_oport_oport|315|0|497|0|{1|index0|}180|183|}
{2010213001|XXGoport_dst_flow|316|0|499|0|{0|}183|184|}
{2010211001|XXGvertex_iport_iport|317|0|501|0|{0|in|}180|185|}
{2010214001|XXGiport_src_flow|318|0|503|0|{0|}185|186|}
{2010007001|XXGobject_proto_object|319|0|505|0|{}180|187|}
{2010212001|XXGvertex_oport_oport|320|0|507|0|{0|out|}187|188|}
{2010006001|XXGobject_psameas_object|321|0|509|0|{metadata|out_metadata|1|0|}188|187|}
{2010212001|XXGvertex_oport_oport|322|0|510|0|{1|index0|}187|189|}
{2010006001|XXGobject_psameas_object|323|0|512|0|{key0|key0|1|0|}189|187|}
{2010006001|XXGobject_psameas_object|324|0|513|0|{metadata|index0_metadata|1|0|}189|187|}
{2010211001|XXGvertex_iport_iport|325|0|514|0|{0|in|}187|190|}
{2010006001|XXGobject_psameas_object|326|0|516|0|{metadata|in_metadata|1|0|}190|187|}
{2010006001|XXGobject_psameas_object|327|0|517|0|{Layout|Layout|0|0|}180|191|}
{2010211001|XXGvertex_iport_iport|328|0|519|0|{0|write|}191|192|}
{2010214001|XXGiport_src_flow|329|0|521|0|{0|}192|184|}
{2010007001|XXGobject_proto_object|330|0|522|0|{}191|193|}
{2010211001|XXGvertex_iport_iport|331|0|524|0|{0|write|}193|194|}
{2010006001|XXGobject_psameas_object|332|0|526|0|{metadata|write_metadata|1|0|}194|193|}
{2010006001|XXGobject_psameas_object|333|0|527|0|{write_metadata|index0_metadata|0|0|}191|180|}
{2010006001|XXGobject_psameas_object|334|0|528|0|{in_metadata|out_metadata|0|0|}180|180|}
{2010006001|XXGobject_psameas_object|335|0|529|0|{reject0_metadata|out0_metadata|0|0|}168|123|}
{2010601001|XXGgraph_vertex_vertex|336|0|530|0|{Replicate|}162|195|}
{2010212001|XXGvertex_oport_oport|337|0|532|0|{0|out|}195|196|}
{2010213001|XXGoport_dst_flow|338|0|534|0|{0|}196|166|}
{2010213001|XXGoport_dst_flow|339|0|535|0|{1|}196|167|}
{2010211001|XXGvertex_iport_iport|340|0|536|0|{0|in|}195|197|}
{2010214001|XXGiport_src_flow|341|0|538|0|{0|}197|165|}
{2010007001|XXGobject_proto_object|342|0|539|0|{}195|198|}
{2010212001|XXGvertex_oport_oport|343|0|541|0|{0|out|}198|199|}
{2010006001|XXGobject_psameas_object|344|0|543|0|{metadata|out_metadata|1|0|}199|198|}
{2010211001|XXGvertex_iport_iport|345|0|544|0|{0|in|}198|200|}
{2010006001|XXGobject_psameas_object|346|0|546|0|{metadata|in_metadata|1|0|}200|198|}
{2010006001|XXGobject_psameas_object|347|0|547|0|{Layout|Layout|0|0|}195|168|}
{2010006001|XXGobject_psameas_object|348|0|548|0|{in_metadata|out_metadata|0|0|}195|180|}
{2010006001|XXGobject_psameas_object|349|0|549|0|{out_metadata|out_metadata|0|0|}195|180|}
{2010601001|XXGgraph_vertex_vertex|350|0|550|0|{for_MPP_Server_Architecture|}162|201|}
{2010605001|XXGgraph_legend_legend|351|0|552|0|{0|}201|202|}
{2010241001|XXGlegend_face_face|352|0|554|0|{}202|203|}
{2010604001|XXGgraph_flow_flow|353|0|556|0|{Flow_1|}201|204|}
{2010604001|XXGgraph_flow_flow|354|0|558|0|{Flow_2|}201|205|}
{2010604001|XXGgraph_flow_flow|355|0|560|0|{Flow_3|}201|206|}
{2010604001|XXGgraph_flow_flow|356|0|562|0|{Flow_4|}201|207|}
{2010604001|XXGgraph_flow_flow|357|0|564|0|{Flow_5|}201|208|}
{2010604001|XXGgraph_flow_flow|358|0|566|0|{Flow_6|}201|209|}
{2010604001|XXGgraph_flow_flow|359|0|568|0|{Flow_7|}201|210|}
{2010604001|XXGgraph_flow_flow|360|0|570|0|{Flow_8|}201|211|}
{2010601001|XXGgraph_vertex_vertex|361|0|572|0|{Broadcast|}201|212|}
{2010212001|XXGvertex_oport_oport|362|0|574|0|{0|out|}212|213|}
{2010213001|XXGoport_dst_flow|363|0|576|0|{0|}213|210|}
{2010211001|XXGvertex_iport_iport|364|0|577|0|{0|in|}212|214|}
{2010214001|XXGiport_src_flow|365|0|579|0|{0|}214|205|}
{2010007001|XXGobject_proto_object|366|0|580|0|{}212|215|}
{2010212001|XXGvertex_oport_oport|367|0|582|0|{0|out|}215|216|}
{2010006001|XXGobject_psameas_object|368|0|584|0|{metadata|out_metadata|1|0|}216|215|}
{2010211001|XXGvertex_iport_iport|369|0|585|0|{0|in|}215|217|}
{2010006001|XXGobject_psameas_object|370|0|587|0|{metadata|in_metadata|1|0|}217|215|}
{2010006001|XXGobject_psameas_object|371|0|588|0|{Layout|Layout|0|0|}212|168|}
{2010006001|XXGobject_psameas_object|372|0|589|0|{in_metadata|out_metadata|0|0|}212|218|}
{2010212001|XXGvertex_oport_oport|373|0|591|0|{0|out|}218|219|}
{2010213001|XXGoport_dst_flow|374|0|593|0|{0|}219|207|}
{2010212001|XXGvertex_oport_oport|375|0|594|0|{1|index0|}218|220|}
{2010213001|XXGoport_dst_flow|376|0|596|0|{0|}220|208|}
{2010211001|XXGvertex_iport_iport|377|0|597|0|{0|in|}218|221|}
{2010214001|XXGiport_src_flow|378|0|599|0|{0|}221|210|}
{2010007001|XXGobject_proto_object|379|0|600|0|{}218|222|}
{2010212001|XXGvertex_oport_oport|380|0|602|0|{0|out|}222|223|}
{2010006001|XXGobject_psameas_object|381|0|604|0|{metadata|out_metadata|1|0|}223|222|}
{2010212001|XXGvertex_oport_oport|382|0|605|0|{1|index0|}222|224|}
{2010006001|XXGobject_psameas_object|383|0|607|0|{key0|key0|1|0|}224|222|}
{2010006001|XXGobject_psameas_object|384|0|608|0|{metadata|index0_metadata|1|0|}224|222|}
{2010211001|XXGvertex_iport_iport|385|0|609|0|{0|in|}222|225|}
{2010006001|XXGobject_psameas_object|386|0|611|0|{metadata|in_metadata|1|0|}225|222|}
{2010006001|XXGobject_psameas_object|387|0|612|0|{Layout|Layout|0|0|}218|226|}
{2010211001|XXGvertex_iport_iport|388|0|614|0|{0|write|}226|227|}
{2010214001|XXGiport_src_flow|389|0|616|0|{0|}227|208|}
{2010007001|XXGobject_proto_object|390|0|617|0|{}226|228|}
{2010211001|XXGvertex_iport_iport|391|0|619|0|{0|write|}228|229|}
{2010006001|XXGobject_psameas_object|392|0|621|0|{metadata|write_metadata|1|0|}229|228|}
{2010006001|XXGobject_psameas_object|393|0|622|0|{write_metadata|index0_metadata|0|0|}226|218|}
{2010006001|XXGobject_psameas_object|394|0|623|0|{in_metadata|out_metadata|0|0|}218|218|}
{2010006001|XXGobject_psameas_object|395|0|624|0|{out_metadata|out_metadata|0|0|}212|218|}
{2010601001|XXGgraph_vertex_vertex|396|0|625|0|{Concatenate|}201|230|}
{2010212001|XXGvertex_oport_oport|397|0|627|0|{0|out|}230|231|}
{2010213001|XXGoport_dst_flow|398|0|629|0|{0|}231|209|}
{2010211001|XXGvertex_iport_iport|399|0|630|0|{0|in|}230|232|}
{2010214001|XXGiport_src_flow|400|0|632|0|{0|}232|204|}
{2010214001|XXGiport_src_flow|401|0|633|0|{1|}232|211|}
{2010007001|XXGobject_proto_object|402|0|634|0|{}230|233|}
{2010212001|XXGvertex_oport_oport|403|0|636|0|{0|out|}233|234|}
{2010006001|XXGobject_psameas_object|404|0|638|0|{metadata|out_metadata|1|0|}234|233|}
{2010211001|XXGvertex_iport_iport|405|0|639|0|{0|in|}233|235|}
{2010006001|XXGobject_psameas_object|406|0|641|0|{metadata|in_metadata|1|0|}235|233|}
{2010006001|XXGobject_psameas_object|407|0|642|0|{Layout|Layout|0|0|}230|168|}
{2010006001|XXGobject_psameas_object|408|0|643|0|{in_metadata|out_metadata|0|0|}230|218|}
{2010006001|XXGobject_psameas_object|409|0|644|0|{out_metadata|out_metadata|0|0|}230|218|}
{2010601001|XXGgraph_vertex_vertex|410|0|645|0|{Partition_by_Round_robin|}201|236|}
{2010212001|XXGvertex_oport_oport|411|0|647|0|{0|out|}236|237|}
{2010213001|XXGoport_dst_flow|412|0|649|0|{0|}237|211|}
{2010211001|XXGvertex_iport_iport|413|0|650|0|{0|in|}236|238|}
{2010214001|XXGiport_src_flow|414|0|652|0|{0|}238|206|}
{2010007001|XXGobject_proto_object|415|0|653|0|{}236|239|}
{2010212001|XXGvertex_oport_oport|416|0|655|0|{0|out|}239|240|}
{2010006001|XXGobject_psameas_object|417|0|657|0|{metadata|out_metadata|1|0|}240|239|}
{2010211001|XXGvertex_iport_iport|418|0|658|0|{0|in|}239|241|}
{2010006001|XXGobject_psameas_object|419|0|660|0|{metadata|in_metadata|1|0|}241|239|}
{2010006001|XXGobject_psameas_object|420|0|661|0|{Layout|Layout|0|0|}236|242|}
{2010212001|XXGvertex_oport_oport|421|0|663|0|{0|read|}242|243|}
{2010213001|XXGoport_dst_flow|422|0|665|0|{0|}243|206|}
{2010007001|XXGobject_proto_object|423|0|666|0|{}242|244|}
{2010212001|XXGvertex_oport_oport|424|0|668|0|{0|read|}244|245|}
{2010006001|XXGobject_psameas_object|425|0|670|0|{metadata|read_metadata|1|0|}245|244|}
{2010006001|XXGobject_psameas_object|426|0|671|0|{read_metadata|out_metadata|0|0|}242|218|}
{2010006001|XXGobject_psameas_object|427|0|672|0|{in_metadata|out_metadata|0|0|}236|218|}
{2010006001|XXGobject_psameas_object|428|0|673|0|{out_metadata|out_metadata|0|0|}236|218|}
{2010601001|XXGgraph_vertex_vertex|429|0|674|0|{Prev_Xref_Data_file|}201|242|}
{2010601001|XXGgraph_vertex_vertex|430|0|675|0|{Replicate|}201|246|}
{2010212001|XXGvertex_oport_oport|431|0|677|0|{0|out|}246|247|}
{2010213001|XXGoport_dst_flow|432|0|679|0|{0|}247|204|}
{2010211001|XXGvertex_iport_iport|433|0|680|0|{0|in|}246|248|}
{2010007001|XXGobject_proto_object|434|0|682|0|{}246|249|}
{2010212001|XXGvertex_oport_oport|435|0|684|0|{0|out|}249|250|}
{2010006001|XXGobject_psameas_object|436|0|686|0|{metadata|out_metadata|1|0|}250|249|}
{2010211001|XXGvertex_iport_iport|437|0|687|0|{0|in|}249|251|}
{2010006001|XXGobject_psameas_object|438|0|689|0|{metadata|in_metadata|1|0|}251|249|}
{2010006001|XXGobject_psameas_object|439|0|690|0|{Layout|Layout|0|0|}246|168|}
{2010006001|XXGobject_psameas_object|440|0|691|0|{in_metadata|out_metadata|0|0|}246|218|}
{2010006001|XXGobject_psameas_object|441|0|692|0|{out_metadata|out_metadata|0|0|}246|218|}
{2010601001|XXGgraph_vertex_vertex|442|0|693|0|{Sort|}201|252|}
{2010212001|XXGvertex_oport_oport|443|0|695|0|{0|out|}252|253|}
{2010213001|XXGoport_dst_flow|444|0|697|0|{0|}253|205|}
{2010211001|XXGvertex_iport_iport|445|0|698|0|{0|in|}252|254|}
{2010214001|XXGiport_src_flow|446|0|700|0|{0|}254|209|}
{2010007001|XXGobject_proto_object|447|0|701|0|{}252|255|}
{2010212001|XXGvertex_oport_oport|448|0|703|0|{0|out|}255|256|}
{2010006001|XXGobject_psameas_object|449|0|705|0|{metadata|out_metadata|1|0|}256|255|}
{2010211001|XXGvertex_iport_iport|450|0|706|0|{0|in|}255|257|}
{2010006001|XXGobject_psameas_object|451|0|708|0|{metadata|in_metadata|1|0|}257|255|}
{2010006001|XXGobject_psameas_object|452|0|709|0|{Layout|Layout|0|0|}252|168|}
{2010006001|XXGobject_psameas_object|453|0|710|0|{in_metadata|out_metadata|0|0|}252|218|}
{2010006001|XXGobject_psameas_object|454|0|711|0|{out_metadata|out_metadata|0|0|}252|218|}
{2010601001|XXGgraph_vertex_vertex|455|0|712|0|{Write_Lookup|}201|218|}
{2010601001|XXGgraph_vertex_vertex|456|0|713|0|{Xref_Data_file|}201|258|}
{2010211001|XXGvertex_iport_iport|457|0|715|0|{0|write|}258|259|}
{2010214001|XXGiport_src_flow|458|0|717|0|{0|}259|207|}
{2010007001|XXGobject_proto_object|459|0|718|0|{}258|260|}
{2010211001|XXGvertex_iport_iport|460|0|720|0|{0|write|}260|261|}
{2010006001|XXGobject_psameas_object|461|0|722|0|{metadata|write_metadata|1|0|}261|260|}
{2010006001|XXGobject_psameas_object|462|0|723|0|{write_metadata|out_metadata|0|0|}258|218|}
{2010601001|XXGgraph_vertex_vertex|463|0|724|0|{Xref_Index_file|}201|226|}
{2010211001|XXGvertex_iport_iport|464|0|725|0|{0|in0|}201|262|}
{2010215002|XXGiport_binding_iport|465|0|727|0|{.5|.5|{0|}10936|}262|248|}
{2010214001|XXGiport_src_flow|466|0|728|0|{0|}262|166|}
{2010601001|XXGgraph_vertex_vertex|467|0|729|0|{for_SMP_Server_Architecture|}162|263|}
{2010604001|XXGgraph_flow_flow|468|0|731|0|{Flow_1|}263|264|}
{2010604001|XXGgraph_flow_flow|469|0|733|0|{Flow_2|}263|265|}
{2010604001|XXGgraph_flow_flow|470|0|735|0|{Flow_3|}263|266|}
{2010604001|XXGgraph_flow_flow|471|0|737|0|{Flow_4|}263|182|}
{2010604001|XXGgraph_flow_flow|472|0|738|0|{Flow_5|}263|184|}
{2010604001|XXGgraph_flow_flow|473|0|739|0|{Flow_6|}263|186|}
{2010604001|XXGgraph_flow_flow|474|0|740|0|{Flow_7|}263|267|}
{2010601001|XXGgraph_vertex_vertex|475|0|742|0|{Gather|}263|268|}
{2010212001|XXGvertex_oport_oport|476|0|744|0|{0|out|}268|269|}
{2010213001|XXGoport_dst_flow|477|0|746|0|{0|}269|186|}
{2010211001|XXGvertex_iport_iport|478|0|747|0|{0|in|}268|270|}
{2010214001|XXGiport_src_flow|479|0|749|0|{0|}270|266|}
{2010007001|XXGobject_proto_object|480|0|750|0|{}268|271|}
{2010212001|XXGvertex_oport_oport|481|0|752|0|{0|out|}271|272|}
{2010006001|XXGobject_psameas_object|482|0|754|0|{metadata|out_metadata|1|0|}272|271|}
{2010211001|XXGvertex_iport_iport|483|0|755|0|{0|in|}271|273|}
{2010006001|XXGobject_psameas_object|484|0|757|0|{metadata|in_metadata|1|0|}273|271|}
{2010006001|XXGobject_psameas_object|485|0|758|0|{Layout|Layout|0|0|}268|191|}
{2010006001|XXGobject_psameas_object|486|0|759|0|{in_metadata|out_metadata|0|0|}268|180|}
{2010006001|XXGobject_psameas_object|487|0|760|0|{out_metadata|out_metadata|0|0|}268|180|}
{2010601001|XXGgraph_vertex_vertex|488|0|761|0|{Partition_by_Round_robin|}263|274|}
{2010212001|XXGvertex_oport_oport|489|0|763|0|{0|out|}274|275|}
{2010213001|XXGoport_dst_flow|490|0|765|0|{0|}275|267|}
{2010211001|XXGvertex_iport_iport|491|0|766|0|{0|in|}274|276|}
{2010214001|XXGiport_src_flow|492|0|768|0|{0|}276|264|}
{2010007001|XXGobject_proto_object|493|0|769|0|{}274|277|}
{2010212001|XXGvertex_oport_oport|494|0|771|0|{0|out|}277|278|}
{2010006001|XXGobject_psameas_object|495|0|773|0|{metadata|out_metadata|1|0|}278|277|}
{2010211001|XXGvertex_iport_iport|496|0|774|0|{0|in|}277|279|}
{2010006001|XXGobject_psameas_object|497|0|776|0|{metadata|in_metadata|1|0|}279|277|}
{2010006001|XXGobject_psameas_object|498|0|777|0|{Layout|Layout|0|0|}274|280|}
{2010212001|XXGvertex_oport_oport|499|0|779|0|{0|read|}280|281|}
{2010213001|XXGoport_dst_flow|500|0|781|0|{0|}281|264|}
{2010007001|XXGobject_proto_object|501|0|782|0|{}280|282|}
{2010212001|XXGvertex_oport_oport|502|0|784|0|{0|read|}282|283|}
{2010006001|XXGobject_psameas_object|503|0|786|0|{metadata|read_metadata|1|0|}283|282|}
{2010006001|XXGobject_psameas_object|504|0|787|0|{read_metadata|out_metadata|0|0|}280|180|}
{2010006001|XXGobject_psameas_object|505|0|788|0|{in_metadata|out_metadata|0|0|}274|180|}
{2010006001|XXGobject_psameas_object|506|0|789|0|{out_metadata|out_metadata|0|0|}274|180|}
{2010601001|XXGgraph_vertex_vertex|507|0|790|0|{Prev_Xref_Data_file|}263|280|}
{2010601001|XXGgraph_vertex_vertex|508|0|791|0|{Replicate|}263|284|}
{2010212001|XXGvertex_oport_oport|509|0|793|0|{0|out|}284|285|}
{2010213001|XXGoport_dst_flow|510|0|795|0|{0|}285|265|}
{2010211001|XXGvertex_iport_iport|511|0|796|0|{0|in|}284|286|}
{2010007001|XXGobject_proto_object|512|0|798|0|{}284|287|}
{2010212001|XXGvertex_oport_oport|513|0|800|0|{0|out|}287|288|}
{2010006001|XXGobject_psameas_object|514|0|802|0|{metadata|out_metadata|1|0|}288|287|}
{2010211001|XXGvertex_iport_iport|515|0|803|0|{0|in|}287|289|}
{2010006001|XXGobject_psameas_object|516|0|805|0|{metadata|in_metadata|1|0|}289|287|}
{2010006001|XXGobject_psameas_object|517|0|806|0|{Layout|Layout|0|0|}284|168|}
{2010006001|XXGobject_psameas_object|518|0|807|0|{in_metadata|out_metadata|0|0|}284|180|}
{2010006001|XXGobject_psameas_object|519|0|808|0|{out_metadata|out_metadata|0|0|}284|180|}
{2010601001|XXGgraph_vertex_vertex|520|0|809|0|{Sort|}263|290|}
{2010212001|XXGvertex_oport_oport|521|0|811|0|{0|out|}290|291|}
{2010213001|XXGoport_dst_flow|522|0|813|0|{0|}291|266|}
{2010211001|XXGvertex_iport_iport|523|0|814|0|{0|in|}290|292|}
{2010214001|XXGiport_src_flow|524|0|816|0|{0|}292|265|}
{2010214001|XXGiport_src_flow|525|0|817|0|{1|}292|267|}
{2010007001|XXGobject_proto_object|526|0|818|0|{}290|293|}
{2010212001|XXGvertex_oport_oport|527|0|820|0|{0|out|}293|294|}
{2010006001|XXGobject_psameas_object|528|0|822|0|{metadata|out_metadata|1|0|}294|293|}
{2010211001|XXGvertex_iport_iport|529|0|823|0|{0|in|}293|295|}
{2010006001|XXGobject_psameas_object|530|0|825|0|{metadata|in_metadata|1|0|}295|293|}
{2010006001|XXGobject_psameas_object|531|0|826|0|{Layout|Layout|0|0|}290|168|}
{2010006001|XXGobject_psameas_object|532|0|827|0|{in_metadata|out_metadata|0|0|}290|180|}
{2010006001|XXGobject_psameas_object|533|0|828|0|{out_metadata|out_metadata|0|0|}290|180|}
{2010601001|XXGgraph_vertex_vertex|534|0|829|0|{Write_Lookup|}263|180|}
{2010601001|XXGgraph_vertex_vertex|535|0|830|0|{Xref_Data_file|}263|296|}
{2010211001|XXGvertex_iport_iport|536|0|832|0|{0|write|}296|297|}
{2010214001|XXGiport_src_flow|537|0|834|0|{0|}297|182|}
{2010007001|XXGobject_proto_object|538|0|835|0|{}296|298|}
{2010211001|XXGvertex_iport_iport|539|0|837|0|{0|write|}298|299|}
{2010006001|XXGobject_psameas_object|540|0|839|0|{metadata|write_metadata|1|0|}299|298|}
{2010006001|XXGobject_psameas_object|541|0|840|0|{write_metadata|out_metadata|0|0|}296|180|}
{2010601001|XXGgraph_vertex_vertex|542|0|841|0|{Xref_Index_file|}263|191|}
{2010211001|XXGvertex_iport_iport|543|0|842|0|{0|in0|}263|300|}
{2010215002|XXGiport_binding_iport|544|0|844|0|{.5|.5|{0|}11017|}300|286|}
{2010214001|XXGiport_src_flow|545|0|845|0|{0|}300|167|}
{2010211001|XXGvertex_iport_iport|546|0|846|0|{0|in0|}162|301|}
{2010215002|XXGiport_binding_iport|547|0|848|0|{.5|.5|{0|}10937|}301|173|}
{2010214001|XXGiport_src_flow|548|0|849|0|{0|}301|116|}
{2010211001|XXGvertex_iport_iport|549|0|850|0|{0|in0|}108|302|}
{2010215002|XXGiport_binding_iport|550|0|852|0|{.5|.5|{0|}10815|}302|128|}
{2010214001|XXGiport_src_flow|551|0|853|0|{0|}302|5|}
{2010109001|XXGobject_property_value|552|0|854|0|{0|TrackingThumbprint|72|}1|303|}
