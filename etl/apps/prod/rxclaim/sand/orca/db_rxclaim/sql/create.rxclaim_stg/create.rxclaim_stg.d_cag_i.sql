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
, mbr_group_id                     VARCHAR(10)
, plan_option_id                   VARCHAR(10)
, pcmt_mbr_group_contrct_id        VARCHAR(20)
, pcmt_plan_id                     VARCHAR(30)
, legacy_group_id                  VARCHAR(10)
, legacy_csp                       VARCHAR(30)
, revn_ind                         VARCHAR(2)
, orignl_src_sys_typ               VARCHAR(10)
, grp_renewal_dt                   DATE NOT NULL
, cag_sense_sk                     BIGINT
, health_plan                      VARCHAR(360)
, cag_src                          VARCHAR(50)
, source_del_flg                   SMALLINT
, match_grade                      INTEGER
, test_flg                         SMALLINT
, legacy_org                       VARCHAR(255)
, pricing_type                     VARCHAR(255)
, segment                          VARCHAR(255)
, lob                              VARCHAR(255)
, hospice_tier                     VARCHAR(255)
, malvl                            VARCHAR(10)
, suppress                         VARCHAR(255)
, prd_grp                          VARCHAR(255)
, funding_arrangment_desc          VARCHAR(255)
, mod_custid                       VARCHAR(255)
, reb_payeeid                      VARCHAR(255)
, geography                        VARCHAR(3)
, client_affiliation               VARCHAR(50)
, fdm_client_id                    VARCHAR(5)
, mdm_cageid                       VARCHAR(400)
, carve_typ                        VARCHAR(50)
, erisa_ind                        VARCHAR(10)
, inhouse_phr                      VARCHAR(255)
, live_cnt                         BIGINT
, cov_type                         VARCHAR(255)
, prior_auth_sys                   VARCHAR(255)
, prior_auth_user                  VARCHAR(255)
, emplr_tin                        VARCHAR(255)
, rx_bin                           VARCHAR(255)
, rx_pcn                           VARCHAR(255)
, rx_grp_nbr                       VARCHAR(255)
, clncl_acct_lvl                   VARCHAR(50)
, clncl_client_nm                  VARCHAR(255)
, clncl_clean_nm                   VARCHAR(255)
, clncl_client_rollup_nm           VARCHAR(255)
, clncl_st                         VARCHAR(50)
, clncl_rgn                        VARCHAR(50)
, clncl_eff_dt                     DATE
, clncl_trmntn_dt                  DATE
, clncl_trans_dt                   DATE
, clncl_platform                   VARCHAR(50)
, sub_price_type                   VARCHAR(100)
, client_stat                      VARCHAR(50)
, curr_rx_cnt                      BIGINT
, spread_type                      VARCHAR(50)
, src_env_nm                       VARCHAR(100)
, inr_user_flg                     SMALLINT
, clncl_user_flg                   SMALLINT
, adhc_user_flg                    SMALLINT
, sec_flg                          SMALLINT
, coalition_nm                     VARCHAR(50)
, coalition_eff_dt                 DATE
, coalition_trmntn_dt              DATE
, rx_client_id                     BIGINT
, cag_grp                          VARCHAR(50)
, hcit_flg                         BIGINT
)
DISTRIBUTE ON (CAG_SK);

