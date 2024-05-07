update orx_idw_dm_prd..f_pa_case_detail a
set a.pa_pbr_sk=b.pa_pbr_sk, a.update_uid='RI_FIX_PRE_P'
from sandbox.admin.ss_030_f_pa_case_detail_20230404 b
where a.pa_case_id=b.pa_case_id and a.rec_eff_ts=b.rec_eff_ts
and a.insert_ts<='2023-02-20 22:23:12' and a.update_ts<='2023-02-20 22:23:12'
and a.update_uid!='RI_FIX_PRE' and b.update_uid='RI_FIX_PRE_P';

