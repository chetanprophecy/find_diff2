DROP TABLE ${STAGING_SCHEMA}.d_dup_claims_mstr_i;

CREATE TABLE ${STAGING_SCHEMA}.d_dup_claims_mstr_i
( claim_id                         VARCHAR(30)
, carrier_id                       VARCHAR(30)
, mbr_id                           VARCHAR(20)
, drg_ndc_id                       VARCHAR(20)
, mb_last_nm                       VARCHAR(70)
, mb_first_nm                      VARCHAR(50)
, claim_nbr                        BIGINT
, sbm_dt                           DATE
, filled_dt                        DATE
, days_sply                        BIGINT
, prior_auth_reason_cd             VARCHAR(2)
, phr_id                           VARCHAR(15)
, refill_nbr                       VARCHAR(2)
, rx_nbr                           VARCHAR(12)
, drg_qty                          DECIMAL(15,3)
, app_due_amt                      DECIMAL(15,2)
, claim_seq_nbr                    BIGINT
, submitted_date1                  DATE
, pharmacy_id1                     VARCHAR(15)
, day_diff                         SMALLINT
, day_diff_display                 SMALLINT
, row_sequence                     SMALLINT
, drg_ndc_desc                     VARCHAR(70)
, phr_nm                           VARCHAR(60)
, phr_dispnsr_class_cd             VARCHAR(3)
, phr_dispnsr_type_cd              VARCHAR(3)
, hm_dlvry_ind                     CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CLAIM_ID);

