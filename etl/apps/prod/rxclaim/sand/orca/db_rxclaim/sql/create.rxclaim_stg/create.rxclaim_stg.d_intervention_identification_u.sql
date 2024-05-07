DROP TABLE ${STAGING_SCHEMA}.d_intervention_identification_u;

CREATE TABLE ${STAGING_SCHEMA}.d_intervention_identification_u
( intrvn_idntfn_sk                 BIGINT NOT NULL
, intrvn_idntfn_id                 DECIMAL(38) NOT NULL
, clncl_client_sk                  BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, acct_id                          VARCHAR(40) NOT NULL
, emplr_grp_id                     VARCHAR(30) NOT NULL
, clncl_cag_sk                     BIGINT NOT NULL
, patient_id                       BIGINT NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, clncl_mbr_sk                     BIGINT NOT NULL
, clncl_prod_id                    VARCHAR(25)
, clncl_prod_sk                    BIGINT NOT NULL
, clncl_prod_nm                    NVARCHAR(100)
, clncl_pgm_id                     VARCHAR(25)
, clncl_pgm_sk                     BIGINT NOT NULL
, clncl_pgm_nm                     NVARCHAR(100)
, intrvn_dt                        TIMESTAMP NOT NULL
, intrvn_nm                        NVARCHAR(100) NOT NULL
, intrvn_desc                      NVARCHAR(300) NOT NULL
, idntfn_cd                        VARCHAR(10) NOT NULL
, intrvn_cd                        VARCHAR(10) NOT NULL
, intrvn_lvl                       VARCHAR(10) NOT NULL
, risk_scor                        DECIMAL(15,5)
, risk_catgy                       VARCHAR(15)
, intrvn_proc_flg                  CHAR(1) NOT NULL
, intrvn_typ                       VARCHAR(20)
, claims_revw_period_start_dt      DATE NOT NULL
, claims_revw_period_end_dt        DATE NOT NULL
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

