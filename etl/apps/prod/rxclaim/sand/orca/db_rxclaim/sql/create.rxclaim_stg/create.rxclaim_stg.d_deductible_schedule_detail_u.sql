DROP TABLE ${STAGING_SCHEMA}.d_deductible_schedule_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_deductible_schedule_detail_u
( ded_sched_dtl_sk                 BIGINT
, ded_sched_sk                     BIGINT
, ded_sched_nm                     VARCHAR(10)
, ded_step_nbr                     SMALLINT
, pln_sk                           BIGINT
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, pln_eff_dt_sk                    BIGINT
, ded_accum_cmpnt_cd               CHAR(1)
, dsd_mbr_ded_amt                  DECIMAL(11,2)
, dsd_family_ded_amt               DECIMAL(11,2)
, crdhldr_1_ded_amt_limit          DECIMAL(11,2)
, crdhldr_2_ded_amt_limit          DECIMAL(11,2)
, crdhldr_and_spouse_ded_amt_limit DECIMAL(11,2)
, crdhldr_and_dependent_ded_amt_limit DECIMAL(11,2)
, mbr_and_dependent_ded_amt_limt   DECIMAL(11,2)
, spouse_ded_amt_limit             DECIMAL(11,2)
, spouse_and_dependent_ded_amt_limit DECIMAL(11,2)
, dependent_ded_amt_limt           DECIMAL(11,2)
, price_tbl_flag                   CHAR(1)
, brand_copay_amt                  DECIMAL(9,2)
, gen_copay_amt                    DECIMAL(9,2)
, brand_perct_amt                  DECIMAL(7,2)
, gen_perct_amt                    DECIMAL(7,2)
, dsd_copay_sched_ovrd             CHAR(1)
, dsd_perct_basis                  VARCHAR(2)
, dsd_copay_ded_flag               CHAR(1)
, dsd_cross_over_flag              CHAR(1)
, dsd_msg_cd                       VARCHAR(10)
, dsd_msg_type                     CHAR(1)
, dsd_send_flag                    CHAR(1)
, int_pharm_med_app_amt_ind        CHAR(1)
, dsd_accum_w_mad_ts_ind           CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DED_SCHED_SK);

