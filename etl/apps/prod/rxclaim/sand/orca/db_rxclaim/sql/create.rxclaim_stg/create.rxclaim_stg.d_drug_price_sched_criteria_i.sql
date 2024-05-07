DROP TABLE ${STAGING_SCHEMA}.d_drug_price_sched_criteria_i;

CREATE TABLE ${STAGING_SCHEMA}.d_drug_price_sched_criteria_i
( price_sched_criteria_sk          BIGINT NOT NULL
, price_sched_nm                   VARCHAR(10) NOT NULL
, price_sched_sk                   BIGINT
, psc_seq_nbr                      INTEGER NOT NULL
, psc_claim_stat                   CHAR(1)
, psc_cust_loc                     VARCHAR(2)
, cust_loc_sk                      BIGINT NOT NULL
, psc_patient_resdnc               VARCHAR(2)
, patient_resdnc_sk                BIGINT NOT NULL
, psc_cmpnd_flg                    CHAR(1)
, psc_drug_stat                    CHAR(1)
, psc_ltc_short_cycl               BYTEINT
, psc_max_manufctrrs               INTEGER
, psc_multi_src_cd                 CHAR(1)
, multi_src_cd_sk                  BIGINT NOT NULL
, psc_multi_src_list               VARCHAR(10)
, psc_otc_ind                      BYTEINT
, psc_third_party_exception        CHAR(1)
, route_of_admin_sk                BIGINT NOT NULL
, psc_route_of_admin               VARCHAR(2)
, psc_route_of_admin_list          VARCHAR(10)
, psc_dea_class                    CHAR(1)
, psc_dea_class_list               VARCHAR(10)
, psc_packaging                    CHAR(1)
, psc_packaging_list               VARCHAR(10)
, dsg_frm_sk                       BIGINT NOT NULL
, psc_dsg_frm                      VARCHAR(4)
, psc_dsg_frm_list                 VARCHAR(10)
, psc_price_tbl                    VARCHAR(13)
, psc_multi_src_m                  BYTEINT
, psc_multi_src_n                  BYTEINT
, psc_multi_src_o                  BYTEINT
, psc_multi_src_y                  BYTEINT
, psc_stat                         CHAR(1)
, psc_day_sppl                     INTEGER
, psc_qty                          INTEGER
, psc_max_mfg_qual_val             CHAR(1)
, psc_tier                         VARCHAR(2)
, psc_frmulary_stat                CHAR(1)
, psc_frmulary_stat_list           VARCHAR(10)
, st_list_nm                       VARCHAR(10)
, psc_st_qualfr                    CHAR(1)
, psc_encnter_limit_cd             CHAR(1)
, psc_processing_qualfr            CHAR(1)
, psc_msg_cd                       VARCHAR(10)
, psc_msg_type                     CHAR(1)
, src_insert_ts                    TIMESTAMP NOT NULL
, src_update_ts                    TIMESTAMP
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PRICE_SCHED_CRITERIA_SK);

