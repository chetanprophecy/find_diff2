DROP TABLE ${STAGING_SCHEMA}.d_plan_gpi_prod_status_rule_xref_u;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_gpi_prod_status_rule_xref_u
( plan_gpi_prod_stat_rule_sk       BIGINT NOT NULL
, gpi_list_nm                      VARCHAR(10)
, gpi_no                           VARCHAR(14)
, gpi_multi_source_cd              CHAR(1)
, drug_rx_otc_ind                  CHAR(1)
, gpi_seq_num                      INTEGER
, pref_frmlry_gpi_dtl_sk           BIGINT NOT NULL
, gpi_sk                           BIGINT NOT NULL
, gnrc_mdspn_ind_sk                BIGINT NOT NULL
, drug_rx_otc_ind_sk               BIGINT NOT NULL
, gpi_drg_start_dt_sk              BIGINT NOT NULL
, gpi_drg_start_dt                 DATE
, gpi_drg_end_dt_sk                BIGINT NOT NULL
, gpi_drg_end_dt                   DATE
, prod_status_rule_tbl_id_sk       BIGINT NOT NULL
, prod_status_rule_tbl_id          VARCHAR(13)
, drg_stat_ind                     CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PLAN_GPI_PROD_STAT_RULE_SK);

