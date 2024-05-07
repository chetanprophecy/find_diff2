DROP TABLE ${STAGING_SCHEMA}.mpf_dtl_rpt_mnthy_i;

CREATE TABLE ${STAGING_SCHEMA}.mpf_dtl_rpt_mnthy_i
( contract_number                  VARCHAR(5)
, claim_number                     BIGINT
, date_of_service                  DATE
, pde_ndc_number                   VARCHAR(20)
, pde_ndc_label_name               VARCHAR(100)
, proxy_ndc_number                 VARCHAR(20)
, proxy_ndc_label_name             VARCHAR(100)
, days_supply                      SMALLINT
, drug_quantity                    DECIMAL(11,3)
, mpf_unit_cost                    DECIMAL(13,4)
, mpf_drug_cost                    DECIMAL(15,4)
, pde_unit_cost                    DECIMAL(13,5)
, pde_drug_cost                    DECIMAL(15,2)
, mpf_dispensing_fees              DECIMAL(13,4)
, pde_dispensing_fees              DECIMAL(9,2)
, total_estimated_mpf              DECIMAL(15,4)
, total_estimated_pde              DECIMAL(15,2)
, total_estimated_discrepancy      DECIMAL(15,4)
, cost_type                        VARCHAR(10)
, price_id                         VARCHAR(3)
, brand_or_generic_indicator       CHAR(1)
, proxy_or_non_proxy_indicator     VARCHAR(1)
, current_cur_claim_status         CHAR(1)
, next_pf_file_proxy_drug_unit_price DECIMAL(15,4)
, discrepancy_source               VARCHAR(14)
, npi_pde                          VARCHAR(10)
, patient_residency_code           VARCHAR(2)
, patient_residency_code_description VARCHAR(100)
, place_of_service_code            VARCHAR(2)
, final_plan_code_on_claim         VARCHAR(10)
, plan_benefit_package_pde         VARCHAR(3)
, pharmacy_service_type            VARCHAR(2)
, pharmacy_service_type_description NVARCHAR(200)
, pharmacy_status_description_pc_file VARCHAR(22)
, date_of_recent_proxy_price_change DATE
, inactivation_date                DATE
, obsolete_date                    DATE
, proxy_status                     VARCHAR(8)
, proxy_unit_of_measure            VARCHAR(2)
, mapped_unit_of_measure           VARCHAR(2)
, uom_comparison                   VARCHAR(8)
, cms_status                       VARCHAR(1)
, filter_type                      VARCHAR(1)
, compound_code                    CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
;

