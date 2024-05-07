DROP TABLE ${STAGING_SCHEMA}.l_pharmacy_network_ndc_list_i;

CREATE TABLE ${STAGING_SCHEMA}.l_pharmacy_network_ndc_list_i
( phr_ntwk_ndc_list_nm_sk          BIGINT NOT NULL
, phr_ntwk_ndc_list_nm             VARCHAR(10) NOT NULL
, phr_ntwk_ndc_list_nm_desc        VARCHAR(30) NOT NULL
, phr_ntwk_ndc_list_nm_displ_flg   BYTEINT
, src_env_sk                       BIGINT NOT NULL
, insert_ts                        TIMESTAMP NOT NULL
, update_ts                        TIMESTAMP NOT NULL
, insert_uid                       VARCHAR(20)
, update_uid                       VARCHAR(20)
, run_id                           BIGINT
, rec_stat_cd                      BYTEINT
)
DISTRIBUTE ON (PHR_NTWK_NDC_LIST_NM_SK);

