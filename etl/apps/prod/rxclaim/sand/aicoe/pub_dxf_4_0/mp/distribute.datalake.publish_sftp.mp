@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|58|rel_count|89|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_DML/event/event_raw.dml";

include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/event/file_event_registration.xfr";
include "~$AI_XFR/raw_event_registration.xfr";
include "~$PUB_DB_XFR/distribute.publish_list.xfr";|8|9|RK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_FILE_INFO|#Logical Target          Local MFS URL          Local Serial URL        Remote MFS URL          Remote Serial URL          DML Directory                //This parameter must be set in interim pset|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_FILE_INFO_VEC|$[get_publish_info_vec(TARGET_FILE_INFO)]|3|9|RK|@{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_CODE|@15|9|EFK|@{4|OWD|RX1|RX2|DPM|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|LOAD_TYPE|Daily|15|9|FK|@{2|Daily|History|}}
{30001002|XXparameter|FILE_TIMESTAMP|/* Must be provided from outer plan */|3|9|FK|@{0|}}
{30001002|XXparameter|DATALAKE_DML_VERSION|1|3|9|FK|@{0|}}
{30001002|XXparameter|COMPRESS_DATA_FILE|True|13|9|FK|@{0|}}
{30001002|XXparameter|ETL_APP_ID|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_FILE_PATH|$\{AI_SERIAL\}/consumption_log/consumption_log.datalake.$\{SOURCE_LOWER\}.dat|18|9|RK|@{0|}}
{30001002|XXparameter|___Parameters_for_SFTP_settings__||3|9|K|@{0|}}
{30001002|XXparameter|SFTP_HOST|AI_PHASE|3|10|FKd|Provide SFTP Host details|{0|}}
{30001002|XXparameter|SFTP_USER|AI_PHASE|3|10|FKd|ECG user id |{0|}}
{30001002|XXparameter|SFTP_LOCATION|AI_PHASE|3|10|FKd|@{0|}}
{30001002|XXparameter|SFTP_PASSPHRASE_OPTION|no passphrase|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|ETL_APP_ID:eme|APP_ORCA_RXCLAIM|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|SFTP_OPTIONS|-o PreferredAuthentications=password -o PubkeyAuthentication=no -o ServerAliveInterval=60|3|9|FK|@{0|}}
{30001002|XXparameter|SFTP_LOCATION:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_LOCATION:stage||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_HOST:stage||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:dev||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:qa||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:integration||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:uat||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:prod||3|9||@{0|}}
{30001002|XXparameter|SFTP_USER:stage||3|9||@{0|}}
{30001002|XXparameter|___Parameters_for_target_file_written_by_prev_step__||3|1|Kl||{0|}}
{30001002|XXparameter|___Keep_these_parameters_same_as_in_distribute_datalake_mp___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[get_registration_details_for_source_name(SOURCE_NAME)[0].target_system]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[get_registration_details_for_source_name(SOURCE_NAME)[0].target_entity]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_ROOT|$AI_SERIAL/datalake/$[string_downcase(SOURCE_CODE)]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_SUBFOLDER|$[string_upcase(TARGET_SYSTEM)+"_"+string_upcase(TARGET_ENTITY)+ "/"+string_upcase(TARGET_SYSTEM)+"_"+string_upcase(TARGET_ENTITY)+".v"+ DATALAKE_DML_VERSION]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_BASE_FILE_NAME|$[SOURCE_CODE + "_" + string_upcase(TARGET_SYSTEM) + "_" + string_upcase(TARGET_ENTITY) + "_" + (string(""))FILE_TIMESTAMP]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_DATA_FILE|$TARGET_ROOT/data/$TARGET_SUBFOLDER/$[LOAD_TYPE == "History"? "HIST_": ""]$TARGET_BASE_FILE_NAME.dat$[COMPRESS_DATA_FILE? ".gz": ""]|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_META_FILE|$TARGET_ROOT/meta/$TARGET_SUBFOLDER/$TARGET_BASE_FILE_NAME.meta|3|9|K|@{0|}}
{30001002|XXparameter|TARGET_CTL_FILE|$TARGET_ROOT/other/$TARGET_SUBFOLDER/$TARGET_BASE_FILE_NAME.ctl|3|9|K|@{0|}}
{30001002|XXparameter|___Parameters_for_remote_file_to_be_written_via_sftp___||3|1|Kl||{0|}}
{30001002|XXparameter|REMOTE_ROOT|$SFTP_LOCATION|3|9|K|@{0|}}
{30001002|XXparameter|REMOTE_SUBFOLDER|$[string_upcase(TARGET_SYSTEM)+"_"+string_upcase(TARGET_ENTITY)+ "/"+string_upcase(TARGET_SYSTEM)+"_"+string_upcase(TARGET_ENTITY)+".v"+ DATALAKE_DML_VERSION]|3|9|K|@{0|}}
{30001002|XXparameter|REMOTE_DATA_FILE|$REMOTE_ROOT/$[LOAD_TYPE == "History"? "HIST_": ""]$TARGET_BASE_FILE_NAME.dat$[COMPRESS_DATA_FILE? ".gz": ""]|3|9|K|@{0|}}
{30001002|XXparameter|REMOTE_META_FILE|$REMOTE_ROOT/$TARGET_BASE_FILE_NAME.meta|3|9|K|@{0|}}
{30001002|XXparameter|REMOTE_CTL_FILE|$REMOTE_ROOT/$TARGET_BASE_FILE_NAME.ctl|3|9|K|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|distribute.publish.file|Gunit Kaur|Created 11/10/2016 7:11:04 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1035000|819000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'distribute.datalake.publish_sftp' Execution Status Report

Job completed successfully at Wednesday, February 28, 2018 06:11:22
Run performed by user rishiraj.shengule
||
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev-4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|128|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@PUBLISH DAT, META, CTL TO
DATALAKE SFTP LOCATION|303000|74000|0|0|0|0|14234|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|128|240|1|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}14318|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}14319|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14316|17|}}
{2010503005|XXGfvertex|10|0|19|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|file:$TARGET_CTL_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_CTL_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|Input File|239000|601000|0|0|0|0|14325|Ctl File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|11|0|21|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|12|0|24|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|13|0|26|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|14|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_To.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|host|$SFTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|target_file|$REMOTE_CTL_FILE|3|2|$|@{0|}}
{30001002|XXparameter|passphrase_required||3|8|=|@{0|}}
{30001002|XXparameter|user|$SFTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$SFTP_OPTIONS|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-put.script|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|SFTP To|503000|593000|0|0|0|0|14328|SFTP ctl|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|15|0|31|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|16|0|33|0|{@{}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010501005|XXGpvertex|17|0|36|0|{Writes files of data records using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-to|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|target_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|target_file.display_name|target-file|3|9|P|@{0|}}
{30001002|XXparameter|target_file.keyword|target-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|temp_target||3|2|FK$|Remote temporary file name|{0|}}
{30001002|XXparameter|temp_target.display_name|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.keyword|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404658|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|SFTP To|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|18|0|38|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|19|0|41|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010503005|XXGfvertex|20|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|file:$TARGET_DATA_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_DATA_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|Input File|229000|326000|0|0|0|0|14326|Data File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|21|0|47|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|22|0|50|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|23|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|24|0|55|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_To.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|host|$SFTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|target_file|$REMOTE_DATA_FILE|3|2|$|@{0|}}
{30001002|XXparameter|passphrase_required||3|8|=|@{0|}}
{30001002|XXparameter|user|$SFTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$SFTP_OPTIONS|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-put.script|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|SFTP To|503000|318000|0|0|0|0|14329|SFTP dat|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|25|0|57|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|59|0|{@{}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010501005|XXGpvertex|27|0|62|0|{Writes files of data records using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-to|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|target_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|target_file.display_name|target-file|3|9|P|@{0|}}
{30001002|XXparameter|target_file.keyword|target-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|temp_target||3|2|FK$|Remote temporary file name|{0|}}
{30001002|XXparameter|temp_target.display_name|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.keyword|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404658|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|SFTP To|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|28|0|64|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|29|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010503005|XXGfvertex|30|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|file:$TARGET_META_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$TARGET_META_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|Input File|234000|461000|0|0|0|0|14327|Meta File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|31|0|73|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|32|0|76|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|33|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|34|0|81|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_To.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|host|$SFTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|target_file|$REMOTE_META_FILE|3|2|$|@{0|}}
{30001002|XXparameter|passphrase_required||3|8|=|@{0|}}
{30001002|XXparameter|user|$SFTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$SFTP_OPTIONS|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-put.script|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|SFTP To|503000|453000|0|0|0|0|14330|SFTP meta|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|35|0|83|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|85|0|{@{}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010501005|XXGpvertex|37|0|88|0|{Writes files of data records using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-to|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|target_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|target_file.display_name|target-file|3|9|P|@{0|}}
{30001002|XXparameter|target_file.keyword|target-file|3|9|P|@{0|}}
{30001002|XXparameter|transfer_method|-sftp|15|1|RFOl|Method to use, choose -sftp or -scp|{2|-sftp|-scp|}}
{30001002|XXparameter|transfer_method.display_name|transfer-method|3|9|P|@{0|}}
{30001002|XXparameter|passphrase_required|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|passphrase_required.display_name|passphrase-required|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase|True|13|1|Kl|SSH requires a password or passphrase|{0|}}
{30001002|XXparameter|need_passphrase.display_name|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.keyword|need-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|need_passphrase.condition|param passphrase-required need*|3|15|P?|@{0|}}
{30001002|XXparameter|no_passphrase|True|13|1|Kl|SSH does not require a password or passphrase|{0|}}
{30001002|XXparameter|no_passphrase.display_name|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.keyword|no-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|no_passphrase.condition|param passphrase-required no*|3|15|P?|@{0|}}
{30001002|XXparameter|passphrase||3|2|FK$|Password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase||3|2|FK$|Encrypted password or passphrase|{0|}}
{30001002|XXparameter|encrypted_passphrase.display_name|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|encrypted_passphrase.keyword|encrypted-passphrase|3|9|P|@{0|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|program||3|2|FK$|sftp/scp program to run|{0|}}
{30001002|XXparameter|sftp_batch_flag||3|2|FK$|Batch flag for your sftp client|{0|}}
{30001002|XXparameter|sftp_batch_flag.display_name|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.keyword|sftp-batch-flag|3|9|P|@{0|}}
{30001002|XXparameter|sftp_batch_flag.condition|param transfer-method -sftp version 2.14.18:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_args||3|2|FK$|Extra arguments to pass to sftp|{0|}}
{30001002|XXparameter|extra_args.display_name|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|extra_args.keyword|extra-args|3|9|P|@{0|}}
{30001002|XXparameter|temp_target||3|2|FK$|Remote temporary file name|{0|}}
{30001002|XXparameter|temp_target.display_name|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.keyword|temp-target|3|9|P|@{0|}}
{30001002|XXparameter|temp_target.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|sftp_script||3|2|FK$|Template script containing sftp commands to run|{0|}}
{30001002|XXparameter|sftp_script.display_name|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.keyword|sftp-script|3|9|P|@{0|}}
{30001002|XXparameter|sftp_script.condition|param transfer-method -sftp|3|15|P?|@{0|}}
{30001002|XXparameter|output_tolerated|unspecified|15|1|Fl|Does sftp/scp generate output even when successful?|{3|unspecified|tolerate output|dont tolerate output|}}
{30001002|XXparameter|output_tolerated.display_name|output-tolerated|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|tolerate_output|True|13|1|Kl|sftp/scp generates output when successful|{0|}}
{30001002|XXparameter|tolerate_output.display_name|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.keyword|tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_output.condition|param output-tolerated tol*|3|15|P?|@{0|}}
{30001002|XXparameter|dont_tolerate_output|True|13|1|Kl|sftp/scp does not generate output when successful|{0|}}
{30001002|XXparameter|dont_tolerate_output.display_name|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.keyword|dont-tolerate-output|3|9|P|@{0|}}
{30001002|XXparameter|dont_tolerate_output.condition|param output-tolerated dont*|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|sftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404658|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|SFTP To|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|38|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|39|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010600005|XXGgraph|40|0|100|0|{Subgraph created from graph "distribute.publish.file"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|1|Fl||{0|}}
}}@0|@881500|686250|0|0|0|0|14320|Update Consumption Log|Gunit Kaur|Created 2/6/2017 9:04:30 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|419000|176000|3|}}
{2010210004|XXGflow|41|0|102|0|{@{}@384|.5|.5|{0|}12972|17|}}
{2010210004|XXGflow|42|0|104|0|{@{}@384|.5|.5|{0|}12970|17|}}
{2010503005|XXGfvertex|43|0|106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$EVENT_CONSUMPTION_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@1|Output File|297000|87500|0|0|0|0|12974|Consumption Log|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|44|0|108|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|45|0|111|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|46|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|47|0|116|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$\{AI_SERIAL\}/cnsm_log/raw/interim_log.$\{SOURCE_NAME\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@1|Input File|55000|88000|0|0|0|0|12975|Interim Events Log|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|48|0|118|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|49|0|121|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|50|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|51|0|126|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|195000|97500|0|0|0|0|12976|Updating Consumption Entry|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|128|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|53|0|131|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|54|0|134|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|55|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|56|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|57|0|145|0|{@{}@{1|2457859|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010601001|XXGgraph_vertex_vertex|9|0|18|0|{Ctl_File|}1|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|read|}10|11|}
{2010213001|XXGoport_dst_flow|11|0|22|0|{0|}11|9|}
{2010007001|XXGobject_proto_object|12|0|23|0|{}10|12|}
{2010212001|XXGvertex_oport_oport|13|0|25|0|{0|read|}12|13|}
{2010006001|XXGobject_psameas_object|14|0|27|0|{metadata|read_metadata|1|0|}13|12|}
{2010006001|XXGobject_psameas_object|15|0|28|0|{read_metadata|in_metadata|0|0|}10|14|}
{2010212001|XXGvertex_oport_oport|16|0|30|0|{0|log|}14|15|}
{2010211001|XXGvertex_iport_iport|17|0|32|0|{0|in|}14|16|}
{2010214001|XXGiport_src_flow|18|0|34|0|{0|}16|9|}
{2010007001|XXGobject_proto_object|19|0|35|0|{}14|17|}
{2010212001|XXGvertex_oport_oport|20|0|37|0|{0|log|}17|18|}
{2010006001|XXGobject_psameas_object|21|0|39|0|{metadata|log_metadata|1|0|}18|17|}
{2010211001|XXGvertex_iport_iport|22|0|40|0|{0|in|}17|19|}
{2010006001|XXGobject_psameas_object|23|0|42|0|{metadata|in_metadata|1|0|}19|17|}
{2010006001|XXGobject_psameas_object|24|0|43|0|{passphrase_required|SFTP_PASSPHRASE_OPTION|1|0|}14|1|}
{2010601001|XXGgraph_vertex_vertex|25|0|44|0|{Data_File|}1|20|}
{2010212001|XXGvertex_oport_oport|26|0|46|0|{0|read|}20|21|}
{2010213001|XXGoport_dst_flow|27|0|48|0|{0|}21|7|}
{2010007001|XXGobject_proto_object|28|0|49|0|{}20|22|}
{2010212001|XXGvertex_oport_oport|29|0|51|0|{0|read|}22|23|}
{2010006001|XXGobject_psameas_object|30|0|53|0|{metadata|read_metadata|1|0|}23|22|}
{2010006001|XXGobject_psameas_object|31|0|54|0|{read_metadata|in_metadata|0|0|}20|24|}
{2010212001|XXGvertex_oport_oport|32|0|56|0|{0|log|}24|25|}
{2010211001|XXGvertex_iport_iport|33|0|58|0|{0|in|}24|26|}
{2010214001|XXGiport_src_flow|34|0|60|0|{0|}26|7|}
{2010007001|XXGobject_proto_object|35|0|61|0|{}24|27|}
{2010212001|XXGvertex_oport_oport|36|0|63|0|{0|log|}27|28|}
{2010006001|XXGobject_psameas_object|37|0|65|0|{metadata|log_metadata|1|0|}28|27|}
{2010211001|XXGvertex_iport_iport|38|0|66|0|{0|in|}27|29|}
{2010006001|XXGobject_psameas_object|39|0|68|0|{metadata|in_metadata|1|0|}29|27|}
{2010006001|XXGobject_psameas_object|40|0|69|0|{passphrase_required|SFTP_PASSPHRASE_OPTION|1|0|}24|1|}
{2010601001|XXGgraph_vertex_vertex|41|0|70|0|{Meta_File|}1|30|}
{2010212001|XXGvertex_oport_oport|42|0|72|0|{0|read|}30|31|}
{2010213001|XXGoport_dst_flow|43|0|74|0|{0|}31|8|}
{2010007001|XXGobject_proto_object|44|0|75|0|{}30|32|}
{2010212001|XXGvertex_oport_oport|45|0|77|0|{0|read|}32|33|}
{2010006001|XXGobject_psameas_object|46|0|79|0|{metadata|read_metadata|1|0|}33|32|}
{2010006001|XXGobject_psameas_object|47|0|80|0|{read_metadata|in_metadata|0|0|}30|34|}
{2010212001|XXGvertex_oport_oport|48|0|82|0|{0|log|}34|35|}
{2010211001|XXGvertex_iport_iport|49|0|84|0|{0|in|}34|36|}
{2010214001|XXGiport_src_flow|50|0|86|0|{0|}36|8|}
{2010007001|XXGobject_proto_object|51|0|87|0|{}34|37|}
{2010212001|XXGvertex_oport_oport|52|0|89|0|{0|log|}37|38|}
{2010006001|XXGobject_psameas_object|53|0|91|0|{metadata|log_metadata|1|0|}38|37|}
{2010211001|XXGvertex_iport_iport|54|0|92|0|{0|in|}37|39|}
{2010006001|XXGobject_psameas_object|55|0|94|0|{metadata|in_metadata|1|0|}39|37|}
{2010006001|XXGobject_psameas_object|56|0|95|0|{passphrase_required|SFTP_PASSPHRASE_OPTION|1|0|}34|1|}
{2010601001|XXGgraph_vertex_vertex|57|0|96|0|{SFTP_ctl|}1|14|}
{2010601001|XXGgraph_vertex_vertex|58|0|97|0|{SFTP_dat|}1|24|}
{2010601001|XXGgraph_vertex_vertex|59|0|98|0|{SFTP_meta|}1|34|}
{2010601001|XXGgraph_vertex_vertex|60|0|99|0|{Update_Consumption_Log|}1|40|}
{2010604001|XXGgraph_flow_flow|61|0|101|0|{Flow_18|}40|41|}
{2010604001|XXGgraph_flow_flow|62|0|103|0|{Flow_22|}40|42|}
{2010601001|XXGgraph_vertex_vertex|63|0|105|0|{Consumption_Log|}40|43|}
{2010211001|XXGvertex_iport_iport|64|0|107|0|{0|write|}43|44|}
{2010214001|XXGiport_src_flow|65|0|109|0|{0|}44|41|}
{2010007001|XXGobject_proto_object|66|0|110|0|{}43|45|}
{2010211001|XXGvertex_iport_iport|67|0|112|0|{0|write|}45|46|}
{2010006001|XXGobject_psameas_object|68|0|114|0|{metadata|write_metadata|1|0|}46|45|}
{2010601001|XXGgraph_vertex_vertex|69|0|115|0|{Interim_Events_Log|}40|47|}
{2010212001|XXGvertex_oport_oport|70|0|117|0|{0|read|}47|48|}
{2010213001|XXGoport_dst_flow|71|0|119|0|{0|}48|42|}
{2010007001|XXGobject_proto_object|72|0|120|0|{}47|49|}
{2010212001|XXGvertex_oport_oport|73|0|122|0|{0|read|}49|50|}
{2010006001|XXGobject_psameas_object|74|0|124|0|{metadata|read_metadata|1|0|}50|49|}
{2010601001|XXGgraph_vertex_vertex|75|0|125|0|{Updating_Consumption_Entry|}40|51|}
{2010212001|XXGvertex_oport_oport|76|0|127|0|{0|out|}51|52|}
{2010213001|XXGoport_dst_flow|77|0|129|0|{0|}52|41|}
{2010211001|XXGvertex_iport_iport|78|0|130|0|{0|in|}51|53|}
{2010214001|XXGiport_src_flow|79|0|132|0|{0|}53|42|}
{2010007001|XXGobject_proto_object|80|0|133|0|{}51|54|}
{2010212001|XXGvertex_oport_oport|81|0|135|0|{0|out|}54|55|}
{2010006001|XXGobject_psameas_object|82|0|137|0|{metadata|out_metadata|1|0|}55|54|}
{2010211001|XXGvertex_iport_iport|83|0|138|0|{0|in|}54|56|}
{2010006001|XXGobject_psameas_object|84|0|140|0|{metadata|in_metadata|1|0|}56|54|}
{2010006001|XXGobject_psameas_object|85|0|141|0|{Layout|Layout|0|0|}51|43|}
{2010006001|XXGobject_psameas_object|86|0|142|0|{in_metadata|read_metadata|0|0|}51|47|}
{2010006001|XXGobject_psameas_object|87|0|143|0|{out_metadata|read_metadata|0|0|}51|47|}
{2010109001|XXGobject_property_value|88|0|144|0|{0|TrackingThumbprint|72|}1|57|}
