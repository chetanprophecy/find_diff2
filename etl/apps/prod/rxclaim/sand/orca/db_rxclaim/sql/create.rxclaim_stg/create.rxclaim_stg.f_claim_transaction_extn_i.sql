DROP TABLE ${STAGING_SCHEMA}.f_claim_transaction_extn_i;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_transaction_extn_i
( claim_nbr                        BIGINT NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, claim_stat_id                    CHAR(1) NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, splty_pgm_ind                    CHAR(1)
, splty_pgm_id                     VARCHAR(10)
, splty_sched_nm                   VARCHAR(10)
, phr_ntwk_qlfr                    CHAR(1)
, phr_rtl_mail_sched_id            VARCHAR(10)
, frm_mgmt_srvc_stat               VARCHAR(2)
, frm_mgmt_srvc_rule_set_id        VARCHAR(10)
, frm_mgmt_srvc_rule_id            VARCHAR(10)
, frm_mgmt_srvc_proc_cd            VARCHAR(2)
, frm_mgmt_srvc_ben_lst            VARCHAR(10)
, frm_mgmt_srvc_dflt_ind           VARCHAR(10)
, frm_mgmt_srvc_lst_lvl_1          VARCHAR(10)
, frm_mgmt_srvc_lst_lvl_2          VARCHAR(10)
, frm_mgmt_srvc_lst_lvl_3          VARCHAR(10)
, clt_rtl_mail_sched_id            VARCHAR(10)
, cntrbtn_accum_code               VARCHAR(10)
, cntrbtn_basis_cd                 VARCHAR(2)
, cntrbtn_flg                      CHAR(1)
, cntrbtn_amt                      DECIMAL(9,2)
, cntrbtn_sched_id                 VARCHAR(10)
, bnft_stg_qlfr_1                  VARCHAR(2)
, bnft_stg_amt_1                   DECIMAL(9,2)
, bnft_stg_qlfr_2                  VARCHAR(2)
, bnft_stg_amt_2                   DECIMAL(9,2)
, bnft_stg_qlfr_3                  VARCHAR(2)
, bnft_stg_amt_3                   DECIMAL(9,2)
, bnft_stg_qlfr_4                  VARCHAR(2)
, bnft_stg_amt_4                   DECIMAL(9,2)
, splty_prgm_nm                    VARCHAR(10)
, rxnorm_cd                        VARCHAR(10)
, payer_type                       CHAR(1)
, prim_pbr_id_qlfr                 VARCHAR(2)
, rsp_pln_id                       VARCHAR(8)
, hlth_pln_fnd_asst_amt            DECIMAL(9,2)
, clt_disp_fee_ctrctd              DECIMAL(9,2)
, clt_ing_cost_cntrctd             DECIMAL(9,2)
, clt_pat_sales_tax_amt            DECIMAL(9,2)
, clt_pln_sales_tax_amt            DECIMAL(9,2)
, phr_disp_fee_ctrctd              DECIMAL(9,2)
, phr_ing_cost_ctrctd              DECIMAL(9,2)
, phr_pln_sales_tax_amt            DECIMAL(9,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, part_fill_ind                    CHAR(1)
, cntngnt_stat_cd                  CHAR(1)
, carrier_sk                       BIGINT
, ndc_plan_dflt_list               VARCHAR(6)
, gpi_plan_dflt_list               VARCHAR(10)
, part_fill_seg_ind                VARCHAR(10)
, sbm_prescribed_qty               DECIMAL(11,3)
, tax_sched_nm                     VARCHAR(6)
)
DISTRIBUTE ON (MBR_SK);

