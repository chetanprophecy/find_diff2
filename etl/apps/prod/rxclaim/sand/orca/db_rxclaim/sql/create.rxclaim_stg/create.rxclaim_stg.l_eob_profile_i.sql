DROP TABLE ${STAGING_SCHEMA}.l_eob_profile_i;

CREATE TABLE ${STAGING_SCHEMA}.l_eob_profile_i
( carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, group_id                         VARCHAR(30) NOT NULL
, cag_sk                           BIGINT
, logo_cd                          VARCHAR(6) NOT NULL
, logo_nm                          VARCHAR(30)
, eob_plan_nm                      VARCHAR(60)
, cust_svc_phone_num               BIGINT
, tty_tdd                          BIGINT
, hours_oper                       VARCHAR(60)
, return_addr1                     VARCHAR(40)
, return_addr2                     VARCHAR(40)
, return_city                      VARCHAR(20)
, return_st                        CHAR(2)
, return_zip_cd                    VARCHAR(10)
, plan_typ_cd                      VARCHAR(20)
, ms_phone_num                     BIGINT
, ms_tty_tdd                       BIGINT
, ms_hours_oper                    VARCHAR(60)
, covrg_in_gap                     VARCHAR(3)
, src_cd                           VARCHAR(20)
, expired_ind                      BYTEINT
, spanish_hours_oper               VARCHAR(60)
, split_tier_ind                   SMALLINT
, split_tier_annual_amt            DECIMAL(12,2)
, covrg_gap_suppress_ind           SMALLINT
, expr1                            VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, plan_yr                          SMALLINT
);

