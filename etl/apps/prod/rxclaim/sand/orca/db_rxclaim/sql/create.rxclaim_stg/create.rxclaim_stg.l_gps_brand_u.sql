DROP TABLE ${STAGING_SCHEMA}.l_gps_brand_u;

CREATE TABLE ${STAGING_SCHEMA}.l_gps_brand_u
( gps_brand_sk                     BIGINT NOT NULL
, gps_brand_id                     VARCHAR(3)
, gps_brand_nm                     VARCHAR(100)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

