select count(1) from (select a.*, row_number() over(partition by pa_carrier_id,carrier_nm,pa_account_id,account_nm,pa_employer_group_id,employer_group_nm,grp_situs_st,mbr_fst_nm,mbr_midl_init,mbr_lst_nm,mbr_adr_1,
mbr_adr_2,mbr_adr_3,asst_grp_fst_nm,asst_grp_lst_nm,benefit_cd,mbr_city,cntrct,mbr_country,mbr_dob,eff_end_dt,eff_start_dt,mbr_email,erisa_flg,facility_cd,
facility_nm,hic,legal_entity,lics_copay_catgy,lics_from_dt,lics_subs_lvl,lics_thru_dt,medcr,mmis_no,obligor_id,plan,plan_cntrct,plan_pbp,plan_qualfr,plan_situs_st,
prod_schd,pa_mbr_sex,mbr_ssn,mbr_st,pa_mbr_zip,incident_nbr,plan_eff_dt,pa_mbr_id,email_pref,seg_id,plan_nm,family_id,alt_ins_flg,acct_typ,dur_key,dur_rating_st,
dur_busns_entity order by update_ts desc) as rn
from (select pa_mbr_sk,
case when trim(pa_mbr_id)='' or pa_mbr_id is null then '-' else nvl(pa_mbr_id,'-') end as pa_mbr_id,
cag_sk,mbr_sk,
case when trim(pa_carrier_id)='' or pa_carrier_id is null then '-' else nvl(pa_carrier_id,'-') end as pa_carrier_id,
case when trim(carrier_nm)='' or carrier_nm is null then '-' else nvl(carrier_nm,'-') end as carrier_nm,
case when trim(pa_account_id)='' or pa_account_id is null then '-' else nvl(pa_account_id,'-') end as pa_account_id,
case when trim(account_nm)='' or account_nm is null then '-' else nvl(account_nm,'-') end as account_nm,
case when trim(pa_employer_group_id)='' or pa_employer_group_id is null then '-' else nvl(pa_employer_group_id,'-') end as pa_employer_group_id,
case when trim(employer_group_nm)='' or employer_group_nm is null then '-' else nvl(employer_group_nm,'-') end as employer_group_nm,
case when trim(grp_situs_st)='' or grp_situs_st is null then '-' else nvl(grp_situs_st,'-') end as grp_situs_st,
case when trim(mbr_fst_nm)='' or mbr_fst_nm is null then '-' else nvl(mbr_fst_nm,'-') end as mbr_fst_nm,
case when trim(mbr_midl_init)='' or mbr_midl_init is null then '-' else nvl(mbr_midl_init,'-') end as mbr_midl_init,
case when trim(mbr_lst_nm)='' or mbr_lst_nm is null then '-' else nvl(mbr_lst_nm,'-') end as mbr_lst_nm,
case when trim(mbr_adr_1)='' or mbr_adr_1 is null then '-' else nvl(mbr_adr_1,'-') end as mbr_adr_1,
case when trim(mbr_adr_2)='' or mbr_adr_2 is null then '-' else nvl(mbr_adr_2,'-') end as mbr_adr_2,
case when trim(mbr_adr_3)='' or mbr_adr_3 is null then '-' else nvl(mbr_adr_3,'-') end as mbr_adr_3,
case when trim(asst_grp_fst_nm)='' or asst_grp_fst_nm is null then '-' else nvl(asst_grp_fst_nm,'-') end as asst_grp_fst_nm,
case when trim(asst_grp_lst_nm)='' or asst_grp_lst_nm is null then '-' else nvl(asst_grp_lst_nm,'-') end as asst_grp_lst_nm,
case when trim(benefit_cd)='' or benefit_cd is null then '-' else nvl(benefit_cd,'-') end as benefit_cd,
case when trim(mbr_city)='' or mbr_city is null then '-' else nvl(mbr_city,'-') end as mbr_city,
case when trim(cntrct)='' or cntrct is null then '-' else nvl(cntrct,'-') end as cntrct,
case when trim(mbr_country)='' or mbr_country is null then '-' else nvl(mbr_country,'-') end as mbr_country,
case when trim(mbr_dob)='' or mbr_dob is null then '19000101' else nvl(mbr_dob,'19000101') end as mbr_dob,
case when trim(eff_end_dt)='' or eff_end_dt is null then '19000101' else nvl(eff_end_dt,'19000101') end as eff_end_dt,
case when trim(eff_start_dt)='' or eff_start_dt is null then '19000101' else nvl(eff_start_dt,'19000101') end as eff_start_dt,
case when trim(mbr_email)='' or mbr_email is null then '-' else nvl(mbr_email,'-') end as mbr_email,
case when trim(erisa_flg)='' or erisa_flg is null then '-' else nvl(erisa_flg,'-') end as erisa_flg,
case when trim(facility_cd)='' or facility_cd is null then '-' else nvl(facility_cd,'-') end as facility_cd,
case when trim(facility_nm)='' or facility_nm is null then '-' else nvl(facility_nm,'-') end as facility_nm,
case when trim(hic)='' or hic is null then '-' else nvl(hic,'-') end as hic,
case when trim(legal_entity)='' or legal_entity is null then '-' else nvl(legal_entity,'-') end as legal_entity,
case when trim(lics_copay_catgy)='' or lics_copay_catgy is null then '-' else nvl(lics_copay_catgy,'-') end as lics_copay_catgy,
case when trim(lics_from_dt)='' or lics_from_dt is null then '19000101' else nvl(lics_from_dt,'19000101') end as lics_from_dt,
case when trim(lics_subs_lvl)='' or lics_subs_lvl is null then '-' else nvl(lics_subs_lvl,'-') end as lics_subs_lvl,
case when trim(lics_thru_dt)='' or lics_thru_dt is null then '19000101' else nvl(lics_thru_dt,'19000101') end as lics_thru_dt,
case when trim(medcr)='' or medcr is null then '-' else nvl(medcr,'-') end as medcr,
case when trim(mmis_no)='' or mmis_no is null then '-' else nvl(mmis_no,'-') end as mmis_no,
case when trim(obligor_id)='' or obligor_id is null then '-' else nvl(obligor_id,'-') end as obligor_id,
case when trim(plan)='' or plan is null then '-' else nvl(plan,'-') end as plan,
case when trim(plan_cntrct)='' or plan_cntrct is null then '-' else nvl(plan_cntrct,'-') end as  plan_cntrct,
case when trim(plan_pbp)='' or plan_pbp is null then '-' else nvl(plan_pbp,'-') end as plan_pbp,
case when trim(plan_qualfr)='' or plan_qualfr is null then '-' else nvl(plan_qualfr,'-') end as plan_qualfr,
case when trim(plan_situs_st)='' or plan_situs_st is null then '-' else nvl(plan_situs_st,'-') end as plan_situs_st,
case when trim(prod_schd)='' or prod_schd is null then '-' else nvl(prod_schd,'-') end as prod_schd,
case when trim(pa_mbr_sex)='' or pa_mbr_sex is null then '-' else nvl(pa_mbr_sex,'-') end as pa_mbr_sex,
case when trim(mbr_ssn)='' or mbr_ssn is null then '-' else nvl(mbr_ssn,'-') end as mbr_ssn,
case when trim(mbr_st)='' or mbr_st is null then '-' else nvl(mbr_st,'-') end as mbr_st,
case when trim(pa_mbr_zip)='' or pa_mbr_zip is null then '-' else nvl(pa_mbr_zip,'-') end as pa_mbr_zip,
case when trim(incident_nbr)='' or incident_nbr is null then '-' else nvl(incident_nbr,'-') end as incident_nbr,
case when trim(plan_eff_dt)='' or plan_eff_dt is null then '19000101' else nvl(plan_eff_dt,'19000101') end as plan_eff_dt,
insert_uid,update_uid,run_id,rec_stat_cd,src_env_sk,insert_ts,update_ts,
case when trim(email_pref)='' or email_pref is null then '-' else nvl(email_pref,'-') end as email_pref,
case when trim(seg_id)='' or seg_id is null then '-' else nvl(seg_id,'-') end as seg_id,
case when trim(plan_nm)='' or plan_nm is null then '-' else nvl(plan_nm,'-') end as plan_nm,
case when trim(family_id)='' or family_id is null then '-' else nvl(family_id,'-') end as family_id,
case when trim(alt_ins_flg)='' or alt_ins_flg is null then '-' else nvl(alt_ins_flg,'-') end as alt_ins_flg,
case when trim(acct_typ)='' or acct_typ is null then '-' else nvl(acct_typ,'-') end as acct_typ,
case when trim(dur_key)='' or dur_key is null then '-' else nvl(dur_key,'-') end as dur_key,
case when trim(dur_rating_st)='' or dur_rating_st is null then '-' else nvl(dur_rating_st,'-') end as dur_rating_st,
case when trim(dur_busns_entity)='' or dur_busns_entity is null then '-' else nvl(dur_busns_entity,'-') end as dur_busns_entity
from orx_idw_dm_prd..d_pa_member ) a) b where b.rn!=1