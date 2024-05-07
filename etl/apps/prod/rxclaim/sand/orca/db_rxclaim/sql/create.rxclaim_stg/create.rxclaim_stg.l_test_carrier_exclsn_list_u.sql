DROP TABLE ${STAGING_SCHEMA}.l_test_carrier_exclsn_list_u;

CREATE TABLE ${STAGING_SCHEMA}.l_test_carrier_exclsn_list_u
( carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CARRIER_SK);

