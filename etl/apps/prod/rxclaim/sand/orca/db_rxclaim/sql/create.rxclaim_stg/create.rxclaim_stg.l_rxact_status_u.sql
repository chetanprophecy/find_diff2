DROP TABLE ${STAGING_SCHEMA}.l_rxact_status_u;

CREATE TABLE ${STAGING_SCHEMA}.l_rxact_status_u
( rasts_stat_sk                    BIGINT
, rasts_stat_cd                    VARCHAR(2)
, rasts_desc                       VARCHAR(25)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

