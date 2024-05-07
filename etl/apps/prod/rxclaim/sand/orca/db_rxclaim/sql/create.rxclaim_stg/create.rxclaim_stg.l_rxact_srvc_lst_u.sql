DROP TABLE ${STAGING_SCHEMA}.l_rxact_srvc_lst_u;

CREATE TABLE ${STAGING_SCHEMA}.l_rxact_srvc_lst_u
( rasvl_srvc_lst_sk                BIGINT
, rasvl_srvc_lst_nm                VARCHAR(10)
, rasvl_srvc_lst_desc              VARCHAR(25)
, rasvl_delay_days                 VARCHAR(3)
, rasvl_delay_hrs                  VARCHAR(3)
, rasvl_delay_mnts                 VARCHAR(3)
, rasvl_updt_tb_ltr                CHAR(1)
, rasvl_srvc_elig_chk              CHAR(1)
, rasvl_look_back_period           VARCHAR(3)
, rasvl_nbr_of_gaps_alowd          VARCHAR(2)
, rasvl_time_of_gaps_oper          VARCHAR(2)
, rasvl_time_of_gaps               VARCHAR(3)
, rasvl_exe_profile                VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

