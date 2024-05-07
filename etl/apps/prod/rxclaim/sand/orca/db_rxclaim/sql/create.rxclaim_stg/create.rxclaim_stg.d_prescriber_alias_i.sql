DROP TABLE ${STAGING_SCHEMA}.d_prescriber_alias_i;

CREATE TABLE ${STAGING_SCHEMA}.d_prescriber_alias_i
( pbr_alias_sk                     BIGINT NOT NULL
, pbr_sk                           BIGINT NOT NULL
, pbr_id                           VARCHAR(15)
, pbr_id_qlfr                      VARCHAR(2)
, pbr_id_st_cd                     VARCHAR(3)
, phy_pbr_key                      VARCHAR(10)
, pbr_qlfr_id_sts_cd               CHAR(1) NOT NULL
, pbr_id_qlfr_desc                 VARCHAR(100) NOT NULL
, rec_rank_no                      INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, pbr_vendor_id                    VARCHAR(10)
);

