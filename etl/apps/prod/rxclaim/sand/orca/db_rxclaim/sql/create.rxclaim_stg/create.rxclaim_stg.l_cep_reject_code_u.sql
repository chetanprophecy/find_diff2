DROP TABLE ${STAGING_SCHEMA}.l_cep_reject_code_u;

CREATE TABLE ${STAGING_SCHEMA}.l_cep_reject_code_u
( cep_rej_cd_sk                    BIGINT NOT NULL
, cep_rej_cd                       VARCHAR(3) NOT NULL
, cep_rej_cd_desc                  VARCHAR(25) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

