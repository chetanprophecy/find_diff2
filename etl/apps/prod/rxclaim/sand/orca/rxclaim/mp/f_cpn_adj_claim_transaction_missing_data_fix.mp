@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|150|rel_count|257|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|Graph2my_tes|ssatpat5|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|688000|478000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{6|1|1|1|1|1|1|}Job 'f_cpn_adj_claim_transaction_missing_data_fix' Execution Status Report

Job completed successfully at Monday, April 27, 2020 16:02:42
Run performed by user ssatpat5
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010600005|XXGgraph|5|0|9|0|{Subgraph created from graph "Graph2my_tes"|{}@0|@362000|140500|0|0|0|0|23|Create Clean File|ssatpat5|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|708000|191000|7|}}
{2010210004|XXGflow|6|0|11|0|{@{}@384|.5|.5|{0|}25|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}20|2578|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.5|.5|{0|}23|17|}}
{2010503005|XXGfvertex|9|0|17|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@2|@591000|96000|0|0|0|0|21|Input File|Ab Initio Software|@1|200|-1||6||257|-1|-1|}}
{2010202004|XXGiport|10|0|19|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|11|0|22|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|12|0|24|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010505005|XXGtvertex|13|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.manual.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|table_spec|select
CPN.rxp2nb,
CPN.rxoinb,
TXN.CLAIM_STAT_ID as claimsts,
DC.CARRIER_ID as carrierid,
DC.ACCOUNT_ID as accountid,
DC.employer_group_id as groupid,
DC.employer_group_id as groupnbr,
DM.MBR_ID as memberid,
DPHR.PHR_ID srvprovid,
DPHR.PHR_ID sbmsrvprid,
CPN.rxbmdt,
TXN.FILLED_DT as dtefilled,
TXN.DAYS_SPLY as dayssupply,
TXN.DRG_QTY as decimalqty,
TXN.APP_DUE_AMT as phrdueamt,
TXN.app_patient_pay_amt as phrpatpay,
TXN.clt_due_amt as cltdueamt,
TXN.clt_patient_pay_amt as cltpatpay,
TXN.oop_applied_amt as cctresrv11,
DP.pln_eff_dt as fnlplandte,
DP.pln_cd as fnlplancde,
'1' as compoundcd,
dprod.prod_id as productid,
dprod.prod_id_qlfr_cd as prodtypcde,
'T' as clmorigin ,
0 as rxnumber ,
CPN.rxsdqv,
CPN.rxseqv,
CPN.rxsfqv,
CPN.rxsgqv,
CPN.rxshqv,
CPN.rxsiqv,
CPN.rxsjqv,
CPN.rxskqv,
CPN.rxslqv,
CPN.rxsmqv,
CPN.rxsnqv,
CPN.rxsoqv,
CPN.rxspqv,
CPN.rxsqqv,
CPN.rxsrqv,
CPN.rxssqv,
CPN.rxstqv,
CPN.rxsuqv,
CPN.rxsvqv,
CPN.rxg0aw,
CPN.rxpzvi,
CPN.rxmgat,
CPN.rxdbaq,
CPN.rxsaau
from orx_idw_dm_etl_prd..F_CPN_ADJ_CLM_TXN_L3 CPN
inner join orx_idw_dm_prd..f_claim_transaction TXN
on CPN.rxp2nb=TXN.claim_nbr
and CASE WHEN CPN.RXOINB<0 THEN CPN.RXOINB ELSE 1000-CPN.RXOINB END = TXN.claim_seq_nbr
--and CPN.rxbmdt>1200401
--and TXN.CLAIM_NBR=200994335558083
inner join orx_idw_dm_prd..d_cag DC
on DC.CAG_SK=TXN.CAG_SK
INNER JOIN orx_idw_dm_prd..d_member DM
on DM.MBR_SK=TXN.MBR_SK
INNER JOIN orx_idw_dm_prd..d_pharmacy DPHR
on DPHR.PHR_SK=TXN.PHR_SK
INNER JOIN orx_idw_dm_prd..D_PLAN DP
on DP.PLN_SK=TXN.FINAL_PLN_SK
INNER JOIN orx_idw_dm_prd..D_PRODUCT DPROD ON
TXN.PROD_SK=DPROD.PROD_SK
where TXN.SRC_ENV_SK=490
 AND
(CPN.rxp2nb,CASE WHEN CPN.RXOINB<0 THEN CPN.RXOINB ELSE 1000-CPN.RXOINB END)
not in (select claim_nbr,claim_seq_nbr from orx_idw_dm_prd..f_cpn_adj_claim_transaction);|3|3|c|@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: select
CPN.rxp2nb,
CPN.rxoinb,
TXN.CLAIM_STAT_ID as claimsts,
DC.CARRIER_ID as carrierid,
DC.ACCOUNT_ID as accountid,
DC.employer_group_id as groupid,
DC.employer_group_id as groupnbr,
DM.MBR_ID as memberid,
DPHR.PHR_ID srvprovid,
DPHR.PHR_ID sbmsrvprid,
CPN.rxbmdt,
TXN.FILLED_DT as dtefilled,
TXN.DAYS_SPLY as dayssupply,
TXN.DRG_QTY as decimalqty,
TXN.APP_DUE_AMT as phrdueamt,
TXN.app_patient_pay_amt as phrpatpay,
TXN.clt_due_amt as cltdueamt,
TXN.clt_patient_pay_amt as cltpatpay,
TXN.oop_applied_amt as cctresrv11,
DP.pln_eff_dt as fnlplandte,
DP.pln_cd as fnlplancde,
'1' as compoundcd,
dprod.prod_id as productid,
dprod.prod_id_qlfr_cd as prodtypcde,
'T' as clmorigin ,
0 as rxnumber ,
CPN.rxsdqv,
CPN.rxseqv,
CPN.rxsfqv,
CPN.rxsgqv,
CPN.rxshqv,
CPN.rxsiqv,
CPN.rxsjqv,
CPN.rxskqv,
CPN.rxslqv,
CPN.rxsmqv,
CPN.rxsnqv,
CPN.rxsoqv,
CPN.rxspqv,
CPN.rxsqqv,
CPN.rxsrqv,
CPN.rxssqv,
CPN.rxstqv,
CPN.rxsuqv,
CPN.rxsvqv,
CPN.rxg0aw,
CPN.rxpzvi,
CPN.rxmgat,
CPN.rxdbaq,
CPN.rxsaau
from orx_idw_dm_etl_prd..F_CPN_ADJ_CLM_TXN_L3 CPN
inner join orx_idw_dm_prd..f_claim_transaction TXN
on CPN.rxp2nb=TXN.claim_nbr
and CASE WHEN CPN.RXOINB<0 THEN CPN.RXOINB ELSE 1000-CPN.RXOINB END = TXN.claim_seq_nbr
--and CPN.rxbmdt>1200401
--and TXN.CLAIM_NBR=200994335558083
inner join orx_idw_dm_prd..d_cag DC
on DC.CAG_SK=TXN.CAG_SK
INNER JOIN orx_idw_dm_prd..d_member DM
on DM.MBR_SK=TXN.MBR_SK
INNER JOIN orx_idw_dm_prd..d_pharmacy DPHR
on DPHR.PHR_SK=TXN.PHR_SK
INNER JOIN orx_idw_dm_prd..D_PLAN DP
on DP.PLN_SK=TXN.FINAL_PLN_SK
INNER JOIN orx_idw_dm_prd..D_PRODUCT DPROD ON
TXN.PROD_SK=DPROD.PROD_SK
where TXN.SRC_ENV_SK=480
 AND
(CPN.rxp2nb,CASE WHEN CPN.RXOINB<0 THEN CPN.RXOINB ELSE 1000-CPN.RXOINB END)
not in (select claim_nbr,claim_seq_nbr from orx_idw_dm_prd..f_cpn_adj_claim_transaction);
 * On: Thu Apr 23 09:31:43 2020
 */
record
  decimal("\\x01",0, maximum_length=19, sign_reserved) rxp2nb /*DECIMAL(18) NOT NULL*/;
  decimal("\\x01",0, maximum_length=19, sign_reserved) rxoinb /*DECIMAL(18) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) claimsts = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) carrierid /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=40) accountid /*VARCHAR(40) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) groupid /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=30) groupnbr /*VARCHAR(30) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) memberid = NULL("") /*VARCHAR(20)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) srvprovid /*VARCHAR(12) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=12) sbmsrvprid /*VARCHAR(12) NOT NULL*/;
  decimal("\\x01",0, maximum_length=19, sign_reserved) rxbmdt = NULL("") /*DECIMAL(18)*/;
  date("YYYYMMDD")("\\x01") dtefilled = NULL("") /*DATE*/;
  decimal("\\x01",0) dayssupply = NULL("") /*SMALLINT*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty = NULL("") /*DECIMAL(11,3)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 = NULL("") /*DECIMAL(9,2)*/;
  date("YYYYMMDD")("\\x01") fnlplandte = NULL("") /*DATE*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10) fnlplancde = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) compoundcd = NULL("") /*VARCHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=20) productid /*VARCHAR(20) NOT NULL*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2) prodtypcde = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1) clmorigin = NULL("") /*VARCHAR(1)*/;
  decimal("\\x01",0) rxnumber = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsdqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxseqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsfqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsgqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxshqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsiqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsjqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxskqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxslqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsmqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsnqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsoqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxspqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsqqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsrqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxssqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxstqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsuqv = NULL("") /*DECIMAL(18,2)*/;
  decimal("\\x01".2, maximum_length=20, sign_reserved) rxsvqv = NULL("") /*DECIMAL(18,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=250) rxg0aw = NULL("") /*VARCHAR(250)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=250) rxpzvi = NULL("") /*VARCHAR(250)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=250) rxmgat = NULL("") /*VARCHAR(250)*/;
  decimal("\\x01",0, maximum_length=19, sign_reserved) rxdbaq = NULL("") /*DECIMAL(18)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=250) rxsaau = NULL("") /*VARCHAR(250)*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("orx_idw_dm_prd..f_cpn_adj_claim_transaction", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..f_cpn_adj_claim_transaction", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..f_cpn_adj_claim_transaction\\r\\n * On: Thu Apr 23 09:31:45 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) carrier_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) account_id = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) employer_group_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) member_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) prod_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sbm_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") filled_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) final_pln_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) days_sply = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_cntr = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) drg_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) oop_applied_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_flat_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_prcnt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_atr_over_cap_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_atr_prd_slct_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_atr_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_adj_pat_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_flat_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_prcnt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_atr_over_cap_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_atr_prd_slct_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_atr_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rbl_adj_pat_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cpn_not_appld_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) oth_pyr_2nd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) oth_pyr_3rd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) oth_pyr_na_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) reversal_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) cpn_pat_pay_gpi_list = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) btch_ld_cpn_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) unusd_cpn_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) src_stat_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_seq_nbr = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_etl_prd..F_CPN_ADJ_CLM_TXN_L3", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_etl_prd..f_cpn_adj_clm_txn_l3", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_etl_prd..F_CPN_ADJ_CLM_TXN_L3\\r\\n * On: Thu Apr 23 09:31:46 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=19, sign_reserved) rxp2nb /*DECIMAL(18) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=19, sign_reserved) rxoinb /*DECIMAL(18) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=19, sign_reserved) rxbmdt = NULL(\\"\\") /*DECIMAL(18)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsdqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxseqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsfqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsgqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxshqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsiqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsjqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxskqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxslqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsmqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsnqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsoqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxspqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsqqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsrqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxssqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxstqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsuqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=20, sign_reserved) rxsvqv = NULL(\\"\\") /*DECIMAL(18,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=250) rxg0aw = NULL(\\"\\") /*VARCHAR(250)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=250) rxpzvi = NULL(\\"\\") /*VARCHAR(250)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=250) rxmgat = NULL(\\"\\") /*VARCHAR(250)*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=19, sign_reserved) rxdbaq = NULL(\\"\\") /*DECIMAL(18)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=250) rxsaau = NULL(\\"\\") /*VARCHAR(250)*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..f_claim_transaction", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..f_claim_transaction", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..f_claim_transaction\\r\\n * On: Thu Apr 23 09:31:48 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) claim_nbr = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_stat_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_acct_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) pbr_spclty_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) pcp_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) custom_client_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) gender_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) drug_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) age_band_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_state_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) relationship_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) fmly_type_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_pmt_cntr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) prod_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) ntwk_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) hm_dlvry_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) pbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_afflt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) ahfs_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) cost_basis_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) cost_type_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) drug_rx_otc_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) drug_maint_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) final_pln_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) prior_auth_reason_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) admin_rte_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) cob_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) gpi_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) gnrc_mdspn_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) gnrc_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) location_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) client_benefit_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_prc_typ_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) dea_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) daw_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) compound_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) dsg_frm_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) days_of_supply_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) pln_drg_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd1_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd2_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd3_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) orig_carrier_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) orig_mbr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) orig_cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) orig_carrier_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) orig_account_id = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) orig_employer_group_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) orig_member_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_seq_nbr_src = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_cntr = NULL(\\"\\") /*SMALLINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sbm_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\",0) sbm_mn_id = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hm_dlvry_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_age = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) refill_nbr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) daw_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) days_sply = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) drg_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") filled_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") rx_written_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) rx_nbr = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  decimal(\\"\\\\x01\\".8, maximum_length=26, sign_reserved) awp_unit_cost = NULL(\\"\\") /*DECIMAL(24,8)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) extd_awp_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) wac_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) geap_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) cost_type_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) clt_cost_type_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_cost_type_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) grp_pln_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_attrib_prod_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_other_payer_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_incentive_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_exe_per_bft_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_attrib_prod_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_other_payer_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_incentive_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_exe_per_bft_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_usual_customary_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_attrib_prod_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_attrib_prod_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_other_payer_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_incentive_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_exe_per_bft_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_ingred_cost_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_sales_tax_paid = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_attrib_prod_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_other_payer_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_incentive_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_attrib_to_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_exe_per_bft_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) family_deductible_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) individual_deductible_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) ded_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) ben_max_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rebate_claims_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=11) prior_auth_nbr = NULL(\\"\\") /*VARCHAR(11)*/;\\r\\n  decimal(\\"\\\\x01\\",0) refill_max = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) bin_nbr = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) processor_cntrl_nbr = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) grp_nbr_submd = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) brnd_trade_nm_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=15, sign_reserved) prc_qty = NULL(\\"\\") /*DECIMAL(13,3)*/;\\r\\n  decimal(\\"\\\\x01\\",0) gen_cntr = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) formulary_cntr = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) tier_level = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) grp_clt_ben_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) cust_loc = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_prc_typ = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_prc_typ = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) pbr_id_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) sbm_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) app_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_prof_svc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) dx_cd = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) dx_cd_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) cms_pbp_id = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) cms_contract_id = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cnt = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) rsp_msg_1 = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) rsp_msg_2 = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) rsp_msg_3 = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  decimal(\\"\\\\x01\\",0) adj_rxcount_stnd_days_sply = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) adj_rxcount_rxsol_mail_srvc = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_acct_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) ben_ded_accum_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) begin_benefit_phase_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) end_benefit_phase_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rx_origin_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) nda_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) anda_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) tot_covered_drg_cost_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) tot_troop_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  datetime(\\"HH24:MI:SS.NNNNNN\\")(\\"\\\\x01\\") sbm_tm = NULL(\\"\\") /*TIME(6)*/;\\r\\n  decimal(\\"\\\\x01\\",0) ajc_code_key = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) inn_max_out_of_pocket_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_price_src_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_price_src_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) awp_unit_adjustment = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) awp_unit_published = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) payee_id = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  decimal(\\"\\\\x01\\",0) contract_pbp_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drug_category_code = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) generic_mnftr_cnt = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) co_insurance_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) non_prf_drug_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) brand_prf_patient_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cob_carrier_subm_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cob_primary_claim_type_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cob_primary_payer_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cob_primary_payer_paid_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) client_cost_tier_amt = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) specialty_drug_prg_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) specialty_drug_prg_mbr_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) specialty_drug_prg_pharm_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) adherence_incnt_prg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) adherence_incnt_reduction_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) adherence_incnt_reduction_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) drug_reserved_elg_ind = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drug_reserved_member_elg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=9, sign_reserved) plan_sponsor_base_share_amt = NULL(\\"\\") /*DECIMAL(7,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=9, sign_reserved) plan_sponsor_supl_share_amt = NULL(\\"\\") /*DECIMAL(7,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=9, sign_reserved) supl_consumer_num = NULL(\\"\\") /*DECIMAL(7,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=9, sign_reserved) min_copay_amt = NULL(\\"\\") /*DECIMAL(7,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) consumer_directed_health_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) specialty_network_prg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) ingredient_cost_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) compund_ingredient_comp_cnt = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) patient_age = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ndc_diff_price_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) insulin_plan_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) cob_second_payer_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cob_second_payer_paid_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) ncpdp_reject_version_code = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) low_day_supl_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) zero_balance_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) nat_drg_cd_mfr_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) subm_clfctn_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_carrier_uid = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) residence_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=7, sign_reserved) phr_rate = NULL(\\"\\") /*DECIMAL(5,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=7, sign_reserved) clt_rate = NULL(\\"\\") /*DECIMAL(5,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) client_mac_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pharmacy_mac_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) client_contract_dis_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) clawback_stat_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) super_ntwk_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".8, maximum_length=26, sign_reserved) tot_publish_awp_amt = NULL(\\"\\") /*DECIMAL(24,8)*/;\\r\\n  decimal(\\"\\\\x01\\".4, maximum_length=17, sign_reserved) clt_awp_discount_rate = NULL(\\"\\") /*DECIMAL(15,4)*/;\\r\\n  decimal(\\"\\\\x01\\".4, maximum_length=17, sign_reserved) app_awp_discount_rate = NULL(\\"\\") /*DECIMAL(15,4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) awp_unit_cost_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) awp_extended_cost_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) dmr_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) injectable_ind_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) injectable_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_formulary_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) clt_formulary_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) formulary_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) risk_pool_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) risk_pool_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) prior_auth_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prior_auth_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rxsol_formulary_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rxsol_formulary_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) claim_origination_code_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_origin_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) coverage_lvl_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) reversal_ind = NULL(\\"\\") /*VARCHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) recent_clm_flg = NULL(\\"\\") /*VARCHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) ntpn_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) origin_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) reported_gap_discount_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) clt_id = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_eligty_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_eligty_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) ln_of_buss = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_dt_of_brth_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) phr_svc_typ_submd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) ben_max_accum_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) ben_ded_sched = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) care_ntwrk_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) care_ntwrk_qlfr = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_copay_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_copay_sched_step_nbr = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_drg_cost_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) clt_drg_cost_sched_id = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_drg_cost_comp_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=14) clt_drg_cost_comp_sched = NULL(\\"\\") /*VARCHAR(14)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_pat_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) clt_pat_sched_tbl = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) clt_prc_sched_nm = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) clt_prc_sched_step = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) clt_prc_sched_tbl = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cntngnt_thrpc_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) cntngnt_thrpy_sched = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) dur_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=18) dur_key = NULL(\\"\\") /*VARCHAR(18)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) elig_clfctn_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_acc_life_benefit_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_acc_benefit_ptd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) frm_mgmt_svcs_tier = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) formulary_prtcol_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) group_sic = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hsa_extrct_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_benefit_max_ptd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_acc_life_benefit_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) accum_oop = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_life_ben_max_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_oop_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) maint_gpi_list = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) med_ffp_ind_ms_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) med_ffp_ind_px_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) med_ffp_ind_rm_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) ndc_list_qlfr = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) out_of_perd_rvrsl_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) out_of_pocket_max_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_copay_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_copay_sched_step_nbr = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) phr_drg_cost_sched_id = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_drg_cost_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_drg_cost_comp_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=14) phr_drg_cost_comp_sched = NULL(\\"\\") /*VARCHAR(14)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_ntwrk_gpi_list = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_ntwrk_ndc_list = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) phr_pat_sched_tbl = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_pat_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) phr_prc_tbl_sched = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) pln_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pln_fnl_prc_sched = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pref_prod_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) prc_bsis_sched = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prod_remb_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) prv_lock_id = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prv_lock_qlfr = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rgnl_dsstr_ovrd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) trn_ben_ovrd_sched = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) pbr_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=16) submd_rph_id = NULL(\\"\\") /*VARCHAR(16)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) submd_rph_qlfr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) adj_medspn_prod_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) anda_ovrd_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) bla_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) bla_ovrd_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) cmpd_typ_submd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fda_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) kdc = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) medspn_carr_prod_ovrd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) nda_ovrd_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) prod_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) tran_add_user_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) adjtd_claim_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") chg_dttm_tcd = NULL(\\"\\") /*TIMESTAMP(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) chg_usr_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) claim_ref_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) claim_resp_stat_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") submd_claim_dttm = NULL(\\"\\") /*TIMESTAMP(6)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") injury_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") orig_pmt_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") sub_reversal_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) delay_rsn_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) dispng_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) dmr_usr_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) extr_txn_cntl_nbr = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) incdnt_id = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  decimal(\\"\\\\x01\\",0) manl_claim_trk_dt_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=14) manl_claim_trk_nbr = NULL(\\"\\") /*VARCHAR(14)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) agcy_nbr = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) medcd_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) medcd_ind = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) sbrogtn_tcn = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) pmt_txn_nbr = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) pl_of_svc_submd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) pror_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rx_nbr_qlfr = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) srvc_lvl_of_effrt = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) srvc_lvl_typ = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) subm_clfctn_cd2 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) subm_clfctn_cd3 = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) txn_cd_submd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) u_c_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) vers_nbr = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_defd_fld1 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_defd_fld2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) clt_defd_fld3 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) sxc_defd_fld1 = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) sxc_defd_fld2 = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) sxc_defd_fld3 = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rdc_ingrd_cost_flag = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) zro_bal_claims_flag = NULL(\\"\\") /*BYTEINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) estd_gen_sav = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) basis_of_cost_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) basis_of_reim_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_atr_ded_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_co_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_incentive_fee_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_other_pmt_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_psc_brnp_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_withhold_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_cob_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) client_pricing_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_pct_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_amt_covrg_gap = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_attrd_sls_tax = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_flat_copay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_oth_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) spclty_phr_corp_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_tot_cob_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) spclty_phr_rptg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_wthd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) clt_ppay_amt_psc_brnd_npf = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mail_ordr_corp_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) retl_90_corp_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mail_ordr_rptg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_amt_sls_tax = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_amt_covrg_gap = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_copay_flat_dllr_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_copay_pct_dllr_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_oth_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_prc_sched_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_tot_cob_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_wthd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) phr_ppay_amt_psc_brnd_npf = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mail_ordr_cntr = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) retl_90_rptg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) post_adjud_pat_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) post_adjud_pln_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) subm_yr = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) care_fac_adjud_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) subm_yr_mnth = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) subm_qtr = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\",0) filled_yr_mnth = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) filled_qtr = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rvrsl_incent_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_amt_covrg_gap = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_attrd_sls_tax = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_oth_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_pat_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_pln_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_remn_ben = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_remn_ded = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_ingrd_cost_cntrctd_remb = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_ppay_amt_psc_brnd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_ppay_amt_psc_brnd_npf = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) subm_incent_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) subm_mcd_pd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) subm_oth_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) subm_oth_covrg_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) subm_oth_payr_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) cmpo_last_seq = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=9) corp_chnl_type_nm = NULL(\\"\\") /*VARCHAR(9)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=9) rptg_chnl_type_nm = NULL(\\"\\") /*VARCHAR(9)*/;\\r\\n  decimal(\\"\\\\x01\\",0) brnd_bsis_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rebill_cost_src = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rebill_cost_typ = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) rebill_cost_typ_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_dispng_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=14) rebill_drg_cost_comp_sched = NULL(\\"\\") /*VARCHAR(14)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rebill_drg_cost_comp_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) rebill_drg_cost_sched_id = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rebill_drg_cost_sched_seq = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_incent_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_ingrd_cost_pd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) rebill_prc_sched_nm = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rebill_prc_sched_step = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) rebill_prc_typ = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_sls_tax_pd = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_due_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rebill_oth_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) msg_cd_1 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) msg_cd_2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) msg_cd_3 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=7, sign_reserved) rebill_drug_cost_percent = NULL(\\"\\") /*DECIMAL(5,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) acct_benefit_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) benefit_max_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") birth_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_atr_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cal_cost_src_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_cov_gap_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_dsp_fee_c_r_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_exc_benefit_max_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_flat_co_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_flat_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_ingred_cost_con_reimb_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_pat_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_per_co_pay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_plan_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_proc_fee_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_prv_ntw_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_psc_brnd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_psc_np_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_perc_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_tot_other_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") chg_date = NULL(\\"\\") /*DATE*/;\\r\\n  datetime(\\"HH24:MI:SS.NNNNNN\\")(\\"\\\\x01\\") chg_time = NULL(\\"\\") /*TIME(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) cfi_csg_client_seg_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) client_proc_fee_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) client_prv_ntw_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) client_psc_brnd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) client_psc_np_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drug_conflict_1_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drug_conflict_2_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drug_conflict_3_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prev_fill_1_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prev_fill_2_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prev_fill_3_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_benefit_max_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_deductible_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_life_ben_max_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_lbft_tran_max_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) fam_oop_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_benefit_max_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_deductible_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) ind_lbft_tran_max_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) life_benefit_max_acc_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) life_benefit_max_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) life_benefit_max_sched_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) oop_acc_code = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) oop_sched_used_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) ptnt_first_nm = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) ptnt_last_nm = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) flat_sls_tax = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pat_sls_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) price_tbl_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) atr_proc_fee_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) atr_priv_ntw_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) atr_psc_brnd_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) atr_psc_np_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_formulary = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) final_price_sched = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) prior_auth_used_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prior_auth_from_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prior_auth_thru_dt = NULL(\\"\\") /*DATE*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) prev_fill_1_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) prev_fill_2_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) prev_fill_3_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_atr_proc_fee_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_atr_priv_ntw_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_atr_ppay_psc_np_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) reversal_dur_conflict_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) reversal_dur_intrv_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) reversal_dur_outcm_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) qual_serv_prov_id = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) spend_acct_rem_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) mbr_pln = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cob_extract_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) sbm_unit_dose_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) tcd_sbm_perct_salestax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) prim_pbr_first_nm = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prim_pbr_mid_init = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) prim_pbr_last_nm = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) mbr_prim_pbr_id = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) prim_pbr_state = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) sbm_clarfctn_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cal_admin_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_cvg_gap_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_proc_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_dispensing_fee_cont = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_atr_sales_tax_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pst_cost_source_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_other_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_withhold_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_prvd_ntwk_sel_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_psc_brand_patpay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_psc_npfm_patpay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_ingred_ctd_reim_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) pst_psc_brand_npfm_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_ctd_reim_dispensing_fee = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rsp_psc_brand_patpay_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) benchmrk_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\",0) prorated_days_supply = NULL(\\"\\") /*SMALLINT*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=16, sign_reserved) metric_nbr_qty = NULL(\\"\\") /*DECIMAL(14,3)*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd4_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd5_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd6_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd7_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd8_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd9_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rej_cd10_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_coverage_stat_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) cpp_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prior_pbm_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) non_rxclaim_adj_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts = NULL(\\"\\") /*TIMESTAMP(6)*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts = NULL(\\"\\") /*TIMESTAMP(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) orx_dispensed_ind = NULL(\\"\\") /*VARCHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) dlvry_chanl = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) awp_flg = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) awp_intgr_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  decimal(\\"\\\\x01\\".5, maximum_length=15, sign_reserved) pdt_cost_type_unit_cost = NULL(\\"\\") /*DECIMAL(13,5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) subm_prior_auth_reason_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=11) subm_prior_auth_nbr = NULL(\\"\\") /*VARCHAR(11)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_prior_auth_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=13, sign_reserved) drg_spend_amt = NULL(\\"\\") /*DECIMAL(11,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=13, sign_reserved) troop_amt = NULL(\\"\\") /*DECIMAL(11,2)*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) oop_applied_amt = NULL(\\"\\") /*DECIMAL(9,2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) day_90_prog_type = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) day_90_retail_prog_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) copay_category_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) care_fac_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..d_cag", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..d_cag", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..d_cag\\r\\n * On: Thu Apr 23 09:31:49 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) dar_lob_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) acctg_lob_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) client_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) carrier_acct_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) client_id /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) carrier_id /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) account_id /*VARCHAR(40) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) employer_group_id /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) client_nm /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) carrier_nm /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) account_nm /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) employer_group_nm /*VARCHAR(50) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) pvcy_excl_ind /*BYTEINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) pa_site_nm = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) carrier_category_id /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) carrier_category_desc /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) carrier_state_cd /*VARCHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) acct_client_type_id /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=100) acct_client_type_desc /*VARCHAR(100) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) acct_product_type_id /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=100) acct_product_type_desc /*VARCHAR(100) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) acct_product_line_id /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=100) acct_product_line_desc /*VARCHAR(100) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) contract_num /*VARCHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) pbp_id /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) gps_plan_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) oracle_client_cd /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) claim_suffix_cd /*VARCHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) custom_no /*VARCHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) funding_arrangment_cd /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) plan_variation_cd /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=7) policy_no /*VARCHAR(7) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) reporting_cd /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) product_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) segment_ind /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) hmo_acct_dvsn_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) claim_account_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) sold_market_site_cd /*VARCHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) situs_state_cd /*VARCHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) platform_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) client_carrier_id /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) shared_arrangement_ind /*VARCHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) sales_office_cd /*VARCHAR(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) accumulator_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) erisa_id /*CHAR(1) NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") renewal_dt /*DATE NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) iplan_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) legal_entity_cd /*VARCHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=7) franchise_no /*VARCHAR(7) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) lead_partner_cd /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) coc_cd /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) migration_ind /*BYTEINT NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") migration_effective_dt /*DATE NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) product_classifier_id /*VARCHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) pharmacy_rider_cd /*VARCHAR(4) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) cob_ind /*VARCHAR(20) NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") cob_effective_dt /*DATE NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") transaction_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) obligor_cd /*VARCHAR(2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) speciality_ind /*CHAR(1) NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") spclty_eff_dt /*DATE NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pick_lob_cd /*VARCHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) gl_product_cd /*VARCHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=7) gl_customer_cd /*VARCHAR(7) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) product_id /*VARCHAR(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hm_dlvry_only_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hm_dlvry_stat_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rebates_only_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) rebates_stat_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) bseg_srv_typ = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) bseg_bus_typ = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) bseg_clt_typ = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..d_member", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..d_member", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..d_member\\r\\n * On: Thu Apr 23 09:31:51 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) mbr_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) cag_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) carrier_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) account_id = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) employer_group_id = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) mbr_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) clt_id = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mast_prsn_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) mbr_fam_id = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_alt_ins_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) mbr_alt_ins_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) mbr_alt_ins_mbr_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) mbr_ssn_nbr = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") mbr_dt_of_brth = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) mbr_hic_cd = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) mb_first_nm = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=70) mb_last_nm = NULL(\\"\\") /*VARCHAR(70)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mb_mid_init_nm = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) mbr_prsn_cd = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_relshp_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) mbr_rdr = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_sex = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) mbr_city_nm = NULL(\\"\\") /*VARCHAR(60)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) mbr_st_cd = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) mbr_zip = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") mbr_mcre_covrg_from_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=120) mbr_addr1 = NULL(\\"\\") /*VARCHAR(120)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=120) mbr_addr2 = NULL(\\"\\") /*VARCHAR(120)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=120) mbr_addr3 = NULL(\\"\\") /*VARCHAR(120)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) mbr_zip2 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) mbr_zip4 = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) mbr_cntry = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) mbr_phone = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=160) mbr_eml_addr = NULL(\\"\\") /*VARCHAR(160)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_mcre_covrg_typ = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_fam_typ_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_fam_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=18) mbr_dur_keyvar = NULL(\\"\\") /*CHAR(18)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") mbr_ben_reset_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) mbr_lang_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_dur_prcs_flag = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) mbr_mltpl_brth_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") mbr_orig_eff_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) mbr_typ = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..D_PRODUCT", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..d_product", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..D_PRODUCT\\r\\n * On: Thu Apr 23 09:31:52 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) prod_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) prod_id /*VARCHAR(20) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) prod_id_qlfr_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=70) prod_nm = NULL(\\"\\") /*VARCHAR(70)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) ahfs_cd = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_3rd_prty_excpn_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) drg_clsfctn_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_dea_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=80) drg_drg_intrctn_desc = NULL(\\"\\") /*VARCHAR(80)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drg_fda_thrpc_eqvlc_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drg_grp_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) drg_lbl_nm = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_maint_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_multi_src_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) drg_mfrr_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) drg_ndc_lblr_cd = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drg_ndc_pkg_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) drg_ndc_prod_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=11) drg_ndc_desc = NULL(\\"\\") /*VARCHAR(11)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_rx_otc_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) drg_stat_cd = NULL(\\"\\") /*VARCHAR(13)*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=13, sign_reserved) drg_strngth_qty = NULL(\\"\\") /*DECIMAL(11,3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) drg_strngth_uom_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) drg_sub_class_cd = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drg_unit_dose_use_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) gcn_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) gcn_seq_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) gnrc_mdspn_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) gnrc_mdspn_ind_nm /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) gnrc_nm = NULL(\\"\\") /*VARCHAR(60)*/;\\r\\n  decimal(\\"\\\\x01\\",0) gpi_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=14) gpi_no = NULL(\\"\\") /*VARCHAR(14)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) drg_grp_gpi_02_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) drg_grp_nm = NULL(\\"\\") /*VARCHAR(40)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) drg_class_gpi_04_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) drg_class_nm = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) drg_sub_class_gpi_06_cd = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) drg_sub_class_nm = NULL(\\"\\") /*VARCHAR(60)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) drg_bsic_nm_gpi_08_cd = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=70) drg_bsic_nm = NULL(\\"\\") /*VARCHAR(70)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) drg_extd_nm_gpi_10_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=70) drg_extd_nm = NULL(\\"\\") /*VARCHAR(70)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) drg_dosag_frm_gpi_12_cd = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) drg_dosag_frm_id = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  decimal(\\"\\\\x01\\",0) dise_cat_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=80) dise_cat_nm /*VARCHAR(80) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) thrpc_class_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=80) thrpc_class_nm /*VARCHAR(80) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) admin_route_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) ahfs_desc = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) fdb_gcn_cd = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  decimal(\\"\\\\x01\\",0) fdb_gcn_seq_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) etc_id_fpe_desc = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) dflt_etc_id_fpe_desc = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  decimal(\\"\\\\x01\\",0) fdb_hicl_seq_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) fdb_hic3_seq_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) fdb_hic3_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_gen_prc_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_invtr_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_maint_drg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) fdb_expndd_orng_bk_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_gen_prc_spred_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_gen_thrpc_drg_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fdb_gen_ind_ndc_lvl_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) brnd_nm_typ_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) spclty_prod_corp_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=35) spclty_prod_corp_nm = NULL(\\"\\") /*VARCHAR(35)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) package_size_uom_cd /*VARCHAR(2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) package_qty /*INTEGER NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=11, sign_reserved) package_size /*DECIMAL(9,3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".3, maximum_length=15, sign_reserved) total_package_qty /*DECIMAL(13,3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) prd_repackage_ind /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) prd_user_defined_field_1_txt /*VARCHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) prd_user_defined_field_2_txt /*VARCHAR(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) prd_user_defined_field_3_txt /*VARCHAR(8) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drug_efficacy_impl_cd /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fda_app_type_nda_flg /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fda_app_type_anda_flg /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) fda_app_type_bla_flg /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=9) drg_ndc_short_id /*VARCHAR(9) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) drg_ndc_short_nm /*VARCHAR(25) NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") drg_ndc_eff_dt /*DATE NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") drg_ndc_term_dt /*DATE NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) current_flg /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_rank_no = NULL(\\"\\") /*INTEGER*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) limited_dist = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) awp_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) kdc = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) mfr_id = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) ndc_small_pkg = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) ndc_large_pkg = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) prod_key = NULL(\\"\\") /*INTEGER*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) gppc_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) intl_extr_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) lblr_type = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pricing_sprd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) reimbursment_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) origin_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") prd_inactive_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) local_systemic_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) dispensing_unit = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) single_comb_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) innerpack_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) clinic_pack_cd = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) ftc_thera_class_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) ftc_thera_class_nm = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=100) fdb_hic3_desc = NULL(\\"\\") /*VARCHAR(100)*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..d_pharmacy", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..d_pharmacy", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..d_pharmacy\\r\\n * On: Thu Apr 23 09:31:54 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) phr_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_afflt_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_pmt_cntr_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_dispnsr_class_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_dispnsr_type_sk /*BIGINT NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) phr_id /*VARCHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) phr_ncpdp_id = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_npi_no = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) phr_nm = NULL(\\"\\") /*VARCHAR(60)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) phr_legal_nm /*VARCHAR(60) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=6) phr_affl_cd = NULL(\\"\\") /*VARCHAR(6)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=35) phr_affl_nm = NULL(\\"\\") /*VARCHAR(35)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_afflt_grp_id /*INTEGER NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=100) phr_afflt_grp_desc /*VARCHAR(100) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) phr_pmt_centr_nm = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_store_no = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=55) phr_addr1_txt = NULL(\\"\\") /*VARCHAR(55)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=55) phr_addr2_txt = NULL(\\"\\") /*VARCHAR(55)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_rgn_nm = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) phr_city_nm = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) phr_st_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) phr_zip_cd = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) phr_zip2_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) phr_zip3_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) phr_cntry_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) phr_cnty_nm = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=55) phr_mail_addr1_txt = NULL(\\"\\") /*VARCHAR(55)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=55) phr_mail_addr2_txt = NULL(\\"\\") /*VARCHAR(55)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) phr_mail_city_nm = NULL(\\"\\") /*VARCHAR(30)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) phr_mail_st_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) phr_mail_zip1_cd = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) phr_mail_zip2_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) phr_mail_zip3_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_phone_no = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) phr_fax_phone = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) phr_dea_rgstrtn_id /*VARCHAR(12) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) dispr_clsfctn_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) dispr_typ_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) dispr_typ2_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=3) dispr_typ3_cd = NULL(\\"\\") /*VARCHAR(3)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) phr_dispnsr_class_desc /*VARCHAR(50) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) phr_dispnsr_type_desc /*VARCHAR(50) NOT NULL*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") affl_from_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") pay_centr_from_dt = NULL(\\"\\") /*DATE*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") phr_thru_dt /*DATE NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=9) eft_rtg_addr_txt = NULL(\\"\\") /*VARCHAR(9)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=12) fed_lic_no = NULL(\\"\\") /*VARCHAR(12)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) fed_tax_id = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) st_lic_no = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=15) st_tax_id = NULL(\\"\\") /*VARCHAR(15)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) mcd_id = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) phr_24_hour_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) stat_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hold_typ_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) ntwrk_usag_cnt = NULL(\\"\\") /*SMALLINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) loc_msa_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) loc_psma_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) cngrsnl_dstrct_cd = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) ncpdp_ld_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) acpts_e_pbng_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) dlvry_srvc_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) cmpdg_svc_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drv_up_wndw_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) drbl_med_eqp_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) hndcp_accs_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) lang1_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) lang2_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) lang3_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) lang4_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=2) lang5_cd = NULL(\\"\\") /*VARCHAR(2)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) phr_cntct_extn_no /*VARCHAR(5) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=40) phr_cntct_nm /*VARCHAR(40) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=80) phr_cntct_email_txt /*VARCHAR(80) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=13) phr_cntct_phn_no /*VARCHAR(13) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=30) phr_cntct_title_nm /*VARCHAR(30) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) upin_mcre_prv_id = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") phr_from_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=60) phr_full_nm = NULL(\\"\\") /*VARCHAR(60)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=50) phr_street_directions = NULL(\\"\\") /*VARCHAR(50)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=4) phr_mail_country = NULL(\\"\\") /*VARCHAR(4)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) phr_phn_ext = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) phr_emerg_phn = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=5) phr_emerg_ext = NULL(\\"\\") /*VARCHAR(5)*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]], [record variable _interp_("orx_idw_dm_prd..D_PLAN", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_prd..d_plan", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM orx_idw_dm_prd..D_PLAN\\r\\n * On: Thu Apr 23 09:31:55 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0) pln_sk /*BIGINT NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0) pln_qlfr_cd_sk = NULL(\\"\\") /*BIGINT*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pln_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_type_id = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=10) pln_qlfr_cd = NULL(\\"\\") /*VARCHAR(10)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") pln_eff_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=25) pln_nm = NULL(\\"\\") /*VARCHAR(25)*/;\\r\\n  date(\\"YYYYMMDD\\")(\\"\\\\x01\\") pln_term_dt = NULL(\\"\\") /*DATE*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_mbr_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_rx_ntwk_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_dea_vld_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_pref_formulary_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_dflt_drg_stat = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_elig_ovrd_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_desi_ind = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_md_ntwk_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_md_spclty_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_care_fac_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_restrct_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_pricing_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_therapy_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_brnd_gen_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_3pty_excp_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_lgnd_otc_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_fda_ther_equi_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_dea_cd_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_dosage_form_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_route_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_pkgng_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_maint_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_compound_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_lvl_of_srv_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_submt_qty_days_sup_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_refill_limit_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_ded_cap_limit_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_cust_loc_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_patient_pay_qual = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_ndc_lst_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_gpi_lst_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_verf_cob_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=8) drg_table_nm_flg = NULL(\\"\\") /*VARCHAR(8)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=1) pln_audit_flg = NULL(\\"\\") /*CHAR(1)*/;\\r\\n  decimal(\\"\\\\x01\\",0) src_env_sk /*BIGINT NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") insert_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  datetime(\\"YYYYMMDD HH24:MI:SS\\")(\\"\\\\x01\\") update_ts /*TIMESTAMP(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) insert_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  string(\\"\\\\x01\\",charset=\\"iso-8859-15\\", maximum_length=20) update_uid = NULL(\\"\\") /*VARCHAR(20)*/;\\r\\n  decimal(\\"\\\\x01\\",0) run_id = NULL(\\"\\") /*BIGINT*/;\\r\\n  decimal(\\"\\\\x01\\",0) rec_stat_cd = NULL(\\"\\") /*BYTEINT*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@47000|85000|0|0|0|0|26|Input Table|Ab Initio Software|Built-in 2.2:|1|100|0||6||1|}}
{2010203004|XXGoport|14|0|29|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|15|0|32|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|16|0|34|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375651|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|17|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|18|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|19|0|44|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Partition by Round-robin|400000|101000|0|0|0|0|9|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|20|0|46|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|21|0|49|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|22|0|52|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
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
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|23|0|54|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|24|0|57|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|25|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.cdc_ts :: now();
  out.cdc_flag :: 'N';
  out.dxf_src_sys_id :: 490;
  out.dxf_src_rec_cnt :: next_in_sequence();
  out.dxf_src_dataset_id :: 0;
  //out.dtefilled:: (decimal(","))(string(","))(date("YYYYMMDD"))in.dtefilled;
  //out.fnlplandte::  (decimal(","))string_lrtrim((string(","))(date("YYYYMMDD"))in.fnlplandte) - 19000000;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|164000|83000|0|0|0|0|24|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|26|0|65|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|27|0|68|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|28|0|70|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|29|0|72|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|30|0|74|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|31|0|77|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|32|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|33|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|34|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|35|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|37|0|99|0|{Subgraph created from graph "f_cpn_adj_claim_transaction_missing_data_fix"|{}@0|@436000|345000|0|0|0|0|20|Create Single File|ssatpat5|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|522000|314000|7|}}
{2010210004|XXGflow|38|0|101|0|{@{}@384|.5|.5|{0|}40|2065|}}
{2010210004|XXGflow|39|0|103|0|{@{}@384|.5|.5|{0|}42|2065|}}
{2010210004|XXGflow|40|0|105|0|{@{}@384|.5|.5|{0|}43|2065|}}
{2010501005|XXGpvertex|41|0|107|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@5|Gather|240000|148000|0|0|0|0|41|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|42|0|109|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|43|0|112|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|44|0|116|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|45|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|46|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|47|0|124|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425010101.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425010101.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@5|@405000|140000|0|0|0|0|45|Input File-3|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|48|0|126|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|49|0|129|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|50|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|51|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@5|@45000|225000|0|0|0|0|44|Input File-2|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|52|0|136|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|53|0|139|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|54|0|141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|55|0|145|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200424000000.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200424000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@5|@50000|85000|0|0|0|0|37|Input File-1|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|56|0|147|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|57|0|150|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|58|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|59|0|157|0|{Subgraph created from graph "Graph2my_tes"|{}@0|@43000|141500|0|0|0|0|21|Extr RCRXCP Source|ssatpat5|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|425000|184000|7|}}
{2010210004|XXGflow|60|0|159|0|{@{}@384|.5|.5|{0|}11|17|}}
{2010505005|XXGtvertex|61|0|161|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_ORXCLAIM_DB/odbc.db_orxclaim.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|odbc|3|2|$|@{0|}}
{30001002|XXparameter|table_spec_kind|select|3|1|l|@{0|}}
{30001002|XXparameter|table_spec|select a.rxp2nb,a.rxoinb,a.rxbmdt,a.rxsdqv, a.rxseqv, a.rxsfqv, a.rxsgqv, a.rxshqv, a.rxsiqv, a.rxsjqv, a.rxskqv, a.rxslqv, a.rxsmqv, a.rxsnqv, a.rxsoqv, a.rxspqv, a.rxsqqv, a.rxsrqv, a.rxssqv, a.rxstqv, a.rxsuqv, a.rxsvqv, a.rxg0aw, a.rxpzvi, a.rxmgat, a.rxdbaq, a.rxsaau from clmp02fil.rcrxcp a|3|3|c|@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: select a.rxp2nb,a.rxoinb,a.rxbmdt,a.rxsdqv, a.rxseqv, a.rxsfqv, a.rxsgqv, a.rxshqv, a.rxsiqv, a.rxsjqv, a.rxskqv, a.rxslqv, a.rxsmqv, a.rxsnqv, a.rxsoqv, a.rxspqv, a.rxsqqv, a.rxsrqv, a.rxssqv, a.rxstqv, a.rxsuqv, a.rxsvqv, a.rxg0aw, a.rxpzvi, a.rxmgat, a.rxdbaq, a.rxsaau from clmprdfil.rcrxcp a
 * On: Thu Apr 23 09:56:31 2020
 */
record
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("clmprdfil.rcrxcp", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_ORXCLAIM\}/tables/odbc/clmprdfil.rcrxcp", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("/* DML Generated for SQL: SELECT * FROM clmprdfil.rcrxcp\\r\\n * On: Thu Apr 23 09:56:33 2020\\r\\n */\\r\\nrecord\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\".2, maximum_length=11, sign_reserved) rxibqw /*DECIMAL(9,2) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=4, sign_reserved) rxfihs /*DECIMAL(3) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxakvn /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) rxc2dt /*DECIMAL(7) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) rxadtm /*DECIMAL(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxalvn /*CHAR(10) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxadvn /*CHAR(10) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;\\r\\n  decimal(\\"\\\\x01\\",0, maximum_length=7, sign_reserved) rxabtm /*DECIMAL(6) NOT NULL*/;\\r\\n  string(\\"\\\\x01\\", maximum_length=10) rxaevn /*CHAR(10) NOT NULL*/;\\r\\n  string(1) newline = \\"\\\\n\\";\\r\\nend", "pdl") is_dml_located 0 located_dml_info NULL]]]]]]|3|9||@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@47000|85000|0|0|0|0|10|Input Table|Ab Initio Software|Built-in 2.2:|1|100|0||6||1|}}
{2010203004|XXGoport|62|0|163|0|{@{}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|63|0|166|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010505005|XXGtvertex|64|0|168|0|{Unloads data records from a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375651|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|table_spec.custom_editor_key|SelectEditor|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|65|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2448|0|}}
{2010203004|XXGoport|66|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|67|0|178|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/rcrxcp_extr.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/rcrxcp_extr.dat|3|2|$|@{0|}}
}}@0|@305000|86000|0|0|0|0|12|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|68|0|180|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|69|0|183|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|70|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|71|0|189|0|{Subgraph created from graph "Graph2my_tes"|{}@0|@190500|142000|0|0|0|0|22|Load RCRXCP IDW|ssatpat5|Created 4/23/2020 8:28:23 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|856000|306000|3|}}
{2010210004|XXGflow|72|0|191|0|{@{}@384|.5|.5|{0|}117|17|}}
{2010243001|XXGwatcher|73|0|193|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|74|0|195|0|{@{}@384|.5|.5|{0|}122|17|}}
{2010210004|XXGflow|75|0|197|0|{@{}@384|.5|.5|{0|}118|17|}}
{2010243001|XXGwatcher|76|0|199|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|77|0|201|0|{@{}@384|.5|.5|{0|}119|17|}}
{2010243001|XXGwatcher|78|0|203|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|79|0|205|0|{@{}@384|.5|.5|{0|}120|17|}}
{2010243001|XXGwatcher|80|0|207|0|{@{}@1|100|-1||0|}}
{2010503005|XXGfvertex|81|0|209|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_TEMP/rcrxcp_extr.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_TEMP/rcrxcp_extr.dat|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|/* DML Generated for SQL: select a.rxp2nb,a.rxoinb,a.rxbmdt,a.rxsdqv, a.rxseqv, a.rxsfqv, a.rxsgqv, a.rxshqv, a.rxsiqv, a.rxsjqv, a.rxskqv, a.rxslqv, a.rxsmqv, a.rxsnqv, a.rxsoqv, a.rxspqv, a.rxsqqv, a.rxsrqv, a.rxssqv, a.rxstqv, a.rxsuqv, a.rxsvqv, a.rxg0aw, a.rxpzvi, a.rxmgat, a.rxdbaq, a.rxsaau from clmprdfil.rcrxcp a
 * On: Tue Apr 21 01:03:55 2020
 */
record
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@1|@45000|92000|0|0|0|0|123|Input File-1|Ab Initio Software|@1|20000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|82|0|211|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|83|0|214|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|84|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010505005|XXGtvertex|85|0|219|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_Table.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 84 subkind 68 parts [vector]]]|3|9||@{0|}}
{30001002|XXparameter|config_file|$DB_RXCLAIM_DB/netezza.rxclaim_n24.stg.manual.dbc|3|2|f$|@{0|}}
{30001002|XXparameter|dbms|netezza|3|2|$|@{0|}}
{30001002|XXparameter|table_spec|ORX_IDW_DM_ETL_PRD.admin.F_CPN_ADJ_CLM_TXN_L3|3|3|c|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("ORX_IDW_DM_ETL_PRD.admin.F_CPN_ADJ_CLM_TXN_I", "dollar_curly_substitution") map_dataset 1 mapping [record dataset_path _interp_("$\{DB_RXCLAIM\}/tables/orx_idw_dm_etl_prd/orx_idw_dm_etl_prd.admin.f_cpn_adj_clm_txn_i", "pdl") create_update 1 is_db 1 dml_info [record dml _interp_("$AI_SERIAL_TEMP/rcrxcp_extr.dml", "pdl") is_dml_located 1 located_dml_info [record is_virtual_embedded 0 interpretation NULL]]]]]]]|3|9||@{0|}}
{30001002|XXparameter|nza__interface|api|3|1|l|@{0|}}
{30001002|XXparameter|write_metadata|/* DML Generated for SQL: select a.rxp2nb,a.rxoinb,a.rxbmdt,a.rxsdqv, a.rxseqv, a.rxsfqv, a.rxsgqv, a.rxshqv, a.rxsiqv, a.rxsjqv, a.rxskqv, a.rxslqv, a.rxsmqv, a.rxsnqv, a.rxsoqv, a.rxspqv, a.rxsqqv, a.rxsrqv, a.rxssqv, a.rxstqv, a.rxsuqv, a.rxsvqv, a.rxg0aw, a.rxpzvi, a.rxmgat, a.rxdbaq, a.rxsaau from clmprdfil.rcrxcp a
 * On: Tue Apr 21 01:03:55 2020
 */
record
  decimal("\\x01,0") rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01,0") rxoinb /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01,0") rxbmdt = NULL/*DECIMAL(7) NOT NULL*/;
  decimal("\\x01,.2") rxsdqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxseqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsfqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsgqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxshqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsiqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsjqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxskqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxslqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsmqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsnqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsoqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxspqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsqqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsrqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxssqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxstqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsuqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01,.2") rxsvqv = NULL/*DECIMAL(9,2) NOT NULL*/;
  string("\\x01, maximum_length=1") rxg0aw = NULL /*CHAR(1) NOT NULL*/;
  string("\\x01, maximum_length=10") rxpzvi = NULL /*CHAR(10) NOT NULL*/;
  string("\\x01, maximum_length=1") rxmgat = NULL /*CHAR(1) NOT NULL*/;
  decimal("\\x01,0") rxdbaq = NULL /*DECIMAL(3) NOT NULL*/;
  string("\\x01, maximum_length=1") rxsaau = NULL /*CHAR(1) NOT NULL*/;

end;|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|logging|True|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x000A|3|2|$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@1|@506000|85000|0|0|0|0|121|Output Table-1|Ab Initio Software|Built-in 2.2:|1|100|0||6||32769|}}
{2010203004|XXGoport|86|0|221|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|224|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|227|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|230|0|{@{}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010505005|XXGtvertex|90|0|233|0|{Loads data records into a database.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0012|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: log = remote("$AB_HOME/include/log-info.dml")
metadata type: reject = write
metadata type: error = remote("$AB_HOME/include/error-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|}}
{2010203004|XXGoport|91|0|235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|92|0|238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|93|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|94|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|95|0|250|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.rxg0aw :: if (is_blank(in.rxg0aw)) '-' else in.rxg0aw;
  out.rxpzvi :: if (is_blank(in.rxpzvi)) '-' else in.rxpzvi;
  out.rxmgat :: if (is_blank(in.rxmgat)) '-' else in.rxmgat;
  out.rxsaau :: if (is_blank(in.rxsaau)) '-' else in.rxsaau;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|207000|83000|0|0|0|0|116|Reformat-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|252|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|97|0|255|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|98|0|257|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|99|0|259|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|100|0|261|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|101|0|264|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|102|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|103|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|104|0|273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|105|0|276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|106|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|107|0|286|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|492000|203000|0|0|0|0|80|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|108|0|288|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|109|0|291|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|110|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|111|0|298|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|662000|165000|0|0|0|0|92|Trash-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|112|0|300|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|303|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|114|0|305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|115|0|310|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Trash|729000|143000|0|0|0|0|94|Trash-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|116|0|312|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|117|0|315|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|118|0|317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|119|0|322|0|{Subgraph created from graph "f_cpn_adj_claim_transaction_missing_data_fix"|{}@0|@553000|141500|0|0|0|0|24|Reformat Clean File|ssatpat5|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|605000|209000|7|}}
{2010210004|XXGflow|120|0|324|0|{@{}@384|.5|.5|{0|}29|2065|}}
{2010210004|XXGflow|121|0|326|0|{@{}@384|.5|.5|{0|}36|2065|}}
{2010210004|XXGflow|122|0|328|0|{@{}@384|.5|.5|{0|}33|17|}}
{2010503005|XXGfvertex|123|0|330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@3|@44000|85000|0|0|0|0|28|Input File|Ab Initio Software|@1|200|-1||6||257|-1|-1|}}
{2010203004|XXGoport|124|0|332|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|125|0|335|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|126|0|337|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|127|0|340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcrxcp_rcex1p.20200425000000.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
  little endian integer(8) dxf_src_dataset_id = 0/*\@ BizName:'DXF Source Dataset ID' BizComment:'The surrogate key for the DXF Process Log entry for this source.' \@*/;
  unsigned integer(8) dxf_src_rec_cnt = 0/*\@ BizName:'DXF Source Record Count' BizComment:'Starts at 1 each time the Source File Name changes.' \@*/;
  little endian integer(2) dxf_src_sys_id = 0/*\@ BizName:'DXF Source System ID' BizComment:'The numeric identifier of this source.' \@*/;
  string(unsigned integer(1)) dxf_src_file_name = ""/*\@ BizName:'DXF Source File Name' BizComment:'The name of the source file, relative to $AI_SERIAL_PENDING.' \@*/;
  string("\\x01", maximum_length=1) cdc_flag = NULL;
  datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn")("\\x01") cdc_ts = NULL;
  decimal("\\x01",0, maximum_length=16, sign_reserved) rxp2nb /*DECIMAL(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxoinb /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) claimsts /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=9) carrierid /*CHAR(9) NOT NULL*/;
  string("\\x01", maximum_length=15) accountid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) groupnbr /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=20) memberid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=15) srvprovid /*CHAR(15) NOT NULL*/;
  string("\\x01", maximum_length=15) sbmsrvprid /*CHAR(15) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) rxbmdt /*DECIMAL(7) NOT NULL*/;
  decimal("\\x01",0, maximum_length=9, sign_reserved) dtefilled /*DECIMAL(8) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) dayssupply /*DECIMAL(3) NOT NULL*/;
  decimal("\\x01".3, maximum_length=13, sign_reserved) decimalqty /*DECIMAL(11,3) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) phrpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltdueamt /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cltpatpay /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) cctresrv11 /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01",0, maximum_length=8, sign_reserved) fnlplandte /*DECIMAL(7) NOT NULL*/;
  string("\\x01", maximum_length=10) fnlplancde /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) compoundcd /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=20) productid /*CHAR(20) NOT NULL*/;
  string("\\x01", maximum_length=2) prodtypcde /*CHAR(2) NOT NULL*/;
  string("\\x01", maximum_length=1) clmorigin /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=12) rxnumber /*CHAR(12) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsdqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxseqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsfqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsgqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxshqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsiqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsjqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxskqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxslqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsmqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsnqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsoqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxspqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsqqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsrqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxssqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxstqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsuqv /*DECIMAL(9,2) NOT NULL*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved) rxsvqv /*DECIMAL(9,2) NOT NULL*/;
  string("\\x01", maximum_length=1) rxg0aw /*CHAR(1) NOT NULL*/;
  string("\\x01", maximum_length=10) rxpzvi /*CHAR(10) NOT NULL*/;
  string("\\x01", maximum_length=1) rxmgat /*CHAR(1) NOT NULL*/;
  decimal("\\x01",0, maximum_length=4, sign_reserved) rxdbaq /*DECIMAL(3) NOT NULL*/;
  string("\\x01", maximum_length=1) rxsaau /*CHAR(1) NOT NULL*/;
  string(1) newline = "\\n";
end|3|1|l|@{0|}}
}}@4|@517000|90000|0|0|0|0|37|Input File-1|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|128|0|342|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|129|0|345|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|130|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|131|0|350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.* :: in.*;
  out.dtefilled:: (decimal(","))(string(","))(date("YYYYMMDD"))in.dtefilled;
  out.fnlplandte::  (decimal(","))string_lrtrim((string(","))(date("YYYYMMDD"))in.fnlplandte) - 19000000;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|175000|101000|0|0|0|0|31|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|132|0|352|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|133|0|355|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|134|0|357|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|135|0|359|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|136|0|361|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|364|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|138|0|366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|139|0|370|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|140|0|373|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|141|0|376|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|142|0|379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|143|0|386|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@4|Replicate|406000|120000|0|0|0|0|35|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|144|0|388|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|145|0|391|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|146|0|394|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|147|0|396|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|148|0|399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010110002|XXGconstant|149|0|405|0|{@{}@{1|8357066|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010601001|XXGgraph_vertex_vertex|4|0|8|0|{Create_Clean_File|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_1|}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_2|}5|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_3|}5|8|}
{2010601001|XXGgraph_vertex_vertex|8|0|16|0|{Input_File|}5|9|}
{2010211001|XXGvertex_iport_iport|9|0|18|0|{0|write|}9|10|}
{2010214001|XXGiport_src_flow|10|0|20|0|{0|}10|7|}
{2010007001|XXGobject_proto_object|11|0|21|0|{}9|11|}
{2010211001|XXGvertex_iport_iport|12|0|23|0|{0|write|}11|12|}
{2010006001|XXGobject_psameas_object|13|0|25|0|{metadata|write_metadata|1|0|}12|11|}
{2010601001|XXGgraph_vertex_vertex|14|0|26|0|{Input_Table|}5|13|}
{2010212001|XXGvertex_oport_oport|15|0|28|0|{0|read|}13|14|}
{2010213001|XXGoport_dst_flow|16|0|30|0|{0|}14|6|}
{2010212001|XXGvertex_oport_oport|17|0|31|0|{1|log|}13|15|}
{2010007001|XXGobject_proto_object|18|0|33|0|{}13|16|}
{2010212001|XXGvertex_oport_oport|19|0|35|0|{0|read|}16|17|}
{2010006001|XXGobject_psameas_object|20|0|37|0|{metadata|read_metadata|1|0|}17|16|}
{2010212001|XXGvertex_oport_oport|21|0|38|0|{1|log|}16|18|}
{2010006001|XXGobject_psameas_object|22|0|40|0|{metadata|log_metadata|1|0|}18|16|}
{2010006001|XXGobject_psameas_object|23|0|41|0|{Layout|table_spec|0|1|}16|16|}
{2010006001|XXGobject_psameas_object|24|0|42|0|{Layout|table_spec|0|1|}13|13|}
{2010601001|XXGgraph_vertex_vertex|25|0|43|0|{Partition_by_Round_robin|}5|19|}
{2010212001|XXGvertex_oport_oport|26|0|45|0|{0|out|}19|20|}
{2010213001|XXGoport_dst_flow|27|0|47|0|{0|}20|7|}
{2010211001|XXGvertex_iport_iport|28|0|48|0|{0|in|}19|21|}
{2010214001|XXGiport_src_flow|29|0|50|0|{0|}21|8|}
{2010007001|XXGobject_proto_object|30|0|51|0|{}19|22|}
{2010212001|XXGvertex_oport_oport|31|0|53|0|{0|out|}22|23|}
{2010006001|XXGobject_psameas_object|32|0|55|0|{metadata|out_metadata|1|0|}23|22|}
{2010211001|XXGvertex_iport_iport|33|0|56|0|{0|in|}22|24|}
{2010006001|XXGobject_psameas_object|34|0|58|0|{metadata|in_metadata|1|0|}24|22|}
{2010006001|XXGobject_psameas_object|35|0|59|0|{Layout|Layout|0|0|}19|13|}
{2010006001|XXGobject_psameas_object|36|0|60|0|{in_metadata|write_metadata|0|0|}19|9|}
{2010006001|XXGobject_psameas_object|37|0|61|0|{out_metadata|write_metadata|0|0|}19|9|}
{2010601001|XXGgraph_vertex_vertex|38|0|62|0|{Reformat|}5|25|}
{2010212001|XXGvertex_oport_oport|39|0|64|0|{0|out0|}25|26|}
{2010213001|XXGoport_dst_flow|40|0|66|0|{0|}26|8|}
{2010212001|XXGvertex_oport_oport|41|0|67|0|{1|reject0|}25|27|}
{2010212001|XXGvertex_oport_oport|42|0|69|0|{2|error0|}25|28|}
{2010212001|XXGvertex_oport_oport|43|0|71|0|{3|log|}25|29|}
{2010211001|XXGvertex_iport_iport|44|0|73|0|{0|in|}25|30|}
{2010214001|XXGiport_src_flow|45|0|75|0|{0|}30|6|}
{2010007001|XXGobject_proto_object|46|0|76|0|{}25|31|}
{2010212001|XXGvertex_oport_oport|47|0|78|0|{0|out0|}31|32|}
{2010006001|XXGobject_psameas_object|48|0|80|0|{metadata|out0_metadata|1|0|}32|31|}
{2010006001|XXGobject_psameas_object|49|0|81|0|{transform0|transform0|1|0|}32|31|}
{2010212001|XXGvertex_oport_oport|50|0|82|0|{1|reject0|}31|33|}
{2010006001|XXGobject_psameas_object|51|0|84|0|{metadata|reject0_metadata|1|0|}33|31|}
{2010212001|XXGvertex_oport_oport|52|0|85|0|{2|error0|}31|34|}
{2010006001|XXGobject_psameas_object|53|0|87|0|{metadata|error0_metadata|1|0|}34|31|}
{2010212001|XXGvertex_oport_oport|54|0|88|0|{3|log|}31|35|}
{2010006001|XXGobject_psameas_object|55|0|90|0|{metadata|log_metadata|1|0|}35|31|}
{2010211001|XXGvertex_iport_iport|56|0|91|0|{0|in|}31|36|}
{2010006001|XXGobject_psameas_object|57|0|93|0|{metadata|in_metadata|1|0|}36|31|}
{2010006001|XXGobject_psameas_object|58|0|94|0|{Layout|Layout|0|0|}25|13|}
{2010006001|XXGobject_psameas_object|59|0|95|0|{in_metadata|read_metadata|0|0|}25|13|}
{2010006001|XXGobject_psameas_object|60|0|96|0|{out0_metadata|write_metadata|0|0|}25|9|}
{2010006001|XXGobject_psameas_object|61|0|97|0|{reject0_metadata|read_metadata|0|0|}25|13|}
{2010601001|XXGgraph_vertex_vertex|62|0|98|0|{Create_Single_File|}1|37|}
{2010604001|XXGgraph_flow_flow|63|0|100|0|{Flow_1|}37|38|}
{2010604001|XXGgraph_flow_flow|64|0|102|0|{Flow_2|}37|39|}
{2010604001|XXGgraph_flow_flow|65|0|104|0|{Flow_3|}37|40|}
{2010601001|XXGgraph_vertex_vertex|66|0|106|0|{Gather|}37|41|}
{2010212001|XXGvertex_oport_oport|67|0|108|0|{0|out|}41|42|}
{2010213001|XXGoport_dst_flow|68|0|110|0|{0|}42|40|}
{2010211001|XXGvertex_iport_iport|69|0|111|0|{0|in|}41|43|}
{2010214001|XXGiport_src_flow|70|0|113|0|{0|}43|38|}
{2010214001|XXGiport_src_flow|71|0|114|0|{1|}43|39|}
{2010007001|XXGobject_proto_object|72|0|115|0|{}41|44|}
{2010212001|XXGvertex_oport_oport|73|0|117|0|{0|out|}44|45|}
{2010006001|XXGobject_psameas_object|74|0|119|0|{metadata|out_metadata|1|0|}45|44|}
{2010211001|XXGvertex_iport_iport|75|0|120|0|{0|in|}44|46|}
{2010006001|XXGobject_psameas_object|76|0|122|0|{metadata|in_metadata|1|0|}46|44|}
{2010006001|XXGobject_psameas_object|77|0|123|0|{Layout|Layout|0|0|}41|47|}
{2010211001|XXGvertex_iport_iport|78|0|125|0|{0|write|}47|48|}
{2010214001|XXGiport_src_flow|79|0|127|0|{0|}48|40|}
{2010007001|XXGobject_proto_object|80|0|128|0|{}47|49|}
{2010211001|XXGvertex_iport_iport|81|0|130|0|{0|write|}49|50|}
{2010006001|XXGobject_psameas_object|82|0|132|0|{metadata|write_metadata|1|0|}50|49|}
{2010006001|XXGobject_psameas_object|83|0|133|0|{in_metadata|read_metadata|0|0|}41|51|}
{2010212001|XXGvertex_oport_oport|84|0|135|0|{0|read|}51|52|}
{2010213001|XXGoport_dst_flow|85|0|137|0|{0|}52|39|}
{2010007001|XXGobject_proto_object|86|0|138|0|{}51|53|}
{2010212001|XXGvertex_oport_oport|87|0|140|0|{0|read|}53|54|}
{2010006001|XXGobject_psameas_object|88|0|142|0|{metadata|read_metadata|1|0|}54|53|}
{2010006001|XXGobject_psameas_object|89|0|143|0|{out_metadata|read_metadata|0|0|}41|51|}
{2010601001|XXGgraph_vertex_vertex|90|0|144|0|{Input_File_1|}37|55|}
{2010212001|XXGvertex_oport_oport|91|0|146|0|{0|read|}55|56|}
{2010213001|XXGoport_dst_flow|92|0|148|0|{0|}56|38|}
{2010007001|XXGobject_proto_object|93|0|149|0|{}55|57|}
{2010212001|XXGvertex_oport_oport|94|0|151|0|{0|read|}57|58|}
{2010006001|XXGobject_psameas_object|95|0|153|0|{metadata|read_metadata|1|0|}58|57|}
{2010601001|XXGgraph_vertex_vertex|96|0|154|0|{Input_File_2|}37|51|}
{2010601001|XXGgraph_vertex_vertex|97|0|155|0|{Input_File_3|}37|47|}
{2010601001|XXGgraph_vertex_vertex|98|0|156|0|{Extr_RCRXCP_Source|}1|59|}
{2010604001|XXGgraph_flow_flow|99|0|158|0|{Flow_1|}59|60|}
{2010601001|XXGgraph_vertex_vertex|100|0|160|0|{Input_Table|}59|61|}
{2010212001|XXGvertex_oport_oport|101|0|162|0|{0|read|}61|62|}
{2010213001|XXGoport_dst_flow|102|0|164|0|{0|}62|60|}
{2010212001|XXGvertex_oport_oport|103|0|165|0|{1|log|}61|63|}
{2010007001|XXGobject_proto_object|104|0|167|0|{}61|64|}
{2010212001|XXGvertex_oport_oport|105|0|169|0|{0|read|}64|65|}
{2010006001|XXGobject_psameas_object|106|0|171|0|{metadata|read_metadata|1|0|}65|64|}
{2010212001|XXGvertex_oport_oport|107|0|172|0|{1|log|}64|66|}
{2010006001|XXGobject_psameas_object|108|0|174|0|{metadata|log_metadata|1|0|}66|64|}
{2010006001|XXGobject_psameas_object|109|0|175|0|{Layout|table_spec|0|1|}64|64|}
{2010006001|XXGobject_psameas_object|110|0|176|0|{Layout|table_spec|0|1|}61|61|}
{2010601001|XXGgraph_vertex_vertex|111|0|177|0|{Output_File|}59|67|}
{2010211001|XXGvertex_iport_iport|112|0|179|0|{0|write|}67|68|}
{2010214001|XXGiport_src_flow|113|0|181|0|{0|}68|60|}
{2010007001|XXGobject_proto_object|114|0|182|0|{}67|69|}
{2010211001|XXGvertex_iport_iport|115|0|184|0|{0|write|}69|70|}
{2010006001|XXGobject_psameas_object|116|0|186|0|{metadata|write_metadata|1|0|}70|69|}
{2010006001|XXGobject_psameas_object|117|0|187|0|{write_metadata|read_metadata|0|0|}67|61|}
{2010601001|XXGgraph_vertex_vertex|118|0|188|0|{Load_RCRXCP_IDW|}1|71|}
{2010604001|XXGgraph_flow_flow|119|0|190|0|{Flow_4|}71|72|}
{2010244001|XXGflow_watcher_watcher|120|0|192|0|{}72|73|}
{2010604001|XXGgraph_flow_flow|121|0|194|0|{Flow_5|}71|74|}
{2010604001|XXGgraph_flow_flow|122|0|196|0|{Flow_6|}71|75|}
{2010244001|XXGflow_watcher_watcher|123|0|198|0|{}75|76|}
{2010604001|XXGgraph_flow_flow|124|0|200|0|{Flow_7|}71|77|}
{2010244001|XXGflow_watcher_watcher|125|0|202|0|{}77|78|}
{2010604001|XXGgraph_flow_flow|126|0|204|0|{Flow_8|}71|79|}
{2010244001|XXGflow_watcher_watcher|127|0|206|0|{}79|80|}
{2010601001|XXGgraph_vertex_vertex|128|0|208|0|{Input_File_1|}71|81|}
{2010212001|XXGvertex_oport_oport|129|0|210|0|{0|read|}81|82|}
{2010213001|XXGoport_dst_flow|130|0|212|0|{0|}82|74|}
{2010007001|XXGobject_proto_object|131|0|213|0|{}81|83|}
{2010212001|XXGvertex_oport_oport|132|0|215|0|{0|read|}83|84|}
{2010006001|XXGobject_psameas_object|133|0|217|0|{metadata|read_metadata|1|0|}84|83|}
{2010601001|XXGgraph_vertex_vertex|134|0|218|0|{Output_Table_1|}71|85|}
{2010212001|XXGvertex_oport_oport|135|0|220|0|{0|reject|}85|86|}
{2010213001|XXGoport_dst_flow|136|0|222|0|{0|}86|75|}
{2010212001|XXGvertex_oport_oport|137|0|223|0|{1|error|}85|87|}
{2010213001|XXGoport_dst_flow|138|0|225|0|{0|}87|77|}
{2010212001|XXGvertex_oport_oport|139|0|226|0|{2|log|}85|88|}
{2010213001|XXGoport_dst_flow|140|0|228|0|{0|}88|79|}
{2010211001|XXGvertex_iport_iport|141|0|229|0|{0|write|}85|89|}
{2010214001|XXGiport_src_flow|142|0|231|0|{0|}89|72|}
{2010007001|XXGobject_proto_object|143|0|232|0|{}85|90|}
{2010212001|XXGvertex_oport_oport|144|0|234|0|{0|reject|}90|91|}
{2010006001|XXGobject_psameas_object|145|0|236|0|{metadata|reject_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|146|0|237|0|{1|error|}90|92|}
{2010006001|XXGobject_psameas_object|147|0|239|0|{metadata|error_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|148|0|240|0|{2|log|}90|93|}
{2010006001|XXGobject_psameas_object|149|0|242|0|{metadata|log_metadata|1|0|}93|90|}
{2010211001|XXGvertex_iport_iport|150|0|243|0|{0|write|}90|94|}
{2010006001|XXGobject_psameas_object|151|0|245|0|{metadata|write_metadata|1|0|}94|90|}
{2010006001|XXGobject_psameas_object|152|0|246|0|{Layout|table_spec|0|1|}90|90|}
{2010006001|XXGobject_psameas_object|153|0|247|0|{Layout|table_spec|0|1|}85|85|}
{2010006001|XXGobject_psameas_object|154|0|248|0|{reject_metadata|write_metadata|0|0|}85|85|}
{2010601001|XXGgraph_vertex_vertex|155|0|249|0|{Reformat_2|}71|95|}
{2010212001|XXGvertex_oport_oport|156|0|251|0|{0|out0|}95|96|}
{2010213001|XXGoport_dst_flow|157|0|253|0|{0|}96|72|}
{2010212001|XXGvertex_oport_oport|158|0|254|0|{1|reject0|}95|97|}
{2010212001|XXGvertex_oport_oport|159|0|256|0|{2|error0|}95|98|}
{2010212001|XXGvertex_oport_oport|160|0|258|0|{3|log|}95|99|}
{2010211001|XXGvertex_iport_iport|161|0|260|0|{0|in|}95|100|}
{2010214001|XXGiport_src_flow|162|0|262|0|{0|}100|74|}
{2010007001|XXGobject_proto_object|163|0|263|0|{}95|101|}
{2010212001|XXGvertex_oport_oport|164|0|265|0|{0|out0|}101|102|}
{2010006001|XXGobject_psameas_object|165|0|267|0|{metadata|out0_metadata|1|0|}102|101|}
{2010006001|XXGobject_psameas_object|166|0|268|0|{transform0|transform0|1|0|}102|101|}
{2010212001|XXGvertex_oport_oport|167|0|269|0|{1|reject0|}101|103|}
{2010006001|XXGobject_psameas_object|168|0|271|0|{metadata|reject0_metadata|1|0|}103|101|}
{2010212001|XXGvertex_oport_oport|169|0|272|0|{2|error0|}101|104|}
{2010006001|XXGobject_psameas_object|170|0|274|0|{metadata|error0_metadata|1|0|}104|101|}
{2010212001|XXGvertex_oport_oport|171|0|275|0|{3|log|}101|105|}
{2010006001|XXGobject_psameas_object|172|0|277|0|{metadata|log_metadata|1|0|}105|101|}
{2010211001|XXGvertex_iport_iport|173|0|278|0|{0|in|}101|106|}
{2010006001|XXGobject_psameas_object|174|0|280|0|{metadata|in_metadata|1|0|}106|101|}
{2010006001|XXGobject_psameas_object|175|0|281|0|{Layout|Layout|0|0|}95|85|}
{2010006001|XXGobject_psameas_object|176|0|282|0|{in_metadata|read_metadata|0|0|}95|81|}
{2010006001|XXGobject_psameas_object|177|0|283|0|{out0_metadata|write_metadata|0|0|}95|85|}
{2010006001|XXGobject_psameas_object|178|0|284|0|{reject0_metadata|read_metadata|0|0|}95|81|}
{2010601001|XXGgraph_vertex_vertex|179|0|285|0|{Trash|}71|107|}
{2010211001|XXGvertex_iport_iport|180|0|287|0|{0|in|}107|108|}
{2010214001|XXGiport_src_flow|181|0|289|0|{0|}108|75|}
{2010007001|XXGobject_proto_object|182|0|290|0|{}107|109|}
{2010211001|XXGvertex_iport_iport|183|0|292|0|{0|in|}109|110|}
{2010006001|XXGobject_psameas_object|184|0|294|0|{metadata|in_metadata|1|0|}110|109|}
{2010006001|XXGobject_psameas_object|185|0|295|0|{Layout|Layout|0|0|}107|85|}
{2010006001|XXGobject_psameas_object|186|0|296|0|{in_metadata|write_metadata|0|0|}107|85|}
{2010601001|XXGgraph_vertex_vertex|187|0|297|0|{Trash_1|}71|111|}
{2010211001|XXGvertex_iport_iport|188|0|299|0|{0|in|}111|112|}
{2010214001|XXGiport_src_flow|189|0|301|0|{0|}112|77|}
{2010007001|XXGobject_proto_object|190|0|302|0|{}111|113|}
{2010211001|XXGvertex_iport_iport|191|0|304|0|{0|in|}113|114|}
{2010006001|XXGobject_psameas_object|192|0|306|0|{metadata|in_metadata|1|0|}114|113|}
{2010006001|XXGobject_psameas_object|193|0|307|0|{Layout|Layout|0|0|}111|85|}
{2010006001|XXGobject_psameas_object|194|0|308|0|{in_metadata|error_metadata|0|0|}111|85|}
{2010601001|XXGgraph_vertex_vertex|195|0|309|0|{Trash_2|}71|115|}
{2010211001|XXGvertex_iport_iport|196|0|311|0|{0|in|}115|116|}
{2010214001|XXGiport_src_flow|197|0|313|0|{0|}116|79|}
{2010007001|XXGobject_proto_object|198|0|314|0|{}115|117|}
{2010211001|XXGvertex_iport_iport|199|0|316|0|{0|in|}117|118|}
{2010006001|XXGobject_psameas_object|200|0|318|0|{metadata|in_metadata|1|0|}118|117|}
{2010006001|XXGobject_psameas_object|201|0|319|0|{Layout|Layout|0|0|}115|85|}
{2010006001|XXGobject_psameas_object|202|0|320|0|{in_metadata|log_metadata|0|0|}115|85|}
{2010601001|XXGgraph_vertex_vertex|203|0|321|0|{Reformat_Clean_File|}1|119|}
{2010604001|XXGgraph_flow_flow|204|0|323|0|{Flow_1|}119|120|}
{2010604001|XXGgraph_flow_flow|205|0|325|0|{Flow_2|}119|121|}
{2010604001|XXGgraph_flow_flow|206|0|327|0|{Flow_3|}119|122|}
{2010601001|XXGgraph_vertex_vertex|207|0|329|0|{Input_File|}119|123|}
{2010212001|XXGvertex_oport_oport|208|0|331|0|{0|read|}123|124|}
{2010213001|XXGoport_dst_flow|209|0|333|0|{0|}124|120|}
{2010007001|XXGobject_proto_object|210|0|334|0|{}123|125|}
{2010212001|XXGvertex_oport_oport|211|0|336|0|{0|read|}125|126|}
{2010006001|XXGobject_psameas_object|212|0|338|0|{metadata|read_metadata|1|0|}126|125|}
{2010601001|XXGgraph_vertex_vertex|213|0|339|0|{Input_File_1|}119|127|}
{2010211001|XXGvertex_iport_iport|214|0|341|0|{0|write|}127|128|}
{2010214001|XXGiport_src_flow|215|0|343|0|{0|}128|121|}
{2010007001|XXGobject_proto_object|216|0|344|0|{}127|129|}
{2010211001|XXGvertex_iport_iport|217|0|346|0|{0|write|}129|130|}
{2010006001|XXGobject_psameas_object|218|0|348|0|{metadata|write_metadata|1|0|}130|129|}
{2010601001|XXGgraph_vertex_vertex|219|0|349|0|{Reformat|}119|131|}
{2010212001|XXGvertex_oport_oport|220|0|351|0|{0|out0|}131|132|}
{2010213001|XXGoport_dst_flow|221|0|353|0|{0|}132|122|}
{2010212001|XXGvertex_oport_oport|222|0|354|0|{1|reject0|}131|133|}
{2010212001|XXGvertex_oport_oport|223|0|356|0|{2|error0|}131|134|}
{2010212001|XXGvertex_oport_oport|224|0|358|0|{3|log|}131|135|}
{2010211001|XXGvertex_iport_iport|225|0|360|0|{0|in|}131|136|}
{2010214001|XXGiport_src_flow|226|0|362|0|{0|}136|120|}
{2010007001|XXGobject_proto_object|227|0|363|0|{}131|137|}
{2010212001|XXGvertex_oport_oport|228|0|365|0|{0|out0|}137|138|}
{2010006001|XXGobject_psameas_object|229|0|367|0|{metadata|out0_metadata|1|0|}138|137|}
{2010006001|XXGobject_psameas_object|230|0|368|0|{transform0|transform0|1|0|}138|137|}
{2010212001|XXGvertex_oport_oport|231|0|369|0|{1|reject0|}137|139|}
{2010006001|XXGobject_psameas_object|232|0|371|0|{metadata|reject0_metadata|1|0|}139|137|}
{2010212001|XXGvertex_oport_oport|233|0|372|0|{2|error0|}137|140|}
{2010006001|XXGobject_psameas_object|234|0|374|0|{metadata|error0_metadata|1|0|}140|137|}
{2010212001|XXGvertex_oport_oport|235|0|375|0|{3|log|}137|141|}
{2010006001|XXGobject_psameas_object|236|0|377|0|{metadata|log_metadata|1|0|}141|137|}
{2010211001|XXGvertex_iport_iport|237|0|378|0|{0|in|}137|142|}
{2010006001|XXGobject_psameas_object|238|0|380|0|{metadata|in_metadata|1|0|}142|137|}
{2010006001|XXGobject_psameas_object|239|0|381|0|{Layout|Layout|0|0|}131|127|}
{2010006001|XXGobject_psameas_object|240|0|382|0|{in_metadata|read_metadata|0|0|}131|123|}
{2010006001|XXGobject_psameas_object|241|0|383|0|{out0_metadata|write_metadata|0|0|}131|127|}
{2010006001|XXGobject_psameas_object|242|0|384|0|{reject0_metadata|read_metadata|0|0|}131|123|}
{2010601001|XXGgraph_vertex_vertex|243|0|385|0|{Replicate|}119|143|}
{2010212001|XXGvertex_oport_oport|244|0|387|0|{0|out|}143|144|}
{2010213001|XXGoport_dst_flow|245|0|389|0|{0|}144|121|}
{2010211001|XXGvertex_iport_iport|246|0|390|0|{0|in|}143|145|}
{2010214001|XXGiport_src_flow|247|0|392|0|{0|}145|122|}
{2010007001|XXGobject_proto_object|248|0|393|0|{}143|146|}
{2010212001|XXGvertex_oport_oport|249|0|395|0|{0|out|}146|147|}
{2010006001|XXGobject_psameas_object|250|0|397|0|{metadata|out_metadata|1|0|}147|146|}
{2010211001|XXGvertex_iport_iport|251|0|398|0|{0|in|}146|148|}
{2010006001|XXGobject_psameas_object|252|0|400|0|{metadata|in_metadata|1|0|}148|146|}
{2010006001|XXGobject_psameas_object|253|0|401|0|{Layout|Layout|0|0|}143|127|}
{2010006001|XXGobject_psameas_object|254|0|402|0|{in_metadata|write_metadata|0|0|}143|127|}
{2010006001|XXGobject_psameas_object|255|0|403|0|{out_metadata|write_metadata|0|0|}143|127|}
{2010109001|XXGobject_property_value|256|0|404|0|{0|TrackingThumbprint|72|}1|149|}
