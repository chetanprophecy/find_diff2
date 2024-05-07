#!/bin/ksh
set -x
# Description : Script to verify the run group (opioid_orx  or opioid_ctrx ) .
# Below script will handle  issue multi data file version. Highest count of same version file will be processed in BAU run.
# Rest of the versions will be moved to pending_v? dir under LOCAL_TRIGGER_FILE_DIRECTORY/opioid/<YYYYMMDD>
# Command will be build by script and send over email to Abinitio support team for manual run.


#########################################################################################################################################
usage() { echo "Usage: $0 [ -S <local signal dir > ] [ -E support_dl@email.com ]  [ -F (1/0) separate signal file in boolean ]" 1>&2; exit 1;}

while getopts ":S:E:F:" o;do
case "${o}" in

        S) signal_dir=${OPTARG} ;;
        E)  email_to=${OPTARG} ;;
        F) separate_signal=${OPTARG};;
        *) usage ;;
esac
done
shift $((OPTIND-1))

if [ -z "${signal_dir}" ] ; then
usage
fi
echo "case started"
echo `hostname`
# Get the sandbox path
case `hostname`  in
'apsrd6487' )
        SB_PATH=/etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim;;
'apsrp7996')
        SB_PATH=/etl/apps/prod/rxclaim/sand/orca/rxclaim;;
'apsrs4064' )
        SB_PATH=/etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim;;
'*')
        echo -n "Please enter rxcliam sandbox path : ";read $ans
        SB_PATH=$ans;;
esac

# Source the sandbox
#. /etl/devel/appconf.rxclaim/main/users/ssunkar2/orca/rxclaim/ab*.ksh /etl/devel/appconf.rxclaim/main/users/ssunkar2/orca/rxclaim
. $SB_PATH/ab*.ksh $SB_PATH

log_file=/tmp/issue_list_${USER}.log
test -e $log_file && rm $log_file

# if signal dir is passed as argument
SIG_DIR=${signal_dir:-$AI_SERIAL_PENDING/plan_trigger/opioid/$PROCESS_DATE}
echo "Looking for trigger files in $SIG_DIR"
echo "_________________________________________________________________________________________"
for file in `ls -1 $SIG_DIR/{opioid_orx,opioid_ctrx}*.dat 2>/dev/null`
do

        if [[ $separate_signal -eq 1 ]]
        then
        ver=0
                # Get all the file version wis, sort and get uniq count  , sort reverse to get the highest file count version
                for each_ver in `egrep -o   'v.{1,2}/date=.{4}' $file | sort | uniq -c | sort -rn  | awk '{print $2}' | sed -n 1!p`
                do
                 ((ver+=1))

                # create dir for moving pending version if does not exists
                test -d $SIG_DIR/pending_batch${ver} || mkdir  -v  $SIG_DIR/pending_batch${ver}

                # append the miss match version respectively to their pending dir
                grep $each_ver $file >>$SIG_DIR/pending_batch${ver}/`basename $file`

                # Get all the file version wis, sort and get uniq count  , sort reverse to get the highest file count version
                version_to_keep=`egrep -o 'v.{1,2}/date=.{4}' $file | sort | uniq -c | sort -rn  |awk '{print $2}' | sed -n 1p | sed 's:\/:\\\/:' `

                # Take backup of original signal file and remove other mis-match signal
                test -e $file.bak  && echo "Backup file already present, skipping $file.bak" || sed -i.bak /$version_to_keep/!d $file
        file=$file.bak
                done
        fi

        file_cnt=`egrep -o 'v.{1,2}/date=.{4}'  $file | sort | uniq -c| wc -l`
        if [[ $file_cnt -gt 1 ]]
        then
                echo "Identified issue with $file"                              | tee -a $log_file
                egrep -o 'v.{1,2}/date=.{4}' $file | sort | uniq -c | sort -rn  | tee -a $log_file
                issue_flg=1
        fi
done

find $SIG_DIR -maxdepth 1 -type f -name "*.dat" -exec cp -t $AI_SERIAL_PENDING/plan_trigger/ {} +
find $SIG_DIR -maxdepth 1 -type f -name "*.signal" -exec cp -t $AI_SERIAL_PENDING/plan_trigger/ {} +

if [[ $separate_signal -eq 1 ]]
then
#Build the command only when sepaate_signal fix is set as 1
(
echo -e "\nPlease use below reference command to process the remaining version pending files after todays OPIOID run ";
for _dir in ` ls -1d $SIG_DIR/pending_batch* `
do
    # check if the opioid_orx,opioid_ctrx files are present
   ls -1 $_dir/opioid_ctrx*.dat  >/dev/null 2>&1 && run_grp_opioid_ctrx=opioid_ctrx
   ls -1 $_dir/opioid_orx*.dat  >/dev/null 2>&1 &&  run_grp_opioid_orx=opioid_orx
 

   test -z $run_grp_opioid_ctrx||echo -e "\nnohup air sandbox run \$AI_PSET/run/run_daily/run.all.$run_grp_opioid_ctrx.pset -LOCAL_TRIGGER_FILE_DIRECTORY $_dir & "
   test -z $run_grp_opioid_orx||echo -e "\nnohup air sandbox run \$AI_PSET/run/run_daily/run.all.$run_grp_opioid_orx.pset -LOCAL_TRIGGER_FILE_DIRECTORY $_dir & "

   # Reset variable for next for loop iteration
   run_grp_opioid_ctrx=''
   run_grp_opioid_orx=''
done

) | tee -a $log_file
fi # End build command

if [[ $issue_flg -eq 1 ]]
then
 ( echo -e "Hi PS Team,\n\nPlease note, We have identified mutiple data file version in todays signal file\n" ; cat $log_file) | mail -s "Opioid files : Multiple data version notification"  ${email_to}
        exit 0
else
        echo ' No Issue Found !!! '
        exit 0
fi

