DROP TABLE ${STAGING_SCHEMA}.l_formulary_client_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.l_formulary_client_xref_i
( client_xref_sk                   BIGINT
, client_id                        VARCHAR(7)
, client_desc                      VARCHAR(100)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

