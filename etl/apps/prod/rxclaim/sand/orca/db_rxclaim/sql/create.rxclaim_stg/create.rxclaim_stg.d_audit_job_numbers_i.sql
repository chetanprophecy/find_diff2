DROP TABLE ${STAGING_SCHEMA}.d_audit_job_numbers_i;

CREATE TABLE ${STAGING_SCHEMA}.d_audit_job_numbers_i
( audit_job_sk                     BIGINT NOT NULL
, audit_job_number                 INTEGER
, audit_claim_number               VARCHAR(20)
, audit_add_dt                     VARCHAR(8)
, audit_add_tm                     VARCHAR(6)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

