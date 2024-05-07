DROP TABLE ${STAGING_SCHEMA}.d_tax_schedule_i;

CREATE TABLE ${STAGING_SCHEMA}.d_tax_schedule_i
( tax_sched_sk                     BIGINT NOT NULL
, tax_sched_nm                     VARCHAR(6)
, tax_sched_st                     VARCHAR(2)
, tax_sched_zip                    VARCHAR(5)
, tax_sched_zip2                   VARCHAR(4)
, tax_sched_zip3                   VARCHAR(2)
, tax_county_cd                    VARCHAR(5)
, tax_seq_nbr                      INTEGER
, tax_sched_stat_ind               CHAR(1)
, tax_from_dt                      DATE
, tax_thru_dt                      DATE
, tax_src                          VARCHAR(2)
, tax_dol_amt                      DECIMAL(9,2)
, tax_perct_amt                    DECIMAL(9,2)
, tax_calc_code_basis              VARCHAR(2)
, tax_allcoation_basis             VARCHAR(2)
, tax_otc_qualfr_ind               CHAR(1)
, tax_retain_perct_ind             CHAR(1)
, src_add_dt                       DATE
, src_chg_dt                       DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (TAX_SCHED_SK);

