DROP TABLE ${STAGING_SCHEMA}.c_member_case_decision_hist_u;

CREATE TABLE ${STAGING_SCHEMA}.c_member_case_decision_hist_u
( cpp_member_case_decision_hist_sk BIGINT NOT NULL
, member_case_decision_hist_id     DECIMAL(38) NOT NULL
, sequence_num                     DECIMAL(38) NOT NULL
, case_id                          VARCHAR(15)
, case_decision_type               NVARCHAR(30)
, case_decision                    NVARCHAR(30)
, pos_edit_notification_dt         TIMESTAMP
, pos_edit_modification_dt         TIMESTAMP
, decision_verbiage                NVARCHAR(1024)
, standardized_verbiage            NVARCHAR(1024)
, recommendation                   NVARCHAR(30)
, review_dt                        TIMESTAMP
, pos_edit_eff_dt                  TIMESTAMP
, pos_edit_end_dt                  TIMESTAMP
, reason_cd                        NVARCHAR(32)
, attendees                        NVARCHAR(64)
, pos_edit_flag                    CHAR(1)
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

