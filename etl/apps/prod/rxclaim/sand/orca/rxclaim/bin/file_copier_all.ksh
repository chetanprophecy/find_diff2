#!/bin/ksh -e
#Run project setup
if [[ `hostname` == "apvrp70062" ]] ; then
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


failed_iteration=$2
failure_file_nm=$3
if [ -e ${failure_file_nm} ]
then
	mv ${failure_file_nm} ${failure_file_nm}_${failed_iteration}
fi

for vals in `cat $1`
do
src_host=$(echo ${vals} | cut -d "|" -f1)
src_dir=$(echo ${vals} | cut -d "|" -f2)
src_file=$(echo ${vals} | cut -d "|" -f3)
tgt_host=$(echo $vals | cut -d "|" -f4)
tgt_dir=$(echo $vals | cut -d "|" -f5)
tgt_file=$(echo $vals | cut -d "|" -f6)
type_ld=$(echo $vals | cut -d "|" -f7)
echo "m_cp //${src_host}/${src_dir}/${src_file} //${tgt_host}/${tgt_dir}/${tgt_file}"
m_cp //${src_host}/${src_dir}/${src_file} //${tgt_host}/${tgt_dir}/${tgt_file}
ec=`echo $?`
src_host_size=$(m_ls -l //${src_host}/${src_dir}/${src_file} | awk '{print $5}'| sed 's/,//g')
if ! [[ $src_host_size  =~ ^[0-9]+$ ]]
then
src_host_size=$(m_ls -l //${src_host}/${src_dir}/${src_file} | awk '{print $4}'| sed 's/,//g')
fi
m_ls -l //${src_host}/${src_dir}/${src_file}
ec1=`echo $?`
if [ $ec1 -ne 0 ]
then
src_host_size=0
fi
tgt_host_size=$(m_ls -l //${tgt_host}/${tgt_dir}/${tgt_file} | awk '{print $5}'| sed 's/,//g')
if ! [[ $tgt_host_size =~ ^[0-9]+$ ]]
then
tgt_host_size=$(m_ls -l //${tgt_host}/${tgt_dir}/${tgt_file} | awk '{print $4}'| sed 's/,//g')
fi
m_ls -l //${tgt_host}/${tgt_dir}/${tgt_file}
ec2=`echo $?`
if [ $ec2 -ne 0 ]
then
tgt_host_size=0
fi
echo "Exit Codes : $ec, $ec1, $ec2, $src_host_size, $tgt_host_size"
if [ $ec -ne 0 ] || [ $src_host_size -ne $tgt_host_size ]
then
	echo "Failed file name is ${failure_file_nm}"
	echo "${src_host}|${src_dir}|${src_file}|${tgt_host}|${tgt_dir}|${tgt_file}|${type_ld}" >> ${failure_file_nm}
	echo "`date`,${src_host},${src_dir},${src_file},${tgt_host},${tgt_dir},${tgt_file},$src_host_size,$tgt_host_size,$ec,Failed"
else
	echo "`date`,${src_host},${src_dir},${src_file},${tgt_host},${tgt_dir},${tgt_file},$src_host_size,$tgt_host_size,$ec,Success" >> ${failure_file_nm}_success
fi
done
