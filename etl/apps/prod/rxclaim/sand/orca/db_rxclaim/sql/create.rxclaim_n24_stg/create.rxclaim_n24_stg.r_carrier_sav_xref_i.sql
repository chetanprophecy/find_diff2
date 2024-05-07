DROP TABLE ${STAGING_SCHEMA}.r_carrier_sav_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.r_carrier_sav_xref_i
( carrier_sk                       BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, sav_carrier_sk                   BIGINT NOT NULL
, sav_cag_sk                       BIGINT NOT NULL
, sav_carrier_id                   VARCHAR(30) NOT NULL
, sav_account_id                   VARCHAR(40) NOT NULL
, sav_employer_group_id            VARCHAR(30) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (SAV_CAG_SK);

