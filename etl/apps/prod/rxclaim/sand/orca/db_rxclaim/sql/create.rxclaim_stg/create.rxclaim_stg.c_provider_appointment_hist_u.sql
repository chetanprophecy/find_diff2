DROP TABLE ${STAGING_SCHEMA}.c_provider_appointment_hist_u;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_appointment_hist_u
( cpp_provider_appointment_hist_sk BIGINT NOT NULL
, provider_appointment_hist_id     DECIMAL(38) NOT NULL
, provider_followup_call_hist_id   DECIMAL(38) NOT NULL
, sequence_num                     DECIMAL(38) NOT NULL
, cpp_provider_followup_call_hist_sk BIGINT NOT NULL
, provider_id                      DECIMAL(38)
, cpp_provider_sk                  BIGINT NOT NULL
, case_id                          VARCHAR(15)
, parent_case_id                   VARCHAR(15)
, scheduled_with                   VARCHAR(20)
, appointment_start_dt             TIMESTAMP
, appointment_end_dt               TIMESTAMP
, appointment_duration             DECIMAL(3)
, timezone                         VARCHAR(3)
, sceduled_by                      NVARCHAR(20)
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

