DROP TABLE ${STAGING_SCHEMA}.l_conv_care_schedule_u;

CREATE TABLE ${STAGING_SCHEMA}.l_conv_care_schedule_u
( cca_sk                           BIGINT
, cpt_cd                           VARCHAR(20)
, schedule_type                    VARCHAR(50)
, ntwk_prov                        VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

