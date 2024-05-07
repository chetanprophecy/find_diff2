DROP TABLE ${STAGING_SCHEMA}.d_speclty_list_gpi_u;

CREATE TABLE ${STAGING_SCHEMA}.d_speclty_list_gpi_u
( speclty_list_gpi_sk              BIGINT
, speclty_list_nm                  VARCHAR(50)
, gpi_id                           VARCHAR(14)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

