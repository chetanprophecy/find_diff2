DROP TABLE ${STAGING_SCHEMA}.d_member_alt_insurance_u;

CREATE TABLE ${STAGING_SCHEMA}.d_member_alt_insurance_u
( member_alt_insurance_sk          BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cob_pricing_type_sk              BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, mbr_id                           VARCHAR(20)
, carrier_id                       VARCHAR(9)
, account_id                       VARCHAR(15)
, employer_group_id                VARCHAR(15)
, sequence_num                     INTEGER
, mai_stat_cd                      CHAR(1)
, mai_from_dt                      DATE
, mai_thru_dt                      DATE
, alt_insurance_flg                BYTEINT
, mbr_alt_ins_id                   VARCHAR(10)
, mbr_alt_ins_mbr_id               VARCHAR(20)
, cob_pricing_type_cd              VARCHAR(2)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, mai_type                         CHAR(1)
, mei_from_dt                      DATE
, mei_thru_dt                      DATE
, mei_stat_cd                      CHAR(1)
, mei_alt_insurance_flg            BYTEINT
, mei_alt_insurance_cd             VARCHAR(10)
, mei_alt_ins_mbr_id               VARCHAR(20)
, mei_cob_pricing_type_cd          VARCHAR(2)
);

