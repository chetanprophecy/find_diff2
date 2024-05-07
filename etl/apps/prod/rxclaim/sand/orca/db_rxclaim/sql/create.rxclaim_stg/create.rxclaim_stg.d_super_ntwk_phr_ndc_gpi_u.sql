DROP TABLE ${STAGING_SCHEMA}.d_super_ntwk_phr_ndc_gpi_u;

CREATE TABLE ${STAGING_SCHEMA}.d_super_ntwk_phr_ndc_gpi_u
( super_ntwk_phr_sk                BIGINT NOT NULL
, super_ntwk_id                    VARCHAR(6) NOT NULL
, super_ntwk_seq_nbr               INTEGER NOT NULL
, phr_ntwk_id                      VARCHAR(6) NOT NULL
, phr_ntwk_seq_nbr                 INTEGER NOT NULL
, phr_ntwk_sk                      BIGINT NOT NULL
, super_ntwk_ndc_gpi_cd            VARCHAR(10)
, super_ntwk_ndc_gpi_type          VARCHAR(2)
, roll_logic_seq                   INTEGER
, super_ntwk_ndc_gpi_qualfr_cd     CHAR(1)
, phr_price_sched                  VARCHAR(10)
, phr_patient_pay                  VARCHAR(10)
, client_price_sched               VARCHAR(10)
, client_patient_pay               VARCHAR(10)
, price_bas_sched                  VARCHAR(10)
, msg_cd                           VARCHAR(10)
, msg_type                         CHAR(1)
, deductible                       VARCHAR(10)
, deductible_accum_cd              VARCHAR(10)
, out_of_pkt                       VARCHAR(10)
, oop_accum_cd                     VARCHAR(10)
, benefit_max                      VARCHAR(10)
, ben_max_accum_cd                 VARCHAR(10)
, lftm_benefit_max                 VARCHAR(10)
, lftm_benefit_max_accum           VARCHAR(10)
, phr_prof_srv_fee_tbl             VARCHAR(10)
, client_prof_srv_fee_tbl          VARCHAR(10)
, spread_price_flg                 CHAR(1)
, phr_dur_pps_fee                  VARCHAR(10)
, client_dur_pps_fee               VARCHAR(10)
, client_2_price_sched             VARCHAR(10)
, client_3_price_sched             VARCHAR(10)
, client_patient_pay_grp_schid     VARCHAR(10)
, client1_price_grp_sch_id         VARCHAR(10)
, client2_price_grp_schid          VARCHAR(10)
, client3_price_grp_schid          VARCHAR(10)
, phr_patpay_grp_schid             VARCHAR(10)
, phr_price_grp_schid              VARCHAR(10)
, user_seq_nbr                     INTEGER
, qualfr_type_seq                  INTEGER
, phr_adtl_patient_pay_brand       VARCHAR(10)
, phr_adtl_patient_pay_bstp        SMALLINT
, phr_adtl_patient_pay_genric      VARCHAR(10)
, phr_adtl_patient_pay_gstp        SMALLINT
, clientadtl_patient_pay_brand     VARCHAR(10)
, clientadtl_patient_pay_bstp      SMALLINT
, clientadtl_patient_pay_genric    VARCHAR(10)
, clientadtl_patient_pay_gstp      SMALLINT
, eff_from_dt                      TIMESTAMP
, eff_thru_dt                      TIMESTAMP
, super_ntwk_phr_stat              CHAR(1)
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
DISTRIBUTE ON (SUPER_NTWK_PHR_SK);

