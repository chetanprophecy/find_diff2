#!/bin/ksh -e

#Run project setup
if [[ "$AI_PHASE" == "prod" ]] ; then
        cd /etl/apps/prod/rxclaim/sand/orca/rxclaim
elif [[ "$AI_PHASE" == "dev" ]] ; then
        cd /etl/devel/appconf.rxclaim_idw_direct/idw_direct/users/$USER/orca/rxclaim
else
        cd /etl/devel/appconf.rxclaim/main/users/$USER/orca/rxclaim
fi
. ./ab_project_setup.ksh .

cd $AI_ECG_INBOUND/cdw
ls -tr Dim_DrugPricing_*.dat.gz
if [[ `echo $?` -ne 0 ]]
then
        echo "No Files present at source.Coping the latest file"
	cp $AI_ECG_INBOUND/cdw/processed/latest_Dim_DrugPricing.dat.gz  $AI_ECG_INBOUND/cdw/Dim_DrugPricing_prev.dat.gz
fi
file_name=`ls -tr Dim_DrugPricing_*.dat.gz | tail -1`
file_size_flag=1
num_itrn=0
while [[ $file_size_flag -eq 1 ]]
do
file_size_1=`ls -l $file_name | awk '{print $5}'`
echo $file_size_1
sleep 5
file_size_2=`ls -l $file_name | awk '{print $5}'`
echo $file_size_2
echo $file_name
if [[ $file_size_1 -eq $file_size_2 ]]
then
    echo "file size are same. Ending Loop"
        file_size_flag=0
else
        echo "file size are different. Restarting Loop"
        file_size_flag=1
        num_itrn=`echo "$num_itrn + 1"|bc`
        echo $num_itrn
        if [[ $num_itrn -gt 20 ]]
        then
            file_size_flag=0
            echo "num iteration has exceeded 20 iterations.Ending loop"
            cp $AI_ECG_INBOUND/cdw/processed/latest_Dim_DrugPricing.dat.gz  $AI_ECG_INBOUND/cdw/Dim_DrugPricing_prev.dat.gz
            file_name=`ls -tr Dim_DrugPricing_prev.dat.gz | tail -1`
        fi

fi
done

cp $AI_ECG_INBOUND/cdw/$file_name $AI_SERIAL_PENDING/rxclaim/
gunzip -f $AI_SERIAL_PENDING/rxclaim/${file_name}
mkdir -p $AI_ECG_INBOUND/cdw/processed/
cp $AI_ECG_INBOUND/cdw/$file_name $AI_ECG_INBOUND/cdw/processed/latest_Dim_DrugPricing.dat.gz
