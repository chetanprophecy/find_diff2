DROP TABLE ${STAGING_SCHEMA}.d_cag_prod_ovrd_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_prod_ovrd_i
( cag_prod_ovrd_sk                 BIGINT
, prod_key                         INTEGER
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, pco_seq_nbr                      INTEGER
, drg_multi_src_cd                 CHAR(1)
, drg_rx_otc_ind                   CHAR(1)
, drg_3rd_prty_excpn_ind           CHAR(1)
, drg_dea_cd                       CHAR(1)
, admin_route_cd                   VARCHAR(2)
, drg_dosag_frm_id                 VARCHAR(4)
, pco_desi_ind                     CHAR(1)
, drg_maint_ind                    CHAR(1)
, drg_unit_dose_use_ind            CHAR(1)
, drg_fda_thrpc_eqvlc_cd           VARCHAR(3)
, ahfs_cd                          VARCHAR(8)
, ovrd_metric_qty_ind              CHAR(1)
, pco_stat_cd                      CHAR(1)
, pco_from_dt                      DATE
, pco_thru_dt                      DATE
, anda_ovrd_flg                    CHAR(1)
, nda_ovrd_flg                     CHAR(1)
, bla_ovrd_flg                     CHAR(1)
, hic3_ovrd_flg                    VARCHAR(3)
, pco_mkting_category              VARCHAR(2)
, pco_mkting_start_dt              DATE
, pco_mkting_end_dt                DATE
, pco_ovrd_src                     CHAR(1)
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

