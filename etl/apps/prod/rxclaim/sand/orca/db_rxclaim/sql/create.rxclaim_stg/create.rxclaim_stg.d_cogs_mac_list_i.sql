DROP TABLE ${STAGING_SCHEMA}.d_cogs_mac_list_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cogs_mac_list_i
( mac_list_sk                      BIGINT NOT NULL
, car_carrier_id                   VARCHAR(30) NOT NULL
, mac_list                         VARCHAR(10) NOT NULL
, mac_list_nm                      VARCHAR(25)
, mac_list_update_mthd             VARCHAR(1) NOT NULL
, mac_list_typ                     VARCHAR(1) NOT NULL
, mac_list_inpt_library_nm         VARCHAR(10)
, mac_list_inpt_file_nm            VARCHAR(10)
, mac_list_update_pgm              VARCHAR(10)
, add_dt                           TIMESTAMP
, chg_user_nm                      VARCHAR(10)
, chg_dt                           DATE
, chg_tm                           TIME
, chg_pgm_nm                       VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
);

