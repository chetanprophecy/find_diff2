DROP TABLE ${STAGING_SCHEMA}.d_client_speclty_list_carrier_i;

CREATE TABLE ${STAGING_SCHEMA}.d_client_speclty_list_carrier_i
( client_speclty_list_carrier_sk   BIGINT
, speclty_list_nm                  VARCHAR(50)
, carrier_id                       VARCHAR(30)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

