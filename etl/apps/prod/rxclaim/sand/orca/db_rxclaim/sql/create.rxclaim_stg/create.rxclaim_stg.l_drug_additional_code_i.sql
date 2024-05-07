DROP TABLE ${STAGING_SCHEMA}.l_drug_additional_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_drug_additional_code_i
( drg_add_cd_sk                    BIGINT NOT NULL
, drg_cd_type                      VARCHAR(20)
, drg_add_cd                       VARCHAR(2)
, drg_add_desc                     VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

