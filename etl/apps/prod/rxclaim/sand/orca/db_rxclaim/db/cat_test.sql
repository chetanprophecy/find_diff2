select count(1),new_carrier_id,new_account_id,new_employer_group_id
from (select carrier_id as old_carrier_id, account_id as old_account_id, employer_group_id as old_employer_group_id,mb_first_nm as old_mb_first_nm,mb_last_nm as old_mb_last_nm,mbr_sex as old_mbr_sex,mbr_dt_of_brth as old_mbr_dt_of_brth from orx_idw_dm_prd..d_member where ( src_env_sk = 490) and carrier_id in ('UHC0006XX') and employer_group_id like '%' and account_id like '%') as old_1
left join (select mbr.carrier_id as new_carrier_id, mbr.account_id as new_account_id, mbr.employer_group_id as new_employer_group_id,mbr.mb_first_nm as new_mb_first_nm,mbr.mb_last_nm as new_mb_last_nm,mbr.mbr_sex as new_mbr_sex,mbr.mbr_dt_of_brth as new_mbr_dt_of_brth,mel_eff_dt as new_mel_eff_dt from orx_idw_dm_prd..d_member mbr left join orx_idw_dm_prd..d_member_eligibility elig on mbr.carrier_id=elig.carrier_id and mbr.account_id=elig.account_id and mbr.employer_group_id=elig.employer_group_id and mbr.mbr_id=elig.mbr_id where mel_thru_dt>='20230428' and mel_stat_cd='A'
and mbr.carrier_id in ('UHC0011XX')  and ( mbr.src_env_sk = 490)  and
((mbr.account_id like '%' and  mbr.employer_group_id like '%'))) as new_1 on old_mbr_dt_of_brth=new_mbr_dt_of_brth where (old_mb_first_nm=new_mb_first_nm and old_mb_last_nm=new_mb_last_nm)
or( substring(old_mb_first_nm,1,1)=substring(new_mb_first_nm,1,1) and old_mb_last_nm=new_mb_last_nm and old_mbr_sex=new_mbr_sex)
or ( substring(old_mb_last_nm,1,1)=substring(new_mb_last_nm,1,1) and old_mb_first_nm=new_mb_first_nm and old_mbr_sex=new_mbr_sex)
or ( substring(old_mb_first_nm,1,5)=substring(new_mb_first_nm,1,5) and substring(old_mb_last_nm,1,5)=substring(new_mb_last_nm,1,5)  and old_mbr_sex=new_mbr_sex)
group by 2,3,4
