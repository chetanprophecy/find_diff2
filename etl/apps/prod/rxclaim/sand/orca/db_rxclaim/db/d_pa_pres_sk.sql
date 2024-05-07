create table sandbox..ss_030_d_pa_pres_sk as
select u.pa_pbr_sk as new_sk,d.pa_pbr_sk as old_sk from 
sandbox..ss_030_d_pa_pres_dup as d left join sandbox..ss_030_d_pa_pres_unq u
on u.pa_prov_id=d.pa_prov_id and u.prov_id_qualfr=d.prov_id_qualfr and u.src_prov_key=d.src_prov_key and u.prov_fst_nm=d.prov_fst_nm 
and u.prov_midl_nm=d.prov_midl_nm and u.prov_lst_nm=d.prov_lst_nm and u.prov_adr_1=d.prov_adr_1 and u.prov_adr_2=d.prov_adr_2 and u.adr_qualfr=d.adr_qualfr 
and u.adr_typ=d.adr_typ and u.prov_city=d.prov_city and u.prov_country=d.prov_country and u.prov_fax=d.prov_fax and u.prov_tel=d.prov_tel and u.prov_tel_extn=d.prov_tel_extn
 and u.prov_email=d.prov_email and u.py_adr=d.py_adr and u.speciality_cd=d.speciality_cd and u.speciality_desc=d.speciality_desc and u.prov_st=d.prov_st 
 and u.prov_tax_id=d.prov_tax_id and u.vend_key=d.vend_key and u.prov_zipcode=d.prov_zipcode and u.prov_id_st=d.prov_id_st and u.alt_tel_nbr=d.alt_tel_nbr;

