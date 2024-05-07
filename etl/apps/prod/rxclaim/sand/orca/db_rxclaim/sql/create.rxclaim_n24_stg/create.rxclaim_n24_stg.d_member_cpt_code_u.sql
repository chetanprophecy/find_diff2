DROP TABLE ${STAGING_SCHEMA}.d_member_cpt_code_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_cpt_code_u
( mem_cpt_sk                       BIGINT NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mce_cpt_cd                       VARCHAR(5)
, mce_seq_nbr                      INTEGER
, mce_from_dt                      DATE
, mce_thru_dt                      DATE
, mce_medical_clm_nbr              VARCHAR(20)
, mce_stat                         CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

