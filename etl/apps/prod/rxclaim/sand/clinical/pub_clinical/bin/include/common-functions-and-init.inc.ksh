#
# Common functions and initialization for shell scripts
#
# --- CHANGELOG ------------------------------------------------------------------------------------------------------
#  10/13/2016   Paul Thompson      Initial version
# --------------------------------------------------------------------------------------------------------------------
#                

# Clear any loaded Ab Initio project from our environment
if [[ ! -z $PROJECT_DIR ]]; then
	typeset _AB_PROJECT_KSH=$PROJECT_DIR/.project.ksh
	typeset _AB_PROJECT_DIR=$PROJECT_DIR
	typeset _AB_DEFINE_OR_EXECUTE=undefine
	typeset _AB_START_OR_END=start

	. "$_AB_PROJECT_KSH" "$_AB_PROJECT_DIR" "$_AB_DEFINE_OR_EXECUTE" "$_AB_START_OR_END"
fi

# Define some colours
if [[ -z $RED ]]; then 
	export RED=$(       [[ -t 1 ]] && tput setaf 1 || print )
	export GREEN=$(     [[ -t 1 ]] && tput setaf 2 || print )
	export YELLOW=$(    [[ -t 1 ]] && tput setaf 3 || print )
	export BLUE=$(      [[ -t 1 ]] && tput setaf 4 || print )
	export MAGENTA=$(   [[ -t 1 ]] && tput setaf 5 || print )
	export CYAN=$(      [[ -t 1 ]] && tput setaf 6 || print )
	export WHITE=$(     [[ -t 1 ]] && tput setaf 7 || print )
	export PLAIN=$(     [[ -t 1 ]] && tput sgr0    || print )
	export BOLD=$(      [[ -t 1 ]] && tput bold    || print )
	export REVCOLOUR=$( [[ -t 1 ]] && tput rev     || print )
	export UNDERLINE=$( [[ -t 1 ]] && tput smul    || print )
fi

######################################################
# Logging and Error Handling Constants and Functions #
######################################################

# Error constants
SCRIPT_SUCCESS=0
SCRIPT_ERROR=1

function script_timestamp        { date +"%Y-%m-%d %H:%M:%S"    | cut -c1-26 ; }
function script_timestamp_usecs  { date +"%Y-%m-%d %H:%M:%S.%N" | cut -c1-26 ; }
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

###################################################
# Helper functions for Shell Scripting lurk below #
###################################################

function find_sandboxes {
	typeset sandbox_type=$1
	typeset sandbox_path
	typeset next_sandbox_type
	
	if   [[ -z $SANDBOX_ROOT ]]; then print -u2 "ERROR: SANDBOX_ROOT must be defined!" && return 1
	elif [[ -z $sandbox_type ]]; then print -u2 "USAGE: $0 <SANDBOX-TYPE>"             && return 1 
	fi

	for sandbox_path in $( find -L $SANDBOX_ROOT  -wholename "*/.sandbox.pset" | rev | cut -f2- -d/ | rev ); do
		next_sandbox_type=$( grep '!project_type' $sandbox_path/.project.pset | rev | cut -f1 -d'|' | rev )
		if [[ $next_sandbox_type == $sandbox_type ]]; then
			print $sandbox_path
		fi
	done
}

function find_sandbox {
	typeset sandbox_name=$1

	if   [[ -z $SANDBOX_ROOT ]]; then print -u2 "ERROR: SANDBOX_ROOT must be defined!" && return 1
	elif [[ -z $sandbox_name ]]; then print -u2 "USAGE: $0 <SANDBOX-NAME>"             && return 1 
	fi

	if [[ $sandbox_name = ABENV ]]
		then print $AB_HOME/Projects/abenv
		else find -L $SANDBOX_ROOT -wholename "*/${sandbox_name}/.sandbox.pset" | rev | cut -f2- -d/ | rev
	fi
}

function load_sandbox {
	typeset sandbox=$1
	typeset sandbox_name
	typeset sandbox_path

	if   [[ -z $sandbox ]]; then
		print -u2 "USAGE: $0 <SANDBOX-NAME-OR-PATH> -- ABORTING!"
		return 1
	fi

	if [[ $sandbox = */* ]]; then
		sandbox_name=$( basename $sandbox )
		sandbox_path=$sandbox
	else
		sandbox_name=$sandbox
		sandbox_path=$( find_sandbox $sandbox ) 

		if [[ -z $sandbox_path ]]; then
			print -u2 "ERROR: Could not find sandbox path for sandbox: $sandbox_name"
		fi
	fi

	if [[ ! -e $sandbox_path/ab_project_setup.ksh ]]; then
		print -u2 "ERROR: Cannot find ab_project_setup.ksh -- ABORTING!"
		return 1
	fi

	. $sandbox_path/ab_project_setup.ksh $sandbox_path
}

function is_development_environment {
	[[ $( hostname -s ) = apsrd6487 || $( hostname -s ) = egvd1l1abi01 ]]
        return $?
}

function get_sandbox_value {
	typeset sandbox_path=$1
	typeset parameter_name=$2

	if [[ -z $sandbox_path || -z $parameter_name ]]; then
		print -u2 "USAGE: $0 <SANDBOX-PATH> <PARAMETER-NAME>"
		return 1
	fi

	air sandbox parameter -basedir $sandbox_path -eval $parameter_name
}

function string_lrtrim   {
	if [[ -n $1 ]]
		then print "$1" | sed 's/^[ \t]*//;s/[ \t]*$//'
		else              sed 's/^[ \t]*//;s/[ \t]*$//'
	fi
}

function string_upcase   {
	if [[ -n $1 ]]
		then print "$1" | tr '[a-z]' '[A-Z]'
		else              tr '[a-z]' '[A-Z]'
	fi
}

function string_downcase {
	if [[ -n $1 ]]
		then print "$1" | tr '[A-Z]' '[a-z]'
		else              tr '[A-Z]' '[a-z]'
	fi
}

function strip_colours {
	if [[ -n $1 ]]
		then print "$1" | sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g'
		else              sed -r 's/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g'
	fi
}

function strip_extension {
	if [[ -n $1 ]]
		then print "$1" | rev | cut -d. -f2- | rev
		else              rev | cut -d. -f2- | rev
	fi
}

