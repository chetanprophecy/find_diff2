DROP TABLE ${STAGING_SCHEMA}.d_mbr_custom_field_i;

CREATE TABLE ${STAGING_SCHEMA}.d_mbr_custom_field_i
( mbr_custom_field_sk              BIGINT NOT NULL
, mbr_sk                           BIGINT
, grp_hrchy_lvl_1_id_mask          VARCHAR(30)
, grp_hrchy_lvl_2_id_mask          VARCHAR(40)
, grp_hrchy_lvl_3_id_mask          VARCHAR(30)
, eff_frm_dt                       DATE
, eff_thru_dt                      DATE
, fld_value                        VARCHAR(255)
, cag_sk                           BIGINT
, curr_ind                         CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

