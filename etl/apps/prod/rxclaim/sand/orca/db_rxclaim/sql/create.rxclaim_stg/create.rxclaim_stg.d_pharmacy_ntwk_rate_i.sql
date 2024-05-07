DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_ntwk_rate_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_ntwk_rate_i
( phrm_ntwk_rate_sk                BIGINT NOT NULL
, pln_phr_ntwk_sk                  BIGINT NOT NULL
, pln_sk                           BIGINT NOT NULL
, ntwk_sk                          BIGINT
, phr_ntwk_ndc_list_nm_sk          BIGINT NOT NULL
, phr_ntwk_gpi_list_nm_sk          BIGINT NOT NULL
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, phr_ntwk_prty                    CHAR(1)
, pln_ntwk_type                    VARCHAR(2)
, phn_phr_ntwk_id                  VARCHAR(6)
, phn_seq_nbr                      INTEGER
, pln_phr_ntwk_list_cd             VARCHAR(10)
, pln_phr_ntwk_list_type           VARCHAR(2)
, phr_or_client_rate_cd            CHAR(1)
, nra_seq_nbr                      INTEGER
, nra_start_dt                     DATE
, nra_start_dt_sk                  BIGINT
, nra_end_dt                       DATE
, nra_end_dt_sk                    BIGINT
, rate_perct_factor                DECIMAL(7,2)
, nra_status_ind                   CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PHRM_NTWK_RATE_SK);

