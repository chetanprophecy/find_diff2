insert into orx_idw_dm_etl_prd..etl_090_carr_acct_fbenft_process
select f.carrier_id , f.acct_id ,
case when c.carrier_nm is null or c.carrier_nm ='-' or trim(c.carrier_nm) = '' then f.carrier_nm else c.carrier_nm end as carrier_nm ,
case when f.acct_nm is null or f.acct_nm ='-' or trim(f.acct_nm) ='' then c.account_nm else f.acct_nm end as account_nm
from ( select carrier_id , account_id , carrier_nm , account_nm from (
select carrier_id , account_id , carrier_nm , account_nm , row_number() over(partition by carrier_id , account_id order by insert_ts desc , update_ts desc)rank
from orx_idw_dm_prd..d_carrier_acct ) carrier_acct where rank=1)  c
inner join
(select carrier_id , acct_id , carrier_nm , acct_nm, update_ts from
(select carrier_id , acct_id ,carrier_nm , acct_nm, update_ts ,
row_number() over ( partition by carrier_id , acct_id  order by benft_record_mon desc , update_ts desc ) rank from orx_idw_rxmax_prd..F_BENFT_FILE_EXTND
where carrier_nm <> 'NULL' and acct_nm<>'NULL'  )
F_BENFT_FILE_EXTND where rank =1 ) f  on c.carrier_id = f.carrier_id and c.account_id = f.acct_id ;
