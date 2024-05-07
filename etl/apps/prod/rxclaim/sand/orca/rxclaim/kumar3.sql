SELECT
    V_D_CAG.CARRIER_ID AS Carrier_ID, 
    V_D_CAG.ACCOUNT_ID AS Account_ID, 
    V_D_CAG.EMPLOYER_GROUP_ID AS Group_ID, 
   SUM(V_F_CLAIM_TRANSACTION.CLT_DUE_AMT - (V_F_CLAIM_TRANSACTION.CLT_PATIENT_PAY_AMT - V_F_CLAIM_TRANSACTION.APP_PATIENT_PAY_AMT)) AS LICS__Low_Income_Subsidy__Amount,SUM(V_F_CLAIM_TRANSACTION.CLT_DUE_AMT) AS Amount_Paid
  FROM
    ORX_IDW_DM_PRD.ADMIN.D_CAG V_D_CAG
        INNER JOIN ORX_IDW_DM_PRD.ADMIN.F_CLAIM_TRANSACTION V_F_CLAIM_TRANSACTION
        ON V_D_CAG.CAG_SK = V_F_CLAIM_TRANSACTION.CAG_SK
            INNER JOIN ORX_IDW_DM_PRD.ADMIN.D_DATE V_D_DATE_FILLED
            ON V_D_DATE_FILLED.DT_SK = V_F_CLAIM_TRANSACTION.FILLED_DT_SK
                INNER JOIN ORX_IDW_DM_PRD.ADMIN.D_DATE V_D_DATE_SUBMITTED
                ON V_D_DATE_SUBMITTED.DT_SK = V_F_CLAIM_TRANSACTION.SBM_DT_SK
                    INNER JOIN ORX_IDW_DM_PRD.ADMIN.D_PHARMACY V_D_PHARMACY
                    ON V_D_PHARMACY.PHR_SK = V_F_CLAIM_TRANSACTION.PHR_SK
                        INNER JOIN ORX_IDW_DM_PRD.ADMIN.D_PLAN_DRUG_STATUS V_D_PLAN_DRUG_STATUS
                        ON V_D_PLAN_DRUG_STATUS.PLN_DRG_STAT_SK = V_F_CLAIM_TRANSACTION.PLN_DRG_STAT_SK
                            INNER JOIN ORX_IDW_DM_PRD.ADMIN.L_CLAIM_STATUS V_L_CLAIM_STATUS
                            ON V_F_CLAIM_TRANSACTION.CLAIM_STAT_SK = V_L_CLAIM_STATUS.CLAIM_STAT_SK 
WHERE 
    V_F_CLAIM_TRANSACTION.SBM_DT_SK BETWEEN 20231001 AND 20231031 AND
    V_L_CLAIM_STATUS.CLAIM_STAT_ID IN ( 
        'X', 
        'P' ) AND
  V_D_CAG.CARRIER_ID IN  ('EXCGUHCCO') and V_D_CAG.ACCOUNT_ID IN ('E') AND V_D_CAG.EMPLOYER_GROUP_ID IN ('S0001138')
	and V_F_CLAIM_TRANSACTION.FILLED_DT_SK BETWEEN 20231001 AND 20231031 
GROUP BY 
    V_D_CAG.CARRIER_ID, 
    V_D_CAG.ACCOUNT_ID, 
    V_D_CAG.EMPLOYER_GROUP_ID