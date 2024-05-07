#!/bin/ksh
################################3333#####################################################################################
#Date : 12/12/2017            	        										#
#Author: Jyoti.Mishra@optum.com												#
#Description: Script to hold proccessing of inactive tables in CPP Outbound Application                     		#
#This Script moves the outbound extract files to $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/<date> folder. 	#
#The table list to be put on hold is read from $AI_META/cpp_outbound.inactive.txt					#
#########################################################################################################################

#Variables
extract_date=`date +%Y%m%d -d '-1 days'`
extract_year=`date +%Y`

#Run project setup
#cd /etl/devel/appconf.rxclaim_idw_direct/idw_direct/users/jmishra3/orca/rxclaim;
#if [[ "$AI_PHASE" == "prod" ]] ; then
	cd /etl/apps/prod/rxclaim/sand/orca/rxclaim
#else
#	cd /etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim
#fi
. ./ab_project_setup.ksh .


#Create unprocessed folder
mkdir -p $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date}/
rc=$?
if [[ "$rc" -ne 0 ]] ; then
	echo "Failed creating directory $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date}"
	exit 1
else
	echo "Directory $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date}/ created successfully"
fi

#Move files to unprocessed folder
for table in `cat $AI_META/cpp_outbound.inactive.txt`
do
	mv $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/${extract_date}/${table}_${extract_year}*.dat $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date}/
	rc=$?
	if [[ "$rc" -ne 0 ]] ; then
		echo "Failed moving ${table} extract file to $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date} directory"
		exit 1
	else
		echo "Successfully moved ${table} extract file to $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/unprocessed/${extract_date} directory"
	fi
done

#Create Trigger file
touch $PUB_CLINICAL_DATAHUB_SERIAL_OUTBOUND/${extract_date}/OUTBOUND_EXTRACT_INACTIVE_$extract_date.ctl
