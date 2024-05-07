#!/bin/ksh

#Run project setup
if [[ "$AI_PHASE" == "prod" ]] ; then
	cd /etl/apps/prod/rxclaim/sand/orca/rxclaim
elif [[ "$AI_PHASE" == "dev" ]] ; then
	cd /etl/devel/appconf.rxclaim_idw_direct/idw_direct/users/$USER/orca/rxclaim
else
        cd /etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim
fi
. ./ab_project_setup.ksh .

EXCEL_PATTERN=?????_????_MPF_*_Ratings_????????.xlsx
SUMMARY_EXCEL_PATTERN=?????_????_MPF_*_Ratings_Summary_????????.xlsx
TXT_FILE_PATTERN=?????_*mismatch_claims_????????.txt
ECG_LANDING_PATH=${AI_ECG_INBOUND}/aiorcrxc/RXCLAIM/STARS
ls -ltr $ECG_LANDING_PATH | grep ^- | awk '{print $NF}' | while read filename
do
if [[ $filename == $EXCEL_PATTERN ]]
then
 NUMBER_OF_FIELDS=`excel-gendml.ksh -single $ECG_LANDING_PATH/$filename -sheet-index 1 -sheet-header-row 3 | wc -l`
 if [[ $NUMBER_OF_FIELDS -eq 23 ]]
 then
  mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/excel_without_days_supply/.
  #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
  echo $filename ' successfully processed.'
 elif [[ $NUMBER_OF_FIELDS -eq 24 ]]
 then
  mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/excel/.
  #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
  echo $filename ' successfully processed.'
 else
  echo "Unexpected Number of Fields found in $filename"
 fi
elif [[ $filename == $SUMMARY_EXCEL_PATTERN ]]
 then
 # mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/summary_excel/.
  #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
 # echo $filename ' successfully processed.'
# new file entry
 NUMBER_OF_FIELDS=`excel-gendml.ksh -single $ECG_LANDING_PATH/$filename -sheet-index 1 -sheet-header-row 3 | wc -l`
 if [[ $NUMBER_OF_FIELDS -eq 15 ]]
 then
  mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/summary_excel/.
  #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
  echo $filename ' successfully processed.'
 elif [[ $NUMBER_OF_FIELDS -eq 16 ]]
 then
  mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/summary_excel_acc_scr/.
  #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
  echo $filename ' successfully processed.'
 else
  echo "Unexpected Number of Fields found in $filename"
 fi

elif [[ $filename == $TXT_FILE_PATTERN ]]
 then
  NUMBER_OF_FIELDS=`head -1 $ECG_LANDING_PATH/$filename | awk '{print NF}'`
  if [[ $NUMBER_OF_FIELDS -eq 17 ]]
  then
   mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/txt/.
   #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
   echo $filename ' successfully processed.'
  elif [[ $NUMBER_OF_FIELDS -eq 16 ]]
  then
   mv $ECG_LANDING_PATH/$filename $AI_SERIAL_PENDING/rxclaim/txt_without_days_supply/.
   #mv $AI_SERIAL_PENDING/$filename $AI_SERIAL_PENDING/processed/.
   echo $filename ' successfully processed.'
  else
   echo "Unexpected Number of Fields found in $filename"
  fi
else
 echo "$filename does not match any pattern."
 dt=$(date '+%Y%m%d')
 touch  $AI_SERIAL_PENDING/rxclaim/txt/abcde_mismatch_claims_${dt}.txt
 touch $AI_SERIAL_PENDING/rxclaim/txt_without_days_supply/abcde_mismatch_claims_${dt}.txt
fi
done
