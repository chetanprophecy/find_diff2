DROP TABLE ${STAGING_SCHEMA}.c_provider_feedback_i;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_feedback_i
( cpp_provider_feedback_sk         BIGINT NOT NULL
, provider_feedback_id             DECIMAL(38) NOT NULL
, provider_id                      DECIMAL(38)
, cpp_provider_sk                  BIGINT NOT NULL
, case_id                          VARCHAR(15)
, parent_case_id                   VARCHAR(15)
, feedback_type                    VARCHAR(5)
, assessment_descr                 NVARCHAR(60)
, discharge_dt                     TIMESTAMP
, cancer_diagnosis_flag            CHAR(1)
, hospice_entrollment_flag         CHAR(1)
, palliative_care_flag             CHAR(1)
, icd_diagnosis_cd                 NVARCHAR(60)
, medication_therapy_plan          NVARCHAR(100)
, decision_verbiage_comment        NVARCHAR(1024)
, reviewed_by                      NVARCHAR(20)
, review_dt                        TIMESTAMP
, attachment_flag                  CHAR(1)
, assigned_pharmacist              VARCHAR(50)
, cpp_update_ts                    TIMESTAMP
, cpp_updated_by                   NVARCHAR(20)
, cpp_create_ts                    TIMESTAMP
, cpp_created_by                   NVARCHAR(20)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

