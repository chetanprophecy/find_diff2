Create table ss_030_d_pa_mem_sk_20230606 as select u.pa_mbr_sk as new_mbr_sk,d.pa_mbr_sk as old_mbr_sk from 
sandbox..ss_030_d_pa_mem_dups_20230606 d left join sandbox..ss_030_d_pa_mem_uni_20230606 u on u.pa_carrier_id=d.pa_carrier_id and d.carrier_nm=u.carrier_nm and d.pa_account_id=u.pa_account_id and d.account_nm=u.account_nm and d.pa_employer_group_id=u.pa_employer_group_id and 
d.employer_group_nm=u.employer_group_nm and d.grp_situs_st=u.grp_situs_st and d.mbr_fst_nm=u.mbr_fst_nm and d.mbr_midl_init=u.mbr_midl_init and 
d.mbr_lst_nm=u.mbr_lst_nm and d.mbr_adr_1=u.mbr_adr_1 and d.mbr_adr_2=u.mbr_adr_2 and d.mbr_adr_3=u.mbr_adr_3 and d.asst_grp_fst_nm=u.asst_grp_fst_nm and 
d.asst_grp_lst_nm=u.asst_grp_lst_nm and d.benefit_cd=u.benefit_cd and d.mbr_city=u.mbr_city and d.cntrct=u.cntrct and d.mbr_country=u.mbr_country and 
d.mbr_dob=u.mbr_dob and d.eff_end_dt=u.eff_end_dt and d.eff_start_dt=u.eff_start_dt and d.mbr_email=u.mbr_email and d.erisa_flg=u.erisa_flg and 
d.facility_cd=u.facility_cd and d.facility_nm=u.facility_nm and d.hic=u.hic and d.legal_entity=u.legal_entity and d.lics_copay_catgy=u.lics_copay_catgy and 
d.lics_from_dt=u.lics_from_dt and d.lics_subs_lvl=u.lics_subs_lvl and d.lics_thru_dt=u.lics_thru_dt and d.medcr=u.medcr and d.mmis_no=u.mmis_no and 
d.obligor_id=u.obligor_id and d.plan=u.plan and d.plan_cntrct=u.plan_cntrct and d.plan_pbp=u.plan_pbp and d.plan_qualfr=u.plan_qualfr and d.plan_situs_st=u.plan_situs_st and 
d.prod_schd=u.prod_schd and d.pa_mbr_sex=u.pa_mbr_sex and d.mbr_ssn=u.mbr_ssn and d.mbr_st=u.mbr_st and d.pa_mbr_zip=u.pa_mbr_zip and d.incident_nbr=u.incident_nbr and 
d.plan_eff_dt=u.plan_eff_dt and d.pa_mbr_id=u.pa_mbr_id and d.email_pref=u.email_pref and d.seg_id=u.seg_id and d.plan_nm=u.plan_nm and d.family_id=u.family_id and 
d.alt_ins_flg=u.alt_ins_flg and d.acct_typ=u.acct_typ and d.dur_key=u.dur_key and d.dur_rating_st=u.dur_rating_st and d.dur_busns_entity=u.dur_busns_entity;

