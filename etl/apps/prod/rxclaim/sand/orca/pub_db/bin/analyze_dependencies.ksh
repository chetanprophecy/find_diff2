#! /bin/ksh -e

# Remove any extra table datasets and update all others.

# To Test:
# Fails:
#   ./analyze_dependencies.ksh
# Returns 0 or more air rm commands and runs air project analyze_dependencies:
#   ksh -c "cd ..; . ./ab_project_setup.ksh .; $DB_RXCLAIM_BIN/analyze_dependencies.ksh"



# Remove any left over datasets.
for t in $(air -branch $1 ls "$2/tables/$3" | grep dataset: | awk '{print $NF}'); do
  p="$(echo $t | sed -e 's/_sta*g[eing]*[.]/./' -e 's/_[iu]$//')" # Convert the table name into a pset name
  db="$(echo $p | cut -d . -f 1)"
  if [[ ! -f "$4/../pset/setup.datasets.$db/setup.datasets.$p.pset" ]]; then
    echo air -branch $1 rm "$2/tables/$3/$t"
         air -branch $1 rm "$2/tables/$3/$t"
  fi
done

# Update all related datasets.
air -branch $1 project analyze-dependencies "$2" -files $5

# We would like to analyze the projects that include this DB, but we cannot reliably do that.  So we leave it up to them.
