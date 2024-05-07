DROP TABLE ${STAGING_SCHEMA}.d_clinical_product_i;

CREATE TABLE ${STAGING_SCHEMA}.d_clinical_product_i
( clncl_prod_sk                    BIGINT NOT NULL
, clncl_prod_id                    VARCHAR(25)
, clncl_prod_nm                    NVARCHAR(100)
, prod_typ_cd                      VARCHAR(25)
, clncl_prod_desc                  NVARCHAR(250)
, prod_sub_typ_nm                  NVARCHAR(50)
, clncl_prod_stat                  CHAR(1)
, cpp_creat_ts                     TIMESTAMP NOT NULL
, cpp_creat_by                     VARCHAR(20) NOT NULL
, cpp_update_ts                    TIMESTAMP
, cpp_update_by                    VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP
);

