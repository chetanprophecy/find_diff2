DROP TABLE ${STAGING_SCHEMA}.d_cms_pharmacy_cost_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_pharmacy_cost_u
( cms_pharmacy_cost_sk             BIGINT NOT NULL
, prod_directory_dt_sk             BIGINT
, cms_contract_id                  VARCHAR(5)
, cms_pbp_id                       VARCHAR(3)
, cms_segment_id                   VARCHAR(3)
, cms_phr_npi_id                   VARCHAR(10)
, price_id                         VARCHAR(3)
, brand_dispensing_fee_30          DECIMAL(15,4)
, generic_dispensing_fee_30        DECIMAL(15,4)
, vaccine_admin_fee                DECIMAL(15,4)
, preferred_status_retail_flg      CHAR(1)
, phr_retail_flg                   CHAR(1)
, phr_mail_flg                     CHAR(1)
, phr_la_drugs_flg                 CHAR(1)
, phr_hi_flg                       CHAR(1)
, phr_ltc_flg                      CHAR(1)
, preferred_status_mail_flg        CHAR(1)
, floor_price                      DECIMAL(15,4)
, brand_dispensing_fee_60          DECIMAL(15,4)
, generic_dispensing_fee_60        DECIMAL(15,4)
, brand_dispensing_fee_90          DECIMAL(15,4)
, generic_dispensing_fee_90        DECIMAL(15,4)
, prod_directory_dt                DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CMS_PHARMACY_COST_SK);

