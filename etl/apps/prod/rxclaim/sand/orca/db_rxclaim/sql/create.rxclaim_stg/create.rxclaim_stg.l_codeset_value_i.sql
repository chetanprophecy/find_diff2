DROP TABLE ${STAGING_SCHEMA}.l_codeset_value_i;

CREATE TABLE ${STAGING_SCHEMA}.l_codeset_value_i
( codeset_sk                       BIGINT NOT NULL
, codeset_nm                       VARCHAR(30) NOT NULL
, codeset_nm_desc                  VARCHAR(200)
, codeset_val                      VARCHAR(15) NOT NULL
, codeset_sort_order               INTEGER
, codeset_val_desc                 VARCHAR(100)
, codeset_disp_desc                VARCHAR(100)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CODESET_SK);

