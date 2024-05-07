DROP TABLE ${STAGING_SCHEMA}.d_cms_yr_rspns_summary_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_yr_rspns_summary_u
( rspns_summary_sk                 BIGINT
, contract_id                      VARCHAR(5)
, matching_claim_ndc_cnt           INTEGER
, matching_claim_pde_cost          DECIMAL(15,2)
, sure_up_ndc_cnt                  INTEGER
, cal_tot_pde_cost                 DECIMAL(15,2)
, cal_tol_mpf_cost                 DECIMAL(15,4)
, pde_mpf_diff_amt                 DECIMAL(15,4)
, price_accuracy_scr               DECIMAL(9,4)
, claim_percentage_scr             DECIMAL(9,4)
, comp_price_accuracy_scr          DECIMAL(9,4)
, accuracy_idx                     DECIMAL(9,4)
, cms_rspns_mn                     INTEGER
, rspns_file_ind                   VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cms_rspns_style_ind              CHAR(1)
);

