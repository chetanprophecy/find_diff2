DROP TABLE ${STAGING_SCHEMA}.l_subsidy_level_u;

CREATE TABLE ${STAGING_SCHEMA}.l_subsidy_level_u
( subsidy_lvl_sk                   BYTEINT
, subsidy_lvl_cd                   VARCHAR(3)
, subsidy_lvl_desc                 VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

