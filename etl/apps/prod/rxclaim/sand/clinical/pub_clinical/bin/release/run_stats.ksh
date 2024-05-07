#!/bin/ksh

ENV=$1

BIZ_DT=`date "+%Y%m%d"`

cd /etl/apps/${ENV}/clinical/sand/current/clinical/template_config

. ./ab_project_setup.ksh .


output1=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./ids_to_cli_cdc_rcmsip_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | grep started | head -1 | awk -F' ' '{print $1" "$2" "$3}'`
b1=`date --date="$output1" '+%Y-%m-%d %H:%M:%S'`
output2=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./ids_to_cli_cdc_rcmsip_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | grep ended | tail -1 | awk -F' ' '{print $1" "$2" "$3}'`
b2=`date --date="$output2" '+%Y-%m-%d %H:%M:%S'`
echo "100,100-ids-to-cli-rcmsip.ksh,IDS to CLI - Member Supplementary Info (HICN),$b1, $b2," > $AI_SERIAL/stats.$BIZ_DT.xls

output3=`ls -tr /etl/data/${ENV}/admin/clinical/patient_matching/log/./mbr_mtch.plan_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | head -1 | cut -d ']' -f1 | tr -d '['`
output4=`ls -tr /etl/data/${ENV}/admin/clinical/patient_matching/log/./mbr_mtch.plan_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | tail -1 | cut -d ']' -f1 | tr -d '['`
echo "120,120-patient-matching.ksh,Patient Matching,$output3,$output4," >> $AI_SERIAL/stats.$BIZ_DT.xls

output5=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./ids_to_cli_cdc_member_elig_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | grep started | head -1 | awk -F' ' '{print $1" "$2" "$3}'`
b5=`date --date="$output5" '+%Y-%m-%d %H:%M:%S'`
output6=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./ids_to_cli_cdc_member_elig_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | grep ended | tail -1 | awk -F' ' '{print $1" "$2" "$3}'`
b6=`date --date="$output6" '+%Y-%m-%d %H:%M:%S'`
echo "140,140-ids-to-cli-mbr-elig.ksh,Member Eligibility,$b5,$b6," >> $AI_SERIAL/stats.$BIZ_DT.xls

output7=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./pharma_claim_data_intake_????-??-??-??-??-??_?????.log   | tail -1 | xargs  cat | grep started | head -1 | awk -F' ' '{print $1" "$2" "$3}'`
b7=`date --date="$output7" '+%Y-%m-%d %H:%M:%S'`
output8=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./pharma_claim_data_intake_????-??-??-??-??-??_?????.log   | tail -1 | xargs  cat | grep ended | tail -1 | awk -F' ' '{print $1" "$2" "$3}'`
b8=`date --date="$output8" '+%Y-%m-%d %H:%M:%S'`
echo "200,200-pharma-claim-intake.ksh,Pharmacy Claim Data Intake,$b7,$b8," >> $AI_SERIAL/stats.$BIZ_DT.xls

output9=`ls -tr /etl/data/${ENV}/admin/clinical/extracts/log/./unload_ods_config_tbls.plan_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | head -1 | cut -d ']' -f1 | tr -d '['`
output10=`ls -tr /etl/data/${ENV}/admin/clinical/extracts/log/./unload_ods_config_tbls.plan_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | tail -1 | cut -d ']' -f1 | tr -d '['`
echo "510,510-unload-ods.ksh,Unload ODS Configuration,$output9,$output10,"  >> $AI_SERIAL/stats.$BIZ_DT.xls

output11=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./Appconf_Parser_????-??-??-??-??-??_?????.log | tail -1  | xargs  cat | grep started | head -1 | awk -F' ' '{print $1" "$2" "$3}'`
b11=`date --date="$output11" '+%Y-%m-%d %H:%M:%S'`
output12=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./Appconf_Parser_????-??-??-??-??-??_?????.log | tail -1  | xargs  cat | grep ended | tail -1 | awk -F' ' '{print $1" "$2" "$3}'`
b12=`date --date="$output12" '+%Y-%m-%d %H:%M:%S'`
echo "520,520-appconf-parser.ksh,Express>It Configuration Parser,$b11,$b12," >> $AI_SERIAL/stats.$BIZ_DT.xls

output13=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./config_data_init_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | head -1 | cut -d ']' -f1 | tr -d '['`
output14=`ls -tr /etl/data/${ENV}/admin/clinical/enrichments/log/./config_data_init_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | tail -1 | cut -d ']' -f1 | tr -d '['`
echo "530,530-daily-init.ksh,Daily Initializations (enumerations etc),$output13,$output14," >> $AI_SERIAL/stats.$BIZ_DT.xls

output15=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./exec_framework_intrvn_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | head -1 | cut -d ']' -f1 | tr -d '['`
output16=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./exec_framework_intrvn_????-??-??-??-??-??_?????.log | tail -1 | xargs  cat | tail -1 | cut -d ']' -f1 | tr -d '['`
echo "700,700-exec-fmwk.ksh,Execution Framework,$output15,$output16," >> $AI_SERIAL/stats.$BIZ_DT.xls

output17=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./stats_creation_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | grep started | head -1 | awk -F' ' '{print $1" "$2" "$3}'`
b17=`date --date="$output17" '+%Y-%m-%d %H:%M:%S'`
output18=`ls -tr /etl/data/${ENV}/admin/clinical/template_config/log/./stats_creation_????-??-??-??-??-??_?????.log  | tail -1 | xargs  cat | grep ended | tail -1 | awk -F' ' '{print $1" "$2" "$3}'`
b18=`date --date="$output18" '+%Y-%m-%d %H:%M:%S'`
echo "720,720-run-exec-fmwk-stats.ksh,Execution Framework - Statistics,$b17,$b18,"  >> $AI_SERIAL/stats.$BIZ_DT.xls
