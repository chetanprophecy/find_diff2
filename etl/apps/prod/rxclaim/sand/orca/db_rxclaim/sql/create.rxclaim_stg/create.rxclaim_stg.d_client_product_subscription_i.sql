DROP TABLE ${STAGING_SCHEMA}.d_client_product_subscription_i;

CREATE TABLE ${STAGING_SCHEMA}.d_client_product_subscription_i
( client_prod_sbscrptn_sk          BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, clncl_client_sk                  BIGINT NOT NULL
, clncl_prod_id                    VARCHAR(25) NOT NULL
, clncl_prod_sk                    BIGINT NOT NULL
, clncl_prod_nm                    NVARCHAR(100)
, ntwk_portal_option               NVARCHAR(50)
, sbscrptn_eff_dt                  DATE NOT NULL
, sbscrptn_end_dt                  DATE NOT NULL
, ivr_non_responder                NVARCHAR(50)
, roi_flg                          CHAR(1)
, roi_val                          NVARCHAR(3000)
, bil_at_prod_flg                  CHAR(1)
, performance_guar_flg             CHAR(1)
, priorty                          DECIMAL(38)
, cpp_creat_ts                     TIMESTAMP NOT NULL
, cpp_creat_by                     VARCHAR(20) NOT NULL
, cpp_update_ts                    TIMESTAMP
, cpp_update_by                    VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
);

