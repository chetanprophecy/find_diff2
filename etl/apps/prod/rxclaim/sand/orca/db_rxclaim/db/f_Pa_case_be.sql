update orx_idw_dm_prd..f_pa_case_benefit_eligibility a
set a.pa_mbr_sk=b.pa_mbr_sk, a.update_uid='DQ_FIX'
from orx_idw_dm_prd..f_pa_case_detail b
where a.pa_case_id=b.pa_case_id and a.rec_eff_ts=b.rec_eff_ts and 
a.insert_ts<='2019-01-01 00:00:00'   and a.pa_mbr_sk!=b.pa_mbr_sk;
commit;
