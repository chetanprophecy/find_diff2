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

