DROP TABLE ${STAGING_SCHEMA}.d_inovt_passthrough_u;

CREATE TABLE ${STAGING_SCHEMA}.d_inovt_passthrough_u
( member_sk                        BIGINT NOT NULL
, proc_cd_alternate                VARCHAR(4)
, client_cd_alternate              VARCHAR(8)
, group_cd_alternate               VARCHAR(5)
, location_cd_alternate            VARCHAR(8)
, report_brk_1                     VARCHAR(10)
, report_brk_2                     VARCHAR(8)
, report_brk_3                     VARCHAR(4)
, report_brk_4                     VARCHAR(6)
, client_small_data_1              VARCHAR(20)
, client_small_data_2              VARCHAR(10)
, client_small_data_3              VARCHAR(10)
, client_small_data_4              VARCHAR(10)
, client_large_data_1              VARCHAR(40)
, client_large_data_2              VARCHAR(21)
, benefit_status_cd                CHAR(1)
, employment_status_cd             VARCHAR(2)
, member_control_id                VARCHAR(32)
, filler1                          VARCHAR(57)
, filler2                          VARCHAR(25)
, filler3                          VARCHAR(64)
, msi_alternate_id                 VARCHAR(20)
, msi_from_dt                      DATE
, msi_thru_dt                      DATE
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, run_id                           BIGINT
, update_ts                        TIMESTAMP
, update_uid                       VARCHAR(20)
, rec_stat_cd                      BYTEINT
);

