DROP TABLE ${STAGING_SCHEMA}.f_mpd_monthly_mbrship_detail_i;

CREATE TABLE ${STAGING_SCHEMA}.f_mpd_monthly_mbrship_detail_i
( cag_sk                           BIGINT
, mbr_sk                           BIGINT
, client_nm                        VARCHAR(25)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mbr_fname                        VARCHAR(20)
, mbr_lname                        VARCHAR(25)
, birth_dt                         DATE
, hicn                             VARCHAR(20)
, mbi                              VARCHAR(20)
, adj_start_dt                     DATE
, adj_end_dt                       DATE
, mmr_mnth                         INTEGER
, direct_subsidy_amt               DECIMAL(9,2)
, lips_amt                         DECIMAL(9,2)
, lics_amt                         DECIMAL(9,2)
, reinsurance_amt                  DECIMAL(9,2)
, total_amt                        DECIMAL(9,2)
, payment_mnth_flg                 VARCHAR(5)
, repeat_cnt                       VARCHAR(1)
, pk                               BIGINT
, risk_factor                      DECIMAL(13,5)
, cms_reason_cd                    VARCHAR(20)
, claim_cntr                       INTEGER
, rsp_due_amt                      DECIMAL(15,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

