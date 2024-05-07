DROP TABLE ${STAGING_SCHEMA}.l_audit_type_u;

CREATE TABLE ${STAGING_SCHEMA}.l_audit_type_u
( audit_type_sk                    BIGINT NOT NULL
, audit_type_id                    INTEGER
, audit_type_sort_order            INTEGER
, audit_type_desc                  VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

