DROP TABLE ${STAGING_SCHEMA}.uhc_nonus_role_cag_mask_u;

CREATE TABLE ${STAGING_SCHEMA}.uhc_nonus_role_cag_mask_u
( buss_role_id                     INTEGER NOT NULL
, clt_id                           VARCHAR(50) NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, excl_incl_ind                    CHAR(1) NOT NULL
, cag_sk                           BIGINT
, carrier_sk                       BIGINT
, carrier_acct_sk                  BIGINT
, sec_lvl_tpe                      CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

