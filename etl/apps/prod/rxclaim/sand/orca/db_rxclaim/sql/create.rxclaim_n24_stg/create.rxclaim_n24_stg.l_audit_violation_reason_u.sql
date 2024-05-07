DROP TABLE ${STAGING_SCHEMA}.l_audit_violation_reason_u;

CREATE TABLE ${STAGING_SCHEMA}.l_audit_violation_reason_u
( audit_violation_reason_sk        BIGINT NOT NULL
, audit_violation_reason_id        INTEGER
, audit_violation_reason_sort_order INTEGER
, audit_violation_reason_desc      VARCHAR(50)
, audit_fraud_nonfraud_ind         VARCHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

