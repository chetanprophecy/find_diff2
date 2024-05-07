DROP TABLE ${STAGING_SCHEMA}.f_claim_transaction_submitted_info_u;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_transaction_submitted_info_u
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, claim_stat_id                    CHAR(1)
, claim_nbr_encrp                  BIGINT
, carrier_sk                       BIGINT
, mbr_sk                           BIGINT
, cag_sk                           BIGINT
, sbm_patient_id_qlfr              VARCHAR(2)
, sbm_patient_id                   VARCHAR(20)
, sbm_patient_addr                 VARCHAR(30)
, sbm_patient_city                 VARCHAR(20)
, sbm_patient_st_cd                VARCHAR(2)
, sbm_patient_zip                  VARCHAR(15)
, sbm_patient_ssn_nbr              VARCHAR(20)
, sbm_patient_phone                BIGINT
, sbm_patient_employer_id          VARCHAR(15)
, sbm_patient_smoker_ind           CHAR(1)
, sbm_patient_pregnancy_ind        CHAR(1)
, sbm_patient_eml_addr             VARCHAR(80)
, sbm_future_use_sts               VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          INTEGER
, sbm_dt                           DATE
, sbm_dt_sk                        BIGINT
, filled_dt                        DATE
, filled_dt_sk                     BIGINT
)
DISTRIBUTE ON (MBR_SK);

