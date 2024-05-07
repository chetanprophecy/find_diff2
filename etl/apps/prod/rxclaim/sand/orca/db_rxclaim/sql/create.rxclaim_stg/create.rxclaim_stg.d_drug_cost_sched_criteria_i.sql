DROP TABLE ${STAGING_SCHEMA}.d_drug_cost_sched_criteria_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_cost_sched_criteria_i
( drug_cost_sched_criteria_sk      BIGINT NOT NULL
, drug_cost_sched_sk               INTEGER NOT NULL
, drug_cost_sched_nm               VARCHAR(13) NOT NULL
, drug_cost_sched_seq_nbr          INTEGER NOT NULL
, psc_all_flg                      BYTEINT
, psc_0_flg                        BYTEINT
, psc_1_flg                        BYTEINT
, psc_2_flg                        BYTEINT
, psc_3_flg                        BYTEINT
, psc_4_flg                        BYTEINT
, psc_5_flg                        BYTEINT
, psc_6_flg                        BYTEINT
, psc_7_flg                        BYTEINT
, psc_8_flg                        BYTEINT
, psc_9_flg                        BYTEINT
, fda_equivalency_rating           VARCHAR(2)
, max_day_sppl                     INTEGER
, max_sbm_drug_cost                DECIMAL(9,2)
, max_qty                          DECIMAL(10,3)
, drug_cost_comp_sched             VARCHAR(14)
, comparison_type                  VARCHAR(2)
, rejct_cd_sk                      INTEGER
, rejct_cd                         VARCHAR(3)
, msg_cd                           VARCHAR(10)
, msg_type                         CHAR(1)
, awp_comparison_flg               CHAR(1)
, usual_and_custmry                DECIMAL(10,2)
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
DISTRIBUTE ON (DRUG_COST_SCHED_CRITERIA_SK);

