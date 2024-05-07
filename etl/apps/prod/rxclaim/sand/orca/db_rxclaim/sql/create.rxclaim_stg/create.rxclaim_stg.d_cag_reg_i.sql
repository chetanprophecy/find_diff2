DROP TABLE ${STAGING_SCHEMA}.d_cag_reg_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_reg_i
( cag_reg_sk                       BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_sk                       BIGINT NOT NULL
, platform_id_sk                   BIGINT NOT NULL
, env_id_sk                        BIGINT NOT NULL
, carrier_id                       VARCHAR(9) NOT NULL
, account_id                       VARCHAR(15) NOT NULL
, employer_group_id                VARCHAR(15) NOT NULL
, employer_group_nm                VARCHAR(25)
, client_nm                        VARCHAR(50)
, carrier_nm                       VARCHAR(25)
, account_nm                       VARCHAR(25)
, client_legal_entity_nm           VARCHAR(50)
, tic_nm_of_reporting_entity       VARCHAR(50)
, client_stat_cd_sk                BIGINT NOT NULL
, tic_unique_file_id               VARCHAR(53)
, tic_file_agg_lvl                 VARCHAR(20)
, tic_typ_of_pln_markt_cd_sk       BIGINT NOT NULL
, servc_typ_cd_sk                  BIGINT NOT NULL
, busns_typ_cd_sk                  BIGINT NOT NULL
, clint_typ_cd_sk                  BIGINT NOT NULL
, tic_typ_of_entty_cd_sk           BIGINT NOT NULL
, clint_busns_typ_cd_sk            BIGINT NOT NULL
, tic_plan_nm                      VARCHAR(50)
, tic_plan_id_typ_cd_sk            BIGINT NOT NULL
, tic_plan_id                      VARCHAR(14)
, client_contrct_id                VARCHAR(10)
, fundng_typ_cd_sk                 BIGINT NOT NULL
, subjct_to_erisa_cd_sk            BIGINT NOT NULL
, fundng_plus_erisa_cd_sk          BIGINT NOT NULL
, plan_situs                       VARCHAR(50)
, naic                             VARCHAR(5)
, govrnmntl_enty                   VARCHAR(15)
, rx_contrct_enty_cd_sk            BIGINT NOT NULL
, rx_pcn                           VARCHAR(10)
, rx_bin                           VARCHAR(10)
, emplyr_tin                       VARCHAR(9)
, insr_tpa_tin                     VARCHAR(9)
, covrg_typ_cd_sk                  BIGINT NOT NULL
, medicare_secndry_payr_cd_sk      BIGINT NOT NULL
, emplyr_size_cd_sk                BIGINT NOT NULL
, grp_polcy_numbr                  VARCHAR(20)
, orignl_contrct_effctv_dt         DATE
, curnt_contrct_effctv_dt          DATE
, curnt_contrct_termntn_dt         DATE
, finl_contrct_termntn_dt          DATE
, natnl_helth_plan                 VARCHAR(20)
, prior_auth_user                  VARCHAR(15)
, prior_auth_systm_cd_sk           BIGINT NOT NULL
, prior_auth_appl_lvl_cd_sk        BIGINT NOT NULL
, busns_addr_street                VARCHAR(55)
, busns_addr_city                  VARCHAR(25)
, busns_addr_state_cd_sk           BIGINT NOT NULL
, busns_addr_zip                   VARCHAR(10)
, country_cd_sk                    BIGINT NOT NULL
, rx_toll_free_numbr               VARCHAR(20)
, website                          VARCHAR(50)
, phone_busns                      VARCHAR(20)
, account_mangr                    VARCHAR(30)
, tic_pct_client_rebates_withheld  DECIMAL(30,8)
, tic_other_fees                   DECIMAL(30,8)
, tic_client_pricing_cd_sk         BIGINT NOT NULL
, tic_payor_issr_nm                VARCHAR(50)
, future_use1                      VARCHAR(50)
, future_use2                      VARCHAR(50)
, future_use3                      VARCHAR(50)
, future_use4                      VARCHAR(50)
, future_use5                      VARCHAR(50)
, future_use6                      VARCHAR(50)
, future_use7                      VARCHAR(50)
, future_use8                      VARCHAR(50)
, future_use9                      VARCHAR(50)
, future_use10                     VARCHAR(50)
, future_use11                     VARCHAR(50)
, future_use12                     VARCHAR(50)
, future_use13                     VARCHAR(50)
, future_use14                     VARCHAR(50)
, future_use15                     VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CAG_REG_SK);

