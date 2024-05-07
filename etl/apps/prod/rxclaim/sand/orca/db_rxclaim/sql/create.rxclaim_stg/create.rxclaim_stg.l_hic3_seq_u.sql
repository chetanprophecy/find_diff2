DROP TABLE ${STAGING_SCHEMA}.l_hic3_seq_u;

CREATE TABLE ${STAGING_SCHEMA}.l_hic3_seq_u
( hic3_seq_sk                      BIGINT NOT NULL
, hic3_seq_nbr                     INTEGER
, hic3_cd                          VARCHAR(3)
, hic3_desc                        VARCHAR(50)
, src_add_user_nm                  VARCHAR(20)
, src_add_dttm                     TIMESTAMP
, src_add_pgm_nm                   VARCHAR(20)
, src_chg_user_nm                  VARCHAR(20)
, src_chg_dttm                     TIMESTAMP
, src_chg_pgm_nm                   VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

