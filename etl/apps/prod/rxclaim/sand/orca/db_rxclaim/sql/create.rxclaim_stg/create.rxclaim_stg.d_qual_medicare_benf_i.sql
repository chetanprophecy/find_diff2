DROP TABLE ${STAGING_SCHEMA}.d_qual_medicare_benf_i;

CREATE TABLE ${STAGING_SCHEMA}.d_qual_medicare_benf_i
( qmb_sk                           BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, carrier_sk                       BIGINT NOT NULL
, carrier_id                       VARCHAR(30) NOT NULL
, account_id                       VARCHAR(40) NOT NULL
, employer_group_id                VARCHAR(30) NOT NULL
, mbr_id                           VARCHAR(20) NOT NULL
, qmb_medicare_id                  VARCHAR(20) NOT NULL
, qmb_seq_no                       INTEGER NOT NULL
, qmb_medicaid_dual_sts_cd         VARCHAR(2)
, qmb_from_dt_sk                   BIGINT NOT NULL
, qmb_from_dt                      DATE
, qmb_thru_dt_sk                   BIGINT NOT NULL
, qmb_thru_dt                      DATE
, qmb_status_cd                    CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, sec_flg                          INTEGER
)
DISTRIBUTE ON (MBR_SK);

