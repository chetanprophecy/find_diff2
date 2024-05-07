DROP TABLE ${STAGING_SCHEMA}.d_plan_finder_u;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_finder_u
( prod_sk                          BIGINT
, cms_pst_dt                       DATE
, pdp_carrier_id                   VARCHAR(9)
, pdp_account_id                   VARCHAR(15)
, pdp_group_id                     VARCHAR(15)
, pdp_plan_cd                      VARCHAR(10)
, pdp_plan_eff_dt                  DATE
, file_id                          VARCHAR(10)
, client_id                        VARCHAR(9)
, contract_nbr                     VARCHAR(5)
, price_id                         VARCHAR(3)
, plan_year                        VARCHAR(4)
, gpi_id                           VARCHAR(14)
, ndc_id                           VARCHAR(11)
, days_of_supply                   SMALLINT
, client_unit_cost                 DECIMAL(13,5)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PROD_SK);

