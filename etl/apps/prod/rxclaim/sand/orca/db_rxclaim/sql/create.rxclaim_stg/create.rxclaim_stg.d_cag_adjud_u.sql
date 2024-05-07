DROP TABLE ${STAGING_SCHEMA}.d_cag_adjud_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_adjud_u
( cag_adjud_sk                     BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(15) NOT NULL
, client_id                        VARCHAR(50) NOT NULL
, client_rgn_cd                    VARCHAR(2)
, client_seg_cd                    VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

