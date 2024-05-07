#/bin/ksh -e
#Email notification script for VA Medallion Project

v_email_to_list=$1;
v_report_start_dt=$2;
v_report_end_dt=$3;


#Generate Email body and store it to temp file
echo "<html>
      <body>
      <font face='verdana' color='green' size=2>
      Hi Team,<br><br>

      VA Medallion PA Reports for period <b>"$v_report_start_dt"</b> to <b>"$v_report_end_dt"</b> are generated and published to shared locations.<br><br>

      Please reach out to Abinitio-ETL support team (ai-dm-support@ds.uhc.com) for any queries.<br><br>

      <b>Note:</b>Kindly expect short delay in availability of reports at NAS drive since those are &nbsp;published via ECG Transfer.<br><br>

      Regards,<br>
      Abinitio-ETL Team<br><br>

      ****************** This is auto generated notification. Please do not reply to this email *******************
      </font>
      </body>
      </html>
      ">/tmp/vamd_email_notification.html


#Send email
mutt -e "set content_type=text/html from='Automated Job <va_medallion_reporting.$AI_PHASE@optum.com>'"  -c $v_email_to_list -s "Automated Notification: VA Medallion PA Reporting for $v_report_start_dt to $v_report_end_dt"  </tmp/vamd_email_notification.html

#Delete Temp file created in step 1
rm /tmp/vamd_email_notification.html
