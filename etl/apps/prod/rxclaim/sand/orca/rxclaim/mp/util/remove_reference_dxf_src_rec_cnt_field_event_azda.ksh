#!/bin/ksh -e

cd /etl/apps/prod/rxclaim/sand/orca/rxclaim/
echo $pwd

. ./ab_project_setup.ksh .

air sandbox run $AI_MP/util/convert_idw_extract_tables_event_file_to_azure_push_format.mp -TABLE_NAME d_rpt_sco_cal_00

if [ $? -ne 0 ];then
echo "Process exiting as event azda file coversion process failed for d_rpt_sco_cal_00"
exit 1
fi

air sandbox run $AI_MP/util/convert_idw_extract_tables_event_file_to_azure_push_format.mp -TABLE_NAME f_rpt_sco_cal_98

if [ $? -ne 0 ];then
echo "Process exiting as event azda file coversion process failed for f_rpt_sco_cal_98"
exit 1
fi
