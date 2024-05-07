DROP TABLE ${STAGING_SCHEMA}.l_care_facility_u;

CREATE TABLE ${STAGING_SCHEMA}.l_care_facility_u
( care_facility_sk                 BIGINT NOT NULL
, care_facility_id                 VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

