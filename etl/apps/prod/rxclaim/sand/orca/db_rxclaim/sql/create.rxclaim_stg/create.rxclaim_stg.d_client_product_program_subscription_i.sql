DROP TABLE ${STAGING_SCHEMA}.d_client_product_program_subscription_i;

CREATE TABLE ${STAGING_SCHEMA}.d_client_product_program_subscription_i
( client_prod_pgm_sbscrptn_sk      BIGINT NOT NULL
, client_id                        VARCHAR(15) NOT NULL
, clncl_client_sk                  BIGINT NOT NULL
, client_nm                        VARCHAR(100)
, clncl_prod_id                    VARCHAR(25) NOT NULL
, clncl_prod_sk                    BIGINT NOT NULL
, clncl_prod_nm                    NVARCHAR(100)
, clncl_pgm_id                     VARCHAR(25) NOT NULL
, clncl_pgm_sk                     BIGINT NOT NULL
, clncl_pgm_nm                     NVARCHAR(100)
, sbscrptn_eff_dt                  DATE
, sbscrptn_end_dt                  DATE
, actv_stat                        CHAR(1)
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

