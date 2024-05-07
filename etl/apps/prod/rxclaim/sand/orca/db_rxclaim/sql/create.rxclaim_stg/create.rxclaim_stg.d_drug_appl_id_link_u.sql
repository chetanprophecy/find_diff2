DROP TABLE ${STAGING_SCHEMA}.d_drug_appl_id_link_u;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_appl_id_link_u
( drug_appl_id_lnk_sk              BIGINT NOT NULL
, prod_id                          VARCHAR(20)
, prod_appl_id                     VARCHAR(11)
, prod_nbr                         VARCHAR(8)
, appl_flag                        CHAR(1)
, ref_list_drug_flag               CHAR(1)
, fda_thera_eq_cd                  VARCHAR(30)
, fda_aprv_dt_sk                   BIGINT
, fda_aprv_dt                      DATE
, fda_prior_1_1_82_aprv_flag       CHAR(1)
, drug_appl_lnk_in_mdspn_flag      CHAR(1)
, mdspn_inactv_dt                  DATE
, drug_appl_id_lnk_stat            CHAR(1)
, drug_appl_id_lnk_del_dt          DATE
, drug_appl_id_lnk_mrkt_catgy      VARCHAR(2)
, drug_appl_id_lnk_mrkt_start_dt   DATE
, drug_appl_id_lnk_mrkt_end_dt     DATE
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (DRUG_APPL_ID_LNK_SK);

