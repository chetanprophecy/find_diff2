DROP TABLE ${STAGING_SCHEMA}.rxinsight_medispan_data_u;

CREATE TABLE ${STAGING_SCHEMA}.rxinsight_medispan_data_u
( id                               BIGINT
, ndc                              VARCHAR(20)
, gpi                              VARCHAR(14)
, gpi_12                           VARCHAR(12)
, gpi_10                           VARCHAR(10)
, gpi_4                            VARCHAR(4)
, gpi_4_desc                       VARCHAR(50)
, generic_ind                      VARCHAR(1)
, drug_name                        VARCHAR(100)
, label_name                       VARCHAR(50)
, generic_name                     VARCHAR(50)
, effective_date                   DATE
, inactive_date                    DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

