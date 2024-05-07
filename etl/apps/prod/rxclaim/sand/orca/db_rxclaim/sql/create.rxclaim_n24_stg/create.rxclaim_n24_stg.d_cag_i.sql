DROP TABLE ${STAGING_SCHEMA}.d_cag_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_i
( cag_sk                           BIGINT NOT NULL
, dar_lob_sk                       BIGINT NOT NULL
, acctg_lob_sk                     BIGINT NOT NULL
, client_sk                        BIGINT NOT NULL
, carrier_sk                       BIGINT NOT NULL
, carrier_acct_sk                  BIGINT NOT NULL
, client_id                        VARCHAR(50) NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, client_nm                        VARCHAR(50) NOT NULL
, carrier_nm                       VARCHAR(50) NOT NULL
, account_nm                       VARCHAR(50) NOT NULL
, employer_group_nm                VARCHAR(50) NOT NULL
, pvcy_excl_ind                    BYTEINT NOT NULL
, pa_site_nm                       VARCHAR(50)
, carrier_category_id              CHAR(1) NOT NULL
, carrier_category_desc            VARCHAR(50) NOT NULL
, carrier_state_cd                 VARCHAR(2) NOT NULL
, acct_client_type_id              VARCHAR(30) NOT NULL
, acct_client_type_desc            VARCHAR(100) NOT NULL
, acct_product_type_id             VARCHAR(30) NOT NULL
, acct_product_type_desc           VARCHAR(100) NOT NULL
, acct_product_line_id             VARCHAR(30) NOT NULL
, acct_product_line_desc           VARCHAR(100) NOT NULL
, contract_num                     VARCHAR(5) NOT NULL
, pbp_id                           VARCHAR(3) NOT NULL
, gps_plan_cd                      VARCHAR(3) NOT NULL
, oracle_client_cd                 VARCHAR(50) NOT NULL
, claim_suffix_cd                  VARCHAR(2) NOT NULL
, custom_no                        VARCHAR(12) NOT NULL
, funding_arrangment_cd            VARCHAR(2) NOT NULL
, plan_variation_cd                VARCHAR(4) NOT NULL
, policy_no                        VARCHAR(7) NOT NULL
, reporting_cd                     VARCHAR(4) NOT NULL
, product_cd                       VARCHAR(3) NOT NULL
, segment_ind                      VARCHAR(4) NOT NULL
, hmo_acct_dvsn_cd                 VARCHAR(3) NOT NULL
, claim_account_cd                 VARCHAR(3) NOT NULL
, sold_market_site_cd              VARCHAR(5) NOT NULL
, situs_state_cd                   VARCHAR(2) NOT NULL
, platform_ind                     CHAR(1) NOT NULL
, client_carrier_id                VARCHAR(4) NOT NULL
, shared_arrangement_ind           VARCHAR(2) NOT NULL
, sales_office_cd                  VARCHAR(3) NOT NULL
, accumulator_ind                  CHAR(1) NOT NULL
, erisa_id                         CHAR(1) NOT NULL
, renewal_dt                       DATE NOT NULL
, iplan_ind                        CHAR(1) NOT NULL
, legal_entity_cd                  VARCHAR(5) NOT NULL
, franchise_no                     VARCHAR(7) NOT NULL
, lead_partner_cd                  VARCHAR(4) NOT NULL
, coc_cd                           CHAR(1) NOT NULL
, migration_ind                    BYTEINT NOT NULL
, migration_effective_dt           DATE NOT NULL
, product_classifier_id            VARCHAR(5) NOT NULL
, pharmacy_rider_cd                VARCHAR(4) NOT NULL
, cob_ind                          VARCHAR(20) NOT NULL
, cob_effective_dt                 DATE NOT NULL
, transaction_ts                   TIMESTAMP NOT NULL
, obligor_cd                       VARCHAR(2) NOT NULL
, speciality_ind                   CHAR(1) NOT NULL
, spclty_eff_dt                    DATE NOT NULL
, pick_lob_cd                      VARCHAR(10) NOT NULL
, gl_product_cd                    VARCHAR(6) NOT NULL
, gl_customer_cd                   VARCHAR(7) NOT NULL
, product_id                       VARCHAR(8) NOT NULL
, hm_dlvry_only_ind                CHAR(1) NOT NULL
, hm_dlvry_stat_ind                CHAR(1) NOT NULL
, rebates_only_ind                 CHAR(1) NOT NULL
, rebates_stat_ind                 CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, bseg_srv_typ                     VARCHAR(50)
, bseg_bus_typ                     VARCHAR(50)
, bseg_clt_typ                     VARCHAR(50)
, busns_typ                        VARCHAR(10)
, group_addr1                      VARCHAR(25)
, group_addr2                      VARCHAR(15)
, group_city_nm                    VARCHAR(20)
, group_state_cd_sk                BIGINT
, group_st_cd                      VARCHAR(2)
, group_zip_cd                     VARCHAR(5)
, group_cntry                      VARCHAR(3)
, cag_actv_flg                     CHAR(1)
)
DISTRIBUTE ON (CAG_SK);

