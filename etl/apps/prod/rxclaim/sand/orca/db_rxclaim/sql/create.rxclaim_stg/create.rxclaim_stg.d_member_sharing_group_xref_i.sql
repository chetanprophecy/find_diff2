DROP TABLE ${STAGING_SCHEMA}.d_member_sharing_group_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_sharing_group_xref_i
( xref_id_sk                       BIGINT NOT NULL
, xref_id                          BIGINT NOT NULL
, cur_cag_sk                       BIGINT NOT NULL
, cur_carrier_sk                   BIGINT NOT NULL
, cur_mbr_sk                       BIGINT NOT NULL
, cur_carrier_id                   VARCHAR(9)
, cur_account_id                   VARCHAR(15)
, cur_group_id                     VARCHAR(15)
, cur_mbr_id                       VARCHAR(18)
, alt_cag_sk                       BIGINT NOT NULL
, alt_carrier_sk                   BIGINT NOT NULL
, alt_mbr_sk                       BIGINT NOT NULL
, alt_carrier_id                   VARCHAR(9)
, alt_account_id                   VARCHAR(15)
, alt_group_id                     VARCHAR(15)
, alt_mbr_id                       VARCHAR(18)
, cur_env_id                       VARCHAR(10) NOT NULL
, cur_family_id                    VARCHAR(18)
, alt_env_id                       VARCHAR(10)
, alt_family_id                    VARCHAR(18)
, alt_from_dt                      DATE
, alt_thru_dt                      DATE
, manual_ind                       CHAR(1) NOT NULL
, share_accum_ind                  CHAR(1) NOT NULL
, share_clncl_ind                  CHAR(1) NOT NULL
, family_id_linkage_ind            CHAR(1) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          BYTEINT
)
DISTRIBUTE ON (CUR_MBR_SK);

