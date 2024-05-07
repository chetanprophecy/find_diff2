DROP TABLE ${STAGING_SCHEMA}.d_cms_stars_calendar_submission_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_stars_calendar_submission_i
( cms_stars_calendar_submission_sk BIGINT NOT NULL
, prod_directory_dt_sk             BIGINT
, cal_start_dt_sk                  BIGINT
, cal_end_dt_sk                    BIGINT
, cal_start_dt                     DATE
, cal_end_dt                       DATE
, prod_directory_dt                DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

