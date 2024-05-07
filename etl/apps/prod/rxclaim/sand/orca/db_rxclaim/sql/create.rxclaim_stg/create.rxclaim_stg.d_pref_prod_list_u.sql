DROP TABLE ${STAGING_SCHEMA}.d_pref_prod_list_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pref_prod_list_u
( pref_prod_lst_sk                 BIGINT
, pref_prod_lst_id                 VARCHAR(10)
, pref_prod_lst_desc               VARCHAR(25)
, cov_class_typ_cd                 CHAR(1)
, plan_yr                          INTEGER
, qualfr_cd                        CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PREF_PROD_LST_SK);

