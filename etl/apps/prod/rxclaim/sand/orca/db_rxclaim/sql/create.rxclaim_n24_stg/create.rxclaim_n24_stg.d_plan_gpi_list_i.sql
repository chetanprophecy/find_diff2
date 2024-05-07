DROP TABLE ${STAGING_SCHEMA}.d_plan_gpi_list_i;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_gpi_list_i
( pln_gpi_lst_sk                   BIGINT NOT NULL
, pgo_generic_product_id           VARCHAR(18)
, pgo_generic_name                 VARCHAR(60)
, pno_current_dte_effective        DATE
, pno_current_dte_termed           DATE
, pno_current_drug_status          VARCHAR(18)
, pno_previous_dt_effective        DATE
, pno_previous_dt_termed           DATE
, pno_previous_drug_status         VARCHAR(18)
, pno_qty_min                      VARCHAR(18)
, pno_qty_max                      VARCHAR(18)
, pno_days_supply_max              VARCHAR(18)
, pgo_tb_override_flg              VARCHAR(18)
, pgo_multi_source_cd              CHAR(1)
, pno_period_qty_comp_max          CHAR(1)
, pno_period_qty_type              CHAR(1)
, pno_period_qty_days              INTEGER
, pno_period_qty_max               VARCHAR(18)
, pno_period_ds_type               CHAR(1)
, pno_period_ds_days               VARCHAR(18)
, pno_period_ds_max                VARCHAR(18)
, pgo_rej_cde_remap_tbl            VARCHAR(10)
, tbs_trans_ben_ovrd_scde          VARCHAR(10)
, pgo_desi                         VARCHAR(18)
, pgo_period_to_dt_fill_lvl        VARCHAR(18)
, pgo_period_to_dt_ds_lvl          VARCHAR(18)
, pgo_period_to_dt_qty_lvl         CHAR(1)
, pgo_override_medicaid_product    VARCHAR(18)
, pno_use_benefit_reset            CHAR(1)
, src_add_user_name                VARCHAR(18)
, src_add_dt                       DATE
, src_add_time                     TIMESTAMP
, src_chg_user_name                VARCHAR(18)
, src_chg_dt                       DATE
, src_chg_time                     TIMESTAMP
, pgl_gpi_list_name                VARCHAR(10)
, slt_speciality_list_cd           VARCHAR(6)
, md_netwrk_id                     VARCHAR(6)
, phn_pharmacy_netwrk_id           VARCHAR(6)
, phn_seq_nbr                      VARCHAR(18)
, pno_days_supply_maximum          VARCHAR(18)
, pno_maintenance_drug_sts         CHAR(1)
, pno_suppress_dea_edit            CHAR(1)
, pno_dx_list_drug_status          VARCHAR(18)
, pno_diagnosis_list_qual          CHAR(1)
, pno_daily_dose_qualifier         CHAR(1)
, pno_pharmacy_netwrk_qual         CHAR(1)
, pgo_specl_list_qualifier         CHAR(1)
, pno_unit_dose                    VARCHAR(18)
, pno_otc_override                 CHAR(1)
, pno_package_size_comp_cde        CHAR(1)
, pno_acute_dosing_days_max        INTEGER
, pno_daily_dose_maximum           DECIMAL(11,6)
, pno_daily_dose_minimum           DECIMAL(11,6)
, pno_patient_age_max_1            INTEGER
, pno_patient_age_max_2            INTEGER
, pno_amt_due_basis                VARCHAR(18)
, pno_amt_due_max                  VARCHAR(18)
, pno_sex_exclusion                CHAR(1)
, pno_brand_generic_edit           VARCHAR(18)
, pno_route_of_admin               VARCHAR(18)
, pno_fda_therapeutic_equiv        VARCHAR(18)
, pno_patient_age_proc_qual        CHAR(1)
, pno_patient_age_max_unit         CHAR(1)
, pno_patient_age_min_unit         CHAR(1)
, pno_refill_limit_max_nbr         INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

