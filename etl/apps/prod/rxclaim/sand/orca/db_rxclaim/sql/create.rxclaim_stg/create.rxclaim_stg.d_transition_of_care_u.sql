DROP TABLE ${STAGING_SCHEMA}.d_transition_of_care_u;

CREATE TABLE ${STAGING_SCHEMA}.d_transition_of_care_u
( toc_sk                           BIGINT
, toc_id                           VARCHAR(10)
, toc_desc                         VARCHAR(100)
, toc_ndc_list_nm                  VARCHAR(10)
, toc_gpi_list_nm                  VARCHAR(10)
, toc_excl_ndc_list_nm             VARCHAR(10)
, toc_ovrd_sched                   VARCHAR(10)
, toc_elig_lvl                     CHAR(1)
, toc_elig_dt_cd                   CHAR(1)
, toc_period_length                INTEGER
, toc_grace_days                   INTEGER
, toc_ds_pf_min                    INTEGER
, toc_ds_pf_max                    INTEGER
, toc_ds_ptd_max                   INTEGER
, toc_ds_ptd_prod_lvl              CHAR(1)
, toc_ds_ptd_wildcrd               VARCHAR(2)
, toc_fill_limit_ptd_max           INTEGER
, toc_fill_limit_ptd_prod_lvl      CHAR(1)
, toc_fill_limit_ptd_wildcrd       VARCHAR(2)
, src_insert_uid                   VARCHAR(10)
, src_insert_dt                    DATE
, src_insert_tm                    TIME
, src_insert_prog_nm               VARCHAR(10)
, src_update_uid                   VARCHAR(10)
, src_update_dt                    DATE
, src_update_tm                    TIME
, src_update_prog_nm               VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

