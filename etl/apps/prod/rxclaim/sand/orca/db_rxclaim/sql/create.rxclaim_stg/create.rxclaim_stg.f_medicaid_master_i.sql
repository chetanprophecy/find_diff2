DROP TABLE ${STAGING_SCHEMA}.f_medicaid_master_i;

CREATE TABLE ${STAGING_SCHEMA}.f_medicaid_master_i
( cag_sk                           BIGINT
, sys_id                           CHAR(3)
, rxc_nbr                          BIGINT
, claim_seq_nbr                    INTEGER
, claim_stat_id                    CHAR(1)
, sbm_dt_sk                        BIGINT
, srvc_dt_sk                       BIGINT
, dispng_stat_id                   CHAR(1)
, prov_id                          CHAR(10)
, phr_sk                           BIGINT
, pbr_sk                           BIGINT
, non_qual_id                      CHAR(1)
, gen_txt_10                       CHAR(10)
, gen_txt_20                       CHAR(20)
, gen_amt                          DECIMAL(9,2)
, gen_dt_sk                        BIGINT
, ignore_trans_flg                 CHAR(1)
, pd_stat_ind                      CHAR(1)
, pend_reason_cd                   CHAR(1)
, pd_dttm                          TIMESTAMP
, pd_file_nm                       CHAR(10)
, pd_transaction_id                CHAR(10)
, pd_batch_nbr                     CHAR(7)
, pd_accept_file_id                CHAR(10)
, pd_accept_dt_sk                  BIGINT
, pd_accept_resp_stat              CHAR(1)
, pd_resp_rej_cd_sk                BIGINT
, rvrsl_stat_ind                   CHAR(1)
, rvrsl_pend_reason_cd             CHAR(1)
, rvrsl_dttm                       TIMESTAMP
, rvrsl_file_nm                    CHAR(10)
, rvrsl_transcation_id             CHAR(10)
, rvrsl_batch_nbr                  CHAR(7)
, rvrsl_accept_file_id             CHAR(10)
, rvrsl_accept_dt_sk               BIGINT
, rvrsl_client_resp_stat           CHAR(1)
, rvrsl_resp_rej_cd_sk             BIGINT
, pd_resp_auth_nbr                 CHAR(20)
, pd_orig_auth_nbr                 CHAR(20)
, pd_orig_batch_nbr                CHAR(7)
, rvrsl_resp_auth_nbr              CHAR(20)
, rvrsl_orig_auth_nbr              CHAR(20)
, rvrsl_org_batch_nbr              CHAR(7)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mbr_sk                           BIGINT
);

