#! /bin/ksh -e

cd $DB_CCTA_DML/..

# There is new DML, so check it in.
air project import "$AI_RPATH/edw/db_ccta" -basedir . -files  dml/*/*.*.dml pset/setup.*.pset pset/setup.table.*/setup.table.*.pset pset/setup.datasets.*/setup.datasets.*.pset -auto-add -comment "Updated due to table DDL or Key changes."

# Add this if there are staging tables:
#   sql/create.*/create.*.sql
