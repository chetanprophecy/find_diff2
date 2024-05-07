DROP TABLE ${STAGING_SCHEMA}.l_period_type_u;

CREATE TABLE ${STAGING_SCHEMA}.l_period_type_u
( perd_type_sk                     BIGINT NOT NULL
, perd_type_nbr                    INTEGER
, perd_type_nm                     VARCHAR(35)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

