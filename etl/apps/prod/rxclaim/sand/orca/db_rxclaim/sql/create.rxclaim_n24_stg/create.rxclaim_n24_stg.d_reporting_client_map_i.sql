DROP TABLE ${STAGING_SCHEMA}.d_reporting_client_map_i;

CREATE TABLE ${STAGING_SCHEMA}.d_reporting_client_map_i
( rptg_clt_id                      INTEGER
, rptg_clt_nm                      VARCHAR(100)
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, eff_dt                           DATE
, bk_of_bsns                       VARCHAR(30)
, mbr_dtl_flg                      CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

