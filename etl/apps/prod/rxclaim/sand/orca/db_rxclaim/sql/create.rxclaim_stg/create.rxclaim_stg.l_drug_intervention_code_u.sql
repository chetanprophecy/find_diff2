DROP TABLE ${STAGING_SCHEMA}.l_drug_intervention_code_u;

CREATE TABLE ${STAGING_SCHEMA}.l_drug_intervention_code_u
( drg_interv_cd_sk                 BIGINT NOT NULL
, drg_interv_cd                    VARCHAR(2)
, drg_interv_desc                  VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

