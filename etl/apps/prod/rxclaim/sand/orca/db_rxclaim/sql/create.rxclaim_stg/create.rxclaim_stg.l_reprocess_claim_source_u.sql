DROP TABLE ${STAGING_SCHEMA}.l_reprocess_claim_source_u;

CREATE TABLE ${STAGING_SCHEMA}.l_reprocess_claim_source_u
( rpc_claim_src_sk                 BIGINT NOT NULL
, rpc_claim_src_cd                 VARCHAR(1)
, rpc_claim_src_desc               VARCHAR(45)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

