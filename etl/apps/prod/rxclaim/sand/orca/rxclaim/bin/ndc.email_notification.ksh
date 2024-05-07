#/bin/ksh -e

v_email_to_list=$1;
v_report_start_dt=`echo $2 | awk -F ' ' '{print $1}'`;
v_report_end_dt=`echo $3 | awk -F ' ' '{print $1}'`;
v_attachment=$4

echo "<html>
<body>
<font face='verdana' color='green' size=2>
Hi Team,<br><br>

Alternate NDC Pricing Accuracy Reports for period <b>"$v_report_start_dt"</b> to <b>"$v_report_end_dt"</b> are generated and published to shared locations(NAS/RXCLAIM).<br><br>

Please reach out to Abinitio-ETL support team (ai-dm-support@ds.uhc.com) for any queries.<br><br>

<b>Note:</b>Kindly expect short delay in availability of reports at NAS drive since those are &nbsp;published via ECG Transfer.<br><br>

Regards,<br>
Abinitio-ETL Team<br><br>

****************** This is auto generated notification. Please do not reply to this email *******************
</font>
</body>
</html>
">/tmp/ndc_email_notification.html

mutt -e "set content_type=text/html from='Automated Job <alt_ndc_reporting.$AI_PHASE@optum.com>'"  -c $v_email_to_list -s "Automated Notification: Alternate NDC Reporting for $v_report_start_dt to $v_report_end_dt"  </tmp/ndc_email_notification.html
