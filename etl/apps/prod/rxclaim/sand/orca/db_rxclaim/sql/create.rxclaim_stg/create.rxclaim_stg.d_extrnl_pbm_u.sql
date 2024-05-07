DROP TABLE ${STAGING_SCHEMA}.d_extrnl_pbm_u;

CREATE TABLE ${STAGING_SCHEMA}.d_extrnl_pbm_u
( extrnl_pbm_id_sk                 BIGINT NOT NULL
, extrnl_pbm_id                    VARCHAR(10) NOT NULL
, extrnl_pbm_nm                    VARCHAR(25)
, extrnl_pbm_uuid                  VARCHAR(36)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          INTEGER
)
DISTRIBUTE ON (EXTRNL_PBM_ID_SK);

