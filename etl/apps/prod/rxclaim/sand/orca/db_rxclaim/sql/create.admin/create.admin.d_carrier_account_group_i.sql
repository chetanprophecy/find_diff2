DROP TABLE ${STAGING_SCHEMA}.d_carrier_account_group_i;

CREATE TABLE ${STAGING_SCHEMA}.d_carrier_account_group_i
( carrier_account_group_key        BIGINT NOT NULL
, bus_organization_code            VARCHAR(60) NOT NULL
, super_carrier_key                INTEGER NOT NULL
, super_carrier_id                 VARCHAR(20) NOT NULL
, carrier_id                       VARCHAR(9) NOT NULL
, account_id                       VARCHAR(15) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, carrier_category_id              VARCHAR(1)
, super_carrier_desc               VARCHAR(80)
, carrier_desc                     VARCHAR(45)
, account_desc                     VARCHAR(45)
, employer_group_desc              VARCHAR(45)
, carrier_category_desc            VARCHAR(30)
, carrier_state                    VARCHAR(2)
, acct_client_type_id              VARCHAR(30)
, acct_client_type_desc            VARCHAR(80)
, acct_product_type_id             VARCHAR(30)
, acct_product_type_desc           VARCHAR(80)
, acct_product_line_id             VARCHAR(30)
, acct_product_line_desc           VARCHAR(80)
, acct_territory_id                DECIMAL(2)
, acct_territory_desc              VARCHAR(30)
, contract_num                     VARCHAR(5)
, pbp_id                           VARCHAR(3)
, gps_plan_code                    VARCHAR(3)
, current_flag                     CHAR(1) NOT NULL
, orcale_client_code               VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      TINYINT
);

