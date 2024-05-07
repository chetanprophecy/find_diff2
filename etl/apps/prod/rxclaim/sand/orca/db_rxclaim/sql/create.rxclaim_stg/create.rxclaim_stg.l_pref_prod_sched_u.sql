DROP TABLE ${STAGING_SCHEMA}.l_pref_prod_sched_u;

CREATE TABLE ${STAGING_SCHEMA}.l_pref_prod_sched_u
( pref_prod_sched_sk               BIGINT NOT NULL
, pref_prod_sched_id               VARCHAR(10)
, pref_prod_sched_desc             VARCHAR(25)
, multi_src_cd_y_tier              INTEGER
, multi_src_cd_o_tier              INTEGER
, multi_src_cd_n_tier              INTEGER
, multi_src_cd_m_tier              INTEGER
, brand_otc_tier                   INTEGER
, generic_otc_tier                 INTEGER
, medical_supplies_tier            INTEGER
, qualifier                        CHAR(1)
, compound_tier                    INTEGER
, add_date                         DATE
, chg_date                         DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

