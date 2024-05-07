DROP TABLE ${STAGING_SCHEMA}.d_group_eligibility_i;

CREATE TABLE ${STAGING_SCHEMA}.d_group_eligibility_i
( grp_eligty_sk                    BIGINT NOT NULL
, cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, gel_seq_nbr                      INTEGER
, gel_status                       CHAR(1)
, gel_eff_dt                       DATE
, gel_thru_dt                      DATE
, gel_brand_copay                  DECIMAL(5,2)
, gel_generic_copay                DECIMAL(5,2)
, gel_copay3                       DECIMAL(5,2)
, gel_copay4                       DECIMAL(5,2)
, gel_copay5                       DECIMAL(5,2)
, gel_copay6                       DECIMAL(5,2)
, gel_copay7                       DECIMAL(5,2)
, gel_copay8                       DECIMAL(5,2)
, gel_clt_benefit_cd               VARCHAR(10)
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

