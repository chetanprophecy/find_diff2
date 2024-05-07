DROP TABLE ${STAGING_SCHEMA}.rxsol_08_claims_for_repricing_i;

CREATE TABLE ${STAGING_SCHEMA}.rxsol_08_claims_for_repricing_i
( id                               BIGINT
, claim_id                         CHAR(38) NOT NULL
, claim_status_id                  VARCHAR(1)
, claim_seq_number                 DECIMAL(15)
, drug_cost                        DECIMAL(9,2)
, network_flag                     CHAR(1)
, mail_retail_flag                 CHAR(1)
, tier_type                        CHAR(3)
, copay                            DECIMAL(9,2)
, daw_cd                           CHAR(1)
, drug_ind                         CHAR(1) NOT NULL
, frmlry_cd                        CHAR(1)
, fill_date                        DATE
, submitted_date                   DATE
, awp_price                        DECIMAL(9,2)
, maint_drug_ind                   CHAR(1)
, ing_cst_pd_amt                   DECIMAL(15,2)
, profdisp_fee                     DECIMAL(15,2)
, sales_tx_amt                     DECIMAL(15,2)
, days_supply                      INTEGER
, deductible                       DECIMAL(15,2)
, carrier_account_group_key        BIGINT
, carrier_id                       VARCHAR(9)
, account_id                       VARCHAR(15)
, employer_group_id                VARCHAR(30)
, bpl_nbr                          VARCHAR(25)
, family_id                        CHAR(20)
, dependent_id                     CHAR(3)
, patient_id                       CHAR(20)
, date_of_birth                    DATE
, pharmacy_key                     BIGINT
, pharmacy_id                      VARCHAR(15)
, prescriber_id                    VARCHAR(15)
, prescriber_src_key               VARCHAR(10)
, prescriber_dea_code              VARCHAR(15)
, prescriber_npi_id                VARCHAR(10)
, drug_id                          BIGINT
, drug_code                        VARCHAR(30)
, generic_number                   VARCHAR(14)
, drug_name                        VARCHAR(150)
, package_strength                 VARCHAR(45)
, package_size                     DECIMAL(9,3)
, drug_strength_nbr                DECIMAL(20,5)
, metric_dec_qty                   DECIMAL(10,3)
, halftab_reprice_ind              VARCHAR(2)
, halftab_prog_ind                 VARCHAR(2)
, ancillary_charge                 DECIMAL(9,2)
, network_type                     CHAR(1)
, coinsurance                      DECIMAL(9,2)
, ndc_numeric                      BIGINT
, app_ingred_cost_paid             DECIMAL(9,2)
, clr_due_amt                      DECIMAL(9,2)
, policy_number                    VARCHAR(7)
, app_patient_pay_amt              DECIMAL(9,2)
, clr_patient_pay_amt              DECIMAL(9,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

