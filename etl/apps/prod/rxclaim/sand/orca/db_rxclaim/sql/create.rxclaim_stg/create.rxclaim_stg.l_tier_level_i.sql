DROP TABLE ${STAGING_SCHEMA}.l_tier_level_i;

CREATE TABLE ${STAGING_SCHEMA}.l_tier_level_i
( tier_level_sk                    BIGINT NOT NULL
, tier_level                       INTEGER NOT NULL
, tier_desc                        VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

