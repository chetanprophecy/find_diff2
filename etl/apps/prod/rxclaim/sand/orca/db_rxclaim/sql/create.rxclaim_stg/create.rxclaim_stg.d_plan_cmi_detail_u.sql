DROP TABLE ${STAGING_SCHEMA}.d_plan_cmi_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_cmi_detail_u
( pln_sk                           BIGINT NOT NULL
, min_ingredients_no               INTEGER
, max_ingredients_no               INTEGER
, legend_ingrd_req_ind             VARCHAR(1)
, clm_prod_stat_ind                VARCHAR(1)
, clm_prod_stat_option_ind         VARCHAR(1)
, clm_multi_src_cd_ind             VARCHAR(1)
, clm_multi_src_cd_option_ind      VARCHAR(1)
, max_days_of_supply_ind           VARCHAR(1)
, clm_refill_limits_ind            VARCHAR(1)
, drg_restriction_ind              VARCHAR(1)
, max_amt                          DECIMAL(10,2)
, apply_to_ind                     VARCHAR(1)
, msg_cd                           VARCHAR(10)
, msg_type_cd                      VARCHAR(1)
, gpi_list_nm                      VARCHAR(10)
, ndc_list_nm                      VARCHAR(10)
, clrfcn_cd_recog_ind              VARCHAR(1)
, cmi_eff_dt                       DATE
, cmi_thru_dt                      DATE
, pref_ndc_price_ind               VARCHAR(1)
, pref_gpi_price_ind               VARCHAR(1)
, ingrd_refill_lmt_ind             VARCHAR(1)
, admin_rte_ind                    VARCHAR(1)
, dosag_frm_ind                    VARCHAR(1)
, pkg_excp_ind                     VARCHAR(1)
, ingrd_dur_ind                    VARCHAR(1)
, dur_table_nm                     VARCHAR(8)
, max_day_ovrd_pln_sk              BIGINT
, refill_lmt_pln_sk                BIGINT
, admin_rte_pln_sk                 BIGINT
, dosag_frm_pln_sk                 BIGINT
, pkg_excp_pln_sk                  BIGINT
, ingrd_otc_ind                    VARCHAR(1)
, ingrd_3rd_party_ind              VARCHAR(1)
, ingrd_medicaid_ind               VARCHAR(1)
, partb_gpi_list_nm                VARCHAR(10)
, partb_ndc_list_nm                VARCHAR(10)
, drg_stat_not_used_ind            VARCHAR(1)
, plan_ndc_ind                     VARCHAR(1)
, plan_gpi_ind                     VARCHAR(1)
, fms_sched_use_ind                VARCHAR(1)
, clm_tier_ind                     VARCHAR(1)
, formulary_tier_list_nm           VARCHAR(10)
, drg_history_days_no              INTEGER
, phr_list_id                      VARCHAR(10)
, phr_list_qlfr_cd                 VARCHAR(1)
, phr_list_msg_cd                  VARCHAR(10)
, phr_list_msg_type_cd             VARCHAR(1)
, ndc_ignore_clrfcn_cd             VARCHAR(10)
, gpi_ignore_clrfcn_cd             VARCHAR(10)
, partc_drg_stat_ind               VARCHAR(1)
, partb_drg_stat_ind               VARCHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

