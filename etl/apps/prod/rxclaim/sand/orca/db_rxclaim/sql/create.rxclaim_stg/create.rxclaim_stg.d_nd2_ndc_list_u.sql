DROP TABLE ${STAGING_SCHEMA}.D_ND2_NDC_LIST_u;

CREATE TABLE ${STAGING_SCHEMA}.D_ND2_NDC_LIST_u
( ND2_NDC_SK            BIGINT NOT NULL
, ND1_NDC_LIST_NM       CHARACTER VARYING(10)
, ND2_NDC_LBLR_CD       CHARACTER VARYING(5)
, ND2_NDC_PROD_CD       CHARACTER VARYING(4)
, ND2_NDC_PKG_CD        CHARACTER VARYING(2)
, ND2_LBL_NM            CHARACTER VARYING(30)
, ND2_FROM_DT           DATE
, ND2_THRU_DT           DATE
, ND2_MSG_CD            CHARACTER VARYING(10)
, ND2_MSG_TYPE          CHARACTER(1)
, SRC_ENV_SK            BIGINT NOT NULL
, INSERT_TS             TIMESTAMP NOT NULL
, UPDATE_TS             TIMESTAMP NOT NULL
, INSERT_UID            CHARACTER VARYING(20)
, UPDATE_UID            CHARACTER VARYING(20)
, RUN_uD                BIGINT
, REC_STAT_CD           BYTEINT
);
