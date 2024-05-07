DROP TABLE ${STAGING_SCHEMA}.d_gpi_indicators_u;

CREATE TABLE ${STAGING_SCHEMA}.d_gpi_indicators_u
( gpi_sk                           BIGINT
, gpi_id                           VARCHAR(14)
, igp_med_cond_rstrctn             VARCHAR(7)
, igp_indctd_med_cond_cd           VARCHAR(7)
, igp_micro_orgnsm_cd              VARCHAR(7)
, igp_thrpy_role_cd                VARCHAR(2)
, igp_outcome_cd                   VARCHAR(2)
, igp_trtmnt_rank_cd               VARCHAR(2)
, igp_accptnce_lvl_cd              VARCHAR(2)
, igp_proxy_cd                     VARCHAR(1)
, igp_proxy_only_flg               VARCHAR(1)
, igp_stat_cd                      VARCHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

