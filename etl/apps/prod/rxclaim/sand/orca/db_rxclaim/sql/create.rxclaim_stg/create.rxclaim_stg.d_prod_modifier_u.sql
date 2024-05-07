DROP TABLE ${STAGING_SCHEMA}.d_prod_modifier_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_modifier_u
( prod_mod_sk                      BIGINT
, prod_sk                          BIGINT
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, prod_key                         BIGINT
, mod_cd                           VARCHAR(6)
, pmd_stat_cd                      CHAR(1)
, pmd_orig_cd                      CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

