DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_delivery_dispensed_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_delivery_dispensed_i
( phr_sk                           BIGINT
, phr_id                           VARCHAR(12)
, phr_dispns_ind                   VARCHAR(2)
, dlvry_chanl                      VARCHAR(25)
, phr_acqstn_dt                    DATE
, phr_acqstn_dt_sk                 BIGINT
, phr_disps_dt                     DATE
, phr_disps_dt_sk                  BIGINT
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PHR_SK);

