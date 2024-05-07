DROP TABLE ${STAGING_SCHEMA}.d_pref_frmlry_gpi_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pref_frmlry_gpi_dtl_u
( pref_frmlry_gpi_dtl_sk           BIGINT NOT NULL
, gpi_list_nm                      VARCHAR(10)
, gpi_no                           VARCHAR(14)
, gpi_multi_source_cd              CHAR(1)
, drug_rx_otc_ind                  CHAR(1)
, gpi_sk                           BIGINT NOT NULL
, gnrc_mdspn_ind_sk                BIGINT NOT NULL
, drug_rx_otc_ind_sk               BIGINT NOT NULL
, generic_nm                       VARCHAR(60)
, frmlry_gpi_dtl_curr_start_dt_sk  BIGINT NOT NULL
, frmlry_gpi_dtl_curr_start_dt     DATE
, frmlry_gpi_dtl_curr_end_dt_sk    BIGINT NOT NULL
, frmlry_gpi_dtl_curr_end_dt       DATE
, curr_pln_drg_stat_sk             BIGINT NOT NULL
, curr_pln_drg_stat_cd             CHAR(1)
, curr_msg_cd                      VARCHAR(10)
, price_schedule_nm                VARCHAR(10)
, cur_clt_price_sched              VARCHAR(10)
, curr_phr_pat_pay                 VARCHAR(10)
, curr_clt_pat_pay                 VARCHAR(10)
, prev_start_dt_sk                 BIGINT NOT NULL
, prev_start_dt                    DATE
, prev_end_dt_sk                   BIGINT NOT NULL
, prev_end_dt                      DATE
, prev_pln_drg_stat_cd_sk          BIGINT NOT NULL
, prev_pln_drg_stat_cd             CHAR(1)
, bsc_sched_nm                     VARCHAR(10)
, cur_benefit_max                  VARCHAR(10)
, dsc_sched_nm                     VARCHAR(10)
, cur_deduct_accum                 VARCHAR(10)
, opc_sched_nm                     VARCHAR(10)
, cur_oop_accum                    VARCHAR(10)
, cur_lifetime_sched               VARCHAR(10)
, cur_lifetime_accum               VARCHAR(10)
, benefit_reset                    CHAR(1)
, phr_pref_srv_fee                 VARCHAR(10)
, clt_pref_srv_fee                 VARCHAR(10)
, drg_status_sk                    BIGINT NOT NULL
, drg_status_id                    VARCHAR(13)
, troop_sched_ovrd                 VARCHAR(10)
, egwp_troop_ovrd                  VARCHAR(10)
, neg_chg_opt                      CHAR(1)
, reg_cd_remap                     VARCHAR(10)
, csr_accum_ded_sched              VARCHAR(15)
, csr_accum_oop_sched              VARCHAR(15)
, dgl_diagnosis_list               VARCHAR(6)
, diagnosys_list_qual              VARCHAR(1)
, phn_phr_ntwk_id                  VARCHAR(6)
, phn_seq_nbr                      INTEGER
, phr_ntwk_list_qlfr               CHAR(1)
, super_ntwk_id                    VARCHAR(6)
, snh_seq_nbr                      INTEGER
, fgd_supr_ntwk_qlfr               CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PREF_FRMLRY_GPI_DTL_SK);

