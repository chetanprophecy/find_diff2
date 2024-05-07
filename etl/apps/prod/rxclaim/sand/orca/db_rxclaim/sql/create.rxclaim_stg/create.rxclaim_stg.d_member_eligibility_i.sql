DROP TABLE ${STAGING_SCHEMA}.d_member_eligibility_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_eligibility_i
( mbr_eligty_sk                    BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, seq_nbr                          INTEGER NOT NULL
, mel_stat_cd                      CHAR(1)
, mel_eff_dt                       DATE
, mel_thru_dt                      DATE
, copay_brnd_amt                   DECIMAL(5,2)
, copay_gen_amt                    DECIMAL(5,2)
, copay3_amt                       DECIMAL(5,2)
, copay4_amt                       DECIMAL(5,2)
, clt_prod_cd                      VARCHAR(6)
, clt_rdr_cd                       VARCHAR(6)
, pln_cd                           VARCHAR(10)
, plan_eff_dt                      DATE
, spnd_dwn_amt                     DECIMAL(9,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

