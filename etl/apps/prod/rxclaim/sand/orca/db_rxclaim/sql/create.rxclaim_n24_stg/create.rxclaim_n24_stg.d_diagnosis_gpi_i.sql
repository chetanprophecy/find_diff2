DROP TABLE ${STAGING_SCHEMA}.d_diagnosis_gpi_i;

CREATE TABLE ${STAGING_SCHEMA}.d_diagnosis_gpi_i
( diag_gpi_sk                      BIGINT
, diag_gpi_list                    VARCHAR(10)
, gpi_id                           VARCHAR(14)
, diag_gpi_seq_nbr                 INTEGER
, gpi_desc                         VARCHAR(60)
, drug_stat                        CHAR(1)
, tier_ovrd                        VARCHAR(2)
, from_dt                          DATE
, thru_dt                          DATE
, diag_gpi_stat                    CHAR(1)
, src_add_user_nm                  VARCHAR(10)
, src_add_dt                       DATE
, src_add_tm                       TIME
, src_add_pgm_nm                   VARCHAR(10)
, src_chg_user_nm                  VARCHAR(10)
, src_chg_dt                       DATE
, src_chg_tm                       TIME
, src_chg_pgm_nm                   VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

