DROP TABLE ${STAGING_SCHEMA}.d_plan_adjud_u;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_adjud_u
( pln_adjud_sk                     BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, pln_cd                           VARCHAR(10)
, pln_cd_fnl                       VARCHAR(10)
, pln_typ_id                       VARCHAR(8)
, pln_fnl_eff_dt                   DATE
, pln_gpi_list                     VARCHAR(10)
, pln_grp_cd                       VARCHAR(10)
, pln_ndc_list                     VARCHAR(10)
, pln_pref_gpi_list_nm             VARCHAR(10)
, pln_pref_ndc_list_nm             VARCHAR(10)
, pln_qlfr                         VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

