DROP TABLE ${STAGING_SCHEMA}.l_audit_nonfraud_violation_reason_i;

CREATE TABLE ${STAGING_SCHEMA}.l_audit_nonfraud_violation_reason_i
( audit_nonfraud_violation_reason_sk BIGINT NOT NULL
, audit_violation_reason_sk        BIGINT
, audit_nonfraud_violation_reason_id INTEGER
, audit_nonfraud_violation_reason_sort_order INTEGER
, audit_nonfraud_violation_reason_desc VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

