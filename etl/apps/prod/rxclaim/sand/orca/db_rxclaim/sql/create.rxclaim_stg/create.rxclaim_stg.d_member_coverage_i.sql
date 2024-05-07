DROP TABLE ${STAGING_SCHEMA}.d_member_coverage_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_coverage_i
( mbr_cov_sk                       BIGINT
, mbr_sk                           BIGINT
, cag_sk                           BIGINT
, mbr_id                           VARCHAR(18)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mmc_cov_typ_cd                   CHAR(1)
, mmc_seq_nbr                      INTEGER
, mmc_stat_cd                      CHAR(1)
, mmc_from_dt                      DATE
, mmc_thru_dt                      DATE
, mmc_bin_nbr                      VARCHAR(6)
, mmc_prc_ctl_nbr                  VARCHAR(10)
, mmc_sbm_grp_nbr                  VARCHAR(15)
, mmc_mbr_id                       VARCHAR(20)
, mmc_prsn_cd                      VARCHAR(3)
, mmc_cov_catgy                    CHAR(1)
, mmc_help_desk_tel_nbr            VARCHAR(10)
, mmc_supp_type_cd                 CHAR(1)
, mmc_cov_id                       VARCHAR(40)
, mmc_tpl_src_id                   VARCHAR(10)
, mmc_tpl_src_cd                   VARCHAR(3)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_COV_SK);

