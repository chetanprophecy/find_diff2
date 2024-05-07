DROP TABLE ${STAGING_SCHEMA}.l_payment_type_i;

CREATE TABLE ${STAGING_SCHEMA}.l_payment_type_i
( audit_payment_type_sk            BIGINT NOT NULL
, audit_payment_id                 INTEGER
, audit_payment_desc               VARCHAR(20)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

