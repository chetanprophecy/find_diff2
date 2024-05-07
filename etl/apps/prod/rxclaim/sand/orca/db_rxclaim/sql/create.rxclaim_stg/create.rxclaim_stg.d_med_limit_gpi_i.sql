DROP TABLE ${STAGING_SCHEMA}.d_med_limit_gpi_i;

CREATE TABLE ${STAGING_SCHEMA}.d_med_limit_gpi_i
( med_limit_gpi_sk                 BIGINT
, med_limit_gpi_lst_id             CHAR(10)
, med_limit_gpi_id                 CHAR(14)
, med_limit_gpi_nm                 CHAR(60)
, med_limit_gpi_from_dt            DATE
, med_limit_gpi_thru_dt            DATE
, med_limit_gpi_strngth            DECIMAL(7,3)
, med_limit_gpi_mme_conv           DECIMAL(6,3)
, med_limit_gpi_msg_cd             CHAR(10)
, med_limit_uom                    CHAR(8)
, med_limit_dose_depn_mme          CHAR(1)
, mcv_tbl_nm                       CHAR(10)
, restrct_qual                     CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

