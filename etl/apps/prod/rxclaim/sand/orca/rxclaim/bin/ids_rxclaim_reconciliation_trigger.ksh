#!/bin/ksh

#PROJ_DIR="/etl/devel/appconf.rxclaim/main/users/smenon13/orca/rxclaim"
PROJ_DIR="/etl/apps/prod/rxclaim/sand/orca/rxclaim"

. ${PROJ_DIR}/ab_project_setup.ksh ${PROJ_DIR}

dt=`date -d 'yesterday' '+%Y%m%d'`
dt1=`date '+%Y%m%d'`
#dt="20170314"

TO_EMAIL=`cat $AI_META/ids_rxclaim_reconciliation_trigger_email.txt`


WORKDIR_LOC=${AI_SERIAL_TEMP}
HTML_FILE="${WORKDIR_LOC}/ids_rxclaim_reconciliation_mismatch.html"


if [ -s ${WORKDIR_LOC}/ids_rxclaim_reconciliation_mismatch.dat ]
 then
  echo "Audit Reconciliation Failed!! Sending Alert Email...";
  echo "<font color="red" size='5' face='Trebuchet MS' > <br><u><FONT FACE="arial" size ='5' align="justify"><h1 align="center">RXCLAIM-IDS-CPP Recon Audit Failed!</h1><br><p align="center">Please investigate!</p><br><p align="center">Trigger File Generated for CPP process not moved to CPP trigger directory: $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl  </p></FONT>  </u><font ='modern, arial, veranda' size='2'></br></br>"  > $HTML_FILE
IFS=$'\n' 
 for x in `cat ${WORKDIR_LOC}/ids_rxclaim_reconciliation_trigger.ctl`
   do
    if [[ $x == *"Success"* ]]; then
     echo "<font color="green" >$x</br>" >> $HTML_FILE
    else
    echo "<font color="red" >$x</br>" >> $HTML_FILE
    fi 
  done
#	echo -e `cat ${WORKDIR_LOC}/ids_rxclaim_reconciliation_trigger.ctl` >> $HTML_FILE 

#############################################################################################################################
(
echo "From: audit@optum.com";
echo "To: ${TO_EMAIL}";
echo "Subject: Rxclaim-IDS-CPP Recon audit failed! Please investigate : - $dt1";
echo "Content-Type: text/html";
echo "MIME-Version: 1.0";
echo "X-Priority: 1 (Highest)"
echo "";
HTML_VAR=`cat $HTML_FILE`
echo "$HTML_VAR";
) | /usr/sbin/sendmail -t

else
  echo "Recon Successfull! Moving trigger file to from ${WORKDIR_LOC}/ids_rxclaim_reconciliation_trigger.ctl to $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl ";
  mv ${WORKDIR_LOC}/ids_rxclaim_reconciliation_trigger.ctl $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl;
  RESULT=$?
   if [ $RESULT -eq 0 ]
    then
     echo "file moved to $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl";
    else
     echo "File copy failed! ${WORKDIR_LOC}/ids_rxclaim_reconciliation_trigger.ctl --> --> $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl"
   fi
#echo "file moved to $PUB_CLINICAL_DATAHUB_SERIAL_CONTROL/ids/ids_rxclaim_reconciliation_trigger.ctl";
fi

exit 0
