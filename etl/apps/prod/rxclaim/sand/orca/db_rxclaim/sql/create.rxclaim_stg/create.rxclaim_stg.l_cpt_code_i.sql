DROP TABLE ${STAGING_SCHEMA}.l_cpt_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_cpt_code_i
( proc_cd_sk                       BIGINT NOT NULL
, cpt_cd                           VARCHAR(5)
, cpt_cd_desc                      VARCHAR(60)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

