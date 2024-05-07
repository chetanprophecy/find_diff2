#!/bin/ksh -e
# Pass path of Private pset directory as first argument to this script
#eg. script /app01/abinitio/ab_appconf_root_dir.datahub/main/users/msingh/edw/datahub/pset/create_data_source.pset
#This KSH will create 3 psets in private pset directory
#eg of script call:  setup_dhub_intermediate_psets.ksh /app01/abinitio/ab_appconf_root_dir.datahub/main/users/msingh/edw/datahub/pset
export AI_PSET=$1

echo '!prototype|P|||$PUB_DATAHUB_MP/create_data_source.mp
analysis_level|Pl|||none
AI_DML||||$AI_DML
AI_SERIAL||||$AI_SERIAL
AI_SERIAL_TEMP||||$AI_SERIAL_TEMP
AI_MFS_TEMP||||$AI_MFS_TEMP
AI_MFS||||$AI_MFS
AI_SERIAL_LOOKUP||||$AI_SERIAL_LOOKUP
AI_MFS_LOOKUP||||$AI_MFS_LOOKUP
AI_SERIAL_LOG||||$AI_SERIAL_LOG ' > $AI_PSET/create_data_source.pset

echo '!prototype|P|||$PUB_DATAHUB_MP/enrich.mp
analysis_level|Pl|||none
AI_DML||||$AI_DML
AI_MFS_PENDING||||$AI_MFS_PENDING
AI_SERIAL_PENDING||||$AI_SERIAL_PENDING
AI_SERIAL_TEMP||||$AI_SERIAL_TEMP
AI_MFS_TEMP||||$AI_MFS_TEMP
AI_SERIAL_LOOKUP||||$AI_SERIAL_LOOKUP
AI_MFS_REJECT||||$AI_MFS_REJECT
AI_SERIAL_REJECT||||$AI_SERIAL_REJECT
AI_SERIAL_LOG||||$AI_SERIAL_LOG
AI_XFR||||$AI_XFR
AI_CAT||||$AI_CAT ' > $AI_PSET/enrich.pset

echo '!prototype|P|||$PUB_DATAHUB_MP/unload.mp
analysis_level|Pl|||none
AI_DML||||$AI_DML
AI_SERIAL||||$AI_SERIAL
AI_SERIAL_LOG||||$AI_SERIAL_LOG
AI_MFS_PENDING||||$AI_MFS_PENDING
AI_SERIAL_PENDING||||$AI_SERIAL_PENDING
DB_RX_TRACK_REMOTE_MFS||||$DB_RX_TRACK_REMOTE_MFS
AI_SERIAL_LOOKUP||||$AI_SERIAL_LOOKUP' > $AI_PSET/unload.pset



