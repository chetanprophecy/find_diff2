@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|17|rel_count|22|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|FTP_HOST||3|2|RFK$||{0|}}
{30001002|XXparameter|FTP_USER||3|2|RFK$||{0|}}
{30001002|XXparameter|FTP_EPW||3|2|RFK$||{0|}}
{30001002|XXparameter|SFTP_EXTRA_ARGS||3|2|FK$||{0|}}
{30001002|XXparameter|FTP_RFILE||3|2|RFK$||{0|}}
{30001002|XXparameter|LOGICAL_FILENAME||3|2|RFK$||{0|}}
{30001002|XXparameter|SEQUENCE||3|2|RFK$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_parameters_of_Output_File|@34|9|FHK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|WORKDIR|$AI_SERIAL_TEMP|3|2|RFK$||{0|}}
{30001002|XXparameter|_parameters_of_SFTP_From|@34|9|FHK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.1.7.7|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|580000|210000|0|get.sftp.file|davidmiller||1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|579000|210000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.1.7.3|{1|1|}Job 'get.ftp.file' Execution Status Report

Compilation of graph "get.ftp.file" started at Wednesday, February 22, 2012 17:18:16
||||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@QA 3.1.7||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{8|214000|179000|234000|179000|481000|179000|502000|179000|}4786|17|}}
{2010503005|XXGfvertex|6|0|11|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$WORKDIR/get.ftp_file.$LOGICAL_FILENAME.$SEQUENCE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$WORKDIR/get.ftp_file.$LOGICAL_FILENAME.$SEQUENCE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|133000|513000|153000|56000|50000|4785|Output File|Ab Initio Software||1|10|0||6||32769|-1|-1|}}
{2010202004|XXGiport|7|0|13|0|{@{}@503000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|8|0|16|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|9|0|18|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|10|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|source_file|$FTP_RFILE|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$SFTP_EXTRA_ARGS|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_From.mpc|3|2|Pf$|@{0|}}
}}@0|@84000|130000|104000|150000|100000|60000|4788|SFTP From|Ab Initio Software|Built-in 2.13.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|11|0|23|0|{@{}@203000|174000|11000|11000|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|12|0|26|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|13|0|28|0|{Transfers files of data records from a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-from|3|1|Hl||{0|}}
{30001002|XXparameter|image__|ab_sftp|3|2|H$||{0|}}
{30001002|XXparameter|host||3|2|RFK$|Remote host name|{0|}}
{30001002|XXparameter|source_file||3|2|RFK$|Remote file name|{0|}}
{30001002|XXparameter|source_file.display_name|source-file|3|9|P|@{0|}}
{30001002|XXparameter|source_file.keyword|source-file|3|9|P|@{0|}}
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
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1332537024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|30|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2464|0|}}
{2010203004|XXGoport|15|0|33|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010110002|XXGconstant|16|0|37|0|{@{}@{1|3481483|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010601001|XXGgraph_vertex_vertex|5|0|10|0|{Output_File|}1|6|}
{2010211001|XXGvertex_iport_iport|6|0|12|0|{0|write|}6|7|}
{2010214001|XXGiport_src_flow|7|0|14|0|{0|}7|5|}
{2010007001|XXGobject_proto_object|8|0|15|0|{}6|8|}
{2010211001|XXGvertex_iport_iport|9|0|17|0|{0|write|}8|9|}
{2010006001|XXGobject_psameas_object|10|0|19|0|{metadata|write_metadata|1|0|}9|8|}
{2010006001|XXGobject_psameas_object|11|0|20|0|{write_metadata|out_metadata|0|0|}6|10|}
{2010212001|XXGvertex_oport_oport|12|0|22|0|{0|out|}10|11|}
{2010213001|XXGoport_dst_flow|13|0|24|0|{0|}11|5|}
{2010212001|XXGvertex_oport_oport|14|0|25|0|{1|log|}10|12|}
{2010007001|XXGobject_proto_object|15|0|27|0|{}10|13|}
{2010212001|XXGvertex_oport_oport|16|0|29|0|{0|out|}13|14|}
{2010006001|XXGobject_psameas_object|17|0|31|0|{metadata|out_metadata|1|0|}14|13|}
{2010212001|XXGvertex_oport_oport|18|0|32|0|{1|log|}13|15|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{metadata|log_metadata|1|0|}15|13|}
{2010601001|XXGgraph_vertex_vertex|20|0|35|0|{SFTP_From|}1|10|}
{2010109001|XXGobject_property_value|21|0|36|0|{0|TrackingThumbprint|72|}1|16|}
