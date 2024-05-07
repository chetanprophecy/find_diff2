DROP TABLE ${STAGING_SCHEMA}.d_conv_care_cpt_diag_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.d_conv_care_cpt_diag_dtl_i
( cpt_diag_sk                      BIGINT
, cpt_cd                           VARCHAR(20)
, diag_cd                          VARCHAR(20)
, schedule_type                    VARCHAR(50)
, srv_nm                           VARCHAR(100)
, prev_list_flg                    CHAR(1)
, prev_setup_flg                   CHAR(1)
, diag_dep_flg                     VARCHAR(2)
, diag_dx_type                     VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

