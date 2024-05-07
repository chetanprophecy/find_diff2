DROP TABLE ${STAGING_SCHEMA}.d_care_facility_adjud_u;

CREATE TABLE ${STAGING_SCHEMA}.d_care_facility_adjud_u
( care_fac_adjud_sk                BIGINT NOT NULL
, care_fac_id                      VARCHAR(10)
, care_fac_nm                      VARCHAR(25)
, clt_id                           VARCHAR(50)
, carrier_id                       VARCHAR(30) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, update_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
);

