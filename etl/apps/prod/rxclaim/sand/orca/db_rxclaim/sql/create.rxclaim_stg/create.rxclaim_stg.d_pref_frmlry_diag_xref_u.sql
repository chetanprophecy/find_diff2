DROP TABLE ${STAGING_SCHEMA}.d_pref_frmlry_diag_xref_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pref_frmlry_diag_xref_u
( gpi_list_sk                      BIGINT NOT NULL
, gpi_list_nm                      VARCHAR(10)
, gpi_no                           VARCHAR(14)
, gpi_sk                           BIGINT NOT NULL
, frmlry_gpi_dtl_curr_start_dt_sk  BIGINT NOT NULL
, frmlry_gpi_dtl_curr_start_dt     DATE
, frmlry_gpi_dtl_curr_end_dt_sk    BIGINT NOT NULL
, frmlry_gpi_dtl_curr_end_dt       DATE
, dgl_diagnosis_list_cd            VARCHAR(6)
, diagnosys_list_qual              VARCHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (GPI_LIST_SK);

