select 'D_CAG',count(*) from (select carrier_acct_sk,cag_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_CAG group by carrier_acct_sk,cag_sk having count(*) >1) a union

select 'D_GPI',count(*) from (select gpi_id,gpi_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_GPI group by gpi_id,gpi_sk having count(*) >1) a union

select 'D_PLAN',count(*) from (select pln_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PLAN group by pln_sk having count(*) >1) a union

select 'D_CAG_ADJUD',count(*) from (select cag_adjud_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_CAG_ADJUD group by cag_adjud_sk having count(*) >1) a  union

select 'D_GROUP_ELIGIBILITY',count(*) from (select carrier_id, account_id, employer_group_id, gel_seq_nbr as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_GROUP_ELIGIBILITY group by carrier_id, account_id, employer_group_id, gel_seq_nbr having count(*) >1) a union

select 'D_MEMBER',count(*) from (select mbr_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..d_member group by mbr_sk having count(*) >1) a union

select 'D_MEMBER_ADJUD',count(*) from (select mbr_adjud_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MEMBER_ADJUD group by mbr_adjud_sk having count(*) >1) a union

select 'D_MEMBER_ALT_INSURANCE',count(*) from (select mbr_id, carrier_id, account_id, employer_group_id, sequence_num as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MEMBER_ALT_INSURANCE group by mbr_id, carrier_id, account_id, employer_group_id, sequence_num having count(*) >1) a union

select 'D_MEMBER_ELIGIBILITY',count(*) from (select mbr_eligty_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MEMBER_ELIGIBILITY group by mbr_eligty_sk having count(*) >1) a  union

select 'D_MEMBER_ELIGIBILITY_ADJUD',count(*) from (select mbr_eligty_adjud_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MEMBER_ELIGIBILITY_ADJUD group by mbr_eligty_adjud_sk having count(*) >1) a union

select 'D_MEMBER_SUPPL_IDENTITY',count(*) from (select mbr_id,carrier_id,account_id,employer_group_id,msi_suppl_id_type,msi_seq_nbr as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MEMBER_SUPPL_IDENTITY group by mbr_id,carrier_id,account_id,employer_group_id,msi_suppl_id_type,msi_seq_nbr having count(*) >1) a union

select 'D_MMD_MEMBER_ELIGIBILITY',count(*) from (select mbr_mmd_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_MMD_MEMBER_ELIGIBILITY where MMD_THRU_DT  >= '2020-01-01' group by mbr_mmd_sk having count(*) >1) a union

select 'D_PHARMACY',count(*) from (select phr_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PHARMACY group by phr_sk having count(*) >1) a union

select 'D_PRESCRIBER',count(*) from (select pbr_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PRESCRIBER group by pbr_sk having count(*) >1) a union

select 'D_PRODUCT',count(*) from (select prod_id_qlfr_cd,prod_sk as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PRODUCT group by prod_id_qlfr_cd,prod_sk having count(*) >1) a union

select 'D_PRODUCT_ADJUD',count(*) from (select prod_adjud_sk,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PRODUCT_ADJUD group by prod_adjud_sk having count(*) >1) a union

select 'D_PA_MEMBER',count(*) from (select pa_carrier_id, carrier_nm, pa_account_id, account_nm, pa_employer_group_id,  employer_group_nm, grp_situs_st, mbr_fst_nm, mbr_midl_init, mbr_lst_nm, mbr_adr_1, mbr_adr_2, mbr_adr_3,  asst_grp_fst_nm, asst_grp_lst_nm, benefit_cd, mbr_city, cntrct, mbr_country, mbr_dob, eff_end_dt, eff_start_dt,  mbr_email, erisa_flg, facility_cd, facility_nm, hic, legal_entity, lics_copay_catgy, lics_from_dt, lics_subs_lvl,  lics_thru_dt, medcr, mmis_no, obligor_id, "plan", plan_cntrct, plan_pbp, plan_qualfr, plan_situs_st, prod_schd,  pa_mbr_sex, mbr_ssn, mbr_st, pa_mbr_zip, incident_nbr, plan_eff_dt, pa_mbr_id, email_pref, seg_id, plan_nm,  family_id, alt_ins_flg, acct_typ, dur_key, dur_rating_st, dur_busns_entity as nk_key,count(*) as total_cnt from ORX_IDW_DM_PRD..D_PA_MEMBER  group by pa_carrier_id, carrier_nm, pa_account_id, account_nm, pa_employer_group_id, employer_group_nm, grp_situs_st,  mbr_fst_nm, mbr_midl_init, mbr_lst_nm, mbr_adr_1, mbr_adr_2, mbr_adr_3, asst_grp_fst_nm, asst_grp_lst_nm, benefit_cd,  mbr_city, cntrct, mbr_country, mbr_dob, eff_end_dt, eff_start_dt, mbr_email, erisa_flg, facility_cd, facility_nm, hic,  legal_entity, lics_copay_catgy, lics_from_dt, lics_subs_lvl, lics_thru_dt, medcr, mmis_no, obligor_id, "plan", plan_cntrct,  plan_pbp, plan_qualfr, plan_situs_st, prod_schd, pa_mbr_sex, mbr_ssn, mbr_st, pa_mbr_zip, incident_nbr, plan_eff_dt,  pa_mbr_id, email_pref, seg_id, plan_nm, family_id, alt_ins_flg, acct_typ, dur_key, dur_rating_st, dur_busns_entity having count(*) >1) a union

select 'F_PA_CASE_DETAIL',count(*) from  (select pa_case_id,rec_eff_ts as cnt from ORX_IDW_DM_PRD..F_PA_CASE_DETAIL group by pa_case_id,rec_eff_ts having count(*) >1) a union

select 'D_MEMBER_DIAGNOSIS',count(*) from (select mbr_sk, diag_sk, mdx_seq_nbr,src_env_sk as NK_KEY from ORX_IDW_DM_PRD..d_member_diagnosis group by mbr_sk, diag_sk, mdx_seq_nbr,src_env_sk having count(*) >1) a union

select 'D_PROD_CAG_SPCLTY_XREF',count(*) from  (select cag_sk,prod_sk,src_env_sk as cnt,'D_PROD_CAG_SPCLTY_XREF' as tbl from ORX_IDW_DM_PRD..D_PROD_CAG_SPCLTY_XREF group by cag_sk,prod_sk,src_env_sk having count(*) >1) a


