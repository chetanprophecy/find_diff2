DROP TABLE ${STAGING_SCHEMA}.r_pref_prod_sched_list_i;

CREATE TABLE ${STAGING_SCHEMA}.r_pref_prod_sched_list_i
( pref_prod_lst_sk                 BIGINT
, pref_prod_sched_sk               BIGINT
, pref_prod_lst_id                 VARCHAR(10)
, pref_prod_sched_id               VARCHAR(10)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PREF_PROD_LST_SK);

