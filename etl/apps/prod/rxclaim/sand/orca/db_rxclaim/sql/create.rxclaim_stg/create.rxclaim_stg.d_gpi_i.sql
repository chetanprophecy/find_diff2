DROP TABLE ${STAGING_SCHEMA}.d_gpi_i;

CREATE TABLE ${STAGING_SCHEMA}.d_gpi_i
( gpi_sk                           BIGINT NOT NULL
, gpi_id                           VARCHAR(14) NOT NULL
, gpi_nm                           VARCHAR(100) NOT NULL
, injctbl_ind_flg                  CHAR(1) NOT NULL
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
, drug_sk                          BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

