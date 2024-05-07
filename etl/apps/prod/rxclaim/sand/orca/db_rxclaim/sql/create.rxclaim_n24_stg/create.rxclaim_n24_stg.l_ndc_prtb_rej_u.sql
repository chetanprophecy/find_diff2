DROP TABLE ${STAGING_SCHEMA}.l_ndc_prtb_rej_u;

CREATE TABLE ${STAGING_SCHEMA}.l_ndc_prtb_rej_u
( ndc_prtb_rej_sk                  BIGINT NOT NULL
, ndc_id                           VARCHAR(11)
, gpi_id                           VARCHAR(14)
, part_b_flg                       CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

