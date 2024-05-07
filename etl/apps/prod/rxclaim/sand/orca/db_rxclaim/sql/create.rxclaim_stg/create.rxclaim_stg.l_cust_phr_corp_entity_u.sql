DROP TABLE ${STAGING_SCHEMA}.l_cust_phr_corp_entity_u;

CREATE TABLE ${STAGING_SCHEMA}.l_cust_phr_corp_entity_u
( cust_phr_corp_sk                 BIGINT
, phr_afflt_cd                     VARCHAR(6)
, phr_rel_typ                      VARCHAR(2)
, phr_corp_entity                  VARCHAR(300)
, phr_afflt_nm                     VARCHAR(300)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

