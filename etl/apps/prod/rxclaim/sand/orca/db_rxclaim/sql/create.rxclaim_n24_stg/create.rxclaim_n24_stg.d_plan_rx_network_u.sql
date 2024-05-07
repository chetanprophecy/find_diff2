DROP TABLE ${STAGING_SCHEMA}.d_plan_rx_network_u;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_rx_network_u
( prx_plan_rx_nw_sk                BIGINT NOT NULL
, pln_cd                           VARCHAR(10)
, pln_sk                           BIGINT NOT NULL
, pln_eff_dt                       DATE
, pln_nw_type                      VARCHAR(2)
, phn_phr_nw_id                    VARCHAR(6)
, phn_seq_nbr                      INTEGER
, prx_seq_nbr                      INTEGER
, car_carrier_id                   VARCHAR(15)
, reg_region_cd                    VARCHAR(10)
, prx_sts                          CHAR(1)
, prx_from_dt                      DATE
, prx_thru_dt                      DATE
, prx_nw_sts                       CHAR(1)
, prx_phr_ntwk_priority            CHAR(1)
, prx_user_seq                     INTEGER
, prx_nw_qlfr                      CHAR(1)
, prx_process_qlfr                 CHAR(1)
, prx_group_renew_ben              CHAR(1)
, prx_msg_cd                       VARCHAR(10)
, prx_msg_type                     CHAR(1)
, prx_cal_nw_match                 CHAR(1)
, prx_cal_msg_type                 CHAR(1)
, prx_cal_msg_cd                   VARCHAR(10)
, prx_pln_cal_id                   VARCHAR(15)
, prx_pln_holiday_cal_id           VARCHAR(15)
, prx_dispenser_class              CHAR(1)
, prx_primary_dispenser_typ        CHAR(1)
, prx_pref_nw                      CHAR(1)
, prx_ceiling_prc_ndc_list         VARCHAR(10)
, prx_vacc_admn_fee_tbl_nm         VARCHAR(10)
, prx_ref_ntwk_ndc_gpi_list        CHAR(1)
, prx_partb_nw_flg                 CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PRX_PLAN_RX_NW_SK);

