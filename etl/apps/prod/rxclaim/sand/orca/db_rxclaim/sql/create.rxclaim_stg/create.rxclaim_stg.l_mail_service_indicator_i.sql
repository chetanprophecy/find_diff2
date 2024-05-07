DROP TABLE ${STAGING_SCHEMA}.l_mail_service_indicator_i;

CREATE TABLE ${STAGING_SCHEMA}.l_mail_service_indicator_i
( hm_dlvry_ind_sk                  BIGINT NOT NULL
, hm_dlvry_ind                     CHAR(1) NOT NULL
, hm_dlvry_ind_desc                VARCHAR(50) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

