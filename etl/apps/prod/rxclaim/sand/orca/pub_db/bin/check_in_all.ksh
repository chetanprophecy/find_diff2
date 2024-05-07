#! /bin/ksh -e

#export AB_AIR_ROOT=/etl/var/eme/$AI_PHASE/tr
echo "$AB_AIR_ROOT";
db_project_rpath=$1
basedir=$2
branch=$3
# There is new DML, so check it in.
air -branch $branch project import "$db_project_rpath" -basedir $basedir -files  $4 -auto-add -comment "Updated due to table DDL changes."        

