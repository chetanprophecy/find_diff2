DROP TABLE ${STAGING_SCHEMA}.l_therapeutic_group_u;

CREATE TABLE ${STAGING_SCHEMA}.l_therapeutic_group_u
( therapeutic_group_sk             BIGINT NOT NULL
, drug_class_desc                  VARCHAR(50)
, therapeutic_group_name           VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

