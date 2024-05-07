DROP TABLE ${STAGING_SCHEMA}.f_claim_facility_seg_i;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_facility_seg_i
( claim_nbr                        BIGINT
, claim_seq_nbr                    BIGINT
, facility_city                    VARCHAR(30)
, facility_state                   VARCHAR(2)
, facility_street                  VARCHAR(30)
, facility_nm                      VARCHAR(30)
, facility_zip                     VARCHAR(15)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

