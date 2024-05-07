DROP TABLE ${STAGING_SCHEMA}.d_prod_alternate_drug_malt_i;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_alternate_drug_malt_i
( prod_alt_drg_malt_sk             BIGINT NOT NULL
, gpi_sk                           BIGINT NOT NULL
, gpi_id                           VARCHAR(14)
, prod_sk                          BIGINT NOT NULL
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, drg_lbl_nm                       VARCHAR(80)
, drg_grp_nm                       VARCHAR(40)
, drg_lbl_nm_alt_1                 VARCHAR(80)
, tier_level_1                     INTEGER
, drg_lbl_nm_alt_2                 VARCHAR(80)
, tier_level_2                     INTEGER
, drg_lbl_nm_alt_3                 VARCHAR(80)
, tier_level_3                     INTEGER
, drg_lbl_nm_alt_4                 VARCHAR(80)
, tier_level_4                     INTEGER
, drg_lbl_nm_alt_5                 VARCHAR(80)
, tier_level_5                     INTEGER
, drg_lbl_nm_alt_6                 VARCHAR(80)
, tier_level_6                     INTEGER
, drg_lbl_nm_alt_7                 VARCHAR(80)
, tier_level_7                     INTEGER
, drg_lbl_nm_alt_8                 VARCHAR(80)
, tier_level_8                     INTEGER
, drg_lbl_nm_alt_9                 VARCHAR(80)
, tier_level_9                     INTEGER
, drg_lbl_nm_alt_10                VARCHAR(80)
, tier_level_10                    INTEGER
, plan_yr                          SMALLINT
, formulary_cd                     VARCHAR(12)
, filler                           VARCHAR(30)
, drug_alt                         VARCHAR(800)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT NOT NULL
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PROD_SK);

