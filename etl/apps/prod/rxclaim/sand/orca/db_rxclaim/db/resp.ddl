CREATE TABLE orx_idw_bpe_etl_prd..T_010_RESPONSE_DETAIL
(
	TXN_ID BIGINT,
	TXN_STATUS CHARACTER(1),
	CORRELATION_ID CHARACTER VARYING(100),
	PRICE_RESPONSE_TS TIMESTAMP,
	SEQ_NO SMALLINT,
	RESULT_RETURN_IND CHARACTER(1),
	TRIAL_CLAIM_ID CHARACTER VARYING(20),
	TRIAL_CLAIM_STAT_ID CHARACTER(2),
	PRICE_RESULT_TYPE_CD_LIST CHARACTER VARYING(200),
	PHR_TYPE_CD CHARACTER VARYING(10),
	PHR_RESP_TYPE_CD CHARACTER VARYING(10),
	DRUG_PRICE_TYPE_CD CHARACTER VARYING(10),
	DRUG_COVERAGE_CD CHARACTER VARYING(10),
	PRICE_RESULT_TYPE_CD CHARACTER VARYING(10),
	PRIORITY_ORDER_NO SMALLINT,
	PREFERRED_IND CHARACTER(1),
	IN_NETWORK_IND CHARACTER(1),
	PLAN_CD CHARACTER VARYING(10),
	PROD_ID CHARACTER VARYING(11),
	PROD_LABEL_NM CHARACTER VARYING(60),
	MULTI_SOURCE_CD CHARACTER(1),
	DAYS_SPLY SMALLINT,
	DRG_QTY NUMERIC(11,3),
	PHR_ID CHARACTER VARYING(12),
	PHR_NM CHARACTER VARYING(60),
	PHR_NETWORK_ID CHARACTER VARYING(6),
	PATIENT_PAY_AMT NUMERIC(10,2),
	PLAN_PAY_AMT NUMERIC(10,2),
	ANNUALIZED_COST NUMERIC(10,2),
	PHR_SK BIGINT,
	PRODUCT_SK BIGINT,
	SRC_ENV_SK BIGINT,
	INSERT_TS TIMESTAMP,
	UPDATE_TS TIMESTAMP,
	INSERT_UID CHARACTER VARYING(20),
	UPDATE_UID CHARACTER VARYING(20),
	RUN_ID BIGINT,
	REC_STAT_CD BYTEINT,
	UNBREAKABLE_IND CHARACTER(1),
	CARRIER_ID CHARACTER VARYING(30),
	ACCOUNT_ID CHARACTER VARYING(40),
	EMPLOYER_GROUP_ID CHARACTER VARYING(30),
	CAG_SK BIGINT,
	PRODUCT_ID_QLFR_CD CHARACTER VARYING(2),
	GPI_14 CHARACTER VARYING(14),
	MED_D_BEGIN_PHASE_CD CHARACTER(1),
	MED_D_END_PHASE_CD CHARACTER(1),
	PHARMACY_ORDER_NO SMALLINT,
	ALT_PRODUCT_ORDER_NO SMALLINT,
	PREFERRED_DRUG_LIST CHARACTER VARYING(50),
	COMMON_NDC_TABLE_CD CHARACTER(1),
	COMMON_NDC_TABLE_SK BIGINT,
	TRIAL_CLAIM_TYPE_CD CHARACTER(1),
	RX_NUMBER CHARACTER VARYING(12),
	INGREDIENT_COST NUMERIC(10,2),
	USUAL_AND_CUSTOMARY NUMERIC(10,2),
	GROSS_AMT_DUE NUMERIC(10,2),
	SBM_ORDER_NBR INTEGER,
	AFFILIATION_NM CHARACTER VARYING(50),
	U_C_UNIT_COST NUMERIC(8,2),
	SBM_INGRED_UNIT_COST NUMERIC(8,2),
	COMN_NDC_ROLLUP_CD CHARACTER(1),
	CALC_PATIENT_PAY_AMT NUMERIC(10,2),
	PRICE_SCHED CHARACTER VARYING(13),
	COST_COMPR_SCHED CHARACTER VARYING(13),
	COST_COMPR_CD CHARACTER(1),
	TOTAL_FEE_AMT NUMERIC(8,2),
	WITHHOLD_TOTAL_AMT NUMERIC(8,2),
	TOTAL_TAX_AMT NUMERIC(8,2)
)
DISTRIBUTE ON (TXN_ID);


