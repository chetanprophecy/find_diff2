DROP TABLE ${STAGING_SCHEMA}.d_member_care_facility_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_care_facility_u
( mbr_sk                           BIGINT
, cag_sk                           BIGINT
, care_fac_sk                      BIGINT
, pbr_sk                           BIGINT
, pln_sk                           BIGINT
, ntwk_sk                          BIGINT
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mcf_seq_nbr                      INTEGER
, mcf_eff_date                     DATE
, mcf_thru_date                    DATE
, mcf_status                       CHAR(1)
, pbr_id                           VARCHAR(15)
, pbr_id_qlfr_cd                   VARCHAR(2)
, pbr_id_st_cd                     VARCHAR(3)
, phr_ntwrk_id                     VARCHAR(6)
, care_fac_id                      VARCHAR(10)
, pln_cd                           VARCHAR(10)
, pln_eff_dt                       DATE
, pln_qlfr_cd                      VARCHAR(10)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

