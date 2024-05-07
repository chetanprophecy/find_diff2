CREATE TABLE orx_idw_dm_etl_prd.ADMIN.etl_090_carr_acct_fbenft_process
(
	CARRIER_ID CHARACTER VARYING(30) NOT NULL DEFAULT '-'::"NVARCHAR",
	ACCT_ID CHARACTER VARYING(40) NOT NULL DEFAULT '-'::"NVARCHAR",
	CARRIER_NM CHARACTER VARYING(50) NOT NULL,
	ACCOUNT_NM CHARACTER VARYING(50) NOT NULL
)
DISTRIBUTE ON (CARRIER_ID);
