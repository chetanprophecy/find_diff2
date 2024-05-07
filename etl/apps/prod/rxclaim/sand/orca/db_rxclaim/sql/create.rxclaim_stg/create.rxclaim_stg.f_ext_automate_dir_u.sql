DROP TABLE ${STAGING_SCHEMA}.f_ext_automate_dir_u;

CREATE TABLE ${STAGING_SCHEMA}.f_ext_automate_dir_u
( cag_sk                           BIGINT
, mbr_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, claim_nbr                        BIGINT
, claim_stat_id                    CHAR(1)
, claim_seq_nbr                    INTEGER
, mbr_id                           VARCHAR(20)
, prov_id                          VARCHAR(10)
, payee_id                         VARCHAR(12)
, rx_nbr                           VARCHAR(12)
, fill_dt                          DATE
, sbm_dt                           DATE
, fee_amt                          DECIMAL(9,2)
, check_nbr                        INTEGER
, app_ingred_cost_paid             DECIMAL(15,2)
, check_dt                         DATE
, check_amt_paid                   DECIMAL(11,3)
, chain_cd                         VARCHAR(6)
, amt_desc                         VARCHAR(30)
, awp_amt                          DECIMAL(24,8)
, app_price_type                   VARCHAR(10)
, bin                              VARCHAR(6)
, pcn                              VARCHAR(10)
, sbm_group                        VARCHAR(15)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       CHAR(20)
, update_uid                       CHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

