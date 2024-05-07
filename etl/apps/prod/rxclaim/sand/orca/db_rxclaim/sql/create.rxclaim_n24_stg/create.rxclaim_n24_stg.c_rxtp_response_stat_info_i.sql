DROP TABLE ${STAGING_SCHEMA}.c_rxtp_response_stat_info_i;

CREATE TABLE ${STAGING_SCHEMA}.c_rxtp_response_stat_info_i
( rxtp_file_processing_dt          TIMESTAMP NOT NULL
, src_filename                     VARCHAR(256)
, src_filename_received_dt         TIMESTAMP NOT NULL
, src_opp_input_count              BIGINT
, malformed_opp_reject_count       BIGINT
, duplicate_opp_reject_count       BIGINT
, sanity_chk_reject_count          BIGINT
, opp_key_fld_vld_reject_count     BIGINT
, opp_nokey_fld_vld_reject_count   BIGINT
, mbr_vld_reject_count             BIGINT
, rxtp_total_opp_reject_count      BIGINT
, rxtp_total_opp_output_count      BIGINT
, rxtp_to_c360_opp_dlvr_count      BIGINT
, rxtp_to_c360_opp_filename        VARCHAR(256) NOT NULL
, rxtp_to_c360_opp_dlvr_dt         TIMESTAMP NOT NULL
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

