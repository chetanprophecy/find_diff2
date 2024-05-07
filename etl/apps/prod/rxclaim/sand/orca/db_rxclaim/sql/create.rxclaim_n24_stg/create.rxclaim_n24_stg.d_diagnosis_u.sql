DROP TABLE ${STAGING_SCHEMA}.d_diagnosis_u;

CREATE TABLE ${STAGING_SCHEMA}.d_diagnosis_u
( diag_sk                          BIGINT NOT NULL
, diag_qualifier                   VARCHAR(2)
, diag_typ_cd                      CHAR(1)
, diag_cd                          VARCHAR(20)
, diag_desc                        VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

