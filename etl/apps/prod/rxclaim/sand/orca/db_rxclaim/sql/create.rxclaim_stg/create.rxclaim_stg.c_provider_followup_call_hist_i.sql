DROP TABLE ${STAGING_SCHEMA}.c_provider_followup_call_hist_i;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_followup_call_hist_i
( cpp_provider_followup_call_hist_sk BIGINT NOT NULL
, provider_followup_call_hist_id   DECIMAL(38) NOT NULL
, sequence_num                     DECIMAL(38) NOT NULL
, provider_id                      DECIMAL(38)
, cpp_provider_sk                  BIGINT NOT NULL
, case_id                          VARCHAR(15)
, parent_case_id                   VARCHAR(15)
, provider_call_type               VARCHAR(10)
, call_attempt_num                 DECIMAL(2)
, reason                           NVARCHAR(50)
, comments                         NVARCHAR(2048)
, called_by                        NVARCHAR(20)
, spoke_with                       NVARCHAR(30)
, record_dt                        TIMESTAMP
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

