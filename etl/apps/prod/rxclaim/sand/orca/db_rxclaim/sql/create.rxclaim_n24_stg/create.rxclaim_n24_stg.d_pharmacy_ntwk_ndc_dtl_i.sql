DROP TABLE ${STAGING_SCHEMA}.D_PHARMACY_NTWK_NDC_DTL_i;

CREATE TABLE ${STAGING_SCHEMA}.D_PHARMACY_NTWK_NDC_DTL_i
( PHR_NTWK_NDC_SK               BIGINT NOT NULL
, PHR_NDC_LIST_NM               CHARACTER VARYING(10)
, PHR_NDC_LBLR_CD               CHARACTER VARYING(5)
, PHR_NDC_PROD_CD               CHARACTER VARYING(4)
, PHR_NDC_PKG_CD                CHARACTER VARYING(2)
, SEQ_NBR                       INTEGER
, STATUS                        CHARACTER(1)
, EFF_DT                        DATE
, THRU_DT                       DATE
, PHR_NDC_LBL_NM                CHARACTER VARYING(30)
, PHR_PRICE_SCHD                CHARACTER VARYING(10)
, PHR_PAT_PAY                   CHARACTER VARYING(10)
, CLT_PRICE_SCHD                CHARACTER VARYING(10)
, CLT_PAT_PAY                   CHARACTER VARYING(10)
, PHR_PROF_SRVS_FEE_TBL         CHARACTER VARYING(10)
, CLT_PROF_SRVS_FEE_TBL         CHARACTER VARYING(10)
, PHR_DUR_PPS_FEE               CHARACTER VARYING(10)
, CLT_DUR_PPS_FEE               CHARACTER VARYING(10)
, RXPRICE_PHR                   CHARACTER VARYING(10)
, RXPRICE_CLT                   CHARACTER VARYING(10)
, CLT2_PRICE_SCHD               CHARACTER VARYING(10)
, CLT3_PRICE_SCHD               CHARACTER VARYING(10)
, CLT_PAT_PAY_GRP_SCHD_ID       CHARACTER VARYING(10)
, CLT1_PRICE_GRP_SCHD_ID        CHARACTER VARYING(10)
, CLT2_PRICE_GRP_SCHD_ID        CHARACTER VARYING(10)
, CLT3_PRICE_GRP_SCHD_ID        CHARACTER VARYING(10)
, PHR_PAT_PAY_GRP_SCHD_ID       CHARACTER VARYING(10)
, PHR_PRICE_GRP_SCHD_ID         CHARACTER VARYING(10)
, SRC_ENV_SK                    BIGINT NOT NULL
, INSERT_TS                     TIMESTAMP NOT NULL
, UPDATE_TS                     TIMESTAMP NOT NULL
, INSERT_UID                    CHARACTER VARYING(20)
, UPDATE_UID                    CHARACTER VARYING(20)
, RUN_ID                        BIGINT
, REC_STAT_CD                   BYTEINT
);
