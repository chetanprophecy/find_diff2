update orx_idw_dm_prd..f_pa_case_detail a
set a.pa_pbr_sk=b.new_sk, a.update_uid='DQ_FIX'
from sandbox..SS_030_D_PA_PRES_SK b
where a.pa_pbr_sk=b.old_sk;
commit;
