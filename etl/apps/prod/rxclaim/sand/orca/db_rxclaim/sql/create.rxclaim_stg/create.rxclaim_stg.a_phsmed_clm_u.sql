DROP TABLE ${STAGING_SCHEMA}.a_phsmed_clm_u;

CREATE TABLE ${STAGING_SCHEMA}.a_phsmed_clm_u
( carrier_id                       VARCHAR(9)
, submarket_id                     CHAR(10)
, care_fac_adjud_sk                BIGINT
, cal_yr_qtr_id                    BIGINT
, drg_ndc_desc                     VARCHAR(11)
, drg_class_id                     VARCHAR(4)
, drg_subclass_id                  VARCHAR(6)
, pbr_sk                           BIGINT
, pbr_id                           VARCHAR(15)
, formulary_flg                    CHAR(1)
, gnrc_mdspn_ind                   CHAR(1)
, claim_cntr                       BIGINT
, days_sply                        BIGINT
, amount_paid                      DECIMAL(15,2)
, copay                            DECIMAL(15,2)
, ingredient_cost                  DECIMAL(15,2)
, rxcount_formulary                INTEGER
, rxcount_generic                  INTEGER
, rxcount_formulary_generic        INTEGER
, rxcount_brand                    INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

