DROP TABLE ${STAGING_SCHEMA}.d_gpi_carrier_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_gpi_carrier_xref_i
( gpi_carrier_sk                   BIGINT
, carrier_id                       VARCHAR(30)
, gpi_id                           VARCHAR(14)
, speclty_ind                      CHAR(1)
, speclty_ind_nm                   VARCHAR(50)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

