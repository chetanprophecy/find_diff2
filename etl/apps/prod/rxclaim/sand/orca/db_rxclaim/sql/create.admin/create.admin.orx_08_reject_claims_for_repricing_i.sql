DROP TABLE ${STAGING_SCHEMA}.orx_08_reject_claims_for_repricing_i;

CREATE TABLE ${STAGING_SCHEMA}.orx_08_reject_claims_for_repricing_i
( id                               BIGINT
, carrier_account_group_key        BIGINT
, carrier_id                       VARCHAR(9)
, account_id                       VARCHAR(15)
, employer_group_id                VARCHAR(15)
, policy_number                    VARCHAR(7)
, prescription_number              BIGINT
, member_id                        CHAR(20)
, claim_id                         CHAR(38) NOT NULL
, claim_seq_number                 DECIMAL(15)
, submitted_date                   DATE
, submitted_ndc                    VARCHAR(11)
, gpi                              VARCHAR(14)
, reject_code_count                INTEGER
, reject_code_1                    VARCHAR(3)
, reject_code_2                    VARCHAR(3)
, reject_code_3                    VARCHAR(3)
, reject_code_4                    VARCHAR(3)
, reject_code_5                    VARCHAR(3)
, reject_code_6                    VARCHAR(3)
, reject_code_7                    VARCHAR(3)
, reject_code_8                    VARCHAR(3)
, reject_code_9                    VARCHAR(3)
, reject_code_10                   VARCHAR(3)
, reject_message_1                 VARCHAR(50)
, reject_message_2                 VARCHAR(50)
, reject_message_3                 VARCHAR(50)
, reject_message_4                 VARCHAR(50)
, reject_message_5                 VARCHAR(50)
, reject_message_6                 VARCHAR(50)
, reject_message_7                 VARCHAR(50)
, reject_message_8                 VARCHAR(50)
, reject_message_9                 VARCHAR(50)
, reject_message_10                VARCHAR(50)
, submitted_days_supply            DECIMAL(3)
, drug_quantity                    DECIMAL(11,3)
, contingent_therapy               VARCHAR(10)
, contingent_therapy_schedule      VARCHAR(30)
, ncpdp                            VARCHAR(12)
, npi                              VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

