DROP TABLE ${STAGING_SCHEMA}.d_pharm_state_lic_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharm_state_lic_u
( phr_st_lic_sk                    BIGINT NOT NULL
, phr_sk                           BIGINT
, phr_st_cd                        VARCHAR(2)
, st_lic_nbr                       INTEGER
, st_lic_exp_dt                    DATE
, del_dt                           DATE
, chg_dt                           DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

