DROP TABLE ${STAGING_SCHEMA}.l_audit_fraud_perpetrator_u;

CREATE TABLE ${STAGING_SCHEMA}.l_audit_fraud_perpetrator_u
( audit_fraud_perpetrator_sk       BIGINT NOT NULL
, audit_fraud_perpetrator_id       INTEGER
, audit_fraud_perpetrator_sort_order INTEGER
, audit_fraud_perpetrator_desc     VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

