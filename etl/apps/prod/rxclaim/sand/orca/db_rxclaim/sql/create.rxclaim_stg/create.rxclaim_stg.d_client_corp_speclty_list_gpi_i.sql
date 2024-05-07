DROP TABLE ${STAGING_SCHEMA}.d_client_corp_speclty_list_gpi_i;

CREATE TABLE ${STAGING_SCHEMA}.d_client_corp_speclty_list_gpi_i
( client_corp_speclty_list_gpi_sk  BIGINT
, speclty_list_type_id             VARCHAR(30)
, speclty_list_nm                  VARCHAR(50)
, rxc_gpi_list_nm                  VARCHAR(30)
, gpi_id                           VARCHAR(14)
, gpi_nm                           VARCHAR(100)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

