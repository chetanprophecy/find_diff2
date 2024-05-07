#!/bin/ksh -ex

##This script daily refreshes the operational console jobs for next day's run######
##The script takes 4  inputs 1.The system name 2.application name 3.start date variable name 4.start date value###
##It updates the application run date + 1 in the op conslw database###

echo parame1: $1
echo parame2: $2
echo parame3: $3
echo parame4: $4


if [ $# -lt 4 ]; then
print "Usage: $0 <SYSTEM NAME> <APP NAME> <PROPERTY NAME> <PROPERTY VALUE>"
exit 1 
fi

export TODAY=`date '+%Y%m%d%H%M%S'`
PROJECT_DIR=`air sandbox find -up $0`
AI_SERIAL_LOG=`air sandbox parameter -basedir $PROJECT_DIR -eval AI_SERIAL_LOG`

export LOGFILE=${AI_SERIAL_LOG}/${3}_${TODAY}.log
#source ~abiadm/opconsole_pw.txt
source /etl/etc/control_center_pw/cc_password.txt
echo " Starting the process of cut jobs for next day for $1 $2 and $3" >>${LOGFILE}

SYS=$1
APP=$2
PROP=$3
VAL=`m_eval -raw "(date('YYYY-MM-DD'))((date('YYYY-MM-DD'))\"${4}\"+1)"`

if [ $? -ne 0 ]; then
echo " ${PROP} value calculation process has failed "  >>${LOGFILE}
exit 1
else
echo " ${PROP} value calculation process SUCCESFULLY COMPLETED*****for today at $TODAY for values $SYS  $APP $PROP $VAL "  >>${LOGFILE}
fi

echo " The new date for which jobs needs to be refreshed is ${VAL}" >>${LOGFILE}


STMT="update OpJobDefinitionPropertyValue set PropertyValue='${VAL}' where
PropertyTypeId in (select pt.PropertyTypeId from OpSystem sys left outer join OpPropertyType pt on
sys.systemId=pt.systemId and sys.name='${SYS}' and pt.name='${PROP}')
and JobDefinitionId in (select jd.jobDefinitionId from OpJobDefinition jd
left outer join OpApplication app on jd.applicationId=app.applicationId
left outer join OpSystem sys on app.systemId = sys.systemId
where jd.jobDefinitionDiscriminator='MASTER' and jd.approveEnum='APPROVED' and sys.name='${SYS}')"


echo " The steatement to be executed is :"  >>${LOGFILE}
echo " ${STMT}"  >>${LOGFILE}

##EXECUTING The SQL ststement#####

op-sql -username admin -encrypted-password "${PUB_OC_ADMIN_ENCRYPTED_PASSWORD}" "$STMT"

if [ $? -ne 0 ]; then
echo "The sql statement  ${PROP} update  process #######FAILED####### for today at $TODAY for values $SYS $APP $PROP $VAL "  >>${LOGFILE}
exit 1
else
echo " The sql statement to update ${PROP} op table  *****SUCCESSFULLY COMPLETED*****for today at $TODAY for values $SYS  $APP $PROP $VAL "  >>${LOGFILE}
fi

ops-cut-jobs.ksh -username admin -encrypted-password "${PUB_OC_ADMIN_ENCRYPTED_PASSWORD}" "${1}" "${2}"

if [ $? -ne 0 ]; then
echo " The OP Console ops-cut-jobs.ksh  #######FAILED####### for today at $TODAY for values $SYS $APP $PROP $AB_OPS_NEXT_PRODUCTION_DAY_END "  >>${LOGFILE}
exit 1
else
echo "The OP Console ops-cut-jobs.ksh  *****SUCCESSFULLY COMPLETED*****for today at $TODAY for values $SYS  $APP $PROP $AB_OPS_NEXT_PRODUCTION_DAY_END  "  >>${LOGFILE}
fi


###Querying the value######
export QUERY="SELECT PropertyValue from OpJobDefinitionPropertyValue where PropertyTypeId in (select pt.PropertyTypeId from OpPropertyType pt left outer join OpSystem sys on sys.systemId=pt.systemId and sys.name='${SYS}' and pt.name='${PROP}') and JobDefinitionId in (select jd.jobDefinitionId from OpJobDefinition jd left outer join OpApplication app on jd.applicationId=app.applicationId left outer join OpSystem sys on app.systemId = sys.systemId where jd.jobDefinitionDiscriminator='MASTER' and jd.approveEnum='APPROVED' and sys.name='${SYS}')"


op-sql -username admin -encrypted-password "${PUB_OC_ADMIN_ENCRYPTED_PASSWORD}" "$QUERY"  >>${LOGFILE}
if [ $? -ne 0 ]; then
echo " ${PROP} update verification process #######FAILED####### for today at $TODAY for values $SYS $APP  $PROP $VAL "  >>${LOGFILE}
exit 1
else
echo "${0} ${PROP} process  extract verification *****SUCCESSFULLY COMPLETED*****for today at $TODAY for values $SYS $APP $PROP  "  >>${LOGFILE}
echo " The ${PROP} is above listed"  >>${LOGFILE}
fi


