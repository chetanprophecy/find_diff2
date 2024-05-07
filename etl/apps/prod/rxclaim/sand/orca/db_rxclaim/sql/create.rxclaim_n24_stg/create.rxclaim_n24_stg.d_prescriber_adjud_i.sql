DROP TABLE ${STAGING_SCHEMA}.d_prescriber_adjud_i;

CREATE TABLE ${STAGING_SCHEMA}.d_prescriber_adjud_i
( pbr_adjud_sk                     BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, pbr_id                           VARCHAR(15)
, pbr_dea_id                       VARCHAR(15)
, pbr_id_qlfr_cd                   VARCHAR(2)
, pbr_id_st_cd                     VARCHAR(3)
, pbr_npi                          VARCHAR(10)
, pbr_first_nm                     VARCHAR(25)
, pbr_mid_init_nm                  CHAR(1)
, pbr_last_nm                      VARCHAR(35)
, pbr_spclty_cd                    VARCHAR(6)
, pbr_spclty_cd_qlfr_cd            VARCHAR(3)
, pbr_ntwrk_id                     VARCHAR(6)
, pbr_st_cd                        VARCHAR(3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(18)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

