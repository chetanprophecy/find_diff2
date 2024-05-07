DROP TABLE ${STAGING_SCHEMA}.d_member_ancilary_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_ancilary_u
( mbr_sk                           BIGINT
, cag_sk                           BIGINT
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, eff_frm_dt                       DATE
, eff_thru_dt                      DATE
, fld_value                        VARCHAR(255)
, curr_ind                         CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

