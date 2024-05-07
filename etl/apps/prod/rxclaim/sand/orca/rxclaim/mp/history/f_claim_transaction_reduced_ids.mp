@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|96|rel_count|164|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|9|FK|@{0|}}
{30001002|XXparameter|SYSTEM|ids_rxclaim|3|9|FK|@{0|}}
{30001002|XXparameter|TABLE|f_claim_transaction|3|9|FK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|A common fixed ( Hardcoded)  ICFF key used across ORCA . |{0|}}
{30001002|XXparameter|REDUCED_ICFF_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced.dat.gz|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_INDEX_FILE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced.idx|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|IDS_REDUCED_DML|$PUB_DATAHUB_DML/$SYSTEM/$SYSTEM.$TABLE.reduced.dml|3|9|RFK|@{0|}}
{30001002|XXparameter|REDUCED_ICFF_FILE_ARCHIVE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced.archive.dat.gz|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_INDEX_FILE_ARCHIVE|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced.archive.idx|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_ICFF_FILE_BKP|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced_bkp.dat.gz|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_INDEX_FILE_BKP|$PUB_DATAHUB_MFS_LOOKUP/ids/$SYSTEM/one/$TABLE.reduced_bkp.idx|3|9|FK|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|rcpdtp_reduced_ids|spulikon|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1361000|763000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'f_claim_transaction_reduced_ids' Execution Status Report

Job completed successfully at Friday, September 29, 2017 11:04:02
Run performed by user schatt14
||
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@sbm_dt_sk > 20161231 \|\|  filled_dt_sk > 20161231|467000|54000|0|0|0|0|13497|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}13434|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}13503|17|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}13456|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}13505|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}13511|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}13507|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13509|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.39753085374832153|.5|{0|}13495|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}13501|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}13494|17|}}
{2010503005|XXGfvertex|17|0|33|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE_BKP|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|//[aiorcrxc\@apsrp7996 main one]$ cat /etl/apps/prod/rxclaim/sand/aicoe/pub_datahub/dml/ids_rxclaim/ids_rxclaim.f_claim_transaction.reduced.dml
record
  little endian integer(8) dxf_src_dataset_id = 0;
  little endian integer(4) dxf_src_rec_cnt = 0;
  little endian integer(2) dxf_src_sys_id = 0;
  string(unsigned integer(1)) dxf_src_file_name = "";
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0)    claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0)    claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)    claim_stat_id = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30)  carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40)  account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=15)  employer_group_id = NULL("") /*VARCHAR(15)*/;
  decimal("\\x01",0)  src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0)  mbr_sk = NULL("");
  decimal("\\x01",0)  cag_sk = NULL("");
  decimal("\\x01",0)  mbr_adjud_sk = NULL("");
  decimal("\\x01",0)  pbr_sk = NULL("");
  decimal("\\x01",0)  pbr_adjud_sk = NULL("");
  decimal("\\x01",0)  phr_sk = NULL("");
  decimal("\\x01",0)  phr_adjud_sk = NULL("");
  decimal("\\x01",0)  pln_adjud_sk = NULL("");
  decimal("\\x01",0)  prod_sk = NULL("");
  decimal("\\x01",0)  prod_adjud_sk = NULL("");
  decimal("\\x01",0)  care_fac_adjud_sk = NULL("");
  decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) orig_cag_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) orig_carrier_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40) orig_account_id = NULL("") /*VARCHAR(40)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) orig_employer_group_id = NULL("") /*VARCHAR(30)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) orig_member_id = NULL("") /*VARCHAR(20)*/;
  decimal("\\x01",0) claim_seq_nbr_src = NULL("") /*INTEGER*/;
  decimal("\\x01",0) sbm_dt_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") sbm_dt = NULL("") /*DATE*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) refill_nbr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved) awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0) refill_max = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_sply = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_create_run_id =    0;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_updt_run_id =    0;
  string("\\x01",maximum_length=2)    ids_rec_stat_cd = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
}}@0|@48000|189500|0|0|0|0|13512|Existing IDS file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|18|0|35|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|19|0|38|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|20|0|40|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|21|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|sbm_dt_sk > 20161231 \|\|  filled_dt_sk > 20161231|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|500000|80000|0|0|0|0|13496|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|22|0|45|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|23|0|48|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|24|0|51|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|25|0|53|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|26|0|55|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|27|0|57|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|28|0|60|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
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
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|29|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|30|0|65|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|31|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|32|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|33|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|34|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|35|0|80|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@1229500|162750|0|0|0|0|13502|REDUCED ICFF New|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|36|0|82|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|37|0|85|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|38|0|87|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|39|0|90|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$IDS_REDUCED_DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|260000|100000|0|0|0|0|13510|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|40|0|92|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|41|0|95|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|42|0|97|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|43|0|99|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|101|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|104|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|46|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|47|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|48|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|49|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|50|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|51|0|128|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
}}@0|@1249500|522750|0|0|0|0|13504|REDUCED ICFF-ARCHIVE|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|52|0|130|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|53|0|133|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|54|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|55|0|139|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_INDEX_FILE_ARCHIVE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
}}@0|@1265500|692750|0|0|0|0|13508|REDUCED Index ARCHIVE|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|56|0|141|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|57|0|144|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|58|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|59|0|149|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
}}@0|@1270500|332750|0|0|0|0|13506|REDUCED Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|60|0|151|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|61|0|154|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|62|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|63|0|160|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|766000|176000|0|0|0|0|13433|Sort on ICFF_KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|162|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|65|0|165|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|66|0|168|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|67|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|68|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|179|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|436000|506000|0|0|0|0|13457|Sort on ICFF_KEY-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|181|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|71|0|184|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|72|0|187|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|73|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|74|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|75|0|198|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@970500|222750|0|0|0|0|13437|WBCL: To reduced IDS|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|76|0|200|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|77|0|203|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|78|0|206|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|79|0|208|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|211|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|81|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|82|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|83|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|84|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@815500|477750|0|0|0|0|13443|WBCL: To reduced IDS-1|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|86|0|230|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|87|0|233|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|88|0|236|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|89|0|238|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|241|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|91|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|93|0|249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|94|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|95|0|258|0|{@{}@{1|106344|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_10|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_2|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_3|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_4|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_5|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_6|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_7|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_8|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_9|}1|16|}
{2010601001|XXGgraph_vertex_vertex|16|0|32|0|{Existing_IDS_file|}1|17|}
{2010212001|XXGvertex_oport_oport|17|0|34|0|{0|read|}17|18|}
{2010213001|XXGoport_dst_flow|18|0|36|0|{0|}18|11|}
{2010007001|XXGobject_proto_object|19|0|37|0|{}17|19|}
{2010212001|XXGvertex_oport_oport|20|0|39|0|{0|read|}19|20|}
{2010006001|XXGobject_psameas_object|21|0|41|0|{metadata|read_metadata|1|0|}20|19|}
{2010601001|XXGgraph_vertex_vertex|22|0|42|0|{Filter_by_Expression|}1|21|}
{2010212001|XXGvertex_oport_oport|23|0|44|0|{0|out|}21|22|}
{2010213001|XXGoport_dst_flow|24|0|46|0|{0|}22|16|}
{2010212001|XXGvertex_oport_oport|25|0|47|0|{1|deselect|}21|23|}
{2010213001|XXGoport_dst_flow|26|0|49|0|{0|}23|14|}
{2010212001|XXGvertex_oport_oport|27|0|50|0|{2|reject|}21|24|}
{2010212001|XXGvertex_oport_oport|28|0|52|0|{3|error|}21|25|}
{2010212001|XXGvertex_oport_oport|29|0|54|0|{4|log|}21|26|}
{2010211001|XXGvertex_iport_iport|30|0|56|0|{0|in|}21|27|}
{2010214001|XXGiport_src_flow|31|0|58|0|{0|}27|13|}
{2010007001|XXGobject_proto_object|32|0|59|0|{}21|28|}
{2010212001|XXGvertex_oport_oport|33|0|61|0|{0|out|}28|29|}
{2010006001|XXGobject_psameas_object|34|0|63|0|{metadata|out_metadata|1|0|}29|28|}
{2010212001|XXGvertex_oport_oport|35|0|64|0|{1|deselect|}28|30|}
{2010006001|XXGobject_psameas_object|36|0|66|0|{metadata|deselect_metadata|1|0|}30|28|}
{2010212001|XXGvertex_oport_oport|37|0|67|0|{2|reject|}28|31|}
{2010006001|XXGobject_psameas_object|38|0|69|0|{metadata|reject_metadata|1|0|}31|28|}
{2010212001|XXGvertex_oport_oport|39|0|70|0|{3|error|}28|32|}
{2010006001|XXGobject_psameas_object|40|0|72|0|{metadata|error_metadata|1|0|}32|28|}
{2010212001|XXGvertex_oport_oport|41|0|73|0|{4|log|}28|33|}
{2010006001|XXGobject_psameas_object|42|0|75|0|{metadata|log_metadata|1|0|}33|28|}
{2010211001|XXGvertex_iport_iport|43|0|76|0|{0|in|}28|34|}
{2010006001|XXGobject_psameas_object|44|0|78|0|{metadata|in_metadata|1|0|}34|28|}
{2010006001|XXGobject_psameas_object|45|0|79|0|{Layout|Layout|0|0|}21|35|}
{2010211001|XXGvertex_iport_iport|46|0|81|0|{0|write|}35|36|}
{2010214001|XXGiport_src_flow|47|0|83|0|{0|}36|15|}
{2010007001|XXGobject_proto_object|48|0|84|0|{}35|37|}
{2010211001|XXGvertex_iport_iport|49|0|86|0|{0|write|}37|38|}
{2010006001|XXGobject_psameas_object|50|0|88|0|{metadata|write_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|51|0|89|0|{deselect_metadata|out0_metadata|0|0|}21|39|}
{2010212001|XXGvertex_oport_oport|52|0|91|0|{0|out0|}39|40|}
{2010213001|XXGoport_dst_flow|53|0|93|0|{0|}40|13|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{1|reject0|}39|41|}
{2010212001|XXGvertex_oport_oport|55|0|96|0|{2|error0|}39|42|}
{2010212001|XXGvertex_oport_oport|56|0|98|0|{3|log|}39|43|}
{2010211001|XXGvertex_iport_iport|57|0|100|0|{0|in|}39|44|}
{2010214001|XXGiport_src_flow|58|0|102|0|{0|}44|11|}
{2010007001|XXGobject_proto_object|59|0|103|0|{}39|45|}
{2010212001|XXGvertex_oport_oport|60|0|105|0|{0|out0|}45|46|}
{2010006001|XXGobject_psameas_object|61|0|107|0|{metadata|out0_metadata|1|0|}46|45|}
{2010006001|XXGobject_psameas_object|62|0|108|0|{transform0|transform0|1|0|}46|45|}
{2010212001|XXGvertex_oport_oport|63|0|109|0|{1|reject0|}45|47|}
{2010006001|XXGobject_psameas_object|64|0|111|0|{metadata|reject0_metadata|1|0|}47|45|}
{2010212001|XXGvertex_oport_oport|65|0|112|0|{2|error0|}45|48|}
{2010006001|XXGobject_psameas_object|66|0|114|0|{metadata|error0_metadata|1|0|}48|45|}
{2010212001|XXGvertex_oport_oport|67|0|115|0|{3|log|}45|49|}
{2010006001|XXGobject_psameas_object|68|0|117|0|{metadata|log_metadata|1|0|}49|45|}
{2010211001|XXGvertex_iport_iport|69|0|118|0|{0|in|}45|50|}
{2010006001|XXGobject_psameas_object|70|0|120|0|{metadata|in_metadata|1|0|}50|45|}
{2010006001|XXGobject_psameas_object|71|0|121|0|{Layout|Layout|0|0|}39|35|}
{2010006001|XXGobject_psameas_object|72|0|122|0|{in_metadata|read_metadata|0|0|}39|17|}
{2010006001|XXGobject_psameas_object|73|0|123|0|{reject0_metadata|read_metadata|0|0|}39|17|}
{2010006001|XXGobject_psameas_object|74|0|124|0|{in_metadata|out0_metadata|0|0|}21|39|}
{2010006001|XXGobject_psameas_object|75|0|125|0|{out_metadata|out0_metadata|0|0|}21|39|}
{2010006001|XXGobject_psameas_object|76|0|126|0|{reject_metadata|out0_metadata|0|0|}21|39|}
{2010601001|XXGgraph_vertex_vertex|77|0|127|0|{REDUCED_ICFF_ARCHIVE|}1|51|}
{2010211001|XXGvertex_iport_iport|78|0|129|0|{0|write|}51|52|}
{2010214001|XXGiport_src_flow|79|0|131|0|{0|}52|8|}
{2010007001|XXGobject_proto_object|80|0|132|0|{}51|53|}
{2010211001|XXGvertex_iport_iport|81|0|134|0|{0|write|}53|54|}
{2010006001|XXGobject_psameas_object|82|0|136|0|{metadata|write_metadata|1|0|}54|53|}
{2010601001|XXGgraph_vertex_vertex|83|0|137|0|{REDUCED_ICFF_New|}1|35|}
{2010601001|XXGgraph_vertex_vertex|84|0|138|0|{REDUCED_Index_ARCHIVE|}1|55|}
{2010211001|XXGvertex_iport_iport|85|0|140|0|{0|write|}55|56|}
{2010214001|XXGiport_src_flow|86|0|142|0|{0|}56|12|}
{2010007001|XXGobject_proto_object|87|0|143|0|{}55|57|}
{2010211001|XXGvertex_iport_iport|88|0|145|0|{0|write|}57|58|}
{2010006001|XXGobject_psameas_object|89|0|147|0|{metadata|write_metadata|1|0|}58|57|}
{2010601001|XXGgraph_vertex_vertex|90|0|148|0|{REDUCED_Index_File|}1|59|}
{2010211001|XXGvertex_iport_iport|91|0|150|0|{0|write|}59|60|}
{2010214001|XXGiport_src_flow|92|0|152|0|{0|}60|10|}
{2010007001|XXGobject_proto_object|93|0|153|0|{}59|61|}
{2010211001|XXGvertex_iport_iport|94|0|155|0|{0|write|}61|62|}
{2010006001|XXGobject_psameas_object|95|0|157|0|{metadata|write_metadata|1|0|}62|61|}
{2010601001|XXGgraph_vertex_vertex|96|0|158|0|{Reformat|}1|39|}
{2010601001|XXGgraph_vertex_vertex|97|0|159|0|{Sort_on_ICFF_KEY|}1|63|}
{2010212001|XXGvertex_oport_oport|98|0|161|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|99|0|163|0|{0|}64|7|}
{2010211001|XXGvertex_iport_iport|100|0|164|0|{0|in|}63|65|}
{2010214001|XXGiport_src_flow|101|0|166|0|{0|}65|16|}
{2010007001|XXGobject_proto_object|102|0|167|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|103|0|169|0|{0|out|}66|67|}
{2010006001|XXGobject_psameas_object|104|0|171|0|{metadata|out_metadata|1|0|}67|66|}
{2010211001|XXGvertex_iport_iport|105|0|172|0|{0|in|}66|68|}
{2010006001|XXGobject_psameas_object|106|0|174|0|{metadata|in_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|107|0|175|0|{Layout|Layout|0|0|}63|35|}
{2010006001|XXGobject_psameas_object|108|0|176|0|{in_metadata|out0_metadata|0|0|}63|39|}
{2010006001|XXGobject_psameas_object|109|0|177|0|{out_metadata|out0_metadata|0|0|}63|39|}
{2010601001|XXGgraph_vertex_vertex|110|0|178|0|{Sort_on_ICFF_KEY_1|}1|69|}
{2010212001|XXGvertex_oport_oport|111|0|180|0|{0|out|}69|70|}
{2010213001|XXGoport_dst_flow|112|0|182|0|{0|}70|9|}
{2010211001|XXGvertex_iport_iport|113|0|183|0|{0|in|}69|71|}
{2010214001|XXGiport_src_flow|114|0|185|0|{0|}71|14|}
{2010007001|XXGobject_proto_object|115|0|186|0|{}69|72|}
{2010212001|XXGvertex_oport_oport|116|0|188|0|{0|out|}72|73|}
{2010006001|XXGobject_psameas_object|117|0|190|0|{metadata|out_metadata|1|0|}73|72|}
{2010211001|XXGvertex_iport_iport|118|0|191|0|{0|in|}72|74|}
{2010006001|XXGobject_psameas_object|119|0|193|0|{metadata|in_metadata|1|0|}74|72|}
{2010006001|XXGobject_psameas_object|120|0|194|0|{Layout|Layout|0|0|}69|51|}
{2010006001|XXGobject_psameas_object|121|0|195|0|{in_metadata|out0_metadata|0|0|}69|39|}
{2010006001|XXGobject_psameas_object|122|0|196|0|{out_metadata|out0_metadata|0|0|}69|39|}
{2010601001|XXGgraph_vertex_vertex|123|0|197|0|{WBCL_To_reduced_IDS|}1|75|}
{2010212001|XXGvertex_oport_oport|124|0|199|0|{0|out|}75|76|}
{2010213001|XXGoport_dst_flow|125|0|201|0|{0|}76|15|}
{2010212001|XXGvertex_oport_oport|126|0|202|0|{1|index|}75|77|}
{2010213001|XXGoport_dst_flow|127|0|204|0|{0|}77|10|}
{2010212001|XXGvertex_oport_oport|128|0|205|0|{2|address|}75|78|}
{2010211001|XXGvertex_iport_iport|129|0|207|0|{0|in|}75|79|}
{2010214001|XXGiport_src_flow|130|0|209|0|{0|}79|7|}
{2010007001|XXGobject_proto_object|131|0|210|0|{}75|80|}
{2010212001|XXGvertex_oport_oport|132|0|212|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|133|0|214|0|{metadata|out_metadata|1|0|}81|80|}
{2010212001|XXGvertex_oport_oport|134|0|215|0|{1|index|}80|82|}
{2010006001|XXGobject_psameas_object|135|0|217|0|{metadata|index_metadata|1|0|}82|80|}
{2010212001|XXGvertex_oport_oport|136|0|218|0|{2|address|}80|83|}
{2010006001|XXGobject_psameas_object|137|0|220|0|{metadata|address_metadata|1|0|}83|80|}
{2010211001|XXGvertex_iport_iport|138|0|221|0|{0|in|}80|84|}
{2010006001|XXGobject_psameas_object|139|0|223|0|{metadata|in_metadata|1|0|}84|80|}
{2010006001|XXGobject_psameas_object|140|0|224|0|{Layout|Layout|0|0|}75|35|}
{2010006001|XXGobject_psameas_object|141|0|225|0|{in_metadata|out0_metadata|0|0|}75|39|}
{2010006001|XXGobject_psameas_object|142|0|226|0|{out_metadata|write_metadata|0|0|}75|35|}
{2010601001|XXGgraph_vertex_vertex|143|0|227|0|{WBCL_To_reduced_IDS_1|}1|85|}
{2010212001|XXGvertex_oport_oport|144|0|229|0|{0|out|}85|86|}
{2010213001|XXGoport_dst_flow|145|0|231|0|{0|}86|8|}
{2010212001|XXGvertex_oport_oport|146|0|232|0|{1|index|}85|87|}
{2010213001|XXGoport_dst_flow|147|0|234|0|{0|}87|12|}
{2010212001|XXGvertex_oport_oport|148|0|235|0|{2|address|}85|88|}
{2010211001|XXGvertex_iport_iport|149|0|237|0|{0|in|}85|89|}
{2010214001|XXGiport_src_flow|150|0|239|0|{0|}89|9|}
{2010007001|XXGobject_proto_object|151|0|240|0|{}85|90|}
{2010212001|XXGvertex_oport_oport|152|0|242|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|153|0|244|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|154|0|245|0|{1|index|}90|92|}
{2010006001|XXGobject_psameas_object|155|0|247|0|{metadata|index_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|156|0|248|0|{2|address|}90|93|}
{2010006001|XXGobject_psameas_object|157|0|250|0|{metadata|address_metadata|1|0|}93|90|}
{2010211001|XXGvertex_iport_iport|158|0|251|0|{0|in|}90|94|}
{2010006001|XXGobject_psameas_object|159|0|253|0|{metadata|in_metadata|1|0|}94|90|}
{2010006001|XXGobject_psameas_object|160|0|254|0|{Layout|Layout|0|0|}85|51|}
{2010006001|XXGobject_psameas_object|161|0|255|0|{in_metadata|out0_metadata|0|0|}85|39|}
{2010006001|XXGobject_psameas_object|162|0|256|0|{out_metadata|write_metadata|0|0|}85|51|}
{2010109001|XXGobject_property_value|163|0|257|0|{0|TrackingThumbprint|72|}1|95|}
