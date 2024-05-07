DROP TABLE ${STAGING_SCHEMA}.l_client_business_seg_i;

CREATE TABLE ${STAGING_SCHEMA}.l_client_business_seg_i
( client_bus_seg_sk                BIGINT NOT NULL
, carrier_id                       CHAR(9)
, account_id                       CHAR(15)
, acct_lvl_ind                     CHAR(1)
, carrier_nm                       CHAR(50)
, co_buss_seg_nm                   CHAR(50)
, vrtl_buss_seg_nm                 CHAR(50)
, lob_buss_seg_nm                  CHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       CHAR(20) NOT NULL
, update_uid                       CHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

