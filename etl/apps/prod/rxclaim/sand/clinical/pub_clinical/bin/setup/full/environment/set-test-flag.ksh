#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/full/environment/set-test-flag.ksh
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
print - "${YELLOW}Clinical Environmental Setup${PLAIN} -- Setting AI_TEST_FLAG"
print -          "----------------------------------------------------"
print

# Define a usage function
function script_usage {
	print "Usage: $SCRIPT_NAME <parameters>"
	print
	print "Where <parameters> are one or more of the following:"
	print "    --config-file <config-file-full-path>   Full path to a config file to be read"
	print "    -t || --test-flag <test-flag-value>     Test flag value to be used"
	print "    <test-flag-value>                       Can also be supplied without the -t || --test-flag label"
	print
}

# Read and validate the script arguments
config_file=$( get_default_config_file ) # This will only return a value in dev
test_flag_value=

integer startup_errors=0
while [ $# -gt 0 ]; do
	case "$1" in
		-h|--h|-help|--help|-\?|--\?|-u|--u|-usage|--usage ) script_usage && exit 1 ;;
		
		-config-file | --config-file )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the full path to a config file"; (( ++startup_errors ))
				else config_file=$2; shift
			fi ;;
		
		-t | --t | -test-flag  | --test-flag )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the test flag value"; (( ++startup_errors ))
				else test_flag_value=$2; shift
			fi ;;
		
		* )
			if [[ $1 = -* ]]
				then print "Unrecognised parameter: $1" && (( ++startup_errors ))
				else test_flag_value=$1
			fi ;;
	esac
	shift
done

# If provided, attempt to read values from the config file (but only if they are not provided on the command line)
if [[ -n $config_file ]]; then
	validate_config_file $config_file || (( ++startup_errors ))
	[[ -z $test_flag_value ]] && test_flag_value=$( get_config_value 'AI TEST FLAG' $config_file )
fi

# Make sure that we have somehow ended up with a test flag value
if [[ -z $test_flag_value ]]; then
	print "ERROR: A value for AI_TEST_FLAG is required either as a command line argument or in a config file"
	(( ++startup_errors ))
fi

# Abort if there were any startup errors
if (( startup_errors > 0 )); then
	print "Script startup error ($startup_errors total) - ABORTING!\n"
	script_usage
	exit 1
fi

# Set the test flag
print "Setting sandbox override AI_TEST_FLAG@ABENV started -- $test_flag_value"
print "    stdenv sandbox = $STDENV_SANDBOX"
air sandbox parameter -basedir $AB_HOME/Projects/abenv -path $STDENV_SANDBOX "AI_TEST_FLAG@ABENV" $test_flag_value
rc=$?

# Check the return code
if [[ $rc -ne 0 ]]; then
	print "ERROR: Setting sandbox override AI_TEST_FLAG@ABENV failed!"
	exit 1
fi

# Otherwise report success
print "Setting sandbox override AI_TEST_FLAG@ABENV complete"
print

