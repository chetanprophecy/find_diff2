DROP TABLE ${STAGING_SCHEMA}.d_pgt_plan_gpi_list_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pgt_plan_gpi_list_u
( pgt_plan_gpi_sk                  BIGINT
, pln_sk                           BIGINT
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, pgt_list_type                    VARCHAR(2)
, pgl_gpi_list_nm                  VARCHAR(10)
, pgt_seq_nbr                      INTEGER
, pgt_from_dt                      DATE
, pgt_thru_dt                      DATE
, pgt_status                       CHAR(1)
, pgt_prcssng_qlfr                 CHAR(1)
, pgt_seq_search                   INTEGER
, pgt_pln_default_list             VARCHAR(10)
, pgt_non_prf_brnd_ind             CHAR(1)
, pgt_cntngnt_thrpy_ind            CHAR(1)
, pgt_daily_dose_ind               CHAR(1)
, pgt_grace_period_ind             CHAR(1)
, pgt_grace_period_days            INTEGER
, pgt_grace_period_eff_dt          DATE
, pgt_grp_schedule_id              VARCHAR(10)
, pgt_first_fill_drug_sts          CHAR(1)
, pgt_suppl_rej_cde_tbl            VARCHAR(10)
, pgt_non_prf_brand_lvl            CHAR(1)
, pgt_non_prf_brand_wc             VARCHAR(2)
, pgt_cntngnt_thrpy_lvl            CHAR(1)
, pgt_cntngnt_thrpy_wc             VARCHAR(2)
, pgt_daily_dose_lvl               CHAR(1)
, pgt_daily_dose_wc                VARCHAR(2)
, pgt_prior_stthrpy_exempt         CHAR(1)
, pgt_prior_stthrpy_drg_sts        CHAR(1)
, pgt_period_qty_max_mult          INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

