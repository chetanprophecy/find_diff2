DROP TABLE ${STAGING_SCHEMA}.f_mpd_pde_audit_claim_u;

CREATE TABLE ${STAGING_SCHEMA}.f_mpd_pde_audit_claim_u
( claim_nbr                        BIGINT NOT NULL
, aud_cd                           VARCHAR(10) NOT NULL
, aud_cd_desc                      VARCHAR(24) NOT NULL
, aud_rsn_cd                       VARCHAR(24) NOT NULL
, aud_stat                         CHAR(1) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CLAIM_NBR);

