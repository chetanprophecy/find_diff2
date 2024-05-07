DROP TABLE ${STAGING_SCHEMA}.d_product_unit_cost_pricing_i;

CREATE TABLE ${STAGING_SCHEMA}.d_product_unit_cost_pricing_i
( prod_cost_sk                     BIGINT
, prod_sk                          BIGINT
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, price_src_sk                     BIGINT
, cost_type_cd_sk                  BIGINT
, prod_key                         BIGINT
, cost_src_cd                      VARCHAR(10)
, cost_type_cd                     VARCHAR(10)
, cost_seq_no                      INTEGER
, price_src_cd                     CHAR(1)
, cost_stat_cd                     CHAR(1)
, cost_eff_dt                      DATE
, cost_thru_dt                     DATE
, unit_cost_amt                    DECIMAL(13,5)
, cost_origin_cd                   CHAR(1)
, src_add_ts                       TIMESTAMP
, src_chg_ts                       TIMESTAMP
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PROD_SK);

