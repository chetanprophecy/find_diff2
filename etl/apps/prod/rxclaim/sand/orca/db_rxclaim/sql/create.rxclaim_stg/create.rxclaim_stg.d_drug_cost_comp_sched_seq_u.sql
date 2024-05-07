DROP TABLE ${STAGING_SCHEMA}.d_drug_cost_comp_sched_seq_u;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_cost_comp_sched_seq_u
( drug_cost_comp_sched_seq_sk      BIGINT NOT NULL
, drug_cost_comp_sched             VARCHAR(14) NOT NULL
, drug_cost_comp_sched_seq_nbr     INTEGER NOT NULL
, drug_cost_src                    VARCHAR(10)
, drug_cost_type                   VARCHAR(10)
, carrier_id                       VARCHAR(9)
, mac_list                         VARCHAR(10)
, st_src                           CHAR(1)
, drug_cost_perct                  DECIMAL(5,2)
, availability_rule_cd             CHAR(1)
, ndc_bas_mac_flg                  CHAR(1)
, fee_fld                          VARCHAR(2)
, drug_cost_rate_amt               DECIMAL(5,2)
, fee_sched_nm                     VARCHAR(10)
, step_nbr_in_fee_sched            INTEGER
, st_price                         CHAR(1)
, qualfr_340b_flg                  CHAR(1)
, mli_id                           VARCHAR(10)
, unit_cost_adj_perct              DECIMAL(5,2)
, reimb_bas_ovrd                   VARCHAR(2)
, st_price_tbl                     VARCHAR(10)
, src_insert_ts                    TIMESTAMP
, src_update_ts                    TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DRUG_COST_COMP_SCHED_SEQ_SK);

