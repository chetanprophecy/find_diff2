DROP TABLE ${STAGING_SCHEMA}.d_prescriber_taxonomy_i;

CREATE TABLE ${STAGING_SCHEMA}.d_prescriber_taxonomy_i
( pbr_taxonomy_sk                  BIGINT NOT NULL
, pbr_sk                           BIGINT
, htc_taxnomy_cd                   VARCHAR(10)
, htc_seq_no                       DECIMAL(5)
, phz_seq_no                       DECIMAL(5)
, phz_taxnomy_desc                 VARCHAR(400)
, phz_rec_stat                     CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

