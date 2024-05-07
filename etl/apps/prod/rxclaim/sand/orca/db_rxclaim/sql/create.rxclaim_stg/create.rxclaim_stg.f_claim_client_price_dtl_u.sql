DROP TABLE ${STAGING_SCHEMA}.f_claim_client_price_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_client_price_dtl_u
( claim_nbr                        BIGINT NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, sbm_dt                           DATE
, filled_dt                        DATE
, cl2_ingrdnt_cost                 DECIMAL(9,2)
, cl2_disp_fee                     DECIMAL(9,2)
, cl2_flat_sls_tax_amt             DECIMAL(9,2)
, cl2_perct_sls_tax_amt_paid       DECIMAL(9,2)
, cl2_incentive_amt                DECIMAL(9,2)
, cl2_tot_other_amt                DECIMAL(9,2)
, cl2_tot_amt                      DECIMAL(9,2)
, cl2_cost_typ_cde                 VARCHAR(10)
, cl2_drg_cost_perct               DECIMAL(5,2)
, cl2_cost_src                     CHAR(1)
, cl2_cst_typ_unit_cost            DECIMAL(13,5)
, cl2_price_typ                    VARCHAR(10)
, cl2_price_sched_nm               VARCHAR(10)
, cl2_price_sched_step             INTEGER
, cl2_price_tbl_nm                 VARCHAR(13)
, cl2_drg_cost_sched               VARCHAR(13)
, cl2_drg_cost_sched_seq           INTEGER
, cl2_drg_cst_comp_sch             VARCHAR(14)
, cl2_drg_cst_comp_sch_seq         INTEGER
, cl2_fee_sched_nm                 VARCHAR(10)
, cl2_fee_sched_stp_nbr            INTEGER
, cl2_incnt_fee_sch_nme            VARCHAR(10)
, cl2_incnt_fee_sch_stp            INTEGER
, cl2_tax_sched_nm                 VARCHAR(6)
, cl2_tax_sched_stp_nbr            INTEGER
, cl3_ingrdnt_cost                 DECIMAL(9,2)
, cl3_disp_fee                     DECIMAL(9,2)
, cl3_flat_sls_tax_amt             DECIMAL(9,2)
, cl3_perct_sls_tax_amt_paid       DECIMAL(9,2)
, cl3_incentive_amt                DECIMAL(9,2)
, cl3_tot_other_amt                DECIMAL(9,2)
, cl3_tot_amt                      DECIMAL(9,2)
, cl3_cost_typ_cde                 VARCHAR(10)
, cl3_drg_cost_perct               DECIMAL(5,2)
, cl3_cost_src                     CHAR(1)
, cl3_cst_typ_unit_cost            DECIMAL(13,5)
, cl3_price_typ                    VARCHAR(10)
, cl3_price_sched_nm               VARCHAR(10)
, cl3_price_sched_step             INTEGER
, cl3_price_tbl_nm                 VARCHAR(13)
, cl3_drg_cost_sched               VARCHAR(13)
, cl3_drg_cost_sched_seq           INTEGER
, cl3_drg_cst_comp_sch             VARCHAR(14)
, cl3_drg_cst_comp_sch_seq         INTEGER
, cl3_fee_sched_nm                 VARCHAR(10)
, cl3_fee_sched_stp_nbr            INTEGER
, cl3_incnt_fee_sch_nme            VARCHAR(10)
, cl3_incnt_fee_sch_stp            INTEGER
, cl3_tax_sched_nm                 VARCHAR(6)
, cl3_tax_sched_stp_nbr            INTEGER
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, claim_stat_id                    CHAR(1) NOT NULL
)
DISTRIBUTE ON (MBR_SK);

