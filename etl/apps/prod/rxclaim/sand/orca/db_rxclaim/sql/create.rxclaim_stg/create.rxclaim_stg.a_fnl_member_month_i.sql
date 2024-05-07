DROP TABLE ${STAGING_SCHEMA}.a_fnl_member_month_i;

CREATE TABLE ${STAGING_SCHEMA}.a_fnl_member_month_i
( cag_sk                           BIGINT NOT NULL
, perd_type_sk                     BIGINT
, perd_start_dt_sk                 BIGINT
, pln_sk                           BIGINT
, client_prod_sk                   BIGINT
, client_rdr_sk                    BIGINT
, gender_sk                        BIGINT
, mbr_age                          SMALLINT
, age_band_sk                      BIGINT
, relationship_cd_sk               BIGINT
, care_facility_sk                 BIGINT
, active_days_elig_mbr_cnt_no      INTEGER
, utilizing_mbr_cnt_no             INTEGER
, active_days_subscriber_cnt_no    INTEGER
, month_cnt_no                     INTEGER
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

