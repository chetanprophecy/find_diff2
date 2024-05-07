DROP TABLE ${STAGING_SCHEMA}.d_response_eliza_i;

CREATE TABLE ${STAGING_SCHEMA}.d_response_eliza_i
( response_sk                      BIGINT NOT NULL
, eliza_mbr_sk                     BIGINT NOT NULL
, question_sk                      BIGINT NOT NULL
, response                         VARCHAR(10) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (ELIZA_MBR_SK);

