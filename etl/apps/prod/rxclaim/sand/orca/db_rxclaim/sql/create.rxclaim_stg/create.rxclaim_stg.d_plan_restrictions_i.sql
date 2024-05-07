DROP TABLE ${STAGING_SCHEMA}.d_plan_restrictions_i;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_restrictions_i
( prr_sk                           BIGINT NOT NULL
, pln_sk                           BIGINT
, prr_qlfr_cd                      VARCHAR(1)
, prr_seq_nbr                      INTEGER
, prr_stat_cd                      CHAR(1)
, prr_eff_dt                       DATE
, prr_thru_dt                      DATE
, max_due_amt                      DECIMAL(10,2)
, due_amt_basis_cd                 VARCHAR(1)
, msg_cd                           VARCHAR(10)
, msg_type_cd                      VARCHAR(1)
, schedule_id                      VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

