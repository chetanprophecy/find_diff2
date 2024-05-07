DROP TABLE ${STAGING_SCHEMA}.l_rxact_error_cd_i;

CREATE TABLE ${STAGING_SCHEMA}.l_rxact_error_cd_i
( raerr_err_cd_sk                  BIGINT
, raerr_err_cd                     VARCHAR(2)
, raerr_err_cd_desc                VARCHAR(50)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

