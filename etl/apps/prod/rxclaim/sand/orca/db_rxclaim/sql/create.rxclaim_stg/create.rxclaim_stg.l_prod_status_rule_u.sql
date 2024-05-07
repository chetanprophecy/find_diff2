DROP TABLE ${STAGING_SCHEMA}.l_prod_status_rule_u;

CREATE TABLE ${STAGING_SCHEMA}.l_prod_status_rule_u
( prod_status_rule_tbl_id_sk       BIGINT NOT NULL
, prod_status_rule_tbl_id          VARCHAR(13) NOT NULL
, prod_status_rule_tbl_desc        VARCHAR(50)
, rec_displ_ind                    CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PROD_STATUS_RULE_TBL_ID_SK);

