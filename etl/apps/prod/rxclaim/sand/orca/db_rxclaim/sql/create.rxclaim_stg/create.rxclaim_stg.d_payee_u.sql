DROP TABLE ${STAGING_SCHEMA}.d_payee_u;

CREATE TABLE ${STAGING_SCHEMA}.d_payee_u
( clm_payee_sk                     BIGINT NOT NULL
, payee_id                         VARCHAR(12) NOT NULL
, seq_nbr                          INTEGER NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, payee_nm                         VARCHAR(60) NOT NULL
, payee_short_nm                   VARCHAR(15) NOT NULL
, payee_typ                        CHAR(1) NOT NULL
, payee_orig                       CHAR(1) NOT NULL
, mbr_payee_stat                   CHAR(1) NOT NULL
, hold_typ                         CHAR(1) NOT NULL
, hold_rsn                         VARCHAR(25) NOT NULL
, remitt_advice_pgm_typ            VARCHAR(10) NOT NULL
, remitt_advice_outf               VARCHAR(10) NOT NULL
, remitt_advice_outlib             VARCHAR(10) NOT NULL
, pref_chk_typ                     CHAR(1) NOT NULL
, routing_nbr                      VARCHAR(12) NOT NULL
, fi_acct_nbr                      VARCHAR(18) NOT NULL
, pymt_addr_1                      VARCHAR(55) NOT NULL
, pymt_addr_2                      VARCHAR(55) NOT NULL
, pymt_addr_3                      VARCHAR(55) NOT NULL
, pymt_city                        VARCHAR(30) NOT NULL
, pymt_st                          VARCHAR(2) NOT NULL
, pymt_zip                         VARCHAR(5) NOT NULL
, pymt_zip2                        VARCHAR(4) NOT NULL
, pymt_zip3                        VARCHAR(2) NOT NULL
, pymt_country                     VARCHAR(4) NOT NULL
, pymt_cntct                       VARCHAR(40) NOT NULL
, pymt_cntct_titl                  VARCHAR(20) NOT NULL
, pymt_tel                         BIGINT NOT NULL
, pymt_tel_ext                     INTEGER NOT NULL
, pymt_fax                         BIGINT NOT NULL
, rpt_addr_1                       VARCHAR(55) NOT NULL
, rpt_addr_2                       VARCHAR(55) NOT NULL
, rpt_addr_3                       VARCHAR(55) NOT NULL
, rpt_city                         VARCHAR(30) NOT NULL
, rpt_st                           VARCHAR(2) NOT NULL
, rpt_zip                          VARCHAR(5) NOT NULL
, rpt_zip_2                        VARCHAR(4) NOT NULL
, rpt_zip_3                        VARCHAR(2) NOT NULL
, rpt_country                      VARCHAR(4) NOT NULL
, rpt_cntct                        VARCHAR(40) NOT NULL
, rpt_cntct_titl                   VARCHAR(30) NOT NULL
, rpt_tel                          BIGINT NOT NULL
, rpt_tel_ext                      INTEGER NOT NULL
, rpt_fax                          BIGINT NOT NULL
, combine_payee                    CHAR(1) NOT NULL
, mbr_plan_yr_reset_dt             BIGINT NOT NULL
, src_add_user_nm                  VARCHAR(10) NOT NULL
, src_add_dt                       BIGINT NOT NULL
, src_add_tm                       BIGINT NOT NULL
, src_add_pgm_nm                   VARCHAR(10) NOT NULL
, src_chg_user_nm                  VARCHAR(10) NOT NULL
, src_chg_dt                       BIGINT NOT NULL
, src_chg_tm                       BIGINT NOT NULL
, src_chg_pgm_nm                   VARCHAR(10) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
);

