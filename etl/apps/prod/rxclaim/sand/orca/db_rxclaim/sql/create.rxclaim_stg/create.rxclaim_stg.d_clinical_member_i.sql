DROP TABLE ${STAGING_SCHEMA}.d_clinical_member_i;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_member_i
( clncl_mbr_sk                     BIGINT NOT NULL
, clncl_client_sk                  BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, clncl_cag_sk                     BIGINT NOT NULL
, patient_id                       BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, acct_id                          VARCHAR(40) NOT NULL
, emplr_grp_id                     VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, mbr_fst_nm                       VARCHAR(50)
, mbr_midl_init                    VARCHAR(30)
, mbr_lst_nm                       VARCHAR(50)
, dob                              DATE
, dt_of_death                      DATE
, gender_id                        CHAR(1)
, gender_decription                VARCHAR(30)
, mbr_ssn                          VARCHAR(9)
, pers_cd                          VARCHAR(3)
, reltnshp_cd                      CHAR(1)
, subs_patient_id                  VARCHAR(38)
, cov_lvl_cd                       CHAR(1)
, prim_adr_1                       NVARCHAR(100)
, prim_adr_2                       NVARCHAR(100)
, prim_city_town                   NVARCHAR(30)
, prim_st_cd                       VARCHAR(2)
, prim_postal_zip                  VARCHAR(10)
, prim_cnty_cd                     VARCHAR(4)
, prim_attention_line              NVARCHAR(30)
, prim_building_mail_stop          NVARCHAR(20)
, prim_area_cd                     VARCHAR(7)
, prim_phone_nbr                   VARCHAR(10)
, prim_phone_nbr_extn              VARCHAR(10)
, hic_nbr                          VARCHAR(20)
, rec_actv_dt                      TIMESTAMP
, rec_inactv_dt                    TIMESTAMP
, rec_actv_flg                     CHAR(1)
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

