DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_u
( phr_sk                           BIGINT NOT NULL
, phr_afflt_sk                     BIGINT NOT NULL
, phr_pmt_cntr_sk                  BIGINT NOT NULL
, phr_dispnsr_class_sk             BIGINT NOT NULL
, phr_dispnsr_type_sk              BIGINT NOT NULL
, phr_id                           VARCHAR(12) NOT NULL
, phr_ncpdp_id                     VARCHAR(12)
, phr_npi_no                       VARCHAR(10)
, phr_nm                           VARCHAR(60)
, phr_legal_nm                     VARCHAR(60) NOT NULL
, phr_affl_cd                      VARCHAR(6)
, phr_affl_nm                      VARCHAR(35)
, phr_afflt_grp_id                 INTEGER NOT NULL
, phr_afflt_grp_desc               VARCHAR(100) NOT NULL
, phr_pmt_centr_nm                 VARCHAR(12)
, phr_store_no                     VARCHAR(10)
, phr_addr1_txt                    VARCHAR(55)
, phr_addr2_txt                    VARCHAR(55)
, phr_rgn_nm                       VARCHAR(10)
, phr_city_nm                      VARCHAR(30)
, phr_st_cd                        VARCHAR(3)
, phr_zip_cd                       VARCHAR(15)
, phr_zip2_cd                      VARCHAR(4)
, phr_zip3_cd                      VARCHAR(2)
, phr_cntry_cd                     VARCHAR(4)
, phr_cnty_nm                      VARCHAR(30)
, phr_mail_addr1_txt               VARCHAR(55)
, phr_mail_addr2_txt               VARCHAR(55)
, phr_mail_city_nm                 VARCHAR(30)
, phr_mail_st_cd                   VARCHAR(2)
, phr_mail_zip1_cd                 VARCHAR(5)
, phr_mail_zip2_cd                 VARCHAR(4)
, phr_mail_zip3_cd                 VARCHAR(2)
, phr_phone_no                     BIGINT
, phr_fax_phone                    BIGINT
, phr_dea_rgstrtn_id               VARCHAR(12) NOT NULL
, dispr_clsfctn_cd                 VARCHAR(3)
, dispr_typ_cd                     VARCHAR(3)
, dispr_typ2_cd                    VARCHAR(3)
, dispr_typ3_cd                    VARCHAR(3)
, phr_dispnsr_class_desc           VARCHAR(50) NOT NULL
, phr_dispnsr_type_desc            VARCHAR(50) NOT NULL
, affl_from_dt                     DATE
, pay_centr_from_dt                DATE
, phr_thru_dt                      DATE NOT NULL
, eft_rtg_addr_txt                 VARCHAR(9)
, fed_lic_no                       VARCHAR(12)
, fed_tax_id                       VARCHAR(15)
, st_lic_no                        VARCHAR(20)
, st_tax_id                        VARCHAR(15)
, mcd_id                           VARCHAR(20)
, phr_24_hour_flg                  CHAR(1)
, stat_ind                         CHAR(1)
, hold_typ_ind                     CHAR(1)
, ntwrk_usag_cnt                   SMALLINT
, loc_msa_cd                       VARCHAR(4)
, loc_psma_cd                      VARCHAR(4)
, cngrsnl_dstrct_cd                VARCHAR(4)
, ncpdp_ld_flg                     CHAR(1)
, acpts_e_pbng_ind                 CHAR(1)
, dlvry_srvc_ind                   CHAR(1)
, cmpdg_svc_flg                    CHAR(1)
, drv_up_wndw_flg                  CHAR(1)
, drbl_med_eqp_flg                 CHAR(1)
, hndcp_accs_flg                   CHAR(1)
, lang1_cd                         VARCHAR(2)
, lang2_cd                         VARCHAR(2)
, lang3_cd                         VARCHAR(2)
, lang4_cd                         VARCHAR(2)
, lang5_cd                         VARCHAR(2)
, phr_cntct_extn_no                VARCHAR(5) NOT NULL
, phr_cntct_nm                     VARCHAR(40) NOT NULL
, phr_cntct_email_txt              VARCHAR(80) NOT NULL
, phr_cntct_phn_no                 VARCHAR(13) NOT NULL
, phr_cntct_title_nm               VARCHAR(30) NOT NULL
, upin_mcre_prv_id                 VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, phr_from_dt                      DATE
, phr_full_nm                      VARCHAR(60)
, phr_street_directions            VARCHAR(50)
, phr_mail_country                 VARCHAR(4)
, phr_phn_ext                      VARCHAR(5)
, phr_emerg_phn                    VARCHAR(10)
, phr_emerg_ext                    VARCHAR(5)
, phr_dispns_ind                   CHAR(1)
, dlvry_chanl                      VARCHAR(25)
, phr_acqstn_dt                    DATE
, phr_acqstn_dt_sk                 BIGINT
, phr_disps_dt                     DATE
, phr_disps_dt_sk                  BIGINT
)
DISTRIBUTE ON (PHR_SK);

