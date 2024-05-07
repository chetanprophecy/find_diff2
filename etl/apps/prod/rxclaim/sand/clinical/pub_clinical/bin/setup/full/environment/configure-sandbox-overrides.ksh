#!/bin/ksh
#
# /Projects/clinical/pub_clinical - $PUB_CLINICAL_BIN/setup/full/environment/configure-sandbox-overrides.ksh
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
print - "${YELLOW}Clinical Environmental Setup${PLAIN} --  Configure Sandbox Overrides"
print -          "------------------------------------------------------------"
print

# Define a usage function
function script_usage {
	print "Usage: $SCRIPT_NAME <parameters>"
	print
	print "Where <parameters> are one or more of the following:"
	print "    --config-file <config-file-full-path>   Full path to a config file to be read"
	print
}

# Read and validate the script arguments
config_file=$( get_default_config_file ) # This will only return a value in dev

integer startup_errors=0
while [ $# -gt 0 ]; do
	case "$1" in
		-h|--h|-help|--help|-\?|--\?|-u|--u|-usage|--usage ) script_usage && exit 1 ;;
		
		-config-file | --config-file )
			if [[ -z $2 || $2 = -* ]]
				then print "ERROR: $1 must be followed by the full path to a config file"; (( ++startup_errors ))
				else config_file=$2; shift
			fi ;;
		
		* ) print "Unrecognised parameter: $1" && (( ++startup_errors )) ;;
	esac
	shift
done

# Validate that we have a config file and that it is valid
if [[ -z $config_file ]]
	then print "ERROR: A configuration file is required!" && (( ++startup_errors ))
	else validate_config_file $config_file || (( ++startup_errors ))
fi

# Define some regexps
readonly CONFIG_VERSION_REGEX='^[ \t]*CONFIG VERSION[ \t]*|.*'
readonly OVERRIDE_VALUE_REGEX='^[ \t]*OVERRIDE VALUE[ \t]*|.*|.*|.*'

# Define the overrides config path and some regexps
readonly CONFIG_FILE_DIR=$( dirname $config_file )
readonly CONFIG_FILE_VERSION=$( get_config_value 'CONFIG VERSION' $config_file )
readonly CONFIG_TIMESTAMP="$( date '+%Y-%m-%d %H:%M:%S %Z (%a)' )"

if [[ -z $CONFIG_FILE_VERSION ]]; then
	print "ERROR: Could not get CONFIG VERSION from config file" && (( ++startup_errors ))
fi

if [[ -z $CONFIG_USER_PORT_PREFIX ]]; then
	print "ERROR: Could not get USER PORT PREFIX version from config file" && (( ++startup_errors ))
fi

# Abort if there were any startup errors
if (( startup_errors > 0 )); then
	print "Script startup error ($startup_errors total) - ABORTING!\n"
	script_usage
	exit 1
fi

# Prepare for configuring overrides
integer override_errors=0

# Set some static (sorta) override parms
#print "##"
#print "## Configuring Overrides: ${CYAN}required derived values${PLAIN}"
#print "##" 
#print

#typeset -A static_override_parms
#static_override_parms[pub_clinical:CLI_CONFIG_FILE]=\$CONFIG_FILE_DIR/$( basename $config_file )
#static_override_parms[pub_clinical:CLI_CONFIG_FILE_DIR]=$CONFIG_FILE_DIR
#static_override_parms[pub_clinical:CLI_CONFIG_FILE_VERSION]=$CONFIG_FILE_VERSION
#static_override_parms[pub_clinical:CLI_CONFIG_TIMESTAMP]=$CONFIG_TIMESTAMP

#for override in $( print ${!static_override_parms[*]} | sed 's| |\n|g' | sort ); do
#	override_project=$( print $override | cut -d: -f1 )
#	override_name=$(    print $override | cut -d: -f2 )
#	override_value=${static_override_parms[$override]}
#	override_sandbox=$( find_sandbox $override_project )
#	
#	printf "    %-42s = %s\n" "$override" "$override_value"
#	air sandbox parameter          \
#		-basedir $override_sandbox \
#		"${override_name}"         \
#		-dollar                    \
#		"${override_value}"
#	rc=$?
#	
#	if [[ $rc -ne 0 ]]; then
#		print -u2 "ERROR: Setting of override parameter failed: ${override_name}"
#		(( ++override_errors ))
#	fi
#done
#print

# Loop through the projects for which we have overrides configured
print "##"
print "## Configuring Overrides: ${CYAN}$config_file${PLAIN}"
print "##" 
print

typeset -A projects_done
for override_project in $( cat $config_file | grep "$OVERRIDE_VALUE_REGEX" | cut -d'|' -f2 | string_lrtrim | uniq ); do

	# Check if we have already done this project
	[[ ! -z ${projects_done[$override_project]} ]] && continue
	
	# Otherwise mark it done and fine the sandbox
	projects_done[$override_project]=done
	override_sandbox=$( find_sandbox $override_project )
	
	# Loop through the overrides for this sandbox
	print "Sandbox: ${YELLOW}$override_sandbox${PLAIN}"
	
	cat $config_file | grep '^[ \t]*OVERRIDE VALUE[ \t]*|[ \t]*'$override_project'[ \t]*|.*' | while read cfg_line; do
		override_value=$( eval print - $(print - $cfg_line | cut -d'|' -f4 | string_lrtrim) )
		override_name_raw=$(print - $cfg_line | cut -d'|' -f3 | string_lrtrim)
		override_name=$override_name_raw
		override_user=
		override_base_project=
		override_base_sandbox=
		
		# If we have an override user, grab and check it
		if [[ $override_name = *:* ]]; then
			override_name_orig=$override_name
			override_user=${override_name_orig%%:*}
			override_name=${override_name_orig#*:}
			
			# Skip this one if it is not for the current user
			[[ $override_user != $USER ]] && continue
		fi
		
		# If we have a base override project, grab it and then get the path
		if [[ $override_name = *@* ]]; then
			override_name_orig=$override_name
			override_name=${override_name_orig%%@*}
			override_base_project=${override_name_orig#*@}
				
			# Attempt to get the base override sandbox path
			override_base_sandbox=$( find_sandbox $override_base_project )
			
			# If we couldn't get the path, print an error and abort
			if [[ -z $override_base_sandbox ]]; then
				print -u2 "ERROR: Override parameter cannot be processed: $override_name_raw"
				print -u2 "ERROR: Sandbox cannot be found for base project: $override_base_project"
				(( ++override_errors ))
				continue
			fi
		fi
		
		# Print out the override name and value (TODO: Add the user and project to this maybe?)
		printf "    %-42s = %s\n" "$override_name" "$override_value"
		
		# Actually perform the override
		if [[ -n $override_base_project ]]; then
			air sandbox parameter                           \
				-basedir $override_base_sandbox             \
				-path    $override_sandbox                  \
				"${override_name}@${override_base_project}" \
				"${override_value}"
			rc=$?
			
			if [[ $rc -ne 0 ]]; then
				print -u2 "ERROR: Setting of override parameter failed: ${override_name}@${override_base_project}"
				(( ++override_errors ))
			fi
		else
			air sandbox parameter          \
				-basedir $override_sandbox \
				"${override_name}"         \
				"${override_value}"
			rc=$?
			
			if [[ $rc -ne 0 ]]; then
				print -u2 "ERROR: Setting of override parameter failed: ${override_name}"
				(( ++override_errors ))
			fi
		fi
		
	done
	
	# Add some space
	print

done

if   (( override_errors == 1 )); then print "ERROR: Problem setting $override_errors sandbox override"  && exit 1
elif (( override_errors  > 1 )); then print "ERROR: Problem setting $override_errors sandbox overrides" && exit 1
fi

print "Configuration of sandbox overrides complete"
print 

exit

