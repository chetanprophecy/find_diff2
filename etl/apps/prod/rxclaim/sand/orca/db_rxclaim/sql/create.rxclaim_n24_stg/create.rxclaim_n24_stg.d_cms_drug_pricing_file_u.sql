DROP TABLE ${STAGING_SCHEMA}.d_cms_drug_pricing_file_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_drug_pricing_file_u
( cms_drug_pricing_file_sk         BIGINT NOT NULL
, prod_directory_dt_sk             BIGINT
, cms_proxy_ndc_sk                 BIGINT
, cms_contract_id                  VARCHAR(5)
, price_id                         VARCHAR(3)
, cms_proxy_ndc_id                 VARCHAR(11)
, days_of_supply                   SMALLINT
, pricing_file_mail_flg            CHAR(1)
, unit_cost                        DECIMAL(8,4)
, ceiling_cost_flg                 CHAR(1)
, prod_directory_dt                DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

