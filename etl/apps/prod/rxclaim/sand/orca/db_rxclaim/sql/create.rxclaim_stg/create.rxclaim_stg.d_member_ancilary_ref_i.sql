DROP TABLE ${STAGING_SCHEMA}.d_member_ancilary_ref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_ancilary_ref_i
( cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, fld_nbr                          INTEGER
, fld_nm                           VARCHAR(20)
, fld_datatype                     VARCHAR(20)
, fld_max_len                      INTEGER
, fld_strt_pos                     INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

