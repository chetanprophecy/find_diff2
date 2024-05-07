#*****************************************************************************************************************************************
#pub_clinical -> $PUB_CLINICAL_BIN/env_setup_file_creation.ksh
#
#  Date        Author                  Description
# ---------------------------------------------------------------------------------------------------------------------------------------
#  2016/10/01  Aravind Sanku          Initial version,set flag, fetch or generate sks
#
#********************************************************************************************************************************************/

#!/bin/ksh

usage (){
echo "Correct usage $0 -s <sandbox name> -t <test flag optional>"
exit -1
}

create_file (){

m_touch $1
if [  $? -ne 0 ]
then
	echo "Error executing  m_touch $1"
else
	echo "Successful executing  m_touch $1"
fi

}

exec_step (){
$1
if [  $? -ne 0 ]
then
	echo "Error executing $1"
else
	echo "Successful executing $1"
fi
}

while getopts ":s:t:" opt; do
  case $opt in
    s)
      export SAND_ROOT=${OPTARG};
      ;;
    t)
      export TEST_FLAG=${OPTARG}

      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${SAND_ROOT}" ] ; then
    usage
fi

if [ -z "${TEST_FLAG}" ] ; then
    echo "SAND_ROOT used is $SAND_ROOT and no value provided for TEST_FLAG"
	else 
	echo "SAND_ROOT used is $SAND_ROOT and TEST_FLAG is $TEST_FLAG"
fi

if [ ! -d $SAND_ROOT ] ; then
	echo "$SAND_ROOT doesnt exist, exiting the env setup"
	exit -1
fi

. $SAND_ROOT/enrichments/ab_project_setup.ksh $SAND_ROOT/enrichments/.

exec_step "m_mkdir $PUB_CLINICAL_DATAHUB_SERIAL_INBOUND/ids"
exec_step "m_mkdir $PUB_CLINICAL_DATAHUB_MFS_INBOUND/ids"


exec_step "m_touch $PUB_CLINICAL_MFS/cli_ahfs.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_cag.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_carrier_acct.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_carrier.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_claim_status.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_client.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_compound.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_contract_pbp.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_cpt_code.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_cpt_mod_code.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_days_of_supply.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_drug_maintenance.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_drug_otc_indicator.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_drug.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_gender.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_gpi.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_member_eligibility.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_mbr.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_member_type.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_pbr_id_qlfr.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_pharmacy.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_plan.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_plan_qualifier.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_plan_type.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_prescriber_alias.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_prescriber.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_prescriber_specialty.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_prod_qlfr.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_LOOKUP/cli_product.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_snomed_cd.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_src_env.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_therapeutic_class.dat"
exec_step "m_touch $PUB_CLINICAL_MFS_REFDATA/cli_toc.dat"
exec_step "m_touch ${AI_SERIAL_LOOKUP}/nas_to_member_dtl_max_id.lkp"
exec_step "m_touch $AI_SERIAL/nsa_to_member_list_full.dat"



exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/ahfs_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/cag_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/carrier_acct_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/carrier_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/client_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/contract_pbp_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/cpt_code_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/cpt_mod_code_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/drug_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/gender_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/gpi_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/member_eligibility_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/mbr_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/pharmacy_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/plan_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/prescriber_alias_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/prescriber_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/prescriber_specialty_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/product_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/claim_status_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/compound_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/days_of_supply_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/drug_maintenance_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/drug_otc_indicator_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/member_type_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/pbr_id_qlfr_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/plan_qualifier_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/plan_type_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/prod_qlfr_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/snomed_cd_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/src_env_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/therapeutic_class_audit_max_sk.dat"
exec_step "echo ',,0,' > $AI_SERIAL_LOOKUP/toc_audit_max_sk.dat"
exec_step "echo '0'    > ${AI_SERIAL_LOOKUP}/nas_to_member_list_max_id.lkp"

#yet to add more refer to /etl/data/qa/serial/clinical/ot_setup.ksh
