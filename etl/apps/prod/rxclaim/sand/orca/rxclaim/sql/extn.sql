--Utilize previous loads with updated carrier xref data
insert into SH_030_D_PROD_CAG_SPCLTY_XREF
select x.PROD_CAG_SK, 
       x.CAG_SK,
       x.PROD_SK,
       x.PROD_ID,
       x.PROD_ID_QLFR_CD,
       x.GPI_NO,
       x.GPI_SK,
		CONF.SPECLTY_IND SPCLTY_PROD_RPTG_IND,
		CONF.SPECLTY_IND_NM SPCLTY_PROD_RPTG_NM,
		CONF.SRC_ENV_SK,
		CURRENT_TIMESTAMP AS INSERT_TS,
'bug fix' AS INSERT_UID,${RUN_ID} AS RUN_ID,
        CURRENT_TIMESTAMP AS UPDATE_TS,
		CONF.UPDATE_UID,
		1 AS REC_STAT_CD
from SH_030_D_PROD_CAG_SPCLTY_XREF x
join  ORX_IDW_DM_PRD..D_CAG DG ON x.CAG_SK=DG.CAG_SK
JOIN ORX_IDW_DM_PRD..D_PRODUCT DP ON x.PROD_SK=DP.PROD_SK
JOIN ORX_IDW_DM_PRD..D_GPI_CARRIER_XREF CONF ON
                      CONF.CARRIER_ID = DG.CARRIER_ID AND NVL(CONF.GPI_ID,'@@@') = NVL(DP.GPI_NO,'@@@' );

--Delete records loaded the previous day, accounted for in the loads above
DELETE FROM SH_030_D_PROD_CAG_SPCLTY_XREF where date(insert_ts) = current_date -1;

--Insert data only for cag_sk and prod_sk that are in today's run but not already in the table
INSERT INTO SH_030_D_PROD_CAG_SPCLTY_XREF
    SELECT
        DENSE_RANK() over (ORDER BY cag_sk, prod_sk) AS PROD_CAG_SK,
        CAG_SK,
        PROD_SK,
        PROD_ID,
        PROD_ID_QLFR_CD,
        GPI_NO,
        GPI_SK,
        SPECLTY_IND AS SPCLTY_PROD_RPTG_IND,
        SPECLTY_IND_NM AS SPCLTY_PROD_RPTG_NM,
        SRC_ENV_SK, CURRENT_TIMESTAMP AS INSERT_TS,
        INSERT_UID, ${RUN_ID} AS RUN_ID,
        CURRENT_TIMESTAMP AS UPDATE_TS,
        UPDATE_UID,
        1 AS REC_STAT_CD
        FROM (
                SELECT DG.CAG_SK, DP.PROD_SK, DP.PROD_ID, DP.PROD_ID_QLFR_CD,  DP.GPI_NO, DP.GPI_SK, CONF.SPECLTY_IND, CONF.SPECLTY_IND_NM, CONF.SRC_ENV_SK, CONF.INSERT_UID, CONF.UPDATE_UID,
                ROW_NUMBER() OVER (PARTITION BY DG.CAG_SK, DP.PROD_SK ORDER BY DG.CAG_SK, DP.PROD_SK, CONF.UPDATE_TS DESC) AS ROW_NUM
                FROM ORX_IDW_DM_PRD..F_CLAIM_TRANSACTION FCT
                INNER JOIN ORX_IDW_DM_PRD..D_CAG DG ON FCT.CAG_SK=DG.CAG_SK
                INNER JOIN ORX_IDW_DM_PRD..D_PRODUCT DP ON FCT.PROD_SK=DP.PROD_SK
                INNER JOIN ORX_IDW_DM_PRD..D_GPI_CARRIER_XREF CONF ON
                      CONF.CARRIER_ID = DG.CARRIER_ID AND NVL(CONF.GPI_ID,'@@@') = NVL(DP.GPI_NO,'@@@' )
			    where  fct.sbm_dt = current_date - 2
                and not exists (select 1 from 	SH_030_D_PROD_CAG_SPCLTY_XREF x where x.cag_sk = fct.cag_sk and dp.prod_sk = x.prod_sk) 			

            ) M
        WHERE ROW_NUM=1;

--Update full set, re-insert as well as new inserts, for sk of table		
update SH_030_D_PROD_CAG_SPCLTY_XREF
set PROD_CAG_SK = DENSE_RANK() over (ORDER BY cag_sk, prod_sk);

