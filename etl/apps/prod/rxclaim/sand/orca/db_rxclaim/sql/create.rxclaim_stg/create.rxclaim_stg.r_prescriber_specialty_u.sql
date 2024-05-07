DROP TABLE ${STAGING_SCHEMA}.r_prescriber_specialty_u;

CREATE TABLE ${STAGING_SCHEMA}.r_prescriber_specialty_u
( r_pbr_spclty_sk                  BIGINT NOT NULL
, pbr_spclty_sk                    BIGINT NOT NULL
, pbr_sk                           BIGINT NOT NULL
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

