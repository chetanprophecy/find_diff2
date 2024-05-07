DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_super_ntwk_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_super_ntwk_dtl_u
( super_ntwk_dtl_sk                BIGINT NOT NULL
, super_ntwk_sk                    BIGINT
, ntwk_sk                          BIGINT
, phr_ntwrk_id                     VARCHAR(6)
, phr_super_ntwrk_id               VARCHAR(6)
, super_ntwk_seq_nbr               INTEGER
, sn_ntwk_seq_nbr                  INTEGER
, sn_ntwk_stat_cd                  CHAR(1)
, rel_eff_dt                       DATE
, rel_expiry_dt                    DATE
, ntwk_stat_cd                     CHAR(1)
, carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, region_cd                        VARCHAR(10)
, sn_ntwk_typ                      VARCHAR(2)
, sn_usr_seq                       INTEGER
, sn_ntwk_ql                       CHAR(1)
, sn_prc_ql                        CHAR(1)
, add_dt                           DATE
, chg_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

