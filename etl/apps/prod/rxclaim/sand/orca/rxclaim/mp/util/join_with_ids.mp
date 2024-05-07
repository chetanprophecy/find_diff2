@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|254|rel_count|486|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS")) now()]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATASET|ids_rxclaim.f_claim_transaction.reduced|3|9|FK|@{0|}}
{30001002|XXparameter|TABLE_NAME|f_claim_trx_common_dtl2|3|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|$[get_ids_table_nk(IDS_DATASET)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|FLOW_TYPE|orx|15|9|FK|@{2|ctrx|orx|}}
{30001002|XXparameter|IDS_PATH|$PUB_DATAHUB_MFS_LOOKUP|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SERIAL_PATH|$PUB_DATAHUB_SERIAL_LOOKUP|3|9|EFK|@{0|}}
{30001002|XXparameter|INPUT_DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".dml" ;
end ]|3|9|FK|@{0|}}
{30001002|XXparameter|DML_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(file_information(PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".new.dml").found) PUB_DATAHUB_DML + "/" + v_sub_area + "/" + IDS_DATASET + ".new.dml" else INPUT_DML_FL ;
end ]|3|9|REFK|@{0|}}
{30001002|XXparameter|INPUT_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_IDX_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".idx" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_IDX_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.idx"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.idx" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_BKP_FL|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.bkp.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".bkp.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_ARCHIVE_BKP_FILE|$[begin
let string("") v_ids_dataset=IDS_DATASET;
let string("") v_sub_area=string_split(IDS_DATASET,".")[0];
let string("") v_target_nm=string_split(IDS_DATASET,".")[1];
result:: if(string_index(IDS_DATASET,".reduced")) IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".reduced.archive.bkp.dat.gz"
          else IDS_PATH + "/ids/" + v_sub_area + "/one/" + v_target_nm + ".archive.bkp.dat.gz" ;
end ]|3|9|REK|@{0|}}
{30001002|XXparameter|IS_INPUT_ARCHIVE_FILE_EXIST|$[file_information(INPUT_ARCHIVE_FILE).found]|3|9|FK|@{0|}}
{30001002|XXparameter|RECREATE_HASH_KEYS|False|13|9|FK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|newparam_0|************************************ clean consolidation realated pram *****************|3|9|RFK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|CLEAN_DATASET|rctc2p|3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_DEDUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|LAG_DAYS|-130|1|9|FK|@{0|}}
{30001002|XXparameter|START_DATE|$[(string(8)) (date("YYYYMMDD")) datetime_add(now(),days = LAG_DAYS) ]|3|9|FK|Date from which unload should start|{0|}}
{30001002|XXparameter|END_DATE|$[(string(8)) (date("YYYYMMDD")) now() ]|3|9|FK|current day file|{0|}}
{30001002|XXparameter|DO_DEFAULTING|True|13|9|FK|@{0|}}
{30001002|XXparameter|ILM_DML_PATH|$[ if(FLOW_TYPE=="orx") AI_DML + "/ilm/ilm.orx_f_claim_trx_common_dtl2.dml" else AI_DML + '/ilm/ilm.ctrx_f_claim_trx_common_dtl2.dml' ]|3|9|FK|@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME|$[ AI_MFS + "/split/split." + FLOW_TYPE + "_" + TABLE_NAME + ".ids_rxclaim." + TABLE_NAME + "." + (string("")) RUN_ID + ".dat.gz"  ]|3|9|FK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|SPLIT_FILE_DML|$[AI_DML + "/split.ids_rxclaim/split." + "ids_rxclaim." + TABLE_NAME + ".dml"]|3|9|FK|@{0|}}
{30001002|XXparameter|___Clean__File_Related_Parameters||3|9|K|@{0|}}
{30001002|XXparameter|CLEAN_FILE_MASK|$[if(FLOW_TYPE=="orx") "clean.rxclaim_orx.rctc2p.??????????????.dat.gz" else "clean.rxclaim_ctrx.rctc2p.??????????????.dat.gz" ]|3|9|REK|@{0|}}
{30001002|XXparameter|INPUT_READ_FL_VEC_INTER|$[
if(FLOW_TYPE=="orx") directory_listing( AI_MFS + "/clean.rxclaim_orx/", CLEAN_FILE_MASK ) else directory_listing( AI_MFS + "/clean.rxclaim_ctrx/", CLEAN_FILE_MASK ) 
 ]|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_READ_FL_VEC|$[begin
let string("")[int] v_all_ids_file_vec=INPUT_READ_FL_VEC_INTER;
let int len_vec=length_of(v_all_ids_file_vec);
            let string("")[int] v_final_ids_file_before_dummy= 
            for (let int i=0, i < len_vec): 
            if( ( (decimal("")) string_substring(string_split(v_all_ids_file_vec[i],".")[3],0,8) >=(decimal("")) START_DATE )  and ( (decimal("")) string_substring(string_split(v_all_ids_file_vec[i],".")[3],1,8) <= (decimal("")) END_DATE ) ) 
              v_all_ids_file_vec[i]; 


result ::  v_final_ids_file_before_dummy;
end ]|3|9|FK|This is the file that will be picked up based on start and end dttm|{0|}}
{30001002|XXparameter|INPUT_READ_DML|$[
if(FLOW_TYPE=="orx") string_concat( AI_DML , "/clean.rxclaim_orx/clean.rxclaim_orx." , CLEAN_DATASET , ".dml" ) else 
  string_concat( AI_DML , "/clean.rxclaim_ctrx/clean.rxclaim_ctrx." , CLEAN_DATASET , ".dml" )
 ]|3|9|FK|Input DML file|{0|}}
{30001002|XXparameter|DML_WITH_ICFF_HASH_KEY|$[join_types(read_file(INPUT_READ_DML),"record 
	unsigned integer(8)     dxf_hk_part1 =     0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
	unsigned integer(8)     dxf_hk_part2 =     0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
end ") ]|3|9|RFK|@{0|}}
{30001002|XXparameter|CLEAN_FILE_NATURAL_KEYS|\{qnp2nb;qnoinb;dqs6st;rxt_src_envrt_id\}|3|9|RFK|@{0|}}
{30001002|XXparameter|CLEAN_FILE_PATH|$[
if(FLOW_TYPE=="orx") AI_MFS + "/clean.rxclaim_orx"  else AI_MFS + "/clean.rxclaim_ctrx" 
 ]|3|9|RFK|@{0|}}
{30001002|XXparameter|SRC_ENV_SK|$[re_replace(if(FLOW_TYPE=='orx')'(string(""))(decimal(""))in.dxf_src_sys_id'       else 'in.rxt_src_envrt_id',"'","")]|3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|f_common_trx_dtl2|ndeotars|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1653000|555000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'f_common_trx_dtl2' Execution Status Report

***** Job execution failed at Thursday, April 19, 2018 13:53:24 *****
(Application Output may contain additional information describing the failure)
Run performed by user soumya.nagendra
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}15160|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}15174|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}15162|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}15170|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}15158|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}15176|529|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}15164|1041|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}15165|1041|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}15167|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}15169|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}15157|2065|}}
{2010503005|XXGfvertex|16|0|31|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_ARCHIVE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_ARCHIVE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_DML_FL|3|2|f$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@145000|255000|0|0|0|0|15156|Archive IDS File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|17|0|33|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|18|0|36|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|19|0|38|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|20|0|41|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.* :: in1.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$\{DML_WITH_ICFF_HASH_KEY\}|3|3|c|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|929000|333500|0|0|0|0|15166|Join: Matches on Natural Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|21|0|43|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|22|0|46|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|23|0|48|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|24|0|50|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|25|0|52|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|26|0|54|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|27|0|56|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|28|0|58|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|29|0|60|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|30|0|63|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|31|0|66|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
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
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|32|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|33|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|34|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|35|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|36|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|37|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|38|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|39|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|40|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010202004|XXGiport|41|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010503005|XXGfvertex|42|0|128|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SPLIT_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SPLIT_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$SPLIT_FILE_DML|3|2|f$|@{0|}}
}}@0|@1564000|373500|0|0|0|0|15138|Output File: Split file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|43|0|130|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|44|0|133|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|45|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|46|0|138|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural */ ;
  decimal("\\x01",0)    claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0)    claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)    claim_stat_id = NULL("") /*CHAR(1)*/;
  string("\\x01", maximum_length=5)  src_env_sk = NULL("") /*BIGINT*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  end|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"NATURAL_KEY")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|376000|130000|0|0|0|0|15159|Reformat: Generate Hash on NK Fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|47|0|140|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|48|0|143|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|49|0|145|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|50|0|147|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|149|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|153|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|53|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|54|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|55|0|162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|56|0|165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|58|0|172|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_DML_FL|3|2|f$|@{0|}}
}}@0|@140000|75000|0|0|0|0|15161|Main IDS File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|59|0|174|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|60|0|177|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|61|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|62|0|183|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"NATURAL_KEY")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$SPLIT_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$\{DML_WITH_ICFF_HASH_KEY\}|3|3|c|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|408000|389500|0|0|0|0|15163|Reformat: Generate Hash on Clean NK Fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|63|0|185|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|64|0|188|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|65|0|190|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|66|0|192|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|67|0|194|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|68|0|197|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|69|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|70|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|71|0|206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|72|0|209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|73|0|212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|215|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$[join_types('record\\n decimal("\\x01",0)    claim_nbr = NULL("") /*BIGINT*/;\\n decimal("\\x01",0)    claim_seq_nbr = NULL("") /*INTEGER*/;\\n string("\\x01",charset="iso-8859-15", maximum_length=1)    claim_stat_id = NULL("") /*CHAR(1)*/;\\n string("\\x01", maximum_length=5)  src_env_sk = NULL("") /*BIGINT*/;\\n end' , read_file(INPUT_READ_DML)) ]|3|9||@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.qnoinb :1: if(in.qnoinb < 0) in.qnoinb else (1000 - in.qnoinb); 
  out.claim_nbr :: in.qnp2nb;
  out.claim_seq_nbr :: if(in.qnoinb < 0) in.qnoinb else (1000 - in.qnoinb);
  out.claim_stat_id :: in.dqs6st;
  out.src_env_sk :: $SRC_ENV_SK;
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|201000|402500|0|0|0|0|15175|Reformat: Apply Xform Rules|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|75|0|217|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|76|0|220|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|77|0|222|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|224|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|226|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|229|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|81|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|82|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|83|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|84|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|248|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|let string("") file_path=string_concat("$\{CLEAN_FILE_PATH\}","/");
filename :: get_filename(in) =
begin

  filename :: this_partition_path(string_concat( file_path ,in.file_name));
end;|3|3|c|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/split|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$INPUT_READ_DML|3|2|f$|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|input_error|Ignore (continue with no reject or error)|3|1|l|@{0|}}
}}@0|@200391|59666|272000|84000|118000|113000|15009|Read Multiple Files: Read Specific Clean  Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|87|0|250|0|{@{}@389000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|88|0|252|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|89|0|254|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|256|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|258|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|92|0|260|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|262|0|{@{}@262000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|94|0|264|0|{@{}@384|.5|.5|{8|147000|129000|167000|129000|240000|129000|261000|129000|}15011|17|}}
{2010501005|XXGpvertex|95|0|266|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|filter|None (Read all records)|15|1|Fl|Limits the number of records read from each file|{2|None (Read all records)|Range (Read a subset of records from each file)|}}
{30001002|XXparameter|skip_count|0|1|2|FK$|Number of initial records to skip|{0|}}
{30001002|XXparameter|skip_count.display_name|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.keyword|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|read_count|0|1|2|FK$|Number of records to read from each file|{0|}}
{30001002|XXparameter|read_count.display_name|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.keyword|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
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
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if the input file is not readable or is otherwise unavailable|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Fail|3|13|Kv|What to do if the input file is not readable or is otherwise unavailable|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading an input file|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|96|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|97|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|98|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|99|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|100|0|280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|101|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|102|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|103|0|289|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(INPUT_READ_FL_VEC) ]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] input_file_name_vec = $[ string_representation(INPUT_READ_FL_VEC) ];

out :: create(index) =
begin
  out.file_name :: input_file_name_vec[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|log_checkpoint|1|3|1|l|@{0|}}
{30001002|XXparameter|log_computepoint|1|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file_name;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@50000|85000|77000|99000|60000|60000|15012|Find All cleans|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|291|0|{@{}@136000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|105|0|294|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|106|0|296|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|107|0|298|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluattransforanefoeacrecord Evaluattransforoncanusthavalufoalrecords|3|2|H$||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520144|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|108|0|300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|109|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|110|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|111|0|319|0|{Subgraph created from graph "f_common_trx_dtl2"|{}@0|@10195|408833|0|0|0|0|15177|Read Clean  Files|ndeotars|Created 4/13/2018 7:33:51 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|394000|233000|3|}}
{2010203004|XXGoport|112|0|324|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010501005|XXGpvertex|113|0|328|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*   Do not edit. Generated file - BRE 3.2.6.4;;Default deployment;   */
include '~$AI_XFR/bre_helper.map.xfr';
let string(int) bzt_0_6c54cc0a_59437409_7bd6_0 = $RUN_ID;

/*\@
dependency_analysis:
[
  [out0.clm_trx_dtl2.discount_flg,[passthrough],in0.qng6an]
  [out0.clm_trx_dtl2.him_aptc_ind,[passthrough],in0.qnedaq]
  [out0.clm_trx_dtl2.bypass_acc_flg,[passthrough],in0.qnhean]
  [out0.clm_trx_dtl2.clt_amt_due_step_no,[passthrough],in0.qnkban]
  [out0.clm_trx_dtl2.bla_ovrd_flg,[passthrough],in0.qneuai]
  [out0.clm_trx_dtl2.him_grace_perd_ind,[passthrough],in0.qnegaq]
  [out0.clm_trx_dtl2.nda_ovrd_flg,[passthrough],in0.qnetai]
  [out0.clm_trx_dtl2.short_cycle_clm_qlfr_cd,[passthrough],in0.qnxham]
  [out0.clm_trx_dtl2.trans_ref_id,[passthrough],in0.qnshho]
  [out0.clm_trx_dtl2.future_use2_cd,[passthrough],in0.qnj8hp]
  [out0.clm_trx_dtl2.short_cycle_prov_qlfr_cd,[passthrough],in0.qnxfam]
  [out0.clm_trx_dtl2.gppc_id,[passthrough],in0.qntaho]
  [out0.clm_trx_dtl2.tb_prequal_pass_flg,[passthrough],in0.qnbgak]
  [out0.clm_trx_dtl2.him_issuer_di,[passthrough],in0.qnkrhr]
  [out0.clm_trx_dtl2.dly_cst_shr_round_typ_flg,[passthrough],in0.qnhban]
  [out0.clm_trx_dtl2.him_csr_lvl,[passthrough],in0.qnecaq]
  [out0.clm_trx_dtl2.biosimilar_prod_flg,[passthrough],in0.qnhfan]
  [out0.clm_trx_dtl2.future_use3_cd,[passthrough],in0.qnj9hp]
  [out0.clm_trx_dtl2.gen_drg_cov_cd,[passthrough],in0.qndcai]
  [out0.clm_trx_dtl2.clt_amt_due_sched_id,[passthrough],in0.qnk7hp]
  [out0.clm_trx_dtl2.maint_list_stat_cd,[passthrough],in0.qnaqai]
  [out0.clm_trx_dtl2.spread_pricing_flg,[passthrough],in0.qnikao]
  [out0.clm_trx_dtl2.dcs_dly_prorate,[passthrough],in0.qnp7ap]
  [out0.clm_trx_dtl2.future_use_stat13_cd,[passthrough],in0.qnhkan]
  [out0.clm_trx_dtl2.future_use_stat9_cd,[passthrough],in0.qnhgan]
  [out0.clm_trx_dtl2.him_prod_nbr,[passthrough],in0.qnkshr]
  [out0.clm_trx_dtl2.rsp_payer_id,[passthrough],in0.qnj6hp]
  [out0.clm_trx_dtl2.bla_flg,[passthrough],in0.qnewai]
  [out0.clm_trx_dtl2.short_cycle_disp_std_no,[passthrough],in0.qnggan]
  [out0.clm_trx_dtl2.nda_flg,[passthrough],in0.qnevai]
  [out0.clm_trx_dtl2.dly_cst_shr_round_len_flg,[passthrough],in0.qnhcan]
  [out0.clm_trx_dtl2.dx_typ1_cd,[passthrough],in0.qnhhan]
  [out0.clm_trx_dtl2.unauthorized_pbr_flg,[passthrough],in0.qno9ak]
  [out0.clm_trx_dtl2.multi_source_cd,[passthrough],in0.qnhaan]
  [out0.clm_trx_dtl2.next_refill_dt,[transform],in0.qnance]
  [out0.clm_trx_dtl2.rsp_pyr_id_qlfr_cd,[passthrough],in0.qng7an]
  [out0.clm_trx_dtl2.mbr_tb_elgblty_flg,[passthrough],in0.qnrlak]
  [out0.clm_trx_dtl2.cost_ovrd_ind,[passthrough],in0.qntpaj]
  [out0.clm_trx_dtl2.cob_data_flg,[passthrough],in0.qnwmak]
  [out0.clm_trx_dtl2.him_seq_no,[passthrough],in0.qnehaq]
  [out0.clm_trx_dtl2.grace_perd_end_dt,[transform],in0.qnj7hp]
  [out0.clm_trx_dtl2.medicaid_subrogation_flg,[passthrough],in0.qnhgak]
  [out0.clm_trx_dtl2.him_std_compnt,[passthrough],in0.qnkthr]
  [out0.clm_trx_dtl2.sbm_original_rx_nbr,[passthrough],in0.qnxihn]
  [out0.clm_trx_dtl2.incent_sched_id,[passthrough],in0.qntbho]
  [out0.clm_trx_dtl2.spread_pricing_pct,[passthrough],in0.qnobqu]
  [out0.clm_trx_dtl2.him_pln_metal_ind,[passthrough],in0.qnefaq]
  [out0.clm_trx_dtl2.pde_form_nform_stat_cd,[passthrough],in0.qne0ai]
  [out0.clm_trx_dtl2.future_use_stat15_cd,[passthrough],in0.qnhman]
  [out0.clm_trx_dtl2.cred_455_ind,[passthrough],in0.qnynau]
  [out0.clm_trx_dtl2.phr_amt_due_step_no,[passthrough],in0.qnkaan]
  [out0.clm_trx_dtl2.ndc_list_id,[passthrough],in0.qnz5hm]
  [out0.clm_trx_dtl2.dx_list_id,[passthrough],in0.qnvmho]
  [out0.clm_trx_dtl2.him_st_cd,[passthrough],in0.qneiaq]
  [out0.clm_trx_dtl2.phr_xref_vldn_flg,[passthrough],in0.qnejaj]
  [out0.clm_trx_dtl2.std_thrpc_cls_cd,[passthrough],in0.qnzbaj]
  [out0.clm_trx_dtl2.dx_typ2_cd,[passthrough],in0.qnhian]
  [out0.clm_trx_dtl2.claim_pricing_flg,[passthrough],in0.qngwam]
  [out0.clm_trx_dtl2.dx_typ3_cd,[passthrough],in0.qnhjan]
  [out0.clm_trx_dtl2.pps_ds_ovrd_flg,[passthrough],in0.qng8an]
  [out0.clm_trx_dtl2.future_use_stat14_cd,[passthrough],in0.qnhlan]
  [out0.clm_trx_dtl2.clt_tax_ovrd_flg,[passthrough],in0.qng9an]
  [out0.clm_trx_dtl2.him_ethnicity_cd,[passthrough],in0.qneeaq]
  [out0.clm_trx_dtl2.dx_list_qlfr_cd,[passthrough],in0.qnl5am]
  [out0.clm_trx_dtl2.hic3_ovrd_flg,[passthrough],in0.qnjgai]
  [out0.clm_trx_dtl2.rx_otc_ind,[passthrough],in0.qnkvai]
  [out0.clm_trx_dtl2.short_cycle_prod_qlfr_cd,[passthrough],in0.qnxgam]
  [out0.clm_trx_dtl2.phr_amt_due_sched_id,[passthrough],in0.qnk6hp]
  [out0.clm_trx_dtl2.auto_pay_rejctn_flg,[passthrough],in0.qnhdan]
  [out0.clm_trx_dtl2.suppress_ltr_flg,[passthrough],in0.qnsaak]
  [out0.*,in0.*]
]
metrics:
\{
  dependencies:
  [
     [out0.clm_trx_dtl2.discount_flg,'clm_trx_dtl2.discount_flg',1,0]
     [out0.clm_trx_dtl2.him_aptc_ind,'clm_trx_dtl2.him_aptc_ind',1,0]
     [out0.clm_trx_dtl2.bypass_acc_flg,'clm_trx_dtl2.bypass_acc_flg',1,0]
     [out0.clm_trx_dtl2.clt_amt_due_step_no,'clm_trx_dtl2.clt_amt_due_step_no',1,0]
     [out0.clm_trx_dtl2.bla_ovrd_flg,'clm_trx_dtl2.bla_ovrd_flg',1,0]
     [out0.clm_trx_dtl2.him_grace_perd_ind,'clm_trx_dtl2.him_grace_perd_ind',1,0]
     [out0.clm_trx_dtl2.nda_ovrd_flg,'clm_trx_dtl2.nda_ovrd_flg',1,0]
     [out0.clm_trx_dtl2.short_cycle_clm_qlfr_cd,'clm_trx_dtl2.short_cycle_clm_qlfr_cd',1,0]
     [out0.clm_trx_dtl2.trans_ref_id,'clm_trx_dtl2.trans_ref_id',1,0]
     [out0.clm_trx_dtl2.future_use2_cd,'clm_trx_dtl2.future_use2_cd',1,0]
     [out0.clm_trx_dtl2.short_cycle_prov_qlfr_cd,'clm_trx_dtl2.short_cycle_prov_qlfr_cd',1,0]
     [out0.clm_trx_dtl2.gppc_id,'clm_trx_dtl2.gppc_id',1,0]
     [out0.clm_trx_dtl2.tb_prequal_pass_flg,'clm_trx_dtl2.tb_prequal_pass_flg',1,0]
     [out0.clm_trx_dtl2.him_issuer_di,'clm_trx_dtl2.him_issuer_di',1,0]
     [out0.clm_trx_dtl2.dly_cst_shr_round_typ_flg,'clm_trx_dtl2.dly_cst_shr_round_typ_flg',1,0]
     [out0.clm_trx_dtl2.him_csr_lvl,'clm_trx_dtl2.him_csr_lvl',1,0]
     [out0.dxf_src_file_name,'DXF Source File Name',1,0]
     [out0.clm_trx_dtl2.biosimilar_prod_flg,'clm_trx_dtl2.biosimilar_prod_flg',1,0]
     [out0.clm_trx_dtl2.future_use3_cd,'clm_trx_dtl2.future_use3_cd',1,0]
     [out0.clm_trx_dtl2.gen_drg_cov_cd,'clm_trx_dtl2.gen_drg_cov_cd',1,0]
     [out0.clm_trx_dtl2.clt_amt_due_sched_id,'clm_trx_dtl2.clt_amt_due_sched_id',1,0]
     [out0.clm_trx_dtl2.maint_list_stat_cd,'clm_trx_dtl2.maint_list_stat_cd',1,0]
     [out0.clm_trx_dtl2.spread_pricing_flg,'clm_trx_dtl2.spread_pricing_flg',1,0]
     [out0.clm_trx_dtl2.dcs_dly_prorate,'clm_trx_dtl2.dcs_dly_prorate',1,0]
     [out0.clm_trx_dtl2.future_use_stat13_cd,'clm_trx_dtl2.future_use_stat13_cd',1,0]
     [out0.clm_trx_dtl2.future_use_stat9_cd,'clm_trx_dtl2.future_use_stat9_cd',1,0]
     [out0.clm_trx_dtl2.him_prod_nbr,'clm_trx_dtl2.him_prod_nbr',1,0]
     [out0.clm_trx_dtl2.rsp_payer_id,'clm_trx_dtl2.rsp_payer_id',1,0]
     [out0.clm_trx_dtl2.bla_flg,'clm_trx_dtl2.bla_flg',1,0]
     [out0.clm_trx_dtl2.short_cycle_disp_std_no,'clm_trx_dtl2.short_cycle_disp_std_no',1,0]
     [out0.clm_trx_dtl2.nda_flg,'clm_trx_dtl2.nda_flg',1,0]
     [out0.clm_trx_dtl2.dly_cst_shr_round_len_flg,'clm_trx_dtl2.dly_cst_shr_round_len_flg',1,0]
     [out0.clm_trx_dtl2.dx_typ1_cd,'clm_trx_dtl2.dx_typ1_cd',1,0]
     [out0.clm_trx_dtl2.unauthorized_pbr_flg,'clm_trx_dtl2.unauthorized_pbr_flg',1,0]
     [out0.clm_trx_dtl2.multi_source_cd,'clm_trx_dtl2.multi_source_cd',1,0]
     [out0.clm_trx_dtl2.next_refill_dt,'clm_trx_dtl2.next_refill_dt',1,0]
     [out0.clm_trx_dtl2.rsp_pyr_id_qlfr_cd,'clm_trx_dtl2.rsp_pyr_id_qlfr_cd',1,0]
     [out0.clm_trx_dtl2.mbr_tb_elgblty_flg,'clm_trx_dtl2.mbr_tb_elgblty_flg',1,0]
     [out0.clm_trx_dtl2.cost_ovrd_ind,'clm_trx_dtl2.cost_ovrd_ind',1,0]
     [out0.clm_trx_dtl2.cob_data_flg,'clm_trx_dtl2.cob_data_flg',1,0]
     [out0.clm_trx_dtl2.him_seq_no,'clm_trx_dtl2.him_seq_no',1,0]
     [out0.clm_trx_dtl2.grace_perd_end_dt,'clm_trx_dtl2.grace_perd_end_dt',1,0]
     [out0.clm_trx_dtl2.medicaid_subrogation_flg,'clm_trx_dtl2.medicaid_subrogation_flg',1,0]
     [out0.dxf_src_dataset_id,'DXF Source Dataset ID',1,0]
     [out0.clm_trx_dtl2.him_std_compnt,'clm_trx_dtl2.him_std_compnt',1,0]
     [out0.clm_trx_dtl2.sbm_original_rx_nbr,'clm_trx_dtl2.sbm_original_rx_nbr',1,0]
     [out0.clm_trx_dtl2.incent_sched_id,'clm_trx_dtl2.incent_sched_id',1,0]
     [out0.clm_trx_dtl2.spread_pricing_pct,'clm_trx_dtl2.spread_pricing_pct',1,0]
     [out0.clm_trx_dtl2.him_pln_metal_ind,'clm_trx_dtl2.him_pln_metal_ind',1,0]
     [out0.clm_trx_dtl2.pde_form_nform_stat_cd,'clm_trx_dtl2.pde_form_nform_stat_cd',1,0]
     [out0.clm_trx_dtl2.future_use_stat15_cd,'clm_trx_dtl2.future_use_stat15_cd',1,0]
     [out0.clm_trx_dtl2.cred_455_ind,'clm_trx_dtl2.cred_455_ind',1,0]
     [out0.clm_trx_dtl2.phr_amt_due_step_no,'clm_trx_dtl2.phr_amt_due_step_no',1,0]
     [out0.clm_trx_dtl2.ndc_list_id,'clm_trx_dtl2.ndc_list_id',1,0]
     [out0.clm_trx_dtl2.dx_list_id,'clm_trx_dtl2.dx_list_id',1,0]
     [out0.clm_trx_dtl2.him_st_cd,'clm_trx_dtl2.him_st_cd',1,0]
     [out0.clm_trx_dtl2.phr_xref_vldn_flg,'clm_trx_dtl2.phr_xref_vldn_flg',1,0]
     [out0.clm_trx_dtl2.std_thrpc_cls_cd,'clm_trx_dtl2.std_thrpc_cls_cd',1,0]
     [out0.clm_trx_dtl2.dx_typ2_cd,'clm_trx_dtl2.dx_typ2_cd',1,0]
     [out0.clm_trx_dtl2.claim_pricing_flg,'clm_trx_dtl2.claim_pricing_flg',1,0]
     [out0.clm_trx_dtl2.dx_typ3_cd,'clm_trx_dtl2.dx_typ3_cd',1,0]
     [out0.clm_trx_dtl2.pps_ds_ovrd_flg,'clm_trx_dtl2.pps_ds_ovrd_flg',1,0]
     [out0.clm_trx_dtl2.future_use_stat14_cd,'clm_trx_dtl2.future_use_stat14_cd',1,0]
     [out0.clm_trx_dtl2.clt_tax_ovrd_flg,'clm_trx_dtl2.clt_tax_ovrd_flg',1,0]
     [out0.clm_trx_dtl2.him_ethnicity_cd,'clm_trx_dtl2.him_ethnicity_cd',1,0]
     [out0.clm_trx_dtl2.dx_list_qlfr_cd,'clm_trx_dtl2.dx_list_qlfr_cd',1,0]
     [out0.clm_trx_dtl2.hic3_ovrd_flg,'clm_trx_dtl2.hic3_ovrd_flg',1,0]
     [out0.clm_trx_dtl2.rx_otc_ind,'clm_trx_dtl2.rx_otc_ind',1,0]
     [out0.clm_trx_dtl2.short_cycle_prod_qlfr_cd,'clm_trx_dtl2.short_cycle_prod_qlfr_cd',1,0]
     [out0.clm_trx_dtl2.phr_amt_due_sched_id,'clm_trx_dtl2.phr_amt_due_sched_id',1,0]
     [out0.dxf_src_rec_cnt,'DXF Source Record Count',1,0]
     [out0.dxf_src_sys_id,'DXF Source System ID',1,0]
     [out0.clm_trx_dtl2.auto_pay_rejctn_flg,'clm_trx_dtl2.auto_pay_rejctn_flg',1,0]
     [out0.clm_trx_dtl2.suppress_ltr_flg,'clm_trx_dtl2.suppress_ltr_flg',1,0]
  ]
  impacts:
  [
     [in0.qnzbaj,'qnzbaj',1,1]
     [in0.qnefaq,'qnefaq',1,1]
     [in0.qnikao,'qnikao',1,1]
     [in0.qnhkan,'qnhkan',1,1]
     [in0.qnhjan,'qnhjan',1,1]
     [in0.qneiaq,'qneiaq',1,1]
     [in0.dxf_src_sys_id,'DXF Source System ID',1,1]
     [in0.qnp7ap,'qnp7ap',1,1]
     [in0.qnetai,'qnetai',1,1]
     [in0.qnegaq,'qnegaq',1,1]
     [in0.qnaqai,'qnaqai',1,1]
     [in0.qng6an,'qng6an',1,1]
     [in0.dxf_src_dataset_id,'DXF Source Dataset ID',1,1]
     [in0.qng7an,'qng7an',1,1]
     [in0.qndcai,'qndcai',1,1]
     [in0.qnxham,'qnxham',1,1]
     [in0.qnejaj,'qnejaj',1,1]
     [in0.qnxfam,'qnxfam',1,1]
     [in0.qnk6hp,'qnk6hp',1,1]
     [in0.qng9an,'qng9an',1,1]
     [in0.qnkaan,'qnkaan',1,1]
     [in0.qnk7hp,'qnk7hp',1,1]
     [in0.qnhcan,'qnhcan',1,1]
     [in0.qneeaq,'qneeaq',1,1]
     [in0.qnedaq,'qnedaq',1,1]
     [in0.qnkban,'qnkban',1,1]
     [in0.qnhaan,'qnhaan',1,1]
     [in0.qnggan,'qnggan',1,1]
     [in0.qnj8hp,'qnj8hp',1,1]
     [in0.qnwmak,'qnwmak',1,1]
     [in0.qnxgam,'qnxgam',1,1]
     [in0.qnhman,'qnhman',1,1]
     [in0.qnhban,'qnhban',1,1]
     [in0.qnehaq,'qnehaq',1,1]
     [in0.qnz5hm,'qnz5hm',1,1]
     [in0.qngwam,'qngwam',1,1]
     [in0.qnhfan,'qnhfan',1,1]
     [in0.qnj9hp,'qnj9hp',1,1]
     [in0.qnewai,'qnewai',1,1]
     [in0.qnhgak,'qnhgak',1,1]
     [in0.qnhian,'qnhian',1,1]
     [in0.qnvmho,'qnvmho',1,1]
     [in0.qntpaj,'qntpaj',1,1]
     [in0.qnkvai,'qnkvai',1,1]
     [in0.qnl5am,'qnl5am',1,1]
     [in0.qng8an,'qng8an',1,1]
     [in0.qnhgan,'qnhgan',1,1]
     [in0.qne0ai,'qne0ai',1,1]
     [in0.qnbgak,'qnbgak',1,1]
     [in0.qnkthr,'qnkthr',1,1]
     [in0.qnance,'qnance',1,1]
     [in0.qno9ak,'qno9ak',1,1]
     [in0.qntbho,'qntbho',1,1]
     [in0.qnxihn,'qnxihn',1,1]
     [in0.dxf_src_file_name,'DXF Source File Name',1,1]
     [in0.qntaho,'qntaho',1,1]
     [in0.qnhdan,'qnhdan',1,1]
     [in0.qnhean,'qnhean',1,1]
     [in0.qnecaq,'qnecaq',1,1]
     [in0.qnjgai,'qnjgai',1,1]
     [in0.qneuai,'qneuai',1,1]
     [in0.qnhlan,'qnhlan',1,1]
     [in0.qnshho,'qnshho',1,1]
     [in0.qnevai,'qnevai',1,1]
     [in0.qnj6hp,'qnj6hp',1,1]
     [in0.qnobqu,'qnobqu',1,1]
     [in0.qnkrhr,'qnkrhr',1,1]
     [in0.qnj7hp,'qnj7hp',1,1]
     [in0.qnkshr,'qnkshr',1,1]
     [in0.dxf_src_rec_cnt,'DXF Source Record Count',1,1]
     [in0.qnrlak,'qnrlak',1,1]
     [in0.qnsaak,'qnsaak',1,1]
     [in0.qnynau,'qnynau',1,1]
     [in0.qnhhan,'qnhhan',1,1]
  ]
\}
\@*/

out0::reformat(in0)=
begin
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_ndc_list_id = fail_if_error(in0.qnz5hm);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_maint_list_stat_cd = fail_if_error(in0.qnaqai);
let date("YYYYMMDD")("\\x01") clm_trx_dtl2_next_refill_dt;
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_gen_drg_cov_cd = fail_if_error(in0.qndcai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_nda_flg = fail_if_error(in0.qnevai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_nda_ovrd_flg = fail_if_error(in0.qnetai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_bla_flg = fail_if_error(in0.qnewai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_bla_ovrd_flg = fail_if_error(in0.qneuai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_pde_form_nform_stat_cd = fail_if_error(in0.qne0ai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_hic3_ovrd_flg = fail_if_error(in0.qnjgai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_rx_otc_ind = fail_if_error(in0.qnkvai);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_phr_xref_vldn_flg = fail_if_error(in0.qnejaj);
let string("\\x01",charset="iso-8859-15", maximum_length=12) clm_trx_dtl2_sbm_original_rx_nbr = fail_if_error(in0.qnxihn);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_cost_ovrd_ind = fail_if_error(in0.qntpaj);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_std_thrpc_cls_cd = fail_if_error(in0.qnzbaj);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_tb_prequal_pass_flg = fail_if_error(in0.qnbgak);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_medicaid_subrogation_flg = fail_if_error(in0.qnhgak);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_unauthorized_pbr_flg = fail_if_error(in0.qno9ak);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_mbr_tb_elgblty_flg = fail_if_error(in0.qnrlak);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_suppress_ltr_flg = fail_if_error(in0.qnsaak);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_cob_data_flg = fail_if_error(in0.qnwmak);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_trans_ref_id = fail_if_error(in0.qnshho);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_claim_pricing_flg = fail_if_error(in0.qngwam);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_gppc_id = fail_if_error(in0.qntaho);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_incent_sched_id = fail_if_error(in0.qntbho);
let string("\\x01",charset="iso-8859-15", maximum_length=6) clm_trx_dtl2_dx_list_id = fail_if_error(in0.qnvmho);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dx_list_qlfr_cd = fail_if_error(in0.qnl5am);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_short_cycle_prov_qlfr_cd = fail_if_error(in0.qnxfam);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_short_cycle_prod_qlfr_cd = fail_if_error(in0.qnxgam);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_short_cycle_clm_qlfr_cd = fail_if_error(in0.qnxham);
let decimal("\\x01",0) clm_trx_dtl2_short_cycle_disp_std_no = fail_if_error(in0.qnggan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_discount_flg = fail_if_error(in0.qng6an);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_rsp_pyr_id_qlfr_cd = fail_if_error(in0.qng7an);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_rsp_payer_id = fail_if_error(in0.qnj6hp);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_phr_amt_due_sched_id = fail_if_error(in0.qnk6hp);
let decimal("\\x01",0) clm_trx_dtl2_phr_amt_due_step_no = fail_if_error(in0.qnkaan);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_clt_amt_due_sched_id = fail_if_error(in0.qnk7hp);
let decimal("\\x01",0) clm_trx_dtl2_clt_amt_due_step_no = fail_if_error(in0.qnkban);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_pps_ds_ovrd_flg = fail_if_error(in0.qng8an);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_clt_tax_ovrd_flg = fail_if_error(in0.qng9an);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_multi_source_cd = fail_if_error(in0.qnhaan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dly_cst_shr_round_typ_flg = fail_if_error(in0.qnhban);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dly_cst_shr_round_len_flg = fail_if_error(in0.qnhcan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_auto_pay_rejctn_flg = fail_if_error(in0.qnhdan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_bypass_acc_flg = fail_if_error(in0.qnhean);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_biosimilar_prod_flg = fail_if_error(in0.qnhfan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_future_use_stat9_cd = fail_if_error(in0.qnhgan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dx_typ1_cd = fail_if_error(in0.qnhhan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dx_typ2_cd = fail_if_error(in0.qnhian);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_dx_typ3_cd = fail_if_error(in0.qnhjan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_future_use_stat13_cd = fail_if_error(in0.qnhkan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_future_use_stat14_cd = fail_if_error(in0.qnhlan);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_future_use_stat15_cd = fail_if_error(in0.qnhman);
let date("YYYYMMDD")("\\x01") clm_trx_dtl2_grace_perd_end_dt;
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_future_use2_cd = fail_if_error(in0.qnj8hp);
let string("\\x01",charset="iso-8859-15", maximum_length=10) clm_trx_dtl2_future_use3_cd = fail_if_error(in0.qnj9hp);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_spread_pricing_flg = fail_if_error(in0.qnikao);
let decimal("\\x01".6, maximum_length=10, sign_reserved) clm_trx_dtl2_spread_pricing_pct = fail_if_error(in0.qnobqu);
let decimal("\\x01".4, maximum_length=14, sign_reserved) clm_trx_dtl2_dcs_dly_prorate = fail_if_error(in0.qnp7ap);
let decimal("\\x01",0) clm_trx_dtl2_him_seq_no = fail_if_error(in0.qnehaq);
let string("\\x01",charset="iso-8859-15", maximum_length=5) clm_trx_dtl2_him_issuer_di = fail_if_error(in0.qnkrhr);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_him_st_cd = fail_if_error(in0.qneiaq);
let string("\\x01",charset="iso-8859-15", maximum_length=3) clm_trx_dtl2_him_prod_nbr = fail_if_error(in0.qnkshr);
let string("\\x01",charset="iso-8859-15", maximum_length=4) clm_trx_dtl2_him_std_compnt = fail_if_error(in0.qnkthr);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_him_csr_lvl = fail_if_error(in0.qnecaq);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_him_aptc_ind = fail_if_error(in0.qnedaq);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_him_ethnicity_cd = fail_if_error(in0.qneeaq);
let string("\\x01",charset="iso-8859-15", maximum_length=1) clm_trx_dtl2_him_pln_metal_ind = fail_if_error(in0.qnefaq);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_him_grace_perd_ind = fail_if_error(in0.qnegaq);
let string("\\x01",charset="iso-8859-15", maximum_length=2) clm_trx_dtl2_cred_455_ind = fail_if_error(in0.qnynau);



/*   Default value   */
clm_trx_dtl2_next_refill_dt=fail_if_error(date_check(in0.qnance));

/*   Default value   */
clm_trx_dtl2_grace_perd_end_dt=fail_if_error(date_check(in0.qnj7hp));

  out0.clm_trx_dtl2.ndc_list_id::clm_trx_dtl2_ndc_list_id;
  out0.clm_trx_dtl2.maint_list_stat_cd::clm_trx_dtl2_maint_list_stat_cd;
  out0.clm_trx_dtl2.next_refill_dt::clm_trx_dtl2_next_refill_dt;
  out0.clm_trx_dtl2.gen_drg_cov_cd::clm_trx_dtl2_gen_drg_cov_cd;
  out0.clm_trx_dtl2.nda_flg::clm_trx_dtl2_nda_flg;
  out0.clm_trx_dtl2.nda_ovrd_flg::clm_trx_dtl2_nda_ovrd_flg;
  out0.clm_trx_dtl2.bla_flg::clm_trx_dtl2_bla_flg;
  out0.clm_trx_dtl2.bla_ovrd_flg::clm_trx_dtl2_bla_ovrd_flg;
  out0.clm_trx_dtl2.pde_form_nform_stat_cd::clm_trx_dtl2_pde_form_nform_stat_cd;
  out0.clm_trx_dtl2.hic3_ovrd_flg::clm_trx_dtl2_hic3_ovrd_flg;
  out0.clm_trx_dtl2.rx_otc_ind::clm_trx_dtl2_rx_otc_ind;
  out0.clm_trx_dtl2.phr_xref_vldn_flg::clm_trx_dtl2_phr_xref_vldn_flg;
  out0.clm_trx_dtl2.sbm_original_rx_nbr::clm_trx_dtl2_sbm_original_rx_nbr;
  out0.clm_trx_dtl2.cost_ovrd_ind::clm_trx_dtl2_cost_ovrd_ind;
  out0.clm_trx_dtl2.std_thrpc_cls_cd::clm_trx_dtl2_std_thrpc_cls_cd;
  out0.clm_trx_dtl2.tb_prequal_pass_flg::clm_trx_dtl2_tb_prequal_pass_flg;
  out0.clm_trx_dtl2.medicaid_subrogation_flg::clm_trx_dtl2_medicaid_subrogation_flg;
  out0.clm_trx_dtl2.unauthorized_pbr_flg::clm_trx_dtl2_unauthorized_pbr_flg;
  out0.clm_trx_dtl2.mbr_tb_elgblty_flg::clm_trx_dtl2_mbr_tb_elgblty_flg;
  out0.clm_trx_dtl2.suppress_ltr_flg::clm_trx_dtl2_suppress_ltr_flg;
  out0.clm_trx_dtl2.cob_data_flg::clm_trx_dtl2_cob_data_flg;
  out0.clm_trx_dtl2.trans_ref_id::clm_trx_dtl2_trans_ref_id;
  out0.clm_trx_dtl2.claim_pricing_flg::clm_trx_dtl2_claim_pricing_flg;
  out0.clm_trx_dtl2.gppc_id::clm_trx_dtl2_gppc_id;
  out0.clm_trx_dtl2.incent_sched_id::clm_trx_dtl2_incent_sched_id;
  out0.clm_trx_dtl2.dx_list_id::clm_trx_dtl2_dx_list_id;
  out0.clm_trx_dtl2.dx_list_qlfr_cd::clm_trx_dtl2_dx_list_qlfr_cd;
  out0.clm_trx_dtl2.short_cycle_prov_qlfr_cd::clm_trx_dtl2_short_cycle_prov_qlfr_cd;
  out0.clm_trx_dtl2.short_cycle_prod_qlfr_cd::clm_trx_dtl2_short_cycle_prod_qlfr_cd;
  out0.clm_trx_dtl2.short_cycle_clm_qlfr_cd::clm_trx_dtl2_short_cycle_clm_qlfr_cd;
  out0.clm_trx_dtl2.short_cycle_disp_std_no::clm_trx_dtl2_short_cycle_disp_std_no;
  out0.clm_trx_dtl2.discount_flg::clm_trx_dtl2_discount_flg;
  out0.clm_trx_dtl2.rsp_pyr_id_qlfr_cd::clm_trx_dtl2_rsp_pyr_id_qlfr_cd;
  out0.clm_trx_dtl2.rsp_payer_id::clm_trx_dtl2_rsp_payer_id;
  out0.clm_trx_dtl2.phr_amt_due_sched_id::clm_trx_dtl2_phr_amt_due_sched_id;
  out0.clm_trx_dtl2.phr_amt_due_step_no::clm_trx_dtl2_phr_amt_due_step_no;
  out0.clm_trx_dtl2.clt_amt_due_sched_id::clm_trx_dtl2_clt_amt_due_sched_id;
  out0.clm_trx_dtl2.clt_amt_due_step_no::clm_trx_dtl2_clt_amt_due_step_no;
  out0.clm_trx_dtl2.pps_ds_ovrd_flg::clm_trx_dtl2_pps_ds_ovrd_flg;
  out0.clm_trx_dtl2.clt_tax_ovrd_flg::clm_trx_dtl2_clt_tax_ovrd_flg;
  out0.clm_trx_dtl2.multi_source_cd::clm_trx_dtl2_multi_source_cd;
  out0.clm_trx_dtl2.dly_cst_shr_round_typ_flg::clm_trx_dtl2_dly_cst_shr_round_typ_flg;
  out0.clm_trx_dtl2.dly_cst_shr_round_len_flg::clm_trx_dtl2_dly_cst_shr_round_len_flg;
  out0.clm_trx_dtl2.auto_pay_rejctn_flg::clm_trx_dtl2_auto_pay_rejctn_flg;
  out0.clm_trx_dtl2.bypass_acc_flg::clm_trx_dtl2_bypass_acc_flg;
  out0.clm_trx_dtl2.biosimilar_prod_flg::clm_trx_dtl2_biosimilar_prod_flg;
  out0.clm_trx_dtl2.future_use_stat9_cd::clm_trx_dtl2_future_use_stat9_cd;
  out0.clm_trx_dtl2.dx_typ1_cd::clm_trx_dtl2_dx_typ1_cd;
  out0.clm_trx_dtl2.dx_typ2_cd::clm_trx_dtl2_dx_typ2_cd;
  out0.clm_trx_dtl2.dx_typ3_cd::clm_trx_dtl2_dx_typ3_cd;
  out0.clm_trx_dtl2.future_use_stat13_cd::clm_trx_dtl2_future_use_stat13_cd;
  out0.clm_trx_dtl2.future_use_stat14_cd::clm_trx_dtl2_future_use_stat14_cd;
  out0.clm_trx_dtl2.future_use_stat15_cd::clm_trx_dtl2_future_use_stat15_cd;
  out0.clm_trx_dtl2.grace_perd_end_dt::clm_trx_dtl2_grace_perd_end_dt;
  out0.clm_trx_dtl2.future_use2_cd::clm_trx_dtl2_future_use2_cd;
  out0.clm_trx_dtl2.future_use3_cd::clm_trx_dtl2_future_use3_cd;
  out0.clm_trx_dtl2.spread_pricing_flg::clm_trx_dtl2_spread_pricing_flg;
  out0.clm_trx_dtl2.spread_pricing_pct::clm_trx_dtl2_spread_pricing_pct;
  out0.clm_trx_dtl2.dcs_dly_prorate::clm_trx_dtl2_dcs_dly_prorate;
  out0.clm_trx_dtl2.him_seq_no::clm_trx_dtl2_him_seq_no;
  out0.clm_trx_dtl2.him_issuer_di::clm_trx_dtl2_him_issuer_di;
  out0.clm_trx_dtl2.him_st_cd::clm_trx_dtl2_him_st_cd;
  out0.clm_trx_dtl2.him_prod_nbr::clm_trx_dtl2_him_prod_nbr;
  out0.clm_trx_dtl2.him_std_compnt::clm_trx_dtl2_him_std_compnt;
  out0.clm_trx_dtl2.him_csr_lvl::clm_trx_dtl2_him_csr_lvl;
  out0.clm_trx_dtl2.him_aptc_ind::clm_trx_dtl2_him_aptc_ind;
  out0.clm_trx_dtl2.him_ethnicity_cd::clm_trx_dtl2_him_ethnicity_cd;
  out0.clm_trx_dtl2.him_pln_metal_ind::clm_trx_dtl2_him_pln_metal_ind;
  out0.clm_trx_dtl2.him_grace_perd_ind::clm_trx_dtl2_him_grace_perd_ind;
  out0.clm_trx_dtl2.cred_455_ind::clm_trx_dtl2_cred_455_ind;
  out0.*::in0.*;

end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$ILM_DML_PATH|3|2|f$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1146000|333500|0|0|0|0|15168|Reformat: Appliy Core Xform Rules|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|330|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|115|0|333|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|116|0|335|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|117|0|337|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|118|0|339|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|342|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|120|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|121|0|348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|122|0|351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|123|0|354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|125|0|363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out :: in.clm_trx_dtl2;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1341000|337500|0|0|0|0|15171|Reformat: Apply Split DML  Xform Rules|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|126|0|365|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|127|0|368|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|128|0|370|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|129|0|372|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|130|0|374|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|131|0|377|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|132|0|379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|133|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|134|0|386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|135|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|136|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|137|0|402|0|{Subgraph created from graph "create_nz_load_ready_from_main_ids"|{}@0|@635500|407750|0|0|0|0|15112|Sort and De-Dup On Hash Keys|Mukesh.Singh|Created 4/13/2018 5:47:01 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|712000|348000|3|}}
{2010240003|XXGlegend|138|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $ICFF_KEY  |50000|160000|0|0|0|0|14515|}}
{2010242002|XXGface|139|0|406|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|140|0|408|0|{@{}@384|.5|.5|{0|}14555|17|}}
{2010210004|XXGflow|141|0|410|0|{@{}@384|.5|.5|{0|}14553|17|}}
{2010210004|XXGflow|142|0|412|0|{@{}@384|.5|.5|{0|}14552|17|}}
{2010501005|XXGpvertex|143|0|414|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|436000|38500|0|0|0|0|14554|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|144|0|416|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|145|0|418|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|146|0|421|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|147|0|423|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|148|0|425|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|149|0|427|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|150|0|430|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|151|0|432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|152|0|435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|153|0|438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|154|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|155|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|156|0|447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|157|0|455|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@25000|20500|0|0|481000|303000|14556|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|158|0|457|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|159|0|459|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|160|0|461|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|161|0|464|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|162|0|468|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|163|0|470|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|164|0|472|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|165|0|477|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|166|0|481|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|167|0|484|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|168|0|486|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|169|0|488|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|170|0|490|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|171|0|493|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|495|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|173|0|497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|174|0|500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|175|0|505|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|176|0|507|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|177|0|509|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|178|0|512|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|179|0|514|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|180|0|517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|181|0|523|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|182|0|526|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|183|0|531|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; dqc4dt descending\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|250000|25000|0|0|0|0|14549|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|184|0|533|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|536|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|186|0|539|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|187|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|188|0|544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|189|0|550|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|412000|197500|0|0|0|0|14507|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|190|0|552|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|191|0|555|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|192|0|557|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|193|0|562|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|194|0|566|0|{@{}@0|0|0|0|in0|.3074712643678161|@@@13840|0|}}
{2010600005|XXGgraph|195|0|570|0|{Subgraph created from graph "create_nz_load_ready_from_main_ids"|{}@0|@605500|137750|0|0|0|0|15154|Sort and De-Dup on Hash Key|Mukesh.Singh|Created 4/13/2018 5:38:08 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|712000|467000|3|}}
{2010240003|XXGlegend|196|0|572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@ICFF_KEY: $ICFF_KEY  |50000|160000|0|0|0|0|14515|}}
{2010242002|XXGface|197|0|574|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|198|0|576|0|{@{}@384|.5|.5|{0|}14557|17|}}
{2010210004|XXGflow|199|0|578|0|{@{}@384|.5|.5|{0|}14553|17|}}
{2010210004|XXGflow|200|0|580|0|{@{}@384|.5|.5|{0|}14552|17|}}
{2010501005|XXGpvertex|201|0|582|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|436000|38500|0|0|0|0|14554|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|202|0|584|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|203|0|586|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|204|0|589|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|205|0|591|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|206|0|593|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|207|0|595|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|208|0|598|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|209|0|600|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|210|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|211|0|606|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|212|0|609|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|213|0|612|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|214|0|615|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|215|0|623|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@45000|25000|0|0|481000|303000|14558|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|216|0|625|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|217|0|627|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|218|0|629|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|219|0|632|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|220|0|636|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|638|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|222|0|640|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|223|0|645|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|224|0|649|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|225|0|652|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|226|0|654|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|227|0|656|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|658|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|229|0|661|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|230|0|663|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|231|0|665|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|232|0|668|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|233|0|673|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|234|0|675|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|235|0|677|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|236|0|680|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|237|0|682|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|238|0|685|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|239|0|691|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|240|0|694|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|241|0|699|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|250000|25000|0|0|0|0|14541|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|242|0|701|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|243|0|704|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|244|0|707|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|245|0|709|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|246|0|712|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|247|0|718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|412000|197500|0|0|0|0|14507|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|248|0|720|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|249|0|723|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|250|0|725|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|251|0|730|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|252|0|734|0|{@{}@0|0|0|0|in0|.3576017130620985|@@@13840|0|}}
{2010110002|XXGconstant|253|0|738|0|{@{}@{1|9478180|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_11|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_13|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_15|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_6|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_7|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_8|}1|15|}
{2010601001|XXGgraph_vertex_vertex|15|0|30|0|{Archive_IDS_File|}1|16|}
{2010212001|XXGvertex_oport_oport|16|0|32|0|{0|read|}16|17|}
{2010213001|XXGoport_dst_flow|17|0|34|0|{0|}17|15|}
{2010007001|XXGobject_proto_object|18|0|35|0|{}16|18|}
{2010212001|XXGvertex_oport_oport|19|0|37|0|{0|read|}18|19|}
{2010006001|XXGobject_psameas_object|20|0|39|0|{metadata|read_metadata|1|0|}19|18|}
{2010601001|XXGgraph_vertex_vertex|21|0|40|0|{Join_Matches_on_Natural_Key|}1|20|}
{2010212001|XXGvertex_oport_oport|22|0|42|0|{0|out|}20|21|}
{2010213001|XXGoport_dst_flow|23|0|44|0|{0|}21|13|}
{2010212001|XXGvertex_oport_oport|24|0|45|0|{1|unused0|}20|22|}
{2010212001|XXGvertex_oport_oport|25|0|47|0|{2|unused1|}20|23|}
{2010212001|XXGvertex_oport_oport|26|0|49|0|{3|reject0|}20|24|}
{2010212001|XXGvertex_oport_oport|27|0|51|0|{4|reject1|}20|25|}
{2010212001|XXGvertex_oport_oport|28|0|53|0|{5|error0|}20|26|}
{2010212001|XXGvertex_oport_oport|29|0|55|0|{6|error1|}20|27|}
{2010212001|XXGvertex_oport_oport|30|0|57|0|{7|log|}20|28|}
{2010211001|XXGvertex_iport_iport|31|0|59|0|{0|in0|}20|29|}
{2010214001|XXGiport_src_flow|32|0|61|0|{0|}29|11|}
{2010211001|XXGvertex_iport_iport|33|0|62|0|{1|in1|}20|30|}
{2010214001|XXGiport_src_flow|34|0|64|0|{0|}30|12|}
{2010007001|XXGobject_proto_object|35|0|65|0|{}20|31|}
{2010212001|XXGvertex_oport_oport|36|0|67|0|{0|out|}31|32|}
{2010006001|XXGobject_psameas_object|37|0|69|0|{metadata|out_metadata|1|0|}32|31|}
{2010212001|XXGvertex_oport_oport|38|0|70|0|{1|unused0|}31|33|}
{2010006001|XXGobject_psameas_object|39|0|72|0|{metadata|unused0_metadata|1|0|}33|31|}
{2010212001|XXGvertex_oport_oport|40|0|73|0|{2|unused1|}31|34|}
{2010006001|XXGobject_psameas_object|41|0|75|0|{metadata|unused1_metadata|1|0|}34|31|}
{2010212001|XXGvertex_oport_oport|42|0|76|0|{3|reject0|}31|35|}
{2010006001|XXGobject_psameas_object|43|0|78|0|{metadata|reject0_metadata|1|0|}35|31|}
{2010212001|XXGvertex_oport_oport|44|0|79|0|{4|reject1|}31|36|}
{2010006001|XXGobject_psameas_object|45|0|81|0|{metadata|reject1_metadata|1|0|}36|31|}
{2010212001|XXGvertex_oport_oport|46|0|82|0|{5|error0|}31|37|}
{2010006001|XXGobject_psameas_object|47|0|84|0|{metadata|error0_metadata|1|0|}37|31|}
{2010212001|XXGvertex_oport_oport|48|0|85|0|{6|error1|}31|38|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{metadata|error1_metadata|1|0|}38|31|}
{2010212001|XXGvertex_oport_oport|50|0|88|0|{7|log|}31|39|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{metadata|log_metadata|1|0|}39|31|}
{2010211001|XXGvertex_iport_iport|52|0|91|0|{0|in0|}31|40|}
{2010006001|XXGobject_psameas_object|53|0|93|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|54|0|94|0|{dedup0|dedup0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|55|0|95|0|{dedup_keyword0|dedup_keyword0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|56|0|96|0|{dedup_positional0|dedup_positional0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|57|0|97|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|58|0|98|0|{matchoptional_positional0|matchoptional_positional0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|59|0|99|0|{metadata|in0_metadata|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|60|0|100|0|{override_key0|override_key0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|61|0|101|0|{record_match_required0|record_match_required0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|62|0|102|0|{record_match_required_not0|record_match_required_not0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|63|0|103|0|{record_required0|record_required0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|64|0|104|0|{record_required_keyword0|record_required_keyword0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|65|0|105|0|{record_required_positional0|record_required_positional0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|66|0|106|0|{select0|select0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|67|0|107|0|{select_keyword0|select_keyword0|1|0|}40|31|}
{2010006001|XXGobject_psameas_object|68|0|108|0|{select_positional0|select_positional0|1|0|}40|31|}
{2010211001|XXGvertex_iport_iport|69|0|109|0|{1|in1|}31|41|}
{2010006001|XXGobject_psameas_object|70|0|111|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|71|0|112|0|{dedup1|dedup1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|72|0|113|0|{dedup_keyword1|dedup_keyword1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|73|0|114|0|{dedup_positional1|dedup_positional1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|74|0|115|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|75|0|116|0|{matchoptional_positional1|matchoptional_positional1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|76|0|117|0|{metadata|in1_metadata|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|77|0|118|0|{override_key1|override_key1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|78|0|119|0|{record_match_required1|record_match_required1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|79|0|120|0|{record_match_required_not1|record_match_required_not1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|80|0|121|0|{record_required1|record_required1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|81|0|122|0|{record_required_keyword1|record_required_keyword1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|82|0|123|0|{record_required_positional1|record_required_positional1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|83|0|124|0|{select1|select1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|84|0|125|0|{select_keyword1|select_keyword1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|85|0|126|0|{select_positional1|select_positional1|1|0|}41|31|}
{2010006001|XXGobject_psameas_object|86|0|127|0|{Layout|Layout|0|0|}20|42|}
{2010211001|XXGvertex_iport_iport|87|0|129|0|{0|write|}42|43|}
{2010214001|XXGiport_src_flow|88|0|131|0|{0|}43|8|}
{2010007001|XXGobject_proto_object|89|0|132|0|{}42|44|}
{2010211001|XXGvertex_iport_iport|90|0|134|0|{0|write|}44|45|}
{2010006001|XXGobject_psameas_object|91|0|136|0|{metadata|write_metadata|1|0|}45|44|}
{2010006001|XXGobject_psameas_object|92|0|137|0|{in0_metadata|out0_metadata|0|0|}20|46|}
{2010212001|XXGvertex_oport_oport|93|0|139|0|{0|out0|}46|47|}
{2010213001|XXGoport_dst_flow|94|0|141|0|{0|}47|9|}
{2010212001|XXGvertex_oport_oport|95|0|142|0|{1|reject0|}46|48|}
{2010212001|XXGvertex_oport_oport|96|0|144|0|{2|error0|}46|49|}
{2010212001|XXGvertex_oport_oport|97|0|146|0|{3|log|}46|50|}
{2010211001|XXGvertex_iport_iport|98|0|148|0|{0|in|}46|51|}
{2010214001|XXGiport_src_flow|99|0|150|0|{0|}51|5|}
{2010214001|XXGiport_src_flow|100|0|151|0|{1|}51|15|}
{2010007001|XXGobject_proto_object|101|0|152|0|{}46|52|}
{2010212001|XXGvertex_oport_oport|102|0|154|0|{0|out0|}52|53|}
{2010006001|XXGobject_psameas_object|103|0|156|0|{metadata|out0_metadata|1|0|}53|52|}
{2010006001|XXGobject_psameas_object|104|0|157|0|{transform0|transform0|1|0|}53|52|}
{2010212001|XXGvertex_oport_oport|105|0|158|0|{1|reject0|}52|54|}
{2010006001|XXGobject_psameas_object|106|0|160|0|{metadata|reject0_metadata|1|0|}54|52|}
{2010212001|XXGvertex_oport_oport|107|0|161|0|{2|error0|}52|55|}
{2010006001|XXGobject_psameas_object|108|0|163|0|{metadata|error0_metadata|1|0|}55|52|}
{2010212001|XXGvertex_oport_oport|109|0|164|0|{3|log|}52|56|}
{2010006001|XXGobject_psameas_object|110|0|166|0|{metadata|log_metadata|1|0|}56|52|}
{2010211001|XXGvertex_iport_iport|111|0|167|0|{0|in|}52|57|}
{2010006001|XXGobject_psameas_object|112|0|169|0|{metadata|in_metadata|1|0|}57|52|}
{2010006001|XXGobject_psameas_object|113|0|170|0|{Layout|Layout|0|0|}46|16|}
{2010006001|XXGobject_psameas_object|114|0|171|0|{in_metadata|read_metadata|0|0|}46|58|}
{2010212001|XXGvertex_oport_oport|115|0|173|0|{0|read|}58|59|}
{2010213001|XXGoport_dst_flow|116|0|175|0|{0|}59|5|}
{2010007001|XXGobject_proto_object|117|0|176|0|{}58|60|}
{2010212001|XXGvertex_oport_oport|118|0|178|0|{0|read|}60|61|}
{2010006001|XXGobject_psameas_object|119|0|180|0|{metadata|read_metadata|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|120|0|181|0|{reject0_metadata|read_metadata|0|0|}46|58|}
{2010006001|XXGobject_psameas_object|121|0|182|0|{in1_metadata|out0_metadata|0|0|}20|62|}
{2010212001|XXGvertex_oport_oport|122|0|184|0|{0|out0|}62|63|}
{2010213001|XXGoport_dst_flow|123|0|186|0|{0|}63|7|}
{2010212001|XXGvertex_oport_oport|124|0|187|0|{1|reject0|}62|64|}
{2010212001|XXGvertex_oport_oport|125|0|189|0|{2|error0|}62|65|}
{2010212001|XXGvertex_oport_oport|126|0|191|0|{3|log|}62|66|}
{2010211001|XXGvertex_iport_iport|127|0|193|0|{0|in|}62|67|}
{2010214001|XXGiport_src_flow|128|0|195|0|{0|}67|6|}
{2010007001|XXGobject_proto_object|129|0|196|0|{}62|68|}
{2010212001|XXGvertex_oport_oport|130|0|198|0|{0|out0|}68|69|}
{2010006001|XXGobject_psameas_object|131|0|200|0|{metadata|out0_metadata|1|0|}69|68|}
{2010006001|XXGobject_psameas_object|132|0|201|0|{transform0|transform0|1|0|}69|68|}
{2010212001|XXGvertex_oport_oport|133|0|202|0|{1|reject0|}68|70|}
{2010006001|XXGobject_psameas_object|134|0|204|0|{metadata|reject0_metadata|1|0|}70|68|}
{2010212001|XXGvertex_oport_oport|135|0|205|0|{2|error0|}68|71|}
{2010006001|XXGobject_psameas_object|136|0|207|0|{metadata|error0_metadata|1|0|}71|68|}
{2010212001|XXGvertex_oport_oport|137|0|208|0|{3|log|}68|72|}
{2010006001|XXGobject_psameas_object|138|0|210|0|{metadata|log_metadata|1|0|}72|68|}
{2010211001|XXGvertex_iport_iport|139|0|211|0|{0|in|}68|73|}
{2010006001|XXGobject_psameas_object|140|0|213|0|{metadata|in_metadata|1|0|}73|68|}
{2010006001|XXGobject_psameas_object|141|0|214|0|{in_metadata|out0_metadata|0|0|}62|74|}
{2010212001|XXGvertex_oport_oport|142|0|216|0|{0|out0|}74|75|}
{2010213001|XXGoport_dst_flow|143|0|218|0|{0|}75|6|}
{2010212001|XXGvertex_oport_oport|144|0|219|0|{1|reject0|}74|76|}
{2010212001|XXGvertex_oport_oport|145|0|221|0|{2|error0|}74|77|}
{2010212001|XXGvertex_oport_oport|146|0|223|0|{3|log|}74|78|}
{2010211001|XXGvertex_iport_iport|147|0|225|0|{0|in|}74|79|}
{2010214001|XXGiport_src_flow|148|0|227|0|{0|}79|10|}
{2010007001|XXGobject_proto_object|149|0|228|0|{}74|80|}
{2010212001|XXGvertex_oport_oport|150|0|230|0|{0|out0|}80|81|}
{2010006001|XXGobject_psameas_object|151|0|232|0|{metadata|out0_metadata|1|0|}81|80|}
{2010006001|XXGobject_psameas_object|152|0|233|0|{transform0|transform0|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|153|0|234|0|{1|reject0|}80|82|}
{2010006001|XXGobject_psameas_object|154|0|236|0|{metadata|reject0_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|155|0|237|0|{2|error0|}80|83|}
{2010006001|XXGobject_psameas_object|156|0|239|0|{metadata|error0_metadata|1|0|}83|80|}
{2010212001|XXGvertex_oport_oport|157|0|240|0|{3|log|}80|84|}
{2010006001|XXGobject_psameas_object|158|0|242|0|{metadata|log_metadata|1|0|}84|80|}
{2010211001|XXGvertex_iport_iport|159|0|243|0|{0|in|}80|85|}
{2010006001|XXGobject_psameas_object|160|0|245|0|{metadata|in_metadata|1|0|}85|80|}
{2010006001|XXGobject_psameas_object|161|0|246|0|{Layout|Layout|0|0|}74|62|}
{2010006001|XXGobject_psameas_object|162|0|247|0|{in_metadata|out_metadata|0|0|}74|86|}
{2010212001|XXGvertex_oport_oport|163|0|249|0|{0|out|}86|87|}
{2010212001|XXGvertex_oport_oport|164|0|251|0|{1|filereject|}86|88|}
{2010212001|XXGvertex_oport_oport|165|0|253|0|{2|fileerror|}86|89|}
{2010212001|XXGvertex_oport_oport|166|0|255|0|{3|reject|}86|90|}
{2010212001|XXGvertex_oport_oport|167|0|257|0|{4|error|}86|91|}
{2010212001|XXGvertex_oport_oport|168|0|259|0|{5|log|}86|92|}
{2010211001|XXGvertex_iport_iport|169|0|261|0|{0|in|}86|93|}
{2010214001|XXGiport_src_flow|170|0|263|0|{0|}93|94|}
{2010007001|XXGobject_proto_object|171|0|265|0|{}86|95|}
{2010212001|XXGvertex_oport_oport|172|0|267|0|{0|out|}95|96|}
{2010006001|XXGobject_psameas_object|173|0|269|0|{metadata|out_metadata|1|0|}96|95|}
{2010212001|XXGvertex_oport_oport|174|0|270|0|{1|filereject|}95|97|}
{2010006001|XXGobject_psameas_object|175|0|272|0|{metadata|filereject_metadata|1|0|}97|95|}
{2010212001|XXGvertex_oport_oport|176|0|273|0|{2|fileerror|}95|98|}
{2010006001|XXGobject_psameas_object|177|0|275|0|{metadata|fileerror_metadata|1|0|}98|95|}
{2010212001|XXGvertex_oport_oport|178|0|276|0|{3|reject|}95|99|}
{2010006001|XXGobject_psameas_object|179|0|278|0|{metadata|reject_metadata|1|0|}99|95|}
{2010212001|XXGvertex_oport_oport|180|0|279|0|{4|error|}95|100|}
{2010006001|XXGobject_psameas_object|181|0|281|0|{metadata|error_metadata|1|0|}100|95|}
{2010212001|XXGvertex_oport_oport|182|0|282|0|{5|log|}95|101|}
{2010006001|XXGobject_psameas_object|183|0|284|0|{metadata|log_metadata|1|0|}101|95|}
{2010211001|XXGvertex_iport_iport|184|0|285|0|{0|in|}95|102|}
{2010006001|XXGobject_psameas_object|185|0|287|0|{metadata|in_metadata|1|0|}102|95|}
{2010006001|XXGobject_psameas_object|186|0|288|0|{filereject_metadata|out_metadata|0|0|}86|103|}
{2010212001|XXGvertex_oport_oport|187|0|290|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|188|0|292|0|{0|}104|94|}
{2010212001|XXGvertex_oport_oport|189|0|293|0|{1|error|}103|105|}
{2010212001|XXGvertex_oport_oport|190|0|295|0|{2|log|}103|106|}
{2010007001|XXGobject_proto_object|191|0|297|0|{}103|107|}
{2010212001|XXGvertex_oport_oport|192|0|299|0|{0|out|}107|108|}
{2010006001|XXGobject_psameas_object|193|0|301|0|{metadata|out_metadata|1|0|}108|107|}
{2010212001|XXGvertex_oport_oport|194|0|302|0|{1|error|}107|109|}
{2010006001|XXGobject_psameas_object|195|0|304|0|{metadata|error_metadata|1|0|}109|107|}
{2010212001|XXGvertex_oport_oport|196|0|305|0|{2|log|}107|110|}
{2010006001|XXGobject_psameas_object|197|0|307|0|{metadata|log_metadata|1|0|}110|107|}
{2010006001|XXGobject_psameas_object|198|0|308|0|{Layout|Layout|0|0|}103|86|}
{2010006001|XXGobject_psameas_object|199|0|309|0|{in_metadata|out_metadata|0|0|}86|103|}
{2010006001|XXGobject_psameas_object|200|0|310|0|{reject0_metadata|out_metadata|0|0|}74|86|}
{2010006001|XXGobject_psameas_object|201|0|311|0|{reject0_metadata|out0_metadata|0|0|}62|74|}
{2010006001|XXGobject_psameas_object|202|0|312|0|{reject0_metadata|out0_metadata|0|0|}20|46|}
{2010006001|XXGobject_psameas_object|203|0|313|0|{reject1_metadata|out0_metadata|0|0|}20|62|}
{2010006001|XXGobject_psameas_object|204|0|314|0|{unused0_metadata|out0_metadata|0|0|}20|46|}
{2010006001|XXGobject_psameas_object|205|0|315|0|{unused1_metadata|out0_metadata|0|0|}20|62|}
{2010601001|XXGgraph_vertex_vertex|206|0|316|0|{Main_IDS_File|}1|58|}
{2010601001|XXGgraph_vertex_vertex|207|0|317|0|{Output_File_Split_file|}1|42|}
{2010601001|XXGgraph_vertex_vertex|208|0|318|0|{Read_Clean_Files|}1|111|}
{2010604001|XXGgraph_flow_flow|209|0|320|0|{Flow_10|}111|94|}
{2010601001|XXGgraph_vertex_vertex|210|0|321|0|{Find_All_cleans|}111|103|}
{2010601001|XXGgraph_vertex_vertex|211|0|322|0|{Read_Multiple_Files_Read_Specific_Clean_Files|}111|86|}
{2010212001|XXGvertex_oport_oport|212|0|323|0|{0|out0|}111|112|}
{2010216002|XXGoport_binding_oport|213|0|325|0|{.5|.5|{0|}15013|}112|87|}
{2010213001|XXGoport_dst_flow|214|0|326|0|{0|}112|10|}
{2010601001|XXGgraph_vertex_vertex|215|0|327|0|{Reformat_Appliy_Core_Xform_Rules|}1|113|}
{2010212001|XXGvertex_oport_oport|216|0|329|0|{0|out0|}113|114|}
{2010213001|XXGoport_dst_flow|217|0|331|0|{0|}114|14|}
{2010212001|XXGvertex_oport_oport|218|0|332|0|{1|reject0|}113|115|}
{2010212001|XXGvertex_oport_oport|219|0|334|0|{2|error0|}113|116|}
{2010212001|XXGvertex_oport_oport|220|0|336|0|{3|log|}113|117|}
{2010211001|XXGvertex_iport_iport|221|0|338|0|{0|in|}113|118|}
{2010214001|XXGiport_src_flow|222|0|340|0|{0|}118|13|}
{2010007001|XXGobject_proto_object|223|0|341|0|{}113|119|}
{2010212001|XXGvertex_oport_oport|224|0|343|0|{0|out0|}119|120|}
{2010006001|XXGobject_psameas_object|225|0|345|0|{metadata|out0_metadata|1|0|}120|119|}
{2010006001|XXGobject_psameas_object|226|0|346|0|{transform0|transform0|1|0|}120|119|}
{2010212001|XXGvertex_oport_oport|227|0|347|0|{1|reject0|}119|121|}
{2010006001|XXGobject_psameas_object|228|0|349|0|{metadata|reject0_metadata|1|0|}121|119|}
{2010212001|XXGvertex_oport_oport|229|0|350|0|{2|error0|}119|122|}
{2010006001|XXGobject_psameas_object|230|0|352|0|{metadata|error0_metadata|1|0|}122|119|}
{2010212001|XXGvertex_oport_oport|231|0|353|0|{3|log|}119|123|}
{2010006001|XXGobject_psameas_object|232|0|355|0|{metadata|log_metadata|1|0|}123|119|}
{2010211001|XXGvertex_iport_iport|233|0|356|0|{0|in|}119|124|}
{2010006001|XXGobject_psameas_object|234|0|358|0|{metadata|in_metadata|1|0|}124|119|}
{2010006001|XXGobject_psameas_object|235|0|359|0|{Layout|Layout|0|0|}113|42|}
{2010006001|XXGobject_psameas_object|236|0|360|0|{in_metadata|out_metadata|0|0|}113|20|}
{2010006001|XXGobject_psameas_object|237|0|361|0|{reject0_metadata|out_metadata|0|0|}113|20|}
{2010601001|XXGgraph_vertex_vertex|238|0|362|0|{Reformat_Apply_Split_DML_Xform_Rules|}1|125|}
{2010212001|XXGvertex_oport_oport|239|0|364|0|{0|out0|}125|126|}
{2010213001|XXGoport_dst_flow|240|0|366|0|{0|}126|8|}
{2010212001|XXGvertex_oport_oport|241|0|367|0|{1|reject0|}125|127|}
{2010212001|XXGvertex_oport_oport|242|0|369|0|{2|error0|}125|128|}
{2010212001|XXGvertex_oport_oport|243|0|371|0|{3|log|}125|129|}
{2010211001|XXGvertex_iport_iport|244|0|373|0|{0|in|}125|130|}
{2010214001|XXGiport_src_flow|245|0|375|0|{0|}130|14|}
{2010007001|XXGobject_proto_object|246|0|376|0|{}125|131|}
{2010212001|XXGvertex_oport_oport|247|0|378|0|{0|out0|}131|132|}
{2010006001|XXGobject_psameas_object|248|0|380|0|{metadata|out0_metadata|1|0|}132|131|}
{2010006001|XXGobject_psameas_object|249|0|381|0|{transform0|transform0|1|0|}132|131|}
{2010212001|XXGvertex_oport_oport|250|0|382|0|{1|reject0|}131|133|}
{2010006001|XXGobject_psameas_object|251|0|384|0|{metadata|reject0_metadata|1|0|}133|131|}
{2010212001|XXGvertex_oport_oport|252|0|385|0|{2|error0|}131|134|}
{2010006001|XXGobject_psameas_object|253|0|387|0|{metadata|error0_metadata|1|0|}134|131|}
{2010212001|XXGvertex_oport_oport|254|0|388|0|{3|log|}131|135|}
{2010006001|XXGobject_psameas_object|255|0|390|0|{metadata|log_metadata|1|0|}135|131|}
{2010211001|XXGvertex_iport_iport|256|0|391|0|{0|in|}131|136|}
{2010006001|XXGobject_psameas_object|257|0|393|0|{metadata|in_metadata|1|0|}136|131|}
{2010006001|XXGobject_psameas_object|258|0|394|0|{Layout|Layout|0|0|}125|42|}
{2010006001|XXGobject_psameas_object|259|0|395|0|{in_metadata|out0_metadata|0|0|}125|113|}
{2010006001|XXGobject_psameas_object|260|0|396|0|{out0_metadata|write_metadata|0|0|}125|42|}
{2010006001|XXGobject_psameas_object|261|0|397|0|{reject0_metadata|out0_metadata|0|0|}125|113|}
{2010601001|XXGgraph_vertex_vertex|262|0|398|0|{Reformat_Apply_Xform_Rules|}1|74|}
{2010601001|XXGgraph_vertex_vertex|263|0|399|0|{Reformat_Generate_Hash_on_Clean_NK_Fields|}1|62|}
{2010601001|XXGgraph_vertex_vertex|264|0|400|0|{Reformat_Generate_Hash_on_NK_Fields|}1|46|}
{2010601001|XXGgraph_vertex_vertex|265|0|401|0|{Sort_and_De_Dup_On_Hash_Keys|}1|137|}
{2010605001|XXGgraph_legend_legend|266|0|403|0|{0|}137|138|}
{2010241001|XXGlegend_face_face|267|0|405|0|{}138|139|}
{2010604001|XXGgraph_flow_flow|268|0|407|0|{Flow_1|}137|140|}
{2010604001|XXGgraph_flow_flow|269|0|409|0|{Flow_5|}137|141|}
{2010604001|XXGgraph_flow_flow|270|0|411|0|{Flow_9|}137|142|}
{2010601001|XXGgraph_vertex_vertex|271|0|413|0|{Dedup_Sorted|}137|143|}
{2010212001|XXGvertex_oport_oport|272|0|415|0|{0|out|}143|144|}
{2010212001|XXGvertex_oport_oport|273|0|417|0|{1|dup|}143|145|}
{2010213001|XXGoport_dst_flow|274|0|419|0|{0|}145|141|}
{2010212001|XXGvertex_oport_oport|275|0|420|0|{2|reject|}143|146|}
{2010212001|XXGvertex_oport_oport|276|0|422|0|{3|error|}143|147|}
{2010212001|XXGvertex_oport_oport|277|0|424|0|{4|log|}143|148|}
{2010211001|XXGvertex_iport_iport|278|0|426|0|{0|in|}143|149|}
{2010214001|XXGiport_src_flow|279|0|428|0|{0|}149|142|}
{2010007001|XXGobject_proto_object|280|0|429|0|{}143|150|}
{2010212001|XXGvertex_oport_oport|281|0|431|0|{0|out|}150|151|}
{2010006001|XXGobject_psameas_object|282|0|433|0|{metadata|out_metadata|1|0|}151|150|}
{2010212001|XXGvertex_oport_oport|283|0|434|0|{1|dup|}150|152|}
{2010006001|XXGobject_psameas_object|284|0|436|0|{metadata|dup_metadata|1|0|}152|150|}
{2010212001|XXGvertex_oport_oport|285|0|437|0|{2|reject|}150|153|}
{2010006001|XXGobject_psameas_object|286|0|439|0|{metadata|reject_metadata|1|0|}153|150|}
{2010212001|XXGvertex_oport_oport|287|0|440|0|{3|error|}150|154|}
{2010006001|XXGobject_psameas_object|288|0|442|0|{metadata|error_metadata|1|0|}154|150|}
{2010212001|XXGvertex_oport_oport|289|0|443|0|{4|log|}150|155|}
{2010006001|XXGobject_psameas_object|290|0|445|0|{metadata|log_metadata|1|0|}155|150|}
{2010211001|XXGvertex_iport_iport|291|0|446|0|{0|in|}150|156|}
{2010006001|XXGobject_psameas_object|292|0|448|0|{metadata|in_metadata|1|0|}156|150|}
{2010006001|XXGobject_psameas_object|293|0|449|0|{Layout|Layout|0|0|}143|42|}
{2010006001|XXGobject_psameas_object|294|0|450|0|{dup_metadata|out0_metadata|0|0|}143|62|}
{2010006001|XXGobject_psameas_object|295|0|451|0|{in_metadata|out0_metadata|0|0|}143|62|}
{2010006001|XXGobject_psameas_object|296|0|452|0|{out_metadata|out0_metadata|0|0|}143|62|}
{2010006001|XXGobject_psameas_object|297|0|453|0|{reject_metadata|out0_metadata|0|0|}143|62|}
{2010601001|XXGgraph_vertex_vertex|298|0|454|0|{Partition_by_Key_and_Sort|}137|157|}
{2010604001|XXGgraph_flow_flow|299|0|456|0|{Flow_1|}157|158|}
{2010601001|XXGgraph_vertex_vertex|300|0|458|0|{Partition_by_Key|}157|159|}
{2010212001|XXGvertex_oport_oport|301|0|460|0|{0|out|}159|160|}
{2010213001|XXGoport_dst_flow|302|0|462|0|{0|}160|158|}
{2010211001|XXGvertex_iport_iport|303|0|463|0|{0|in|}159|161|}
{2010006001|XXGobject_psameas_object|304|0|465|0|{in_metadata|out0_metadata|0|0|}159|62|}
{2010006001|XXGobject_psameas_object|305|0|466|0|{out_metadata|out0_metadata|0|0|}159|62|}
{2010601001|XXGgraph_vertex_vertex|306|0|467|0|{Sort|}157|162|}
{2010212001|XXGvertex_oport_oport|307|0|469|0|{0|out|}162|163|}
{2010211001|XXGvertex_iport_iport|308|0|471|0|{0|in|}162|164|}
{2010214001|XXGiport_src_flow|309|0|473|0|{0|}164|158|}
{2010006001|XXGobject_psameas_object|310|0|474|0|{in_metadata|out0_metadata|0|0|}162|62|}
{2010006001|XXGobject_psameas_object|311|0|475|0|{out_metadata|out0_metadata|0|0|}162|62|}
{2010212001|XXGvertex_oport_oport|312|0|476|0|{0|out0|}157|165|}
{2010216002|XXGoport_binding_oport|313|0|478|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}165|163|}
{2010213001|XXGoport_dst_flow|314|0|479|0|{0|}165|140|}
{2010211001|XXGvertex_iport_iport|315|0|480|0|{0|in0|}157|166|}
{2010215002|XXGiport_binding_iport|316|0|482|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}166|161|}
{2010007001|XXGobject_proto_object|317|0|483|0|{}157|167|}
{2010604001|XXGgraph_flow_flow|318|0|485|0|{Flow_1|}167|168|}
{2010601001|XXGgraph_vertex_vertex|319|0|487|0|{Partition_by_Key|}167|169|}
{2010212001|XXGvertex_oport_oport|320|0|489|0|{0|out|}169|170|}
{2010213001|XXGoport_dst_flow|321|0|491|0|{0|}170|168|}
{2010211001|XXGvertex_iport_iport|322|0|492|0|{0|in|}169|171|}
{2010007001|XXGobject_proto_object|323|0|494|0|{}169|172|}
{2010212001|XXGvertex_oport_oport|324|0|496|0|{0|out|}172|173|}
{2010006001|XXGobject_psameas_object|325|0|498|0|{metadata|out_metadata|1|0|}173|172|}
{2010211001|XXGvertex_iport_iport|326|0|499|0|{0|in|}172|174|}
{2010006001|XXGobject_psameas_object|327|0|501|0|{metadata|in_metadata|1|0|}174|172|}
{2010006001|XXGobject_psameas_object|328|0|502|0|{Layout|InputLayout|1|0|}169|167|}
{2010006001|XXGobject_psameas_object|329|0|503|0|{key|Key|1|0|}169|167|}
{2010601001|XXGgraph_vertex_vertex|330|0|504|0|{Sort|}167|175|}
{2010212001|XXGvertex_oport_oport|331|0|506|0|{0|out|}175|176|}
{2010211001|XXGvertex_iport_iport|332|0|508|0|{0|in|}175|177|}
{2010214001|XXGiport_src_flow|333|0|510|0|{0|}177|168|}
{2010007001|XXGobject_proto_object|334|0|511|0|{}175|178|}
{2010212001|XXGvertex_oport_oport|335|0|513|0|{0|out|}178|179|}
{2010006001|XXGobject_psameas_object|336|0|515|0|{metadata|out_metadata|1|0|}179|178|}
{2010211001|XXGvertex_iport_iport|337|0|516|0|{0|in|}178|180|}
{2010006001|XXGobject_psameas_object|338|0|518|0|{metadata|in_metadata|1|0|}180|178|}
{2010006001|XXGobject_psameas_object|339|0|519|0|{Layout|OutputLayout|1|0|}175|167|}
{2010006001|XXGobject_psameas_object|340|0|520|0|{key|Key|1|0|}175|167|}
{2010006001|XXGobject_psameas_object|341|0|521|0|{max_core|Max_core|1|0|}175|167|}
{2010212001|XXGvertex_oport_oport|342|0|522|0|{0|out0|}167|181|}
{2010216002|XXGoport_binding_oport|343|0|524|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}181|176|}
{2010211001|XXGvertex_iport_iport|344|0|525|0|{0|in0|}167|182|}
{2010215002|XXGiport_binding_iport|345|0|527|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}182|171|}
{2010006001|XXGobject_psameas_object|346|0|528|0|{InputLayout|Layout|0|0|}157|62|}
{2010006001|XXGobject_psameas_object|347|0|529|0|{OutputLayout|Layout|0|0|}157|42|}
{2010601001|XXGgraph_vertex_vertex|348|0|530|0|{Sort_within_Groups|}137|183|}
{2010212001|XXGvertex_oport_oport|349|0|532|0|{0|out|}183|184|}
{2010213001|XXGoport_dst_flow|350|0|534|0|{0|}184|142|}
{2010211001|XXGvertex_iport_iport|351|0|535|0|{0|in|}183|185|}
{2010214001|XXGiport_src_flow|352|0|537|0|{0|}185|140|}
{2010007001|XXGobject_proto_object|353|0|538|0|{}183|186|}
{2010212001|XXGvertex_oport_oport|354|0|540|0|{0|out|}186|187|}
{2010006001|XXGobject_psameas_object|355|0|542|0|{metadata|out_metadata|1|0|}187|186|}
{2010211001|XXGvertex_iport_iport|356|0|543|0|{0|in|}186|188|}
{2010006001|XXGobject_psameas_object|357|0|545|0|{metadata|in_metadata|1|0|}188|186|}
{2010006001|XXGobject_psameas_object|358|0|546|0|{Layout|Layout|0|0|}183|42|}
{2010006001|XXGobject_psameas_object|359|0|547|0|{in_metadata|out0_metadata|0|0|}183|62|}
{2010006001|XXGobject_psameas_object|360|0|548|0|{out_metadata|out0_metadata|0|0|}183|62|}
{2010601001|XXGgraph_vertex_vertex|361|0|549|0|{Trash|}137|189|}
{2010211001|XXGvertex_iport_iport|362|0|551|0|{0|in|}189|190|}
{2010214001|XXGiport_src_flow|363|0|553|0|{0|}190|141|}
{2010007001|XXGobject_proto_object|364|0|554|0|{}189|191|}
{2010211001|XXGvertex_iport_iport|365|0|556|0|{0|in|}191|192|}
{2010006001|XXGobject_psameas_object|366|0|558|0|{metadata|in_metadata|1|0|}192|191|}
{2010006001|XXGobject_psameas_object|367|0|559|0|{Layout|Layout|0|0|}189|42|}
{2010006001|XXGobject_psameas_object|368|0|560|0|{in_metadata|out0_metadata|0|0|}189|62|}
{2010212001|XXGvertex_oport_oport|369|0|561|0|{0|out0|}137|193|}
{2010216002|XXGoport_binding_oport|370|0|563|0|{.5|.5|{0|}14558|}193|144|}
{2010213001|XXGoport_dst_flow|371|0|564|0|{0|}193|12|}
{2010211001|XXGvertex_iport_iport|372|0|565|0|{0|in0|}137|194|}
{2010215002|XXGiport_binding_iport|373|0|567|0|{.5|.5|{0|}14557|}194|166|}
{2010214001|XXGiport_src_flow|374|0|568|0|{0|}194|7|}
{2010601001|XXGgraph_vertex_vertex|375|0|569|0|{Sort_and_De_Dup_on_Hash_Key|}1|195|}
{2010605001|XXGgraph_legend_legend|376|0|571|0|{0|}195|196|}
{2010241001|XXGlegend_face_face|377|0|573|0|{}196|197|}
{2010604001|XXGgraph_flow_flow|378|0|575|0|{Flow_1|}195|198|}
{2010604001|XXGgraph_flow_flow|379|0|577|0|{Flow_5|}195|199|}
{2010604001|XXGgraph_flow_flow|380|0|579|0|{Flow_9|}195|200|}
{2010601001|XXGgraph_vertex_vertex|381|0|581|0|{Dedup_Sorted|}195|201|}
{2010212001|XXGvertex_oport_oport|382|0|583|0|{0|out|}201|202|}
{2010212001|XXGvertex_oport_oport|383|0|585|0|{1|dup|}201|203|}
{2010213001|XXGoport_dst_flow|384|0|587|0|{0|}203|199|}
{2010212001|XXGvertex_oport_oport|385|0|588|0|{2|reject|}201|204|}
{2010212001|XXGvertex_oport_oport|386|0|590|0|{3|error|}201|205|}
{2010212001|XXGvertex_oport_oport|387|0|592|0|{4|log|}201|206|}
{2010211001|XXGvertex_iport_iport|388|0|594|0|{0|in|}201|207|}
{2010214001|XXGiport_src_flow|389|0|596|0|{0|}207|200|}
{2010007001|XXGobject_proto_object|390|0|597|0|{}201|208|}
{2010212001|XXGvertex_oport_oport|391|0|599|0|{0|out|}208|209|}
{2010006001|XXGobject_psameas_object|392|0|601|0|{metadata|out_metadata|1|0|}209|208|}
{2010212001|XXGvertex_oport_oport|393|0|602|0|{1|dup|}208|210|}
{2010006001|XXGobject_psameas_object|394|0|604|0|{metadata|dup_metadata|1|0|}210|208|}
{2010212001|XXGvertex_oport_oport|395|0|605|0|{2|reject|}208|211|}
{2010006001|XXGobject_psameas_object|396|0|607|0|{metadata|reject_metadata|1|0|}211|208|}
{2010212001|XXGvertex_oport_oport|397|0|608|0|{3|error|}208|212|}
{2010006001|XXGobject_psameas_object|398|0|610|0|{metadata|error_metadata|1|0|}212|208|}
{2010212001|XXGvertex_oport_oport|399|0|611|0|{4|log|}208|213|}
{2010006001|XXGobject_psameas_object|400|0|613|0|{metadata|log_metadata|1|0|}213|208|}
{2010211001|XXGvertex_iport_iport|401|0|614|0|{0|in|}208|214|}
{2010006001|XXGobject_psameas_object|402|0|616|0|{metadata|in_metadata|1|0|}214|208|}
{2010006001|XXGobject_psameas_object|403|0|617|0|{Layout|Layout|0|0|}201|42|}
{2010006001|XXGobject_psameas_object|404|0|618|0|{dup_metadata|out0_metadata|0|0|}201|46|}
{2010006001|XXGobject_psameas_object|405|0|619|0|{in_metadata|out0_metadata|0|0|}201|46|}
{2010006001|XXGobject_psameas_object|406|0|620|0|{out_metadata|out0_metadata|0|0|}201|46|}
{2010006001|XXGobject_psameas_object|407|0|621|0|{reject_metadata|out0_metadata|0|0|}201|46|}
{2010601001|XXGgraph_vertex_vertex|408|0|622|0|{Partition_by_Key_and_Sort|}195|215|}
{2010604001|XXGgraph_flow_flow|409|0|624|0|{Flow_1|}215|216|}
{2010601001|XXGgraph_vertex_vertex|410|0|626|0|{Partition_by_Key|}215|217|}
{2010212001|XXGvertex_oport_oport|411|0|628|0|{0|out|}217|218|}
{2010213001|XXGoport_dst_flow|412|0|630|0|{0|}218|216|}
{2010211001|XXGvertex_iport_iport|413|0|631|0|{0|in|}217|219|}
{2010006001|XXGobject_psameas_object|414|0|633|0|{in_metadata|out0_metadata|0|0|}217|46|}
{2010006001|XXGobject_psameas_object|415|0|634|0|{out_metadata|out0_metadata|0|0|}217|46|}
{2010601001|XXGgraph_vertex_vertex|416|0|635|0|{Sort|}215|220|}
{2010212001|XXGvertex_oport_oport|417|0|637|0|{0|out|}220|221|}
{2010211001|XXGvertex_iport_iport|418|0|639|0|{0|in|}220|222|}
{2010214001|XXGiport_src_flow|419|0|641|0|{0|}222|216|}
{2010006001|XXGobject_psameas_object|420|0|642|0|{in_metadata|out0_metadata|0|0|}220|46|}
{2010006001|XXGobject_psameas_object|421|0|643|0|{out_metadata|out0_metadata|0|0|}220|46|}
{2010212001|XXGvertex_oport_oport|422|0|644|0|{0|out0|}215|223|}
{2010216002|XXGoport_binding_oport|423|0|646|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}223|221|}
{2010213001|XXGoport_dst_flow|424|0|647|0|{0|}223|198|}
{2010211001|XXGvertex_iport_iport|425|0|648|0|{0|in0|}215|224|}
{2010215002|XXGiport_binding_iport|426|0|650|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}224|219|}
{2010007001|XXGobject_proto_object|427|0|651|0|{}215|225|}
{2010604001|XXGgraph_flow_flow|428|0|653|0|{Flow_1|}225|226|}
{2010601001|XXGgraph_vertex_vertex|429|0|655|0|{Partition_by_Key|}225|227|}
{2010212001|XXGvertex_oport_oport|430|0|657|0|{0|out|}227|228|}
{2010213001|XXGoport_dst_flow|431|0|659|0|{0|}228|226|}
{2010211001|XXGvertex_iport_iport|432|0|660|0|{0|in|}227|229|}
{2010007001|XXGobject_proto_object|433|0|662|0|{}227|230|}
{2010212001|XXGvertex_oport_oport|434|0|664|0|{0|out|}230|231|}
{2010006001|XXGobject_psameas_object|435|0|666|0|{metadata|out_metadata|1|0|}231|230|}
{2010211001|XXGvertex_iport_iport|436|0|667|0|{0|in|}230|232|}
{2010006001|XXGobject_psameas_object|437|0|669|0|{metadata|in_metadata|1|0|}232|230|}
{2010006001|XXGobject_psameas_object|438|0|670|0|{Layout|InputLayout|1|0|}227|225|}
{2010006001|XXGobject_psameas_object|439|0|671|0|{key|Key|1|0|}227|225|}
{2010601001|XXGgraph_vertex_vertex|440|0|672|0|{Sort|}225|233|}
{2010212001|XXGvertex_oport_oport|441|0|674|0|{0|out|}233|234|}
{2010211001|XXGvertex_iport_iport|442|0|676|0|{0|in|}233|235|}
{2010214001|XXGiport_src_flow|443|0|678|0|{0|}235|226|}
{2010007001|XXGobject_proto_object|444|0|679|0|{}233|236|}
{2010212001|XXGvertex_oport_oport|445|0|681|0|{0|out|}236|237|}
{2010006001|XXGobject_psameas_object|446|0|683|0|{metadata|out_metadata|1|0|}237|236|}
{2010211001|XXGvertex_iport_iport|447|0|684|0|{0|in|}236|238|}
{2010006001|XXGobject_psameas_object|448|0|686|0|{metadata|in_metadata|1|0|}238|236|}
{2010006001|XXGobject_psameas_object|449|0|687|0|{Layout|OutputLayout|1|0|}233|225|}
{2010006001|XXGobject_psameas_object|450|0|688|0|{key|Key|1|0|}233|225|}
{2010006001|XXGobject_psameas_object|451|0|689|0|{max_core|Max_core|1|0|}233|225|}
{2010212001|XXGvertex_oport_oport|452|0|690|0|{0|out0|}225|239|}
{2010216002|XXGoport_binding_oport|453|0|692|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}239|234|}
{2010211001|XXGvertex_iport_iport|454|0|693|0|{0|in0|}225|240|}
{2010215002|XXGiport_binding_iport|455|0|695|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}240|229|}
{2010006001|XXGobject_psameas_object|456|0|696|0|{InputLayout|Layout|0|0|}215|16|}
{2010006001|XXGobject_psameas_object|457|0|697|0|{OutputLayout|Layout|0|0|}215|42|}
{2010601001|XXGgraph_vertex_vertex|458|0|698|0|{Sort_within_Groups|}195|241|}
{2010212001|XXGvertex_oport_oport|459|0|700|0|{0|out|}241|242|}
{2010213001|XXGoport_dst_flow|460|0|702|0|{0|}242|200|}
{2010211001|XXGvertex_iport_iport|461|0|703|0|{0|in|}241|243|}
{2010214001|XXGiport_src_flow|462|0|705|0|{0|}243|198|}
{2010007001|XXGobject_proto_object|463|0|706|0|{}241|244|}
{2010212001|XXGvertex_oport_oport|464|0|708|0|{0|out|}244|245|}
{2010006001|XXGobject_psameas_object|465|0|710|0|{metadata|out_metadata|1|0|}245|244|}
{2010211001|XXGvertex_iport_iport|466|0|711|0|{0|in|}244|246|}
{2010006001|XXGobject_psameas_object|467|0|713|0|{metadata|in_metadata|1|0|}246|244|}
{2010006001|XXGobject_psameas_object|468|0|714|0|{Layout|Layout|0|0|}241|42|}
{2010006001|XXGobject_psameas_object|469|0|715|0|{in_metadata|out0_metadata|0|0|}241|46|}
{2010006001|XXGobject_psameas_object|470|0|716|0|{out_metadata|out0_metadata|0|0|}241|46|}
{2010601001|XXGgraph_vertex_vertex|471|0|717|0|{Trash|}195|247|}
{2010211001|XXGvertex_iport_iport|472|0|719|0|{0|in|}247|248|}
{2010214001|XXGiport_src_flow|473|0|721|0|{0|}248|199|}
{2010007001|XXGobject_proto_object|474|0|722|0|{}247|249|}
{2010211001|XXGvertex_iport_iport|475|0|724|0|{0|in|}249|250|}
{2010006001|XXGobject_psameas_object|476|0|726|0|{metadata|in_metadata|1|0|}250|249|}
{2010006001|XXGobject_psameas_object|477|0|727|0|{Layout|Layout|0|0|}247|42|}
{2010006001|XXGobject_psameas_object|478|0|728|0|{in_metadata|out0_metadata|0|0|}247|46|}
{2010212001|XXGvertex_oport_oport|479|0|729|0|{0|out0|}195|251|}
{2010216002|XXGoport_binding_oport|480|0|731|0|{.5|.5|{0|}14560|}251|202|}
{2010213001|XXGoport_dst_flow|481|0|732|0|{0|}251|11|}
{2010211001|XXGvertex_iport_iport|482|0|733|0|{0|in0|}195|252|}
{2010215002|XXGiport_binding_iport|483|0|735|0|{.5|.5|{0|}14559|}252|224|}
{2010214001|XXGiport_src_flow|484|0|736|0|{0|}252|9|}
{2010109001|XXGobject_property_value|485|0|737|0|{0|TrackingThumbprint|72|}1|253|}
