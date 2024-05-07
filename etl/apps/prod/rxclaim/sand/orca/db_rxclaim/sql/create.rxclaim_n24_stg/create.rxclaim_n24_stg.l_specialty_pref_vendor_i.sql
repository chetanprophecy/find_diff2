DROP TABLE ${STAGING_SCHEMA}.l_specialty_pref_vendor_i;

CREATE TABLE ${STAGING_SCHEMA}.l_specialty_pref_vendor_i
( splty_phr_sk                     BIGINT
, phr_nabp                         VARCHAR(14)
, pref_start_dt                    DATE
, pref_end_dt                      DATE
, phr_nm                           VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

