DROP TABLE ${STAGING_SCHEMA}.c_member_map_drug_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.c_member_map_drug_dtl_u
( cpp_member_map_drug_dtl_sk       BIGINT NOT NULL
, member_case_decision_hist_id     DECIMAL(38) NOT NULL
, sequence_num                     DECIMAL(38) NOT NULL
, cpp_member_case_decision_hist_sk BIGINT NOT NULL
, drug_name                        NVARCHAR(264) NOT NULL
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

