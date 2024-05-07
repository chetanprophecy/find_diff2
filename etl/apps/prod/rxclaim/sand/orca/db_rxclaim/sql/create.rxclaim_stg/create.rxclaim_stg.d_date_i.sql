DROP TABLE ${STAGING_SCHEMA}.d_date_i;

CREATE TABLE ${STAGING_SCHEMA}.d_date_i
( dt_sk                            BIGINT NOT NULL
, jln_dt_nbr                       INTEGER NOT NULL
, cal_day_dt                       DATE NOT NULL
, cal_day_nm                       VARCHAR(30) NOT NULL
, day_nbr_in_cal_mnth              SMALLINT NOT NULL
, day_nbr_in_cal_qtr               SMALLINT NOT NULL
, day_nbr_in_cal_yr                SMALLINT NOT NULL
, day_nbr_in_fiscal_mnth           SMALLINT NOT NULL
, day_nbr_in_fiscal_qtr            SMALLINT NOT NULL
, day_nbr_in_fiscal_yr             SMALLINT
, cal_month_start_flg              CHAR(1)
, cal_month_end_flg                CHAR(1)
, fiscal_month_start_flg           CHAR(1)
, fiscal_month_end_flg             CHAR(1)
, cal_qtr_start_flg                CHAR(1)
, cal_qtr_end_flg                  CHAR(1)
, fiscal_qtr_start_flg             CHAR(1)
, fiscal_qtr_end_flg               CHAR(1)
, fiscal_yr_start_flg              CHAR(1)
, fiscal_yr_end_flg                CHAR(1)
, cal_mnth_nm                      VARCHAR(30)
, cal_yr_mnth_nbr                  INTEGER
, cal_yr_mnth_id                   INTEGER
, cal_qtr_nbr                      INTEGER
, cal_qtr_nm                       VARCHAR(30)
, cal_yr_qtr_id                    INTEGER
, cal_yr_id                        INTEGER
, fiscal_yr_mnth_nbr               INTEGER
, fiscal_yr_mnth                   INTEGER
, fiscal_qtr_nbr                   INTEGER
, fiscal_qtr_nm                    VARCHAR(30)
, fiscal_yr_qtr_id                 INTEGER
, fiscal_yr_id                     INTEGER
, wk_end_ind                       CHAR(1)
, hol_ind                          CHAR(1)
, cal_wk_nbr_in_yr                 INTEGER
, cal_year_six_month_id            INTEGER
, cal_year_last_month_id           INTEGER
, cal_month_last_year_id           INTEGER
, cal_month_year_id                INTEGER
, cal_day_str                      VARCHAR(30)
, cal_month_str                    VARCHAR(30)
, cal_month_start_dt               DATE
, cal_month_end_dt                 DATE
, cal_month_week_nbr               INTEGER
, cal_qtr_start_dt                 DATE
, cal_qtr_end_dt                   DATE
, cal_week_nm                      VARCHAR(30)
, cal_week_start_dt                DATE
, cal_week_end_dt                  DATE
, cal_week_start_flg               CHAR(1)
, cal_week_end_flg                 CHAR(1)
, cal_year_nm                      VARCHAR(10)
, cal_year_start_dt                DATE
, cal_year_end_dt                  DATE
, cal_year_start_flg               CHAR(1)
, cal_year_end_flg                 CHAR(1)
, run_id                           BIGINT
, insert_uid                       VARCHAR(20)
, update_ts                        TIMESTAMP NOT NULL
, rec_stat_cd                      BYTEINT
, insert_ts                        TIMESTAMP NOT NULL
, update_uid                       VARCHAR(20)
, src_env_sk                       BIGINT NOT NULL
);

