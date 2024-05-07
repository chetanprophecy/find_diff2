select * from ORX_IDW_DM_PRD.ADMIN.D_PRODUCT
where update_ts >= '2023-06-11 00:00:00' and 
(drg_ldd_ind is NULL or drg_ldd_ind = '-' or 
drg_biosim_ind is NULL or drg_biosim_ind = '-')
order by update_ts desc limit 100;
