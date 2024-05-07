#!/bin/ksh -e
########################################################################
#11/27/2017                                                            #
#Cleanup/Archival script for NDC Reporting data                        #
#It deletes all 30 days old NDC files available in $AI_MFS.            # 
#Also archives(zip) all reports present in processed dir               #
########################################################################

#Variables

curr_run_id=`cat $AI_SERIAL/ndc_reports/ndc_config.dat| awk -F '|' '{print $1}'`;

# step 1 : list out all previous run's files present in $AI_SERIAL
find $AI_SERIAL/ndc_reports/ -iname "*ndc*extract*$curr_run_id*.dat.gz" -type f >$AI_SERIAL/ndc_reports/'ndc_cleanup_file_list.'$curr_run_id'.dat';

#step 2 : archive all reports of previous run
mv $AI_SERIAL/ndc_reports/*.csv $AI_SERIAL/ndc_reports/processed/
cd $AI_SERIAL/ndc_reports/processed/
zip archive.ndc_reports.$curr_run_id.zip *.csv *.txt
ls -1 $AI_SERIAL/ndc_reports/processed/*.csv $AI_SERIAL/ndc_reports/processed/*.txt >>$AI_SERIAL/ndc_reports/'ndc_cleanup_file_list.'$curr_run_id'.dat';
echo $AI_SERIAL/ndc_reports/ndc_config.dat >> $AI_SERIAL/ndc_reports/'ndc_cleanup_file_list.'$curr_run_id'.dat';
cp $AI_SERIAL/ndc_reports/ndc_config.dat $AI_SERIAL/ndc_reports/ndc_config.dat_$curr_run_id
#Delete data files listed out in step 1 
while read line
do
rm $line;
echo $line is deleted;
done <$AI_SERIAL/ndc_reports/'ndc_cleanup_file_list.'$curr_run_id'.dat';

#Update the timestamp to avoid removal of file by any cleanup script

touch $AI_SERIAL/ndc_reports/mpxli1_exclusion.dat;
touch $AI_SERIAL/ndc_reports/ndc_cag_exclusion_list.dat;
touch $AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rxclaim.alternate_ndc_exclusion_list.dat;
touch $AI_SERIAL/ndc_reports/description_uom_cntrl_file.dat;
touch $AI_SERIAL_LOOKUP/lookup.rxclaim/ndc_booka_filter.dat;
