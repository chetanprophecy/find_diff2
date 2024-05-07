DROP TABLE ${STAGING_SCHEMA}.d_hms_specialty_code_i;

CREATE TABLE ${STAGING_SCHEMA}.d_hms_specialty_code_i
( hms_specialty_cd                 VARCHAR(10)
, hms_specialty_desc               CHAR(100)
, chng_flg                         VARCHAR(1)
, src_last_update_dt               DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BIGINT
);

