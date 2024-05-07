DROP TABLE ${STAGING_SCHEMA}.l_dynamic_period_u;

CREATE TABLE ${STAGING_SCHEMA}.l_dynamic_period_u
( dynamic_perd_sk                  BIGINT NOT NULL
, perd_type_nbr                    INTEGER
, perd_type_nm                     VARCHAR(35)
, perd_start_dt_sk                 BIGINT
, perd_start_dt                    DATE
, perd_end_dt                      DATE
, perd_order_no                    INTEGER
, perd_order_nm                    VARCHAR(35)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

