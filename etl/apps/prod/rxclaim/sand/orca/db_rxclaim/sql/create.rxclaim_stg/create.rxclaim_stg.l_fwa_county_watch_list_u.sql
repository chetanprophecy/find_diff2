DROP TABLE ${STAGING_SCHEMA}.l_fwa_county_watch_list_u;

CREATE TABLE ${STAGING_SCHEMA}.l_fwa_county_watch_list_u
( fwa_county_list_sk               BIGINT NOT NULL
, zip_cd                           VARCHAR(5)
, city_nm                          VARCHAR(35)
, county_nm                        VARCHAR(35)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

