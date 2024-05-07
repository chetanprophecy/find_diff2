INSERT into SANDBOX..ALF_090_PSA_DASHBOARD 
SELECT * FROM 
              (WITH VM_ENT_PARMS AS
              (      SELECT 
                           REQUEST_ID,
                           ENT.CLIENT_ID,
                           BENCHMARK,
                           ROUND (MONTHS_BETWEEN((END_DATE),(START_DATE))) AS MONTH_COUNT,
                           SUM (ELIG.ACTIVE_DAYS_ELIG_MBR_CNT_NO) AS MEMBERSHIP_COUNT,
                           SUM (ELIG.ACTIVE_DAYS_ELIG_MBR_CNT_NO)AS AVERAGE_PMPM,
                           START_DATE,
                           END_DATE
                     FROM  
                           SANDBOX..BOB_000_BENCHMARKS  BNCHMK1, 
                           ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_D_CAG CAG,                        
                           ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_A_FNL_MEMBER_MONTH ELIG,
                           ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_D_DATE DT,
                           SANDBOX..ALF_090_PSA_ENTRY_FORM ENT
                     WHERE 
                           BNCHMK1.BUSINESS_TYPE = BENCHMARK AND
                           BNCHMK1.CARRIERID = CAG.CARRIER_ID AND
                           BNCHMK1.PERIOD = '2017 Q4' AND 
                           CAG.CAG_SK = ELIG.CAG_SK AND
                           ELIG.PERD_START_DT_SK = DT.DT_SK AND
                           ELIG.PERD_TYPE_SK = 9 AND
                           DT.CAL_DAY_DT BETWEEN START_DATE and END_DATE 
                                            AND
                                            --ENT.BENCHMARK='MCO'
                           ENT.REC_STAT_CD = 'P'
                     GROUP BY 1,2,3,7,8
              )

              SELECT              
                     ENT.REQUEST_ID AS REQUEST_ID,
                     'B',
                     ENT.CLIENT_ID AS CLIENT_ID,
                     SUM(CLM.CLT_INGRED_COST_PAID)AS TOTAL_INGREDIENT_COST,
                     SUM(CLM.CLAIM_CNTR) AS TOTAL_RXS,
              SUM (CLM.CLT_INGRED_COST_PAID)/ MIN(ENT.AVERAGE_PMPM) AS INGREDIENT_COST_PMPM, 
                     SUM (CLM.DAYS_SPLY)/ MIN(ENT.AVERAGE_PMPM) AS DAYS_SUPPLY_PMPM,
                     (SUM(CLM.CLT_INGRED_COST_PAID) / SUM (CLM.DAYS_SPLY)) AS INGREDIENT_COST_PER_DAY,
                     (SUM(CASE WHEN GNRC.GNRC_MDSPN_IND in ('Y','X') THEN CLM.CLAIM_CNTR ELSE 0 END) / SUM(CLM.CLAIM_CNTR)) AS GENERIC_DISPENSING_RATE,
                     (SUM (CASE WHEN CLM.HM_DLVRY_IND = 'Y' THEN CLM.CLAIM_CNTR ELSE 0 END)/SUM(CLM.CLAIM_CNTR ) * 100) AS MAIL_PERCENT,
                     (SUM (CASE WHEN CLM.HM_DLVRY_IND <> 'Y' AND CLM.DAYS_SPLY > 84 THEN CLM.CLAIM_CNTR ELSE 0 END)/SUM(CLM.CLAIM_CNTR ) * 100) AS RETAIL_90_PERCENT,
                     SUM(CASE WHEN NDC.SPCLTY_PROD_CORP_IND IN ('Y') THEN CLM.CLT_INGRED_COST_PAID ELSE 0 END) / SUM(CLM.CLT_INGRED_COST_PAID)  AS PERCENT_SPECIALTY_INGREDIENT_COST,
                     MIN(ENT.MEMBERSHIP_COUNT) AS MEMBERSHIP_COUNT,
                     MIN(ENT.MONTH_COUNT) AS MONTH_COUNT,
                     MIN(ENT.AVERAGE_PMPM) AS AVERAGE_PMPM,
                     MIN(CLM.SBM_DT) AS START_DATE,
                     MAX(CLM.SBM_DT) AS END_DATE,
                     800,
                     CURRENT_TIMESTAMP,
                     CURRENT_TIMESTAMP,
                     'SWTEST',
                     'SWTEST',
                     '2018030112344',
                     1
              FROM VM_ENT_PARMS ENT
                     INNER JOIN SANDBOX..BOB_000_BENCHMARKS  BNCHMK
                                                ON BNCHMK.BUSINESS_TYPE = ENT.BENCHMARK 
                     INNER JOIN ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_D_CAG CAG
                                                ON CAG.CARRIER_ID = BNCHMK.CARRIERID 
                     INNER JOIN ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_F_CLAIM_TRANSACTION CLM
                                                ON CAG.CAG_SK = CLM.CAG_SK
                     INNER JOIN ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_L_GENERIC_MEDISPAN_INDICATOR GNRC
                            ON CLM.GNRC_MDSPN_IND_SK = GNRC.GNRC_MDSPN_IND_SK
                     INNER JOIN  ORX_IDW_DM_INTR_VIEW_PRD.ADMIN.V_D_PRODUCT NDC 
                                         ON CLM.PROD_SK = NDC.PROD_SK
              WHERE CLM.SBM_DT BETWEEN ENT.START_DATE and ENT.END_DATE
              AND BNCHMK.PERIOD = '2017 Q4'
              GROUP BY ENT.REQUEST_ID,ENT.CLIENT_ID
                           ) B
       ;

