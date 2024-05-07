DROP TABLE ${STAGING_SCHEMA}.f_payment_check_recon_u;

CREATE TABLE ${STAGING_SCHEMA}.f_payment_check_recon_u
( fin_acct_sk                      BIGINT NOT NULL
, chk_nbr                          BIGINT NOT NULL
, chk_dt_sk                        BIGINT NOT NULL
, pmt_batch_nbr                    INTEGER
, form_typ                         VARCHAR(10)
, payee_nm                         VARCHAR(60)
, check_recon_amt                  DECIMAL(11,3)
, recon_stat                       CHAR(1)
, payee_sk                         BIGINT NOT NULL
, pmt_nbr                          BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PMT_NBR);

