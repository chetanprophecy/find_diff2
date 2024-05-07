DROP TABLE ${STAGING_SCHEMA}.d_plan_toc_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_plan_toc_xref_i
( pln_toc_sk                       BIGINT
, pln_sk                           BIGINT
, toc_sk                           BIGINT
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, clar_cd_sel_order                CHAR(1)
, pqe_msg_typ                      CHAR(1)
, toc_id                           VARCHAR(10)
, toc_from_dt                      DATE
, toc_thru_dt                      DATE
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

