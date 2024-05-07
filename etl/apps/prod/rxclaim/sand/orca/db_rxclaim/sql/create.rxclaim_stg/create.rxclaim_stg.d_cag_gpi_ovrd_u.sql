DROP TABLE ${STAGING_SCHEMA}.d_cag_gpi_ovrd_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_gpi_ovrd_u
( cag_gpi_ovrd_sk                  BIGINT
, gpi_id                           VARCHAR(14)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, seq_nbr                          INTEGER
, drg_multi_src_cd                 CHAR(1)
, drg_multi_src_cd_qlfr            CHAR(1)
, drg_rx_otc_ind                   CHAR(1)
, drg_rx_otc_ind_qlfr              CHAR(1)
, drg_3rd_prty_excpn_ind           CHAR(1)
, drg_3rd_prty_excpn_ind_qlfr      CHAR(1)
, drg_dea_cd                       CHAR(1)
, drg_dea_cd_qlfr                  CHAR(1)
, admin_rte_id                     VARCHAR(2)
, admin_rte_id_qlfr                VARCHAR(2)
, drg_dosag_frm_id                 VARCHAR(4)
, drg_dosag_frm_id_qlfr            VARCHAR(4)
, desi_ind                         CHAR(1)
, desi_ind_qlfr                    CHAR(1)
, drg_maint_ind                    CHAR(1)
, drg_maint_ind_qlfr               CHAR(1)
, drg_unit_dose_use_ind            CHAR(1)
, drg_unit_dose_use_ind_qlfr       CHAR(1)
, drg_fda_thrpc_eqvlc_cd           VARCHAR(3)
, drg_fda_thrpc_eqvlc_cd_qlfr      VARCHAR(3)
, ahfs_cd                          VARCHAR(8)
, ahfs_cd_qlfr                     VARCHAR(8)
, ovrd_metric_qty_ind              CHAR(1)
, stat_cd                          CHAR(1)
, eff_from_dt                      DATE
, eff_thru_dt                      DATE
, hic3_ovrd_flg                    VARCHAR(3)
, hic3_ovrd_flg_qlfr               VARCHAR(3)
, src_insert_uid                   VARCHAR(10)
, src_insert_ts                    TIMESTAMP
, src_insert_prog_nm               VARCHAR(10)
, src_update_uid                   VARCHAR(10)
, src_update_ts                    TIMESTAMP
, src_update_prog_nm               VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

