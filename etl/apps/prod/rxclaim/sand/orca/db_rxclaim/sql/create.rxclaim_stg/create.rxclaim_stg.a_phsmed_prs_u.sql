DROP TABLE ${STAGING_SCHEMA}.a_phsmed_prs_u;

CREATE TABLE ${STAGING_SCHEMA}.a_phsmed_prs_u
( carrier_id                       VARCHAR(9)
, submarket_id                     CHAR(10)
, care_fac_adjud_sk                BIGINT
, cal_yr_qtr_id                    BIGINT
, pbr_sk                           BIGINT
, pbr_npi_id                       VARCHAR(10)
, pbr_dea_cd                       VARCHAR(7)
, pbr_spclty_cd                    VARCHAR(6)
, pbr_spclty_desc                  VARCHAR(50)
, mbr_sk                           BIGINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

