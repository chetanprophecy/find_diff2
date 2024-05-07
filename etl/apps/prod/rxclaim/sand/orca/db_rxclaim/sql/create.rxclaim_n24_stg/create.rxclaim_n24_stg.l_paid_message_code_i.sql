DROP TABLE ${STAGING_SCHEMA}.l_paid_message_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_paid_message_code_i
( paid_msg_cd_sk                   BIGINT
, paid_msg_cd                      VARCHAR(3)
, paid_msg_cd_desc                 VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

