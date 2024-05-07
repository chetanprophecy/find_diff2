DROP TABLE ${STAGING_SCHEMA}.l_gps_plan_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_gps_plan_code_i
( gps_plan_cd_sk                   BIGINT NOT NULL
, gps_plan_cd                      VARCHAR(3)
, gps_plan_cd_desc                 VARCHAR(100)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, gps_brand_desc                   VARCHAR(100)
);

