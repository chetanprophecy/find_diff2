#!/bin/ksh -e
########################################################################
#08/27/2018                                                           #
#Cleanup & Archival script for VA Medallion Reports                   #
#Script archives(zip) and deletes all reports which are sent to client#
########################################################################

#Variables

v_run_id=`cat $AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rxclaim.va_medallion_config.dat| awk -F '|' '{print $1}'`;

# step 1 : archive the transferred reports

mv $AI_SERIAL/va_medallion_reports/*.TXT $AI_SERIAL/va_medallion_reports/archive
cd $AI_SERIAL/va_medallion_reports/archive/
zip va_medallion_reports_$v_run_id.zip *.TXT

#step 2 : delete archived reports

rm $AI_SERIAL/va_medallion_reports/archive/*.TXT


#Update the timestamp to avoid removal of config lookup files by any cleanup script

touch $AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rxclaim.va_medallion_config.dat;
touch $AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rxclaim.va_medallion_carrier_config.dat;
touch $AI_SERIAL_LOOKUP/lookup.rxclaim/lookup.rxclaim.va_medallion_client_config.dat;
