DROP TABLE ${STAGING_SCHEMA}.d_product_i;

CREATE TABLE ${STAGING_SCHEMA}.d_product_i
( prod_sk                          BIGINT NOT NULL
, prod_id                          VARCHAR(20) NOT NULL
, prod_id_qlfr_cd                  VARCHAR(2)
, prod_nm                          VARCHAR(70)
, ahfs_cd                          VARCHAR(8)
, drg_3rd_prty_excpn_ind           CHAR(1)
, drg_clsfctn_cd                   VARCHAR(4)
, drg_dea_cd                       CHAR(1)
, drg_drg_intrctn_desc             VARCHAR(80)
, drg_fda_thrpc_eqvlc_cd           VARCHAR(2)
, drg_grp_cd                       VARCHAR(2)
, drg_lbl_nm                       VARCHAR(30)
, drg_maint_ind                    CHAR(1)
, drg_multi_src_cd                 CHAR(1)
, drg_mfrr_nm                      VARCHAR(10)
, drg_ndc_lblr_cd                  VARCHAR(5)
, drg_ndc_pkg_cd                   VARCHAR(2)
, drg_ndc_prod_cd                  VARCHAR(4)
, drg_ndc_desc                     VARCHAR(11)
, drg_rx_otc_ind                   CHAR(1)
, drg_stat_cd                      VARCHAR(13)
, drg_strngth_qty                  DECIMAL(11,3)
, drg_strngth_uom_cd               VARCHAR(10)
, drg_sub_class_cd                 VARCHAR(6)
, drg_unit_dose_use_ind            CHAR(1)
, gcn_no                           INTEGER
, gcn_seq_no                       INTEGER
, gnrc_mdspn_ind                   CHAR(1) NOT NULL
, gnrc_mdspn_ind_nm                VARCHAR(50) NOT NULL
, gnrc_nm                          VARCHAR(60)
, gpi_sk                           BIGINT NOT NULL
, gpi_no                           VARCHAR(14)
, drg_grp_gpi_02_cd                VARCHAR(2)
, drg_grp_nm                       VARCHAR(40)
, drg_class_gpi_04_cd              VARCHAR(4)
, drg_class_nm                     VARCHAR(50)
, drg_sub_class_gpi_06_cd          VARCHAR(6)
, drg_sub_class_nm                 VARCHAR(60)
, drg_bsic_nm_gpi_08_cd            VARCHAR(8)
, drg_bsic_nm                      VARCHAR(70)
, drg_extd_nm_gpi_10_cd            VARCHAR(10)
, drg_extd_nm                      VARCHAR(70)
, drg_dosag_frm_gpi_12_cd          VARCHAR(12)
, drg_dosag_frm_id                 VARCHAR(4)
, dise_cat_sk                      BIGINT NOT NULL
, dise_cat_nm                      VARCHAR(80) NOT NULL
, thrpc_class_sk                   BIGINT NOT NULL
, thrpc_class_nm                   VARCHAR(80) NOT NULL
, admin_route_cd                   VARCHAR(2)
, ahfs_desc                        VARCHAR(80)
, fdb_gcn_cd                       VARCHAR(5)
, fdb_gcn_seq_no                   INTEGER
, etc_id_fpe_desc                  VARCHAR(8)
, dflt_etc_id_fpe_desc             VARCHAR(8)
, fdb_hicl_seq_no                  INTEGER
, fdb_hic3_seq_no                  INTEGER
, fdb_hic3_cd                      VARCHAR(3)
, fdb_gen_prc_ind                  CHAR(1)
, fdb_invtr_ind                    CHAR(1)
, fdb_maint_drg_ind                CHAR(1)
, fdb_expndd_orng_bk_cd            VARCHAR(2)
, fdb_gen_prc_spred_ind            CHAR(1)
, fdb_gen_thrpc_drg_ind            CHAR(1)
, fdb_gen_ind_ndc_lvl_ind          CHAR(1)
, brnd_nm_typ_cd                   CHAR(1)
, spclty_prod_corp_ind             CHAR(1)
, spclty_prod_corp_nm              VARCHAR(35)
, package_size_uom_cd              VARCHAR(2) NOT NULL
, package_qty                      INTEGER NOT NULL
, package_size                     DECIMAL(9,3) NOT NULL
, total_package_qty                DECIMAL(13,3) NOT NULL
, prd_repackage_ind                CHAR(1) NOT NULL
, prd_user_defined_field_1_txt     VARCHAR(6) NOT NULL
, prd_user_defined_field_2_txt     VARCHAR(6) NOT NULL
, prd_user_defined_field_3_txt     VARCHAR(8) NOT NULL
, drug_efficacy_impl_cd            CHAR(1) NOT NULL
, fda_app_type_nda_flg             CHAR(1) NOT NULL
, fda_app_type_anda_flg            CHAR(1) NOT NULL
, fda_app_type_bla_flg             CHAR(1) NOT NULL
, drg_ndc_short_id                 VARCHAR(9) NOT NULL
, drg_ndc_short_nm                 VARCHAR(25) NOT NULL
, drg_ndc_eff_dt                   DATE NOT NULL
, drg_ndc_term_dt                  DATE NOT NULL
, current_flg                      CHAR(1) NOT NULL
, rec_rank_no                      INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, limited_dist                     VARCHAR(2)
, awp_ind                          CHAR(1)
, kdc                              BIGINT
, mfr_id                           VARCHAR(5)
, ndc_small_pkg                    VARCHAR(2)
, ndc_large_pkg                    VARCHAR(2)
, prod_key                         INTEGER
, gppc_id                          VARCHAR(10)
, intl_extr_ind                    CHAR(1)
, lblr_type                        CHAR(1)
, pricing_sprd                     CHAR(1)
, reimbursment_ind                 CHAR(1)
, origin_cd                        CHAR(1)
, prd_inactive_dt                  DATE
, local_systemic_ind               CHAR(1)
, dispensing_unit                  CHAR(1)
, single_comb_ind                  CHAR(1)
, innerpack_cd                     CHAR(1)
, clinic_pack_cd                   CHAR(1)
, ftc_thera_class_cd               VARCHAR(2)
, ftc_thera_class_nm               VARCHAR(50)
, fdb_hic3_desc                    VARCHAR(100)
, mfg_nm_complete                  VARCHAR(25)
, mfg_ndc_lblr_id                  VARCHAR(5)
, optum_msc_override               CHAR(1)
, prd_add_dt                       DATE
, prd_add_dt_sk                    BIGINT
, prd_chg_dt                       DATE
, prd_chg_dt_sk                    BIGINT
, drg_dosag_frm_nm                 VARCHAR(70)
, drg_ldd_ind                      VARCHAR(1)
, drg_biosim_ind                   VARCHAR(1)
, sec_flg                          SMALLINT
, drg_app_mkt_catgy_cd             VARCHAR(2)
)
DISTRIBUTE ON (PROD_SK);

