DROP TABLE ${STAGING_SCHEMA}.l_report_prompt_i;

CREATE TABLE ${STAGING_SCHEMA}.l_report_prompt_i
( rpt_promt_sk                     BIGINT
, prompt_nm                        VARCHAR(50)
, prompt_val_id                    INTEGER
, prompt_val_desc                  VARCHAR(50)
, rpt_typ_nm                       VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

