DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_super_network_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_super_network_u
( super_ntwk_sk                    BIGINT
, phr_super_ntwrk_id               VARCHAR(6)
, phr_super_ntwrk_seq_no           INTEGER
, phr_super_ntwrk_carr_nm          VARCHAR(9)
, phr_super_ntwrk_rgn_nm           VARCHAR(10)
, phr_super_ntwrk_typ_cd           VARCHAR(2)
, phr_super_ntwrk_nm               VARCHAR(35)
, phr_super_ntwrk_addr1_txt1       VARCHAR(55)
, phr_super_ntwrk_addr1_txt2       VARCHAR(55)
, phr_super_ntwrk_city1_nm         VARCHAR(30)
, phr_super_ntwrk_st1_cd           VARCHAR(2)
, phr_super_ntwrk_addr1_zip_cd     VARCHAR(5)
, phr_super_ntwrk_addr1_zip2_cd    VARCHAR(4)
, phr_super_ntwrk_addr1_zip3_cd    VARCHAR(2)
, phr_super_ntwrk_cntry1_cd        VARCHAR(4)
, phr_super_ntwrk_cntct_nm         VARCHAR(40)
, phr_super_ntwrk_phone_no         BIGINT
, phr_super_ntwrk_phone_ext        BIGINT
, phr_super_ntwrk_addr2_txt1       VARCHAR(55)
, phr_super_ntwrk_addr2_txt2       VARCHAR(55)
, phr_super_ntwrk_city2_nm         VARCHAR(30)
, phr_super_ntwrk_st2_cd           VARCHAR(2)
, phr_super_ntwrk_addr2_zip_cd     VARCHAR(5)
, phr_super_ntwrk_addr2_zip2_cd    VARCHAR(4)
, phr_super_ntwrk_addr2_zip3_cd    VARCHAR(2)
, phr_super_ntwrk_cntry2_cd        VARCHAR(4)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

