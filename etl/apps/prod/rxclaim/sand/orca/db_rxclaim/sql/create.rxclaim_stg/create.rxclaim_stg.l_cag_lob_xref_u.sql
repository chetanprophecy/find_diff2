DROP TABLE ${STAGING_SCHEMA}.l_cag_lob_xref_u;

CREATE TABLE ${STAGING_SCHEMA}.l_cag_lob_xref_u
( cag_sk                           BIGINT
, carrier_id                       CHAR(30)
, account_id                       CHAR(40)
, employer_group_id                CHAR(30)
, lob                              CHAR(100)
, pdl                              CHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       CHAR(20)
, update_uid                       CHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

