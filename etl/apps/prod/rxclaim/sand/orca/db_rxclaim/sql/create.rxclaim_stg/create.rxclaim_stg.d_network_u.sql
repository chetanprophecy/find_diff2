DROP TABLE ${STAGING_SCHEMA}.d_network_u;

CREATE TABLE ${STAGING_SCHEMA}.d_network_u
( ntwk_sk                          BIGINT NOT NULL
, ntwk_id                          VARCHAR(6) NOT NULL
, ntwk_desc                        VARCHAR(50) NOT NULL
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

