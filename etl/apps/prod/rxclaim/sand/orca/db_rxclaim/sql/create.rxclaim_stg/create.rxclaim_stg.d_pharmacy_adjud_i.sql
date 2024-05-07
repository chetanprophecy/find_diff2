DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_adjud_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_adjud_i
( phr_adjud_sk                     BIGINT NOT NULL
, submd_phr_id                     VARCHAR(15)
, submd_phr_id_qlfr_cd             VARCHAR(2)
, rslvd_phr_id                     VARCHAR(15)
, rslvd_phr_id_qlfr_cd             VARCHAR(2)
, phr_ncpdp_id                     VARCHAR(12)
, phr_npi_no                       VARCHAR(10)
, phr_nm                           VARCHAR(55)
, phr_ntwrk_id                     VARCHAR(6)
, phr_ntwrk_nm                     VARCHAR(25)
, phr_ntwrk_prity_cd               VARCHAR(3)
, phr_ntwrk_qlfr_ind               CHAR(1)
, phr_ntwrk_typ_cd                 VARCHAR(2)
, phr_ntwrk_carr_nm                VARCHAR(9)
, phr_ntwrk_prcs_qlfr_ind          CHAR(1)
, phr_ntwrk_seq_no                 INTEGER
, phr_super_carr_nm                VARCHAR(9)
, phr_super_ntwrk_typ_cd           VARCHAR(2)
, phr_super_ntwrk_id               VARCHAR(6)
, phr_affl_cd                      VARCHAR(6)
, phr_affl_nm                      VARCHAR(35)
, phr_pmt_centr_nm                 VARCHAR(12)
, phr_rgn_nm                       VARCHAR(10)
, phr_prnt_org_nm                  VARCHAR(6)
, phr_ntwrk_clsfctn_ind            CHAR(1)
, phr_zip_cd                       VARCHAR(15)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

