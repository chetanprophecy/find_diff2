DROP TABLE ${STAGING_SCHEMA}.d_contract_pbp_i;

CREATE TABLE ${STAGING_SCHEMA}.d_contract_pbp_i
( contract_pbp_sk                  BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, contract_no                      VARCHAR(5) NOT NULL
, pbp_id                           VARCHAR(3) NOT NULL
, plan_cd                          VARCHAR(10) NOT NULL
, pdp_from_dt                      DATE NOT NULL
, pdp_thru_dt                      DATE NOT NULL
, sequence_no                      INTEGER NOT NULL
, pdp_status_cd                    CHAR(1) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cpp_pricing_sched_nm             VARCHAR(10)
, segment_id                       VARCHAR(3)
, plan_eff_dt                      DATE
);

