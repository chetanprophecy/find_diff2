@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|185|rel_count|327|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RUN_ID_FILE_NAME|$[PUB_DATAHUB_SERIAL + "/" + "datalake_rcex1p"+ "."+ AI_PHASE + ".run_id.dat" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|RUN_ID|$[(datetime("YYYYMMDDHH24MISS"))string_split(read_file(RUN_ID_FILE_NAME),'\\n')[0]]|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|RK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
{30001002|XXparameter|HIVE_HOST|AI_PHASE|3|10|RKd|@{0|}}
{30001002|XXparameter|FILE_BASE_TYPE|hdfs|3|9|RFK|@{0|}}
{30001002|XXparameter|FILE_BASE|/datalake/optum/optumrx/p_optum/prd/rxe/prd/p_outbound/|3|9|RFK|@{0|}}
{30001002|XXparameter|HIVE_FILE_NAME|RX2-RCEX1P_$[(datetime("YYYYMMDD"))(datetime("YYYYMMDDHH24MISS"))RUN_ID]|3|9|RFK|@{0|}}
{30001002|XXparameter|HIVE_FILE_DML|$AI_DML/get.datalake_orx/get.datalake.rcex1p.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|RFMT_TRANSFORM|include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  
  out.(*, form == 'string' and name != 'newline')  :1: string_and_hex_replace_iseries_to_netezza(in.*);
  out.(*, form == "string")  :2: if(is_null(in.*)) '-' ;
  out.(*, form == "decimal")  :3: if(is_null(in.*)) 0 ;
  out.srvprovnme :: if(is_null(in.srvprovnme)) '-'  else string_convert_explicit(in.srvprovnme, "iso-8859-1", " ");
  out.dxf_src_sys_id :: 490;
  out.* :: in.*;

end;|8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|CLEAN_FILE_NAME|AB_PARAMETER_ENV|3|10|RKd|Path to the clean file produced by a clean step.  Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|CLEAN_FILE_NAME:eme|$AI_MFS/clean.$SOURCE_SYSTEM/clean.$\{SOURCE_LOWER\}.\{RUN_ID\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_NAME:sandbox|$AI_MFS/clean.$SOURCE_SYSTEM/clean.$\{SOURCE_LOWER\}.$\{RUN_ID\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|HIVE_HOST:dev|apvrs18183.uhc.com|3|9||@{0|}}
{30001002|XXparameter|HIVE_HOST:qa|apsrp09164.uhc.com|3|9||@{0|}}
{30001002|XXparameter|HIVE_HOST:integration|apvrs18183.uhc.com|3|9||@{0|}}
{30001002|XXparameter|HIVE_HOST:uat|apvrs18183.uhc.com|3|9||@{0|}}
{30001002|XXparameter|HIVE_HOST:prod|apsrp09164.uhc.com|3|9||@{0|}}
{30001002|XXparameter|HIVE_HOST:stage|apvrs18183.uhc.com|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_DML|$AI_DML/clean.$SOURCE_SYSTEM/clean.$\{SOURCE_LOWER\}.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|DATALAKE_FILE_NAME|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|DATALAKE_FILE_NAME:eme|$AI_MFS/clean.$SOURCE_SYSTEM/datalake_rcex1p.\{RUN_ID\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|DATALAKE_FILE_NAME:sandbox|$AI_MFS/clean.$SOURCE_SYSTEM/datalake_rcex1p.$\{RUN_ID\}.dat.gz|3|9||@{0|}}
{30001002|XXparameter|AB_EXPECTED_RECORD_MBYTES|2048|3|9|EK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|read_hdfs_parquet|j17|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|933000|404000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'read_hdfs_parquet' Execution Status Report

Job completed successfully at Thursday, September 19, 2019 04:44:59
Run performed by user j17
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}137|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}143|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.517241358757019|{0|}145|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}73|20|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}146|17|}}
{2010503005|XXGfvertex|10|0|19|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|mfile:$\{DATALAKE_FILE_NAME\}|3|9||@{0|}}
}}@0|@579000|333500|0|0|0|0|142|Datalake_rcex1p_File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|11|0|21|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|12|0|24|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1526418915|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|13|0|26|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|14|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@445000|68000|0|0|0|0|3977|Read Blocks|||1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|15|0|31|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|16|0|33|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|17|0|35|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|18|0|37|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|19|0|39|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|20|0|41|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|21|0|43|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|22|0|45|0|{@{}@384|.5|.5|{0|}3976|20|}}
{2010501005|XXGpvertex|23|0|47|0|{Walks the directory tree starting from paths specified on the input flow.  Produces a list of files to be read as well as the files' block and address info.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@60000|50000|0|0|0|0|3972|Find Files and Read Blocks|Ab Initio Software|Built-in 2.14:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|24|0|49|0|{@{}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010210004|XXGflow|25|0|51|0|{@{}@384|.5|.5|{0|}3973|17|}}
{2010203004|XXGoport|26|0|53|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|27|0|55|0|{@{}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|28|0|57|0|{|{}@0|@52000|91500|0|0|0|0|3803|Go|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|29|0|59|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|30|0|61|0|{@{}@384|.5|.5|{8|121000|159000|121000|159000|148000|159000|155000|159000|}3806|17|}}
{2010203004|XXGoport|31|0|63|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|32|0|65|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|33|0|69|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|302000|160000|0|0|0|0|16|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|34|0|71|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|35|0|74|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|36|0|77|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1526418918|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|37|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|38|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|39|0|88|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|mfile:$\{CLEAN_FILE_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{CLEAN_FILE_NAME\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$\{CLEAN_FILE_DML\}|3|2|f$|@{0|}}
}}@0|@814000|148500|0|0|0|0|144|RCEX1P_Clean_File||@1|200|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|40|0|90|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|41|0|93|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1526418915|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|42|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|43|0|98|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Hadoop/Read_HDFS.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|INTERFACE|Legacy|3|1|l|@{0|}}
{30001002|XXparameter|FILE_FORMAT|parquet|3|9||@{0|}}
{30001002|XXparameter|SERIAL_HOST|$HIVE_HOST|3|9||@{0|}}
{30001002|XXparameter|HOST_DEPTH|1|3|9||@{0|}}
{30001002|XXparameter|HOST_LIST|$HIVE_HOST|3|9||@{0|}}
{30001002|XXparameter|HDFS_FILE_BASE|$FILE_BASE_TYPE:$FILE_BASE|3|9||@{0|}}
{30001002|XXparameter|HDFS_FILE_NAME|$HIVE_FILE_NAME|3|9||@{0|}}
{30001002|XXparameter|FILE_DML|$HIVE_FILE_DML|3|9|fj|@{0|}}
}}@0|@75000|131000|0|0|0|0|147|Read HDFS|||1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|963000|325000|0|}}
{2010210004|XXGflow|44|0|100|0|{@{}@0|.5|.5|{0|}3968|17|}}
{2010210004|XXGflow|45|0|103|0|{@{}@384|.5|.5|{0|}3964|529|}}
{2010501005|XXGpvertex|46|0|105|0|{Walks the directory tree starting from HDFS_FILE_NAME and finds the requested HIVE partitions .|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@164000|69000|0|0|0|0|3808|Find HIVE Partitions|Ab Initio Software|Built-in 2.14:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|47|0|107|0|{@{}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|48|0|110|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|112|0|{@{}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|50|0|119|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Filter by Expression|377000|70000|0|0|0|0|3966|HIVE Partitions Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|51|0|121|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|52|0|124|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|53|0|126|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|54|0|128|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|55|0|130|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|132|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|57|0|140|0|{COPYRIGHT AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{}@0|@592000|72000|0|0|0|0|3969|Read HDFS Files|Ab Initio|Created 8/26/2015 3:21:55 PM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|739000|210000|0|}}
{2010501005|XXGpvertex|58|0|145|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@242000|61000|249000|75000|132000|107000|3975|Partition Blocks|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|59|0|147|0|{@{}@380000|124000|11000|11000|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|60|0|150|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|61|0|152|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|62|0|154|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|63|0|156|0|{@{}@239000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|64|0|164|0|{@{}@0|0|0|0|out0|.6336633663366337|@@@14352|0|}}
{2010202004|XXGiport|65|0|167|0|{@{}@0|0|0|0|in0|.5044642857142857|@@@13840|0|}}
{2010203004|XXGoport|66|0|171|0|{@{}@0|0|0|0|out0|.7804232804232805|@@@14352|0|}}
{2010600005|XXGgraph|67|0|175|0|{Reads data sequentially from a Hadoop Distributed File System. Can optionally select data from a Hive partition using the query you provide. Only for batch graphs.
COPYRIGHT AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|INTERFACE|Simple|15|9|FK|Choose the user interface. Simple covers most use cases and ought to be used for most new development. Advanced enables control of internal transforms and alternate parameters for specifying the runtime  layout. Legacy exposes parameters necessary for backwards compatibility and should not be used in new development.|{3|Simple|Advanced|Legacy|}}
{30001002|XXparameter|FILE_FORMAT|uninterpreted|15|9|RFK|The Hadoop file format.|{8|uninterpreted|seqfile|parquet|orc|rcfile|avro|texttable|hadoop_compressed|}}
{30001002|XXparameter|SERIAL_HOST|localhost|3|9|RFK|The hostname to start Read HDFS.|{0|}}
{30001002|XXparameter|READ_LAYOUT||28|2|FK$|The URL for the read layout. This will be overridden if HOST_LIST is specified. Set INTERFACE to Advanced to see the value of HOST_LIST|{0|}}
{30001002|XXparameter|HOST_DEPTH||1|9|FK|(Optional) The number of ways parallel to run on each host.|{0|}}
{30001002|XXparameter|HOST_LIST||3|9|FK|Optional. A comma separated list of hosts to run on e.g. A, B, C. Setting this overrides READ_LAYOUT.|{0|}}
{30001002|XXparameter|HDFS_INPUT_PATH||3|9|FK|The path to the Hadoop dataset. In most cases, the value ought to be a directory.|{0|}}
{30001002|XXparameter|HDFS_FILE_BASE||3|9|FK|Root directory containing individual data sets. For instance for data in hdfs:/data/customers/state=NY ... The HDFS_FILE_BASE would be hdfs:/data|{0|}}
{30001002|XXparameter|HDFS_FILE_NAME||3|9|FK|Name of directory under which this data set will be written. For instance for data in hdfs:/data/customers/state=NY ... The HDFS_FILE_NAME would be customers.|{0|}}
{30001002|XXparameter|HDFS_FILE_SUFFIX||3|9|FK|Optional. The suffix for the files to be read.|{0|}}
{30001002|XXparameter|FILE_DML|@7|9|FKf|The output record DML.|{0|}}
{30001002|XXparameter|HIVE_PARTITION||3|9|FK|Do not use for new development. Instead, use Read Hive Table. Specify a partition or multiple partitions by using binary comparison expression.  For example, trans_date>2014-03-01.  To specify a range of values use ":", e.g. trans_amount>=100:trans_amount<500.  To list multiple expressions, use ";" to delimit each expression, for example trans_date=2014-5-24;trans_amount>=1000.   The order of expressions must follow the order of partitioning on the file system. |{0|}}
{30001002|XXparameter|REFORMAT_XFR||8|9|FK|Optional. Reformat XFR for data read.|{0|}}
{30001002|XXparameter|FILTER_EXPR|1|20|9|RFK|An expression for selecting where data is read from. For example, to read only from dataset where files landed on path at state=NY, use: string_index(_AB_read_hdfs_files_starting_path_ , "state=NY") != 0|{0|}}
{30001002|XXparameter|BLOCK_PARTITION_XFR|include "~ab_home/include/log-event-type.dml";

let float load_balance_ratio = 0; // 0 means no load balancing; 1 means RR with block affinity (ignore hdfs locality)
let int initialized = 0;
let string(int) tuning = "tuning";
let string(int) debug = "debug";
let int locality_node_selected = 0;
let int block_count = 0;
let string(int) last_file = "_UNKNOWN_";
let int file_block = 0;

type ply_count_type = record
  int ply;
  int count;
end;

let ply_count_type[int] count_map = allocate();
let ply_count_type[int] matching_count = allocate();
let ply_count_type matching_count_min = allocate();
let ply_count_type global_count_min = allocate();

let int index = allocate();

index_out :: partition_index(in) =
begin
  let int num_matched;
  if (initialized == 0)
  begin
    count_map = for (let int i, i < number_of_downstream_partitions()) :
      [record ply i, count 0];
    initialized = 1;
  end
  
  matching_count =
  for (let host in in._AB_read_hdfs_files_hosts) :
    for (let ply in get_partitions(host)) :
      [record ply ply, count count_map[ply].count];

  num_matched = length_of(matching_count);

  if (string_compare(last_file, in._AB_read_hdfs_files_filename) == 0)
  begin
    write_to_log(event_type = debug, event_text = printf("file %s-%d: block hosts %s",
                 in._AB_read_hdfs_files_filename, file_block, string_join(in._AB_read_hdfs_files_hosts, " ")));
    file_block = file_block + 1;
  end
  else
    last_file = in._AB_read_hdfs_files_filename;

  if (num_matched > 0)
    matching_count_min = vector_min(matching_count, \{count\});
  global_count_min = vector_min(count_map, \{count\});
  
  if ((num_matched > 0) &&
      ( ((float)global_count_min.count + 1) / 
        ((float)matching_count_min.count + 1) >= load_balance_ratio)
     )
    begin
      index = matching_count_min.ply;
      locality_node_selected = locality_node_selected + 1;
    end
  else
    index = global_count_min.ply;

  count_map[index].count = count_map[index].count + 1;
  block_count = block_count + 1;

  index_out :: index;
end;

log_event_t log :: final_log_output() = 
begin 
   log.event_type :: tuning; 
   log.event_text :: printf("local block count = %d / total = %d", locality_node_selected, block_count);
end;|8|9|FK|Tranform package that partition HDFS file block for reads.|{0|}}
{30001002|XXparameter|SELECT_COLUMNS||3|2|FK$|A comma-separated list of column number to read from RCFile. Column numbers are zero-based.|{0|}}
{30001002|XXparameter|SCHEMA_FILE||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|LOG_GROUP||3|9|FK|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|ERROR_GROUP||3|9|FK|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|INTERNAL_HDFS_INPUT_PATH|$[ begin

let string("") computed_value = "";

if( !(is_blank(HDFS_INPUT_PATH)) ) begin
        let HDFS_INPUT_PATH_stripped = if (ends_with(HDFS_INPUT_PATH, "/")) string_substring(HDFS_INPUT_PATH, 1, length_of(HDFS_INPUT_PATH) - 1) else HDFS_INPUT_PATH;
        computed_value = HDFS_INPUT_PATH_stripped;
end
else if (!is_blank(HDFS_FILE_BASE) && !is_blank(HDFS_FILE_NAME)) begin
        // remove trailing /
        let HDFS_FILE_BASE_stripped = if (ends_with(HDFS_FILE_BASE, "/")) string_substring(HDFS_FILE_BASE, 1, length_of(HDFS_FILE_BASE) - 1) else HDFS_FILE_BASE;
        computed_value = HDFS_FILE_BASE_stripped + "/" + HDFS_FILE_NAME;
end
// Backward compatibility
if (starts_with(computed_value,"/")) computed_value = "hdfs:" + computed_value;
result :: computed_value;
end;
]|3|9|RK|@{0|}}
{30001002|XXparameter|COMPUTED_EME_DATASET|@3|9|FK|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("out0", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INTERNAL_HDFS_INPUT_PATH", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|40|9|RFK|The logic dataset that represents the output in the EME. The default value is computed based on HDFS_INPUT_PATH.|{0|}}
{30001002|XXparameter|LOGGING|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|VALIDATE_PARAMETERS|True|13|9|FK|@{0|}}
{30001002|XXparameter|SCHEMA_PATH_ERROR|$(XXurl -is-hdfs -q $SCHEMA_FILE \|\| XXurl -is-definitely-serial -q $SCHEMA_FILE; print $?)|1|9|K|@{0|}}
{30001002|XXparameter|CANONICAL_INPUT_PATH|$(out=$(XXurl -is-hdfs $INTERNAL_HDFS_INPUT_PATH); echo "$?,$out")|3|9|K|@{0|}}
{30001002|XXparameter|VALIDATED_INPUT_PATH|$[begin let string(int)[2] parts= string_split(CANONICAL_INPUT_PATH, ","); result :: [record err parts[0] path parts[1]]; end]|7|9|K|@{0|}}
{30001002|XXparameter|VALIDATION|$[ begin

let string(int) msg="";
if (VALIDATE_PARAMETERS) begin
  let string(int) header = "\\n\\n======================================================================================================\\n\\n";
  // Validate the input path parameters
  // Only allow HDFS_INPUT or HDFS_FILE_BASE and HDFS_FILE_NAME
  if ( (!is_blank(HDFS_INPUT_PATH) && (!is_blank(HDFS_FILE_BASE) \|\| !is_blank(HDFS_FILE_NAME)))
    \|\| (is_blank(HDFS_INPUT_PATH) && (is_blank(HDFS_FILE_BASE) \|\| is_blank(HDFS_FILE_NAME))) )
    msg = string_concat(
    header,
    "Error: Invalid parameter combination.
     Must specify either HDFS_INPUT_PATH (", HDFS_INPUT_PATH, ")
     OR both HDFS_FILE_BASE (",  HDFS_FILE_BASE, ") and HDFS_FILE_NAME (", HDFS_FILE_NAME, ")",
     header);


  // Validate the the computed value in INTERNAL_HDFS_INPUT_PATH. Allow for URLs that start with hdfs: or contain ~hdfs or look like a directory
  else begin
    let string(int) param_name;
    let string(int) param_value;
    if( !(is_blank(HDFS_INPUT_PATH)) ) begin
      param_name = "HDFS_INPUT_PATH";
      param_value = HDFS_INPUT_PATH;
    end
    else begin
      param_name = "HDFS_FILE_BASE";
      param_value = HDFS_FILE_BASE;
    end
    if (VALIDATED_INPUT_PATH.err != "0")
      msg = msg + string_concat(header, "Error: INTERNAL_HDFS_INPUT_PATH does not appear to be a HDFS url check the value of ", param_name, " ", param_value, header);
    else if (string_index(INTERNAL_HDFS_INPUT_PATH, "mfile:") != 0)
      msg = msg + string_concat(header, "Error: ", param_name, " cannot start with mfile:. ", param_value, header);
      // allow paths that do not start with hdfs:
    else if (!starts_with(param_value, '/') && string_substring(param_value, 2, 2) != '//' && string_index(VALIDATED_INPUT_PATH.path, "~hdfs") == 0)
      msg = msg + string_concat(header, "Error: ", param_name, " does not appear to be a directory. ", param_value, header);    	
    end; // INTERNAL_HDFS_INPUT_PATH
end;
result :: msg;
end;
]|3|9|K|@{0|}}
{30001002|XXparameter|ERROR_MESSAGE|$[if (!is_blank(VALIDATION)) force_error(VALIDATION) else "";]|3|9|RK|@{0|}}
{30001002|XXparameter|HOSTS_LAYOUT|$[begin
  let string(int) []
    host_list = string_split_no_empty(HOST_LIST, ",");
    result:: string_join(for (let hc in host_list) :
      for (let i, i <  HOST_DEPTH) : string_lrtrim(hc), ' ' );
    
end]|3|9|K|@{0|}}
{30001002|XXparameter|HIVE_PARTITION_VEC|$[string_split_no_empty(string_filter_out(string_replace(HIVE_PARTITION, ":", ";"), " ") ,";")]|3|9|K|@{0|}}
{30001002|XXparameter|NUM_HIVE_PARTITION|$[length_of(HIVE_PARTITION_VEC)]|3|9|K|@{0|}}
{30001002|XXparameter|HIVE_COMPARISON_OP_VEC|$[for (let int i, i< NUM_HIVE_PARTITION) : string_filter(HIVE_PARTITION_VEC[i], "<>!=")]|3|9|K|@{0|}}
{30001002|XXparameter|HIVE_COMPARISON_OP_DML_VEC|$[for (let int i, i< NUM_HIVE_PARTITION) : if (HIVE_COMPARISON_OP_VEC[i] == "=") "==" else HIVE_COMPARISON_OP_VEC[i]]|3|9|K|@{0|}}
{30001002|XXparameter|HIVE_KEY_STRING|$[string_join(for (let int i, i< NUM_HIVE_PARTITION) : string_substring(HIVE_PARTITION_VEC[i],1, string_index(HIVE_PARTITION_VEC[i], HIVE_COMPARISON_OP_VEC[i])-1), ";")]|3|9|K|@{0|}}
{30001002|XXparameter|HIVE_VALUE_VEC|$[for (let int i, i< NUM_HIVE_PARTITION) : string_substring(HIVE_PARTITION_VEC[i], string_index(HIVE_PARTITION_VEC[i], HIVE_COMPARISON_OP_VEC[i])+string_length(HIVE_COMPARISON_OP_VEC[i]), string_length(HIVE_PARTITION_VEC[i]))]|3|9|K|@{0|}}
{30001002|XXparameter|EVAL_REC|$[if (NUM_HIVE_PARTITION != 0) add_fields("record\\n string(',') hive_key" + (string(""))(decimal(""))(NUM_HIVE_PARTITION -1)+ ";\\nend", for (let int i, i<NUM_HIVE_PARTITION-1) : make_field("hive_key"+ (string(""))(decimal(""))i, "string(',')")) else ""]|3|9|K|@{0|}}
{30001002|XXparameter|EVAL_EXPR|$[string_join(for (let int i, i < NUM_HIVE_PARTITION) : "hive_key" + (string(""))(decimal(""))i + HIVE_COMPARISON_OP_DML_VEC[i] + '"' + HIVE_VALUE_VEC[i] + '"', ' && ')]|3|9|RK|@{0|}}
{30001002|XXparameter|HIVE_PARTITION.condition|$[string_downcase(INTERFACE) == "legacy" \|\| string_downcase(INTERFACE) == "all"]|3|9|P|@{0|}}
{30001002|XXparameter|BLOCK_PARTITION_XFR.condition|$[string_downcase(INTERFACE) != "simple"]|3|9|P|@{0|}}
{30001002|XXparameter|HOST_LIST.condition|$[string_downcase(INTERFACE) != "simple"]|3|9|P|@{0|}}
{30001002|XXparameter|HOST_DEPTH.condition|$[string_downcase(INTERFACE) != "simple"]|3|9|P|@{0|}}
{30001002|XXparameter|REFORMAT_XFR.condition|$[string_downcase(INTERFACE) != "simple"]|3|9|P|@{0|}}
{30001002|XXparameter|SCHEMA_FILE.condition|$[string_downcase(FILE_FORMAT) == "avro"]|3|9|P|@{0|}}
{30001002|XXparameter|SELECT_COLUMNS.condition|$[string_downcase(FILE_FORMAT) == "rcfile"]|3|9|P|@{0|}}
{30001002|XXparameter|HDFS_FILE_BASE.condition|$[string_downcase(INTERFACE) == "legacy" \|\| string_downcase(INTERFACE) == "all"]|3|9|P|@{0|}}
{30001002|XXparameter|HDFS_FILE_NAME.condition|$[string_downcase(INTERFACE) == "legacy" \|\| string_downcase(INTERFACE) == "all"]|3|9|P|@{0|}}
{30001002|XXparameter|READ_LAYOUT.condition|1|3|9|P|@{0|}}
{30001002|XXparameter|HDFS_INPUT_PATH.condition|$[string_downcase(INTERFACE) != "legacy"]|3|9|P|@{0|}}
{30001002|XXparameter|FILTER_EXPR.condition|$[(string_downcase(INTERFACE) == "legacy" \|\| string_downcase(INTERFACE) == "all") && !is_blank(HIVE_PARTITION)]|3|9|P|@{0|}}
{30001002|XXparameter|INTERFACE.update_clauses|update_value Legacy|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1526418916|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@151500|113750|0|0|0|0|3326|Read_HDFS|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|963000|325000|2|}}
{2010210004|XXGflow|68|0|177|0|{@{}@0|.5|.5|{0|}3968|17|}}
{2010210004|XXGflow|69|0|179|0|{@{}@384|.5|.5|{8|121000|159000|121000|159000|148000|159000|155000|159000|}3806|17|}}
{2010210004|XXGflow|70|0|181|0|{@{}@384|.5|.5|{0|}3964|529|}}
{2010501005|XXGpvertex|71|0|183|0|{Walks the directory tree starting from HDFS_FILE_NAME and finds the requested HIVE partitions .|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Advanced/Procedural_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|let string("")[] HIVE_KEY_VEC = string_split_no_empty('$\{HIVE_KEY_STRING\}', ";");
let $\{EVAL_REC\} eval_rec = allocate();
let string("")[$\{NUM_HIVE_PARTITION\}] eval_vec = allocate();

ignore::traverse_directory(current_directory)=
begin
  let directory_listing_type dirlist = directory_listing(current_directory, "[!.]*");
  for (let shortpath in dirlist) 
    begin
      let fullpath = current_directory + "/" + shortpath;
      let file_information_type info = file_information(fullpath);   
      if (info.found && info.file_type == "DIR ") 
          begin
            if (starts_with(shortpath, HIVE_KEY_VEC[$\{NUM_HIVE_PARTITION\}-1] + "="))
              begin
                let string("")[int] full_path_vec = string_split_no_empty(fullpath, "/");
                let int j;
                eval_vec[0] = string_substring(shortpath, string_index(shortpath, "=")+1, length_of(shortpath));
                for (j, j < $\{NUM_HIVE_PARTITION\}-1)
                   begin 
                      for (let path_elem in full_path_vec)
                         begin
                           if (starts_with(path_elem, HIVE_KEY_VEC[j] + "=")) 
                             eval_vec[j+1] = string_substring(path_elem, string_index(path_elem, "=")+1, length_of(path_elem)); 
                         end;
                   end;     
                 eval_rec = reinterpret(string_concat(string_join(eval_vec, ","), ","));
                 if (eval(eval_rec, '$\{EVAL_EXPR\}'))                
                   write_record(0, [record _AB_read_hdfs_files_starting_path_ fullpath]);
              end;
            else
              traverse_directory(fullpath);       
          end;
    end;
  ignore :: 0;
end;


out::process()=
begin
  let int have_data = 1;
  while (have_data) 
    begin
      let string("") starting_path = first_defined(read_record(0)._AB_read_hdfs_files_starting_path_, "");
      if (starting_path == "") 
        have_data = 0; 
      else 
      begin
        let file_info = file_information(starting_path);
        if (file_info.found)
          if (file_info.file_type == "DIR ")
            traverse_directory(starting_path);
          else if (file_info.file_type == "HDFS")
            write_record(0, [record _AB_read_hdfs_files_starting_path_ starting_path]);
        else
          force_error(starting_path + " not found.");
      end;
    end;
  out :: 0;
end;|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[! is_blank(HIVE_PARTITION)]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|logging||3|8|=|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@164000|69000|0|0|0|0|3808|Find HIVE Partitions|Ab Initio Software|Built-in 2.14:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|185|0|{@{}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|73|0|188|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|190|0|{@{}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|75|0|193|0|{Runs code translated into DML from a procedural language such as COBOL.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|proctrans|3|1|Hl||{0|}}
{30001002|XXparameter|image__||3|2|H$||{0|}}
{30001002|XXparameter|in_count|1|1|1|Fl|Number of inputs|{0|}}
{30001002|XXparameter|in_count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|out_count|1|1|1|Fl|Number of outputs|{0|}}
{30001002|XXparameter|out_count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Transform|{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of process steps|{0|}}
{30001002|XXparameter|operation1|long out::process()|3|2|H$|process operation|{0|}}
{30001002|XXparameter|operation1_analysis|long process_out::process()|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|proctrans|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|transform_port|out|3|2|FHK$|port for debugger|{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Enable auto-deadlock buffering|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|in_count in out_count out|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1440616958|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Procedural Transform|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|76|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|77|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|79|0|205|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out._AB_read_hdfs_files_starting_path_ :: "$\{INTERNAL_HDFS_INPUT_PATH\}";
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 72 subkind 87 parts [vector _interp_("$SERIAL_HOST", "pdl")]]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") _AB_read_hdfs_files_starting_path_;
  string(32000) filler = allocate();
end;|3|1|l|@{0|}}
{30001002|XXparameter|error_group||3|8|=|@{0|}}
{30001002|XXparameter|log_group||3|8|=|@{0|}}
{30001002|XXparameter|logging||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@52000|91500|0|0|0|0|3803|Go|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|207|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|81|0|210|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|82|0|212|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|83|0|214|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1440616961|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|84|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|85|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|86|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|87|0|228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr||3|8|=|@{0|}}
{30001002|XXparameter|error_group||3|8|=|@{0|}}
{30001002|XXparameter|log_group||3|8|=|@{0|}}
{30001002|XXparameter|logging||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|377000|70000|0|0|0|0|3966|HIVE Partitions Filter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|230|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|89|0|233|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|90|0|235|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|237|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|92|0|239|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|241|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|94|0|244|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1440616960|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|95|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|96|0|249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|97|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|98|0|255|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|99|0|258|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|100|0|261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|101|0|268|0|{COPYRIGHT AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Hadoop/Internal/Read_HDFS_Files.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|READ_LAYOUT||3|8|=|@{0|}}
{30001002|XXparameter|FILE_FORMAT||3|8|=|@{0|}}
{30001002|XXparameter|OUTPUT_DML||3|8|=|@{0|}}
{30001002|XXparameter|REFORMAT_XFR||3|8|=|@{0|}}
{30001002|XXparameter|HDFS_FILE_SUFFIX||3|8|=|@{0|}}
{30001002|XXparameter|BLOCK_PARTITION_XFR||3|8|=|@{0|}}
{30001002|XXparameter|HOST_LIST||3|8|=|@{0|}}
{30001002|XXparameter|HOST_DEPTH||3|8|=|@{0|}}
{30001002|XXparameter|READ_COLUMNS||3|8|=|@{0|}}
{30001002|XXparameter|SCHEMA_FILE||3|8|=|@{0|}}
{30001002|XXparameter|LOGGING||3|8|=|@{0|}}
{30001002|XXparameter|ERROR_GROUP||3|8|=|@{0|}}
{30001002|XXparameter|LOG_GROUP||3|8|=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@592000|72000|0|0|0|0|3969|Read HDFS Files|Ab Initio|Created 8/26/2015 3:21:55 PM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|739000|210000|0|}}
{2010210004|XXGflow|102|0|270|0|{@{}@384|.5|.5|{0|}3973|17|}}
{2010210004|XXGflow|103|0|272|0|{@{}@384|.5|.5|{0|}3976|20|}}
{2010501005|XXGpvertex|104|0|274|0|{Walks the directory tree starting from paths specified on the input flow.  Produces a list of files to be read as well as the files' block and address info.|{}@0|@60000|50000|0|0|0|0|3972|Find Files and Read Blocks|Ab Initio Software|Built-in 2.14:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|105|0|276|0|{@{}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|106|0|279|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|107|0|281|0|{@{}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|108|0|283|0|{|{}@0|@242000|61000|249000|75000|132000|107000|3975|Partition Blocks|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|285|0|{@{}@380000|124000|11000|11000|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|110|0|288|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|111|0|290|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|112|0|292|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|113|0|294|0|{@{}@239000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|114|0|297|0|{|{}@0|@445000|68000|0|0|0|0|3977|Read Blocks|||1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|115|0|299|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|116|0|301|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|117|0|303|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|118|0|305|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|119|0|307|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|120|0|309|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|121|0|311|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|122|0|314|0|{@{}@0|0|0|0|out0|.6336633663366337|@@@14352|0|}}
{2010202004|XXGiport|123|0|317|0|{@{}@0|0|0|0|in0|.5044642857142857|@@@13840|0|}}
{2010600005|XXGgraph|124|0|321|0|{COPYRIGHT AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS
COPYRIGHT organizer/datasets/Hadoop/Read_HDFS.mp AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|READ_LAYOUT||28|2|FK$|The URL for the read layout. This is overrided if HOST_LIST is set.|{0|}}
{30001002|XXparameter|FILE_FORMAT|uninterpreted|15|9|FK|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'rcfile' (RCFile format), 'avro' (Avro format), 'texttable' (Hive text table).|{7|uninterpreted|seqfile|parquet|orc|rcfile|avro|texttable|}}
{30001002|XXparameter|OUTPUT_DML||7|1|RFKl|The output record DML.|{0|}}
{30001002|XXparameter|REFORMAT_XFR||8|9|FK|Optional reformat XFR for data read.|{0|}}
{30001002|XXparameter|HDFS_FILE_SUFFIX||3|9|FK|As an option, specify the suffix for the files to be read.|{0|}}
{30001002|XXparameter|BLOCK_PARTITION_XFR|include "~ab_home/include/log-event-type.dml";

let float load_balance_ratio = 0; // 0 means no load balancing; 1 means RR with block affinity (ignore hdfs locality)
let int initialized = 0;
let string(int) tuning = "tuning";
let string(int) debug = "debug";
let int locality_node_selected = 0;
let int block_count = 0;
let string(int) last_file = "_UNKNOWN_";
let int file_block = 0;

type ply_count_type = record
  int ply;
  int count;
end;

let ply_count_type[int] count_map = allocate();
let ply_count_type[int] matching_count = allocate();
let ply_count_type matching_count_min = allocate();
let ply_count_type global_count_min = allocate();

let int index = allocate();

index_out :: partition_index(in) =
begin
  let int num_matched;
  if (initialized == 0)
  begin
    count_map = for (let int i, i < number_of_downstream_partitions()) :
      [record ply i, count 0];
    initialized = 1;
  end
  
  matching_count =
  for (let host in in._AB_read_hdfs_files_hosts) :
    for (let ply in get_partitions(host)) :
      [record ply ply, count count_map[ply].count];

  num_matched = length_of(matching_count);

  if (string_compare(last_file, in._AB_read_hdfs_files_filename) == 0)
  begin
    write_to_log(event_type = debug, event_text = printf("file %s-%d: block hosts %s",
                 in._AB_read_hdfs_files_filename, file_block, string_join(in._AB_read_hdfs_files_hosts, " ")));
    file_block = file_block + 1;
  end
  else
    last_file = in._AB_read_hdfs_files_filename;

  if (num_matched > 0)
    matching_count_min = vector_min(matching_count, \{count\});
  global_count_min = vector_min(count_map, \{count\});
  
  if ((num_matched > 0) &&
      ( ((float)global_count_min.count + 1) / 
        ((float)matching_count_min.count + 1) >= load_balance_ratio)
     )
    begin
      index = matching_count_min.ply;
      locality_node_selected = locality_node_selected + 1;
    end
  else
    index = global_count_min.ply;

  count_map[index].count = count_map[index].count + 1;
  block_count = block_count + 1;

  index_out :: index;
end;

log_event_t log :: final_log_output() = 
begin 
   log.event_type :: tuning; 
   log.event_text :: printf("local block count = %d / total = %d", locality_node_selected, block_count);
end;|8|9|FK|Tranform package that partition HDFS file block for reads.|{0|}}
{30001002|XXparameter|HOST_LIST||3|9|FK|A comma separated list of hosts to run on e.g. localhost, another_host, one_more_host. If set, this overrides READ_LAYOUT.|{0|}}
{30001002|XXparameter|HOST_DEPTH||1|9|FK|The number of ways parallel to run on each host.|{0|}}
{30001002|XXparameter|READ_COLUMNS||3|2|FK$|A comma-separated list of column number to read from RC File. Column numbers are zero-based.|{0|}}
{30001002|XXparameter|SCHEMA_FILE||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|READ_LAYOUT_INTERNAL|$[begin
  let string(int) ret = "";
  if (is_null(HOST_LIST) or is_blank(HOST_LIST))
    begin
      ret = READ_LAYOUT;
    end
  else
    begin
      let string(int)[] host_list = string_split_no_empty(HOST_LIST, ",");
      ret = "-hosts " + string_join(for (let hc in host_list) :
        for (let i, i <  HOST_DEPTH) : string_lrtrim(hc), ' ' );
    end
  result :: ret;
end]|3|9|RK|@{0|}}
{30001002|XXparameter|HOSTS_LAYOUT|$[begin
  let string(int)[] host_list = string_split_no_empty(HOST_LIST, ",");
  result:: string_join(for (let hc in host_list) :
    for (let i, i <  HOST_DEPTH) : string_lrtrim(hc), ' ' );
end]|3|9|RK|The processed list of host names from HOST_LIST.|{0|}}
{30001002|XXparameter|READ_SPECIFICATION||7|8|K=|This is an optional record DML that is added to the read specification for each file read.|{0|}}
{30001002|XXparameter|COMPRESSED|$[(FILE_FORMAT == "compressed" \|\| FILE_FORMAT == "hadoop_compressed")]|13|9|RK|@{0|}}
{30001002|XXparameter|READ_FORMAT|$[if (FILE_FORMAT == "compressed") "uninterpreted" else FILE_FORMAT]|3|9|RK|@{0|}}
{30001002|XXparameter|REJECT_THRESHOLD|Abort on first reject|15|1|RFKl|When to abort if input records are rejected|{2|Abort on first reject|Never abort|}}
{30001002|XXparameter|LOGGING|False|13|1|RFKl|Log internal events|{0|}}
{30001002|XXparameter|ERROR_GROUP||3|9|FK|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|LOG_GROUP||3|9|FK|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|mpcmodtime|1509403618|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|7|1|1|Hnl|@{0|}}
}}@0|@360500|84500|0|0|0|0|3737|Read_HDFS_Files|||1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|739000|210000|2|}}
{2010210004|XXGflow|125|0|323|0|{@{}@384|.5|.5|{0|}3973|17|}}
{2010210004|XXGflow|126|0|325|0|{@{}@384|.5|.5|{0|}3976|20|}}
{2010501005|XXGpvertex|127|0|327|0|{Walks the directory tree starting from paths specified on the input flow.  Produces a list of files to be read as well as the files' block and address info.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Advanced/Procedural_Transform.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|ignore::output_read_spec(filepath, info, in_record)=
begin
  let big endian integer(8) start_offset;
  let big endian integer(8) end_offset;
  let big endian integer(8) block_size;
  let bc_lookup_address_type address;
  if (!$\{COMPRESSED\})
  begin
    block_size = first_defined(info.block_size, 0);
    for (let int idx, idx < length_of(info.host))
      begin 
        start_offset = math_min(idx * block_size, info.size);
        end_offset = math_min((idx+1) * block_size, info.size);
        address = [record file_offset (if (end_offset> start_offset) start_offset else 0)
                                                 compr_size 0
                                                 byte_offset (end_offset - start_offset)];
        write_record(0, [record _AB_read_hdfs_files_filename filepath
                                _AB_read_hdfs_files_address address 
                                _AB_read_hdfs_files_hosts info.host[idx]
                                _AB_read_hdfs_files_input_record in_record
                        ]);
      end;
    end;
  else
  begin
    // Compressed raw file cannot be read in parts.
    address = [record file_offset 0 compr_size 0 byte_offset 0];
    write_record(0, [record _AB_read_hdfs_files_filename filepath
                            _AB_read_hdfs_files_address address
                            _AB_read_hdfs_files_hosts info.host[0]
                            _AB_read_hdfs_files_input_record in_record
                    ]);
  end;
  ignore :: 0;
end;

ignore::traverse_directory(current_directory, in_record)=
begin
  let directory_listing_type dirlist = directory_listing(current_directory, "[!.]*");
  for (let shortpath in dirlist) 
    begin
      let fullpath = current_directory + "/" + shortpath;
      let file_information_type info = file_information(fullpath);
      if (info.found && info.file_type == "DIR ")
        traverse_directory(fullpath, in_record);
      else
      if (ends_with(shortpath, "$\{HDFS_FILE_SUFFIX\}"))
        output_read_spec(fullpath, info, in_record);
    end;
  ignore :: 0;
end;

out::process()=
begin
  let int have_data = 1;
  while (have_data) 
    begin
      let in_record = read_record(0);
      let string("") starting_path = first_defined(in_record._AB_read_hdfs_files_starting_path_, "");
      if (starting_path == "") have_data = 0; else 
      begin
        let file_information_type info = file_information(starting_path);
        if (info.found && info.file_type == "DIR ")
          traverse_directory(starting_path, in_record);
        else if (info.found && info.file_type == "HDFS")
          output_read_spec(starting_path, info, in_record);
        else
          force_error(starting_path + " not found.");    
      end;
    end;
  out :: 0;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$[begin
  let string(int) new_dml = "record\\nend;\\n";
  let string(int) read_spec_dml = READ_SPECIFICATION;
  
  new_dml = add_fields(new_dml,
    [ vector make_field("_AB_read_hdfs_files_filename", "string(\\"\\")"),
             make_field("_AB_read_hdfs_files_address", "bc_lookup_address_type"),
             make_field("_AB_read_hdfs_files_hosts", "string(\\"\\")[big endian integer(4)]")
    ]);
  
  new_dml = add_field(new_dml, "_AB_read_hdfs_files_input_record", read_spec_dml);
  new_dml = add_field(new_dml, "_AB_read_hdfs_files_filler", "string(32000)", "allocate()");
  result :: new_dml;
end]|3|9||@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@60000|50000|0|0|0|0|3972|Find Files and Read Blocks|Ab Initio Software|Built-in 2.14:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|329|0|{@{}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|129|0|332|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|130|0|334|0|{@{}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|131|0|336|0|{Runs code translated into DML from a procedural language such as COBOL.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|proctrans|3|1|Hl||{0|}}
{30001002|XXparameter|image__||3|2|H$||{0|}}
{30001002|XXparameter|in_count|1|1|1|Fl|Number of inputs|{0|}}
{30001002|XXparameter|in_count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|out_count|1|1|1|Fl|Number of outputs|{0|}}
{30001002|XXparameter|out_count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Transform|{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of process steps|{0|}}
{30001002|XXparameter|operation1|long out::process()|3|2|H$|process operation|{0|}}
{30001002|XXparameter|operation1_analysis|long process_out::process()|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|proctrans|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|transform_port|out|3|2|FHK$|port for debugger|{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Enable auto-deadlock buffering|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|in_count in out_count out|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1440517531|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Procedural Transform|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|132|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|out_count|out|0|2193|0|}}
{2010203004|XXGoport|133|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|134|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|in_count|in|0|1553|0|}}
{2010501005|XXGpvertex|135|0|347|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|function|if (write_to_log(event_type="Hostname",event_text=(decimal(""))length_of(get_partitions("bwang-l")) )) 0|3|2|$|@{0|}}
{30001002|XXparameter|use_package|True|3|1|l|@{0|}}
{30001002|XXparameter|package||3|8|=|@{0|}}
{30001002|XXparameter|reject_threshold||3|8|=|@{0|}}
{30001002|XXparameter|logging||3|8|=|@{0|}}
{30001002|XXparameter|error_group||3|8|=|@{0|}}
{30001002|XXparameter|log_group||3|8|=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@242000|61000|249000|75000|132000|107000|3975|Partition Blocks|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|136|0|349|0|{@{}@380000|124000|11000|11000|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|137|0|352|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|138|0|354|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|139|0|356|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|140|0|358|0|{@{}@239000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|141|0|361|0|{Distributes data records to its output flow partitions according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|function-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|function||20|2|RFO$|Function to partition on|{0|}}
{30001002|XXparameter|function.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_function|-use_package|3|2|RO$|Replaces function as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_function.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the flow() function defined in the package to specify the flow number.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1440517533|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|142|0|363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|143|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|144|0|369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|145|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|146|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|147|0|383|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|include "/~ab_home/include/readfiles-constants.dml";

$[begin
  let string(int) new_dml = "";
  let string(int) record_str = "type input_type ";
  if (string_index(OUTPUT_DML, "hive_file_t") > 0) begin
    record_str = record_str + "= hive_file_t";
    record_str = re_replace_first(OUTPUT_DML, "metadata\\\\stype\\\\s\\\\=\\\\shive_row_t", record_str);
  end else begin
    let dml_field_info_vec field_list = record_info(OUTPUT_DML);
    let dml_field_info partition_list = NULL;
    let string(int)[] field_names = allocate();

    // Locate partition fields.
    for (let field in field_list) begin
      field_names = vector_append(field_names, field.name);
      if (field.name == "get_partition_fields()")
          partition_list = field;
    end

    new_dml = OUTPUT_DML;

    if (not is_null(partition_list)) begin
      // Remove partition fields from DML.
      let string(int) trimmed = string_replace(string_replace(partition_list.default, "[vector", ""), "]", "");
      let string(int) filtered = string_replace(string_replace(trimmed, "\\"", ""), ",", "");
      if (not is_blank(filtered)) begin
        let partition_keys = string_split(filtered, " ");
        let matching_fields = vector_intersection(field_names, partition_keys);
        new_dml = remove_fields(OUTPUT_DML, matching_fields);
      end
    end

    // Update metadata type as input_type.
    if (is_null(re_get_match(new_dml, "metadata\\\\stype\\\\s")))
      record_str = record_str + " = " + new_dml + ";\\n";
    else
      record_str = re_replace_first(new_dml, "metadata\\\\stype\\\\s", record_str);
  end
  result :: record_str + "\\n" + REFORMAT_XFR;
end]

filename::get_filename(in)=
begin
  read_portion(in._AB_read_hdfs_files_address.file_offset,
               in._AB_read_hdfs_files_address.byte_offset,
               SEARCH_TO_PATTERN_END);
  filename::in._AB_read_hdfs_files_filename;
end;|3|9||@{0|}}
{30001002|XXparameter|error_group||3|8|=|@{0|}}
{30001002|XXparameter|log_group||3|8|=|@{0|}}
{30001002|XXparameter|reject_threshold||3|8|=|@{0|}}
{30001002|XXparameter|interpret_hadoop_data|True|3|1|l|@{0|}}
{30001002|XXparameter|format|$\{READ_FORMAT\}|3|3|c|@{0|}}
{30001002|XXparameter|select_columns||3|8|=|@{0|}}
{30001002|XXparameter|schema_file||3|8|=|@{0|}}
{30001002|XXparameter|compressed|$COMPRESSED|3|9||@{0|}}
{30001002|XXparameter|logging||3|8|=|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 67 subkind 87 parts [vector _interp_("$READ_LAYOUT_INTERNAL", "pdl")]]]|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|file_missing|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@445000|68000|0|0|0|0|3977|Read Blocks|||1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|148|0|385|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|149|0|387|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|150|0|389|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|151|0|391|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|152|0|393|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|153|0|395|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|154|0|397|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|155|0|400|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|stream_raw_data|False|13|1|FKl|If True, streams raw data from input files|{0|}}
{30001002|XXparameter|stream_raw_data.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|interpret_hadoop_data|False|13|1|Fl|If true, component will interpret data according to the selected Hadoop file format.|{0|}}
{30001002|XXparameter|interpret_hadoop_data.condition|version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'rcfile' (RCFile format), 'avro' (Avro format), 'texttable' (Hive text table).|{7|uninterpreted|seqfile|parquet|orc|rcfile|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact interpret_hadoop_data True param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RC File. Column numbers are zero-based.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|param_exact stream_raw_data False param_exact format uninterpreted version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact stream_raw_data False param_exact read-blocks False param_exact format uninterpreted version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact stream_raw_data False param_exact read_as_single_record False param_exact format uninterpreted version 2.14.25:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|9|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(void(integer(4)) rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
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
{30001002|XXparameter|operation9|optional integer(8) out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation9_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9_analysis.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1473966398|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|Read Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|156|0|402|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|157|0|405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|158|0|408|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|159|0|411|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|160|0|414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|161|0|417|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|162|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|163|0|430|0|{@{}@0|0|0|0|out0|.5117370892018779|@@@14352|0|}}
{2010202004|XXGiport|164|0|433|0|{@{}@0|0|0|0|in0|.5044642857142857|@@@13840|0|}}
{2010203004|XXGoport|165|0|450|0|{@{}@0|0|0|0|out0|.33620689655172414|@@@14352|0|}}
{2010501005|XXGpvertex|166|0|453|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|558000|140000|0|0|0|0|139|Reformat|||1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|167|0|455|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|168|0|458|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|169|0|460|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|170|0|462|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|171|0|464|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|467|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1526418918|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|173|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|174|0|473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|175|0|476|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|176|0|479|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|177|0|482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|178|0|490|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|445000|160000|0|0|0|0|75|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|179|0|492|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|180|0|496|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|181|0|499|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|182|0|501|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|183|0|504|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|184|0|510|0|{@{}@{1|7662607|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_6|}1|9|}
{2010601001|XXGgraph_vertex_vertex|9|0|18|0|{Datalake_rcex1p_File|}1|10|}
{2010211001|XXGvertex_iport_iport|10|0|20|0|{0|write|}10|11|}
{2010214001|XXGiport_src_flow|11|0|22|0|{0|}11|7|}
{2010007001|XXGobject_proto_object|12|0|23|0|{}10|12|}
{2010211001|XXGvertex_iport_iport|13|0|25|0|{0|write|}12|13|}
{2010006001|XXGobject_psameas_object|14|0|27|0|{metadata|write_metadata|1|0|}13|12|}
{2010006001|XXGobject_psameas_object|15|0|28|0|{write_metadata|out_metadata|0|0|}10|14|}
{2010212001|XXGvertex_oport_oport|16|0|30|0|{0|out|}14|15|}
{2010212001|XXGvertex_oport_oport|17|0|32|0|{1|filereject|}14|16|}
{2010212001|XXGvertex_oport_oport|18|0|34|0|{2|fileerror|}14|17|}
{2010212001|XXGvertex_oport_oport|19|0|36|0|{3|reject|}14|18|}
{2010212001|XXGvertex_oport_oport|20|0|38|0|{4|error|}14|19|}
{2010212001|XXGvertex_oport_oport|21|0|40|0|{5|log|}14|20|}
{2010211001|XXGvertex_iport_iport|22|0|42|0|{0|in|}14|21|}
{2010214001|XXGiport_src_flow|23|0|44|0|{0|}21|22|}
{2010006001|XXGobject_psameas_object|24|0|46|0|{filereject_metadata|out0_metadata|0|0|}14|23|}
{2010212001|XXGvertex_oport_oport|25|0|48|0|{0|out0|}23|24|}
{2010213001|XXGoport_dst_flow|26|0|50|0|{0|}24|25|}
{2010212001|XXGvertex_oport_oport|27|0|52|0|{1|log|}23|26|}
{2010211001|XXGvertex_iport_iport|28|0|54|0|{0|in0|}23|27|}
{2010006001|XXGobject_psameas_object|29|0|56|0|{Layout|Layout|0|0|}23|28|}
{2010212001|XXGvertex_oport_oport|30|0|58|0|{0|out|}28|29|}
{2010213001|XXGoport_dst_flow|31|0|60|0|{0|}29|30|}
{2010212001|XXGvertex_oport_oport|32|0|62|0|{1|error|}28|31|}
{2010212001|XXGvertex_oport_oport|33|0|64|0|{2|log|}28|32|}
{2010006001|XXGobject_psameas_object|34|0|66|0|{in0_metadata|out_metadata|0|0|}23|28|}
{2010006001|XXGobject_psameas_object|35|0|67|0|{in_metadata|out0_metadata|0|0|}14|23|}
{2010601001|XXGgraph_vertex_vertex|36|0|68|0|{Partition_by_Round_robin|}1|33|}
{2010212001|XXGvertex_oport_oport|37|0|70|0|{0|out|}33|34|}
{2010213001|XXGoport_dst_flow|38|0|72|0|{0|}34|8|}
{2010211001|XXGvertex_iport_iport|39|0|73|0|{0|in|}33|35|}
{2010214001|XXGiport_src_flow|40|0|75|0|{0|}35|9|}
{2010007001|XXGobject_proto_object|41|0|76|0|{}33|36|}
{2010212001|XXGvertex_oport_oport|42|0|78|0|{0|out|}36|37|}
{2010006001|XXGobject_psameas_object|43|0|80|0|{metadata|out_metadata|1|0|}37|36|}
{2010211001|XXGvertex_iport_iport|44|0|81|0|{0|in|}36|38|}
{2010006001|XXGobject_psameas_object|45|0|83|0|{metadata|in_metadata|1|0|}38|36|}
{2010006001|XXGobject_psameas_object|46|0|84|0|{Layout|Layout|0|0|}33|14|}
{2010006001|XXGobject_psameas_object|47|0|85|0|{in_metadata|out_metadata|0|0|}33|14|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{out_metadata|out_metadata|0|0|}33|14|}
{2010601001|XXGgraph_vertex_vertex|49|0|87|0|{RCEX1P_Clean_File|}1|39|}
{2010211001|XXGvertex_iport_iport|50|0|89|0|{0|write|}39|40|}
{2010214001|XXGiport_src_flow|51|0|91|0|{0|}40|6|}
{2010007001|XXGobject_proto_object|52|0|92|0|{}39|41|}
{2010211001|XXGvertex_iport_iport|53|0|94|0|{0|write|}41|42|}
{2010006001|XXGobject_psameas_object|54|0|96|0|{metadata|write_metadata|1|0|}42|41|}
{2010601001|XXGgraph_vertex_vertex|55|0|97|0|{Read_HDFS|}1|43|}
{2010604001|XXGgraph_flow_flow|56|0|99|0|{Flow_1|}43|44|}
{2010604001|XXGgraph_flow_flow|57|0|101|0|{Flow_2|}43|30|}
{2010604001|XXGgraph_flow_flow|58|0|102|0|{Flow_3|}43|45|}
{2010601001|XXGgraph_vertex_vertex|59|0|104|0|{Find_HIVE_Partitions|}43|46|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{0|out0|}46|47|}
{2010213001|XXGoport_dst_flow|61|0|108|0|{0|}47|45|}
{2010212001|XXGvertex_oport_oport|62|0|109|0|{1|log|}46|48|}
{2010211001|XXGvertex_iport_iport|63|0|111|0|{0|in0|}46|49|}
{2010214001|XXGiport_src_flow|64|0|113|0|{0|}49|30|}
{2010006001|XXGobject_psameas_object|65|0|114|0|{Layout|Layout|0|0|}46|28|}
{2010006001|XXGobject_psameas_object|66|0|115|0|{in0_metadata|out_metadata|0|0|}46|28|}
{2010006001|XXGobject_psameas_object|67|0|116|0|{out0_metadata|out_metadata|0|0|}46|28|}
{2010601001|XXGgraph_vertex_vertex|68|0|117|0|{Go|}43|28|}
{2010601001|XXGgraph_vertex_vertex|69|0|118|0|{HIVE_Partitions_Filter|}43|50|}
{2010212001|XXGvertex_oport_oport|70|0|120|0|{0|out|}50|51|}
{2010213001|XXGoport_dst_flow|71|0|122|0|{0|}51|44|}
{2010212001|XXGvertex_oport_oport|72|0|123|0|{1|deselect|}50|52|}
{2010212001|XXGvertex_oport_oport|73|0|125|0|{2|reject|}50|53|}
{2010212001|XXGvertex_oport_oport|74|0|127|0|{3|error|}50|54|}
{2010212001|XXGvertex_oport_oport|75|0|129|0|{4|log|}50|55|}
{2010211001|XXGvertex_iport_iport|76|0|131|0|{0|in|}50|56|}
{2010214001|XXGiport_src_flow|77|0|133|0|{0|}56|45|}
{2010006001|XXGobject_psameas_object|78|0|134|0|{Layout|Layout|0|0|}50|28|}
{2010006001|XXGobject_psameas_object|79|0|135|0|{deselect_metadata|out_metadata|0|0|}50|28|}
{2010006001|XXGobject_psameas_object|80|0|136|0|{in_metadata|out_metadata|0|0|}50|28|}
{2010006001|XXGobject_psameas_object|81|0|137|0|{out_metadata|out_metadata|0|0|}50|28|}
{2010006001|XXGobject_psameas_object|82|0|138|0|{reject_metadata|out_metadata|0|0|}50|28|}
{2010601001|XXGgraph_vertex_vertex|83|0|139|0|{Read_HDFS_Files|}43|57|}
{2010604001|XXGgraph_flow_flow|84|0|141|0|{Flow_1|}57|25|}
{2010604001|XXGgraph_flow_flow|85|0|142|0|{Flow_8|}57|22|}
{2010601001|XXGgraph_vertex_vertex|86|0|143|0|{Find_Files_and_Read_Blocks|}57|23|}
{2010601001|XXGgraph_vertex_vertex|87|0|144|0|{Partition_Blocks|}57|58|}
{2010212001|XXGvertex_oport_oport|88|0|146|0|{0|out|}58|59|}
{2010213001|XXGoport_dst_flow|89|0|148|0|{0|}59|22|}
{2010212001|XXGvertex_oport_oport|90|0|149|0|{1|reject|}58|60|}
{2010212001|XXGvertex_oport_oport|91|0|151|0|{2|error|}58|61|}
{2010212001|XXGvertex_oport_oport|92|0|153|0|{3|log|}58|62|}
{2010211001|XXGvertex_iport_iport|93|0|155|0|{0|in|}58|63|}
{2010214001|XXGiport_src_flow|94|0|157|0|{0|}63|25|}
{2010006001|XXGobject_psameas_object|95|0|158|0|{Layout|Layout|0|0|}58|28|}
{2010006001|XXGobject_psameas_object|96|0|159|0|{in_metadata|out0_metadata|0|0|}58|23|}
{2010006001|XXGobject_psameas_object|97|0|160|0|{out_metadata|out0_metadata|0|0|}58|23|}
{2010006001|XXGobject_psameas_object|98|0|161|0|{reject_metadata|out0_metadata|0|0|}58|23|}
{2010601001|XXGgraph_vertex_vertex|99|0|162|0|{Read_Blocks|}57|14|}
{2010212001|XXGvertex_oport_oport|100|0|163|0|{0|out0|}57|64|}
{2010216002|XXGoport_binding_oport|101|0|165|0|{.5|.5|{0|}3979|}64|15|}
{2010211001|XXGvertex_iport_iport|102|0|166|0|{0|in0|}57|65|}
{2010215002|XXGiport_binding_iport|103|0|168|0|{.5|.5|{0|}3978|}65|27|}
{2010214001|XXGiport_src_flow|104|0|169|0|{0|}65|44|}
{2010212001|XXGvertex_oport_oport|105|0|170|0|{0|out0|}43|66|}
{2010216002|XXGoport_binding_oport|106|0|172|0|{.5|.5|{0|}3970|}66|64|}
{2010213001|XXGoport_dst_flow|107|0|173|0|{0|}66|9|}
{2010007001|XXGobject_proto_object|108|0|174|0|{}43|67|}
{2010604001|XXGgraph_flow_flow|109|0|176|0|{Flow_1|}67|68|}
{2010604001|XXGgraph_flow_flow|110|0|178|0|{Flow_2|}67|69|}
{2010604001|XXGgraph_flow_flow|111|0|180|0|{Flow_3|}67|70|}
{2010601001|XXGgraph_vertex_vertex|112|0|182|0|{Find_HIVE_Partitions|}67|71|}
{2010212001|XXGvertex_oport_oport|113|0|184|0|{0|out0|}71|72|}
{2010213001|XXGoport_dst_flow|114|0|186|0|{0|}72|70|}
{2010212001|XXGvertex_oport_oport|115|0|187|0|{1|log|}71|73|}
{2010211001|XXGvertex_iport_iport|116|0|189|0|{0|in0|}71|74|}
{2010214001|XXGiport_src_flow|117|0|191|0|{0|}74|69|}
{2010007001|XXGobject_proto_object|118|0|192|0|{}71|75|}
{2010212001|XXGvertex_oport_oport|119|0|194|0|{0|out0|}75|76|}
{2010006001|XXGobject_psameas_object|120|0|196|0|{metadata|out0_metadata|1|0|}76|75|}
{2010212001|XXGvertex_oport_oport|121|0|197|0|{1|log|}75|77|}
{2010006001|XXGobject_psameas_object|122|0|199|0|{metadata|log_metadata|1|0|}77|75|}
{2010211001|XXGvertex_iport_iport|123|0|200|0|{0|in0|}75|78|}
{2010006001|XXGobject_psameas_object|124|0|202|0|{metadata|in0_metadata|1|0|}78|75|}
{2010006001|XXGobject_psameas_object|125|0|203|0|{logging|LOGGING|1|0|}71|67|}
{2010601001|XXGgraph_vertex_vertex|126|0|204|0|{Go|}67|79|}
{2010212001|XXGvertex_oport_oport|127|0|206|0|{0|out|}79|80|}
{2010213001|XXGoport_dst_flow|128|0|208|0|{0|}80|69|}
{2010212001|XXGvertex_oport_oport|129|0|209|0|{1|error|}79|81|}
{2010212001|XXGvertex_oport_oport|130|0|211|0|{2|log|}79|82|}
{2010007001|XXGobject_proto_object|131|0|213|0|{}79|83|}
{2010212001|XXGvertex_oport_oport|132|0|215|0|{0|out|}83|84|}
{2010006001|XXGobject_psameas_object|133|0|217|0|{metadata|out_metadata|1|0|}84|83|}
{2010212001|XXGvertex_oport_oport|134|0|218|0|{1|error|}83|85|}
{2010006001|XXGobject_psameas_object|135|0|220|0|{metadata|error_metadata|1|0|}85|83|}
{2010212001|XXGvertex_oport_oport|136|0|221|0|{2|log|}83|86|}
{2010006001|XXGobject_psameas_object|137|0|223|0|{metadata|log_metadata|1|0|}86|83|}
{2010006001|XXGobject_psameas_object|138|0|224|0|{error_group|ERROR_GROUP|1|0|}79|67|}
{2010006001|XXGobject_psameas_object|139|0|225|0|{log_group|LOG_GROUP|1|0|}79|67|}
{2010006001|XXGobject_psameas_object|140|0|226|0|{logging|LOGGING|1|0|}79|67|}
{2010601001|XXGgraph_vertex_vertex|141|0|227|0|{HIVE_Partitions_Filter|}67|87|}
{2010212001|XXGvertex_oport_oport|142|0|229|0|{0|out|}87|88|}
{2010213001|XXGoport_dst_flow|143|0|231|0|{0|}88|68|}
{2010212001|XXGvertex_oport_oport|144|0|232|0|{1|deselect|}87|89|}
{2010212001|XXGvertex_oport_oport|145|0|234|0|{2|reject|}87|90|}
{2010212001|XXGvertex_oport_oport|146|0|236|0|{3|error|}87|91|}
{2010212001|XXGvertex_oport_oport|147|0|238|0|{4|log|}87|92|}
{2010211001|XXGvertex_iport_iport|148|0|240|0|{0|in|}87|93|}
{2010214001|XXGiport_src_flow|149|0|242|0|{0|}93|70|}
{2010007001|XXGobject_proto_object|150|0|243|0|{}87|94|}
{2010212001|XXGvertex_oport_oport|151|0|245|0|{0|out|}94|95|}
{2010006001|XXGobject_psameas_object|152|0|247|0|{metadata|out_metadata|1|0|}95|94|}
{2010212001|XXGvertex_oport_oport|153|0|248|0|{1|deselect|}94|96|}
{2010006001|XXGobject_psameas_object|154|0|250|0|{metadata|deselect_metadata|1|0|}96|94|}
{2010212001|XXGvertex_oport_oport|155|0|251|0|{2|reject|}94|97|}
{2010006001|XXGobject_psameas_object|156|0|253|0|{metadata|reject_metadata|1|0|}97|94|}
{2010212001|XXGvertex_oport_oport|157|0|254|0|{3|error|}94|98|}
{2010006001|XXGobject_psameas_object|158|0|256|0|{metadata|error_metadata|1|0|}98|94|}
{2010212001|XXGvertex_oport_oport|159|0|257|0|{4|log|}94|99|}
{2010006001|XXGobject_psameas_object|160|0|259|0|{metadata|log_metadata|1|0|}99|94|}
{2010211001|XXGvertex_iport_iport|161|0|260|0|{0|in|}94|100|}
{2010006001|XXGobject_psameas_object|162|0|262|0|{metadata|in_metadata|1|0|}100|94|}
{2010006001|XXGobject_psameas_object|163|0|263|0|{error_group|ERROR_GROUP|1|0|}87|67|}
{2010006001|XXGobject_psameas_object|164|0|264|0|{log_group|LOG_GROUP|1|0|}87|67|}
{2010006001|XXGobject_psameas_object|165|0|265|0|{logging|LOGGING|1|0|}87|67|}
{2010006001|XXGobject_psameas_object|166|0|266|0|{select_expr|FILTER_EXPR|1|0|}87|67|}
{2010601001|XXGgraph_vertex_vertex|167|0|267|0|{Read_HDFS_Files|}67|101|}
{2010604001|XXGgraph_flow_flow|168|0|269|0|{Flow_1|}101|102|}
{2010604001|XXGgraph_flow_flow|169|0|271|0|{Flow_8|}101|103|}
{2010601001|XXGgraph_vertex_vertex|170|0|273|0|{Find_Files_and_Read_Blocks|}101|104|}
{2010212001|XXGvertex_oport_oport|171|0|275|0|{0|out0|}104|105|}
{2010213001|XXGoport_dst_flow|172|0|277|0|{0|}105|102|}
{2010212001|XXGvertex_oport_oport|173|0|278|0|{1|log|}104|106|}
{2010211001|XXGvertex_iport_iport|174|0|280|0|{0|in0|}104|107|}
{2010601001|XXGgraph_vertex_vertex|175|0|282|0|{Partition_Blocks|}101|108|}
{2010212001|XXGvertex_oport_oport|176|0|284|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|177|0|286|0|{0|}109|103|}
{2010212001|XXGvertex_oport_oport|178|0|287|0|{1|reject|}108|110|}
{2010212001|XXGvertex_oport_oport|179|0|289|0|{2|error|}108|111|}
{2010212001|XXGvertex_oport_oport|180|0|291|0|{3|log|}108|112|}
{2010211001|XXGvertex_iport_iport|181|0|293|0|{0|in|}108|113|}
{2010214001|XXGiport_src_flow|182|0|295|0|{0|}113|102|}
{2010601001|XXGgraph_vertex_vertex|183|0|296|0|{Read_Blocks|}101|114|}
{2010212001|XXGvertex_oport_oport|184|0|298|0|{0|out|}114|115|}
{2010212001|XXGvertex_oport_oport|185|0|300|0|{1|filereject|}114|116|}
{2010212001|XXGvertex_oport_oport|186|0|302|0|{2|fileerror|}114|117|}
{2010212001|XXGvertex_oport_oport|187|0|304|0|{3|reject|}114|118|}
{2010212001|XXGvertex_oport_oport|188|0|306|0|{4|error|}114|119|}
{2010212001|XXGvertex_oport_oport|189|0|308|0|{5|log|}114|120|}
{2010211001|XXGvertex_iport_iport|190|0|310|0|{0|in|}114|121|}
{2010214001|XXGiport_src_flow|191|0|312|0|{0|}121|103|}
{2010212001|XXGvertex_oport_oport|192|0|313|0|{0|out0|}101|122|}
{2010216002|XXGoport_binding_oport|193|0|315|0|{.5|.5|{0|}3965|}122|115|}
{2010211001|XXGvertex_iport_iport|194|0|316|0|{0|in0|}101|123|}
{2010215002|XXGiport_binding_iport|195|0|318|0|{.5|.5|{0|}3964|}123|107|}
{2010214001|XXGiport_src_flow|196|0|319|0|{0|}123|68|}
{2010007001|XXGobject_proto_object|197|0|320|0|{}101|124|}
{2010604001|XXGgraph_flow_flow|198|0|322|0|{Flow_1|}124|125|}
{2010604001|XXGgraph_flow_flow|199|0|324|0|{Flow_8|}124|126|}
{2010601001|XXGgraph_vertex_vertex|200|0|326|0|{Find_Files_and_Read_Blocks|}124|127|}
{2010212001|XXGvertex_oport_oport|201|0|328|0|{0|out0|}127|128|}
{2010213001|XXGoport_dst_flow|202|0|330|0|{0|}128|125|}
{2010212001|XXGvertex_oport_oport|203|0|331|0|{1|log|}127|129|}
{2010211001|XXGvertex_iport_iport|204|0|333|0|{0|in0|}127|130|}
{2010007001|XXGobject_proto_object|205|0|335|0|{}127|131|}
{2010212001|XXGvertex_oport_oport|206|0|337|0|{0|out0|}131|132|}
{2010006001|XXGobject_psameas_object|207|0|339|0|{metadata|out0_metadata|1|0|}132|131|}
{2010212001|XXGvertex_oport_oport|208|0|340|0|{1|log|}131|133|}
{2010006001|XXGobject_psameas_object|209|0|342|0|{metadata|log_metadata|1|0|}133|131|}
{2010211001|XXGvertex_iport_iport|210|0|343|0|{0|in0|}131|134|}
{2010006001|XXGobject_psameas_object|211|0|345|0|{metadata|in0_metadata|1|0|}134|131|}
{2010601001|XXGgraph_vertex_vertex|212|0|346|0|{Partition_Blocks|}124|135|}
{2010212001|XXGvertex_oport_oport|213|0|348|0|{0|out|}135|136|}
{2010213001|XXGoport_dst_flow|214|0|350|0|{0|}136|126|}
{2010212001|XXGvertex_oport_oport|215|0|351|0|{1|reject|}135|137|}
{2010212001|XXGvertex_oport_oport|216|0|353|0|{2|error|}135|138|}
{2010212001|XXGvertex_oport_oport|217|0|355|0|{3|log|}135|139|}
{2010211001|XXGvertex_iport_iport|218|0|357|0|{0|in|}135|140|}
{2010214001|XXGiport_src_flow|219|0|359|0|{0|}140|125|}
{2010007001|XXGobject_proto_object|220|0|360|0|{}135|141|}
{2010212001|XXGvertex_oport_oport|221|0|362|0|{0|out|}141|142|}
{2010006001|XXGobject_psameas_object|222|0|364|0|{metadata|out_metadata|1|0|}142|141|}
{2010212001|XXGvertex_oport_oport|223|0|365|0|{1|reject|}141|143|}
{2010006001|XXGobject_psameas_object|224|0|367|0|{metadata|reject_metadata|1|0|}143|141|}
{2010212001|XXGvertex_oport_oport|225|0|368|0|{2|error|}141|144|}
{2010006001|XXGobject_psameas_object|226|0|370|0|{metadata|error_metadata|1|0|}144|141|}
{2010212001|XXGvertex_oport_oport|227|0|371|0|{3|log|}141|145|}
{2010006001|XXGobject_psameas_object|228|0|373|0|{metadata|log_metadata|1|0|}145|141|}
{2010211001|XXGvertex_iport_iport|229|0|374|0|{0|in|}141|146|}
{2010006001|XXGobject_psameas_object|230|0|376|0|{metadata|in_metadata|1|0|}146|141|}
{2010006001|XXGobject_psameas_object|231|0|377|0|{error_group|ERROR_GROUP|1|0|}135|124|}
{2010006001|XXGobject_psameas_object|232|0|378|0|{log_group|LOG_GROUP|1|0|}135|124|}
{2010006001|XXGobject_psameas_object|233|0|379|0|{logging|LOGGING|1|0|}135|124|}
{2010006001|XXGobject_psameas_object|234|0|380|0|{package|BLOCK_PARTITION_XFR|1|0|}135|124|}
{2010006001|XXGobject_psameas_object|235|0|381|0|{reject_threshold|REJECT_THRESHOLD|1|0|}135|124|}
{2010601001|XXGgraph_vertex_vertex|236|0|382|0|{Read_Blocks|}124|147|}
{2010212001|XXGvertex_oport_oport|237|0|384|0|{0|out|}147|148|}
{2010212001|XXGvertex_oport_oport|238|0|386|0|{1|filereject|}147|149|}
{2010212001|XXGvertex_oport_oport|239|0|388|0|{2|fileerror|}147|150|}
{2010212001|XXGvertex_oport_oport|240|0|390|0|{3|reject|}147|151|}
{2010212001|XXGvertex_oport_oport|241|0|392|0|{4|error|}147|152|}
{2010212001|XXGvertex_oport_oport|242|0|394|0|{5|log|}147|153|}
{2010211001|XXGvertex_iport_iport|243|0|396|0|{0|in|}147|154|}
{2010214001|XXGiport_src_flow|244|0|398|0|{0|}154|126|}
{2010007001|XXGobject_proto_object|245|0|399|0|{}147|155|}
{2010212001|XXGvertex_oport_oport|246|0|401|0|{0|out|}155|156|}
{2010006001|XXGobject_psameas_object|247|0|403|0|{metadata|out_metadata|1|0|}156|155|}
{2010212001|XXGvertex_oport_oport|248|0|404|0|{1|filereject|}155|157|}
{2010006001|XXGobject_psameas_object|249|0|406|0|{metadata|filereject_metadata|1|0|}157|155|}
{2010212001|XXGvertex_oport_oport|250|0|407|0|{2|fileerror|}155|158|}
{2010006001|XXGobject_psameas_object|251|0|409|0|{metadata|fileerror_metadata|1|0|}158|155|}
{2010212001|XXGvertex_oport_oport|252|0|410|0|{3|reject|}155|159|}
{2010006001|XXGobject_psameas_object|253|0|412|0|{metadata|reject_metadata|1|0|}159|155|}
{2010212001|XXGvertex_oport_oport|254|0|413|0|{4|error|}155|160|}
{2010006001|XXGobject_psameas_object|255|0|415|0|{metadata|error_metadata|1|0|}160|155|}
{2010212001|XXGvertex_oport_oport|256|0|416|0|{5|log|}155|161|}
{2010006001|XXGobject_psameas_object|257|0|418|0|{metadata|log_metadata|1|0|}161|155|}
{2010211001|XXGvertex_iport_iport|258|0|419|0|{0|in|}155|162|}
{2010006001|XXGobject_psameas_object|259|0|421|0|{metadata|in_metadata|1|0|}162|155|}
{2010006001|XXGobject_psameas_object|260|0|422|0|{error_group|ERROR_GROUP|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|261|0|423|0|{log_group|LOG_GROUP|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|262|0|424|0|{logging|LOGGING|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|263|0|425|0|{out_metadata|OUTPUT_DML|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|264|0|426|0|{reject_threshold|REJECT_THRESHOLD|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|265|0|427|0|{schema_file|SCHEMA_FILE|1|0|}147|124|}
{2010006001|XXGobject_psameas_object|266|0|428|0|{select_columns|READ_COLUMNS|1|0|}147|124|}
{2010212001|XXGvertex_oport_oport|267|0|429|0|{0|out0|}124|163|}
{2010216002|XXGoport_binding_oport|268|0|431|0|{.5|.5|{0|}3965|}163|148|}
{2010211001|XXGvertex_iport_iport|269|0|432|0|{0|in0|}124|164|}
{2010215002|XXGiport_binding_iport|270|0|434|0|{.5|.5|{0|}3964|}164|130|}
{2010006001|XXGobject_psameas_object|271|0|435|0|{READ_SPECIFICATION|in0_metadata|0|0|}124|127|}
{2010006001|XXGobject_psameas_object|272|0|436|0|{BLOCK_PARTITION_XFR|BLOCK_PARTITION_XFR|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|273|0|437|0|{ERROR_GROUP|ERROR_GROUP|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|274|0|438|0|{FILE_FORMAT|FILE_FORMAT|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|275|0|439|0|{HDFS_FILE_SUFFIX|HDFS_FILE_SUFFIX|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|276|0|440|0|{HOST_DEPTH|HOST_DEPTH|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|277|0|441|0|{HOST_LIST|HOST_LIST|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|278|0|442|0|{LOGGING|LOGGING|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|279|0|443|0|{LOG_GROUP|LOG_GROUP|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|280|0|444|0|{OUTPUT_DML|FILE_DML|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|281|0|445|0|{READ_COLUMNS|SELECT_COLUMNS|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|282|0|446|0|{READ_LAYOUT|READ_LAYOUT|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|283|0|447|0|{REFORMAT_XFR|REFORMAT_XFR|1|0|}101|67|}
{2010006001|XXGobject_psameas_object|284|0|448|0|{SCHEMA_FILE|SCHEMA_FILE|1|0|}101|67|}
{2010212001|XXGvertex_oport_oport|285|0|449|0|{0|out0|}67|165|}
{2010216002|XXGoport_binding_oport|286|0|451|0|{.5|.5|{0|}3970|}165|122|}
{2010601001|XXGgraph_vertex_vertex|287|0|452|0|{Reformat|}1|166|}
{2010212001|XXGvertex_oport_oport|288|0|454|0|{0|out0|}166|167|}
{2010213001|XXGoport_dst_flow|289|0|456|0|{0|}167|6|}
{2010212001|XXGvertex_oport_oport|290|0|457|0|{1|reject0|}166|168|}
{2010212001|XXGvertex_oport_oport|291|0|459|0|{2|error0|}166|169|}
{2010212001|XXGvertex_oport_oport|292|0|461|0|{3|log|}166|170|}
{2010211001|XXGvertex_iport_iport|293|0|463|0|{0|in|}166|171|}
{2010214001|XXGiport_src_flow|294|0|465|0|{0|}171|5|}
{2010007001|XXGobject_proto_object|295|0|466|0|{}166|172|}
{2010212001|XXGvertex_oport_oport|296|0|468|0|{0|out0|}172|173|}
{2010006001|XXGobject_psameas_object|297|0|470|0|{metadata|out0_metadata|1|0|}173|172|}
{2010006001|XXGobject_psameas_object|298|0|471|0|{transform0|transform0|1|0|}173|172|}
{2010212001|XXGvertex_oport_oport|299|0|472|0|{1|reject0|}172|174|}
{2010006001|XXGobject_psameas_object|300|0|474|0|{metadata|reject0_metadata|1|0|}174|172|}
{2010212001|XXGvertex_oport_oport|301|0|475|0|{2|error0|}172|175|}
{2010006001|XXGobject_psameas_object|302|0|477|0|{metadata|error0_metadata|1|0|}175|172|}
{2010212001|XXGvertex_oport_oport|303|0|478|0|{3|log|}172|176|}
{2010006001|XXGobject_psameas_object|304|0|480|0|{metadata|log_metadata|1|0|}176|172|}
{2010211001|XXGvertex_iport_iport|305|0|481|0|{0|in|}172|177|}
{2010006001|XXGobject_psameas_object|306|0|483|0|{metadata|in_metadata|1|0|}177|172|}
{2010006001|XXGobject_psameas_object|307|0|484|0|{Layout|Layout|0|0|}166|39|}
{2010006001|XXGobject_psameas_object|308|0|485|0|{in_metadata|out_metadata|0|0|}166|14|}
{2010006001|XXGobject_psameas_object|309|0|486|0|{out0_metadata|write_metadata|0|0|}166|39|}
{2010006001|XXGobject_psameas_object|310|0|487|0|{reject0_metadata|out_metadata|0|0|}166|14|}
{2010006001|XXGobject_psameas_object|311|0|488|0|{transform0|RFMT_TRANSFORM|1|0|}166|1|}
{2010601001|XXGgraph_vertex_vertex|312|0|489|0|{Replicate|}1|178|}
{2010212001|XXGvertex_oport_oport|313|0|491|0|{0|out|}178|179|}
{2010213001|XXGoport_dst_flow|314|0|493|0|{0|}179|5|}
{2010213001|XXGoport_dst_flow|315|0|494|0|{1|}179|7|}
{2010211001|XXGvertex_iport_iport|316|0|495|0|{0|in|}178|180|}
{2010214001|XXGiport_src_flow|317|0|497|0|{0|}180|8|}
{2010007001|XXGobject_proto_object|318|0|498|0|{}178|181|}
{2010212001|XXGvertex_oport_oport|319|0|500|0|{0|out|}181|182|}
{2010006001|XXGobject_psameas_object|320|0|502|0|{metadata|out_metadata|1|0|}182|181|}
{2010211001|XXGvertex_iport_iport|321|0|503|0|{0|in|}181|183|}
{2010006001|XXGobject_psameas_object|322|0|505|0|{metadata|in_metadata|1|0|}183|181|}
{2010006001|XXGobject_psameas_object|323|0|506|0|{Layout|Layout|0|0|}178|10|}
{2010006001|XXGobject_psameas_object|324|0|507|0|{in_metadata|out_metadata|0|0|}178|14|}
{2010006001|XXGobject_psameas_object|325|0|508|0|{out_metadata|out_metadata|0|0|}178|14|}
{2010109001|XXGobject_property_value|326|0|509|0|{0|TrackingThumbprint|72|}1|184|}
