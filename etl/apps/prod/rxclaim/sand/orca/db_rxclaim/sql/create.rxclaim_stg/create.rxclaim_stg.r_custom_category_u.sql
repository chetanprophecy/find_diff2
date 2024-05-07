DROP TABLE ${STAGING_SCHEMA}.r_custom_category_u;

CREATE TABLE ${STAGING_SCHEMA}.r_custom_category_u
( cat_drg_subclass_sk              BIGINT NOT NULL
, category_id                      INTEGER
, drg_subclass_id                  VARCHAR(6)
, user_id                          VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

