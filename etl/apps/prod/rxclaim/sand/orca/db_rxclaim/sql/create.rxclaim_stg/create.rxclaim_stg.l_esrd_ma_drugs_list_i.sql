DROP TABLE ${STAGING_SCHEMA}.l_esrd_ma_drugs_list_i;

CREATE TABLE ${STAGING_SCHEMA}.l_esrd_ma_drugs_list_i
( esrd_ma_gpi_id                   VARCHAR(14)
, esrd_ma_flag                     CHAR(1)
, esrd_ma_gpi_name                 VARCHAR(100)
, esrd_ma_thrpc_class_nm           VARCHAR(80)
, esrd_ma_add_dt                   DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

