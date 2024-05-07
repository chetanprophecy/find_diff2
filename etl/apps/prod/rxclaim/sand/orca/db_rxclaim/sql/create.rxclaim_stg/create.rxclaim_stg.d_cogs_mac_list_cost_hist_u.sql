DROP TABLE ${STAGING_SCHEMA}.d_cogs_mac_list_cost_hist_u;

CREATE TABLE ${STAGING_SCHEMA}.d_cogs_mac_list_cost_hist_u
( mac_list_cost_hist_sk            BIGINT NOT NULL
, car_carrier_id                   VARCHAR(30) NOT NULL
, mac_list                         VARCHAR(10) NOT NULL
, mac_gpi                          VARCHAR(14) NOT NULL
, mac_gppc                         VARCHAR(8)
, mac_ndc_labeler_id               VARCHAR(5)
, mac_ndc_prod_cd                  VARCHAR(4)
, mac_ndc_pkg_cd                   VARCHAR(2)
, ndc11                            VARCHAR(11)
, mac_seq_nbr                      DECIMAL(5) NOT NULL
, mac_stat                         VARCHAR(1) NOT NULL
, mac_from_dt                      DATE NOT NULL
, mac_thru_dt                      DATE NOT NULL
, mac_cost1                        DECIMAL(15,5)
, add_dt                           TIMESTAMP
, chg_user_nm                      VARCHAR(10)
, chg_dt                           DATE
, chg_tm                           TIME
, chg_pgm_nm                       VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, insert_uid                       VARCHAR(20)
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
);

