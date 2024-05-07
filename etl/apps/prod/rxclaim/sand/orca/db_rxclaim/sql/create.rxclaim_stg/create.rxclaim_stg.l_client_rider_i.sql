DROP TABLE ${STAGING_SCHEMA}.l_client_rider_i;

CREATE TABLE ${STAGING_SCHEMA}.l_client_rider_i
( client_rdr_sk                    BIGINT NOT NULL
, client_rdr_cd                    VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

