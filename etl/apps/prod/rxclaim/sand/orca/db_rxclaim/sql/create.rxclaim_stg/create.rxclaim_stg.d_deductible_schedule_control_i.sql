DROP TABLE ${STAGING_SCHEMA}.d_deductible_schedule_control_i;

CREATE TABLE ${STAGING_SCHEMA}.d_deductible_schedule_control_i
( ded_sched_sk                     BIGINT
, ded_sched_nm                     VARCHAR(10)
, pln_sk                           BIGINT
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, pln_eff_dt_sk                    BIGINT
, ded_basis                        CHAR(1)
, ded_desc                         VARCHAR(40)
, ded_step_cnt                     SMALLINT
, dsc_mbr_eff_dt_swtch_cd          CHAR(1)
, dsc_mbr_thru_dt_swtch_cd         CHAR(1)
, dsc_mbr_thru_days_add            INTEGER
, dsc_mbr_eff_dt                   DATE
, dsc_mbr_eff_dt_sk                BIGINT
, dsc_mbr_thru_dt                  DATE
, dsc_mbr_thru_dt_sk               BIGINT
, dsc_disp_out_dated_rcds_cd       CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DED_SCHED_SK);

