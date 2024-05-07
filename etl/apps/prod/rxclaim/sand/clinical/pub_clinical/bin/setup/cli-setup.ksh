#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/cli-setup.ksh
#
# --- CHANGELOG ------------------------------------------------------------------------------------
#  2016/10/13   Paul Thompson      Initial version
# --------------------------------------------------------------------------------------------------
#

# Data setup initialisation
SCRIPT_NAME=$(basename $0)
SCRIPT_PATH=$(dirname $(whence ${0}))

# Include the setup initialisation
. ${SCRIPT_PATH%/clinical/pub_clinical/bin/*}/clinical/pub_clinical/bin/setup/include/setup-init.inc.ksh

function script_usage {
	script_print "Usage: $SCRIPT_NAME <parameters>"
	script_print ""
	script_print "Where <parameters> are one or more of the following:"
	script_print "    -v || --verbose                          Verbose mode - output much (default and sensible anyhow)"
	script_print "    -q || --quiet                            Quiet mode - output little"
#	script_print "    -d || --system-date <SYSTEM-DATE>        System date - required if init-sdt is to be run"
	script_print "    -r || --run  <STEP> [<STEP>]             Space/comma separated list of steps to be run (optional)"
	script_print "    -s || --skip <STEP> [<STEP>]             Space/comma separated list of steps to be skipped (optional)"
	script_print "    --config-file <config-file-full-path>    Configuration file (example at \$PUB_CLINICAL_CONFIG/config-dev.txt)"
	script_print "    --skip-confirm                           Skip the confirmation step (are you sure this is wise?)"
	script_print "    --dry-run                                Just think about running (but don't - shows parameters)"
	script_print ""
	script_print "The following syntax is also accepted for providing steps to run or skip:"
	script_print "    -run-<STEP>  || --run-<STEP>             Step to run"
	script_print "    -skip-<STEP> || --skip-<STEP>            Step to skip"
	script_print ""
#	script_print "Refererence Data parameters:"
#	script_print "    -rd || --refdata-dir <PATH>              Directory path holding reference data files to load"
#	script_print "                                             (required if reference data is to be loaded)"
	script_print ""
	script_print "Where the valid <STEP> are:"
	script_print "    a         | all                       -- Enable/disable all of the below"
	script_print ""
	script_print "  Environmental Setup:"
	script_print "    set-tf    | set-test-flag             -- Set data directories test flag"
	script_print "    cfg-ovrd  | configure-overrides       -- Configure sandbox overrides"
	script_print "    crt-dirs  | create-data-directories   -- Create sandbox data directories"
#	script_print "    del-abque | delete-abinitio-queues    -- Delete the Ab Initio queues"
#	script_print "    crt-abque | create-abinitio-queues    -- Create the Ab Initio queues"
#	script_print "    run-lnks  | create-run-links          -- Create run links"
#	script_print ""
#	script_print "  Environment Cleanup:"
#	script_print "    dp-mg     | deploy-micrographs        -- Deploy micrographs"
#	script_print "    clr-tf    | clear-trigger-files       -- Clear trigger files"
#	script_print "    clr-irf   | clear-intmd-refdata-files -- Clear intermediate refdata files"
#	script_print ""
#	script_print "  Database Schema Setup:"
#	script_print "    drop-db   | drop-schema               -- Drop all database schema objects [INTERACTIVE]"
#	script_print "    inst-db   | install-schema            -- Install database schema"
	script_print ""
	script_print "  Data Loading and Initialisation:"
	script_print "    crt-dzf   | create-day-zero-files     -- Create day zero empty historical data files"
#	script_print "    load-rd   | load-refdata              -- Load reference data files"
#	script_print "    crt-lkps  | create-lookups            -- Create lookup files"
        script_print ""
        script_print "  Create icff lookup files:"
        script_print "    crt-icff  | create-day-zero-pm-files  -- Create day zero empty icff files"
	script_print ""
	script_print "The all option would be used on it's own to run everything (--run all) or to first disable"
	script_print "everything before enabling something specific (--skip all --run reports). The actions will be"
	script_print "parsed in order as given on the command line."
	script_print ""
	script_print "Note that all steps are run in the order shown above. This is also the same order as displayed"
	script_print "in the parameters message shown before confirmation to go ahead and do it."
	script_print ""
	script_print "Example:"
	script_print "  \$PUB_CLINICAL_BIN/setup/${SCRIPT_NAME}.ksh -q -r all -s crt-dirs"
	script_print ""
	script_print "  This would setup the Clinical environment with quiet mode enabled running all steps except"
	script_print "  for the loading of reference data."
	script_print ""
}

function script_show_parameters {
	script_print ""
	script_print "##############################################################################################"
	script_print "## Clinical Environmental Setup -- \$PUB_CLINICAL_BIN/setup/cli-setup.ksh"
	script_print "##   AB_HOME         = ${AB_HOME}"
	script_print "##   Running as User = ${BLUE}$( whoami )${PLAIN}"
#	script_print "##   Database Schema = ${BLUE}${ORA_ODS_USER}${YELLOW}${ORA_ODS_DB_NAME}${PLAIN}"
	script_print "##   Test Flag       = ${CYAN}${AI_TEST_FLAG}${PLAIN}"
	script_print "## "
	script_print "## Command Line Arguments:"
#	script_print "##   System Date     = $( printf "%-27s [ %-40s ]" "${GREEN}${system_date}${PLAIN}"         "-d   | --system-date"     )"
	script_print "##   Dry-Run Only    = $( printf "%-27s [ %-40s ]" "$( print_true_or_false $dry_run_only )" "-dry | --dry-run"         )"
	script_print "## "
	script_print "## Configuration File:                  [ --config-file <config-file-full-path>    ]"
	script_print "##   ${CYAN}$config_file${PLAIN}"
	script_print "## "
#	script_print "## Reference Data Directory:            [ -rd  | --refdata-dir <refdata-dir>       ]"
#	script_print "##   ${BLUE}${refdata_dir}${PLAIN}"
#	script_print "## "
	script_print "## Steps -- Environmental Setup:"
	script_print "##   $( print_step_value $run_step_set_test_flag         ) : Set data dirs test flag     [ -r/s set-tf    | set-test-flag           ]"
	script_print "##   $( print_step_value $run_step_config_overrides      ) : Configure sandbox overrides [ -r/s cfg-ovrd  | configure-overrides     ]"
	script_print "##   $( print_step_value $run_step_create_data_dirs      ) : Create sandbox data dirs    [ -r/s crt-dirs  | create-data-directories ]"
#	script_print "##   $( print_step_value $run_step_delete_ab_queues      ) : Delete Ab Initio queues     [ -r/s del-abque | delete-abinitio-queues  ]"
#	script_print "##   $( print_step_value $run_step_create_ab_queues      ) : Create Ab Initio queues     [ -r/s crt-abque | create-abinitio-queues  ]"
#	script_print "##   $( print_step_value $run_step_create_run_links      ) : Create run links            [ -r/s run-lnks  | create-run-links        ]"
#	script_print "## "
#	script_print "## Steps -- Environment Cleanup:"
#	script_print "##   $( print_step_value $run_step_deploy_micrographs    ) : Deploy micrographs          [ -r/s dp-mg     | deploy-micrographs      ]"
#	script_print "## "
#	script_print "## Steps -- Database Schema Setup:"
#	script_print "##   $( print_step_value $run_step_drop_schema           ) : Drop database schema        [ -r/s drop-db   | drop-schema             ]"
#	script_print "##   $( print_step_value $run_step_install_schema        ) : Install database schema     [ -r/s inst-db   | install-schema          ]"
	script_print "## "
	script_print "## Steps -- Data Loading and Initialisation:"
	script_print "##   $( print_step_value $run_step_create_day_zero_files    ) : Create day zero files    [ -r/s crt-dzf   | create-day-zero-files      ]"
        script_print "##   $( print_step_value $run_step_create_day_zero_pm_files ) : Create day zero pm files [ -r/s crt-icff  | create-day-zero-pm-files   ]"
#	script_print "##   $( print_step_value $run_step_load_refdata          ) : Load reference data         [ -r/s load-rd   | load-refdata            ]"
#	script_print "##   $( print_step_value $run_step_create_lookups        ) : Create lookups              [ -r/s crt-lkps  | create-lookups          ]"
	script_print "## "
	script_print "## Note all steps can be run or skipped with [ a | all ]"
	script_print "## "
	
#	typeset count
#	typeset filename
#	
#	if (( run_step_load_refdata )); then
#		script_print "## Refdata Files & Sizes:"
#		
#		count=0
#		ls -1 $refdata_dir/*.csv 2> /dev/null | while read filename; do
#			script_print "##   ${CYAN}$(basename $filename)${PLAIN} -- $(ls -lh $filename | awk '{print $5}')"
#			(( ++count ))
#		done
#		
#		[[ $count -eq 0 ]] && script_print "##   ${RED}NONE FOUND${PLAIN} (did you provide a refdata dir?)"
#		script_print "## "
#	fi
	
	script_print "## Derived Arguments:"
	script_print "##   Log File Name  = ${CYAN}${LOG_FILE}${PLAIN}"
	script_print "##############################################################################################"
	script_print ""
}

function print_step_value {
	(( $1 )) && print "${GREEN}RUN${PLAIN} " || print "${RED}SKIP${PLAIN}"
}

function script_parse_step_arguments {
	typeset run_or_skip=$1
	typeset steplist="$2"
	
	# Decide whether we should be setting the steps to 1 (run) or 0 (skip)
	typeset -i stepvalue=$( [[ $run_or_skip = run ]] && print 1 || print 0 )
	
	for step in $steplist; do
		case $step in
			a | all )
				# Environmental Setup
				run_step_set_test_flag=$stepvalue
				run_step_config_overrides=$stepvalue
				run_step_create_data_dirs=$stepvalue
#				run_step_delete_ab_queues=$stepvalue
#				run_step_create_ab_queues=$stepvalue
#				run_step_create_run_links=$stepvalue
#				
#				# Environment Cleanup
#				run_step_deploy_micrographs=$stepvalue
#				
#				# Database Schema Setup
#				run_step_drop_schema=$stepvalue
#				run_step_install_schema=$stepvalue
				
				# Data Loading and Initialisation
				run_step_create_zero_files=$stepvalue
#				run_step_load_refdata=$stepvalue
#				run_step_create_lookups=$stepvalue
                                run_step_create_zero_pm_files=$stepvalue
			;;
			
			# Environmental Setup
			set-tf    | set-test-flag             ) run_step_set_test_flag=$stepvalue             ;;
			cfg-ovrd  | configure-overrides       ) run_step_config_overrides=$stepvalue          ;;
			crt-dirs  | create-data-directories   ) run_step_create_data_dirs=$stepvalue          ;;
#			del-abque | delete-abinitio-queues    ) run_step_delete_ab_queues=$stepvalue          ;;
#			crt-abque | create-abinitio-queues    ) run_step_create_ab_queues=$stepvalue          ;;
#			run-lnks  | create-run-links          ) run_step_create_run_links=$stepvalue          ;;
#			
#			# Environment Cleanup
#			dp-mg     | deploy-micrographs        ) run_step_deploy_micrographs=$stepvalue        ;;
#			
#			# Database Schema Setup
#			drop-db   | drop-schema               ) run_step_drop_schema=$stepvalue               ;;
#			inst-db   | install-schema            ) run_step_install_schema=$stepvalue            ;;
			
			# Data Loading and Initialization
			crt-dzf   | create-day-zero-files     ) run_step_create_day_zero_files=$stepvalue     ;;
#			load-rd   | load-refdata              ) run_step_load_refdata=$stepvalue              ;;
#			crt-lkps  | create-lookups            ) run_step_create_lookups=$stepvalue            ;;
                        crt-icff  | create-day-zero-pm-files  ) run_step_create_day_zero_pm_files=$stepvalue     ;;
			
			* ) script_error "Unrecognized step: $step" && (( startup_errors++ )) ;;
		esac
	done
}

################################
# Configuration file variables #
################################

config_file=$( get_default_config_file ) # This will only return a value in dev

###########################
# Miscellaneous variables #
###########################

integer quiet_mode=0
integer debug_mode=0
integer skip_confirm=0
integer dry_run_only=0
#typeset refdata_dir=$( is_development_environment && get_sample_refdata_dir || print )
#typeset system_date=

##################################################
# Define boolean variables for the various steps #
##################################################

# Environmental Setup
integer run_step_set_test_flag=0
integer run_step_config_overrides=0
integer run_step_create_data_dirs=1
#integer run_step_delete_ab_queues=1
#integer run_step_create_ab_queues=1
#integer run_step_create_run_links=1

# Environmental Cleanup
#integer run_step_deploy_micrographs=1

# Database Schema Setup
#integer run_step_drop_schema=0
#integer run_step_install_schema=0

# Data Loading and Initialisation
integer run_step_create_day_zero_files=1
#integer run_step_load_refdata=0
#integer run_step_create_lookups=1

integer run_step_create_day_zero_pm_files=1

####################################
# Parse the command line arguments #
####################################

integer startup_errors=0
while [ $# -gt 0 ]; do
	case "$1" in
		-h|--h|-help|--help|-\?|--\?|-u|--u|-usage|--usage ) script_usage && script_exit $SCRIPT_ERROR ;;
		
		-q|--q|-quiet|--quiet        ) quiet_mode=1   ;;
		-v|--v|-verbose|--verbose    ) quiet_mode=0   ;;
		-debug|--debug               ) debug_mode=1   ;;
		-dry-run|--dry-run           ) dry_run_only=1 ;;
		-skip-confirm|--skip-confirm ) skip_confirm=1 ;;
		
		-config-file|--config-file )
			if [[ -z $2 || $2 = -* ]]
				then script_error "$1 must be followed by the full path to a configuration file"; (( ++startup_errors ))
				else config_file=$2; shift
			fi ;;
		
#		-rd|--rd|-refdata-dir|--refdata-dir )
#			if [[ -z $2 || $2 = -* ]]
#				then script_error "$1 must be followed by a directory holding reference data files to load"; (( ++startup_errors ))
#				else refdata_dir=$2; shift
#			fi ;;
		
#		-d|--d|-system-date|--system-date )
#			if [[ -z $2 || $2 = -* ]]
#				then script_error "$1 must be followed by the initial system date you would like to use"; (( ++startup_errors ))
#				else system_date=$2; shift
#			fi ;;
		
		-r|--r|-run|--run|-s|--s|-skip|--skip )
			run_or_skip=$( print - $1 | sed 's/-//g' )
			steplist=
			
			if   [[ ${run_or_skip} = r ]]; then run_or_skip=run
			elif [[ ${run_or_skip} = s ]]; then run_or_skip=skip
			fi
			
			until [[ -z $2 || $2 = -* ]]; do
				steplist="$steplist $2"
				shift
			done
			steplist=$( print $steplist | sed 's/,/ /g' | string_lrtrim )

			if [[ -z $steplist ]]
				then script_error "$1 must be followed by one or more steps to $run_or_skip" ; (( ++startup_errors ))
				else script_parse_step_arguments $run_or_skip "$steplist"
			fi ;;

		-run-*|--run-*|skip-*|--skip-* )
			run_or_skip=$( print - $1 | sed -e 's/^-*\(skip\|run\)-.*/\1/' )
			steplist=$(    print - $1 | sed -e 's/^-*\(skip\|run\)-//'     )

			script_parse_step_arguments $run_or_skip "$steplist" ;;
		
		* ) script_error "Unrecognised parameter: $1"
		    (( ++startup_errors )) ;;
	esac
	shift
done

# Setup logging
typeset     LOG_FILE_TIMESTAMP=$CLINICAL_SETUP_TIMESTAMP
typeset -rl LOG_FILE_PREFIX=$( basename ${0} | rev | cut -f2- -d. | rev | sed 's/-/_/g' )
typeset -rl LOG_FILE_NAME=${LOG_FILE_PREFIX}_${LOG_FILE_TIMESTAMP}_$$.log
typeset -r  LOG_FILE_FIFO=/tmp/$USER-$LOG_FILE_NAME.fifo
typeset -r  LOG_FILE=$CLINICAL_SETUP_LOGDIR/$LOG_FILE_NAME

# Clean up any leftover log fifos
rm -f /tmp/${USER}-${LOG_FILE_PREFIX}_*.log.fifo

# Decide where script output should go
if (( quiet_mode ))
	
	# In quiet mode, send all output to the log file
	then script_print "Running in quiet mode. Please find log file at:"
	     script_print "$LOG_FILE"
	     exec > $LOG_FILE 2>&1
	
	# Otherwise, hook the logfile up to standard output/error
	else mkfifo $LOG_FILE_FIFO
	     tee $LOG_FILE < $LOG_FILE_FIFO &
	     exec > $LOG_FILE_FIFO 2>&1
fi

# Turn on debugging if requested
if (( debug_mode )); then
	set -x
fi

# Show the parameters and some variables, if we are set 
script_show_parameters

# Validate that we have a config file and that it is valid
if [[ -z $config_file ]]; then
	print "ERROR: A configuration file is required!" && (( ++startup_errors ))
else
	validate_config_file $config_file || (( ++startup_errors ))
fi

# Validate the command line arguments
#if (( run_step_load_refdata )); then
#	if [[ -z $refdata_dir ]]; then
#		script_error "A source reference data directory is required when loading reference data"
#		(( ++startup_errors ))
#	
#	elif [[ ! -d $refdata_dir ]]; then
#		script_error "Reference data directory provided, but does not seem to be a directory"
#		script_print "  Refdata dir: $refdata_dir"
#		(( ++startup_errors ))
#	
#	elif ls $refdata_dir/*.csv > /dev/null 2>&1; then
#		true # Good stuff, we found a file
#	else
#		script_error "At least one reference data file is required, yet none could be found"
#		script_print "  Source refdata dir: $refdata_dir"
#		(( ++startup_errors ))
#	
#	fi
#fi

# Validate the system date parameter
#if (( run_step_init_system_date )); then
#	if [[ -z $system_date ]]; then
#		script_error "An initial system date is required when initialising the system date"
#		(( ++startup_errors ))
#	
#	# TODO - Code the validate_system_date function in setup-init.inc.ksh
#	#elif validate_system_date $system_date; then
#	#	script_error "Value provided for system date is not valid ($system_date)"
#	#	(( ++startup_errors ))
#	fi
#fi

# Abort if there were any startup errors
if (( startup_errors )); then
	script_error "Script startup error ($startup_errors total) - ABORTING!\n"
	script_print "You might want to get more info with: ${GREEN}\$AI_SETUP_BIN/iba-setup.ksh --help${PLAIN}"
	script_print ""
	
	script_exit $SCRIPT_ERROR
fi

# Was this a dry run?
if (( dry_run_only )); then
	script_print ""
	script_print "Having been provided with a suitable dry-run parameter, I've now decided to quit for now..."
	script_print ""
	
	script_exit $SCRIPT_ERROR
fi

# Confirm we should do it
if (( ! skip_confirm )); then
	script_print "${RED}## Please confirm the above details and then type YES to continue:${PLAIN} \c"
	read script_continue_confirm_acknowledgement
	[[ $script_continue_confirm_acknowledgement != YES && $script_continue_confirm_acknowledgement != yes ]] && { print "ABORTING!\n"; exit 0; }
	script_print ""
fi

#############################
### Run all enabled steps ###
#############################

integer     rc
typeset     stepdesc
typeset     filename
typeset -Z2 count

function script_exit_step_failed {
	typeset rc=$1
	typeset stepdesc="$2"
	
	script_log_critical "FAILED   --> $stepdesc"
	script_exit $rc
}

script_log_info "STARTING --> Clinical Environment Setup"

####################################################################################################

stepdesc="Set data directories test flag"
if (( ! run_step_set_test_flag ))
then script_log_info "SKIPPING --> $stepdesc"
else script_log_info "RUNNING  --> $stepdesc"
	
	$CLINICAL_SETUP/environment/set-test-flag.ksh --config-file $config_file || script_exit_step_failed $? "$stepdesc"
	script_log_info "FINISHED --> $stepdesc"
	
fi

####################################################################################################

stepdesc="Configure sandbox overrides"
if (( ! run_step_config_overrides ))
then script_log_info "SKIPPING --> $stepdesc"
else script_log_info "RUNNING  --> $stepdesc"
	
	$CLINICAL_SETUP/environment/configure-sandbox-overrides.ksh --config-file $config_file || script_exit_step_failed $? "$stepdesc"
	script_log_info "FINISHED --> $stepdesc"
	
fi

####################################################################################################

stepdesc="Create sandbox data directories"
if (( ! run_step_create_data_dirs ))
then script_log_info "SKIPPING --> $stepdesc"
else script_log_info "RUNNING  --> $stepdesc"
	
	$CLINICAL_SETUP/environment/create-data-directories.ksh --config-file $config_file || script_exit_step_failed $? "$stepdesc"
	script_log_info "FINISHED --> $stepdesc"
	
fi

####################################################################################################

#stepdesc="Delete the Ab Initio queues"
#if (( ! run_step_delete_ab_queues ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/environment/manage-ab-initio-queues.ksh --delete || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

#stepdesc="Create the Ab Initio queues"
#if (( ! run_step_create_ab_queues ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/environment/manage-ab-initio-queues.ksh --create || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

#stepdesc="Create run links"
#if (( ! run_step_create_run_links ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/environment/create-run-links.ksh || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

#stepdesc="Deploy micrographs"
#if (( ! run_step_deploy_micrographs ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#        
#        $CLINICAL_SETUP/environment/deploy-micrographs.ksh || script_exit_step_failed $? "$stepdesc"
#        script_log_info "FINISHED --> $stepdesc"
#        
#fi

####################################################################################################

#stepdesc="Drop all database schema objects"
#if (( ! run_step_drop_schema ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/schema/drop-all-schema-objects.ksh || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

#stepdesc="Install database schema"
#if (( ! run_step_install_schema ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/schema/install-schema.ksh || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

stepdesc="Create day zero files"
if (( ! run_step_create_day_zero_files ))
then script_log_info "SKIPPING --> $stepdesc"
else script_log_info "RUNNING  --> $stepdesc"
	
	$CLINICAL_SETUP/data/create-day-zero-files.ksh || script_exit_step_failed $? "$stepdesc"
	script_log_info "FINISHED --> $stepdesc"
	
fi

####################################################################################################

stepdesc="Create day zero pm files"
if (( ! run_step_create_day_zero_pm_files ))
then script_log_info "SKIPPING --> $stepdesc"
else script_log_info "RUNNING  --> $stepdesc"
	
	$CLINICAL_SETUP/data/create-day-zero-pm-files.ksh || script_exit_step_failed $? "$stepdesc"
	script_log_info "FINISHED --> $stepdesc"
	
fi

####################################################################################################

#stepdesc="Load reference data files"
#if (( ! run_step_load_refdata ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/data/load-refdata.ksh --refdata-dir $refdata_dir || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

#stepdesc="Create lookup files"
#if (( ! run_step_create_lookups ))
#then script_log_info "SKIPPING --> $stepdesc"
#else script_log_info "RUNNING  --> $stepdesc"
#	
#	$CLINICAL_SETUP/data/create-lookups.ksh || script_exit_step_failed $? "$stepdesc"
#	script_log_info "FINISHED --> $stepdesc"
#	
#fi

####################################################################################################

script_log_info "FINISHED --> Clinical Environment Setup"
script_print ""
exit 0

