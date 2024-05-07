DROP TABLE ${STAGING_SCHEMA}.d_pref_prod_list_dtl_i;

CREATE TABLE ${STAGING_SCHEMA}.d_pref_prod_list_dtl_i
( pref_prod_lst_dtl_sk             BIGINT
, pref_prod_lst_sk                 BIGINT
, gpi_sk                           BIGINT
, pref_prod_lst_id                 VARCHAR(10)
, gpi_id                           VARCHAR(14)
, ndc_labeler_cd                   VARCHAR(5)
, ndc_prod_cd                      VARCHAR(4)
, ndc_pkg_cd                       VARCHAR(2)
, ppd_seq_nbr                      INTEGER
, ppd_stat_cd                      CHAR(1)
, ppd_from_dt                      DATE
, ppd_from_dt_sk                   BIGINT
, ppd_thru_dt                      DATE
, ppd_thru_dt_sk                   BIGINT
, ppd_tier                         INTEGER
, ppd_appl_tier_to_genric_ind      CHAR(1)
, ppd_limit_ind                    CHAR(1)
, ppd_limit_qty                    DECIMAL(8,2)
, ppd_limit_days                   INTEGER
, ppd_pa_ind                       CHAR(1)
, ppd_genric_nm                    VARCHAR(60)
, ppd_step_thrpy_ind               CHAR(1)
, ppd_spclty_ind                   CHAR(1)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PREF_PROD_LST_SK);

