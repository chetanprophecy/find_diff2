@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|8|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|54|rel_count|94|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|RUN_ID|20200913025103|3|9|RFK|@{0|}}
{30001002|XXparameter|UPDATE_FILE|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.update.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|f_claim_transaction_p90_update|bdigumar|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|963000|412000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'f_claim_transaction_p90_update' Execution Status Report

Job completed successfully at Monday, September 14, 2020 16:32:45
Run performed by user bdigumar
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}22|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}16|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}18|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}20|2065|}}
{2010501005|XXGpvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|490000|263000|0|0|0|0|3|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|10|0|19|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|11|0|22|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|12|0|26|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|13|0|28|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|14|0|31|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|15|0|34|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$UPDATE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$UPDATE_FILE|3|2|$|@{0|}}
}}@0|Input File|312000|342000|0|0|0|0|17|Today update file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|16|0|36|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|17|0|39|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|18|0|41|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|19|0|44|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.update.20200910075504.dat.gz_bkp_ctrx_need_to_load_to_db", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS/event/ids_rxclaim/rxclaim.f_claim_transaction_p90.f_claim_transaction_p90.update.20200910075504.dat.gz_bkp_ctrx_need_to_load_to_db|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction_p90.dml|3|2|f$|@{0|}}
}}@0|Input File|302000|202000|0|0|0|0|23|old update file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|20|0|46|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|21|0|49|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|22|0|51|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|23|0|56|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$UPDATE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$UPDATE_FILE|3|2|$|@{0|}}
}}@1|Output File|872000|255000|0|0|0|0|21|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|24|0|58|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|25|0|61|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|26|0|63|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|27|0|67|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Deprecated/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@621000|225000|0|0|481000|303000|19|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|28|0|69|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|29|0|71|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|30|0|73|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|31|0|76|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|32|0|80|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|33|0|82|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|34|0|84|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|35|0|89|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|36|0|93|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|37|0|97|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|38|0|99|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|39|0|101|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|40|0|103|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|41|0|106|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|108|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|43|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|44|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|118|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|120|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|47|0|122|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|125|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|49|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|50|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|51|0|136|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|52|0|139|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|53|0|146|0|{@{}@{1|8137558|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{Gather|}1|9|}
{2010212001|XXGvertex_oport_oport|9|0|18|0|{0|out|}9|10|}
{2010213001|XXGoport_dst_flow|10|0|20|0|{0|}10|7|}
{2010211001|XXGvertex_iport_iport|11|0|21|0|{0|in|}9|11|}
{2010214001|XXGiport_src_flow|12|0|23|0|{0|}11|5|}
{2010214001|XXGiport_src_flow|13|0|24|0|{1|}11|6|}
{2010007001|XXGobject_proto_object|14|0|25|0|{}9|12|}
{2010212001|XXGvertex_oport_oport|15|0|27|0|{0|out|}12|13|}
{2010006001|XXGobject_psameas_object|16|0|29|0|{metadata|out_metadata|1|0|}13|12|}
{2010211001|XXGvertex_iport_iport|17|0|30|0|{0|in|}12|14|}
{2010006001|XXGobject_psameas_object|18|0|32|0|{metadata|in_metadata|1|0|}14|12|}
{2010006001|XXGobject_psameas_object|19|0|33|0|{Layout|Layout|0|0|}9|15|}
{2010212001|XXGvertex_oport_oport|20|0|35|0|{0|read|}15|16|}
{2010213001|XXGoport_dst_flow|21|0|37|0|{0|}16|6|}
{2010007001|XXGobject_proto_object|22|0|38|0|{}15|17|}
{2010212001|XXGvertex_oport_oport|23|0|40|0|{0|read|}17|18|}
{2010006001|XXGobject_psameas_object|24|0|42|0|{metadata|read_metadata|1|0|}18|17|}
{2010006001|XXGobject_psameas_object|25|0|43|0|{read_metadata|read_metadata|0|0|}15|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{0|read|}19|20|}
{2010213001|XXGoport_dst_flow|27|0|47|0|{0|}20|5|}
{2010007001|XXGobject_proto_object|28|0|48|0|{}19|21|}
{2010212001|XXGvertex_oport_oport|29|0|50|0|{0|read|}21|22|}
{2010006001|XXGobject_psameas_object|30|0|52|0|{metadata|read_metadata|1|0|}22|21|}
{2010006001|XXGobject_psameas_object|31|0|53|0|{in_metadata|read_metadata|0|0|}9|19|}
{2010006001|XXGobject_psameas_object|32|0|54|0|{out_metadata|read_metadata|0|0|}9|19|}
{2010601001|XXGgraph_vertex_vertex|33|0|55|0|{Output_File|}1|23|}
{2010211001|XXGvertex_iport_iport|34|0|57|0|{0|write|}23|24|}
{2010214001|XXGiport_src_flow|35|0|59|0|{0|}24|8|}
{2010007001|XXGobject_proto_object|36|0|60|0|{}23|25|}
{2010211001|XXGvertex_iport_iport|37|0|62|0|{0|write|}25|26|}
{2010006001|XXGobject_psameas_object|38|0|64|0|{metadata|write_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|39|0|65|0|{write_metadata|read_metadata|0|0|}23|19|}
{2010601001|XXGgraph_vertex_vertex|40|0|66|0|{Partition_by_Key_and_Sort|}1|27|}
{2010604001|XXGgraph_flow_flow|41|0|68|0|{Flow_1|}27|28|}
{2010601001|XXGgraph_vertex_vertex|42|0|70|0|{Partition_by_Key|}27|29|}
{2010212001|XXGvertex_oport_oport|43|0|72|0|{0|out|}29|30|}
{2010213001|XXGoport_dst_flow|44|0|74|0|{0|}30|28|}
{2010211001|XXGvertex_iport_iport|45|0|75|0|{0|in|}29|31|}
{2010006001|XXGobject_psameas_object|46|0|77|0|{in_metadata|read_metadata|0|0|}29|19|}
{2010006001|XXGobject_psameas_object|47|0|78|0|{out_metadata|read_metadata|0|0|}29|19|}
{2010601001|XXGgraph_vertex_vertex|48|0|79|0|{Sort|}27|32|}
{2010212001|XXGvertex_oport_oport|49|0|81|0|{0|out|}32|33|}
{2010211001|XXGvertex_iport_iport|50|0|83|0|{0|in|}32|34|}
{2010214001|XXGiport_src_flow|51|0|85|0|{0|}34|28|}
{2010006001|XXGobject_psameas_object|52|0|86|0|{in_metadata|read_metadata|0|0|}32|19|}
{2010006001|XXGobject_psameas_object|53|0|87|0|{out_metadata|read_metadata|0|0|}32|19|}
{2010212001|XXGvertex_oport_oport|54|0|88|0|{0|out0|}27|35|}
{2010216002|XXGoport_binding_oport|55|0|90|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}35|33|}
{2010213001|XXGoport_dst_flow|56|0|91|0|{0|}35|8|}
{2010211001|XXGvertex_iport_iport|57|0|92|0|{0|in0|}27|36|}
{2010215002|XXGiport_binding_iport|58|0|94|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}36|31|}
{2010214001|XXGiport_src_flow|59|0|95|0|{0|}36|7|}
{2010007001|XXGobject_proto_object|60|0|96|0|{}27|37|}
{2010604001|XXGgraph_flow_flow|61|0|98|0|{Flow_1|}37|38|}
{2010601001|XXGgraph_vertex_vertex|62|0|100|0|{Partition_by_Key|}37|39|}
{2010212001|XXGvertex_oport_oport|63|0|102|0|{0|out|}39|40|}
{2010213001|XXGoport_dst_flow|64|0|104|0|{0|}40|38|}
{2010211001|XXGvertex_iport_iport|65|0|105|0|{0|in|}39|41|}
{2010007001|XXGobject_proto_object|66|0|107|0|{}39|42|}
{2010212001|XXGvertex_oport_oport|67|0|109|0|{0|out|}42|43|}
{2010006001|XXGobject_psameas_object|68|0|111|0|{metadata|out_metadata|1|0|}43|42|}
{2010211001|XXGvertex_iport_iport|69|0|112|0|{0|in|}42|44|}
{2010006001|XXGobject_psameas_object|70|0|114|0|{metadata|in_metadata|1|0|}44|42|}
{2010006001|XXGobject_psameas_object|71|0|115|0|{Layout|InputLayout|1|0|}39|37|}
{2010006001|XXGobject_psameas_object|72|0|116|0|{key|Key|1|0|}39|37|}
{2010601001|XXGgraph_vertex_vertex|73|0|117|0|{Sort|}37|45|}
{2010212001|XXGvertex_oport_oport|74|0|119|0|{0|out|}45|46|}
{2010211001|XXGvertex_iport_iport|75|0|121|0|{0|in|}45|47|}
{2010214001|XXGiport_src_flow|76|0|123|0|{0|}47|38|}
{2010007001|XXGobject_proto_object|77|0|124|0|{}45|48|}
{2010212001|XXGvertex_oport_oport|78|0|126|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|79|0|128|0|{metadata|out_metadata|1|0|}49|48|}
{2010211001|XXGvertex_iport_iport|80|0|129|0|{0|in|}48|50|}
{2010006001|XXGobject_psameas_object|81|0|131|0|{metadata|in_metadata|1|0|}50|48|}
{2010006001|XXGobject_psameas_object|82|0|132|0|{Layout|OutputLayout|1|0|}45|37|}
{2010006001|XXGobject_psameas_object|83|0|133|0|{key|Key|1|0|}45|37|}
{2010006001|XXGobject_psameas_object|84|0|134|0|{max_core|Max_core|1|0|}45|37|}
{2010212001|XXGvertex_oport_oport|85|0|135|0|{0|out0|}37|51|}
{2010216002|XXGoport_binding_oport|86|0|137|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}51|46|}
{2010211001|XXGvertex_iport_iport|87|0|138|0|{0|in0|}37|52|}
{2010215002|XXGiport_binding_iport|88|0|140|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}52|41|}
{2010006001|XXGobject_psameas_object|89|0|141|0|{InputLayout|Layout|0|0|}27|15|}
{2010006001|XXGobject_psameas_object|90|0|142|0|{OutputLayout|Layout|0|0|}27|23|}
{2010601001|XXGgraph_vertex_vertex|91|0|143|0|{Today_update_file|}1|15|}
{2010601001|XXGgraph_vertex_vertex|92|0|144|0|{old_update_file|}1|19|}
{2010109001|XXGobject_property_value|93|0|145|0|{0|TrackingThumbprint|72|}1|53|}
