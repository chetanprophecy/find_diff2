UPDATE ORX_IDW_DM_PRD..F_PA_CORRESPONDENCE_DETAIL T
SET T.CAG_SK=S.CAG_SK,
T.MBR_SK=S.MBR_SK,
T.UPDATE_TS=CURRENT_TIMESTAMP,
T.UPDATE_UID='FPACORR_PACASE_HIST'
FROM (select CAG_SK,MBR_SK,PA_CASE_ID from
(select CAG_SK,MBR_SK,PA_CASE_ID,
row_number() over ( partition by PA_CASE_ID order by REC_EFF_TS desc ) rank
from ORX_IDW_DM_PRD..F_PA_CASE_DETAIL ) F_PA_CASE_DETAIL where rank =1) S
WHERE T.PA_CASE_ID=S.PA_CASE_ID;