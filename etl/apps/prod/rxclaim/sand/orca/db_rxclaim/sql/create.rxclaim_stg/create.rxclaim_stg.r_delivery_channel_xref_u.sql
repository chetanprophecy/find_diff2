DROP TABLE ${STAGING_SCHEMA}.r_delivery_channel_xref_u;

CREATE TABLE ${STAGING_SCHEMA}.r_delivery_channel_xref_u
( dlvry_chanl_xref_sk              BIGINT NOT NULL
, dlvry_chanl_ncpdp                VARCHAR(12)
, dlvry_chanl                      VARCHAR(25)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

