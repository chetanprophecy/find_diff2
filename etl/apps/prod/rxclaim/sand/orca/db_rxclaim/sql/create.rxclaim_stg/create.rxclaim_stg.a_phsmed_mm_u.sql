DROP TABLE ${STAGING_SCHEMA}.a_phsmed_mm_u;

CREATE TABLE ${STAGING_SCHEMA}.a_phsmed_mm_u
( carrier_id                       VARCHAR(9)
, submarket_id                     CHAR(10)
, care_fac_adjud_sk                BIGINT
, cal_yr_qtr_id                    BIGINT
, rxs_15th_member_cnt              INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

