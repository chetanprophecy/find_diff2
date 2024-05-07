DROP TABLE ${STAGING_SCHEMA}.d_member_move_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_move_xref_i
( mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, new_mbr_sk                       BIGINT NOT NULL
, new_cag_sk                       BIGINT
, new_carrier_id                   VARCHAR(30)
, new_account_id                   VARCHAR(40)
, new_employer_group_id            VARCHAR(30)
, new_mbr_id                       VARCHAR(20)
, mbr_first_nm                     VARCHAR(30)
, mbr_last_nm                      VARCHAR(50)
, mbr_mid_init_nm                  CHAR(1)
, mbr_dt_of_brth                   DATE
, mbr_prsn_cd                      VARCHAR(6)
, new_mbr_prsn_cd                  VARCHAR(6)
, mbr_move_eff_dt                  DATE
, mbr_move_req_dt                  DATE
, mbr_move_file_nm                 VARCHAR(40)
, mbr_move_flg                     CHAR(1)
, curr_mbr_sk                      BIGINT NOT NULL
, curr_cag_sk                      BIGINT
, curr_carrier_id                  VARCHAR(30)
, curr_account_id                  VARCHAR(40)
, curr_employer_group_id           VARCHAR(30)
, curr_mbr_id                      VARCHAR(20)
, curr_carrier_sk                  BIGINT
, curr_carrier_acct_sk             BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

