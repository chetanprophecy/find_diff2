@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|221|rel_count|391|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|TABLE_NAME|d_cag|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_FL|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_common/one/$\{TABLE_NAME\}.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_DML|$PUB_DATAHUB_DML/ids_common/ids_common.$\{TABLE_NAME\}.dml|3|9|FK|@{0|}}
{30001002|XXparameter|NK|\{carrier_id; account_id; employer_group_id\}|3|9|RFK|@{0|}}
{30001002|XXparameter|RUN_ID|$[now1()]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_IDS_FILE_PATH|$IDS_FL|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_IDS_INDEX_PATH|$[ string_replace (  OUTPUT_IDS_FILE_PATH, ".dat.gz",".idx") ]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_XREF_FILE|$[ string_replace (  IDS_FL, "one/","xref/xref.") ]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_XREF_INDEX|$[ string_replace (  OUTPUT_XREF_FILE, ".dat.gz",".idx") ]|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_IDS_INDEX_FILE_PATH|$[ string_replace (  OUTPUT_IDS_FILE_PATH, ".dat.gz",".idx") ]|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|d_cag_ids_fix_hash_calc|ndeotars|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1617000|510000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'd_cag_ids_fix_hash_calc' Execution Status Report

Job completed successfully at Friday, July 27, 2018 09:02:04
Run performed by user ndeotars
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@filter the records with wrong sk
as there due to wrong HK|206000|290000|0|0|0|0|13134|}}
{2010242002|XXGface|6|0|11|0|{@{}@Times New Roman|16711680|120|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@re-caluate the hash for impacted records
|491000|290000|0|0|0|0|13135|}}
{2010242002|XXGface|8|0|15|0|{@{}@Times New Roman|16711680|120|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@re-partition on dxf_hk_part1
 and sort|802000|297000|0|0|0|0|13174|}}
{2010242002|XXGface|10|0|19|0|{@{}@Times New Roman|16711680|120|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@write xref file|1482000|176000|0|0|0|0|13175|}}
{2010242002|XXGface|12|0|23|0|{@{}@Times New Roman|16711680|120|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13223|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}13231|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}13233|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}13234|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}13206|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}13207|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}13173|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}13155|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}13235|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}13230|2065|}}
{2010600005|XXGgraph|23|0|45|0|{Subgraph created from graph "Graph3"|{}@0|@1482000|307750|0|0|0|0|13210|IDS|ptondare|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|846000|354000|7|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}10612|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}10609|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}10598|2065|}}
{2010503005|XXGfvertex|27|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_INDEX_FILE_PATH|3|2|$|@{0|}}
}}@1|@578000|240000|0|0|0|0|10595|OFIL : IDS INDEX file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|28|0|55|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|29|0|58|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|30|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|31|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@40000|131000|0|0|0|0|10610|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|32|0|65|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|33|0|68|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|34|0|71|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|35|0|73|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|75|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|37|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|38|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|39|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|40|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|41|0|90|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
   
  let d_prod_disease_cat_xwalk_lkp  = lookup("d_prod_disease_category_xwalk", in.prod_id) ;
  out.dise_cat_nm    :1:  if(in.dise_cat_sk    == 0 ) first_without_error ( d_prod_disease_cat_xwalk_lkp.dise_cat_nm ,in.dise_cat_nm    ) ; 
  out.thrpc_class_nm :1:  if(in.thrpc_class_sk == 0 ) first_without_error ( d_prod_disease_cat_xwalk_lkp.prod_grp    ,in.thrpc_class_nm ) ;
   
  out.* :: in.*;
  
end;|3|3|c|@{0|}}
{30001002|XXparameter|out1_metadata|$IDS_DML|3|2|f$|@{0|}}
{30001002|XXparameter|output_index|include "~$PUB_DXF_DML/generic_data_types.dml";
include "~$PUB_DXF_XFR/common_functions.xfr";
output_index_out::output_index(in)=
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '$\{NK\}'));
   
   output_index_out :: if( in.dxf_hk_part1 == dxf_hk.dxf_hk_part1 && in.dxf_hk_part2==dxf_hk.dxf_hk_part2 )  0 else 1 ;
   
end;|3|3|c|@{0|}}
{30001002|XXparameter|transform1|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '$\{NK\}'));
   let d_prod_disease_cat_xwalk_lkp  = lookup("d_prod_disease_category_xwalk", in.prod_id) ;
   
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;

  out.dise_cat_nm    :1:  if(in.dise_cat_sk    == 0 ) first_without_error ( d_prod_disease_cat_xwalk_lkp.dise_cat_nm ,in.dise_cat_nm    ) ; 
  out.thrpc_class_nm :1:  if(in.thrpc_class_sk == 0 ) first_without_error ( d_prod_disease_cat_xwalk_lkp.prod_grp    ,in.thrpc_class_nm ) ;
  
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|570000|161000|0|0|0|0|13236|RFMT : Recalculate hash|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|42|0|92|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|43|0|95|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|44|0|98|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|45|0|100|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|46|0|102|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|104|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|48|0|106|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|108|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|50|0|111|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|51|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|52|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|53|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|54|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|55|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|56|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|57|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|59|0|139|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_TEMP/wrong_sk.rej", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/wrong_sk.rej|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@390000|315000|0|0|0|0|472|OFIL : Records with wrong sk's|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|60|0|141|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|61|0|143|0|{@{}@384|.5|.5|{0|}475|17|}}
{2010503005|XXGfvertex|62|0|145|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|63|0|147|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|64|0|150|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$IDS_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$IDS_DML|3|2|f$|@{0|}}
}}@0|@26000|185250|0|0|0|0|13217|IFIL : Read IDS file|Ab Initio Software|@1|1000000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|65|0|152|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|66|0|155|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|67|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|68|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@1|@473000|85000|0|0|0|0|10613|OFIL : IDS file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|69|0|166|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|70|0|169|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|71|0|171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|72|0|174|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_IDS_INDEX_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$IDS_DML|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@1|@623000|80000|0|0|0|0|10599|OFIL : IDS INDEX file-1|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|73|0|176|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|74|0|179|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|75|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|76|0|185|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|Trash|748000|70000|0|0|0|0|10597|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010202004|XXGiport|77|0|187|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|190|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|79|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|80|0|197|0|{@{}@0|0|0|0|in0|.6109422492401215|@@@13840|0|}}
{2010600005|XXGgraph|81|0|202|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@795000|187750|0|0|481000|303000|13176|PBKS: \{dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|82|0|204|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|83|0|206|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|208|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|85|0|211|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|215|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|217|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|88|0|219|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|89|0|224|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|90|0|228|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|91|0|233|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|92|0|235|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|93|0|237|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|94|0|239|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|95|0|242|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|96|0|244|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|97|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|98|0|249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|99|0|254|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|256|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|101|0|258|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|102|0|261|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|103|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|104|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|105|0|272|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|106|0|275|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|107|0|279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|1247000|215250|0|0|0|0|13179|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|108|0|281|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|109|0|285|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|110|0|288|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|111|0|290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|112|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|113|0|299|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";


/*Reformat operation*/

out::reformat(in)=
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '$\{NK\}'));
      
   out.dxf_hk_part1 :: if(in.cag_sk member [ vector 19662819,19662584,19661955,19664835,19660740,19665368,19659608,19661499,19664061,19664726,19665056,19663596,19660771,19663651,19658996,19660916,19661874,19660980,19661442,19665282,19658526,19660574,19664509,19662752,19659223,19661143,19661391,19661893,19661697,19661396,19659346,19658639,19664453,19661341,19662602,19658416,19664717,19661336,19664267,19663405,19665269,19661429,19660570,19663295,19662335,19661968,19662897,19658563,19665013,19661066,19663946,19658868,19662661,19663455,19660379,19658452,19658923,19664683,19661309,19662582,19663542,19665224,19658608,19658997,19662837,19658649,19663987,19659696,19661616,19658577,19664633,19662532,19664347,19662611,19660352,19661088,19660485,19664325,19664768,19665728,19663532,19664072,19661254,19663046,19663738,19665776,19660073,19659773,19658612,19659741,19664578,19658818,19660484,19661412,19665321,19661049,19658924,19659884,19665447,19658727,19658594,19665424,19658721,19664806,19665219,19662455,19665457,19659602,19663972,19665250,19661765,19663294,19662432,19663806,19664766,19661157,19664425,19665076,19659472,19665349,19663418,19664049,19662874,19659211,19661887,19663341,19660068,19660277,19661764,19665142,19663740,19664934,19661627,19663266,19662586,19663870,19658582,19663399,19661978,
   19661608,19660408,19663072,19662018,19665389,19659529,19660300,19662500,19662134,19662774,19661951,19661344,19659424,19658897,19664657,19663851,19663828,19661801,19664582,19661722,19663925,19662960,19659150,19660952,19663577,19663138,19661585,19663109,19664288,19658439,19659106,19664783,19664566,19660693,19659306,19660745,19663097,19658860,19661511,19660674,19662079,19662943,19662651,19659771,19659010,19663689,19663624,19659372,19658888,19660820,19659171,19665113,19658625,19659160,19661795,19660289,19661830,19658571,19659952,19658496,19660014,19663800,19665049,19664862,19664784,19664055,19663398,19660644,19662616,19660828,19660757,19659550,19661377,19660454,19663416,19658610,19659080,19663982,19659243,19663083,19661357,19664065,19661164,19661085,19663582,19664887,19659645,19660292,19662160,19665356,19658441,19660462,19662173,19658753,19658606,19661570,19664200,19658871,19659534,19664349,19663389,19658919,19664958,19661594,19660163,19660965,19660650,19664924,19659985,
   19662122,19659978,19662858,19659183,19665192 ])  dxf_hk.dxf_hk_part1 else in.dxf_hk_part1 ;
   
   out.dxf_hk_part2 :: if(in.cag_sk member [ vector 19662819,19662584,19661955,19664835,19660740,19665368,19659608,19661499,19664061,19664726,19665056,19663596,19660771,19663651,19658996,19660916,19661874,19660980,19661442,19665282,19658526,19660574,19664509,19662752,19659223,19661143,19661391,19661893,19661697,19661396,19659346,19658639,19664453,19661341,19662602,19658416,19664717,19661336,19664267,19663405,19665269,19661429,19660570,19663295,19662335,19661968,19662897,19658563,19665013,19661066,19663946,19658868,19662661,19663455,19660379,19658452,19658923,19664683,19661309,19662582,19663542,19665224,19658608,19658997,19662837,19658649,19663987,19659696,19661616,19658577,19664633,19662532,19664347,19662611,19660352,19661088,19660485,19664325,19664768,19665728,19663532,19664072,19661254,19663046,19663738,19665776,19660073,19659773,19658612,19659741,19664578,19658818,19660484,19661412,19665321,19661049,19658924,19659884,19665447,19658727,19658594,19665424,19658721,19664806,19665219,19662455,19665457,19659602,19663972,19665250,19661765,19663294,19662432,19663806,19664766,19661157,19664425,19665076,19659472,19665349,19663418,19664049,19662874,19659211,19661887,19663341,19660068,19660277,19661764,19665142,19663740,19664934,19661627,19663266,19662586,19663870,19658582,19663399,19661978,
   19661608,19660408,19663072,19662018,19665389,19659529,19660300,19662500,19662134,19662774,19661951,19661344,19659424,19658897,19664657,19663851,19663828,19661801,19664582,19661722,19663925,19662960,19659150,19660952,19663577,19663138,19661585,19663109,19664288,19658439,19659106,19664783,19664566,19660693,19659306,19660745,19663097,19658860,19661511,19660674,19662079,19662943,19662651,19659771,19659010,19663689,19663624,19659372,19658888,19660820,19659171,19665113,19658625,19659160,19661795,19660289,19661830,19658571,19659952,19658496,19660014,19663800,19665049,19664862,19664784,19664055,19663398,19660644,19662616,19660828,19660757,19659550,19661377,19660454,19663416,19658610,19659080,19663982,19659243,19663083,19661357,19664065,19661164,19661085,19663582,19664887,19659645,19660292,19662160,19665356,19658441,19660462,19662173,19658753,19658606,19661570,19664200,19658871,19659534,19664349,19663389,19658919,19664958,19661594,19660163,19660965,19660650,19664924,19659985,
   19662122,19659978,19662858,19659183,19665192 ]) dxf_hk.dxf_hk_part2 else in.dxf_hk_part2;


out.carrier_id :1: if(in.cag_sk member [ vector 19662819,19662584,19661955,19664835,19660740,19665368,19659608,19661499,19664061,19664726,19665056,19663596,19660771,19663651,19658996,19660916,19661874,19660980,19661442,19665282,19658526,19660574,19664509,19662752,19659223,19661143,19661391,19661893,19661697,19661396,19659346,19658639,19664453,19661341,19662602,19658416,19664717,19661336,19664267,19663405,19665269,19661429,19660570,19663295,19662335,19661968,19662897,19658563,19665013,19661066,19663946,19658868,19662661,19663455,19660379,19658452,19658923,19664683,19661309,19662582,19663542,19665224,19658608,19658997,19662837,19658649,19663987,19659696,19661616,19658577,19664633,19662532,19664347,19662611,19660352,19661088,19660485,19664325,19664768,19665728,19663532,19664072,19661254,19663046,19663738,19665776,19660073,19659773,19658612,19659741,19664578,19658818,19660484,19661412,19665321,19661049,19658924,19659884,19665447,19658727,19658594,19665424,19658721,19664806,19665219,19662455,19665457,19659602,19663972,19665250,19661765,19663294,19662432,19663806,19664766,19661157,19664425,19665076,19659472,19665349,19663418,19664049,19662874,19659211,19661887,19663341,19660068,19660277,19661764,19665142,19663740,19664934,19661627,19663266,19662586,19663870,19658582,19663399,19661978,19661608,19660408,19663072,19662018,19665389,19659529,19660300,19662500,19662134,19662774,19661951,19661344,19659424,19658897,19664657,19663851,19663828,19661801,19664582,19661722,19663925,19662960,19659150,19660952,19663577,19663138,19661585,19663109,19664288,19658439,19659106,19664783,19664566,19660693,19659306,19660745,19663097,19658860,19661511,19660674,19662079,19662943,19662651,19659771,19659010,19663689,19663624,19659372,19658888,19660820,19659171,19665113,19658625,19659160,19661795,19660289,19661830,19658571,19659952,19658496,19660014,19663800,19665049,19664862,19664784,19664055,19663398,19660644,19662616,19660828,19660757,19659550,19661377,19660454,19663416,19658610,19659080,19663982,19659243,19663083,19661357,19664065,19661164,19661085,19663582,19664887,19659645,19660292,19662160,19665356,19658441,19660462,19662173,19658753,19658606,19661570,19664200,19658871,19659534,19664349,19663389,19658919,19664958,19661594,19660163,19660965,19660650,19664924,19659985,19662122,19659978,19662858,19659183,19665192 ]) string_lrtrim(in.carrier_id) else in.carrier_id ;
out.account_id :1: if(in.cag_sk member [ vector 19662819,19662584,19661955,19664835,19660740,19665368,19659608,19661499,19664061,19664726,19665056,19663596,19660771,19663651,19658996,19660916,19661874,19660980,19661442,19665282,19658526,19660574,19664509,19662752,19659223,19661143,19661391,19661893,19661697,19661396,19659346,19658639,19664453,19661341,19662602,19658416,19664717,19661336,19664267,19663405,19665269,19661429,19660570,19663295,19662335,19661968,19662897,19658563,19665013,19661066,19663946,19658868,19662661,19663455,19660379,19658452,19658923,19664683,19661309,19662582,19663542,19665224,19658608,19658997,19662837,19658649,19663987,19659696,19661616,19658577,19664633,19662532,19664347,19662611,19660352,19661088,19660485,19664325,19664768,19665728,19663532,19664072,19661254,19663046,19663738,19665776,19660073,19659773,19658612,19659741,19664578,19658818,19660484,19661412,19665321,19661049,19658924,19659884,19665447,19658727,19658594,19665424,19658721,19664806,19665219,19662455,19665457,19659602,19663972,19665250,19661765,19663294,19662432,19663806,19664766,19661157,19664425,19665076,19659472,19665349,19663418,19664049,19662874,19659211,19661887,19663341,19660068,19660277,19661764,19665142,19663740,19664934,19661627,19663266,19662586,19663870,19658582,19663399,19661978,19661608,19660408,19663072,19662018,19665389,19659529,19660300,19662500,19662134,19662774,19661951,19661344,19659424,19658897,19664657,19663851,19663828,19661801,19664582,19661722,19663925,19662960,19659150,19660952,19663577,19663138,19661585,19663109,19664288,19658439,19659106,19664783,19664566,19660693,19659306,19660745,19663097,19658860,19661511,19660674,19662079,19662943,19662651,19659771,19659010,19663689,19663624,19659372,19658888,19660820,19659171,19665113,19658625,19659160,19661795,19660289,19661830,19658571,19659952,19658496,19660014,19663800,19665049,19664862,19664784,19664055,19663398,19660644,19662616,19660828,19660757,19659550,19661377,19660454,19663416,19658610,19659080,19663982,19659243,19663083,19661357,19664065,19661164,19661085,19663582,19664887,19659645,19660292,19662160,19665356,19658441,19660462,19662173,19658753,19658606,19661570,19664200,19658871,19659534,19664349,19663389,19658919,19664958,19661594,19660163,19660965,19660650,19664924,19659985,19662122,19659978,19662858,19659183,19665192 ]) string_lrtrim(in.account_id) else in.account_id;
out.employer_group_id :1: if(in.cag_sk member [ vector 19662819,19662584,19661955,19664835,19660740,19665368,19659608,19661499,19664061,19664726,19665056,19663596,19660771,19663651,19658996,19660916,19661874,19660980,19661442,19665282,19658526,19660574,19664509,19662752,19659223,19661143,19661391,19661893,19661697,19661396,19659346,19658639,19664453,19661341,19662602,19658416,19664717,19661336,19664267,19663405,19665269,19661429,19660570,19663295,19662335,19661968,19662897,19658563,19665013,19661066,19663946,19658868,19662661,19663455,19660379,19658452,19658923,19664683,19661309,19662582,19663542,19665224,19658608,19658997,19662837,19658649,19663987,19659696,19661616,19658577,19664633,19662532,19664347,19662611,19660352,19661088,19660485,19664325,19664768,19665728,19663532,19664072,19661254,19663046,19663738,19665776,19660073,19659773,19658612,19659741,19664578,19658818,19660484,19661412,19665321,19661049,19658924,19659884,19665447,19658727,19658594,19665424,19658721,19664806,19665219,19662455,19665457,19659602,19663972,19665250,19661765,19663294,19662432,19663806,19664766,19661157,19664425,19665076,19659472,19665349,19663418,19664049,19662874,19659211,19661887,19663341,19660068,19660277,19661764,19665142,19663740,19664934,19661627,19663266,19662586,19663870,19658582,19663399,19661978,19661608,19660408,19663072,19662018,19665389,19659529,19660300,19662500,19662134,19662774,19661951,19661344,19659424,19658897,19664657,19663851,19663828,19661801,19664582,19661722,19663925,19662960,19659150,19660952,19663577,19663138,19661585,19663109,19664288,19658439,19659106,19664783,19664566,19660693,19659306,19660745,19663097,19658860,19661511,19660674,19662079,19662943,19662651,19659771,19659010,19663689,19663624,19659372,19658888,19660820,19659171,19665113,19658625,19659160,19661795,19660289,19661830,19658571,19659952,19658496,19660014,19663800,19665049,19664862,19664784,19664055,19663398,19660644,19662616,19660828,19660757,19659550,19661377,19660454,19663416,19658610,19659080,19663982,19659243,19663083,19661357,19664065,19661164,19661085,19663582,19664887,19659645,19660292,19662160,19665356,19658441,19660462,19662173,19658753,19658606,19661570,19664200,19658871,19659534,19664349,19663389,19658919,19664958,19661594,19660163,19660965,19660650,19664924,19659985,19662122,19659978,19662858,19659183,19665192 ])  string_lrtrim(in.employer_group_id) else in.employer_group_id;

out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|745000|417500|0|0|0|0|13232|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|114|0|301|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|115|0|304|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|116|0|306|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|117|0|308|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|118|0|310|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|313|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|120|0|315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|121|0|319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|122|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|123|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|328|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|125|0|331|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/uat/mfs/mfs_8way/orca/rxclaim/main/idw_direct/from_prod/d_member.dat_new.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/uat/mfs/mfs_8way/orca/rxclaim/main/idw_direct/from_prod/d_member.dat_new.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_member.dml|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@0|@1015000|440000|0|0|0|0|13219|ids - member-1|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|126|0|333|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|127|0|336|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|128|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|129|0|341|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/uat/mfs/mfs_8way/orca/rxclaim/main/idw_direct/from_prod/d_member.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/uat/mfs/mfs_8way/orca/rxclaim/main/idw_direct/from_prod/d_member.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_member.dml|3|2|f$|@{0|}}
}}@0|@545000|410000|0|0|0|0|13218|ids - member|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|130|0|343|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|131|0|346|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|132|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|133|0|353|0|{Subgraph created from graph "fix_d_prescriber_adjud_final"|{}@0|@217500|152250|0|0|0|0|13225|Remove wrong dxf_sk|ptondare|Created 8/7/2017 4:32:41 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1186000|534000|3|}}
{2010501005|XXGpvertex|134|0|356|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|1|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|40000|39000|0|0|0|0|476|FBE : Check if record is present in lookup if yes then reject the record|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|135|0|358|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|136|0|360|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|137|0|363|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|138|0|365|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|139|0|367|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|140|0|369|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|141|0|371|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|142|0|373|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|143|0|376|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|144|0|379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|145|0|382|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|146|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|147|0|388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|148|0|397|0|{@{}@0|0|0|0|out0|.4294478527607362|@@@14352|0|}}
{2010202004|XXGiport|149|0|401|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|150|0|406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|1074000|176750|0|0|0|0|13143|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|151|0|408|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|152|0|411|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|153|0|414|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|154|0|416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|155|0|419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|156|0|425|0|{Subgraph created from graph "Graph3"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
}}@0|@1471500|15000|0|0|0|0|13211|XREF-1|ptondare|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1579000|520000|7|}}
{2010210004|XXGflow|157|0|427|0|{@{}@384|.5|.5|{0|}10985|17|}}
{2010210004|XXGflow|158|0|429|0|{@{}@384|.5|.5|{0|}10972|17|}}
{2010210004|XXGflow|159|0|431|0|{@{}@384|.5|.5|{0|}10988|17|}}
{2010210004|XXGflow|160|0|433|0|{@{}@384|.5|.5|{0|}10989|17|}}
{2010210004|XXGflow|161|0|435|0|{@{}@384|.5|.5|{0|}10982|17|}}
{2010210004|XXGflow|162|0|437|0|{@{}@384|.5|.5|{0|}10987|20|}}
{2010501005|XXGpvertex|163|0|439|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Broadcast|990000|114000|0|0|0|0|10914|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|164|0|441|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|165|0|444|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|166|0|447|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|167|0|449|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|168|0|452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|456|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@1106000|84000|0|0|0|0|10990|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|170|0|458|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|171|0|461|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|172|0|464|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|173|0|467|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{2010203004|XXGoport|174|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|175|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|176|0|476|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|177|0|479|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_XREF_FILE|3|2|$|@{0|}}
}}@1|@1451000|67500|0|0|0|0|10979|OFIL : XREF DAT FILE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|178|0|481|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|179|0|484|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|180|0|486|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|181|0|492|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|784000|80000|0|0|0|0|10973|DSRT : \{dxf_hk\}|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|182|0|494|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|183|0|497|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|184|0|499|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|185|0|501|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|186|0|503|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|187|0|505|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|188|0|508|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|189|0|510|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|190|0|513|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|191|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|192|0|519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|193|0|522|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|194|0|525|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|195|0|533|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_XREF_INDEX|3|2|$|@{0|}}
}}@1|@1290000|292500|0|0|0|0|10953|OFILE : XREF IDX FILE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|196|0|535|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|197|0|538|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|198|0|540|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|199|0|545|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
}}@1|Reformat|286000|183500|0|0|0|0|10986|RFMT : Map fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|200|0|547|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|201|0|550|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|202|0|552|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|203|0|554|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|204|0|556|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|205|0|558|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|206|0|560|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|207|0|564|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|208|0|567|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|209|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|210|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|211|0|580|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort|605000|91500|0|0|0|0|10983|SRT : \{dxf_hk\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|582|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|213|0|585|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|214|0|588|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|215|0|590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|216|0|593|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|217|0|600|0|{@{}@0|0|0|0|in0|.7211538461538461|@@@13840|0|}}
{2010503005|XXGfvertex|218|0|604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOOKUP/lookup.ids_common/lookup.ids_common.d_prod_disease_category_xwalk.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/lookup.ids_common/lookup.ids_common.d_prod_disease_category_xwalk.dat|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|$AI_DML/lookup.ids_common/lookup.ids_common.d_prod_disease_category_xwalk.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{prod_id\}|3|2|$|@{0|}}
}}@0|@753000|55000|0|0|0|0|13237|d_prod_disease_category_xwalk|Ab Initio Software|@1|10000|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|219|0|606|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010110002|XXGconstant|220|0|610|0|{@{}@{1|309240|}}}
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
{2010605001|XXGgraph_legend_legend|10|0|20|0|{3|}1|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_10|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_2|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_3|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_4|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_5|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_6|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_7|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_8|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_9|}1|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{IDS|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_1|}23|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_2|}23|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_3|}23|26|}
{2010601001|XXGgraph_vertex_vertex|26|0|52|0|{OFIL_IDS_INDEX_file|}23|27|}
{2010211001|XXGvertex_iport_iport|27|0|54|0|{0|write|}27|28|}
{2010214001|XXGiport_src_flow|28|0|56|0|{0|}28|25|}
{2010007001|XXGobject_proto_object|29|0|57|0|{}27|29|}
{2010211001|XXGvertex_iport_iport|30|0|59|0|{0|write|}29|30|}
{2010006001|XXGobject_psameas_object|31|0|61|0|{metadata|write_metadata|1|0|}30|29|}
{2010006001|XXGobject_psameas_object|32|0|62|0|{write_metadata|index_metadata|0|0|}27|31|}
{2010212001|XXGvertex_oport_oport|33|0|64|0|{0|out|}31|32|}
{2010213001|XXGoport_dst_flow|34|0|66|0|{0|}32|24|}
{2010212001|XXGvertex_oport_oport|35|0|67|0|{1|index|}31|33|}
{2010213001|XXGoport_dst_flow|36|0|69|0|{0|}33|25|}
{2010212001|XXGvertex_oport_oport|37|0|70|0|{2|address|}31|34|}
{2010211001|XXGvertex_iport_iport|38|0|72|0|{0|in|}31|35|}
{2010007001|XXGobject_proto_object|39|0|74|0|{}31|36|}
{2010212001|XXGvertex_oport_oport|40|0|76|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|41|0|78|0|{metadata|out_metadata|1|0|}37|36|}
{2010212001|XXGvertex_oport_oport|42|0|79|0|{1|index|}36|38|}
{2010006001|XXGobject_psameas_object|43|0|81|0|{metadata|index_metadata|1|0|}38|36|}
{2010212001|XXGvertex_oport_oport|44|0|82|0|{2|address|}36|39|}
{2010006001|XXGobject_psameas_object|45|0|84|0|{metadata|address_metadata|1|0|}39|36|}
{2010211001|XXGvertex_iport_iport|46|0|85|0|{0|in|}36|40|}
{2010006001|XXGobject_psameas_object|47|0|87|0|{metadata|in_metadata|1|0|}40|36|}
{2010006001|XXGobject_psameas_object|48|0|88|0|{Layout|Layout|0|0|}31|27|}
{2010006001|XXGobject_psameas_object|49|0|89|0|{in_metadata|out1_metadata|0|0|}31|41|}
{2010212001|XXGvertex_oport_oport|50|0|91|0|{0|out0|}41|42|}
{2010213001|XXGoport_dst_flow|51|0|93|0|{0|}42|16|}
{2010212001|XXGvertex_oport_oport|52|0|94|0|{1|out1|}41|43|}
{2010213001|XXGoport_dst_flow|53|0|96|0|{0|}43|21|}
{2010212001|XXGvertex_oport_oport|54|0|97|0|{2|reject0|}41|44|}
{2010212001|XXGvertex_oport_oport|55|0|99|0|{3|reject1|}41|45|}
{2010212001|XXGvertex_oport_oport|56|0|101|0|{4|error0|}41|46|}
{2010212001|XXGvertex_oport_oport|57|0|103|0|{5|error1|}41|47|}
{2010212001|XXGvertex_oport_oport|58|0|105|0|{6|log|}41|48|}
{2010211001|XXGvertex_iport_iport|59|0|107|0|{0|in|}41|49|}
{2010214001|XXGiport_src_flow|60|0|109|0|{0|}49|15|}
{2010007001|XXGobject_proto_object|61|0|110|0|{}41|50|}
{2010212001|XXGvertex_oport_oport|62|0|112|0|{0|out0|}50|51|}
{2010006001|XXGobject_psameas_object|63|0|114|0|{metadata|out0_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{transform0|transform0|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|65|0|116|0|{1|out1|}50|52|}
{2010006001|XXGobject_psameas_object|66|0|118|0|{metadata|out1_metadata|1|0|}52|50|}
{2010006001|XXGobject_psameas_object|67|0|119|0|{transform1|transform1|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|68|0|120|0|{2|reject0|}50|53|}
{2010006001|XXGobject_psameas_object|69|0|122|0|{metadata|reject0_metadata|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|70|0|123|0|{3|reject1|}50|54|}
{2010006001|XXGobject_psameas_object|71|0|125|0|{metadata|reject1_metadata|1|0|}54|50|}
{2010212001|XXGvertex_oport_oport|72|0|126|0|{4|error0|}50|55|}
{2010006001|XXGobject_psameas_object|73|0|128|0|{metadata|error0_metadata|1|0|}55|50|}
{2010212001|XXGvertex_oport_oport|74|0|129|0|{5|error1|}50|56|}
{2010006001|XXGobject_psameas_object|75|0|131|0|{metadata|error1_metadata|1|0|}56|50|}
{2010212001|XXGvertex_oport_oport|76|0|132|0|{6|log|}50|57|}
{2010006001|XXGobject_psameas_object|77|0|134|0|{metadata|log_metadata|1|0|}57|50|}
{2010211001|XXGvertex_iport_iport|78|0|135|0|{0|in|}50|58|}
{2010006001|XXGobject_psameas_object|79|0|137|0|{metadata|in_metadata|1|0|}58|50|}
{2010006001|XXGobject_psameas_object|80|0|138|0|{Layout|Layout|0|0|}41|59|}
{2010211001|XXGvertex_iport_iport|81|0|140|0|{0|write|}59|60|}
{2010214001|XXGiport_src_flow|82|0|142|0|{0|}60|61|}
{2010007001|XXGobject_proto_object|83|0|144|0|{}59|62|}
{2010211001|XXGvertex_iport_iport|84|0|146|0|{0|write|}62|63|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{metadata|write_metadata|1|0|}63|62|}
{2010006001|XXGobject_psameas_object|86|0|149|0|{write_metadata|read_metadata|0|0|}59|64|}
{2010212001|XXGvertex_oport_oport|87|0|151|0|{0|read|}64|65|}
{2010213001|XXGoport_dst_flow|88|0|153|0|{0|}65|13|}
{2010007001|XXGobject_proto_object|89|0|154|0|{}64|66|}
{2010212001|XXGvertex_oport_oport|90|0|156|0|{0|read|}66|67|}
{2010006001|XXGobject_psameas_object|91|0|158|0|{metadata|read_metadata|1|0|}67|66|}
{2010006001|XXGobject_psameas_object|92|0|159|0|{in_metadata|read_metadata|0|0|}41|64|}
{2010006001|XXGobject_psameas_object|93|0|160|0|{out0_metadata|out1_metadata|0|0|}41|41|}
{2010006001|XXGobject_psameas_object|94|0|161|0|{reject0_metadata|read_metadata|0|0|}41|64|}
{2010006001|XXGobject_psameas_object|95|0|162|0|{reject1_metadata|read_metadata|0|0|}41|64|}
{2010006001|XXGobject_psameas_object|96|0|163|0|{out_metadata|write_metadata|0|0|}31|68|}
{2010211001|XXGvertex_iport_iport|97|0|165|0|{0|write|}68|69|}
{2010214001|XXGiport_src_flow|98|0|167|0|{0|}69|24|}
{2010007001|XXGobject_proto_object|99|0|168|0|{}68|70|}
{2010211001|XXGvertex_iport_iport|100|0|170|0|{0|write|}70|71|}
{2010006001|XXGobject_psameas_object|101|0|172|0|{metadata|write_metadata|1|0|}71|70|}
{2010601001|XXGgraph_vertex_vertex|102|0|173|0|{OFIL_IDS_INDEX_file_1|}23|72|}
{2010212001|XXGvertex_oport_oport|103|0|175|0|{0|read|}72|73|}
{2010213001|XXGoport_dst_flow|104|0|177|0|{0|}73|26|}
{2010007001|XXGobject_proto_object|105|0|178|0|{}72|74|}
{2010212001|XXGvertex_oport_oport|106|0|180|0|{0|read|}74|75|}
{2010006001|XXGobject_psameas_object|107|0|182|0|{metadata|read_metadata|1|0|}75|74|}
{2010601001|XXGgraph_vertex_vertex|108|0|183|0|{OFIL_IDS_file|}23|68|}
{2010601001|XXGgraph_vertex_vertex|109|0|184|0|{Trash|}23|76|}
{2010211001|XXGvertex_iport_iport|110|0|186|0|{0|in|}76|77|}
{2010214001|XXGiport_src_flow|111|0|188|0|{0|}77|26|}
{2010007001|XXGobject_proto_object|112|0|189|0|{}76|78|}
{2010211001|XXGvertex_iport_iport|113|0|191|0|{0|in|}78|79|}
{2010006001|XXGobject_psameas_object|114|0|193|0|{metadata|in_metadata|1|0|}79|78|}
{2010006001|XXGobject_psameas_object|115|0|194|0|{in_metadata|read_metadata|0|0|}76|72|}
{2010601001|XXGgraph_vertex_vertex|116|0|195|0|{Write_Block_Compressed_Lookup|}23|31|}
{2010211001|XXGvertex_iport_iport|117|0|196|0|{0|in0|}23|80|}
{2010215002|XXGiport_binding_iport|118|0|198|0|{.5|.5|{0|}10614|}80|35|}
{2010214001|XXGiport_src_flow|119|0|199|0|{0|}80|18|}
{2010601001|XXGgraph_vertex_vertex|120|0|200|0|{IFIL_Read_IDS_file|}1|64|}
{2010601001|XXGgraph_vertex_vertex|121|0|201|0|{PBKS_dxf_hk_part1_|}1|81|}
{2010604001|XXGgraph_flow_flow|122|0|203|0|{Flow_1|}81|82|}
{2010601001|XXGgraph_vertex_vertex|123|0|205|0|{Partition_by_Key|}81|83|}
{2010212001|XXGvertex_oport_oport|124|0|207|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|125|0|209|0|{0|}84|82|}
{2010211001|XXGvertex_iport_iport|126|0|210|0|{0|in|}83|85|}
{2010006001|XXGobject_psameas_object|127|0|212|0|{in_metadata|out1_metadata|0|0|}83|41|}
{2010006001|XXGobject_psameas_object|128|0|213|0|{out_metadata|out1_metadata|0|0|}83|41|}
{2010601001|XXGgraph_vertex_vertex|129|0|214|0|{Sort|}81|86|}
{2010212001|XXGvertex_oport_oport|130|0|216|0|{0|out|}86|87|}
{2010211001|XXGvertex_iport_iport|131|0|218|0|{0|in|}86|88|}
{2010214001|XXGiport_src_flow|132|0|220|0|{0|}88|82|}
{2010006001|XXGobject_psameas_object|133|0|221|0|{in_metadata|out1_metadata|0|0|}86|41|}
{2010006001|XXGobject_psameas_object|134|0|222|0|{out_metadata|out1_metadata|0|0|}86|41|}
{2010212001|XXGvertex_oport_oport|135|0|223|0|{0|out0|}81|89|}
{2010216002|XXGoport_binding_oport|136|0|225|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}89|87|}
{2010213001|XXGoport_dst_flow|137|0|226|0|{0|}89|20|}
{2010211001|XXGvertex_iport_iport|138|0|227|0|{0|in0|}81|90|}
{2010215002|XXGiport_binding_iport|139|0|229|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}90|85|}
{2010214001|XXGiport_src_flow|140|0|230|0|{0|}90|16|}
{2010214001|XXGiport_src_flow|141|0|231|0|{1|}90|21|}
{2010007001|XXGobject_proto_object|142|0|232|0|{}81|91|}
{2010604001|XXGgraph_flow_flow|143|0|234|0|{Flow_1|}91|92|}
{2010601001|XXGgraph_vertex_vertex|144|0|236|0|{Partition_by_Key|}91|93|}
{2010212001|XXGvertex_oport_oport|145|0|238|0|{0|out|}93|94|}
{2010213001|XXGoport_dst_flow|146|0|240|0|{0|}94|92|}
{2010211001|XXGvertex_iport_iport|147|0|241|0|{0|in|}93|95|}
{2010007001|XXGobject_proto_object|148|0|243|0|{}93|96|}
{2010212001|XXGvertex_oport_oport|149|0|245|0|{0|out|}96|97|}
{2010006001|XXGobject_psameas_object|150|0|247|0|{metadata|out_metadata|1|0|}97|96|}
{2010211001|XXGvertex_iport_iport|151|0|248|0|{0|in|}96|98|}
{2010006001|XXGobject_psameas_object|152|0|250|0|{metadata|in_metadata|1|0|}98|96|}
{2010006001|XXGobject_psameas_object|153|0|251|0|{Layout|InputLayout|1|0|}93|91|}
{2010006001|XXGobject_psameas_object|154|0|252|0|{key|Key|1|0|}93|91|}
{2010601001|XXGgraph_vertex_vertex|155|0|253|0|{Sort|}91|99|}
{2010212001|XXGvertex_oport_oport|156|0|255|0|{0|out|}99|100|}
{2010211001|XXGvertex_iport_iport|157|0|257|0|{0|in|}99|101|}
{2010214001|XXGiport_src_flow|158|0|259|0|{0|}101|92|}
{2010007001|XXGobject_proto_object|159|0|260|0|{}99|102|}
{2010212001|XXGvertex_oport_oport|160|0|262|0|{0|out|}102|103|}
{2010006001|XXGobject_psameas_object|161|0|264|0|{metadata|out_metadata|1|0|}103|102|}
{2010211001|XXGvertex_iport_iport|162|0|265|0|{0|in|}102|104|}
{2010006001|XXGobject_psameas_object|163|0|267|0|{metadata|in_metadata|1|0|}104|102|}
{2010006001|XXGobject_psameas_object|164|0|268|0|{Layout|OutputLayout|1|0|}99|91|}
{2010006001|XXGobject_psameas_object|165|0|269|0|{key|Key|1|0|}99|91|}
{2010006001|XXGobject_psameas_object|166|0|270|0|{max_core|Max_core|1|0|}99|91|}
{2010212001|XXGvertex_oport_oport|167|0|271|0|{0|out0|}91|105|}
{2010216002|XXGoport_binding_oport|168|0|273|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}105|100|}
{2010211001|XXGvertex_iport_iport|169|0|274|0|{0|in0|}91|106|}
{2010215002|XXGiport_binding_iport|170|0|276|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}106|95|}
{2010006001|XXGobject_psameas_object|171|0|277|0|{InputLayout|Layout|0|0|}81|59|}
{2010006001|XXGobject_psameas_object|172|0|278|0|{OutputLayout|Layout|0|0|}81|107|}
{2010212001|XXGvertex_oport_oport|173|0|280|0|{0|out|}107|108|}
{2010213001|XXGoport_dst_flow|174|0|282|0|{0|}108|17|}
{2010213001|XXGoport_dst_flow|175|0|283|0|{1|}108|18|}
{2010211001|XXGvertex_iport_iport|176|0|284|0|{0|in|}107|109|}
{2010214001|XXGiport_src_flow|177|0|286|0|{0|}109|19|}
{2010007001|XXGobject_proto_object|178|0|287|0|{}107|110|}
{2010212001|XXGvertex_oport_oport|179|0|289|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|180|0|291|0|{metadata|out_metadata|1|0|}111|110|}
{2010211001|XXGvertex_iport_iport|181|0|292|0|{0|in|}110|112|}
{2010006001|XXGobject_psameas_object|182|0|294|0|{metadata|in_metadata|1|0|}112|110|}
{2010006001|XXGobject_psameas_object|183|0|295|0|{in_metadata|out1_metadata|0|0|}107|41|}
{2010006001|XXGobject_psameas_object|184|0|296|0|{out_metadata|out1_metadata|0|0|}107|41|}
{2010601001|XXGgraph_vertex_vertex|185|0|297|0|{RFMT_Recalculate_hash|}1|41|}
{2010601001|XXGgraph_vertex_vertex|186|0|298|0|{Reformat|}1|113|}
{2010212001|XXGvertex_oport_oport|187|0|300|0|{0|out0|}113|114|}
{2010213001|XXGoport_dst_flow|188|0|302|0|{0|}114|14|}
{2010212001|XXGvertex_oport_oport|189|0|303|0|{1|reject0|}113|115|}
{2010212001|XXGvertex_oport_oport|190|0|305|0|{2|error0|}113|116|}
{2010212001|XXGvertex_oport_oport|191|0|307|0|{3|log|}113|117|}
{2010211001|XXGvertex_iport_iport|192|0|309|0|{0|in|}113|118|}
{2010214001|XXGiport_src_flow|193|0|311|0|{0|}118|22|}
{2010007001|XXGobject_proto_object|194|0|312|0|{}113|119|}
{2010212001|XXGvertex_oport_oport|195|0|314|0|{0|out0|}119|120|}
{2010006001|XXGobject_psameas_object|196|0|316|0|{metadata|out0_metadata|1|0|}120|119|}
{2010006001|XXGobject_psameas_object|197|0|317|0|{transform0|transform0|1|0|}120|119|}
{2010212001|XXGvertex_oport_oport|198|0|318|0|{1|reject0|}119|121|}
{2010006001|XXGobject_psameas_object|199|0|320|0|{metadata|reject0_metadata|1|0|}121|119|}
{2010212001|XXGvertex_oport_oport|200|0|321|0|{2|error0|}119|122|}
{2010006001|XXGobject_psameas_object|201|0|323|0|{metadata|error0_metadata|1|0|}122|119|}
{2010212001|XXGvertex_oport_oport|202|0|324|0|{3|log|}119|123|}
{2010006001|XXGobject_psameas_object|203|0|326|0|{metadata|log_metadata|1|0|}123|119|}
{2010211001|XXGvertex_iport_iport|204|0|327|0|{0|in|}119|124|}
{2010006001|XXGobject_psameas_object|205|0|329|0|{metadata|in_metadata|1|0|}124|119|}
{2010006001|XXGobject_psameas_object|206|0|330|0|{Layout|Layout|0|0|}113|125|}
{2010211001|XXGvertex_iport_iport|207|0|332|0|{0|write|}125|126|}
{2010214001|XXGiport_src_flow|208|0|334|0|{0|}126|14|}
{2010007001|XXGobject_proto_object|209|0|335|0|{}125|127|}
{2010211001|XXGvertex_iport_iport|210|0|337|0|{0|write|}127|128|}
{2010006001|XXGobject_psameas_object|211|0|339|0|{metadata|write_metadata|1|0|}128|127|}
{2010006001|XXGobject_psameas_object|212|0|340|0|{in_metadata|read_metadata|0|0|}113|129|}
{2010212001|XXGvertex_oport_oport|213|0|342|0|{0|read|}129|130|}
{2010213001|XXGoport_dst_flow|214|0|344|0|{0|}130|22|}
{2010007001|XXGobject_proto_object|215|0|345|0|{}129|131|}
{2010212001|XXGvertex_oport_oport|216|0|347|0|{0|read|}131|132|}
{2010006001|XXGobject_psameas_object|217|0|349|0|{metadata|read_metadata|1|0|}132|131|}
{2010006001|XXGobject_psameas_object|218|0|350|0|{out0_metadata|write_metadata|0|0|}113|125|}
{2010006001|XXGobject_psameas_object|219|0|351|0|{reject0_metadata|read_metadata|0|0|}113|129|}
{2010601001|XXGgraph_vertex_vertex|220|0|352|0|{Remove_wrong_dxf_sk|}1|133|}
{2010604001|XXGgraph_flow_flow|221|0|354|0|{Flow_1|}133|61|}
{2010601001|XXGgraph_vertex_vertex|222|0|355|0|{FBE_Check_if_record_is_present_in_lookup_if_yes_then_reject_the_record|}133|134|}
{2010212001|XXGvertex_oport_oport|223|0|357|0|{0|out|}134|135|}
{2010212001|XXGvertex_oport_oport|224|0|359|0|{1|deselect|}134|136|}
{2010213001|XXGoport_dst_flow|225|0|361|0|{0|}136|61|}
{2010212001|XXGvertex_oport_oport|226|0|362|0|{2|reject|}134|137|}
{2010212001|XXGvertex_oport_oport|227|0|364|0|{3|error|}134|138|}
{2010212001|XXGvertex_oport_oport|228|0|366|0|{4|log|}134|139|}
{2010211001|XXGvertex_iport_iport|229|0|368|0|{0|in|}134|140|}
{2010007001|XXGobject_proto_object|230|0|370|0|{}134|141|}
{2010212001|XXGvertex_oport_oport|231|0|372|0|{0|out|}141|142|}
{2010006001|XXGobject_psameas_object|232|0|374|0|{metadata|out_metadata|1|0|}142|141|}
{2010212001|XXGvertex_oport_oport|233|0|375|0|{1|deselect|}141|143|}
{2010006001|XXGobject_psameas_object|234|0|377|0|{metadata|deselect_metadata|1|0|}143|141|}
{2010212001|XXGvertex_oport_oport|235|0|378|0|{2|reject|}141|144|}
{2010006001|XXGobject_psameas_object|236|0|380|0|{metadata|reject_metadata|1|0|}144|141|}
{2010212001|XXGvertex_oport_oport|237|0|381|0|{3|error|}141|145|}
{2010006001|XXGobject_psameas_object|238|0|383|0|{metadata|error_metadata|1|0|}145|141|}
{2010212001|XXGvertex_oport_oport|239|0|384|0|{4|log|}141|146|}
{2010006001|XXGobject_psameas_object|240|0|386|0|{metadata|log_metadata|1|0|}146|141|}
{2010211001|XXGvertex_iport_iport|241|0|387|0|{0|in|}141|147|}
{2010006001|XXGobject_psameas_object|242|0|389|0|{metadata|in_metadata|1|0|}147|141|}
{2010006001|XXGobject_psameas_object|243|0|390|0|{Layout|Layout|0|0|}134|59|}
{2010006001|XXGobject_psameas_object|244|0|391|0|{deselect_metadata|read_metadata|0|0|}134|64|}
{2010006001|XXGobject_psameas_object|245|0|392|0|{in_metadata|read_metadata|0|0|}134|64|}
{2010006001|XXGobject_psameas_object|246|0|393|0|{out_metadata|read_metadata|0|0|}134|64|}
{2010006001|XXGobject_psameas_object|247|0|394|0|{reject_metadata|read_metadata|0|0|}134|64|}
{2010601001|XXGgraph_vertex_vertex|248|0|395|0|{OFIL_Records_with_wrong_sk_s|}133|59|}
{2010212001|XXGvertex_oport_oport|249|0|396|0|{0|out0|}133|148|}
{2010216002|XXGoport_binding_oport|250|0|398|0|{.5|.5|{0|}478|}148|135|}
{2010213001|XXGoport_dst_flow|251|0|399|0|{0|}148|15|}
{2010211001|XXGvertex_iport_iport|252|0|400|0|{0|in0|}133|149|}
{2010215002|XXGiport_binding_iport|253|0|402|0|{.5|.5|{0|}477|}149|140|}
{2010214001|XXGiport_src_flow|254|0|403|0|{0|}149|13|}
{2010601001|XXGgraph_vertex_vertex|255|0|404|0|{Replicate|}1|107|}
{2010601001|XXGgraph_vertex_vertex|256|0|405|0|{Sort_within_Groups|}1|150|}
{2010212001|XXGvertex_oport_oport|257|0|407|0|{0|out|}150|151|}
{2010213001|XXGoport_dst_flow|258|0|409|0|{0|}151|19|}
{2010211001|XXGvertex_iport_iport|259|0|410|0|{0|in|}150|152|}
{2010214001|XXGiport_src_flow|260|0|412|0|{0|}152|20|}
{2010007001|XXGobject_proto_object|261|0|413|0|{}150|153|}
{2010212001|XXGvertex_oport_oport|262|0|415|0|{0|out|}153|154|}
{2010006001|XXGobject_psameas_object|263|0|417|0|{metadata|out_metadata|1|0|}154|153|}
{2010211001|XXGvertex_iport_iport|264|0|418|0|{0|in|}153|155|}
{2010006001|XXGobject_psameas_object|265|0|420|0|{metadata|in_metadata|1|0|}155|153|}
{2010006001|XXGobject_psameas_object|266|0|421|0|{Layout|Layout|0|0|}150|107|}
{2010006001|XXGobject_psameas_object|267|0|422|0|{in_metadata|out1_metadata|0|0|}150|41|}
{2010006001|XXGobject_psameas_object|268|0|423|0|{out_metadata|out1_metadata|0|0|}150|41|}
{2010601001|XXGgraph_vertex_vertex|269|0|424|0|{XREF_1|}1|156|}
{2010604001|XXGgraph_flow_flow|270|0|426|0|{Flow_1|}156|157|}
{2010604001|XXGgraph_flow_flow|271|0|428|0|{Flow_2|}156|158|}
{2010604001|XXGgraph_flow_flow|272|0|430|0|{Flow_3|}156|159|}
{2010604001|XXGgraph_flow_flow|273|0|432|0|{Flow_4|}156|160|}
{2010604001|XXGgraph_flow_flow|274|0|434|0|{Flow_5|}156|161|}
{2010604001|XXGgraph_flow_flow|275|0|436|0|{Flow_7|}156|162|}
{2010601001|XXGgraph_vertex_vertex|276|0|438|0|{Broadcast|}156|163|}
{2010212001|XXGvertex_oport_oport|277|0|440|0|{0|out|}163|164|}
{2010213001|XXGoport_dst_flow|278|0|442|0|{0|}164|162|}
{2010211001|XXGvertex_iport_iport|279|0|443|0|{0|in|}163|165|}
{2010214001|XXGiport_src_flow|280|0|445|0|{0|}165|158|}
{2010007001|XXGobject_proto_object|281|0|446|0|{}163|166|}
{2010212001|XXGvertex_oport_oport|282|0|448|0|{0|out|}166|167|}
{2010006001|XXGobject_psameas_object|283|0|450|0|{metadata|out_metadata|1|0|}167|166|}
{2010211001|XXGvertex_iport_iport|284|0|451|0|{0|in|}166|168|}
{2010006001|XXGobject_psameas_object|285|0|453|0|{metadata|in_metadata|1|0|}168|166|}
{2010006001|XXGobject_psameas_object|286|0|454|0|{Layout|Layout|0|0|}163|107|}
{2010006001|XXGobject_psameas_object|287|0|455|0|{in_metadata|out_metadata|0|0|}163|169|}
{2010212001|XXGvertex_oport_oport|288|0|457|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|289|0|459|0|{0|}170|159|}
{2010212001|XXGvertex_oport_oport|290|0|460|0|{1|index0|}169|171|}
{2010213001|XXGoport_dst_flow|291|0|462|0|{0|}171|160|}
{2010211001|XXGvertex_iport_iport|292|0|463|0|{0|in|}169|172|}
{2010214001|XXGiport_src_flow|293|0|465|0|{0|}172|162|}
{2010007001|XXGobject_proto_object|294|0|466|0|{}169|173|}
{2010212001|XXGvertex_oport_oport|295|0|468|0|{0|out|}173|174|}
{2010006001|XXGobject_psameas_object|296|0|470|0|{metadata|out_metadata|1|0|}174|173|}
{2010212001|XXGvertex_oport_oport|297|0|471|0|{1|index0|}173|175|}
{2010006001|XXGobject_psameas_object|298|0|473|0|{key0|key0|1|0|}175|173|}
{2010006001|XXGobject_psameas_object|299|0|474|0|{metadata|index0_metadata|1|0|}175|173|}
{2010211001|XXGvertex_iport_iport|300|0|475|0|{0|in|}173|176|}
{2010006001|XXGobject_psameas_object|301|0|477|0|{metadata|in_metadata|1|0|}176|173|}
{2010006001|XXGobject_psameas_object|302|0|478|0|{Layout|Layout|0|0|}169|177|}
{2010211001|XXGvertex_iport_iport|303|0|480|0|{0|write|}177|178|}
{2010214001|XXGiport_src_flow|304|0|482|0|{0|}178|159|}
{2010007001|XXGobject_proto_object|305|0|483|0|{}177|179|}
{2010211001|XXGvertex_iport_iport|306|0|485|0|{0|write|}179|180|}
{2010006001|XXGobject_psameas_object|307|0|487|0|{metadata|write_metadata|1|0|}180|179|}
{2010006001|XXGobject_psameas_object|308|0|488|0|{write_metadata|out_metadata|0|0|}177|169|}
{2010006001|XXGobject_psameas_object|309|0|489|0|{in_metadata|out_metadata|0|0|}169|169|}
{2010006001|XXGobject_psameas_object|310|0|490|0|{out_metadata|out_metadata|0|0|}163|169|}
{2010601001|XXGgraph_vertex_vertex|311|0|491|0|{DSRT_dxf_hk_|}156|181|}
{2010212001|XXGvertex_oport_oport|312|0|493|0|{0|out|}181|182|}
{2010213001|XXGoport_dst_flow|313|0|495|0|{0|}182|158|}
{2010212001|XXGvertex_oport_oport|314|0|496|0|{1|dup|}181|183|}
{2010212001|XXGvertex_oport_oport|315|0|498|0|{2|reject|}181|184|}
{2010212001|XXGvertex_oport_oport|316|0|500|0|{3|error|}181|185|}
{2010212001|XXGvertex_oport_oport|317|0|502|0|{4|log|}181|186|}
{2010211001|XXGvertex_iport_iport|318|0|504|0|{0|in|}181|187|}
{2010214001|XXGiport_src_flow|319|0|506|0|{0|}187|161|}
{2010007001|XXGobject_proto_object|320|0|507|0|{}181|188|}
{2010212001|XXGvertex_oport_oport|321|0|509|0|{0|out|}188|189|}
{2010006001|XXGobject_psameas_object|322|0|511|0|{metadata|out_metadata|1|0|}189|188|}
{2010212001|XXGvertex_oport_oport|323|0|512|0|{1|dup|}188|190|}
{2010006001|XXGobject_psameas_object|324|0|514|0|{metadata|dup_metadata|1|0|}190|188|}
{2010212001|XXGvertex_oport_oport|325|0|515|0|{2|reject|}188|191|}
{2010006001|XXGobject_psameas_object|326|0|517|0|{metadata|reject_metadata|1|0|}191|188|}
{2010212001|XXGvertex_oport_oport|327|0|518|0|{3|error|}188|192|}
{2010006001|XXGobject_psameas_object|328|0|520|0|{metadata|error_metadata|1|0|}192|188|}
{2010212001|XXGvertex_oport_oport|329|0|521|0|{4|log|}188|193|}
{2010006001|XXGobject_psameas_object|330|0|523|0|{metadata|log_metadata|1|0|}193|188|}
{2010211001|XXGvertex_iport_iport|331|0|524|0|{0|in|}188|194|}
{2010006001|XXGobject_psameas_object|332|0|526|0|{metadata|in_metadata|1|0|}194|188|}
{2010006001|XXGobject_psameas_object|333|0|527|0|{Layout|Layout|0|0|}181|107|}
{2010006001|XXGobject_psameas_object|334|0|528|0|{dup_metadata|out_metadata|0|0|}181|169|}
{2010006001|XXGobject_psameas_object|335|0|529|0|{in_metadata|out_metadata|0|0|}181|169|}
{2010006001|XXGobject_psameas_object|336|0|530|0|{out_metadata|out_metadata|0|0|}181|169|}
{2010006001|XXGobject_psameas_object|337|0|531|0|{reject_metadata|out_metadata|0|0|}181|169|}
{2010601001|XXGgraph_vertex_vertex|338|0|532|0|{OFILE_XREF_IDX_FILE|}156|195|}
{2010211001|XXGvertex_iport_iport|339|0|534|0|{0|write|}195|196|}
{2010214001|XXGiport_src_flow|340|0|536|0|{0|}196|160|}
{2010007001|XXGobject_proto_object|341|0|537|0|{}195|197|}
{2010211001|XXGvertex_iport_iport|342|0|539|0|{0|write|}197|198|}
{2010006001|XXGobject_psameas_object|343|0|541|0|{metadata|write_metadata|1|0|}198|197|}
{2010006001|XXGobject_psameas_object|344|0|542|0|{write_metadata|index0_metadata|0|0|}195|169|}
{2010601001|XXGgraph_vertex_vertex|345|0|543|0|{OFIL_XREF_DAT_FILE|}156|177|}
{2010601001|XXGgraph_vertex_vertex|346|0|544|0|{RFMT_Map_fields|}156|199|}
{2010212001|XXGvertex_oport_oport|347|0|546|0|{0|out0|}199|200|}
{2010213001|XXGoport_dst_flow|348|0|548|0|{0|}200|157|}
{2010212001|XXGvertex_oport_oport|349|0|549|0|{1|reject0|}199|201|}
{2010212001|XXGvertex_oport_oport|350|0|551|0|{2|error0|}199|202|}
{2010212001|XXGvertex_oport_oport|351|0|553|0|{3|log|}199|203|}
{2010211001|XXGvertex_iport_iport|352|0|555|0|{0|in|}199|204|}
{2010007001|XXGobject_proto_object|353|0|557|0|{}199|205|}
{2010212001|XXGvertex_oport_oport|354|0|559|0|{0|out0|}205|206|}
{2010006001|XXGobject_psameas_object|355|0|561|0|{metadata|out0_metadata|1|0|}206|205|}
{2010006001|XXGobject_psameas_object|356|0|562|0|{transform0|transform0|1|0|}206|205|}
{2010212001|XXGvertex_oport_oport|357|0|563|0|{1|reject0|}205|207|}
{2010006001|XXGobject_psameas_object|358|0|565|0|{metadata|reject0_metadata|1|0|}207|205|}
{2010212001|XXGvertex_oport_oport|359|0|566|0|{2|error0|}205|208|}
{2010006001|XXGobject_psameas_object|360|0|568|0|{metadata|error0_metadata|1|0|}208|205|}
{2010212001|XXGvertex_oport_oport|361|0|569|0|{3|log|}205|209|}
{2010006001|XXGobject_psameas_object|362|0|571|0|{metadata|log_metadata|1|0|}209|205|}
{2010211001|XXGvertex_iport_iport|363|0|572|0|{0|in|}205|210|}
{2010006001|XXGobject_psameas_object|364|0|574|0|{metadata|in_metadata|1|0|}210|205|}
{2010006001|XXGobject_psameas_object|365|0|575|0|{Layout|Layout|0|0|}199|107|}
{2010006001|XXGobject_psameas_object|366|0|576|0|{in_metadata|out1_metadata|0|0|}199|41|}
{2010006001|XXGobject_psameas_object|367|0|577|0|{out0_metadata|out_metadata|0|0|}199|169|}
{2010006001|XXGobject_psameas_object|368|0|578|0|{reject0_metadata|out1_metadata|0|0|}199|41|}
{2010601001|XXGgraph_vertex_vertex|369|0|579|0|{SRT_dxf_hk_|}156|211|}
{2010212001|XXGvertex_oport_oport|370|0|581|0|{0|out|}211|212|}
{2010213001|XXGoport_dst_flow|371|0|583|0|{0|}212|161|}
{2010211001|XXGvertex_iport_iport|372|0|584|0|{0|in|}211|213|}
{2010214001|XXGiport_src_flow|373|0|586|0|{0|}213|157|}
{2010007001|XXGobject_proto_object|374|0|587|0|{}211|214|}
{2010212001|XXGvertex_oport_oport|375|0|589|0|{0|out|}214|215|}
{2010006001|XXGobject_psameas_object|376|0|591|0|{metadata|out_metadata|1|0|}215|214|}
{2010211001|XXGvertex_iport_iport|377|0|592|0|{0|in|}214|216|}
{2010006001|XXGobject_psameas_object|378|0|594|0|{metadata|in_metadata|1|0|}216|214|}
{2010006001|XXGobject_psameas_object|379|0|595|0|{Layout|Layout|0|0|}211|107|}
{2010006001|XXGobject_psameas_object|380|0|596|0|{in_metadata|out_metadata|0|0|}211|169|}
{2010006001|XXGobject_psameas_object|381|0|597|0|{out_metadata|out_metadata|0|0|}211|169|}
{2010601001|XXGgraph_vertex_vertex|382|0|598|0|{Write_Lookup|}156|169|}
{2010211001|XXGvertex_iport_iport|383|0|599|0|{0|in0|}156|217|}
{2010215002|XXGiport_binding_iport|384|0|601|0|{.5|.5|{0|}10991|}217|204|}
{2010214001|XXGiport_src_flow|385|0|602|0|{0|}217|17|}
{2010601001|XXGgraph_vertex_vertex|386|0|603|0|{d_prod_disease_category_xwalk|}1|218|}
{2010007001|XXGobject_proto_object|387|0|605|0|{}218|219|}
{2010601001|XXGgraph_vertex_vertex|388|0|607|0|{ids_member|}1|129|}
{2010601001|XXGgraph_vertex_vertex|389|0|608|0|{ids_member_1|}1|125|}
{2010109001|XXGobject_property_value|390|0|609|0|{0|TrackingThumbprint|72|}1|220|}
