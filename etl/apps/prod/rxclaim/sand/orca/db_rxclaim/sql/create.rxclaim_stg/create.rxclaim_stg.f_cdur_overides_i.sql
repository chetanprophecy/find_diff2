DROP TABLE ${STAGING_SCHEMA}.f_cdur_overides_i;

CREATE TABLE ${STAGING_SCHEMA}.f_cdur_overides_i
( cag_sk                           BIGINT NOT NULL
, phr_sk                           BIGINT NOT NULL
, prod_sk                          BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, pbr_sk                           BIGINT NOT NULL
, gpi_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, claim_nbr                        BIGINT
, claim_seq_nbr                    BIGINT
, claim_stat_id                    CHAR(1)
, claim_stat_sk                    BIGINT NOT NULL
, sbm_yr                           INTEGER
, sbm_mn                           INTEGER
, sbm_dt                           DATE
, filled_dt                        DATE
, sbm_dt_sk                        BIGINT
, filled_dt_sk                     BIGINT
, rej_cd1_sk                       BIGINT
, rej_cd2_sk                       BIGINT
, rej_cd3_sk                       BIGINT
, cnflct_claim_nbr                 BIGINT
, cnflct_claim_seq_nbr             BIGINT
, cnflct_claim_stat_id             CHAR(1)
, cnflct_prod_sk                   BIGINT
, dur_sbm_cd_cntr                  INTEGER
, dur_sbm_srvc_cd_rsn              VARCHAR(2)
, dur_sbm_prof_srvc_cd             VARCHAR(2)
, dur_sbm_srvc_cd_rslt             VARCHAR(2)
, dur_sbm_srvc_loe                 VARCHAR(2)
, dur_sbm_coagent_id               VARCHAR(20)
, dur_sbm_coagent_qlfr             VARCHAR(2)
, app_ingred_cost_paid             DECIMAL(9,2) NOT NULL
, app_dispensing_fee               DECIMAL(9,2) NOT NULL
, app_sales_tax_paid               DECIMAL(9,2) NOT NULL
, app_patient_pay_amt              DECIMAL(9,2) NOT NULL
, app_due_amt                      DECIMAL(9,2) NOT NULL
, clr_ingred_cost_paid             DECIMAL(9,2) NOT NULL
, clr_dispensing_fee               DECIMAL(9,2) NOT NULL
, clr_sales_tax_paid               DECIMAL(9,2) NOT NULL
, clr_patient_pay_amt              DECIMAL(9,2) NOT NULL
, clr_due_amt                      DECIMAL(9,2) NOT NULL
, days_of_supply                   SMALLINT NOT NULL
, drug_quantity                    DECIMAL(11,3) NOT NULL
, recent_clm_flg                   CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

