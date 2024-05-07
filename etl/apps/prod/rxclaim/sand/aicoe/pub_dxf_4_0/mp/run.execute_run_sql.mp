@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|54|rel_count|88|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|FK|@{0|}}
{30001002|XXparameter|SQL_FILE_FULLY_QUALIFIED||18|9|RFK||{0|}}
{30001002|XXparameter|SQL_FILE_NAME|$[re_replace(string_split(SQL_FILE_FULLY_QUALIFIED, "/")[length_of(string_split(SQL_FILE_FULLY_QUALIFIED, "/")) - 1], ".sql$", "")]|3|9|RFK||{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[string_split(string_replace(SQL_FILE_FULLY_QUALIFIED, "//", "/"), "/")[length_of(string_split(string_replace(SQL_FILE_FULLY_QUALIFIED, "//", "/"), "/")) - 3]]|3|9|FK|@{0|}}
{30001002|XXparameter|DB_EXECUTE_DBC|@18|9|FK|@{0|}}
{30001002|XXparameter|DB_EXECUTE_DBMS|@3|9|FK|@{0|}}
{30001002|XXparameter|DB_NAME||3|3|FKc||{0|}}
{30001002|XXparameter|STG_DB_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|START_CHANGES_TIME|$[(datetime("YYYY-MM-DD HH24:MI:SS")) now()]|3|9|FK||{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[(datetime("YYYY-MM-DD HH24:MI:SS")) now()]|3|9|FK||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|SQL_NAME_VALUE_PAIR||3|9|FK|Fomat : "Parameter Name"\|"Value"  Split the line by newline character|{0|}}
{30001002|XXparameter|NAME_VALUE_PAIR_VEC|$[ re_split_no_empty(SQL_NAME_VALUE_PAIR,"\\r\\n+") ]|3|9|K|Splitting the Name Value Pair in Vector|{0|}}
{30001002|XXparameter|SQL_FILE_FULLY_QUALIFIED_RESOLVED|$[
begin
        let string("") str = read_file(SQL_FILE_FULLY_QUALIFIED);
        let string("") str_repl = str;
        let string("") find_str;
        let string("") repl_str;
        let string("")[] split_vec;

        if( SQL_NAME_VALUE_PAIR != "")
        for(let i =0, i< length_of(NAME_VALUE_PAIR_VEC)) 
                begin block string_replace
                        split_vec      = string_split(NAME_VALUE_PAIR_VEC[i],"\|");
                        find_str       = "$\{" + split_vec[0] + "\}";
                        repl_str = split_vec[1];
                        str_repl    = string_replace(str_repl,find_str,repl_str);
                end block string_replace

        result:: pdl_resolve(str_repl).resolved_value;

end 
]|3|9|K|Resolved Value of SQL Submitted to Run SQL Component|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|624000|528000|0|run.execute_run_sql|Christopher.Reppin|Created 10/26/2016 6:57:49 AM|1|100|0||9||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|675000|544000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'run.execute_run_sql' Execution Status Report


Job "run.execute_run_sql" Execution started at Thursday, February 15, 2018 08:27:17
Job completed successfully at Thursday, February 15, 2018 08:27:39

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:21
Run performed by user bmolgi1
Total data moved through all flows: 0 records (-1 bytes)
Total CPU time (all processes): 0 seconds
Average CPU utilization across all nodes: 0.00 percent
||echo "Below are the SQL Name Value Pair passed to the job"
echo $SQL_NAME_VALUE_PAIR
|
|@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Run: Execute Run SQL|15103|15494|35000|35000|525000|56000|7610|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@
Input Parameters:
SQL_FILE_FULLLY_QUALIFIED
SQL_FILE_NAME
DB_EXECUTE_DBC
DB_EXECUTE_DBMS
SQL_NAME_VALUE_PAIR(Optional)|28000|416000|48000|436000|188000|96000|7609|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{12|409000|209000|429000|209000|429000|261000|406000|261000|406000|314000|427000|314000|}7622|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{8|498000|319000|518000|319000|524000|319000|545000|319000|}7616|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{12|114000|421000|114000|441000|260000|441000|260000|324000|406000|324000|427000|324000|}7624|19|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{12|181000|204000|181000|204000|189000|204000|189000|209000|197000|209000|204000|209000|}7621|17|}}
{2010501005|XXGpvertex|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Concatenate|478000|296000|438000|300000|50000|41000|7626|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|14|0|27|0|{@{}@487000|314000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|15|0|30|0|{@{}@428000|309000|11000|21000|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|16|0|34|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|17|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|18|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|19|0|42|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/run.execute_run_sql.$TARGET_SYSTEM.$SQL_FILE_NAME.$RUN_ID.txt|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/run.execute_run_sql.$SQL_FILE_NAME.\{RUN_ID\}.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|Output File|584000|282500|556000|293000|56000|50000|7627|Logged SQL Results|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|20|0|44|0|{@{}@546000|314000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|47|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|22|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|23|0|52|0|{Executes SQL statements in a database.  This component takes a parameter for the fully qualified path to the sql file it will run.




 |{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Run_SQL.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|DBConfigFile|$DB_EXECUTE_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$DB_EXECUTE_DBMS|3|2|$|@{0|}}
{30001002|XXparameter|interface|utility|3|1|l|@{0|}}
{30001002|XXparameter|SQLFile|$SQL_FILE_FULLY_QUALIFIED_RESOLVED|3|9|j|@{0|}}
{30001002|XXparameter|in_metadata|record string(';') astmt; end|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Run SQL|34000|259000|54000|279000|142000|132000|7630|Run SQL File that has been provided|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|24|0|54|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|25|0|56|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|26|0|58|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|27|0|60|0|{@{}@109000|410000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|28|0|63|0|{@{}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|29|0|65|0|{Executes SQL statements in a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-runsql|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/db_v2/bin/db-runsql|3|2|H$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If true, makes this a Continuous Run SQL component|{0|}}
{30001002|XXparameter|continuous.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|DBConfigFile||22|2|RFOf$|Database Description File|{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|transaction_group||3|2|FK$|Name of the transaction group for participation in a shared transaction. Graph folding must be enabled.|{0|}}
{30001002|XXparameter|transaction_group.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|interface|api|15|1|FKl|Run commands using utility or via api|{2|api|utility|}}
{30001002|XXparameter|ansimode|True|13|1|FKl|Teradata: Use ANSI semantics if True; BTET semantics if False|{0|}}
{30001002|XXparameter|ansimode.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_drop_table_errors|False|13|1|FKl|Ignore failures from drop table statements|{0|}}
{30001002|XXparameter|ignore_drop_table_errors.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|0|1|2|FK$|Maximum errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|param_exact interface api version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|SQLFile|~null|32|2|FOf$|File with SQL to run|{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata param_exact interface api version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options_impl|value dbms netezza True value dbms mssql True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|native_options_impl.condition|param_exact interface utility|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database SQL utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact native_options_impl True version 3.0.5.1:|3|15|P?|@{0|}}
{30001002|XXparameter|analyze_dependencies|True|13|1|Fl|Perform dependency analysis on the SQL in this component|{0|}}
{30001002|XXparameter|sql_analysis|SQLFile|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 3.0.3.r15: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects|False|13|1|Fl|In transactional section only, always rollback on reject|{0|}}
{30001002|XXparameter|rollback_all_rejects.condition|param reject-threshold Never*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword|value reject-threshold Abort* False value reject-threshold Use* False sameas rollback_all_rejects default constant False|13|13|Kv|transactional reject behavior|{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|num_errors maximum_errors limit_keyword limit ramp_keyword ramp rollback_all_rejects_keyword rollback_all_rejects|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname|value continuous True db-runsql-continuous value continuous False db-runsql|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|param_exact interface api version 3.0.3.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|LayoutFlags|idb|3|2|H$|Enable Database Layouts|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? nobatch,publisher : nonrecoverable|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata_local|value_in_version :3.2.5.r23 recordstring(';')astmt;end value_in_version 3.2.5.r24: recordstring(';',charset='x-ab-internal')astmt;end|7|13|v|SQL statement format|{0|}}
{30001002|XXparameter|in_metadata|$in_metadata_local|7|2|F$|SQL statement format|{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 78 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Run SQL|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|30|0|67|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|31|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|73|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|76|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=|SQL statement format|{0|}}
}}@0|0|0|0|in|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|35|0|87|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.node :: "SQL to be executed";
  out.timestamp :: now1();
  out.component ::  $"AI_INPUT_PSET_FILE";
  out.subcomponent :: $"SQL_FILE_FULLY_QUALIFIED";
  out.event_type :: "SQL";
  out.event_text :: in.sql_string_output;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|195000|110000|215000|135000|184000|145000|7628|Put the SQL script together with audit information about the SQL|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|36|0|89|0|{@{}@398000|204000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|37|0|92|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|38|0|94|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|39|0|96|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|40|0|98|0|{@{}@205000|204000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|41|0|101|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|42|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|43|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|44|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|45|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|46|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|47|0|120|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|commandline|cat $SQL_FILE_FULLY_QUALIFIED|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") sql_string_output;
  // Enter your record definition here
end;|3|1|l|@{0|}}
}}@0|Run Program|31000|123000|51000|143000|120000|127000|7629|Read contents of SQL File|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|48|0|122|0|{@{}@170000|199000|11000|11000|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|49|0|125|0|{@{}@41000|199000|11000|11000|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|50|0|127|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|51|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|52|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010110002|XXGconstant|53|0|140|0|{@{}@{1|7284143|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_2|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_3|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_4|}1|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Concatenate|}1|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|14|0|28|0|{0|}14|10|}
{2010211001|XXGvertex_iport_iport|15|0|29|0|{0|in|}13|15|}
{2010214001|XXGiport_src_flow|16|0|31|0|{0|}15|9|}
{2010214001|XXGiport_src_flow|17|0|32|0|{1|}15|11|}
{2010007001|XXGobject_proto_object|18|0|33|0|{}13|16|}
{2010212001|XXGvertex_oport_oport|19|0|35|0|{0|out|}16|17|}
{2010006001|XXGobject_psameas_object|20|0|37|0|{metadata|out_metadata|1|0|}17|16|}
{2010211001|XXGvertex_iport_iport|21|0|38|0|{0|in|}16|18|}
{2010006001|XXGobject_psameas_object|22|0|40|0|{metadata|in_metadata|1|0|}18|16|}
{2010006001|XXGobject_psameas_object|23|0|41|0|{Layout|Layout|0|0|}13|19|}
{2010211001|XXGvertex_iport_iport|24|0|43|0|{0|write|}19|20|}
{2010214001|XXGiport_src_flow|25|0|45|0|{0|}20|10|}
{2010007001|XXGobject_proto_object|26|0|46|0|{}19|21|}
{2010211001|XXGvertex_iport_iport|27|0|48|0|{0|write|}21|22|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{metadata|write_metadata|1|0|}22|21|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{write_metadata|log_metadata|0|0|}19|23|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{0|out|}23|24|}
{2010212001|XXGvertex_oport_oport|31|0|55|0|{1|reject|}23|25|}
{2010212001|XXGvertex_oport_oport|32|0|57|0|{2|error|}23|26|}
{2010212001|XXGvertex_oport_oport|33|0|59|0|{3|log|}23|27|}
{2010213001|XXGoport_dst_flow|34|0|61|0|{0|}27|11|}
{2010211001|XXGvertex_iport_iport|35|0|62|0|{0|in|}23|28|}
{2010007001|XXGobject_proto_object|36|0|64|0|{}23|29|}
{2010212001|XXGvertex_oport_oport|37|0|66|0|{0|out|}29|30|}
{2010006001|XXGobject_psameas_object|38|0|68|0|{metadata|out_metadata|1|0|}30|29|}
{2010212001|XXGvertex_oport_oport|39|0|69|0|{1|reject|}29|31|}
{2010006001|XXGobject_psameas_object|40|0|71|0|{metadata|reject_metadata|1|0|}31|29|}
{2010212001|XXGvertex_oport_oport|41|0|72|0|{2|error|}29|32|}
{2010006001|XXGobject_psameas_object|42|0|74|0|{metadata|error_metadata|1|0|}32|29|}
{2010212001|XXGvertex_oport_oport|43|0|75|0|{3|log|}29|33|}
{2010006001|XXGobject_psameas_object|44|0|77|0|{metadata|log_metadata|1|0|}33|29|}
{2010211001|XXGvertex_iport_iport|45|0|78|0|{0|in|}29|34|}
{2010006001|XXGobject_psameas_object|46|0|80|0|{metadata|in_metadata|1|0|}34|29|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{out_metadata|in_metadata|0|0|}23|23|}
{2010006001|XXGobject_psameas_object|48|0|82|0|{reject_metadata|in_metadata|0|0|}23|23|}
{2010006001|XXGobject_psameas_object|49|0|83|0|{in_metadata|log_metadata|0|0|}13|23|}
{2010006001|XXGobject_psameas_object|50|0|84|0|{out_metadata|log_metadata|0|0|}13|23|}
{2010601001|XXGgraph_vertex_vertex|51|0|85|0|{Logged_SQL_Results|}1|19|}
{2010601001|XXGgraph_vertex_vertex|52|0|86|0|{Put_the_SQL_script_together_with_audit_information_about_the_SQL|}1|35|}
{2010212001|XXGvertex_oport_oport|53|0|88|0|{0|out0|}35|36|}
{2010213001|XXGoport_dst_flow|54|0|90|0|{0|}36|9|}
{2010212001|XXGvertex_oport_oport|55|0|91|0|{1|reject0|}35|37|}
{2010212001|XXGvertex_oport_oport|56|0|93|0|{2|error0|}35|38|}
{2010212001|XXGvertex_oport_oport|57|0|95|0|{3|log|}35|39|}
{2010211001|XXGvertex_iport_iport|58|0|97|0|{0|in|}35|40|}
{2010214001|XXGiport_src_flow|59|0|99|0|{0|}40|12|}
{2010007001|XXGobject_proto_object|60|0|100|0|{}35|41|}
{2010212001|XXGvertex_oport_oport|61|0|102|0|{0|out0|}41|42|}
{2010006001|XXGobject_psameas_object|62|0|104|0|{metadata|out0_metadata|1|0|}42|41|}
{2010006001|XXGobject_psameas_object|63|0|105|0|{transform0|transform0|1|0|}42|41|}
{2010212001|XXGvertex_oport_oport|64|0|106|0|{1|reject0|}41|43|}
{2010006001|XXGobject_psameas_object|65|0|108|0|{metadata|reject0_metadata|1|0|}43|41|}
{2010212001|XXGvertex_oport_oport|66|0|109|0|{2|error0|}41|44|}
{2010006001|XXGobject_psameas_object|67|0|111|0|{metadata|error0_metadata|1|0|}44|41|}
{2010212001|XXGvertex_oport_oport|68|0|112|0|{3|log|}41|45|}
{2010006001|XXGobject_psameas_object|69|0|114|0|{metadata|log_metadata|1|0|}45|41|}
{2010211001|XXGvertex_iport_iport|70|0|115|0|{0|in|}41|46|}
{2010006001|XXGobject_psameas_object|71|0|117|0|{metadata|in_metadata|1|0|}46|41|}
{2010006001|XXGobject_psameas_object|72|0|118|0|{Layout|Layout|0|0|}35|19|}
{2010006001|XXGobject_psameas_object|73|0|119|0|{in_metadata|out_metadata|0|0|}35|47|}
{2010212001|XXGvertex_oport_oport|74|0|121|0|{0|out|}47|48|}
{2010213001|XXGoport_dst_flow|75|0|123|0|{0|}48|12|}
{2010211001|XXGvertex_iport_iport|76|0|124|0|{0|in|}47|49|}
{2010007001|XXGobject_proto_object|77|0|126|0|{}47|50|}
{2010212001|XXGvertex_oport_oport|78|0|128|0|{0|out|}50|51|}
{2010006001|XXGobject_psameas_object|79|0|130|0|{metadata|out_metadata|1|0|}51|50|}
{2010211001|XXGvertex_iport_iport|80|0|131|0|{0|in|}50|52|}
{2010006001|XXGobject_psameas_object|81|0|133|0|{metadata|in_metadata|1|0|}52|50|}
{2010006001|XXGobject_psameas_object|82|0|134|0|{Layout|Layout|0|0|}47|19|}
{2010006001|XXGobject_psameas_object|83|0|135|0|{out0_metadata|log_metadata|0|0|}35|23|}
{2010006001|XXGobject_psameas_object|84|0|136|0|{reject0_metadata|out_metadata|0|0|}35|47|}
{2010601001|XXGgraph_vertex_vertex|85|0|137|0|{Read_contents_of_SQL_File|}1|47|}
{2010601001|XXGgraph_vertex_vertex|86|0|138|0|{Run_SQL_File_that_has_been_provided|}1|23|}
{2010109001|XXGobject_property_value|87|0|139|0|{0|TrackingThumbprint|72|}1|53|}
