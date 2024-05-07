@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|9|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|50|rel_count|81|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|IN_FL|common.d_member.d_member.insert.20210710013102.dat.gz|3|9|RFK||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|event_fiesl_log_realign|ndeotars|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1003000|373000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'event_fiesl_log_realign' Execution Status Report

Job completed successfully at Saturday, July 10, 2021 16:56:39
Run performed by user ndeotars
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA - ndeotarse||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}65|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}72|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}74|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}76|2065|}}
{2010503005|XXGfvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/serial/aicoe/pub_datahub/main/tax_sched/event_log/event_log.ids_common.d_member.dat1", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|record
  decimal("\\x01", maximum_length=3) channel_id;
  string("\\x01", maximum_length=100) ids_table_name; // subject_area.table
  datetime("YYYYMMDD HH24:MI:SS.NNNNNN")("\\x01") created;
  date("YYYYMMDD")("\\x01") data_date = "19000101";
  string("\\x01") insert_file;
  string("\\x01") update_file = NULL("");
  string("\\x01") delete_file = NULL("");
  decimal("\\x01", maximum_length=5) dxf_src_sys_id = 0;
  datetime("YYYYMMDDHH24MISS")("\\x01") ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20) ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20) ids_create_run_id = 0;
  datetime("YYYYMMDDHH24MISS")("\\x01") ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20) ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20) ids_updt_run_id = 0;
  string("\\x01",maximum_length=2) ids_rec_stat_cd = NULL("");
  string("1") newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout|/etl/data/qa/serial/aicoe/pub_datahub/main/tax_sched/event_log/event_log.ids_common.d_member.dat1|3|2|$|@{0|}}
}}@0|Input File|80000|80000|0|0|0|0|73|Input File|Ab Initio Software|@1|100|-1||6||321|-1|-1|}}
{2010203004|XXGoport|10|0|19|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|11|0|22|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|13|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/serial/aicoe/pub_datahub/main/tax_sched/event_log/event_log.ids_common.d_member_new.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
  decimal("\\x01", maximum_length=3) channel_id;
  string("\\x01", maximum_length=100) ids_table_name; // subject_area.table
  datetime("YYYYMMDD HH24:MI:SS.NNNNNN")("\\x01") created;
  date("YYYYMMDD")("\\x01") data_date = "19000101";
  string("\\x01") insert_file;
  string("\\x01") update_file = NULL("");
  string("\\x01") delete_file = NULL("");
  decimal("\\x01", maximum_length=5) dxf_src_sys_id = 0;
  datetime("YYYYMMDDHH24MISS")("\\x01") ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20) ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20) ids_create_run_id = 0;
  datetime("YYYYMMDDHH24MISS")("\\x01") ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20) ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20) ids_updt_run_id = 0;
  string("\\x01",maximum_length=2) ids_rec_stat_cd = NULL("");
  string("1") newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|Layout|/etl/data/qa/serial/aicoe/pub_datahub/main/tax_sched/event_log/event_log.ids_common.d_member_new.dat|3|2|$|@{0|}}
}}@0|Input File|560000|175000|0|0|0|0|63|Input File-1|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|14|0|29|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|15|0|32|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|16|0|34|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|17|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_(" $PUB_DATAHUB_MFS/event/ids_common/$IN_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS/event/ids_common/$IN_FL|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated by IDS Table DML Onboarding Process for table: D_CAG
 * On: THU JUN 18 2020 06:04:19
 */

record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   dar_lob_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   acctg_lob_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   client_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   carrier_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   carrier_acct_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   client_id = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   carrier_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)   account_id = NULL("") /*VARCHAR(40) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   employer_group_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   client_nm = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   carrier_nm = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   account_nm = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   employer_group_nm = NULL("") /*VARCHAR(50) NOT NULL*/;
  decimal("\\x01",0)   pvcy_excl_ind = NULL("") /*BYTEINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   pa_site_nm = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   carrier_category_id = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   carrier_category_desc = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   carrier_state_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   acct_client_type_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100)   acct_client_type_desc = NULL("") /*VARCHAR(100) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   acct_product_type_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100)   acct_product_type_desc = NULL("") /*VARCHAR(100) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   acct_product_line_id = NULL("") /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100)   acct_product_line_desc = NULL("") /*VARCHAR(100) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   contract_num = NULL("") /*VARCHAR(5) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   pbp_id = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   gps_plan_cd = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   oracle_client_cd = NULL("") /*VARCHAR(50) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   claim_suffix_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)   custom_no = NULL("") /*VARCHAR(12) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   funding_arrangment_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   plan_variation_cd = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=7)   policy_no = NULL("") /*VARCHAR(7) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   reporting_cd = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   product_cd = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   segment_ind = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   hmo_acct_dvsn_cd = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   claim_account_cd = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   sold_market_site_cd = NULL("") /*VARCHAR(5) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   situs_state_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   platform_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   client_carrier_id = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   shared_arrangement_ind = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   sales_office_cd = NULL("") /*VARCHAR(3) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   accumulator_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   erisa_id = NULL("") /*CHAR(1) NOT NULL*/;
  date("YYYYMMDD")("\\x01")   renewal_dt = NULL("") /*DATE NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   iplan_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   legal_entity_cd = NULL("") /*VARCHAR(5) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=7)   franchise_no = NULL("") /*VARCHAR(7) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   lead_partner_cd = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   coc_cd = NULL("") /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0)   migration_ind = NULL("") /*BYTEINT NOT NULL*/;
  date("YYYYMMDD")("\\x01")   migration_effective_dt = NULL("") /*DATE NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   product_classifier_id = NULL("") /*VARCHAR(5) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   pharmacy_rider_cd = NULL("") /*VARCHAR(4) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   cob_ind = NULL("") /*VARCHAR(20) NOT NULL*/;
  date("YYYYMMDD")("\\x01")   cob_effective_dt = NULL("") /*DATE NOT NULL*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")   transaction_ts = NULL("") /*TIMESTAMP(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   obligor_cd = NULL("") /*VARCHAR(2) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   speciality_ind = NULL("") /*CHAR(1) NOT NULL*/;
  date("YYYYMMDD")("\\x01")   spclty_eff_dt = NULL("") /*DATE NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pick_lob_cd = NULL("") /*VARCHAR(10) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)   gl_product_cd = NULL("") /*VARCHAR(6) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=7)   gl_customer_cd = NULL("") /*VARCHAR(7) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)   product_id = NULL("") /*VARCHAR(8) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hm_dlvry_only_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hm_dlvry_stat_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebates_only_ind = NULL("") /*CHAR(1) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebates_stat_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   bseg_srv_typ = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   bseg_bus_typ = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   bseg_clt_typ = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   busns_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25) group_addr1 = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15) group_addr2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) group_city_nm = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) group_state_cd_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) group_st_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) group_zip_cd = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3) group_cntry = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cag_actv_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
  string(1)  newline = NULL("");
end

;|3|1|l|@{0|}}
}}@0|Input File|371000|290500|0|0|0|0|75|Input File-2|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|18|0|39|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|19|0|42|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|20|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|21|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_(" $PUB_DATAHUB_MFS/event/ids_common/$IN_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_cag.dml|3|2|f$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS/event/ids_common/New_$IN_FL|3|2|$|@{0|}}
}}@0|Input File|911000|280500|0|0|0|0|77|Input File-3|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|22|0|49|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|23|0|52|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|24|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|25|0|57|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|240000|70000|0|0|0|0|66|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|26|0|59|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|27|0|62|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|28|0|64|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|29|0|66|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|68|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|31|0|71|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|32|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|33|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|34|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|35|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|93|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|610000|260000|0|0|0|0|69|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|95|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|98|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|40|0|100|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|102|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|104|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|107|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|44|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|45|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|46|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|49|0|129|0|{@{}@{1|2178032|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{Input_File|}1|9|}
{2010212001|XXGvertex_oport_oport|9|0|18|0|{0|read|}9|10|}
{2010213001|XXGoport_dst_flow|10|0|20|0|{0|}10|6|}
{2010007001|XXGobject_proto_object|11|0|21|0|{}9|11|}
{2010212001|XXGvertex_oport_oport|12|0|23|0|{0|read|}11|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|read_metadata|1|0|}12|11|}
{2010601001|XXGgraph_vertex_vertex|14|0|26|0|{Input_File_1|}1|13|}
{2010211001|XXGvertex_iport_iport|15|0|28|0|{0|write|}13|14|}
{2010214001|XXGiport_src_flow|16|0|30|0|{0|}14|5|}
{2010007001|XXGobject_proto_object|17|0|31|0|{}13|15|}
{2010211001|XXGvertex_iport_iport|18|0|33|0|{0|write|}15|16|}
{2010006001|XXGobject_psameas_object|19|0|35|0|{metadata|write_metadata|1|0|}16|15|}
{2010601001|XXGgraph_vertex_vertex|20|0|36|0|{Input_File_2|}1|17|}
{2010212001|XXGvertex_oport_oport|21|0|38|0|{0|read|}17|18|}
{2010213001|XXGoport_dst_flow|22|0|40|0|{0|}18|7|}
{2010007001|XXGobject_proto_object|23|0|41|0|{}17|19|}
{2010212001|XXGvertex_oport_oport|24|0|43|0|{0|read|}19|20|}
{2010006001|XXGobject_psameas_object|25|0|45|0|{metadata|read_metadata|1|0|}20|19|}
{2010601001|XXGgraph_vertex_vertex|26|0|46|0|{Input_File_3|}1|21|}
{2010211001|XXGvertex_iport_iport|27|0|48|0|{0|write|}21|22|}
{2010214001|XXGiport_src_flow|28|0|50|0|{0|}22|8|}
{2010007001|XXGobject_proto_object|29|0|51|0|{}21|23|}
{2010211001|XXGvertex_iport_iport|30|0|53|0|{0|write|}23|24|}
{2010006001|XXGobject_psameas_object|31|0|55|0|{metadata|write_metadata|1|0|}24|23|}
{2010601001|XXGgraph_vertex_vertex|32|0|56|0|{Reformat|}1|25|}
{2010212001|XXGvertex_oport_oport|33|0|58|0|{0|out0|}25|26|}
{2010213001|XXGoport_dst_flow|34|0|60|0|{0|}26|5|}
{2010212001|XXGvertex_oport_oport|35|0|61|0|{1|reject0|}25|27|}
{2010212001|XXGvertex_oport_oport|36|0|63|0|{2|error0|}25|28|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{3|log|}25|29|}
{2010211001|XXGvertex_iport_iport|38|0|67|0|{0|in|}25|30|}
{2010214001|XXGiport_src_flow|39|0|69|0|{0|}30|6|}
{2010007001|XXGobject_proto_object|40|0|70|0|{}25|31|}
{2010212001|XXGvertex_oport_oport|41|0|72|0|{0|out0|}31|32|}
{2010006001|XXGobject_psameas_object|42|0|74|0|{metadata|out0_metadata|1|0|}32|31|}
{2010006001|XXGobject_psameas_object|43|0|75|0|{transform0|transform0|1|0|}32|31|}
{2010212001|XXGvertex_oport_oport|44|0|76|0|{1|reject0|}31|33|}
{2010006001|XXGobject_psameas_object|45|0|78|0|{metadata|reject0_metadata|1|0|}33|31|}
{2010212001|XXGvertex_oport_oport|46|0|79|0|{2|error0|}31|34|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{metadata|error0_metadata|1|0|}34|31|}
{2010212001|XXGvertex_oport_oport|48|0|82|0|{3|log|}31|35|}
{2010006001|XXGobject_psameas_object|49|0|84|0|{metadata|log_metadata|1|0|}35|31|}
{2010211001|XXGvertex_iport_iport|50|0|85|0|{0|in|}31|36|}
{2010006001|XXGobject_psameas_object|51|0|87|0|{metadata|in_metadata|1|0|}36|31|}
{2010006001|XXGobject_psameas_object|52|0|88|0|{Layout|Layout|0|0|}25|13|}
{2010006001|XXGobject_psameas_object|53|0|89|0|{in_metadata|read_metadata|0|0|}25|9|}
{2010006001|XXGobject_psameas_object|54|0|90|0|{out0_metadata|write_metadata|0|0|}25|13|}
{2010006001|XXGobject_psameas_object|55|0|91|0|{reject0_metadata|read_metadata|0|0|}25|9|}
{2010601001|XXGgraph_vertex_vertex|56|0|92|0|{Reformat_1|}1|37|}
{2010212001|XXGvertex_oport_oport|57|0|94|0|{0|out0|}37|38|}
{2010213001|XXGoport_dst_flow|58|0|96|0|{0|}38|8|}
{2010212001|XXGvertex_oport_oport|59|0|97|0|{1|reject0|}37|39|}
{2010212001|XXGvertex_oport_oport|60|0|99|0|{2|error0|}37|40|}
{2010212001|XXGvertex_oport_oport|61|0|101|0|{3|log|}37|41|}
{2010211001|XXGvertex_iport_iport|62|0|103|0|{0|in|}37|42|}
{2010214001|XXGiport_src_flow|63|0|105|0|{0|}42|7|}
{2010007001|XXGobject_proto_object|64|0|106|0|{}37|43|}
{2010212001|XXGvertex_oport_oport|65|0|108|0|{0|out0|}43|44|}
{2010006001|XXGobject_psameas_object|66|0|110|0|{metadata|out0_metadata|1|0|}44|43|}
{2010006001|XXGobject_psameas_object|67|0|111|0|{transform0|transform0|1|0|}44|43|}
{2010212001|XXGvertex_oport_oport|68|0|112|0|{1|reject0|}43|45|}
{2010006001|XXGobject_psameas_object|69|0|114|0|{metadata|reject0_metadata|1|0|}45|43|}
{2010212001|XXGvertex_oport_oport|70|0|115|0|{2|error0|}43|46|}
{2010006001|XXGobject_psameas_object|71|0|117|0|{metadata|error0_metadata|1|0|}46|43|}
{2010212001|XXGvertex_oport_oport|72|0|118|0|{3|log|}43|47|}
{2010006001|XXGobject_psameas_object|73|0|120|0|{metadata|log_metadata|1|0|}47|43|}
{2010211001|XXGvertex_iport_iport|74|0|121|0|{0|in|}43|48|}
{2010006001|XXGobject_psameas_object|75|0|123|0|{metadata|in_metadata|1|0|}48|43|}
{2010006001|XXGobject_psameas_object|76|0|124|0|{Layout|Layout|0|0|}37|21|}
{2010006001|XXGobject_psameas_object|77|0|125|0|{in_metadata|read_metadata|0|0|}37|17|}
{2010006001|XXGobject_psameas_object|78|0|126|0|{out0_metadata|write_metadata|0|0|}37|21|}
{2010006001|XXGobject_psameas_object|79|0|127|0|{reject0_metadata|read_metadata|0|0|}37|17|}
{2010109001|XXGobject_property_value|80|0|128|0|{0|TrackingThumbprint|72|}1|49|}
