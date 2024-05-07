DROP TABLE ${STAGING_SCHEMA}.d_clinical_cag_i;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_cag_i
( clncl_cag_sk                     BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, clncl_client_sk                  BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, carrier_nm                       VARCHAR(100)
, acct_id                          VARCHAR(40) NOT NULL
, acct_nm                          VARCHAR(100)
, emplr_grp_id                     VARCHAR(30) NOT NULL
, emplr_grp_nm                     VARCHAR(100)
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

