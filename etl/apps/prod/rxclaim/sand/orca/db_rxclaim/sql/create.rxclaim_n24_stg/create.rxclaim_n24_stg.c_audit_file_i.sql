DROP TABLE ${STAGING_SCHEMA}.c_audit_file_i;

CREATE TABLE ${STAGING_SCHEMA}.c_audit_file_i
( batch_job_sk                     BIGINT NOT NULL
, batch_job_id                     VARCHAR(15) NOT NULL
, file_name                        VARCHAR(100) NOT NULL
, file_type                        VARCHAR(3) NOT NULL
, file_category                    VARCHAR(50)
, file_date                        TIMESTAMP NOT NULL
, file_start_dt                    TIMESTAMP
, file_end_dt                      TIMESTAMP
, num_of_record_file               BIGINT
, num_of_record_rejected           BIGINT
, cpp_update_ts                    TIMESTAMP
, updated_by                       VARCHAR(20)
, cpp_create_ts                    TIMESTAMP NOT NULL
, cpp_created_by                   VARCHAR(20) NOT NULL
, additional_cmmt                  NVARCHAR(500)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

