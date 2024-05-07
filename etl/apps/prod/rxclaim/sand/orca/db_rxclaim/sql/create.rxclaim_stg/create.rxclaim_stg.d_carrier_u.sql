DROP TABLE ${STAGING_SCHEMA}.d_carrier_u;

CREATE TABLE ${STAGING_SCHEMA}.d_carrier_u
( carrier_sk                       BIGINT NOT NULL
, dar_lob_sk                       BIGINT NOT NULL
, acctg_lob_sk                     BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, carrier_nm                       VARCHAR(50) NOT NULL
, service_type_nm                  VARCHAR(25) NOT NULL
, carrier_state_cd                 VARCHAR(2) NOT NULL
, super_carrier_id                 CHAR(1) NOT NULL
, super_carrier_desc               VARCHAR(50) NOT NULL
, current_flg                      CHAR(1) NOT NULL
, hm_dlvry_only_ind                CHAR(1) NOT NULL
, hm_dlvry_stat_ind                CHAR(1) NOT NULL
, rebates_only_ind                 CHAR(1) NOT NULL
, rebates_stat_ind                 CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mailg_adr_1                      VARCHAR(25)
, mailg_city                       VARCHAR(20)
, mailg_state                      VARCHAR(2)
, mailg_cntry                      VARCHAR(4)
, mailg_zip_cd                     VARCHAR(5)
, naic_nbr                         VARCHAR(5)
, bob_ind                          CHAR(1)
)
DISTRIBUTE ON (CARRIER_SK);

