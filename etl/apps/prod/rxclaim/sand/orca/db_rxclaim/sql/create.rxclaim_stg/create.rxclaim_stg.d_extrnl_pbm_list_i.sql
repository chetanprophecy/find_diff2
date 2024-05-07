DROP TABLE ${STAGING_SCHEMA}.d_extrnl_pbm_list_i;

CREATE TABLE ${STAGING_SCHEMA}.d_extrnl_pbm_list_i
( extrnl_pbm_list_id_sk            BIGINT NOT NULL
, extrnl_pbm_list_id               VARCHAR(10) NOT NULL
, extrnl_pbm_list_nm               VARCHAR(25)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          INTEGER
)
DISTRIBUTE ON (EXTRNL_PBM_LIST_ID_SK);

