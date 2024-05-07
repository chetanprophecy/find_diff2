DROP TABLE ${STAGING_SCHEMA}.d_drug_price_sched_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_price_sched_i
( price_sched_sk                   BIGINT NOT NULL
, price_sched_nm                   VARCHAR(10) NOT NULL
, price_sched_desc                 VARCHAR(25)
, pay_sale_tax_flg                 CHAR(1)
, allw_zero_sbm_cost_flg           CHAR(1)
, awp_edt_flg                      CHAR(1)
, multi_ing_src_cd                 CHAR(1)
, multi_ing_psc_seq                INTEGER
, multi_ing_disp_fee_flg           CHAR(1)
, multi_ing_prf_srv_flg            CHAR(1)
, bas_reimb_deter_ovrd_cd          VARCHAR(2)
, src_insert_ts                    TIMESTAMP NOT NULL
, src_update_ts                    TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PRICE_SCHED_SK);

