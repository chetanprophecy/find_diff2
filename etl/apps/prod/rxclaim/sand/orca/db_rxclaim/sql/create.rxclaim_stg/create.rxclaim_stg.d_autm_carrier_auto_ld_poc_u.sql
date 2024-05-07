DROP TABLE ${STAGING_SCHEMA}.d_autm_carrier_auto_ld_poc_u;

CREATE TABLE ${STAGING_SCHEMA}.d_autm_carrier_auto_ld_poc_u
( slice_id                         INTEGER NOT NULL
, slice_desc                       VARCHAR(150)
, carrier_id                       VARCHAR(9)
, carrier_nm                       VARCHAR(150)
, address_id                       VARCHAR(60)
, drg_utilz_carrier                VARCHAR(2)
, day_supply_carrier               VARCHAR(2)
, generic_utiliz_carrier           VARCHAR(2)
, formulary_compl_carrier          VARCHAR(2)
, top_25_drg_carrier               VARCHAR(2)
, top_10_class_carrier             VARCHAR(2)
, mail_srvce_carrier               VARCHAR(2)
, drct_mbr_rmbst_carrier           VARCHAR(2)
, splty_carrier                    VARCHAR(2)
, top_25_mbrs_carrier              VARCHAR(2)
, top_25_rx_carrier                VARCHAR(2)
, top_25_md_carrier                VARCHAR(2)
, splty_channel_car_ind            VARCHAR(2)
, splty_fin_summary_car_ind        VARCHAR(2)
, splty_perf_car_ind               VARCHAR(2)
, top_10_splty_drg_car_ind         VARCHAR(2)
, top_10_splty_thr_class_car_ind   VARCHAR(2)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

