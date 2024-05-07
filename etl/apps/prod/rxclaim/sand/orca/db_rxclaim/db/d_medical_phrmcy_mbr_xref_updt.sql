update orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref a
set a.cag_sk = b.cag_sk , a.sec_flg=0, a.update_uid='CAG_CARR_MBR_SK_UPD' , a.update_ts= (select max(update_ts) from 
orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref) from orx_idw_dm_prd.admin.d_cag b
where
a.mcad_carrier_id = b.carrier_id and 
a.mcad_account_id = b.account_id  and
a.mcad_group_id = employer_group_id and
a.cag_sk is null;

update orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref a
set a.carrier_sk = b.carrier_sk , a.sec_flg=0, a.update_uid='CAG_CARR_MBR_SK_UPD' , a.update_ts= (select max(update_ts) from 
orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref) from ( select carrier_id ,carrier_sk from (select carrier_id , carrier_sk ,row_number() over 
( partition by carrier_id order by update_ts ) rnk from  orx_idw_dm_prd.admin.d_carrier ) d_carrier where rnk =1 ) b
where
a.mcad_carrier_id = b.carrier_id and
a.carrier_sk is null;

update orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref a
set a.mbr_sk = b.mbr_sk , a.sec_flg=0, a.update_uid='CAG_CARR_MBR_SK_UPD' , a.update_ts= (select max(update_ts) from 
orx_idw_dm_prd.admin.d_medical_phrmcy_mbr_xref) from orx_idw_dm_prd.admin.d_member b
where
a.mcad_carrier_id = b.carrier_id and 
a.mcad_account_id = b.account_id  and
a.mcad_group_id = employer_group_id and 
a.patient_pharm_member_id = b.mbr_id and
a.mbr_sk is null;
