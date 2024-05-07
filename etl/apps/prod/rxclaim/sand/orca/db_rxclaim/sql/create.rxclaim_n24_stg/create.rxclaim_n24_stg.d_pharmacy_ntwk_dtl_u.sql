DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_ntwk_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_ntwk_dtl_u
( ntwk_dtl_sk                      BIGINT NOT NULL
, ntwk_sk                          BIGINT
, phr_sk                           BIGINT
, seq_nbr                          INTEGER
, rgn_cd                           VARCHAR(10)
, carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, phr_id                           VARCHAR(12)
, phd_stat                         CHAR(1)
, phr_ntwrk_id                     VARCHAR(6)
, phd_frm_dt                       DATE
, phd_thru_dt                      DATE
, phr_prc_sched                    VARCHAR(10)
, phr_pat_pay                      VARCHAR(10)
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, clt_price_sched                  VARCHAR(10)
, clt_patient_pay                  VARCHAR(10)
, pln_override_sched               VARCHAR(10)
, discount_table_id                VARCHAR(10)
, clt_2_price_sched                VARCHAR(10)
, clt_3_price_sched                VARCHAR(10)
, clt_patpay_grpschid              VARCHAR(10)
, clt1_prce_grpschid               VARCHAR(10)
, clt2_prce_grpschid               VARCHAR(10)
, clt3_prce_grpschid               VARCHAR(10)
, phr_patpay_grpschid              VARCHAR(10)
, phr_price_grpschid               VARCHAR(10)
, add_dt                           DATE
, chg_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, price_sched_sk                   BIGINT
)
DISTRIBUTE ON (PHR_SK);

