DROP TABLE ${STAGING_SCHEMA}.client_id_cag_mask_i;

CREATE TABLE ${STAGING_SCHEMA}.client_id_cag_mask_i
( grp_hrchy_lvl_1_id               VARCHAR(9) NOT NULL
, grp_hrchy_lvl_2_id               VARCHAR(15) NOT NULL
, grp_hrchy_lvl_3_id               VARCHAR(15) NOT NULL
, clt_id                           VARCHAR(50) NOT NULL
, create_dttm                      TIMESTAMP NOT NULL
, create_uid                       VARCHAR(30) NOT NULL
, updt_dttm                        TIMESTAMP NOT NULL
, updt_uid                         VARCHAR(30) NOT NULL
, trigger_dttm                     TIMESTAMP NOT NULL
);

