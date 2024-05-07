DROP TABLE ${STAGING_SCHEMA}.f_repriced_claims_i;

CREATE TABLE ${STAGING_SCHEMA}.f_repriced_claims_i
( client_id                        VARCHAR(50)
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, mbr_id                           VARCHAR(20)
, nabp_nbr                         VARCHAR(7)
, gpi_14                           VARCHAR(14)
, formulary_flg                    CHAR(1)
, mail_retail_flg                  CHAR(1)
, claim_date                       TIMESTAMP
, claim_stat_id                    CHAR(1)
, rx_count                         INTEGER
, day_supply                       SMALLINT
, drug_qty                         DECIMAL(11,3)
, awp                              DECIMAL(24,8)
, ingredient_cost                  DECIMAL(9,2)
, dispensing_fee                   DECIMAL(9,2)
, mbr_paid                         DECIMAL(15,2)
, plan_paid                        DECIMAL(15,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

