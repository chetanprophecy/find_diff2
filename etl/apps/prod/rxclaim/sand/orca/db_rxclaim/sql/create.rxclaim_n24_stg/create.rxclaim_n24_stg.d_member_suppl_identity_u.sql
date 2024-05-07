DROP TABLE ${STAGING_SCHEMA}.d_member_suppl_identity_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_suppl_identity_u
( mbr_si_sk                        BIGINT
, mbr_sk                           BIGINT
, msi_suppl_id_type_sk             BIGINT
, cag_sk                           BIGINT
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, msi_seq_nbr                      INTEGER
, msi_stat_cd                      CHAR(1)
, msi_frm_dt                       DATE
, msi_thru_dt                      DATE
, msi_suppl_id_type                VARCHAR(2)
, msi_suppl_id                     VARCHAR(20)
, msi_free_txt                     VARCHAR(20)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

