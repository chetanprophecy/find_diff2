DROP TABLE ${STAGING_SCHEMA}.l_troop_sched_ctl_i;

CREATE TABLE ${STAGING_SCHEMA}.l_troop_sched_ctl_i
( troop_sched_sk                   BIGINT NOT NULL
, sched_nm                         VARCHAR(10)
, sched_desc                       VARCHAR(25)
, step_cnt_nbr                     SMALLINT
, troop_accum_comp_cd              VARCHAR(2)
, drg_spnd_accum_comp_cd           VARCHAR(2)
, cross_over_flg_cd                VARCHAR(2)
, display_rec_flg                  VARCHAR(1)
, cov_gap_calc_ind                 VARCHAR(1)
, generic_ded_skip_ind             VARCHAR(1)
, src_add_dttm                     TIMESTAMP
, src_chg_dttm                     TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

