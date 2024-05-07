#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/full/environment/create-data-directories.ksh
#
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#  2016/10/13   Paul Thompson      Initial version
# --- CHANGELOG --------------------------------------------------------------------------------------------------------
#

# Derive the script name/path and include the setup initialisation script
SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $(whence ${0}))
. ${SCRIPT_PATH%/clinical/pub_clinical/bin/*}/clinical/pub_clinical/bin/setup/include/setup-init.inc.ksh

# Print a heading
print
print - "${YELLOW}Clinical Environmental Setup${PLAIN} -- Create Data Directories"
print -          "-------------------------------------------------------"
print

# Set some defaults
readonly DEFAULT_DATADIRS_PERMS=2775
readonly DEFAULT_DATADIRS_GROUP=abigrp

# Define the log directory and make sure it exists
readonly DATADIRS_LOGDIR=$CLINICAL_SETUP_LOGDIR/create-datadirs-$CLINICAL_SETUP_TIMESTAMP
mkdir -p $DATADIRS_LOGDIR > /dev/null 2>&1

# Define a usage function
function script_usage {
	print "Usage: $SCRIPT_NAME <parameters>"
	print
	print "Where <parameters> are one or more of the following:"
	print "    --config-file <CONFIG-FILE-FULL-PATH>   Full path to a config file to be read"
	print "    -p || --perms <DATA-DIR-PERMISSIONS>    Data directory permissions to be used (defaults is $DEFAULT_DATADIRS_PERMS)"
	print "    -g || --group <DATA-DIR-GROUP>          Data directory group to be used (defaults is $DEFAULT_DATADIRS_GROUP)"
	print
}

# Read and validate the script arguments
config_file=$( get_default_config_file ) # This will only return a value in dev
datadir_perms=
datadir_group=

integer startup_errors=0
while [ $# -gt 0 ]; do
	case "$1" in
		-h|--h|-help|--help|-\?|--\?|-u|--u|-usage|--usage ) script_usage && exit 1 ;;
		
		-config-file | --config-file )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the full path to a config file"; (( ++startup_errors ))
				else config_file=$2; shift
			fi ;;
		
		-p | --p | -perms | --perms )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the data directory permissions"; (( ++startup_errors ))
				else datadir_perms=$2; shift
			fi ;;
		
		-g | --g | -group | --group )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the data directory group"; (( ++startup_errors ))
				else datadir_group=$2; shift
			fi ;;
		
		#
		# TODO - Add more command line options to create for a particular project or to delete maybe?
		#
		
		* ) print "Unrecognised parameter: $1" && (( ++startup_errors )) ;;
	esac
	shift
done

if [[ -n $config_file ]]; then
	validate_config_file $config_file || (( ++startup_errors ))
fi

# Abort if there were any startup errors
if (( startup_errors > 0 )); then
	print "Script startup error ($startup_errors total) - ABORTING!\n"
	exit 1
fi

# If provided, attempt to read values from the config file (but only if they are not provided on the command line)
if [[ -n $config_file ]]; then
	[[ -z $datadir_perms ]] && datadir_perms=$( get_config_value 'DATA DIRECTORY PERMISSIONS' $config_file )
	[[ -z $datadir_group ]] && datadir_group=$( get_config_value 'DATA DIRECTORY GROUP'       $config_file )
fi

# Check if we need to default anything
[[ -z $datadir_perms ]] && datadir_perms=$DEFAULT_DATADIRS_PERMS
[[ -z $datadir_group ]] && datadir_group=$DEFAULT_DATADIRS_GROUP

# Show the parameters and print a little explanation
print "Config File:  ${CYAN}${config_file:-NOT PROVIDED}${PLAIN}"
print "Sandbox Root: ${BLUE}${SANDBOX_ROOT}${PLAIN}"
print "Data Directory Permissions: ${GREEN}$datadir_perms${PLAIN}"
print "Data Directory Group:       ${GREEN}$datadir_group${PLAIN}"
print
print "This will appear to hang for a few moments. That is because the data directories"
print "are being created in parallel to speed up this task a bit. Wait a few moments."
print
print "Also note that the first time this runs, you might get some errors because the"
print "create data dirs running in parallel are trying to create the same directories."
print "Please disregard. If there is concern, please just rerun to confirm all is good."
print

# Set the starting index
all_sandboxes_index=0

# Loop through the private sandboxes
for sandbox_pset in $( find -L $SANDBOX_ROOT -name .sandbox.pset | egrep -v '/pub_|/db_|/stdenv/' ); do
	(
		index=$all_sandboxes_index
		sandbox=$( dirname  $sandbox_pset )
		project=$( basename $sandbox      )
		logfile=$DATADIRS_LOGDIR/create_datadirs.$project.log
		
		print "${index}-0|## Running project-directories for $sandbox"
		$AB_HOME/bin/project-directories \
			-create                      \
			-all-commons                 \
			-proj $sandbox               \
			-perms $datadir_perms        \
			-group $datadir_group        \
			-ignore-existing > $logfile 2>&1
		rc=$?
		
		# Check the return code
		if [[ $rc -ne 0 ]]; then
			print "${index}-1|##   Finished with non-zero return code ($rc) -- Please review the log file"
			print "${index}-2|##   $logfile"
		fi
	) &
	
	(( ++all_sandboxes_index ))
done | sort | cut -d'|' -f2-

print
print "Create data directories complete"
print

