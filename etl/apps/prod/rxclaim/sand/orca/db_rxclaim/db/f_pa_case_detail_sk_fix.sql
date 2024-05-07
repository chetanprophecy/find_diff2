update orx_idw_dm_prd..f_pa_case_detail a
set a.pa_mbr_sk=b.pa_mbr_sk,a.update_uid='RI_FIX'
from sandbox.admin.mr8_030_V_F_PA_CASE_DETAIL_BKP b
where a.pa_case_id=b.pa_case_id and a.rec_eff_ts=b.rec_eff_ts
and a.insert_ts<='2023-02-20 22:23:12' and a.update_ts>'2023-03-11 22:23:09';commit;
