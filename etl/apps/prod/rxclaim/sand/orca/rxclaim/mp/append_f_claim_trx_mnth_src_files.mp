@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|65|rel_count|113|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INFILE_RUN_ID|20160101000000|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTFILE_RUN_ID|20170101000000|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_NAME_01|rxclaim_orx.rx32126p1|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_LOWER_01|$[string_downcase(SOURCE_NAME_01)]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM_01|$[ re_replace(SOURCE_LOWER_01, "[.].*", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_ENTITY_01|$[ re_replace(SOURCE_LOWER_01, ".*[.]", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_NAME_02|rxclaim_orx.rx64607p2|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_LOWER_02|$[string_downcase(SOURCE_NAME_02)]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM_02|$[ re_replace(SOURCE_LOWER_02, "[.].*", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_ENTITY_02|$[ re_replace(SOURCE_LOWER_02, ".*[.]", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_NAME_03|rxclaim_orx.rx64607p1|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_LOWER_03|$[string_downcase(SOURCE_NAME_03)]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM_03|$[ re_replace(SOURCE_LOWER_03, "[.].*", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_ENTITY_03|$[ re_replace(SOURCE_LOWER_03, ".*[.]", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_NAME|rxclaim_orx.rx32126p1_enrich|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_LOWER|$[string_downcase(TARGET_NAME)]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_LOWER, "[.].*", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_LOWER, ".*[.]", "") ]|3|9|K|@{0|}}
{30001002|XXparameter|FILE_TYPE|clean|15|9|RFK|@{3|clean|source|lookup|}}
{30001002|XXparameter|FILE_EXTENSION|$[
begin

result :: switch(string_downcase(FILE_TYPE))
                case "clean","source" : "dat.gz";
                case "lookup" : "dat";
                default : force_error("FILE_TYPE : " + FILE_TYPE + " is not valid. Valid values are clean/source/lookup");
end;

end
]|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH_01|$AI_MFS/$FILE_TYPE.$SOURCE_SYSTEM_01/$FILE_TYPE.$SOURCE_SYSTEM_01.$SOURCE_ENTITY_01.$INFILE_RUN_ID.$FILE_EXTENSION|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH_02|$AI_MFS/$FILE_TYPE.$SOURCE_SYSTEM_02/$FILE_TYPE.$SOURCE_SYSTEM_02.$SOURCE_ENTITY_02.$INFILE_RUN_ID.$FILE_EXTENSION|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH_03|$AI_MFS/$FILE_TYPE.$SOURCE_SYSTEM_03/$FILE_TYPE.$SOURCE_SYSTEM_03.$SOURCE_ENTITY_03.$INFILE_RUN_ID.$FILE_EXTENSION|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_FILE_PATH|$AI_MFS/$FILE_TYPE.$TARGET_SYSTEM/$FILE_TYPE.$TARGET_SYSTEM.$TARGET_ENTITY.$OUTFILE_RUN_ID.$FILE_EXTENSION|3|9|RFK|@{0|}}
{30001002|XXparameter|INFILE_DML_01|$AI_DML/$FILE_TYPE.$SOURCE_SYSTEM_01/$FILE_TYPE.$SOURCE_SYSTEM_01.$SOURCE_ENTITY_01.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|INFILE_DML_02|$AI_DML/$FILE_TYPE.$SOURCE_SYSTEM_02/$FILE_TYPE.$SOURCE_SYSTEM_02.$SOURCE_ENTITY_02.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|INFILE_DML_03|$AI_DML/$FILE_TYPE.$SOURCE_SYSTEM_03/$FILE_TYPE.$SOURCE_SYSTEM_03.$SOURCE_ENTITY_03.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTFILE_DML|$AI_DML/$FILE_TYPE.$TARGET_SYSTEM/$FILE_TYPE.$TARGET_SYSTEM.$TARGET_ENTITY.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|MAPPING_XFR_01|out :: reformat(in) =
begin
   out.* :: in.*;
end|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|MAPPING_XFR_02|out :: reformat(in) =
begin
   out.dxf_src_dataset_id :: in.dxf_src_dataset_id;
   out.dxf_src_rec_cnt  :: in.dxf_src_rec_cnt;
   out.dxf_src_sys_id  :: in.dxf_src_sys_id;
   out.dxf_src_file_name  :: in.dxf_src_file_name;
   out.p1claimnbr :: in.gross_rxclaimnbr;
   out.p1claimseq :: in.gross_clmseqnbr;
   out.p1status :: in.gross_claimsts;
   out.p1sbmdate :: in.gross_datesbm;
   out.p1clientd3 :: in.gross_clientdef3;
  out.p1reimburs :: in.gross_reimbursmt;
  out.p1clmorgn :: in.gross_clmorigin;
  out.p1ambkqu :: in.gross_ambkqu;
   out.rank :: '2';

end;|3|9|RFK|@{0|}}
{30001002|XXparameter|MAPPING_XFR_03|out :: reformat(in) =
begin
   out.dxf_src_dataset_id :: in.dxf_src_dataset_id;
   out.dxf_src_rec_cnt  :: in.dxf_src_rec_cnt;
   out.dxf_src_sys_id  :: in.dxf_src_sys_id;
   out.dxf_src_file_name  :: in.dxf_src_file_name;
   out.p1claimnbr :: in.net_rxclaimnbr;
   out.p1claimseq :: in.net_clmseqnbr;
   out.p1status :: in.net_claimsts;
   out.p1sbmdate :: in.net_datesbm;
   out.p1clientd3 :: in.net_clientdef3;
   out.p1reimburs :: in.net_reimbursmt;
  out.p1clmorgn :: in.net_clmorigin;
  out.p1ambkqu :: in.net_ambkqu;
  out.rank :: '3';
 
end;|3|9|RFK|@{0|}}
{30001002|XXparameter|REQ_INPUT_FILE_02|1|3|9|RFK|@{0|}}
{30001002|XXparameter|REQ_INPUT_FILE_03|1|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|append_f_claim_trx_mnth_src_files|schakal1|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|933000|389000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'append_f_claim_trx_mnth_src_files' Execution Status Report

Job completed successfully at Thursday, June 14, 2018 04:20:56
Run performed by user schakal1
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|8388608|110|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@This graph gather all three files which are  having different layout and keep it into one file
 by after applying Business logic on each source file.|211000|50000|0|0|0|0|63|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8388608|110|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}61|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}59|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}46|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}51|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}52|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}53|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}55|2065|}}
{2010501005|XXGpvertex|14|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|627000|236000|0|0|0|0|54|Gather:Gather  All Files|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|15|0|29|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|16|0|32|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|17|0|37|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|18|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|19|0|42|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|20|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_PATH", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$OUTFILE_DML|3|2|f$|@{0|}}
}}@0|@750000|222000|0|0|0|0|56|Merged Output File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|21|0|47|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|22|0|50|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|23|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|24|0|57|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE_PATH_01", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FILE_PATH_01|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INFILE_DML_01|3|2|f$|@{0|}}
}}@0|@96000|109000|0|0|0|0|62|Input File 01|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|25|0|59|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|26|0|62|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|27|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|28|0|67|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE_PATH_02", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FILE_PATH_02|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INFILE_DML_02|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$REQ_INPUT_FILE_02|3|2|$|@{0|}}
}}@0|@91000|219000|0|0|0|0|60|Input File 02|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|29|0|69|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|30|0|72|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|31|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|32|0|77|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE_PATH_03", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FILE_PATH_03|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INFILE_DML_03|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$REQ_INPUT_FILE_03|3|2|$|@{0|}}
}}@0|@91000|319000|0|0|0|0|41|Input File 03|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|33|0|79|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|34|0|82|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|35|0|84|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|36|0|88|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.
This component allows only 1 transform per in port, but it will not block if downstream components read at different rates.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Multi_Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$\{MAPPING_XFR_01\}|3|3|c|@{0|}}
{30001002|XXparameter|transform1|$\{MAPPING_XFR_02\}|3|3|c|@{0|}}
{30001002|XXparameter|transform2|$\{MAPPING_XFR_03\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Multi Reformat|378000|186000|0|0|0|0|50|Multi Reformat: Apply XForms|Ab Initio Software|Built-in 2.12:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|37|0|90|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|38|0|93|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|39|0|96|0|{@{}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|40|0|99|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|101|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|42|0|103|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|43|0|105|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|44|0|107|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|45|0|109|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|46|0|111|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|113|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|48|0|116|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010202004|XXGiport|49|0|119|0|{@{}@0|0|0|0|in2|0.0|count|in|2|1936|0|}}
{2010501005|XXGpvertex|50|0|122|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.
This component allows only 1 transform per in port, but it will not block if downstream components read at different rates.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|multi-reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in[n])|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in*|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*;out*=in*|3|2|H$||{0|}}
{30001002|XXparameter|main_mp_port|out|3|2|$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
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
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|Multi Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|51|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|52|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|53|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|54|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|55|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|56|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|57|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|58|0|148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|59|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|60|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|61|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|62|0|160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010202004|XXGiport|63|0|163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in2|0.0|count|in|2|1936|0|}}
{2010110002|XXGconstant|64|0|176|0|{@{}@{1|5698611|}}}
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
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_5|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_6|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_7|}1|13|}
{2010601001|XXGgraph_vertex_vertex|13|0|26|0|{Gather_Gather_All_Files|}1|14|}
{2010212001|XXGvertex_oport_oport|14|0|28|0|{0|out|}14|15|}
{2010213001|XXGoport_dst_flow|15|0|30|0|{0|}15|13|}
{2010211001|XXGvertex_iport_iport|16|0|31|0|{0|in|}14|16|}
{2010214001|XXGiport_src_flow|17|0|33|0|{0|}16|10|}
{2010214001|XXGiport_src_flow|18|0|34|0|{1|}16|11|}
{2010214001|XXGiport_src_flow|19|0|35|0|{2|}16|12|}
{2010007001|XXGobject_proto_object|20|0|36|0|{}14|17|}
{2010212001|XXGvertex_oport_oport|21|0|38|0|{0|out|}17|18|}
{2010006001|XXGobject_psameas_object|22|0|40|0|{metadata|out_metadata|1|0|}18|17|}
{2010211001|XXGvertex_iport_iport|23|0|41|0|{0|in|}17|19|}
{2010006001|XXGobject_psameas_object|24|0|43|0|{metadata|in_metadata|1|0|}19|17|}
{2010006001|XXGobject_psameas_object|25|0|44|0|{Layout|Layout|0|0|}14|20|}
{2010211001|XXGvertex_iport_iport|26|0|46|0|{0|write|}20|21|}
{2010214001|XXGiport_src_flow|27|0|48|0|{0|}21|13|}
{2010007001|XXGobject_proto_object|28|0|49|0|{}20|22|}
{2010211001|XXGvertex_iport_iport|29|0|51|0|{0|write|}22|23|}
{2010006001|XXGobject_psameas_object|30|0|53|0|{metadata|write_metadata|1|0|}23|22|}
{2010006001|XXGobject_psameas_object|31|0|54|0|{in_metadata|write_metadata|0|0|}14|20|}
{2010006001|XXGobject_psameas_object|32|0|55|0|{out_metadata|write_metadata|0|0|}14|20|}
{2010601001|XXGgraph_vertex_vertex|33|0|56|0|{Input_File_01|}1|24|}
{2010212001|XXGvertex_oport_oport|34|0|58|0|{0|read|}24|25|}
{2010213001|XXGoport_dst_flow|35|0|60|0|{0|}25|7|}
{2010007001|XXGobject_proto_object|36|0|61|0|{}24|26|}
{2010212001|XXGvertex_oport_oport|37|0|63|0|{0|read|}26|27|}
{2010006001|XXGobject_psameas_object|38|0|65|0|{metadata|read_metadata|1|0|}27|26|}
{2010601001|XXGgraph_vertex_vertex|39|0|66|0|{Input_File_02|}1|28|}
{2010212001|XXGvertex_oport_oport|40|0|68|0|{0|read|}28|29|}
{2010213001|XXGoport_dst_flow|41|0|70|0|{0|}29|8|}
{2010007001|XXGobject_proto_object|42|0|71|0|{}28|30|}
{2010212001|XXGvertex_oport_oport|43|0|73|0|{0|read|}30|31|}
{2010006001|XXGobject_psameas_object|44|0|75|0|{metadata|read_metadata|1|0|}31|30|}
{2010601001|XXGgraph_vertex_vertex|45|0|76|0|{Input_File_03|}1|32|}
{2010212001|XXGvertex_oport_oport|46|0|78|0|{0|read|}32|33|}
{2010213001|XXGoport_dst_flow|47|0|80|0|{0|}33|9|}
{2010007001|XXGobject_proto_object|48|0|81|0|{}32|34|}
{2010212001|XXGvertex_oport_oport|49|0|83|0|{0|read|}34|35|}
{2010006001|XXGobject_psameas_object|50|0|85|0|{metadata|read_metadata|1|0|}35|34|}
{2010601001|XXGgraph_vertex_vertex|51|0|86|0|{Merged_Output_File|}1|20|}
{2010601001|XXGgraph_vertex_vertex|52|0|87|0|{Multi_Reformat_Apply_XForms|}1|36|}
{2010212001|XXGvertex_oport_oport|53|0|89|0|{0|out0|}36|37|}
{2010213001|XXGoport_dst_flow|54|0|91|0|{0|}37|10|}
{2010212001|XXGvertex_oport_oport|55|0|92|0|{1|out1|}36|38|}
{2010213001|XXGoport_dst_flow|56|0|94|0|{0|}38|11|}
{2010212001|XXGvertex_oport_oport|57|0|95|0|{2|out2|}36|39|}
{2010213001|XXGoport_dst_flow|58|0|97|0|{0|}39|12|}
{2010212001|XXGvertex_oport_oport|59|0|98|0|{3|reject0|}36|40|}
{2010212001|XXGvertex_oport_oport|60|0|100|0|{4|reject1|}36|41|}
{2010212001|XXGvertex_oport_oport|61|0|102|0|{5|reject2|}36|42|}
{2010212001|XXGvertex_oport_oport|62|0|104|0|{6|error0|}36|43|}
{2010212001|XXGvertex_oport_oport|63|0|106|0|{7|error1|}36|44|}
{2010212001|XXGvertex_oport_oport|64|0|108|0|{8|error2|}36|45|}
{2010212001|XXGvertex_oport_oport|65|0|110|0|{9|log|}36|46|}
{2010211001|XXGvertex_iport_iport|66|0|112|0|{0|in0|}36|47|}
{2010214001|XXGiport_src_flow|67|0|114|0|{0|}47|7|}
{2010211001|XXGvertex_iport_iport|68|0|115|0|{1|in1|}36|48|}
{2010214001|XXGiport_src_flow|69|0|117|0|{0|}48|8|}
{2010211001|XXGvertex_iport_iport|70|0|118|0|{2|in2|}36|49|}
{2010214001|XXGiport_src_flow|71|0|120|0|{0|}49|9|}
{2010007001|XXGobject_proto_object|72|0|121|0|{}36|50|}
{2010212001|XXGvertex_oport_oport|73|0|123|0|{0|out0|}50|51|}
{2010006001|XXGobject_psameas_object|74|0|125|0|{metadata|out0_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|75|0|126|0|{transform0|transform0|1|0|}51|50|}
{2010212001|XXGvertex_oport_oport|76|0|127|0|{1|out1|}50|52|}
{2010006001|XXGobject_psameas_object|77|0|129|0|{metadata|out1_metadata|1|0|}52|50|}
{2010006001|XXGobject_psameas_object|78|0|130|0|{transform1|transform1|1|0|}52|50|}
{2010212001|XXGvertex_oport_oport|79|0|131|0|{2|out2|}50|53|}
{2010006001|XXGobject_psameas_object|80|0|133|0|{metadata|out2_metadata|1|0|}53|50|}
{2010006001|XXGobject_psameas_object|81|0|134|0|{transform2|transform2|1|0|}53|50|}
{2010212001|XXGvertex_oport_oport|82|0|135|0|{3|reject0|}50|54|}
{2010006001|XXGobject_psameas_object|83|0|137|0|{metadata|reject0_metadata|1|0|}54|50|}
{2010212001|XXGvertex_oport_oport|84|0|138|0|{4|reject1|}50|55|}
{2010006001|XXGobject_psameas_object|85|0|140|0|{metadata|reject1_metadata|1|0|}55|50|}
{2010212001|XXGvertex_oport_oport|86|0|141|0|{5|reject2|}50|56|}
{2010006001|XXGobject_psameas_object|87|0|143|0|{metadata|reject2_metadata|1|0|}56|50|}
{2010212001|XXGvertex_oport_oport|88|0|144|0|{6|error0|}50|57|}
{2010006001|XXGobject_psameas_object|89|0|146|0|{metadata|error0_metadata|1|0|}57|50|}
{2010212001|XXGvertex_oport_oport|90|0|147|0|{7|error1|}50|58|}
{2010006001|XXGobject_psameas_object|91|0|149|0|{metadata|error1_metadata|1|0|}58|50|}
{2010212001|XXGvertex_oport_oport|92|0|150|0|{8|error2|}50|59|}
{2010006001|XXGobject_psameas_object|93|0|152|0|{metadata|error2_metadata|1|0|}59|50|}
{2010212001|XXGvertex_oport_oport|94|0|153|0|{9|log|}50|60|}
{2010006001|XXGobject_psameas_object|95|0|155|0|{metadata|log_metadata|1|0|}60|50|}
{2010211001|XXGvertex_iport_iport|96|0|156|0|{0|in0|}50|61|}
{2010006001|XXGobject_psameas_object|97|0|158|0|{metadata|in0_metadata|1|0|}61|50|}
{2010211001|XXGvertex_iport_iport|98|0|159|0|{1|in1|}50|62|}
{2010006001|XXGobject_psameas_object|99|0|161|0|{metadata|in1_metadata|1|0|}62|50|}
{2010211001|XXGvertex_iport_iport|100|0|162|0|{2|in2|}50|63|}
{2010006001|XXGobject_psameas_object|101|0|164|0|{metadata|in2_metadata|1|0|}63|50|}
{2010006001|XXGobject_psameas_object|102|0|165|0|{Layout|Layout|0|0|}36|20|}
{2010006001|XXGobject_psameas_object|103|0|166|0|{in0_metadata|read_metadata|0|0|}36|24|}
{2010006001|XXGobject_psameas_object|104|0|167|0|{in1_metadata|read_metadata|0|0|}36|28|}
{2010006001|XXGobject_psameas_object|105|0|168|0|{in2_metadata|read_metadata|0|0|}36|32|}
{2010006001|XXGobject_psameas_object|106|0|169|0|{out0_metadata|write_metadata|0|0|}36|20|}
{2010006001|XXGobject_psameas_object|107|0|170|0|{out1_metadata|write_metadata|0|0|}36|20|}
{2010006001|XXGobject_psameas_object|108|0|171|0|{out2_metadata|write_metadata|0|0|}36|20|}
{2010006001|XXGobject_psameas_object|109|0|172|0|{reject0_metadata|read_metadata|0|0|}36|24|}
{2010006001|XXGobject_psameas_object|110|0|173|0|{reject1_metadata|read_metadata|0|0|}36|28|}
{2010006001|XXGobject_psameas_object|111|0|174|0|{reject2_metadata|read_metadata|0|0|}36|32|}
{2010109001|XXGobject_property_value|112|0|175|0|{0|TrackingThumbprint|72|}1|64|}
