#/bin/bash

####  Parse User Input #####
if [ "$1" != "-SCHEMA" ] ;
then
  echo "Incorrect Paramater Usage"
  echo "Usage: new_schema.sh -SCHEMA <SCHEMA NAME UPPERCASE>"
  exit 1
else
  supper=$2
  sdowner=`echo $supper | tr '[:upper:]' '[:lower:]'`
fi

##############################################################################################

first_pset=`cd ../pset/; ls -al | grep -v drw | awk '{ print $9}' | grep datasets | head -1`
second_pset=`cd ../pset/; ls -al | grep -v drw | awk '{ print $9}' | grep table | head -1`
third_pset=`cd ../pset/; ls -al | grep -v drw | awk '{ print $9}' | grep schema | head -1`

cp ../pset/${first_pset} ../pset/setup.datasets.${sdowner}.pset
cp ../pset/${second_pset} ../pset/setup.table.${sdowner}.pset
cp ../pset/${third_pset} ../pset/setup.schema.${sdowner}.pset
chmod 774 ../pset/*${sdowner}*

##############################################################################################

emepath=`air sandbox info ../. | grep Project | awk '{ print $2}'`
dbproj=`echo ${emepath} | xargs -I {} basename {} | tr '[:lower:]' '[:upper:]' `

air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA_EME ${sdowner} 
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA -dependent AB_PARAMETER_ENV
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:eme '$'"${dbproj}_${supper}_SCHEMA_EME"
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:sandbox -dependent AI_PHASE
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:sandbox:dev ${sdowner}
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:sandbox:qa ${sdowner}
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:sandbox:uat ${sdowner}
air project parameter ${emepath} -export ${dbproj}_${supper}_SCHEMA:sandbox:prod '$'"${dbproj}_${supper}_SCHEMA_EME"

##############################################################################################

curr=`cd ../pset/; ls -al | grep -v drw | awk '{ print $9}' | grep datasets | head -1 | awk -F "." '{ print $3 }' | tr '[:lower:]' '[:upper:]'`
curr_lower=`echo $curr | tr '[:upper:]' '[:lower:]' `

perl -p -i -e "s/$curr/$supper/g" ../pset/setup.datasets.${sdowner}.pset
perl -p -i -e "s/$curr/$supper/g" ../pset/setup.table.${sdowner}.pset
perl -p -i -e "s/$curr/$supper/g" ../pset/setup.schema.${sdowner}.pset
perl -p -i -e "s/$curr_lower/$sdowner/g" ../pset/setup.schema.${sdowner}.pset

##############################################################################################

air project import ${emepath} -basedir ../ -auto-add
air project export ${emepath} -basedir ../
