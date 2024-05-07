create table ss_030_d_pa_user_skills_uni as select b.pa_user_sk,b.skill_seq_nbr,b.skill_nm,b.skill_rating,b.skill_rank,b.src_env_sk,b.run_id,b.rec_stat_cd,b.insert_uid,b.update_uid,b.insert_ts,b.update_ts from(
select a.*, row_number() over(partition by pa_user_sk,skill_seq_nbr order by update_ts desc) as rn from(
select nvl(pa_user_sk,0) as pa_user_sk,nvl(skill_seq_nbr,0) as skill_seq_nbr,
case when trim(skill_nm)='' or skill_nm is null then '-' else nvl(skill_nm,'-') end as skill_nm,
nvl(skill_rating,0) as skill_rating,nvl(skill_rank,0) as skill_rank,src_env_sk,run_id,rec_stat_cd,insert_uid,update_uid,insert_ts,update_ts
from ss_030_d_pa_user_skills_ids) a ) b where b.rn=1;
