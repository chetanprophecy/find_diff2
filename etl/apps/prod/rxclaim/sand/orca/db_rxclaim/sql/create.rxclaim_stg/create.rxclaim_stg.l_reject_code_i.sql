DROP TABLE ${STAGING_SCHEMA}.l_reject_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_reject_code_i
( rej_cd_sk                        BIGINT NOT NULL
, rej_cd                           VARCHAR(3) NOT NULL
, rej_cd_desc                      VARCHAR(25) NOT NULL
, update_uid                       VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
, rec_stat_cd                      BYTEINT
, insert_ts                        TIMESTAMP NOT NULL
);

