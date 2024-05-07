DROP TABLE ${STAGING_SCHEMA}.d_med_limit_parm_i;

CREATE TABLE ${STAGING_SCHEMA}.d_med_limit_parm_i
( med_limit_parm_sk                BIGINT
, dur_tbl_nm                       CHAR(8)
, dur_srvc_nm                      CHAR(8)
, dur_prity                        SMALLINT
, dur_pharm_resp_stat              CHAR(1)
, dur_othr_pharm_resp_stat         CHAR(1)
, dur_stat                         CHAR(1)
, med_limit_gpi_lst_id             CHAR(10)
, med_limit_lkbk_days              SMALLINT
, thrpy_ovrlap_xcld_pct            SMALLINT
, xcld_pat_res_cd_lst              CHAR(10)
, xcld_diag_cd_lst                 CHAR(6)
, xcld_gpi_lst                     CHAR(10)
, xcld_gpi_lkbk_days               SMALLINT
, xcld_taxonomy_list               CHAR(6)
, xcld_diag_cd_qual                CHAR(1)
, med_limit3                       DECIMAL(7,2)
, med_limit_resp_stat3             CHAR(1)
, taxonomy_list                    CHAR(6)
, med_limit_ds_days                SMALLINT
, med_limit_msg_cd                 CHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

