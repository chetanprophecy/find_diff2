@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|17|rel_count|23|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|FTP_HOST||3|2|RFK$||{0|}}
{30001002|XXparameter|FTP_USER||3|2|RFK$||{0|}}
{30001002|XXparameter|FTP_EPW||3|2|RFK$||{0|}}
{30001002|XXparameter|SFTP_EXTRA_ARGS||3|2|FK$||{0|}}
{30001002|XXparameter|FTP_RFILE||3|2|RFK$||{0|}}
{30001002|XXparameter|LOGICAL_FILENAME||3|2|RFK$||{0|}}
{30001002|XXparameter|SEQUENCE||3|2|RFK$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_FTP_from|@34|9|FHK|@{0|}}
{30001002|XXparameter|_parameters_of_Output_File|@34|9|FHK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP|3|2|RFK$||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.1.7.7|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|580000|204000|0|get.ftp.file|davidmiller||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|579000|203000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.7.3|{1|1|}Job 'get.ftp.file' Execution Status Report

Compilation of graph "get.ftp.file" started at Wednesday, February 22, 2012 17:18:16
||||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@QA 3.1.7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{8|225000|169000|245000|169000|481000|169000|502000|169000|}4784|17|}}
{2010501005|XXGpvertex|6|0|11|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|rhost|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|rfile|$FTP_RFILE|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|epw|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/FTP/FTP_From.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@95000|121000|115000|141000|100000|60000|4783|FTP from|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|7|0|13|0|{@{}@214000|164000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|8|0|16|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|9|0|18|0|{Transfers files of data records from a computer not running the Co>Operating® System.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|ftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|xxftp|3|2|H$||{0|}}
{30001002|XXparameter|log_port_version|2.12.2.m2:|3|2|H$|Version that log port became available|{0|}}
{30001002|XXparameter|log_port_version.display_name|log-port-version|3|9|P|@{0|}}
{30001002|XXparameter|rhost||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|rfile||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|type|-binary|15|1|RFOl|Type of file transfer, use -ascii or -binary|{2|-binary|-ascii|}}
{30001002|XXparameter|user||3|2|FK$|Remote username|{0|}}
{30001002|XXparameter|pw||3|2|FK$|Remote password|{0|}}
{30001002|XXparameter|epw||3|2|FK$|Encrypted remote password|{0|}}
{30001002|XXparameter|epw.condition|version 2.14.47:|3|15|P?|@{0|}}
{30001002|XXparameter|acct||3|2|FK$|Remote account password|{0|}}
{30001002|XXparameter|tolerate_error_codes||3|2|FK$|Error codes which component should tolerate|{0|}}
{30001002|XXparameter|tolerate_error_codes.display_name|tolerate-error-codes|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_error_codes.keyword|tolerate-error-codes|3|9|P|@{0|}}
{30001002|XXparameter|tolerate_error_codes.condition|version 2.13.1.m2:|3|15|P?|@{0|}}
{30001002|XXparameter|passive|True|13|1|FKl|Connect to FTP server in passive mode|{0|}}
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
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1314655964|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|Layout|file:.|9|2|Fs$|ftp runs serially|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|10|0|20|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|11|0|23|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|12|0|26|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$WORKDIR/get.ftp_file.$LOGICAL_FILENAME.$SEQUENCE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/get.ftp_file.$LOGICAL_FILENAME.$SEQUENCE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|123000|513000|143000|56000|50000|4785|Output File|Ab Initio Software||1|10|0||6||32769|-1|-1|}}
{2010202004|XXGiport|13|0|28|0|{@{}@503000|164000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|14|0|31|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1314655956|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|15|0|33|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010110002|XXGconstant|16|0|38|0|{@{}@{1|3479835|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010601001|XXGgraph_vertex_vertex|5|0|10|0|{FTP_from|}1|6|}
{2010212001|XXGvertex_oport_oport|6|0|12|0|{0|out|}6|7|}
{2010213001|XXGoport_dst_flow|7|0|14|0|{0|}7|5|}
{2010212001|XXGvertex_oport_oport|8|0|15|0|{1|log|}6|8|}
{2010007001|XXGobject_proto_object|9|0|17|0|{}6|9|}
{2010212001|XXGvertex_oport_oport|10|0|19|0|{0|out|}9|10|}
{2010006001|XXGobject_psameas_object|11|0|21|0|{metadata|out_metadata|1|0|}10|9|}
{2010212001|XXGvertex_oport_oport|12|0|22|0|{1|log|}9|11|}
{2010006001|XXGobject_psameas_object|13|0|24|0|{metadata|log_metadata|1|0|}11|9|}
{2010006001|XXGobject_psameas_object|14|0|25|0|{Layout|Layout|0|0|}6|12|}
{2010211001|XXGvertex_iport_iport|15|0|27|0|{0|write|}12|13|}
{2010214001|XXGiport_src_flow|16|0|29|0|{0|}13|5|}
{2010007001|XXGobject_proto_object|17|0|30|0|{}12|14|}
{2010211001|XXGvertex_iport_iport|18|0|32|0|{0|write|}14|15|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{metadata|write_metadata|1|0|}15|14|}
{2010006001|XXGobject_psameas_object|20|0|35|0|{write_metadata|out_metadata|0|0|}12|6|}
{2010601001|XXGgraph_vertex_vertex|21|0|36|0|{Output_File|}1|12|}
{2010109001|XXGobject_property_value|22|0|37|0|{0|TrackingThumbprint|72|}1|16|}
