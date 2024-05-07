DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_affiliation_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_affiliation_u
( phr_afflt_sk                     BIGINT NOT NULL
, phr_afflt_cd                     VARCHAR(6) NOT NULL
, phr_afflt_nm                     VARCHAR(50) NOT NULL
, phr_afflt_grp_id                 INTEGER NOT NULL
, phr_afflt_grp_desc               VARCHAR(100) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

