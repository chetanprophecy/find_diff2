DROP TABLE ${STAGING_SCHEMA}.l_question_eliza_u;

CREATE TABLE ${STAGING_SCHEMA}.l_question_eliza_u
( question_sk                      BIGINT NOT NULL
, question_cd                      VARCHAR(10) NOT NULL
, question_desc                    VARCHAR(200) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (QUESTION_SK);

