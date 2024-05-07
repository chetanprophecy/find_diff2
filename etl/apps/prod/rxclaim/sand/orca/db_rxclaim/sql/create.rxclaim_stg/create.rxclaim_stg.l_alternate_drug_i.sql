DROP TABLE ${STAGING_SCHEMA}.l_alternate_drug_i;

CREATE TABLE ${STAGING_SCHEMA}.l_alternate_drug_i
( alt_drg_sk                       BIGINT NOT NULL
, ndc_short                        VARCHAR(12)
, carrier_type                     VARCHAR(3)
, alt_drg                          VARCHAR(70)
, alt_drg_cost                     VARCHAR(10)
, alt_drg_comments                 VARCHAR(150)
, user_id                          VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

