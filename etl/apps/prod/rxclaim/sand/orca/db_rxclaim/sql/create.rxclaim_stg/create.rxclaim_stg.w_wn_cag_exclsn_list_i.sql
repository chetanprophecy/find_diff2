DROP TABLE ${STAGING_SCHEMA}.w_wn_cag_exclsn_list_i;

CREATE TABLE ${STAGING_SCHEMA}.w_wn_cag_exclsn_list_i
( carrier_sk                       BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, cag_exclsn_flg                   CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CARRIER_SK);

