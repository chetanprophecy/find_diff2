#!/bin/ksh -e
#Run project setup
HOSTNAME=`hostname`
echo "Hostname is $HOSTNAME"
if [[ $HOSTNAME == "apvrp70062" ]] ; then
        cd /etl/apps/prod/rxclaim/sand/orca/rxclaim
else
        #cd /etl/devel/appconf.rxclaim_idw_main_v4/main/users/j17/orca/rxclaim
        echo "Script should run only in production.Exiting..."
        exit 0
fi
. ./ab_project_setup.ksh .
if [ `echo $?` -ne 0 ]
then
        echo "Project Setup not running.Exiting..."
        exit 1
fi

send_completion_email() {
#################step 6 : HTML File is created : Now sending email ###################################################

echo "
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; }
.datagrid table td, .datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; }
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00496B; border-left: 1px solid #E1EEF4;font-size: 12px;font-weight: normal; }
.datagrid table tbody .alt td { background: #E1EEF4; color: #00496B; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
.datagridH table { border-collapse: collapse; text-align: left; width: 50%;}
.datagridH table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');background-color:#006699; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #0070A8; border-bottom: 1px solid #E1EEF4;}
.header {color: navy; font-size: 15px; font-weight: bold;}
</style>
<body>
<h1 class="header">Hello, <br><br>Azure X1P Trigger Transfer for the day : $curr_ts </h1>
<p>
<div class="datagrid">
<table  width="100%" style="margin-left:80p">
<thead>
<tr>
<th> TRIGGER_PATH </th>
<th> TRIGGER_FILENAME</th>
<tbody>
" > ${AI_SERIAL_TEMP}/x1p_report.dat

for i in `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/transfered_x1p_trigger.dat`;do

  TRIGGER_PATH=`echo $i |cut -d"|" -f1 `
  TRIGGER_FILENAME=`echo $i |cut -d"|" -f2`


            echo "<tr>
                <td> $TRIGGER_PATH </td>
                <td> $TRIGGER_FILENAME</td> </tr>" >> ${AI_SERIAL_TEMP}/x1p_report.dat

done;
echo "

</tbody>
</table>
</div>
</p>
<br>
<br>
* This is an automated email notification. Please do not respond to this email * <br><br>
Thanks
<br>
</body>
</html> "  >> ${AI_SERIAL_TEMP}/x1p_report.dat
###########################################################################
email=`cat ${AI_SERIAL_TEMP}/x1p_report.dat`
#mail_list=`cat ${AI_RESOURCE}/cogs_file_sys_stats_weekly_mail.lst`
(echo "To: joginder_17@optum.com"
echo "From: aiorcrxc@apvrp70062.uhc.com"
echo "Subject: NOTIFICATION: Azure X1P Trigger Transfer status for $curr_ts"
echo "MIME-Version: 1.0"
echo "Content-Type: text/html"
echo "${email}") | /usr/sbin/sendmail -t

}

transfer_trigger() {

        trig_path=$1
        trig_nm=$2

        if [ `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/transfered_x1p_trigger.dat | egrep -w "$trig_nm"|wc -l` -gt 0 ]
        then
                break
        else

                #ls -l ${trig_path}/${trig_nm} 2>&1
                if [ `ls -l ${trig_path}/${trig_nm}|wc -l` -ne 1 ]
                then
                        echo "Trigger haven't received yet"
                        if [ `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat | awk -F "|" '{print $3}' | egrep -w "$trig_file"|wc -l` -eq 0 ]
                        then
                                echo "${trig_book}|${trig_dir}|${trig_file}|${trig_file_extn}">>$AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat
                        fi
                else
                        echo "azcopy cp "${trig_path}/${trig_nm}"" ""${blob_SAS_URL}/${trig_nm}${blob_SAS_KEY} --recursive=true""
                        /etl/opt/azure/azcopy_linux_amd64_10.2.1/azcopy cp "${trig_path}/${trig_nm}" "${blob_SAS_URL}/${trig_nm}${blob_SAS_KEY}" --recursive=true
                        ec=`echo $?`
                        if [ $ec -eq 0 ]
                        then
                                echo "${trig_book}|${trig_dir}|${trig_file}|${trig_file_extn}">>$AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/temp_transfered_x1p_trigger.dat
                                echo "${trig_path}|${trig_nm}">>$AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/transfered_x1p_trigger.dat
                                echo "Removing entry for Trigger file:"$trig_nm
                                sed -i "/$trig_file/d" $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat
                        fi


                fi
        fi

}

parse_x1p_trigger_filename() {

export trig_book=$(echo $1 | cut -d "|" -f1)
export trig_dir=$(echo $1 | cut -d "|" -f2)
export trig_file=$(echo $1 | cut -d "|" -f3)
export trig_file_extn=$(echo $1| cut -d "|" -f4)
echo "RCEX1P Trigger belongs to env is $trig_book"
if [[ $trig_book == "Book_1_2" ]]
then
        trig_filename=${trig_file}.${trig_file_extn}
        echo "Book_1_2 trig:"$trig_filename

        transfer_trigger ${trig_dir} ${trig_filename}

else
        src_env=$(echo ${trig_file} | cut -d "." -f2)
        if [[ ${src_env} == "nvm" ]]
        then
                trig_filename=${prev_dt}.${trig_file}.${trig_file_extn}
        else
                trig_filename=${curr_dt}.${trig_file}.${trig_file_extn}
        fi
        echo "Book_A trig:"$trig_filename

        transfer_trigger ${trig_dir} ${trig_filename}
fi


}

transfer_pending_triggers() {

    echo "Transferring pending triggers from pending config file!!"
    for pending in `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat`
    do
        echo "Waiting for 60 second !!!!"
        sleep 60
        #path=`echo $pending|awk -F '|' '{print $1}'`
        #filename=`echo $pending|awk -F '|' '{print $NF}'`
        parse_x1p_trigger_filename ${pending}

    done

}

validate_transferred_trig() {

    echo "Comparing the transfer trigger with the configuration file to check for any missing triggers!!!! "
    #cat $config_file  | cut -d "|" -f2,3,4|sed "s/|/./2" > $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/meta_x1p_trigger.dat

    ec1=`grep -Fvxf $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/temp_transfered_x1p_trigger.dat ${config_file} | wc -l`
    echo "grep command result:"$ec1
    if [ $ec1 -gt 0 ]
    then
	echo "Adding missing triggers into pending file!!"
        echo "grep -Fvxf "$AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}"/temp_transfered_x1p_trigger.dat "${config_file}" >> "$AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}"/pending_x1p_trigger.dat"
	grep -Fvxf $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/temp_transfered_x1p_trigger.dat ${config_file} >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat
			
	while [ `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat|wc -l` -gt 0 ]
	do
		echo "Process the updated missing triggers from Pending list!!"
		transfer_pending_triggers
	done
			
    fi
	
    echo "All RCEX1P triggered transfered to AZURE for streaming purpose"
    send_completion_email


}

export curr_ts=$(date '+%Y%m%d')
export curr_dt=$(date '+%Y-%m-%d')
export prev_dt=$(date -d "-1 day" "+%Y-%m-%d")
export blob_SAS_URL="https://rxstreamprdsa.blob.core.windows.net/rxstreamprddlfs/rxclaim/IDWTrigger_Inbound"
export blob_SAS_KEY="?sp=racwl&st=2024-01-31T12:11:53Z&se=2025-01-30T20:11:53Z&spr=https&sv=2022-11-02&sr=c&sig=O1Y0K3mXs%2Fr%2FKToPy8kLp1l1SpUpiQfd9WL6FRkWfTE%3D"
config_file=$1
config_file_nm=$(echo $config_file | awk -F "/" '{print $NF}')
export config_file_count=`cat $config_file | uniq -c | wc -l`
echo "mkdir -p ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_ts}/"
mkdir -p $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/
chmod -R 777 $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/
touch $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/transfered_x1p_trigger.dat
touch $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat
for vals in `cat $config_file | egrep -v '^#' | awk -F "|" '$7 != "trigger" { print $0 }'`
do

                parse_x1p_trigger_filename ${vals}

done

trig_count=`cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/transfered_x1p_trigger.dat| sed '/^$/d'  | awk -F "|" '{print $1}' | uniq -c | wc -l`

if [[ ${trig_count} == ${config_file_count} ]]
then
        echo "All RCEX1P triggered transfered to AZURE for streaming purpose"
else
        while [ `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_ts}/pending_x1p_trigger.dat|wc -l` -gt 0 ]
        do
            transfer_pending_triggers
        done
fi

validate_transferred_trig
