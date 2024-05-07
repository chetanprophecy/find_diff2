DROP TABLE ${STAGING_SCHEMA}.l_claim_origin_code_i;

CREATE TABLE ${STAGING_SCHEMA}.l_claim_origin_code_i
( clam_origin_cd_sk                BIGINT
, clam_origin_cd                   CHAR(1)
, clam_origin_desc                 VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

