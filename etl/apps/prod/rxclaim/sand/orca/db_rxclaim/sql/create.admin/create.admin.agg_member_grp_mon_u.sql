DROP TABLE ${STAGING_SCHEMA}.agg_member_grp_mon_u;

CREATE TABLE ${STAGING_SCHEMA}.agg_member_grp_mon_u
( carrier_account_group_key        BIGINT NOT NULL
, carrier_id                       VARCHAR(9)
, account_id                       VARCHAR(15)
, employer_group_id                VARCHAR(30)
, gender_code                      VARCHAR(1) NOT NULL
, cal_year_month_id                DECIMAL(6) NOT NULL
, rxs_15th_member_cnt              INTEGER
, policy_id                        VARCHAR(7)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

