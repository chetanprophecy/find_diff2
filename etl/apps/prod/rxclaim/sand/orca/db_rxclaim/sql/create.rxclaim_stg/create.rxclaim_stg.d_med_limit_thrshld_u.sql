DROP TABLE ${STAGING_SCHEMA}.d_med_limit_thrshld_u;

CREATE TABLE ${STAGING_SCHEMA}.d_med_limit_thrshld_u
( med_limit_thrshld_sk             BIGINT
, dur_tbl_nm                       CHAR(8)
, dur_srvc_nm                      CHAR(8)
, med_limit                        DECIMAL(7,2)
, med_limit_resp                   CHAR(1)
, med_limit_msg_cd                 CHAR(10)
, med_limit_pbr_thrshld            SMALLINT
, med_limit_phr_thrshld            SMALLINT
, med_limit_thrshld_qual           CHAR(1)
, med_limit_new_mbr                CHAR(1)
, med_limit_ir_flg                 CHAR(1)
, med_limit_from_dt                TIMESTAMP
, med_limit_thru_dt                TIMESTAMP
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

