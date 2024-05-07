DROP TABLE ${STAGING_SCHEMA}.d_mbr_custom_field_def_u;

CREATE TABLE ${STAGING_SCHEMA}.d_mbr_custom_field_def_u
( mbr_custom_field_sk              BIGINT NOT NULL
, grp_hrchy_lvl_1_id_mask          VARCHAR(30)
, grp_hrchy_lvl_2_id_mask          VARCHAR(40)
, grp_hrchy_lvl_3_id_mask          VARCHAR(30)
, fld_nbr                          INTEGER
, fld_nm                           VARCHAR(20)
, fld_datatype                     VARCHAR(20)
, fld_max_len                      INTEGER
, fld_strt_pos                     INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

