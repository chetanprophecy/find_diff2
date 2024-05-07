DROP TABLE ${STAGING_SCHEMA}.d_out_pkt_max_sched_ctrl_i;

CREATE TABLE ${STAGING_SCHEMA}.d_out_pkt_max_sched_ctrl_i
( opc_max_sched_ctrl_sk            BIGINT NOT NULL
, pln_sk                           BIGINT NOT NULL
, opc_sched_nm                     VARCHAR(10) NOT NULL
, opc_bas_cd                       CHAR(1)
, opc_sched_desc                   VARCHAR(40)
, opc_step_cnt                     SMALLINT
, opc_mbr_from_dt_swtch_cd         CHAR(1)
, opc_mbr_thru_dt_swtch_cd         CHAR(1)
, opc_mbr_thru_day_added           INTEGER
, opc_mbr_from_dt                  DATE
, opc_mbr_thru_dt                  DATE
, opc_displ_outdated_rec_cd        CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (OPC_MAX_SCHED_CTRL_SK);

