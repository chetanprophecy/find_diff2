DROP TABLE ${STAGING_SCHEMA}.c_ogm_feedback_u;

CREATE TABLE ${STAGING_SCHEMA}.c_ogm_feedback_u
( cpp_ogm_feedback_sk              BIGINT NOT NULL
, rxtp_opp_id                      VARCHAR(32) NOT NULL
, ogm_response_dt                  TIMESTAMP NOT NULL
, src_sys_opp_id                   VARCHAR(100) NOT NULL
, consuming_app_id                 VARCHAR(20) NOT NULL
, ogm_disposition                  NVARCHAR(100) NOT NULL
, ogm_disposition_reason_cd        NVARCHAR(20)
, ogm_disposition_descr            NVARCHAR(256)
, cpp_update_ts                    TIMESTAMP
, cpp_updated_by                   VARCHAR(20)
, cpp_create_ts                    TIMESTAMP NOT NULL
, cpp_created_by                   VARCHAR(20) NOT NULL
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

