DROP TABLE ${STAGING_SCHEMA}.l_drug_cost_comparison_schedule_i;

CREATE TABLE ${STAGING_SCHEMA}.l_drug_cost_comparison_schedule_i
( drug_cost_comp_sched_sk          BIGINT NOT NULL
, drug_cost_comp_sched             VARCHAR(14) NOT NULL
, drug_cost_comp_sched_desc        VARCHAR(25) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DRUG_COST_COMP_SCHED_SK);

