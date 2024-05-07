@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|8|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|28|rel_count|43|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|FILENAME|rxclaim.f_claim_mic_detail.f_claim_mic_detail.insert.20200822121109|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|event_file_realign|naggar14|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|627000|157000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'event_file_realign' Execution Status Report

Job completed successfully at Sunday, August 23, 2020 13:11:24
Run performed by user naggar14
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@QA-apvrs55607||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}12|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}13|2065|}}
{2010503005|XXGfvertex|7|0|13|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: SELECT * FROM ADMIN.F_CLAIM_MIC_DETAIL
 * On: Tue Oct 25 02:54:34 2016
 */
record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) claim_mic_seq_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dsg_frm_sk = NULL("") /*BIGINT*/;
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
  decimal("\\x01",0) sbm_yr = NULL("") /*INTEGER*/;
  decimal("\\x01",0) sbm_mnth = NULL("") /*INTEGER*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) refill_nbr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved) awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0) refill_max = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_of_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) sbm_cmp_prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) sbm_cmp_prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) cmp_prod_key = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) prod_short_desc = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100) prod_nm = NULL("") /*VARCHAR(100)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_mfr_id = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100) drg_gnrc_nm = NULL("") /*VARCHAR(100)*/;
  decimal("\\x01",0) drg_desc_id = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) prod_kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prod_reim_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) brand_generic_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) sbm_cmp_ingred_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_cmp_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) sbm_cmp_basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ingred_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_cal_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_app_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_clt_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_app_cost_src_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cmd_app_cost_type_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_app_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_clt_cost_src_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cmd_clt_cost_type_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_awp_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_rm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_px_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_ms_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) phr_drg_cost_pct = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) rbl_drg_cost_pct = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01",0) cmd_ingred_mod_cd_cnt = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd1 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ing_dru_cov_sts = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) tc4_drg_cov_stat_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_anda_flg = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_exp_ingred_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",maximum_length=5) dxf_src_sys_id = 0;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_create_run_id =    0;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_updt_run_id =    0;
  string("\\x01",maximum_length=2)    ids_rec_stat_cd = NULL("");
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/$\{FILENAME\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/$\{FILENAME\}.dat.gz|3|2|$|@{0|}}
}}@0|Input File|80000|80000|0|0|0|0|11|Input File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010203004|XXGoport|8|0|15|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1571783021|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|10|0|20|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|11|0|23|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|/* DML Generated for SQL: SELECT * FROM ADMIN.F_CLAIM_MIC_DETAIL
 * On: Tue Oct 25 02:54:34 2016
 */
record
  decimal("\\x01",maximum_length=5) dxf_src_sys_id = 0;
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01",0) claim_nbr = NULL("") /*BIGINT*/;
  decimal("\\x01",0) claim_seq_nbr = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claim_stat_id = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) claim_mic_seq_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) claim_stat_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) carrier_acct_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) cag_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) mbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) final_pln_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) phr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) pbr_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) compound_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) prod_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gpi_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) ahfs_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_rx_otc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) drug_maint_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) admin_rte_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_mdspn_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) gnrc_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dea_cd_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dsg_frm_sk = NULL("") /*BIGINT*/;
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
  decimal("\\x01",0) sbm_yr = NULL("") /*INTEGER*/;
  decimal("\\x01",0) sbm_mnth = NULL("") /*INTEGER*/;
  decimal("\\x01",0) filled_dt_sk = NULL("") /*BIGINT*/;
  date("YYYYMMDD")("\\x01") filled_dt = NULL("") /*DATE*/;
  date("YYYYMMDD")("\\x01") rx_written_dt = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) rx_nbr = NULL("") /*VARCHAR(12)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) refill_nbr = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved) awp_unit_cost = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) extd_awp_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01",0) refill_max = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_of_supply = NULL("") /*SMALLINT*/;
  decimal("\\x01",0) days_of_supply_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) dmr_ind_sk = NULL("") /*BIGINT*/;
  decimal("\\x01",0) injectable_ind_sk = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) injectable_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) app_due_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) clt_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_ingred_cost_paid = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_dispensing_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_due_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) sbm_cmp_prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) sbm_cmp_prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0) cmp_prod_key = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=50) prod_short_desc = NULL("") /*VARCHAR(50)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100) prod_nm = NULL("") /*VARCHAR(100)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=5) drg_mfr_id = NULL("") /*VARCHAR(5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_mfr_nm = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=100) drg_gnrc_nm = NULL("") /*VARCHAR(100)*/;
  decimal("\\x01",0) drg_desc_id = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) gcn_seq_no = NULL("") /*INTEGER*/;
  decimal("\\x01",0) prod_kdc = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) prod_reim_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) brand_generic_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL("") /*DECIMAL(11,3)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) drg_strngth_uom_cd = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_3rd_prty_excpn_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) drg_unit_dose_use_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) sbm_cmp_ingred_qty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) sbm_cmp_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) sbm_cmp_basis_of_cost_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) ingred_stat_cd = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_cal_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_app_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_clt_ingred_cost_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_app_cost_src_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cmd_app_cost_type_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_app_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_clt_cost_src_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) cmd_clt_cost_type_cd = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_clt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved) cmd_awp_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_cal_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_app_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cmd_clt_prof_svc_fee = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_rm_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_px_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) eci_ms_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) phr_drg_cost_pct = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01".2, maximum_length=7, sign_reserved) rbl_drg_cost_pct = NULL("") /*DECIMAL(5,2)*/;
  decimal("\\x01",0) cmd_ingred_mod_cd_cnt = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd1 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd2 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) cmd_ingred_mod_cd3 = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ing_dru_cov_sts = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) tc4_drg_cov_stat_cd = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_nda_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_nda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_bla_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_bla_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_anda_flg = NULL("") /*BIGINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_ingred_anda_ovrd_flg = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) cmd_exp_ingred_flg = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0) src_env_sk = NULL("") /*BIGINT*/;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_create_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_create_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_create_run_id =    0;
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string("\\x01", maximum_length=20)    ids_updt_uid = NULL("");
  decimal("\\x01",maximum_length=20)    ids_updt_run_id =    0;
  string("\\x01",maximum_length=2)    ids_rec_stat_cd = NULL("");
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/$\{FILENAME\}.new.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/$\{FILENAME\}.new.dat.gz|3|2|$|@{0|}}
}}@0|Output File|539000|80000|0|0|0|0|10|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|12|0|25|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|13|0|28|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|14|0|30|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|15|0|33|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
}}@0|Reformat|283000|68000|0|0|0|0|14|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|16|0|35|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|17|0|38|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|18|0|40|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|19|0|42|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|20|0|44|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|21|0|47|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|22|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|23|0|53|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|24|0|56|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|25|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|26|0|62|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|27|0|69|0|{@{}@{1|6906874|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010601001|XXGgraph_vertex_vertex|6|0|12|0|{Input_File|}1|7|}
{2010212001|XXGvertex_oport_oport|7|0|14|0|{0|read|}7|8|}
{2010213001|XXGoport_dst_flow|8|0|16|0|{0|}8|5|}
{2010007001|XXGobject_proto_object|9|0|17|0|{}7|9|}
{2010212001|XXGvertex_oport_oport|10|0|19|0|{0|read|}9|10|}
{2010006001|XXGobject_psameas_object|11|0|21|0|{metadata|read_metadata|1|0|}10|9|}
{2010601001|XXGgraph_vertex_vertex|12|0|22|0|{Output_File|}1|11|}
{2010211001|XXGvertex_iport_iport|13|0|24|0|{0|write|}11|12|}
{2010214001|XXGiport_src_flow|14|0|26|0|{0|}12|6|}
{2010007001|XXGobject_proto_object|15|0|27|0|{}11|13|}
{2010211001|XXGvertex_iport_iport|16|0|29|0|{0|write|}13|14|}
{2010006001|XXGobject_psameas_object|17|0|31|0|{metadata|write_metadata|1|0|}14|13|}
{2010601001|XXGgraph_vertex_vertex|18|0|32|0|{Reformat|}1|15|}
{2010212001|XXGvertex_oport_oport|19|0|34|0|{0|out0|}15|16|}
{2010213001|XXGoport_dst_flow|20|0|36|0|{0|}16|6|}
{2010212001|XXGvertex_oport_oport|21|0|37|0|{1|reject0|}15|17|}
{2010212001|XXGvertex_oport_oport|22|0|39|0|{2|error0|}15|18|}
{2010212001|XXGvertex_oport_oport|23|0|41|0|{3|log|}15|19|}
{2010211001|XXGvertex_iport_iport|24|0|43|0|{0|in|}15|20|}
{2010214001|XXGiport_src_flow|25|0|45|0|{0|}20|5|}
{2010007001|XXGobject_proto_object|26|0|46|0|{}15|21|}
{2010212001|XXGvertex_oport_oport|27|0|48|0|{0|out0|}21|22|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{metadata|out0_metadata|1|0|}22|21|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{transform0|transform0|1|0|}22|21|}
{2010212001|XXGvertex_oport_oport|30|0|52|0|{1|reject0|}21|23|}
{2010006001|XXGobject_psameas_object|31|0|54|0|{metadata|reject0_metadata|1|0|}23|21|}
{2010212001|XXGvertex_oport_oport|32|0|55|0|{2|error0|}21|24|}
{2010006001|XXGobject_psameas_object|33|0|57|0|{metadata|error0_metadata|1|0|}24|21|}
{2010212001|XXGvertex_oport_oport|34|0|58|0|{3|log|}21|25|}
{2010006001|XXGobject_psameas_object|35|0|60|0|{metadata|log_metadata|1|0|}25|21|}
{2010211001|XXGvertex_iport_iport|36|0|61|0|{0|in|}21|26|}
{2010006001|XXGobject_psameas_object|37|0|63|0|{metadata|in_metadata|1|0|}26|21|}
{2010006001|XXGobject_psameas_object|38|0|64|0|{Layout|Layout|0|0|}15|11|}
{2010006001|XXGobject_psameas_object|39|0|65|0|{in_metadata|read_metadata|0|0|}15|7|}
{2010006001|XXGobject_psameas_object|40|0|66|0|{out0_metadata|write_metadata|0|0|}15|11|}
{2010006001|XXGobject_psameas_object|41|0|67|0|{reject0_metadata|read_metadata|0|0|}15|7|}
{2010109001|XXGobject_property_value|42|0|68|0|{0|TrackingThumbprint|72|}1|27|}
