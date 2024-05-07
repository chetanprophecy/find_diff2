DROP TABLE ${STAGING_SCHEMA}.a_cag_msms_summary_i;

CREATE TABLE ${STAGING_SCHEMA}.a_cag_msms_summary_i
( cag_sk                           BIGINT
, sbm_mn_id                        INTEGER
, active_days_elig_mbr_cnt_no      INTEGER
, after_15th_elig_mbr_cnt_no       INTEGER
, msms_utilizing_mbr_cnt_no        INTEGER
, claim_cntr_retail_30             BIGINT
, claim_cntr_retail_90             BIGINT
, claim_cntr_hd                    BIGINT
, claim_cntr_msms_retail_30        BIGINT
, claim_cntr_msms_retail_90        BIGINT
, claim_cntr_msms_hd               BIGINT
, hd_utilizing_mbr_cnt_no          INTEGER
, msms_mbr_opt_out_cnt_no          INTEGER
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

