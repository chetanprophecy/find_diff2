DROP TABLE ${STAGING_SCHEMA}.f_claim_cc_prod_mapping_u;

CREATE TABLE ${STAGING_SCHEMA}.f_claim_cc_prod_mapping_u
( claim_nbr                        BIGINT
, claim_seq_nbr                    INTEGER
, claim_stat_id                    CHAR(1)
, mbr_sk                           BIGINT
, cag_sk                           BIGINT
, gpi_sk                           BIGINT
, prod_sk                          BIGINT
, sbm_dt                           DATE
, prod_adjud_sk                    BIGINT
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, dx_cd                            VARCHAR(15)
, diag_dep_flg                     CHAR(1)
, prev_srv_flg                     CHAR(1)
, prev_visit_flg                   CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

