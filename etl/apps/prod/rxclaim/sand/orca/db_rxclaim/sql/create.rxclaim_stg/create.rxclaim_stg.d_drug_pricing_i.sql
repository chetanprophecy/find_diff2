DROP TABLE ${STAGING_SCHEMA}.d_drug_pricing_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_pricing_i
( drug_price_sk                    BIGINT NOT NULL
, price_tbl_nm                     VARCHAR(13) NOT NULL
, price_seq_nbr                    INTEGER NOT NULL
, price_desc                       VARCHAR(25)
, price_tbl_stat                   CHAR(1)
, price_eff_from_dt                TIMESTAMP
, price_eff_thru_dt                TIMESTAMP
, sbm_cost_vs_sbm_qty              CHAR(1)
, sbm_cost_vs_sbm_qty_pct          DECIMAL(5,2)
, sbm_cost_vs_sbm_qty_act          CHAR(1)
, cost_src_1                       VARCHAR(10)
, cost_src_2                       VARCHAR(10)
, cost_src_3                       VARCHAR(10)
, cost_type_1                      VARCHAR(10)
, cost_type_2                      VARCHAR(10)
, cost_type_3                      VARCHAR(10)
, drug_cost_perct_1                DECIMAL(5,2)
, drug_cost_perct_2                DECIMAL(5,2)
, drug_cost_perct_3                DECIMAL(5,2)
, drug_cost_comparison_cde         CHAR(1)
, drug_cost_sched_nm               VARCHAR(13)
, drug_cost_sched_sk               INTEGER
, fee_1                            DECIMAL(6,2)
, fee_2                            DECIMAL(6,2)
, fee_3                            DECIMAL(6,2)
, fee_perct                        DECIMAL(5,2)
, fsc_fee_sched_nm                 VARCHAR(10)
, fsc_step_nbr_in_fee_sched        INTEGER
, fee_calculation_cde              CHAR(1)
, tax_amt                          DECIMAL(5,3)
, tax_sched                        VARCHAR(6)
, tax_calc_cd                      CHAR(1)
, tax_bas                          VARCHAR(2)
, price_comparison_cd              CHAR(1)
, min_cost_and_fee                 DECIMAL(5,2)
, min_cost_and_fee_qualfr          VARCHAR(2)
, withhold_amt                     DECIMAL(6,2)
, withhold_perct                   DECIMAL(5,2)
, withhold_calc_cd                 CHAR(1)
, car_carrier_id                   VARCHAR(9)
, mac_list                         VARCHAR(10)
, mac_list_2_car_carrier_id        VARCHAR(9)
, mac_list_2_mac_list              VARCHAR(10)
, mac_list_3_car_carrier_id        VARCHAR(9)
, mac_list_3_mac_list              VARCHAR(10)
, patient_pay_sched                VARCHAR(10)
, withhold_sched                   VARCHAR(10)
, withhold_sched_step              INTEGER
, ads_sched_id                     VARCHAR(10)
, prof_srvc_fee_tbl                VARCHAR(10)
, use_with_accum_ind               CHAR(1)
, mli_id_1                         VARCHAR(10)
, mli_id_2                         VARCHAR(10)
, mli_id_3                         VARCHAR(10)
, allw_zero_unc_flg                CHAR(1)
, price_src                        VARCHAR(10)
, price_cd                         VARCHAR(10)
, src_insert_ts                    TIMESTAMP NOT NULL
, src_update_ts                    TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DRUG_PRICE_SK);

