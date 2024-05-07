DROP TABLE ${STAGING_SCHEMA}.d_member_prior_auth_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_prior_auth_i
( mpa_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT
, mbr_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, prior_auth_nbr                   VARCHAR(11)
, mpa_stat_cd                      CHAR(1)
, mpa_eff_dt                       DATE
, mpa_thru_dt                      DATE
, mpa_type_cd                      VARCHAR(2)
, mpa_prod_id                      VARCHAR(20)
, mpa_desc                         VARCHAR(60)
, mpa_agent_id                     CHAR(1)
, mpa_reason_cd                    VARCHAR(2)
, mpa_incident_id                  VARCHAR(25)
, mpa_ignore_stat_cd               CHAR(1)
, mpa_multi_src_cd                 CHAR(1)
, src_chg_dt                       DATE
, src_chg_timestamp                TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mpa_reason_cd_desc               VARCHAR(25)
);

