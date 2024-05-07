DROP TABLE ${STAGING_SCHEMA}.d_clinical_pharmacy_i;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_pharmacy_i
( clncl_phr_sk                     BIGINT NOT NULL
, clncl_phr_id                     VARCHAR(12) NOT NULL
, phr_npi_nbr                      VARCHAR(10)
, phr_ncpdp_nbr                    VARCHAR(12)
, phr_nm                           NVARCHAR(60)
, phr_adr_1                        NVARCHAR(55)
, phr_adr_2                        NVARCHAR(55)
, phr_zip_cd                       VARCHAR(10)
, phr_city                         VARCHAR(50)
, phr_st                           VARCHAR(3)
, phr_mtm_ntwk_flg                 VARCHAR(1)
, phr_phone_nbr                    DECIMAL(22)
, phr_email                        VARCHAR(80)
, phr_fax_nbr                      DECIMAL(38)
, dispnsr_typ_cd                   VARCHAR(3)
, phr_stor_nbr                     VARCHAR(10)
, phr_stat_cd                      CHAR(1)
, phr_stat_desc                    VARCHAR(20)
, phr_alt_nm                       NVARCHAR(60)
, phr_src_sys_id                   DECIMAL(38)
, phr_medcr_nbr                    VARCHAR(20)
, phr_federal_lic_nbr              VARCHAR(12)
, phr_st_lic_nbr                   VARCHAR(20)
, cpp_creat_ts                     TIMESTAMP NOT NULL
, cpp_creat_by                     VARCHAR(20) NOT NULL
, cpp_update_ts                    TIMESTAMP
, cpp_update_by                    VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
);

