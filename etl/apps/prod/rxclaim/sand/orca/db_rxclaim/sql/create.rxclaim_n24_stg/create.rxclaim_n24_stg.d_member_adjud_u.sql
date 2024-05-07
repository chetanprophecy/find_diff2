DROP TABLE ${STAGING_SCHEMA}.d_member_adjud_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_adjud_u
( mbr_adjud_sk                     BIGINT NOT NULL
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mast_prsn_id                     BIGINT
, clt_id                           VARCHAR(50)
, mbr_alt_ins_ind                  CHAR(1)
, mbr_alt_ins_id                   VARCHAR(10)
, mbr_alt_ins_mbr_id               VARCHAR(20)
, mbr_ssn_nbr                      VARCHAR(20)
, mbr_supp_id1                     VARCHAR(20)
, mbr_supp_id1_typ                 VARCHAR(3)
, mbr_supp_id2                     VARCHAR(20)
, mbr_supp_id2_typ                 VARCHAR(3)
, mbr_age_band                     CHAR(1)
, mbr_calc_age                     SMALLINT
, mbr_cdhldr                       VARCHAR(40)
, mbr_clsfctn1                     VARCHAR(10)
, mbr_clsfctn2                     VARCHAR(15)
, mbr_clsfctn3                     CHAR(1)
, mbr_dt_of_brth                   DATE
, mbr_hic_cd                       VARCHAR(40)
, mbr_id_encrpd                    VARCHAR(20)
, mbr_first_nm                     VARCHAR(50)
, mbr_last_nm                      VARCHAR(70)
, mbr_mid_init_nm                  CHAR(1)
, mbr_prsn_cd                      VARCHAR(6)
, mbr_relshp_cd                    CHAR(1)
, mbr_rdr                          VARCHAR(6)
, mbr_sex                          CHAR(1)
, mbr_zip                          VARCHAR(30)
, mbr_mcre_covrg_from_dt           DATE
, mbr_mcre_covrg_typ               CHAR(1)
, mbr_fam_id                       VARCHAR(40)
, mbr_fam_ind                      CHAR(1)
, mbr_fam_typ_cd                   CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mbr_sk                           BIGINT
)
DISTRIBUTE ON (MBR_SK);

