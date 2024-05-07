DROP TABLE ${STAGING_SCHEMA}.d_grp_list_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_grp_list_detail_u
( cag_lst_sk                       BIGINT
, grp_lst_nm                       VARCHAR(10)
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
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

