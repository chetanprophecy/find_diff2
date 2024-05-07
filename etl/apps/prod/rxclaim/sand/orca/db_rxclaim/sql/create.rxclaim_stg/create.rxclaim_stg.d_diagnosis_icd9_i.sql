DROP TABLE ${STAGING_SCHEMA}.d_diagnosis_icd9_i;

CREATE TABLE ${STAGING_SCHEMA}.d_diagnosis_icd9_i
( icd9_cd_int                      VARCHAR(20)
, icd9_cd_ext                      VARCHAR(20)
, icd9_cd_prefix                   CHAR(1)
, icd9_cd_core                     VARCHAR(4)
, icd9_cd_suffix                   VARCHAR(3)
, icd9_cd_nm                       VARCHAR(50)
, icd9_stat_cd                     CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

