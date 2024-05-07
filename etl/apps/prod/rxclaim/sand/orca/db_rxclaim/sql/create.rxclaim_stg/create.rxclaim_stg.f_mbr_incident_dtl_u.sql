DROP TABLE ${STAGING_SCHEMA}.f_mbr_incident_dtl_u;

CREATE TABLE ${STAGING_SCHEMA}.f_mbr_incident_dtl_u
( cag_sk                           BIGINT
, mbr_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, mbr_id                           VARCHAR(20)
, incident_id                      VARCHAR(25)
, injury_frm_dt_sk                 BIGINT
, injury_thru_dt_sk                BIGINT
, carr_id_nbr                      VARCHAR(10)
, claim_ref_nbr                    VARCHAR(30)
, emplr_nm                         VARCHAR(30)
, emplr_addr_txt                   VARCHAR(30)
, emplr_city_nm                    VARCHAR(20)
, emplr_st_cd                      VARCHAR(2)
, emplr_zip_cd                     VARCHAR(9)
, venue_st_cd                      VARCHAR(2)
, ref_stat_cd                      VARCHAR(2)
, adjr_nm                          VARCHAR(25)
, adjr_ph_no                       BIGINT
, prc_sched_nm                     VARCHAR(10)
, phr_patient_pay_id               VARCHAR(10)
, clt_prc_sched_nm                 VARCHAR(10)
, clt_patient_pay_id               VARCHAR(10)
, mbr_work_ph_no                   BIGINT
, mbr_work_ph_ext_no               INTEGER
, emplr_policy_no                  BIGINT
, mco_no                           BIGINT
, asgn_no                          BIGINT
, actv_ind                         VARCHAR(2)
, actv_ind_dt_sk                   BIGINT
, stat_cd                          VARCHAR(2)
, pgm_end_dt_sk                    BIGINT
, cov_cd                           VARCHAR(2)
, rehab_flg_cd                     CHAR(1)
, cov_typ_cd                       CHAR(1)
, fund_typ_cd                      CHAR(1)
, handicap_pct                     SMALLINT
, ncci_no                          SMALLINT
, death_dt_sk                      BIGINT
, last_paid_svc_dt_sk              BIGINT
, src_cd                           CHAR(1)
, rel_incident_id                  VARCHAR(30)
, statute_limit_dt_sk              BIGINT
, accident_typ_cd                  CHAR(1)
, msg_cd                           VARCHAR(10)
, msg_typ_cd                       CHAR(1)
, active_flg_cd                    CHAR(1)
, src_add_dt                       DATE
, src_add_ts                       TIMESTAMP
, src_chg_dt                       DATE
, src_chg_ts                       TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

