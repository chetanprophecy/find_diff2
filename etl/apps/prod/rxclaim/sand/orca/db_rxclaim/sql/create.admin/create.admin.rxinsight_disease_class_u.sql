DROP TABLE ${STAGING_SCHEMA}.rxinsight_disease_class_u;

CREATE TABLE ${STAGING_SCHEMA}.rxinsight_disease_class_u
( id                               BIGINT
, gpi_4                            VARCHAR(4) NOT NULL
, disease_state_desc               VARCHAR(100)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

