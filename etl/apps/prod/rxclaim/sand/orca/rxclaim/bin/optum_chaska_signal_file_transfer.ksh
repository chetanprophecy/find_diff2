#!/bin/ksh -x

###############################################
# Description ###
# This script is added as a part of EGV combo/am migration to new box.
# This script created to copy  trigger files to new chaska server.
##################################################

TARGET_DIR="//apsrp09275/etl/data/prod/serial/signal/prod/rxclaim"

All_FILE_PATTERN="/etl/data/prod/serial/sterling_landing/inbound/aiorcrxc/signal/"`date +"%Y-%m-%d"`*.ext.txt

m_cp $All_FILE_PATTERN $TARGET_DIR

echo "All trigger files transferred to Chaska server successfully"
