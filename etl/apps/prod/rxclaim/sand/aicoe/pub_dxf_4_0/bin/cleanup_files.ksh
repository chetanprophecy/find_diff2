#!/bin/ksh

SB_PATH=$(dirname $PWD)

echo $SB_PATH

#############################################
#					    #
# Check if required parameters have been    #
# passed to the scripts			    #
#					    #
#############################################

if [[ $# != 2 ]]
then
echo "Illegal number of parameters"
echo -e "\tCommand Syntax : find_old_files.ksh FILE_LIST RUN_ID_FILE"
echo -e "\tFILE_LIST : Pass the file which has location and pattern to search for deletion"
echo -e "\tRUN_ID : Pass the todays RUN_ID "
exit 1
fi

#############################################
#	Check if file list file exists	    #
#############################################

if [[ ! -f $1 ]]
then


echo "Pattern File list $1 does not exist"
echo "Please create the file "
exit 1
fi


#############################################
#		Initialization		    #
#	Get run_id from the file 	    #
#############################################

#The run id with which log file will be created
RUN_ID=$2

#Log file 
LOG_FILE=`eval echo $AI_SERIAL_LOG/cleanup_log.$RUN_ID.log`

#Default modifcation time for find command
MOD_TIME="+120"

echo -e  "\n\nRun ID : $RUN_ID"
echo -e "\nLog file : $LOG_FILE\n"
#############################################
#		Searching		    #
# Search for given pattern in the given     #
# directory and create a log file for todays#
# RUN_ID				    #
#############################################


for line in `cat $1`
do
	file_path=`eval echo $line | awk -F"," '{print $1}'`;
	pattern=`eval echo $line | awk -F"," '{print $2}'`;
	modification_time=`eval echo $line | awk -F"," '{print $3}'`;

#Check if we have modification time given for a pattern , if not given use default modification time
	if [ "$modification_time" == "" ];
	then
		modification_time=$MOD_TIME
	fi

	echo "Searching for $pattern pattern in $file_path which have been modified $modification_time days before"
	find $file_path -name $pattern -mtime $modification_time >> $LOG_FILE;
done

#############################################
#	Print file list to console	    #
#############################################


echo -e "\n\nBelow files have been identified for deletion :"
cat $LOG_FILE;
echo -e "\n\n"

#############################################
#    Deleting the file as per log file	    #
#					    #
#############################################


for file_name in `cat $LOG_FILE`
do

	echo "Removing $file_name"
	m_rm -f $file_name;

done


#############################################
#	Script completed Successfully       #
#############################################

echo -e "\n\nScript Completed"


