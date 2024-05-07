DROP TABLE ${STAGING_SCHEMA}.l_custom_category_i;

CREATE TABLE ${STAGING_SCHEMA}.l_custom_category_i
( custom_category_sk               BIGINT NOT NULL
, category_id                      DECIMAL(10)
, category_name                    VARCHAR(50)
, category_psi_comments            VARCHAR(512)
, category_mpd_comments            VARCHAR(512)
, user_id                          VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

