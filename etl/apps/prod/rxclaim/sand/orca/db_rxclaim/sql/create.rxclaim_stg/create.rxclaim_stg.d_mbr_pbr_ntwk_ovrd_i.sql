DROP TABLE ${STAGING_SCHEMA}.d_mbr_pbr_ntwk_ovrd_i;

CREATE TABLE ${STAGING_SCHEMA}.d_mbr_pbr_ntwk_ovrd_i
( mbr_ntwk_ovrd_sk                 BIGINT NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, ntwk_sk                          BIGINT
, seq_nbr                          INTEGER
, stat_cd                          CHAR(1)
, eff_frm_dt                       DATE
, eff_thru_dt                      DATE
, copay_sched_nm                   VARCHAR(10)
, copay_sched_step_nbr             SMALLINT
, clt_prc_sched_ovrd_nm            VARCHAR(10)
, phr_prc_sched_ovrd_nm            VARCHAR(10)
, clt_pat_pay_ovrd_cd              VARCHAR(10)
, phr_pat_pay_ovrd_cd              VARCHAR(10)
, msg_cd                           VARCHAR(10)
, msg_typ_cd                       CHAR(1)
, ntwk_ovrd_qlfr_cd                CHAR(1)
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

