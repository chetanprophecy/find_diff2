DROP TABLE ${STAGING_SCHEMA}.d_prod_alternate_drug_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_alternate_drug_u
( prod_alt_drg_sk                  BIGINT NOT NULL
, prod_sk                          BIGINT
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, target_drug                      VARCHAR(15)
, alternate_drug                   VARCHAR(150)
, alt_daily_cost                   DECIMAL(9,2)
, alt_drg_comments                 VARCHAR(50)
, eff_frm_dt                       DATE
, eff_thru_dt                      DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

