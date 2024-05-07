DROP TABLE ${STAGING_SCHEMA}.r_specialty_phr_xref_u;

CREATE TABLE ${STAGING_SCHEMA}.r_specialty_phr_xref_u
( specialty_phr_xref_sk            BIGINT NOT NULL
, phr_id                           VARCHAR(12) NOT NULL
, phr_ncpdp_id                     VARCHAR(12) NOT NULL
, phr_npi_no                       VARCHAR(10) NOT NULL
, phr_nm                           VARCHAR(60)
, inactive_date                    DATE
, phr_store_no                     VARCHAR(10)
, phr_addr                         VARCHAR(55)
, phr_addr2                        VARCHAR(55)
, phr_city                         VARCHAR(30)
, phr_state                        VARCHAR(3)
, phr_zip                          VARCHAR(15)
, phr_group                        VARCHAR(55)
, phr_type                         VARCHAR(30)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

