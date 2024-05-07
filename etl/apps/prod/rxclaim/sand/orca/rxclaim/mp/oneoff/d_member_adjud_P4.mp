@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|246|rel_count|501|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|NK|\{carrier_id; account_id; employer_group_id; mbr_id; mast_prsn_id; clt_id; mbr_alt_ins_ind; mbr_alt_ins_id; mbr_alt_ins_mbr_id; mbr_ssn_nbr; mbr_supp_id1; mbr_supp_id1_typ; mbr_supp_id2; mbr_supp_id2_typ; mbr_age_band; mbr_calc_age; mbr_cdhldr; mbr_clsfctn1; mbr_clsfctn2; mbr_clsfctn3; mbr_dt_of_brth; mbr_hic_cd; mbr_id_encrpd; mbr_first_nm; mbr_last_nm; mbr_mid_init_nm; mbr_prsn_cd; mbr_relshp_cd; mbr_rdr; mbr_sex; mbr_zip; mbr_mcre_covrg_from_dt; mbr_mcre_covrg_typ; mbr_fam_id; mbr_fam_ind; mbr_fam_typ_cd; src_env_sk\}|3|9|RFK|@{0|}}
{30001002|XXparameter|TABLE_NAME|d_member_adjud|3|9|RFK|@{0|}}
{30001002|XXparameter|MAIN_DBC|$DB_RXCLAIM_DBC|3|9|RFK|@{0|}}
{30001002|XXparameter|STG_DBC|$DB_RXCLAIM_STAGING_DBC|3|9|RFK|@{0|}}
{30001002|XXparameter|RUN_ID|20171201000000|3|9|RFK|@{0|}}
{30001002|XXparameter|SPLIT_FILE|$AI_MFS/split/split.ctrx_d_member_adjud.ids_common.d_member_adjud.$RUN_ID.dat.gz|3|9|RFK|@{0|}}
{30001002|XXparameter|SPLIT_DML|$AI_DML/split.ids_common/split.ids_common.d_member_adjud.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|SANDBOX_DBC|$DB_RXCLAIM_DB/netezza.rxclaim.sandbox.dbc|3|9|RFK|@{0|}}
{30001002|XXparameter|SANDBOX_DBC_N24|$DB_RXCLAIM_DB/netezza.rxclaim_n24.sandbox.dbc|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|tag_sk_d_member_adjud_P5|ptondare|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2785000|653000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'd_member_adjud_P4' Execution Status Report

Job completed successfully at Friday, December 01, 2017 01:57:52
Run performed by user ptondare
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}14817|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}14799|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}14809|2065|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}14782|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14832|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}14815|19|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14819|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14761|1041|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14764|1041|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14808|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}14806|2065|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14813|1041|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14814|1041|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}14821|17|}}
{2010501005|XXGpvertex|19|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|2401000|365000|0|0|0|0|14786|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|20|0|39|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|21|0|42|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|22|0|45|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|23|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|24|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|25|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/VIK_030_D_MBR_ADJUD_F_CLAIM_WITH_NEW_SK_1201.dat|3|2|$|@{0|}}
}}@1|@2611000|112500|0|0|0|0|14833|Output File-3|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|26|0|55|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|27|0|58|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|28|0|60|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|29|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{split_file.old_mbr_adjud_sk; event_file.mbr_calc_age\}|3|2|$|@{0|}}
{30001002|XXparameter|override_key1|\{mbr_adjud_sk; new_mbr_age\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record

  decimal("\\x01",0) mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_calc_age = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") sbm_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") mbr_dt_of_brth = NULL("") /*DATE*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) new_mbr_age = NULL("") /*DECIMAL(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) mbr_age_band_cd = NULL("") /*VARCHAR(6)*/;
  
  decimal("\\x01",0) new_mbr_adjud_sk = NULL("")/*Added by Integration Framework. Surrogate key.*/;
  string(1) newline = "\\n";
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
let lkp_data = lookup("LKP : Wrong dxf_sk", in0.event_file.dxf_sk);
  out.*:: in1.*;
  out.new_mbr_adjud_sk:: if(is_null(lkp_data)) in0.event_file.dxf_sk
  else lkp_data.correct_dxf_sk; /*Added by Integration Framework. Surrogate key.*/
end;|3|1|l|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Join|2013000|317500|0|0|0|0|14816|JOIN : On old_mbr_adjud_sk and new_mbr_age|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|30|0|65|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|31|0|68|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|32|0|70|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|33|0|72|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|34|0|74|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|35|0|76|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|36|0|78|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|37|0|80|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|82|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|39|0|85|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|40|0|88|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|41|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|42|0|93|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|43|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|44|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|45|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|46|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|48|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|50|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|51|0|150|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|include '~$AI_DML/split.ids_common/split.ids_common.d_member_adjud.dml';

metadata type = 
record

record
  split_ids_common_d_member_adjud_t d_mem_adj;
  opt_nk_ids_common_d_cag_t d_cag_mbr;
    decimal("\\x01",0)     old_mbr_adjud_sk = NULL("") /*Added by Integration Framework. Surrogate key.*/;
  string(1)   newline = "\\n";
end split_file;

record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  decimal("\\x01",0)     dxf_sk = NULL("") /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=30)   carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=40)   account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=30)   employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0)   mast_prsn_id = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=50)   clt_id = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_alt_ins_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)   mbr_alt_ins_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_alt_ins_mbr_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)     mbr_ssn_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_supp_id1 = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_supp_id1_typ = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_supp_id2 = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_supp_id2_typ = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_age_band = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   mbr_calc_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_cdhldr = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)   mbr_clsfctn1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_clsfctn2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_clsfctn3 = NULL("") /*CHAR(1)*/;
  date("YYYYMMDD")("\\x01")   mbr_dt_of_brth = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-1", maximum_length=11)   mbr_hic_cd = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_id_encrpd = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=25)   mbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_mid_init_nm = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_prsn_cd = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_relshp_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=6)   mbr_rdr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_sex = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_zip = NULL("") /*VARCHAR(15)*/;
  date("YYYYMMDD")("\\x01")   mbr_mcre_covrg_from_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_mcre_covrg_typ = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_fam_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_fam_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_fam_typ_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
  string(1)  newline =  "\\n";
end event_file;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.* :: in.*;
out.split_file.old_mbr_adjud_sk :: in.split_file.d_mem_adj.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|1346000|155000|0|0|0|0|14768|RFMT : For Mapping for join key fields|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|152|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|53|0|155|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|54|0|157|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|55|0|159|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|161|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|164|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|58|0|166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|59|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|61|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|63|0|182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/lookup.join_split_event.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
}}@0|@1196000|182500|0|0|0|0|14810|Output File|Ab Initio Software|@1|30000000|-1||6||257|-1|-1|}}
{2010203004|XXGoport|64|0|184|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|65|0|187|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|66|0|190|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|67|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|68|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|69|0|198|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{d_mem_adj.carrier_id; d_mem_adj.account_id; d_mem_adj.employer_group_id; d_mem_adj.mbr_id; d_mem_adj.mast_prsn_id; d_mem_adj.clt_id; d_mem_adj.mbr_alt_ins_ind; d_mem_adj.mbr_alt_ins_id; d_mem_adj.mbr_alt_ins_mbr_id; d_mem_adj.mbr_ssn_nbr; d_mem_adj.mbr_supp_id1; d_mem_adj.mbr_supp_id1_typ; d_mem_adj.mbr_supp_id2; d_mem_adj.mbr_supp_id2_typ; d_mem_adj.mbr_age_band; d_mem_adj.mbr_calc_age; d_mem_adj.mbr_cdhldr; d_mem_adj.mbr_clsfctn1; d_mem_adj.mbr_clsfctn2; d_mem_adj.mbr_clsfctn3; d_mem_adj.mbr_dt_of_brth; d_mem_adj.mbr_hic_cd; d_mem_adj.mbr_id_encrpd; d_mem_adj.mbr_first_nm; d_mem_adj.mbr_last_nm; d_mem_adj.mbr_mid_init_nm; d_mem_adj.mbr_prsn_cd; d_mem_adj.mbr_relshp_cd; d_mem_adj.mbr_rdr; d_mem_adj.mbr_sex; d_mem_adj.mbr_zip; d_mem_adj.mbr_mcre_covrg_from_dt; d_mem_adj.mbr_mcre_covrg_typ; d_mem_adj.mbr_fam_id; d_mem_adj.mbr_fam_ind; d_mem_adj.mbr_fam_typ_cd; d_mem_adj.src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|/*Join transform*/
out::join(in0,in1)=
begin
  out.split_file :: in0;
  out.event_file :: in1;
end;|3|1|l|@{0|}}
{30001002|XXparameter|override_key1|$NK|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|include '~$AI_DML/split.ids_common/split.ids_common.d_member_adjud.dml';

metadata type = 
record

record
  split_ids_common_d_member_adjud_t d_mem_adj;
  opt_nk_ids_common_d_cag_t d_cag_mbr;
  string(1)   newline = "\\n";
end split_file;

record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)   mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)   cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=30)   carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=40)   account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=30)   employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0)   mast_prsn_id = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=50)   clt_id = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_alt_ins_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)   mbr_alt_ins_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_alt_ins_mbr_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)     mbr_ssn_nbr = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_supp_id1 = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_supp_id1_typ = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_supp_id2 = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_supp_id2_typ = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_age_band = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   mbr_calc_age = NULL("") /*SMALLINT*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_cdhldr = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=10)   mbr_clsfctn1 = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_clsfctn2 = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_clsfctn3 = NULL("") /*CHAR(1)*/;
  date("YYYYMMDD")("\\x01")   mbr_dt_of_brth = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-1", maximum_length=11)   mbr_hic_cd = NULL("") /*VARCHAR(11)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_id_encrpd = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_first_nm = NULL("") /*VARCHAR(15)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=25)   mbr_last_nm = NULL("") /*VARCHAR(25)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_mid_init_nm = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=3)   mbr_prsn_cd = NULL("") /*VARCHAR(3)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_relshp_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=6)   mbr_rdr = NULL("") /*VARCHAR(6)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_sex = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=15)   mbr_zip = NULL("") /*VARCHAR(15)*/;
  date("YYYYMMDD")("\\x01")   mbr_mcre_covrg_from_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_mcre_covrg_typ = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=20)   mbr_fam_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_fam_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)   mbr_fam_typ_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01", maximum_length=5)   dxf_src_sys_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_create_run_id =   0;
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)   ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)   ids_updt_run_id =   0;
  string("\\x01",maximum_length=2)   ids_rec_stat_cd = NULL("");
  string(1)  newline =  "\\n";
end event_file;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|811000|162500|0|0|0|0|49|JOIN : NK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|200|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|203|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|72|0|206|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|73|0|208|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|74|0|210|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|75|0|212|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|76|0|214|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|77|0|216|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|218|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|79|0|221|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|80|0|224|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-required parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Join|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|81|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|82|0|229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|83|0|232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|84|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|85|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|86|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|87|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|88|0|247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|90|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010503005|XXGfvertex|91|0|287|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SPLIT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$SPLIT_DML|3|2|f$|@{0|}}
}}@0|@80000|80000|0|0|0|0|14818|IFIL : Split file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|92|0|289|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|93|0|292|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|94|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|95|0|297|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS/event/ids_common/common.d_member_adjud.d_member_adjud.insert.20171201000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DATAHUB_DML/ids_common/ids_common.d_member_adjud.dml|3|2|f$|@{0|}}
}}@0|@136000|307500|0|0|0|0|14820|IFIL : Event File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|96|0|299|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|97|0|302|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|98|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|99|0|314|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|100|0|316|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|101|0|318|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|102|0|320|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010505005|XXGtvertex|103|0|331|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|config_file|$SANDBOX_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|table_spec|SANDBOX.ADMIN.VIK_030_D_MBR_ADJUD_F_CLAIM_1201|3|3|c|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@1111000|572500|0|0|0|0|14822|ITAB : Unload mbr_adjud_sk and mbr_age|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|}}
{2010203004|XXGoport|104|0|333|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|105|0|336|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|106|0|338|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_INPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface sameas hana__interface sameas hbase__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family+colname|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|107|0|340|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|108|0|343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|109|0|350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL/$\{TABLE_NAME\}_fix_dxf_sk.d_member_adjud.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL/$\{TABLE_NAME\}_fix_dxf_sk.d_member_adjud.dat|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0200|3|2|$|@{0|}}
{30001002|XXparameter|key|\{wrong_dxf_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|/* DML Generated by IDS Table DML Onboarding Process for table: ids_common.d_prescriber_adjud
 * On: THU JUN 30 2016 05:04:51
 */

record
  integer(8)  wrong_dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  integer(8)  correct_dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  unsigned integer(8)  correct_dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  correct_dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)    wrong_mbr_age_band= NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-1", maximum_length=1)    correct_mbr_age_band= NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)    correct_mbr_calc_age;
  decimal("\\x01",0)    wrong_mbr_calc_age;
end;|3|1|l|@{0|}}
{30001002|XXparameter|index_url|$AI_SERIAL/$\{TABLE_NAME\}_fix_dxf_sk.d_member_adjud.idx|3|2|$|@{0|}}
}}@0|@855000|75000|0|0|0|0|14774|LKP : Wrong dxf_sk|Ab Initio Software|@1|30000000|-1||6||33025|-1|-1|}}
{2010503005|XXGfvertex|110|0|352|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RecordFormat||7|1|RFl||{0|}}
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
{2010505005|XXGtvertex|111|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|config_file|$SANDBOX_DBC|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|table_spec|VIK_030_D_MBR_ADJUD_F_CLAIM_WITH_NEW_SK_1201|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x004A|3|2|$|@{0|}}
{30001002|XXparameter|nza__interface|utility|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@1|@2692000|221500|0|0|0|0|14831|OTAB : Load to Staging|Ab Initio Software|Built-in 2.2:|1|100|0||6||32833|}}
{2010203004|XXGoport|112|0|356|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|113|0|358|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|114|0|360|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|115|0|362|0|{@{}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010505005|XXGtvertex|116|0|364|0|{Loads data records into a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0012|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_OUTPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface sameas hana__interface sameas hbase__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family+colname|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|num_variables.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|variable1|statement_input_type statement_input "record end"|3|2|H$|Intermediate type for sql statement input|{0|}}
{30001002|XXparameter|variable1.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|variable1_analysis|statement_input_type statement_input[n]|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number;end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(error_info, write)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(error_info, write)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation4|integer(4) out::length(in)|3|2|H$|Number of records to send to sql statements|{0|}}
{30001002|XXparameter|operation4.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation5|statement_input::compute_statement_input(write, integer(4) index)|3|2|H$|Compute input for sql statement|{0|}}
{30001002|XXparameter|operation5.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation4_analysis|integer(4) out_length[n]::length(write)|3|2|H$||{0|}}
{30001002|XXparameter|operation5_analysis|statement_input ? statement_input::compute_statement_input(write, integer(4) index) :COPY statement_input::compute_statement_input(write)|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: reject = write
metadata type: error = remote("$AB_HOME/include/error-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|117|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|118|0|369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|119|0|372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|120|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010505005|XXGtvertex|121|0|379|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|config_file|$SANDBOX_DBC_N24|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|$\{DB_RXCLAIM_DBMS\}|3|2|$|@{0|}}
{30001002|XXparameter|table_spec|VIK_030_D_MBR_ADJUD_F_CLAIM_WITH_NEW_SK_1201|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x004A|3|2|$|@{0|}}
{30001002|XXparameter|nza__interface|utility|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@1|@2690000|516500|0|0|0|0|14830|OTAB : Load to Staging-1|Ab Initio Software|Built-in 2.2:|1|100|0||6||32833|}}
{2010203004|XXGoport|122|0|381|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|383|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|124|0|385|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|387|0|{@{}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010505005|XXGtvertex|126|0|389|0|{Loads data records into a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0012|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|ims_path|generated _ab_ims_path_command page_change|3|13|FHv|List of segments from root to segment|{0|}}
{30001002|XXparameter|ims_path.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|ims_path.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|HelpID|HICOMP_OUTPUT_TABLE|3|2|H$||{0|}}
{30001002|XXparameter|config_file||22|2|RFf$||{0|}}
{30001002|XXparameter|table_spec||32|3|RFc||{0|}}
{30001002|XXparameter|table_spec_kind|table|15|1|RFl||{3|table|insert|select|}}
{30001002|XXparameter|db_is_ole|value dbms mssql True value dbms msjet True value dbms msaccess True value dbms oledb True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ora_interface.condition|param_exact dbms oracle mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface_new|FastExport|15|1|Fl|Unload data via api or utility|{5|api|FastExport|PT_export|PT_selector|PT_api_export|}}
{30001002|XXparameter|ter_interface_new.condition|param_exact dbms teradata mode input version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_interface|sameas ter_interface_new|3|13|v||{0|}}
{30001002|XXparameter|ter_interface.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2eee_interface.condition|param_exact dbms db2eee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2ee_interface.condition|param_exact dbms db2ee mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_interface.condition|param_exact dbms db2 mode input version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss_interface_old.condition|param_exact dbms db2uss mode input version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss_interface.condition|param_exact dbms db2uss mode input version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_interface_impl|sameas db2uss_interface sameas db2uss_interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss_interface_impl.condition|param_exact dbms db2uss mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mssql_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|mssql_interface.condition|param_exact dbms mssql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msjet_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msjet_interface.condition|param_exact dbms msjet mode input|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|msaccess_interface.condition|param_exact dbms msaccess mode input|3|15|P?|@{0|}}
{30001002|XXparameter|oledb_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|oledb_interface.condition|param_exact dbms oledb mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ole_interface|sameas mssql_interface sameas msjet_interface sameas msaccess_interface sameas oledb_interface|3|13|v||{0|}}
{30001002|XXparameter|ole_interface.condition|param_exact db_is_ole True mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_interface.condition|param_exact dbms odbc mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybase_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|sybase_interface.condition|param_exact dbms sybase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_interface|api|15|1|Fl|Unload data via api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq_interface.condition|param_exact dbms sybaseiq mode input|3|15|P?|@{0|}}
{30001002|XXparameter|informix_interface|api|15|1|Fl|Unload data via api or utility|{4|api|dbaccess_serial|dbaccess_xps|pload|}}
{30001002|XXparameter|informix_interface.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|ims_interface_old.condition|param_exact dbms ims mode input version :3.1.6.r26|3|15|P?|@{0|}}
{30001002|XXparameter|ims_interface|api|15|1|Fl|Unload data via api (local) or via IMS connect(remote) |{2|api|ims_connect|}}
{30001002|XXparameter|ims_interface.condition|param_exact dbms ims mode input version 3.1.6.r27:|3|15|P?|@{0|}}
{30001002|XXparameter|adabas_interface|api|15|1|Fl|Unload data via api or from backup tape|{2|api|backup_tape|}}
{30001002|XXparameter|adabas_interface.condition|param_exact dbms adabas mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|mongo_interface.condition|param_exact dbms mongo mode input version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_interface|api|15|1|Fl|Unload data via api |{1|api|}}
{30001002|XXparameter|hbase_interface.condition|param_exact dbms hbase mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_old|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|nza_interface_old.condition|param_exact dbms netezza mode input version :2.15.7.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface|api|15|1|Fl|Unload data via api or remote external table|{2|api|external_table|}}
{30001002|XXparameter|nza_interface.condition|param_exact dbms netezza mode input version 2.15.8:|3|15|P?|@{0|}}
{30001002|XXparameter|nza_interface_impl|sameas nza_interface sameas nza_interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza_interface_impl.condition|param_exact dbms netezza mode input|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|db2_400_interface.condition|param_exact dbms db2_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|odbc_400_interface.condition|param_exact dbms odbc_400 mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_interface|api|15|1|Fl|Unload data via api or utility|{2|api|ncluster_export|}}
{30001002|XXparameter|aster_interface.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|hana_interface|api|15|1|Fl|Unload data via api or utility|{1|api|}}
{30001002|XXparameter|hana_interface.condition|param_exact dbms hana mode input version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|ora__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|ora__interface.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter__interface|Multiload|15|1|Fl|Load data using api or utility|{11|api|Fastload|Multiload|Tpump|PT_load|PT_update|PT_stream|PT_inserter|PT_api_load|PT_api_update|PT_api_stream|}}
{30001002|XXparameter|ter__interface.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2eee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2eee__interface.condition|param_exact dbms db2eee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2ee__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2ee__interface.condition|param_exact dbms db2ee mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2__interface.condition|param_exact dbms db2 mode output version 3.2.4.r21:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_old|api|15|1|Fl|Load data via api or utility|{1|api|}}
{30001002|XXparameter|db2uss__interface_old.condition|param_exact dbms db2uss mode output version :2.12.2.m99|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface|api|15|1|Fl|Load data via api or utility|{2|api|utility|}}
{30001002|XXparameter|db2uss__interface.condition|param_exact dbms db2uss mode output version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss__interface_impl|sameas db2uss__interface sameas db2uss__interface_old|3|13|v||{0|}}
{30001002|XXparameter|db2uss__interface_impl.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface|utility|15|1|Fl|Load data using api, utility or bulkload|{3|api|utility|bulkload|}}
{30001002|XXparameter|mssql__interface.condition|param_exact dbms mssql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mssql__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|mssql__interface_bad_choice.condition|param_exact dbms mssql mode output param_exact mssql__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|msjet__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msjet__interface.condition|param_exact dbms msjet mode output|3|15|P?|@{0|}}
{30001002|XXparameter|msaccess__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|msaccess__interface.condition|param_exact dbms msaccess mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface|api|15|1|Fl|Load data using api or bulkload|{2|api|bulkload|}}
{30001002|XXparameter|oledb__interface.condition|param_exact dbms oledb mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oledb__interface_bad_choice||3|2|RF$|Do not use bulkload in versions before V2-14-53|{0|}}
{30001002|XXparameter|oledb__interface_bad_choice.condition|param_exact dbms oledb mode output param_exact oledb__interface bulkload version :2.14.52|3|15|P?|@{0|}}
{30001002|XXparameter|ole__interface|sameas mssql__interface sameas msjet__interface sameas msaccess__interface sameas oledb__interface|3|13|v||{0|}}
{30001002|XXparameter|ole__interface.condition|param_exact db_is_ole True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|odbc__interface.condition|param_exact dbms odbc mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybase__interface.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|sybaseiq__interface.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|informix__interface|api|15|1|Fl|Load data using api or utility|{5|api|dbload|dbaccess_xps|pload|dbaccess_serial|}}
{30001002|XXparameter|informix__interface.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|adabas__interface|api|15|1|Fl|Load data using api|{1|api|}}
{30001002|XXparameter|adabas__interface.condition|param_exact dbms adabas mode output|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_old|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|nza__interface_old.condition|param_exact dbms netezza mode output version :3.2.3.m99|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface|external_table|15|1|Fl|Load data using api, utility, or remote external table|{3|api|utility|external_table|}}
{30001002|XXparameter|nza__interface.condition|param_exact dbms netezza mode output version 3.2.4:|3|15|P?|@{0|}}
{30001002|XXparameter|nza__interface_impl|sameas nza__interface sameas nza__interface_old|3|13|v||{0|}}
{30001002|XXparameter|nza__interface_impl.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|db2_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|db2_400__interface.condition|param_exact dbms db2_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|odbc_400__interface|api|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|odbc_400__interface.condition|param_exact dbms odbc_400 mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster__interface|api|15|1|Fl|Load data using api or utility|{2|api|ncluster_loader|}}
{30001002|XXparameter|aster__interface.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|hana__interface|api|15|1|Fl|Load data using api or utility|{1|api|}}
{30001002|XXparameter|hana__interface.condition|param_exact dbms hana mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|hbase__interface.condition|param_exact dbms hbase mode output version 3.2.5.r24:|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_param_must_exist|1|3|2|H$||{0|}}
{30001002|XXparameter|not_ims|value dbms ims False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_adabas|value dbms ims False value dbms adabas False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_unusual_dbms|value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_iq|value dbms sybaseiq False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_hbase|value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|is_iq_util|value not_iq True False value sybaseiq_interface api False default constant True|13|13|v||{0|}}
{30001002|XXparameter|not_ims_or_iqutil|value not_ims False False value is_iq_util True False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_num_error|value interface_out api False value dbms netezza True value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms db2uss True value dbms sybase True value dbms sybaseiq True value dbms db2_400 True value dbms odbc_400 True value informix__interface dbload True value informix__interface pload True value informix__interface dbaccess_xps True value mssql__interface utility True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_rows_per_commit|value interface_out api False value interface_out bulkload False value dbms oracle True value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms mssql True value dbms sybase True value dbms sybaseiq True value informix__interface dbload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|db2eee_or_db2ee|value dbms db2eee True value dbms db2ee True value dbms db2 True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_native_options|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False value db2ee__interface utility True value db2ee__interface api False value db2eee__interface utility True value db2eee__interface api False value db2__interface utility True value db2__interface api False value db2uss__interface_impl utility True value db2uss__interface_impl api False value nza_interface external_table True value nza_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_control_file|value ora__interface utility True value ora__interface api False value sybase__interface utility True value sybase__interface api False value sybaseiq__interface utility True value sybaseiq__interface api False value ole__interface utility True value ole__interface bulkload False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite|True|13|1|l||{0|}}
{30001002|XXparameter|old_ablocal_prerequisite.condition|mode input param_exact not_unusual_dbms True param_exact interface api|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ablocal_expr|value nza_interface external_table True value utility DSNTIAUL True value utility UNLOAD False value old_ablocal_prerequisite True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_gen_ldr_datatypes|value db2eee_or_db2ee True True value dbms db2uss True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ftype_pref_nondelimited|value field_type_preference delimited False value field_type_preference fixed True value field_type_preference variable True default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_batchsize|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|no_partition_name|True|13|1|l||{0|}}
{30001002|XXparameter|no_partition_name.condition|param_exact dbms sybase version :3.1.1|3|15|P?|@{0|}}
{30001002|XXparameter|supports_partition_name|value ora__interface utility True value ora__interface api False value no_partition_name True False value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_reject_threshold|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_package|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_logging|value interface_out api True value mssql__interface bulkload True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms|value interface_out api True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|supports_api_load_transforms.condition|version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|ter_api_encrypt_data|True|13|1|l||{0|}}
{30001002|XXparameter|ter_api_encrypt_data.condition|param_exact dbms teradata version 3.0.2:|3|15|P?|@{0|}}
{30001002|XXparameter|api_encrypt_data_helper|sameas ter_api_encrypt_data default constant False|13|13|v||{0|}}
{30001002|XXparameter|supports_encrypt_data|value api_encrypt_data_helper True True value ter_util True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|interface_in|sameas ora_interface sameas ter_interface sameas db2eee_interface sameas db2ee_interface sameas db2_interface sameas db2uss_interface_impl sameas db2_400_interface sameas ole_interface sameas odbc_interface sameas odbc_400_interface sameas sybase_interface sameas sybaseiq_interface sameas informix_interface sameas ims_interface_old sameas ims_interface sameas adabas_interface sameas nza_interface_impl sameas mysql_interface sameas postgresql_interface sameas greenplum_interface sameas vertica_interface sameas aster_interface sameas mongo_interface sameas hana_interface sameas hbase_interface|3|13|v||{0|}}
{30001002|XXparameter|interface_in.condition|mode input|3|15|P?|@{0|}}
{30001002|XXparameter|interface_out|sameas ora__interface sameas ter__interface sameas db2eee__interface sameas db2ee__interface sameas db2__interface sameas db2uss__interface_impl sameas db2_400__interface sameas ole__interface sameas odbc__interface sameas odbc_400__interface sameas sybase__interface sameas sybaseiq__interface sameas informix__interface sameas adabas__interface sameas nza__interface_impl sameas mysql__interface sameas postgresql__interface sameas greenplum__interface sameas vertica__interface sameas aster__interface sameas hana__interface sameas hbase__interface|3|13|v||{0|}}
{30001002|XXparameter|interface_out.condition|mode output|3|15|P?|@{0|}}
{30001002|XXparameter|interface|sameas interface_in sameas interface_out|3|13|Kv||{0|}}
{30001002|XXparameter|fixed_size_dml|False|13|1|RFOl|Generate fixed size DML when possible|{0|}}
{30001002|XXparameter|fixed_size_dml.condition|param_exact not_ims_or_adabas True version :2.12.2.m4|3|15|P?|@{0|}}
{30001002|XXparameter|field_type_preference|delimited|15|1|RFKl|Format of generated dml|{3|delimited|variable|fixed|}}
{30001002|XXparameter|field_type_preference.condition|param_exact not_unusual_dbms True version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|generate_loader_datatypes|False|13|1|FKl|Any non-delimited data types in generated DML will be compatible with the utility loader.|{0|}}
{30001002|XXparameter|generate_loader_datatypes.condition|param_exact supports_gen_ldr_datatypes True param_exact ftype_pref_nondelimited True version 2.14.64:|3|15|P?|@{0|}}
{30001002|XXparameter|column_delimiter||3|2|FK$|Default generated column delimiter|{0|}}
{30001002|XXparameter|column_delimiter.condition|param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|encrypt_data|False|13|1|FKl|Encrypt data between database client and server (if possible)|{0|}}
{30001002|XXparameter|encrypt_data.condition|param_exact supports_encrypt_data True|3|15|P?|@{0|}}
{30001002|XXparameter|dml_with_default_values|none|15|1|RFKl|Generate dml with db default values (if possible)|{3|none|null_preferred|default_preferred|}}
{30001002|XXparameter|dml_with_default_values.condition|param_exact not_unusual_dbms True version 3.2.3.r18.0:|3|15|P?|@{0|}}
{30001002|XXparameter|max_rows||1|2|FK$|Maximum rows to unload|{0|}}
{30001002|XXparameter|max_rows.condition|mode input param_exact not_ims_or_iqutil True|3|15|P?|@{0|}}
{30001002|XXparameter|ablocal_expr||3|2|FK$|DML expression for ABLOCAL() in select|{0|}}
{30001002|XXparameter|ablocal_expr.condition|param_exact supports_ablocal_expr True|3|15|P?|@{0|}}
{30001002|XXparameter|remove_delimiters|False|13|1|RFOl|Remove delimiters found in data|{0|}}
{30001002|XXparameter|remove_delimiters.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|delimiter_replacement||3|2|FK$|Replacement for field delimiters found in data|{0|}}
{30001002|XXparameter|delimiter_replacement.condition|param_exact interface api mode input version 2.7: param_exact not_unusual_dbms True|3|15|P?|@{0|}}
{30001002|XXparameter|non_ansimode||13|1|RFKl|If true, process the select statement using Teradata semantics (like Fast Export/PT Export does); false means use Ansi semantics|{0|}}
{30001002|XXparameter|non_ansimode.condition|param_exact ter_interface api version 2.15.2:|3|15|P?|@{0|}}
{30001002|XXparameter|num_errors|50|1|2|FK$|Maximum number of errors allowed|{0|}}
{30001002|XXparameter|num_errors.condition|mode output param_exact supports_num_error True|3|15|P?|@{0|}}
{30001002|XXparameter|commitNumber||1|2|FK$|Number of records per commit checkpoint|{0|}}
{30001002|XXparameter|commitNumber.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|commitTable||24|3|FKc|Database table to store commit progress|{0|}}
{30001002|XXparameter|commitTable.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|jobid||25|3|FKc|For special purpose use only - see 'Help'|{0|}}
{30001002|XXparameter|jobid.condition|mode output param_exact interface api param_exact not_hbase True|3|15|P?|@{0|}}
{30001002|XXparameter|ignoreDuplicates|False|13|1|Fl|if true, ignore unique constraint violations|{0|}}
{30001002|XXparameter|ignoreDuplicates.condition|mode output param_exact interface api param_exact not_hbase True version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|no_actions_ok|value ignoreDuplicates True True value ignoreDuplicates False False default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|no_actions_ok.condition|mode output param_exact interface api version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize||1|2|FK$|Size of batch when using array mode|{0|}}
{30001002|XXparameter|arrayInterfaceBufferSize.condition|mode output param_exact interface api version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|rows_per_commit||1|2|FK$|Rows per commit|{0|}}
{30001002|XXparameter|rows_per_commit.condition|mode output param_exact supports_rows_per_commit True|3|15|P?|@{0|}}
{30001002|XXparameter|batch_size|4096|1|2|FK$|Records processed in each batch|{0|}}
{30001002|XXparameter|batch_size.condition|mode output param_exact supports_batchsize True|3|15|P?|@{0|}}
{30001002|XXparameter|is_serial|False|13|1|FKl|Set to true to specify a serial load.|{0|}}
{30001002|XXparameter|is_serial.condition|mode output param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|file_type|delimited|15|1|FKl|Format of data to be loaded. If 'fixed', Output Table reformats the data to the loader's specifications.|{2|delimited|fixed|}}
{30001002|XXparameter|file_type.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.67:|3|15|P?|@{0|}}
{30001002|XXparameter|file_type_modifier||25|3|FKc|Enter desired file type modifiers.|{0|}}
{30001002|XXparameter|file_type_modifier.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|copy_target||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|copy_target.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|row_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|row_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|save_count|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|save_count.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|data_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|data_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_buffer_size|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|sort_buffer_size.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|hold_quiesce|False|13|1|FKl|Set to True to leave the utility in quiesced exclusive state.|{0|}}
{30001002|XXparameter|hold_quiesce.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|cpu_parallelism|1|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|cpu_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|disk_parallelism|0|1|2|FK$|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|disk_parallelism.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|recoverable|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|recoverable.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|indexing_mode|autoselect|15|1|FKl|Refer to DB2 UDB documentation for description.|{4|autoselect|rebuild|incremental|deferred|}}
{30001002|XXparameter|indexing_mode.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|access_level|allow_no_access|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|allow_no_access|allow_read_access|}}
{30001002|XXparameter|access_level.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_tablespace||25|3|FKc|Refer to DB2 UDB documentation for description|{0|}}
{30001002|XXparameter|use_tablespace.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True version 2.14.101:|3|15|P?|@{0|}}
{30001002|XXparameter|lock_with_force|False|13|1|FKl|Refer to DB2 UDB documentation for description.|{0|}}
{30001002|XXparameter|lock_with_force.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|check_pending|deferred|15|1|FKl|Refer to DB2 UDB documentation for description.|{2|immediate|deferred|}}
{30001002|XXparameter|check_pending.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|statsopt|none|15|1|FKl|Refer to DB2 UDB documentation for description.|{9|none|index|table|both|exttable_only|exttable_index|extindex_only|extindex_table|all|}}
{30001002|XXparameter|statsopt.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|use_exception_table|False|13|1|FKl|Set to True to use exception table.|{0|}}
{30001002|XXparameter|use_exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|exception_table||25|3|FKc|Use only if you want to explicity specify the name for the exception table.|{0|}}
{30001002|XXparameter|exception_table.condition|mode output param_exact interface utility param_exact db2eee_or_db2ee True|3|15|P?|@{0|}}
{30001002|XXparameter|aster_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|aster_util_in|value aster_interface api False value aster_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_in.condition|param_exact dbms aster mode input|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util_out|value aster__interface api False value aster__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util_out.condition|param_exact dbms aster mode output|3|15|P?|@{0|}}
{30001002|XXparameter|aster_util|value aster_util_in True True value aster_util_out True True value aster_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|aster_util.condition|param_exact dbms aster|3|15|P?|@{0|}}
{30001002|XXparameter|uses_legacy_inheritance|False|13|1|FKl|Set to True if table uses legacy parent/child inheritance |{0|}}
{30001002|XXparameter|uses_legacy_inheritance.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|allow_errors|False|13|1|FKl|If true, write errors to error table OR (if false) abort load on first error|{0|}}
{30001002|XXparameter|allow_errors.condition|param_exact aster_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|error_table||3|2|FK$|User-specified errtable name (optional)|{0|}}
{30001002|XXparameter|error_table.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|label||3|2|FK$|Optional string to identify errors from this load in error table|{0|}}
{30001002|XXparameter|label.condition|param_exact allow_errors True|3|15|P?|@{0|}}
{30001002|XXparameter|inf_dummy|a|3|2|$||{0|}}
{30001002|XXparameter|inf_util_in|value informix_interface api False value informix_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_in.condition|param_exact dbms informix mode input|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util_out|value informix__interface api False value informix__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util_out.condition|param_exact dbms informix mode output|3|15|P?|@{0|}}
{30001002|XXparameter|inf_util|value inf_util_in True True value inf_util_out True True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_util.condition|param_exact dbms informix|3|15|P?|@{0|}}
{30001002|XXparameter|inf_use_rej|value informix__interface dbaccess_xps True value informix__interface dbload True value informix__interface pload True value inf_dummy * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|inf_use_rej.condition|param_exact inf_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|idelim|\||3|2|FK$|One-character delimiter for Informix utilities|{0|}}
{30001002|XXparameter|idelim.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pdqpriority||3|2|FK$|DEFAULT, LOW, HIGH, ...|{0|}}
{30001002|XXparameter|pdqpriority.condition|param_exact inf_util True|3|15|P?|@{0|}}
{30001002|XXparameter|jobname||3|2|RFK$|Jobname for High-performance Load/Unload|{0|}}
{30001002|XXparameter|jobname.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|pload_job_method|new|15|1|RFKl||{3|new|overwrite|reuse|}}
{30001002|XXparameter|pload_job_method.condition|param_exact interface pload|3|15|P?|@{0|}}
{30001002|XXparameter|isolation||3|2|FK$|'set isolation' choices: DIRTY READ, COMMITTED READ, ...|{0|}}
{30001002|XXparameter|isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ansi_isolation|default|15|1|FKl|'set transaction' isolation choices|{5|default|READ COMMITTED|REPEATABLE READ|SERIALIZABLE|READ UNCOMMITTED|}}
{30001002|XXparameter|ansi_isolation.condition|param_exact inf_util_in True|3|15|P?|@{0|}}
{30001002|XXparameter|force_raw|False|13|1|FKl|If true, temporarily alters table log mode to RAW|{0|}}
{30001002|XXparameter|force_raw.condition|param_exact inf_util_out True param_exact informix__interface dbaccess_xps|3|15|P?|@{0|}}
{30001002|XXparameter|rejectfile||3|2|RFK$|Rejectfile specification for Informix load utility|{0|}}
{30001002|XXparameter|rejectfile.condition|param_exact inf_use_rej True|3|15|P?|@{0|}}
{30001002|XXparameter|dummy1|a|3|2|$||{0|}}
{30001002|XXparameter|ter_util_in|value ter_interface api False value ter_interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util_out|value ter__interface api False value ter__interface * True default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_util|value ter_util_in True True value ter_util_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_util.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_in|value ter_interface WB_* True value ter_interface PT_* True value ter_interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_in.condition|param_exact dbms teradata mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb_out|value ter__interface WB_* True value ter__interface PT_* True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb_out.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_wb|value ter_wb_in True True value ter_wb_out True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_wb.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_fload|value ter__interface Fastload True value ter__interface WB_load True value ter__interface PT_load True value ter__interface PT_api_load True value ter__interface AB_Fastload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_fload.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_tpump|value ter__interface Tpump True value ter__interface WB_stream True value ter__interface PT_stream True value ter__interface PT_api_stream True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_tpump.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_m_or_t|value ter__interface PT_inserter False value ter_is_fload False True value ter_is_fload True False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_m_or_t.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ter_is_mload_only|value ter__interface Multiload True value ter__interface * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_is_mload_only.condition|param_exact dbms teradata mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ter_show_brief|value ter_m_or_t True True value ter_util_in True True value dummy1 * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ter_show_brief.condition|param_exact dbms teradata|3|15|P?|@{0|}}
{30001002|XXparameter|brief|True|13|1|FKl|Ask utility to generate brief log info if TRUE|{0|}}
{30001002|XXparameter|brief.condition|param_exact ter_show_brief True|3|15|P?|@{0|}}
{30001002|XXparameter|sleep|6|1|2|FK$|Minutes to wait before retrying logon|{0|}}
{30001002|XXparameter|sleep.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|tenacity|0|1|2|FK$|Maximum hours to attempt logon before utility gives up|{0|}}
{30001002|XXparameter|tenacity.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|sessions||3|2|FK$|Number of  sessions|{0|}}
{30001002|XXparameter|sessions.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|instances|1|1|2|FK$|Number of Parallel Transporter operator instances|{0|}}
{30001002|XXparameter|instances.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|logtab_name||3|2|FK$|User-specified logtable name (optional)|{0|}}
{30001002|XXparameter|logtab_name.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|no_spool|False|13|1|FKl|If True, do not spool output if possible|{0|}}
{30001002|XXparameter|no_spool.condition|param_exact ter_util_in True version 3.0.1:|3|15|P?|@{0|}}
{30001002|XXparameter|tablewait|0|1|2|FK$|Number of hours to wait on other load tasks before utility gives up|{0|}}
{30001002|XXparameter|tablewait.condition|param_exact ter_is_mload_only True|3|15|P?|@{0|}}
{30001002|XXparameter|vartext|False|13|1|FKl|Send data to Teradata load utility in VARTEXT mode|{0|}}
{30001002|XXparameter|vartext.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|delim|\||3|2|FK$|delimiter for Teradata load utility|{0|}}
{30001002|XXparameter|delim.condition|param_exact vartext True|3|15|P?|@{0|}}
{30001002|XXparameter|np_axsmod_dir||26|2|RFK$|Name of directory for Named Pipe AXSMOD storage (required)|{0|}}
{30001002|XXparameter|np_axsmod_dir.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|checkpoint||1|2|FK$|Checkpoint rate to be used by Teradata utility|{0|}}
{30001002|XXparameter|checkpoint.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|worktab_name||3|2|FK$|User-specified worktable name (optional)|{0|}}
{30001002|XXparameter|worktab_name.condition|param_exact ter_util_out True param_exact ter_m_or_t True param_exact ter_is_tpump False|3|15|P?|@{0|}}
{30001002|XXparameter|errtab_name||3|2|FK$|User-specified errtable name (optional) [will have 1,2.. appended]|{0|}}
{30001002|XXparameter|errtab_name.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|macrodb||3|2|FK$|Database to use for Tpump macro creation and usage|{0|}}
{30001002|XXparameter|macrodb.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|errlimit||1|2|FK$|number errors allowed|{0|}}
{30001002|XXparameter|errlimit.condition|param_exact ter_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|errpercent||1|2|FK$|% errors allowed|{0|}}
{30001002|XXparameter|errpercent.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|ignore_dupl_rows|False|13|1|FKl|If true, ignore duplicate rows on insert|{0|}}
{30001002|XXparameter|ignore_dupl_rows.condition|param_exact ter_m_or_t True|3|15|P?|@{0|}}
{30001002|XXparameter|serialize|False|13|1|FKl|Guarantee serializability of operations on the same key if true|{0|}}
{30001002|XXparameter|serialize.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|pack|1|1|2|FK$|# of statements to pack into a Tpump request|{0|}}
{30001002|XXparameter|pack.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|rate||1|2|FK$|# of statements per minute to send to Teradata database|{0|}}
{30001002|XXparameter|rate.condition|param_exact ter_is_tpump True|3|15|P?|@{0|}}
{30001002|XXparameter|logfile||18|2|FK$|Name of file to store utility log information (optional)|{0|}}
{30001002|XXparameter|logfile.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|trace_directory||26|2|FK$|directory for trace/debug info (optional)|{0|}}
{30001002|XXparameter|trace_directory.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|axsmod_tracelevel|None|3|2|FK$|for axsmod debugging|{0|}}
{30001002|XXparameter|axsmod_tracelevel.condition|param_exact ter_util True|3|15|P?|@{0|}}
{30001002|XXparameter|pt_tracelevel|None|3|2|FK$|for Parallel Transporter (was TWB) debugging|{0|}}
{30001002|XXparameter|pt_tracelevel.condition|param_exact ter_wb True|3|15|P?|@{0|}}
{30001002|XXparameter|ora_util_out|value ora__interface utility True value ora__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ora_util_out.condition|param_exact dbms oracle mode output|3|15|P?|@{0|}}
{30001002|XXparameter|oracle_max_kb||1|2|FK$|max kilobytes for each parallel unload select|{0|}}
{30001002|XXparameter|oracle_max_kb.condition|param_exact dbms oracle mode input version 2.10.12.m12:|3|15|P?|@{0|}}
{30001002|XXparameter|parallel_mode|rowid|15|1|RFKl|method of automatic parallelism|{2|rowid|subpartition|}}
{30001002|XXparameter|parallel_mode.condition|param_exact dbms oracle mode input version 2.14:|3|15|P?|@{0|}}
{30001002|XXparameter|include_partitions||17|2|FKf$|Optional list of partitions to extract|{0|}}
{30001002|XXparameter|include_partitions.condition|param_exact dbms oracle mode input version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|direct|True|13|1|RFOl|Use SQL*Loader Direct Mode|{0|}}
{30001002|XXparameter|direct.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|num_discards||1|2|FK$|# discards allowed|{0|}}
{30001002|XXparameter|num_discards.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|bindsize||1|2|FK$|SQL*Loader BINDSIZE setting|{0|}}
{30001002|XXparameter|bindsize.condition|param_exact ora_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|control_file||17|2|FKf$|Optional database load utility control file|{0|}}
{30001002|XXparameter|control_file.condition|param_exact supports_control_file True version 2.7:|3|15|P?|@{0|}}
{30001002|XXparameter|partition_name||3|2|FK$|Database partition name|{0|}}
{30001002|XXparameter|partition_name.condition|param_exact supports_partition_name True|3|15|P?|@{0|}}
{30001002|XXparameter|native_options||25|3|FKc|Optional commands passed directly to the database load utility.|{0|}}
{30001002|XXparameter|native_options.condition|param_exact supports_native_options True|3|15|P?|@{0|}}
{30001002|XXparameter|syb_util_out|value sybase__interface utility True value sybase__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|syb_util_out.condition|param_exact dbms sybase mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sybaseiq_util_out|value sybaseiq__interface utility True value sybaseiq__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|sybaseiq_util_out.condition|param_exact dbms sybaseiq mode output|3|15|P?|@{0|}}
{30001002|XXparameter|row_delimited_by|if appropriate|15|1|FKl|Generate ROW DELIMITED BY clause in control file when appropriate.|{2|if appropriate|never|}}
{30001002|XXparameter|row_delimited_by.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|quoted_identifiers|always|15|1|FKl|Quote column names in generated control file.|{2|always|never|}}
{30001002|XXparameter|quoted_identifiers.condition|param_exact sybaseiq_util_out True version :3.0.3.r14|3|15|P?|@{0|}}
{30001002|XXparameter|supports_constraint|True|13|1|Kl||{0|}}
{30001002|XXparameter|supports_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|unique_constraint|True|13|1|FKl|If True, include UNIQUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|unique_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|null_constraint|True|13|1|FKl|If True, include NULL as a load constraint to ignore.|{0|}}
{30001002|XXparameter|null_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|foreign_key_constraint|False|13|1|FKl|If True, include FOREIGN KEY as a load constraint to ignore.|{0|}}
{30001002|XXparameter|foreign_key_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|data_value_constraint|False|13|1|FKl|If True, include DATA VALUE as a load constraint to ignore.|{0|}}
{30001002|XXparameter|data_value_constraint.condition|param_exact sybaseiq_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_in|value ims_interface_old api True value ims_interface api True value ims_interface ims_connect False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_api_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_remote_in|value ims_interface ims_connect True value ims_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|ims_remote_in.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_api_or_remote_in|value ims_api_in True True value ims_remote_in True True default constant False|13|13|v||{0|}}
{30001002|XXparameter|batch_mode|DLI|15|1|RFKl|Run standalone batch or in a batch message processing region|{2|DLI|BMP|}}
{30001002|XXparameter|batch_mode.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|parent_segment_data|key_only|15|1|RFKl|Unload just the keys from parents, or all the data|{2|key_only|full_segment|}}
{30001002|XXparameter|parent_segment_data.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|generate_unique_key|False|13|1|FKl|Generate a unique for segments with no unique key|{0|}}
{30001002|XXparameter|generate_unique_key.condition|param_exact ims_api_or_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_ims_path_command|m_db ims_path|3|2|$|Command to generate list of segments|{0|}}
{30001002|XXparameter|_ab_ims_path_command_params|config_file positional table_spec keyword|3|2|$|List of parameters for path command|{0|}}
{30001002|XXparameter|ssa_||3|2|FK$|SSA qualifier for this segment|{0|}}
{30001002|XXparameter|ssa_.index|ims_path|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.index_name|ssa_|3|9|P|@{0|}}
{30001002|XXparameter|ssa_.condition|param_exact dbms ims mode input|3|15|P?|@{0|}}
{30001002|XXparameter|ims_parameters||3|2|FK$|Other ims parameters|{0|}}
{30001002|XXparameter|ims_parameters.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|alternate_psbname||3|2|FK$|Alternate PSB name to use when starting DFSRRC00|{0|}}
{30001002|XXparameter|alternate_psbname.condition|param_exact ims_api_in True|3|15|P?|@{0|}}
{30001002|XXparameter|ims_batch_size|10|1|2|RFK$|Number of records to request per call|{0|}}
{30001002|XXparameter|ims_batch_size.condition|param_exact ims_remote_in True|3|15|P?|@{0|}}
{30001002|XXparameter|file_number||1|2|FK$|Set to valid file number to bypass PREDICT for file number lookup.|{0|}}
{30001002|XXparameter|file_number.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|backup_dataset||3|2|FK$|DSN of backup tape|{0|}}
{30001002|XXparameter|backup_dataset.condition|mode input param_exact dbms adabas param_exact adabas_interface backup_tape|3|15|P?|@{0|}}
{30001002|XXparameter|file_password||3|2|FK$|Adabas password in encrypted form (m_passwd).|{0|}}
{30001002|XXparameter|file_password.condition|param_exact dbms adabas|3|15|P?|@{0|}}
{30001002|XXparameter|nza_util_out|value nza__interface_impl utility True value nza__interface_impl external_table True value nza__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|nza_util_out.condition|param_exact dbms netezza mode output|3|15|P?|@{0|}}
{30001002|XXparameter|local_log_path||3|2|FK$|local path to log directory mapped from NPS server|{0|}}
{30001002|XXparameter|local_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|server_log_path||3|2|FK$|path on NPS server to log directory|{0|}}
{30001002|XXparameter|server_log_path.condition|version :3.2.0|3|15|P?|@{0|}}
{30001002|XXparameter|db2uss_util_out|value db2uss__interface_impl utility True value db2uss__interface_impl api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|db2uss_util_out.condition|param_exact dbms db2uss mode output|3|15|P?|@{0|}}
{30001002|XXparameter|utility|DSNTIAUL|15|1|FKl|IBM utility used to unload the database|{2|DSNTIAUL|UNLOAD|}}
{30001002|XXparameter|utility.condition|mode input param_exact db2uss_interface_impl utility version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|supports_utility_id|value db2uss_util_out True True value utility UNLOAD True value utility DSNTIAUL False default constant False|13|13|v||{0|}}
{30001002|XXparameter|utility_ID||3|2|FK$|Unique ID for DB2 utility job|{0|}}
{30001002|XXparameter|utility_ID.condition|param_exact interface utility param_exact supports_utility_id True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|temp_dataset||28|2|FK$|MVS dataset for UNLOAD output|{0|}}
{30001002|XXparameter|temp_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|image_copy_dataset||28|2|FK$|Optional DB/2 image copy dataset or datasets from which to unload data|{0|}}
{30001002|XXparameter|image_copy_dataset.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|tablespace||3|2|FK$|If unloading from an image copy dataset, the name of the tablespace which contains the data from the target table|{0|}}
{30001002|XXparameter|tablespace.condition|mode input param_exact db2uss_interface_impl utility param_exact utility UNLOAD version 2.14.68:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSREC_dataset||28|2|FK$|MVS dataset for utility input|{0|}}
{30001002|XXparameter|SYSREC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSDISC_dataset||28|2|FK$|Optional MVS dataset for utility rejects|{0|}}
{30001002|XXparameter|SYSDISC_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSERR_dataset||28|2|FK$|Optional MVS dataset for utility error output|{0|}}
{30001002|XXparameter|SYSERR_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSUT1_dataset||28|2|FK$|Optional MVS work dataset for sort input|{0|}}
{30001002|XXparameter|SYSUT1_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SORTOUT_dataset||28|2|FK$|Optional MVS work dataset for sort output|{0|}}
{30001002|XXparameter|SORTOUT_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|SYSMAP_dataset||28|2|FK$|Optional MVS work dataset for utility error processing|{0|}}
{30001002|XXparameter|SYSMAP_dataset.condition|param_exact db2uss_util_out True version 2.13.1:|3|15|P?|@{0|}}
{30001002|XXparameter|use_mssql_bulk_out|value ole__interface bulkload True value ole__interface utility False value ole__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|keep_identity|False|13|1|FKl|When "True" user must provide values for identity columns.|{0|}}
{30001002|XXparameter|keep_identity.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|keep_nulls|False|13|1|FKl|When "true" a null input value will store a null, not the column default value.|{0|}}
{30001002|XXparameter|keep_nulls.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|hints||3|2|FK$|The same as the "-h" option to bcp.|{0|}}
{30001002|XXparameter|hints.condition|param_exact use_mssql_bulk_out True|3|15|P?|@{0|}}
{30001002|XXparameter|as400_util_out|value db2_400__interface utility True value db2_400__interface api False value odbc_400__interface utility True value odbc_400__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|hostname||3|2|FK$|Name of AS/400 system|{0|}}
{30001002|XXparameter|hostname.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|rebuild_loader|False|13|1|FKl|If True, rebuild the RPG table loader program on the AS/400.|{0|}}
{30001002|XXparameter|rebuild_loader.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_data_path||3|2|FK$|Location, on the AS/400, where data will be landed|{0|}}
{30001002|XXparameter|ifs_data_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ifs_dml_path||3|2|FK$|Location, on the AS/400, where dml files will be landed|{0|}}
{30001002|XXparameter|ifs_dml_path.condition|param_exact as400_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_escaped_by||3|2|FK$|[SQL statement modifier] A string (usually, one-character) defining a character escape sequence.  If non-empty, the SQL statement used for loading the data will be modified accordingly.  A given database's rules may be fairly complex -- read its documentation if you specify any value here.|{0|}}
{30001002|XXparameter|ss_escaped_by.condition|mode output param_exact supports_ss_escaped_by True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_escaped_by|value mysql__interface utility True value mysql__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_string_for_null||3|2|FK$|[SQL statement modifier] The string representing the database NULL.  An empty string here means just that, not the database-specific default, which has to be specified explicitly.  Read the database documentation for a bulk-insert SQL statement to find the latter.|{0|}}
{30001002|XXparameter|ss_string_for_null.condition|mode output param_exact supports_ss_string_for_null True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_string_for_null|value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|ss_appendix||3|2|FK$|[SQL statement modifier] A free-form string going to the end of the SQL statement.  An arbitrary string to be appended to the end of the SQL statement used for data  loading (e.g. DIRECT).  Use this carefully to experiment with loading options:  there is no guarantee that the modified statement will work or result in a better  performance.  Read the database documentation and watch logs to understand the  possible modifications here and their operational impact.|{0|}}
{30001002|XXparameter|ss_appendix.condition|mode output param_exact supports_ss_appendix True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_ss_appendix|value mysql__interface utility True value mysql__interface api False value postgresql__interface utility True value postgresql__interface api False value greenplum__interface api False value greenplum__interface copy True value greenplum__interface gpfdist True value vertica__interface utility True value vertica__interface api False default constant False|13|13|Hv||{0|}}
{30001002|XXparameter|mysql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|mysql_interface.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_in|value mysql_interface utility True value mysql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_in.condition|param_exact dbms mysql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|mysql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|mysql__interface.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mysql_util_out|value mysql__interface utility True value mysql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|mysql_util_out.condition|param_exact dbms mysql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_duplicate_rows_handling|ignore|15|1|FKl|[SQL statement modifier] Handling of input rows that duplicate existing rows on unique key values.  With 'ignore', input rows that duplicate an existing row on a unique key value are skipped.  With 'replace', input rows replace existing rows.|{2|ignore|replace|}}
{30001002|XXparameter|ss_duplicate_rows_handling.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_character_set||3|2|FK$|[SQL statement modifier] Character set that MySQL uses to interpret the incoming data flow.  If not specified, determined by MySQL server 'character_set_database' system variable.|{0|}}
{30001002|XXparameter|ss_character_set.condition|param_exact mysql_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|postgresql_interface.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_in|value postgresql_interface utility True value postgresql_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_in.condition|param_exact dbms postgresql mode input|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|postgresql__interface.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|postgresql_util_out|value postgresql__interface utility True value postgresql__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|postgresql_util_out.condition|param_exact dbms postgresql mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|greenplum_interface.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_in|value greenplum_interface utility True value greenplum_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_in.condition|param_exact dbms greenplum mode input|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum__interface|copy|15|1|Fl|Load data using api or utility|{3|api|copy|gpfdist|}}
{30001002|XXparameter|greenplum__interface.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|greenplum_util_out|value greenplum__interface utility True value greenplum__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|greenplum_util_out.condition|param_exact dbms greenplum mode output|3|15|P?|@{0|}}
{30001002|XXparameter|ss_error_table||3|2|FK$|[SQL statement modifier] CREATE EXTERNAL TABLE ... [ LOG ERRORS INTO error_table ... ] ...  The value of 'error_table' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_error_table.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count|0|1|2|FK$|[SQL statement modifier] ... [ LOG ERRORS INTO error_table ... SEGMENT REJECT count ... ] ...  The value of 'count' in the above optional clause.  (See Greenplum Database User Guide.)|{0|}}
{30001002|XXparameter|ss_segment_reject_limit_count.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|ss_segment_reject_limit_metric|rows|15|1|FKl|[SQL statement modifier] ... [ SEGMENT REJECT count [ROWS \| PERCENT] ] ...  Reject limit metric.  (See Greenplum Database User Guide.)|{2|rows|percents|}}
{30001002|XXparameter|ss_segment_reject_limit_metric.condition|param_exact greenplum_util_out True|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_interface|api|15|1|Fl|Unload data via api|{1|api|}}
{30001002|XXparameter|vertica_interface.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_in|value vertica_interface utility True value vertica_interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_in.condition|param_exact dbms vertica mode input|3|15|P?|@{0|}}
{30001002|XXparameter|vertica__interface|utility|15|1|Fl|Load data using api or utility|{2|api|utility|}}
{30001002|XXparameter|vertica__interface.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|vertica_util_out|value vertica__interface utility True value vertica__interface api False default constant False|13|13|v||{0|}}
{30001002|XXparameter|vertica_util_out.condition|param_exact dbms vertica mode output|3|15|P?|@{0|}}
{30001002|XXparameter|mongo_api_in|value mongo_interface api True default constant False|13|13|v||{0|}}
{30001002|XXparameter|mongo_api_in.condition|param_exact dbms mongo mode input|3|15|P?|@{0|}}
{30001002|XXparameter|continue_on_bad_type|False|13|1|RFKl|False will abort if a Mongo document is read which cannot be translated into the port DML.  True will skip the document and continue processing.|{0|}}
{30001002|XXparameter|continue_on_bad_type.condition|param_exact mongo_api_in True version 3.2.3.r18:|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_api|value interface_out utility False value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|hbase_utility|value interface_out utility True value dbms hbase True value dbms * False default constant True|13|13|v||{0|}}
{30001002|XXparameter|filterstring||3|2|FK$|Thrift filterstring|{0|}}
{30001002|XXparameter|filterstring.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|columns||3|2|FK$|List of column names to load or unload; names are <family>:<qualifier> and separated by spaces|{0|}}
{30001002|XXparameter|columns.condition|param_exact dbms hbase param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|timestamp||1|2|FK$|target timestamp (8-byte signed integer)|{0|}}
{30001002|XXparameter|timestamp.condition|param_exact dbms hbase|3|15|P?|@{0|}}
{30001002|XXparameter|start_rowkey||3|2|FK$|lower rowkey bound (inclusive) to unload|{0|}}
{30001002|XXparameter|start_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|stop_rowkey||3|2|FK$|upper rowkey bound (exclusive) to unload|{0|}}
{30001002|XXparameter|stop_rowkey.condition|param_exact dbms hbase mode input|3|15|P?|@{0|}}
{30001002|XXparameter|skip_WAL|False|13|1|FKl|omit write to HBase WAL|{0|}}
{30001002|XXparameter|skip_WAL.condition|param_exact dbms hbase mode output param_exact hbase_api True|3|15|P?|@{0|}}
{30001002|XXparameter|sort_rowkeys|True|13|1|FKl|Sort incoming record stream on rowkey|{0|}}
{30001002|XXparameter|sort_rowkeys.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|sort_columns|True|13|1|FKl|Sort value vectors in each record on family+colname|{0|}}
{30001002|XXparameter|sort_columns.condition|param_exact dbms hbase param_exact hbase_api True mode output|3|15|P?|@{0|}}
{30001002|XXparameter|tmp_file_mode|660|3|2|FK$|octal file mode must allow read by HBase server|{0|}}
{30001002|XXparameter|tmp_file_mode.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|hbase_configfile||3|2|FK$|optional configuration file used by HBase for load|{0|}}
{30001002|XXparameter|hbase_configfile.condition|param_exact dbms hbase param_exact hbase_utility True param_exact hbase_api False|3|15|P?|@{0|}}
{30001002|XXparameter|gendml_param_names|column_delimiter fixed_size_dml field_type_preference dml_with_default_values generate_loader_datatypes ablocal_expr parent_segment_data generate_unique_key file_password file_number|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params|ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss|ablocal_expr db2uss_util_out utility|3|2|H$||{0|}}
{30001002|XXparameter|m_db_layout_params_db2uss.condition|param_exact dbms db2uss|3|15|P?|@{0|}}
{30001002|XXparameter|m_db_layout_param_names|sameas m_db_layout_params_db2uss sameas m_db_layout_params|3|13|Hv||{0|}}
{30001002|XXparameter|m_db_dump_param_names|remove_delimiters delimiter_replacement ablocal_expr|3|2|H$||{0|}}
{30001002|XXparameter|dbms||3|2|RF$|Database|{0|}}
{30001002|XXparameter|override_mpname|value dbms ims itable-ims value dbms mongo itable-mongo default dollar_substitution itable|3|13|v||{0|}}
{30001002|XXparameter|override_mpname.display_name|override-mpname|3|9|P|@{0|}}
{30001002|XXparameter|override_mpname.condition|mode input mode input|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Functions for deciding whether to abort or retry a transaction|{0|}}
{30001002|XXparameter|package.condition|mode output param_exact supports_package True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|mode output param_exact supports_reject_threshold True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|mode output param_exact supports_logging True version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|supports_error_group|value interface api True value mssql__interface bulkload True value ter_util True True value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16: mode output param_exact supports_error_group True|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|_ab_insert_statement_supported|value dbms ims False value dbms adabas False value interface_out api True value dbms teradata True value dbms informix True value dbms aster True value dbms mongo False value dbms hbase False value dbms * False default constant False|13|13|v||{0|}}
{30001002|XXparameter|_ab_select_statement_supported|value dbms "" True value dbms ims False value dbms adabas False value dbms mongo False value dbms hbase False value dbms * True default constant True|13|13|v||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|num_variables.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|variable1|statement_input_type statement_input "record end"|3|2|H$|Intermediate type for sql statement input|{0|}}
{30001002|XXparameter|variable1.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|variable1_analysis|statement_input_type statement_input[n]|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; string('', charset='x-ab-internal') error_message; string('', charset='x-ab-internal') record_number;end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(error_info, write)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(error_info, write)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation4|integer(4) out::length(in)|3|2|H$|Number of records to send to sql statements|{0|}}
{30001002|XXparameter|operation4.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation5|statement_input::compute_statement_input(write, integer(4) index)|3|2|H$|Compute input for sql statement|{0|}}
{30001002|XXparameter|operation5.condition|param_exact supports_api_load_transforms True version 3.2.5.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation4_analysis|integer(4) out_length[n]::length(write)|3|2|H$||{0|}}
{30001002|XXparameter|operation5_analysis|statement_input ? statement_input::compute_statement_input(write, integer(4) index) :COPY statement_input::compute_statement_input(write)|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|9|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: reject = write
metadata type: error = remote("$AB_HOME/include/error-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|127|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|128|0|394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|129|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|130|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|131|0|405|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/not_used_recs.split_file.dat.gz|3|2|$|@{0|}}
}}@0|@1051000|402500|0|0|0|0|14807|Output File-1|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|132|0|407|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|133|0|410|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|134|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|135|0|416|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_TEMP/final.d_member_adjud.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/final.d_member_adjud.dat.gz|3|2|$|@{0|}}
}}@0|@2192000|203500|0|0|0|0|14741|Output File-2|Ab Initio Software|@1|100|0||6||32833|-1|-1|}}
{2010202004|XXGiport|136|0|418|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|137|0|420|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|138|0|422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|139|0|426|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{d_mem_adj.carrier_id; d_mem_adj.account_id; d_mem_adj.employer_group_id; d_mem_adj.mbr_id; d_mem_adj.mast_prsn_id; d_mem_adj.clt_id; d_mem_adj.mbr_alt_ins_ind; d_mem_adj.mbr_alt_ins_id; d_mem_adj.mbr_alt_ins_mbr_id; d_mem_adj.mbr_ssn_nbr; d_mem_adj.mbr_supp_id1; d_mem_adj.mbr_supp_id1_typ; d_mem_adj.mbr_supp_id2; d_mem_adj.mbr_supp_id2_typ; d_mem_adj.mbr_age_band; d_mem_adj.mbr_calc_age; d_mem_adj.mbr_cdhldr; d_mem_adj.mbr_clsfctn1; d_mem_adj.mbr_clsfctn2; d_mem_adj.mbr_clsfctn3; d_mem_adj.mbr_dt_of_brth; d_mem_adj.mbr_hic_cd; d_mem_adj.mbr_id_encrpd; d_mem_adj.mbr_first_nm; d_mem_adj.mbr_last_nm; d_mem_adj.mbr_mid_init_nm; d_mem_adj.mbr_prsn_cd; d_mem_adj.mbr_relshp_cd; d_mem_adj.mbr_rdr; d_mem_adj.mbr_sex; d_mem_adj.mbr_zip; d_mem_adj.mbr_mcre_covrg_from_dt; d_mem_adj.mbr_mcre_covrg_typ; d_mem_adj.mbr_fam_id; d_mem_adj.mbr_fam_ind; d_mem_adj.mbr_fam_typ_cd; d_mem_adj.src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@521000|117500|0|0|481000|303000|14762|PBKS : NK|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|140|0|428|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|141|0|430|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|142|0|432|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|143|0|435|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|144|0|439|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|145|0|441|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|146|0|443|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|147|0|448|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|148|0|452|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|149|0|456|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|150|0|458|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|151|0|460|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|152|0|462|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|153|0|465|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|154|0|467|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|155|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|156|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|157|0|477|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|158|0|479|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|159|0|481|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|160|0|484|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|161|0|486|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|162|0|489|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|163|0|495|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|164|0|498|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|165|0|503|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$NK|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@591000|310000|0|0|481000|303000|14765|PBKS : NK-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|166|0|505|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|167|0|507|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|168|0|509|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|169|0|512|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|516|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|171|0|518|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|172|0|520|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|173|0|525|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|174|0|529|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|175|0|533|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|176|0|535|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|177|0|537|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|178|0|539|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|179|0|542|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|180|0|544|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|181|0|546|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|182|0|549|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|183|0|554|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|184|0|556|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|558|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|186|0|561|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|187|0|563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|188|0|566|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|189|0|572|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|190|0|575|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|191|0|580|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{mbr_adjud_sk; new_mbr_age\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1398000|410000|0|0|481000|303000|14812|PBKS : \{mbr_adjud_sk; new_mbr_age\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010501005|XXGpvertex|192|0|583|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|193|0|585|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|194|0|588|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|195|0|593|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|196|0|597|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|197|0|601|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|198|0|603|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|199|0|605|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|200|0|607|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|201|0|610|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|202|0|612|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|203|0|614|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|204|0|617|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|205|0|622|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|out_metadata|/* DML Generated for SQL: SELECT * FROM SANDBOX.ADMIN.VIK_030_D_MBR_ADJUD_F_CLAIM_1114
 * On: Wed Nov 15 00:26:57 2017
 */
record
  decimal("\\x01",0) mbr_adjud_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_calc_age = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") sbm_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") mbr_dt_of_brth = NULL("") /*DATE*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) new_mbr_age = NULL("") /*DECIMAL(8)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=6) mbr_age_band_cd = NULL("") /*VARCHAR(6)*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|206|0|624|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|207|0|626|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|208|0|629|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|209|0|631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|210|0|634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|211|0|640|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|212|0|643|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|213|0|648|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{split_file.old_mbr_adjud_sk; event_file.mbr_calc_age\}|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@1558000|155000|0|0|481000|303000|14784|PBKS : \{split_file.old_mbr_adjud_sk; event_file.mbr_calc_age\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|214|0|650|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|215|0|652|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|216|0|654|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|217|0|657|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|218|0|661|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|219|0|663|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|220|0|665|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|221|0|670|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|222|0|674|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|223|0|678|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|224|0|680|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|225|0|682|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|226|0|684|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|227|0|687|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|228|0|689|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|229|0|691|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|230|0|694|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|231|0|699|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|232|0|701|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|233|0|703|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|234|0|706|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|235|0|708|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|236|0|711|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|237|0|717|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|238|0|720|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|239|0|726|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|2529000|365000|0|0|0|0|14801|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|240|0|728|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|241|0|731|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|242|0|734|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|243|0|736|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|244|0|739|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|245|0|745|0|{@{}@{1|1779896|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_10|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_11|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_12|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_13|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_15|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_2|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_5|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_6|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_7|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_8|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_9|}1|18|}
{2010601001|XXGgraph_vertex_vertex|18|0|36|0|{Gather|}1|19|}
{2010212001|XXGvertex_oport_oport|19|0|38|0|{0|out|}19|20|}
{2010213001|XXGoport_dst_flow|20|0|40|0|{0|}20|6|}
{2010211001|XXGvertex_iport_iport|21|0|41|0|{0|in|}19|21|}
{2010214001|XXGiport_src_flow|22|0|43|0|{0|}21|10|}
{2010007001|XXGobject_proto_object|23|0|44|0|{}19|22|}
{2010212001|XXGvertex_oport_oport|24|0|46|0|{0|out|}22|23|}
{2010006001|XXGobject_psameas_object|25|0|48|0|{metadata|out_metadata|1|0|}23|22|}
{2010211001|XXGvertex_iport_iport|26|0|49|0|{0|in|}22|24|}
{2010006001|XXGobject_psameas_object|27|0|51|0|{metadata|in_metadata|1|0|}24|22|}
{2010006001|XXGobject_psameas_object|28|0|52|0|{Layout|Layout|0|0|}19|25|}
{2010211001|XXGvertex_iport_iport|29|0|54|0|{0|write|}25|26|}
{2010214001|XXGiport_src_flow|30|0|56|0|{0|}26|9|}
{2010007001|XXGobject_proto_object|31|0|57|0|{}25|27|}
{2010211001|XXGvertex_iport_iport|32|0|59|0|{0|write|}27|28|}
{2010006001|XXGobject_psameas_object|33|0|61|0|{metadata|write_metadata|1|0|}28|27|}
{2010006001|XXGobject_psameas_object|34|0|62|0|{write_metadata|out_metadata|0|0|}25|29|}
{2010212001|XXGvertex_oport_oport|35|0|64|0|{0|out|}29|30|}
{2010213001|XXGoport_dst_flow|36|0|66|0|{0|}30|10|}
{2010212001|XXGvertex_oport_oport|37|0|67|0|{1|unused0|}29|31|}
{2010212001|XXGvertex_oport_oport|38|0|69|0|{2|unused1|}29|32|}
{2010212001|XXGvertex_oport_oport|39|0|71|0|{3|reject0|}29|33|}
{2010212001|XXGvertex_oport_oport|40|0|73|0|{4|reject1|}29|34|}
{2010212001|XXGvertex_oport_oport|41|0|75|0|{5|error0|}29|35|}
{2010212001|XXGvertex_oport_oport|42|0|77|0|{6|error1|}29|36|}
{2010212001|XXGvertex_oport_oport|43|0|79|0|{7|log|}29|37|}
{2010211001|XXGvertex_iport_iport|44|0|81|0|{0|in0|}29|38|}
{2010214001|XXGiport_src_flow|45|0|83|0|{0|}38|16|}
{2010211001|XXGvertex_iport_iport|46|0|84|0|{1|in1|}29|39|}
{2010214001|XXGiport_src_flow|47|0|86|0|{0|}39|17|}
{2010007001|XXGobject_proto_object|48|0|87|0|{}29|40|}
{2010212001|XXGvertex_oport_oport|49|0|89|0|{0|out|}40|41|}
{2010006001|XXGobject_psameas_object|50|0|91|0|{metadata|out_metadata|1|0|}41|40|}
{2010212001|XXGvertex_oport_oport|51|0|92|0|{1|unused0|}40|42|}
{2010006001|XXGobject_psameas_object|52|0|94|0|{metadata|unused0_metadata|1|0|}42|40|}
{2010212001|XXGvertex_oport_oport|53|0|95|0|{2|unused1|}40|43|}
{2010006001|XXGobject_psameas_object|54|0|97|0|{metadata|unused1_metadata|1|0|}43|40|}
{2010212001|XXGvertex_oport_oport|55|0|98|0|{3|reject0|}40|44|}
{2010006001|XXGobject_psameas_object|56|0|100|0|{metadata|reject0_metadata|1|0|}44|40|}
{2010212001|XXGvertex_oport_oport|57|0|101|0|{4|reject1|}40|45|}
{2010006001|XXGobject_psameas_object|58|0|103|0|{metadata|reject1_metadata|1|0|}45|40|}
{2010212001|XXGvertex_oport_oport|59|0|104|0|{5|error0|}40|46|}
{2010006001|XXGobject_psameas_object|60|0|106|0|{metadata|error0_metadata|1|0|}46|40|}
{2010212001|XXGvertex_oport_oport|61|0|107|0|{6|error1|}40|47|}
{2010006001|XXGobject_psameas_object|62|0|109|0|{metadata|error1_metadata|1|0|}47|40|}
{2010212001|XXGvertex_oport_oport|63|0|110|0|{7|log|}40|48|}
{2010006001|XXGobject_psameas_object|64|0|112|0|{metadata|log_metadata|1|0|}48|40|}
{2010211001|XXGvertex_iport_iport|65|0|113|0|{0|in0|}40|49|}
{2010006001|XXGobject_psameas_object|66|0|115|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|67|0|116|0|{dedup0|dedup0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|68|0|117|0|{dedup_keyword0|dedup_keyword0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|69|0|118|0|{dedup_positional0|dedup_positional0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|70|0|119|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|71|0|120|0|{matchoptional_positional0|matchoptional_positional0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|72|0|121|0|{metadata|in0_metadata|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|73|0|122|0|{override_key0|override_key0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|74|0|123|0|{record_match_required0|record_match_required0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|75|0|124|0|{record_match_required_not0|record_match_required_not0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|76|0|125|0|{record_required0|record_required0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|77|0|126|0|{record_required_keyword0|record_required_keyword0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|78|0|127|0|{record_required_positional0|record_required_positional0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|79|0|128|0|{select0|select0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|80|0|129|0|{select_keyword0|select_keyword0|1|0|}49|40|}
{2010006001|XXGobject_psameas_object|81|0|130|0|{select_positional0|select_positional0|1|0|}49|40|}
{2010211001|XXGvertex_iport_iport|82|0|131|0|{1|in1|}40|50|}
{2010006001|XXGobject_psameas_object|83|0|133|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|84|0|134|0|{dedup1|dedup1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|85|0|135|0|{dedup_keyword1|dedup_keyword1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|86|0|136|0|{dedup_positional1|dedup_positional1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|87|0|137|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|88|0|138|0|{matchoptional_positional1|matchoptional_positional1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|89|0|139|0|{metadata|in1_metadata|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|90|0|140|0|{override_key1|override_key1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|91|0|141|0|{record_match_required1|record_match_required1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|92|0|142|0|{record_match_required_not1|record_match_required_not1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|93|0|143|0|{record_required1|record_required1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|94|0|144|0|{record_required_keyword1|record_required_keyword1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|95|0|145|0|{record_required_positional1|record_required_positional1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|96|0|146|0|{select1|select1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|97|0|147|0|{select_keyword1|select_keyword1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|98|0|148|0|{select_positional1|select_positional1|1|0|}50|40|}
{2010006001|XXGobject_psameas_object|99|0|149|0|{in0_metadata|out0_metadata|0|0|}29|51|}
{2010212001|XXGvertex_oport_oport|100|0|151|0|{0|out0|}51|52|}
{2010213001|XXGoport_dst_flow|101|0|153|0|{0|}52|8|}
{2010212001|XXGvertex_oport_oport|102|0|154|0|{1|reject0|}51|53|}
{2010212001|XXGvertex_oport_oport|103|0|156|0|{2|error0|}51|54|}
{2010212001|XXGvertex_oport_oport|104|0|158|0|{3|log|}51|55|}
{2010211001|XXGvertex_iport_iport|105|0|160|0|{0|in|}51|56|}
{2010214001|XXGiport_src_flow|106|0|162|0|{0|}56|7|}
{2010007001|XXGobject_proto_object|107|0|163|0|{}51|57|}
{2010212001|XXGvertex_oport_oport|108|0|165|0|{0|out0|}57|58|}
{2010006001|XXGobject_psameas_object|109|0|167|0|{metadata|out0_metadata|1|0|}58|57|}
{2010006001|XXGobject_psameas_object|110|0|168|0|{transform0|transform0|1|0|}58|57|}
{2010212001|XXGvertex_oport_oport|111|0|169|0|{1|reject0|}57|59|}
{2010006001|XXGobject_psameas_object|112|0|171|0|{metadata|reject0_metadata|1|0|}59|57|}
{2010212001|XXGvertex_oport_oport|113|0|172|0|{2|error0|}57|60|}
{2010006001|XXGobject_psameas_object|114|0|174|0|{metadata|error0_metadata|1|0|}60|57|}
{2010212001|XXGvertex_oport_oport|115|0|175|0|{3|log|}57|61|}
{2010006001|XXGobject_psameas_object|116|0|177|0|{metadata|log_metadata|1|0|}61|57|}
{2010211001|XXGvertex_iport_iport|117|0|178|0|{0|in|}57|62|}
{2010006001|XXGobject_psameas_object|118|0|180|0|{metadata|in_metadata|1|0|}62|57|}
{2010006001|XXGobject_psameas_object|119|0|181|0|{Layout|Layout|0|0|}51|63|}
{2010212001|XXGvertex_oport_oport|120|0|183|0|{0|read|}63|64|}
{2010213001|XXGoport_dst_flow|121|0|185|0|{0|}64|7|}
{2010211001|XXGvertex_iport_iport|122|0|186|0|{0|write|}63|65|}
{2010214001|XXGiport_src_flow|123|0|188|0|{0|}65|14|}
{2010007001|XXGobject_proto_object|124|0|189|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|125|0|191|0|{0|read|}66|67|}
{2010006001|XXGobject_psameas_object|126|0|193|0|{metadata|read_metadata|1|0|}67|66|}
{2010211001|XXGvertex_iport_iport|127|0|194|0|{0|write|}66|68|}
{2010006001|XXGobject_psameas_object|128|0|196|0|{metadata|write_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|129|0|197|0|{read_metadata|out_metadata|0|0|}63|69|}
{2010212001|XXGvertex_oport_oport|130|0|199|0|{0|out|}69|70|}
{2010213001|XXGoport_dst_flow|131|0|201|0|{0|}70|14|}
{2010212001|XXGvertex_oport_oport|132|0|202|0|{1|unused0|}69|71|}
{2010213001|XXGoport_dst_flow|133|0|204|0|{0|}71|15|}
{2010212001|XXGvertex_oport_oport|134|0|205|0|{2|unused1|}69|72|}
{2010212001|XXGvertex_oport_oport|135|0|207|0|{3|reject0|}69|73|}
{2010212001|XXGvertex_oport_oport|136|0|209|0|{4|reject1|}69|74|}
{2010212001|XXGvertex_oport_oport|137|0|211|0|{5|error0|}69|75|}
{2010212001|XXGvertex_oport_oport|138|0|213|0|{6|error1|}69|76|}
{2010212001|XXGvertex_oport_oport|139|0|215|0|{7|log|}69|77|}
{2010211001|XXGvertex_iport_iport|140|0|217|0|{0|in0|}69|78|}
{2010214001|XXGiport_src_flow|141|0|219|0|{0|}78|12|}
{2010211001|XXGvertex_iport_iport|142|0|220|0|{1|in1|}69|79|}
{2010214001|XXGiport_src_flow|143|0|222|0|{0|}79|13|}
{2010007001|XXGobject_proto_object|144|0|223|0|{}69|80|}
{2010212001|XXGvertex_oport_oport|145|0|225|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|146|0|227|0|{metadata|out_metadata|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|147|0|228|0|{1|unused0|}80|82|}
{2010006001|XXGobject_psameas_object|148|0|230|0|{metadata|unused0_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|149|0|231|0|{2|unused1|}80|83|}
{2010006001|XXGobject_psameas_object|150|0|233|0|{metadata|unused1_metadata|1|0|}83|80|}
{2010212001|XXGvertex_oport_oport|151|0|234|0|{3|reject0|}80|84|}
{2010006001|XXGobject_psameas_object|152|0|236|0|{metadata|reject0_metadata|1|0|}84|80|}
{2010212001|XXGvertex_oport_oport|153|0|237|0|{4|reject1|}80|85|}
{2010006001|XXGobject_psameas_object|154|0|239|0|{metadata|reject1_metadata|1|0|}85|80|}
{2010212001|XXGvertex_oport_oport|155|0|240|0|{5|error0|}80|86|}
{2010006001|XXGobject_psameas_object|156|0|242|0|{metadata|error0_metadata|1|0|}86|80|}
{2010212001|XXGvertex_oport_oport|157|0|243|0|{6|error1|}80|87|}
{2010006001|XXGobject_psameas_object|158|0|245|0|{metadata|error1_metadata|1|0|}87|80|}
{2010212001|XXGvertex_oport_oport|159|0|246|0|{7|log|}80|88|}
{2010006001|XXGobject_psameas_object|160|0|248|0|{metadata|log_metadata|1|0|}88|80|}
{2010211001|XXGvertex_iport_iport|161|0|249|0|{0|in0|}80|89|}
{2010006001|XXGobject_psameas_object|162|0|251|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|163|0|252|0|{dedup0|dedup0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|164|0|253|0|{dedup_keyword0|dedup_keyword0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|165|0|254|0|{dedup_positional0|dedup_positional0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|166|0|255|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|167|0|256|0|{matchoptional_positional0|matchoptional_positional0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|168|0|257|0|{metadata|in0_metadata|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|169|0|258|0|{override_key0|override_key0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|170|0|259|0|{record_match_required0|record_match_required0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|171|0|260|0|{record_match_required_not0|record_match_required_not0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|172|0|261|0|{record_required0|record_required0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|173|0|262|0|{record_required_keyword0|record_required_keyword0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|174|0|263|0|{record_required_positional0|record_required_positional0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|175|0|264|0|{select0|select0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|176|0|265|0|{select_keyword0|select_keyword0|1|0|}89|80|}
{2010006001|XXGobject_psameas_object|177|0|266|0|{select_positional0|select_positional0|1|0|}89|80|}
{2010211001|XXGvertex_iport_iport|178|0|267|0|{1|in1|}80|90|}
{2010006001|XXGobject_psameas_object|179|0|269|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|180|0|270|0|{dedup1|dedup1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|181|0|271|0|{dedup_keyword1|dedup_keyword1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|182|0|272|0|{dedup_positional1|dedup_positional1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|183|0|273|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|184|0|274|0|{matchoptional_positional1|matchoptional_positional1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|185|0|275|0|{metadata|in1_metadata|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|186|0|276|0|{override_key1|override_key1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|187|0|277|0|{record_match_required1|record_match_required1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|188|0|278|0|{record_match_required_not1|record_match_required_not1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|189|0|279|0|{record_required1|record_required1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|190|0|280|0|{record_required_keyword1|record_required_keyword1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|191|0|281|0|{record_required_positional1|record_required_positional1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|192|0|282|0|{select1|select1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|193|0|283|0|{select_keyword1|select_keyword1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|194|0|284|0|{select_positional1|select_positional1|1|0|}90|80|}
{2010006001|XXGobject_psameas_object|195|0|285|0|{Layout|Layout|0|0|}69|63|}
{2010006001|XXGobject_psameas_object|196|0|286|0|{in0_metadata|read_metadata|0|0|}69|91|}
{2010212001|XXGvertex_oport_oport|197|0|288|0|{0|read|}91|92|}
{2010213001|XXGoport_dst_flow|198|0|290|0|{0|}92|5|}
{2010007001|XXGobject_proto_object|199|0|291|0|{}91|93|}
{2010212001|XXGvertex_oport_oport|200|0|293|0|{0|read|}93|94|}
{2010006001|XXGobject_psameas_object|201|0|295|0|{metadata|read_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|202|0|296|0|{in1_metadata|read_metadata|0|0|}69|95|}
{2010212001|XXGvertex_oport_oport|203|0|298|0|{0|read|}95|96|}
{2010213001|XXGoport_dst_flow|204|0|300|0|{0|}96|11|}
{2010007001|XXGobject_proto_object|205|0|301|0|{}95|97|}
{2010212001|XXGvertex_oport_oport|206|0|303|0|{0|read|}97|98|}
{2010006001|XXGobject_psameas_object|207|0|305|0|{metadata|read_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|208|0|306|0|{reject0_metadata|read_metadata|0|0|}69|91|}
{2010006001|XXGobject_psameas_object|209|0|307|0|{reject1_metadata|read_metadata|0|0|}69|95|}
{2010006001|XXGobject_psameas_object|210|0|308|0|{unused0_metadata|read_metadata|0|0|}69|91|}
{2010006001|XXGobject_psameas_object|211|0|309|0|{unused1_metadata|read_metadata|0|0|}69|95|}
{2010006001|XXGobject_psameas_object|212|0|310|0|{write_metadata|out_metadata|0|0|}63|69|}
{2010006001|XXGobject_psameas_object|213|0|311|0|{in_metadata|out_metadata|0|0|}51|69|}
{2010006001|XXGobject_psameas_object|214|0|312|0|{reject0_metadata|out_metadata|0|0|}51|69|}
{2010006001|XXGobject_psameas_object|215|0|313|0|{in1_metadata|out_metadata|0|0|}29|99|}
{2010212001|XXGvertex_oport_oport|216|0|315|0|{0|out|}99|100|}
{2010211001|XXGvertex_iport_iport|217|0|317|0|{0|in|}99|101|}
{2010214001|XXGiport_src_flow|218|0|319|0|{0|}101|102|}
{2010006001|XXGobject_psameas_object|219|0|321|0|{in_metadata|out_metadata|0|0|}99|99|}
{2010006001|XXGobject_psameas_object|220|0|322|0|{reject0_metadata|out0_metadata|0|0|}29|51|}
{2010006001|XXGobject_psameas_object|221|0|323|0|{reject1_metadata|out_metadata|0|0|}29|99|}
{2010006001|XXGobject_psameas_object|222|0|324|0|{unused0_metadata|out0_metadata|0|0|}29|51|}
{2010006001|XXGobject_psameas_object|223|0|325|0|{unused1_metadata|out_metadata|0|0|}29|99|}
{2010006001|XXGobject_psameas_object|224|0|326|0|{in_metadata|out_metadata|0|0|}19|29|}
{2010006001|XXGobject_psameas_object|225|0|327|0|{out_metadata|out_metadata|0|0|}19|29|}
{2010601001|XXGgraph_vertex_vertex|226|0|328|0|{IFIL_Event_File|}1|95|}
{2010601001|XXGgraph_vertex_vertex|227|0|329|0|{IFIL_Split_file|}1|91|}
{2010601001|XXGgraph_vertex_vertex|228|0|330|0|{ITAB_Unload_mbr_adjud_sk_and_mbr_age|}1|103|}
{2010212001|XXGvertex_oport_oport|229|0|332|0|{0|read|}103|104|}
{2010213001|XXGoport_dst_flow|230|0|334|0|{0|}104|18|}
{2010212001|XXGvertex_oport_oport|231|0|335|0|{1|log|}103|105|}
{2010007001|XXGobject_proto_object|232|0|337|0|{}103|106|}
{2010212001|XXGvertex_oport_oport|233|0|339|0|{0|read|}106|107|}
{2010006001|XXGobject_psameas_object|234|0|341|0|{metadata|read_metadata|1|0|}107|106|}
{2010212001|XXGvertex_oport_oport|235|0|342|0|{1|log|}106|108|}
{2010006001|XXGobject_psameas_object|236|0|344|0|{metadata|log_metadata|1|0|}108|106|}
{2010006001|XXGobject_psameas_object|237|0|345|0|{Layout|table_spec|0|1|}106|106|}
{2010006001|XXGobject_psameas_object|238|0|346|0|{read_metadata|out_metadata|0|0|}103|99|}
{2010601001|XXGgraph_vertex_vertex|239|0|347|0|{JOIN_NK|}1|69|}
{2010601001|XXGgraph_vertex_vertex|240|0|348|0|{JOIN_On_old_mbr_adjud_sk_and_new_mbr_age|}1|29|}
{2010601001|XXGgraph_vertex_vertex|241|0|349|0|{LKP_Wrong_dxf_sk|}1|109|}
{2010007001|XXGobject_proto_object|242|0|351|0|{}109|110|}
{2010601001|XXGgraph_vertex_vertex|243|0|353|0|{OTAB_Load_to_Staging|}1|111|}
{2010212001|XXGvertex_oport_oport|244|0|355|0|{0|reject|}111|112|}
{2010212001|XXGvertex_oport_oport|245|0|357|0|{1|error|}111|113|}
{2010212001|XXGvertex_oport_oport|246|0|359|0|{2|log|}111|114|}
{2010211001|XXGvertex_iport_iport|247|0|361|0|{0|write|}111|115|}
{2010007001|XXGobject_proto_object|248|0|363|0|{}111|116|}
{2010212001|XXGvertex_oport_oport|249|0|365|0|{0|reject|}116|117|}
{2010006001|XXGobject_psameas_object|250|0|367|0|{metadata|reject_metadata|1|0|}117|116|}
{2010212001|XXGvertex_oport_oport|251|0|368|0|{1|error|}116|118|}
{2010006001|XXGobject_psameas_object|252|0|370|0|{metadata|error_metadata|1|0|}118|116|}
{2010212001|XXGvertex_oport_oport|253|0|371|0|{2|log|}116|119|}
{2010006001|XXGobject_psameas_object|254|0|373|0|{metadata|log_metadata|1|0|}119|116|}
{2010211001|XXGvertex_iport_iport|255|0|374|0|{0|write|}116|120|}
{2010006001|XXGobject_psameas_object|256|0|376|0|{metadata|write_metadata|1|0|}120|116|}
{2010006001|XXGobject_psameas_object|257|0|377|0|{Layout|table_spec|0|1|}116|116|}
{2010601001|XXGgraph_vertex_vertex|258|0|378|0|{OTAB_Load_to_Staging_1|}1|121|}
{2010212001|XXGvertex_oport_oport|259|0|380|0|{0|reject|}121|122|}
{2010212001|XXGvertex_oport_oport|260|0|382|0|{1|error|}121|123|}
{2010212001|XXGvertex_oport_oport|261|0|384|0|{2|log|}121|124|}
{2010211001|XXGvertex_iport_iport|262|0|386|0|{0|write|}121|125|}
{2010007001|XXGobject_proto_object|263|0|388|0|{}121|126|}
{2010212001|XXGvertex_oport_oport|264|0|390|0|{0|reject|}126|127|}
{2010006001|XXGobject_psameas_object|265|0|392|0|{metadata|reject_metadata|1|0|}127|126|}
{2010212001|XXGvertex_oport_oport|266|0|393|0|{1|error|}126|128|}
{2010006001|XXGobject_psameas_object|267|0|395|0|{metadata|error_metadata|1|0|}128|126|}
{2010212001|XXGvertex_oport_oport|268|0|396|0|{2|log|}126|129|}
{2010006001|XXGobject_psameas_object|269|0|398|0|{metadata|log_metadata|1|0|}129|126|}
{2010211001|XXGvertex_iport_iport|270|0|399|0|{0|write|}126|130|}
{2010006001|XXGobject_psameas_object|271|0|401|0|{metadata|write_metadata|1|0|}130|126|}
{2010006001|XXGobject_psameas_object|272|0|402|0|{Layout|table_spec|0|1|}126|126|}
{2010601001|XXGgraph_vertex_vertex|273|0|403|0|{Output_File|}1|63|}
{2010601001|XXGgraph_vertex_vertex|274|0|404|0|{Output_File_1|}1|131|}
{2010211001|XXGvertex_iport_iport|275|0|406|0|{0|write|}131|132|}
{2010214001|XXGiport_src_flow|276|0|408|0|{0|}132|15|}
{2010007001|XXGobject_proto_object|277|0|409|0|{}131|133|}
{2010211001|XXGvertex_iport_iport|278|0|411|0|{0|write|}133|134|}
{2010006001|XXGobject_psameas_object|279|0|413|0|{metadata|write_metadata|1|0|}134|133|}
{2010006001|XXGobject_psameas_object|280|0|414|0|{write_metadata|read_metadata|0|0|}131|91|}
{2010601001|XXGgraph_vertex_vertex|281|0|415|0|{Output_File_2|}1|135|}
{2010211001|XXGvertex_iport_iport|282|0|417|0|{0|write|}135|136|}
{2010007001|XXGobject_proto_object|283|0|419|0|{}135|137|}
{2010211001|XXGvertex_iport_iport|284|0|421|0|{0|write|}137|138|}
{2010006001|XXGobject_psameas_object|285|0|423|0|{metadata|write_metadata|1|0|}138|137|}
{2010601001|XXGgraph_vertex_vertex|286|0|424|0|{Output_File_3|}1|25|}
{2010601001|XXGgraph_vertex_vertex|287|0|425|0|{PBKS_NK|}1|139|}
{2010604001|XXGgraph_flow_flow|288|0|427|0|{Flow_1|}139|140|}
{2010601001|XXGgraph_vertex_vertex|289|0|429|0|{Partition_by_Key|}139|141|}
{2010212001|XXGvertex_oport_oport|290|0|431|0|{0|out|}141|142|}
{2010213001|XXGoport_dst_flow|291|0|433|0|{0|}142|140|}
{2010211001|XXGvertex_iport_iport|292|0|434|0|{0|in|}141|143|}
{2010006001|XXGobject_psameas_object|293|0|436|0|{in_metadata|read_metadata|0|0|}141|91|}
{2010006001|XXGobject_psameas_object|294|0|437|0|{out_metadata|read_metadata|0|0|}141|91|}
{2010601001|XXGgraph_vertex_vertex|295|0|438|0|{Sort|}139|144|}
{2010212001|XXGvertex_oport_oport|296|0|440|0|{0|out|}144|145|}
{2010211001|XXGvertex_iport_iport|297|0|442|0|{0|in|}144|146|}
{2010214001|XXGiport_src_flow|298|0|444|0|{0|}146|140|}
{2010006001|XXGobject_psameas_object|299|0|445|0|{in_metadata|read_metadata|0|0|}144|91|}
{2010006001|XXGobject_psameas_object|300|0|446|0|{out_metadata|read_metadata|0|0|}144|91|}
{2010212001|XXGvertex_oport_oport|301|0|447|0|{0|out0|}139|147|}
{2010216002|XXGoport_binding_oport|302|0|449|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}147|145|}
{2010213001|XXGoport_dst_flow|303|0|450|0|{0|}147|12|}
{2010211001|XXGvertex_iport_iport|304|0|451|0|{0|in0|}139|148|}
{2010215002|XXGiport_binding_iport|305|0|453|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}148|143|}
{2010214001|XXGiport_src_flow|306|0|454|0|{0|}148|5|}
{2010007001|XXGobject_proto_object|307|0|455|0|{}139|149|}
{2010604001|XXGgraph_flow_flow|308|0|457|0|{Flow_1|}149|150|}
{2010601001|XXGgraph_vertex_vertex|309|0|459|0|{Partition_by_Key|}149|151|}
{2010212001|XXGvertex_oport_oport|310|0|461|0|{0|out|}151|152|}
{2010213001|XXGoport_dst_flow|311|0|463|0|{0|}152|150|}
{2010211001|XXGvertex_iport_iport|312|0|464|0|{0|in|}151|153|}
{2010007001|XXGobject_proto_object|313|0|466|0|{}151|154|}
{2010212001|XXGvertex_oport_oport|314|0|468|0|{0|out|}154|155|}
{2010006001|XXGobject_psameas_object|315|0|470|0|{metadata|out_metadata|1|0|}155|154|}
{2010211001|XXGvertex_iport_iport|316|0|471|0|{0|in|}154|156|}
{2010006001|XXGobject_psameas_object|317|0|473|0|{metadata|in_metadata|1|0|}156|154|}
{2010006001|XXGobject_psameas_object|318|0|474|0|{Layout|InputLayout|1|0|}151|149|}
{2010006001|XXGobject_psameas_object|319|0|475|0|{key|Key|1|0|}151|149|}
{2010601001|XXGgraph_vertex_vertex|320|0|476|0|{Sort|}149|157|}
{2010212001|XXGvertex_oport_oport|321|0|478|0|{0|out|}157|158|}
{2010211001|XXGvertex_iport_iport|322|0|480|0|{0|in|}157|159|}
{2010214001|XXGiport_src_flow|323|0|482|0|{0|}159|150|}
{2010007001|XXGobject_proto_object|324|0|483|0|{}157|160|}
{2010212001|XXGvertex_oport_oport|325|0|485|0|{0|out|}160|161|}
{2010006001|XXGobject_psameas_object|326|0|487|0|{metadata|out_metadata|1|0|}161|160|}
{2010211001|XXGvertex_iport_iport|327|0|488|0|{0|in|}160|162|}
{2010006001|XXGobject_psameas_object|328|0|490|0|{metadata|in_metadata|1|0|}162|160|}
{2010006001|XXGobject_psameas_object|329|0|491|0|{Layout|OutputLayout|1|0|}157|149|}
{2010006001|XXGobject_psameas_object|330|0|492|0|{key|Key|1|0|}157|149|}
{2010006001|XXGobject_psameas_object|331|0|493|0|{max_core|Max_core|1|0|}157|149|}
{2010212001|XXGvertex_oport_oport|332|0|494|0|{0|out0|}149|163|}
{2010216002|XXGoport_binding_oport|333|0|496|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}163|158|}
{2010211001|XXGvertex_iport_iport|334|0|497|0|{0|in0|}149|164|}
{2010215002|XXGiport_binding_iport|335|0|499|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}164|153|}
{2010006001|XXGobject_psameas_object|336|0|500|0|{InputLayout|Layout|0|0|}139|91|}
{2010006001|XXGobject_psameas_object|337|0|501|0|{OutputLayout|Layout|0|0|}139|63|}
{2010601001|XXGgraph_vertex_vertex|338|0|502|0|{PBKS_NK_1|}1|165|}
{2010604001|XXGgraph_flow_flow|339|0|504|0|{Flow_1|}165|166|}
{2010601001|XXGgraph_vertex_vertex|340|0|506|0|{Partition_by_Key|}165|167|}
{2010212001|XXGvertex_oport_oport|341|0|508|0|{0|out|}167|168|}
{2010213001|XXGoport_dst_flow|342|0|510|0|{0|}168|166|}
{2010211001|XXGvertex_iport_iport|343|0|511|0|{0|in|}167|169|}
{2010006001|XXGobject_psameas_object|344|0|513|0|{in_metadata|read_metadata|0|0|}167|95|}
{2010006001|XXGobject_psameas_object|345|0|514|0|{out_metadata|read_metadata|0|0|}167|95|}
{2010601001|XXGgraph_vertex_vertex|346|0|515|0|{Sort|}165|170|}
{2010212001|XXGvertex_oport_oport|347|0|517|0|{0|out|}170|171|}
{2010211001|XXGvertex_iport_iport|348|0|519|0|{0|in|}170|172|}
{2010214001|XXGiport_src_flow|349|0|521|0|{0|}172|166|}
{2010006001|XXGobject_psameas_object|350|0|522|0|{in_metadata|read_metadata|0|0|}170|95|}
{2010006001|XXGobject_psameas_object|351|0|523|0|{out_metadata|read_metadata|0|0|}170|95|}
{2010212001|XXGvertex_oport_oport|352|0|524|0|{0|out0|}165|173|}
{2010216002|XXGoport_binding_oport|353|0|526|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}173|171|}
{2010213001|XXGoport_dst_flow|354|0|527|0|{0|}173|13|}
{2010211001|XXGvertex_iport_iport|355|0|528|0|{0|in0|}165|174|}
{2010215002|XXGiport_binding_iport|356|0|530|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}174|169|}
{2010214001|XXGiport_src_flow|357|0|531|0|{0|}174|11|}
{2010007001|XXGobject_proto_object|358|0|532|0|{}165|175|}
{2010604001|XXGgraph_flow_flow|359|0|534|0|{Flow_1|}175|176|}
{2010601001|XXGgraph_vertex_vertex|360|0|536|0|{Partition_by_Key|}175|177|}
{2010212001|XXGvertex_oport_oport|361|0|538|0|{0|out|}177|178|}
{2010213001|XXGoport_dst_flow|362|0|540|0|{0|}178|176|}
{2010211001|XXGvertex_iport_iport|363|0|541|0|{0|in|}177|179|}
{2010007001|XXGobject_proto_object|364|0|543|0|{}177|180|}
{2010212001|XXGvertex_oport_oport|365|0|545|0|{0|out|}180|181|}
{2010006001|XXGobject_psameas_object|366|0|547|0|{metadata|out_metadata|1|0|}181|180|}
{2010211001|XXGvertex_iport_iport|367|0|548|0|{0|in|}180|182|}
{2010006001|XXGobject_psameas_object|368|0|550|0|{metadata|in_metadata|1|0|}182|180|}
{2010006001|XXGobject_psameas_object|369|0|551|0|{Layout|InputLayout|1|0|}177|175|}
{2010006001|XXGobject_psameas_object|370|0|552|0|{key|Key|1|0|}177|175|}
{2010601001|XXGgraph_vertex_vertex|371|0|553|0|{Sort|}175|183|}
{2010212001|XXGvertex_oport_oport|372|0|555|0|{0|out|}183|184|}
{2010211001|XXGvertex_iport_iport|373|0|557|0|{0|in|}183|185|}
{2010214001|XXGiport_src_flow|374|0|559|0|{0|}185|176|}
{2010007001|XXGobject_proto_object|375|0|560|0|{}183|186|}
{2010212001|XXGvertex_oport_oport|376|0|562|0|{0|out|}186|187|}
{2010006001|XXGobject_psameas_object|377|0|564|0|{metadata|out_metadata|1|0|}187|186|}
{2010211001|XXGvertex_iport_iport|378|0|565|0|{0|in|}186|188|}
{2010006001|XXGobject_psameas_object|379|0|567|0|{metadata|in_metadata|1|0|}188|186|}
{2010006001|XXGobject_psameas_object|380|0|568|0|{Layout|OutputLayout|1|0|}183|175|}
{2010006001|XXGobject_psameas_object|381|0|569|0|{key|Key|1|0|}183|175|}
{2010006001|XXGobject_psameas_object|382|0|570|0|{max_core|Max_core|1|0|}183|175|}
{2010212001|XXGvertex_oport_oport|383|0|571|0|{0|out0|}175|189|}
{2010216002|XXGoport_binding_oport|384|0|573|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}189|184|}
{2010211001|XXGvertex_iport_iport|385|0|574|0|{0|in0|}175|190|}
{2010215002|XXGiport_binding_iport|386|0|576|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}190|179|}
{2010006001|XXGobject_psameas_object|387|0|577|0|{InputLayout|Layout|0|0|}165|95|}
{2010006001|XXGobject_psameas_object|388|0|578|0|{OutputLayout|Layout|0|0|}165|63|}
{2010601001|XXGgraph_vertex_vertex|389|0|579|0|{PBKS_mbr_adjud_sk_new_mbr_age_|}1|191|}
{2010604001|XXGgraph_flow_flow|390|0|581|0|{Flow_1|}191|102|}
{2010601001|XXGgraph_vertex_vertex|391|0|582|0|{Partition_by_Key|}191|192|}
{2010212001|XXGvertex_oport_oport|392|0|584|0|{0|out|}192|193|}
{2010213001|XXGoport_dst_flow|393|0|586|0|{0|}193|102|}
{2010211001|XXGvertex_iport_iport|394|0|587|0|{0|in|}192|194|}
{2010006001|XXGobject_psameas_object|395|0|589|0|{in_metadata|out_metadata|0|0|}192|99|}
{2010006001|XXGobject_psameas_object|396|0|590|0|{out_metadata|out_metadata|0|0|}192|99|}
{2010601001|XXGgraph_vertex_vertex|397|0|591|0|{Sort|}191|99|}
{2010212001|XXGvertex_oport_oport|398|0|592|0|{0|out0|}191|195|}
{2010216002|XXGoport_binding_oport|399|0|594|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}195|100|}
{2010213001|XXGoport_dst_flow|400|0|595|0|{0|}195|17|}
{2010211001|XXGvertex_iport_iport|401|0|596|0|{0|in0|}191|196|}
{2010215002|XXGiport_binding_iport|402|0|598|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}196|194|}
{2010214001|XXGiport_src_flow|403|0|599|0|{0|}196|18|}
{2010007001|XXGobject_proto_object|404|0|600|0|{}191|197|}
{2010604001|XXGgraph_flow_flow|405|0|602|0|{Flow_1|}197|198|}
{2010601001|XXGgraph_vertex_vertex|406|0|604|0|{Partition_by_Key|}197|199|}
{2010212001|XXGvertex_oport_oport|407|0|606|0|{0|out|}199|200|}
{2010213001|XXGoport_dst_flow|408|0|608|0|{0|}200|198|}
{2010211001|XXGvertex_iport_iport|409|0|609|0|{0|in|}199|201|}
{2010007001|XXGobject_proto_object|410|0|611|0|{}199|202|}
{2010212001|XXGvertex_oport_oport|411|0|613|0|{0|out|}202|203|}
{2010006001|XXGobject_psameas_object|412|0|615|0|{metadata|out_metadata|1|0|}203|202|}
{2010211001|XXGvertex_iport_iport|413|0|616|0|{0|in|}202|204|}
{2010006001|XXGobject_psameas_object|414|0|618|0|{metadata|in_metadata|1|0|}204|202|}
{2010006001|XXGobject_psameas_object|415|0|619|0|{Layout|InputLayout|1|0|}199|197|}
{2010006001|XXGobject_psameas_object|416|0|620|0|{key|Key|1|0|}199|197|}
{2010601001|XXGgraph_vertex_vertex|417|0|621|0|{Sort|}197|205|}
{2010212001|XXGvertex_oport_oport|418|0|623|0|{0|out|}205|206|}
{2010211001|XXGvertex_iport_iport|419|0|625|0|{0|in|}205|207|}
{2010214001|XXGiport_src_flow|420|0|627|0|{0|}207|198|}
{2010007001|XXGobject_proto_object|421|0|628|0|{}205|208|}
{2010212001|XXGvertex_oport_oport|422|0|630|0|{0|out|}208|209|}
{2010006001|XXGobject_psameas_object|423|0|632|0|{metadata|out_metadata|1|0|}209|208|}
{2010211001|XXGvertex_iport_iport|424|0|633|0|{0|in|}208|210|}
{2010006001|XXGobject_psameas_object|425|0|635|0|{metadata|in_metadata|1|0|}210|208|}
{2010006001|XXGobject_psameas_object|426|0|636|0|{Layout|OutputLayout|1|0|}205|197|}
{2010006001|XXGobject_psameas_object|427|0|637|0|{key|Key|1|0|}205|197|}
{2010006001|XXGobject_psameas_object|428|0|638|0|{max_core|Max_core|1|0|}205|197|}
{2010212001|XXGvertex_oport_oport|429|0|639|0|{0|out0|}197|211|}
{2010216002|XXGoport_binding_oport|430|0|641|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}211|206|}
{2010211001|XXGvertex_iport_iport|431|0|642|0|{0|in0|}197|212|}
{2010215002|XXGiport_binding_iport|432|0|644|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}212|201|}
{2010006001|XXGobject_psameas_object|433|0|645|0|{InputLayout|Layout|0|0|}191|103|}
{2010006001|XXGobject_psameas_object|434|0|646|0|{OutputLayout|Layout|0|0|}191|29|}
{2010601001|XXGgraph_vertex_vertex|435|0|647|0|{PBKS_split_file_old_mbr_adjud_sk_event_file_mbr_calc_age_|}1|213|}
{2010604001|XXGgraph_flow_flow|436|0|649|0|{Flow_1|}213|214|}
{2010601001|XXGgraph_vertex_vertex|437|0|651|0|{Partition_by_Key|}213|215|}
{2010212001|XXGvertex_oport_oport|438|0|653|0|{0|out|}215|216|}
{2010213001|XXGoport_dst_flow|439|0|655|0|{0|}216|214|}
{2010211001|XXGvertex_iport_iport|440|0|656|0|{0|in|}215|217|}
{2010006001|XXGobject_psameas_object|441|0|658|0|{in_metadata|out0_metadata|0|0|}215|51|}
{2010006001|XXGobject_psameas_object|442|0|659|0|{out_metadata|out0_metadata|0|0|}215|51|}
{2010601001|XXGgraph_vertex_vertex|443|0|660|0|{Sort|}213|218|}
{2010212001|XXGvertex_oport_oport|444|0|662|0|{0|out|}218|219|}
{2010211001|XXGvertex_iport_iport|445|0|664|0|{0|in|}218|220|}
{2010214001|XXGiport_src_flow|446|0|666|0|{0|}220|214|}
{2010006001|XXGobject_psameas_object|447|0|667|0|{in_metadata|out0_metadata|0|0|}218|51|}
{2010006001|XXGobject_psameas_object|448|0|668|0|{out_metadata|out0_metadata|0|0|}218|51|}
{2010212001|XXGvertex_oport_oport|449|0|669|0|{0|out0|}213|221|}
{2010216002|XXGoport_binding_oport|450|0|671|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}221|219|}
{2010213001|XXGoport_dst_flow|451|0|672|0|{0|}221|16|}
{2010211001|XXGvertex_iport_iport|452|0|673|0|{0|in0|}213|222|}
{2010215002|XXGiport_binding_iport|453|0|675|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}222|217|}
{2010214001|XXGiport_src_flow|454|0|676|0|{0|}222|8|}
{2010007001|XXGobject_proto_object|455|0|677|0|{}213|223|}
{2010604001|XXGgraph_flow_flow|456|0|679|0|{Flow_1|}223|224|}
{2010601001|XXGgraph_vertex_vertex|457|0|681|0|{Partition_by_Key|}223|225|}
{2010212001|XXGvertex_oport_oport|458|0|683|0|{0|out|}225|226|}
{2010213001|XXGoport_dst_flow|459|0|685|0|{0|}226|224|}
{2010211001|XXGvertex_iport_iport|460|0|686|0|{0|in|}225|227|}
{2010007001|XXGobject_proto_object|461|0|688|0|{}225|228|}
{2010212001|XXGvertex_oport_oport|462|0|690|0|{0|out|}228|229|}
{2010006001|XXGobject_psameas_object|463|0|692|0|{metadata|out_metadata|1|0|}229|228|}
{2010211001|XXGvertex_iport_iport|464|0|693|0|{0|in|}228|230|}
{2010006001|XXGobject_psameas_object|465|0|695|0|{metadata|in_metadata|1|0|}230|228|}
{2010006001|XXGobject_psameas_object|466|0|696|0|{Layout|InputLayout|1|0|}225|223|}
{2010006001|XXGobject_psameas_object|467|0|697|0|{key|Key|1|0|}225|223|}
{2010601001|XXGgraph_vertex_vertex|468|0|698|0|{Sort|}223|231|}
{2010212001|XXGvertex_oport_oport|469|0|700|0|{0|out|}231|232|}
{2010211001|XXGvertex_iport_iport|470|0|702|0|{0|in|}231|233|}
{2010214001|XXGiport_src_flow|471|0|704|0|{0|}233|224|}
{2010007001|XXGobject_proto_object|472|0|705|0|{}231|234|}
{2010212001|XXGvertex_oport_oport|473|0|707|0|{0|out|}234|235|}
{2010006001|XXGobject_psameas_object|474|0|709|0|{metadata|out_metadata|1|0|}235|234|}
{2010211001|XXGvertex_iport_iport|475|0|710|0|{0|in|}234|236|}
{2010006001|XXGobject_psameas_object|476|0|712|0|{metadata|in_metadata|1|0|}236|234|}
{2010006001|XXGobject_psameas_object|477|0|713|0|{Layout|OutputLayout|1|0|}231|223|}
{2010006001|XXGobject_psameas_object|478|0|714|0|{key|Key|1|0|}231|223|}
{2010006001|XXGobject_psameas_object|479|0|715|0|{max_core|Max_core|1|0|}231|223|}
{2010212001|XXGvertex_oport_oport|480|0|716|0|{0|out0|}223|237|}
{2010216002|XXGoport_binding_oport|481|0|718|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}237|232|}
{2010211001|XXGvertex_iport_iport|482|0|719|0|{0|in0|}223|238|}
{2010215002|XXGiport_binding_iport|483|0|721|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}238|227|}
{2010006001|XXGobject_psameas_object|484|0|722|0|{InputLayout|Layout|0|0|}213|63|}
{2010006001|XXGobject_psameas_object|485|0|723|0|{OutputLayout|Layout|0|0|}213|29|}
{2010601001|XXGgraph_vertex_vertex|486|0|724|0|{RFMT_For_Mapping_for_join_key_fields|}1|51|}
{2010601001|XXGgraph_vertex_vertex|487|0|725|0|{Replicate_1|}1|239|}
{2010212001|XXGvertex_oport_oport|488|0|727|0|{0|out|}239|240|}
{2010213001|XXGoport_dst_flow|489|0|729|0|{0|}240|9|}
{2010211001|XXGvertex_iport_iport|490|0|730|0|{0|in|}239|241|}
{2010214001|XXGiport_src_flow|491|0|732|0|{0|}241|6|}
{2010007001|XXGobject_proto_object|492|0|733|0|{}239|242|}
{2010212001|XXGvertex_oport_oport|493|0|735|0|{0|out|}242|243|}
{2010006001|XXGobject_psameas_object|494|0|737|0|{metadata|out_metadata|1|0|}243|242|}
{2010211001|XXGvertex_iport_iport|495|0|738|0|{0|in|}242|244|}
{2010006001|XXGobject_psameas_object|496|0|740|0|{metadata|in_metadata|1|0|}244|242|}
{2010006001|XXGobject_psameas_object|497|0|741|0|{Layout|Layout|0|0|}239|25|}
{2010006001|XXGobject_psameas_object|498|0|742|0|{in_metadata|out_metadata|0|0|}239|29|}
{2010006001|XXGobject_psameas_object|499|0|743|0|{out_metadata|out_metadata|0|0|}239|29|}
{2010109001|XXGobject_property_value|500|0|744|0|{0|TrackingThumbprint|72|}1|245|}
