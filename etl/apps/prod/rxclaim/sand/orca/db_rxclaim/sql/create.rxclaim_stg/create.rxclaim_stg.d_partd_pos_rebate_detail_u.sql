DROP TABLE ${STAGING_SCHEMA}.d_partd_pos_rebate_detail_u;

CREATE TABLE ${STAGING_SCHEMA}.d_partd_pos_rebate_detail_u
( partd_pos_rebate_dtl_sk          BIGINT
, rebate_tbl_sk                    BIGINT
, rebate_tbl_id                    VARCHAR(10)
, prod_sk                          BIGINT
, ndc_lblr_cd                      VARCHAR(5)
, ndc_prod_cd                      VARCHAR(4)
, ndc_pkg_cd                       VARCHAR(2)
, dxp_seq_nbr                      INTEGER
, stat_id                          VARCHAR(1)
, dxp_from_dt                      DATE
, dxp_thru_dt                      DATE
, ndc_lblr_nm                      VARCHAR(25)
, dxp_typ_id                       VARCHAR(1)
, dxp_non_lics_pp_rate             DECIMAL(7,6)
, dxp_lics_pp_rate                 DECIMAL(7,6)
, dxp_non_lics_bgn_dt              DATE
, dxp_lics_bgn_dt                  DATE
, dxp_non_lics_bl_dt               DATE
, dxp_lics_bl_dt                   DATE
, dxp_non_lics_cur_ref_dt_typ      VARCHAR(1)
, dxp_lics_cur_ref_dt_typ          VARCHAR(1)
, dxp_non_lics_bl_dte_prc          DECIMAL(11,4)
, dxp_lics_bl_dte_prc              DECIMAL(11,4)
, dxp_non_lics_base_rate           DECIMAL(13,6)
, dxp_lics_base_rate               DECIMAL(13,6)
, dxp_non_lics_max_rebate          DECIMAL(7,6)
, dxp_lics_max_rebate              DECIMAL(7,6)
, dxp_non_lics_percnt_ret          DECIMAL(7,6)
, dxp_lics_percnt_ret              DECIMAL(7,6)
, dxp_admin_fee                    DECIMAL(9,2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

