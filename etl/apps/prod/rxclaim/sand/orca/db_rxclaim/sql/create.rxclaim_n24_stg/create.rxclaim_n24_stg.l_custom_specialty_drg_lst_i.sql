DROP TABLE ${STAGING_SCHEMA}.l_custom_specialty_drg_lst_i;

CREATE TABLE ${STAGING_SCHEMA}.l_custom_specialty_drg_lst_i
( gpi_sk                           BIGINT
, gpi_id                           VARCHAR(14)
, ascend                           VARCHAR(14)
, restrctd                         VARCHAR(14)
, therapeutic_area                 VARCHAR(100)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

