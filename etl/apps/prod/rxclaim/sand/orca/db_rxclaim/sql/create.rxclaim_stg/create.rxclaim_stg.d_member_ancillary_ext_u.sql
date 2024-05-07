DROP TABLE ${STAGING_SCHEMA}.d_member_ancillary_ext_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_ancillary_ext_u
( mbr_sk                           BIGINT
, cag_sk                           BIGINT
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, eff_frm_dt                       DATE
, eff_thru_dt                      DATE
, curr_ind                         CHAR(1)
, bad_first_nm                     VARCHAR(50)
, bad_last_nm                      VARCHAR(50)
, bad_ssn                          VARCHAR(9)
, bypass_ind                       CHAR(1)
, cobra_pd_thru                    VARCHAR(10)
, dis_reason_cd                    VARCHAR(3)
, filler                           VARCHAR(57)
, filler2                          VARCHAR(25)
, free_or_not_free                 VARCHAR(3)
, med_carrier_1                    VARCHAR(4)
, med_carrier1                     VARCHAR(4)
, med_carrier_2                    VARCHAR(4)
, opt_id                           VARCHAR(3)
, pend_egwp_approva                VARCHAR(3)
, pend_payment_ind                 CHAR(1)
, secndry_addr_1                   VARCHAR(50)
, secndry_addr_2                   VARCHAR(50)
, secndry_city_nm                  VARCHAR(30)
, secndry_ssn_id                   VARCHAR(9)
, secndry_st_cd                    VARCHAR(3)
, secndry_zip_cd                   VARCHAR(9)
, service_id                       VARCHAR(4)
, union_cd                         VARCHAR(2)
, trc_cod                          VARCHAR(3)
, trc_cd                           VARCHAR(3)
, union_code_ind                   VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

