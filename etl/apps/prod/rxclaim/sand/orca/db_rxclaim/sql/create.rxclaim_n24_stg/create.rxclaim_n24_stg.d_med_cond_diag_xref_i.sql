DROP TABLE ${STAGING_SCHEMA}.d_med_cond_diag_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_med_cond_diag_xref_i
( med_cond_diag_xref_sk            BIGINT NOT NULL
, med_cond_cd                      VARCHAR(7)
, icd9_cd_int                      VARCHAR(20)
, icd9_cd_ext                      VARCHAR(20)
, med_cond_to_icd9_flg             CHAR(1)
, icd9_to_med_cond_flg             CHAR(1)
, icm_stat_cd                      CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

