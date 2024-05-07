DROP TABLE ${STAGING_SCHEMA}.l_state_i;

CREATE TABLE ${STAGING_SCHEMA}.l_state_i
( state_cd_sk                      BIGINT NOT NULL
, state_cd                         VARCHAR(2) NOT NULL
, state_cd_desc                    VARCHAR(50) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, msms_rgn                         VARCHAR(50)
);

