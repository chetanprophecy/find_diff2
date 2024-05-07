DROP TABLE ${STAGING_SCHEMA}.d_prod_medispan_indicator_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_medispan_indicator_u
( prod_sk                          BIGINT NOT NULL
, prod_id                          VARCHAR(20) NOT NULL
, prod_id_qlfr_cd                  VARCHAR(2)
, gnrc_mdspn_ind                   CHAR(1) NOT NULL
, gnrc_mdspn_ind_nm                VARCHAR(50) NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PROD_SK);

