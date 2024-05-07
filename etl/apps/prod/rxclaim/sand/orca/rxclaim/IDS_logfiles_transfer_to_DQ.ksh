#!/bin/ksh

# Description : Copy GET, MAP and Load IDS DXF process log files onto Remote Server.


# Created by : j17
# Reviewed by :
#ksh -x IDS_logfiles_transfer.ksh -S apvrt85420 -T reject -A rxclaim
#########################################################################################################################################

transfer_dxf_logfiles(){

 cd $loc/$app/log
 pwd
 echo "LOCATION : " $loc
 echo "APPLICATION : " $app
 echo "GROUP  : " $group
 echo "TARGET PATH : " $trgt_path
 for file in `find . -maxdepth 2 -type f -newermt "${prev_ts}" \!  -newermt "${curr_dt}" -name 'get.iseries.rxclaim_*.*.*.job_log.dat' 2>/dev/null`
 do
  echo $file
  scp $file $USER@$server_name:$trgt_path/$app/.
 done

 for file in `find . -maxdepth 2 -type f -newermt "${prev_ts}" \!  -newermt "${curr_dt}" -name 'map.audit.*.*.dat' 2>/dev/null`
 do
  echo $file
  scp $file $USER@$server_name:$trgt_path/$app/.
 done

 for file in `find . -maxdepth 2 -type f -newermt "${prev_ts}" \!  -newermt "${curr_dt}" -name 'load.audit.*.*.dat' 2>/dev/null`
 do
  echo $file
  scp $file $USER@$server_name:$trgt_path/$app/.
 done

}

transfer_non_dxf_logfiles(){


 if [[ $type_ld == "log" ]]
 then
        cd $loc/$app/$type_ld
        for file in `find . -type f -newermt "${prev_ts}" \!  -newermt "${curr_dt}" -name '*.log' 2>/dev/null`
        do
        echo $file
        scp $file $USER@$server_name:$trgt_path/$app/.
        done
 else
        cd $loc/$app/$type_ld
        for file in `find . -type f -newermt "${prev_ts}" \!  -newermt "${curr_dt}" -name '*.rej' 2>/dev/null`
        do
        echo $file
        scp $file $USER@$server_name:$trgt_path/$app/.
        done
 fi

}

usage() { echo "Usage: $0 [ -S <target_server name > ] [ -T type ] [ -A application name ]" 1>&2; exit 1;}

while getopts ":S:T:G:A:" o;do
case "${o}" in

        S) server_name=${OPTARG} ;;
        T) type_ld=${OPTARG} ;;
                G) group=${OPTARG} ;;
        A) app=${OPTARG};;
        *) usage ;;
esac
done
shift $((OPTIND-1))

if [[ -z "${server_name}" ]] ; then
usage
fi

if [[ -z "${type_ld}" ]] ; then
usage
fi

if [[ -z "${group}" ]] ; then
usage
fi

if [[ -z "${app}" ]] ; then
usage
fi

HOSTNAME=`hostname`
echo "Hostname is $HOSTNAME"
if [[ $HOSTNAME == "apvrp70062" ]] ; then
        cd /etl/apps/prod/$app/sand/$group/$app
else
        echo "Script should run only in production.Exiting..."
        exit 0
fi
. ./ab_project_setup.ksh .
if [ `echo $?` -ne 0 ]
then
        echo "Project Setup not running.Exiting..."
        exit 1
fi

export curr_dt=`date -d "-5 min" "+%Y-%m-%d %H:%M:%S"`
export dt=$(date '+%Y%m%d')
echo "curr_dt:"$curr_dt

export loc=/etl/data/prod//serial/$group/
export trgt_path=/etl/data/abinitio/log

echo $app "ECHO FOR META FILE"
export prev_meta_file_name=$AI_SERIAL_TEMP/$app.prev_dq_log_transfered_ts.dat

if [[ -f $prev_meta_file_name ]]
then
 export prev_ts=`cat $prev_meta_file_name`
 echo "prev_ts:"$prev_ts
else
 mutt joginder_17@optum.com -s "ALERT: DQ dashboard log files previous time stamp meta file missing" < /dev/null
 exit 1
fi

if [[ $type_ld == "dxf_log" ]]
then
        transfer_dxf_logfiles $type_ld
else
        transfer_non_dxf_logfiles $type_ld
fi

##Write the timestamp onto META file till which logs copied onto DQ server:
echo $curr_dt >$prev_meta_file_name

