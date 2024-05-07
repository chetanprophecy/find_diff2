DROP TABLE ${STAGING_SCHEMA}.l_prod_modifier_u;

CREATE TABLE ${STAGING_SCHEMA}.l_prod_modifier_u
( mod_sk                           BIGINT
, mod_cd                           VARCHAR(6)
, mod_nm                           VARCHAR(25)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

