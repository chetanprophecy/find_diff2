DROP TABLE ${STAGING_SCHEMA}.f_payment_fee_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.f_payment_fee_dtl_u
( pmt_nbr                          BIGINT NOT NULL
, py2_seq_nbr                      INTEGER NOT NULL
, pmt_fee_typ                      CHAR(1) NOT NULL
, pmt_fee_seq_nbr                  INTEGER
, sbm_fee_sched                    VARCHAR(10)
, rule_seq_nbr                     INTEGER
, sbm_fee_amt                      DECIMAL(15,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PMT_NBR);

