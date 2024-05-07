DROP TABLE ${STAGING_SCHEMA}.c_rxtp_opp_reject_info_i;

CREATE TABLE ${STAGING_SCHEMA}.c_rxtp_opp_reject_info_i
( cpp_rxtp_opp_reject_cd_sk        BIGINT NOT NULL
, rxtp_opp_id                      VARCHAR(32) NOT NULL
, reject_reason_cd                 VARCHAR(10) NOT NULL
, reject_reason_descr              NVARCHAR(150)
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

