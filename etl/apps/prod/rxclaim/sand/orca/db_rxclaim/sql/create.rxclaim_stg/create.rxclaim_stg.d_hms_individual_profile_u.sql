DROP TABLE ${STAGING_SCHEMA}.d_hms_individual_profile_u;

CREATE TABLE ${STAGING_SCHEMA}.d_hms_individual_profile_u
( hms_vendor_sk                    BIGINT
, pbr_vendor_id                    VARCHAR(10)
, first_nm                         VARCHAR(25)
, middle_nm                        VARCHAR(25)
, last_nm                          VARCHAR(50)
, suffix                           VARCHAR(10)
, cred_cd                          VARCHAR(10)
, practitioner_type_cd             VARCHAR(10)
, hms_specialty1_cd                VARCHAR(10)
, hms_specialty2_cd                VARCHAR(10)
, upin                             VARCHAR(6)
, medicare_participation           CHAR(1)
, gender                           CHAR(1)
, born_dt                          DATE
, died_dt                          DATE
, active_flg                       CHAR(1)
, hms_scid_cd                      VARCHAR(10)
, grad_yr                          INTEGER
, chng_flg                         CHAR(1)
, src_last_update_dt               DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BIGINT
);

