DROP TABLE ${STAGING_SCHEMA}.d_call_tracking_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_call_tracking_detail_u
( call_track_dtl_sk                BIGINT NOT NULL
, clh_create_dt_sk                 BIGINT NOT NULL
, clh_create_dt                    DATE NOT NULL
, clh_create_tm                    TIME NOT NULL
, clh_job_nbr                      INTEGER NOT NULL
, cld_type_ind                     CHAR(1) NOT NULL
, cld_seq_nbr                      INTEGER NOT NULL
, cld_txt                          VARCHAR(55)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          SMALLINT
)
DISTRIBUTE ON (CALL_TRACK_DTL_SK);

