DROP TABLE ${STAGING_SCHEMA}.l_drug_class_comment_i;

CREATE TABLE ${STAGING_SCHEMA}.l_drug_class_comment_i
( drug_class_id                    VARCHAR(4)
, drug_class_desc                  VARCHAR(50)
, drug_class_psi_comment           VARCHAR(512)
, drug_class_mpd_comment           VARCHAR(512)
, drug_class_new                   CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

