DROP TABLE ${STAGING_SCHEMA}.d_geographic_region_i;

CREATE TABLE ${STAGING_SCHEMA}.d_geographic_region_i
( geog_rgn_sk                      BIGINT NOT NULL
, state_cd                         VARCHAR(3)
, city_nm                          VARCHAR(35)
, region_nm                        VARCHAR(35)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

