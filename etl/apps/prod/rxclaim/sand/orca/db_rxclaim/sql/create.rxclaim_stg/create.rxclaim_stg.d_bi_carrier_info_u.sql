DROP TABLE ${STAGING_SCHEMA}.d_bi_carrier_info_u;

CREATE TABLE ${STAGING_SCHEMA}.d_bi_carrier_info_u
( src_sys_id                       VARCHAR(3)
, carrier_id                       VARCHAR(30)
, carrier_nm                       VARCHAR(150)
, claim_bill_start_dt_sk           BIGINT
, carrier_type_cd                  VARCHAR(2)
, bi_prcng_type                    VARCHAR(3)
, bi_prcng_arngmnt_cd              VARCHAR(2)
, mi_tax_excl_ind                  CHAR(1)
, customer_type                    VARCHAR(15)
, cbs_payment_ind                  CHAR(1)
, reject_claim_supp_ind            CHAR(1)
, net_supp_ind                     CHAR(1)
, affiliation_cd                   VARCHAR(3)
, company_cd                       VARCHAR(3)
, cag_billing_ind                  CHAR(1)
, cbs_def_1                        VARCHAR(30)
, cbs_def_2                        VARCHAR(30)
, cbs_def_3                        VARCHAR(30)
, cbs_def_4                        VARCHAR(30)
, cbs_def_5                        VARCHAR(30)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

