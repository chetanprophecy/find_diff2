DROP TABLE ${STAGING_SCHEMA}.l_formulary_client_xrfe_i;

CREATE TABLE ${STAGING_SCHEMA}.l_formulary_client_xrfe_i
( client_xrfe_sk                   BIGINT NOT NULL
, client_id                        VARCHAR(7)
, client_desc                      VARCHAR(100)
, client_acss_cd                   BYTEINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CLIENT_XRFE_SK);

