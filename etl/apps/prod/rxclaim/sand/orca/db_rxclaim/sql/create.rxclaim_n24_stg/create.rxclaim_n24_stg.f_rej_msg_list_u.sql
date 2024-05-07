DROP TABLE ${STAGING_SCHEMA}.f_rej_msg_list_u;

CREATE TABLE ${STAGING_SCHEMA}.f_rej_msg_list_u
( cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, claim_nbr                        BIGINT
, claim_seq_nbr                    BIGINT
, rcm_seq_nbr                      BIGINT
, rcm_addtl_msg_info_qlfr          CHAR(2)
, rcm_msg                          VARCHAR(40)
, rcm_addtl_msg_info_contd         CHAR(1)
, rcm_msg_cd                       VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

