DROP TABLE ${STAGING_SCHEMA}.d_drug_appl_id_mfr_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_appl_id_mfr_i
( drug_appl_id_mfr_sk              BIGINT NOT NULL
, fda_inclusion_dt_sk              BIGINT
, drug_appl_id_mfr_rptd_aprv_dt_sk BIGINT
, drug_appl_id_mfr_del_dt_sk       BIGINT
, prod_id                          VARCHAR(20)
, drug_appl_id_mfr_app_nbr         VARCHAR(11)
, prod_nbr                         VARCHAR(8)
, app_flag                         CHAR(1)
, prod_typ_cd                      CHAR(2)
, id_frmt_cd                       CHAR(1)
, fda_inclusion_dt                 DATE
, drug_appl_id_mfr_rptd_aprv_dt    DATE
, drug_appl_id_mfr_del_dt          DATE
, drug_appl_id_mfr_stat            CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          INTEGER
)
DISTRIBUTE ON (DRUG_APPL_ID_MFR_SK);

