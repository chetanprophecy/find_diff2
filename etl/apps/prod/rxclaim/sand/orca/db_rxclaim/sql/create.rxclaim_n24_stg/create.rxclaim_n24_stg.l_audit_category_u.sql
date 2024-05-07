DROP TABLE ${STAGING_SCHEMA}.l_audit_category_u;

CREATE TABLE ${STAGING_SCHEMA}.l_audit_category_u
( audit_category_sk                BIGINT NOT NULL
, audit_category_id                INTEGER
, audit_category_sort_order        INTEGER
, audit_category_desc              VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

