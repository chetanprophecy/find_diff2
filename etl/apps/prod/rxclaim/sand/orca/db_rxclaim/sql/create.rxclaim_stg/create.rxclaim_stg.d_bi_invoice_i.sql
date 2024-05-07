DROP TABLE ${STAGING_SCHEMA}.d_bi_invoice_i;

CREATE TABLE ${STAGING_SCHEMA}.d_bi_invoice_i
( bi_invoice_sk                    BIGINT NOT NULL
, inv_nbr                          BIGINT NOT NULL
, inv_dt_sk                        BIGINT NOT NULL
, billg_enty_typ_sk                BIGINT NOT NULL
, billg_enty_typ_cd                VARCHAR(2) NOT NULL
, inv_typ_sk                       BIGINT NOT NULL
, inv_typ_cd                       VARCHAR(2) NOT NULL
, billg_enty_id                    VARCHAR(20)
, gp_cust_id                       VARCHAR(15)
, inv_amt                          DECIMAL(15,2)
, billg_enty_nm                    VARCHAR(130)
, billg_enty_addr_ln1              VARCHAR(32)
, billg_enty_addr_ln2              VARCHAR(32)
, billg_enty_city_nm               VARCHAR(30)
, billg_enty_st_cd                 VARCHAR(2)
, billg_enty_zip_cd                VARCHAR(9)
, pmt_sys_id                       VARCHAR(3)
, inv_tot_claim_cost_cnt           INTEGER
, inv_tot_claim_cost_amt           DECIMAL(15,2)
, inv_tot_claim_fee_cnt            INTEGER
, inv_tot_claim_fee_amt            DECIMAL(15,2)
, inv_tot_actvty_fee_cnt           INTEGER
, inv_tot_actvty_fee_amt           DECIMAL(15,2)
, inv_tot_phr_aud_txn_cnt          INTEGER
, inv_tot_phr_aud_txn_amt          DECIMAL(15,2)
, inv_tot_prmpt_pay_int_txn_cnt    INTEGER
, inv_tot_prmpt_pay_int_txn_amt    DECIMAL(15,2)
, inv_tot_dr_amt                   DECIMAL(15,2)
, inv_tot_cr_amt                   DECIMAL(15,2)
, clt_typ_ind                      CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, inv_type_cd                      CHAR(1)
, net_paid_cnt_ind                 CHAR(1)
, contr_grp                        VARCHAR(15)
, inv_fee_suppr_ind                CHAR(1)
, billg_lob                        VARCHAR(2)
, ar_client_id                     VARCHAR(5)
, net_fee_term                     VARCHAR(2)
, tax_id                           VARCHAR(4)
, cbs_def_1                        VARCHAR(30)
, cbs_def_2                        VARCHAR(30)
, cbs_def_3                        VARCHAR(30)
);

