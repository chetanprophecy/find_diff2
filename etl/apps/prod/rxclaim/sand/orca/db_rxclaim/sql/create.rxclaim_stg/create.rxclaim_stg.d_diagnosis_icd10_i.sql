DROP TABLE ${STAGING_SCHEMA}.d_diagnosis_icd10_i;

CREATE TABLE ${STAGING_SCHEMA}.d_diagnosis_icd10_i
( icd10_cd_type                    CHAR(1)
, icd10_frmt_cd                    VARCHAR(20)
, icd10_unfrmt_cd                  VARCHAR(20)
, icd10_cd_nm                      VARCHAR(100)
, icd10_stat_cd                    CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

