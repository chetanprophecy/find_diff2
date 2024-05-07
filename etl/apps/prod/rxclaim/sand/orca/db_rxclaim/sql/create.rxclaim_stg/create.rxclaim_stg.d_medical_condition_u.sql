DROP TABLE ${STAGING_SCHEMA}.d_medical_condition_u;

CREATE TABLE ${STAGING_SCHEMA}.d_medical_condition_u
( med_cond_sk                      BIGINT NOT NULL
, med_cond_cd                      VARCHAR(7)
, med_cond_typ                     VARCHAR(2)
, mc_class                         CHAR(1)
, mc_gender                        CHAR(1)
, mc_pregnancy_cd                  CHAR(1)
, mc_lactation_cd                  CHAR(1)
, mc_frm_age                       INTEGER
, mc_thru_age                      INTEGER
, mc_age_unit_cd                   CHAR(1)
, mc_duration_cd                   VARCHAR(2)
, mc_stat_cd                       CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

