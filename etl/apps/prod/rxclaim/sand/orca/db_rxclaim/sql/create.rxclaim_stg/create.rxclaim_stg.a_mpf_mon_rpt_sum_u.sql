DROP TABLE ${STAGING_SCHEMA}.a_mpf_mon_rpt_sum_u;

CREATE TABLE ${STAGING_SCHEMA}.a_mpf_mon_rpt_sum_u
( mpf_mon_sum_sk                   BIGINT NOT NULL
, rpt_mon                          INTEGER NOT NULL
, cag_sk                           BIGINT NOT NULL
, pde_contract_id                  VARCHAR(5) NOT NULL
, pde_rec_id                       VARCHAR(3)
, phr_retail_flg                   CHAR(1)
, pde_drug_cov_cd                  CHAR(1)
, medcr_plan_type_cd               CHAR(1)
, claim_stat_cd                    CHAR(1)
, phr_srvc_type_cd                 VARCHAR(10)
, discrepency_type                 VARCHAR(20)
, discrepancy_gte_0050             BYTEINT NOT NULL
, discrepancy_lte_0050             BYTEINT NOT NULL
, discrepancy_gt_lt_0050           BYTEINT NOT NULL
, discrepancy_gte_lte_0050         BYTEINT NOT NULL
, discrepancy_gte01_lte005         BYTEINT NOT NULL
, discrepancy_gte005_lte01         BYTEINT NOT NULL
, pde_brand_genric_cd              CHAR(1)
, phr_cost_type                    VARCHAR(10)
, pde_prod_id                      VARCHAR(20)
, proxy_ndc_flg                    BYTEINT NOT NULL
, mapped_ndc_flg                   BYTEINT NOT NULL
, pc_file_pst_cd_flg               CHAR(1) NOT NULL
, pde_day_of_sppl_catgy            VARCHAR(15)
, pde_claim_nbr_cnt                BIGINT
, est_mpf_cost_tot                 DECIMAL(38,4)
, est_pde_cost_tot                 DECIMAL(38,4)
, est_discrepancy_tot              DECIMAL(38,4)
, pde_drug_qty_sum                 DECIMAL(38,4)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, pde_adj_del_cd                   CHAR(1)
)
DISTRIBUTE ON (MPF_MON_SUM_SK);

