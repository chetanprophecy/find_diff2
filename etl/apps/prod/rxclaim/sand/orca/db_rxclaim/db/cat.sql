select count(1),new_carrier_id,new_account_id,new_employer_group_id
from (select carrier_id as old_carrier_id, account_id as old_account_id, employer_group_id as old_employer_group_id,
mb_first_nm as old_mb_first_nm,mb_last_nm as old_mb_last_nm,mbr_sex as old_mbr_sex,mbr_dt_of_brth as old_mbr_dt_of_brth 
from orx_idw_dm_prd..d_member where ( src_env_sk = 490) and carrier_id in ('UHCACRV01') and employer_group_id like '0909070%')as old_1
left join (select carrier_id as new_carrier_id, account_id as new_account_id, employer_group_id as new_employer_group_id,
mb_first_nm as new_mb_first_nm,mb_last_nm as new_mb_last_nm,mbr_sex as new_mbr_sex,mbr_dt_of_brth as new_mbr_dt_of_brth
from orx_idw_dm_prd..d_member where ( src_env_sk = 480) and carrier_id in ('0196') and account_id = '4229' and employer_group_id like '767000416161%'
) as new_1 on old_mbr_dt_of_brth=new_mbr_dt_of_brth where (old_mb_first_nm=new_mb_first_nm and old_mb_last_nm=new_mb_last_nm) 
or( substring(old_mb_first_nm,1,1)=substring(new_mb_first_nm,1,1) and old_mb_last_nm=new_mb_last_nm and old_mbr_sex=new_mbr_sex)
or ( substring(old_mb_last_nm,1,1)=substring(new_mb_last_nm,1,1) and old_mb_first_nm=new_mb_first_nm and old_mbr_sex=new_mbr_sex) 
or ( substring(old_mb_first_nm,1,5)=substring(new_mb_first_nm,1,5) and substring(old_mb_last_nm,1,5)=substring(new_mb_last_nm,1,5)  and old_mbr_sex=new_mbr_sex)
group by 2,3,4
