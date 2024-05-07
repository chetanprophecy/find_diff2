#!/bin/ksh

(
echo "To: PBM_DATA_TECH_SERVICES_ETL_PROD_SUPPORT_DL@ds.uhc.com"
echo "Subject : ORx fact integration start delayed"
echo "Content-Type : text/plain"
echo "X-Priority : 1 (Highest)"
echo "X-MSMail-Priority : High"
echo ""
echo ""
echo "Hi Team,"
echo " "
echo "ORx fact integration start is delayed. Please investigate."
echo ""
echo "Thanks and Regards,"
echo "Ab initio Support Team"
echo "Note : This is a system generated mail. Please do not reply."
) | /usr/sbin/sendmail -t -F "Rxclaim Support"
