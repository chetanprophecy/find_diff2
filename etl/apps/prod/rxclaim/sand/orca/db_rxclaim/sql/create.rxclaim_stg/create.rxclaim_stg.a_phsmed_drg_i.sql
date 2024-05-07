DROP TABLE ${STAGING_SCHEMA}.a_phsmed_drg_i;

CREATE TABLE ${STAGING_SCHEMA}.a_phsmed_drg_i
( carrier_id                       VARCHAR(9)
, submarket_id                     CHAR(10)
, care_fac_adjud_sk                BIGINT
, cal_yr_qtr_id                    BIGINT
, mbr_sk                           BIGINT
, drg_class_id                     VARCHAR(4)
, drg_subclass_id                  VARCHAR(6)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20) NOT NULL
, run_id                           BIGINT
, update_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

