DROP TABLE ${STAGING_SCHEMA}.f_bi_activity_billing_i;

CREATE TABLE ${STAGING_SCHEMA}.f_bi_activity_billing_i
( actvty_fee_uniq_id               VARCHAR(20) NOT NULL
, bi_invoice_sk                    BIGINT NOT NULL
, inv_nbr                          BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, actvty_carrier_id                VARCHAR(30) NOT NULL
, actvty_account_id                VARCHAR(40) NOT NULL
, actvty_group_id                  VARCHAR(30) NOT NULL
, actvty_cat_sk                    BIGINT NOT NULL
, actvty_cat_cd                    VARCHAR(7) NOT NULL
, actvty_hldr_typ_sk               BIGINT NOT NULL
, actvty_hldr_typ_cd               VARCHAR(2) NOT NULL
, actvty_unit_of_meas              VARCHAR(2)
, actvty_unit_prc_amt              DECIMAL(15,2)
, actvty_unit_cnt                  INTEGER
, actvty_amt                       DECIMAL(15,2)
, actvty_hldr_id                   VARCHAR(20)
, actvty_btch_nm                   VARCHAR(80)
, carrier_sk                       BIGINT
, carrier_acct_sk                  BIGINT
, clt_typ_ind                      CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, src_sys_id                       VARCHAR(3)
, ar_gen_ledger_cd                 VARCHAR(15)
, ar_gen_ledger_cd_desc            VARCHAR(200)
, clt_cmnt                         VARCHAR(100)
, clt_cmnt_desc                    VARCHAR(2000)
, cbs_def_1                        VARCHAR(30)
, cbs_def_2                        VARCHAR(30)
, cbs_def_3                        VARCHAR(30)
)
DISTRIBUTE ON (INV_NBR);

