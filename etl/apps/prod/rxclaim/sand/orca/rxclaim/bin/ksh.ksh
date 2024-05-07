#!/bin/ksh

echo "Started..."

#DT=`m_eval -raw '(date("YYYYMMDD")) now()'`
#DT_CTRX=`m_eval -raw 'string_split_no_empty(read_file("$PUB_DATAHUB_SERIAL/run.rxclaim.integration.ctrx_dim.prod.run_id.dat"),"\n")[0]'`
#DT_ORX=`m_eval -raw 'string_split_no_empty(read_file("$PUB_DATAHUB_SERIAL/run.rxclaim.integration.orx_dim.prod.run_id.dat"),"\n")[0]'`


HOSTNAME=`hostname`
# Get the sandbox path
case "$HOSTNAME"  in
'apsrd6487' )
        SB_PATH=/etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim;;
'apsrp7996')
        SB_PATH=/etl/apps/prod/rxclaim/sand/orca/rxclaim;;
'*')
        echo -n "Please enter rxcliam sandbox path : ";read $ans
        SB_PATH=$ans;;
esac

echo $HOSTNAME 
# Source the sandbox
. $SB_PATH/ab*.ksh $SB_PATH

cd $PUB_DATAHUB_SERIAL;
case "$HOSTNAME"  in
'apsrd6487' )
        temp_ctrx=`m_eval 'string_split_no_empty(read_file("run.rxclaim.integration.ctrx_dim.dev.run_id.dat"),"\n")[0]'`;
        temp_orx=`m_eval 'string_split_no_empty(read_file("run.rxclaim.integration.orx_dim.dev.run_id.dat"),"\n")[0]'`;;
'apsrp7996')
        temp_ctrx=`m_eval 'string_split_no_empty(read_file("run.rxclaim.integration.ctrx_dim.prod.run_id.dat"),"\n")[0]'`;
        temp_orx=`m_eval 'string_split_no_empty(read_file("run.rxclaim.integration.orx_dim.prod.run_id.dat"),"\n")[0]'`;;
'*')
        echo -n "Please enter rxcliam sandbox path"
esac

DT_CTRX=`echo $temp_ctrx| sed 's/"//g'`;
DT_ORX=`echo $temp_orx| sed 's/"//g'`;



i=0
while [ $i -ne 4 ] 
do
i=0
FILE=`ls  -1tr  $AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcmelp.${DT_ORX}.dat.gz 2>/dev/null | tail -1 `
if [[ -n $FILE  ]]
then
	if [[ ! -e ${FILE}.lock ]]
	then
	 echo "Found ..clean.rxclaim_orx.rcmelp"
	 ((i+=1))
	fi
fi


FILE=`ls  -1tr  $AI_MFS/clean.rxclaim_orx/clean.rxclaim_orx.rcmbrp.${DT_ORX}.dat.gz 2>/dev/null | tail -1 `
if [[ -n $FILE  ]]
then
	if [[ ! -e ${FILE}.lock ]]
	then
	 echo "Found ..clean.rxclaim_orx.rcmbrp"
	 ((i+=1))
	fi
fi



FILE=`ls  -1tr  $AI_MFS/clean.rxclaim_ctrx/clean.rxclaim_ctrx.rcmelp.${DT_CTRX}.dat.gz 2>/dev/null | tail -1 `
if [[ -n $FILE  ]]
then
	if [[ ! -e ${FILE}.lock ]]
	then
	 echo "Found ..clean.rxclaim_ctrx.rcmelp"
	 ((i+=1))
	fi
fi

FILE=`ls  -1tr  $AI_MFS/clean.rxclaim_ctrx/clean.rxclaim_ctrx.rcmbrp.${DT_CTRX}.dat.gz 2>/dev/null | tail -1 `
if [[ -n $FILE  ]]
then
	if [[ ! -e ${FILE}.lock ]]
	then
	 echo "Found ..clean.rxclaim_ctrx.rcmbrp"
	 ((i+=1))
	fi

fi

sleep 60  
done
