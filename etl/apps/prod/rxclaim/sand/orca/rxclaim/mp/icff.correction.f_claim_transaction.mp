@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|54|rel_count|87|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|TABLE_TYPE|FACT|15|9|RFK|@{2|FACT|DIMENSION|}}
{30001002|XXparameter|TABLE_NAME|f_claim_transaction|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_SUBJ_AREA|ids_rxclaim|3|9|RFK|@{0|}}
{30001002|XXparameter|RUN_ID|20170127000000|3|9|RFK|@{0|}}
{30001002|XXparameter|SPLIT_RUN_ID|$[string_prefix(RUN_ID,12) +'70' ]|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DT|$[string_substring(RUN_ID,1,8)]|3|9|RFK|@{0|}}
{30001002|XXparameter|TABLE_TYPE_LOCATION|TABLE_TYPE|3|10|RFKd|@{0|}}
{30001002|XXparameter|INPUT_FILE_NAME|$PUB_DATAHUB_MFS_LOOKUP/ids/$IDS_SUBJ_AREA/$TABLE_TYPE_LOCATION/$TABLE_NAME.$INPUT_FILE_DT.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DML|$PUB_DATAHUB_DML/$IDS_SUBJ_AREA/$IDS_SUBJ_AREA.$TABLE_NAME.dml|7|9|FKf|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|TABLE_TYPE_LOCATION:FACT|many|3|9||@{0|}}
{30001002|XXparameter|TABLE_TYPE_LOCATION:DIMENSION|one|3|9||@{0|}}
{30001002|XXparameter|KEY_TO_REPLACE|\{prod_adjud_sk\}|19|9|RFK|@{0|}}
{30001002|XXparameter|FIELD|$[string_substring(KEY_TO_REPLACE,2,string_length(KEY_TO_REPLACE)-2)]|3|9|RK|@{0|}}
{30001002|XXparameter|OUTPUT_SPLIT_FILE_CTRX|$AI_MFS/split/split.ctrx_f_claim_transaction.ids_rxclaim.f_claim_transaction.$SPLIT_RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_SPLIT_FILE_ORX|$AI_MFS/split/split.orx_f_claim_transaction.ids_rxclaim.f_claim_transaction.$SPLIT_RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|OUTPUT_SPLIT_FILE|$[ AI_MFS + "/split/split.orx_f_claim_transaction.ids_rxclaim.f_claim_transaction." + (string("")) (datetime("YYYYMMDD000076")) now1()+ ".dat.gz" ]|3|9|RFK|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|ids_f_payment_claim_txn_coreection|rdubey13|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|678000|421000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|0|}Job 'icff.correction.f_claim_transaction' Execution Status Report

||echo "taking backup of existing IDS"
SUFFIX=`date +%Y%m%d_%H%M%S`
m_cp -v $INPUT_FILE_NAME  $\{INPUT_FILE_NAME\}.$\{SUFFIX\}.bak
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@filter only record with wrong dxf_sk
split record based on src_env_src|138000|356000|0|0|0|0|11662|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}11697|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}11702|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}11704|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}11706|2065|}}
{2010503005|XXGfvertex|11|0|21|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INPUT_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
}}@0|@26000|250000|0|0|0|0|11671|IFIL : Read IDS File|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|12|0|23|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|13|0|26|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|14|0|28|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|15|0|31|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/d_product_adjud_fix_dxf_sk.d_product_adjud.dat|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0200|3|2|$|@{0|}}
{30001002|XXparameter|key|\{wrong_dxf_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|/* DML Generated by IDS Table DML Onboarding Process for table: ids_common.d_prescriber_adjud
 * On: THU JUN 30 2016 05:04:51
 */

record
  integer(8)  wrong_dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  integer(8)  correct_dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
end
;|3|1|l|@{0|}}
}}@0|@226000|95000|0|0|0|0|11708|LKP : Wrong dxf_sk|Ab Initio Software|@1|300|-1||6||33025|-1|-1|}}
{2010503005|XXGfvertex|16|0|33|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RecordFormat||7|1|RFl||{0|}}
{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|17|0|35|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/split.ids_rxclaim/split.ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_SPLIT_FILE_CTRX|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@0|@590000|251000|0|0|0|0|11705|OF: CTRX Split file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|18|0|37|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|19|0|40|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|20|0|42|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/split.ids_rxclaim/split.ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_SPLIT_FILE_ORX|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@0|@510000|146000|0|0|0|0|11703|OF: ORX Split file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|22|0|47|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|23|0|50|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|24|0|52|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|25|0|55|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

out.f_c_tx_cdr.* ::in.*;

out.f_c_tx_cdr.$FIELD  :1: lookup("LKP : Wrong dxf_sk",in.$FIELD).correct_dxf_sk;

/*out.pbr_adjud_sk :: if(lookup_match("LKP : Wrong dxf_sk",in.pbr_adjud_sk)) 
                                lookup("LKP : Wrong dxf_sk",in.pbr_adjud_sk).correct_dxf_sk
                     else
                        in.pbr_adjud_sk;*/
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select|lookup_match("LKP : Wrong dxf_sk",$FIELD)|3|2|$|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform1|/*Reformat operation*/
out::reformat(in)=
begin

out.f_c_tx_cdr.* ::in.*;

out.f_c_tx_cdr.$FIELD  :1: lookup("LKP : Wrong dxf_sk",in.$FIELD).correct_dxf_sk;

/*out.pbr_adjud_sk :: if(lookup_match("LKP : Wrong dxf_sk",in.pbr_adjud_sk)) 
                                lookup("LKP : Wrong dxf_sk",in.pbr_adjud_sk).correct_dxf_sk
                     else
                        in.pbr_adjud_sk;*/
end;|3|9||@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|output_indexes|/*Function returning vector of indexes of output ports*/
output_indices_out::output_indexes(in)=
begin

//output_indices_out :: if(in.src_env_sk member [ vector  480, 490 ] )  [ vector 2 ,  0 ]   else [ vector 2,  1 ]  ; 
output_indices_out :: if(in.src_env_sk member [ vector  480, 490 ] )  [ vector  0 ]   else [ vector 1 ]  ; 
 
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform2|/*Reformat operation*/
out::reformat(in)=
begin

out.f_c_tx_cdr.* ::in.*;

out.f_c_tx_cdr.$FIELD  :1: lookup("LKP : Wrong dxf_sk",in.$FIELD).correct_dxf_sk;

/*out.pbr_adjud_sk :: if(lookup_match("LKP : Wrong dxf_sk",in.pbr_adjud_sk)) 
                                lookup("LKP : Wrong dxf_sk",in.pbr_adjud_sk).correct_dxf_sk
                     else
                        in.pbr_adjud_sk;*/
end;|3|9||@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|194000|220000|0|0|0|0|11701|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|26|0|57|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|27|0|60|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|28|0|63|0|{@{}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|29|0|66|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|30|0|68|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|31|0|70|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|32|0|72|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|33|0|74|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|34|0|76|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|35|0|78|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|80|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|83|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|38|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|40|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|41|0|97|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|42|0|100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|43|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|44|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|45|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|46|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|47|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|48|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|49|0|121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$AI_DML/split.ids_rxclaim/split.ids_rxclaim.f_claim_transaction.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_SPLIT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@500000|351000|0|0|0|0|11707|$OUTPUT_SPLIT_FILE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|50|0|123|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|51|0|126|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|52|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010110002|XXGconstant|53|0|139|0|{@{}@{1|5436377|}}}
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
{2010601001|XXGgraph_vertex_vertex|10|0|20|0|{IFIL_Read_IDS_File|}1|11|}
{2010212001|XXGvertex_oport_oport|11|0|22|0|{0|read|}11|12|}
{2010213001|XXGoport_dst_flow|12|0|24|0|{0|}12|7|}
{2010007001|XXGobject_proto_object|13|0|25|0|{}11|13|}
{2010212001|XXGvertex_oport_oport|14|0|27|0|{0|read|}13|14|}
{2010006001|XXGobject_psameas_object|15|0|29|0|{metadata|read_metadata|1|0|}14|13|}
{2010601001|XXGgraph_vertex_vertex|16|0|30|0|{LKP_Wrong_dxf_sk|}1|15|}
{2010007001|XXGobject_proto_object|17|0|32|0|{}15|16|}
{2010601001|XXGgraph_vertex_vertex|18|0|34|0|{OF_CTRX_Split_file|}1|17|}
{2010211001|XXGvertex_iport_iport|19|0|36|0|{0|write|}17|18|}
{2010214001|XXGiport_src_flow|20|0|38|0|{0|}18|9|}
{2010007001|XXGobject_proto_object|21|0|39|0|{}17|19|}
{2010211001|XXGvertex_iport_iport|22|0|41|0|{0|write|}19|20|}
{2010006001|XXGobject_psameas_object|23|0|43|0|{metadata|write_metadata|1|0|}20|19|}
{2010601001|XXGgraph_vertex_vertex|24|0|44|0|{OF_ORX_Split_file|}1|21|}
{2010211001|XXGvertex_iport_iport|25|0|46|0|{0|write|}21|22|}
{2010214001|XXGiport_src_flow|26|0|48|0|{0|}22|8|}
{2010007001|XXGobject_proto_object|27|0|49|0|{}21|23|}
{2010211001|XXGvertex_iport_iport|28|0|51|0|{0|write|}23|24|}
{2010006001|XXGobject_psameas_object|29|0|53|0|{metadata|write_metadata|1|0|}24|23|}
{2010601001|XXGgraph_vertex_vertex|30|0|54|0|{Reformat|}1|25|}
{2010212001|XXGvertex_oport_oport|31|0|56|0|{0|out0|}25|26|}
{2010213001|XXGoport_dst_flow|32|0|58|0|{0|}26|8|}
{2010212001|XXGvertex_oport_oport|33|0|59|0|{1|out1|}25|27|}
{2010213001|XXGoport_dst_flow|34|0|61|0|{0|}27|9|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{2|out2|}25|28|}
{2010213001|XXGoport_dst_flow|36|0|64|0|{0|}28|10|}
{2010212001|XXGvertex_oport_oport|37|0|65|0|{3|reject0|}25|29|}
{2010212001|XXGvertex_oport_oport|38|0|67|0|{4|reject1|}25|30|}
{2010212001|XXGvertex_oport_oport|39|0|69|0|{5|reject2|}25|31|}
{2010212001|XXGvertex_oport_oport|40|0|71|0|{6|error0|}25|32|}
{2010212001|XXGvertex_oport_oport|41|0|73|0|{7|error1|}25|33|}
{2010212001|XXGvertex_oport_oport|42|0|75|0|{8|error2|}25|34|}
{2010212001|XXGvertex_oport_oport|43|0|77|0|{9|log|}25|35|}
{2010211001|XXGvertex_iport_iport|44|0|79|0|{0|in|}25|36|}
{2010214001|XXGiport_src_flow|45|0|81|0|{0|}36|7|}
{2010007001|XXGobject_proto_object|46|0|82|0|{}25|37|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{0|out0|}37|38|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{metadata|out0_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{transform0|transform0|1|0|}38|37|}
{2010212001|XXGvertex_oport_oport|50|0|88|0|{1|out1|}37|39|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{metadata|out1_metadata|1|0|}39|37|}
{2010006001|XXGobject_psameas_object|52|0|91|0|{transform1|transform1|1|0|}39|37|}
{2010212001|XXGvertex_oport_oport|53|0|92|0|{2|out2|}37|40|}
{2010006001|XXGobject_psameas_object|54|0|94|0|{metadata|out2_metadata|1|0|}40|37|}
{2010006001|XXGobject_psameas_object|55|0|95|0|{transform2|transform2|1|0|}40|37|}
{2010212001|XXGvertex_oport_oport|56|0|96|0|{3|reject0|}37|41|}
{2010006001|XXGobject_psameas_object|57|0|98|0|{metadata|reject0_metadata|1|0|}41|37|}
{2010212001|XXGvertex_oport_oport|58|0|99|0|{4|reject1|}37|42|}
{2010006001|XXGobject_psameas_object|59|0|101|0|{metadata|reject1_metadata|1|0|}42|37|}
{2010212001|XXGvertex_oport_oport|60|0|102|0|{5|reject2|}37|43|}
{2010006001|XXGobject_psameas_object|61|0|104|0|{metadata|reject2_metadata|1|0|}43|37|}
{2010212001|XXGvertex_oport_oport|62|0|105|0|{6|error0|}37|44|}
{2010006001|XXGobject_psameas_object|63|0|107|0|{metadata|error0_metadata|1|0|}44|37|}
{2010212001|XXGvertex_oport_oport|64|0|108|0|{7|error1|}37|45|}
{2010006001|XXGobject_psameas_object|65|0|110|0|{metadata|error1_metadata|1|0|}45|37|}
{2010212001|XXGvertex_oport_oport|66|0|111|0|{8|error2|}37|46|}
{2010006001|XXGobject_psameas_object|67|0|113|0|{metadata|error2_metadata|1|0|}46|37|}
{2010212001|XXGvertex_oport_oport|68|0|114|0|{9|log|}37|47|}
{2010006001|XXGobject_psameas_object|69|0|116|0|{metadata|log_metadata|1|0|}47|37|}
{2010211001|XXGvertex_iport_iport|70|0|117|0|{0|in|}37|48|}
{2010006001|XXGobject_psameas_object|71|0|119|0|{metadata|in_metadata|1|0|}48|37|}
{2010006001|XXGobject_psameas_object|72|0|120|0|{Layout|Layout|0|0|}25|49|}
{2010211001|XXGvertex_iport_iport|73|0|122|0|{0|write|}49|50|}
{2010214001|XXGiport_src_flow|74|0|124|0|{0|}50|10|}
{2010007001|XXGobject_proto_object|75|0|125|0|{}49|51|}
{2010211001|XXGvertex_iport_iport|76|0|127|0|{0|write|}51|52|}
{2010006001|XXGobject_psameas_object|77|0|129|0|{metadata|write_metadata|1|0|}52|51|}
{2010006001|XXGobject_psameas_object|78|0|130|0|{in_metadata|read_metadata|0|0|}25|11|}
{2010006001|XXGobject_psameas_object|79|0|131|0|{out0_metadata|write_metadata|0|0|}25|21|}
{2010006001|XXGobject_psameas_object|80|0|132|0|{out1_metadata|write_metadata|0|0|}25|17|}
{2010006001|XXGobject_psameas_object|81|0|133|0|{out2_metadata|write_metadata|0|0|}25|49|}
{2010006001|XXGobject_psameas_object|82|0|134|0|{reject0_metadata|read_metadata|0|0|}25|11|}
{2010006001|XXGobject_psameas_object|83|0|135|0|{reject1_metadata|read_metadata|0|0|}25|11|}
{2010006001|XXGobject_psameas_object|84|0|136|0|{reject2_metadata|read_metadata|0|0|}25|11|}
{2010601001|XXGgraph_vertex_vertex|85|0|137|0|{_OUTPUT_SPLIT_FILE|}1|49|}
{2010109001|XXGobject_property_value|86|0|138|0|{0|TrackingThumbprint|72|}1|53|}
