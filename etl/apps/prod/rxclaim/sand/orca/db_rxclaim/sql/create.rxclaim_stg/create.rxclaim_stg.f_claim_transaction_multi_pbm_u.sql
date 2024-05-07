DROP TABLE ${STAGING_SCHEMA}.f_claim_transaction_multi_pbm_u;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_transaction_multi_pbm_u
( claim_nbr                        BIGINT NOT NULL
, claim_nbr_encrp                  BIGINT NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, ext_seq                          INTEGER NOT NULL
, mbr_sk                           BIGINT
, cag_sk                           BIGINT
, carrier_sk                       BIGINT
, prod_sk                          BIGINT
, cob_ind_sk                       BIGINT
, days_of_supply_sk                BIGINT
, srv_prov_id                      VARCHAR(15)
, rx_nbr                           VARCHAR(12)
, fill_nbr                         VARCHAR(2)
, fill_dt_sk                       BIGINT
, fill_dt                          DATE
, lob_cd                           CHAR(1)
, bin_nbr                          VARCHAR(6)
, process_ctrl_nbr                 VARCHAR(10)
, grp_nbr                          VARCHAR(15)
, discnt_card_chid                 VARCHAR(20)
, qty_dispns                       DECIMAL(10,3)
, ver_release_nbr                  VARCHAR(2)
, tran_cd                          VARCHAR(2)
, tran_cnt                         CHAR(1)
, hdr_respn_sts_cd                 CHAR(1)
, srvc_prov_id_qual                VARCHAR(2)
, srvc_prov_id                     VARCHAR(15)
, dt_of_srvc_dt_sk                 BIGINT
, dt_of_srvc                       DATE
, msg                              VARCHAR(200)
, tran_respn_sts_cd                CHAR(1)
, auth_nbr                         VARCHAR(20)
, rejct_cnt                        INTEGER
, rejct_cd1_sk                     BIGINT
, rejct_fld_ocr_ind1               INTEGER
, rejct_cd2_sk                     BIGINT
, rejct_fld_ocr_ind2               INTEGER
, rejct_cd3_sk                     BIGINT
, rejct_fld_ocr_ind3               INTEGER
, rejct_cd4_sk                     BIGINT
, rejct_fld_ocr_ind4               INTEGER
, rejct_cd5_sk                     BIGINT
, rejct_fld_ocr_ind5               INTEGER
, aprv_msg_cd_cnt                  BIGINT
, aprv_msg_cd1_sk                  BIGINT
, aprv_msg_cd2_sk                  BIGINT
, aprv_msg_cd3_sk                  BIGINT
, aprv_msg_cd4_sk                  BIGINT
, aprv_msg_cd5_sk                  BIGINT
, add_msg_info_cnt                 BIGINT
, add_msg_info_qlfr1               VARCHAR(2)
, add_msg_info1                    VARCHAR(40)
, add_msg_info_conti1              CHAR(1)
, add_msg_info_qlfr2               VARCHAR(2)
, add_msg_info2                    VARCHAR(40)
, add_msg_info_conti2              CHAR(1)
, add_msg_info_qlfr3               VARCHAR(2)
, add_msg_info3                    VARCHAR(40)
, add_msg_info_conti3              CHAR(1)
, patient_pay_amt                  DECIMAL(32,8)
, ingrdnt_cost_paid                DECIMAL(32,8)
, dispns_fee_paid                  DECIMAL(32,8)
, tax_exmpt_ind                    CHAR(1)
, flat_sale_tax_amt_paid           DECIMAL(32,8)
, prct_sale_tax_amt_paid           DECIMAL(32,8)
, prct_sale_tax_rate_paid          DECIMAL(32,8)
, prct_sale_tax_bas_paid           VARCHAR(2)
, incntv_amt_paid                  DECIMAL(32,8)
, prof_srvc_fee_paid               DECIMAL(32,8)
, othr_payr_amt_rcnzd              DECIMAL(32,8)
, tot_amt_paid                     DECIMAL(32,8)
, amt_of_copay_co_ins              DECIMAL(32,8)
, amt_of_co_ins                    DECIMAL(32,8)
, grp_id                           VARCHAR(15)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sbm_dt_sk                        BIGINT NOT NULL
, phr_sk                           BIGINT NOT NULL
, extrnl_pbm_list_id_sk            BIGINT NOT NULL
, extrnl_pbm_id_sk                 BIGINT NOT NULL
, claim_cntr                       SMALLINT
, sbm_dt                           DATE NOT NULL
, recent_clm_flg                   CHAR(1)
, sec_flg                          INTEGER
, mbr_crdhldr_id                   VARCHAR(20)
, crdhldr_mbr_first_nm             VARCHAR(12)
, crdhldr_mbr_last_nm              VARCHAR(15)
, crdhldr_mbr_dt_of_brth           DATE
, rx_nbr_encrp                     VARCHAR(12)
)
DISTRIBUTE ON (FILL_DT_SK);

