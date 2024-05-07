DROP TABLE ${STAGING_SCHEMA}.c_provider_altrnte_contact_inf_i;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_altrnte_contact_inf_i
( cpp_provider_altrnte_contact_info_sk BIGINT NOT NULL
, provider_altrnte_contact_info_id VARCHAR(15)
, case_id                          VARCHAR(15)
, parent_case_id                   VARCHAR(15)
, provider_id                      DECIMAL(38)
, cpp_provider_sk                  BIGINT NOT NULL
, addr_line_1                      NVARCHAR(100)
, addr_line_2                      NVARCHAR(100)
, city                             NVARCHAR(30)
, st                               VARCHAR(2)
, cntry                            VARCHAR(4)
, zip_cd                           VARCHAR(10)
, prmry_phone_num                  VARCHAR(10)
, sec_phone_num                    VARCHAR(10)
, prmry_fax_num                    VARCHAR(10)
, sec_fax_num                      VARCHAR(10)
, cpp_update_ts                    TIMESTAMP
, cpp_updated_by                   NVARCHAR(20)
, cpp_create_ts                    TIMESTAMP
, cpp_created_by                   NVARCHAR(20)
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP
, update_ts                        TIMESTAMP
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

