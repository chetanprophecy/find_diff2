#!/bin/ksh

(
echo "To: orx_idw_ops_team@ds.uhc.com"
echo "Subject : IDW Monthly load completed"
echo "Content-Type : text/plain"
echo "X-Priority : 1 (Highest)"
echo "X-MSMail-Priority : High"
echo ""
echo ""
echo "Hi Team,"
echo " "
echo "The IDW monthly load has completed. Please refresh the aggregate tables."
echo ""
echo "Thanks and Regards,"
echo "Ab initio Support Team"
echo "Note : This is a system generated mail. Please do not reply."
) | /usr/sbin/sendmail -t -F "Rxclaim Support"
