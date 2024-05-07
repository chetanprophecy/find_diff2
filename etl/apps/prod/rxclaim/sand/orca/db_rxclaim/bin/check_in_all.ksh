#! /bin/ksh -e

#export AB_AIR_ROOT=/etl/var/eme/$AI_PHASE/tr
cd $DB_RXCLAIM_DML/..
echo "$AB_AIR_ROOT";
# There is new DML, so check it in.
air project import "$AI_RPATH/orca/db_rxclaim" -basedir . -files  dml/rxclaim*/*.*.dml pset/setup.*.pset pset/setup.table.*/setup.table.*.pset pset/setup.datasets.*/setup.datasets.*.pset sql/create.*/create.*.sql -auto-add -comment "Updated due to table DDL changes."

# Add this if there are staging tables:
#   sql/create.*/create.*.sql

