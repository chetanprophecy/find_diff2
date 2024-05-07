update orx_idw_dm_prd..f_pa_case_benefit_eligibility a
set a.pa_mbr_sk=b.new_mbr_sk, a.update_uid='DQ_FIX'
from (select distinct old_mbr_sk,new_mbr_sk from sandbox..SS_030_D_PA_MEM_SK_20230606) b
where a.pa_mbr_sk=b.old_mbr_sk;
commit;
