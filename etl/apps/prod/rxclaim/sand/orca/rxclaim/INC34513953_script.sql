select 
case when agb.MBR_AGE_BAND_DESC not in ('Age 65-74','Age 75-84','Age>84') then 'BoB Actives' 
      --when agb.MBR_AGE_BAND_DESC in ('Age 65-74','Age 75-84','Age>84') then 'BoB Retirees' 
      end as Benchmark,
clm.SUBM_YR_MNTH,
sum(clm.CLAIM_CNTR) as Rx,
sum(clm.DAYS_SPLY) as Days_Supply,
sum(clm.CLT_INGRED_COST_PAID + clm.CLT_INCENTIVE_AMT + clm.CLT_SALES_TAX_PAID + clm.CLT_DISPENSING_FEE) as Gross_Cost,
sum(clm.CLT_PATIENT_PAY_AMT) as Member_Pay,
sum(clm.CLT_DUE_AMT) as Plan_Pd

from ORX_IDW_DM_PRD.F_CLAIM_TRANSACTION clm 
    inner JOIN ORX_IDW_DM_PRD.D_CAG cag  
ON clm.CAG_SK = cag.CAG_SK
			 and (clm.SBM_DT between '2023-01-01' and '2023-09-30') 
			 and clm.CLAIM_STAT_ID in ('P','X','C','Z')
      inner join ORX_IDW_DM_PRD.D_MEMBER mbr 
             on (clm.MBR_SK = mbr.MBR_SK)
      inner join ORX_IDW_DM_PRD.D_DATE dt 
             on (clm.SBM_DT_SK = dt.DT_SK)
      inner join ORX_IDW_DM_PRD.D_PRODUCT_ADJUD adj 
             on (clm.PROD_ADJUD_SK =adj.PROD_ADJUD_SK)
			 and adj.GEN_IND_OVRD_IND in ( 'M','N','Z','O' ) 
      inner join ORX_IDW_DM_PRD.D_PROD_CAG_SPCLTY_XREF spc 
             on (clm.CAG_SK = spc.CAG_SK and clm.PROD_SK= spc.PROD_SK)
             and SPCLTY_PROD_RPTG_IND ='Y'
     -- inner join ORX_IDW_DM_PRD.A_CLNCL_BENCHMARKS_TRANSPOSED bob       
       --      on (bob.CAG_SK=cag.cag_sk)  
	--		 and bob.BENCHMARKS_NM = 'EMPLOYER'
	--		 and bob.START_DT <= '2023-01-01' and bob.TERM_DT >= '2023-09-30'
      inner join ORX_IDW_DM_PRD.L_AGE_BAND agb
             on (clm.AGE_BAND_SK=agb.AGE_BAND_SK)
			 and agb.MBR_AGE_BAND_DESC not in ('Age 65-74','Age 75-84','Age>84')
   
        Group by agb.MBR_AGE_BAND_DESC, clm.SUBM_YR_MNTH 
	Order by agb.MBR_AGE_BAND_DESC, clm.SUBM_YR_MNTH 
