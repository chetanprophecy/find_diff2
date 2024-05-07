curr_dt=$(date '+%Y%m%d%H%M%S')
parallel_run=$1
mkdir -p $AI_SERIAL_TEMP/${curr_dt}
i=0
for files in `cat $AI_SERIAL_LOOKUP/copy_file.dat`
do
com="echo $files"
	if [ $i -ne $parallel_run ]
	then
		eval "$com" >> $AI_SERIAL_TEMP/${curr_dt}/copy_file_${i}.dat
		i=`echo "$i+1" | bc`
		echo $i
	else
		
		eval "$com" >> $AI_SERIAL_TEMP/${curr_dt}/copy_file_${i}.dat
		i=0
	fi
done

for files in `ls $AI_SERIAL_TEMP/${curr_dt}/copy_file_*.dat`
do
file_only=$(echo "$files" | awk -F "/" '{print $NF}')
nohup $AI_BIN/file_copier_all.ksh $files > ${AI_SERIAL_TEMP}/${curr_dt}/${file_only}_cp.log 2>&1 &
done
