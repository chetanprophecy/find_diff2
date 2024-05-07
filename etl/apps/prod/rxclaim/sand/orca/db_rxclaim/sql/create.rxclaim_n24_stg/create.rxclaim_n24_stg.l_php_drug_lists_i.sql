DROP TABLE ${STAGING_SCHEMA}.l_php_drug_lists_i;

CREATE TABLE ${STAGING_SCHEMA}.l_php_drug_lists_i
( php_drg_lst_sk                   BIGINT
, app_pid                          VARCHAR(3)
, list_id                          VARCHAR(3)
, gpi_id                           VARCHAR(14)
, gpi_sk                           BIGINT
, generic_name                     VARCHAR(70)
, ndc_id                           VARCHAR(11)
, label_nm                         VARCHAR(30)
, custom1_val                      VARCHAR(20)
, custom2_val                      VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

