#*****************************************************************************************************************************************
#pub_clinical -> $PUB_CLINICAL_BIN/env_setup.ksh
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

. $SAND_ROOT/pub_clinical/ab_project_setup.ksh $SAND_ROOT/pub_clinical/.

if [  $? -ne 0 ]
then
	echo "Error executing  . $SAND_ROOT/pub_clinical/ab_project_setup.ksh $SAND_ROOT/pub_clinical/."
	echo "Exiting with error"
	exit -1
fi

ksh $PUB_CLINICAL_BIN/env_setup_file_creation.ksh
if [  $? -ne 0 ]
then
	echo "Error executing  $PUB_CLINICAL_BIN/env_setup_file_creation.ksh"
	echo "Exiting with error"
	exit -1
fi

#yet to add one time data loads
