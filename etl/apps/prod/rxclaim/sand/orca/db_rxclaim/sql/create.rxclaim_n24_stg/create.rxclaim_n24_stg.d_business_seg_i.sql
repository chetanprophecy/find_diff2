DROP TABLE ${STAGING_SCHEMA}.d_business_seg_i;

CREATE TABLE ${STAGING_SCHEMA}.d_business_seg_i
( buss_seg_sk                      BIGINT NOT NULL
, buss_seg_typ_cd                  VARCHAR(10)
, buss_seg_nm                      VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       CHAR(20)
, update_uid                       CHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

