DROP TABLE ${STAGING_SCHEMA}.d_member_ancillary_client_info_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_ancillary_client_info_i
( mbr_anc_client_info_sk           BIGINT NOT NULL
, carrier_sk                       BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, amd_seq_nbr                      INTEGER NOT NULL
, amd_stat_cd                      CHAR(1)
, amd_eff_dt                       DATE
, amd_thru_dt                      DATE
, amd_client_defined_data          VARCHAR(300)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, src_add_dt                       DATE
, src_change_dt                    DATE
)
DISTRIBUTE ON (MBR_SK);

