DROP TABLE ${STAGING_SCHEMA}.f_bi_claim_billing_i;

CREATE TABLE ${STAGING_SCHEMA}.f_bi_claim_billing_i
( claim_nbr                        DECIMAL(19) NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, claim_stat_id                    CHAR(1) NOT NULL
, claim_id                         VARCHAR(20)
, cag_sk                           BIGINT NOT NULL
, clt_defd_fld_1                   VARCHAR(20)
, clt_defd_fld_3                   VARCHAR(2)
, clt_defd_fld_2                   VARCHAR(20)
, clt_defd_fld_4                   VARCHAR(2)
, fee_invoice_sk                   BIGINT NOT NULL
, fee_inv_nbr                      BIGINT NOT NULL
, cost_invoice_sk                  BIGINT NOT NULL
, cost_inv_nbr                     BIGINT NOT NULL
, vchr_stat_sk                     BIGINT NOT NULL
, vchr_stat_cd                     VARCHAR(2) NOT NULL
, vchr_claim_cost_stat_sk          BIGINT
, vchr_claim_cost_stat_cd          VARCHAR(2)
, vchr_claim_fee_stat_sk           BIGINT
, vchr_claim_fee_stat_cd           VARCHAR(2)
, claim_class_sub_cd               VARCHAR(2) NOT NULL
, claim_class_sub_sk               BIGINT NOT NULL
, prmpt_pay_dt_sk                  BIGINT NOT NULL
, clsfr_dt_sk                      BIGINT NOT NULL
, billg_clsfr_rule_sk              BIGINT NOT NULL
, billg_clsfr_rule_cd              VARCHAR(15) NOT NULL
, billg_clsfr_sk                   BIGINT
, billg_clsfr_cd                   VARCHAR(15)
, billg_vldtn_dt_sk                BIGINT NOT NULL
, pbs_claim_stat_sk                BIGINT NOT NULL
, pbs_claim_stat_cd                VARCHAR(2) NOT NULL
, inv_stat_sk                      BIGINT NOT NULL
, inv_stat_cd                      VARCHAR(2) NOT NULL
, cost_inv_stat_sk                 BIGINT NOT NULL
, cost_inv_stat_cd                 VARCHAR(2) NOT NULL
, fee_inv_stat_sk                  BIGINT NOT NULL
, fee_inv_stat_cd                  VARCHAR(2) NOT NULL
, mi_tax_ind                       VARCHAR(2)
, prvnc_st_sk                      BIGINT NOT NULL
, cost_inv_amt                     DECIMAL(15,2)
, fee_inv_amt                      DECIMAL(15,2)
, mbr_sk                           BIGINT NOT NULL
, mbr_adjud_sk                     BIGINT NOT NULL
, pbr_sk                           BIGINT
, pbr_adjud_sk                     BIGINT NOT NULL
, phr_sk                           BIGINT NOT NULL
, phr_adjud_sk                     BIGINT NOT NULL
, pln_adjud_sk                     BIGINT NOT NULL
, prod_sk                          BIGINT NOT NULL
, prod_adjud_sk                    BIGINT NOT NULL
, care_fac_adjud_sk                BIGINT NOT NULL
, src_env_sk                       BIGINT NOT NULL
, claim_class_cd                   VARCHAR(5) NOT NULL
, claim_stat_sk                    BIGINT
, carrier_sk                       BIGINT
, carrier_acct_sk                  BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cc_gen_ledger_cd                 VARCHAR(15)
, cc_gen_ledger_cd_desc            VARCHAR(200)
, cf_gen_legder_cd                 VARCHAR(15)
, cf_gen_ledger_cd_desc            VARCHAR(200)
, cbs_def_1                        VARCHAR(30)
, cbs_def_2                        VARCHAR(30)
, cbs_def_3                        VARCHAR(30)
, src_sys_id                       VARCHAR(3)
, clt_typ_ind                      CHAR(1)
);

