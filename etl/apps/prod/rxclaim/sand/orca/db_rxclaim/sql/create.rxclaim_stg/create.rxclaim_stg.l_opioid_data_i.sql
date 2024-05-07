DROP TABLE ${STAGING_SCHEMA}.l_opioid_data_i;

CREATE TABLE ${STAGING_SCHEMA}.l_opioid_data_i
( opioid_gpi_sk                    BIGINT
, gpi14                            VARCHAR(14)
, gpi_nm                           VARCHAR(100)
, strength                         DECIMAL(7,3)
, strengthuom                      VARCHAR(9)
, gpi8                             VARCHAR(8)
, med_cnv_ratio                    DECIMAL(6,4)
, conv_strength                    DECIMAL(7,3)
, strength_calc                    DECIMAL(9,5)
, gpi_classification               VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

