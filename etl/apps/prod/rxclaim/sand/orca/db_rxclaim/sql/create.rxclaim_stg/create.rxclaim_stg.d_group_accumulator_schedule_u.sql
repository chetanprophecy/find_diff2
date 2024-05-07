DROP TABLE ${STAGING_SCHEMA}.d_group_accumulator_schedule_u;

CREATE TABLE ${STAGING_SCHEMA}.d_group_accumulator_schedule_u
( group_accum_sched_sk             BIGINT
, cag_sk                           BIGINT
, carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, group_sched_id                   VARCHAR(10)
, gas_seq_nbr                      INTEGER
, gas_status                       CHAR(1)
, gas_eff_dt_sk                    BIGINT
, gas_eff_dt                       DATE
, gas_thru_dt_sk                   BIGINT
, gas_thru_dt                      DATE
, ded_sched_sk                     BIGINT
, ded_sched_nm                     VARCHAR(10)
, opp_sched_nm                     VARCHAR(10)
, ben_sched_nm                     VARCHAR(10)
, lftm_ben_max_sched               VARCHAR(10)
, ded_accum_cd                     VARCHAR(10)
, opp_accum_cd                     VARCHAR(10)
, ben_accum_cd                     VARCHAR(10)
, lif_accum_cd                     VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CAG_SK);

