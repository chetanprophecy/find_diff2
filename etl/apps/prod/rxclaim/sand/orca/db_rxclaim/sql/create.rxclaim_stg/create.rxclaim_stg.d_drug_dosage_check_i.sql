DROP TABLE ${STAGING_SCHEMA}.d_drug_dosage_check_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_dosage_check_i
( ddc_sk                           BIGINT
, ddc_key                          VARCHAR(19)
, min_dly_dose                     DECIMAL(6,2)
, usual_dly_dose                   DECIMAL(6,2)
, max_dly_dose                     DECIMAL(6,2)
, min_thrpy_days                   INTEGER
, usual_thrpy_days                 INTEGER
, max_thrpy_days                   INTEGER
, user_defd_fld1                   VARCHAR(5)
, user_defd_fld2                   CHAR(1)
, freq_admin_cd                    VARCHAR(15)
, ddc_ref_cd                       VARCHAR(3)
, user_defd_fld3                   VARCHAR(18)
, ddc_chg_dt                       DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

