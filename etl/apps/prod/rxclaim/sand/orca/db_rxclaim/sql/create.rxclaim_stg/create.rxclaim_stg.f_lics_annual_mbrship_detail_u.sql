DROP TABLE ${STAGING_SCHEMA}.f_lics_annual_mbrship_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.f_lics_annual_mbrship_detail_u
( cag_sk                           BIGINT
, mbr_sk                           BIGINT
, client_nm                        VARCHAR(25)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, group_id                         VARCHAR(30)
, mbr_id                           VARCHAR(20)
, perd_start_dt                    DATE
, perd_end_dt                      DATE
, rec_id                           VARCHAR(20)
, seq_nbr                          INTEGER
, hicn                             VARCHAR(20)
, mbi                              VARCHAR(20)
, tot_actual_lics_subsidy_amt      DECIMAL(15,2)
, curr_reinsurance_subsidy_adj_amt DECIMAL(15,2)
, tot_pay                          DECIMAL(15,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

