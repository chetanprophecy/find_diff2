DROP TABLE ${STAGING_SCHEMA}.f_payment_u;

CREATE TABLE ${STAGING_SCHEMA}.f_payment_u
( pmt_nbr                          DECIMAL(9) NOT NULL
, pmt_batch_nbr                    DECIMAL(7)
, payee_sk                         BIGINT NOT NULL
, fulflmt_dt_sk                    BIGINT NOT NULL
, payr_fin_acct_sk                 BIGINT NOT NULL
, chk_dt_sk                        BIGINT
, trc_nbr                          INTEGER
, payee_fin_acct_sk                BIGINT
, eft_txn_cd_sk                    BIGINT
, eft_txn_cd                       VARCHAR(2)
, eft_amt                          DECIMAL(11,2)
, eft_pmt_dt_sk                    BIGINT
, payr_id                          VARCHAR(12)
, chk_nbr                          DECIMAL(9)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

