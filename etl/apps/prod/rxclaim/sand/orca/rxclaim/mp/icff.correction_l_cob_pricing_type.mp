@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|194|rel_count|354|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|TABLE_NAME|l_cob_pricing_type|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_KEY|\{dxf_hk_part1\}|3|9|RK|@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH|AI_PHASE|3|10|RKd|@{0|}}
{30001002|XXparameter|OUTPUT_IDS_INDEX_FILE_PATH|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/one/$\{TABLE_NAME\}.idx|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_IDS_FILE_PATH|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/one/$\{TABLE_NAME\}.dat.gz|3|9|RK|@{0|}}
{30001002|XXparameter|IDS_DML|$\{PUB_DATAHUB_DML\}/ids_rxclaim/ids_rxclaim.$\{TABLE_NAME\}.dml|3|9|RK|@{0|}}
{30001002|XXparameter|WRONG_SK_FILE|$\{AI_MFS\}/NEW_IDS_FILES/$\{TABLE_NAME\}.WRONG_SK.dat.gz|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_XREF_FILE|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/xref/xref.$\{TABLE_NAME\}.dat|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_XREF_INDEX|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/xref/xref.$\{TABLE_NAME\}.idx|3|9|RK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|FIX_ONLY_IDS|1|13|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:dev|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/one/$\{TABLE_NAME\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:qa|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/one/$\{TABLE_NAME\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:integration||3|9||@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:uat||3|9||@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:prod|$\{PUB_DATAHUB_MFS_LOOKUP\}/ids/ids_rxclaim/one/$\{TABLE_NAME\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|INPUT_IDS_FILE_PATH:stage||3|9||@{0|}}
{30001002|XXparameter|RUN_ID|$[now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|fix_ids|ptondare|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1579000|526000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|0|0|0|}Job 'icff.correction_l_cob_pricing_type' Execution Status Report


Job "icff.correction_l_cob_pricing_type" Execution started at Tuesday, August 08, 2017 06:17:47
***** Job execution failed at Tuesday, August 08, 2017 06:18:16 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:28
Run performed by user smenon13
Total data moved through all flows: 32 records (4543 bytes)
Total CPU time (all processes): 4 seconds
Average CPU utilization across all nodes: 0.00 percent
||

echo "******************************************************************************************"
echo "                                  Important Parameters"
echo "******************************************************************************************"
echo "RUN_ID : " $RUN_ID
echo "TABLE_NAME : " $TABLE_NAME
echo "FIX_ONLY_IDS : " $FIX_ONLY_IDS
echo "******************************************************************************************"
#Taking backup of required files

#IDS file
bkpids="$\{OUTPUT_IDS_FILE_PATH\}.$\{RUN_ID\}.BKP"
echo "IDS Backup is at "$bkpids
m_cp $OUTPUT_IDS_FILE_PATH $bkpids


#IDS Index file
bkpidsindex="$\{OUTPUT_IDS_INDEX_FILE_PATH\}.$\{RUN_ID\}.BKP"
echo "IDS Index Backup is at "$bkpidsindex
m_cp $OUTPUT_IDS_INDEX_FILE_PATH $bkpidsindex


#XREF dat file
bkpxref="$\{OUTPUT_XREF_FILE\}.$\{RUN_ID\}.BKP"
echo "XREF Backup is at "$bkpxref
m_cp $OUTPUT_XREF_FILE $bkpxref


#XREF index file
bkpxrefindex="$\{OUTPUT_XREF_INDEX\}.$\{RUN_ID\}.BKP"
echo "XREF Index Backup is at "$bkpxrefindex
m_cp $OUTPUT_XREF_INDEX $bkpxrefindex
|echo "******************************************************************************************"
echo "End Script"
if [ $mpjret -eq 0 ]
then

echo "Graph Succeeded"
else
echo "Graph Failed"
cat $AI_ERROR_FILE
fi
echo "******************************************************************************************"
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}12743|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}12746|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}12747|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}12729|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}12727|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}12722|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}12717|17|}}
{2010600005|XXGgraph|12|0|23|0|{Subgraph created from graph "Graph3"|{}@0|@1450000|431000|0|0|0|0|12728|IDS|ptondare|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|698000|329000|7|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}10582|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}10584|17|}}
{2010503005|XXGfvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_INDEX_FILE_PATH|3|2|$|@{0|}}
}}@2|@578000|240000|0|0|0|0|10585|OFIL : IDS INDEX file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|16|0|31|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|17|0|34|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|18|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|19|0|39|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|@40000|131000|0|0|0|0|10572|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|20|0|41|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|21|0|44|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|22|0|47|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|23|0|49|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|24|0|51|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|25|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|26|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|27|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|28|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|29|0|66|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_IDS_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$IDS_DML|3|2|f$|@{0|}}
}}@0|@15000|370000|0|0|0|0|12736|Input File|Ab Initio Software|@1|100|-1||6||257|-1|-1|}}
{2010203004|XXGoport|30|0|68|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|31|0|71|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|32|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|33|0|76|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@2|@473000|85000|0|0|0|0|10583|OFIL : IDS file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|34|0|78|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|35|0|81|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|36|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|37|0|88|0|{@{}@0|0|0|0|in0|.6109422492401215|@@@13840|0|}}
{2010600005|XXGgraph|38|0|93|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@751000|356000|0|0|481000|303000|12716|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|39|0|95|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|40|0|97|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|41|0|99|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|42|0|102|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|106|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|44|0|108|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|45|0|110|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|46|0|115|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|47|0|119|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|48|0|123|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|49|0|125|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|50|0|127|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@2|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|129|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|52|0|132|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|53|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|54|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|55|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|144|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@2|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|57|0|146|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|58|0|148|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|59|0|151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|60|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|61|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|62|0|162|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|63|0|165|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|64|0|168|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|is_null(cob_pricing_type_cd) or cob_pricing_type_cd not member [vector '1','2','3','4','5','6','7','8','9']|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|493000|295000|0|0|0|0|12604|FBE : Remove records with wrong cob_pricing_ctype_d|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|170|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|66|0|172|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|67|0|174|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|176|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|69|0|178|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|180|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|182|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|72|0|184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|73|0|187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|74|0|190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|75|0|193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|76|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|77|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|206|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|Replicate|1253000|378500|0|0|0|0|12724|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|79|0|208|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|80|0|212|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|81|0|215|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|82|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|83|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|84|0|225|0|{Subgraph created from graph "fix_ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$FIX_ONLY_IDS|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@433000|334500|0|0|0|0|12748|Remove records without preceding '0' in cob_pricing_type_cd|ptondare|Created 8/7/2017 7:00:58 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1223000|510000|3|}}
{2010203004|XXGoport|85|0|228|0|{@{}@0|0|0|0|out0|.3156862745098039|@@@14352|0|}}
{2010202004|XXGiport|86|0|232|0|{@{}@0|0|0|0|in0|.5529411764705883|@@@13840|0|}}
{2010600005|XXGgraph|87|0|237|0|{Subgraph created from graph "generic_fix_ids_src_env_sk"|{}@0|@178000|358500|0|0|0|0|12745|Reset src_env_sk|ptondare|Created 8/7/2017 7:01:39 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1267000|394000|3|}}
{2010210004|XXGflow|88|0|239|0|{@{}@384|.5|.5|{0|}176|17|}}
{2010210004|XXGflow|89|0|241|0|{@{}@384|.5|.5|{0|}179|17|}}
{2010210004|XXGflow|90|0|243|0|{@{}@384|.5|.5|{0|}178|17|}}
{2010501005|XXGpvertex|91|0|245|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|(src_env_sk  != 800 or dxf_src_sys_id != 800) and !is_null(cob_pricing_type_cd) and cob_pricing_type_cd member [vector '01','02','03','04','05','06','07','08','09','10','11','12','13','14']|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|40000|265500|0|0|0|0|180|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|92|0|247|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|93|0|250|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|94|0|253|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|95|0|255|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|96|0|257|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|97|0|259|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|98|0|261|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|99|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|100|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|101|0|269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|102|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|103|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|104|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|285|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|1166000|310000|0|0|0|0|155|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|106|0|287|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|107|0|289|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|108|0|293|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|109|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|110|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|111|0|304|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.src_env_sk :: if(in.src_env_sk!=800)800 else in.src_env_sk;
  out.dxf_src_sys_id :: if(in.dxf_src_sys_id!=800)800 else in.dxf_src_sys_id;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|275000|105500|0|0|0|0|177|RFMT : Assign proper src_env_sk|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|112|0|306|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|113|0|309|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|114|0|311|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|115|0|313|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|116|0|315|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|117|0|318|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|118|0|320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|119|0|324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|120|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|121|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|122|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|123|0|340|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|124|0|344|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|125|0|348|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort within Groups|1000000|345000|0|0|0|0|12719|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|126|0|350|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|127|0|353|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|128|0|356|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort within Groups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|129|0|358|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|130|0|361|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|131|0|367|0|{Subgraph created from graph "Graph3"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$FIX_ONLY_IDS|3|2|F$||{0|}}
}}@0|@1448500|294250|0|0|0|0|12730|XREF|ptondare|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1579000|520000|7|}}
{2010210004|XXGflow|132|0|369|0|{@{}@384|.5|.5|{0|}10964|17|}}
{2010210004|XXGflow|133|0|371|0|{@{}@384|.5|.5|{0|}10968|17|}}
{2010210004|XXGflow|134|0|373|0|{@{}@384|.5|.5|{0|}10956|17|}}
{2010210004|XXGflow|135|0|375|0|{@{}@384|.5|.5|{0|}10957|17|}}
{2010210004|XXGflow|136|0|377|0|{@{}@384|.5|.5|{0|}10967|17|}}
{2010210004|XXGflow|137|0|379|0|{@{}@384|.5|.5|{0|}10955|20|}}
{2010501005|XXGpvertex|138|0|381|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Broadcast|955000|114000|0|0|0|0|10914|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|139|0|383|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|140|0|386|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|141|0|389|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|142|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|143|0|394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|144|0|398|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|@1071000|84000|0|0|0|0|10958|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|145|0|400|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|146|0|403|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|147|0|406|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|148|0|409|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{2010203004|XXGoport|149|0|411|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|150|0|414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|151|0|418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|152|0|421|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_XREF_FILE|3|2|$|@{0|}}
}}@2|@1416000|67500|0|0|0|0|10951|OFIL : XREF DAT FILE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|153|0|423|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|154|0|426|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|155|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|156|0|434|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Dedup Sorted|784000|85000|0|0|0|0|10969|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|157|0|436|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|158|0|439|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|159|0|441|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|160|0|443|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|161|0|445|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|162|0|447|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|163|0|450|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|164|0|452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|165|0|455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|166|0|458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|167|0|461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|168|0|464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|169|0|467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|170|0|475|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_XREF_INDEX|3|2|$|@{0|}}
}}@2|@1290000|292500|0|0|0|0|10953|OFILE : XREF IDX FILE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|171|0|477|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|172|0|480|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|173|0|482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|174|0|487|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out.* :: in.*;
  out.dxf_hk.dxf_hk_part1 :: in.dxf_hk_part1;
  out.dxf_hk.dxf_hk_part2 :: in.dxf_hk_part2;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|286000|183500|0|0|0|0|10963|RFMT : Map fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|175|0|489|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|176|0|492|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|177|0|494|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|178|0|496|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|179|0|498|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|500|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|181|0|502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|182|0|506|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|183|0|509|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|184|0|512|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|185|0|515|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|186|0|522|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|605000|91500|0|0|0|0|10966|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|187|0|524|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|188|0|527|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|189|0|530|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|190|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|191|0|535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|192|0|542|0|{@{}@0|0|0|0|in0|.7211538461538461|@@@13840|0|}}
{2010110002|XXGconstant|193|0|546|0|{@{}@{1|9223894|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_5|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_6|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_7|}1|11|}
{2010601001|XXGgraph_vertex_vertex|11|0|22|0|{IDS|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}12|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_2|}12|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{OFIL_IDS_INDEX_file|}12|15|}
{2010211001|XXGvertex_iport_iport|15|0|30|0|{0|write|}15|16|}
{2010214001|XXGiport_src_flow|16|0|32|0|{0|}16|14|}
{2010007001|XXGobject_proto_object|17|0|33|0|{}15|17|}
{2010211001|XXGvertex_iport_iport|18|0|35|0|{0|write|}17|18|}
{2010006001|XXGobject_psameas_object|19|0|37|0|{metadata|write_metadata|1|0|}18|17|}
{2010006001|XXGobject_psameas_object|20|0|38|0|{write_metadata|index_metadata|0|0|}15|19|}
{2010212001|XXGvertex_oport_oport|21|0|40|0|{0|out|}19|20|}
{2010213001|XXGoport_dst_flow|22|0|42|0|{0|}20|13|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{1|index|}19|21|}
{2010213001|XXGoport_dst_flow|24|0|45|0|{0|}21|14|}
{2010212001|XXGvertex_oport_oport|25|0|46|0|{2|address|}19|22|}
{2010211001|XXGvertex_iport_iport|26|0|48|0|{0|in|}19|23|}
{2010007001|XXGobject_proto_object|27|0|50|0|{}19|24|}
{2010212001|XXGvertex_oport_oport|28|0|52|0|{0|out|}24|25|}
{2010006001|XXGobject_psameas_object|29|0|54|0|{metadata|out_metadata|1|0|}25|24|}
{2010212001|XXGvertex_oport_oport|30|0|55|0|{1|index|}24|26|}
{2010006001|XXGobject_psameas_object|31|0|57|0|{metadata|index_metadata|1|0|}26|24|}
{2010212001|XXGvertex_oport_oport|32|0|58|0|{2|address|}24|27|}
{2010006001|XXGobject_psameas_object|33|0|60|0|{metadata|address_metadata|1|0|}27|24|}
{2010211001|XXGvertex_iport_iport|34|0|61|0|{0|in|}24|28|}
{2010006001|XXGobject_psameas_object|35|0|63|0|{metadata|in_metadata|1|0|}28|24|}
{2010006001|XXGobject_psameas_object|36|0|64|0|{Layout|Layout|0|0|}19|15|}
{2010006001|XXGobject_psameas_object|37|0|65|0|{in_metadata|read_metadata|0|0|}19|29|}
{2010212001|XXGvertex_oport_oport|38|0|67|0|{0|read|}29|30|}
{2010213001|XXGoport_dst_flow|39|0|69|0|{0|}30|5|}
{2010007001|XXGobject_proto_object|40|0|70|0|{}29|31|}
{2010212001|XXGvertex_oport_oport|41|0|72|0|{0|read|}31|32|}
{2010006001|XXGobject_psameas_object|42|0|74|0|{metadata|read_metadata|1|0|}32|31|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{out_metadata|write_metadata|0|0|}19|33|}
{2010211001|XXGvertex_iport_iport|44|0|77|0|{0|write|}33|34|}
{2010214001|XXGiport_src_flow|45|0|79|0|{0|}34|13|}
{2010007001|XXGobject_proto_object|46|0|80|0|{}33|35|}
{2010211001|XXGvertex_iport_iport|47|0|82|0|{0|write|}35|36|}
{2010006001|XXGobject_psameas_object|48|0|84|0|{metadata|write_metadata|1|0|}36|35|}
{2010601001|XXGgraph_vertex_vertex|49|0|85|0|{OFIL_IDS_file|}12|33|}
{2010601001|XXGgraph_vertex_vertex|50|0|86|0|{Write_Block_Compressed_Lookup|}12|19|}
{2010211001|XXGvertex_iport_iport|51|0|87|0|{0|in0|}12|37|}
{2010215002|XXGiport_binding_iport|52|0|89|0|{.5|.5|{0|}10586|}37|23|}
{2010214001|XXGiport_src_flow|53|0|90|0|{0|}37|9|}
{2010601001|XXGgraph_vertex_vertex|54|0|91|0|{Input_File|}1|29|}
{2010601001|XXGgraph_vertex_vertex|55|0|92|0|{PBKS_ICFF_KEY_|}1|38|}
{2010604001|XXGgraph_flow_flow|56|0|94|0|{Flow_1|}38|39|}
{2010601001|XXGgraph_vertex_vertex|57|0|96|0|{Partition_by_Key|}38|40|}
{2010212001|XXGvertex_oport_oport|58|0|98|0|{0|out|}40|41|}
{2010213001|XXGoport_dst_flow|59|0|100|0|{0|}41|39|}
{2010211001|XXGvertex_iport_iport|60|0|101|0|{0|in|}40|42|}
{2010006001|XXGobject_psameas_object|61|0|103|0|{in_metadata|read_metadata|0|0|}40|29|}
{2010006001|XXGobject_psameas_object|62|0|104|0|{out_metadata|read_metadata|0|0|}40|29|}
{2010601001|XXGgraph_vertex_vertex|63|0|105|0|{Sort|}38|43|}
{2010212001|XXGvertex_oport_oport|64|0|107|0|{0|out|}43|44|}
{2010211001|XXGvertex_iport_iport|65|0|109|0|{0|in|}43|45|}
{2010214001|XXGiport_src_flow|66|0|111|0|{0|}45|39|}
{2010006001|XXGobject_psameas_object|67|0|112|0|{in_metadata|read_metadata|0|0|}43|29|}
{2010006001|XXGobject_psameas_object|68|0|113|0|{out_metadata|read_metadata|0|0|}43|29|}
{2010212001|XXGvertex_oport_oport|69|0|114|0|{0|out0|}38|46|}
{2010216002|XXGoport_binding_oport|70|0|116|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}46|44|}
{2010213001|XXGoport_dst_flow|71|0|117|0|{0|}46|11|}
{2010211001|XXGvertex_iport_iport|72|0|118|0|{0|in0|}38|47|}
{2010215002|XXGiport_binding_iport|73|0|120|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}47|42|}
{2010214001|XXGiport_src_flow|74|0|121|0|{0|}47|7|}
{2010007001|XXGobject_proto_object|75|0|122|0|{}38|48|}
{2010604001|XXGgraph_flow_flow|76|0|124|0|{Flow_1|}48|49|}
{2010601001|XXGgraph_vertex_vertex|77|0|126|0|{Partition_by_Key|}48|50|}
{2010212001|XXGvertex_oport_oport|78|0|128|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|79|0|130|0|{0|}51|49|}
{2010211001|XXGvertex_iport_iport|80|0|131|0|{0|in|}50|52|}
{2010007001|XXGobject_proto_object|81|0|133|0|{}50|53|}
{2010212001|XXGvertex_oport_oport|82|0|135|0|{0|out|}53|54|}
{2010006001|XXGobject_psameas_object|83|0|137|0|{metadata|out_metadata|1|0|}54|53|}
{2010211001|XXGvertex_iport_iport|84|0|138|0|{0|in|}53|55|}
{2010006001|XXGobject_psameas_object|85|0|140|0|{metadata|in_metadata|1|0|}55|53|}
{2010006001|XXGobject_psameas_object|86|0|141|0|{Layout|InputLayout|1|0|}50|48|}
{2010006001|XXGobject_psameas_object|87|0|142|0|{key|Key|1|0|}50|48|}
{2010601001|XXGgraph_vertex_vertex|88|0|143|0|{Sort|}48|56|}
{2010212001|XXGvertex_oport_oport|89|0|145|0|{0|out|}56|57|}
{2010211001|XXGvertex_iport_iport|90|0|147|0|{0|in|}56|58|}
{2010214001|XXGiport_src_flow|91|0|149|0|{0|}58|49|}
{2010007001|XXGobject_proto_object|92|0|150|0|{}56|59|}
{2010212001|XXGvertex_oport_oport|93|0|152|0|{0|out|}59|60|}
{2010006001|XXGobject_psameas_object|94|0|154|0|{metadata|out_metadata|1|0|}60|59|}
{2010211001|XXGvertex_iport_iport|95|0|155|0|{0|in|}59|61|}
{2010006001|XXGobject_psameas_object|96|0|157|0|{metadata|in_metadata|1|0|}61|59|}
{2010006001|XXGobject_psameas_object|97|0|158|0|{Layout|OutputLayout|1|0|}56|48|}
{2010006001|XXGobject_psameas_object|98|0|159|0|{key|Key|1|0|}56|48|}
{2010006001|XXGobject_psameas_object|99|0|160|0|{max_core|Max_core|1|0|}56|48|}
{2010212001|XXGvertex_oport_oport|100|0|161|0|{0|out0|}48|62|}
{2010216002|XXGoport_binding_oport|101|0|163|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}62|57|}
{2010211001|XXGvertex_iport_iport|102|0|164|0|{0|in0|}48|63|}
{2010215002|XXGiport_binding_iport|103|0|166|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}63|52|}
{2010006001|XXGobject_psameas_object|104|0|167|0|{InputLayout|Layout|0|0|}38|64|}
{2010212001|XXGvertex_oport_oport|105|0|169|0|{0|out|}64|65|}
{2010212001|XXGvertex_oport_oport|106|0|171|0|{1|deselect|}64|66|}
{2010212001|XXGvertex_oport_oport|107|0|173|0|{2|reject|}64|67|}
{2010212001|XXGvertex_oport_oport|108|0|175|0|{3|error|}64|68|}
{2010212001|XXGvertex_oport_oport|109|0|177|0|{4|log|}64|69|}
{2010211001|XXGvertex_iport_iport|110|0|179|0|{0|in|}64|70|}
{2010007001|XXGobject_proto_object|111|0|181|0|{}64|71|}
{2010212001|XXGvertex_oport_oport|112|0|183|0|{0|out|}71|72|}
{2010006001|XXGobject_psameas_object|113|0|185|0|{metadata|out_metadata|1|0|}72|71|}
{2010212001|XXGvertex_oport_oport|114|0|186|0|{1|deselect|}71|73|}
{2010006001|XXGobject_psameas_object|115|0|188|0|{metadata|deselect_metadata|1|0|}73|71|}
{2010212001|XXGvertex_oport_oport|116|0|189|0|{2|reject|}71|74|}
{2010006001|XXGobject_psameas_object|117|0|191|0|{metadata|reject_metadata|1|0|}74|71|}
{2010212001|XXGvertex_oport_oport|118|0|192|0|{3|error|}71|75|}
{2010006001|XXGobject_psameas_object|119|0|194|0|{metadata|error_metadata|1|0|}75|71|}
{2010212001|XXGvertex_oport_oport|120|0|195|0|{4|log|}71|76|}
{2010006001|XXGobject_psameas_object|121|0|197|0|{metadata|log_metadata|1|0|}76|71|}
{2010211001|XXGvertex_iport_iport|122|0|198|0|{0|in|}71|77|}
{2010006001|XXGobject_psameas_object|123|0|200|0|{metadata|in_metadata|1|0|}77|71|}
{2010006001|XXGobject_psameas_object|124|0|201|0|{deselect_metadata|read_metadata|0|0|}64|29|}
{2010006001|XXGobject_psameas_object|125|0|202|0|{in_metadata|read_metadata|0|0|}64|29|}
{2010006001|XXGobject_psameas_object|126|0|203|0|{out_metadata|read_metadata|0|0|}64|29|}
{2010006001|XXGobject_psameas_object|127|0|204|0|{reject_metadata|read_metadata|0|0|}64|29|}
{2010006001|XXGobject_psameas_object|128|0|205|0|{OutputLayout|Layout|0|0|}38|78|}
{2010212001|XXGvertex_oport_oport|129|0|207|0|{0|out|}78|79|}
{2010213001|XXGoport_dst_flow|130|0|209|0|{0|}79|8|}
{2010213001|XXGoport_dst_flow|131|0|210|0|{1|}79|9|}
{2010211001|XXGvertex_iport_iport|132|0|211|0|{0|in|}78|80|}
{2010214001|XXGiport_src_flow|133|0|213|0|{0|}80|10|}
{2010007001|XXGobject_proto_object|134|0|214|0|{}78|81|}
{2010212001|XXGvertex_oport_oport|135|0|216|0|{0|out|}81|82|}
{2010006001|XXGobject_psameas_object|136|0|218|0|{metadata|out_metadata|1|0|}82|81|}
{2010211001|XXGvertex_iport_iport|137|0|219|0|{0|in|}81|83|}
{2010006001|XXGobject_psameas_object|138|0|221|0|{metadata|in_metadata|1|0|}83|81|}
{2010006001|XXGobject_psameas_object|139|0|222|0|{in_metadata|read_metadata|0|0|}78|29|}
{2010006001|XXGobject_psameas_object|140|0|223|0|{out_metadata|read_metadata|0|0|}78|29|}
{2010601001|XXGgraph_vertex_vertex|141|0|224|0|{Remove_records_without_preceding_0_in_cob_pricing_type_cd|}1|84|}
{2010601001|XXGgraph_vertex_vertex|142|0|226|0|{FBE_Remove_records_with_wrong_cob_pricing_ctype_d|}84|64|}
{2010212001|XXGvertex_oport_oport|143|0|227|0|{0|out0|}84|85|}
{2010216002|XXGoport_binding_oport|144|0|229|0|{.5|.5|{0|}12602|}85|65|}
{2010213001|XXGoport_dst_flow|145|0|230|0|{0|}85|7|}
{2010211001|XXGvertex_iport_iport|146|0|231|0|{0|in0|}84|86|}
{2010215002|XXGiport_binding_iport|147|0|233|0|{.5|.5|{0|}12601|}86|70|}
{2010214001|XXGiport_src_flow|148|0|234|0|{0|}86|6|}
{2010601001|XXGgraph_vertex_vertex|149|0|235|0|{Replicate|}1|78|}
{2010601001|XXGgraph_vertex_vertex|150|0|236|0|{Reset_src_env_sk|}1|87|}
{2010604001|XXGgraph_flow_flow|151|0|238|0|{Flow_1|}87|88|}
{2010604001|XXGgraph_flow_flow|152|0|240|0|{Flow_3|}87|89|}
{2010604001|XXGgraph_flow_flow|153|0|242|0|{Flow_6|}87|90|}
{2010601001|XXGgraph_vertex_vertex|154|0|244|0|{Filter_by_Expression|}87|91|}
{2010212001|XXGvertex_oport_oport|155|0|246|0|{0|out|}91|92|}
{2010213001|XXGoport_dst_flow|156|0|248|0|{0|}92|90|}
{2010212001|XXGvertex_oport_oport|157|0|249|0|{1|deselect|}91|93|}
{2010213001|XXGoport_dst_flow|158|0|251|0|{0|}93|89|}
{2010212001|XXGvertex_oport_oport|159|0|252|0|{2|reject|}91|94|}
{2010212001|XXGvertex_oport_oport|160|0|254|0|{3|error|}91|95|}
{2010212001|XXGvertex_oport_oport|161|0|256|0|{4|log|}91|96|}
{2010211001|XXGvertex_iport_iport|162|0|258|0|{0|in|}91|97|}
{2010007001|XXGobject_proto_object|163|0|260|0|{}91|98|}
{2010212001|XXGvertex_oport_oport|164|0|262|0|{0|out|}98|99|}
{2010006001|XXGobject_psameas_object|165|0|264|0|{metadata|out_metadata|1|0|}99|98|}
{2010212001|XXGvertex_oport_oport|166|0|265|0|{1|deselect|}98|100|}
{2010006001|XXGobject_psameas_object|167|0|267|0|{metadata|deselect_metadata|1|0|}100|98|}
{2010212001|XXGvertex_oport_oport|168|0|268|0|{2|reject|}98|101|}
{2010006001|XXGobject_psameas_object|169|0|270|0|{metadata|reject_metadata|1|0|}101|98|}
{2010212001|XXGvertex_oport_oport|170|0|271|0|{3|error|}98|102|}
{2010006001|XXGobject_psameas_object|171|0|273|0|{metadata|error_metadata|1|0|}102|98|}
{2010212001|XXGvertex_oport_oport|172|0|274|0|{4|log|}98|103|}
{2010006001|XXGobject_psameas_object|173|0|276|0|{metadata|log_metadata|1|0|}103|98|}
{2010211001|XXGvertex_iport_iport|174|0|277|0|{0|in|}98|104|}
{2010006001|XXGobject_psameas_object|175|0|279|0|{metadata|in_metadata|1|0|}104|98|}
{2010006001|XXGobject_psameas_object|176|0|280|0|{deselect_metadata|read_metadata|0|0|}91|29|}
{2010006001|XXGobject_psameas_object|177|0|281|0|{in_metadata|read_metadata|0|0|}91|29|}
{2010006001|XXGobject_psameas_object|178|0|282|0|{out_metadata|read_metadata|0|0|}91|29|}
{2010006001|XXGobject_psameas_object|179|0|283|0|{reject_metadata|read_metadata|0|0|}91|29|}
{2010601001|XXGgraph_vertex_vertex|180|0|284|0|{Gather|}87|105|}
{2010212001|XXGvertex_oport_oport|181|0|286|0|{0|out|}105|106|}
{2010211001|XXGvertex_iport_iport|182|0|288|0|{0|in|}105|107|}
{2010214001|XXGiport_src_flow|183|0|290|0|{0|}107|88|}
{2010214001|XXGiport_src_flow|184|0|291|0|{1|}107|89|}
{2010007001|XXGobject_proto_object|185|0|292|0|{}105|108|}
{2010212001|XXGvertex_oport_oport|186|0|294|0|{0|out|}108|109|}
{2010006001|XXGobject_psameas_object|187|0|296|0|{metadata|out_metadata|1|0|}109|108|}
{2010211001|XXGvertex_iport_iport|188|0|297|0|{0|in|}108|110|}
{2010006001|XXGobject_psameas_object|189|0|299|0|{metadata|in_metadata|1|0|}110|108|}
{2010006001|XXGobject_psameas_object|190|0|300|0|{Layout|Layout|0|0|}105|64|}
{2010006001|XXGobject_psameas_object|191|0|301|0|{in_metadata|read_metadata|0|0|}105|29|}
{2010006001|XXGobject_psameas_object|192|0|302|0|{out_metadata|read_metadata|0|0|}105|29|}
{2010601001|XXGgraph_vertex_vertex|193|0|303|0|{RFMT_Assign_proper_src_env_sk|}87|111|}
{2010212001|XXGvertex_oport_oport|194|0|305|0|{0|out0|}111|112|}
{2010213001|XXGoport_dst_flow|195|0|307|0|{0|}112|88|}
{2010212001|XXGvertex_oport_oport|196|0|308|0|{1|reject0|}111|113|}
{2010212001|XXGvertex_oport_oport|197|0|310|0|{2|error0|}111|114|}
{2010212001|XXGvertex_oport_oport|198|0|312|0|{3|log|}111|115|}
{2010211001|XXGvertex_iport_iport|199|0|314|0|{0|in|}111|116|}
{2010214001|XXGiport_src_flow|200|0|316|0|{0|}116|90|}
{2010007001|XXGobject_proto_object|201|0|317|0|{}111|117|}
{2010212001|XXGvertex_oport_oport|202|0|319|0|{0|out0|}117|118|}
{2010006001|XXGobject_psameas_object|203|0|321|0|{metadata|out0_metadata|1|0|}118|117|}
{2010006001|XXGobject_psameas_object|204|0|322|0|{transform0|transform0|1|0|}118|117|}
{2010212001|XXGvertex_oport_oport|205|0|323|0|{1|reject0|}117|119|}
{2010006001|XXGobject_psameas_object|206|0|325|0|{metadata|reject0_metadata|1|0|}119|117|}
{2010212001|XXGvertex_oport_oport|207|0|326|0|{2|error0|}117|120|}
{2010006001|XXGobject_psameas_object|208|0|328|0|{metadata|error0_metadata|1|0|}120|117|}
{2010212001|XXGvertex_oport_oport|209|0|329|0|{3|log|}117|121|}
{2010006001|XXGobject_psameas_object|210|0|331|0|{metadata|log_metadata|1|0|}121|117|}
{2010211001|XXGvertex_iport_iport|211|0|332|0|{0|in|}117|122|}
{2010006001|XXGobject_psameas_object|212|0|334|0|{metadata|in_metadata|1|0|}122|117|}
{2010006001|XXGobject_psameas_object|213|0|335|0|{Layout|Layout|0|0|}111|64|}
{2010006001|XXGobject_psameas_object|214|0|336|0|{in_metadata|read_metadata|0|0|}111|29|}
{2010006001|XXGobject_psameas_object|215|0|337|0|{out0_metadata|read_metadata|0|0|}111|29|}
{2010006001|XXGobject_psameas_object|216|0|338|0|{reject0_metadata|read_metadata|0|0|}111|29|}
{2010212001|XXGvertex_oport_oport|217|0|339|0|{0|out0|}87|123|}
{2010216002|XXGoport_binding_oport|218|0|341|0|{.5|.5|{0|}170|}123|106|}
{2010213001|XXGoport_dst_flow|219|0|342|0|{0|}123|6|}
{2010211001|XXGvertex_iport_iport|220|0|343|0|{0|in0|}87|124|}
{2010215002|XXGiport_binding_iport|221|0|345|0|{.5|.5|{0|}169|}124|97|}
{2010214001|XXGiport_src_flow|222|0|346|0|{0|}124|5|}
{2010601001|XXGgraph_vertex_vertex|223|0|347|0|{Sort_within_Groups|}1|125|}
{2010212001|XXGvertex_oport_oport|224|0|349|0|{0|out|}125|126|}
{2010213001|XXGoport_dst_flow|225|0|351|0|{0|}126|10|}
{2010211001|XXGvertex_iport_iport|226|0|352|0|{0|in|}125|127|}
{2010214001|XXGiport_src_flow|227|0|354|0|{0|}127|11|}
{2010007001|XXGobject_proto_object|228|0|355|0|{}125|128|}
{2010212001|XXGvertex_oport_oport|229|0|357|0|{0|out|}128|129|}
{2010006001|XXGobject_psameas_object|230|0|359|0|{metadata|out_metadata|1|0|}129|128|}
{2010211001|XXGvertex_iport_iport|231|0|360|0|{0|in|}128|130|}
{2010006001|XXGobject_psameas_object|232|0|362|0|{metadata|in_metadata|1|0|}130|128|}
{2010006001|XXGobject_psameas_object|233|0|363|0|{Layout|Layout|0|0|}125|78|}
{2010006001|XXGobject_psameas_object|234|0|364|0|{in_metadata|read_metadata|0|0|}125|29|}
{2010006001|XXGobject_psameas_object|235|0|365|0|{out_metadata|read_metadata|0|0|}125|29|}
{2010601001|XXGgraph_vertex_vertex|236|0|366|0|{XREF|}1|131|}
{2010604001|XXGgraph_flow_flow|237|0|368|0|{Flow_1|}131|132|}
{2010604001|XXGgraph_flow_flow|238|0|370|0|{Flow_2|}131|133|}
{2010604001|XXGgraph_flow_flow|239|0|372|0|{Flow_3|}131|134|}
{2010604001|XXGgraph_flow_flow|240|0|374|0|{Flow_4|}131|135|}
{2010604001|XXGgraph_flow_flow|241|0|376|0|{Flow_5|}131|136|}
{2010604001|XXGgraph_flow_flow|242|0|378|0|{Flow_7|}131|137|}
{2010601001|XXGgraph_vertex_vertex|243|0|380|0|{Broadcast|}131|138|}
{2010212001|XXGvertex_oport_oport|244|0|382|0|{0|out|}138|139|}
{2010213001|XXGoport_dst_flow|245|0|384|0|{0|}139|137|}
{2010211001|XXGvertex_iport_iport|246|0|385|0|{0|in|}138|140|}
{2010214001|XXGiport_src_flow|247|0|387|0|{0|}140|133|}
{2010007001|XXGobject_proto_object|248|0|388|0|{}138|141|}
{2010212001|XXGvertex_oport_oport|249|0|390|0|{0|out|}141|142|}
{2010006001|XXGobject_psameas_object|250|0|392|0|{metadata|out_metadata|1|0|}142|141|}
{2010211001|XXGvertex_iport_iport|251|0|393|0|{0|in|}141|143|}
{2010006001|XXGobject_psameas_object|252|0|395|0|{metadata|in_metadata|1|0|}143|141|}
{2010006001|XXGobject_psameas_object|253|0|396|0|{Layout|Layout|0|0|}138|78|}
{2010006001|XXGobject_psameas_object|254|0|397|0|{in_metadata|out_metadata|0|0|}138|144|}
{2010212001|XXGvertex_oport_oport|255|0|399|0|{0|out|}144|145|}
{2010213001|XXGoport_dst_flow|256|0|401|0|{0|}145|134|}
{2010212001|XXGvertex_oport_oport|257|0|402|0|{1|index0|}144|146|}
{2010213001|XXGoport_dst_flow|258|0|404|0|{0|}146|135|}
{2010211001|XXGvertex_iport_iport|259|0|405|0|{0|in|}144|147|}
{2010214001|XXGiport_src_flow|260|0|407|0|{0|}147|137|}
{2010007001|XXGobject_proto_object|261|0|408|0|{}144|148|}
{2010212001|XXGvertex_oport_oport|262|0|410|0|{0|out|}148|149|}
{2010006001|XXGobject_psameas_object|263|0|412|0|{metadata|out_metadata|1|0|}149|148|}
{2010212001|XXGvertex_oport_oport|264|0|413|0|{1|index0|}148|150|}
{2010006001|XXGobject_psameas_object|265|0|415|0|{key0|key0|1|0|}150|148|}
{2010006001|XXGobject_psameas_object|266|0|416|0|{metadata|index0_metadata|1|0|}150|148|}
{2010211001|XXGvertex_iport_iport|267|0|417|0|{0|in|}148|151|}
{2010006001|XXGobject_psameas_object|268|0|419|0|{metadata|in_metadata|1|0|}151|148|}
{2010006001|XXGobject_psameas_object|269|0|420|0|{Layout|Layout|0|0|}144|152|}
{2010211001|XXGvertex_iport_iport|270|0|422|0|{0|write|}152|153|}
{2010214001|XXGiport_src_flow|271|0|424|0|{0|}153|134|}
{2010007001|XXGobject_proto_object|272|0|425|0|{}152|154|}
{2010211001|XXGvertex_iport_iport|273|0|427|0|{0|write|}154|155|}
{2010006001|XXGobject_psameas_object|274|0|429|0|{metadata|write_metadata|1|0|}155|154|}
{2010006001|XXGobject_psameas_object|275|0|430|0|{write_metadata|out_metadata|0|0|}152|144|}
{2010006001|XXGobject_psameas_object|276|0|431|0|{in_metadata|out_metadata|0|0|}144|144|}
{2010006001|XXGobject_psameas_object|277|0|432|0|{out_metadata|out_metadata|0|0|}138|144|}
{2010601001|XXGgraph_vertex_vertex|278|0|433|0|{Dedup_Sorted|}131|156|}
{2010212001|XXGvertex_oport_oport|279|0|435|0|{0|out|}156|157|}
{2010213001|XXGoport_dst_flow|280|0|437|0|{0|}157|133|}
{2010212001|XXGvertex_oport_oport|281|0|438|0|{1|dup|}156|158|}
{2010212001|XXGvertex_oport_oport|282|0|440|0|{2|reject|}156|159|}
{2010212001|XXGvertex_oport_oport|283|0|442|0|{3|error|}156|160|}
{2010212001|XXGvertex_oport_oport|284|0|444|0|{4|log|}156|161|}
{2010211001|XXGvertex_iport_iport|285|0|446|0|{0|in|}156|162|}
{2010214001|XXGiport_src_flow|286|0|448|0|{0|}162|136|}
{2010007001|XXGobject_proto_object|287|0|449|0|{}156|163|}
{2010212001|XXGvertex_oport_oport|288|0|451|0|{0|out|}163|164|}
{2010006001|XXGobject_psameas_object|289|0|453|0|{metadata|out_metadata|1|0|}164|163|}
{2010212001|XXGvertex_oport_oport|290|0|454|0|{1|dup|}163|165|}
{2010006001|XXGobject_psameas_object|291|0|456|0|{metadata|dup_metadata|1|0|}165|163|}
{2010212001|XXGvertex_oport_oport|292|0|457|0|{2|reject|}163|166|}
{2010006001|XXGobject_psameas_object|293|0|459|0|{metadata|reject_metadata|1|0|}166|163|}
{2010212001|XXGvertex_oport_oport|294|0|460|0|{3|error|}163|167|}
{2010006001|XXGobject_psameas_object|295|0|462|0|{metadata|error_metadata|1|0|}167|163|}
{2010212001|XXGvertex_oport_oport|296|0|463|0|{4|log|}163|168|}
{2010006001|XXGobject_psameas_object|297|0|465|0|{metadata|log_metadata|1|0|}168|163|}
{2010211001|XXGvertex_iport_iport|298|0|466|0|{0|in|}163|169|}
{2010006001|XXGobject_psameas_object|299|0|468|0|{metadata|in_metadata|1|0|}169|163|}
{2010006001|XXGobject_psameas_object|300|0|469|0|{Layout|Layout|0|0|}156|78|}
{2010006001|XXGobject_psameas_object|301|0|470|0|{dup_metadata|out_metadata|0|0|}156|144|}
{2010006001|XXGobject_psameas_object|302|0|471|0|{in_metadata|out_metadata|0|0|}156|144|}
{2010006001|XXGobject_psameas_object|303|0|472|0|{out_metadata|out_metadata|0|0|}156|144|}
{2010006001|XXGobject_psameas_object|304|0|473|0|{reject_metadata|out_metadata|0|0|}156|144|}
{2010601001|XXGgraph_vertex_vertex|305|0|474|0|{OFILE_XREF_IDX_FILE|}131|170|}
{2010211001|XXGvertex_iport_iport|306|0|476|0|{0|write|}170|171|}
{2010214001|XXGiport_src_flow|307|0|478|0|{0|}171|135|}
{2010007001|XXGobject_proto_object|308|0|479|0|{}170|172|}
{2010211001|XXGvertex_iport_iport|309|0|481|0|{0|write|}172|173|}
{2010006001|XXGobject_psameas_object|310|0|483|0|{metadata|write_metadata|1|0|}173|172|}
{2010006001|XXGobject_psameas_object|311|0|484|0|{write_metadata|index0_metadata|0|0|}170|144|}
{2010601001|XXGgraph_vertex_vertex|312|0|485|0|{OFIL_XREF_DAT_FILE|}131|152|}
{2010601001|XXGgraph_vertex_vertex|313|0|486|0|{RFMT_Map_fields|}131|174|}
{2010212001|XXGvertex_oport_oport|314|0|488|0|{0|out0|}174|175|}
{2010213001|XXGoport_dst_flow|315|0|490|0|{0|}175|132|}
{2010212001|XXGvertex_oport_oport|316|0|491|0|{1|reject0|}174|176|}
{2010212001|XXGvertex_oport_oport|317|0|493|0|{2|error0|}174|177|}
{2010212001|XXGvertex_oport_oport|318|0|495|0|{3|log|}174|178|}
{2010211001|XXGvertex_iport_iport|319|0|497|0|{0|in|}174|179|}
{2010007001|XXGobject_proto_object|320|0|499|0|{}174|180|}
{2010212001|XXGvertex_oport_oport|321|0|501|0|{0|out0|}180|181|}
{2010006001|XXGobject_psameas_object|322|0|503|0|{metadata|out0_metadata|1|0|}181|180|}
{2010006001|XXGobject_psameas_object|323|0|504|0|{transform0|transform0|1|0|}181|180|}
{2010212001|XXGvertex_oport_oport|324|0|505|0|{1|reject0|}180|182|}
{2010006001|XXGobject_psameas_object|325|0|507|0|{metadata|reject0_metadata|1|0|}182|180|}
{2010212001|XXGvertex_oport_oport|326|0|508|0|{2|error0|}180|183|}
{2010006001|XXGobject_psameas_object|327|0|510|0|{metadata|error0_metadata|1|0|}183|180|}
{2010212001|XXGvertex_oport_oport|328|0|511|0|{3|log|}180|184|}
{2010006001|XXGobject_psameas_object|329|0|513|0|{metadata|log_metadata|1|0|}184|180|}
{2010211001|XXGvertex_iport_iport|330|0|514|0|{0|in|}180|185|}
{2010006001|XXGobject_psameas_object|331|0|516|0|{metadata|in_metadata|1|0|}185|180|}
{2010006001|XXGobject_psameas_object|332|0|517|0|{Layout|Layout|0|0|}174|78|}
{2010006001|XXGobject_psameas_object|333|0|518|0|{in_metadata|read_metadata|0|0|}174|29|}
{2010006001|XXGobject_psameas_object|334|0|519|0|{out0_metadata|out_metadata|0|0|}174|144|}
{2010006001|XXGobject_psameas_object|335|0|520|0|{reject0_metadata|read_metadata|0|0|}174|29|}
{2010601001|XXGgraph_vertex_vertex|336|0|521|0|{Sort|}131|186|}
{2010212001|XXGvertex_oport_oport|337|0|523|0|{0|out|}186|187|}
{2010213001|XXGoport_dst_flow|338|0|525|0|{0|}187|136|}
{2010211001|XXGvertex_iport_iport|339|0|526|0|{0|in|}186|188|}
{2010214001|XXGiport_src_flow|340|0|528|0|{0|}188|132|}
{2010007001|XXGobject_proto_object|341|0|529|0|{}186|189|}
{2010212001|XXGvertex_oport_oport|342|0|531|0|{0|out|}189|190|}
{2010006001|XXGobject_psameas_object|343|0|533|0|{metadata|out_metadata|1|0|}190|189|}
{2010211001|XXGvertex_iport_iport|344|0|534|0|{0|in|}189|191|}
{2010006001|XXGobject_psameas_object|345|0|536|0|{metadata|in_metadata|1|0|}191|189|}
{2010006001|XXGobject_psameas_object|346|0|537|0|{Layout|Layout|0|0|}186|78|}
{2010006001|XXGobject_psameas_object|347|0|538|0|{in_metadata|out_metadata|0|0|}186|144|}
{2010006001|XXGobject_psameas_object|348|0|539|0|{out_metadata|out_metadata|0|0|}186|144|}
{2010601001|XXGgraph_vertex_vertex|349|0|540|0|{Write_Lookup|}131|144|}
{2010211001|XXGvertex_iport_iport|350|0|541|0|{0|in0|}131|192|}
{2010215002|XXGiport_binding_iport|351|0|543|0|{.5|.5|{0|}10962|}192|179|}
{2010214001|XXGiport_src_flow|352|0|544|0|{0|}192|8|}
{2010109001|XXGobject_property_value|353|0|545|0|{0|TrackingThumbprint|72|}1|193|}
