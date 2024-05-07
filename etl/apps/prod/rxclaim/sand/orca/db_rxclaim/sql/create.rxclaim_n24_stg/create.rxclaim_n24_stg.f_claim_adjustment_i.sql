DROP TABLE ${STAGING_SCHEMA}.f_claim_adjustment_i;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_adjustment_i
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, rpc_clm_seq_nbr                  INTEGER
, rpc_adj_seq_nbr                  INTEGER
, carrier_sk                       BIGINT
, carrier_acct_sk                  BIGINT
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, rpc_claim_reason                 VARCHAR(80)
, pd7_src                          CHAR(1)
, reproc_dt                        DATE
, reproc_usr                       VARCHAR(10)
, sav_acct_amt                     DECIMAL(9,2)
, reproc_pat_pay_amt               DECIMAL(9,2)
, pay_amt                          DECIMAL(9,2)
, pay_sys                          CHAR(1)
, mbr_pay_amt                      DECIMAL(9,2)
, oth_payer_pay_amt                DECIMAL(9,2)
, ade_cms_pde_sub                  CHAR(1)
, ade_dt_add                       DATE
, ade_tm_add                       TIMESTAMP
, rpc_pay_pharmacy                 CHAR(1)
, ade_reproc_ex4_chg               CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

