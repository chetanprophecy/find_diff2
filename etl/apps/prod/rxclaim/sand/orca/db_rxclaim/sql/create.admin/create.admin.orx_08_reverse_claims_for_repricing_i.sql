DROP TABLE ${STAGING_SCHEMA}.orx_08_reverse_claims_for_repricing_i;

CREATE TABLE ${STAGING_SCHEMA}.orx_08_reverse_claims_for_repricing_i
( id                               BIGINT
, carrier_account_group_key        BIGINT NOT NULL
, claim_id                         VARCHAR(38) NOT NULL
, claim_seq_number                 BIGINT NOT NULL
, claim_status_id                  VARCHAR(1) NOT NULL
, submitted_date                   DATE NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

