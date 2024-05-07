DROP TABLE ${STAGING_SCHEMA}.d_prod_id_link_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_id_link_u
( prod_id_lnk_sk                   BIGINT
, prod_type                        VARCHAR(2)
, prod_id                          VARCHAR(20)
, alt_prod_type                    VARCHAR(2)
, alt_prod_id                      VARCHAR(20)
, seq_nbr                          INTEGER
, status_cd                        CHAR(1)
, lnk_type                         CHAR(1)
, alt_lnk_type                     CHAR(1)
, orig_prod_key                    INTEGER
, inactive_dt                      DATE
, origin_cd                        CHAR(1)
, prod_key                         INTEGER
, alt_prod_key                     INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

