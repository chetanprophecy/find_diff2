#! /bin/ksh -e

cd $DB_ORXCLAIM_DML/..
export AB_AIR_BRANCH=rxclaim_direct

# There is new DML, so check it in.
air project import "/Projects/orca/db_orxclaim" -basedir . -files  dml/*/*.*.dml pset/setup.*.pset pset/setup.table.*/setup.table.*.pset pset/setup.datasets.*/setup.datasets.*.pset sql/create.*/create.*.sql -auto-add -force -comment "Updated due to table DDL or Key changes." >> $AI_RUN/file.dat

# Add this if there are staging tables:
#   sql/create.*/create.*.sql
