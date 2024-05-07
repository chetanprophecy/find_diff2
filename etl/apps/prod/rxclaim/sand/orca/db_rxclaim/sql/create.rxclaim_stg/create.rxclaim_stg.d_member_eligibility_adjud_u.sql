DROP TABLE ${STAGING_SCHEMA}.d_member_eligibility_adjud_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_eligibility_adjud_u
( mbr_eligty_adjud_sk              BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, clt_prod_cd                      VARCHAR(6)
, clt_rdr_cd                       VARCHAR(6)
, pln_cd                           VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mbr_sk                           BIGINT
, orig_mbr_sk                      BIGINT NOT NULL
, orig_cag_sk                      BIGINT NOT NULL
, orig_carrier_id                  VARCHAR(30)
, orig_account_id                  VARCHAR(40)
, orig_employer_group_id           VARCHAR(30)
, orig_mbr_id                      VARCHAR(20)
)
DISTRIBUTE ON (MBR_SK);

