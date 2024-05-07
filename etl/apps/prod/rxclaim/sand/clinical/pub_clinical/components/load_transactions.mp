@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|38|rel_count|55|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|DBC_FILE||3|9|RFK|@{0|}}
{30001002|XXparameter|TRNXN_GROUP||3|9|RFK|@{0|}}
{30001002|XXparameter|UPDATE_SQL_FILE||3|9|RFK|@{0|}}
{30001002|XXparameter|LOAD_READY_FILE||3|9|RFK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|Load Transaction|rsontakk|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1184000|708000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'load_transactions' Execution Status Report

Job completed successfully at Friday, December 23, 2016 08:09:18
Run performed by user rsontakk
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrs4064||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Courier New|8421376|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Project & Title    : pub_clinical -> components -> Load Transactions
Initial Developers : Rahul Sontakke
Date Created       : December 23, 2016

Input Parameters   :
  DBC_FILE            = Database DBC FILE PATH
  TRNXN_GROUP         = Transaction Group
  UPDATE_SQL_FILE     = Insert SQL for Database
  LOAD_READY_FILE     = Load Ready file Path

  


Description :

This Graph load the data in database and creates the load ready file at the same time.
This subgraph must precede with BEGIN Transaction component in order it to work in transactional way.|18000|420000|0|0|0|0|13430|}}
{2010242002|XXGface|6|0|11|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}13426|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}13432|17|}}
{2010503005|XXGfvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|2|fs$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOAD_READY_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@289000|131000|0|0|0|0|13418|Load Ready File|Ab Initio Software|@1|100000|-1|@6||33025|-1|-1|}}
{2010202004|XXGiport|10|0|19|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|11|0|22|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|13|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|83000|145000|0|0|0|0|13428|REPL|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|14|0|29|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|15|0|33|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|16|0|35|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|17|0|37|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|18|0|40|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|19|0|44|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Database/Update_Table.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|sql_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|dbms|oracle|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|transaction_group|$TRNXN_GROUP|3|9||@{0|}}
{30001002|XXparameter|DBConfigFile|$DBC_FILE|3|9|f|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|updateSqlFile|$UPDATE_SQL_FILE|3|9|f|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Update Table|275000|287500|0|0|0|0|13433|Update Table|Ab Initio Software|Built-in 2.5:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|20|0|46|0|{@{}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|21|0|48|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|22|0|50|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|23|0|52|0|{@{}@0|0|0|0|unused|0.0|@@@1168|0|}}
{2010203004|XXGoport|24|0|54|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|25|0|56|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|26|0|59|0|{@{}@0|0|0|0|sql|0.0|@@@1680|0|}}
{2010501005|XXGpvertex|27|0|61|0|{Executes update or insert statements in embedded SQL format to modify a database table.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|db-update|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/db_v2/bin/db-update|3|2|H$||{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If true, makes this a Continuous Update component|{0|}}
{30001002|XXparameter|ter_interface|api|15|1|Fl|Update data using api or utility|{7|api|Tpump|Multiload|PT_update|PT_stream|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|all_other_dbs|api|15|1|l|All remaining databases do api update only|{1|api|}}
{30001002|XXparameter|DBConfigFile||22|2|RFOf$|Database Description File|{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|transaction_group||3|2|FK$|Name of the transaction group for participation in a shared transaction. Graph folding must be enabled.|{0|}}
{30001002|XXparameter|componentArg|-updatetable|3|2|O$||{0|}}
{30001002|XXparameter|componentArg.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|updateSqlFile||32|2|RFO$|Update SQL File|{0|}}
{30001002|XXparameter|insertSqlFile||32|2|FO$|Insert SQL File|{0|}}
{30001002|XXparameter|interface_for_update|sameas ter_interface sameas all_other_dbs|3|13|v||{0|}}
{30001002|XXparameter|interface|sameas interface_for_update|3|13|Kv||{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber|0|1|2|RFK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||3|2|FK$|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|LayoutFlags|idb|3|2|H$|Enable Database Layouts|{0|}}
{30001002|XXparameter|new_db_update|true|13|1|Kl||{0|}}
{30001002|XXparameter|new_db_update.condition|param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|sql_port_version|2.10.8:|3|2|H$|Version in which 'sql' port became available|{0|}}
{30001002|XXparameter|sql_port_version.display_name|sql-port-version|3|9|P|@{0|}}
{30001002|XXparameter|unmatched_port_version|2.10.14:|3|2|H$|Version in which 'unmatched' port became available|{0|}}
{30001002|XXparameter|unmatched_port_version.display_name|unmatched-port-version|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|updateSqlOnceOnly|False|13|1|Fl|Execute SQL from the 'sql' port only once|{0|}}
{30001002|XXparameter|updateSqlOnceOnly.condition|param_exact interface api version 2.10.8:|3|15|P?|@{0|}}
{30001002|XXparameter|update_sql_once_only|value updateSqlOnceOnly True True value updateSqlOnceOnly False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|update_sql_once_only.condition|param_exact interface api version 2.10.8:|3|15|P?|@{0|}}
{30001002|XXparameter|ActionRequired|True|13|1|Fl|Issue an error if an input record results in no change to the database|{0|}}
{30001002|XXparameter|ActionRequired.condition|param_exact interface api version 2.10.14:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ActionRequired False True value ActionRequired True False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|param_exact interface api version 2.10.14:|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|compat|15|1|FKl|if False, always reject unique constraint violations|{3|compat|False|True|}}
{30001002|XXparameter|ignoreDuplicates.condition|param_exact interface api version 3.1.1.8:|3|15|P?|@{0|}}
{30001002|XXparameter|unused_port_version|2.10.14:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|DML package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|param_exact interface api version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects|False|13|1|Fl|In transactional section only, always rollback on reject|{0|}}
{30001002|XXparameter|rollback_all_rejects.condition|param reject-threshold Never*|3|15|P?|@{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword|value reject-threshold Abort* False value reject-threshold Use* False sameas rollback_all_rejects default constant False|13|13|Kv|transactional reject behavior|{0|}}
{30001002|XXparameter|rollback_all_rejects_keyword.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter_interface Tpump True value ter_interface PT_stream True value ter_interface PT_api_stream True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter_interface Multiload True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|table_used_in_macro||3|2|FK$|Tablename used in macro definition if macro execution specified for sql|{0|}}
{30001002|XXparameter|table_used_in_macro.condition|param_exact ter_is_tpump True version 2.14.11:|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before multiload gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_is_tpump False param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1 & 2 appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|# errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_insert|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_insert.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_update|False|13|1|FKl|If true, ignore duplicate rows on update|{0|}}
{30001002|XXparameter|ignore_dupl_update.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_missing_delete|False|13|1|FKl|If true, ignore missing rows on delete|{0|}}
{30001002|XXparameter|ignore_missing_delete.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_missing_update||13|1|RFKl|If true, ignore missing rows on update|{0|}}
{30001002|XXparameter|ignore_missing_update.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_extra_delete|False|13|1|FKl|If true, ignore extra rows on delete|{0|}}
{30001002|XXparameter|ignore_extra_delete.condition|param_exact ter_is_tpump True version 2.14.11:|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_extra_update|False|13|1|FKl|If true, ignore extra rows on update|{0|}}
{30001002|XXparameter|ignore_extra_update.condition|param_exact ter_is_tpump True version 2.14.11:|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|latency||1|2|FK$|threshold in seconds for Tpump to flush its input buffers|{0|}}
{30001002|XXparameter|latency.condition|param_exact ter_is_tpump True param_exact continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_wb False param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|override_mpname|value ter_util True \@mpdb-ter-update-data value continuous True db-update-continuous value continuous False db-update|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|lay|$layout|14|1|Kl|layout of this node|{0|}}
{30001002|XXparameter|lay.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|lay layout limit_keyword limit ramp_keyword ramp rollback_all_rejects_keyword rollback_all_rejects|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|nz_cnum|value commitNumber 0 False value commitNumber * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|nz_cnum.condition|param interface api|3|15|P?|@{0|}}
{30001002|XXparameter|leadchkpt|-__ab__leading-checkpoint__ab__|3|2|O$||{0|}}
{30001002|XXparameter|leadchkpt.condition|param_exact interface api param_exact nz_cnum True version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|param_exact interface api version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|sql_analysis|updateSqlFile=in,r; insertSqlFile=in,r|3|2|H$||{0|}}
{30001002|XXparameter|HelpID|value continuous True comp_continuous_update_table value continuous False comp_update_table|3|13|FHv||{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? nobatch,publisher : not_enabled|3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|variable1|statement_input_type statement_input "record end"|3|2|H$|Intermediate type for sql statement input|{0|}}
{30001002|XXparameter|variable1.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|variable1_analysis|statement_input_type statement_input[n]|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation5|integer(4) out::length(in)|3|2|H$|Number of records to send to sql statements|{0|}}
{30001002|XXparameter|operation5.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation6|statement_input::compute_statement_input(in, integer(4) index)|3|2|H$|Compute input for sql statement|{0|}}
{30001002|XXparameter|operation6.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation5_analysis|integer(4) out_length[n]::length(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation6_analysis|statement_input ? statement_input::compute_statement_input(in, integer(4) index) :COPY statement_input::compute_statement_input(in)|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 78 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|sql_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,unused,log::document(in,sql)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: unused = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: sql = "string('\\\\n')"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|2|FHK$|@{0|}}
}}@0|Update Table|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|28|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|29|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|30|0|69|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|31|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|33|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010202004|XXGiport|34|0|81|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|sql|0.0|@@@1680|0|}}
{2010203004|XXGoport|35|0|85|0|{@{}@0|0|0|0|out0|.7440878378378378|@@@13328|0|}}
{2010202004|XXGiport|36|0|88|0|{@{}@0|0|0|0|in0|.2296718972895863|@@@13840|0|}}
{2010110002|XXGconstant|37|0|91|0|{@{}@{1|483837|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_10|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_5|}1|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{Load_Ready_File|}1|9|}
{2010211001|XXGvertex_iport_iport|9|0|18|0|{0|write|}9|10|}
{2010214001|XXGiport_src_flow|10|0|20|0|{0|}10|7|}
{2010007001|XXGobject_proto_object|11|0|21|0|{}9|11|}
{2010211001|XXGvertex_iport_iport|12|0|23|0|{0|write|}11|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|write_metadata|1|0|}12|11|}
{2010601001|XXGgraph_vertex_vertex|14|0|26|0|{REPL|}1|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|16|0|30|0|{0|}14|7|}
{2010213001|XXGoport_dst_flow|17|0|31|0|{1|}14|8|}
{2010211001|XXGvertex_iport_iport|18|0|32|0|{0|in|}13|15|}
{2010007001|XXGobject_proto_object|19|0|34|0|{}13|16|}
{2010212001|XXGvertex_oport_oport|20|0|36|0|{0|out|}16|17|}
{2010006001|XXGobject_psameas_object|21|0|38|0|{metadata|out_metadata|1|0|}17|16|}
{2010211001|XXGvertex_iport_iport|22|0|39|0|{0|in|}16|18|}
{2010006001|XXGobject_psameas_object|23|0|41|0|{metadata|in_metadata|1|0|}18|16|}
{2010006001|XXGobject_psameas_object|24|0|42|0|{Layout|Layout|0|0|}13|9|}
{2010601001|XXGgraph_vertex_vertex|25|0|43|0|{Update_Table|}1|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{0|out|}19|20|}
{2010212001|XXGvertex_oport_oport|27|0|47|0|{1|reject|}19|21|}
{2010212001|XXGvertex_oport_oport|28|0|49|0|{2|error|}19|22|}
{2010212001|XXGvertex_oport_oport|29|0|51|0|{3|unused|}19|23|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{4|log|}19|24|}
{2010211001|XXGvertex_iport_iport|31|0|55|0|{0|in|}19|25|}
{2010214001|XXGiport_src_flow|32|0|57|0|{0|}25|8|}
{2010211001|XXGvertex_iport_iport|33|0|58|0|{1|sql|}19|26|}
{2010007001|XXGobject_proto_object|34|0|60|0|{}19|27|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{0|out|}27|28|}
{2010006001|XXGobject_psameas_object|36|0|64|0|{metadata|out_metadata|1|0|}28|27|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{1|reject|}27|29|}
{2010006001|XXGobject_psameas_object|38|0|67|0|{metadata|reject_metadata|1|0|}29|27|}
{2010212001|XXGvertex_oport_oport|39|0|68|0|{2|error|}27|30|}
{2010006001|XXGobject_psameas_object|40|0|70|0|{metadata|error_metadata|1|0|}30|27|}
{2010212001|XXGvertex_oport_oport|41|0|71|0|{3|unused|}27|31|}
{2010006001|XXGobject_psameas_object|42|0|73|0|{metadata|unused_metadata|1|0|}31|27|}
{2010212001|XXGvertex_oport_oport|43|0|74|0|{4|log|}27|32|}
{2010006001|XXGobject_psameas_object|44|0|76|0|{metadata|log_metadata|1|0|}32|27|}
{2010211001|XXGvertex_iport_iport|45|0|77|0|{0|in|}27|33|}
{2010006001|XXGobject_psameas_object|46|0|79|0|{metadata|in_metadata|1|0|}33|27|}
{2010211001|XXGvertex_iport_iport|47|0|80|0|{1|sql|}27|34|}
{2010006001|XXGobject_psameas_object|48|0|82|0|{metadata|sql_metadata|1|0|}34|27|}
{2010006001|XXGobject_psameas_object|49|0|83|0|{Layout|Layout|0|0|}19|9|}
{2010212001|XXGvertex_oport_oport|50|0|84|0|{0|out0|}1|35|}
{2010216002|XXGoport_binding_oport|51|0|86|0|{.5|.5|{0|}13434|}35|24|}
{2010211001|XXGvertex_iport_iport|52|0|87|0|{0|in0|}1|36|}
{2010215002|XXGiport_binding_iport|53|0|89|0|{.5|.5|{0|}13431|}36|15|}
{2010109001|XXGobject_property_value|54|0|90|0|{0|TrackingThumbprint|72|}1|37|}
