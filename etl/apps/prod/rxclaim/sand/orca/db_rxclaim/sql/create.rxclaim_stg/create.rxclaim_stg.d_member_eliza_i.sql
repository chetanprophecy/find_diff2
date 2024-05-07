DROP TABLE ${STAGING_SCHEMA}.d_member_eliza_i;

CREATE TABLE ${STAGING_SCHEMA}.d_member_eliza_i
( eliza_mbr_sk                     BIGINT NOT NULL
, mbr_sk                           BIGINT NOT NULL
, cag_sk                           BIGINT NOT NULL
, batch_id                         BIGINT NOT NULL
, cust_nm                          VARCHAR(30) NOT NULL
, lob                              VARCHAR(30) NOT NULL
, prod_id                          VARCHAR(20) NOT NULL
, portal_filter_1                  VARCHAR(50) NOT NULL
, portal_filter_2                  VARCHAR(50) NOT NULL
, phr_sk                           BIGINT NOT NULL
, phr_trnsf_num                    VARCHAR(10) NOT NULL
, multi_phr_flg                    CHAR(1) NOT NULL
, call_result_cd_sk                BIGINT NOT NULL
, call_tm                          TIMESTAMP NOT NULL
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (MBR_SK);

