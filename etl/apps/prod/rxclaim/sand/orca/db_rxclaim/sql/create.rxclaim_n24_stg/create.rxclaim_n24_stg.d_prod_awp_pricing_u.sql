DROP TABLE ${STAGING_SCHEMA}.d_prod_awp_pricing_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_awp_pricing_u
( prod_awp_prcng_sk                BIGINT NOT NULL
, prod_sk                          BIGINT NOT NULL
, prod_id                          VARCHAR(20) NOT NULL
, prod_id_qlfr_cd                  VARCHAR(3) NOT NULL
, cost_type_cd                     VARCHAR(15) NOT NULL
, cost_type_cd_sub                 VARCHAR(15)
, pkg_price                        DECIMAL(19,4)
, unit_price                       DECIMAL(13,5)
, eff_dt                           TIMESTAMP
, eff_dt_thru                      TIMESTAMP
, is_fst_dt                        BYTEINT
, is_lst_dt                        BYTEINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

