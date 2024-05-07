DROP TABLE ${STAGING_SCHEMA}.c_provider_map_drug_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_map_drug_dtl_i
( cpp_provider_map_drug_dtl_sk     BIGINT NOT NULL
, provider_feedback_id             DECIMAL(38) NOT NULL
, cpp_provider_feedback_sk         BIGINT NOT NULL
, drug_name                        NVARCHAR(264) NOT NULL
, provider_id                      DECIMAL(38)
, cpp_provider_sk                  BIGINT NOT NULL
, case_id                          VARCHAR(15)
, parent_case_id                   VARCHAR(15)
, drug_strength                    NVARCHAR(32)
, drug_sig                         NVARCHAR(32)
, maximum_daily_dose               VARCHAR(20)
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

