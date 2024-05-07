DROP TABLE ${STAGING_SCHEMA}.l_cms_reason_code_u;

CREATE TABLE ${STAGING_SCHEMA}.l_cms_reason_code_u
( cms_reason_cd_sk                 BIGINT
, cms_reason_cd                    VARCHAR(5)
, cms_reason_desc                  VARCHAR(100)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

