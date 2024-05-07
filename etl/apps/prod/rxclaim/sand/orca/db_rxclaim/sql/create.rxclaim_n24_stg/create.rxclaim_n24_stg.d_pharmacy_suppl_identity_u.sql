DROP TABLE ${STAGING_SCHEMA}.d_pharmacy_suppl_identity_u;

CREATE TABLE ${STAGING_SCHEMA}.d_pharmacy_suppl_identity_u
( phr_supp_id_sk                   BIGINT NOT NULL
, phr_sk                           BIGINT
, phr_id                           VARCHAR(20)
, phr_suppl_id_typ                 VARCHAR(20)
, phr_suppl_id_st_cd               VARCHAR(2)
, phr_suppl_id                     VARCHAR(20)
, phr_suppl_id_exp_dt              DATE
, phr_suppl_id_del_dt              DATE
, phr_suppl_id_stat                VARCHAR(10)
, src_chg_dt                       DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

