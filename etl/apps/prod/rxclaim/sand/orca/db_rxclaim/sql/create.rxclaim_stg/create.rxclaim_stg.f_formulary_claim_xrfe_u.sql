DROP TABLE ${STAGING_SCHEMA}.f_formulary_claim_xrfe_u;

CREATE TABLE ${STAGING_SCHEMA}.f_formulary_claim_xrfe_u
( rx_nbr                           VARCHAR(12) NOT NULL
, client_id                        VARCHAR(7) NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, fill_nbr                         VARCHAR(2) NOT NULL
, txn_cd                           VARCHAR(2) NOT NULL
, carrier_sk                       BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, client_xrfe_sk                   BIGINT NOT NULL
, client_desc                      VARCHAR(30)
, mb_first_nm                      VARCHAR(25)
, mb_last_nm                       VARCHAR(35)
, mbr_sex                          CHAR(1) NOT NULL
, client_unique_claim_nbr          VARCHAR(30)
, mbr_dt_of_brth                   DATE NOT NULL
, card_holder_id                   VARCHAR(20)
, patient_rel_cd                   CHAR(1)
, patient_first_nm                 VARCHAR(25)
, patient_last_nm                  VARCHAR(35)
, patient_dt_of_brth               DATE
, patient_sex                      CHAR(1)
, map_file                         VARCHAR(10)
, srvc_prov_id                     VARCHAR(15)
, dt_of_srvc                       DATE
, pers_cd                          VARCHAR(3)
, prod_sk                          BIGINT NOT NULL
, prod_id                          VARCHAR(20)
, prod_id_qlfr_cd                  VARCHAR(2)
, ndc                              VARCHAR(11)
, gpi_sk                           BIGINT NOT NULL
, gpi_id                           VARCHAR(14)
, prod_nm                          VARCHAR(70)
, formulary_protocol_ind           CHAR(1)
, tier_level                       INTEGER
, days_sply                        INTEGER
, disp_qty                         DECIMAL(11,3)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

