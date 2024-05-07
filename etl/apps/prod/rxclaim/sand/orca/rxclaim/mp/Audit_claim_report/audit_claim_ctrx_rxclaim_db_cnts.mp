@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|22|rel_count|31|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|Audit_claim_rxclaim_db_cnts|ndeotars|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|493000|228000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'Audit_claim_ctrx_rxclaim_db_cnts' Execution Status Report


Job "Audit_claim_ctrx_rxclaim_db_cnts" Execution started at Monday, May 29, 2017 03:28:13
Job completed successfully at Monday, May 29, 2017 03:28:42

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:29
Run performed by user ndeotars
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 3 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5333333611488342|{0|}7704|17|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}7706|17|}}
{2010503005|XXGfvertex|7|0|13|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/ctrx_rxclaim_db_cnts.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/ctrx_rxclaim_db_cnts.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@400000|122500|0|0|0|0|7705|LCTRX-Rxclaim DB cnts|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|8|0|15|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|9|0|18|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|10|0|20|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|11|0|23|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
string("\\x01\|\\x01") src;
string("\\x01\|\\x01") system;
string("\\x01\|\\x01") schema;
string("\\x01\|\\x01") table;
string("\\x01\|\\x01") datesbm;
decimal("\\x01\\n") cnt;
end|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Run Program|214000|81000|0|0|0|0|7693|Run Program- m_db executes|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|12|0|25|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|13|0|28|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|14|0|31|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|15|0|33|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|16|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010503005|XXGfvertex|17|0|39|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|string("\\n")|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/ctrx_audit_claim_conf.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/ctrx_audit_claim_conf.dat|3|2|$|@{0|}}
}}@0|@87000|125500|0|0|0|0|7707|Rxclaim DB conf|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|18|0|41|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|19|0|44|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|20|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|21|0|51|0|{@{}@{1|4654291|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_13|}1|6|}
{2010601001|XXGgraph_vertex_vertex|6|0|12|0|{LCTRX_Rxclaim_DB_cnts|}1|7|}
{2010211001|XXGvertex_iport_iport|7|0|14|0|{0|write|}7|8|}
{2010214001|XXGiport_src_flow|8|0|16|0|{0|}8|5|}
{2010007001|XXGobject_proto_object|9|0|17|0|{}7|9|}
{2010211001|XXGvertex_iport_iport|10|0|19|0|{0|write|}9|10|}
{2010006001|XXGobject_psameas_object|11|0|21|0|{metadata|write_metadata|1|0|}10|9|}
{2010006001|XXGobject_psameas_object|12|0|22|0|{write_metadata|out_metadata|0|0|}7|11|}
{2010212001|XXGvertex_oport_oport|13|0|24|0|{0|out|}11|12|}
{2010213001|XXGoport_dst_flow|14|0|26|0|{0|}12|5|}
{2010211001|XXGvertex_iport_iport|15|0|27|0|{0|in|}11|13|}
{2010214001|XXGiport_src_flow|16|0|29|0|{0|}13|6|}
{2010007001|XXGobject_proto_object|17|0|30|0|{}11|14|}
{2010212001|XXGvertex_oport_oport|18|0|32|0|{0|out|}14|15|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{metadata|out_metadata|1|0|}15|14|}
{2010211001|XXGvertex_iport_iport|20|0|35|0|{0|in|}14|16|}
{2010006001|XXGobject_psameas_object|21|0|37|0|{metadata|in_metadata|1|0|}16|14|}
{2010006001|XXGobject_psameas_object|22|0|38|0|{in_metadata|read_metadata|0|0|}11|17|}
{2010212001|XXGvertex_oport_oport|23|0|40|0|{0|read|}17|18|}
{2010213001|XXGoport_dst_flow|24|0|42|0|{0|}18|6|}
{2010007001|XXGobject_proto_object|25|0|43|0|{}17|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{0|read|}19|20|}
{2010006001|XXGobject_psameas_object|27|0|47|0|{metadata|read_metadata|1|0|}20|19|}
{2010601001|XXGgraph_vertex_vertex|28|0|48|0|{Run_Program_m_db_executes|}1|11|}
{2010601001|XXGgraph_vertex_vertex|29|0|49|0|{Rxclaim_DB_conf|}1|17|}
{2010109001|XXGobject_property_value|30|0|50|0|{0|TrackingThumbprint|72|}1|21|}
