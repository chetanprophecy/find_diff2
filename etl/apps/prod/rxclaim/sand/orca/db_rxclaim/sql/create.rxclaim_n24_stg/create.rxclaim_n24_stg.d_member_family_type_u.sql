DROP TABLE ${STAGING_SCHEMA}.d_member_family_type_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_family_type_u
( mbr_fam_typ_sk                   BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mbr_fam_typ_cd                   CHAR(1)
, mbr_fam_seq_nbr                  INTEGER NOT NULL
, mbr_fam_eff_dt                   DATE
, mbr_fam_thru_dt                  DATE
, mbr_fam_stat_cd                  CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

