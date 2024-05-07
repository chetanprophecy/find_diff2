DROP TABLE ${STAGING_SCHEMA}.d_clinical_client_i;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_client_i
( clncl_client_sk                  BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, client_nm                        NVARCHAR(100)
, plan_typ                         VARCHAR(64)
, plan_manager                     VARCHAR(64)
, hist_rx_claims                   VARCHAR(2)
, mtm_client_flg                   CHAR(1)
, mbr_idntfn_list_flg              CHAR(1)
, mbr_trgted_list_flg              CHAR(1)
, hpcm_mbr_list_flg                CHAR(1)
, mbr_unique                       VARCHAR(4)
, commt                            NVARCHAR(2048)
, med_claim                        VARCHAR(10)
, prior_pbm_claim                  CHAR(1)
, prospective_client               CHAR(1)
, client_stat                      CHAR(1)
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

