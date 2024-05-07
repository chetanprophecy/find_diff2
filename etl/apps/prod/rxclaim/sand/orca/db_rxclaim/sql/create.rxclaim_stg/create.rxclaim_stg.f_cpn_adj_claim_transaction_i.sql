DROP TABLE ${STAGING_SCHEMA}.f_cpn_adj_claim_transaction_i;

CREATE TABLE ${STAGING_SCHEMA}.f_cpn_adj_claim_transaction_i
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, claim_stat_id                    CHAR(1)
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, member_id                        VARCHAR(20)
, mbr_sk                           BIGINT
, phr_sk                           BIGINT
, prod_sk                          BIGINT
, sbm_dt                           DATE
, sbm_dt_sk                        BIGINT
, filled_dt                        DATE
, filled_dt_sk                     BIGINT
, final_pln_sk                     BIGINT
, days_sply                        INTEGER
, claim_cntr                       SMALLINT
, drg_qty                          DECIMAL(11,3)
, app_due_amt                      DECIMAL(9,2)
, app_patient_pay_amt              DECIMAL(9,2)
, clt_due_amt                      DECIMAL(9,2)
, clt_patient_pay_amt              DECIMAL(9,2)
, oop_applied_amt                  DECIMAL(9,2)
, app_adj_copay_amt                DECIMAL(9,2)
, app_adj_flat_copay_amt           DECIMAL(9,2)
, app_adj_prcnt_copay_amt          DECIMAL(9,2)
, app_adj_ded_amt                  DECIMAL(9,2)
, app_adj_atr_over_cap_amt         DECIMAL(9,2)
, app_adj_atr_prd_slct_amt         DECIMAL(9,2)
, app_adj_atr_sls_tax_amt          DECIMAL(9,2)
, app_adj_pat_pay_amt              DECIMAL(9,2)
, rbl_adj_copay_amt                DECIMAL(9,2)
, rbl_adj_flat_copay_amt           DECIMAL(9,2)
, rbl_adj_prcnt_copay_amt          DECIMAL(9,2)
, rbl_adj_ded_amt                  DECIMAL(9,2)
, rbl_adj_atr_over_cap_amt         DECIMAL(9,2)
, rbl_adj_atr_prd_slct_amt         DECIMAL(9,2)
, rbl_adj_atr_sls_tax_amt          DECIMAL(9,2)
, rbl_adj_pat_pay_amt              DECIMAL(9,2)
, cpn_not_appld_amt                DECIMAL(9,2)
, oth_pyr_2nd_amt                  DECIMAL(9,2)
, oth_pyr_3rd_amt                  DECIMAL(9,2)
, oth_pyr_na_ind                   CHAR(1)
, reversal_ind                     CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cpn_pat_pay_gpi_list             VARCHAR(30)
, btch_ld_cpn_ind                  CHAR(1)
, unusd_cpn_amt                    DECIMAL(9,2)
, src_stat_id                      CHAR(1)
, src_seq_nbr                      INTEGER
)
DISTRIBUTE ON (MBR_SK);

