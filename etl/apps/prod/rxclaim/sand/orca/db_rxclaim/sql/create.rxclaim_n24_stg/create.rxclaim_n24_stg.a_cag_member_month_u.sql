DROP TABLE ${STAGING_SCHEMA}.a_cag_member_month_u;

CREATE TABLE ${STAGING_SCHEMA}.a_cag_member_month_u
( cag_sk                           BIGINT NOT NULL
, perd_type_sk                     BIGINT
, perd_start_dt_sk                 BIGINT
, pln_sk                           BIGINT
, pln_qlfr_cd_sk                   BIGINT
, client_prod_sk                   BIGINT
, client_rdr_sk                    BIGINT
, gender_sk                        BIGINT
, mbr_age                          SMALLINT
, age_band_sk                      BIGINT
, relationship_cd_sk               BIGINT
, care_facility_sk                 BIGINT
, carrier_id_ovrd_cd               VARCHAR(10)
, account_benft_cd                 VARCHAR(10)
, grp_clt_benft_cd                 VARCHAR(10)
, grp_sic_cd                       VARCHAR(10)
, month_end_elig_mbr_cnt_no        INTEGER
, active_days_elig_mbr_cnt_no      INTEGER
, after_15th_elig_mbr_cnt_no       INTEGER
, utilizing_mbr_cnt_no             INTEGER
, active_days_subscriber_cnt_no    INTEGER
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

