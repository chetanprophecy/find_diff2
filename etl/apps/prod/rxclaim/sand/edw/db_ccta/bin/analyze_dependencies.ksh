#! /bin/ksh -e

# Remove any extra table datasets and update all others.

# To Test:
# Fails:
#   ./analyze_dependencies.ksh
# Returns 0 or more air rm commands and runs air project analyze_dependencies:
#   ksh -c "cd ..; . ./ab_project_setup.ksh .; $DB_CCTA_BIN/analyze_dependencies.ksh"

if [[ -z "$DB_CCTA_DML" ]]; then
  echo 'Error: Sandbox Parameters Missing.  Try setting them with "cd Project_Dir; . ./ab_project_setup.ksh .".' >&2
  echo "DB_CCTA_DML=$DB_CCTA_DML" >&2
  exit 1
fi

# Remove any left over datasets.
for t in $(air ls "$AI_RPATH/edw/db_ccta/tables/$DB_CCTA_DB_NAME_REPO" | grep dataset: | awk '{print $NF}'); do
  p="$(echo $t | sed -e 's/_sta*g[eing]*[.]/./' -e 's/_[iku]$//')" # Convert the table name into a pset name
  db="$(echo $p | cut -d . -f 1)"
  if [[ ! -f "$DB_CCTA_DML/../pset/setup.datasets.$db/setup.datasets.$p.pset" ]]; then
    echo air rm "$AI_RPATH/edw/db_ccta/tables/$DB_CCTA_DB_NAME_REPO/$t"
    air      rm "$AI_RPATH/edw/db_ccta/tables/$DB_CCTA_DB_NAME_REPO/$t"
  fi
done

# Update all related datasets.
air project analyze-dependencies "$AI_RPATH/edw/db_ccta" -all

# We would like to analyze the projects that include this DB, but we cannot reliably do that.  So we leave it up to them.
