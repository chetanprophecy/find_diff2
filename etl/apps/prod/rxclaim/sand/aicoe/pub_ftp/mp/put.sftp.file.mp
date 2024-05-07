@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|17|rel_count|24|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PROTOCOL|sftp|3|9|FK|@{0|}}
{30001002|XXparameter|FTP_HOST|@3|9|FK|@{0|}}
{30001002|XXparameter|FTP_USER|@3|9|FK|@{0|}}
{30001002|XXparameter|FTP_EPW|@3|9|FK|@{0|}}
{30001002|XXparameter|FTP_FILE||3|2|RFK$|The local filename on disk to be FTPed|{0|}}
{30001002|XXparameter|FTP_FILE_EME||3|9|RFK|The EME name for the local filename on disk to be FTPed.  Use for Dependency Analysis if the local filename has embedded dates/times.|{0|}}
{30001002|XXparameter|FTP_REMOTE_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|FTP_OPTIONS||3|2|FK$|site-specific FTP commands as arguments|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|SFTP_PASSPHRASE_OPTION|unspecified|15|1|Fl|Does ssh require a password or passphrase|{3|unspecified|need passphrase|no passphrase|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
}}@0|@0|0|0|0|0|0|0|put.sftp.file|manav.jindal|@1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|808000|344000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'put.sftp.file' Execution Status Report


Job "put.sftp.file" Execution started at Monday, March 07, 2016 04:38:33
***** Job execution failed at Monday, March 07, 2016 04:38:42 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:08
Run performed by user manav.jindal
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 0 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}11|17|}}
{2010503005|XXGfvertex|6|0|11|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FTP_FILE_EME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$FTP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|@174000|177000|0|0|0|0|10|Input File|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010203004|XXGoport|7|0|13|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|8|0|16|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|9|0|18|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|10|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Internet/SFTP/SFTP_To.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|host|$FTP_HOST|3|2|$|@{0|}}
{30001002|XXparameter|target_file|$FTP_REMOTE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|user|$FTP_USER|3|2|$|@{0|}}
{30001002|XXparameter|extra_args|$FTP_OPTIONS|3|2|$|@{0|}}
{30001002|XXparameter|sftp_script|$PUB_FTP_BIN/sftp-put.script|3|2|$|@{0|}}
{30001002|XXparameter|encrypted_passphrase|$FTP_EPW|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|passphrase_required||3|8|=|@{0|}}
}}@0|@453000|173000|0|0|0|0|12|SFTP To|Ab Initio Software|Built-in 2.13.1:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|11|0|23|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|12|0|25|0|{@{}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010501005|XXGpvertex|13|0|28|0|{Transfers files of data records to a computer not running the Co>Operating® System using sftp.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sftp-to|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|30|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|15|0|33|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1952|0|}}
{2010110002|XXGconstant|16|0|39|0|{@{}@{1|2182892|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010601001|XXGgraph_vertex_vertex|5|0|10|0|{Input_File|}1|6|}
{2010212001|XXGvertex_oport_oport|6|0|12|0|{0|read|}6|7|}
{2010213001|XXGoport_dst_flow|7|0|14|0|{0|}7|5|}
{2010007001|XXGobject_proto_object|8|0|15|0|{}6|8|}
{2010212001|XXGvertex_oport_oport|9|0|17|0|{0|read|}8|9|}
{2010006001|XXGobject_psameas_object|10|0|19|0|{metadata|read_metadata|1|0|}9|8|}
{2010006001|XXGobject_psameas_object|11|0|20|0|{read_metadata|in_metadata|0|0|}6|10|}
{2010212001|XXGvertex_oport_oport|12|0|22|0|{0|log|}10|11|}
{2010211001|XXGvertex_iport_iport|13|0|24|0|{0|in|}10|12|}
{2010214001|XXGiport_src_flow|14|0|26|0|{0|}12|5|}
{2010007001|XXGobject_proto_object|15|0|27|0|{}10|13|}
{2010212001|XXGvertex_oport_oport|16|0|29|0|{0|log|}13|14|}
{2010006001|XXGobject_psameas_object|17|0|31|0|{metadata|log_metadata|1|0|}14|13|}
{2010211001|XXGvertex_iport_iport|18|0|32|0|{0|in|}13|15|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{metadata|in_metadata|1|0|}15|13|}
{2010006001|XXGobject_psameas_object|20|0|35|0|{Layout|Layout|0|0|}10|6|}
{2010006001|XXGobject_psameas_object|21|0|36|0|{passphrase_required|SFTP_PASSPHRASE_OPTION|1|0|}10|1|}
{2010601001|XXGgraph_vertex_vertex|22|0|37|0|{SFTP_To|}1|10|}
{2010109001|XXGobject_property_value|23|0|38|0|{0|TrackingThumbprint|72|}1|16|}
