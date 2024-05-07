DROP TABLE ${STAGING_SCHEMA}.d_mac_list_i;

CREATE TABLE ${STAGING_SCHEMA}.d_mac_list_i
( mac_lst_sk                       BIGINT NOT NULL
, carrier_sk                       BIGINT
, gpi_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, mac_lst                          VARCHAR(10)
, gpi_id                           VARCHAR(14)
, mac_gppc                         VARCHAR(8)
, mac_ndc_lablr_id                 VARCHAR(5)
, mac_ndc_prod_cd                  VARCHAR(4)
, mac_ndc_pkg_cd                   VARCHAR(2)
, mac_seq_nbr                      INTEGER
, mac_stat                         CHAR(1)
, mac_frm_dt                       DATE
, mac_thru_dt                      DATE
, mac_cost                         DECIMAL(15,5)
, src_chg_dt                       DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

