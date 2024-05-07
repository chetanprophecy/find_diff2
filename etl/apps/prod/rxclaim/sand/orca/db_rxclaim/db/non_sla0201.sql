select 'D_CAG', max(update_ts),count_big(*) from orx_idw_dm_prd.D_CAG union
select 'D_GPI', max(update_ts),count_big(*) from orx_idw_dm_prd.D_GPI union
select 'D_PA_MEMBER', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PA_MEMBER union
select 'D_PLAN', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PLAN union
select 'D_CAG_ADJUD', max(update_ts),count_big(*) from orx_idw_dm_prd.D_CAG_ADJUD union
select 'D_GROUP_ELIGIBILITY', max(update_ts),count_big(*) from orx_idw_dm_prd.D_GROUP_ELIGIBILITY union
select 'D_MEMBER', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER union
select 'D_MEMBER_ADJUD', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER_ADJUD union
select 'D_MEMBER_ALT_INSURANCE', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER_ALT_INSURANCE union
select 'D_MEMBER_SUPPL_IDENTITY', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER_SUPPL_IDENTITY union
select 'D_PHARMACY', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PHARMACY union
select 'D_PRESCRIBER', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PRESCRIBER union
select 'D_PRODUCT', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PRODUCT union
select 'D_PRODUCT_ADJUD', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PRODUCT_ADJUD union
select 'D_MEMBER_ELIGIBILITY', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER_ELIGIBILITY  where MEL_THRU_DT >= '2021-01-01' AND MEL_STAT_CD = 'A' union
select 'D_MEMBER_ELIGIBILITY_ADJUD', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MEMBER_ELIGIBILITY_ADJUD union
select 'D_MMD_MEMBER_ELIGIBILITY', max(update_ts),count_big(*) from orx_idw_dm_prd.D_MMD_MEMBER_ELIGIBILITY where MMD_THRU_DT  >= '2021-01-01'  union
select 'F_CLAIM_TRANSACTION', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CLAIM_TRANSACTION where SBM_DT_SK >= 20210101 union
select 'F_CLAIM_MIC_DETAIL', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CLAIM_MIC_DETAIL   where SBM_DT_SK >= 20210101 union
select 'F_CLAIM_TRANSACTION_EXTN', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CLAIM_TRANSACTION_EXTN where SBM_DT_SK >= 20210101 union
select 'F_CLAIM_TRX_COMMON_DTL2', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CLAIM_TRX_COMMON_DTL2  union
select 'F_COB_CLAIM_TRANSACTION', max(update_ts),count_big(*) from orx_idw_dm_prd.F_COB_CLAIM_TRANSACTION  union
select 'F_PA_CASE_DETAIL', max(update_ts),count_big(*) from orx_idw_dm_prd.F_PA_CASE_DETAIL union
select 'F_CPN_ADJ_CLAIM_TRANSACTION', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CPN_ADJ_CLAIM_TRANSACTION where SBM_DT_SK >= 20210101 union
select 'F_FORMULARY_CLAIM_TRX', max(update_ts),count_big(*) from orx_idw_dm_prd.F_FORMULARY_CLAIM_TRX where SBM_DT_SK >= 20210101 union
select 'F_MPD_CLAIM_TRANSACTION', max(update_ts),count_big(*) from orx_idw_dm_prd.F_MPD_CLAIM_TRANSACTION where SBM_DT_SK >= 20210101 union
select 'F_PAYMENT_CLAIM_TXN', max(update_ts),count_big(*) from orx_idw_dm_prd.F_PAYMENT_CLAIM_TXN where SBM_DT_SK >= 20210101 union
select 'F_SAVING_ACCT_PAY_DTL', max(update_ts),count_big(*) from orx_idw_dm_prd.F_SAVING_ACCT_PAY_DTL  union
select 'F_CDUR_EVENTS', max(update_ts),count_big(*) from orx_idw_dm_prd.F_CDUR_EVENTS where SBM_DT >= '2021-01-01' union
select 'F_WC_CLAIM_TRANSACTION', max(update_ts),count_big(*) from orx_idw_dm_prd.F_WC_CLAIM_TRANSACTION where SBM_DT_SK >= 20210101 union
select 'A_CAG_MEMBER_MONTH', max(update_ts),count_big(*) from orx_idw_dm_prd.A_CAG_MEMBER_MONTH  union
select 'A_FNL_MEMBER_MONTH', max(update_ts),count_big(*) from orx_idw_dm_prd.A_FNL_MEMBER_MONTH union
SELECT 'D_MEMBER_DIAGONASIS', max(update_ts),count_big(*) FROM orx_idw_dm_prd.D_MEMBER_DIAGNOSIS union
select 'D_NATIONAL_DRUG_CODE_MFR', max(update_ts),count_big(*) from orx_idw_dm_prd.D_NATIONAL_DRUG_CODE_MFR union
select 'D_PA_PRESCRIBER', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PA_PRESCRIBER union
select 'D_PLAN_GPI_LIST', max(update_ts),count_big(*) from orx_idw_dm_prd.D_PLAN_GPI_LIST union
select 'D_PROD_CAG_SPCLTY_XREF',max(update_ts),count_big(*) from orx_idw_dm_prd.D_PROD_CAG_SPCLTY_XREF union
SELECT 'D_P_PAYEE', max(update_ts),count_big(*) FROM orx_idw_dm_prd.D_P_PAYEE;
