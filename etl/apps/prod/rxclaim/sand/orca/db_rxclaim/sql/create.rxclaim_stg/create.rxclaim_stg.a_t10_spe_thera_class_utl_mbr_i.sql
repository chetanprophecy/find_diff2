DROP TABLE ${STAGING_SCHEMA}.a_t10_spe_thera_class_utl_mbr_i;

CREATE TABLE ${STAGING_SCHEMA}.a_t10_spe_thera_class_utl_mbr_i
( rptg_clt_id                      VARCHAR(25)
, rptg_clt_nm                      VARCHAR(100)
, rptg_perd_type                   VARCHAR(50)
, rptg_perd_start_dt               DATE
, rptg_perd_end_dt                 DATE
, summary_lvl_type                 VARCHAR(25)
, thrpc_class_nm                   VARCHAR(80)
, plan_paid_amt                    DECIMAL(15,2)
, plan_paid_rank                   INTEGER
, utilizing_mbr_cnt                INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

