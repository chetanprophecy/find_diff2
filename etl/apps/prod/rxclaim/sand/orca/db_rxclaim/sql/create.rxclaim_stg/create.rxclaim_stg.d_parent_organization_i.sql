DROP TABLE ${STAGING_SCHEMA}.d_parent_organization_i;

CREATE TABLE ${STAGING_SCHEMA}.d_parent_organization_i
( parent_org_sk                    BIGINT NOT NULL
, parent_org_id                    VARCHAR(6)
, parent_org_nm                    VARCHAR(35)
, parent_org_addr_ln1              VARCHAR(55)
, parent_org_addr_ln2              VARCHAR(55)
, parent_org_city                  VARCHAR(30)
, parent_org_st                    VARCHAR(2)
, parent_org_zip_cd                VARCHAR(9)
, parent_org_phn_no                VARCHAR(10)
, parent_org_phn_ext               VARCHAR(5)
, parent_org_fax                   VARCHAR(10)
, parent_org_email                 VARCHAR(50)
, parent_org_prov_id               VARCHAR(10)
, parent_org_obsol_dt              DATE
, parent_org_stat_cd               CHAR(1)
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
);

