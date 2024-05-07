DROP TABLE ${STAGING_SCHEMA}.l_client_product_u;

CREATE TABLE ${STAGING_SCHEMA}.l_client_product_u
( client_prod_sk                   BIGINT NOT NULL
, client_prod_cd                   VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

