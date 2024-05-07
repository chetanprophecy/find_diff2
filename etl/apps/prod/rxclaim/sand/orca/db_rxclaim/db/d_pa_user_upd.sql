update  orx_idw_dm_prd..d_pa_user
set pa_user_nm='-',is_acss_restrct=0,rpt_to='-',
wrk_grp='-',spclty_skills='-',
px_creat_oper='-',px_creat_dttm='19000101 00:00:00',
px_update_oper='-',px_update_dttm='19000101 00:00:00',
py_acss_grp='-',
pas_id='DATA_ADMIN_OPERATOR_ID',
pz_ins_key='DATA-ADMIN-OPERATOR-ID',
src_env_sk=670
where pa_user_id='-' and rec_eff_ts='1900-01-01';
