DROP TABLE ${STAGING_SCHEMA}.d_member_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_u
( mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, clt_id                           VARCHAR(50)
, mast_prsn_id                     BIGINT
, mbr_fam_id                       VARCHAR(40)
, mbr_alt_ins_ind                  CHAR(1)
, mbr_alt_ins_id                   VARCHAR(10)
, mbr_alt_ins_mbr_id               VARCHAR(20)
, mbr_ssn_nbr                      VARCHAR(20)
, mbr_dt_of_brth                   DATE
, mbr_hic_cd                       VARCHAR(40)
, mb_first_nm                      VARCHAR(50)
, mb_last_nm                       VARCHAR(70)
, mb_mid_init_nm                   CHAR(1)
, mbr_prsn_cd                      VARCHAR(6)
, mbr_relshp_cd                    CHAR(1)
, mbr_rdr                          VARCHAR(6)
, mbr_sex                          CHAR(1)
, mbr_city_nm                      VARCHAR(60)
, mbr_st_cd                        VARCHAR(6)
, mbr_zip                          VARCHAR(10)
, mbr_mcre_covrg_from_dt           DATE
, mbr_addr1                        VARCHAR(120)
, mbr_addr2                        VARCHAR(120)
, mbr_addr3                        VARCHAR(120)
, mbr_zip2                         VARCHAR(10)
, mbr_zip4                         VARCHAR(10)
, mbr_cntry                        VARCHAR(8)
, mbr_phone                        VARCHAR(30)
, mbr_eml_addr                     VARCHAR(160)
, mbr_mcre_covrg_typ               CHAR(1)
, mbr_fam_typ_cd                   CHAR(1)
, mbr_fam_ind                      CHAR(1)
, mbr_dur_keyvar                   CHAR(18)
, mbr_ben_reset_dt                 DATE
, mbr_lang_cd                      VARCHAR(3)
, mbr_dur_prcs_flag                CHAR(1)
, mbr_mltpl_brth_cd                BYTEINT
, mbr_orig_eff_dt                  DATE
, mbr_typ                          CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

