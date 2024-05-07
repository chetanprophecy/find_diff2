DROP TABLE ${STAGING_SCHEMA}.f_cob_claim_transaction_u;

CREATE TABLE ${STAGING_SCHEMA}.f_cob_claim_transaction_u
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, prod_sk                          BIGINT
, cob_seq_nbr                      INTEGER
, cob_oth_pyr_cov_type             VARCHAR(2)
, cob_oth_pyr_id_qlfr              VARCHAR(2)
, cob_oth_pyr_id                   VARCHAR(10)
, cob_oth_pyr_dt                   DATE
, cob_oth_pyr_intnl_cntrl_cd       VARCHAR(30)
, cob_oth_pyr_amt_paid_cnt         INTEGER
, cob_oth_pyr_rej_cnt              INTEGER
, cob_oth_pyr_rspb_amt_cnt         INTEGER
, cob_oth_pyr_bnstg_amt_cnt        INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

