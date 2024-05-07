DROP TABLE ${STAGING_SCHEMA}.d_care_facility_i;

CREATE TABLE ${STAGING_SCHEMA}.d_care_facility_i
( care_fac_sk                      BIGINT NOT NULL
, carrier_id                       VARCHAR(30)
, care_fac_id                      VARCHAR(10) NOT NULL
, care_fac_nm                      VARCHAR(25)
, cfa_addr                         VARCHAR(60)
, cfa_city                         VARCHAR(30)
, cfa_state                        VARCHAR(2)
, cfa_zip                          VARCHAR(5)
, cfa_zip2                         VARCHAR(5)
, cfa_zip3                         VARCHAR(5)
, cfa_cntry                        VARCHAR(4)
, cfa_phone                        BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

