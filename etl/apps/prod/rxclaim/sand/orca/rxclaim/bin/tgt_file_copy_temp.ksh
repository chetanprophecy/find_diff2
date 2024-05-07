#!/bin/ksh -e
#Run project setup
HOSTNAME=`hostname`
echo "Hostname is $HOSTNAME"
if [[ $HOSTNAME == "apvrp70062" ]] ; then
        cd /etl/apps/prod/rxclaim/sand/orca/rxclaim
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

create_resolved_lookup_pattern() {
src_dir=$2
resolved_src_dir=$(eval "echo ${src_dir}")
echo "resolved_src_dir is $resolved_src_dir"
tgt_dir=$5
config_file_nm=$(echo $config_file | awk -F "/" '{print $NF}')
resolved_tgt_dir=$(eval "echo ${tgt_dir}")
m_ls ${resolved_src_dir}/$3 | awk -F "/" '{print $NF}' | sort > $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/all_files_src.dat
touch $AI_SERIAL_LOOKUP/transfer/${config_file_nm}.pattern_files_tgt_copied_list.dat
cat $AI_SERIAL_LOOKUP/transfer/${config_file_nm}.pattern_files_tgt_copied_list.dat|  sed -n "/$3/p" | egrep -w "$4" | egrep -w "$resolved_tgt_dir"|cut -d "|" -f3  | sort > $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/pattern_files_tgt_copied_filename_list.dat
echo "cat $AI_SERIAL_LOOKUP/transfer/${config_file_nm}.pattern_files_tgt_copied_list.dat| sed -n "/$3/p" | egrep -w $4 | egrep -w $resolved_tgt_dir"
comm -23 $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/all_files_src.dat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/pattern_files_tgt_copied_filename_list.dat > $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_exact.dat
for files in `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_exact.dat`
do
	file_name=$(echo $files | awk -F "/" '{print $NF}')
        echo "${1}|${resolved_src_dir}|${file_name}|${4}|${resolved_tgt_dir}|${file_name}|${7}" >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/resolved_copy_files_list.dat
#        echo "${1}|${resolved_src_dir}|${file_name}|${4}|${resolved_tgt_dir}|${file_name}|${7}" >> $AI_SERIAL_LOOKUP/transfer/${config_file_nm}.pattern_files_tgt_copied_list.dat
done
}

create_resolved_lookup_exact() {
src_dir=$2
resolved_src_dir=$(eval "echo ${src_dir}")
tgt_dir=$5
resolved_tgt_dir=$(eval "echo ${tgt_dir}")
file_name=$(echo $6 | awk -F "/" '{print $NF}')
echo "${1}|${resolved_src_dir}|${file_name}|${4}|${resolved_tgt_dir}|${file_name}|${7}" >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/resolved_copy_files_list.dat
}

create_multiple_instances() {
i=0
for resolved in `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/resolved_copy_files_list.dat`
do
	if [ $i -ne $1 ]
	then
		echo $resolved >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_file_${i}.dat
		i=`echo "$i+1" | bc`
	else
		echo $resolved >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_file_${i}.dat
		i=0
	fi
done
}

submit_copy_parallel() {
if [ `ls $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_file_*.dat | wc -l` -gt 0 ]
then
i=0
for batch in `ls $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_file_*.dat`
do
batch_only=$(echo "$batch" | awk -F "/" '{print $NF}')
failure_file=$1
echo "nohup $AI_BIN/file_copier_all.ksh $batch 0 $failure_file > ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_dt}/${batch_only}_cp.log 2>&1 &"
nohup $AI_BIN/file_copier_all.ksh $batch 0 $failure_file > ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_dt}/${batch_only}_cp.log 2>&1 &
pids[${i}]=$!
i=$(echo "$i+1" | bc)
done
#wait
for pid in ${pids[*]}; do
    echo "`date` : Waiting for pid $pid to complete"
    wait $pid
    echo "`date` : pid $pid Completed"
done
#wait
else
echo "No FIles to process"
fi
}

submit_copy_serial() {
batch_only=$(echo $1 | awk -F "/" '{print $NF}')
echo "nohup $AI_BIN/file_copier_all.ksh $1 $2 $3> ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_dt}/${batch_only}_cp.log 2>&1 &"
nohup $AI_BIN/file_copier_all.ksh $1 $2 $3 > ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_dt}/${batch_only}_cp.log 2>&1 &
wait
}

validate_failed_file() {
if [ -e $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat ]
then
	rm -f $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat
fi
if [ -e $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat ]
then
	failure_stat=1
	for files in `cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat`
	do
		failed_file_pattern=$(echo $files | cut -d "|" -f3 | sed 's/dat.gz//g' | sed 's/idx//g')
		cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/resolved_copy_files_list.dat | egrep "$failed_file_pattern" >> $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat_temp
	done
	cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat_temp | sort -u > $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat	
	chmod 777 $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat_temp
	rm -f $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat_temp
else
	failure_stat=0
fi
echo "Failure_stat : $failure_stat"
}

send_failure_email() {
#echo "Subject: Job Failure" | sendmail -v sujit_satpathy@optum.com < $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat
config_file_nm=$(echo $config_file | awk -F "/" '{print $NF}')
m_dump $AI_DML/failure_log.dml $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat -show-html | sed 's/"//g' > $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.html
(
echo "To: `cat $AI_SERIAL_LOOKUP/transfer/mail_list_file`"
echo "From: bi-ops@optum.com"
echo "Subject: File Transfer Failure Job ${config_file_nm}"
echo "Content-Type: text/html"
echo
echo "`cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.html`"
echo 
) | /usr/sbin/sendmail -t

}
export curr_dt=$(date '+%Y%m%d%H%M%S')
export dt=$(date '+%Y%m%d')
config_file=$1
config_file_nm=$(echo $config_file | awk -F "/" '{print $NF}')
parallel_run=$2
echo "mkdir -p ${AI_SERIAL_TEMP}/${config_file_nm}/${curr_dt}/"
mkdir -p $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/
chmod -R 777 $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/
for vals in `cat $config_file | egrep -v '^#' | awk -F "|" '$7 != "trigger" { print $0 }'`
do
        src_host=$(echo ${vals} | cut -d "|" -f1)
        src_dir=$(echo ${vals} | cut -d "|" -f2)
        src_file=$(echo ${vals} | cut -d "|" -f3)
        tgt_host=$(echo $vals | cut -d "|" -f4)
        tgt_dir=$(echo $vals | cut -d "|" -f5)
        tgt_file=$(echo $vals | cut -d "|" -f6)
        type_ld=$(echo $vals | cut -d "|" -f7)
        echo "type_ld is $type_ld"
        if [[ $type_ld == "pattern" ]]
        then
                echo "create_resolved_lookup_pattern $src_host $src_dir $src_file $tgt_host $tgt_dir $tgt_file $type"
                create_resolved_lookup_pattern $src_host $src_dir $src_file $tgt_host $tgt_dir $tgt_file $type
        else
                create_resolved_lookup_exact $src_host $src_dir $src_file $tgt_host $tgt_dir $tgt_file $type
        fi
done

create_multiple_instances $parallel_run

submit_copy_parallel `eval "echo $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat"`

validate_failed_file

failure_iteration=1
while [ $failure_stat -eq 1  ]
do
	submit_copy_serial $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed_updated.dat $failure_iteration `eval "echo $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/copy_files_failed.dat"`
	validate_failed_file
	failure_iteration=$(echo "$failure_iteration+1" |bc)
	sleep 15
	if [ $failure_iteration -eq 5 ]
	then
		send_failure_email
		exit 1
	fi
done

cat $AI_SERIAL_TEMP/${config_file_nm}/${curr_dt}/resolved_copy_files_list.dat >> $AI_SERIAL_LOOKUP/transfer/${config_file_nm}.pattern_files_tgt_copied_list.dat

if [ `cat $config_file | egrep -v '^#' | cut -d "|" -f7 | egrep -i 'trigger' | wc -l` -ne 0 ]
then
	for vals in `cat $config_file | egrep -v '^#' | awk -F "|" '$7 == "trigger" { print $0 }'`
	do
	        tgt_host=$(echo $vals | cut -d "|" -f4)
	        tgt_dir=$(echo $vals | cut -d "|" -f5)
		resolved_tgt_dir=$(eval "echo ${tgt_dir}")
	        tgt_file=$(echo $vals | cut -d "|" -f6)
		resolved_tgt_file=$(eval "echo ${tgt_file}")	
		m_touch //${tgt_host}/${resolved_tgt_dir}/${resolved_tgt_file}
		echo "Touching Trigger File //${tgt_host}/${resolved_tgt_dir}/${resolved_tgt_file}"
	done
else
	echo "No Trigger File"
fi
