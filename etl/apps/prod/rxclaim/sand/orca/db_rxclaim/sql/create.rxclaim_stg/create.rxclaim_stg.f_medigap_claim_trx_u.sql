DROP TABLE ${STAGING_SCHEMA}.f_medigap_claim_trx_u;

CREATE TABLE ${STAGING_SCHEMA}.f_medigap_claim_trx_u
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, sub_medigap_id                   VARCHAR(20)
, sbm_medicaid_ind                 VARCHAR(2)
, sbm_prvdr_accpt_asg_flg          CHAR(1)
, sbm_partd_quafd_fcty_flg         CHAR(1)
, sbm_medicaid_id_nbr              VARCHAR(20)
, sbm_medicaid_agency_nbr          VARCHAR(15)
, sbm_medicaid_sbg_tnicn           VARCHAR(20)
, sbm_medicaid_paid_amt            INTEGER
, rsp_medicaid_id_nbr              VARCHAR(20)
, rsp_medicaid_agency_nbr          VARCHAR(15)
, rsp_medicaid_sbg_tnicn           VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

