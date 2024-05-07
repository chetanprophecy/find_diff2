DROP TABLE ${STAGING_SCHEMA}.d_product_adjud_i;

CREATE TABLE ${STAGING_SCHEMA}.d_product_adjud_i
( prod_adjud_sk                    BIGINT NOT NULL
, prod_id                          VARCHAR(20)
, prod_id_qlfr                     VARCHAR(2)
, prod_nm                          VARCHAR(70)
, ahfs_cd                          VARCHAR(8)
, drg_3rd_prty_excpn_ind           CHAR(1)
, drg_admin_rte_hitsb_desc         VARCHAR(11)
, drg_clsfctn_cd                   VARCHAR(4)
, drg_dea_cd                       CHAR(1)
, drg_drg_intrctn_desc             VARCHAR(80)
, drg_fda_thrpc_eqvlc_cd           VARCHAR(2)
, drg_grp_cd                       VARCHAR(2)
, drg_lbl_nm                       VARCHAR(30)
, drg_maint_cd                     CHAR(1)
, drg_maint_src                    CHAR(1)
, drg_mfrr_nm                      VARCHAR(10)
, drg_ndc_lblr_cd                  VARCHAR(5)
, drg_ndc_pkg_cd                   VARCHAR(2)
, drg_ndc_prod_cd                  VARCHAR(4)
, drg_ndc_id                       VARCHAR(11)
, drg_rx_otc_ind                   CHAR(1)
, drg_stat_cd                      VARCHAR(13)
, drg_strngth_qty                  DECIMAL(11,3)
, drg_strngth_uom_cd               VARCHAR(10)
, drg_sub_class_cd                 VARCHAR(6)
, drg_unit_dose_use_ind            CHAR(1)
, gcn_no                           INTEGER
, gcn_seq_no                       INTEGER
, gen_nm                           VARCHAR(60)
, gen_medspn_ind                   CHAR(1)
, gen_ind_ovrd_ind                 CHAR(1)
, gpi_list_qlfr_nm                 VARCHAR(10)
, gpi_no                           VARCHAR(14)
, drg_grp_gpi_02_cd                VARCHAR(2)
, drg_class_gpi_04_cd              VARCHAR(4)
, drg_sub_class_gpi_06_cd          VARCHAR(6)
, drg_bsic_nm_gpi_08_cd            VARCHAR(8)
, drg_extd_nm_gpi_10_cd            VARCHAR(10)
, drg_dosag_frm_gpi_12_cd          VARCHAR(12)
, dsg_frm_id                       VARCHAR(4)
, dise_cat_sk                      BIGINT NOT NULL
, dise_cat_nm                      VARCHAR(80) NOT NULL
, thrpc_class_sk                   BIGINT NOT NULL
, thrpc_class_nm                   VARCHAR(80) NOT NULL
, wac_amt                          DECIMAL(13,5)
, wkrs_comp_alt_prod_cd            VARCHAR(13)
, wkrs_comp_alt_prod_typ_cd        CHAR(1)
, prod_pref_list_id                VARCHAR(10)
, admin_rte_cd                     VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, prod_status_rule_tbl_id_sk       BIGINT
, drg_ldd_ind                      VARCHAR(1)
, drg_biosim_ind                   VARCHAR(1)
, sec_flg                          SMALLINT
)
DISTRIBUTE ON (PROD_ADJUD_SK);

