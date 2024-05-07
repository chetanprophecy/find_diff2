DROP TABLE ${STAGING_SCHEMA}.d_carrier_contract_pbp_hist_u;

CREATE TABLE ${STAGING_SCHEMA}.d_carrier_contract_pbp_hist_u
( carrier_contract_pbp_hist_sk     BIGINT
, contract_id                      VARCHAR(5)
, pbp_id                           VARCHAR(3)
, benefit_yr                       SMALLINT
, cpb_sequence_no                  SMALLINT
, carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, medicare_plan_type_cd            CHAR(1)
, cpb_status_cd                    CHAR(1)
, carrier_list                     VARCHAR(10)
, formulary_id                     VARCHAR(8)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, segment_id                       VARCHAR(3) NOT NULL
);

