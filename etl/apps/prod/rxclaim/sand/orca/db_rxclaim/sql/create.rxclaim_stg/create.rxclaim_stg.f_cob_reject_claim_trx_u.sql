DROP TABLE ${STAGING_SCHEMA}.f_cob_reject_claim_trx_u;

CREATE TABLE ${STAGING_SCHEMA}.f_cob_reject_claim_trx_u
( claim_nbr                        BIGINT NOT NULL
, claim_seq_nbr                    INTEGER NOT NULL
, cob_seq_nbr                      INTEGER NOT NULL
, cbr_seq_nbr                      INTEGER NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cbr_sbm_oth_pyr_rej_cde          CHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

