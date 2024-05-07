DROP TABLE ${STAGING_SCHEMA}.d_prod_ingredient_u;

CREATE TABLE ${STAGING_SCHEMA}.d_prod_ingredient_u
( prod_ing_id_sk                   BIGINT
, prod_sk                          BIGINT
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, prod_key                         BIGINT
, pig_ing_type_cd                  CHAR(1)
, pig_ing_id                       BIGINT
, pig_gnrc_nm                      VARCHAR(40)
, pig_strngth                      DECIMAL(13,5)
, pig_strngth_uom_cd               VARCHAR(11)
, pig_ing_flg                      CHAR(1)
, pig_rec_stat_cd                  CHAR(1)
, pig_inactive_dt                  DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

