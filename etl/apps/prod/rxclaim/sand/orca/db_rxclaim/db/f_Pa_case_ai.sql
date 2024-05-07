update orx_idw_dm_prd..f_pa_case_alternate_insurance a
set a.pa_mbr_sk=b.pa_mbr_sk, a.update_uid='DQ_FIX'
from orx_idw_dm_prd..f_pa_case_detail b
where a.pa_case_id=b.pa_case_id and a.rec_eff_ts=b.rec_eff_ts and a.pa_mbr_sk!=b.pa_mbr_sk;
commit;
