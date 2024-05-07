DROP TABLE ${STAGING_SCHEMA}.d_plan_i;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_i
( pln_sk                           BIGINT NOT NULL
, pln_qlfr_cd_sk                   BIGINT
, pln_cd                           VARCHAR(10)
, pln_type_id                      CHAR(1)
, pln_qlfr_cd                      VARCHAR(10)
, pln_eff_dt                       DATE
, pln_nm                           VARCHAR(25)
, pln_term_dt                      DATE
, pln_verf_mbr_flg                 CHAR(1)
, pln_verf_rx_ntwk_flg             CHAR(1)
, pln_dea_vld_flg                  CHAR(1)
, pln_pref_formulary_flg           CHAR(1)
, pln_dflt_drg_stat                CHAR(1)
, pln_elig_ovrd_flg                CHAR(1)
, pln_desi_ind                     CHAR(1)
, pln_verf_md_ntwk_flg             CHAR(1)
, pln_verf_md_spclty_flg           CHAR(1)
, pln_verf_care_fac_flg            CHAR(1)
, pln_verf_restrct_flg             CHAR(1)
, pln_verf_pricing_flg             CHAR(1)
, pln_verf_therapy_flg             CHAR(1)
, pln_verf_brnd_gen_flg            CHAR(1)
, pln_verf_3pty_excp_flg           CHAR(1)
, pln_verf_lgnd_otc_flg            CHAR(1)
, pln_verf_fda_ther_equi_flg       CHAR(1)
, pln_verf_dea_cd_flg              CHAR(1)
, pln_verf_dosage_form_flg         CHAR(1)
, pln_verf_route_flg               CHAR(1)
, pln_verf_pkgng_flg               CHAR(1)
, pln_verf_maint_flg               CHAR(1)
, pln_verf_compound_flg            CHAR(1)
, pln_verf_lvl_of_srv_flg          CHAR(1)
, pln_verf_submt_qty_days_sup_flg  CHAR(1)
, pln_verf_refill_limit_flg        CHAR(1)
, pln_verf_ded_cap_limit_flg       CHAR(1)
, pln_cust_loc_flg                 CHAR(1)
, pln_patient_pay_qual             CHAR(1)
, pln_verf_ndc_lst_flg             CHAR(1)
, pln_verf_gpi_lst_flg             CHAR(1)
, pln_verf_cob_flg                 CHAR(1)
, drg_table_nm_flg                 VARCHAR(8)
, pln_audit_flg                    CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, pln_verf_spclty_pgm_flg          BYTEINT
, pln_verf_frm_mgmt_srvc_flg       BYTEINT
, pln_discount_benefit_flg         BYTEINT
, pln_real_time_pa_flg             BYTEINT
, pln_pref_prod_sched_id           VARCHAR(10)
, pln_external_pgm_id              VARCHAR(10)
);

