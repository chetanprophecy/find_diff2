DROP TABLE ${STAGING_SCHEMA}.d_mpa_audit_u;

CREATE TABLE ${STAGING_SCHEMA}.d_mpa_audit_u
( mpa_sk                           BIGINT NOT NULL
, mpa_audit_seq_nbr                INTEGER
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, mpa_audit_dtl_cd                 VARCHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, prior_auth_nbr                   VARCHAR(11)
, chg_dt                           DATE
, chg_ts                           TIMESTAMP
, chg_uid                          VARCHAR(20)
, mpa_audit_sk                     BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
);

