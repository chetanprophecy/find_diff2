#!/bin/ksh
########################################################################
#02/05/2017  
#Extract claim_nbr which did not find match with F_CLM_TXN from F_AUDIT_NOTE_QTRLY_CLMS_DETAIL
#and to  prepare extract criteria from rctcdp 
########################################################################
[ -f $AI_SERIAL/override/get.rxclaim_orx.rctcdp.txt]
rm  $AI_SERIAL/override/get.rxclaim_orx.rctcdp.txt 
#Step  1 :  to  build where clause 
echo  "where rctcdp.dqp2nb in ( "  >>  $AI_SERIAL/override/get.rxclaim_orx.rctcdp.txt 

for i in  `cat $AI_SERIAL/get.rxclaim/rxclaim.f_audit_note_qtrly_clms_detail_excp.dat`
do
echo  $i ", " >> $AI_SERIAL/override/get.rxclaim_orx.rctcdp.txt  
done
echo ")" >> $AI_SERIAL/override/get.rxclaim_orx.rctcdp.txt 