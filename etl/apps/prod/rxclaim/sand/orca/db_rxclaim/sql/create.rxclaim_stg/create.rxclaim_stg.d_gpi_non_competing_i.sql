DROP TABLE ${STAGING_SCHEMA}.d_gpi_non_competing_i;

CREATE TABLE ${STAGING_SCHEMA}.d_gpi_non_competing_i
( non_competing_gpi_sk             BIGINT NOT NULL
, gpi_sk                           BIGINT NOT NULL
, gpi_id                           VARCHAR(14) NOT NULL
, gpi_nm                           VARCHAR(100) NOT NULL
, non_competing_start_dt_sk        BIGINT NOT NULL
, non_competing_end_dt_sk          BIGINT NOT NULL
, non_competing_catgy              VARCHAR(30) NOT NULL
, nbr_of_mfg_lbl                   INTEGER
, up_to_dt_sk                      BIGINT NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (NON_COMPETING_GPI_SK);

