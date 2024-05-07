#!/bin/ksh

# # # # # # # # # # # # # # # # # # # # #
#
# New Script; comments will be added soon
#
# # # # # # # # # # # # # # # # # # # # #


if [ "$#" -ne 1 ]; then
  echo "$0 identifies the impacted objects if the DML of an IDS is modified." >&2
  echo "Usage: $0 <IDS NAME>" >&2
  exit 1
fi

IDS_NAME=$1
SUBJECT_AREA=`echo $IDS_NAME | cut -d"." -f1`
ENTITY=`echo $IDS_NAME | cut -d"." -f2`
IDS_NAME_NO_DOT=`echo $IDS_NAME | sed 's/\./_/g'`
BRANCH=$AB_AIR_BRANCH
[[ -z $BRANCH ]] && BRANCH=main

SEARCH_IN_META=`air cat /Projects/aicoe/pub_dxf/meta/ids_table_properties.dat | grep "^$IDS_NAME|"`
if [[ -z $SEARCH_IN_META ]];then
  echo "No such IDS: $IDS_NAME"
  exit 1
fi

echo IDS Name: $IDS_NAME
echo

echo Identifying impacts by dependency analysis...
da_results=`air object referencing-files /Projects/aicoe/pub_datahub/dml/$SUBJECT_AREA/$IDS_NAME.dml -top-level`
DA_COUNT=`echo $da_results | awk -F' ' '{print NF}'`

echo "Searching references in other files in the repository ($BRANCH branch). This may take about a minute..."
ilm_results=`air object search grep /Projects/orca $IDS_NAME_NO_DOT -name ilm | grep -v 'orca/distribution'`
ILM_COUNT=`echo $ilm_results | awk -F' ' '{print NF}'`
load_results=`air object search /Projects/orca $IDS_NAME. -name load | grep ".pset$"`
LOAD_COUNT=`echo $load_results | awk -F' ' '{print NF}'`

TOTAL_COUNT=`expr $DA_COUNT + $ILM_COUNT + $LOAD_COUNT`
echo
if [[ "$TOTAL_COUNT" -ne "0" ]];then
  OUTPUT_FILE=$PWD/impact.$IDS_NAME.log
  echo "Impact report for change in the DML for $IDS_NAME" > $OUTPUT_FILE
  echo >> $OUTPUT_FILE
  echo "Total objects found: $TOTAL_COUNT" >> $OUTPUT_FILE
  echo >> $OUTPUT_FILE
  echo "ILMs impacted ($ILM_COUNT):" >> $OUTPUT_FILE
  echo "==============================" >> $OUTPUT_FILE
  echo $ilm_results | sed 's/ /\n/g' | sort >> $OUTPUT_FILE
  echo >> $OUTPUT_FILE
  echo "Load psets that load data to this IDS ($LOAD_COUNT):" >> $OUTPUT_FILE
  echo "==============================" >> $OUTPUT_FILE
  echo $load_results | sed 's/ /\n/g' | sort >> $OUTPUT_FILE
  echo >> $OUTPUT_FILE
  echo "Other files referencing $IDS_NAME, and that might not require a change ($DA_COUNT):" >> $OUTPUT_FILE
  echo "==============================" >> $OUTPUT_FILE
  echo $da_results | sed 's/ /\n/g' | sort >> $OUTPUT_FILE
  echo >> $OUTPUT_FILE
  echo "End of Report" >> $OUTPUT_FILE
  
  echo "There are $ILM_COUNT ILMs impacted by any change in the DML for $IDS_NAME, and will need to be regenerated."
  echo "There are $LOAD_COUNT load psets that load to this IDS."
  echo "There are $DA_COUNT other files that reference this IDS; these may or may not need a change."
  echo "The lists of these files have been written to the following file: $OUTPUT_FILE"
else
  echo "No impact found!"
fi
echo


