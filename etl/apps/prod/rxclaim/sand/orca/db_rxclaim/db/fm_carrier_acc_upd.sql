update orx_idw_dm_prd.admin.d_carrier A 
set a.carrier_nm = B.carrier_nm , a.update_uid='FMS_CARRIER_UPD' , a.update_ts= (select max(update_ts) from orx_idw_dm_prd.admin.d_carrier) from (
select distinct carrier_id , carrier_nm from orx_idw_dm_prd.admin.d_cag where update_uid like '%FMS_CARR%'   )B
where 
A.carrier_id = B.carrier_id
and A.carrier_nm != B.carrier_nm ;


update orx_idw_dm_prd.admin.d_carrier_acct A 
set a.carrier_nm = B.carrier_nm , a.update_uid='FMS_CARRIER_UPD' ,a.update_ts= (select max(update_ts) from orx_idw_dm_prd.admin.d_carrier_acct) from (
select distinct carrier_id , carrier_nm from orx_idw_dm_prd.admin.d_cag where update_uid like '%FMS_CARR%' )B
where 
A.carrier_id = B.carrier_id
and A.carrier_nm != B.carrier_nm ;

