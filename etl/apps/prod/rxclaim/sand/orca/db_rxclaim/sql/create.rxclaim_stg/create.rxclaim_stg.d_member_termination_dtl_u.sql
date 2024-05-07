DROP TABLE ${STAGING_SCHEMA}.d_member_termination_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_termination_dtl_u
( mbr_term_dtl_sk                  BIGINT NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mtn_seq_nbr                      DECIMAL(3)
, mtn_term_reason                  VARCHAR(2)
, mtn_term_dt                      DATE
, mtn_status                       CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

