select count(1) from (select mbr.carrier_id as new_carrier_id, mbr.account_id as new_account_id, mbr.employer_group_id as new_employer_group_id,mbr.mb_first_nm as new_mb_first_nm,mbr.mb_last_nm as new_mb_last_nm,mbr.mbr_sex as new_mbr_sex,mbr.mbr_dt_of_brth as new_mbr_dt_of_brth,mel_eff_dt as new_mel_eff_dt from orx_idw_dm_prd..d_member mbr left join orx_idw_dm_prd..d_member_eligibility elig on mbr.carrier_id=elig.carrier_id and mbr.account_id=elig.account_id and mbr.employer_group_id=elig.employer_group_id and mbr.mbr_id=elig.mbr_id where mel_thru_dt>='20230428' and mel_stat_cd='A'
and mbr.carrier_id in ('UHC0011XX')  and ( mbr.src_env_sk = 490)  and 
((mbr.account_id like '%' and  mbr.employer_group_id like '%') or 
(  mbr.account_id like '%' and  mbr.employer_group_id like '%') or 
( mbr.account_id like '%' and  mbr.employer_group_id like '%') or 
( mbr.account_id like '%' and  mbr.employer_group_id like '%') or 
  ( mbr.account_id like '%' and  mbr.employer_group_id like '%') or 
  ( mbr.account_id like '%' and  mbr.employer_group_id like '%') 
  or ( mbr.account_id like '%' and  mbr.employer_group_id like '%')))d
