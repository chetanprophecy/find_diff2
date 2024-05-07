DROP TABLE ${STAGING_SCHEMA}.d_mpd_action_log_i;

CREATE TABLE ${STAGING_SCHEMA}.d_mpd_action_log_i
( mdd_action_log_key               BIGINT NOT NULL
, mdh_file_id                      VARCHAR(10)
, pdp_contract_id                  VARCHAR(5)
, pdp_pbp_id                       VARCHAR(3)
, mdd_seq_nbr                      DECIMAL(7)
, mdi_action_log_seq               DECIMAL(7)
, mdi_action_cd                    VARCHAR(10)
, mdi_action_cd_notes              VARCHAR(200)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

