@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|44|rel_count|69|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|RUN_LOG_DIR|$[AI_SERIAL + '/run_id/processed']|3|9|FK|@{0|}}
{30001002|XXparameter|RUN_DTTM|$[ (datetime("YYYYMMDDHH24MISS")) now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|ORX_RUN_ID|$[ read_file(AI_SERIAL+'/run_id/processed/run_id.orx_fac.dat')]|3|9|REFK|@{0|}}
{30001002|XXparameter|CTRX_RUN_ID|$[ read_file(AI_SERIAL+'/run_id/processed/run_id.ctrx_fac.dat')]|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|PUB_CLINICAL_DATAHUB_MFS_INBOUND|$[AI_MFS_BASE + '/clinical/pub_clinical_datahub/inbound/']|3|9|FK|@{0|}}
{30001002|XXparameter|SYS_ID||3|9|K|Obsolete|{0|}}
{30001002|XXparameter|SOURCE_CTRX_FILE_NAME|$PUB_DATAHUB_MFS/ilm/rxclaim_ctrx/ilm.rxclaim_ctrx.rcex1p..ctrx_f_claim_transaction_cdur.$CTRX_RUN_ID.dat.gz|3|9|EFK|Path to the clean file produced by a clean step.  Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|SOURCE_ORX_FILE_NAME|$PUB_DATAHUB_MFS/ilm/rxclaim_orx/ilm.rxclaim_orx.rcex1p..orx_f_claim_transaction_cdur.$ORX_RUN_ID.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$AI_DML/ilm/ilm.ctrx_f_claim_transaction_cdur.dml|3|9|EFK|Path to the record format for the clean source.  Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ expand_type(read_type(SOURCE_DML_FILE)) ]|3|9|RK|The record format for the clean source.|{0|}}
{30001002|XXparameter|PUBLISH_DML_FILE|$[string_replace((string_prefix( $PROJECT_DIR, string_length( $PROJECT_DIR) - string_length("orca/rxclaim")) + "clinical/pub_clinical_datahub/dml/inbound/ids/f_claim_transaction_cli_in_t.dml"),"rxclaim","distribution")]|3|9|REK|Path to the record format for the ILM.  Defaults to a file name based on the ILM name.|{0|}}
{30001002|XXparameter|PUBLISH_DML|$[ expand_type(read_file(PUBLISH_DML_FILE)) ]|3|9|RK|The record format for the ILM.|{0|}}
{30001002|XXparameter|PUBLISH_URL|$[PUB_CLINICAL_DATAHUB_MFS_INBOUND + '/ids/f_claim_transaction_' + string_prefix( RUN_DTTM, 8) + '_' + string_suffix( RUN_DTTM, 6) + '.dat.gz']|28|9|REFK|The URL for the results of the mapping.  Exported from the ILM dataset.|{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|892000|480000|0|map.rxclaim.f_claim_transaction_cli_in_t|Kimbo Mundy|Created 5/27/2011 11:27:06 PM|1|10|0||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1696000|455000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|1|}Job 'map.rxclaim_ctrx.f_claim_transaction_cli_in_t_direct' Execution Status Report

Job completed successfully at Monday, January 02, 2017 02:04:16
Run performed by user vkuma158
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/map.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_REJECT/map.$SOURCE_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/ilm" "$AI_MFS_REJECT/map.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

export AB_REPORT="summary=$AI_SERIAL_LOG/map.$SOURCE_SYSTEM/map.$SOURCE_LOWER.$ILM_NAME.summary.log $AB_REPORT"

# This is a hack to make sure that all *_LOOKUP parameters are exported to the environment so that AB_CATALOG works as expected.
eval "$(set \| sed -n '/_LOOKUP=/s/\\(^[^=]*\\).*/export \\1="$\\1"/p')"
|if [[ ( x"$AB_APPCONF_EXECUTION" = x"true" \|\| x"$AB_APPCONF_EXECUTION" = x"True" ) && -f "$AI_RAW_TRACKING_FILE" ]]; then
  # These grep patterns need tweaking.
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \| egrep '_Filter * out\|Map_.** out0$\| dup\| [out0%]*reject\| second' 1>&2
fi


|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Runs Once per Source/ILM Pair|374905|165440|305000|105000|315000|24000|6360|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|160|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Map a Cleansed Source to an ILM and multiple SPLIT files|15000|35155|0|0|0|0|6330|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|360|1|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}6361|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}6365|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}6363|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}6350|17|}}
{2010501005|XXGpvertex|13|0|25|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|558000|260000|0|0|0|0|6351|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|14|0|27|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|15|0|30|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|16|0|34|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|17|0|36|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|18|0|39|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|19|0|42|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|$PUBLISH_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|write_metadata|/******************************************************************************************************************************************
 * pub_clinical_datahub -> $PUB_CLINICAL_DATAHUB_DML/inbound/ids/f_claim_transaction_cli_in_t.dml
 * 
 * Change Log:
 * 
 *  Date        Author                  Description
 * ---------------------------------------------------------------------------------------------------------------------------------------
 *  2016/08/04  Paul Thompson           Initial version
 *  2016/09/26  Aravind Sanku           Added Medicare part D, and pbr_st_cd 
 *  2016/09/28  Aravind Sanku           Added more fields 
 *  2016/09/30  Aravind Sanku           Added drug_ndc_id & changed the field type on cust_loc
 *  2016/10/03  Paul Thompson           Added pbr_dea_id and pbr_npi 
 ******************************************************************************************************************************************/

type f_claim_transaction_cli_in_t =
record
  string("\\x01",charset="iso-8859-15", maximum_length=4)        legacy_src_env_id                           /* VARCHAR(4) NOT NULL */;
  decimal("\\x01",0)                                             claim_nbr                                   /* BIGINT     NOT NULL */;
  decimal("\\x01",0)                                             claim_seq_nbr                               /* INTEGER    NOT NULL */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        claim_stat_id                               /* CHAR(1)    NOT NULL */;
  string("\\x01",charset="iso-8859-15", maximum_length=30)       carrier_id                      = NULL("")  /* VARCHAR(30)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=40)       account_id                      = NULL("")  /* VARCHAR(40)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=30)       employer_group_id               = NULL("")  /* VARCHAR(30)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=20)       mbr_id                          = NULL("")  /* VARCHAR(20)         */;
  date("YYYYMMDD")("\\x01")                                      mbr_mcre_covrg_from_dt          = NULL("")  /* DATE                */; /* from mbr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=6)        pbr_spclty_cd                   = NULL("")  /* VARCHAR(6)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=12)       phr_id                          = NULL("")  /* VARCHAR(12)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       submd_phr_id                    = NULL("")  /* VARCHAR(15)         */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=2)        submd_phr_id_qlfr_cd            = NULL("")  /* VARCHAR(2)          */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=6)        phr_ntwrk_id                    = NULL("")  /* VARCHAR(6)          */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=25)       phr_ntwrk_nm                    = NULL("")  /* VARCHAR(25)         */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=3)        phr_ntwrk_prity_cd              = NULL("")  /* VARCHAR(3)          */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=1)        phr_ntwrk_qlfr_ind              = NULL("")  /* CHAR(1)             */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=2)        phr_ntwrk_typ_cd                = NULL("")  /* VARCHAR(2)          */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=9)        phr_ntwrk_carr_nm               = NULL("")  /* VARCHAR(9)          */; /* from phr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=1)        gender_cd                       = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       drg_nm_extn_id                  = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        drg_maint_cd                    = NULL("")  /* CHAR(1)             */; /* from drg adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=1)        drg_maint_src                   = NULL("")  /* CHAR(1)             */; /* from drg adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=1)        relationship_cd                 = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=20)       prod_id                         = NULL("")  /* VARCHAR(20)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        prod_id_qlfr_cd                 = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       phy_pbr_key                     = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=6)        pbr_ntwrk_id                    = NULL("")  /* VARCHAR(6)          */; /* from pbr adjud */
  string("\\x01",charset="iso-8859-15", maximum_length=8)        ahfs_cd                         = NULL("")  /* VARCHAR(8)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=11)       drg_admin_rte_hitsb_desc        = NULL("")  /* VARCHAR(11)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=11)       drg_ndc_id                      = NULL("")  /* VARCHAR(11)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=14)       gpi_id                          = NULL("")  /* VARCHAR(14)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       gpi_list_qlfr_nm                = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        dea_cd                          = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        compound_cd                     = NULL("")  /* CHAR(1)             */; /* from l_compound_cli_in_t.dml */
  date("YYYYMMDD")("\\x01")                                      sbm_dt                          = NULL("")  /* DATE                */;
  decimal("\\x01",0)                                             mbr_age                         = NULL("")  /* SMALLINT            */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        refill_nbr                      = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        daw_cd                          = NULL("")  /* CHAR(1)             */;
  decimal("\\x01",0)                                             days_sply                       = NULL("")  /* SMALLINT            */;
  decimal("\\x01".3, maximum_length=13, sign_reserved)           drg_qty                         = NULL("")  /* DECIMAL(11,3)       */;
  date("YYYYMMDD")("\\x01")                                      filled_dt                       = NULL("")  /* DATE                */;
  date("YYYYMMDD")("\\x01")                                      rx_written_dt                   = NULL("")  /* DATE                */;
  string("\\x01",charset="iso-8859-15", maximum_length=12)       rx_nbr                          = NULL("")  /* VARCHAR(12)         */;
  decimal("\\x01".8, maximum_length=26, sign_reserved)           awp_unit_cost                   = NULL("")  /* DECIMAL(24,8)       */;
  decimal("\\x01".5, maximum_length=15, sign_reserved)           extd_awp_cost                   = NULL("")  /* DECIMAL(13,5)       */;
  decimal("\\x01".5, maximum_length=15, sign_reserved)           wac_unit_cost                   = NULL("")  /* DECIMAL(13,5)       */;
  decimal("\\x01".5, maximum_length=15, sign_reserved)           cost_type_unit_cost             = NULL("")  /* DECIMAL(13,5)       */;
  decimal("\\x01".5, maximum_length=15, sign_reserved)           clt_cost_type_unit_cost         = NULL("")  /* DECIMAL(13,5)       */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       clt_cost_type_code              = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       grp_pln_cd                      = NULL("")  /* VARCHAR(10)         */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_copay_amt                   = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_attrib_prod_sel_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_other_payer_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_incentive_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_attrib_to_ded_amt           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_exe_per_bft_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_copay_amt                   = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_attrib_prod_sel_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_other_payer_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_incentive_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_attrib_to_ded_amt           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_exe_per_bft_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_usual_customary_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_attrib_prod_sel_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_copay_amt                   = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_attrib_prod_sel_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_other_payer_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_incentive_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_attrib_to_ded_amt           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_ingred_cost_paid            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_dispensing_fee              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_sales_tax_paid              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_patient_pay_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_due_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_copay_amt                   = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_attrib_prod_sel_amt         = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_other_payer_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_incentive_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_attrib_to_ded_amt           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_exe_per_bft_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01",0)                                             refill_max                      = NULL("")  /* SMALLINT            */;
  string("\\x01",charset="iso-8859-15", maximum_length=6)        bin_nbr                         = NULL("")  /* VARCHAR(6)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        brnd_trade_nm_flag              = NULL("")  /* CHAR(1)             */;
  decimal("\\x01".3, maximum_length=15, sign_reserved)           prc_qty                         = NULL("")  /* DECIMAL(13,3)       */;
  string("\\x01", maximum_length=2)                              cust_loc                        = NULL("")  /* INTEGER             */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       pbr_id                          = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        pbr_id_qlfr                     = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=3)        pbr_id_st_cd                    = NULL("")  /* VARCHAR(3)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       pbr_dea_id                      = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       pbr_npi                         = NULL("")  /* VARCHAR(10)         */;  
  decimal("\\x01".2, maximum_length=11, sign_reserved)           sbm_prof_svc_fee                = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_prof_svc_fee                = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           app_prof_svc_fee                = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           pst_prof_svc_fee                = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_prof_svc_fee                = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       dx_cd                           = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        dx_cd_qlfr                      = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=3)        cms_pbp_id                      = NULL("")  /* VARCHAR(3)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=5)        cms_contract_id                 = NULL("")  /* VARCHAR(5)          */;
  decimal("\\x01",0)                                             rej_cnt                         = NULL("")  /* SMALLINT            */;
  string("\\x01",charset="iso-8859-15", maximum_length=50)       rsp_msg_1                       = NULL("")  /* VARCHAR(50)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=50)       rsp_msg_2                       = NULL("")  /* VARCHAR(50)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=50)       rsp_msg_3                       = NULL("")  /* VARCHAR(50)         */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_acct_ded_amt                = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        nda_flg                         = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        anda_flg                        = NULL("")  /* CHAR(1)             */;
  datetime("HH24:MI:SS.NNNNNN")("\\x01")                         sbm_tm                          = NULL("")  /* TIME(6)             */;
  string("\\x01", maximum_length=12)                             payee_id                        = NULL("")  /* BIGINT              */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        drug_category_code              = NULL("")  /* CHAR(1)             */;
  decimal("\\x01",0)                                             generic_mnftr_cnt               = NULL("")  /* SMALLINT            */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        ncpdp_reject_version_code       = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=4)        subm_clfctn_cd                  = NULL("")  /* VARCHAR(4)          */;
  decimal("\\x01",0)                                             mbr_carrier_uid                 = NULL("")  /* BIGINT              */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        residence_cd                    = NULL("")  /* VARCHAR(2)          */;
  decimal("\\x01".4, maximum_length=17, sign_reserved)           clt_awp_discount_rate           = NULL("")  /* DECIMAL(15,4)       */;
  decimal("\\x01".4, maximum_length=17, sign_reserved)           app_awp_discount_rate           = NULL("")  /* DECIMAL(15,4)       */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        injectable_ind                  = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        clt_formulary_flg               = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        formulary_flg                   = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        reversal_ind                    = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        origin_cd                       = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        ln_of_buss                      = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        elig_clfctn_cd                  = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        maint_gpi_list                  = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        anda_ovrd_flg                   = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        bla_flg                         = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        bla_ovrd_flg                    = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        cmpd_typ_submd                  = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        fda_flg                         = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        nda_ovrd_flg                    = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        adjtd_claim_stat                = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        claim_resp_stat_cd              = NULL("")  /* CHAR(1)             */;
  datetime("YYYYMMDD HH24:MI:SS")("\\x01")                       submd_claim_dttm                = NULL("")  /* TIMESTAMP(6)        */;
  date("YYYYMMDD")("\\x01")                                      orig_pmt_dt                     = NULL("")  /* DATE                */;
  date("YYYYMMDD")("\\x01")                                      sub_reversal_dt                 = NULL("")  /* DATE                */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        dispng_stat                     = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       agcy_nbr                        = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=20)       medcd_id                        = NULL("")  /* VARCHAR(20)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        medcd_ind                       = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=20)       sbrogtn_tcn                     = NULL("")  /* VARCHAR(20)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        pl_of_svc_submd                 = NULL("")  /* VARCHAR(2)          */;
  decimal("\\x01".3, maximum_length=13, sign_reserved)           pror_qty                        = NULL("")  /* DECIMAL(11,3)       */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        rx_nbr_qlfr                     = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        srvc_lvl_of_effrt               = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        srvc_lvl_typ                    = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        subm_clfctn_cd2                 = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        subm_clfctn_cd3                 = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        txn_cd_submd                    = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        u_c_flag                        = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        vers_nbr                        = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       clt_defd_fld1                   = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       clt_defd_fld2                   = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       clt_defd_fld3                   = NULL("")  /* VARCHAR(10)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       sxc_defd_fld1                   = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       sxc_defd_fld2                   = NULL("")  /* VARCHAR(15)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=15)       sxc_defd_fld3                   = NULL("")  /* VARCHAR(15)         */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           estd_gen_sav                    = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        basis_of_cost_cd                = NULL("")  /* VARCHAR(2)          */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        basis_of_reim_cd                = NULL("")  /* VARCHAR(2)          */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_atr_ded_amt                 = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_incentive_fee_amt           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_other_pmt_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_withhold_amt                = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_cob_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        client_pricing_flg              = NULL("")  /* CHAR(1)             */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_pct_copay_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_amt_covrg_gap               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_attrd_sls_tax               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_flat_copay_amt              = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_oth_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_tot_cob_amt                 = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        spclty_phr_rptg_ind             = NULL("")  /* CHAR(1)             */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_wthd_amt                    = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           clt_ppay_amt_psc_brnd_npf       = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           post_adjud_pat_sls_tax_amt      = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           post_adjud_pln_sls_tax_amt      = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_amt_covrg_gap               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_attrd_sls_tax               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_oth_amt                     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_pat_sls_tax_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_pln_sls_tax_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_remn_ben                    = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_remn_ded                    = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_ingrd_cost_cntrctd_remb     = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_ppay_amt_psc_brnd           = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_ppay_amt_psc_brnd_npf       = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           subm_incent_amt                 = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           subm_mcd_pd_amt                 = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           subm_oth_amt                    = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=2)        subm_oth_covrg_cd               = NULL("")  /* VARCHAR(2)          */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           subm_oth_payr_amt               = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=9)        rptg_chnl_type_nm               = NULL("")  /* VARCHAR(9)          */;
  date("YYYYMMDD")("\\x01")                                      birth_dt                        = NULL("")  /* DATE                */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        cal_cost_src_cd                 = NULL("")  /* CHAR(1)             */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_ingred_cost_con_reimb_amt   = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_plan_sls_tax_amt            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           cal_tot_other_amt               = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           client_proc_fee_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           client_prv_ntw_sel_amt          = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           client_psc_brnd_amt             = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           client_psc_np_amt               = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=25)       ptnt_first_nm                   = NULL("")  /* VARCHAR(25)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=25)       ptnt_last_nm                    = NULL("")  /* VARCHAR(25)         */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        pln_formulary                   = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=10)       prior_auth_used_id              = NULL("")  /* VARCHAR(10)         */;
  date("YYYYMMDD")("\\x01")                                      prior_auth_from_dt              = NULL("")  /* DATE                */;
  date("YYYYMMDD")("\\x01")                                      prior_auth_thru_dt              = NULL("")  /* DATE                */;
  decimal("\\x01".3, maximum_length=13, sign_reserved)           prev_fill_1_qty                 = NULL("")  /* DECIMAL(11,3)       */;
  decimal("\\x01".3, maximum_length=13, sign_reserved)           prev_fill_2_qty                 = NULL("")  /* DECIMAL(11,3)       */;
  decimal("\\x01".3, maximum_length=13, sign_reserved)           prev_fill_3_qty                 = NULL("")  /* DECIMAL(11,3)       */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_atr_proc_fee_amt            = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_atr_priv_ntw_sel_amt        = NULL("")  /* DECIMAL(9,2)        */;
  decimal("\\x01".2, maximum_length=11, sign_reserved)           rsp_atr_ppay_psc_np_amt         = NULL("")  /* DECIMAL(9,2)        */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        sbm_unit_dose_ind               = NULL("")  /* CHAR(1)             */;
  string("\\x01",charset="iso-8859-15", maximum_length=1)        drg_coverage_stat_cd            = NULL("")  /* CHAR(1)             */;
  datetime("YYYYMMDDHH24MISS")("\\x01")                          ids_create_dttm                 = NULL("");
  datetime("YYYYMMDDHH24MISS")("\\x01")                          ids_updt_dttm                   = NULL("");
  string("\\x01",maximum_length=2)                               ids_rec_stat_cd                 = NULL("");
end;
type f_claim_transaction_cli_in_vec_t = f_claim_transaction_cli_in_t[int];

metadata type = f_claim_transaction_cli_in_t;|3|1|l|@{0|}}
}}@0|@864162|248000|825000|185000|56000|50000|6366|Split File||@1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|20|0|44|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|21|0|47|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|22|0|49|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|23|0|52|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|mfile:$SOURCE_CTRX_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SOURCE_CTRX_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@374231|250368|51000|185000|56000|50000|6362|Source-CTRX||@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|24|0|54|0|{@{}@106000|204000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|25|0|57|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|26|0|59|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|27|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|limit|$MAP_REJECT_LIMIT|3|2|$|@{0|}}
{30001002|XXparameter|ramp|$MAP_REJECT_RAMP|3|2|$|@{0|}}
{30001002|XXparameter|logging|True|3|1|l|@{0|}}
{30001002|XXparameter|log_reject|1000|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|doc_transform||3|2|$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin

  out.* :: in.f_c_tx_cdr.*;
  out.clt_awp_discount_rate :1: in.f_c_tx_cdr.clt_awp_discount_rate;
  out.app_awp_discount_rate  :2: 0;
  out.app_awp_discount_rate  :1: in.f_c_tx_cdr.app_awp_discount_rate ;
  out.clt_awp_discount_rate :2: 0;
  
 
  out.pbr_id :: in.d_pres_adjud.pbr_id; //Mapped on 12/14
  out.compound_cd :: in.compound.compound_cd;
  out.dea_cd :: in.dea.dea_cd;
  out.gpi_id :: in.gpi.gpi_id;
  out.gpi_list_qlfr_nm :: in.d_prod_adj.gpi_list_qlfr_nm;
  out.drg_admin_rte_hitsb_desc :: in.d_prod_adj.drg_admin_rte_hitsb_desc;
  out.ahfs_cd :: in.ahfs_cd.ahfs_cd;
  out.pbr_ntwrk_id :: in.d_pres_adjud.pbr_ntwrk_id;
  out.prod_id_qlfr_cd :: in.prod.prod_id_qlfr_cd;
  out.prod_id :: in.prod.prod_id;
  out.relationship_cd :: in.l_relnshp.relationship_cd;
  out.drg_maint_src :: in.d_prod_adj.drg_maint_src;
  out.drg_maint_cd :: in.d_prod_adj.drg_maint_cd;
  out.drg_nm_extn_id :: in.drug.drg_nm_extn_id;
  out.gender_cd :: in.gender.gender_cd;
  out.phr_ntwrk_carr_nm :: in.d_phrm_adj.phr_ntwrk_carr_nm;
  out.phr_ntwrk_typ_cd :: in.d_phrm_adj.phr_ntwrk_typ_cd;
  out.phr_ntwrk_qlfr_ind :: in.d_phrm_adj.phr_ntwrk_qlfr_ind;
  out.phr_ntwrk_prity_cd :: in.d_phrm_adj.phr_ntwrk_prity_cd;
  out.phr_ntwrk_nm :: in.d_phrm_adj.phr_ntwrk_nm;
  out.phr_ntwrk_id :: in.d_phrm_adj.phr_ntwrk_id;
  out.submd_phr_id_qlfr_cd :: in.d_phrm_adj.submd_phr_id_qlfr_cd;
  out.submd_phr_id :: in.d_phrm_adj.submd_phr_id;
  out.phr_id :: in.pharmacy.phr_id;
  out.pbr_spclty_cd :: in.pbr_spclty.pbr_spclty_cd;
  out.mbr_mcre_covrg_from_dt :: in.d_mem_adj.mbr_mcre_covrg_from_dt;
  out.mbr_id :: in.d_mbr.mbr_id;
  out.employer_group_id :: in.d_cag.employer_group_id;
  out.account_id :: in.d_cag.account_id;
  out.carrier_id :: in.d_cag.carrier_id;
  out.legacy_src_env_id :: in.f_c_tx_cdr.src_env_sk;
  out.pbr_id_st_cd::in.d_pres_adjud.pbr_id_st_cd;
  out.drg_ndc_id :: in.d_prod_adj.drg_ndc_id;
  out.residence_cd :: in.res_cd.residence_cd;
  out.pbr_dea_id :: in.d_pres_adjud.pbr_dea_id;
  out.pbr_npi    :: in.d_pres_adjud.pbr_npi;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@642681|231431|536000|156000|134000|107000|6348|Map to Split|Ab Initio Software|Built-in|1|100|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|65|0|{@{}@669000|204000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|29|0|68|0|{@{}@559000|262000|11000|11000|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|30|0|70|0|{@{}@599000|262000|11000|11000|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|31|0|72|0|{@{}@639000|262000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|32|0|74|0|{@{}@526000|204000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|33|0|77|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$||{0|}}
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
{30001002|XXparameter|output_index_signature|int out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record utf8 string(big endian integer(4)) component; big endian integer(4) port_index; utf8 string(big endian integer(4)) parameter; utf8 string(big endian integer(4)) message; record utf8 string(big endian integer(4)) code; big endian integer(4) parent_index; record utf8 string(big endian integer(4)) name; utf8 string(big endian integer(4)) value; end [big endian integer(4)] attributes; end [big endian integer(4)] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('') event_type; string('') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1311717854|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|34|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|35|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|36|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|37|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|39|0|100|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|mfile:$SOURCE_ORX_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SOURCE_ORX_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@374231|385368|51000|185000|56000|50000|6364|Source-ORX||@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|40|0|102|0|{@{}@106000|204000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|41|0|105|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|42|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010110002|XXGconstant|43|0|111|0|{@{}@{1|4423931|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_2|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_3|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_4|}1|12|}
{2010601001|XXGgraph_vertex_vertex|12|0|24|0|{Gather|}1|13|}
{2010212001|XXGvertex_oport_oport|13|0|26|0|{0|out|}13|14|}
{2010213001|XXGoport_dst_flow|14|0|28|0|{0|}14|12|}
{2010211001|XXGvertex_iport_iport|15|0|29|0|{0|in|}13|15|}
{2010214001|XXGiport_src_flow|16|0|31|0|{0|}15|9|}
{2010214001|XXGiport_src_flow|17|0|32|0|{1|}15|11|}
{2010007001|XXGobject_proto_object|18|0|33|0|{}13|16|}
{2010212001|XXGvertex_oport_oport|19|0|35|0|{0|out|}16|17|}
{2010006001|XXGobject_psameas_object|20|0|37|0|{metadata|out_metadata|1|0|}17|16|}
{2010211001|XXGvertex_iport_iport|21|0|38|0|{0|in|}16|18|}
{2010006001|XXGobject_psameas_object|22|0|40|0|{metadata|in_metadata|1|0|}18|16|}
{2010006001|XXGobject_psameas_object|23|0|41|0|{Layout|Layout|0|0|}13|19|}
{2010211001|XXGvertex_iport_iport|24|0|43|0|{0|write|}19|20|}
{2010214001|XXGiport_src_flow|25|0|45|0|{0|}20|10|}
{2010007001|XXGobject_proto_object|26|0|46|0|{}19|21|}
{2010211001|XXGvertex_iport_iport|27|0|48|0|{0|write|}21|22|}
{2010006001|XXGobject_psameas_object|28|0|50|0|{metadata|write_metadata|1|0|}22|21|}
{2010006001|XXGobject_psameas_object|29|0|51|0|{in_metadata|read_metadata|0|0|}13|23|}
{2010212001|XXGvertex_oport_oport|30|0|53|0|{0|read|}23|24|}
{2010213001|XXGoport_dst_flow|31|0|55|0|{0|}24|9|}
{2010007001|XXGobject_proto_object|32|0|56|0|{}23|25|}
{2010212001|XXGvertex_oport_oport|33|0|58|0|{0|read|}25|26|}
{2010006001|XXGobject_psameas_object|34|0|60|0|{metadata|read_metadata|1|0|}26|25|}
{2010006001|XXGobject_psameas_object|35|0|61|0|{out_metadata|read_metadata|0|0|}13|23|}
{2010601001|XXGgraph_vertex_vertex|36|0|62|0|{Map_to_Split|}1|27|}
{2010212001|XXGvertex_oport_oport|37|0|64|0|{0|out0|}27|28|}
{2010213001|XXGoport_dst_flow|38|0|66|0|{0|}28|10|}
{2010212001|XXGvertex_oport_oport|39|0|67|0|{1|reject0|}27|29|}
{2010212001|XXGvertex_oport_oport|40|0|69|0|{2|error0|}27|30|}
{2010212001|XXGvertex_oport_oport|41|0|71|0|{3|log|}27|31|}
{2010211001|XXGvertex_iport_iport|42|0|73|0|{0|in|}27|32|}
{2010214001|XXGiport_src_flow|43|0|75|0|{0|}32|12|}
{2010007001|XXGobject_proto_object|44|0|76|0|{}27|33|}
{2010212001|XXGvertex_oport_oport|45|0|78|0|{0|out0|}33|34|}
{2010006001|XXGobject_psameas_object|46|0|80|0|{metadata|out0_metadata|1|0|}34|33|}
{2010006001|XXGobject_psameas_object|47|0|81|0|{transform0|transform0|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|48|0|82|0|{1|reject0|}33|35|}
{2010006001|XXGobject_psameas_object|49|0|84|0|{metadata|reject0_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|50|0|85|0|{2|error0|}33|36|}
{2010006001|XXGobject_psameas_object|51|0|87|0|{metadata|error0_metadata|1|0|}36|33|}
{2010212001|XXGvertex_oport_oport|52|0|88|0|{3|log|}33|37|}
{2010006001|XXGobject_psameas_object|53|0|90|0|{metadata|log_metadata|1|0|}37|33|}
{2010211001|XXGvertex_iport_iport|54|0|91|0|{0|in|}33|38|}
{2010006001|XXGobject_psameas_object|55|0|93|0|{metadata|in_metadata|1|0|}38|33|}
{2010006001|XXGobject_psameas_object|56|0|94|0|{Layout|Layout|0|0|}27|19|}
{2010006001|XXGobject_psameas_object|57|0|95|0|{in_metadata|read_metadata|0|0|}27|23|}
{2010006001|XXGobject_psameas_object|58|0|96|0|{out0_metadata|write_metadata|0|0|}27|19|}
{2010006001|XXGobject_psameas_object|59|0|97|0|{reject0_metadata|read_metadata|0|0|}27|23|}
{2010601001|XXGgraph_vertex_vertex|60|0|98|0|{Source_CTRX|}1|23|}
{2010601001|XXGgraph_vertex_vertex|61|0|99|0|{Source_ORX|}1|39|}
{2010212001|XXGvertex_oport_oport|62|0|101|0|{0|read|}39|40|}
{2010213001|XXGoport_dst_flow|63|0|103|0|{0|}40|11|}
{2010007001|XXGobject_proto_object|64|0|104|0|{}39|41|}
{2010212001|XXGvertex_oport_oport|65|0|106|0|{0|read|}41|42|}
{2010006001|XXGobject_psameas_object|66|0|108|0|{metadata|read_metadata|1|0|}42|41|}
{2010601001|XXGgraph_vertex_vertex|67|0|109|0|{Split_File|}1|19|}
{2010109001|XXGobject_property_value|68|0|110|0|{0|TrackingThumbprint|72|}1|43|}
