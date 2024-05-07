DROP TABLE ${STAGING_SCHEMA}.l_call_result_eliza_u;

CREATE TABLE ${STAGING_SCHEMA}.l_call_result_eliza_u
( call_result_cd_sk                BIGINT NOT NULL
, call_result_cd                   VARCHAR(20) NOT NULL
, call_result_desc                 VARCHAR(100) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CALL_RESULT_CD_SK);

