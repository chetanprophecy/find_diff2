DROP TABLE ${STAGING_SCHEMA}.a_t25_mbr_summary_i;

CREATE TABLE ${STAGING_SCHEMA}.a_t25_mbr_summary_i
( rptg_clt_id                      VARCHAR(25)
, rptg_clt_nm                      VARCHAR(100)
, rptg_perd_type                   VARCHAR(50)
, rptg_perd_start_dt               DATE
, rptg_perd_end_dt                 DATE
, mbr_sk                           BIGINT
, mbr_id                           VARCHAR(20)
, drug_cost_rank                   INTEGER
, drug_cost_amt_mbr                DECIMAL(15,2)
, drug_cost_amt_rptg_clt           DECIMAL(15,2)
, rx_cnt_mbr                       INTEGER
, rx_cnt_rptg_clt                  INTEGER
, phr_cnt_mbr                      INTEGER
, pbr_cnt_mbr                      INTEGER
, rx_cnt_spe_mbr                   INTEGER
, rx_cnt_cntrl_drug                INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

