@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|101|rel_count|229|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|validate_rcdrdp_with_deselect|Mukesh.Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|850000|743000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{1|1|}Job 'validate_rcdrdp_with_deselect' Execution Status Report


Job "validate_rcdrdp_with_deselect" Execution started at Monday, October 02, 2017 17:19:04
***** Job execution failed at Monday, October 02, 2017 17:26:01 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:06:57
Run performed by user Mukesh.Singh
Total data moved through all flows: 672301457 records (280175160519 bytes)
Total CPU time (all processes): 3070 seconds
Average CPU utilization across all nodes: 7.99 percent
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Optum-QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@384|.5|.5|{0|}114|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}57|2065|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}58|17|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}120|2065|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}116|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}111|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}118|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}112|17|}}
{2010243001|XXGwatcher|13|0|25|0|{@{}@1|100|-1||0|}}
{2010503005|XXGfvertex|14|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(8)   dxf_src_dataset_id =   0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)   dxf_src_rec_cnt =   0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))   dxf_src_file_name =   ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  //string('\\x01')   filename;
  decimal("\\x01", maximum_length=18)   rxclaimnbr;
  decimal("\\x01", maximum_length=6)   clmseqnbr;
  string("\\x01", maximum_length=1)   claimsts = NULL("");
  string("\\x01", maximum_length=9)   carrierid = NULL("");
  string("\\x01", maximum_length=15)   accountid = NULL("");
  string("\\x01", maximum_length=15)   groupid = NULL("");
  string("\\x01", maximum_length=20)   memberid = NULL("");
  string("\\x01", maximum_length=20)   cardholder = NULL("");
  string("\\x01", maximum_length=15)   groupnbr = NULL("");
  decimal("\\x01", maximum_length=11)   datesbm = NULL("");
  string("\\x01", maximum_length=12)   rxnumber = NULL("");
  string("\\x01", maximum_length=2)   refill = NULL("");
  decimal("\\x01", maximum_length=11)   dtefilled = NULL("");
  string("\\x01", maximum_length=1)   compoundcd = NULL("");
  string("\\x01", maximum_length=2)   prodtypcde = NULL("");
  string("\\x01", maximum_length=20)   productid = NULL("");
  decimal("\\x01".3, maximum_length=18)   decimalqty = NULL("");
  decimal("\\x01", maximum_length=6)   dayssupply = NULL("");
  string("\\x01", maximum_length=14)   gpinumber = NULL("");
  string("\\x01", maximum_length=15)   srvprovid = NULL("");
  string("\\x01", maximum_length=15)   prescriber = NULL("");
  string("\\x01", maximum_length=2)   prescridql = NULL("");
  string("\\x01", maximum_length=10)   fnlplancde = NULL("");
  decimal("\\x01", maximum_length=10)   fnlplandte = NULL("");
  string("\\x01", maximum_length=40)   message1 = NULL("");
  string("\\x01", maximum_length=40)   message2 = NULL("");
  string("\\x01", maximum_length=40)   message3 = NULL("");
  string("\\x01", maximum_length=3)   rejcde1 = NULL("");
  string("\\x01", maximum_length=3)   rejcde2 = NULL("");
  string("\\x01", maximum_length=3)   rejcde3 = NULL("");
  decimal("\\x01".2, maximum_length=15)   phringrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdueamt = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltingrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdueamt = NULL("");
  string("\\x01", maximum_length=3)   prsstate = NULL("");
  string("\\x01", maximum_length=5)   rxt_src_envrt_id;
  string("\\x01", maximum_length=1)   claim_match_ind;
  decimal("\\x01",0)   src_env_sk = NULL("");
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  decimal("\\x01", maximum_length=5) d3iohr = NULL("");
  decimal("\\x01", maximum_length=5) d3iphr = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compound_cd = NULL("") /*CHAR(1)*/;
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/test.deselect.rxclaim_ctrx.f_cdur_events_rcdrdp.ctrx_f_cdur_events.20161101000056.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/test.deselect.rxclaim_ctrx.f_cdur_events_rcdrdp.ctrx_f_cdur_events.20161101000056.dat.gz|3|2|$|@{0|}}
}}@0|@45000|244500|0|0|0|0|115|Deselect File of cdur event in map|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|15|0|29|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|16|0|32|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|17|0|34|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|18|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/f_claim_transaction.reduced.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/f_claim_transaction.reduced.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
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
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
}}@0|@50000|404500|0|0|0|0|119|F_claim_reduced|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|19|0|39|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|20|0|42|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|21|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|22|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|record
  little endian integer(8)   dxf_src_dataset_id =   0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)   dxf_src_rec_cnt =   0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))   dxf_src_file_name =   ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  //string('\\x01')   filename;
  decimal("\\x01", maximum_length=18)   rxclaimnbr;
  decimal("\\x01", maximum_length=6)   clmseqnbr;
  string("\\x01", maximum_length=1)   claimsts = NULL("");
  string("\\x01", maximum_length=9)   carrierid = NULL("");
  string("\\x01", maximum_length=15)   accountid = NULL("");
  string("\\x01", maximum_length=15)   groupid = NULL("");
  string("\\x01", maximum_length=20)   memberid = NULL("");
  string("\\x01", maximum_length=20)   cardholder = NULL("");
  string("\\x01", maximum_length=15)   groupnbr = NULL("");
  decimal("\\x01", maximum_length=11)   datesbm = NULL("");
  string("\\x01", maximum_length=12)   rxnumber = NULL("");
  string("\\x01", maximum_length=2)   refill = NULL("");
  decimal("\\x01", maximum_length=11)   dtefilled = NULL("");
  string("\\x01", maximum_length=1)   compoundcd = NULL("");
  string("\\x01", maximum_length=2)   prodtypcde = NULL("");
  string("\\x01", maximum_length=20)   productid = NULL("");
  decimal("\\x01".3, maximum_length=18)   decimalqty = NULL("");
  decimal("\\x01", maximum_length=6)   dayssupply = NULL("");
  string("\\x01", maximum_length=14)   gpinumber = NULL("");
  string("\\x01", maximum_length=15)   srvprovid = NULL("");
  string("\\x01", maximum_length=15)   prescriber = NULL("");
  string("\\x01", maximum_length=2)   prescridql = NULL("");
  string("\\x01", maximum_length=10)   fnlplancde = NULL("");
  decimal("\\x01", maximum_length=10)   fnlplandte = NULL("");
  string("\\x01", maximum_length=40)   message1 = NULL("");
  string("\\x01", maximum_length=40)   message2 = NULL("");
  string("\\x01", maximum_length=40)   message3 = NULL("");
  string("\\x01", maximum_length=3)   rejcde1 = NULL("");
  string("\\x01", maximum_length=3)   rejcde2 = NULL("");
  string("\\x01", maximum_length=3)   rejcde3 = NULL("");
  decimal("\\x01".2, maximum_length=15)   phringrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdueamt = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltingrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdueamt = NULL("");
  string("\\x01", maximum_length=3)   prsstate = NULL("");
  string("\\x01", maximum_length=5)   rxt_src_envrt_id;
  string("\\x01", maximum_length=1)   claim_match_ind;
  decimal("\\x01",0)   src_env_sk = NULL("");
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  decimal("\\x01", maximum_length=5) d3iohr = NULL("");
  decimal("\\x01", maximum_length=5) d3iphr = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compound_cd = NULL("") /*CHAR(1)*/;
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
{30001002|XXparameter|key|\{d3p2nb; d3oinb; src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|override_key1|\{rxclaimnbr; clmseqnbr; src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.* :: in1.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|376000|101500|0|0|0|0|60|Join-\{d3p2nb; d3oinb; src_env_sk\}|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32833|1|{1|0|}}}
{2010203004|XXGoport|23|0|49|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|24|0|52|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|25|0|54|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|26|0|56|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|27|0|58|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|28|0|60|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|29|0|62|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|30|0|64|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|31|0|66|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|32|0|69|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|33|0|72|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
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
{2010203004|XXGoport|34|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|35|0|77|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|36|0|80|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|37|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|38|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|39|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|40|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|41|0|95|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010202004|XXGiport|43|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010503005|XXGfvertex|44|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/deselct_match.rcdrdp.reduced.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/deselct_match.rcdrdp.reduced.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(8)   dxf_src_dataset_id =   0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)   dxf_src_rec_cnt =   0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))   dxf_src_file_name =   ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  //string('\\x01')   filename;
  decimal("\\x01", maximum_length=18)   rxclaimnbr;
  decimal("\\x01", maximum_length=6)   clmseqnbr;
  string("\\x01", maximum_length=1)   claimsts = NULL("");
  string("\\x01", maximum_length=9)   carrierid = NULL("");
  string("\\x01", maximum_length=15)   accountid = NULL("");
  string("\\x01", maximum_length=15)   groupid = NULL("");
  string("\\x01", maximum_length=20)   memberid = NULL("");
  string("\\x01", maximum_length=20)   cardholder = NULL("");
  string("\\x01", maximum_length=15)   groupnbr = NULL("");
  decimal("\\x01", maximum_length=11)   datesbm = NULL("");
  string("\\x01", maximum_length=12)   rxnumber = NULL("");
  string("\\x01", maximum_length=2)   refill = NULL("");
  decimal("\\x01", maximum_length=11)   dtefilled = NULL("");
  string("\\x01", maximum_length=1)   compoundcd = NULL("");
  string("\\x01", maximum_length=2)   prodtypcde = NULL("");
  string("\\x01", maximum_length=20)   productid = NULL("");
  decimal("\\x01".3, maximum_length=18)   decimalqty = NULL("");
  decimal("\\x01", maximum_length=6)   dayssupply = NULL("");
  string("\\x01", maximum_length=14)   gpinumber = NULL("");
  string("\\x01", maximum_length=15)   srvprovid = NULL("");
  string("\\x01", maximum_length=15)   prescriber = NULL("");
  string("\\x01", maximum_length=2)   prescridql = NULL("");
  string("\\x01", maximum_length=10)   fnlplancde = NULL("");
  decimal("\\x01", maximum_length=10)   fnlplandte = NULL("");
  string("\\x01", maximum_length=40)   message1 = NULL("");
  string("\\x01", maximum_length=40)   message2 = NULL("");
  string("\\x01", maximum_length=40)   message3 = NULL("");
  string("\\x01", maximum_length=3)   rejcde1 = NULL("");
  string("\\x01", maximum_length=3)   rejcde2 = NULL("");
  string("\\x01", maximum_length=3)   rejcde3 = NULL("");
  decimal("\\x01".2, maximum_length=15)   phringrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdueamt = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltingrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdueamt = NULL("");
  string("\\x01", maximum_length=3)   prsstate = NULL("");
  string("\\x01", maximum_length=5)   rxt_src_envrt_id;
  string("\\x01", maximum_length=1)   claim_match_ind;
  decimal("\\x01",0)   src_env_sk = NULL("");
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  decimal("\\x01", maximum_length=5) d3iohr = NULL("");
  decimal("\\x01", maximum_length=5) d3iphr = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compound_cd = NULL("") /*CHAR(1)*/;
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
}}@0|@75000|545000|0|0|0|0|121|Matching-Output . Evaluate why they got filtered out in Map ,may be rccp lkp|Ab Initio Software|@1|100|-1|@6||33025|-1|-1|}}
{2010203004|XXGoport|45|0|136|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|46|0|139|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|47|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|48|0|144|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/rcdrdp.reduced.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/rcdrdp.reduced.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  decimal("\\x01", maximum_length=5)   d3iohr = NULL("");
  decimal("\\x01", maximum_length=5)   d3iphr = NULL("");
  date("YYYYMMDD")("\\x01") d3bmdt = NULL("");
  decimal("\\x01",0)   src_env_sk = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end;|3|1|l|@{0|}}
}}@0|@80000|80000|0|0|0|0|53|RCDRDP reduced|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|49|0|146|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|50|0|149|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|51|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|52|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
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
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|key|\{claim_nbr; claim_seq_nbr; claim_stat_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: join(in0, in1) =
begin
  out.* :: in0.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in0_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
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
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|reject0_metadata|record
  little endian integer(8)   dxf_src_dataset_id =   0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)   dxf_src_rec_cnt =   0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))   dxf_src_file_name =   ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  //string('\\x01')   filename;
  decimal("\\x01", maximum_length=18)   rxclaimnbr;
  decimal("\\x01", maximum_length=6)   clmseqnbr;
  string("\\x01", maximum_length=1)   claimsts = NULL("");
  string("\\x01", maximum_length=9)   carrierid = NULL("");
  string("\\x01", maximum_length=15)   accountid = NULL("");
  string("\\x01", maximum_length=15)   groupid = NULL("");
  string("\\x01", maximum_length=20)   memberid = NULL("");
  string("\\x01", maximum_length=20)   cardholder = NULL("");
  string("\\x01", maximum_length=15)   groupnbr = NULL("");
  decimal("\\x01", maximum_length=11)   datesbm = NULL("");
  string("\\x01", maximum_length=12)   rxnumber = NULL("");
  string("\\x01", maximum_length=2)   refill = NULL("");
  decimal("\\x01", maximum_length=11)   dtefilled = NULL("");
  string("\\x01", maximum_length=1)   compoundcd = NULL("");
  string("\\x01", maximum_length=2)   prodtypcde = NULL("");
  string("\\x01", maximum_length=20)   productid = NULL("");
  decimal("\\x01".3, maximum_length=18)   decimalqty = NULL("");
  decimal("\\x01", maximum_length=6)   dayssupply = NULL("");
  string("\\x01", maximum_length=14)   gpinumber = NULL("");
  string("\\x01", maximum_length=15)   srvprovid = NULL("");
  string("\\x01", maximum_length=15)   prescriber = NULL("");
  string("\\x01", maximum_length=2)   prescridql = NULL("");
  string("\\x01", maximum_length=10)   fnlplancde = NULL("");
  decimal("\\x01", maximum_length=10)   fnlplandte = NULL("");
  string("\\x01", maximum_length=40)   message1 = NULL("");
  string("\\x01", maximum_length=40)   message2 = NULL("");
  string("\\x01", maximum_length=40)   message3 = NULL("");
  string("\\x01", maximum_length=3)   rejcde1 = NULL("");
  string("\\x01", maximum_length=3)   rejcde2 = NULL("");
  string("\\x01", maximum_length=3)   rejcde3 = NULL("");
  decimal("\\x01".2, maximum_length=15)   phringrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdueamt = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltingrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdueamt = NULL("");
  string("\\x01", maximum_length=3)   prsstate = NULL("");
  string("\\x01", maximum_length=5)   rxt_src_envrt_id;
  string("\\x01", maximum_length=1)   claim_match_ind;
  decimal("\\x01",0)   src_env_sk = NULL("");
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  decimal("\\x01", maximum_length=5) d3iohr = NULL("");
  decimal("\\x01", maximum_length=5) d3iphr = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compound_cd = NULL("") /*CHAR(1)*/;
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in1_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
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
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Join|371000|381500|0|0|0|0|113|Join-\{d3p2nb; d3oinb; src_env_sk\}-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|53|0|161|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|54|0|164|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|55|0|166|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|56|0|168|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|57|0|170|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|58|0|172|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|59|0|174|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|60|0|176|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|61|0|178|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|62|0|181|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|63|0|184|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
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
{2010203004|XXGoport|64|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|65|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|66|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|67|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|68|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|69|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|70|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|71|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010202004|XXGiport|73|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
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
{2010503005|XXGfvertex|74|0|251|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/deselct_match.rcdrdp.reduced.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:/etl/data/qa/mfs/mfs_8way/orca/rxclaim/temp/deselct_match.rcdrdp.reduced.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
  little endian integer(8)   dxf_src_dataset_id =   0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8)   dxf_src_rec_cnt =   0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2)   dxf_src_sys_id =   0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1))   dxf_src_file_name =   ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  //string('\\x01')   filename;
  decimal("\\x01", maximum_length=18)   rxclaimnbr;
  decimal("\\x01", maximum_length=6)   clmseqnbr;
  string("\\x01", maximum_length=1)   claimsts = NULL("");
  string("\\x01", maximum_length=9)   carrierid = NULL("");
  string("\\x01", maximum_length=15)   accountid = NULL("");
  string("\\x01", maximum_length=15)   groupid = NULL("");
  string("\\x01", maximum_length=20)   memberid = NULL("");
  string("\\x01", maximum_length=20)   cardholder = NULL("");
  string("\\x01", maximum_length=15)   groupnbr = NULL("");
  decimal("\\x01", maximum_length=11)   datesbm = NULL("");
  string("\\x01", maximum_length=12)   rxnumber = NULL("");
  string("\\x01", maximum_length=2)   refill = NULL("");
  decimal("\\x01", maximum_length=11)   dtefilled = NULL("");
  string("\\x01", maximum_length=1)   compoundcd = NULL("");
  string("\\x01", maximum_length=2)   prodtypcde = NULL("");
  string("\\x01", maximum_length=20)   productid = NULL("");
  decimal("\\x01".3, maximum_length=18)   decimalqty = NULL("");
  decimal("\\x01", maximum_length=6)   dayssupply = NULL("");
  string("\\x01", maximum_length=14)   gpinumber = NULL("");
  string("\\x01", maximum_length=15)   srvprovid = NULL("");
  string("\\x01", maximum_length=15)   prescriber = NULL("");
  string("\\x01", maximum_length=2)   prescridql = NULL("");
  string("\\x01", maximum_length=10)   fnlplancde = NULL("");
  decimal("\\x01", maximum_length=10)   fnlplandte = NULL("");
  string("\\x01", maximum_length=40)   message1 = NULL("");
  string("\\x01", maximum_length=40)   message2 = NULL("");
  string("\\x01", maximum_length=40)   message3 = NULL("");
  string("\\x01", maximum_length=3)   rejcde1 = NULL("");
  string("\\x01", maximum_length=3)   rejcde2 = NULL("");
  string("\\x01", maximum_length=3)   rejcde3 = NULL("");
  decimal("\\x01".2, maximum_length=15)   phringrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   phrdueamt = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltingrcst = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdispfee = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltslstax = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltpatpay = NULL("");
  decimal("\\x01".2, maximum_length=15)   cltdueamt = NULL("");
  string("\\x01", maximum_length=3)   prsstate = NULL("");
  string("\\x01", maximum_length=5)   rxt_src_envrt_id;
  string("\\x01", maximum_length=1)   claim_match_ind;
  decimal("\\x01",0)   src_env_sk = NULL("");
  unsigned integer(8)   dxf_sk =   0 /*Added by Integration Framework. Surrogate key.*/;
  decimal("\\x01", maximum_length=18)   d3p2nb = NULL("");
  decimal("\\x01", maximum_length=6)   d3oinb = NULL("");
  decimal("\\x01", maximum_length=6)   d3jjnb = NULL("");
  string("\\x01", maximum_length=2)   d3l7st = NULL("");
  string("\\x01", maximum_length=1)   d3l1st = NULL("");
  string("\\x01", maximum_length=1)   d3l2st = NULL("");
  decimal("\\x01", maximum_length=11)   d3aeda = NULL("");
  decimal("\\x01".3, maximum_length=18)   d3jgnb = NULL("");
  string("\\x01", maximum_length=1)   d3l3st = NULL("");
  string("\\x01", maximum_length=1)   d3l8st = NULL("");
  string("\\x01", maximum_length=30)   d3lvtx = NULL("");
  string("\\x01", maximum_length=1)   d3aeh6 = NULL("");
  string("\\x01", maximum_length=1)   d3afh6 = NULL("");
  decimal("\\x01", maximum_length=5)   d3jdhr = NULL("");
  string("\\x01", maximum_length=8)   d3nkcd = NULL("");
  decimal("\\x01", maximum_length=18)   d3iqhr = NULL("");
  decimal("\\x01", maximum_length=6)   d3irhr = NULL("");
  decimal("\\x01", maximum_length=5)   d3ithr = NULL("");
  decimal("\\x01", maximum_length=4)   d3bzik = NULL("");
  decimal("\\x01", maximum_length=4)   d3b0ik = NULL("");
  decimal("\\x01", maximum_length=5)   d3ishr = NULL("");
  string("\\x01", maximum_length=1)   d3z5ha = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")   ids_updt_dttm = NULL("");
  decimal("\\x01", maximum_length=5) d3iohr = NULL("");
  decimal("\\x01", maximum_length=5) d3iphr = NULL("");
  string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compound_cd = NULL("") /*CHAR(1)*/;
  string(1)  newline =  '\\n';
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@0|@610000|130000|0|0|0|0|117|Matching-Output . Evaluate why they got filtered out in Map ,may be rccp lkp-1|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010202004|XXGiport|75|0|253|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|76|0|256|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|77|0|258|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|78|0|262|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
  unsigned integer(8)   dxf_hk_part1 =   0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)   dxf_hk_part2 =   0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
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
  datetime("YYYYMMDDHH24MISS")("\\x01")    ids_updt_dttm = NULL("");
  string(1)  newline =  "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin

  out.claim_nbr :: in.rxclaimnbr;
  out.claim_seq_nbr :: 1000 - in.clmseqnbr;
  out.claim_stat_id :: in.claimsts;
  out.* :: in.* ;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|213000|537500|0|0|0|0|108|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|79|0|264|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|80|0|267|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|81|0|269|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|82|0|271|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|273|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|276|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|85|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|86|0|282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|87|0|285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|88|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|297|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{rxclaimnbr; clmseqnbr; src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|227000|210000|0|0|0|0|52|Sort|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@65|1|{1|0|}}}
{2010203004|XXGoport|91|0|299|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|92|0|302|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|93|0|305|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|94|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|95|0|310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|96|0|316|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|668000|407500|0|0|0|0|95|Trash|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|97|0|318|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|98|0|321|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|99|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|100|0|328|0|{@{}@{1|8274275|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_4|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_5|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_6|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_7|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_8|}1|12|}
{2010244001|XXGflow_watcher_watcher|12|0|24|0|{}12|13|}
{2010601001|XXGgraph_vertex_vertex|13|0|26|0|{Deselect_File_of_cdur_event_in_map|}1|14|}
{2010212001|XXGvertex_oport_oport|14|0|28|0|{0|read|}14|15|}
{2010213001|XXGoport_dst_flow|15|0|30|0|{0|}15|5|}
{2010007001|XXGobject_proto_object|16|0|31|0|{}14|16|}
{2010212001|XXGvertex_oport_oport|17|0|33|0|{0|read|}16|17|}
{2010006001|XXGobject_psameas_object|18|0|35|0|{metadata|read_metadata|1|0|}17|16|}
{2010601001|XXGgraph_vertex_vertex|19|0|36|0|{F_claim_reduced|}1|18|}
{2010212001|XXGvertex_oport_oport|20|0|38|0|{0|read|}18|19|}
{2010213001|XXGoport_dst_flow|21|0|40|0|{0|}19|11|}
{2010007001|XXGobject_proto_object|22|0|41|0|{}18|20|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{0|read|}20|21|}
{2010006001|XXGobject_psameas_object|24|0|45|0|{metadata|read_metadata|1|0|}21|20|}
{2010601001|XXGgraph_vertex_vertex|25|0|46|0|{Join_d3p2nb_d3oinb_src_env_sk_|}1|22|}
{2010212001|XXGvertex_oport_oport|26|0|48|0|{0|out|}22|23|}
{2010213001|XXGoport_dst_flow|27|0|50|0|{0|}23|9|}
{2010212001|XXGvertex_oport_oport|28|0|51|0|{1|unused0|}22|24|}
{2010212001|XXGvertex_oport_oport|29|0|53|0|{2|unused1|}22|25|}
{2010212001|XXGvertex_oport_oport|30|0|55|0|{3|reject0|}22|26|}
{2010212001|XXGvertex_oport_oport|31|0|57|0|{4|reject1|}22|27|}
{2010212001|XXGvertex_oport_oport|32|0|59|0|{5|error0|}22|28|}
{2010212001|XXGvertex_oport_oport|33|0|61|0|{6|error1|}22|29|}
{2010212001|XXGvertex_oport_oport|34|0|63|0|{7|log|}22|30|}
{2010211001|XXGvertex_iport_iport|35|0|65|0|{0|in0|}22|31|}
{2010214001|XXGiport_src_flow|36|0|67|0|{0|}31|6|}
{2010211001|XXGvertex_iport_iport|37|0|68|0|{1|in1|}22|32|}
{2010214001|XXGiport_src_flow|38|0|70|0|{0|}32|7|}
{2010007001|XXGobject_proto_object|39|0|71|0|{}22|33|}
{2010212001|XXGvertex_oport_oport|40|0|73|0|{0|out|}33|34|}
{2010006001|XXGobject_psameas_object|41|0|75|0|{metadata|out_metadata|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|42|0|76|0|{1|unused0|}33|35|}
{2010006001|XXGobject_psameas_object|43|0|78|0|{metadata|unused0_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|44|0|79|0|{2|unused1|}33|36|}
{2010006001|XXGobject_psameas_object|45|0|81|0|{metadata|unused1_metadata|1|0|}36|33|}
{2010212001|XXGvertex_oport_oport|46|0|82|0|{3|reject0|}33|37|}
{2010006001|XXGobject_psameas_object|47|0|84|0|{metadata|reject0_metadata|1|0|}37|33|}
{2010212001|XXGvertex_oport_oport|48|0|85|0|{4|reject1|}33|38|}
{2010006001|XXGobject_psameas_object|49|0|87|0|{metadata|reject1_metadata|1|0|}38|33|}
{2010212001|XXGvertex_oport_oport|50|0|88|0|{5|error0|}33|39|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{metadata|error0_metadata|1|0|}39|33|}
{2010212001|XXGvertex_oport_oport|52|0|91|0|{6|error1|}33|40|}
{2010006001|XXGobject_psameas_object|53|0|93|0|{metadata|error1_metadata|1|0|}40|33|}
{2010212001|XXGvertex_oport_oport|54|0|94|0|{7|log|}33|41|}
{2010006001|XXGobject_psameas_object|55|0|96|0|{metadata|log_metadata|1|0|}41|33|}
{2010211001|XXGvertex_iport_iport|56|0|97|0|{0|in0|}33|42|}
{2010006001|XXGobject_psameas_object|57|0|99|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|58|0|100|0|{dedup0|dedup0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|59|0|101|0|{dedup_keyword0|dedup_keyword0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|60|0|102|0|{dedup_positional0|dedup_positional0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|61|0|103|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|62|0|104|0|{matchoptional_positional0|matchoptional_positional0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|63|0|105|0|{metadata|in0_metadata|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|64|0|106|0|{override_key0|override_key0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|65|0|107|0|{record_match_required0|record_match_required0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|66|0|108|0|{record_match_required_not0|record_match_required_not0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|67|0|109|0|{record_required0|record_required0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|68|0|110|0|{record_required_keyword0|record_required_keyword0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|69|0|111|0|{record_required_positional0|record_required_positional0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|70|0|112|0|{select0|select0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|71|0|113|0|{select_keyword0|select_keyword0|1|0|}42|33|}
{2010006001|XXGobject_psameas_object|72|0|114|0|{select_positional0|select_positional0|1|0|}42|33|}
{2010211001|XXGvertex_iport_iport|73|0|115|0|{1|in1|}33|43|}
{2010006001|XXGobject_psameas_object|74|0|117|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|75|0|118|0|{dedup1|dedup1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|76|0|119|0|{dedup_keyword1|dedup_keyword1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|77|0|120|0|{dedup_positional1|dedup_positional1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|78|0|121|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|79|0|122|0|{matchoptional_positional1|matchoptional_positional1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|80|0|123|0|{metadata|in1_metadata|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|81|0|124|0|{override_key1|override_key1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|82|0|125|0|{record_match_required1|record_match_required1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|83|0|126|0|{record_match_required_not1|record_match_required_not1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|84|0|127|0|{record_required1|record_required1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|85|0|128|0|{record_required_keyword1|record_required_keyword1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|86|0|129|0|{record_required_positional1|record_required_positional1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|87|0|130|0|{select1|select1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|88|0|131|0|{select_keyword1|select_keyword1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|89|0|132|0|{select_positional1|select_positional1|1|0|}43|33|}
{2010006001|XXGobject_psameas_object|90|0|133|0|{Layout|Layout|0|0|}22|44|}
{2010212001|XXGvertex_oport_oport|91|0|135|0|{0|read|}44|45|}
{2010213001|XXGoport_dst_flow|92|0|137|0|{0|}45|8|}
{2010007001|XXGobject_proto_object|93|0|138|0|{}44|46|}
{2010212001|XXGvertex_oport_oport|94|0|140|0|{0|read|}46|47|}
{2010006001|XXGobject_psameas_object|95|0|142|0|{metadata|read_metadata|1|0|}47|46|}
{2010006001|XXGobject_psameas_object|96|0|143|0|{in0_metadata|read_metadata|0|0|}22|48|}
{2010212001|XXGvertex_oport_oport|97|0|145|0|{0|read|}48|49|}
{2010213001|XXGoport_dst_flow|98|0|147|0|{0|}49|6|}
{2010007001|XXGobject_proto_object|99|0|148|0|{}48|50|}
{2010212001|XXGvertex_oport_oport|100|0|150|0|{0|read|}50|51|}
{2010006001|XXGobject_psameas_object|101|0|152|0|{metadata|read_metadata|1|0|}51|50|}
{2010006001|XXGobject_psameas_object|102|0|153|0|{in1_metadata|read_metadata|0|0|}22|14|}
{2010006001|XXGobject_psameas_object|103|0|154|0|{reject0_metadata|read_metadata|0|0|}22|48|}
{2010006001|XXGobject_psameas_object|104|0|155|0|{reject1_metadata|read_metadata|0|0|}22|14|}
{2010006001|XXGobject_psameas_object|105|0|156|0|{unused0_metadata|read_metadata|0|0|}22|48|}
{2010006001|XXGobject_psameas_object|106|0|157|0|{unused1_metadata|read_metadata|0|0|}22|14|}
{2010601001|XXGgraph_vertex_vertex|107|0|158|0|{Join_d3p2nb_d3oinb_src_env_sk_1|}1|52|}
{2010212001|XXGvertex_oport_oport|108|0|160|0|{0|out|}52|53|}
{2010213001|XXGoport_dst_flow|109|0|162|0|{0|}53|12|}
{2010212001|XXGvertex_oport_oport|110|0|163|0|{1|unused0|}52|54|}
{2010212001|XXGvertex_oport_oport|111|0|165|0|{2|unused1|}52|55|}
{2010212001|XXGvertex_oport_oport|112|0|167|0|{3|reject0|}52|56|}
{2010212001|XXGvertex_oport_oport|113|0|169|0|{4|reject1|}52|57|}
{2010212001|XXGvertex_oport_oport|114|0|171|0|{5|error0|}52|58|}
{2010212001|XXGvertex_oport_oport|115|0|173|0|{6|error1|}52|59|}
{2010212001|XXGvertex_oport_oport|116|0|175|0|{7|log|}52|60|}
{2010211001|XXGvertex_iport_iport|117|0|177|0|{0|in0|}52|61|}
{2010214001|XXGiport_src_flow|118|0|179|0|{0|}61|11|}
{2010211001|XXGvertex_iport_iport|119|0|180|0|{1|in1|}52|62|}
{2010214001|XXGiport_src_flow|120|0|182|0|{0|}62|10|}
{2010007001|XXGobject_proto_object|121|0|183|0|{}52|63|}
{2010212001|XXGvertex_oport_oport|122|0|185|0|{0|out|}63|64|}
{2010006001|XXGobject_psameas_object|123|0|187|0|{metadata|out_metadata|1|0|}64|63|}
{2010212001|XXGvertex_oport_oport|124|0|188|0|{1|unused0|}63|65|}
{2010006001|XXGobject_psameas_object|125|0|190|0|{metadata|unused0_metadata|1|0|}65|63|}
{2010212001|XXGvertex_oport_oport|126|0|191|0|{2|unused1|}63|66|}
{2010006001|XXGobject_psameas_object|127|0|193|0|{metadata|unused1_metadata|1|0|}66|63|}
{2010212001|XXGvertex_oport_oport|128|0|194|0|{3|reject0|}63|67|}
{2010006001|XXGobject_psameas_object|129|0|196|0|{metadata|reject0_metadata|1|0|}67|63|}
{2010212001|XXGvertex_oport_oport|130|0|197|0|{4|reject1|}63|68|}
{2010006001|XXGobject_psameas_object|131|0|199|0|{metadata|reject1_metadata|1|0|}68|63|}
{2010212001|XXGvertex_oport_oport|132|0|200|0|{5|error0|}63|69|}
{2010006001|XXGobject_psameas_object|133|0|202|0|{metadata|error0_metadata|1|0|}69|63|}
{2010212001|XXGvertex_oport_oport|134|0|203|0|{6|error1|}63|70|}
{2010006001|XXGobject_psameas_object|135|0|205|0|{metadata|error1_metadata|1|0|}70|63|}
{2010212001|XXGvertex_oport_oport|136|0|206|0|{7|log|}63|71|}
{2010006001|XXGobject_psameas_object|137|0|208|0|{metadata|log_metadata|1|0|}71|63|}
{2010211001|XXGvertex_iport_iport|138|0|209|0|{0|in0|}63|72|}
{2010006001|XXGobject_psameas_object|139|0|211|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|140|0|212|0|{dedup0|dedup0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|141|0|213|0|{dedup_keyword0|dedup_keyword0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|142|0|214|0|{dedup_positional0|dedup_positional0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|143|0|215|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|144|0|216|0|{matchoptional_positional0|matchoptional_positional0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|145|0|217|0|{metadata|in0_metadata|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|146|0|218|0|{override_key0|override_key0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|147|0|219|0|{record_match_required0|record_match_required0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|148|0|220|0|{record_match_required_not0|record_match_required_not0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|149|0|221|0|{record_required0|record_required0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|150|0|222|0|{record_required_keyword0|record_required_keyword0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|151|0|223|0|{record_required_positional0|record_required_positional0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|152|0|224|0|{select0|select0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|153|0|225|0|{select_keyword0|select_keyword0|1|0|}72|63|}
{2010006001|XXGobject_psameas_object|154|0|226|0|{select_positional0|select_positional0|1|0|}72|63|}
{2010211001|XXGvertex_iport_iport|155|0|227|0|{1|in1|}63|73|}
{2010006001|XXGobject_psameas_object|156|0|229|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|157|0|230|0|{dedup1|dedup1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|158|0|231|0|{dedup_keyword1|dedup_keyword1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|159|0|232|0|{dedup_positional1|dedup_positional1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|160|0|233|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|161|0|234|0|{matchoptional_positional1|matchoptional_positional1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|162|0|235|0|{metadata|in1_metadata|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|163|0|236|0|{override_key1|override_key1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|164|0|237|0|{record_match_required1|record_match_required1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|165|0|238|0|{record_match_required_not1|record_match_required_not1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|166|0|239|0|{record_required1|record_required1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|167|0|240|0|{record_required_keyword1|record_required_keyword1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|168|0|241|0|{record_required_positional1|record_required_positional1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|169|0|242|0|{select1|select1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|170|0|243|0|{select_keyword1|select_keyword1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|171|0|244|0|{select_positional1|select_positional1|1|0|}73|63|}
{2010006001|XXGobject_psameas_object|172|0|245|0|{Layout|Layout|0|0|}52|18|}
{2010006001|XXGobject_psameas_object|173|0|246|0|{reject1_metadata|in1_metadata|0|0|}52|52|}
{2010006001|XXGobject_psameas_object|174|0|247|0|{unused0_metadata|in0_metadata|0|0|}52|52|}
{2010006001|XXGobject_psameas_object|175|0|248|0|{unused1_metadata|in1_metadata|0|0|}52|52|}
{2010601001|XXGgraph_vertex_vertex|176|0|249|0|{Matching_Output_Evaluate_why_they_got_filtered_out_in_Map_may_be_rccp_lkp|}1|44|}
{2010601001|XXGgraph_vertex_vertex|177|0|250|0|{Matching_Output_Evaluate_why_they_got_filtered_out_in_Map_may_be_rccp_lkp_1|}1|74|}
{2010211001|XXGvertex_iport_iport|178|0|252|0|{0|write|}74|75|}
{2010214001|XXGiport_src_flow|179|0|254|0|{0|}75|9|}
{2010007001|XXGobject_proto_object|180|0|255|0|{}74|76|}
{2010211001|XXGvertex_iport_iport|181|0|257|0|{0|write|}76|77|}
{2010006001|XXGobject_psameas_object|182|0|259|0|{metadata|write_metadata|1|0|}77|76|}
{2010601001|XXGgraph_vertex_vertex|183|0|260|0|{RCDRDP_reduced|}1|48|}
{2010601001|XXGgraph_vertex_vertex|184|0|261|0|{Reformat|}1|78|}
{2010212001|XXGvertex_oport_oport|185|0|263|0|{0|out0|}78|79|}
{2010213001|XXGoport_dst_flow|186|0|265|0|{0|}79|10|}
{2010212001|XXGvertex_oport_oport|187|0|266|0|{1|reject0|}78|80|}
{2010212001|XXGvertex_oport_oport|188|0|268|0|{2|error0|}78|81|}
{2010212001|XXGvertex_oport_oport|189|0|270|0|{3|log|}78|82|}
{2010211001|XXGvertex_iport_iport|190|0|272|0|{0|in|}78|83|}
{2010214001|XXGiport_src_flow|191|0|274|0|{0|}83|8|}
{2010007001|XXGobject_proto_object|192|0|275|0|{}78|84|}
{2010212001|XXGvertex_oport_oport|193|0|277|0|{0|out0|}84|85|}
{2010006001|XXGobject_psameas_object|194|0|279|0|{metadata|out0_metadata|1|0|}85|84|}
{2010006001|XXGobject_psameas_object|195|0|280|0|{transform0|transform0|1|0|}85|84|}
{2010212001|XXGvertex_oport_oport|196|0|281|0|{1|reject0|}84|86|}
{2010006001|XXGobject_psameas_object|197|0|283|0|{metadata|reject0_metadata|1|0|}86|84|}
{2010212001|XXGvertex_oport_oport|198|0|284|0|{2|error0|}84|87|}
{2010006001|XXGobject_psameas_object|199|0|286|0|{metadata|error0_metadata|1|0|}87|84|}
{2010212001|XXGvertex_oport_oport|200|0|287|0|{3|log|}84|88|}
{2010006001|XXGobject_psameas_object|201|0|289|0|{metadata|log_metadata|1|0|}88|84|}
{2010211001|XXGvertex_iport_iport|202|0|290|0|{0|in|}84|89|}
{2010006001|XXGobject_psameas_object|203|0|292|0|{metadata|in_metadata|1|0|}89|84|}
{2010006001|XXGobject_psameas_object|204|0|293|0|{Layout|Layout|0|0|}78|44|}
{2010006001|XXGobject_psameas_object|205|0|294|0|{in_metadata|read_metadata|0|0|}78|44|}
{2010006001|XXGobject_psameas_object|206|0|295|0|{reject0_metadata|read_metadata|0|0|}78|44|}
{2010601001|XXGgraph_vertex_vertex|207|0|296|0|{Sort|}1|90|}
{2010212001|XXGvertex_oport_oport|208|0|298|0|{0|out|}90|91|}
{2010213001|XXGoport_dst_flow|209|0|300|0|{0|}91|7|}
{2010211001|XXGvertex_iport_iport|210|0|301|0|{0|in|}90|92|}
{2010214001|XXGiport_src_flow|211|0|303|0|{0|}92|5|}
{2010007001|XXGobject_proto_object|212|0|304|0|{}90|93|}
{2010212001|XXGvertex_oport_oport|213|0|306|0|{0|out|}93|94|}
{2010006001|XXGobject_psameas_object|214|0|308|0|{metadata|out_metadata|1|0|}94|93|}
{2010211001|XXGvertex_iport_iport|215|0|309|0|{0|in|}93|95|}
{2010006001|XXGobject_psameas_object|216|0|311|0|{metadata|in_metadata|1|0|}95|93|}
{2010006001|XXGobject_psameas_object|217|0|312|0|{Layout|Layout|0|0|}90|44|}
{2010006001|XXGobject_psameas_object|218|0|313|0|{in_metadata|read_metadata|0|0|}90|14|}
{2010006001|XXGobject_psameas_object|219|0|314|0|{out_metadata|read_metadata|0|0|}90|14|}
{2010601001|XXGgraph_vertex_vertex|220|0|315|0|{Trash|}1|96|}
{2010211001|XXGvertex_iport_iport|221|0|317|0|{0|in|}96|97|}
{2010214001|XXGiport_src_flow|222|0|319|0|{0|}97|12|}
{2010007001|XXGobject_proto_object|223|0|320|0|{}96|98|}
{2010211001|XXGvertex_iport_iport|224|0|322|0|{0|in|}98|99|}
{2010006001|XXGobject_psameas_object|225|0|324|0|{metadata|in_metadata|1|0|}99|98|}
{2010006001|XXGobject_psameas_object|226|0|325|0|{Layout|Layout|0|0|}96|18|}
{2010006001|XXGobject_psameas_object|227|0|326|0|{in_metadata|out_metadata|0|0|}96|52|}
{2010109001|XXGobject_property_value|228|0|327|0|{0|TrackingThumbprint|72|}1|100|}
