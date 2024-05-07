DROP TABLE ${STAGING_SCHEMA}.l_consent_type_i;

CREATE TABLE ${STAGING_SCHEMA}.l_consent_type_i
( consent_type_sk                  BIGINT
, consent_type_cd                  VARCHAR(10)
, consent_type_desc                VARCHAR(100)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

