DROP TABLE ${STAGING_SCHEMA}.d_cag_contract_entity_i;

CREATE TABLE ${STAGING_SCHEMA}.d_cag_contract_entity_i
( cag_cntct_entity_sk              BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_sk                       BIGINT NOT NULL
, carrier_acct_sk                  BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, cntct_entity_seq_nbr             INTEGER NOT NULL
, cntct_entity_stat_cd             CHAR(1)
, cntct_entity_eff_dt_sk           BIGINT NOT NULL
, cntct_entity_eff_dt              DATE
, cntct_entity_thru_dt_sk          BIGINT NOT NULL
, cntct_entity_thru_dt             DATE
, cntct_entity_id                  VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (CAG_SK);

