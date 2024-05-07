DROP TABLE ${STAGING_SCHEMA}.d_contract_pbp_extn_u;

CREATE TABLE ${STAGING_SCHEMA}.d_contract_pbp_extn_u
( contract_pbp_extn_sk             BIGINT NOT NULL
, contract_pbp_sk                  BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, plan_cd                          VARCHAR(10) NOT NULL
, plan_eff_dt                      DATE
, sequence_no                      INTEGER NOT NULL
, pdp_status_cd                    CHAR(1) NOT NULL
, pdp_from_dt                      DATE NOT NULL
, pdp_thru_dt                      DATE NOT NULL
, cpp_pricing_sched_nm             VARCHAR(10)
, contract_no                      VARCHAR(5) NOT NULL
, pbp_id                           VARCHAR(3) NOT NULL
, segment_id                       VARCHAR(3) NOT NULL
, pdp_frmlry_notice_list           VARCHAR(10)
, pdp_copay_coinsur_val1           VARCHAR(10)
, pdp_copay_coinsur_val2           VARCHAR(10)
, pdp_copay_coinsur_val3           VARCHAR(10)
, pdp_thrshld_ctstr_cvg            VARCHAR(10)
, pdp_website_addr                 VARCHAR(60)
, pdp_med_pln_type                 VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

