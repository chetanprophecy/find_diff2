DROP TABLE ${STAGING_SCHEMA}.f_mpd_claim_trp_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.f_mpd_claim_trp_dtl_i
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, trp_seq_nbr                      INTEGER
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, phr_sk                           BIGINT
, prod_sk                          BIGINT
, trp_stat_cd                      CHAR(1)
, trp_stat_qlfr_cd                 VARCHAR(2)
, bin_nbr                          VARCHAR(6)
, process_ctl_nbr                  VARCHAR(10)
, group_nbr                        VARCHAR(15)
, ver_rel_nbr                      VARCHAR(2)
, trx_cd                           VARCHAR(2)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, phr_id_qlfr_cd                   VARCHAR(2)
, phr_id                           VARCHAR(15)
, srv_dt_sk                        BIGINT
, srv_qlfr_cd                      CHAR(1)
, srv_nbr                          VARCHAR(12)
, refill_nbr                       VARCHAR(2)
, prod_qlfr_cd                     VARCHAR(2)
, prod_id                          VARCHAR(20)
, sbm_patient_pay_amt              DECIMAL(9,2)
, update_amt                       DECIMAL(9,2)
, update_rsn_cd                    VARCHAR(2)
, oth_payer_bin_nbr                VARCHAR(6)
, oth_payer_pcn                    VARCHAR(10)
, oth_payer_group_id               VARCHAR(15)
, oth_payer_amt                    DECIMAL(9,2)
, oth_payer_bal_amt                DECIMAL(9,2)
, oth_payer_paid_amt               DECIMAL(9,2)
, oth_cardholder_id                VARCHAR(20)
, oth_sw_cert_id                   VARCHAR(10)
, trx_ref_nbr                      VARCHAR(10)
, a_reprocess_seq_no               INTEGER
, x_reprocess_seq_no               INTEGER
, auto_gen_flg_cd                  CHAR(1)
, src_add_dt                       DATE
, src_add_ts                       TIMESTAMP
, src_chg_dt                       DATE
, src_chg_ts                       TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

