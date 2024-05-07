DROP TABLE ${STAGING_SCHEMA}.l_norm_u;

CREATE TABLE ${STAGING_SCHEMA}.l_norm_u
( norm_sk                          BIGINT NOT NULL
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, group_id                         VARCHAR(30)
, norm_typ                         VARCHAR(100)
, service_typ                      VARCHAR(100)
, business_typ                     VARCHAR(50)
, client_typ                       VARCHAR(50)
, version                          VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

