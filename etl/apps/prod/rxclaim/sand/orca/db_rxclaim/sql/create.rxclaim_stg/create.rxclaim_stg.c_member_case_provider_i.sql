DROP TABLE ${STAGING_SCHEMA}.c_member_case_provider_i;

CREATE TABLE ${STAGING_SCHEMA}.c_member_case_provider_i
( cpp_member_case_provider_sk      BIGINT NOT NULL
, member_case_decision_hist_id     DECIMAL(38) NOT NULL
, sequence_num                     DECIMAL(38) NOT NULL
, cpp_member_case_decision_hist_sk BIGINT NOT NULL
, consulted_provider_id            DECIMAL(38)
, cpp_consulted_provider_sk        BIGINT NOT NULL
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

