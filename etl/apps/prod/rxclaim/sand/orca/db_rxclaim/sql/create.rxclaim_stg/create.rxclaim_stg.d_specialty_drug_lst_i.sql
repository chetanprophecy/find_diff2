DROP TABLE ${STAGING_SCHEMA}.d_specialty_drug_lst_i;

CREATE TABLE ${STAGING_SCHEMA}.d_specialty_drug_lst_i
( spclty_drug_lst_sk               BIGINT NOT NULL
, gpi_sk                           BIGINT NOT NULL
, prod_sk                          BIGINT NOT NULL
, gpi_id                           VARCHAR(14)
, gpi_nm                           VARCHAR(70)
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, prod_nm                          VARCHAR(70)
, drg_stat_cd                      VARCHAR(13)
, drg_mfrr_nm                      VARCHAR(25)
, drg_lbl_nm                       VARCHAR(30)
, short_lbl_nm                     VARCHAR(25)
, mbr_drg_cls                      VARCHAR(30)
, injectable_ind                   CHAR(1)
, admin_rte_id                     VARCHAR(2)
, admin_rte_desc                   VARCHAR(50)
, drg_dosag_frm_id                 VARCHAR(4)
, gnrc_mdspn_ind                   CHAR(1)
, gnrc_mdspn_ind_sk                BIGINT NOT NULL
, splty_ind                        BYTEINT
, lock_drug_cd                     VARCHAR(10)
, lock_exclsn_rsn                  VARCHAR(40)
, med_exclsn_drg_ind               BYTEINT
, drg_pref_co_pay_card_acpt_pgm    VARCHAR(50)
, drg_split_fil_ind                BYTEINT
, drg_90_day_ind                   BYTEINT
, unbreakable_pkg_cd               VARCHAR(10)
, drg_cciio_cd                     VARCHAR(10)
, biosimilar_drg_ind               BYTEINT
, mstr_drg_list_eff_dt_sk          BIGINT NOT NULL
, mstr_drg_list_term_dt_sk         BIGINT NOT NULL
, pa_ind                           BYTEINT
, utlzn_mngmt_ind                  BYTEINT
, utlzn_mngmt_note                 VARCHAR(200)
, drg_code_lvl                     VARCHAR(10)
, rems_ind                         BYTEINT
, pref_or_formulary_drg            VARCHAR(50)
, tier_level                       INTEGER
, future_tier_level                INTEGER
, future_tier_eff_dt_sk            BIGINT
, med_bill_code_1                  VARCHAR(10)
, med_bill_code_2                  VARCHAR(10)
, med_bill_code_3                  VARCHAR(10)
, drg_storg_cond                   VARCHAR(6)
, admin_loc                        VARCHAR(5)
, mrkt_trgt_lst                    VARCHAR(10)
, mrkt_exclsn_rsn                  VARCHAR(50)
, sporal_ind                       BYTEINT
, spinject_ind                     BYTEINT
, sporalrl_ind                     BYTEINT
, spinjrl_ind                      BYTEINT
, sporalldd_ind                    BYTEINT
, spinjldd_ind                     BYTEINT
, sporalpa_1_ind                   BYTEINT
, spinjpa_1_ind                    BYTEINT
, phr_briova_acss_cd               VARCHAR(10)
, briova_infusion_srvc_acss_cd     VARCHAR(10)
, avella_acss_cd                   VARCHAR(10)
, drg_limit_distrb_cd              VARCHAR(10)
, ops_triage_team                  VARCHAR(60)
, vendor_1                         VARCHAR(60)
, vendor_2                         VARCHAR(60)
, vendor_3                         VARCHAR(60)
, vendor_4                         VARCHAR(60)
, vendor_5                         VARCHAR(60)
, vendor_6                         VARCHAR(60)
, vendor_7                         VARCHAR(60)
, drg_note                         VARCHAR(200)
, drg_ndc_eff_dt_sk                BIGINT NOT NULL
, drg_ndc_term_dt_sk               BIGINT NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, formulary_stat                   CHAR(3)
)
DISTRIBUTE ON (SPCLTY_DRUG_LST_SK);

