DROP TABLE ${STAGING_SCHEMA}.d_member_diagnosis_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_diagnosis_i
( mem_diag_sk                      BIGINT NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, diag_sk                          BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, diag_qualifier                   VARCHAR(2)
, diag_typ_cd                      CHAR(1)
, diag_cd                          VARCHAR(20)
, mdx_seq_nbr                      INTEGER
, mdx_from_dt                      DATE
, mdx_thru_dt                      DATE
, mdx_stat                         CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

