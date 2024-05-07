DROP TABLE ${STAGING_SCHEMA}.a_t25_phr_utl_mbr_i;

CREATE TABLE ${STAGING_SCHEMA}.a_t25_phr_utl_mbr_i
( rptg_clt_id                      VARCHAR(25)
, rptg_clt_nm                      VARCHAR(100)
, rptg_perd_type                   VARCHAR(50)
, rptg_perd_start_dt               DATE
, rptg_perd_end_dt                 DATE
, phr_sk                           BIGINT
, phr_id                           VARCHAR(12)
, phr_nm                           VARCHAR(60)
, phr_addr                         VARCHAR(60)
, drug_cost_amt                    DECIMAL(15,2)
, drug_cost_rank                   INTEGER
, utilizing_mbr_cnt                INTEGER
, dea_cd_sk                        BIGINT
, ctrl_subs_rx_count               INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

