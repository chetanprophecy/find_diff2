DROP TABLE ${STAGING_SCHEMA}.r_hmd_ind_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.r_hmd_ind_xref_i
( hmd_ind_xref_sk                  BIGINT NOT NULL
, hmd_ncpdp                        VARCHAR(12)
, hmd_hdi_ind                      VARCHAR(1)
, hmd_mr_ind                       VARCHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

