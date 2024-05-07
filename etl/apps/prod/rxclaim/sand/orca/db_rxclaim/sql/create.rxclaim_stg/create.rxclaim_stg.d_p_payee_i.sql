DROP TABLE ${STAGING_SCHEMA}.d_p_payee_i;

CREATE TABLE ${STAGING_SCHEMA}.d_p_payee_i
( payee_sk                         BIGINT NOT NULL
, payee_id                         VARCHAR(12)
, payee_seq_nbr                    DECIMAL(3)
, payee_nm                         VARCHAR(60)
, payee_addr_ln1                   VARCHAR(55)
, payee_addr_ln2                   VARCHAR(55)
, payee_addr_ln3                   VARCHAR(55)
, payee_city_nm                    VARCHAR(30)
, payee_st_cd                      VARCHAR(2)
, payee_zip                        VARCHAR(5)
, payee_zip2                       VARCHAR(4)
, payee_zip3                       VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
, payee_typ                        CHAR(1)
, payee_cntry                      VARCHAR(4)
);

