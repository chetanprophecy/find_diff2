#
# Initialization for setup scripts
#
# --- CHANGELOG --------------------------------------------------------------------------------------------
#  13/10/2016   Paul Thompson   Initial version
# ----------------------------------------------------------------------------------------------------------
#                

. ${SCRIPT_PATH%/clinical/pub_clinical/bin/*}/clinical/pub_clinical/bin/include/common-functions-and-init.inc.ksh
. $HOME/.profile > /dev/null

# Only do this once per top level script execution
if [[ -z $SANDBOX_ROOT ]]; then

	# Derive the path to the sandbox root
	export SANDBOX_ROOT=${SCRIPT_PATH%/clinical/pub_clinical/*}

	# Define sandbox paths
	export STDENV_SANDBOX=$(          find_sandbox stdenv          )
	export PUB_CLINICAL_SANDBOX=$(    find_sandbox pub_clinical    )
	export DB_CLINICAL_ODS_SANDBOX=$( find_sandbox db_clinical_ods )

	# Define a few setup related paths
	export CLINICAL_CONFIG=$PUB_CLINICAL_SANDBOX/config

	# Define the path to the setup script directory
	export CLINICAL_SETUP=$PUB_CLINICAL_SANDBOX/bin/setup/full
	
	# Define the timestamp for this execution of the setup script (assuming 1 execution per second is reasonable)
	export CLINICAL_SETUP_TIMESTAMP=$(date +%Y%m%d-%H%M%S)
	
	# Make sure the log directory exists
	export CLINICAL_SETUP_LOGDIR=$SANDBOX_ROOT/setup_log
	mkdir -p $CLINICAL_SETUP_LOGDIR > /dev/null 2>&1

fi

######################################################
# Logging and Error Handling Constants and Functions #
######################################################

# Error constants
SCRIPT_SUCCESS=0
SCRIPT_ERROR=1

function script_timestamp        { date +"%Y-%m-%d %H:%M:%S" | cut -c1-26 ; }
function script_timestamp_secs   { date +%s   ; }
function script_print            { print "$@" ; }
function script_error            { script_print "${RED}ERROR:${PLAIN} $@" ; }

function script_log              { typeset -L6 level=$1; script_print "$(script_timestamp) | $level | $2" ; }
function script_log_info         { script_log info   "$1" ; }
function script_log_error        { script_log error  "$1" ; }
function script_log_critical     { script_log crit   "$1" ; }

function script_start_log {
	typeset -L6 level=$1
	printf "$(script_timestamp) | $level | %-50s" "$2"
}

function script_end_log {
	typeset -i  start_timestamp=$1
	typeset -i  end_timestamp=$2
	typeset     rc=$3
	typeset     duration=$(calculate_duration $start_timestamp $end_timestamp)

	script_print "[ $duration ] retcode = $rc"
}

function script_exit {
	typeset rcvalue=${1:-$SCRIPT_SUCCESS}

	# Delete the log fifo (if it exists)
	if [[ -n $LOG_FILE_FIFO && -e $LOG_FILE_FIFO ]]; then
		rm -f $LOG_FILE_FIFO
	fi

	# Return something
	exit $rcvalue
}

function print_true_or_false {
	(( $1 )) && print "${GREEN}TRUE${PLAIN} " || print "${RED}FALSE${PLAIN}"
}

#############################################################
# Define functions for reuse in data installation/upgrading #
#############################################################

function truncate_table {
	typeset table_name=$1

	if [[ -z $table_name ]]; then
		print -u2 "Usage: $0 <table-name>"
		return 1
	fi

	print "Truncating database table $table_name"
	[[ -z $DB_CLINICAL_ODS_DBC_FILE ]] && load_sandbox load > /dev/null
	m_db truncate $DB_CLINICAL_ODS_DBC_FILE -table $table_name

	if [[ $? -ne 0 ]]; then
		print -u2 "[$0] ERROR: Problem truncating table $table_name"
		return 1
	fi

	print ""
}

function get_default_config_file {
	print $CLINICAL_CONFIG/config-dev.txt
}

function validate_config_file {
	typeset config_file=$1
	
	if [[ -z $config_file ]]; then
		print -u2 "Usage: $0 <config-file-full-path>"
		return 1
	fi
	
	if   [[ ! -e $config_file ]]; then print -u2 "ERROR: Config file does not exist ($config_file)"  && return 2
	elif [[ ! -r $config_file ]]; then print -u2 "ERROR: Config file is not readable ($config_file)" && return 3
	fi
	
	return 0
}

function get_config_value {
	typeset config_parm_name=$1
	typeset config_file=$2
	
	if [[ -z $config_parm_name || -z $config_file ]]; then
		print -u2 "Usage: $0 <config-parameter-name> <config-file-full-path>"
		return 1
	fi
	
	typeset value=$( grep "^[ \t]*${config_parm_name}[ \t]*|.*" $config_file | cut -d'|' -f2 | string_lrtrim )
	eval print - $value
}

function get_user_config_value {
	typeset config_parm_name=$1
	typeset config_file=$2
	
	if [[ -z $config_parm_name || -z $config_file ]]; then
		print -u2 "Usage: $0 <config-parameter-name> <config-file-full-path>"
		return 1
	fi
	
	typeset value=$( grep "^[ \t]*${config_parm_name}[ \t]*|[ \t]*${USER}[ \t]*|.*" $config_file | cut -d'|' -f3 | string_lrtrim )
	eval print - $value
}

