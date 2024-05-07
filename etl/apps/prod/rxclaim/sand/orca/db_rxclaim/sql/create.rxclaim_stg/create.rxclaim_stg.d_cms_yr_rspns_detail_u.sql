DROP TABLE ${STAGING_SCHEMA}.d_cms_yr_rspns_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_yr_rspns_detail_u
( rspns_detail_sk                  BIGINT
, contract_id                      VARCHAR(5)
, prod_id                          VARCHAR(20)
, phr_id                           VARCHAR(15)
, pde_filled_dt                    DATE
, pde_ingrd_cost                   DECIMAL(9,2)
, pde_dispng_fee                   DECIMAL(9,2)
, pde_qty_dispng                   DECIMAL(9,3)
, pde_days_of_supply               SMALLINT
, bi_week_period                   VARCHAR(21)
, mpf_unit_cost                    DECIMAL(9,4)
, mpf_dispng_brnd                  DECIMAL(9,4)
, mpf_dispng_gene                  DECIMAL(9,4)
, mpf_floor_price                  DECIMAL(9,4)
, cal_gene_ind                     VARCHAR(1)
, cal_pde_tot_cost                 DECIMAL(15,2)
, cal_mpf_tot_cost                 DECIMAL(15,4)
, cal_diff_tot_cost                DECIMAL(15,4)
, cms_rspns_mn                     INTEGER
, rspns_file_ind                   VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cms_rspns_style_ind              CHAR(1)
);

