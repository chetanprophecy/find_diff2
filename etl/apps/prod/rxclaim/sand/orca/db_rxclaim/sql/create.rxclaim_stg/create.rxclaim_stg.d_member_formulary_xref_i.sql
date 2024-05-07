DROP TABLE ${STAGING_SCHEMA}.d_member_formulary_xref_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_formulary_xref_i
( mbr_frmlry_sk                    BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, mbr_prsn_cd                      VARCHAR(6)
, mbr_relshp_cd                    CHAR(1)
, mb_first_nm                      VARCHAR(50)
, mb_last_nm                       VARCHAR(70)
, mbr_dt_of_brth                   DATE
, client_id                        VARCHAR(7)
, formulary_mbr_id                 VARCHAR(20)
, job_nm                           VARCHAR(10)
, job_usr                          VARCHAR(20)
, job_nbr                          BIGINT
, src_add_dt                       DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

