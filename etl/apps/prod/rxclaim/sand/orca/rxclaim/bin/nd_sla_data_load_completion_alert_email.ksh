#!/bin/ksh
###########################################################################################################################
# Description: This script is created to send the notification on completion of F_CDUR data load in ODBC2 and ODBC3
#
# Project: ORCA IDW_ND_SLA
#
# APP ID: AIORCRXC
#
############################################################################################################################

echo -e "Hi,\n\nThis is an automated email to notify that IDW non-SLA data loads are completed - Completion Time: `date`.\n\n\nThanks,\nIDW Operations Team.\nPBM_DATA_TECH_SERVICES_ETL_PROD_SUPPORT_DL@ds.uhc.com" | mailx -s "<<NOTIFICATION>>- IDW NON-SLA data loads are completed - Completion Time: `date`" -r "PBM_DATA_TECH_SERVICES_ETL_PROD_SUPPORT_DL@ds.uhc.com" "pbm_data_tech_services_etl_prod_support <PBM_DATA_TECH_SERVICES_ETL_PROD_SUPPORT_DL@ds.uhc.com>"
