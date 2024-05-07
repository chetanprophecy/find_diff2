DROP TABLE ${STAGING_SCHEMA}.l_submarket_id_i;

CREATE TABLE ${STAGING_SCHEMA}.l_submarket_id_i
( submarket_id_sk                  BIGINT NOT NULL
, carrier_id                       VARCHAR(9)
, submarket_id                     INTEGER
, submarket_code                   VARCHAR(2)
, submarket_desc                   VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

