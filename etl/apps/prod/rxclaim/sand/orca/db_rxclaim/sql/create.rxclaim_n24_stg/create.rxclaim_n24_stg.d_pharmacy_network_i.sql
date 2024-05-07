DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_network_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_network_i
( ntwk_sk                          BIGINT
, phr_ntwrk_id                     VARCHAR(6)
, phr_ntwrk_seq_no                 INTEGER
, phr_ntwrk_carr_nm                VARCHAR(9)
, phr_ntwrk_rgn_nm                 VARCHAR(10)
, phr_ntwrk_typ_cd                 VARCHAR(2)
, phr_ntwrk_nm                     VARCHAR(35)
, phr_ntwrk_cntct_nm               VARCHAR(40)
, phr_ntwrk_cntct_title_nm         VARCHAR(30)
, phr_ntwrk_addr1_txt              VARCHAR(55)
, phr_ntwrk_addr2_txt              VARCHAR(55)
, phr_ntwrk_city_nm                VARCHAR(30)
, phr_ntwrk_st_cd                  VARCHAR(2)
, phr_ntwrk_zip_cd                 VARCHAR(5)
, phr_ntwrk_zip2_cd                VARCHAR(4)
, phr_ntwrk_zip3_cd                VARCHAR(2)
, phr_ntwrk_cntry_cd               VARCHAR(4)
, phr_ntwrk_phone_no               BIGINT
, phr_ntwrk_phone_ext              BIGINT
, phr_ntwrk_fax_phone              BIGINT
, phr_ntwrk_mail_addr1_txt         VARCHAR(55)
, phr_ntwrk_mail_addr2_txt         VARCHAR(55)
, phr_ntwrk_mail_city_nm           VARCHAR(30)
, phr_ntwrk_mail_st_cd             VARCHAR(2)
, phr_ntwrk_mail_zip1_cd           VARCHAR(5)
, phr_ntwrk_mail_zip2_cd           VARCHAR(4)
, phr_ntwrk_mail_zip3_cd           VARCHAR(2)
, phr_ntwrk_mail_cntry_cd          CHAR(4)
, phr_ntwrk_hold_typ_ind           CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

