#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/touch-client-spec-prev-day-file.ksh
#
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#  2017/03/10   Yogesh Anasane      Initial version
#  2017/06/28   Pratiksha Choure    Updated script to touch previous day Medical files.
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#  This script touch all the client specific previous day file. Pass the two Argument to this script BIZ_DT (YYYYMMDD) and CLT_ID.
#  Usage : touch-client-spec-prev-day-file.ksh <BIZ_DT> <CLT_ID>


#################################################################
## Function Name: usage                                        ##
## Description: Displays the usage information for the script  ##
#################################################################

usage()
{
        echo " This script touch all the client specific previous day file. Pass the two Argument to this script BIZ_DT (YYYYMMDD) format and CLT_ID.
                 <touch-client-spec-prev-day-file.ksh>:
                 OPTIONS:
                 Mandatory Parameters: -BIZ_DT <BIZ_DT>  -CLT_ID <CLT_ID>"
}


###################################################################
## Main Program                                                  ##
################################################################### 



for arg
do
    delim=""
    case "$arg" in
       -BIZ_DT) BIZ_DT=$2;;
       -CLT_ID) CLT_ID=$4;;
       
?) usage;;    
    esac
done


if [[ "$#" != 4  ||  "$CLT_ID" == ""  ||  "$BIZ_DT" == "" ]]; then
usage
exit
fi

BIZ_DT=$(date -d "$BIZ_DT " +"%Y%m%d")  ##### If date is invalid then exit######
if [ "$?" != "0" ]; then
usage
exit
fi



PREV_BIZ_DT=$(date -d "$BIZ_DT - 1 day" +"%Y%m%d");

PREV_BIZ_DT_YR=`echo $PREV_BIZ_DT | cut -c1-4`


BASEDIR=$(dirname "$0")
cd $BASEDIR/../../


if [ ! -f ab_project_setup.ksh ]; then
    echo "ab_project_setup.ksh  file not found"
fi

. ./ab* . 1>/dev/null 2>/dev/null
if [ "$?" != "0" ]; then
echo "Project setup failed"
fi

rm -rf $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log

filename=`basename $0`
now=$(date -d "$date " +"%Y%m%d")

m_mkdir $PUB_CLINICAL_MFS/$PREV_BIZ_DT 1>/dev/null 2>/dev/null 
m_mkdir $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID 1>/dev/null 2>/dev/null

m_mkdir -p $PUB_CLINICAL_MFS_TEMP/$PREV_BIZ_DT/$CLT_ID 1>/dev/null 2>/dev/null
m_mkdir -p $PUB_CLINICAL_MFS/../../enrichments/pending/$PREV_BIZ_DT/$CLT_ID 1>/dev/null 2>/dev/null
m_mkdir -p $PUB_CLINICAL_MFS_LOOKUP/$PREV_BIZ_DT 1>/dev/null 2>/dev/null


###################################################################
## Program For touch the files                                   ##
################################################################### 

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/desease_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/desease_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/desease_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi


m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/emtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz">> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/intervention_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/intervention_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/intervention_ident.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.dat.gz">> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null
if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/mtm_ident_cagm.$PREV_BIZ_DT_YR.$CLT_ID.dat.gz">> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log 
fi

m_touch $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/member_flag_hist_cfg.dat.gz 1>/dev/null 2>/dev/null

if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/member_flag_hist_cfg.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/$PREV_BIZ_DT/$CLT_ID/member_flag_hist_cfg.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

if [[ -d $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_incr ]]
   then
     print "No need to create Medical INCR ICFF DIR"
   else
     print "Medical ICFF dir not found  - creating"
     m_mkdir -p $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_incr
     m_chmod -R 774 $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_incr
     echo "Medical INCR ICFF dir created - $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_incr" 
 fi

if [[ -d $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_monthly ]]
   then
     print "No need to create Medical Monthly ICFF DIR"
   else
     print "Medical ICFF dir not found  - creating"
     m_mkdir -p $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_monthly
     m_chmod -R 774 $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_monthly
     echo "Medical Monthly ICFF dir created - $PUB_CLINICAL_MFS_LOOKUP/med_claim_icff_monthly" 
 fi

m_touch $PUB_CLINICAL_MFS_LOOKUP/$PREV_BIZ_DT/max_med_claim_loaded_ods.dat 1>/dev/null 2>/dev/null

if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS_LOOKUP/$PREV_BIZ_DT/max_med_claim_loaded_ods.dat" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS_LOOKUP/$PREV_BIZ_DT/max_med_claim_loaded_ods.dat" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi


m_touch $PUB_CLINICAL_MFS_LOOKUP/mbr_med_claim_stats.lkp.gz 1>/dev/null 2>/dev/null

if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS_LOOKUP/mbr_med_claim_stats.lkp.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS_LOOKUP/mbr_med_claim_stats.lkp.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS/../../enrichments/pending/$PREV_BIZ_DT/$CLT_ID/med_claim.$PREV_BIZ_DT.$CLT_ID.dat.gz 1>/dev/null 2>/dev/null

if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS/../../enrichments/pending/$PREV_BIZ_DT/$CLT_ID/med_claim.$PREV_BIZ_DT.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS/../../enrichments/pending/$PREV_BIZ_DT/$CLT_ID/med_claim.$PREV_BIZ_DT.$CLT_ID.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

m_touch $PUB_CLINICAL_MFS_TEMP/$PREV_BIZ_DT/$CLT_ID/med_claim_scoop.$PREV_BIZ_DT.$CLT_ID.stats.dat.gz 1>/dev/null 2>/dev/null

if [ "$?" == "0" ]; then
echo "$filename : $now File touch successfully : $PUB_CLINICAL_MFS_TEMP/$PREV_BIZ_DT/$CLT_ID/med_claim_scoop.$PREV_BIZ_DT.$CLT_ID.stats.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
else
echo "$filename : $now File touch Failed : $PUB_CLINICAL_MFS_TEMP/$PREV_BIZ_DT/$CLT_ID/med_claim_scoop.$PREV_BIZ_DT.$CLT_ID.stats.dat.gz" >> $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log
fi

echo "Check the details Log in the  $AI_SERIAL_LOG/touch-client-spec-prev-day-file_`date +%Y%m%d`.log"



