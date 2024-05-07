DROP TABLE ${STAGING_SCHEMA}.d_grp_level_rprt_u;

CREATE TABLE ${STAGING_SCHEMA}.d_grp_level_rprt_u
( subscriber_id                    BIGINT
, address_id                       VARCHAR(60)
, carrier_id                       VARCHAR(9)
, slice_id                         BIGINT
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

