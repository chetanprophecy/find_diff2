DROP TABLE ${STAGING_SCHEMA}.d_mmd_member_eligibility_u;

CREATE TABLE ${STAGING_SCHEMA}.d_mmd_member_eligibility_u
( mbr_mmd_sk                       BIGINT
, mbr_sk                           BIGINT
, subsidy_lvl_sk                   BIGINT
, cag_sk                           BIGINT
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mmd_seq_nbr                      INTEGER
, mmd_record_status                CHAR(1)
, mmd_from_dt                      DATE
, mmd_thru_dt                      DATE
, mmd_contract_id                  VARCHAR(5)
, mmd_pbp_id                       VARCHAR(3)
, mmd_segment_id                   VARCHAR(3)
, mmd_subsidy_lvl                  VARCHAR(3)
, mmd_copay_category               CHAR(1)
, mmd_copay_catg_eff_td            DATE
, mmd_enrlmnt_src                  CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

