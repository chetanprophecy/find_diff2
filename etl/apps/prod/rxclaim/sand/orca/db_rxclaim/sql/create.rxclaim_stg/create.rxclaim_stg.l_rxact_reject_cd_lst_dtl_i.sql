DROP TABLE ${STAGING_SCHEMA}.l_rxact_reject_cd_lst_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.l_rxact_reject_cd_lst_dtl_i
( rarcd_rejct_cd_sk                BIGINT
, rarcd_rejct_cd                   VARCHAR(3)
, rarcl_rejct_cd_list_nm           VARCHAR(10)
, rarcd_rejct_cd_desc              VARCHAR(25)
, rarcl_rejct_cd_list_nm_desc      VARCHAR(100)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

