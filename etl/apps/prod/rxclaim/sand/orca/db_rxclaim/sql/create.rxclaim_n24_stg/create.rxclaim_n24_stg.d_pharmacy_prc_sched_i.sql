DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_prc_sched_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_prc_sched_i
( phr_ndc_prc_sched_sk             BIGINT NOT NULL
, cpp_pricing_sched_nm             VARCHAR(10)
, cpd_price_id                     INTEGER
, cpd_seq_nbr                      INTEGER
, cpd_record_stat                  CHAR(1)
, cpd_frm_dt                       DATE
, cpd_thru_dt                      DATE
, dc3_drg_cost_sched_nm            VARCHAR(13)
, dc3_schd_brnd_90_day_spply       VARCHAR(13)
, dc3_schd_gen_30_day_spply        VARCHAR(13)
, dc3_schd_gen_90_day_spply        VARCHAR(13)
, ndc_list_nm                      VARCHAR(10)
, phr_netwk_list_nm                VARCHAR(10)
, super_ntwk_sk                    BIGINT
, snh_seq_nbr                      INTEGER
, ntwk_sk                          BIGINT
, cpd_brand_disp_fee_30            DECIMAL(9,2)
, cpd_gen_disp_fee_30              DECIMAL(9,2)
, cpd_brand_disp_fee_60            DECIMAL(9,2)
, cpd_gen_disp_fee_60              DECIMAL(9,2)
, cpd_brand_disp_fee_90            DECIMAL(9,2)
, cpd_gen_disp_fee_90              DECIMAL(9,2)
, cpd_pref_stat_rtl                CHAR(1)
, cpd_phr_search_typ               CHAR(1)
, cpd_vaccine_admin_fee            INTEGER
, dc3_schd_brnd_60day_spply        VARCHAR(13)
, dc3_schd_gen_60_day_spply        VARCHAR(13)
, dc3_schd_brnd_30ds_mail          VARCHAR(13)
, dc3_schd_brnd_60ds_mail          VARCHAR(13)
, dc3_schd_brnd_90ds_mail          VARCHAR(13)
, dc3_schd_gen_30ds_mail           VARCHAR(13)
, dc3_schd_gen_60ds_mail           VARCHAR(13)
, dc3_schd_gen_90ds_mail           VARCHAR(13)
, cpd_pref_stat_mail               CHAR(1)
, cpd_floor_pricing                INTEGER
, cnl_list_id                      VARCHAR(10)
, cpd_phr_typ_ovrd                 CHAR(1)
, cpd_cost                         CHAR(1)
, dc3_schd_brnd_30ds_dsr           VARCHAR(13)
, dc3_schd_brnd_60ds_dsr           VARCHAR(13)
, dc3_schd_brnd_90ds_dsr           VARCHAR(13)
, dc3_schd_gen_30ds_dsr            VARCHAR(13)
, dc3_schd_gen_60ds_dsr            VARCHAR(13)
, dc3_schd_gen_90ds_dsr            VARCHAR(13)
, ntwk_form_ndc_list_dsr           VARCHAR(10)
, taxonomy_cd_list_id              VARCHAR(10)
, add_dt                           DATE
, chg_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

