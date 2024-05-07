DROP TABLE ${STAGING_SCHEMA}.f_saving_acct_pay_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.f_saving_acct_pay_dtl_i
( cag_sk                           BIGINT
, mbr_sk                           BIGINT
, claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, reprocess_chk_nbr                VARCHAR(9)
, reprocess_claim_seq              INTEGER
, reprocess_posted_dt              DATE
, reprocess_pay_nbr                VARCHAR(9)
, oth_payer_pay_amt                DECIMAL(9,2)
, pay_phr_flg                      CHAR(1)
, sav_acct_subtype_id              VARCHAR(10)
, mbr_pay_amt                      DECIMAL(9,2)
, pay_amt                          DECIMAL(9,2)
, reprocess_pat_pay_amt            DECIMAL(9,2)
, reprocess_user                   VARCHAR(10)
, reprocess_dt                     DATE
, extract_flg                      CHAR(1)
, financial_fld_applied_ind        CHAR(1)
, payment_sys_ind                  CHAR(1)
, rxclaim_src                      CHAR(1)
, pos_rebate_amt                   DECIMAL(15,2)
, sav_acct_id                      VARCHAR(19)
, pos_id                           VARCHAR(10)
, adjustment_seq                   INTEGER
, adjustment_typ                   VARCHAR(3)
, pos_financial_field_applied      CHAR(1)
, pos_financial_field_applied_desc VARCHAR(100)
, src_insert_uid                   VARCHAR(10)
, src_insert_dt                    DATE
, src_insert_tm                    TIME
, src_insert_prog_nm               VARCHAR(10)
, src_update_uid                   VARCHAR(10)
, src_update_dt                    DATE
, src_update_tm                    TIME
, src_update_prog_nm               VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, claim_stat_id                    CHAR(1)
, adj_prim_liab                    DECIMAL(9,2)
, adj_sec_diff                     DECIMAL(9,2)
, claim_nbr_encrp                  BIGINT
, carrier_sk                       BIGINT
, sec_flg                          INTEGER
)
DISTRIBUTE ON (MBR_SK);

