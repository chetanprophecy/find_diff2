if [[ $# -lt 2 || $2 -lt 7 ]];then
    print "usage: $AI_BIN/cleanup.files.orca_rxclaim.ksh <sandbox path> <last modified_days_ago>"
    print ""
    print "The <last_modified_days_ago> parameter prunes files that were last modified more than <last_modified_days_ago> days ago.  Please specify a value greater than or equal to 7 days ago"
    exit 1
fi

#Parameters
export PROJECT_DIR=$1
export LAST_MODIFIED_DAYS_AGO=$2


#Set Environment for HDFD project
cd $PROJECT_DIR
. ./ab_project_setup.ksh .

export TODAY=`date '+%Y%m%d%H%M%S'`
export LOGFILE=${AI_SERIAL_LOG}/`basename $0`_${TODAY}.log


if [[ x"$AI_DML" = x"" ]]; then
    echo "There is issue in setting up Environment: . ./ab_project_setup.ksh ." >>${LOGFILE}
    exit 1
fi

##Clean up Serial Files
echo "AI SERIAL - ERROR, PENDING, REJECT, LOG, MAIN  - Removing files older than ${LAST_MODIFIED_DAYS_AGO} days" >>${LOGFILE}

find $AI_SERIAL_ERROR -type f -name "*.*" -mtime +180 -exec rm -r {} \;
find $AI_SERIAL_LOG -type f -name "*.*" -mtime +180 -exec rm -r {} \;

##Clean up Serial Files
echo "AI SERIAL - ERROR, PENDING, REJECT, LOG, MAIN  - Removing files older than ${LAST_MODIFIED_DAYS_AGO} days" >>${LOGFILE}

find $AI_MFS -type f -name "*.dat.gz" -mtime +${LAST_MODIFIED_DAYS_AGO} -exec rm -r {} \;

##Clean up Admin directory files
echo "AI ADMIN  - SUMMARY, ERROR, PARAMETER, LOG, TRACKING - Removing files older than 45 days"  >>${LOGFILE}

find $AI_ADMIN -type f -name "*.*" -mtime +180 -exec rm -r {} \;

echo "Cleanup Completed" >>${LOGFILE}

