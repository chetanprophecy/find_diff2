DROP TABLE ${STAGING_SCHEMA}.d_gpi_gppc_pkg_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.d_gpi_gppc_pkg_dtl_u
( gpi_gppc_sk                      BIGINT
, gpi_sk                           BIGINT
, gppc_id                          VARCHAR(10)
, gpi_id                           VARCHAR(14)
, pkg_desc_cd                      VARCHAR(5)
, pkg_desc                         VARCHAR(10)
, pkg_size                         DECIMAL(9,3)
, pkg_size_uom_cd                  VARCHAR(2)
, pkg_qty                          INTEGER
, drg_unit_dose_use_ind            CHAR(1)
, gppc_suffix_3                    VARCHAR(3)
, stat_cd                          CHAR(1)
, src_insert_uid                   VARCHAR(10)
, src_insert_ts                    TIMESTAMP
, src_insert_prog_nm               VARCHAR(10)
, src_update_uid                   VARCHAR(10)
, src_update_ts                    TIMESTAMP
, src_update_prog_nm               VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

