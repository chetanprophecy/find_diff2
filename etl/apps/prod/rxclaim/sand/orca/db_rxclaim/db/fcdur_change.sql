update ORX_IDW_DM_PRD.ADMIN.F_CDUR_EVENTS A 
set A.prod_sk =B.prod_sk , A.CNFLCT_PROD_SK = -1
from 
(SELECT S.claim_nbr , S.claim_seq_nbr , s.CLAIM_STAT_ID ,S.dur_rsp_cd_cntr , S.src_env_sk ,S.CNFLCT_PROD_SK ,S.prod_sk
FROM ( select distinct claim_nbr , claim_seq_nbr , CLAIM_STAT_ID ,dur_rsp_cd_cntr , src_env_sk ,CNFLCT_PROD_SK, prod_sk from
ORX_IDW_DM_PRD.ADMIN.F_CDUR_EVENTS_20230619 where update_uid<>'PROD_CMPD_SK_MAY' and CNFLCT_PROD_SK=3183660 )S inner join ORX_IDW_DM_PRD.ADMIN.F_CDUR_EVENTS T
on  T.claim_nbr= S.claim_nbr AND
T.claim_seq_nbr= S.claim_seq_nbr AND
T.claim_stat_id= S.claim_stat_id AND
T.dur_rsp_cd_cntr=S.dur_rsp_cd_cntr AND
T.src_env_sk=S.src_env_sk
 and T.UPDATE_UID='PROD_CMPD_SK_MAY' and S.CNFLCT_PROD_SK=T.CNFLCT_PROD_SK
 ) B
where 
A.claim_nbr= B.claim_nbr AND
A.claim_seq_nbr= B.claim_seq_nbr AND
A.claim_stat_id= B.claim_stat_id AND
A.dur_rsp_cd_cntr=B.dur_rsp_cd_cntr AND
A.src_env_sk=B.src_env_sk and A.CNFLCT_PROD_SK=3183660;
