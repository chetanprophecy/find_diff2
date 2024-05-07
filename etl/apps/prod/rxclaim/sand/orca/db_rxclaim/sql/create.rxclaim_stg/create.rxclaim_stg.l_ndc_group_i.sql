DROP TABLE ${STAGING_SCHEMA}.l_ndc_group_i;

CREATE TABLE ${STAGING_SCHEMA}.l_ndc_group_i
( ndc_group_sk                     BIGINT NOT NULL
, ndc_short_desc                   VARCHAR(25)
, ndc_group_name                   VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

