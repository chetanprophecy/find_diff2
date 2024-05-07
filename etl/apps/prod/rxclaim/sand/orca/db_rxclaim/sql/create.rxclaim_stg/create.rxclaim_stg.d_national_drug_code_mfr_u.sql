DROP TABLE ${STAGING_SCHEMA}.d_national_drug_code_mfr_u;

CREATE TABLE ${STAGING_SCHEMA}.d_national_drug_code_mfr_u
( nat_drg_cd_mfr_sk                BIGINT NOT NULL
, prod_sk                          BIGINT
, drug_rx_otc_ind_sk               BIGINT
, gpi_sk                           BIGINT
, prod_id                          VARCHAR(20)
, ndc_begin_dt                     DATE
, gpi_id                           VARCHAR(14)
, manufacturer_cnt                 INTEGER
, limited_mkt_available_flg        CHAR(1)
, src_ndc_desc                     VARCHAR(50)
, src_ndc_long_desc                VARCHAR(100)
, src_drug_rx_otc_ind_cd           CHAR(1)
, src_drug_status_cd               CHAR(1)
, src_drug_repackage_flg           CHAR(1)
, fda_mkt_category_cd              VARCHAR(2)
, manufacturer_app_cd              CHAR(1)
, drug_sum_mkt_category_cd         VARCHAR(2)
, manufacturer_app_no              VARCHAR(12)
, multi_source_cd                  CHAR(1)
, manufacturer_cd                  VARCHAR(5)
, src_drug_manufacturer_nm         VARCHAR(10)
, src_ndc_effective_dt             DATE
, ndc_excl_termination_dt          DATE
, ndc_end_dt                       DATE
, count_change_dt                  DATE
, limited_mkt_available_cnt        INTEGER
, limited_mkt_available_note       VARCHAR(255)
, limited_mkt_activation_dt        DATE
, limited_mkt_inactivation_dt      DATE
, count_status_ind                 CHAR(1)
, exclude_mfg_flg                  CHAR(1)
, current_flg                      CHAR(1)
, src_add_by                       VARCHAR(10)
, src_add_dt                       DATE
, src_add_time                     INTEGER
, src_change_by                    VARCHAR(10)
, src_change_dt                    DATE
, src_change_time                  INTEGER
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

