DROP TABLE ${STAGING_SCHEMA}.d_partd_pos_rebate_table_u;

CREATE TABLE ${STAGING_SCHEMA}.d_partd_pos_rebate_table_u
( rebate_tbl_sk                    BIGINT NOT NULL
, rebate_tbl_id                    VARCHAR(10)
, rebate_desc                      VARCHAR(25)
, rebate_stat_id                   VARCHAR(1)
, exclusion_tbl                    VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

