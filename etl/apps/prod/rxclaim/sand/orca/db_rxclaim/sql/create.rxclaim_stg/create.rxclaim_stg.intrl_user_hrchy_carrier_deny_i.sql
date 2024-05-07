DROP TABLE ${STAGING_SCHEMA}.intrl_user_hrchy_carrier_deny_i;

CREATE TABLE ${STAGING_SCHEMA}.intrl_user_hrchy_carrier_deny_i
( usr_id                           VARCHAR(30) NOT NULL
, carrier_sk                       BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
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

