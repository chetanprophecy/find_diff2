DROP TABLE ${STAGING_SCHEMA}.d_ms_prescriber_u;

CREATE TABLE ${STAGING_SCHEMA}.d_ms_prescriber_u
( pbr_sk                           BIGINT NOT NULL
, pbr_st_sk                        BIGINT NOT NULL
, pbr_zip_cd_sk                    BIGINT NOT NULL
, pbr_party_id                     BIGINT NOT NULL
, pbr_party_no                     VARCHAR(30) NOT NULL
, pbr_lst_nm                       VARCHAR(40) NOT NULL
, pbr_fst_nm                       VARCHAR(40) NOT NULL
, pbr_midl_nm                      VARCHAR(40) NOT NULL
, pbr_salutation                   VARCHAR(10) NOT NULL
, pbr_cancel_cd                    VARCHAR(30) NOT NULL
, pbr_npi                          VARCHAR(20) NOT NULL
, pbr_adr1                         VARCHAR(150)
, pbr_adr2                         VARCHAR(150)
, pbr_city                         VARCHAR(50)
, pbr_zip4_cd                      VARCHAR(4)
, pbr_ofc                          VARCHAR(150) NOT NULL
, pbr_addr_val_flg                 VARCHAR(15) NOT NULL
, pbr_tel_no                       VARCHAR(40) NOT NULL
, pbr_tel_ext                      VARCHAR(40) NOT NULL
, pbr_fax_no                       VARCHAR(40) NOT NULL
, pbr_fax_ext                      VARCHAR(40) NOT NULL
, pbr_hr                           VARCHAR(150) NOT NULL
, pbr_cell_tel                     VARCHAR(40) NOT NULL
, pbr_cell_tel_ext                 VARCHAR(40) NOT NULL
, pbr_pager_tel                    VARCHAR(40) NOT NULL
, pbr_pager_cd                     VARCHAR(40) NOT NULL
, pbr_hom_tel                      VARCHAR(40) NOT NULL
, pbr_hom_tel_ext                  VARCHAR(40) NOT NULL
, pbr_npi_efct_from_dt             DATE NOT NULL
, pbr_npi_efct_to_dt               DATE NOT NULL
, pbr_taxonomy_cd_1                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_2                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_3                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_4                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_5                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_6                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_7                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_8                VARCHAR(10) NOT NULL
, pbr_taxonomy_cd_9                VARCHAR(10) NOT NULL
, src_env_sk                       INTEGER NOT NULL
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
, run_id                           BIGINT NOT NULL
, rec_stat_cd                      BYTEINT NOT NULL
);

