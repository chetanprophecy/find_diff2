#!/bin/ksh/ -e
rxclaim_trigger_directory=/etl/data/prod/serial/aicoe/pub_datahub/main/bpe_trigger
bpe_rxclaim_trigger_directory=/etl/data/prod/serial/aicoe/pub_datahub/main/

cd $rxclaim_trigger_directory
for filenm in `ls -ltr bpe_trigger.????????01010?.dat | awk '{print $NF}'|sort -r |head -2` do
  file_date=$(echo $filenm | awk -F"." '{print $2}')
  echo "file_date passed from input --> $file_date
  
  "
cd $rxclaim_trigger_directory
touch trigger.daily_idw_extr_bpe_dependency.${file_date}.dat


echo " Step2 Copying ids_common log Files

"
src_ids_common_log_directory=/etl/data/prod/serial/aicoe/pub_datahub/log/ids_common
cd $src_ids_common_log_directory
for src_ids_common_log_file in `ls -l *$file_date*|awk -F " " '{print $9}'` do m_cp $src_ids_common_log_file //apvrp80149/etl/data/prod/serial/aicoe/pub_datahub/log/ids_common/

if [[ $? -eq 0 ]];then
echo "IDW - ids_common  log files are copied to STAGE env is successfull

"
#else
#echo "IDW - ids_common log file copy failed to STAGE env..please check"
#echo "Aborting the Script..!!!"
#exit 1
fi
done
echo "Step3 Copying ids_rxclaim log File

"
src_ids_rxclaim_log_directory=/etl/data/prod/serial/aicoe/pub_datahub/log/ids_rxclaim
cd $src_ids_rxclaim_log_directory
for src_ids_rxclaim_log_file in `ls -l *$file_date*|awk -F " " '{print $9}'` do m_cp $src_ids_rxclaim_log_file //apvrp80149/etl/data/prod/serial/aicoe/pub_datahub/log/ids_rxclaim/

if [[ $? -eq 0 ]];then

echo "IDW - ids_rxclaim log files are copied to STAGE env is successfull

"
#else
#echo "IDW - ids_rxclaim log file copy failed to STAGE env..please check"
#echo "Aborting the Script..!!!"
#exit 1
fi
done
echo " Step4 Copying ids_rxclaim Event Files

"
src_ids_rxclaim_event_directory=/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/
cd $src_ids_rxclaim_event_directory
for src_ids_rxclaim_event_file in `ls -l *$file_date* |awk -F " " '{print $9}'` do m_cp $src_ids_rxclaim_event_file //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_rxclaim/

if [[ $? -eq 0 ]];then

echo "IDW - ids_rxclaim Event files are copied to STAGE env is successfull

"
#else
#echo "IDW - ids_rxclaim Event file copy failed to STAGE env..please check"
#echo "Aborting the Script..!!!"
#exit 1
fi
done

echo " Step5 Copying ids_common Event Files

"
src_ids_common_event_directory=/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_common/
cd $src_ids_common_event_directory
for src_ids_common_event_file in `ls -l *$file_date* |awk -F " " '{print $9}'` do m_cp $src_ids_common_event_file //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/main/event/ids_common/

if [[ $? -eq 0 ]];then

echo "IDW - ids_common Event files are copied to STAGE env is successfull

"
#else
#echo "IDW - ids_common Event file copy failed to STAGE env..please check"
#echo "Aborting the Script..!!!"
#exit 1
fi
done


m_cp $rxclaim_trigger_directory/trigger.daily_idw_extr_bpe_dependency.${file_date}.dat //apvrp80149/etl/data/prod/serial/aicoe/pub_datahub/main/trigger/
echo " Step 6 IDW BPE QA Trigger File has created for $file_date

 "
done

echo "Step 7 IDW BPE event logs copy

"
src_event_log_directory=/etl/data/prod/serial/aicoe/pub_datahub/main/event_log/

cd $src_event_log_directory
for src_event_file in `ls -l event_log.*|awk -F " " '{print $9}'` do m_cp $src_event_file //apvrp80149/etl/data/prod/serial/aicoe/pub_datahub/main/event_log/

if [[ $? -eq 0 ]];then

echo "IDW - BPE Event log file copy to STAGE env is successfull

"
#else
#echo "IDW - Event log file copy failed to STAGE env..please check"
#echo "Aborting the Script..!!!"
#exit 1
fi
done



#Copy IDS files for Rally drug extract
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/d_gpi_gppc_pkg_dtl.dat.gz //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/d_gpi_gppc_pkg_dtl.idx //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/d_gpi.dat.gz //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/d_gpi.idx //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/l_admin_route.dat.gz //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/l_admin_route.idx //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/l_dosage_form.dat.gz //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/l_dosage_form.idx //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_rxclaim/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/d_prod_ingredient.dat.gz //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/
#m_cp /etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/d_prod_ingredient.idx //apvrp80149/etl/data/prod/mfs/mfs_8way/aicoe/pub_datahub/lookup/ids/ids_common/one/

#echo "Checking for the trigger file.."
#cd $bpe_rxclaim_trigger_directory
#bpe_trigger_file=trigger.daily_idw_extr_bpe_dependency.??????????????.dat
#if [ -e "${bpe_trigger_file}" ];
#then
#echo "ALERT!!!Trigger file found in the location --> $bpe_rxclaim_trigger_directory"
#echo "Please check if the main distribution plan is still running.."
#echo "Aborting the script!!"
#exit 1
#else
#echo "No Trigger file present in location --> $bpe_rxclaim_trigger_directory"
#echo "Creating the trigger file with the file_date: $file_date"
#touch trigger.daily_idw_extr_bpe_dependency.${file_date}.dat
#fi
