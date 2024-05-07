DROP TABLE ${STAGING_SCHEMA}.l_drug_cost_sched_u;

CREATE TABLE ${STAGING_SCHEMA}.l_drug_cost_sched_u
( drug_cost_sched_sk               INTEGER NOT NULL
, drug_cost_sched_nm               VARCHAR(13) NOT NULL
, drug_cost_sched_desc             VARCHAR(25)
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
DISTRIBUTE ON (DRUG_COST_SCHED_SK);

