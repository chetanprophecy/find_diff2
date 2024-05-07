DROP TABLE ${STAGING_SCHEMA}.d_clinical_program_u;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_program_u
( clncl_pgm_sk                     BIGINT NOT NULL
, clncl_pgm_id                     VARCHAR(25) NOT NULL
, clncl_pgm_nm                     NVARCHAR(100)
, eval_job_freq                    VARCHAR(10)
, idntfn_job_freq                  VARCHAR(10)
, clncl_pgm_desc                   NVARCHAR(250)
, pgm_execution_typ                VARCHAR(10)
, idntfn_performed_by              VARCHAR(15)
, case_mngmt_performed_by          VARCHAR(15)
, trgting_sel                      VARCHAR(15)
, eval_sel                         VARCHAR(15)
, idntfn_rules_config_id           VARCHAR(25)
, eval_rules_config_id             VARCHAR(25)
, clncl_pgm_typ_nm                 NVARCHAR(200)
, prov_evidence_data               VARCHAR(25)
, idntfn_hold_flg                  DECIMAL(1)
, pgm_stat                         CHAR(1)
, cpp_creat_ts                     TIMESTAMP NOT NULL
, cpp_creat_by                     VARCHAR(20) NOT NULL
, cpp_update_ts                    TIMESTAMP
, cpp_update_by                    VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
);

