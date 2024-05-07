@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|17|rel_count|22|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PROTOCOL|ftp|3|9|FK|@{0|}}
{30001002|XXparameter|FTP_HOST|AI_PHASE|3|10|RFKd|The FTP host.  Using a PUB_FTP project parameter such as $PUB_FTP_HEALTHEXTRAS_HOST_NAME will make the process dynamic for dev, test, prod, etc.|{0|}}
{30001002|XXparameter|FTP_USER|AI_PHASE|3|10|RFKd|The FTP user name|{0|}}
{30001002|XXparameter|FTP_EPW|AI_PHASE|3|10|RFKd|The FTP encrypted password|{0|}}
{30001002|XXparameter|FTP_FILE||3|2|RFK$|The local filename on disk to be FTPed|{0|}}
{30001002|XXparameter|FTP_FILE_EME|$FTP_FILE|3|9|RFK|The EME name for the local filename on disk to be FTPed.  Use for Dependency Analysis if the local filename has embedded dates/times.|{0|}}
{30001002|XXparameter|FTP_REMOTE_FILE||3|2|RFK$|The remote file that should be created on the FTP_HOST including the directory name|{0|}}
{30001002|XXparameter|FTP_OPTIONS||3|2|FK$|site-specific FTP commands as arguments|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.4.1|3|9|P|@{0|}}
{30001002|XXparameter|FTP_HOST:dev||3|2|$|@{0|}}
{30001002|XXparameter|FTP_HOST:qa||3|2|$|@{0|}}
{30001002|XXparameter|FTP_HOST:uat||3|2|$|@{0|}}
{30001002|XXparameter|FTP_HOST:prod||3|2|$|@{0|}}
{30001002|XXparameter|FTP_USER:dev||3|2|$|@{0|}}
{30001002|XXparameter|FTP_USER:qa||3|2|$|@{0|}}
{30001002|XXparameter|FTP_USER:uat||3|2|$|@{0|}}
{30001002|XXparameter|FTP_USER:prod||3|2|$|@{0|}}
{30001002|XXparameter|FTP_EPW:dev||3|2|$|@{0|}}
{30001002|XXparameter|FTP_EPW:qa||3|2|$|@{0|}}
{30001002|XXparameter|FTP_EPW:uat||3|2|$|@{0|}}
{30001002|XXparameter|FTP_EPW:prod||3|2|$|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|put.ftp.file|manav.jindal|@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|808000|344000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.3|{1|1|}@|||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@EGV-DEV-3.2.4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}2|17|}}
{2010501005|XXGpvertex|6|0|11|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/FTP/FTP_To.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|rhost|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|rfile|$FTP_REMOTE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|epw|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|options|$FTP_OPTIONS|3|2|$|@{0|}}
}}@0|@422000|176000|0|0|0|0|3|FTP To|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|7|0|13|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|8|0|15|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|9|0|18|0|{Transfers files of data records to a computer not running the Co>Operating® System.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|ftp-to|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/xxftp|3|2|H$||{0|}}
{30001002|XXparameter|log_port_version|2.12.2.m2:|3|2|H$|Version that log port became available|{0|}}
{30001002|XXparameter|log_port_version.display_name|log-port-version|3|9|P|@{0|}}
{30001002|XXparameter|rhost||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|rfile||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|type|-binary|15|1|RFOl|type of file transfer, use -ascii or -binary|{2|-binary|-ascii|}}
{30001002|XXparameter|user||3|2|FK$|Remote user name|{0|}}
{30001002|XXparameter|pw||3|2|FK$|Remote password|{0|}}
{30001002|XXparameter|epw||3|2|FK$|Encrypted remote password|{0|}}
{30001002|XXparameter|epw.condition|version 2.14.47:|3|15|P?|@{0|}}
{30001002|XXparameter|acct||3|2|FK$|Remote account password|{0|}}
{30001002|XXparameter|appremote|False|13|1|FKl|Append to (rather than create) remote file|{0|}}
{30001002|XXparameter|storeunique|False|13|1|FKl|Create remote file with a uniquely suffixed name|{0|}}
{30001002|XXparameter|storeunique.condition|version 2.13.1.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|deletefirst|False|13|1|FKl|Delete remote file if it exists before beginning transfer|{0|}}
{30001002|XXparameter|deletefirst.condition|version 2.12.2.m2:|3|15|P?|@{0|}}
{30001002|XXparameter|temprfile||3|2|FK$|Remote temporary file name|{0|}}
{30001002|XXparameter|temprfile.condition|version 2.13.1.m2:|3|15|P?|@{0|}}
{30001002|XXparameter|create_if_empty|True|13|1|Fl|Create remote file even if no data is transferred|{0|}}
{30001002|XXparameter|create_if_empty.condition|version 2.13.1.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|dontputempty|value create_if_empty False True value create_if_empty True False default constant False|13|13|Kv|Don't create remote file if no data is available|{0|}}
{30001002|XXparameter|tolerate_error_codes||3|2|FK$|Error codes which component should tolerate|{0|}}
{30001002|XXparameter|tolerate_error_codes.display_name|tolerate-error-codes|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_error_codes.keyword|tolerate-error-codes|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_error_codes.condition|version 2.13.1.m2:|3|15|P?|@{0|}}
{30001002|XXparameter|passive|False|13|1|FKl|Connect to FTP server in passive mode|{0|}}
{30001002|XXparameter|passive.condition|version 2.14.75:|3|15|P?|@{0|}}
{30001002|XXparameter|port||1|2|FK$|FTP server port if non-default|{0|}}
{30001002|XXparameter|port.condition|version 2.14.75:|3|15|P?|@{0|}}
{30001002|XXparameter|retry_failures|False|13|1|FKl|Retry transfers that fail on startup|{0|}}
{30001002|XXparameter|retry_failures.display_name|retry-failures|3|9|P|@{0|}}
{30001002|XXparameter|retry_failures.keyword|retry-failures|3|9|P|@{0|}}
{30001002|XXparameter|retry_failures.condition|version 2.14.75:|3|15|P?|@{0|}}
{30001002|XXparameter|retry_count|0|1|2|FK$|Maximum number of times to retry failed transfers|{0|}}
{30001002|XXparameter|retry_count.display_name|retry-count|3|9|P|@{0|}}
{30001002|XXparameter|retry_count.keyword|retry-count|3|9|P|@{0|}}
{30001002|XXparameter|retry_count.condition|param retry-failures True version 2.14.75:|3|15|P?|@{0|}}
{30001002|XXparameter|retry_pause_secs|0|1|2|FK$|Seconds to pause between retries of failed transfers|{0|}}
{30001002|XXparameter|retry_pause_secs.display_name|retry-pause-secs|3|9|P|@{0|}}
{30001002|XXparameter|retry_pause_secs.keyword|retry-pause-secs|3|9|P|@{0|}}
{30001002|XXparameter|retry_pause_secs.condition|param retry-failures True version 2.14.75:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl|False|13|1|Fl|Use SSL/TLS to secure FTP|{0|}}
{30001002|XXparameter|ssl.condition|version 2.15.4.r31:|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_control_protection|explicit-ssl|15|1|FKl|Whether and how to protect the control channel (including login) with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_control_protection.display_name|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.keyword|ssl-control-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_control_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|ssl_data_protection|no-ssl|15|1|FKl|Whether and how to protect FTP data transfers with SSL/TLS|{3|no-ssl|explicit-ssl|implicit-ssl|}}
{30001002|XXparameter|ssl_data_protection.display_name|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.keyword|ssl-data-protection|3|9|P|@{0|}}
{30001002|XXparameter|ssl_data_protection.condition|param ssl True|3|15|P?|@{0|}}
{30001002|XXparameter|options||16|2|FO$|Additional component options|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|ftp runs serially|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158953|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|10|0|20|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|11|0|23|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|12|0|26|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FTP_FILE_EME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$FTP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|@174000|177000|0|0|0|0|1|Input File|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010203004|XXGoport|13|0|28|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|14|0|31|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|15|0|33|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|16|0|37|0|{@{}@{1|6532673|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010601001|XXGgraph_vertex_vertex|5|0|10|0|{FTP_To|}1|6|}
{2010212001|XXGvertex_oport_oport|6|0|12|0|{0|log|}6|7|}
{2010211001|XXGvertex_iport_iport|7|0|14|0|{0|in|}6|8|}
{2010214001|XXGiport_src_flow|8|0|16|0|{0|}8|5|}
{2010007001|XXGobject_proto_object|9|0|17|0|{}6|9|}
{2010212001|XXGvertex_oport_oport|10|0|19|0|{0|log|}9|10|}
{2010006001|XXGobject_psameas_object|11|0|21|0|{metadata|log_metadata|1|0|}10|9|}
{2010211001|XXGvertex_iport_iport|12|0|22|0|{0|in|}9|11|}
{2010006001|XXGobject_psameas_object|13|0|24|0|{metadata|in_metadata|1|0|}11|9|}
{2010601001|XXGgraph_vertex_vertex|14|0|25|0|{Input_File|}1|12|}
{2010212001|XXGvertex_oport_oport|15|0|27|0|{0|read|}12|13|}
{2010213001|XXGoport_dst_flow|16|0|29|0|{0|}13|5|}
{2010007001|XXGobject_proto_object|17|0|30|0|{}12|14|}
{2010212001|XXGvertex_oport_oport|18|0|32|0|{0|read|}14|15|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{metadata|read_metadata|1|0|}15|14|}
{2010006001|XXGobject_psameas_object|20|0|35|0|{read_metadata|in_metadata|0|0|}12|6|}
{2010109001|XXGobject_property_value|21|0|36|0|{0|TrackingThumbprint|72|}1|16|}
