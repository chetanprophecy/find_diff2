DROP TABLE ${STAGING_SCHEMA}.l_wn_cag_exclsn_list_u;

CREATE TABLE ${STAGING_SCHEMA}.l_wn_cag_exclsn_list_u
( cag_sk                           BIGINT
, carrier_id                       VARCHAR(30)
, account_id                       VARCHAR(40)
, employer_group_id                VARCHAR(30)
, cag_exclsn_flg                   CHAR(1)
);

