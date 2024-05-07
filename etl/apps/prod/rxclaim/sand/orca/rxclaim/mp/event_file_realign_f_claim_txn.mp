@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|8|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|96|rel_count|159|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|INS_FL_NM|rxclaim.f_claim_transaction.f_claim_transaction.insert.20220514033004.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|IDS_TYPE|ids_rxclaim|3|9|FK||{0|}}
{30001002|XXparameter|UPDT_FL_NM|$[string_replace(INS_FL_NM,"insert","update")]|3|9|RK||{0|}}
{30001002|XXparameter|dt|$[(date("YYYYMMDD"))(now())]|3|9|K||{0|}}
{30001002|XXparameter|bkp_inst_fl_nm|$[string_concat("bkp_",dt,"_",INS_FL_NM)]|3|9|RK||{0|}}
{30001002|XXparameter|bkp_updt_fl_nm|$[string_concat("bkp_",dt,"_",UPDT_FL_NM)]|3|9|RK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|INS_DML_FL|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml|3|9|RFK||{0|}}
{30001002|XXparameter|dml_leng|$[length_of(string_split(INS_DML_FL,"/"))]|3|9|RK||{0|}}
{30001002|XXparameter|old_ins_dml_fl|$[PUB_DATAHUB_DML +'/' + IDS_TYPE + '/prev/' + INS_DML_FL]|3|9|RK||{0|}}
{30001002|XXparameter|new_ins_dml|$[PUB_DATAHUB_DML +'/' + IDS_TYPE + '/' + INS_DML_FL]|3|9|RK||{0|}}
}}@0|@0|0|0|0|0|0|0|event_file_realign|naggar14|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|937000|672000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{1|1|}Job 'event_file_realign_f_claim_txn' Execution Status Report

Job completed successfully at Friday, September 09, 2022 15:40:32
Run performed by user ndeotars
||echo "Originial Events files are moved with bkp_ prefiex"
echo "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}"
echo "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}"

if [[ -f "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}" ]]; then
    m_cp "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}" "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}"


fi

if [[ -f "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}" ]]; then
    m_cp "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}" "$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_updt_fl_nm\}"

fi

||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@PLM QA - ndeotarse||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@start script will take backup of original events files|187000|43000|0|0|0|0|160|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}252|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@0|.5|.5|{0|}254|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@0|.5|.5|{0|}250|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@0|.5|.5|{0|}256|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@0|.5|.5|{0|}221|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@0|.5|.5|{0|}223|2065|}}
{2010210004|XXGflow|13|0|25|0|{@{}@0|.5|.5|{0|}225|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@0|.5|.5|{0|}248|2065|}}
{2010503005|XXGfvertex|15|0|29|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$new_ins_dml|3|9|fj|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}|3|2|$|@{0|}}
}}@0|Output File|849000|110000|0|0|0|0|255|Output File|Ab Initio Software|@1|100000|-1||6||257|-1|-1|}}
{2010202004|XXGiport|16|0|31|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|17|0|34|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|18|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|19|0|39|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$new_ins_dml|3|9|fj|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}|3|2|$|@{0|}}
}}@0|Output File|684000|285000|0|0|0|0|257|Output File-1|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|20|0|41|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|44|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|22|0|46|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|23|0|49|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{UPDT_FL_NM\}|3|2|$|@{0|}}
}}@0|Output File|604000|595000|0|0|0|0|224|Output File-2|Ab Initio Software|@1|100|0||6||32833|-1|-1|}}
{2010202004|XXGiport|24|0|51|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|25|0|54|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|26|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|27|0|59|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{INS_FL_NM\}|3|2|$|@{0|}}
}}@0|Output File|769000|420000|0|0|0|0|219|Output File-3|Ab Initio Software|@1|100000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|28|0|61|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|29|0|64|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|30|0|66|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|31|0|69|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.* :: in.*;
//out.dxf_sk :: reinterpret_as(unsigned integer(8),in.dxf_sk);
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|593000|98000|0|0|0|0|243|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|32|0|71|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|33|0|74|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|34|0|76|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|35|0|78|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|80|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|83|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|38|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|40|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|43|0|102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$old_ins_dml_fl|3|9|fj|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}|3|2|$|@{0|}}
}}@0|Input File|390000|110000|0|0|0|0|253|insert|Ab Initio Software|@1|100000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|44|0|104|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|45|0|107|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|46|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|47|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.* :: in.*;
//out.dxf_sk :: reinterpret_as(unsigned integer(8),in.dxf_sk);
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|428000|273000|0|0|0|0|241|Reformat-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|48|0|116|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|49|0|119|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|50|0|121|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|51|0|123|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|52|0|125|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|53|0|128|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|54|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|55|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|56|0|137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|57|0|140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|59|0|147|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$old_ins_dml_fl|3|9|fj|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_updt_fl_nm\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_updt_fl_nm\}|3|2|$|@{0|}}
}}@0|Input File|225000|285000|0|0|0|0|251|update event|Ab Initio Software|@1|100000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|60|0|149|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|61|0|152|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|62|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|63|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.* :: in.*;
out.dxf_sk :: reinterpret_as(unsigned integer(8),in.dxf_sk);
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|348000|583000|0|0|0|0|220|Reformat-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|64|0|161|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|65|0|164|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|66|0|166|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|67|0|168|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|170|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|173|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|70|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|71|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|72|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|73|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|74|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|75|0|192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|record
  //string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   claim_nbr = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0)   carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   sbm_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pbr_spclty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pcp_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   custom_client_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gender_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   age_band_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_state_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   relationship_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   fmly_type_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_pmt_cntr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   hm_dlvry_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_afflt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cost_basis_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cost_type_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   final_pln_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)   admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cob_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   location_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   client_benefit_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   clt_prc_typ_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   daw_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   dsg_frm_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pln_drg_stat_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   rej_cd1_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd2_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd3_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   orig_carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)   orig_account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   orig_member_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0)   claim_seq_nbr_src = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   claim_cntr = NULL("") /*SMALLINT*/;
  date("YYYYMMDD")("\\x01")   sbm_dt = NULL("") /*DATE*/;
  decimal("\\x01",0)   sbm_mn_id = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hm_dlvry_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   mbr_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   refill_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   daw_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   days_sply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   drg_qty = NULL("") /*DECIMAL(11,3)*/;
  date("YYYYMMDD")("\\x01")   filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)   rx_nbr = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)   awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   wac_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   geap_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_cost_type_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   grp_pln_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_usual_customary_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   family_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   individual_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ded_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ben_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebate_claims_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)   prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)   refill_max = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)   bin_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   processor_cntrl_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   grp_nbr_submd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   brnd_trade_nm_flag = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=15, sign_reserved)   prc_qty = NULL("") /*DECIMAL(13,3)*/;
  decimal("\\x01",0)   gen_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   formulary_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   tier_level = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   grp_clt_ben_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   cust_loc = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   pbr_id_qlfr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   dx_cd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   dx_cd_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   cms_pbp_id = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   cms_contract_id = NULL("") /*VARCHAR(5)*/;
  decimal("\\x01",0)   rej_cnt = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_1 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_2 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_3 = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)   adj_rxcount_stnd_days_sply = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_acct_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_ded_accum_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   begin_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   end_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rx_origin_cd_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   anda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tot_covered_drg_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tot_troop_amt = NULL("") /*DECIMAL(9,2)*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")   sbm_tm = NULL("") /*TIME(6)*/;
  decimal("\\x01",0)   ajc_code_key = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   inn_max_out_of_pocket_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   phr_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   clt_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)   payee_id = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01",0)   contract_pbp_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)   specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   patient_age = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   zero_balance_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   nat_drg_cd_mfr_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   subm_clfctn_cd = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0)   mbr_carrier_uid = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   residence_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   phr_rate = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   clt_rate = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   clawback_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   super_ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)   tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)   clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)   app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   awp_unit_cost_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   awp_extended_cost_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   clt_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   clt_formulary_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   formulary_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   risk_pool_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   risk_pool_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   prior_auth_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prior_auth_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   rxsol_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rxsol_formulary_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   claim_origination_code_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_origin_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   coverage_lvl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   reversal_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   recent_clm_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ntpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   origin_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   reported_gap_discount_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   clt_id = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)   cag_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_eligty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_eligty_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ln_of_buss = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_dt_of_brth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   phr_svc_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_max_accum_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_ded_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   care_ntwrk_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   care_ntwrk_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   clt_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   clt_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   clt_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   clt_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   clt_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_prc_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cntngnt_thrpc_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   cntngnt_thrpy_sched = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   dur_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=18)   dur_key = NULL("") /*VARCHAR(18)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   elig_clfctn_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_acc_benefit_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   frm_mgmt_svcs_tier = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   formulary_prtcol_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   group_sic = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hsa_extrct_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_benefit_max_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   accum_oop = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   maint_gpi_list = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_ms_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_px_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_rm_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ndc_list_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   out_of_perd_rvrsl_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   out_of_pocket_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   phr_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   phr_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   phr_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   phr_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_ntwrk_gpi_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_ntwrk_ndc_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_prc_tbl_sched = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   pln_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pln_fnl_prc_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pref_prod_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   prc_bsis_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prod_remb_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   prv_lock_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prv_lock_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rgnl_dsstr_ovrd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   trn_ben_ovrd_sched = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   pbr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=16)   submd_rph_id = NULL("") /*VARCHAR(16)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   submd_rph_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adj_medspn_prod_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   cmpd_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   fda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   medspn_carr_prod_ovrd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   prod_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   tran_add_user_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adjtd_claim_stat = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   chg_dttm_tcd = NULL("") /*TIMESTAMP(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   chg_usr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   claim_ref_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_resp_stat_cd = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   submd_claim_dttm = NULL("") /*TIMESTAMP(6)*/;
  date("YYYYMMDD")("\\x01")   injury_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   orig_pmt_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   sub_reversal_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   delay_rsn_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   dispng_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   dmr_usr_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   extr_txn_cntl_nbr = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   incdnt_id = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01",0)   manl_claim_trk_dt_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   manl_claim_trk_nbr = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   agcy_nbr = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   medcd_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   medcd_ind = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   sbrogtn_tcn = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)   pmt_txn_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   pl_of_svc_submd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   pror_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rx_nbr_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   srvc_lvl_of_effrt = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   srvc_lvl_typ = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_clfctn_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_clfctn_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   txn_cd_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   u_c_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   vers_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld3 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld1 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld3 = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01",0)   rdc_ingrd_cost_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   zro_bal_claims_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   estd_gen_sav = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   basis_of_reim_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_atr_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_incentive_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_other_pmt_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_brnp_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   client_pricing_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_pct_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_flat_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   spclty_phr_corp_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   spclty_phr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   mail_ordr_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   retl_90_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   mail_ordr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_amt_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_copay_flat_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_copay_pct_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_prc_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   mail_ordr_cntr = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   retl_90_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   post_adjud_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   post_adjud_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   subm_yr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   care_fac_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   subm_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)   subm_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01",0)   filled_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)   filled_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rvrsl_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_remn_ben = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_remn_ded = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ingrd_cost_cntrctd_remb = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ppay_amt_psc_brnd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_mcd_pd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_oth_covrg_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_oth_payr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   cmpo_last_seq = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)   corp_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)   rptg_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  decimal("\\x01",0)   brnd_bsis_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebill_cost_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rebill_cost_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   rebill_cost_typ_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_dispng_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   rebill_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  decimal("\\x01",0)   rebill_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   rebill_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   rebill_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_incent_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_ingrd_cost_pd = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   rebill_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   rebill_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rebill_prc_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_sls_tax_pd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_3 = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   rebill_drug_cost_percent = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   acct_benefit_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")   birth_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_atr_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cal_cost_src_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_cov_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_dsp_fee_c_r_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_exc_benefit_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_flat_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_flat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_ingred_cost_con_reimb_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_per_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_plan_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_perc_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_tot_other_amt = NULL("") /*DECIMAL(9,2)*/;
  date("YYYYMMDD")("\\x01")   chg_date = NULL("") /*DATE*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")   chg_time = NULL("") /*TIME(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   cfi_csg_client_seg_cd = NULL("") /*VARCHAR(3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_1_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_2_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_3_cd = NULL("") /*VARCHAR(2)*/;
  date("YYYYMMDD")("\\x01")   prev_fill_1_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prev_fill_2_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prev_fill_3_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   life_benefit_max_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   life_benefit_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   life_benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   oop_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   oop_sched_used_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   ptnt_first_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   ptnt_last_nm = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   flat_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   price_tbl_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_priv_ntw_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   pln_formulary = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   final_price_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   prior_auth_used_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")   prior_auth_from_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prior_auth_thru_dt = NULL("") /*DATE*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_1_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_2_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_3_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_priv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_ppay_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_conflict_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_intrv_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_outcm_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   qual_serv_prov_id = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   spend_acct_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   mbr_pln = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cob_extract_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   sbm_unit_dose_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tcd_sbm_perct_salestax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   prim_pbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prim_pbr_mid_init = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   prim_pbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   mbr_prim_pbr_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   prim_pbr_state = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   sbm_clarfctn_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_admin_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_cvg_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_proc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_dispensing_fee_cont = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_atr_sales_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   pst_cost_source_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_other_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_prvd_ntwk_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_npfm_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_ingred_ctd_reim_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_brand_npfm_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ctd_reim_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   benchmrk_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0)   prorated_days_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=16, sign_reserved)   metric_nbr_qty = NULL("") /*DECIMAL(14,3)*/;
  decimal("\\x01",0)   rej_cd4_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd5_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd6_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd7_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd8_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd9_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd10_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drg_coverage_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cpp_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prior_pbm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   non_rxclaim_adj_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   orx_dispensed_ind = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   dlvry_chanl = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   awp_flg = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_intgr_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   pdt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)   subm_prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)   mbr_prior_auth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)   drg_spend_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)   troop_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   oop_applied_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   day_90_prog_type = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   day_90_retail_prog_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   copay_category_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   care_fac_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");

  //Folowing Fields have been added for inclusion of CDUR [ Overrides and Events] : 20160804
  //decimal("\\x01",0) sbm_yr = NULL("") /*INTEGER*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_ingred_cost_paid /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_dispensing_fee /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_sales_tax_paid /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_patient_pay_amt /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_due_amt /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01",0) days_of_supply /*SMALLINT NOT NULL*/;
  //decimal("\\x01".3, maximum_length=13, sign_reserved) drug_quantity /*DECIMAL(11,3) NOT NULL*/;
  //decimal("\\x01",0) cnflct_prod_sk = NULL("") /*BIGINT*/;
  //string("\\x01",charset="iso-8859-15", maximum_length=40) dur_msg = NULL("") /*VARCHAR(40)*/;

  //Following field is added for history processing of OLR and ORCHARD
  date("YYYYMMDD")("\\x01")   ids_file_dt = NULL("") /*DATE*/;
 // decimal("\\x01",0) claim_nbr_encrp = NULL(""); /* Added for claim id encryption. Apr Release 2022*/
  string(1)  newline = NULL("");
end
;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_updt_fl_nm\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_updt_fl_nm\}|3|2|$|@{0|}}
}}@0|Input File|145000|595000|0|0|0|0|222|update event-1|Ab Initio Software|@1|100000|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|76|0|194|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|77|0|197|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|78|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|79|0|204|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.* :: in.*;
out.dxf_sk :: reinterpret_as(unsigned integer(8),in.dxf_sk);
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|513000|408000|0|0|0|0|226|Reformat-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||36929|1|{1|0|}}}
{2010203004|XXGoport|80|0|206|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|81|0|209|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|82|0|211|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|83|0|213|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|215|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|218|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|86|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|87|0|224|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|88|0|227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|89|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|91|0|237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|// $PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.f_claim_transaction.dml without claim_nbr_encrp field 

record
  //string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   claim_nbr = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0)   carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   sbm_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pbr_spclty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pcp_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   custom_client_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gender_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   age_band_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_state_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   relationship_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   fmly_type_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_pmt_cntr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   hm_dlvry_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_afflt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cost_basis_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cost_type_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   final_pln_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)   admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cob_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   location_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   client_benefit_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   clt_prc_typ_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   daw_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   dsg_frm_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   pln_drg_stat_sk = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)   rej_cd1_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd2_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd3_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   orig_cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   orig_carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)   orig_account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   orig_member_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0)   claim_seq_nbr_src = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   claim_cntr = NULL("") /*SMALLINT*/;
  date("YYYYMMDD")("\\x01")   sbm_dt = NULL("") /*DATE*/;
  decimal("\\x01",0)   sbm_mn_id = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hm_dlvry_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   mbr_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   refill_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   daw_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   days_sply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   drg_qty = NULL("") /*DECIMAL(11,3)*/;
  date("YYYYMMDD")("\\x01")   filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)   rx_nbr = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)   awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   wac_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   geap_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_cost_type_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   grp_pln_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_usual_customary_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_sales_tax_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrib_prod_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_other_payer_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_incentive_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrib_to_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_exe_per_bft_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   family_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   individual_deductible_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ded_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ben_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebate_claims_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)   prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)   refill_max = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)   bin_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   processor_cntrl_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   grp_nbr_submd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   brnd_trade_nm_flag = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=15, sign_reserved)   prc_qty = NULL("") /*DECIMAL(13,3)*/;
  decimal("\\x01",0)   gen_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   formulary_cntr = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   tier_level = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   grp_clt_ben_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   cust_loc = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_prc_typ = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   pbr_id_qlfr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   sbm_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   dx_cd = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   dx_cd_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   cms_pbp_id = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5)   cms_contract_id = NULL("") /*VARCHAR(5)*/;
  decimal("\\x01",0)   rej_cnt = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_1 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_2 = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   rsp_msg_3 = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)   adj_rxcount_stnd_days_sply = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_acct_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_ded_accum_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   begin_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   end_benefit_phase_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rx_origin_cd_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   anda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tot_covered_drg_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tot_troop_amt = NULL("") /*DECIMAL(9,2)*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")   sbm_tm = NULL("") /*TIME(6)*/;
  decimal("\\x01",0)   ajc_code_key = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   inn_max_out_of_pocket_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   phr_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   clt_price_src_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12)   payee_id = NULL("") /*VARCHAR(12)*/;
  decimal("\\x01",0)   contract_pbp_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)   specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)   min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01",0)   patient_age = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   zero_balance_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   nat_drg_cd_mfr_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   subm_clfctn_cd = NULL("") /*VARCHAR(4)*/;
  decimal("\\x01",0)   mbr_carrier_uid = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   residence_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   phr_rate = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   clt_rate = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   clawback_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   super_ntwk_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)   tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)   clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)   app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   awp_unit_cost_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   awp_extended_cost_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   clt_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   clt_formulary_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   formulary_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   risk_pool_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   risk_pool_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   prior_auth_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prior_auth_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   rxsol_formulary_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rxsol_formulary_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   claim_origination_code_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_origin_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   coverage_lvl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   reversal_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   recent_clm_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ntpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   origin_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   reported_gap_discount_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50)   clt_id = NULL("") /*VARCHAR(50)*/;
  decimal("\\x01",0)   cag_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_eligty_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_eligty_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   ln_of_buss = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   filled_dt_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   mbr_dt_of_brth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   phr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   phr_svc_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_max_accum_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ben_ded_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   care_ntwrk_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   care_ntwrk_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   clt_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   clt_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   clt_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   clt_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   clt_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   clt_prc_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cntngnt_thrpc_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   cntngnt_thrpy_sched = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   dur_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=18)   dur_key = NULL("") /*VARCHAR(18)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   elig_clfctn_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_acc_benefit_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   frm_mgmt_svcs_tier = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   formulary_prtcol_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=4)   group_sic = NULL("") /*VARCHAR(4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   hsa_extrct_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_benefit_max_ptd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_acc_life_benefit_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   accum_oop = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   maint_gpi_list = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_ms_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_px_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   med_ffp_ind_rm_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   ndc_list_qlfr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   out_of_perd_rvrsl_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   out_of_pocket_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_copay_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   phr_copay_sched_step_nbr = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   phr_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   phr_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   phr_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_ntwrk_gpi_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_ntwrk_ndc_list = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_pat_sched_tbl = NULL("") /*VARCHAR(13)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_pat_sched_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   phr_prc_tbl_sched = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   pln_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pln_fnl_prc_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   pref_prod_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   prc_bsis_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prod_remb_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   prv_lock_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prv_lock_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rgnl_dsstr_ovrd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   trn_ben_ovrd_sched = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)   pbr_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=16)   submd_rph_id = NULL("") /*VARCHAR(16)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   submd_rph_qlfr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adj_medspn_prod_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   cmpd_typ_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   fda_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   medspn_carr_prod_ovrd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   prod_adjud_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   tran_add_user_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   adjtd_claim_stat = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   chg_dttm_tcd = NULL("") /*TIMESTAMP(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   chg_usr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   claim_ref_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   claim_resp_stat_cd = NULL("") /*CHAR(1)*/;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")   submd_claim_dttm = NULL("") /*TIMESTAMP(6)*/;
  date("YYYYMMDD")("\\x01")   injury_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   orig_pmt_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   sub_reversal_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   delay_rsn_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   dispng_stat = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   dmr_usr_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)   extr_txn_cntl_nbr = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   incdnt_id = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01",0)   manl_claim_trk_dt_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   manl_claim_trk_nbr = NULL("") /*VARCHAR(14)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   agcy_nbr = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   medcd_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   medcd_ind = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20)   sbrogtn_tcn = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6)   pmt_txn_nbr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   pl_of_svc_submd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   pror_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rx_nbr_qlfr = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   srvc_lvl_of_effrt = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   srvc_lvl_typ = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_clfctn_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_clfctn_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   txn_cd_submd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   u_c_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   vers_nbr = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   clt_defd_fld3 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld1 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   sxc_defd_fld3 = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01",0)   rdc_ingrd_cost_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01",0)   zro_bal_claims_flag = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   estd_gen_sav = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   basis_of_reim_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_atr_ded_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_incentive_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_other_pmt_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_brnp_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   client_pricing_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_pct_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_flat_copay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   spclty_phr_corp_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   spclty_phr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   clt_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   mail_ordr_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   retl_90_corp_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   mail_ordr_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_amt_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_copay_flat_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_copay_pct_dllr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   phr_prc_sched_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_tot_cob_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_wthd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   phr_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   mail_ordr_cntr = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   retl_90_rptg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   post_adjud_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   post_adjud_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   subm_yr = NULL("") /*SMALLINT*/;
  decimal("\\x01",0)   care_fac_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   subm_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)   subm_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01",0)   filled_yr_mnth = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=8)   filled_qtr = NULL("") /*VARCHAR(8)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rvrsl_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_amt_covrg_gap = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_attrd_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_pln_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_remn_ben = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_remn_ded = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ingrd_cost_cntrctd_remb = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ppay_amt_psc_brnd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ppay_amt_psc_brnd_npf = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_incent_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_mcd_pd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_oth_covrg_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   subm_oth_payr_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)   cmpo_last_seq = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)   corp_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=9)   rptg_chnl_type_nm = NULL("") /*VARCHAR(9)*/;
  decimal("\\x01",0)   brnd_bsis_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   rebill_cost_src = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rebill_cost_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   rebill_cost_typ_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_dispng_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=14)   rebill_drg_cost_comp_sched = NULL("") /*VARCHAR(14)*/;
  decimal("\\x01",0)   rebill_drg_cost_comp_sched_seq = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   rebill_drg_cost_sched_id = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   rebill_drg_cost_sched_seq = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_incent_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_ingrd_cost_pd = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=13)   rebill_prc_sched_nm = NULL("") /*VARCHAR(13)*/;
  decimal("\\x01",0)   rebill_prc_sched_step = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   rebill_prc_typ = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_sls_tax_pd = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rebill_oth_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_2 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   msg_cd_3 = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved)   rebill_drug_cost_percent = NULL("") /*DECIMAL(5,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   acct_benefit_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")   birth_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_atr_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cal_cost_src_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_cov_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_dsp_fee_c_r_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_exc_benefit_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_flat_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_flat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_ingred_cost_con_reimb_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_per_co_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_plan_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_perc_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_tot_other_amt = NULL("") /*DECIMAL(9,2)*/;
  date("YYYYMMDD")("\\x01")   chg_date = NULL("") /*DATE*/;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")   chg_time = NULL("") /*TIME(6)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   cfi_csg_client_seg_cd = NULL("") /*VARCHAR(3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_prv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   client_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_1_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_2_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   drug_conflict_3_cd = NULL("") /*VARCHAR(2)*/;
  date("YYYYMMDD")("\\x01")   prev_fill_1_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prev_fill_2_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prev_fill_3_dt = NULL("") /*DATE*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_life_ben_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   fam_oop_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_benefit_max_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_deductible_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   ind_lbft_tran_max_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   life_benefit_max_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   life_benefit_max_flag = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   life_benefit_max_sched_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   oop_acc_code = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   oop_sched_used_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   ptnt_first_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   ptnt_last_nm = NULL("") /*VARCHAR(25)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   flat_sls_tax = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pat_sls_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   price_tbl_nm = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_priv_ntw_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_psc_brnd_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   atr_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   pln_formulary = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   final_price_sched = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   prior_auth_used_id = NULL("") /*VARCHAR(10)*/;
  date("YYYYMMDD")("\\x01")   prior_auth_from_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01")   prior_auth_thru_dt = NULL("") /*DATE*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_1_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_2_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved)   prev_fill_3_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_proc_fee_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_priv_ntw_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_atr_ppay_psc_np_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_conflict_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_intrv_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   reversal_dur_outcm_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   qual_serv_prov_id = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   spend_acct_rem_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)   mbr_pln = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   cob_extract_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   sbm_unit_dose_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   tcd_sbm_perct_salestax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   prim_pbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prim_pbr_mid_init = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   prim_pbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   mbr_prim_pbr_id = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=3)   prim_pbr_state = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   sbm_clarfctn_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cal_admin_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_cvg_gap_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_proc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_dispensing_fee_cont = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_atr_sales_tax_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   pst_cost_source_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_other_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_withhold_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_prvd_ntwk_sel_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_npfm_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_ingred_ctd_reim_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   pst_psc_brand_npfm_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_ctd_reim_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   rsp_psc_brand_patpay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   benchmrk_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0)   prorated_days_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=16, sign_reserved)   metric_nbr_qty = NULL("") /*DECIMAL(14,3)*/;
  decimal("\\x01",0)   rej_cd4_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd5_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd6_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd7_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd8_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd9_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   rej_cd10_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   drg_coverage_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   cpp_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   prior_pbm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   non_rxclaim_adj_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   orx_dispensed_ind = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=25)   dlvry_chanl = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)   awp_flg = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   awp_intgr_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)   pdt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   subm_prior_auth_reason_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=11)   subm_prior_auth_nbr = NULL("") /*VARCHAR(11)*/;
  decimal("\\x01",0)   mbr_prior_auth_sk = NULL("") /*BIGINT*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)   drg_spend_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=13, sign_reserved)   troop_amt = NULL("") /*DECIMAL(11,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)   oop_applied_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   day_90_prog_type = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   day_90_retail_prog_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)   copay_category_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   care_fac_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");

  //Folowing Fields have been added for inclusion of CDUR [ Overrides and Events] : 20160804
  //decimal("\\x01",0) sbm_yr = NULL("") /*INTEGER*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_ingred_cost_paid /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_dispensing_fee /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_sales_tax_paid /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_patient_pay_amt /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01".2, maximum_length=11, sign_reserved) clr_due_amt /*DECIMAL(9,2) NOT NULL*/;
  //decimal("\\x01",0) days_of_supply /*SMALLINT NOT NULL*/;
  //decimal("\\x01".3, maximum_length=13, sign_reserved) drug_quantity /*DECIMAL(11,3) NOT NULL*/;
  //decimal("\\x01",0) cnflct_prod_sk = NULL("") /*BIGINT*/;
  //string("\\x01",charset="iso-8859-15", maximum_length=40) dur_msg = NULL("") /*VARCHAR(40)*/;

  //Following field is added for history processing of OLR and ORCHARD
  date("YYYYMMDD")("\\x01")   ids_file_dt = NULL("") /*DATE*/;
 // decimal("\\x01",0) claim_nbr_encrp = NULL(""); /* Added for claim id encryption. Apr Release 2022*/
  string(1)  newline = NULL("");
end
;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{PUB_DATAHUB_MFS\}/event/ids_rxclaim/$\{bkp_inst_fl_nm\}|3|2|$|@{0|}}
}}@0|Input File|310000|420000|0|0|0|0|249|insert-1|Ab Initio Software|@1|100000|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|92|0|239|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|93|0|242|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|94|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|95|0|253|0|{@{}@{1|1826903|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_2|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_3|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_4|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_5|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_6|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_7|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_8|}1|14|}
{2010601001|XXGgraph_vertex_vertex|14|0|28|0|{Output_File|}1|15|}
{2010211001|XXGvertex_iport_iport|15|0|30|0|{0|write|}15|16|}
{2010214001|XXGiport_src_flow|16|0|32|0|{0|}16|8|}
{2010007001|XXGobject_proto_object|17|0|33|0|{}15|17|}
{2010211001|XXGvertex_iport_iport|18|0|35|0|{0|write|}17|18|}
{2010006001|XXGobject_psameas_object|19|0|37|0|{metadata|write_metadata|1|0|}18|17|}
{2010601001|XXGgraph_vertex_vertex|20|0|38|0|{Output_File_1|}1|19|}
{2010211001|XXGvertex_iport_iport|21|0|40|0|{0|write|}19|20|}
{2010214001|XXGiport_src_flow|22|0|42|0|{0|}20|10|}
{2010007001|XXGobject_proto_object|23|0|43|0|{}19|21|}
{2010211001|XXGvertex_iport_iport|24|0|45|0|{0|write|}21|22|}
{2010006001|XXGobject_psameas_object|25|0|47|0|{metadata|write_metadata|1|0|}22|21|}
{2010601001|XXGgraph_vertex_vertex|26|0|48|0|{Output_File_2|}1|23|}
{2010211001|XXGvertex_iport_iport|27|0|50|0|{0|write|}23|24|}
{2010214001|XXGiport_src_flow|28|0|52|0|{0|}24|12|}
{2010007001|XXGobject_proto_object|29|0|53|0|{}23|25|}
{2010211001|XXGvertex_iport_iport|30|0|55|0|{0|write|}25|26|}
{2010006001|XXGobject_psameas_object|31|0|57|0|{metadata|write_metadata|1|0|}26|25|}
{2010601001|XXGgraph_vertex_vertex|32|0|58|0|{Output_File_3|}1|27|}
{2010211001|XXGvertex_iport_iport|33|0|60|0|{0|write|}27|28|}
{2010214001|XXGiport_src_flow|34|0|62|0|{0|}28|13|}
{2010007001|XXGobject_proto_object|35|0|63|0|{}27|29|}
{2010211001|XXGvertex_iport_iport|36|0|65|0|{0|write|}29|30|}
{2010006001|XXGobject_psameas_object|37|0|67|0|{metadata|write_metadata|1|0|}30|29|}
{2010601001|XXGgraph_vertex_vertex|38|0|68|0|{Reformat|}1|31|}
{2010212001|XXGvertex_oport_oport|39|0|70|0|{0|out0|}31|32|}
{2010213001|XXGoport_dst_flow|40|0|72|0|{0|}32|8|}
{2010212001|XXGvertex_oport_oport|41|0|73|0|{1|reject0|}31|33|}
{2010212001|XXGvertex_oport_oport|42|0|75|0|{2|error0|}31|34|}
{2010212001|XXGvertex_oport_oport|43|0|77|0|{3|log|}31|35|}
{2010211001|XXGvertex_iport_iport|44|0|79|0|{0|in|}31|36|}
{2010214001|XXGiport_src_flow|45|0|81|0|{0|}36|7|}
{2010007001|XXGobject_proto_object|46|0|82|0|{}31|37|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{0|out0|}37|38|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{metadata|out0_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{transform0|transform0|1|0|}38|37|}
{2010212001|XXGvertex_oport_oport|50|0|88|0|{1|reject0|}37|39|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{metadata|reject0_metadata|1|0|}39|37|}
{2010212001|XXGvertex_oport_oport|52|0|91|0|{2|error0|}37|40|}
{2010006001|XXGobject_psameas_object|53|0|93|0|{metadata|error0_metadata|1|0|}40|37|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{3|log|}37|41|}
{2010006001|XXGobject_psameas_object|55|0|96|0|{metadata|log_metadata|1|0|}41|37|}
{2010211001|XXGvertex_iport_iport|56|0|97|0|{0|in|}37|42|}
{2010006001|XXGobject_psameas_object|57|0|99|0|{metadata|in_metadata|1|0|}42|37|}
{2010006001|XXGobject_psameas_object|58|0|100|0|{Layout|Layout|0|0|}31|15|}
{2010006001|XXGobject_psameas_object|59|0|101|0|{in_metadata|read_metadata|0|0|}31|43|}
{2010212001|XXGvertex_oport_oport|60|0|103|0|{0|read|}43|44|}
{2010213001|XXGoport_dst_flow|61|0|105|0|{0|}44|7|}
{2010007001|XXGobject_proto_object|62|0|106|0|{}43|45|}
{2010212001|XXGvertex_oport_oport|63|0|108|0|{0|read|}45|46|}
{2010006001|XXGobject_psameas_object|64|0|110|0|{metadata|read_metadata|1|0|}46|45|}
{2010006001|XXGobject_psameas_object|65|0|111|0|{out0_metadata|write_metadata|0|0|}31|15|}
{2010006001|XXGobject_psameas_object|66|0|112|0|{reject0_metadata|read_metadata|0|0|}31|43|}
{2010601001|XXGgraph_vertex_vertex|67|0|113|0|{Reformat_1|}1|47|}
{2010212001|XXGvertex_oport_oport|68|0|115|0|{0|out0|}47|48|}
{2010213001|XXGoport_dst_flow|69|0|117|0|{0|}48|10|}
{2010212001|XXGvertex_oport_oport|70|0|118|0|{1|reject0|}47|49|}
{2010212001|XXGvertex_oport_oport|71|0|120|0|{2|error0|}47|50|}
{2010212001|XXGvertex_oport_oport|72|0|122|0|{3|log|}47|51|}
{2010211001|XXGvertex_iport_iport|73|0|124|0|{0|in|}47|52|}
{2010214001|XXGiport_src_flow|74|0|126|0|{0|}52|9|}
{2010007001|XXGobject_proto_object|75|0|127|0|{}47|53|}
{2010212001|XXGvertex_oport_oport|76|0|129|0|{0|out0|}53|54|}
{2010006001|XXGobject_psameas_object|77|0|131|0|{metadata|out0_metadata|1|0|}54|53|}
{2010006001|XXGobject_psameas_object|78|0|132|0|{transform0|transform0|1|0|}54|53|}
{2010212001|XXGvertex_oport_oport|79|0|133|0|{1|reject0|}53|55|}
{2010006001|XXGobject_psameas_object|80|0|135|0|{metadata|reject0_metadata|1|0|}55|53|}
{2010212001|XXGvertex_oport_oport|81|0|136|0|{2|error0|}53|56|}
{2010006001|XXGobject_psameas_object|82|0|138|0|{metadata|error0_metadata|1|0|}56|53|}
{2010212001|XXGvertex_oport_oport|83|0|139|0|{3|log|}53|57|}
{2010006001|XXGobject_psameas_object|84|0|141|0|{metadata|log_metadata|1|0|}57|53|}
{2010211001|XXGvertex_iport_iport|85|0|142|0|{0|in|}53|58|}
{2010006001|XXGobject_psameas_object|86|0|144|0|{metadata|in_metadata|1|0|}58|53|}
{2010006001|XXGobject_psameas_object|87|0|145|0|{Layout|Layout|0|0|}47|19|}
{2010006001|XXGobject_psameas_object|88|0|146|0|{in_metadata|read_metadata|0|0|}47|59|}
{2010212001|XXGvertex_oport_oport|89|0|148|0|{0|read|}59|60|}
{2010213001|XXGoport_dst_flow|90|0|150|0|{0|}60|9|}
{2010007001|XXGobject_proto_object|91|0|151|0|{}59|61|}
{2010212001|XXGvertex_oport_oport|92|0|153|0|{0|read|}61|62|}
{2010006001|XXGobject_psameas_object|93|0|155|0|{metadata|read_metadata|1|0|}62|61|}
{2010006001|XXGobject_psameas_object|94|0|156|0|{out0_metadata|write_metadata|0|0|}47|19|}
{2010006001|XXGobject_psameas_object|95|0|157|0|{reject0_metadata|read_metadata|0|0|}47|59|}
{2010601001|XXGgraph_vertex_vertex|96|0|158|0|{Reformat_2|}1|63|}
{2010212001|XXGvertex_oport_oport|97|0|160|0|{0|out0|}63|64|}
{2010213001|XXGoport_dst_flow|98|0|162|0|{0|}64|12|}
{2010212001|XXGvertex_oport_oport|99|0|163|0|{1|reject0|}63|65|}
{2010212001|XXGvertex_oport_oport|100|0|165|0|{2|error0|}63|66|}
{2010212001|XXGvertex_oport_oport|101|0|167|0|{3|log|}63|67|}
{2010211001|XXGvertex_iport_iport|102|0|169|0|{0|in|}63|68|}
{2010214001|XXGiport_src_flow|103|0|171|0|{0|}68|11|}
{2010007001|XXGobject_proto_object|104|0|172|0|{}63|69|}
{2010212001|XXGvertex_oport_oport|105|0|174|0|{0|out0|}69|70|}
{2010006001|XXGobject_psameas_object|106|0|176|0|{metadata|out0_metadata|1|0|}70|69|}
{2010006001|XXGobject_psameas_object|107|0|177|0|{transform0|transform0|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|108|0|178|0|{1|reject0|}69|71|}
{2010006001|XXGobject_psameas_object|109|0|180|0|{metadata|reject0_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|110|0|181|0|{2|error0|}69|72|}
{2010006001|XXGobject_psameas_object|111|0|183|0|{metadata|error0_metadata|1|0|}72|69|}
{2010212001|XXGvertex_oport_oport|112|0|184|0|{3|log|}69|73|}
{2010006001|XXGobject_psameas_object|113|0|186|0|{metadata|log_metadata|1|0|}73|69|}
{2010211001|XXGvertex_iport_iport|114|0|187|0|{0|in|}69|74|}
{2010006001|XXGobject_psameas_object|115|0|189|0|{metadata|in_metadata|1|0|}74|69|}
{2010006001|XXGobject_psameas_object|116|0|190|0|{Layout|Layout|0|0|}63|23|}
{2010006001|XXGobject_psameas_object|117|0|191|0|{in_metadata|read_metadata|0|0|}63|75|}
{2010212001|XXGvertex_oport_oport|118|0|193|0|{0|read|}75|76|}
{2010213001|XXGoport_dst_flow|119|0|195|0|{0|}76|11|}
{2010007001|XXGobject_proto_object|120|0|196|0|{}75|77|}
{2010212001|XXGvertex_oport_oport|121|0|198|0|{0|read|}77|78|}
{2010006001|XXGobject_psameas_object|122|0|200|0|{metadata|read_metadata|1|0|}78|77|}
{2010006001|XXGobject_psameas_object|123|0|201|0|{out0_metadata|write_metadata|0|0|}63|23|}
{2010006001|XXGobject_psameas_object|124|0|202|0|{reject0_metadata|read_metadata|0|0|}63|75|}
{2010601001|XXGgraph_vertex_vertex|125|0|203|0|{Reformat_3|}1|79|}
{2010212001|XXGvertex_oport_oport|126|0|205|0|{0|out0|}79|80|}
{2010213001|XXGoport_dst_flow|127|0|207|0|{0|}80|13|}
{2010212001|XXGvertex_oport_oport|128|0|208|0|{1|reject0|}79|81|}
{2010212001|XXGvertex_oport_oport|129|0|210|0|{2|error0|}79|82|}
{2010212001|XXGvertex_oport_oport|130|0|212|0|{3|log|}79|83|}
{2010211001|XXGvertex_iport_iport|131|0|214|0|{0|in|}79|84|}
{2010214001|XXGiport_src_flow|132|0|216|0|{0|}84|14|}
{2010007001|XXGobject_proto_object|133|0|217|0|{}79|85|}
{2010212001|XXGvertex_oport_oport|134|0|219|0|{0|out0|}85|86|}
{2010006001|XXGobject_psameas_object|135|0|221|0|{metadata|out0_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|136|0|222|0|{transform0|transform0|1|0|}86|85|}
{2010212001|XXGvertex_oport_oport|137|0|223|0|{1|reject0|}85|87|}
{2010006001|XXGobject_psameas_object|138|0|225|0|{metadata|reject0_metadata|1|0|}87|85|}
{2010212001|XXGvertex_oport_oport|139|0|226|0|{2|error0|}85|88|}
{2010006001|XXGobject_psameas_object|140|0|228|0|{metadata|error0_metadata|1|0|}88|85|}
{2010212001|XXGvertex_oport_oport|141|0|229|0|{3|log|}85|89|}
{2010006001|XXGobject_psameas_object|142|0|231|0|{metadata|log_metadata|1|0|}89|85|}
{2010211001|XXGvertex_iport_iport|143|0|232|0|{0|in|}85|90|}
{2010006001|XXGobject_psameas_object|144|0|234|0|{metadata|in_metadata|1|0|}90|85|}
{2010006001|XXGobject_psameas_object|145|0|235|0|{Layout|Layout|0|0|}79|27|}
{2010006001|XXGobject_psameas_object|146|0|236|0|{in_metadata|read_metadata|0|0|}79|91|}
{2010212001|XXGvertex_oport_oport|147|0|238|0|{0|read|}91|92|}
{2010213001|XXGoport_dst_flow|148|0|240|0|{0|}92|14|}
{2010007001|XXGobject_proto_object|149|0|241|0|{}91|93|}
{2010212001|XXGvertex_oport_oport|150|0|243|0|{0|read|}93|94|}
{2010006001|XXGobject_psameas_object|151|0|245|0|{metadata|read_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|152|0|246|0|{out0_metadata|write_metadata|0|0|}79|27|}
{2010006001|XXGobject_psameas_object|153|0|247|0|{reject0_metadata|read_metadata|0|0|}79|91|}
{2010601001|XXGgraph_vertex_vertex|154|0|248|0|{insert|}1|43|}
{2010601001|XXGgraph_vertex_vertex|155|0|249|0|{insert_1|}1|91|}
{2010601001|XXGgraph_vertex_vertex|156|0|250|0|{update_event|}1|59|}
{2010601001|XXGgraph_vertex_vertex|157|0|251|0|{update_event_1|}1|75|}
{2010109001|XXGobject_property_value|158|0|252|0|{0|TrackingThumbprint|72|}1|95|}
