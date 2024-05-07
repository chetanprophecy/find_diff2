DROP TABLE ${STAGING_SCHEMA}.d_cms_prxy_ndc_mon_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cms_prxy_ndc_mon_u
( cms_prxy_ndc_mon_sk              BIGINT NOT NULL
, cms_prxy_ndc_sk                  BIGINT
, cms_ndc_sk                       BIGINT
, pde_prxy_ndc_sk                  BIGINT
, pde_ndc_sk                       BIGINT
, report_prxy_ndc_sk               BIGINT
, report_ndc_sk                    BIGINT
, proxy_ndc_id                     VARCHAR(20)
, ndc_id                           VARCHAR(20)
, rxcui                            VARCHAR(10)
, gpi_id                           VARCHAR(20)
, msc                              CHAR(1)
, prxy_ndc_label_nm                VARCHAR(100)
, crosstab_month                   VARCHAR(2)
, crosstab_year                    VARCHAR(4)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

