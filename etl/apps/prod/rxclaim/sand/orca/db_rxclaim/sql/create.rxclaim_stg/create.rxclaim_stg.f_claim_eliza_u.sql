DROP TABLE ${STAGING_SCHEMA}.f_claim_eliza_u;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_eliza_u
( claim_nbr                        BIGINT NOT NULL
, eliza_mbr_sk                     BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, ndc                              VARCHAR(11) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

