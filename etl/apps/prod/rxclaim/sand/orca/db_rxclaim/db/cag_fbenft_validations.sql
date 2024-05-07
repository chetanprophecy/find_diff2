select a.carrier_id , a.acct_id, a.employer_group_id, a.employer_group_nm, a.carrier_nm,a.account_nm,a.employer_group_nm ,b.carrier_nm , b.account_nm,b.employer_group_nm
from (
select carrier_id , acct_id , employer_group_id,carrier_nm , account_nm,employer_group_nm 
from orx_idw_dm_etl_prd..etl_090_cag_fbenft_process  )a
join (
select carrier_id,account_id,employer_group_id, carrier_nm, account_nm, employer_group_nm ,update_uid,update_ts FROM orx_idw_dm_prd.admin.d_cag
)b
on a.carrier_id=b.carrier_id and a.acct_id=b.account_id and a.employer_group_id=b.employer_group_id
and a.account_nm <> b.account_nm
and b.update_uid like 'FMS%'
and a.account_nm <>'-'
