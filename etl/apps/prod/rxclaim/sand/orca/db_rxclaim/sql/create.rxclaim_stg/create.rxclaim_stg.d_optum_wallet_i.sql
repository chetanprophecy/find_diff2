DROP TABLE ${STAGING_SCHEMA}.d_optum_wallet_i;

CREATE TABLE ${STAGING_SCHEMA}.d_optum_wallet_i
( owp_sk                           BIGINT
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, ow_pgm_stat_cd                   BYTEINT
, src_add_user_nm                  VARCHAR(10)
, src_add_ts                       TIMESTAMP
, src_add_pgm_nm                   VARCHAR(10)
, src_chg_user_nm                  VARCHAR(10)
, src_chg_ts                       TIMESTAMP
, src_chg_pgm_nm                   VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

