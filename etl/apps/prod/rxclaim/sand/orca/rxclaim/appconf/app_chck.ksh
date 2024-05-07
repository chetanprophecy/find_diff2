for line in `find ./ -type f -name "*.appconf"`; do air -branch plm project import /Projects/orca/rxclaim -basedir /etl/apps/prod/rxclaim/sand/orca/rxclaim -files appconf/$line -noanalysis; done
