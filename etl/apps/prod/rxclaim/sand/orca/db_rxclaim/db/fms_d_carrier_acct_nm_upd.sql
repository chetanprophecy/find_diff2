update orx_idw_dm_prd.admin.d_carrier_acct A set A.account_nm =B.account_nm , A.update_uid='FMS_ACC_UPD' ,
A.update_ts=(select max(update_ts) from orx_idw_dm_prd.admin.d_carrier_acct ) from
 (select distinct B.carrier_id,B.account_id,B.account_nm from 
 orx_idw_dm_prd.admin.d_carrier_acct A 
 inner join  orx_idw_dm_prd.admin.d_cag B 
 on A.account_id = B.account_id and a.CARRIER_ID = b.CARRIER_ID  and A.account_nm != B.account_nm and B.update_uid like 'FMS_ACC%'
 and (A.carrier_id,A.account_id) not in ( 
select carrier_id,account_id
from orx_idw_dm_prd.admin.d_cag  where update_uid like 'FMS_ACC%' group by carrier_id,account_id having count(distinct account_nm) >1 
) )B where 
A.carrier_id = B.carrier_id and
A.account_id = B.account_id and
A.account_nm != B.account_nm;

