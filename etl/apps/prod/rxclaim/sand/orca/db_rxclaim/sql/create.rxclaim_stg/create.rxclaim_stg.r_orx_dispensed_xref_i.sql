DROP TABLE ${STAGING_SCHEMA}.r_orx_dispensed_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.r_orx_dispensed_xref_i
( orx_dspnsd_xref_sk               BIGINT NOT NULL
, orx_dspnsd_ncpdp                 VARCHAR(12)
, orx_dspnsd_ind                   VARCHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

