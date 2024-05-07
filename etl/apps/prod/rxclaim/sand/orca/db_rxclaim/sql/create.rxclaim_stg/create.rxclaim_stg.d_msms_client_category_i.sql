DROP TABLE ${STAGING_SCHEMA}.d_msms_client_category_i;

CREATE TABLE ${STAGING_SCHEMA}.d_msms_client_category_i
( cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, policy_no                        VARCHAR(7)
, funding_arrangment_cd            CHAR(1)
, situs_state_cd                   VARCHAR(2)
, msms_catgry                      VARCHAR(30)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

