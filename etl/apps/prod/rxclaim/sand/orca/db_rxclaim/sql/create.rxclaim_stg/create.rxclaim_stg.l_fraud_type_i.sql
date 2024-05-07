DROP TABLE ${STAGING_SCHEMA}.l_fraud_type_i;

CREATE TABLE ${STAGING_SCHEMA}.l_fraud_type_i
( audit_fraud_type_sk              BIGINT
, audit_fraud_type_id              INTEGER
, audit_fraud_type_desc            VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

