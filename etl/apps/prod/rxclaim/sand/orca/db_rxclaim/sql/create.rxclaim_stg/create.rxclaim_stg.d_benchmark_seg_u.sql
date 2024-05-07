DROP TABLE ${STAGING_SCHEMA}.d_benchmark_seg_u;

CREATE TABLE ${STAGING_SCHEMA}.d_benchmark_seg_u
( perd_type_sk                     BIGINT NOT NULL
, perd_start_dt_sk                 BIGINT
, buss_seg_sk                      BIGINT
, cag_sk                           BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       CHAR(20)
, update_uid                       CHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

