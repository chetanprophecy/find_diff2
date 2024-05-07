DROP TABLE ${STAGING_SCHEMA}.c_provider_u;

CREATE TABLE ${STAGING_SCHEMA}.c_provider_u
( cpp_provider_sk                  BIGINT NOT NULL
, provider_id                      DECIMAL(38) NOT NULL
, vendor_id                        NVARCHAR(25)
, prescriber_id_type               CHAR(2)
, dea_num                          NVARCHAR(9)
, npi_num                          NVARCHAR(15)
, license_id                       NVARCHAR(9)
, last_name                        NVARCHAR(35)
, first_name                       NVARCHAR(25)
, middle_name                      CHAR(1)
, title_name                       CHAR(3)
, degree_1                         NVARCHAR(5)
, degree_2                         NVARCHAR(5)
, spec_cd_1                        NVARCHAR(6)
, spec_cd_2                        NVARCHAR(30)
, taxonomy_cd_1                    NVARCHAR(50)
, taxonomy_cd_2                    NVARCHAR(50)
, taxonomy_cd_3                    NVARCHAR(50)
, phone_1                          NVARCHAR(10)
, phone_1_ext                      NVARCHAR(4)
, phone_2                          NVARCHAR(10)
, phone_2_ext                      NVARCHAR(4)
, fax_1                            NVARCHAR(10)
, fax_1_ext                        NVARCHAR(4)
, addr_1                           NVARCHAR(55)
, addr_2                           NVARCHAR(55)
, suite                            NVARCHAR(8)
, city                             NVARCHAR(30)
, st                               CHAR(2)
, zip_cd                           NVARCHAR(5)
, zip_ext                          NVARCHAR(6)
, dob_yr                           NVARCHAR(6)
, npi_eff_dt                       TIMESTAMP
, company_ct_addr                  DECIMAL(38)
, tier_type_id_addr                DECIMAL(38)
, verification_cd_addr             CHAR(1)
, verification_dt_addr             TIMESTAMP
, company_ct_fax                   SMALLINT
, tier_type_id_fax                 SMALLINT
, verification_cd_fax              CHAR(1)
, verification_dt_fax              TIMESTAMP
, dnc_list                         DECIMAL(3)
, rxsol_ok_to_fax                  DECIMAL(3) NOT NULL
, rxsol_ok_to_mail                 DECIMAL(3) NOT NULL
, phone1_formatted                 NVARCHAR(20)
, phone2_formatted                 NVARCHAR(20)
, fax1_formatted                   NVARCHAR(20)
, addr_line1_formatted             NVARCHAR(75)
, addr_line2_formatted             NVARCHAR(75)
, full_name_formatted              NVARCHAR(70)
, addr_id                          NVARCHAR(25)
, provider_display_name            NVARCHAR(80)
, addr_label                       NVARCHAR(160)
, fax_excl_reason_cd               NVARCHAR(2)
, mail_excl_reason_cd              NVARCHAR(2)
, safety_ok_to_fax                 NVARCHAR(2) NOT NULL
, safety_ok_to_mail                NVARCHAR(2) NOT NULL
, safety_fax_excl_reason_cd        NVARCHAR(2)
, safety_mail_excl_reason_cd       NVARCHAR(2)
, cli_received_dt                  TIMESTAMP
, cpp_update_ts                    TIMESTAMP
, cpp_updated_by                   NVARCHAR(20)
, cpp_create_ts                    TIMESTAMP NOT NULL
, cpp_created_by                   NVARCHAR(20) NOT NULL
, src_env_sk                       BIGINT
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
, stts                             CHAR(1)
);

