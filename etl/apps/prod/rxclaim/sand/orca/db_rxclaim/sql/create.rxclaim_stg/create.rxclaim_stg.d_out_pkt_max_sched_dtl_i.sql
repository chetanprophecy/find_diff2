DROP TABLE ${STAGING_SCHEMA}.d_out_pkt_max_sched_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.d_out_pkt_max_sched_dtl_i
( out_max_sched_dtl_sk             BIGINT NOT NULL
, pln_sk                           BIGINT NOT NULL
, opc_max_sched_ctrl_sk            BIGINT NOT NULL
, opc_sched_nm                     VARCHAR(10) NOT NULL
, step_seq_cnt                     SMALLINT NOT NULL
, accum_cmpnt_cd                   CHAR(1)
, mbr_oop_max_amt                  DECIMAL(9,2)
, fam_oop_max_amt                  DECIMAL(9,2)
, oop_crdhldr_plus_1_depn_max_amt  DECIMAL(9,2)
, oop_crdhldr_plus_2_depn_max_amt  DECIMAL(9,2)
, oop_crdhldr_plus_spouse_max_amt  DECIMAL(9,2)
, oop_crdhldr_plus_depn_max_amt    DECIMAL(9,2)
, oop_mbr_plus_1_depn_max_amt      DECIMAL(9,2)
, oop_spouse_max_amt               DECIMAL(9,2)
, oop_spouse_depn_max_amt          DECIMAL(9,2)
, oop_depn_max_amt                 DECIMAL(9,2)
, price_tbl_flg                    CHAR(1)
, brand_copay_amt                  DECIMAL(7,2)
, genric_copay_amt                 DECIMAL(7,2)
, brand_perct_amt                  DECIMAL(5,2)
, genric_perct_amt                 DECIMAL(5,2)
, copay_sched_ovrd                 CHAR(1)
, perct_bas_cd                     VARCHAR(2)
, copay_ded_flg                    CHAR(1)
, cross_over_cd                    CHAR(1)
, phr_patient_pay_sched_id         VARCHAR(10)
, client_patient_pay_sched_id      VARCHAR(10)
, send_flg                         CHAR(1)
, integration_phr_med_cd           CHAR(1)
, accum_mad_tmstp_flg              CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (OUT_MAX_SCHED_DTL_SK);

