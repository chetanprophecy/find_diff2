DROP TABLE ${STAGING_SCHEMA}.a_mpd_monthly_mbrship_summary_u;

CREATE TABLE ${STAGING_SCHEMA}.a_mpd_monthly_mbrship_summary_u
( mmr_sum_sk                       BIGINT
, carrier_id                       VARCHAR(10)
, adj_start_dt                     DATE
, adj_end_dt                       DATE
, mmr_mnth                         INTEGER
, education_fee_amt                DECIMAL(14,2)
, cob                              DECIMAL(14,2)
, sequest_adj_amt                  DECIMAL(14,2)
, late_penalty_amt                 DECIMAL(14,2)
, total_amt                        DECIMAL(14,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

