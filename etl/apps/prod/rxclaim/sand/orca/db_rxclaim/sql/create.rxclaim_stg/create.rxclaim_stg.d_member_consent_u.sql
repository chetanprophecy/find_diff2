DROP TABLE ${STAGING_SCHEMA}.d_member_consent_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_consent_u
( mbr_consnt_sk                    BIGINT
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, consent_type_sk                  BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(18)
, consent_type_cd                  VARCHAR(10)
, mep_seq_nbr                      INTEGER
, consent_cd                       VARCHAR(10)
, mep_stat_cd                      CHAR(1)
, mep_eff_dt                       DATE
, mep_thru_dt                      DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

