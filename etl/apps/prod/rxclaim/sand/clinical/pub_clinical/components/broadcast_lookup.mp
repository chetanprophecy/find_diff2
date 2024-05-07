@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|32|rel_count|47|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{Subgraph created from graph "test"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LKUP_NM|$LKUP_NM|3|9|RFK|@{0|}}
{30001002|XXparameter|SERIAL_LOOKUP_DIR|$PUB_CLINICAL_SERIAL_LOOKUP|26|9|RFK|@{0|}}
{30001002|XXparameter|MFS_LOOKUP_DIR|$PUB_CLINICAL_MFS_LOOKUP|41|9|RFK|@{0|}}
{30001002|XXparameter|LOOKUP_FILENAME|$LKUP_NM.dat|3|9|RFK|@{0|}}
{30001002|XXparameter|WRITE_SERIAL_LOOKUP|True|13|9|RFK||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
}}@0|@555000|310500|0|0|0|0|251|Broadcast Lookup Index|Paul Thompson|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|718000|636000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'broadcast_lookup' Execution Status Report

Job completed successfully at Wednesday, November 02, 2016 17:26:54
Run performed by user Paul Thompson
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apsrs4064 [3.2]||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Courier New|8421376|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Project & Title    : pub_clinical -> components -> Broadcast Lookup
Initial Developers : Paul Thompson
Date Created       : November 1, 2016

Input Parameters   :
  LKUP_NM             = Lookup Name
  SERIAL_LOOKUP_DIR   = Serial directory to write lookup index into
  MFS_LOOKUP_DIR      = MFS directory to write lookup index into
  LOOKUP_FILENAME     = Lookup filename (defaults the $LKUP_NM.dat)
  WRITE_SERIAL_LOOKUP = Should we write the lookup into the Serial node as well?

Description :

Broadcasts the lookup to the MFS nodes. Also, if WRITE_SERIAL_LOOKUP is True,
then also write it to the Serial node. Only set WRITE_SERIAL_LOOKUP to False
if the file is already available in the serial node.|28000|360000|0|0|0|0|8132|}}
{2010242002|XXGface|6|0|11|0|{@{}@Courier New|8421376|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.6617646813392639|{0|}8138|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.6617646813392639|{0|}8127|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.6617646813392639|{0|}8140|18|}}
{2010501005|XXGpvertex|10|0|19|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|330000|278000|0|0|0|0|8128|Broadcast Lookup to Parallel Nodes|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|11|0|21|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|12|0|24|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|13|0|27|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|14|0|29|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|15|0|32|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|16|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|out_metadata||3|1|sl|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
}}@0|Replicate|131000|103000|0|0|0|0|8124|Replicate Lookup|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|17|0|37|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|18|0|41|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|19|0|43|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|20|0|45|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|21|0|48|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|22|0|52|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$MFS_LOOKUP_DIR/$LOOKUP_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|271000|0|0|0|0|8141|Parallel Node Lookups|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|23|0|54|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|24|0|57|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|25|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|26|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$SERIAL_LOOKUP_DIR/$LOOKUP_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|8|=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@0|@516000|87000|0|0|0|0|8139|Serial Node Lookup|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|27|0|65|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|28|0|68|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|29|0|70|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|30|0|74|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010110002|XXGconstant|31|0|77|0|{@{}@{1|6811141|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_10|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_11|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_12|}1|9|}
{2010601001|XXGgraph_vertex_vertex|9|0|18|0|{Broadcast_Lookup_to_Parallel_Nodes|}1|10|}
{2010212001|XXGvertex_oport_oport|10|0|20|0|{0|out|}10|11|}
{2010213001|XXGoport_dst_flow|11|0|22|0|{0|}11|9|}
{2010211001|XXGvertex_iport_iport|12|0|23|0|{0|in|}10|12|}
{2010214001|XXGiport_src_flow|13|0|25|0|{0|}12|8|}
{2010007001|XXGobject_proto_object|14|0|26|0|{}10|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{0|out|}13|14|}
{2010006001|XXGobject_psameas_object|16|0|30|0|{metadata|out_metadata|1|0|}14|13|}
{2010211001|XXGvertex_iport_iport|17|0|31|0|{0|in|}13|15|}
{2010006001|XXGobject_psameas_object|18|0|33|0|{metadata|in_metadata|1|0|}15|13|}
{2010006001|XXGobject_psameas_object|19|0|34|0|{Layout|Layout|0|0|}10|16|}
{2010212001|XXGvertex_oport_oport|20|0|36|0|{0|out|}16|17|}
{2010213001|XXGoport_dst_flow|21|0|38|0|{0|}17|7|}
{2010213001|XXGoport_dst_flow|22|0|39|0|{1|}17|8|}
{2010211001|XXGvertex_iport_iport|23|0|40|0|{0|in|}16|18|}
{2010007001|XXGobject_proto_object|24|0|42|0|{}16|19|}
{2010212001|XXGvertex_oport_oport|25|0|44|0|{0|out|}19|20|}
{2010006001|XXGobject_psameas_object|26|0|46|0|{metadata|out_metadata|1|0|}20|19|}
{2010211001|XXGvertex_iport_iport|27|0|47|0|{0|in|}19|21|}
{2010006001|XXGobject_psameas_object|28|0|49|0|{metadata|in_metadata|1|0|}21|19|}
{2010006001|XXGobject_psameas_object|29|0|50|0|{condition|WRITE_SERIAL_LOOKUP|1|0|}16|1|}
{2010601001|XXGgraph_vertex_vertex|30|0|51|0|{Parallel_Node_Lookups|}1|22|}
{2010211001|XXGvertex_iport_iport|31|0|53|0|{0|write|}22|23|}
{2010214001|XXGiport_src_flow|32|0|55|0|{0|}23|9|}
{2010007001|XXGobject_proto_object|33|0|56|0|{}22|24|}
{2010211001|XXGvertex_iport_iport|34|0|58|0|{0|write|}24|25|}
{2010006001|XXGobject_psameas_object|35|0|60|0|{metadata|write_metadata|1|0|}25|24|}
{2010601001|XXGgraph_vertex_vertex|36|0|61|0|{Replicate_Lookup|}1|16|}
{2010601001|XXGgraph_vertex_vertex|37|0|62|0|{Serial_Node_Lookup|}1|26|}
{2010211001|XXGvertex_iport_iport|38|0|64|0|{0|write|}26|27|}
{2010214001|XXGiport_src_flow|39|0|66|0|{0|}27|7|}
{2010007001|XXGobject_proto_object|40|0|67|0|{}26|28|}
{2010211001|XXGvertex_iport_iport|41|0|69|0|{0|write|}28|29|}
{2010006001|XXGobject_psameas_object|42|0|71|0|{metadata|write_metadata|1|0|}29|28|}
{2010006001|XXGobject_psameas_object|43|0|72|0|{condition|WRITE_SERIAL_LOOKUP|1|0|}26|1|}
{2010211001|XXGvertex_iport_iport|44|0|73|0|{0|in0|}1|30|}
{2010215002|XXGiport_binding_iport|45|0|75|0|{.5|.5|{0|}8133|}30|18|}
{2010109001|XXGobject_property_value|46|0|76|0|{0|TrackingThumbprint|72|}1|31|}
