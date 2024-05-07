DROP TABLE ${STAGING_SCHEMA}.f_audit_call_notes_i;

CREATE TABLE ${STAGING_SCHEMA}.f_audit_call_notes_i
( audit_call_note_id               INTEGER
, claim_nbr                        BIGINT
, zero_reclaim                     CHAR(1)
, audit_payment_type_id            INTEGER
, phr_contact_nm                   VARCHAR(50)
, audit_category_id                INTEGER
, number_of_calls                  INTEGER
, number_of_emails                 INTEGER
, audit_type_id                    INTEGER
, audit_fraud_type_id              INTEGER
, audit_fraud_violation_reason_id  INTEGER
, audit_fraud_perpetrator_id       INTEGER
, audit_nonfraud_violation_reason_id INTEGER
, comments                         VARCHAR(155)
, created_dt                       TIMESTAMP
, created_by                       VARCHAR(30)
, phr_adjust_amt                   DECIMAL(20,3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, clt_adjust_amt                   DECIMAL(20,3)
, adjust_claim_nbr                 BIGINT
, audit_claim_seq_nbr              INTEGER
, adjust_claim_seq_nbr             INTEGER
, rxclaim_instance_ind             SMALLINT
);

