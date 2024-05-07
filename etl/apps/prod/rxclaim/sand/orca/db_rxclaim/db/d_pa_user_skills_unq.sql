select count(1) from (
select a.*, row_number() over(partition by pa_user_sk,seq_nbr order by update_ts desc) as rn from(
select nvl(pa_user_sk,0) as pa_user_sk,nvl(seq_nbr,0) as seq_nbr,
case when trim(wrk_basket_nm)='' or wrk_basket_nm is null then '-' else nvl(wrk_basket_nm,'-') end as wrk_basket_nm,
src_env_sk,run_id,rec_stat_cd,insert_uid,update_uid,insert_ts,update_ts
from ss_030_d_pa_user_work_basket_ids) a ) b where b.rn!=1
