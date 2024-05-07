DROP TABLE ${STAGING_SCHEMA}.f_cob_cop_other_payer_u;

CREATE TABLE ${STAGING_SCHEMA}.f_cob_cop_other_payer_u
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, cob_seq_nbr                      INTEGER
, cop_seq_nbr                      INTEGER
, cop_oth_pyr_id_qlfr              VARCHAR(2)
, cop_oth_pyr_rsp_amt              DECIMAL(11,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
);

