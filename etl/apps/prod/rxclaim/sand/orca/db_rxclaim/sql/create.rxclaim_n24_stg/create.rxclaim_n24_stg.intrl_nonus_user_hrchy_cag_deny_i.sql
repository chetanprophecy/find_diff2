DROP TABLE ${STAGING_SCHEMA}.intrl_nonus_user_hrchy_cag_deny_i;

CREATE TABLE ${STAGING_SCHEMA}.intrl_nonus_user_hrchy_cag_deny_i
( usr_id                           VARCHAR(30) NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, buss_role_id                     INTEGER NOT NULL
, deny_typ                         VARCHAR(15)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

