@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|971|rel_count|1735|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|RUN_ID||3|9|RFK|@{0|}}
{30001002|XXparameter|LOAD_REJECT_LIMIT|0|3|9|RFK|The number of rejected records to allow before checking the Load Reject Ramp for failure.|{0|}}
{30001002|XXparameter|LOAD_REJECT_RAMP|0|3|9|RFK|0.###: The rate of rejected records (after the Load Reject Limit) to allow.  If this rate is exceeded, then the load graph will fail.  Defaults to a project setting.|{0|}}
{30001002|XXparameter|APP_NM|rxclaim|3|9|FK|This value should be defined in intermediate parameter|{0|}}
{30001002|XXparameter|DO_DATA_VALIDATION|True|13|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_NAME|ids_rxclaim.f_claim_transaction|3|9|FK|The name of the target table to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RK|The cananonical form of the full "logical" target table name.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|SOURCE_ENTITY|$[ re_replace(SOURCE_LOWER, ".*[.]", "") ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|SUBJECT_AREA|$[ string_downcase(string_split(SOURCE_NAME,".")[0]) ]|3|9|K|Subject area defined as per IDS|{0|}}
{30001002|XXparameter|FACT_DATA_PARTITION_KEY|ids_file_dt|3|9|RFK|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_DRIVING_MASK|split|3|9|EFK|This parameter will decide that ,this is a placeholder file or split file|{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK|True|13|9|FK|@{0|}}
{30001002|XXparameter|CDC_FLAG_RECORD_TYPE|$[
begin

let string("") cdc_flag_rec_type = 'record
  unsigned integer(1) flag=0;
  decimal("\\\\x01") src_env_rank=0;
   decimal("\\\\x01") sort_file_date=0;
end';

for(let field in record_info(read_file("$PUB_DXF_DML/dxf_header.dml")))
if(field.name == "dxf_src_rec_cnt") cdc_flag_rec_type = add_fields(cdc_flag_rec_type, [vector field]);

result ::  cdc_flag_rec_type;

end
]|3|9|K|These columns are added into target dml for some intermediate data processing needs|{0|}}
{30001002|XXparameter|ILM_NAME|f_claim_transaction|3|9|FK|This will be subdirectory under which all DML and data will be present in datahub location|{0|}}
{30001002|XXparameter|NATURAL_KEY|$[get_ids_table_nk(SOURCE_LOWER)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|IDS_TABLE_TYPE|fact|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_NAME|ids_rxclaim.f_claim_transaction_new|3|9|FK|The name of the target table to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RK|The cananonical form of the full "logical" target table name.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_LOWER, ".*[.]", "") ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|IDS_META_STRING|$[SUBJECT_AREA + "." + TARGET_ENTITY]|3|9|K|This string will be used to get value from ids meta property file|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_META_STRING)]|3|9|EFK|@{0|}}
{30001002|XXparameter|SPLIT_DML_FILE|$[AI_DML +"/split." +SUBJECT_AREA + "/split." +SUBJECT_AREA+"." + TARGET_ENTITY + ".dml"]|3|9|K|Split DML file|{0|}}
{30001002|XXparameter|SPLIT_DML|$[read_file(SPLIT_DML_FILE)]|3|9|RK|The record format of the shred.|{0|}}
{30001002|XXparameter|SPLIT_IDS_NK_DML|$[
if(IS_IDS_DML_WITH_NK)
read_type(PUB_DATAHUB_DML +"/nk/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + ".split_" + SOURCE_ENTITY + ".dml") 
else 
read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + SOURCE_ENTITY + ".dml")
]|3|9|RK|@{0|}}
{30001002|XXparameter|SPLIT_IDS_NK_INTER_DML|$[join_types(SPLIT_IDS_NK_DML,CDC_FLAG_RECORD_TYPE)]|3|9|K|@{0|}}
{30001002|XXparameter|SPLIT_FILES_VEC|AB_PARAMETER_ENV|3|10|RKd|A vector of shred file names that match both the ILM pattern and the "logical" target table name.|{0|}}
{30001002|XXparameter|INPUT_FILE_STRING|$[string_join(SPLIT_FILES_VEC,"\|")]|3|9|EK|@{0|}}
{30001002|XXparameter|IDS_START_DT||3|9|RFK|Value in YYYYMMDD format|{0|}}
{30001002|XXparameter|IDS_END_DT||43|9|RFK|Value in YYYYMMDD format|{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[
begin
result :: switch(string_downcase(IDS_TABLE_TYPE))
  case "fact": string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA, "/many");
    case "dimension", "reference_dynamic", "reference_static": string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA, "/one");
end;
end
]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_FILES_VEC|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|CLI_TARGET_DML|$[ 
   if(IS_IDS_DML_WITH_NK)
        //PUB_DATAHUB_DML + "/nk/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + SOURCE_ENTITY + ".dml" // With NK
        PUB_DATAHUB_DML + "/" +SUBJECT_AREA +  "/prev/" + SUBJECT_AREA  + "." + SOURCE_ENTITY + ".dml" // Without NK
   else
        PUB_DATAHUB_DML + "/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + SOURCE_ENTITY + ".dml"
]|3|9|RFK|@{0|}}
{30001002|XXparameter|ORCHARD_TARGET_DML|$[PUB_DATAHUB_DML + "/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + ".f_claims_detail.dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|OLR_TARGET_DML|$[PUB_DATAHUB_DML + "/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + ".ft_claims_detail.dml"]|3|9|RFK|@{0|}}
{30001002|XXparameter|IDS_MAP_XFR_HINT|AB_PARAMETER_ENV|3|10|Kd|This parameter will get xfr hint by reading split file and deriving output type|{0|}}
{30001002|XXparameter|SPLIT_ICFF_FILE|$[IDS_DATA_PATH + "/split." + SOURCE_ENTITY + "." + (string(""))(date("YYYYMMDD")) (datetime("YYYYMMDDHH24MISS"))RUN_ID+  ".dat.gz"  ]|3|9|K|Main ICFF file - Xref  data file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|SPLIT_ICFF_INDEX_FILE|$[string_replace(SPLIT_ICFF_FILE,".dat.gz" ,".idx") ]|3|9|K|MAIN ICFF index file - Xref index file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|TARGET_NK_DML_FILE|$[
if(IS_IDS_DML_WITH_NK)
PUB_DATAHUB_DML +"/nk/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml"
else 
PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml"
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_NK_DML|$[
if(IS_IDS_DML_WITH_NK)
read_type(PUB_DATAHUB_DML +"/nk/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml") 
else 
read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml")
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml") ]|3|9|RK|The DML for the target dataset.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|IDS_MAP_XFR_HINT:eme|in.*|3|9||@{0|}}
{30001002|XXparameter|IDS_MAP_XFR_HINT:sandbox|$[begin
//This DML will read all type info and will derive IDS map xfr .
let dml_package_info current_dml_info;
let int i=0;
let int vec_length=0;
let int type_vec_length=0;
let string("") matching_line="";
let string("") matching_type="";
let string(",")[decimal(3)] all_type_info=allocate_with_defaults();
current_dml_info = package_info(SPLIT_DML) ;
vec_length=length_of(current_dml_info.members);
if ( vec_length > 1) 
 begin
 matching_line=current_dml_info.members[vec_length - 1 ].dml_type;
 all_type_info=first_without_error(string_split_no_empty(matching_line,"\\n"),allocate_with_defaults());
 type_vec_length=length_of(all_type_info);
    for (i, i < type_vec_length)
         begin block match_found
           if ( (starts_with(string_lrtrim(all_type_info[i]),"split_")))    
             matching_type= all_type_info[i];
         exit match_found ; 
         end block match_found 
 end
result :: if(vec_length == 1 or type_vec_length == 0) "in" else string_concat("in." ,string_filter_out(string_split_no_empty(string_lrtrim(matching_type)," ")[1],";")) ;
end;
]|3|9||@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|SPLIT_FILES_VEC:eme|$[ [vector AI_MFS + "/split/"  + INPUT_FILE_DRIVING_MASK + ".\{ILM\}." + SUBJECT_AREA + "." + TARGET_ENTITY + ".\{RUN_ID\}.dat.gz" ]]|3|9||@{0|}}
{30001002|XXparameter|SPLIT_FILES_VEC:sandbox|$[ //Initialized default run_id value for developement and unit testing 
//In production a unique run_id value will be passed via top level run all plan
begin
  let split_dir = AI_MFS + "/" + INPUT_FILE_DRIVING_MASK ;
  let string("") v_run_id= if( RUN_ID == "0" ) "??????????????" else  RUN_ID ;
  let pattern = if (INPUT_FILE_DRIVING_MASK == "split") string_concat(INPUT_FILE_DRIVING_MASK ,".*"  ,"." ,  SUBJECT_AREA , "." , TARGET_ENTITY , "." , v_run_id , ".dat.gz")
                else string_concat("placeholder.*.*.*.",SUBJECT_AREA,".",TARGET_ENTITY,".",v_run_id,".dat.gz") ;
  let file_name_vec = directory_listing(split_dir, pattern);
  if ( length_of(file_name_vec) == 0  )
    ""; //force_error( string_concat( "No ",INPUT_FILE_DRIVING_MASK ," files found" , ": Target Table: " ,  TARGET_ENTITY , ", Pattern:\\n" , split_dir + "/" , pattern));
  result :: file_name_vec;
end
]|3|9||@{0|}}
{30001002|XXparameter|IDS_FILES_VEC:eme|$[ [vector  IDS_DATA_PATH + "/" + SOURCE_ENTITY + ".\{RUN_ID\}.dat.gz"] ]|3|9||@{0|}}
{30001002|XXparameter|IDS_FILES_VEC:sandbox|$[
begin
let date("YYYYMMDD") ids_start_dt = IDS_START_DT;
let date("YYYYMMDD") ids_end_dt = IDS_END_DT;

let string("")[int] files_vec = [vector];

switch(IDS_TABLE_TYPE)
  case "fact":
  begin
    files_vec = for(let file in directory_listing(IDS_DATA_PATH, SOURCE_ENTITY + ".????????.dat.gz")) : if( re_get_match(file, "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]") >= ids_start_dt && re_get_match(file, "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]") <= ids_end_dt ) IDS_DATA_PATH + "/" + file;
  end
  case "dimension", "reference_dynamic", "reference_static":
  begin
    files_vec = [vector IDS_DATA_PATH + "/" + SOURCE_ENTITY + ".dat.gz"];
  end
end

result :: files_vec;

end
]|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_FILE_TYPE|INSERT|15|9|RFK|@{2|INSERT|UPDATE|}}
{30001002|XXparameter|INSERT_FILE|AB_PARAMETER_ENV|3|10|Kd|Insert file for distribution event|{0|}}
{30001002|XXparameter|INSERT_FILE:eme|$[ if(OUTPUT_FILE_TYPE == "INSERT") 
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.\{RUN_ID\}.dat.gz")
   else
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",SOURCE_ENTITY,".insert.\{RUN_ID\}.dat.gz");
]|3|9||@{0|}}
{30001002|XXparameter|INSERT_FILE:sandbox|$[
   if(OUTPUT_FILE_TYPE == "INSERT")
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.",RUN_ID,".dat.gz")
   else
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",SOURCE_ENTITY,".insert.",RUN_ID,".dat.gz");
]|3|9||@{0|}}
{30001002|XXparameter|UPDATE_FILE|AB_PARAMETER_ENV|3|10|Kd|Update file for distribution event|{0|}}
{30001002|XXparameter|UPDATE_FILE:eme|$[
    if(OUTPUT_FILE_TYPE == "INSERT")
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,TARGET_ENTITY,".update.\{RUN_ID\}.dat.gz")
else
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,SOURCE_ENTITY,".update.\{RUN_ID\}.dat.gz");
]|3|9||@{0|}}
{30001002|XXparameter|UPDATE_FILE:sandbox|$[
    if(OUTPUT_FILE_TYPE == "INSERT")
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,TARGET_ENTITY,".update.",RUN_ID,".dat.gz")
else
        string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,SOURCE_ENTITY,".update.",RUN_ID,".dat.gz");
]|3|9||@{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$[
    if(OUTPUT_FILE_TYPE == "INSERT")
        string_concat(PUB_DATAHUB_SERIAL ,"/event_log/event_log.",SUBJECT_AREA,".", TARGET_ENTITY , ".dat")
else
        string_concat(PUB_DATAHUB_SERIAL ,"/event_log/event_log.",SUBJECT_AREA,".", SOURCE_ENTITY , ".dat");
]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|ETL_APP_ID|AB_PARAMETER_ENV|3|10|Kd|ETL(Unix) Id that was used to run this process|{0|}}
{30001002|XXparameter|ETL_APP_ID:eme||3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|ORCHARD_FLAG|1|3|9|RFK|@{0|}}
{30001002|XXparameter|HASH_RECORD|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = hash_key_combine_type;|7|9|K|Value will come from generic_data_types.dml file defined in PUB_DXF_DML location|{0|}}
{30001002|XXparameter|XREF_LOOKUP_TYPE_DML|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|7|9|RK|@{0|}}
{30001002|XXparameter|XREF_KEY_FILE_DML|$[
join_types(HASH_RECORD,'record\\n integer(8) dxf_sk=0;  \\n end')]|7|9|K|DML for universal dim xref file|{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE|$[ string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat.gz")]|3|9|K|key file location used in fact key lookup process|{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".idx")]|3|9|K|Index file for fact key lookup process|{0|}}
{30001002|XXparameter|IS_WRITE_MFS_XREF_ICFF|$[if(get_ids_table_properties(IDS_META_STRING).storage_type=="icff") "Y" else "N" ]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|IS_SUPPRESS_UPDATE_FOR_HIST|1|13|9|RFK|This parameter if true, will supress any updates |{2|N|Y|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|f_clm_hist_fix|spulikon|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|3820000|1332000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{5|0|0|0|0|0|}Job 'f_clm_hist_fix' Execution Status Report


Job "f_clm_hist_fix" Execution started at Wednesday, August 30, 2017 09:02:37
Job completed successfully at Wednesday, August 30, 2017 09:04:26

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:01:48
Run performed by user spulikon
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 298 seconds
Average CPU utilization across all nodes: 0.00 percent
||##Check processed directory exist : AI_MFS/placeholder/processed 
if [ ! -d "$AI_MFS/split/processed" ]; then
  m_mkdir "$AI_MFS/split/processed"
fi

if [[ -f "$INSERT_FILE" \|\| -f "$UPDATE_FILE" ]] ; then
  echo "+++++++++++++++++++++++++++++++++"
  echo "ERROR: Either or both event files such as "
  echo "mfile:$INSERT_FILE (or)"
  echo "mfile:$UPDATE_FILE "
  echo "are present. This is not expected hence graph is failng."
  echo "Either use different RUN_ID (or) rename the exisitng event files to diffrent file name to proceed with the run again."
  echo "+++++++++++++++++++++++++++++++++"
  exit 1
fi

export AB_REPORT="summary=$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$TARGET_LOWER.summary.log $AB_REPORT"
|if [ $mpjret -eq 0 ]
then      
        for i in $( echo $INPUT_FILE_STRING \| tr "\|" " " ); do  
                m_mv "$AI_MFS/$INPUT_FILE_DRIVING_MASK/$i" "$AI_MFS/$INPUT_FILE_DRIVING_MASK/processed/$i" 
        done;

           cd $IDS_DATA_PATH
           echo " Inside $IDS_DATA_PATH "
	   check_updated_file_count=`find ./ -type f ! -name "$\{TARGET_LOWER\}.*" ! -perm 775 \| wc -l`
           echo updated file count : $check_updated_file_count
	 	 if [ $check_updated_file_count -gt 100 ]
                 then
                        m_chmod  775 *
                        # do not m_chmod if no file is present 
                elif [ $check_updated_file_count -gt 0 ]
                then
                        echo " running individul file permission commands for $i"
                        find ./ -type f ! -name '.*' ! -perm 764 \| xargs -I \{\} m_chmod 775 \{\}
                else 
                        echo " No FACT file is updated today "
                fi
else
        echo "Graph Failed"
fi   
|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Overlay Field values from SPLIT 
IDS into new IDS format along
 with values from CLI IDS.|723000|466000|0|0|0|0|17039|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Populate following from respective lkps
1. day_90_prog_type
2. pdt_cost_type_unit_cost|2366000|723000|0|0|0|0|16689|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}17368|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}17280|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}17324|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}17323|529|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}17096|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}17285|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|1.0|.5|{0|}17283|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}17310|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}17250|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}17305|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}17362|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}17281|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.9660493731498718|{0|}17329|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.16470588743686676|{0|}17371|531|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}17277|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}17317|17|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}17364|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}17049|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}17174|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}17330|17|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}17113|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}17279|17|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}17282|17|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}17322|17|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.31658291816711426|{0|}17331|17|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}17100|17|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}17306|20|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}17315|17|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|2.2123893722891808e-3|{0|}17316|17|}}
{2010210004|XXGflow|38|0|75|0|{@{}@384|.5|.5|{0|}17256|17|}}
{2010210004|XXGflow|39|0|77|0|{@{}@384|.5|.5|{0|}17327|17|}}
{2010210004|XXGflow|40|0|79|0|{@{}@384|.5|.5|{0|}17276|17|}}
{2010210004|XXGflow|41|0|81|0|{@{}@384|.5|.19858156144618988|{0|}17326|17|}}
{2010210004|XXGflow|42|0|83|0|{@{}@384|.5|.5|{0|}17366|17|}}
{2010210004|XXGflow|43|0|85|0|{@{}@384|.5|.5|{0|}17325|17|}}
{2010210004|XXGflow|44|0|87|0|{@{}@384|.5|.5|{0|}17092|17|}}
{2010503005|XXGfvertex|45|0|89|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_ctrx.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_ctrx.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@2|@1354000|766500|0|0|0|0|17175|CTRX Data|Ab Initio Software|@1|50|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|46|0|91|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|47|0|94|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|48|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||3|8|RFK=|@{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|49|0|99|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;

  decimal("\\x01",0)      claim_nbr = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)      claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
  decimal("\\x01",0)      claim_seq_nbr_src = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;

  decimal("\\x01",0)      adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)      specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      zero_balance_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)      tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      awp_unit_cost_ind = NULL("") /*CHAR(1)*/;

  string("\\x01",charset="iso-8859-15", maximum_length=1)       day_90_prog_type = NULL("") /*CHAR(1)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)       pdt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  date("YYYYMMDD")("\\x01")       filled_dt = NULL("") /*DATE*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT NOT NULL*/;

  record
    string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  end prod;

  decimal("\\x01",maximum_length=1)  is_match = 0;
  string("\\x01", maximum_length=1)  join_match_ind_1 = 'N';
  string("\\x01", maximum_length=1)  join_match_ind_2 = 'N';
  string("\\x01", maximum_length=1)  join_match_ind_3 = 'N';
  decimal("")  partition_nbr;
  decimal("")  record_nbr;
  string(1)  newline = "\\n";
end|3|9||@{0|}}
{30001002|XXparameter|output_index|/*Function returning index of output port*/
out::output_index(in)=
begin
  out :: if(in.src_env_sk member [vector 480, 490]) 0 else 1;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|record
  unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
  unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;

  decimal("\\x01",0)      claim_nbr = NULL("") /*BIGINT NOT NULL*/;
  decimal("\\x01",0)      claim_seq_nbr = NULL("") /*INTEGER NOT NULL*/;
  decimal("\\x01",0)      claim_seq_nbr_src = NULL("") /*INTEGER*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      claim_stat_id = NULL("") /*CHAR(1) NOT NULL*/;

  decimal("\\x01",0)      adj_rxcount_rxsol_mail_srvc = NULL("") /*INTEGER*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_adjustment = NULL("") /*DECIMAL(13,5)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)      awp_unit_published = NULL("") /*DECIMAL(13,5)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_category_code = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      generic_mnftr_cnt = NULL("") /*SMALLINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      co_insurance_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      non_prf_drug_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      brand_prf_patient_pay_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_carrier_subm_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      cob_primary_claim_type_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_primary_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_primary_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      client_cost_tier_amt = NULL("") /*VARCHAR(2)*/;
  decimal("\\x01",0)      specialty_drug_prg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_drug_prg_mbr_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      specialty_drug_prg_pharm_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      adherence_incnt_prg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01",0)      adherence_incnt_reduction_ind = NULL("") /*BYTEINT*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      adherence_incnt_reduction_amt = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01",0)      drug_reserved_elg_ind = NULL("") /*BYTEINT*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      drug_reserved_member_elg_ind = NULL("") /*CHAR(1)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_base_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      plan_sponsor_supl_share_amt = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      supl_consumer_num = NULL("") /*DECIMAL(7,2)*/;
  decimal("\\x01".2, maximum_length=9, sign_reserved)      min_copay_amt = NULL("") /*DECIMAL(7,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      consumer_directed_health_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      specialty_network_prg_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      ingredient_cost_code = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01",0)      compund_ingredient_comp_cnt = NULL("") /*INTEGER*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      ndc_diff_price_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      insulin_plan_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      cob_second_payer_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      cob_second_payer_paid_amt = NULL("") /*DECIMAL(9,2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=2)      ncpdp_reject_version_code = NULL("") /*VARCHAR(2)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      low_day_supl_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      zero_balance_ind = NULL("") /*CHAR(1)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      client_mac_id = NULL("") /*VARCHAR(10)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=10)      pharmacy_mac_id = NULL("") /*VARCHAR(10)*/;
  decimal("\\x01".2, maximum_length=11, sign_reserved)      client_contract_dis_fee = NULL("") /*DECIMAL(9,2)*/;
  decimal("\\x01".8, maximum_length=26, sign_reserved)      tot_publish_awp_amt = NULL("") /*DECIMAL(24,8)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      clt_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  decimal("\\x01".4, maximum_length=17, sign_reserved)      app_awp_discount_rate = NULL("") /*DECIMAL(15,4)*/;
  string("\\x01",charset="iso-8859-15", maximum_length=1)      awp_unit_cost_ind = NULL("") /*CHAR(1)*/;

  string("\\x01",charset="iso-8859-15", maximum_length=1)       day_90_prog_type = NULL("") /*CHAR(1)*/;
  decimal("\\x01".5, maximum_length=15, sign_reserved)       pdt_cost_type_unit_cost = NULL("") /*DECIMAL(13,5)*/;
  date("YYYYMMDD")("\\x01")       filled_dt = NULL("") /*DATE*/;
  decimal("\\x01",0)   src_env_sk = NULL("") /*BIGINT NOT NULL*/;

  record
    string("\\x01",charset="iso-8859-15", maximum_length=20)   prod_id = NULL("") /*VARCHAR(20)*/;
    string("\\x01",charset="iso-8859-15", maximum_length=2)   prod_id_qlfr_cd = NULL("") /*VARCHAR(2)*/;
  end prod;

  decimal("\\x01",maximum_length=1)  is_match = 0;
  string("\\x01", maximum_length=1)  join_match_ind_1 = 'N';
  string("\\x01", maximum_length=1)  join_match_ind_2 = 'N';
  string("\\x01", maximum_length=1)  join_match_ind_3 = 'N';
  decimal("")  partition_nbr;
  decimal("")  record_nbr;
  string(1)  newline = "\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|1158000|320000|0|0|0|0|17332|RFMT: Split fields and partition and record numbers|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|50|0|101|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|51|0|104|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|52|0|107|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|53|0|109|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|54|0|111|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|55|0|113|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|56|0|115|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|117|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|58|0|120|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|59|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|60|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|61|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|62|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|63|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|64|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|65|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|66|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|67|0|148|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_orx.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_orx.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@2|@1441000|772000|0|0|0|0|16680|ORX Data|Ab Initio Software|@1|50|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|68|0|150|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|69|0|153|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|70|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|71|0|159|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let string("") datafile = "' + SPLIT_ICFF_FILE + '";
let string("") indexfile=this_partition_path("' + SPLIT_ICFF_INDEX_FILE + '");
type lookup_record_type = ' + SPLIT_IDS_NK_DML + ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  let decimal("") match_flg=0;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "SPLIT_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "SPLIT_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "SPLIT_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "SPLIT_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"SPLIT_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
  match_flg =     if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1;   
  
  out.is_match      ::  match_flg;  
  out.(*, name member [vector "claim_nbr", "claim_seq_nbr", "claim_stat_id", "src_env_sk", "dxf_sk", "dxf_hk_part1", "dxf_hk_part2", "dxf_src_sys_id", "ids_create_dttm", "ids_create_uid", "ids_create_run_id", "ids_updt_dttm", "ids_updt_uid", "ids_updt_run_id", "ids_rec_stat_cd"]) :1: in.*;
  out.ids_file_dt  :1: (date("YYYYMMDD")) re_get_match(in.filename, "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]");
  
  out.*             :2: if(match_flg == 1) exact_record_value.*;  // Copies IDW R2, R3 changes, CLI corrections, New NKs and NK values of all FSKs 
  out.partition_nbr :: this_partition();
  out.record_nbr    :: invocation_number();
  out.*             :: in.* ; // Copied values from CLI file that are not modified.
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$[
begin
let v_join_output_dml = remove_fields(TARGET_NK_DML,[vector "newline"]);
result :: join_types(v_join_output_dml , 'record\\n  decimal("\\\\x01",maximum_length=1) is_match=0;\\n  decimal("") partition_nbr;\\n  decimal("") record_nbr;\\n  string(1) newline="\\n";\\n  end');
end
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|745000|341500|0|0|0|0|17278|Unload and assign from SPLIT IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|161|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|73|0|164|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|74|0|166|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|75|0|168|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|76|0|170|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|173|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|78|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|79|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|80|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|81|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|82|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|83|0|191|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@1|@1095000|219500|0|0|0|0|17050|Overlayed SPLIT IDS file|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|84|0|193|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|85|0|196|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|86|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|87|0|202|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$[join_types(remove_fields(read_type(TARGET_NK_DML_FILE), "newline"), 'record\\n  string("\\\\x01") filename;\\n  string(1) newline = \\"\\\\n\\";end')]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|466000|332000|0|0|0|0|17222|Realign from CLI format to f_clm_txn_new format|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|204|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|89|0|207|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|90|0|209|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|91|0|211|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|213|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|93|0|216|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|94|0|218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|95|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|96|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|97|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|98|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|99|0|235|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|$[
begin

result :: 'type input_type =\\n' + read_type(CLI_TARGET_DML) + ';

filename::get_filename(in)=
begin
filename :: this_partition_path(in.filename);
end;

out :: reformat(read, filename, in) =
begin
  out.filename :: filename;
  out.* :: read.*;
end;

out :: final_log_output() = 
begin 
   out.event_type :: "Summary"; 
   out.event_text :: "' + string_join(IDS_FILES_VEC,"\\n") + '"; 
end;';
end
]|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$[join_types(remove_fields(read_type(CLI_TARGET_DML), "newline"), 'record\\n  string("\\\\x01") filename;\\n  string(1) newline = \\"\\\\n\\";end')]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Files|186000|145000|0|0|0|0|17236|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|100|0|237|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|101|0|239|0|{@{}@384|.5|.5|{0|}17235|17|}}
{2010203004|XXGoport|102|0|241|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|103|0|243|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|104|0|245|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|105|0|247|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|106|0|249|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010210004|XXGflow|107|0|251|0|{@{}@384|.5|.5|{0|}17238|531|}}
{2010202004|XXGiport|108|0|253|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|109|0|255|0|{@{}@384|.5|.5|{0|}17234|17|}}
{2010501005|XXGpvertex|110|0|257|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|filter|None (Read all records)|15|1|Fl|Limits the number of records read from each file|{2|None (Read all records)|Range (Read a subset of records from each file)|}}
{30001002|XXparameter|skip_count|0|1|2|FK$|Number of initial records to skip|{0|}}
{30001002|XXparameter|skip_count.display_name|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.keyword|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|read_count|0|1|2|FK$|Number of records to read from each file|{0|}}
{30001002|XXparameter|read_count.display_name|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.keyword|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if the input file is not readable or is otherwise unavailable|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Fail|3|13|Kv|What to do if the input file is not readable or is otherwise unavailable|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading an input file|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|stream_raw_data|False|13|1|FKl|If True, streams raw data from input files|{0|}}
{30001002|XXparameter|stream_raw_data.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|interpret_hadoop_data|False|13|1|Fl|If true, component will interpret data according to the selected Hadoop file format.|{0|}}
{30001002|XXparameter|interpret_hadoop_data.condition|version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'rcfile' (RCFile format), 'avro' (Avro format), 'texttable' (Hive text table).|{7|uninterpreted|seqfile|parquet|orc|rcfile|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact interpret_hadoop_data True param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format parquet True value format orc True value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RCFile, ORC File, or Parquet File. Column numbers are zero-based. For ORC file and Parquet file, if this is set, the direct name mapping via DML field names will be ignored.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|param_exact stream_raw_data False param_exact format uninterpreted version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact stream_raw_data False param_exact read-blocks False param_exact format uninterpreted version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact stream_raw_data False param_exact read_as_single_record False param_exact format uninterpreted version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|9|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(void(integer(4)) rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation9|optional integer(8) out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|operation9_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record.|{0|}}
{30001002|XXparameter|operation9_analysis.condition|version 3.2.1.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Read Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|111|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|112|0|262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|113|0|265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|114|0|268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|115|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|116|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|117|0|277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|118|0|280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_hist_fix_sup_updt/f_clm_supress_updates.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_hist_fix_sup_updt/f_clm_supress_updates.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@654000|377500|0|0|0|0|17242|Supress Null Carriers|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|119|0|282|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|120|0|284|0|{@{}@384|.5|.5|{0|}17241|17|}}
{2010503005|XXGfvertex|121|0|286|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|122|0|288|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|123|0|292|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|$[length_of(IDS_FILES_VEC)]|3|9||@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.filename :: $[string_representation(IDS_FILES_VEC)][index-1];
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") filename;
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|32000|157000|0|0|0|0|17233|CRT: Get File Names|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|124|0|294|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|125|0|297|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|126|0|299|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|127|0|301|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluatetransformanewforeachrecord Evaluatetransformonceandusethatvalueforallrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|128|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|129|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|130|0|309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|131|0|317|0|{Subgraph created from graph "fix"|{}@0|@257500|64540|0|0|0|0|17370|Create SPLIT IDS|spulikon|@1|100|-1|@9|@34881|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1140000|479000|7|}}
{2010240003|XXGlegend|132|0|319|0|{@{}@This is a serial lookup file for deciding SRC Rank|312000|19000|0|0|0|0|14625|}}
{2010242002|XXGface|133|0|321|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|134|0|323|0|{@{}@384|.5|.5|{0|}14668|2065|}}
{2010210004|XXGflow|135|0|325|0|{@{}@384|.5|.5|{0|}14663|17|}}
{2010210004|XXGflow|136|0|327|0|{@{}@384|.5|.5|{0|}14667|17|}}
{2010210004|XXGflow|137|0|329|0|{@{}@384|.5|.5|{0|}14669|2065|}}
{2010210004|XXGflow|138|0|331|0|{@{}@384|.5|.5|{0|}14664|17|}}
{2010210004|XXGflow|139|0|333|0|{@{}@384|.5|.5|{0|}14665|17|}}
{2010210004|XXGflow|140|0|335|0|{@{}@384|.5|.5|{0|}14656|2065|}}
{2010503005|XXGfvertex|141|0|337|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$SOURCE_ENTITY.error.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$SOURCE_ENTITY.error.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$AB_HOME/include/error-info.dml|3|9|f|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.error to Errors.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@237316|338080|151000|271000|56000|50000|14641|Errors|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|142|0|339|0|{@{}@174000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|143|0|342|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|144|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|145|0|347|0|{Subgraph created from graph "fix"|{}@0|@303500|140000|0|0|0|0|14662|Get Hash and Sort on Priority|spulikon|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1199000|338000|7|}}
{2010210004|XXGflow|146|0|349|0|{@{}@384|.5|.5|{0|}14523|17|}}
{2010210004|XXGflow|147|0|351|0|{@{}@384|.5|.5|{0|}14529|17|}}
{2010210004|XXGflow|148|0|353|0|{@{}@384|.5|.5|{0|}14528|17|}}
{2010210004|XXGflow|149|0|355|0|{@{}@384|.5|.5|{0|}14518|17|}}
{2010600005|XXGgraph|150|0|357|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|19|9|RFK|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@503000|91500|0|0|481000|303000|14530|PBKS dxf_hk_part1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|151|0|359|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|152|0|361|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|363|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|154|0|366|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|155|0|368|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
if(IS_IDS_DML_WITH_NK) 
"out :: reformat(in) =
begin
   out.sort_file_date :: " + IDS_MAP_XFR_HINT + ".dxf_src_dataset_id ;
   out.dxf_src_rec_cnt :: " + IDS_MAP_XFR_HINT + ".dxf_src_rec_cnt;
   out.* :1: " + IDS_MAP_XFR_HINT + ".*;
   out.* :2: in.*;
end;"
else 
"out :: reformat(in) =
begin
   out.sort_file_date :: " + IDS_MAP_XFR_HINT + ".dxf_src_dataset_id ;
   out.dxf_src_rec_cnt :: " + IDS_MAP_XFR_HINT + ".dxf_src_rec_cnt;
   out.* :1: " + IDS_MAP_XFR_HINT + ".*;
end;"
]|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{SPLIT_IDS_NK_INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|doc_transform|out0,reject0,error0,log :: document(in) =
begin
out0.* :: in.*;
end;|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|81000|82500|0|0|0|0|14522|RFMT: Map to IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|156|0|370|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|157|0|373|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|158|0|375|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|159|0|377|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|160|0|379|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|161|0|381|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|162|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|163|0|387|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|164|0|390|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|165|0|393|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|166|0|396|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|167|0|399|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|let string("") file_path=string_concat("$\{AI_MFS\}","/","$\{INPUT_FILE_DRIVING_MASK\}","/");
filename :: get_filename(in) =
begin

  filename :: this_partition_path(string_concat( file_path ,in.file_name));
end;|3|3|c|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/split|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SPLIT_FILES_VEC", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$\{SPLIT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
}}@0|@252391|63666|272000|84000|118000|113000|155|Read Multiple Splits|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|168|0|401|0|{@{}@389000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|169|0|403|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|170|0|405|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|171|0|407|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|172|0|409|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|411|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|413|0|{@{}@262000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|175|0|415|0|{@{}@384|.5|.5|{8|147000|129000|167000|129000|240000|129000|261000|129000|}154|17|}}
{2010501005|XXGpvertex|176|0|417|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|filter|None (Read all records)|15|1|Fl|Limits the number of records read from each file|{2|None (Read all records)|Range (Read a subset of records from each file)|}}
{30001002|XXparameter|skip_count|0|1|2|FK$|Number of initial records to skip|{0|}}
{30001002|XXparameter|skip_count.display_name|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.keyword|skip-count|3|9|P|@{0|}}
{30001002|XXparameter|skip_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|read_count|0|1|2|FK$|Number of records to read from each file|{0|}}
{30001002|XXparameter|read_count.display_name|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.keyword|read-count|3|9|P|@{0|}}
{30001002|XXparameter|read_count.condition|param filter Range*|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty|Ignore (continue with no reject or error)|15|1|Fl|What to do if an input file is empty|{4|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|Accept (If reading as single record, produce length-only record with no data)|}}
{30001002|XXparameter|file_empty.display_name|file-empty|3|9|P|@{0|}}
{30001002|XXparameter|file_empty.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_empty_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_missing.display_name|file-missing|3|9|P|@{0|}}
{30001002|XXparameter|file_missing.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_missing_keyword|value file-missing F* Fail value file-missing N* Notify value file-missing I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|file_missing_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|file_unavailable|Fail (Stop processing)|15|1|Fl|What to do if the input file is not readable or is otherwise unavailable|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|file_unavailable.display_name|file-unavailable|3|9|P|@{0|}}
{30001002|XXparameter|file_unavailable_keyword|value file-unavailable F* Fail value file-unavailable N* Notify value file-unavailable I* Ignore value file-unavailable A* Accept default dollar_substitution Fail|3|13|Kv|What to do if the input file is not readable or is otherwise unavailable|{0|}}
{30001002|XXparameter|filename_error|Fail (Stop processing)|15|1|Fl|What to do with an input record when get_filename() fails|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|filename_error.display_name|filename-error|3|9|P|@{0|}}
{30001002|XXparameter|filename_error.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|filename_error_keyword|value filename-error F* Fail value filename-error N* Notify value filename-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do if an input file is missing|{0|}}
{30001002|XXparameter|filename_error_keyword.condition|version 2.11.8.m11:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error|Fail (Stop processing)|15|1|Fl|What to do in case of error reading an input file|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|input_error.display_name|input-error|3|9|P|@{0|}}
{30001002|XXparameter|input_error.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|input_error_keyword|value input-error F* Fail value input-error N* Notify value input-error I* Ignore default dollar_substitution Fail|3|13|Kv|What to do in case of error reading an input file|{0|}}
{30001002|XXparameter|input_error_keyword.condition|version 2.14.70:|3|15|P?|@{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, reads compressed input files|{0|}}
{30001002|XXparameter|compressed.condition|version 2.12.2.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|read_as_single_record|False|13|1|FKl|If True, reads each file as one record, adding an initial 8-byte size|{0|}}
{30001002|XXparameter|read_as_single_record.condition|param_exact read-blocks False version 2.12.2.m5:|3|15|P?|@{0|}}
{30001002|XXparameter|read_blocks|False|13|1|FKl|If True, reads each file as a series of blocks, adding an initial 8-byte size to each block|{0|}}
{30001002|XXparameter|read_blocks.display_name|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.keyword|read-blocks|3|9|P|@{0|}}
{30001002|XXparameter|read_blocks.condition|param_exact read_as_single_record False version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|maximum_block_bytes|-1|1|2|FK$|Block size when read-blocks is True. A value of -1 reads the entire file.|{0|}}
{30001002|XXparameter|maximum_block_bytes.display_name|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.keyword|maximum-block-bytes|3|9|P|@{0|}}
{30001002|XXparameter|maximum_block_bytes.condition|param_exact read-blocks True version 2.14.25:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp file_empty_keyword file-empty file_missing_keyword file-missing file_unavailable_keyword file-unavailable filename_error_keyword filename-error input_error_keyword input-error|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|operation4_analysis|NULL|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|filereject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|fileerror_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = remote("$AB_HOME/include/error-info.dml")
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|177|0|419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|178|0|422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|179|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|180|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|181|0|431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|182|0|434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|183|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|184|0|440|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(SPLIT_FILES_VEC) ]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] shred_file_name_vec = $[ string_representation(SPLIT_FILES_VEC) ];

out :: create(index) =
begin
  out.file_name :: shred_file_name_vec[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|log_checkpoint|1|3|1|l|@{0|}}
{30001002|XXparameter|log_computepoint|1|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file_name;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@57000|79000|77000|99000|60000|60000|152|Find All Splits|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|185|0|442|0|{@{}@136000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|186|0|445|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|187|0|447|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|188|0|449|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluattransforanefoeacrecord Evaluattransforoncanusthavalufoalrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520144|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|189|0|451|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|190|0|454|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|191|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|192|0|465|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|193|0|467|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|194|0|469|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|195|0|474|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|196|0|478|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|197|0|482|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|198|0|484|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|199|0|486|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|200|0|488|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|201|0|491|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|202|0|493|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|203|0|495|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|204|0|498|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|205|0|503|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|206|0|505|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|207|0|507|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|208|0|510|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|209|0|512|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|210|0|515|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|211|0|521|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|212|0|524|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|213|0|528|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SPLIT_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$SPLIT_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0063|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|@857000|85000|0|0|0|0|14657|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|214|0|530|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|215|0|533|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|216|0|536|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|217|0|538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|218|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|219|0|544|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
 let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = if($"INPUT_FILE_DRIVING_MASK" == "split") reinterpret(get_hash(in, $"NATURAL_KEY")) else [record dxf_hk_part1 in.dxf_hk_part1 dxf_hk_part2 in.dxf_hk_part2];
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|273000|80000|0|0|0|0|14525|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|220|0|546|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|221|0|549|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|222|0|551|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|223|0|553|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|224|0|555|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|225|0|558|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|226|0|560|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|227|0|564|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|228|0|567|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|229|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|230|0|573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|231|0|581|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$SPLIT_IDS_NK_DML|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|962000|98500|0|0|0|0|14497|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|232|0|583|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|233|0|585|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|234|0|587|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|235|0|589|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|236|0|591|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|237|0|594|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|238|0|596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|239|0|600|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|240|0|603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|241|0|606|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|242|0|609|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|243|0|615|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; src_env_rank descending; sort_file_date; dxf_src_rec_cnt\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|775000|100000|0|0|0|0|14519|SWG|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|617|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|245|0|620|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|246|0|623|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|major_key||19|2|RFK$|Input is assumed to be sorted on this key|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key||19|2|RFK$|Input will be sorted within groups on this key|{0|}}
{30001002|XXparameter|minor_key.display_name|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|minor_key.keyword|minor-key|3|9|P|@{0|}}
{30001002|XXparameter|max_core|10485760|1|2|FK$|maximum memory usage in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted|false|13|1|FKl|Allows input not sorted by major key|{0|}}
{30001002|XXparameter|allow_unsorted.display_name|allow-unsorted|3|9|P|@{0|}}
{30001002|XXparameter|allow_unsorted.keyword|allow-unsorted|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort within Groups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|247|0|625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|248|0|628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|249|0|634|0|{@{}@0|0|0|0|out0|.27309236947791166|@@@14352|0|}}
{2010202004|XXGiport|250|0|638|0|{@{}@0|0|0|0|in1|.4925925925925926|@@@13840|0|}}
{2010503005|XXGfvertex|251|0|643|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SPLIT_ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$SPLIT_ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@862000|270000|0|0|0|0|14659|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|252|0|645|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|253|0|648|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|254|0|650|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|255|0|653|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@578000|135000|0|0|0|0|14666|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|256|0|655|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|257|0|658|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|258|0|661|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|259|0|663|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|260|0|666|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|261|0|668|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|262|0|671|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|263|0|674|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|264|0|677|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|265|0|683|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$SOURCE_ENTITY.invalid.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$SOURCE_ENTITY.invalid.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.invalid to Invalid.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@117316|390080|36000|271000|56000|50000|14640|Invalid|Ab Initio Software||1|30000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|266|0|685|0|{@{}@59000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|267|0|688|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|268|0|690|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|269|0|694|0|{Subgraph created from graph "load"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|6\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Find_All_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Read_Shreds.Find_All_Shreds.out to Read_Shreds.Read_Shreds.Read_Multiple_Shreds.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@40000|136280|60000|128000|766000|498000|14670|Read Multiple Split files|Mukesh Singh|Created 4/4/2016 10:47:41 PM|1|10|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.16993464529514313|796000|461000|3|}}
{2010210004|XXGflow|270|0|696|0|{@{}@384|.5|.5|{0|}5711|17|}}
{2010210004|XXGflow|271|0|698|0|{@{}@384|.5|.5|{6|714000|323000|714000|343000|714000|364000|}5706|19|}}
{2010501005|XXGpvertex|272|0|700|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LogFile|file:$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.invalid.log|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Gather_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Validate_Records.log to Read_Shreds.Gather_Logs_Invalid.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@626785|338634|692000|375000|40000|47000|5703|Gather Logs: Invalid|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|273|0|702|0|{@{}@709000|365000|11000|11000|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|274|0|705|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|logger|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|LogFile|@28|2|RFO$|Filename to log to|{0|}}
{30001002|XXparameter|StartText|Start|3|2|RFO$|Text to include in start record|{0|}}
{30001002|XXparameter|EndText|End|3|2|RFO$|Text to include in end record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|Layout|file:.|9|2|F$|logger should run serially by default|{0|}}
{30001002|XXparameter|continuous_analysis|publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|275|0|707|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|276|0|710|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_threshold|Use limit/ramp|3|1|l|@{0|}}
{30001002|XXparameter|limit|$LOAD_REJECT_LIMIT|3|2|$|@{0|}}
{30001002|XXparameter|ramp|$LOAD_REJECT_RAMP|3|2|$|@{0|}}
{30001002|XXparameter|logging|True|3|1|l|@{0|}}
{30001002|XXparameter|log_reject|1000|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Validate_Records.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Set_Bookkeeping_Fields.out0 to Read_Shreds.Validate_Records.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition|$[DO_DATA_VALIDATION]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@0|@335000|164000|615000|224000|123000|89000|5707|RFMT:Validate Records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|277|0|712|0|{@{}@737000|264000|11000|11000|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|278|0|714|0|{@{}@629000|312000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|279|0|716|0|{@{}@669000|312000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|280|0|718|0|{@{}@709000|312000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|281|0|721|0|{@{}@605000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|282|0|724|0|{Separates valid data records from invalid data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|validate|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520144|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|283|0|726|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|284|0|729|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|285|0|732|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|286|0|735|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|287|0|738|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|288|0|746|0|{Subgraph created from graph "Read Shreds"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1397017960|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|FIRST_FILE|$AI_MFS/split/$[SPLIT_FILES_VEC[0]]|3|9|FK|first split file|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@45000|161667|34000|233000|592000|364000|5712|Read Splits|Mukesh Singh|Created 4/11/2016 3:08:57 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.2060810774564743|592000|363000|3|}}
{2010210004|XXGflow|289|0|749|0|{@{}@384|.5|.5|{8|373000|314000|373000|314000|396000|314000|403000|314000|}147|2065|}}
{2010503005|XXGfvertex|290|0|752|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$FIRST_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$\{SPLIT_DML\}|3|3|cj|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@284652|269948|307000|290000|56000|50000|148|For View Data|Kimbo Mundy||1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|291|0|754|0|{@{}@362000|309000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|292|0|757|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url|@28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|param block_compressed True mode lookup version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|Layout|$[[record kind 85 subkind 0 parts [vector]]]|28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|mpcmodtime|1379520122|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|293|0|759|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|294|0|763|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@377000|251666|414000|280000|56000|72000|6|Trash|Ab Initio Software|Built-in|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|295|0|765|0|{@{}@404000|309000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|296|0|768|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|297|0|770|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|298|0|774|0|{@{}@155000|264000|11000|11000|out0|.5|@@@14736|0|}}
{2010203004|XXGoport|299|0|778|0|{@{}@189000|164000|11000|11000|out0|.5|@@@14480|0|}}
{2010203004|XXGoport|300|0|782|0|{@{}@154000|211000|11000|11000|error|.7600502512562815|@@@13464|0|}}
{2010203004|XXGoport|301|0|786|0|{@{}@0|0|0|0|out1|.6407035175879398|@@@13328|0|}}
{2010503005|XXGfvertex|302|0|790|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DXF_META/lookup.src_envrt_id1.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$PUB_DXF_META/lookup.src_envrt_id.txt|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|include "$PUB_DXF_DML/generic_data_types.dml";
metadata type = ids_src_envrt_lookup_type;|3|2|$|@{0|}}
{30001002|XXparameter|key|\{src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|~\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|DA_vertex_status\|\}\{56\|CTL10026\|\}\{51\|0\|\}\{\}\}\}\}|3|9|P|@{0|}}
}}@0|@386000|67500|0|0|0|0|14626|SRC_ENVRT_ID|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|303|0|792|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|304|0|794|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SPLIT_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$SPLIT_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{SPLIT_IDS_NK_DML\}|3|3|c|@{0|}}
}}@1|@982000|85000|0|0|0|0|14654|View Data|Ab Initio Software|@1|50|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|305|0|796|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|306|0|799|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|307|0|801|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|308|0|805|0|{Subgraph created from graph "fix"|{}@0|@2986500|10750|0|0|0|0|17302|Deleted|spulikon|@1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|246000|286000|7|}}
{2010503005|XXGfvertex|309|0|807|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$ORCHARD_TARGET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@92000|64000|0|0|0|0|16243|ORCHARD_LKP_TPL|Ab Initio Software|@1|100|0||6||32833|-1|-1|}}
{2010503005|XXGfvertex|310|0|809|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|311|0|811|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let string("") datafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/f_claims_detail.dat.gz";
let string("") indexfile=this_partition_path(string_replace(datafile,".dat.gz", ".idx"));
type lookup_record_type = ' + read_type(ORCHARD_TARGET_DML) + ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "ORCHARD_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "ORCHARD_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "ORCHARD_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "ORCHARD_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"ORCHARD_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
//  out.is_match :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ;  
  out.dxf_hk_part1 :1: in.dxf_hk_part1;
  out.dxf_hk_part2 :1: in.dxf_hk_part2;
  out.*            :2: exact_record_value.*; 
  out.*            :3: in.* ;
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|43000|121500|0|0|0|0|16244|Unload and assign from ORCHARD IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|312|0|813|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|313|0|815|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|314|0|817|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|315|0|819|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|316|0|821|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|317|0|823|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|318|0|825|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|319|0|829|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|320|0|832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|321|0|835|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|322|0|838|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|323|0|841|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|/*Function combining one record from each input to produce one record on the output.*/
out::fuse(in0,in1)=
begin
out.awp_intgr_unit_cost :1: if($ORCHARD_FLAG == 1 && in0.src_env_sk member [vector 480, 490] && in1.awp_flg == "PUBLISHED") in0.awp_unit_published 
                           else if($ORCHARD_FLAG == 1 && in0.src_env_sk member [vector 480, 490] && in1.awp_flg == "ADJUSTED") in0.awp_unit_adjustment
                           else in1.awp_intgr_unit_cost;
out.dxf_hk_part1 :1: in1.dxf_hk_part1;
out.dxf_hk_part2 :1: in1.dxf_hk_part2;                           
out.* :1: in0.*;
out.* :: in1.*;
end;|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Fuse|3143000|852500|0|0|0|0|17318|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|324|0|843|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|325|0|846|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|326|0|848|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|327|0|850|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|328|0|852|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|329|0|854|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|330|0|856|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|331|0|859|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|332|0|862|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to fuse function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(4) out::select(in[*])|3|2|H$|If this returns 0, the input records are discarded.|{0|}}
{30001002|XXparameter|operation1_analysis|integer(4) select_out::select(in[*])|3|2|H$||{0|}}
{30001002|XXparameter|operation2|out::fuse(in[*])|3|2|H$|Function combining one record from each input to produce one record on the output.|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Fuse|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|333|0|864|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|334|0|867|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|335|0|870|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|336|0|873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|337|0|876|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|338|0|879|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|339|0|882|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|340|0|885|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010503005|XXGfvertex|341|0|888|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_final.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_final.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@3|@3446000|731500|0|0|0|0|17308|Output File|Ab Initio Software|@1|200|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|342|0|890|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|343|0|893|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|344|0|895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|345|0|898|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$[  
        ' /*extract filename from input record*/
        //Initailize a dummy value for validation of filename expression 
        //Assuming a col. dxf_src_sys_id
                filename::get_filename(in)=
        begin 
                     filename:: ' +  ' "mfile:'  + IDS_DATA_PATH + '/' + TARGET_ENTITY + '."  + (string("")) (date("YYYYMMDD")) in.'  + FACT_DATA_PARTITION_KEY + ' +  ".dat.gz"; ' 
       + '\\n\\t' + 
      'end;' +

'indexname::get_indexname(filename)=
        begin
        indexname ::            if(string_index(filename ,".dat.gz"))
                                        string_replace(filename, ".dat.gz", ".idx")
                                else
                                        string_replace(filename, ".dat", ".idx");
        end;

        /* This function is optional. */
        /*Create output record*/
        write::reformat(in)=
        begin
        write.* :: in.*;
        end; '     
 
]|3|9||@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@40000|30000|0|0|0|0|11536|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|346|0|900|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|347|0|902|0|{@{}@384|.5|.5|{0|}11533|17|}}
{2010203004|XXGoport|348|0|904|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|349|0|906|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|350|0|908|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|351|0|910|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|352|0|912|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|353|0|914|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|file_limits|Files (Limited by number of output files)|15|1|Fl|Limits the number of files that can be open simultaneously|{3|None (No limits on resource usage)|Memory (Limited by total memory usage)|Files (Limited by number of output files)|}}
{30001002|XXparameter|file_limits.display_name|file-limits|3|9|P|@{0|}}
{30001002|XXparameter|max_core|13107200|1|2|FK$|Maximum memory usage (for file output buffers) in bytes. This corresponds to 100 open files|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param file-limits Memory*|3|15|P?|@{0|}}
{30001002|XXparameter|max_files|100|1|2|FK$|Maximum number of simultaneously open files|{0|}}
{30001002|XXparameter|max_files.display_name|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.keyword|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.condition|param file-limits Files*|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|4|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type3|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type4|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation5|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata|record string('') filename; void(integer(4)) data; end|7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|354|0|916|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|355|0|919|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|356|0|922|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|357|0|925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|358|0|928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|359|0|931|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|360|0|934|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@3|@439000|115000|0|0|0|0|10591|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|361|0|936|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|362|0|938|0|{@{}@384|.5|.5|{0|}10592|2065|}}
{2010202004|XXGiport|363|0|940|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|364|0|942|0|{@{}@384|.5|.5|{0|}10598|17|}}
{2010503005|XXGfvertex|365|0|944|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|366|0|946|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|367|0|949|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|368|0|958|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
//let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '\{claim_nbr; claim_seq_nbr_src; src_env_sk\}'));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   //out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|1892000|585000|0|0|0|0|17328|Hashkey Gen on NATURAL KEY|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|369|0|960|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|370|0|963|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|371|0|965|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|372|0|967|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|373|0|969|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|374|0|976|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|375|0|978|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|376|0|982|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|377|0|985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|378|0|988|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|379|0|991|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|380|0|994|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_orx_olr_nonmatches.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_orx_olr_nonmatches.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ORCHARD_FLAG]|3|9||@{0|}}
}}@2|@1744000|767000|0|0|0|0|17086|OLR Non matches|Ab Initio Software|@1|1000|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|381|0|996|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|382|0|999|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|383|0|1001|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|384|0|1008|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
//let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, $'NATURAL_KEY'));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   //out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|2552000|420000|0|0|0|0|17341|Hashkey Gen on NATURAL KEY-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|385|0|1010|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|386|0|1012|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|387|0|1014|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|388|0|1016|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|389|0|1018|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|390|0|1020|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|391|0|1022|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|392|0|1026|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|393|0|1029|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|394|0|1032|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|395|0|1035|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|396|0|1038|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$XREF_KEY_FILE_DML|3|2|$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/xref.f_claim_transaction_new.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUB_DATAHUB_MFS_LOOKUP/ids/ids_rxclaim/xref/xref.f_claim_transaction_new.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@3719000|965500|0|0|0|0|17361|Lkp View Data|Ab Initio Software|@1|50|-1||6||33089|-1|-1|}}
{2010503005|XXGfvertex|397|0|1040|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|398|0|1042|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_orx_olr1.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_orx_olr1.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ORCHARD_FLAG]|3|9||@{0|}}
}}@2|@1524000|772000|0|0|0|0|17367|OLR 1|Ab Initio Software|@1|50|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|399|0|1044|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|400|0|1047|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|401|0|1049|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|402|0|1053|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_orx_olr2.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_orx_olr2.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ORCHARD_FLAG]|3|9||@{0|}}
}}@2|@1599000|772500|0|0|0|0|17084|OLR 2|Ab Initio Software|@1|50|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|403|0|1055|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|404|0|1058|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|405|0|1060|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|406|0|1064|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids_split_orx_olr3.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids_split_orx_olr3.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ORCHARD_FLAG]|3|9||@{0|}}
}}@2|@1669000|767000|0|0|0|0|16967|OLR 3|Ab Initio Software|@1|1000|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|407|0|1066|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|408|0|1069|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|409|0|1071|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|410|0|1077|0|{Subgraph created from graph "fix"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ORCHARD_FLAG]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@1550500|286250|0|0|0|0|17284|ORX Processing - Fetch From OLR|spulikon|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2395000|492000|7|}}
{2010240003|XXGlegend|411|0|1079|0|{@{}@Non Matches on NK|10000|35000|0|0|0|0|15683|}}
{2010242002|XXGface|412|0|1081|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|413|0|1083|0|{@{}@ORX Data|10000|35000|0|0|0|0|15685|}}
{2010242002|XXGface|414|0|1085|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|415|0|1087|0|{@{}@Non Matches on 
\{claim_nbr; src_env_sk\}|10000|35000|0|0|0|0|15687|}}
{2010242002|XXGface|416|0|1089|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|417|0|1091|0|{@{}@Matches on \{claim_nbr; src_env_sk\}|1088000|389000|0|0|0|0|15959|}}
{2010242002|XXGface|418|0|1093|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|419|0|1095|0|{@{}@Matches on \{claim_nbr; claim_seq_nbr; claim_stat_id; src_env_sk\}|243000|369000|0|0|0|0|15960|}}
{2010242002|XXGface|420|0|1097|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|421|0|1099|0|{@{}@Matches on \{prod_idr; filled_dt\}|1933000|377000|0|0|0|0|15958|}}
{2010242002|XXGface|422|0|1101|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|423|0|1103|0|{@{}@Non Matches|2258000|224000|0|0|0|0|15957|}}
{2010242002|XXGface|424|0|1105|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|425|0|1107|0|{@{}@384|.5|.5|{0|}16093|17|}}
{2010210004|XXGflow|426|0|1109|0|{@{}@384|.5|.5|{0|}16048|17|}}
{2010210004|XXGflow|427|0|1111|0|{@{}@384|.5|.5|{0|}16090|17|}}
{2010210004|XXGflow|428|0|1113|0|{@{}@384|.5|.5|{0|}16092|17|}}
{2010210004|XXGflow|429|0|1115|0|{@{}@384|.5|.5|{0|}16087|17|}}
{2010210004|XXGflow|430|0|1117|0|{@{}@384|.5|.5|{0|}16089|17|}}
{2010210004|XXGflow|431|0|1119|0|{@{}@384|.5|.5|{0|}16053|17|}}
{2010501005|XXGpvertex|432|0|1121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let string("") datafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/ft_claims_detail.dat.gz";
let string("") indexfile=this_partition_path(string_replace(datafile,".dat.gz", ".idx"));
type lookup_record_type = ' + read_type(OLR_TARGET_DML) + ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "OLR_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "OLR_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "OLR_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "OLR_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"OLR_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end                                                                  
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;

  out.is_match :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ; 
  out.join_match_ind_1 :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2 == 0) "N" else "Y"; 
  out.(*, name member [vector "claim_nbr", "claim_seq_nbr", "claim_stat_id", "src_env_sk", "dxf_sk", "dxf_hk_part1", "dxf_hk_part2", "dxf_src_sys_id", "ids_create_dttm", "ids_create_uid", "ids_create_run_id", "ids_updt_dttm", "ids_updt_uid", "ids_updt_run_id", "ids_rec_stat_cd"]) :1: in.*;
    
  
  out.adj_rxcount_rxsol_mail_srvc :2: exact_record_value.adj_rxcount_rxsol_mail_srvc;
  out.adj_rxcount_rxsol_mail_srvc :3: in.adj_rxcount_rxsol_mail_srvc;
  out.awp_unit_adjustment :2: exact_record_value.awp_unit_adjustment;
  out.awp_unit_adjustment :3: in.awp_unit_adjustment;
  out.awp_unit_published :2: exact_record_value.awp_unit_published;
  out.awp_unit_published :3: in.awp_unit_published;
  out.drug_category_code :2: exact_record_value.drug_category_code;
  out.drug_category_code :3: in.drug_category_code;
  out.generic_mnftr_cnt :2: exact_record_value.generic_mnftr_cnt;
  out.generic_mnftr_cnt :3: in.generic_mnftr_cnt;
  out.co_insurance_amt :2: exact_record_value.generic_mnftr_cnt;
  out.co_insurance_amt :3: in.generic_mnftr_cnt;
  out.non_prf_drug_patient_pay_amt :2: exact_record_value.non_prf_drug_patient_pay_amt;
  out.non_prf_drug_patient_pay_amt :3: in.non_prf_drug_patient_pay_amt;
  out.brand_prf_patient_pay_amt :2: exact_record_value.brand_prf_patient_pay_amt;
  out.brand_prf_patient_pay_amt :3: in.brand_prf_patient_pay_amt;
  out.cob_carrier_subm_amt :2: exact_record_value.cob_carrier_subm_amt;
  out.cob_carrier_subm_amt :3: in.cob_carrier_subm_amt;
  out.cob_primary_claim_type_ind :2: exact_record_value.cob_primary_claim_type_ind;
  out.cob_primary_claim_type_ind :3: in.cob_primary_claim_type_ind;
  out.cob_primary_payer_id :2: exact_record_value.cob_primary_payer_id;
  out.cob_primary_payer_id :3: in.cob_primary_payer_id;
  out.cob_primary_payer_paid_amt :2: exact_record_value.cob_primary_payer_paid_amt;
  out.cob_primary_payer_paid_amt :3: in.cob_primary_payer_paid_amt;
  out.client_cost_tier_amt :2: exact_record_value.client_cost_tier_amt;
  out.client_cost_tier_amt :3: in.client_cost_tier_amt;
  out.specialty_drug_prg_ind :2: exact_record_value.specialty_drug_prg_ind;
  out.specialty_drug_prg_ind :3: in.specialty_drug_prg_ind;
  out.specialty_drug_prg_mbr_ind :2: exact_record_value.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_mbr_ind :3: in.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_pharm_ind :2: exact_record_value.specialty_drug_prg_pharm_ind;
  out.specialty_drug_prg_pharm_ind :3: in.specialty_drug_prg_pharm_ind;
  out.adherence_incnt_prg_ind :2: exact_record_value.adherence_incnt_prg_ind;
  out.adherence_incnt_prg_ind :3: in.adherence_incnt_prg_ind;
  out.adherence_incnt_reduction_ind :2: exact_record_value.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_ind :3: in.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_amt :2: exact_record_value.adherence_incnt_reduction_amt;
  out.adherence_incnt_reduction_amt :3: in.adherence_incnt_reduction_amt;
  out.drug_reserved_elg_ind :2: exact_record_value.drug_reserved_elg_ind;
  out.drug_reserved_elg_ind :3: in.drug_reserved_elg_ind;
  out.drug_reserved_member_elg_ind :2: exact_record_value.drug_reserved_member_elg_ind;
  out.drug_reserved_member_elg_ind :3: in.drug_reserved_member_elg_ind;
  out.plan_sponsor_base_share_amt :2: exact_record_value.plan_sponsor_base_share_amt;
  out.plan_sponsor_base_share_amt :3: in.plan_sponsor_base_share_amt;
  out.plan_sponsor_supl_share_amt :2: exact_record_value.plan_sponsor_supl_share_amt;
  out.plan_sponsor_supl_share_amt :3: in.plan_sponsor_supl_share_amt;
  out.supl_consumer_num :2: exact_record_value.supl_consumer_num;
  out.supl_consumer_num :3: in.supl_consumer_num;
  out.min_copay_amt :2: exact_record_value.min_copay_amt;
  out.min_copay_amt :3: in.min_copay_amt;
  out.consumer_directed_health_ind :2: exact_record_value.consumer_directed_health_ind;
  out.consumer_directed_health_ind :3: in.consumer_directed_health_ind;
  out.specialty_network_prg_ind :2: exact_record_value.specialty_network_prg_ind;
  out.specialty_network_prg_ind :3: in.specialty_network_prg_ind;
  out.ingredient_cost_code :2: exact_record_value.ingredient_cost_code;
  out.ingredient_cost_code :3: in.ingredient_cost_code;
  out.compund_ingredient_comp_cnt :2: exact_record_value.compund_ingredient_comp_cnt;
  out.compund_ingredient_comp_cnt :3: in.compund_ingredient_comp_cnt;
  out.ndc_diff_price_amt :2: exact_record_value.ndc_diff_price_amt;
  out.ndc_diff_price_amt :3: in.ndc_diff_price_amt;
  out.insulin_plan_ind :2: exact_record_value.insulin_plan_ind;
  out.insulin_plan_ind :3: in.insulin_plan_ind;
  out.cob_second_payer_id :2: exact_record_value.cob_second_payer_id;
  out.cob_second_payer_id :3: in.cob_second_payer_id;
  out.cob_second_payer_paid_amt :2: exact_record_value.cob_second_payer_paid_amt;
  out.cob_second_payer_paid_amt :3: in.cob_second_payer_paid_amt;
  out.ncpdp_reject_version_code :2: exact_record_value.ncpdp_reject_version_code;
  out.ncpdp_reject_version_code :3: in.ncpdp_reject_version_code;
  out.low_day_supl_ind :2: exact_record_value.low_day_supl_ind;
  out.low_day_supl_ind :3: in.low_day_supl_ind;
  out.zero_balance_ind :2: exact_record_value.zero_balance_ind;
  out.zero_balance_ind :3: in.zero_balance_ind;
  out.client_mac_id :2: exact_record_value.client_mac_id;
  out.client_mac_id :3: in.client_mac_id;
  out.pharmacy_mac_id :2: exact_record_value.pharmacy_mac_id;
  out.pharmacy_mac_id :3: in.pharmacy_mac_id;
  out.client_contract_dis_fee :2: exact_record_value.client_contract_dis_fee;
  out.client_contract_dis_fee :3: in.client_contract_dis_fee;
  out.tot_publish_awp_amt :2: exact_record_value.tot_publish_awp_amt;
  out.tot_publish_awp_amt :3: in.tot_publish_awp_amt;
  out.clt_awp_discount_rate :2: exact_record_value.clt_awp_discount_rate;
  out.clt_awp_discount_rate :3: in.clt_awp_discount_rate;
  out.app_awp_discount_rate :2: exact_record_value.app_awp_discount_rate;
  out.app_awp_discount_rate :3: in.app_awp_discount_rate;
  out.awp_unit_cost_ind :2: exact_record_value.awp_unit_cost_ind;
  out.awp_unit_cost_ind :3: in.awp_unit_cost_ind;

  out.*            :: in.*;
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|113000|195000|0|0|0|0|16088|Assign from OLR IDS on NK matches|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|433|0|1123|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|434|0|1126|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|435|0|1128|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|436|0|1130|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|437|0|1132|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|438|0|1134|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|439|0|1136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|440|0|1140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|441|0|1143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|442|0|1146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|443|0|1149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|444|0|1156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let string("") datafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/ft_claims_detail.reduced_1.dat.gz";
let string("") indexfile=this_partition_path(string_replace(datafile,".dat.gz", ".idx"));
type lookup_record_type = ' + read_type(OLR_TARGET_DML) + ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "OLR_REDUCED_1_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "OLR_REDUCED_1_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "OLR_REDUCED_1_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "OLR_REDUCED_1_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"OLR_REDUCED_1_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end                                                                  
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
                       
  out.is_match :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ; 
  out.join_match_ind_3 :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2 == 0) "N" else "Y"; 
  out.(*, name member [vector "claim_nbr", "claim_seq_nbr", "claim_stat_id", "src_env_sk", "dxf_sk", "dxf_hk_part1", "dxf_hk_part2", "dxf_src_sys_id", "ids_create_dttm", "ids_create_uid", "ids_create_run_id", "ids_updt_dttm", "ids_updt_uid", "ids_updt_run_id", "ids_rec_stat_cd"]) :1: in.*;
    
  

  out.adj_rxcount_rxsol_mail_srvc :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.adj_rxcount_rxsol_mail_srvc > 0) 
                                                        (-1 * exact_record_value.adj_rxcount_rxsol_mail_srvc)
                                                else
                                                        exact_record_value.adj_rxcount_rxsol_mail_srvc
                                          else 
                                                exact_record_value.adj_rxcount_rxsol_mail_srvc;
  out.adj_rxcount_rxsol_mail_srvc :3: in.adj_rxcount_rxsol_mail_srvc;
  out.awp_unit_adjustment :2: exact_record_value.awp_unit_adjustment;
  out.awp_unit_adjustment :3: in.awp_unit_adjustment;
  out.awp_unit_published :2: exact_record_value.awp_unit_published;
  out.awp_unit_published :3: in.awp_unit_published;
  out.drug_category_code :2: exact_record_value.drug_category_code;
  out.drug_category_code :3: in.drug_category_code;
  out.generic_mnftr_cnt :2: exact_record_value.generic_mnftr_cnt;
  out.generic_mnftr_cnt :3: in.generic_mnftr_cnt;
  out.co_insurance_amt :2: exact_record_value.generic_mnftr_cnt;
  out.co_insurance_amt :3: in.generic_mnftr_cnt;
  out.non_prf_drug_patient_pay_amt :2: exact_record_value.non_prf_drug_patient_pay_amt;
  out.non_prf_drug_patient_pay_amt :3: in.non_prf_drug_patient_pay_amt;
  out.brand_prf_patient_pay_amt :2: exact_record_value.brand_prf_patient_pay_amt;
  out.brand_prf_patient_pay_amt :3: in.brand_prf_patient_pay_amt;
  out.cob_carrier_subm_amt :2: exact_record_value.cob_carrier_subm_amt;
  out.cob_carrier_subm_amt :3: in.cob_carrier_subm_amt;
  out.cob_primary_claim_type_ind :2: exact_record_value.cob_primary_claim_type_ind;
  out.cob_primary_claim_type_ind :3: in.cob_primary_claim_type_ind;
  out.cob_primary_payer_id :2: exact_record_value.cob_primary_payer_id;
  out.cob_primary_payer_id :3: in.cob_primary_payer_id;
  out.cob_primary_payer_paid_amt :2: exact_record_value.cob_primary_payer_paid_amt;
  out.cob_primary_payer_paid_amt :3: in.cob_primary_payer_paid_amt;
  out.client_cost_tier_amt :2: exact_record_value.client_cost_tier_amt;
  out.client_cost_tier_amt :3: in.client_cost_tier_amt;
  out.specialty_drug_prg_ind :2: exact_record_value.specialty_drug_prg_ind;
  out.specialty_drug_prg_ind :3: in.specialty_drug_prg_ind;
  out.specialty_drug_prg_mbr_ind :2: exact_record_value.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_mbr_ind :3: in.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_pharm_ind :2: exact_record_value.specialty_drug_prg_pharm_ind;
  out.specialty_drug_prg_pharm_ind :3: in.specialty_drug_prg_pharm_ind;
  out.adherence_incnt_prg_ind :2: exact_record_value.adherence_incnt_prg_ind;
  out.adherence_incnt_prg_ind :3: in.adherence_incnt_prg_ind;
  out.adherence_incnt_reduction_ind :2: exact_record_value.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_ind :3: in.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_amt :2: exact_record_value.adherence_incnt_reduction_amt;
  out.adherence_incnt_reduction_amt :3: in.adherence_incnt_reduction_amt;
  out.drug_reserved_elg_ind :2: exact_record_value.drug_reserved_elg_ind;
  out.drug_reserved_elg_ind :3: in.drug_reserved_elg_ind;
  out.drug_reserved_member_elg_ind :2: exact_record_value.drug_reserved_member_elg_ind;
  out.drug_reserved_member_elg_ind :3: in.drug_reserved_member_elg_ind;
  out.plan_sponsor_base_share_amt :2: exact_record_value.plan_sponsor_base_share_amt;
  out.plan_sponsor_base_share_amt :3: in.plan_sponsor_base_share_amt;
  out.plan_sponsor_supl_share_amt :2: exact_record_value.plan_sponsor_supl_share_amt;
  out.plan_sponsor_supl_share_amt :3: in.plan_sponsor_supl_share_amt;
  out.supl_consumer_num :2: exact_record_value.supl_consumer_num;
  out.supl_consumer_num :3: in.supl_consumer_num;
  out.min_copay_amt :2: exact_record_value.min_copay_amt;
  out.min_copay_amt :3: in.min_copay_amt;
  out.consumer_directed_health_ind :2: exact_record_value.consumer_directed_health_ind;
  out.consumer_directed_health_ind :3: in.consumer_directed_health_ind;
  out.specialty_network_prg_ind :2: exact_record_value.specialty_network_prg_ind;
  out.specialty_network_prg_ind :3: in.specialty_network_prg_ind;
  out.ingredient_cost_code :2: exact_record_value.ingredient_cost_code;
  out.ingredient_cost_code :3: in.ingredient_cost_code;
  out.compund_ingredient_comp_cnt :2: exact_record_value.compund_ingredient_comp_cnt;
  out.compund_ingredient_comp_cnt :3: in.compund_ingredient_comp_cnt;
  out.ndc_diff_price_amt :2: if(in.claim_stat_id == "X")
                                        if(exact_record_value.ndc_diff_price_amt > 0) 
                                                (-1 * exact_record_value.ndc_diff_price_amt)
                                        else
                                                exact_record_value.ndc_diff_price_amt
                                   else 
                                        exact_record_value.ndc_diff_price_amt;
  out.ndc_diff_price_amt :3: in.ndc_diff_price_amt;
  out.insulin_plan_ind :2: exact_record_value.insulin_plan_ind;
  out.insulin_plan_ind :3: in.insulin_plan_ind;
  out.cob_second_payer_id :2: exact_record_value.cob_second_payer_id;
  out.cob_second_payer_id :3: in.cob_second_payer_id;
  out.cob_second_payer_paid_amt :2: exact_record_value.cob_second_payer_paid_amt;
  out.cob_second_payer_paid_amt :3: in.cob_second_payer_paid_amt;
  out.ncpdp_reject_version_code :2: exact_record_value.ncpdp_reject_version_code;
  out.ncpdp_reject_version_code :3: in.ncpdp_reject_version_code;
  out.low_day_supl_ind :2: exact_record_value.low_day_supl_ind;
  out.low_day_supl_ind :3: in.low_day_supl_ind;
  out.zero_balance_ind :2: exact_record_value.zero_balance_ind;
  out.zero_balance_ind :3: in.zero_balance_ind;
  out.client_mac_id :2: exact_record_value.client_mac_id;
  out.client_mac_id :3: in.client_mac_id;
  out.pharmacy_mac_id :2: exact_record_value.pharmacy_mac_id;
  out.pharmacy_mac_id :3: in.pharmacy_mac_id;
  out.client_contract_dis_fee :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.client_contract_dis_fee > 0) 
                                                        (-1 * exact_record_value.client_contract_dis_fee)
                                                else
                                                        exact_record_value.client_contract_dis_fee
                                        else 
                                                exact_record_value.client_contract_dis_fee;
  out.client_contract_dis_fee :3: in.client_contract_dis_fee;
  out.tot_publish_awp_amt :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.tot_publish_awp_amt > 0) 
                                                        (-1 * exact_record_value.tot_publish_awp_amt)
                                                else
                                                        exact_record_value.tot_publish_awp_amt
                                        else 
                                                exact_record_value.tot_publish_awp_amt;
  out.tot_publish_awp_amt :3: in.tot_publish_awp_amt;
  out.clt_awp_discount_rate :2: exact_record_value.clt_awp_discount_rate;
  out.clt_awp_discount_rate :3: in.clt_awp_discount_rate;
  out.app_awp_discount_rate :2: exact_record_value.app_awp_discount_rate;
  out.app_awp_discount_rate :3: in.app_awp_discount_rate;
  out.awp_unit_cost_ind :2: exact_record_value.awp_unit_cost_ind;
  out.awp_unit_cost_ind :3: in.awp_unit_cost_ind;

  
  out.*            :: in.*;
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|1624000|128000|0|0|0|0|16094|Assign from OLR REDUCED_1 IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|445|0|1158|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|446|0|1161|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|447|0|1163|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|448|0|1165|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|449|0|1167|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|450|0|1170|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|451|0|1172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|452|0|1176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|453|0|1179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|454|0|1182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|455|0|1185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|456|0|1192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let string("") datafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/ft_claims_detail.reduced.dat.gz";
let string("") indexfile=this_partition_path(string_replace(datafile,".dat.gz", ".idx"));
type lookup_record_type = ' + read_type(OLR_TARGET_DML) + ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(datafile) ,indexfile, "OLR_REDUCED_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "OLR_REDUCED_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "OLR_REDUCED_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "OLR_REDUCED_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"OLR_REDUCED_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end                                                                  
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;

  out.is_match :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ; 
  out.join_match_ind_2 :: if(exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2 == 0) "N" else "Y"; 
  out.(*, name member [vector "claim_nbr", "claim_seq_nbr", "claim_stat_id", "src_env_sk", "dxf_sk", "dxf_hk_part1", "dxf_hk_part2", "dxf_src_sys_id", "ids_create_dttm", "ids_create_uid", "ids_create_run_id", "ids_updt_dttm", "ids_updt_uid", "ids_updt_run_id", "ids_rec_stat_cd"]) :1: in.*;
    

  out.adj_rxcount_rxsol_mail_srvc :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.adj_rxcount_rxsol_mail_srvc > 0) 
                                                        (-1 * exact_record_value.adj_rxcount_rxsol_mail_srvc)
                                                else
                                                        exact_record_value.adj_rxcount_rxsol_mail_srvc
                                          else 
                                                exact_record_value.adj_rxcount_rxsol_mail_srvc;
  out.adj_rxcount_rxsol_mail_srvc :3: in.adj_rxcount_rxsol_mail_srvc;
  out.awp_unit_adjustment :2: exact_record_value.awp_unit_adjustment;
  out.awp_unit_adjustment :3: in.awp_unit_adjustment;
  out.awp_unit_published :2: exact_record_value.awp_unit_published;
  out.awp_unit_published :3: in.awp_unit_published;
  out.drug_category_code :2: exact_record_value.drug_category_code;
  out.drug_category_code :3: in.drug_category_code;
  out.generic_mnftr_cnt :2: exact_record_value.generic_mnftr_cnt;
  out.generic_mnftr_cnt :3: in.generic_mnftr_cnt;
  out.co_insurance_amt :2: exact_record_value.generic_mnftr_cnt;
  out.co_insurance_amt :3: in.generic_mnftr_cnt;
  out.non_prf_drug_patient_pay_amt :2: exact_record_value.non_prf_drug_patient_pay_amt;
  out.non_prf_drug_patient_pay_amt :3: in.non_prf_drug_patient_pay_amt;
  out.brand_prf_patient_pay_amt :2: exact_record_value.brand_prf_patient_pay_amt;
  out.brand_prf_patient_pay_amt :3: in.brand_prf_patient_pay_amt;
  out.cob_carrier_subm_amt :2: exact_record_value.cob_carrier_subm_amt;
  out.cob_carrier_subm_amt :3: in.cob_carrier_subm_amt;
  out.cob_primary_claim_type_ind :2: exact_record_value.cob_primary_claim_type_ind;
  out.cob_primary_claim_type_ind :3: in.cob_primary_claim_type_ind;
  out.cob_primary_payer_id :2: exact_record_value.cob_primary_payer_id;
  out.cob_primary_payer_id :3: in.cob_primary_payer_id;
  out.cob_primary_payer_paid_amt :2: exact_record_value.cob_primary_payer_paid_amt;
  out.cob_primary_payer_paid_amt :3: in.cob_primary_payer_paid_amt;
  out.client_cost_tier_amt :2: exact_record_value.client_cost_tier_amt;
  out.client_cost_tier_amt :3: in.client_cost_tier_amt;
  out.specialty_drug_prg_ind :2: exact_record_value.specialty_drug_prg_ind;
  out.specialty_drug_prg_ind :3: in.specialty_drug_prg_ind;
  out.specialty_drug_prg_mbr_ind :2: exact_record_value.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_mbr_ind :3: in.specialty_drug_prg_mbr_ind;
  out.specialty_drug_prg_pharm_ind :2: exact_record_value.specialty_drug_prg_pharm_ind;
  out.specialty_drug_prg_pharm_ind :3: in.specialty_drug_prg_pharm_ind;
  out.adherence_incnt_prg_ind :2: exact_record_value.adherence_incnt_prg_ind;
  out.adherence_incnt_prg_ind :3: in.adherence_incnt_prg_ind;
  out.adherence_incnt_reduction_ind :2: exact_record_value.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_ind :3: in.adherence_incnt_reduction_ind;
  out.adherence_incnt_reduction_amt :2: exact_record_value.adherence_incnt_reduction_amt;
  out.adherence_incnt_reduction_amt :3: in.adherence_incnt_reduction_amt;
  out.drug_reserved_elg_ind :2: exact_record_value.drug_reserved_elg_ind;
  out.drug_reserved_elg_ind :3: in.drug_reserved_elg_ind;
  out.drug_reserved_member_elg_ind :2: exact_record_value.drug_reserved_member_elg_ind;
  out.drug_reserved_member_elg_ind :3: in.drug_reserved_member_elg_ind;
  out.plan_sponsor_base_share_amt :2: exact_record_value.plan_sponsor_base_share_amt;
  out.plan_sponsor_base_share_amt :3: in.plan_sponsor_base_share_amt;
  out.plan_sponsor_supl_share_amt :2: exact_record_value.plan_sponsor_supl_share_amt;
  out.plan_sponsor_supl_share_amt :3: in.plan_sponsor_supl_share_amt;
  out.supl_consumer_num :2: exact_record_value.supl_consumer_num;
  out.supl_consumer_num :3: in.supl_consumer_num;
  out.min_copay_amt :2: exact_record_value.min_copay_amt;
  out.min_copay_amt :3: in.min_copay_amt;
  out.consumer_directed_health_ind :2: exact_record_value.consumer_directed_health_ind;
  out.consumer_directed_health_ind :3: in.consumer_directed_health_ind;
  out.specialty_network_prg_ind :2: exact_record_value.specialty_network_prg_ind;
  out.specialty_network_prg_ind :3: in.specialty_network_prg_ind;
  out.ingredient_cost_code :2: exact_record_value.ingredient_cost_code;
  out.ingredient_cost_code :3: in.ingredient_cost_code;
  out.compund_ingredient_comp_cnt :2: exact_record_value.compund_ingredient_comp_cnt;
  out.compund_ingredient_comp_cnt :3: in.compund_ingredient_comp_cnt;
  out.ndc_diff_price_amt :2: if(in.claim_stat_id == "X")
                                        if(exact_record_value.ndc_diff_price_amt > 0) 
                                                (-1 * exact_record_value.ndc_diff_price_amt)
                                        else
                                                exact_record_value.ndc_diff_price_amt
                                   else 
                                        exact_record_value.ndc_diff_price_amt;
  out.ndc_diff_price_amt :3: in.ndc_diff_price_amt;
  out.insulin_plan_ind :2: exact_record_value.insulin_plan_ind;
  out.insulin_plan_ind :3: in.insulin_plan_ind;
  out.cob_second_payer_id :2: exact_record_value.cob_second_payer_id;
  out.cob_second_payer_id :3: in.cob_second_payer_id;
  out.cob_second_payer_paid_amt :2: exact_record_value.cob_second_payer_paid_amt;
  out.cob_second_payer_paid_amt :3: in.cob_second_payer_paid_amt;
  out.ncpdp_reject_version_code :2: exact_record_value.ncpdp_reject_version_code;
  out.ncpdp_reject_version_code :3: in.ncpdp_reject_version_code;
  out.low_day_supl_ind :2: exact_record_value.low_day_supl_ind;
  out.low_day_supl_ind :3: in.low_day_supl_ind;
  out.zero_balance_ind :2: exact_record_value.zero_balance_ind;
  out.zero_balance_ind :3: in.zero_balance_ind;
  out.client_mac_id :2: exact_record_value.client_mac_id;
  out.client_mac_id :3: in.client_mac_id;
  out.pharmacy_mac_id :2: exact_record_value.pharmacy_mac_id;
  out.pharmacy_mac_id :3: in.pharmacy_mac_id;
  out.client_contract_dis_fee :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.client_contract_dis_fee > 0) 
                                                        (-1 * exact_record_value.client_contract_dis_fee)
                                                else
                                                        exact_record_value.client_contract_dis_fee
                                        else 
                                                exact_record_value.client_contract_dis_fee;
  out.client_contract_dis_fee :3: in.client_contract_dis_fee;
  out.tot_publish_awp_amt :2: if(in.claim_stat_id == "X")
                                                if(exact_record_value.tot_publish_awp_amt > 0) 
                                                        (-1 * exact_record_value.tot_publish_awp_amt)
                                                else
                                                        exact_record_value.tot_publish_awp_amt
                                        else 
                                                exact_record_value.tot_publish_awp_amt;
  out.tot_publish_awp_amt :3: in.tot_publish_awp_amt;
  out.clt_awp_discount_rate :2: exact_record_value.clt_awp_discount_rate;
  out.clt_awp_discount_rate :3: in.clt_awp_discount_rate;
  out.app_awp_discount_rate :2: exact_record_value.app_awp_discount_rate;
  out.app_awp_discount_rate :3: in.app_awp_discount_rate;
  out.awp_unit_cost_ind :2: exact_record_value.awp_unit_cost_ind;
  out.awp_unit_cost_ind :3: in.awp_unit_cost_ind;



  out.*            :: in.*;
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|859000|158000|0|0|0|0|16091|Assign from OLR REDUCED IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|457|0|1194|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|458|0|1197|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|459|0|1199|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|460|0|1201|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|461|0|1203|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|462|0|1206|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|463|0|1208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|464|0|1212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|465|0|1215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|466|0|1218|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|467|0|1221|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|468|0|1228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|output_index|/*Function returning index of output port*/
output_index_out::output_index(in)=
begin
output_index_out :: if(in.join_match_ind_3 == "Y") 1 else 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|1883000|137000|0|0|0|0|16075|Filter Matches In Iteration 3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|469|0|1230|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|470|0|1232|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|471|0|1234|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|472|0|1236|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|473|0|1238|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|474|0|1240|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|475|0|1242|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|476|0|1244|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|477|0|1247|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|478|0|1249|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|479|0|1253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|480|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|481|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|482|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|483|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|484|0|1269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|485|0|1272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|486|0|1281|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$OLR_TARGET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@166000|137500|0|0|0|0|16009|OLR_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|487|0|1283|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|488|0|1285|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$OLR_TARGET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@1676000|70500|0|0|0|0|16031|OLR_REDUCED_1_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|489|0|1287|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|490|0|1289|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$OLR_TARGET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@896000|90500|0|0|0|0|16014|OLR_REDUCED_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|491|0|1291|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|492|0|1293|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@622000|186500|0|0|481000|303000|16027|PBKS|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|493|0|1295|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|494|0|1297|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|495|0|1299|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|496|0|1302|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|497|0|1306|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|498|0|1308|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|499|0|1310|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|500|0|1315|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|501|0|1319|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|502|0|1323|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|503|0|1325|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|504|0|1327|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@2|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|505|0|1329|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|506|0|1332|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|507|0|1334|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|508|0|1336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|509|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|510|0|1344|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@2|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|511|0|1346|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|512|0|1348|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|513|0|1351|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|514|0|1353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|515|0|1356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|516|0|1362|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|517|0|1365|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|518|0|1370|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1382000|154500|0|0|481000|303000|16034|PBKS-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|519|0|1372|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|520|0|1374|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|521|0|1376|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|522|0|1379|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|523|0|1383|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|524|0|1385|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|525|0|1387|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|526|0|1392|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|527|0|1396|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|528|0|1400|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|529|0|1402|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|530|0|1404|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@2|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|531|0|1406|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|532|0|1409|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|533|0|1411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|534|0|1413|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|535|0|1416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|536|0|1421|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@2|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|537|0|1423|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|538|0|1425|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|539|0|1428|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|540|0|1430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|541|0|1433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|542|0|1439|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|543|0|1442|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|544|0|1447|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
//let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '\{claim_nbr; src_env_sk\}'));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   //out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|output_index|/*Function returning index of output port*/
output_index_out::output_index(in)=
begin
output_index_out :: if(in.join_match_ind_1 == "Y") 1 else 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|353000|184000|0|0|0|0|16054|Regenerate Hashkey On \{claim_nbr; src_env_sk\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|545|0|1449|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|546|0|1452|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|547|0|1454|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|548|0|1456|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|549|0|1458|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|550|0|1460|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|551|0|1462|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|552|0|1464|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|553|0|1467|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|554|0|1469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|555|0|1473|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|556|0|1477|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|557|0|1480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|558|0|1483|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|559|0|1486|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|560|0|1489|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|561|0|1492|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|562|0|1501|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
//let decimal("") v_dxf_src_env_rank_input_record=0;
out :: reformat(in) =
begin

   let hash_key_combine_type dxf_hk = reinterpret(get_hash(in, '\{prod.prod_id; filled_dt\}'));
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;
   //Get src env rank for input record
   //out.src_env_rank ::first_defined(lookup("SRC_ENVRT_ID",in.dxf_src_sys_id).src_env_rnk , 9999 ) ; // Assign default value for sources where rank is not defined 
   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|output_index|/*Function returning index of output port*/
output_index_out::output_index(in)=
begin
output_index_out :: if(in.join_match_ind_2 == "Y") 1 else 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|1113000|157000|0|0|0|0|16049|Regenerate Hashkey On \{prod_id; filled_dt\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|563|0|1503|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|564|0|1506|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|565|0|1508|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|566|0|1510|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|567|0|1512|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|568|0|1514|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|569|0|1516|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|570|0|1518|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|571|0|1521|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|572|0|1523|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|573|0|1527|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|574|0|1531|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|575|0|1534|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|576|0|1537|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|577|0|1540|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|578|0|1543|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|579|0|1546|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|580|0|1555|0|{@{}@0|0|0|0|out0|.8415154749199573|@@@13328|0|}}
{2010203004|XXGoport|581|0|1559|0|{@{}@0|0|0|0|out1|.3191190253045923|@@@13328|0|}}
{2010203004|XXGoport|582|0|1563|0|{@{}@0|0|0|0|out2|.3008130081300813|@@@14352|0|}}
{2010203004|XXGoport|583|0|1567|0|{@{}@0|0|0|0|out3|.9749478079331941|@@@13328|0|}}
{2010202004|XXGiport|584|0|1571|0|{@{}@0|0|0|0|in0|.5116772823779193|@@@13840|0|}}
{2010600005|XXGgraph|585|0|1576|0|{Subgraph created from graph "fix"|{}@0|@1182500|546250|0|0|0|0|17372|Overlay File Validation|spulikon|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1090000|207000|7|}}
{2010210004|XXGflow|586|0|1578|0|{@{}@384|.5|.07079645991325378|{0|}15817|529|}}
{2010210004|XXGflow|587|0|1580|0|{@{}@384|.5|.5|{0|}15818|17|}}
{2010210004|XXGflow|588|0|1582|0|{@{}@384|.5|.5|{0|}15797|17|}}
{2010210004|XXGflow|589|0|1584|0|{@{}@384|.5|.5|{0|}15814|17|}}
{2010501005|XXGpvertex|590|0|1586|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|90000|103000|0|0|0|0|15766|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|591|0|1588|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|592|0|1591|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|593|0|1593|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|594|0|1595|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|595|0|1598|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|596|0|1601|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_hist_fix_nonmatch/f_clm_ids_split_overlay_nonmatches.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_hist_fix_nonmatch/f_clm_ids_split_overlay_nonmatches.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0463|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@438000|94000|0|0|0|0|15819|Non Matching Records|Ab Initio Software|@1|50|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|597|0|1603|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|598|0|1606|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|599|0|1609|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|600|0|1611|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|601|0|1614|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|602|0|1621|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
  out.is_match :: if(in.is_match == 0) force_error("ERROR: Few occurances of IDS is/are not having matches in SPLIT IDS created. Graph is aborting.") else 0;
  out.* :: in.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
  decimal("\\x01",maximum_length=1) is_match=0;
  string(1) newline="\\n";
end|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|608000|67000|0|0|0|0|15815|Mismatch Count Validation|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|603|0|1623|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|604|0|1626|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|605|0|1628|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|606|0|1630|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|607|0|1632|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|608|0|1635|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|609|0|1637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|610|0|1641|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|611|0|1644|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|612|0|1647|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|613|0|1650|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|614|0|1657|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Trash|818000|83000|0|0|0|0|15801|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|615|0|1659|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|616|0|1662|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|617|0|1664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|618|0|1669|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|is_match == 0|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|225000|73500|0|0|0|0|15799|is_match == 0|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|619|0|1671|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|620|0|1674|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|621|0|1676|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|622|0|1678|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|623|0|1680|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|624|0|1682|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|625|0|1685|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|626|0|1687|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|627|0|1690|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|628|0|1693|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|629|0|1696|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|630|0|1699|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|631|0|1702|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|632|0|1710|0|{@{}@0|0|0|0|in0|.4782608695652174|@@@13840|0|}}
{2010501005|XXGpvertex|633|0|1715|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|function|partition_nbr|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Partition by Expression|2645000|575000|0|0|0|0|17307|PBE: Repartition records as per their previous partition order|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|634|0|1717|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|635|0|1720|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|636|0|1722|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|637|0|1724|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|638|0|1726|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|639|0|1729|0|{Distributes data records to its output flow partitions according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|function-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|function||20|2|RFO$|Function to partition on|{0|}}
{30001002|XXparameter|function.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_function|-use_package|3|2|RO$|Replaces function as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_function.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the flow() function defined in the package to specify the flow number.|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) index_out::partition_index(in)|3|2|H$|Use this instead of the function parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) index_out::partition_index(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|version 2.16: param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|version 2.16: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in;out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|640|0|1731|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010203004|XXGoport|641|0|1734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|642|0|1737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|643|0|1740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|644|0|1743|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|645|0|1750|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@2123000|613000|0|0|481000|303000|17148|PBKS-3|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|646|0|1752|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|647|0|1754|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|648|0|1756|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|649|0|1759|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|650|0|1763|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|651|0|1765|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|652|0|1767|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|653|0|1772|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|654|0|1776|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|655|0|1780|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Key||19|2|RFs$|Field to partition on|{0|}}
{30001002|XXparameter|InputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Max_core|100663296|1|2|F$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|OutputLayout|@9|2|RFs$||{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|656|0|1782|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|657|0|1784|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@2|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|658|0|1786|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|659|0|1789|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|660|0|1791|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|661|0|1793|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|662|0|1796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|663|0|1801|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@2|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|664|0|1803|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|665|0|1805|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|666|0|1808|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
{30001002|XXparameter|image__|unitool|3|2|H$|The image used if this component was a custom component|{0|}}
{30001002|XXparameter|Layout|@9|9|RF||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core||1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|1|RHl|The custom transformation|{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|10|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|667|0|1810|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|668|0|1813|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|669|0|1819|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|670|0|1822|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|671|0|1827|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.rcpdtp.reduced.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@2402000|529000|0|0|0|0|16724|RCPDTP_Reduced_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|672|0|1829|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|673|0|1831|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$PUB_DATAHUB_DML/ids_rxclaim/ids_rxclaim.rctc3p.reduced.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@2397000|449000|0|0|0|0|16723|RCTC3P_Reduced_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|674|0|1833|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010600005|XXGgraph|675|0|1836|0|{Subgraph created from graph "load.ids.icff"|{}@0|@11000|328500|0|0|0|0|17369|Read CLI IDS files and Remove Duplicates|Kimbo Mundy|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1106000|647000|3|}}
{2010210004|XXGflow|676|0|1838|0|{@{}@384|.5|.5|{0|}17207|17|}}
{2010210004|XXGflow|677|0|1840|0|{@{}@384|.5|.5|{0|}17239|17|}}
{2010210004|XXGflow|678|0|1842|0|{@{}@384|.5|.5|{0|}17230|17|}}
{2010501005|XXGpvertex|679|0|1849|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|913000|134000|0|0|0|0|17205|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|680|0|1851|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|681|0|1853|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|682|0|1855|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|683|0|1857|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|684|0|1859|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|685|0|1861|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|686|0|1864|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Key on which to remove duplicates|{0|}}
{30001002|XXparameter|select||20|2|FK$|Optional select expression|{0|}}
{30001002|XXparameter|keep|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|NoHidePorts|out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; dup=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select); dup=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation2|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|4|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|687|0|1866|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|688|0|1869|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|689|0|1872|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|690|0|1875|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|691|0|1878|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|692|0|1881|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|693|0|1884|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_ids.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_ids.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@396000|268000|0|0|0|0|17251|Unique IDS records|Ab Initio Software|@1|50|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|694|0|1886|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|695|0|1889|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|write|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|read|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|696|0|1891|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|697|0|1899|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.f_clm_hist_fix.ids.$RUN_ID.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.f_clm_hist_fix.ids.$RUN_ID.log|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|record
  string("\\n")[int] processed_ids_file_nm;
end;|3|1|l|@{0|}}
}}@0|@482000|402500|0|0|0|0|17237|Get Job Log|Ab Initio Software|@1|50|0||6||33025|-1|-1|}}
{2010202004|XXGiport|698|0|1901|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|699|0|1904|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|700|0|1906|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|701|0|1910|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|/* Only roll up job logs. */
out :: input_select(in) =
begin
  out :: starts_with(in.event_type, "Summary");
end;

/* Roll up all the job log entries for a given dataset. */
out :: rollup(in) =
begin
  out.processed_ids_file_nm :: string_split_no_empty(in.event_text, "\\n");
end;|3|9||@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|292000|375000|0|0|0|0|17240|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|702|0|1912|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|703|0|1915|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|704|0|1917|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|705|0|1919|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|706|0|1921|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|707|0|1924|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define rollup groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|output_without_input|Never|15|1|FKl|When to invoke the output_without_input transform function to produce an output record not corresponding to an input record.|{4|Never|At each computepoint|At each checkpoint|At component shutdown|}}
{30001002|XXparameter|output_without_input.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|param key-method True param sorted-input True version 2.11.1:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input|False|13|1|Fl|Input data should be processed in groups|{0|}}
{30001002|XXparameter|grouped_input.display_name|grouped-input|3|9|P|@{0|}}
{30001002|XXparameter|grouped_input.condition|param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped_input_display_values|Dataisnotgroupedbyamajorkey Dataisgroupedbyamajorkey|3|2|H$||{0|}}
{30001002|XXparameter|grouped_input_display_values.display_name|grouped-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|major_key||19|2|FK$|Major key into which data is grouped|{0|}}
{30001002|XXparameter|major_key.display_name|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.keyword|major-key|3|9|P|@{0|}}
{30001002|XXparameter|major_key.condition|param grouped-input True|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation7|optional out::output_without_input()|3|2|H$|Output when there are no input records|{0|}}
{30001002|XXparameter|operation7.condition|version 3.2.2.r15:|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|rollup|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 2.11.7.m1:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|rollup|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-rollup|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select); out=aggregate(key)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation12|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|708|0|1926|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|709|0|1929|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|710|0|1932|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|711|0|1935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|712|0|1938|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|713|0|1944|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|730000|145000|0|0|0|0|17208|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|714|0|1946|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|715|0|1949|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|716|0|1952|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|717|0|1954|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|718|0|1957|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|719|0|1963|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|package||3|9||@{0|}}
{30001002|XXparameter|select_expr|!is_null(orig_carrier_id)|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|388000|145000|0|0|0|0|17232|Supress NullCarriers|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|720|0|1965|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|721|0|1968|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|722|0|1971|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|723|0|1973|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|724|0|1975|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|725|0|1977|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|726|0|1980|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|727|0|1982|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|728|0|1985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|729|0|1988|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|730|0|1991|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|731|0|1994|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|732|0|1997|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|733|0|2006|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/f_clm_hist_fix_sup_updt/f_clm_supress_updates.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/f_clm_hist_fix_sup_updt/f_clm_supress_updates.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@789000|367500|0|0|0|0|17243|Supress Updates - View Data|Ab Initio Software|@1|50|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|734|0|2008|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|735|0|2010|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|736|0|2012|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|737|0|2015|0|{@{}@0|0|0|0|out0|.46774193548387094|@@@14352|0|}}
{2010501005|XXGpvertex|738|0|2020|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Replicate|3338000|877000|0|0|0|0|17311|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|739|0|2022|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|740|0|2027|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|741|0|2030|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|742|0|2032|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|743|0|2035|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|744|0|2041|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|988000|377000|0|0|0|0|16994|Replicate-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|745|0|2043|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|746|0|2049|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|747|0|2052|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|748|0|2054|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|749|0|2057|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|750|0|2063|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1546000|550000|0|0|0|0|17184|Replicate-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|751|0|2065|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|752|0|2069|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|753|0|2072|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|754|0|2074|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|755|0|2077|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|756|0|2083|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1620000|551000|0|0|0|0|17094|Replicate-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|757|0|2085|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|758|0|2089|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|759|0|2092|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|760|0|2094|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|761|0|2097|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|762|0|2103|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1374000|560000|0|0|0|0|17110|Replicate-4|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|763|0|2105|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|764|0|2109|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|765|0|2112|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|766|0|2114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|767|0|2117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|768|0|2123|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1690000|552000|0|0|0|0|17098|Replicate-5|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|769|0|2125|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|770|0|2129|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|771|0|2132|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|772|0|2134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|773|0|2137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|774|0|2143|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1381000|342500|0|0|0|0|17114|Replicate-6|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|775|0|2145|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|776|0|2149|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|777|0|2152|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|778|0|2154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|779|0|2157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|780|0|2163|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1765000|554000|0|0|0|0|17102|Replicate-7|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|781|0|2165|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|782|0|2169|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|783|0|2172|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|784|0|2174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|785|0|2177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|786|0|2183|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|274000|376000|0|0|0|0|17228|Replicate-8|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|787|0|2185|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|788|0|2189|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|789|0|2192|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|790|0|2194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|791|0|2197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|792|0|2203|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{record_nbr\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Sort|2905000|604000|0|0|0|0|17304|SORT \{record_nbr\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|793|0|2205|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|794|0|2208|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|795|0|2211|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to sort on|{0|}}
{30001002|XXparameter|max_core|100663296|1|2|FK$|maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|796|0|2213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|797|0|2216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|798|0|2222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$SPLIT_IDS_NK_DML|3|9|j|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
}}@0|@787000|284000|0|0|0|0|17229|SPLIT_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|799|0|2224|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010501005|XXGpvertex|800|0|2227|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: 
'include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";

let lookup_identifier_type current_lookup = lookup_not_loaded(); 
let lookup_identifier_type current_lookup1 = lookup_not_loaded(); 
let string("") rctc3pdatafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/rctc3p.reduced.dat.gz";
let string("") rcpdtpdatafile = "' + PUB_DATAHUB_MFS_LOOKUP + '/ids/ids_rxclaim/one/rcpdtp.reduced.dat.gz";
let string("") rctc3pindexfile=this_partition_path(string_replace(rctc3pdatafile,".dat.gz", ".idx"));
let string("") rcpdtpindexfile=this_partition_path(string_replace(rcpdtpdatafile,".dat.gz", ".idx"));
type lookup_record_type = ' + read_type(PUB_DATAHUB_DML + "/ids_rxclaim/ids_rxclaim.rctc3p.reduced.dml") +  ';
type lookup_record_type1 = ' + read_type(PUB_DATAHUB_DML + "/ids_rxclaim/ids_rxclaim.rcpdtp.reduced.dml") +  ';

out::reformat(in)=
begin 
  let lookup_record_type lookup_record_value = allocate_with_nulls();
  let lookup_record_type exact_record_value=allocate_with_defaults();
  let lookup_record_type exact_next_record_value=allocate_with_nulls();
  
  let lookup_record_type1 lookup_record_value1 = allocate_with_nulls();
  let lookup_record_type1 exact_record_value1=allocate_with_defaults();
  let lookup_record_type1 exact_next_record_value1=allocate_with_nulls();
  
  let unsigned integer(8) dxf_hk_part1 = in.dxf_hk_part1;
  let unsigned integer(8) dxf_hk_part2 = in.dxf_hk_part2;

  let decimal("") match_count = 0 ;
  let decimal("") match_count1 = 0 ;
  
  if (current_lookup == lookup_not_loaded()) 
  current_lookup = lookup_load(this_partition_path(rctc3pdatafile) ,rctc3pindexfile, "RCTC3P_Reduced_LKP_TPL"); 

  lookup_record_value = if (current_lookup != lookup_not_loaded() ) lookup_last(current_lookup, "RCTC3P_Reduced_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value=allocate_with_defaults();
  exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "RCTC3P_Reduced_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "RCTC3P_Reduced_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup,"RCTC3P_Reduced_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end;
                       
  if (current_lookup1 == lookup_not_loaded()) 
  current_lookup1 = lookup_load(this_partition_path(rcpdtpdatafile) ,rcpdtpindexfile, "RCPDTP_Reduced_LKP_TPL"); 

  lookup_record_value1 = if (current_lookup1 != lookup_not_loaded() ) lookup_last(current_lookup1, "RCPDTP_Reduced_LKP_TPL", dxf_hk_part1) else allocate_with_defaults() ;
  exact_record_value1=allocate_with_defaults();
  exact_record_value1 = if (lookup_record_value1.dxf_hk_part1 ==0 ) lookup_record_value1               // No Match found on half hash key , So this is insert record.
                      else if  ( dxf_hk_part2 == lookup_record_value1.dxf_hk_part2 ) lookup_record_value1  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count1=lookup_count(current_lookup1, "RCPDTP_Reduced_LKP_TPL", dxf_hk_part1);
                          begin block exact_record_match1
                             for (let int k, k < match_count1)
                               begin 
                                exact_next_record_value1 = if( k == 0 ) lookup_last(current_lookup1, "RCPDTP_Reduced_LKP_TPL", dxf_hk_part1) else lookup_previous(current_lookup1,"RCPDTP_Reduced_LKP_TPL");
                                 if ( dxf_hk_part2 == exact_next_record_value1.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value1 = exact_next_record_value1;
                                        exit  exact_record_match1;
                                  end
                                                                                                 
                             end
                          end block exact_record_match1
                       result :: exact_record_value1 ;
                       end;    
                       
  //out.is_match :: if( exact_record_value.dxf_hk_part1 == 0 and exact_record_value.dxf_hk_part2==0 ) 0 else 1 ;  
  out.(*, name member [vector "dxf_sk", "dxf_hk_part1", "dxf_hk_part2", "dxf_src_sys_id", "ids_create_dttm", "ids_create_uid", "ids_create_run_id", "ids_updt_dttm", "ids_updt_uid", "ids_updt_run_id", "ids_rec_stat_cd"]) :1: in.*;
  
  out.day_90_prog_type :2: first_defined(if(in.src_env_sk not member [vector 480, 490] && starts_with(exact_record_value.riirhf, "ORXMSSVRP")) "P"
                                else if(in.src_env_sk not member [vector 480, 490] && starts_with(exact_record_value.riirhf , "ORXMSSVR")) "S"
                                else if(in.src_env_sk not member [vector 480, 490] && starts_with(exact_record_value.riirhf , "ORXMSMS")) "M"
                                else if(in.src_env_sk not member [vector 480, 490] && starts_with(exact_record_value.riirhf , "ORX90SP")) "B"
                                else if(in.src_env_sk not member [vector 480, 490] && starts_with(exact_record_value.riirhf , "ORX90S")) "A"
                                else if(in.src_env_sk == 490 && in.day_90_prog_type != "N") in.day_90_prog_type
                                else if(in.src_env_sk == 490 && starts_with(exact_record_value.riodcd , "UXMSP")) "P"
                                else if(in.src_env_sk == 490 && starts_with(exact_record_value.riodcd , "UXMSS")) "S"
                                else if(in.src_env_sk == 490 && starts_with(exact_record_value.riodcd , "UXMSMS")) "M"
                                else if(in.src_env_sk == 490 && starts_with(exact_record_value.riodcd , "UXS9P")) "B"
                                else if(in.src_env_sk == 490 && starts_with(exact_record_value.riodcd , "UXS9S")) "A"
                                else if(in.src_env_sk == 480 && starts_with(exact_record_value.riirhf , "ORXMSSVRP")) "P"
                                else if(in.src_env_sk == 480 && starts_with(exact_record_value.riirhf , "ORXMSSVR")) "S"
                                else if(in.src_env_sk == 480 && starts_with(exact_record_value.riirhf , "ORXMSMS")) "M"
                                else if(in.src_env_sk == 480 && starts_with(exact_record_value.riirhf , "ORX90SP")) "B"
                                else if(in.src_env_sk == 480 && starts_with(exact_record_value.riirhf , "ORX90S")) "A"
                                else "N", "N");
                                
  out.pdt_cost_type_unit_cost :2: exact_record_value1.e0yfp1;
  out.pdt_cost_type_unit_cost :3: in.pdt_cost_type_unit_cost;
  
  out.*            :3: in.* ; // Copied values from CLI file that are not modified.
end ;';

end

]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|2365000|586500|0|0|0|0|17287|Unload and assign from Reduced IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|801|0|2229|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|802|0|2232|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|803|0|2234|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|804|0|2236|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|805|0|2238|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|806|0|2241|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|807|0|2243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|808|0|2247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|809|0|2250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|810|0|2253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|811|0|2256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|812|0|2264|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
}}@0|@3514000|839000|0|0|0|0|17365|Write Datastore Files|Mukesh Singh|Created 8/30/2017 4:46:33 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|896000|436000|3|}}
{2010210004|XXGflow|813|0|2266|0|{@{}@384|.5|.5|{0|}17|17|}}
{2010210004|XXGflow|814|0|2268|0|{@{}@384|.5|.5|{0|}26|529|}}
{2010210004|XXGflow|815|0|2270|0|{@{}@384|.5|.5|{0|}27|17|}}
{2010501005|XXGpvertex|816|0|2272|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Replicate|121000|184000|0|0|0|0|6|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|817|0|2274|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|818|0|2278|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|819|0|2280|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|820|0|2282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|821|0|2285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|822|0|2291|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|use_package|True|3|1|l|@{0|}}
{30001002|XXparameter|package|$[
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
type lookup_record_type = ' + XREF_KEY_FILE_DML + ';' +
'
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value = allocate_with_defaults();
let lookup_record_type exact_next_record_value = allocate_with_nulls();

/*Use this instead of the select_expr parameter when use_package is true.*/
select_out::select(in)=
begin
let integer(2) match_count=0;
if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("' + XREF_KEY_INDEX_FILE + '"), "XREF_LKP_TPL");  
 lookup_record_value = first_defined(lookup(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1),allocate_with_defaults());
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1) else lookup_previous(current_lookup,"XREF_LKP_TPL");
                                 if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end ; 
                       
select_out :: if (exact_record_value.dxf_hk_part1==0 && exact_record_value.dxf_hk_part2==0) 1 else 0; //Exact match goes as update and nonmatches goes as insert.                       

end;'
]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Filter by Expression|310000|50000|0|0|0|0|28|Select New NK's to append to XREF file|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|823|0|2293|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|824|0|2296|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|825|0|2298|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|826|0|2300|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|827|0|2302|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|828|0|2304|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|829|0|2307|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|830|0|2309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|831|0|2312|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|832|0|2315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|833|0|2318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|834|0|2321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|835|0|2324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|836|0|2332|0|{Subgraph created from graph "Write Datastore Files"|{}@0|@313500|238500|0|0|0|0|18|Write Multi ICFF|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|634000|252000|3|}}
{2010240003|XXGlegend|837|0|2334|0|{@{}@Write Fact Datasets in IDS many folder|0|-78000|0|0|0|0|11538|}}
{2010242002|XXGface|838|0|2336|0|{@{}@Arial Narrow|0|100|0|}}
{2010210004|XXGflow|839|0|2339|0|{@{}@384|.5|.5|{0|}11540|17|}}
{2010501005|XXGpvertex|840|0|2342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Replicate|309000|87000|0|0|0|0|11524|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|841|0|2344|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|842|0|2347|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|843|0|2350|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|844|0|2352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|845|0|2355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|846|0|2361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|type output_type = void(integer(4));
 
/*extract filename from input record*/
filename::get_filename(in)=
begin
   filename :: in.filename;
end;
 
/*Create output record*/
write::reformat(in)=
begin
   write :: in.data;
end;|3|1|l|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|write_stripped|Strip length prefix or delimiter|3|1|l|@{0|}}
{30001002|XXparameter|permissions|700|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|@427000|77000|0|0|0|0|11541|WMF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|847|0|2363|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|848|0|2365|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|849|0|2367|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|850|0|2369|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|851|0|2372|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|RFKl|The output file format: 'uninterpreted' (raw data), 'orc' (ORC format), 'parquet' (Parquet format), 'seqfile' (Hadoop sequence file) .|{4|uninterpreted|orc|parquet|seqfile|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files.|{0|}}
{30001002|XXparameter|compressed|False|13|1|FKl|If True, compress output files using AB_DEFAULT_COMPRESSION_LEVEL|{0|}}
{30001002|XXparameter|compressed.condition|param format uninterpreted|3|15|P?|@{0|}}
{30001002|XXparameter|write_options_condition|value format uninterpreted False value format * True default constant True|13|13|v|Hidden condition for deciding write-options visibility|{0|}}
{30001002|XXparameter|write_options||3|2|FK$|A comma-separated list of key-value pairs. The key-value pair option is format specific.|{0|}}
{30001002|XXparameter|write_options.display_name|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.keyword|write-options|3|9|P|@{0|}}
{30001002|XXparameter|write_options.condition|param write_options_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|write_stripped|Do not strip; retain length prefix or delimiter|15|1|Fl|Controls whether any size prefix or delimiter is removed from records before they are written to the file|{2|Do not strip; retain length prefix or delimiter|Strip length prefix or delimiter|}}
{30001002|XXparameter|write_stripped.display_name|write-stripped|3|9|P|@{0|}}
{30001002|XXparameter|write_stripped.condition|version 2.14.9:|3|15|P?|@{0|}}
{30001002|XXparameter|write_raw_data|value write-stripped Do* 0 value write-stripped Strip* 1 default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|permissions|660|3|2|FK$|unix-style numeric permissions mask for newly created files|{0|}}
{30001002|XXparameter|file_limits|Files (Limited by number of output files)|15|1|Fl|Limits the number of files that can be open simultaneously|{3|None (No limits on resource usage)|Memory (Limited by total memory usage)|Files (Limited by number of output files)|}}
{30001002|XXparameter|file_limits.display_name|file-limits|3|9|P|@{0|}}
{30001002|XXparameter|max_core|13107200|1|2|FK$|Maximum memory usage (for file output buffers) in bytes. This corresponds to 100 open files|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param file-limits Memory*|3|15|P?|@{0|}}
{30001002|XXparameter|max_files|100|1|2|FK$|Maximum number of simultaneously open files|{0|}}
{30001002|XXparameter|max_files.display_name|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.keyword|max-files|3|9|P|@{0|}}
{30001002|XXparameter|max_files.condition|param file-limits Files*|3|15|P?|@{0|}}
{30001002|XXparameter|create_directories|False|13|1|FKl|If True, create any parent directories as necessary|{0|}}
{30001002|XXparameter|create_directories.display_name|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.keyword|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.condition|version 2.15.5.r32:|3|15|P?|@{0|}}
{30001002|XXparameter|atomic|False|13|1|FKl|If True, file is spooled to temporary, and then renamed atomically|{0|}}
{30001002|XXparameter|atomic.condition|param overwrite True version 3.1.3.r16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_intermediate||15|1|Fl|Frequency of intermediate records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_intermediate.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation2_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|852|0|2374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|853|0|2377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|854|0|2380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|855|0|2383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|856|0|2389|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|857|0|2393|0|{Subgraph created from graph "Write Datastore Files"|{}@0|@570000|58250|0|0|0|0|25|Write XREF Files|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|535000|202000|3|}}
{2010210004|XXGflow|858|0|2395|0|{@{}@384|.5|.5|{0|}10810|17|}}
{2010501005|XXGpvertex|859|0|2397|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|40000|46500|0|0|0|0|10806|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|860|0|2399|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|861|0|2402|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|862|0|2404|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|863|0|2406|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|864|0|2408|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|865|0|2410|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|866|0|2412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|867|0|2416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|868|0|2419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|869|0|2422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|870|0|2425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|871|0|2431|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@308000|30000|0|0|0|0|10811|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|686000|324000|3|}}
{2010210004|XXGflow|872|0|2435|0|{@{}@384|.5|.5|{0|}10599|17|}}
{2010503005|XXGfvertex|873|0|2437|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@4|@599000|115000|0|0|0|0|10593|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|874|0|2439|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|875|0|2442|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|876|0|2444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|877|0|2447|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|@125000|105000|0|0|0|0|10600|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|878|0|2449|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|879|0|2452|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|880|0|2455|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|881|0|2457|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|882|0|2459|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|key_index key|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|RFKl|Package containing the create_output_address transform function.|{0|}}
{30001002|XXparameter|package.condition|version 2.15.5.r34: param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|flags|+block_compressed|3|2|K$||{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=in,w|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|1|1|2|H$|Number of steps in package|{0|}}
{30001002|XXparameter|operation1|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation1_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|883|0|2461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|884|0|2464|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|885|0|2467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|886|0|2470|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|887|0|2477|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@3|@439000|250000|0|0|0|0|10583|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|888|0|2479|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|889|0|2482|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|890|0|2484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|891|0|2488|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|892|0|2492|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|893|0|2496|0|{@{}@0|0|0|0|in0|.5165876777251185|@@@13840|0|}}
{2010600005|XXGgraph|894|0|2500|0|{Subgraph created from graph "fix"|{}@0|@3516000|977500|0|0|0|0|17363|Write - Event Data Store -Insert & Update|spulikon|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|693000|374000|7|}}
{2010210004|XXGflow|895|0|2502|0|{@{}@384|.5|.5|{0|}17357|17|}}
{2010210004|XXGflow|896|0|2504|0|{@{}@384|.5|.5|{0|}17358|17|}}
{2010210004|XXGflow|897|0|2506|0|{@{}@384|.5|.5|{0|}17355|2065|}}
{2010210004|XXGflow|898|0|2508|0|{@{}@384|.5|.5|{0|}17352|2065|}}
{2010503005|XXGfvertex|899|0|2510|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INSERT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INSERT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@3|@606000|101000|0|0|0|0|15569|Insert|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|900|0|2512|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|901|0|2515|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1455153111|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|902|0|2517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|903|0|2520|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|use_package|True|3|1|l|@{0|}}
{30001002|XXparameter|package|$[
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
type lookup_record_type = ' + XREF_KEY_FILE_DML + ';' +
'
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value = allocate_with_defaults();
let lookup_record_type exact_next_record_value = allocate_with_nulls();

/*Use this instead of the select_expr parameter when use_package is true.*/
select_out::select(in)=
begin
let integer(2) match_count=0;
if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("' + XREF_KEY_INDEX_FILE + '"), "XREF_LKP_TPL");  
 lookup_record_value = first_defined(lookup(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1),allocate_with_defaults());
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "XREF_LKP_TPL", in.dxf_hk_part1) else lookup_previous(current_lookup,"XREF_LKP_TPL");
                                 if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end ; 
                       
select_out :: if (exact_record_value.dxf_hk_part1==0 && exact_record_value.dxf_hk_part2==0) 1 else 0; //Exact match goes as update and nonmatches goes as insert.                       

end;'
]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Filter by Expression|65000|135000|0|0|0|0|17359|Non match goes as Insert else Update|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|904|0|2522|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|905|0|2525|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|906|0|2528|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|907|0|2530|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|908|0|2532|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|909|0|2534|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|910|0|2536|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|select_expr||20|2|RFO$|Filter expression|{0|}}
{30001002|XXparameter|select_expr.condition|param use_package False|3|15|P?|@{0|}}
{30001002|XXparameter|no_select_expr|-use_package|3|2|RO$|Replaces select_expr as the positional argument when use_package is true|{0|}}
{30001002|XXparameter|no_select_expr.condition|param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|use_package|False|13|1|Fl|If true, use the select() function defined in the package|{0|}}
{30001002|XXparameter|use_package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
{30001002|XXparameter|operation1.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|operation1_analysis|skip_missing integer(8) select_out::select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation1_analysis.condition|version 2.16: param use_package True|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; out=in; deselect=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select_out); deselect=filter_xfr(package.select_out);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|911|0|2538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|912|0|2541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|913|0|2544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|914|0|2547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|915|0|2550|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|916|0|2553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|917|0|2556|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$UPDATE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$UPDATE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
}}@3|@603000|270500|0|0|0|0|15571|Update|Ab Initio Software|@1|50|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|918|0|2558|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|919|0|2561|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1455153111|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|920|0|2563|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|921|0|2566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|340000|243000|0|0|0|0|17356|RFMT: Drop NK Fields if any-Update|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|922|0|2568|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|923|0|2571|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|924|0|2573|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|925|0|2575|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|926|0|2577|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|927|0|2580|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|928|0|2582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|929|0|2586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|930|0|2589|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|931|0|2592|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|932|0|2595|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|933|0|2605|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Reformat|344000|72000|0|0|0|0|17353|RFMT: Drop NK Fields if any-Insert|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|934|0|2607|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|935|0|2610|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|936|0|2612|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|937|0|2614|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|938|0|2616|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|939|0|2619|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|select||20|2|FK$|Filter expression before reformatting|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.999.m999|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|output_index||8|1|FKl|Output index computation|{0|}}
{30001002|XXparameter|output_index.display_name|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index.keyword|output-index|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_index_port.display_name|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_port.keyword|output-index_port|3|9|P|@{0|}}
{30001002|XXparameter|output_index_signature|int output_index_out::output_index(in)|3|2|H$|Function returning index of output port|{0|}}
{30001002|XXparameter|output_index_signature.display_name|output-index_signature|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes||8|1|FKl|Output index vector computation|{0|}}
{30001002|XXparameter|output_indexes.display_name|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes.keyword|output-indexes|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port|discriminator|3|2|FHK$|Output index port for debugger|{0|}}
{30001002|XXparameter|output_indexes_port.display_name|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_port.keyword|output-indexes_port|3|9|P|@{0|}}
{30001002|XXparameter|output_indexes_signature|int[int] output_indices_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
{30001002|XXparameter|output_indexes_signature.display_name|output-indexes_signature|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|940|0|2621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|941|0|2625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|942|0|2628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|943|0|2631|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|944|0|2634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|945|0|2642|0|{@{}@0|0|0|0|in0|.4269340974212034|@@@13840|0|}}
{2010600005|XXGgraph|946|0|2646|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/write_event_log.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|ETL_APP_ID|$ETL_APP_ID|3|9||@{0|}}
{30001002|XXparameter|UPDATE_FILE|$UPDATE_FILE|3|9||@{0|}}
{30001002|XXparameter|DATASET_NM|$[
if(OUTPUT_FILE_TYPE == "INSERT") 
        TARGET_NAME
else
        SOURCE_NAME;
]|3|9||@{0|}}
}}@0|@3528000|1191000|0|0|0|0|17344|Write            Event   Log|||1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|740000|456000|1|}}
{2010210004|XXGflow|947|0|2648|0|{@{}@384|.5|.5|{0|}13376|17|}}
{2010501005|XXGpvertex|948|0|2650|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@4|Create Data|57000|147500|0|0|0|0|13377|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|949|0|2652|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|950|0|2655|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|951|0|2657|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|952|0|2659|0|{|{}@4|@341000|154500|0|0|0|0|13375|Output Event File|Ab Initio Software|@1|400|0||6||33025|-1|-1|}}
{2010202004|XXGiport|953|0|2661|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|954|0|2666|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
{30001002|XXparameter|EVENT_CHANNEL_ID|1|3|9|FK|@{0|}}
{30001002|XXparameter|INSERT_FILE|$INSERT_FILE|3|9|RFK||{0|}}
{30001002|XXparameter|UPDATE_FILE||3|9|FK||{0|}}
{30001002|XXparameter|DATASET_NM|$IDS_META_STRING|3|9|RFK||{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$EVENT_LOG_FILE|3|9|RFK||{0|}}
{30001002|XXparameter|IDS_TABLE_NAME|$DATASET_NM|3|9|FK|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1482151553|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|ETL_APP_ID|$(whoami)|3|9|RFK||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@1245000|482500|0|0|0|0|13514|Write            Event   Log|||1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|740000|456000|3|}}
{2010210004|XXGflow|955|0|2668|0|{@{}@384|.5|.5|{0|}13376|17|}}
{2010501005|XXGpvertex|956|0|2670|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|let datetime("YYYYMMDDHH24MISS") curent_datetime=(datetime("YYYYMMDDHH24MISS")) now();
// let int v_insert_file_sep_id=length_of(string_split("$\{INSERT_FILE\}","/")) ;
// let int v_update_file_sep_id=length_of(string_split("$\{UPDATE_FILE\}","/"));
//Above code is commented out on 06/01 , As there is possibilty that it may be reverted back .
out::create(index) = begin
  out.channel_id :: $\{EVENT_CHANNEL_ID\};
  out.ids_table_name:: "$\{IDS_TABLE_NAME\}";
  out.data_date :: (date("YYYYMMDD")) now();
  out.ids_create_dttm:: curent_datetime;
   out.insert_file:: "$\{INSERT_FILE\}";
  out.update_file :: "$\{UPDATE_FILE\}" ;
  out.ids_updt_dttm ::  curent_datetime;
  out.ids_create_uid :: "$\{ETL_APP_ID\}";
  out.ids_updt_uid :: "$\{ETL_APP_ID\}";
  out.ids_create_run_id :: "$\{RUN_ID\}";
  out.ids_updt_run_id :: "$\{RUN_ID\}";
  out.created ::   curent_datetime;
end;|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Create Data|57000|147500|0|0|0|0|13377|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|957|0|2672|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|958|0|2675|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|959|0|2677|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|960|0|2679|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out :: random_value();
end;|8|1|FOl|DML function|{0|}}
{30001002|XXparameter|identical_records|False|13|1|FKl|Whether to evaluate the transform once only, or once for each record|{0|}}
{30001002|XXparameter|identical_records.display_name|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records.keyword|identical-records|3|9|P|@{0|}}
{30001002|XXparameter|identical_records_display_values|Evaluattransforanefoeacrecord Evaluattransforoncanusthavalufoalrecords|3|2|H$||{0|}}
{30001002|XXparameter|identical_records_display_values.display_name|identical-records-display-values|3|9|P|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|1|1|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint|0|15|1|RFKl|Frequency of checkpoint records to log|{2|0|1|}}
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|continuous|False|13|1|RFOl|Whether to produce checkpoints or computepoints.|{0|}}
{30001002|XXparameter|checkpoint_interval|1|1|2|FO$|Number of records between checkpoints, or 0 to indicate that no checkpoints are to be generated.|{0|}}
{30001002|XXparameter|checkpoint_interval.display_name|checkpoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|checkpoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|computepoint_interval|0|1|2|FO$|Number of records between computepoints, or 0 to indicate that no computepoints are to be generated.|{0|}}
{30001002|XXparameter|computepoint_interval.display_name|computepoint-interval|3|9|P|@{0|}}
{30001002|XXparameter|computepoint_interval.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|do_timed_checkpoints|False|13|1|FKl|Generate checkpoints at timed intervals|{0|}}
{30001002|XXparameter|do_timed_checkpoints.display_name|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.keyword|do-timed-checkpoints|3|9|P|@{0|}}
{30001002|XXparameter|do_timed_checkpoints.condition|param continuous True|3|15|P?|@{0|}}
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::create(unsigned long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|961|0|2681|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|962|0|2684|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|963|0|2687|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|964|0|2690|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_LOG_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$EVENT_LOG_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|include "~$PUB_DXF_DML/event/event.dml";
metadata type = event_type;|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@4|@341000|154500|0|0|0|0|13375|Output Event File|Ab Initio Software|@1|400|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|965|0|2692|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|966|0|2695|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|eme_index_location||3|2|F$|Place in the EME to create a dataset corresponding to this index.|{0|}}
{30001002|XXparameter|eme_index_location.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|index_url||28|2|F$|The URL of the index for this lookup file (optional)|{0|}}
{30001002|XXparameter|index_url.condition|param direct_addressed False mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block Compressed|{0|}}
{30001002|XXparameter|block_compressed.condition|mode lookup version 2.15.2.r23:|3|15|P?|@{0|}}
{30001002|XXparameter|either_or|value block_compressed True True sameas keep_on_disk default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|Layout||28|2|RF$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|967|0|2697|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|968|0|2700|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$XREF_KEY_FILE_DML|3|9|j|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|1|l|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@0|@3716000|867000|0|0|0|0|17360|XREF_LKP_TPL|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|969|0|2702|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x1200|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|Layout|file:/~null|28|9|RF||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|RecordFormat||7|2|RF$|Record Format|{0|}}
{30001002|XXparameter|key||19|2|RF$|Key specifier For Lookup File|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False mode lookup|3|15|P?|@{0|}}
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010110002|XXGconstant|970|0|2704|0|{@{}@{1|1368806|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_10|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_11|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_12|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_13|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_14|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_15|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_16|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_17|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_18|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_19|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_2|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_21|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_22|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_23|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_24|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_25|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_26|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_27|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_29|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_3|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_30|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_31|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_32|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_33|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_34|}1|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_35|}1|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_36|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_37|}1|37|}
{2010604001|XXGgraph_flow_flow|37|0|74|0|{Flow_38|}1|38|}
{2010604001|XXGgraph_flow_flow|38|0|76|0|{Flow_4|}1|39|}
{2010604001|XXGgraph_flow_flow|39|0|78|0|{Flow_5|}1|40|}
{2010604001|XXGgraph_flow_flow|40|0|80|0|{Flow_6|}1|41|}
{2010604001|XXGgraph_flow_flow|41|0|82|0|{Flow_7|}1|42|}
{2010604001|XXGgraph_flow_flow|42|0|84|0|{Flow_8|}1|43|}
{2010604001|XXGgraph_flow_flow|43|0|86|0|{Flow_9|}1|44|}
{2010601001|XXGgraph_vertex_vertex|44|0|88|0|{CTRX_Data|}1|45|}
{2010211001|XXGvertex_iport_iport|45|0|90|0|{0|write|}45|46|}
{2010214001|XXGiport_src_flow|46|0|92|0|{0|}46|27|}
{2010007001|XXGobject_proto_object|47|0|93|0|{}45|47|}
{2010211001|XXGvertex_iport_iport|48|0|95|0|{0|write|}47|48|}
{2010006001|XXGobject_psameas_object|49|0|97|0|{metadata|write_metadata|1|0|}48|47|}
{2010006001|XXGobject_psameas_object|50|0|98|0|{write_metadata|out1_metadata|0|0|}45|49|}
{2010212001|XXGvertex_oport_oport|51|0|100|0|{0|out0|}49|50|}
{2010213001|XXGoport_dst_flow|52|0|102|0|{0|}50|28|}
{2010212001|XXGvertex_oport_oport|53|0|103|0|{1|out1|}49|51|}
{2010213001|XXGoport_dst_flow|54|0|105|0|{0|}51|33|}
{2010212001|XXGvertex_oport_oport|55|0|106|0|{2|reject0|}49|52|}
{2010212001|XXGvertex_oport_oport|56|0|108|0|{3|reject1|}49|53|}
{2010212001|XXGvertex_oport_oport|57|0|110|0|{4|error0|}49|54|}
{2010212001|XXGvertex_oport_oport|58|0|112|0|{5|error1|}49|55|}
{2010212001|XXGvertex_oport_oport|59|0|114|0|{6|log|}49|56|}
{2010211001|XXGvertex_iport_iport|60|0|116|0|{0|in|}49|57|}
{2010214001|XXGiport_src_flow|61|0|118|0|{0|}57|21|}
{2010007001|XXGobject_proto_object|62|0|119|0|{}49|58|}
{2010212001|XXGvertex_oport_oport|63|0|121|0|{0|out0|}58|59|}
{2010006001|XXGobject_psameas_object|64|0|123|0|{metadata|out0_metadata|1|0|}59|58|}
{2010006001|XXGobject_psameas_object|65|0|124|0|{transform0|transform0|1|0|}59|58|}
{2010212001|XXGvertex_oport_oport|66|0|125|0|{1|out1|}58|60|}
{2010006001|XXGobject_psameas_object|67|0|127|0|{metadata|out1_metadata|1|0|}60|58|}
{2010006001|XXGobject_psameas_object|68|0|128|0|{transform1|transform1|1|0|}60|58|}
{2010212001|XXGvertex_oport_oport|69|0|129|0|{2|reject0|}58|61|}
{2010006001|XXGobject_psameas_object|70|0|131|0|{metadata|reject0_metadata|1|0|}61|58|}
{2010212001|XXGvertex_oport_oport|71|0|132|0|{3|reject1|}58|62|}
{2010006001|XXGobject_psameas_object|72|0|134|0|{metadata|reject1_metadata|1|0|}62|58|}
{2010212001|XXGvertex_oport_oport|73|0|135|0|{4|error0|}58|63|}
{2010006001|XXGobject_psameas_object|74|0|137|0|{metadata|error0_metadata|1|0|}63|58|}
{2010212001|XXGvertex_oport_oport|75|0|138|0|{5|error1|}58|64|}
{2010006001|XXGobject_psameas_object|76|0|140|0|{metadata|error1_metadata|1|0|}64|58|}
{2010212001|XXGvertex_oport_oport|77|0|141|0|{6|log|}58|65|}
{2010006001|XXGobject_psameas_object|78|0|143|0|{metadata|log_metadata|1|0|}65|58|}
{2010211001|XXGvertex_iport_iport|79|0|144|0|{0|in|}58|66|}
{2010006001|XXGobject_psameas_object|80|0|146|0|{metadata|in_metadata|1|0|}66|58|}
{2010006001|XXGobject_psameas_object|81|0|147|0|{Layout|Layout|0|0|}49|67|}
{2010211001|XXGvertex_iport_iport|82|0|149|0|{0|write|}67|68|}
{2010214001|XXGiport_src_flow|83|0|151|0|{0|}68|29|}
{2010007001|XXGobject_proto_object|84|0|152|0|{}67|69|}
{2010211001|XXGvertex_iport_iport|85|0|154|0|{0|write|}69|70|}
{2010006001|XXGobject_psameas_object|86|0|156|0|{metadata|write_metadata|1|0|}70|69|}
{2010006001|XXGobject_psameas_object|87|0|157|0|{write_metadata|out0_metadata|0|0|}67|49|}
{2010006001|XXGobject_psameas_object|88|0|158|0|{in_metadata|out0_metadata|0|0|}49|71|}
{2010212001|XXGvertex_oport_oport|89|0|160|0|{0|out0|}71|72|}
{2010213001|XXGoport_dst_flow|90|0|162|0|{0|}72|23|}
{2010212001|XXGvertex_oport_oport|91|0|163|0|{1|reject0|}71|73|}
{2010212001|XXGvertex_oport_oport|92|0|165|0|{2|error0|}71|74|}
{2010212001|XXGvertex_oport_oport|93|0|167|0|{3|log|}71|75|}
{2010211001|XXGvertex_iport_iport|94|0|169|0|{0|in|}71|76|}
{2010214001|XXGiport_src_flow|95|0|171|0|{0|}76|40|}
{2010007001|XXGobject_proto_object|96|0|172|0|{}71|77|}
{2010212001|XXGvertex_oport_oport|97|0|174|0|{0|out0|}77|78|}
{2010006001|XXGobject_psameas_object|98|0|176|0|{metadata|out0_metadata|1|0|}78|77|}
{2010006001|XXGobject_psameas_object|99|0|177|0|{transform0|transform0|1|0|}78|77|}
{2010212001|XXGvertex_oport_oport|100|0|178|0|{1|reject0|}77|79|}
{2010006001|XXGobject_psameas_object|101|0|180|0|{metadata|reject0_metadata|1|0|}79|77|}
{2010212001|XXGvertex_oport_oport|102|0|181|0|{2|error0|}77|80|}
{2010006001|XXGobject_psameas_object|103|0|183|0|{metadata|error0_metadata|1|0|}80|77|}
{2010212001|XXGvertex_oport_oport|104|0|184|0|{3|log|}77|81|}
{2010006001|XXGobject_psameas_object|105|0|186|0|{metadata|log_metadata|1|0|}81|77|}
{2010211001|XXGvertex_iport_iport|106|0|187|0|{0|in|}77|82|}
{2010006001|XXGobject_psameas_object|107|0|189|0|{metadata|in_metadata|1|0|}82|77|}
{2010006001|XXGobject_psameas_object|108|0|190|0|{Layout|Layout|0|0|}71|83|}
{2010211001|XXGvertex_iport_iport|109|0|192|0|{0|write|}83|84|}
{2010214001|XXGiport_src_flow|110|0|194|0|{0|}84|26|}
{2010007001|XXGobject_proto_object|111|0|195|0|{}83|85|}
{2010211001|XXGvertex_iport_iport|112|0|197|0|{0|write|}85|86|}
{2010006001|XXGobject_psameas_object|113|0|199|0|{metadata|write_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|114|0|200|0|{write_metadata|out0_metadata|0|0|}83|71|}
{2010006001|XXGobject_psameas_object|115|0|201|0|{in_metadata|out0_metadata|0|0|}71|87|}
{2010212001|XXGvertex_oport_oport|116|0|203|0|{0|out0|}87|88|}
{2010213001|XXGoport_dst_flow|117|0|205|0|{0|}88|40|}
{2010212001|XXGvertex_oport_oport|118|0|206|0|{1|reject0|}87|89|}
{2010212001|XXGvertex_oport_oport|119|0|208|0|{2|error0|}87|90|}
{2010212001|XXGvertex_oport_oport|120|0|210|0|{3|log|}87|91|}
{2010211001|XXGvertex_iport_iport|121|0|212|0|{0|in|}87|92|}
{2010214001|XXGiport_src_flow|122|0|214|0|{0|}92|38|}
{2010007001|XXGobject_proto_object|123|0|215|0|{}87|93|}
{2010212001|XXGvertex_oport_oport|124|0|217|0|{0|out0|}93|94|}
{2010006001|XXGobject_psameas_object|125|0|219|0|{metadata|out0_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|126|0|220|0|{transform0|transform0|1|0|}94|93|}
{2010212001|XXGvertex_oport_oport|127|0|221|0|{1|reject0|}93|95|}
{2010006001|XXGobject_psameas_object|128|0|223|0|{metadata|reject0_metadata|1|0|}95|93|}
{2010212001|XXGvertex_oport_oport|129|0|224|0|{2|error0|}93|96|}
{2010006001|XXGobject_psameas_object|130|0|226|0|{metadata|error0_metadata|1|0|}96|93|}
{2010212001|XXGvertex_oport_oport|131|0|227|0|{3|log|}93|97|}
{2010006001|XXGobject_psameas_object|132|0|229|0|{metadata|log_metadata|1|0|}97|93|}
{2010211001|XXGvertex_iport_iport|133|0|230|0|{0|in|}93|98|}
{2010006001|XXGobject_psameas_object|134|0|232|0|{metadata|in_metadata|1|0|}98|93|}
{2010006001|XXGobject_psameas_object|135|0|233|0|{Layout|Layout|0|0|}87|83|}
{2010006001|XXGobject_psameas_object|136|0|234|0|{in_metadata|out_metadata|0|0|}87|99|}
{2010212001|XXGvertex_oport_oport|137|0|236|0|{0|out|}99|100|}
{2010213001|XXGoport_dst_flow|138|0|238|0|{0|}100|101|}
{2010212001|XXGvertex_oport_oport|139|0|240|0|{1|filereject|}99|102|}
{2010212001|XXGvertex_oport_oport|140|0|242|0|{2|fileerror|}99|103|}
{2010212001|XXGvertex_oport_oport|141|0|244|0|{3|reject|}99|104|}
{2010212001|XXGvertex_oport_oport|142|0|246|0|{4|error|}99|105|}
{2010212001|XXGvertex_oport_oport|143|0|248|0|{5|log|}99|106|}
{2010213001|XXGoport_dst_flow|144|0|250|0|{0|}106|107|}
{2010211001|XXGvertex_iport_iport|145|0|252|0|{0|in|}99|108|}
{2010214001|XXGiport_src_flow|146|0|254|0|{0|}108|109|}
{2010007001|XXGobject_proto_object|147|0|256|0|{}99|110|}
{2010212001|XXGvertex_oport_oport|148|0|258|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|149|0|260|0|{metadata|out_metadata|1|0|}111|110|}
{2010212001|XXGvertex_oport_oport|150|0|261|0|{1|filereject|}110|112|}
{2010006001|XXGobject_psameas_object|151|0|263|0|{metadata|filereject_metadata|1|0|}112|110|}
{2010212001|XXGvertex_oport_oport|152|0|264|0|{2|fileerror|}110|113|}
{2010006001|XXGobject_psameas_object|153|0|266|0|{metadata|fileerror_metadata|1|0|}113|110|}
{2010212001|XXGvertex_oport_oport|154|0|267|0|{3|reject|}110|114|}
{2010006001|XXGobject_psameas_object|155|0|269|0|{metadata|reject_metadata|1|0|}114|110|}
{2010212001|XXGvertex_oport_oport|156|0|270|0|{4|error|}110|115|}
{2010006001|XXGobject_psameas_object|157|0|272|0|{metadata|error_metadata|1|0|}115|110|}
{2010212001|XXGvertex_oport_oport|158|0|273|0|{5|log|}110|116|}
{2010006001|XXGobject_psameas_object|159|0|275|0|{metadata|log_metadata|1|0|}116|110|}
{2010211001|XXGvertex_iport_iport|160|0|276|0|{0|in|}110|117|}
{2010006001|XXGobject_psameas_object|161|0|278|0|{metadata|in_metadata|1|0|}117|110|}
{2010006001|XXGobject_psameas_object|162|0|279|0|{Layout|Layout|0|0|}99|118|}
{2010211001|XXGvertex_iport_iport|163|0|281|0|{0|write|}118|119|}
{2010214001|XXGiport_src_flow|164|0|283|0|{0|}119|120|}
{2010007001|XXGobject_proto_object|165|0|285|0|{}118|121|}
{2010211001|XXGvertex_iport_iport|166|0|287|0|{0|write|}121|122|}
{2010006001|XXGobject_psameas_object|167|0|289|0|{metadata|write_metadata|1|0|}122|121|}
{2010006001|XXGobject_psameas_object|168|0|290|0|{write_metadata|out_metadata|0|0|}118|99|}
{2010006001|XXGobject_psameas_object|169|0|291|0|{filereject_metadata|out_metadata|0|0|}99|123|}
{2010212001|XXGvertex_oport_oport|170|0|293|0|{0|out|}123|124|}
{2010213001|XXGoport_dst_flow|171|0|295|0|{0|}124|109|}
{2010212001|XXGvertex_oport_oport|172|0|296|0|{1|error|}123|125|}
{2010212001|XXGvertex_oport_oport|173|0|298|0|{2|log|}123|126|}
{2010007001|XXGobject_proto_object|174|0|300|0|{}123|127|}
{2010212001|XXGvertex_oport_oport|175|0|302|0|{0|out|}127|128|}
{2010006001|XXGobject_psameas_object|176|0|304|0|{metadata|out_metadata|1|0|}128|127|}
{2010212001|XXGvertex_oport_oport|177|0|305|0|{1|error|}127|129|}
{2010006001|XXGobject_psameas_object|178|0|307|0|{metadata|error_metadata|1|0|}129|127|}
{2010212001|XXGvertex_oport_oport|179|0|308|0|{2|log|}127|130|}
{2010006001|XXGobject_psameas_object|180|0|310|0|{metadata|log_metadata|1|0|}130|127|}
{2010006001|XXGobject_psameas_object|181|0|311|0|{in_metadata|out_metadata|0|0|}99|123|}
{2010006001|XXGobject_psameas_object|182|0|312|0|{reject0_metadata|out_metadata|0|0|}87|99|}
{2010006001|XXGobject_psameas_object|183|0|313|0|{reject0_metadata|out0_metadata|0|0|}71|87|}
{2010006001|XXGobject_psameas_object|184|0|314|0|{reject0_metadata|out0_metadata|0|0|}49|71|}
{2010006001|XXGobject_psameas_object|185|0|315|0|{reject1_metadata|out0_metadata|0|0|}49|71|}
{2010601001|XXGgraph_vertex_vertex|186|0|316|0|{Create_SPLIT_IDS|}1|131|}
{2010605001|XXGgraph_legend_legend|187|0|318|0|{0|}131|132|}
{2010241001|XXGlegend_face_face|188|0|320|0|{}132|133|}
{2010604001|XXGgraph_flow_flow|189|0|322|0|{Flow_1|}131|134|}
{2010604001|XXGgraph_flow_flow|190|0|324|0|{Flow_10|}131|135|}
{2010604001|XXGgraph_flow_flow|191|0|326|0|{Flow_2|}131|136|}
{2010604001|XXGgraph_flow_flow|192|0|328|0|{Flow_6|}131|137|}
{2010604001|XXGgraph_flow_flow|193|0|330|0|{Flow_7|}131|138|}
{2010604001|XXGgraph_flow_flow|194|0|332|0|{Flow_8|}131|139|}
{2010604001|XXGgraph_flow_flow|195|0|334|0|{Flow_9|}131|140|}
{2010601001|XXGgraph_vertex_vertex|196|0|336|0|{Errors|}131|141|}
{2010211001|XXGvertex_iport_iport|197|0|338|0|{0|write|}141|142|}
{2010214001|XXGiport_src_flow|198|0|340|0|{0|}142|134|}
{2010007001|XXGobject_proto_object|199|0|341|0|{}141|143|}
{2010211001|XXGvertex_iport_iport|200|0|343|0|{0|write|}143|144|}
{2010006001|XXGobject_psameas_object|201|0|345|0|{metadata|write_metadata|1|0|}144|143|}
{2010601001|XXGgraph_vertex_vertex|202|0|346|0|{Get_Hash_and_Sort_on_Priority|}131|145|}
{2010604001|XXGgraph_flow_flow|203|0|348|0|{Flow_1|}145|146|}
{2010604001|XXGgraph_flow_flow|204|0|350|0|{Flow_12|}145|147|}
{2010604001|XXGgraph_flow_flow|205|0|352|0|{Flow_2|}145|148|}
{2010604001|XXGgraph_flow_flow|206|0|354|0|{Flow_3|}145|149|}
{2010601001|XXGgraph_vertex_vertex|207|0|356|0|{PBKS_dxf_hk_part1|}145|150|}
{2010604001|XXGgraph_flow_flow|208|0|358|0|{Flow_1|}150|151|}
{2010601001|XXGgraph_vertex_vertex|209|0|360|0|{Partition_by_Key|}150|152|}
{2010212001|XXGvertex_oport_oport|210|0|362|0|{0|out|}152|153|}
{2010213001|XXGoport_dst_flow|211|0|364|0|{0|}153|151|}
{2010211001|XXGvertex_iport_iport|212|0|365|0|{0|in|}152|154|}
{2010006001|XXGobject_psameas_object|213|0|367|0|{in_metadata|out0_metadata|0|0|}152|155|}
{2010212001|XXGvertex_oport_oport|214|0|369|0|{0|out0|}155|156|}
{2010213001|XXGoport_dst_flow|215|0|371|0|{0|}156|146|}
{2010212001|XXGvertex_oport_oport|216|0|372|0|{1|reject0|}155|157|}
{2010212001|XXGvertex_oport_oport|217|0|374|0|{2|error0|}155|158|}
{2010212001|XXGvertex_oport_oport|218|0|376|0|{3|log|}155|159|}
{2010211001|XXGvertex_iport_iport|219|0|378|0|{0|in|}155|160|}
{2010007001|XXGobject_proto_object|220|0|380|0|{}155|161|}
{2010212001|XXGvertex_oport_oport|221|0|382|0|{0|out0|}161|162|}
{2010006001|XXGobject_psameas_object|222|0|384|0|{metadata|out0_metadata|1|0|}162|161|}
{2010006001|XXGobject_psameas_object|223|0|385|0|{transform0|transform0|1|0|}162|161|}
{2010212001|XXGvertex_oport_oport|224|0|386|0|{1|reject0|}161|163|}
{2010006001|XXGobject_psameas_object|225|0|388|0|{metadata|reject0_metadata|1|0|}163|161|}
{2010212001|XXGvertex_oport_oport|226|0|389|0|{2|error0|}161|164|}
{2010006001|XXGobject_psameas_object|227|0|391|0|{metadata|error0_metadata|1|0|}164|161|}
{2010212001|XXGvertex_oport_oport|228|0|392|0|{3|log|}161|165|}
{2010006001|XXGobject_psameas_object|229|0|394|0|{metadata|log_metadata|1|0|}165|161|}
{2010211001|XXGvertex_iport_iport|230|0|395|0|{0|in|}161|166|}
{2010006001|XXGobject_psameas_object|231|0|397|0|{metadata|in_metadata|1|0|}166|161|}
{2010006001|XXGobject_psameas_object|232|0|398|0|{Layout|Layout|0|0|}155|167|}
{2010212001|XXGvertex_oport_oport|233|0|400|0|{0|out|}167|168|}
{2010212001|XXGvertex_oport_oport|234|0|402|0|{1|filereject|}167|169|}
{2010212001|XXGvertex_oport_oport|235|0|404|0|{2|fileerror|}167|170|}
{2010212001|XXGvertex_oport_oport|236|0|406|0|{3|reject|}167|171|}
{2010212001|XXGvertex_oport_oport|237|0|408|0|{4|error|}167|172|}
{2010212001|XXGvertex_oport_oport|238|0|410|0|{5|log|}167|173|}
{2010211001|XXGvertex_iport_iport|239|0|412|0|{0|in|}167|174|}
{2010214001|XXGiport_src_flow|240|0|414|0|{0|}174|175|}
{2010007001|XXGobject_proto_object|241|0|416|0|{}167|176|}
{2010212001|XXGvertex_oport_oport|242|0|418|0|{0|out|}176|177|}
{2010006001|XXGobject_psameas_object|243|0|420|0|{metadata|out_metadata|1|0|}177|176|}
{2010212001|XXGvertex_oport_oport|244|0|421|0|{1|filereject|}176|178|}
{2010006001|XXGobject_psameas_object|245|0|423|0|{metadata|filereject_metadata|1|0|}178|176|}
{2010212001|XXGvertex_oport_oport|246|0|424|0|{2|fileerror|}176|179|}
{2010006001|XXGobject_psameas_object|247|0|426|0|{metadata|fileerror_metadata|1|0|}179|176|}
{2010212001|XXGvertex_oport_oport|248|0|427|0|{3|reject|}176|180|}
{2010006001|XXGobject_psameas_object|249|0|429|0|{metadata|reject_metadata|1|0|}180|176|}
{2010212001|XXGvertex_oport_oport|250|0|430|0|{4|error|}176|181|}
{2010006001|XXGobject_psameas_object|251|0|432|0|{metadata|error_metadata|1|0|}181|176|}
{2010212001|XXGvertex_oport_oport|252|0|433|0|{5|log|}176|182|}
{2010006001|XXGobject_psameas_object|253|0|435|0|{metadata|log_metadata|1|0|}182|176|}
{2010211001|XXGvertex_iport_iport|254|0|436|0|{0|in|}176|183|}
{2010006001|XXGobject_psameas_object|255|0|438|0|{metadata|in_metadata|1|0|}183|176|}
{2010006001|XXGobject_psameas_object|256|0|439|0|{filereject_metadata|out_metadata|0|0|}167|184|}
{2010212001|XXGvertex_oport_oport|257|0|441|0|{0|out|}184|185|}
{2010213001|XXGoport_dst_flow|258|0|443|0|{0|}185|175|}
{2010212001|XXGvertex_oport_oport|259|0|444|0|{1|error|}184|186|}
{2010212001|XXGvertex_oport_oport|260|0|446|0|{2|log|}184|187|}
{2010007001|XXGobject_proto_object|261|0|448|0|{}184|188|}
{2010212001|XXGvertex_oport_oport|262|0|450|0|{0|out|}188|189|}
{2010006001|XXGobject_psameas_object|263|0|452|0|{metadata|out_metadata|1|0|}189|188|}
{2010212001|XXGvertex_oport_oport|264|0|453|0|{1|error|}188|190|}
{2010006001|XXGobject_psameas_object|265|0|455|0|{metadata|error_metadata|1|0|}190|188|}
{2010212001|XXGvertex_oport_oport|266|0|456|0|{2|log|}188|191|}
{2010006001|XXGobject_psameas_object|267|0|458|0|{metadata|log_metadata|1|0|}191|188|}
{2010006001|XXGobject_psameas_object|268|0|459|0|{Layout|Layout|0|0|}184|167|}
{2010006001|XXGobject_psameas_object|269|0|460|0|{in_metadata|out_metadata|0|0|}167|184|}
{2010006001|XXGobject_psameas_object|270|0|461|0|{in_metadata|out_metadata|0|0|}155|167|}
{2010006001|XXGobject_psameas_object|271|0|462|0|{reject0_metadata|out_metadata|0|0|}155|167|}
{2010006001|XXGobject_psameas_object|272|0|463|0|{out_metadata|out0_metadata|0|0|}152|155|}
{2010601001|XXGgraph_vertex_vertex|273|0|464|0|{Sort|}150|192|}
{2010212001|XXGvertex_oport_oport|274|0|466|0|{0|out|}192|193|}
{2010211001|XXGvertex_iport_iport|275|0|468|0|{0|in|}192|194|}
{2010214001|XXGiport_src_flow|276|0|470|0|{0|}194|151|}
{2010006001|XXGobject_psameas_object|277|0|471|0|{in_metadata|out0_metadata|0|0|}192|155|}
{2010006001|XXGobject_psameas_object|278|0|472|0|{out_metadata|out0_metadata|0|0|}192|155|}
{2010212001|XXGvertex_oport_oport|279|0|473|0|{0|out0|}150|195|}
{2010216002|XXGoport_binding_oport|280|0|475|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}195|193|}
{2010213001|XXGoport_dst_flow|281|0|476|0|{0|}195|147|}
{2010211001|XXGvertex_iport_iport|282|0|477|0|{0|in0|}150|196|}
{2010215002|XXGiport_binding_iport|283|0|479|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}196|154|}
{2010214001|XXGiport_src_flow|284|0|480|0|{0|}196|148|}
{2010007001|XXGobject_proto_object|285|0|481|0|{}150|197|}
{2010604001|XXGgraph_flow_flow|286|0|483|0|{Flow_1|}197|198|}
{2010601001|XXGgraph_vertex_vertex|287|0|485|0|{Partition_by_Key|}197|199|}
{2010212001|XXGvertex_oport_oport|288|0|487|0|{0|out|}199|200|}
{2010213001|XXGoport_dst_flow|289|0|489|0|{0|}200|198|}
{2010211001|XXGvertex_iport_iport|290|0|490|0|{0|in|}199|201|}
{2010007001|XXGobject_proto_object|291|0|492|0|{}199|202|}
{2010212001|XXGvertex_oport_oport|292|0|494|0|{0|out|}202|203|}
{2010006001|XXGobject_psameas_object|293|0|496|0|{metadata|out_metadata|1|0|}203|202|}
{2010211001|XXGvertex_iport_iport|294|0|497|0|{0|in|}202|204|}
{2010006001|XXGobject_psameas_object|295|0|499|0|{metadata|in_metadata|1|0|}204|202|}
{2010006001|XXGobject_psameas_object|296|0|500|0|{Layout|InputLayout|1|0|}199|197|}
{2010006001|XXGobject_psameas_object|297|0|501|0|{key|Key|1|0|}199|197|}
{2010601001|XXGgraph_vertex_vertex|298|0|502|0|{Sort|}197|205|}
{2010212001|XXGvertex_oport_oport|299|0|504|0|{0|out|}205|206|}
{2010211001|XXGvertex_iport_iport|300|0|506|0|{0|in|}205|207|}
{2010214001|XXGiport_src_flow|301|0|508|0|{0|}207|198|}
{2010007001|XXGobject_proto_object|302|0|509|0|{}205|208|}
{2010212001|XXGvertex_oport_oport|303|0|511|0|{0|out|}208|209|}
{2010006001|XXGobject_psameas_object|304|0|513|0|{metadata|out_metadata|1|0|}209|208|}
{2010211001|XXGvertex_iport_iport|305|0|514|0|{0|in|}208|210|}
{2010006001|XXGobject_psameas_object|306|0|516|0|{metadata|in_metadata|1|0|}210|208|}
{2010006001|XXGobject_psameas_object|307|0|517|0|{Layout|OutputLayout|1|0|}205|197|}
{2010006001|XXGobject_psameas_object|308|0|518|0|{key|Key|1|0|}205|197|}
{2010006001|XXGobject_psameas_object|309|0|519|0|{max_core|Max_core|1|0|}205|197|}
{2010212001|XXGvertex_oport_oport|310|0|520|0|{0|out0|}197|211|}
{2010216002|XXGoport_binding_oport|311|0|522|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}211|206|}
{2010211001|XXGvertex_iport_iport|312|0|523|0|{0|in0|}197|212|}
{2010215002|XXGiport_binding_iport|313|0|525|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}212|201|}
{2010006001|XXGobject_psameas_object|314|0|526|0|{InputLayout|Layout|0|0|}150|167|}
{2010006001|XXGobject_psameas_object|315|0|527|0|{OutputLayout|Layout|0|0|}150|213|}
{2010212001|XXGvertex_oport_oport|316|0|529|0|{0|read|}213|214|}
{2010213001|XXGoport_dst_flow|317|0|531|0|{0|}214|140|}
{2010211001|XXGvertex_iport_iport|318|0|532|0|{0|write|}213|215|}
{2010214001|XXGiport_src_flow|319|0|534|0|{0|}215|138|}
{2010007001|XXGobject_proto_object|320|0|535|0|{}213|216|}
{2010212001|XXGvertex_oport_oport|321|0|537|0|{0|read|}216|217|}
{2010006001|XXGobject_psameas_object|322|0|539|0|{metadata|read_metadata|1|0|}217|216|}
{2010211001|XXGvertex_iport_iport|323|0|540|0|{0|write|}216|218|}
{2010006001|XXGobject_psameas_object|324|0|542|0|{metadata|write_metadata|1|0|}218|216|}
{2010601001|XXGgraph_vertex_vertex|325|0|543|0|{RFMT_Get_Hash_and_src_env_rank|}145|219|}
{2010212001|XXGvertex_oport_oport|326|0|545|0|{0|out0|}219|220|}
{2010213001|XXGoport_dst_flow|327|0|547|0|{0|}220|148|}
{2010212001|XXGvertex_oport_oport|328|0|548|0|{1|reject0|}219|221|}
{2010212001|XXGvertex_oport_oport|329|0|550|0|{2|error0|}219|222|}
{2010212001|XXGvertex_oport_oport|330|0|552|0|{3|log|}219|223|}
{2010211001|XXGvertex_iport_iport|331|0|554|0|{0|in|}219|224|}
{2010214001|XXGiport_src_flow|332|0|556|0|{0|}224|146|}
{2010007001|XXGobject_proto_object|333|0|557|0|{}219|225|}
{2010212001|XXGvertex_oport_oport|334|0|559|0|{0|out0|}225|226|}
{2010006001|XXGobject_psameas_object|335|0|561|0|{metadata|out0_metadata|1|0|}226|225|}
{2010006001|XXGobject_psameas_object|336|0|562|0|{transform0|transform0|1|0|}226|225|}
{2010212001|XXGvertex_oport_oport|337|0|563|0|{1|reject0|}225|227|}
{2010006001|XXGobject_psameas_object|338|0|565|0|{metadata|reject0_metadata|1|0|}227|225|}
{2010212001|XXGvertex_oport_oport|339|0|566|0|{2|error0|}225|228|}
{2010006001|XXGobject_psameas_object|340|0|568|0|{metadata|error0_metadata|1|0|}228|225|}
{2010212001|XXGvertex_oport_oport|341|0|569|0|{3|log|}225|229|}
{2010006001|XXGobject_psameas_object|342|0|571|0|{metadata|log_metadata|1|0|}229|225|}
{2010211001|XXGvertex_iport_iport|343|0|572|0|{0|in|}225|230|}
{2010006001|XXGobject_psameas_object|344|0|574|0|{metadata|in_metadata|1|0|}230|225|}
{2010006001|XXGobject_psameas_object|345|0|575|0|{Layout|Layout|0|0|}219|167|}
{2010006001|XXGobject_psameas_object|346|0|576|0|{in_metadata|out0_metadata|0|0|}219|155|}
{2010006001|XXGobject_psameas_object|347|0|577|0|{out0_metadata|out0_metadata|0|0|}219|155|}
{2010006001|XXGobject_psameas_object|348|0|578|0|{reject0_metadata|out0_metadata|0|0|}219|155|}
{2010601001|XXGgraph_vertex_vertex|349|0|579|0|{RFMT_Map_to_IDS|}145|155|}
{2010601001|XXGgraph_vertex_vertex|350|0|580|0|{Reformat|}145|231|}
{2010212001|XXGvertex_oport_oport|351|0|582|0|{0|out0|}231|232|}
{2010212001|XXGvertex_oport_oport|352|0|584|0|{1|reject0|}231|233|}
{2010212001|XXGvertex_oport_oport|353|0|586|0|{2|error0|}231|234|}
{2010212001|XXGvertex_oport_oport|354|0|588|0|{3|log|}231|235|}
{2010211001|XXGvertex_iport_iport|355|0|590|0|{0|in|}231|236|}
{2010214001|XXGiport_src_flow|356|0|592|0|{0|}236|149|}
{2010007001|XXGobject_proto_object|357|0|593|0|{}231|237|}
{2010212001|XXGvertex_oport_oport|358|0|595|0|{0|out0|}237|238|}
{2010006001|XXGobject_psameas_object|359|0|597|0|{metadata|out0_metadata|1|0|}238|237|}
{2010006001|XXGobject_psameas_object|360|0|598|0|{transform0|transform0|1|0|}238|237|}
{2010212001|XXGvertex_oport_oport|361|0|599|0|{1|reject0|}237|239|}
{2010006001|XXGobject_psameas_object|362|0|601|0|{metadata|reject0_metadata|1|0|}239|237|}
{2010212001|XXGvertex_oport_oport|363|0|602|0|{2|error0|}237|240|}
{2010006001|XXGobject_psameas_object|364|0|604|0|{metadata|error0_metadata|1|0|}240|237|}
{2010212001|XXGvertex_oport_oport|365|0|605|0|{3|log|}237|241|}
{2010006001|XXGobject_psameas_object|366|0|607|0|{metadata|log_metadata|1|0|}241|237|}
{2010211001|XXGvertex_iport_iport|367|0|608|0|{0|in|}237|242|}
{2010006001|XXGobject_psameas_object|368|0|610|0|{metadata|in_metadata|1|0|}242|237|}
{2010006001|XXGobject_psameas_object|369|0|611|0|{Layout|Layout|0|0|}231|213|}
{2010006001|XXGobject_psameas_object|370|0|612|0|{in_metadata|out0_metadata|0|0|}231|155|}
{2010006001|XXGobject_psameas_object|371|0|613|0|{reject0_metadata|out0_metadata|0|0|}231|155|}
{2010601001|XXGgraph_vertex_vertex|372|0|614|0|{SWG|}145|243|}
{2010212001|XXGvertex_oport_oport|373|0|616|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|374|0|618|0|{0|}244|149|}
{2010211001|XXGvertex_iport_iport|375|0|619|0|{0|in|}243|245|}
{2010214001|XXGiport_src_flow|376|0|621|0|{0|}245|147|}
{2010007001|XXGobject_proto_object|377|0|622|0|{}243|246|}
{2010212001|XXGvertex_oport_oport|378|0|624|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|379|0|626|0|{metadata|out_metadata|1|0|}247|246|}
{2010211001|XXGvertex_iport_iport|380|0|627|0|{0|in|}246|248|}
{2010006001|XXGobject_psameas_object|381|0|629|0|{metadata|in_metadata|1|0|}248|246|}
{2010006001|XXGobject_psameas_object|382|0|630|0|{Layout|Layout|0|0|}243|213|}
{2010006001|XXGobject_psameas_object|383|0|631|0|{in_metadata|out0_metadata|0|0|}243|155|}
{2010006001|XXGobject_psameas_object|384|0|632|0|{out_metadata|out0_metadata|0|0|}243|155|}
{2010212001|XXGvertex_oport_oport|385|0|633|0|{0|out0|}145|249|}
{2010216002|XXGoport_binding_oport|386|0|635|0|{.5|.5|{0|}14532|}249|232|}
{2010213001|XXGoport_dst_flow|387|0|636|0|{0|}249|135|}
{2010211001|XXGvertex_iport_iport|388|0|637|0|{0|in1|}145|250|}
{2010215002|XXGiport_binding_iport|389|0|639|0|{.5|.5|{0|}14531|}250|160|}
{2010214001|XXGiport_src_flow|390|0|640|0|{0|}250|136|}
{2010601001|XXGgraph_vertex_vertex|391|0|641|0|{IDS_ICFF|}131|213|}
{2010601001|XXGgraph_vertex_vertex|392|0|642|0|{IDS_Index_File|}131|251|}
{2010211001|XXGvertex_iport_iport|393|0|644|0|{0|write|}251|252|}
{2010214001|XXGiport_src_flow|394|0|646|0|{0|}252|139|}
{2010007001|XXGobject_proto_object|395|0|647|0|{}251|253|}
{2010211001|XXGvertex_iport_iport|396|0|649|0|{0|write|}253|254|}
{2010006001|XXGobject_psameas_object|397|0|651|0|{metadata|write_metadata|1|0|}254|253|}
{2010006001|XXGobject_psameas_object|398|0|652|0|{write_metadata|index_metadata|0|0|}251|255|}
{2010212001|XXGvertex_oport_oport|399|0|654|0|{0|out|}255|256|}
{2010213001|XXGoport_dst_flow|400|0|656|0|{0|}256|138|}
{2010212001|XXGvertex_oport_oport|401|0|657|0|{1|index|}255|257|}
{2010213001|XXGoport_dst_flow|402|0|659|0|{0|}257|139|}
{2010212001|XXGvertex_oport_oport|403|0|660|0|{2|address|}255|258|}
{2010211001|XXGvertex_iport_iport|404|0|662|0|{0|in|}255|259|}
{2010214001|XXGiport_src_flow|405|0|664|0|{0|}259|135|}
{2010007001|XXGobject_proto_object|406|0|665|0|{}255|260|}
{2010212001|XXGvertex_oport_oport|407|0|667|0|{0|out|}260|261|}
{2010006001|XXGobject_psameas_object|408|0|669|0|{metadata|out_metadata|1|0|}261|260|}
{2010212001|XXGvertex_oport_oport|409|0|670|0|{1|index|}260|262|}
{2010006001|XXGobject_psameas_object|410|0|672|0|{metadata|index_metadata|1|0|}262|260|}
{2010212001|XXGvertex_oport_oport|411|0|673|0|{2|address|}260|263|}
{2010006001|XXGobject_psameas_object|412|0|675|0|{metadata|address_metadata|1|0|}263|260|}
{2010211001|XXGvertex_iport_iport|413|0|676|0|{0|in|}260|264|}
{2010006001|XXGobject_psameas_object|414|0|678|0|{metadata|in_metadata|1|0|}264|260|}
{2010006001|XXGobject_psameas_object|415|0|679|0|{Layout|Layout|0|0|}255|213|}
{2010006001|XXGobject_psameas_object|416|0|680|0|{in_metadata|out0_metadata|0|0|}255|231|}
{2010006001|XXGobject_psameas_object|417|0|681|0|{out_metadata|write_metadata|0|0|}255|213|}
{2010601001|XXGgraph_vertex_vertex|418|0|682|0|{Invalid|}131|265|}
{2010211001|XXGvertex_iport_iport|419|0|684|0|{0|write|}265|266|}
{2010214001|XXGiport_src_flow|420|0|686|0|{0|}266|137|}
{2010007001|XXGobject_proto_object|421|0|687|0|{}265|267|}
{2010211001|XXGvertex_iport_iport|422|0|689|0|{0|write|}267|268|}
{2010006001|XXGobject_psameas_object|423|0|691|0|{metadata|write_metadata|1|0|}268|267|}
{2010006001|XXGobject_psameas_object|424|0|692|0|{write_metadata|out_metadata|0|0|}265|167|}
{2010601001|XXGgraph_vertex_vertex|425|0|693|0|{Read_Multiple_Split_files|}131|269|}
{2010604001|XXGgraph_flow_flow|426|0|695|0|{Flow_1|}269|270|}
{2010604001|XXGgraph_flow_flow|427|0|697|0|{Flow_3|}269|271|}
{2010601001|XXGgraph_vertex_vertex|428|0|699|0|{Gather_Logs_Invalid|}269|272|}
{2010211001|XXGvertex_iport_iport|429|0|701|0|{0|in|}272|273|}
{2010214001|XXGiport_src_flow|430|0|703|0|{0|}273|271|}
{2010007001|XXGobject_proto_object|431|0|704|0|{}272|274|}
{2010211001|XXGvertex_iport_iport|432|0|706|0|{0|in|}274|275|}
{2010006001|XXGobject_psameas_object|433|0|708|0|{metadata|in_metadata|1|0|}275|274|}
{2010006001|XXGobject_psameas_object|434|0|709|0|{in_metadata|log_metadata|0|0|}272|276|}
{2010212001|XXGvertex_oport_oport|435|0|711|0|{0|out|}276|277|}
{2010212001|XXGvertex_oport_oport|436|0|713|0|{1|reject|}276|278|}
{2010212001|XXGvertex_oport_oport|437|0|715|0|{2|error|}276|279|}
{2010212001|XXGvertex_oport_oport|438|0|717|0|{3|log|}276|280|}
{2010213001|XXGoport_dst_flow|439|0|719|0|{0|}280|271|}
{2010211001|XXGvertex_iport_iport|440|0|720|0|{0|in|}276|281|}
{2010214001|XXGiport_src_flow|441|0|722|0|{0|}281|270|}
{2010007001|XXGobject_proto_object|442|0|723|0|{}276|282|}
{2010212001|XXGvertex_oport_oport|443|0|725|0|{0|out|}282|283|}
{2010006001|XXGobject_psameas_object|444|0|727|0|{metadata|out_metadata|1|0|}283|282|}
{2010212001|XXGvertex_oport_oport|445|0|728|0|{1|reject|}282|284|}
{2010006001|XXGobject_psameas_object|446|0|730|0|{metadata|reject_metadata|1|0|}284|282|}
{2010212001|XXGvertex_oport_oport|447|0|731|0|{2|error|}282|285|}
{2010006001|XXGobject_psameas_object|448|0|733|0|{metadata|error_metadata|1|0|}285|282|}
{2010212001|XXGvertex_oport_oport|449|0|734|0|{3|log|}282|286|}
{2010006001|XXGobject_psameas_object|450|0|736|0|{metadata|log_metadata|1|0|}286|282|}
{2010211001|XXGvertex_iport_iport|451|0|737|0|{0|in|}282|287|}
{2010006001|XXGobject_psameas_object|452|0|739|0|{metadata|in_metadata|1|0|}287|282|}
{2010006001|XXGobject_psameas_object|453|0|740|0|{Layout|Layout|0|0|}276|167|}
{2010006001|XXGobject_psameas_object|454|0|741|0|{in_metadata|out_metadata|0|0|}276|167|}
{2010006001|XXGobject_psameas_object|455|0|742|0|{out_metadata|out_metadata|0|0|}276|167|}
{2010006001|XXGobject_psameas_object|456|0|743|0|{reject_metadata|out_metadata|0|0|}276|167|}
{2010601001|XXGgraph_vertex_vertex|457|0|744|0|{RFMT_Validate_Records|}269|276|}
{2010601001|XXGgraph_vertex_vertex|458|0|745|0|{Read_Splits|}269|288|}
{2010604001|XXGgraph_flow_flow|459|0|747|0|{Flow_6|}288|175|}
{2010604001|XXGgraph_flow_flow|460|0|748|0|{Flow_7|}288|289|}
{2010601001|XXGgraph_vertex_vertex|461|0|750|0|{Find_All_Splits|}288|184|}
{2010601001|XXGgraph_vertex_vertex|462|0|751|0|{For_View_Data|}288|290|}
{2010212001|XXGvertex_oport_oport|463|0|753|0|{0|read|}290|291|}
{2010213001|XXGoport_dst_flow|464|0|755|0|{0|}291|289|}
{2010007001|XXGobject_proto_object|465|0|756|0|{}290|292|}
{2010212001|XXGvertex_oport_oport|466|0|758|0|{0|read|}292|293|}
{2010006001|XXGobject_psameas_object|467|0|760|0|{metadata|read_metadata|1|0|}293|292|}
{2010601001|XXGgraph_vertex_vertex|468|0|761|0|{Read_Multiple_Splits|}288|167|}
{2010601001|XXGgraph_vertex_vertex|469|0|762|0|{Trash|}288|294|}
{2010211001|XXGvertex_iport_iport|470|0|764|0|{0|in|}294|295|}
{2010214001|XXGiport_src_flow|471|0|766|0|{0|}295|289|}
{2010007001|XXGobject_proto_object|472|0|767|0|{}294|296|}
{2010211001|XXGvertex_iport_iport|473|0|769|0|{0|in|}296|297|}
{2010006001|XXGobject_psameas_object|474|0|771|0|{metadata|in_metadata|1|0|}297|296|}
{2010006001|XXGobject_psameas_object|475|0|772|0|{in_metadata|read_metadata|0|0|}294|290|}
{2010212001|XXGvertex_oport_oport|476|0|773|0|{0|out0|}288|298|}
{2010216002|XXGoport_binding_oport|477|0|775|0|{.5|.5|{12|399000|129000|419000|129000|504000|129000|504000|199000|590000|199000|610000|199000|}156|}298|168|}
{2010213001|XXGoport_dst_flow|478|0|776|0|{0|}298|270|}
{2010212001|XXGvertex_oport_oport|479|0|777|0|{0|out0|}269|299|}
{2010216002|XXGoport_binding_oport|480|0|779|0|{.5|.5|{6|747000|269000|767000|269000|787000|269000|}5713|}299|277|}
{2010213001|XXGoport_dst_flow|481|0|780|0|{0|}299|136|}
{2010212001|XXGvertex_oport_oport|482|0|781|0|{1|error|}269|300|}
{2010216002|XXGoport_binding_oport|483|0|783|0|{1.0|.5|{12|674000|322000|674000|342000|674000|498000|594000|498000|594000|498000|594000|518000|}5714|}300|279|}
{2010213001|XXGoport_dst_flow|484|0|784|0|{0|}300|134|}
{2010212001|XXGvertex_oport_oport|485|0|785|0|{2|out1|}269|301|}
{2010216002|XXGoport_binding_oport|486|0|787|0|{.5|.5|{0|}5715|}301|278|}
{2010213001|XXGoport_dst_flow|487|0|788|0|{0|}301|137|}
{2010601001|XXGgraph_vertex_vertex|488|0|789|0|{SRC_ENVRT_ID|}131|302|}
{2010007001|XXGobject_proto_object|489|0|791|0|{}302|303|}
{2010601001|XXGgraph_vertex_vertex|490|0|793|0|{View_Data|}131|304|}
{2010211001|XXGvertex_iport_iport|491|0|795|0|{0|write|}304|305|}
{2010214001|XXGiport_src_flow|492|0|797|0|{0|}305|140|}
{2010007001|XXGobject_proto_object|493|0|798|0|{}304|306|}
{2010211001|XXGvertex_iport_iport|494|0|800|0|{0|write|}306|307|}
{2010006001|XXGobject_psameas_object|495|0|802|0|{metadata|write_metadata|1|0|}307|306|}
{2010601001|XXGgraph_vertex_vertex|496|0|803|0|{Write_Block_Compressed_Lookup|}131|255|}
{2010601001|XXGgraph_vertex_vertex|497|0|804|0|{Deleted|}1|308|}
{2010601001|XXGgraph_vertex_vertex|498|0|806|0|{ORCHARD_LKP_TPL|}308|309|}
{2010007001|XXGobject_proto_object|499|0|808|0|{}309|310|}
{2010601001|XXGgraph_vertex_vertex|500|0|810|0|{Unload_and_assign_from_ORCHARD_IDS|}308|311|}
{2010212001|XXGvertex_oport_oport|501|0|812|0|{0|out0|}311|312|}
{2010212001|XXGvertex_oport_oport|502|0|814|0|{1|reject0|}311|313|}
{2010212001|XXGvertex_oport_oport|503|0|816|0|{2|error0|}311|314|}
{2010212001|XXGvertex_oport_oport|504|0|818|0|{3|log|}311|315|}
{2010211001|XXGvertex_iport_iport|505|0|820|0|{0|in|}311|316|}
{2010007001|XXGobject_proto_object|506|0|822|0|{}311|317|}
{2010212001|XXGvertex_oport_oport|507|0|824|0|{0|out0|}317|318|}
{2010006001|XXGobject_psameas_object|508|0|826|0|{metadata|out0_metadata|1|0|}318|317|}
{2010006001|XXGobject_psameas_object|509|0|827|0|{transform0|transform0|1|0|}318|317|}
{2010212001|XXGvertex_oport_oport|510|0|828|0|{1|reject0|}317|319|}
{2010006001|XXGobject_psameas_object|511|0|830|0|{metadata|reject0_metadata|1|0|}319|317|}
{2010212001|XXGvertex_oport_oport|512|0|831|0|{2|error0|}317|320|}
{2010006001|XXGobject_psameas_object|513|0|833|0|{metadata|error0_metadata|1|0|}320|317|}
{2010212001|XXGvertex_oport_oport|514|0|834|0|{3|log|}317|321|}
{2010006001|XXGobject_psameas_object|515|0|836|0|{metadata|log_metadata|1|0|}321|317|}
{2010211001|XXGvertex_iport_iport|516|0|837|0|{0|in|}317|322|}
{2010006001|XXGobject_psameas_object|517|0|839|0|{metadata|in_metadata|1|0|}322|317|}
{2010601001|XXGgraph_vertex_vertex|518|0|840|0|{Fuse|}1|323|}
{2010212001|XXGvertex_oport_oport|519|0|842|0|{0|out|}323|324|}
{2010213001|XXGoport_dst_flow|520|0|844|0|{0|}324|24|}
{2010212001|XXGvertex_oport_oport|521|0|845|0|{1|reject0|}323|325|}
{2010212001|XXGvertex_oport_oport|522|0|847|0|{2|reject1|}323|326|}
{2010212001|XXGvertex_oport_oport|523|0|849|0|{3|error0|}323|327|}
{2010212001|XXGvertex_oport_oport|524|0|851|0|{4|error1|}323|328|}
{2010212001|XXGvertex_oport_oport|525|0|853|0|{5|log|}323|329|}
{2010211001|XXGvertex_iport_iport|526|0|855|0|{0|in0|}323|330|}
{2010214001|XXGiport_src_flow|527|0|857|0|{0|}330|36|}
{2010211001|XXGvertex_iport_iport|528|0|858|0|{1|in1|}323|331|}
{2010214001|XXGiport_src_flow|529|0|860|0|{0|}331|37|}
{2010007001|XXGobject_proto_object|530|0|861|0|{}323|332|}
{2010212001|XXGvertex_oport_oport|531|0|863|0|{0|out|}332|333|}
{2010006001|XXGobject_psameas_object|532|0|865|0|{metadata|out_metadata|1|0|}333|332|}
{2010212001|XXGvertex_oport_oport|533|0|866|0|{1|reject0|}332|334|}
{2010006001|XXGobject_psameas_object|534|0|868|0|{metadata|reject0_metadata|1|0|}334|332|}
{2010212001|XXGvertex_oport_oport|535|0|869|0|{2|reject1|}332|335|}
{2010006001|XXGobject_psameas_object|536|0|871|0|{metadata|reject1_metadata|1|0|}335|332|}
{2010212001|XXGvertex_oport_oport|537|0|872|0|{3|error0|}332|336|}
{2010006001|XXGobject_psameas_object|538|0|874|0|{metadata|error0_metadata|1|0|}336|332|}
{2010212001|XXGvertex_oport_oport|539|0|875|0|{4|error1|}332|337|}
{2010006001|XXGobject_psameas_object|540|0|877|0|{metadata|error1_metadata|1|0|}337|332|}
{2010212001|XXGvertex_oport_oport|541|0|878|0|{5|log|}332|338|}
{2010006001|XXGobject_psameas_object|542|0|880|0|{metadata|log_metadata|1|0|}338|332|}
{2010211001|XXGvertex_iport_iport|543|0|881|0|{0|in0|}332|339|}
{2010006001|XXGobject_psameas_object|544|0|883|0|{metadata|in0_metadata|1|0|}339|332|}
{2010211001|XXGvertex_iport_iport|545|0|884|0|{1|in1|}332|340|}
{2010006001|XXGobject_psameas_object|546|0|886|0|{metadata|in1_metadata|1|0|}340|332|}
{2010006001|XXGobject_psameas_object|547|0|887|0|{Layout|Layout|0|0|}323|341|}
{2010211001|XXGvertex_iport_iport|548|0|889|0|{0|write|}341|342|}
{2010214001|XXGiport_src_flow|549|0|891|0|{0|}342|16|}
{2010007001|XXGobject_proto_object|550|0|892|0|{}341|343|}
{2010211001|XXGvertex_iport_iport|551|0|894|0|{0|write|}343|344|}
{2010006001|XXGobject_psameas_object|552|0|896|0|{metadata|write_metadata|1|0|}344|343|}
{2010006001|XXGobject_psameas_object|553|0|897|0|{write_metadata|in_metadata|0|0|}341|345|}
{2010212001|XXGvertex_oport_oport|554|0|899|0|{0|out|}345|346|}
{2010213001|XXGoport_dst_flow|555|0|901|0|{0|}346|347|}
{2010212001|XXGvertex_oport_oport|556|0|903|0|{1|reject|}345|348|}
{2010212001|XXGvertex_oport_oport|557|0|905|0|{2|error|}345|349|}
{2010212001|XXGvertex_oport_oport|558|0|907|0|{3|log|}345|350|}
{2010212001|XXGvertex_oport_oport|559|0|909|0|{4|address|}345|351|}
{2010211001|XXGvertex_iport_iport|560|0|911|0|{0|in|}345|352|}
{2010007001|XXGobject_proto_object|561|0|913|0|{}345|353|}
{2010212001|XXGvertex_oport_oport|562|0|915|0|{0|out|}353|354|}
{2010006001|XXGobject_psameas_object|563|0|917|0|{metadata|out_metadata|1|0|}354|353|}
{2010212001|XXGvertex_oport_oport|564|0|918|0|{1|reject|}353|355|}
{2010006001|XXGobject_psameas_object|565|0|920|0|{metadata|reject_metadata|1|0|}355|353|}
{2010212001|XXGvertex_oport_oport|566|0|921|0|{2|error|}353|356|}
{2010006001|XXGobject_psameas_object|567|0|923|0|{metadata|error_metadata|1|0|}356|353|}
{2010212001|XXGvertex_oport_oport|568|0|924|0|{3|log|}353|357|}
{2010006001|XXGobject_psameas_object|569|0|926|0|{metadata|log_metadata|1|0|}357|353|}
{2010212001|XXGvertex_oport_oport|570|0|927|0|{4|address|}353|358|}
{2010006001|XXGobject_psameas_object|571|0|929|0|{metadata|address_metadata|1|0|}358|353|}
{2010211001|XXGvertex_iport_iport|572|0|930|0|{0|in|}353|359|}
{2010006001|XXGobject_psameas_object|573|0|932|0|{metadata|in_metadata|1|0|}359|353|}
{2010006001|XXGobject_psameas_object|574|0|933|0|{Layout|Layout|0|0|}345|360|}
{2010212001|XXGvertex_oport_oport|575|0|935|0|{0|read|}360|361|}
{2010213001|XXGoport_dst_flow|576|0|937|0|{0|}361|362|}
{2010211001|XXGvertex_iport_iport|577|0|939|0|{0|write|}360|363|}
{2010214001|XXGiport_src_flow|578|0|941|0|{0|}363|364|}
{2010007001|XXGobject_proto_object|579|0|943|0|{}360|365|}
{2010212001|XXGvertex_oport_oport|580|0|945|0|{0|read|}365|366|}
{2010006001|XXGobject_psameas_object|581|0|947|0|{metadata|read_metadata|1|0|}366|365|}
{2010211001|XXGvertex_iport_iport|582|0|948|0|{0|write|}365|367|}
{2010006001|XXGobject_psameas_object|583|0|950|0|{metadata|write_metadata|1|0|}367|365|}
{2010006001|XXGobject_psameas_object|584|0|951|0|{reject_metadata|in_metadata|0|0|}345|345|}
{2010006001|XXGobject_psameas_object|585|0|952|0|{in0_metadata|out1_metadata|0|0|}323|49|}
{2010006001|XXGobject_psameas_object|586|0|953|0|{in1_metadata|out0_metadata|0|0|}323|71|}
{2010006001|XXGobject_psameas_object|587|0|954|0|{out_metadata|in_metadata|0|0|}323|345|}
{2010006001|XXGobject_psameas_object|588|0|955|0|{reject0_metadata|out1_metadata|0|0|}323|49|}
{2010006001|XXGobject_psameas_object|589|0|956|0|{reject1_metadata|out0_metadata|0|0|}323|71|}
{2010601001|XXGgraph_vertex_vertex|590|0|957|0|{Hashkey_Gen_on_NATURAL_KEY|}1|368|}
{2010212001|XXGvertex_oport_oport|591|0|959|0|{0|out0|}368|369|}
{2010213001|XXGoport_dst_flow|592|0|961|0|{0|}369|39|}
{2010212001|XXGvertex_oport_oport|593|0|962|0|{1|reject0|}368|370|}
{2010212001|XXGvertex_oport_oport|594|0|964|0|{2|error0|}368|371|}
{2010212001|XXGvertex_oport_oport|595|0|966|0|{3|log|}368|372|}
{2010211001|XXGvertex_iport_iport|596|0|968|0|{0|in|}368|373|}
{2010214001|XXGiport_src_flow|597|0|970|0|{0|}373|32|}
{2010214001|XXGiport_src_flow|598|0|971|0|{1|}373|12|}
{2010214001|XXGiport_src_flow|599|0|972|0|{2|}373|11|}
{2010214001|XXGiport_src_flow|600|0|973|0|{3|}373|43|}
{2010214001|XXGiport_src_flow|601|0|974|0|{4|}373|41|}
{2010007001|XXGobject_proto_object|602|0|975|0|{}368|374|}
{2010212001|XXGvertex_oport_oport|603|0|977|0|{0|out0|}374|375|}
{2010006001|XXGobject_psameas_object|604|0|979|0|{metadata|out0_metadata|1|0|}375|374|}
{2010006001|XXGobject_psameas_object|605|0|980|0|{transform0|transform0|1|0|}375|374|}
{2010212001|XXGvertex_oport_oport|606|0|981|0|{1|reject0|}374|376|}
{2010006001|XXGobject_psameas_object|607|0|983|0|{metadata|reject0_metadata|1|0|}376|374|}
{2010212001|XXGvertex_oport_oport|608|0|984|0|{2|error0|}374|377|}
{2010006001|XXGobject_psameas_object|609|0|986|0|{metadata|error0_metadata|1|0|}377|374|}
{2010212001|XXGvertex_oport_oport|610|0|987|0|{3|log|}374|378|}
{2010006001|XXGobject_psameas_object|611|0|989|0|{metadata|log_metadata|1|0|}378|374|}
{2010211001|XXGvertex_iport_iport|612|0|990|0|{0|in|}374|379|}
{2010006001|XXGobject_psameas_object|613|0|992|0|{metadata|in_metadata|1|0|}379|374|}
{2010006001|XXGobject_psameas_object|614|0|993|0|{Layout|Layout|0|0|}368|380|}
{2010211001|XXGvertex_iport_iport|615|0|995|0|{0|write|}380|381|}
{2010214001|XXGiport_src_flow|616|0|997|0|{0|}381|34|}
{2010007001|XXGobject_proto_object|617|0|998|0|{}380|382|}
{2010211001|XXGvertex_iport_iport|618|0|1000|0|{0|write|}382|383|}
{2010006001|XXGobject_psameas_object|619|0|1002|0|{metadata|write_metadata|1|0|}383|382|}
{2010006001|XXGobject_psameas_object|620|0|1003|0|{write_metadata|out1_metadata|0|0|}380|49|}
{2010006001|XXGobject_psameas_object|621|0|1004|0|{in_metadata|out1_metadata|0|0|}368|49|}
{2010006001|XXGobject_psameas_object|622|0|1005|0|{out0_metadata|out1_metadata|0|0|}368|49|}
{2010006001|XXGobject_psameas_object|623|0|1006|0|{reject0_metadata|out1_metadata|0|0|}368|49|}
{2010601001|XXGgraph_vertex_vertex|624|0|1007|0|{Hashkey_Gen_on_NATURAL_KEY_1|}1|384|}
{2010212001|XXGvertex_oport_oport|625|0|1009|0|{0|out0|}384|385|}
{2010212001|XXGvertex_oport_oport|626|0|1011|0|{1|reject0|}384|386|}
{2010212001|XXGvertex_oport_oport|627|0|1013|0|{2|error0|}384|387|}
{2010212001|XXGvertex_oport_oport|628|0|1015|0|{3|log|}384|388|}
{2010211001|XXGvertex_iport_iport|629|0|1017|0|{0|in|}384|389|}
{2010007001|XXGobject_proto_object|630|0|1019|0|{}384|390|}
{2010212001|XXGvertex_oport_oport|631|0|1021|0|{0|out0|}390|391|}
{2010006001|XXGobject_psameas_object|632|0|1023|0|{metadata|out0_metadata|1|0|}391|390|}
{2010006001|XXGobject_psameas_object|633|0|1024|0|{transform0|transform0|1|0|}391|390|}
{2010212001|XXGvertex_oport_oport|634|0|1025|0|{1|reject0|}390|392|}
{2010006001|XXGobject_psameas_object|635|0|1027|0|{metadata|reject0_metadata|1|0|}392|390|}
{2010212001|XXGvertex_oport_oport|636|0|1028|0|{2|error0|}390|393|}
{2010006001|XXGobject_psameas_object|637|0|1030|0|{metadata|error0_metadata|1|0|}393|390|}
{2010212001|XXGvertex_oport_oport|638|0|1031|0|{3|log|}390|394|}
{2010006001|XXGobject_psameas_object|639|0|1033|0|{metadata|log_metadata|1|0|}394|390|}
{2010211001|XXGvertex_iport_iport|640|0|1034|0|{0|in|}390|395|}
{2010006001|XXGobject_psameas_object|641|0|1036|0|{metadata|in_metadata|1|0|}395|390|}
{2010601001|XXGgraph_vertex_vertex|642|0|1037|0|{Lkp_View_Data|}1|396|}
{2010007001|XXGobject_proto_object|643|0|1039|0|{}396|397|}
{2010601001|XXGgraph_vertex_vertex|644|0|1041|0|{OLR_1|}1|398|}
{2010211001|XXGvertex_iport_iport|645|0|1043|0|{0|write|}398|399|}
{2010214001|XXGiport_src_flow|646|0|1045|0|{0|}399|42|}
{2010007001|XXGobject_proto_object|647|0|1046|0|{}398|400|}
{2010211001|XXGvertex_iport_iport|648|0|1048|0|{0|write|}400|401|}
{2010006001|XXGobject_psameas_object|649|0|1050|0|{metadata|write_metadata|1|0|}401|400|}
{2010006001|XXGobject_psameas_object|650|0|1051|0|{write_metadata|out1_metadata|0|0|}398|49|}
{2010601001|XXGgraph_vertex_vertex|651|0|1052|0|{OLR_2|}1|402|}
{2010211001|XXGvertex_iport_iport|652|0|1054|0|{0|write|}402|403|}
{2010214001|XXGiport_src_flow|653|0|1056|0|{0|}403|44|}
{2010007001|XXGobject_proto_object|654|0|1057|0|{}402|404|}
{2010211001|XXGvertex_iport_iport|655|0|1059|0|{0|write|}404|405|}
{2010006001|XXGobject_psameas_object|656|0|1061|0|{metadata|write_metadata|1|0|}405|404|}
{2010006001|XXGobject_psameas_object|657|0|1062|0|{write_metadata|out1_metadata|0|0|}402|49|}
{2010601001|XXGgraph_vertex_vertex|658|0|1063|0|{OLR_3|}1|406|}
{2010211001|XXGvertex_iport_iport|659|0|1065|0|{0|write|}406|407|}
{2010214001|XXGiport_src_flow|660|0|1067|0|{0|}407|13|}
{2010007001|XXGobject_proto_object|661|0|1068|0|{}406|408|}
{2010211001|XXGvertex_iport_iport|662|0|1070|0|{0|write|}408|409|}
{2010006001|XXGobject_psameas_object|663|0|1072|0|{metadata|write_metadata|1|0|}409|408|}
{2010006001|XXGobject_psameas_object|664|0|1073|0|{write_metadata|out1_metadata|0|0|}406|49|}
{2010601001|XXGgraph_vertex_vertex|665|0|1074|0|{OLR_Non_matches|}1|380|}
{2010601001|XXGgraph_vertex_vertex|666|0|1075|0|{ORX_Data|}1|67|}
{2010601001|XXGgraph_vertex_vertex|667|0|1076|0|{ORX_Processing_Fetch_From_OLR|}1|410|}
{2010605001|XXGgraph_legend_legend|668|0|1078|0|{0|}410|411|}
{2010241001|XXGlegend_face_face|669|0|1080|0|{}411|412|}
{2010605001|XXGgraph_legend_legend|670|0|1082|0|{1|}410|413|}
{2010241001|XXGlegend_face_face|671|0|1084|0|{}413|414|}
{2010605001|XXGgraph_legend_legend|672|0|1086|0|{2|}410|415|}
{2010241001|XXGlegend_face_face|673|0|1088|0|{}415|416|}
{2010605001|XXGgraph_legend_legend|674|0|1090|0|{3|}410|417|}
{2010241001|XXGlegend_face_face|675|0|1092|0|{}417|418|}
{2010605001|XXGgraph_legend_legend|676|0|1094|0|{4|}410|419|}
{2010241001|XXGlegend_face_face|677|0|1096|0|{}419|420|}
{2010605001|XXGgraph_legend_legend|678|0|1098|0|{5|}410|421|}
{2010241001|XXGlegend_face_face|679|0|1100|0|{}421|422|}
{2010605001|XXGgraph_legend_legend|680|0|1102|0|{6|}410|423|}
{2010241001|XXGlegend_face_face|681|0|1104|0|{}423|424|}
{2010604001|XXGgraph_flow_flow|682|0|1106|0|{Flow_1|}410|425|}
{2010604001|XXGgraph_flow_flow|683|0|1108|0|{Flow_10|}410|426|}
{2010604001|XXGgraph_flow_flow|684|0|1110|0|{Flow_11|}410|427|}
{2010604001|XXGgraph_flow_flow|685|0|1112|0|{Flow_13|}410|428|}
{2010604001|XXGgraph_flow_flow|686|0|1114|0|{Flow_2|}410|429|}
{2010604001|XXGgraph_flow_flow|687|0|1116|0|{Flow_8|}410|430|}
{2010604001|XXGgraph_flow_flow|688|0|1118|0|{Flow_9|}410|431|}
{2010601001|XXGgraph_vertex_vertex|689|0|1120|0|{Assign_from_OLR_IDS_on_NK_matches|}410|432|}
{2010212001|XXGvertex_oport_oport|690|0|1122|0|{0|out0|}432|433|}
{2010213001|XXGoport_dst_flow|691|0|1124|0|{0|}433|429|}
{2010212001|XXGvertex_oport_oport|692|0|1125|0|{1|reject0|}432|434|}
{2010212001|XXGvertex_oport_oport|693|0|1127|0|{2|error0|}432|435|}
{2010212001|XXGvertex_oport_oport|694|0|1129|0|{3|log|}432|436|}
{2010211001|XXGvertex_iport_iport|695|0|1131|0|{0|in|}432|437|}
{2010007001|XXGobject_proto_object|696|0|1133|0|{}432|438|}
{2010212001|XXGvertex_oport_oport|697|0|1135|0|{0|out0|}438|439|}
{2010006001|XXGobject_psameas_object|698|0|1137|0|{metadata|out0_metadata|1|0|}439|438|}
{2010006001|XXGobject_psameas_object|699|0|1138|0|{transform0|transform0|1|0|}439|438|}
{2010212001|XXGvertex_oport_oport|700|0|1139|0|{1|reject0|}438|440|}
{2010006001|XXGobject_psameas_object|701|0|1141|0|{metadata|reject0_metadata|1|0|}440|438|}
{2010212001|XXGvertex_oport_oport|702|0|1142|0|{2|error0|}438|441|}
{2010006001|XXGobject_psameas_object|703|0|1144|0|{metadata|error0_metadata|1|0|}441|438|}
{2010212001|XXGvertex_oport_oport|704|0|1145|0|{3|log|}438|442|}
{2010006001|XXGobject_psameas_object|705|0|1147|0|{metadata|log_metadata|1|0|}442|438|}
{2010211001|XXGvertex_iport_iport|706|0|1148|0|{0|in|}438|443|}
{2010006001|XXGobject_psameas_object|707|0|1150|0|{metadata|in_metadata|1|0|}443|438|}
{2010006001|XXGobject_psameas_object|708|0|1151|0|{Layout|Layout|0|0|}432|398|}
{2010006001|XXGobject_psameas_object|709|0|1152|0|{in_metadata|out0_metadata|0|0|}432|49|}
{2010006001|XXGobject_psameas_object|710|0|1153|0|{out0_metadata|out0_metadata|0|0|}432|49|}
{2010006001|XXGobject_psameas_object|711|0|1154|0|{reject0_metadata|out0_metadata|0|0|}432|49|}
{2010601001|XXGgraph_vertex_vertex|712|0|1155|0|{Assign_from_OLR_REDUCED_1_IDS|}410|444|}
{2010212001|XXGvertex_oport_oport|713|0|1157|0|{0|out0|}444|445|}
{2010213001|XXGoport_dst_flow|714|0|1159|0|{0|}445|425|}
{2010212001|XXGvertex_oport_oport|715|0|1160|0|{1|reject0|}444|446|}
{2010212001|XXGvertex_oport_oport|716|0|1162|0|{2|error0|}444|447|}
{2010212001|XXGvertex_oport_oport|717|0|1164|0|{3|log|}444|448|}
{2010211001|XXGvertex_iport_iport|718|0|1166|0|{0|in|}444|449|}
{2010214001|XXGiport_src_flow|719|0|1168|0|{0|}449|428|}
{2010007001|XXGobject_proto_object|720|0|1169|0|{}444|450|}
{2010212001|XXGvertex_oport_oport|721|0|1171|0|{0|out0|}450|451|}
{2010006001|XXGobject_psameas_object|722|0|1173|0|{metadata|out0_metadata|1|0|}451|450|}
{2010006001|XXGobject_psameas_object|723|0|1174|0|{transform0|transform0|1|0|}451|450|}
{2010212001|XXGvertex_oport_oport|724|0|1175|0|{1|reject0|}450|452|}
{2010006001|XXGobject_psameas_object|725|0|1177|0|{metadata|reject0_metadata|1|0|}452|450|}
{2010212001|XXGvertex_oport_oport|726|0|1178|0|{2|error0|}450|453|}
{2010006001|XXGobject_psameas_object|727|0|1180|0|{metadata|error0_metadata|1|0|}453|450|}
{2010212001|XXGvertex_oport_oport|728|0|1181|0|{3|log|}450|454|}
{2010006001|XXGobject_psameas_object|729|0|1183|0|{metadata|log_metadata|1|0|}454|450|}
{2010211001|XXGvertex_iport_iport|730|0|1184|0|{0|in|}450|455|}
{2010006001|XXGobject_psameas_object|731|0|1186|0|{metadata|in_metadata|1|0|}455|450|}
{2010006001|XXGobject_psameas_object|732|0|1187|0|{Layout|Layout|0|0|}444|380|}
{2010006001|XXGobject_psameas_object|733|0|1188|0|{in_metadata|out1_metadata|0|0|}444|49|}
{2010006001|XXGobject_psameas_object|734|0|1189|0|{out0_metadata|out1_metadata|0|0|}444|49|}
{2010006001|XXGobject_psameas_object|735|0|1190|0|{reject0_metadata|out1_metadata|0|0|}444|49|}
{2010601001|XXGgraph_vertex_vertex|736|0|1191|0|{Assign_from_OLR_REDUCED_IDS|}410|456|}
{2010212001|XXGvertex_oport_oport|737|0|1193|0|{0|out0|}456|457|}
{2010213001|XXGoport_dst_flow|738|0|1195|0|{0|}457|427|}
{2010212001|XXGvertex_oport_oport|739|0|1196|0|{1|reject0|}456|458|}
{2010212001|XXGvertex_oport_oport|740|0|1198|0|{2|error0|}456|459|}
{2010212001|XXGvertex_oport_oport|741|0|1200|0|{3|log|}456|460|}
{2010211001|XXGvertex_iport_iport|742|0|1202|0|{0|in|}456|461|}
{2010214001|XXGiport_src_flow|743|0|1204|0|{0|}461|430|}
{2010007001|XXGobject_proto_object|744|0|1205|0|{}456|462|}
{2010212001|XXGvertex_oport_oport|745|0|1207|0|{0|out0|}462|463|}
{2010006001|XXGobject_psameas_object|746|0|1209|0|{metadata|out0_metadata|1|0|}463|462|}
{2010006001|XXGobject_psameas_object|747|0|1210|0|{transform0|transform0|1|0|}463|462|}
{2010212001|XXGvertex_oport_oport|748|0|1211|0|{1|reject0|}462|464|}
{2010006001|XXGobject_psameas_object|749|0|1213|0|{metadata|reject0_metadata|1|0|}464|462|}
{2010212001|XXGvertex_oport_oport|750|0|1214|0|{2|error0|}462|465|}
{2010006001|XXGobject_psameas_object|751|0|1216|0|{metadata|error0_metadata|1|0|}465|462|}
{2010212001|XXGvertex_oport_oport|752|0|1217|0|{3|log|}462|466|}
{2010006001|XXGobject_psameas_object|753|0|1219|0|{metadata|log_metadata|1|0|}466|462|}
{2010211001|XXGvertex_iport_iport|754|0|1220|0|{0|in|}462|467|}
{2010006001|XXGobject_psameas_object|755|0|1222|0|{metadata|in_metadata|1|0|}467|462|}
{2010006001|XXGobject_psameas_object|756|0|1223|0|{Layout|Layout|0|0|}456|402|}
{2010006001|XXGobject_psameas_object|757|0|1224|0|{in_metadata|out0_metadata|0|0|}456|49|}
{2010006001|XXGobject_psameas_object|758|0|1225|0|{out0_metadata|out0_metadata|0|0|}456|49|}
{2010006001|XXGobject_psameas_object|759|0|1226|0|{reject0_metadata|out0_metadata|0|0|}456|49|}
{2010601001|XXGgraph_vertex_vertex|760|0|1227|0|{Filter_Matches_In_Iteration_3|}410|468|}
{2010212001|XXGvertex_oport_oport|761|0|1229|0|{0|out0|}468|469|}
{2010212001|XXGvertex_oport_oport|762|0|1231|0|{1|out1|}468|470|}
{2010212001|XXGvertex_oport_oport|763|0|1233|0|{2|reject0|}468|471|}
{2010212001|XXGvertex_oport_oport|764|0|1235|0|{3|reject1|}468|472|}
{2010212001|XXGvertex_oport_oport|765|0|1237|0|{4|error0|}468|473|}
{2010212001|XXGvertex_oport_oport|766|0|1239|0|{5|error1|}468|474|}
{2010212001|XXGvertex_oport_oport|767|0|1241|0|{6|log|}468|475|}
{2010211001|XXGvertex_iport_iport|768|0|1243|0|{0|in|}468|476|}
{2010214001|XXGiport_src_flow|769|0|1245|0|{0|}476|425|}
{2010007001|XXGobject_proto_object|770|0|1246|0|{}468|477|}
{2010212001|XXGvertex_oport_oport|771|0|1248|0|{0|out0|}477|478|}
{2010006001|XXGobject_psameas_object|772|0|1250|0|{metadata|out0_metadata|1|0|}478|477|}
{2010006001|XXGobject_psameas_object|773|0|1251|0|{transform0|transform0|1|0|}478|477|}
{2010212001|XXGvertex_oport_oport|774|0|1252|0|{1|out1|}477|479|}
{2010006001|XXGobject_psameas_object|775|0|1254|0|{metadata|out1_metadata|1|0|}479|477|}
{2010006001|XXGobject_psameas_object|776|0|1255|0|{transform1|transform1|1|0|}479|477|}
{2010212001|XXGvertex_oport_oport|777|0|1256|0|{2|reject0|}477|480|}
{2010006001|XXGobject_psameas_object|778|0|1258|0|{metadata|reject0_metadata|1|0|}480|477|}
{2010212001|XXGvertex_oport_oport|779|0|1259|0|{3|reject1|}477|481|}
{2010006001|XXGobject_psameas_object|780|0|1261|0|{metadata|reject1_metadata|1|0|}481|477|}
{2010212001|XXGvertex_oport_oport|781|0|1262|0|{4|error0|}477|482|}
{2010006001|XXGobject_psameas_object|782|0|1264|0|{metadata|error0_metadata|1|0|}482|477|}
{2010212001|XXGvertex_oport_oport|783|0|1265|0|{5|error1|}477|483|}
{2010006001|XXGobject_psameas_object|784|0|1267|0|{metadata|error1_metadata|1|0|}483|477|}
{2010212001|XXGvertex_oport_oport|785|0|1268|0|{6|log|}477|484|}
{2010006001|XXGobject_psameas_object|786|0|1270|0|{metadata|log_metadata|1|0|}484|477|}
{2010211001|XXGvertex_iport_iport|787|0|1271|0|{0|in|}477|485|}
{2010006001|XXGobject_psameas_object|788|0|1273|0|{metadata|in_metadata|1|0|}485|477|}
{2010006001|XXGobject_psameas_object|789|0|1274|0|{Layout|Layout|0|0|}468|380|}
{2010006001|XXGobject_psameas_object|790|0|1275|0|{in_metadata|out1_metadata|0|0|}468|49|}
{2010006001|XXGobject_psameas_object|791|0|1276|0|{out0_metadata|out1_metadata|0|0|}468|49|}
{2010006001|XXGobject_psameas_object|792|0|1277|0|{out1_metadata|out1_metadata|0|0|}468|49|}
{2010006001|XXGobject_psameas_object|793|0|1278|0|{reject0_metadata|out1_metadata|0|0|}468|49|}
{2010006001|XXGobject_psameas_object|794|0|1279|0|{reject1_metadata|out1_metadata|0|0|}468|49|}
{2010601001|XXGgraph_vertex_vertex|795|0|1280|0|{OLR_LKP_TPL|}410|486|}
{2010007001|XXGobject_proto_object|796|0|1282|0|{}486|487|}
{2010601001|XXGgraph_vertex_vertex|797|0|1284|0|{OLR_REDUCED_1_LKP_TPL|}410|488|}
{2010007001|XXGobject_proto_object|798|0|1286|0|{}488|489|}
{2010601001|XXGgraph_vertex_vertex|799|0|1288|0|{OLR_REDUCED_LKP_TPL|}410|490|}
{2010007001|XXGobject_proto_object|800|0|1290|0|{}490|491|}
{2010601001|XXGgraph_vertex_vertex|801|0|1292|0|{PBKS|}410|492|}
{2010604001|XXGgraph_flow_flow|802|0|1294|0|{Flow_1|}492|493|}
{2010601001|XXGgraph_vertex_vertex|803|0|1296|0|{Partition_by_Key|}492|494|}
{2010212001|XXGvertex_oport_oport|804|0|1298|0|{0|out|}494|495|}
{2010213001|XXGoport_dst_flow|805|0|1300|0|{0|}495|493|}
{2010211001|XXGvertex_iport_iport|806|0|1301|0|{0|in|}494|496|}
{2010006001|XXGobject_psameas_object|807|0|1303|0|{in_metadata|out0_metadata|0|0|}494|49|}
{2010006001|XXGobject_psameas_object|808|0|1304|0|{out_metadata|out0_metadata|0|0|}494|49|}
{2010601001|XXGgraph_vertex_vertex|809|0|1305|0|{Sort|}492|497|}
{2010212001|XXGvertex_oport_oport|810|0|1307|0|{0|out|}497|498|}
{2010211001|XXGvertex_iport_iport|811|0|1309|0|{0|in|}497|499|}
{2010214001|XXGiport_src_flow|812|0|1311|0|{0|}499|493|}
{2010006001|XXGobject_psameas_object|813|0|1312|0|{in_metadata|out0_metadata|0|0|}497|49|}
{2010006001|XXGobject_psameas_object|814|0|1313|0|{out_metadata|out0_metadata|0|0|}497|49|}
{2010212001|XXGvertex_oport_oport|815|0|1314|0|{0|out0|}492|500|}
{2010216002|XXGoport_binding_oport|816|0|1316|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}500|498|}
{2010213001|XXGoport_dst_flow|817|0|1317|0|{0|}500|430|}
{2010211001|XXGvertex_iport_iport|818|0|1318|0|{0|in0|}492|501|}
{2010215002|XXGiport_binding_iport|819|0|1320|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}501|496|}
{2010214001|XXGiport_src_flow|820|0|1321|0|{0|}501|431|}
{2010007001|XXGobject_proto_object|821|0|1322|0|{}492|502|}
{2010604001|XXGgraph_flow_flow|822|0|1324|0|{Flow_1|}502|503|}
{2010601001|XXGgraph_vertex_vertex|823|0|1326|0|{Partition_by_Key|}502|504|}
{2010212001|XXGvertex_oport_oport|824|0|1328|0|{0|out|}504|505|}
{2010213001|XXGoport_dst_flow|825|0|1330|0|{0|}505|503|}
{2010211001|XXGvertex_iport_iport|826|0|1331|0|{0|in|}504|506|}
{2010007001|XXGobject_proto_object|827|0|1333|0|{}504|507|}
{2010212001|XXGvertex_oport_oport|828|0|1335|0|{0|out|}507|508|}
{2010006001|XXGobject_psameas_object|829|0|1337|0|{metadata|out_metadata|1|0|}508|507|}
{2010211001|XXGvertex_iport_iport|830|0|1338|0|{0|in|}507|509|}
{2010006001|XXGobject_psameas_object|831|0|1340|0|{metadata|in_metadata|1|0|}509|507|}
{2010006001|XXGobject_psameas_object|832|0|1341|0|{Layout|InputLayout|1|0|}504|502|}
{2010006001|XXGobject_psameas_object|833|0|1342|0|{key|Key|1|0|}504|502|}
{2010601001|XXGgraph_vertex_vertex|834|0|1343|0|{Sort|}502|510|}
{2010212001|XXGvertex_oport_oport|835|0|1345|0|{0|out|}510|511|}
{2010211001|XXGvertex_iport_iport|836|0|1347|0|{0|in|}510|512|}
{2010214001|XXGiport_src_flow|837|0|1349|0|{0|}512|503|}
{2010007001|XXGobject_proto_object|838|0|1350|0|{}510|513|}
{2010212001|XXGvertex_oport_oport|839|0|1352|0|{0|out|}513|514|}
{2010006001|XXGobject_psameas_object|840|0|1354|0|{metadata|out_metadata|1|0|}514|513|}
{2010211001|XXGvertex_iport_iport|841|0|1355|0|{0|in|}513|515|}
{2010006001|XXGobject_psameas_object|842|0|1357|0|{metadata|in_metadata|1|0|}515|513|}
{2010006001|XXGobject_psameas_object|843|0|1358|0|{Layout|OutputLayout|1|0|}510|502|}
{2010006001|XXGobject_psameas_object|844|0|1359|0|{key|Key|1|0|}510|502|}
{2010006001|XXGobject_psameas_object|845|0|1360|0|{max_core|Max_core|1|0|}510|502|}
{2010212001|XXGvertex_oport_oport|846|0|1361|0|{0|out0|}502|516|}
{2010216002|XXGoport_binding_oport|847|0|1363|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}516|511|}
{2010211001|XXGvertex_iport_iport|848|0|1364|0|{0|in0|}502|517|}
{2010215002|XXGiport_binding_iport|849|0|1366|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}517|506|}
{2010006001|XXGobject_psameas_object|850|0|1367|0|{InputLayout|Layout|0|0|}492|398|}
{2010006001|XXGobject_psameas_object|851|0|1368|0|{OutputLayout|Layout|0|0|}492|402|}
{2010601001|XXGgraph_vertex_vertex|852|0|1369|0|{PBKS_1|}410|518|}
{2010604001|XXGgraph_flow_flow|853|0|1371|0|{Flow_1|}518|519|}
{2010601001|XXGgraph_vertex_vertex|854|0|1373|0|{Partition_by_Key|}518|520|}
{2010212001|XXGvertex_oport_oport|855|0|1375|0|{0|out|}520|521|}
{2010213001|XXGoport_dst_flow|856|0|1377|0|{0|}521|519|}
{2010211001|XXGvertex_iport_iport|857|0|1378|0|{0|in|}520|522|}
{2010006001|XXGobject_psameas_object|858|0|1380|0|{in_metadata|out0_metadata|0|0|}520|49|}
{2010006001|XXGobject_psameas_object|859|0|1381|0|{out_metadata|out0_metadata|0|0|}520|49|}
{2010601001|XXGgraph_vertex_vertex|860|0|1382|0|{Sort|}518|523|}
{2010212001|XXGvertex_oport_oport|861|0|1384|0|{0|out|}523|524|}
{2010211001|XXGvertex_iport_iport|862|0|1386|0|{0|in|}523|525|}
{2010214001|XXGiport_src_flow|863|0|1388|0|{0|}525|519|}
{2010006001|XXGobject_psameas_object|864|0|1389|0|{in_metadata|out1_metadata|0|0|}523|49|}
{2010006001|XXGobject_psameas_object|865|0|1390|0|{out_metadata|out1_metadata|0|0|}523|49|}
{2010212001|XXGvertex_oport_oport|866|0|1391|0|{0|out0|}518|526|}
{2010216002|XXGoport_binding_oport|867|0|1393|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}526|524|}
{2010213001|XXGoport_dst_flow|868|0|1394|0|{0|}526|428|}
{2010211001|XXGvertex_iport_iport|869|0|1395|0|{0|in0|}518|527|}
{2010215002|XXGiport_binding_iport|870|0|1397|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}527|522|}
{2010214001|XXGiport_src_flow|871|0|1398|0|{0|}527|426|}
{2010007001|XXGobject_proto_object|872|0|1399|0|{}518|528|}
{2010604001|XXGgraph_flow_flow|873|0|1401|0|{Flow_1|}528|529|}
{2010601001|XXGgraph_vertex_vertex|874|0|1403|0|{Partition_by_Key|}528|530|}
{2010212001|XXGvertex_oport_oport|875|0|1405|0|{0|out|}530|531|}
{2010213001|XXGoport_dst_flow|876|0|1407|0|{0|}531|529|}
{2010211001|XXGvertex_iport_iport|877|0|1408|0|{0|in|}530|532|}
{2010007001|XXGobject_proto_object|878|0|1410|0|{}530|533|}
{2010212001|XXGvertex_oport_oport|879|0|1412|0|{0|out|}533|534|}
{2010006001|XXGobject_psameas_object|880|0|1414|0|{metadata|out_metadata|1|0|}534|533|}
{2010211001|XXGvertex_iport_iport|881|0|1415|0|{0|in|}533|535|}
{2010006001|XXGobject_psameas_object|882|0|1417|0|{metadata|in_metadata|1|0|}535|533|}
{2010006001|XXGobject_psameas_object|883|0|1418|0|{Layout|InputLayout|1|0|}530|528|}
{2010006001|XXGobject_psameas_object|884|0|1419|0|{key|Key|1|0|}530|528|}
{2010601001|XXGgraph_vertex_vertex|885|0|1420|0|{Sort|}528|536|}
{2010212001|XXGvertex_oport_oport|886|0|1422|0|{0|out|}536|537|}
{2010211001|XXGvertex_iport_iport|887|0|1424|0|{0|in|}536|538|}
{2010214001|XXGiport_src_flow|888|0|1426|0|{0|}538|529|}
{2010007001|XXGobject_proto_object|889|0|1427|0|{}536|539|}
{2010212001|XXGvertex_oport_oport|890|0|1429|0|{0|out|}539|540|}
{2010006001|XXGobject_psameas_object|891|0|1431|0|{metadata|out_metadata|1|0|}540|539|}
{2010211001|XXGvertex_iport_iport|892|0|1432|0|{0|in|}539|541|}
{2010006001|XXGobject_psameas_object|893|0|1434|0|{metadata|in_metadata|1|0|}541|539|}
{2010006001|XXGobject_psameas_object|894|0|1435|0|{Layout|OutputLayout|1|0|}536|528|}
{2010006001|XXGobject_psameas_object|895|0|1436|0|{key|Key|1|0|}536|528|}
{2010006001|XXGobject_psameas_object|896|0|1437|0|{max_core|Max_core|1|0|}536|528|}
{2010212001|XXGvertex_oport_oport|897|0|1438|0|{0|out0|}528|542|}
{2010216002|XXGoport_binding_oport|898|0|1440|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}542|537|}
{2010211001|XXGvertex_iport_iport|899|0|1441|0|{0|in0|}528|543|}
{2010215002|XXGiport_binding_iport|900|0|1443|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}543|532|}
{2010006001|XXGobject_psameas_object|901|0|1444|0|{InputLayout|Layout|0|0|}518|402|}
{2010006001|XXGobject_psameas_object|902|0|1445|0|{OutputLayout|Layout|0|0|}518|380|}
{2010601001|XXGgraph_vertex_vertex|903|0|1446|0|{Regenerate_Hashkey_On_claim_nbr_src_env_sk_|}410|544|}
{2010212001|XXGvertex_oport_oport|904|0|1448|0|{0|out0|}544|545|}
{2010213001|XXGoport_dst_flow|905|0|1450|0|{0|}545|431|}
{2010212001|XXGvertex_oport_oport|906|0|1451|0|{1|out1|}544|546|}
{2010212001|XXGvertex_oport_oport|907|0|1453|0|{2|reject0|}544|547|}
{2010212001|XXGvertex_oport_oport|908|0|1455|0|{3|reject1|}544|548|}
{2010212001|XXGvertex_oport_oport|909|0|1457|0|{4|error0|}544|549|}
{2010212001|XXGvertex_oport_oport|910|0|1459|0|{5|error1|}544|550|}
{2010212001|XXGvertex_oport_oport|911|0|1461|0|{6|log|}544|551|}
{2010211001|XXGvertex_iport_iport|912|0|1463|0|{0|in|}544|552|}
{2010214001|XXGiport_src_flow|913|0|1465|0|{0|}552|429|}
{2010007001|XXGobject_proto_object|914|0|1466|0|{}544|553|}
{2010212001|XXGvertex_oport_oport|915|0|1468|0|{0|out0|}553|554|}
{2010006001|XXGobject_psameas_object|916|0|1470|0|{metadata|out0_metadata|1|0|}554|553|}
{2010006001|XXGobject_psameas_object|917|0|1471|0|{transform0|transform0|1|0|}554|553|}
{2010212001|XXGvertex_oport_oport|918|0|1472|0|{1|out1|}553|555|}
{2010006001|XXGobject_psameas_object|919|0|1474|0|{metadata|out1_metadata|1|0|}555|553|}
{2010006001|XXGobject_psameas_object|920|0|1475|0|{transform1|transform1|1|0|}555|553|}
{2010212001|XXGvertex_oport_oport|921|0|1476|0|{2|reject0|}553|556|}
{2010006001|XXGobject_psameas_object|922|0|1478|0|{metadata|reject0_metadata|1|0|}556|553|}
{2010212001|XXGvertex_oport_oport|923|0|1479|0|{3|reject1|}553|557|}
{2010006001|XXGobject_psameas_object|924|0|1481|0|{metadata|reject1_metadata|1|0|}557|553|}
{2010212001|XXGvertex_oport_oport|925|0|1482|0|{4|error0|}553|558|}
{2010006001|XXGobject_psameas_object|926|0|1484|0|{metadata|error0_metadata|1|0|}558|553|}
{2010212001|XXGvertex_oport_oport|927|0|1485|0|{5|error1|}553|559|}
{2010006001|XXGobject_psameas_object|928|0|1487|0|{metadata|error1_metadata|1|0|}559|553|}
{2010212001|XXGvertex_oport_oport|929|0|1488|0|{6|log|}553|560|}
{2010006001|XXGobject_psameas_object|930|0|1490|0|{metadata|log_metadata|1|0|}560|553|}
{2010211001|XXGvertex_iport_iport|931|0|1491|0|{0|in|}553|561|}
{2010006001|XXGobject_psameas_object|932|0|1493|0|{metadata|in_metadata|1|0|}561|553|}
{2010006001|XXGobject_psameas_object|933|0|1494|0|{Layout|Layout|0|0|}544|398|}
{2010006001|XXGobject_psameas_object|934|0|1495|0|{in_metadata|out0_metadata|0|0|}544|49|}
{2010006001|XXGobject_psameas_object|935|0|1496|0|{out0_metadata|out0_metadata|0|0|}544|49|}
{2010006001|XXGobject_psameas_object|936|0|1497|0|{out1_metadata|out1_metadata|0|0|}544|49|}
{2010006001|XXGobject_psameas_object|937|0|1498|0|{reject0_metadata|out0_metadata|0|0|}544|49|}
{2010006001|XXGobject_psameas_object|938|0|1499|0|{reject1_metadata|out0_metadata|0|0|}544|49|}
{2010601001|XXGgraph_vertex_vertex|939|0|1500|0|{Regenerate_Hashkey_On_prod_id_filled_dt_|}410|562|}
{2010212001|XXGvertex_oport_oport|940|0|1502|0|{0|out0|}562|563|}
{2010213001|XXGoport_dst_flow|941|0|1504|0|{0|}563|426|}
{2010212001|XXGvertex_oport_oport|942|0|1505|0|{1|out1|}562|564|}
{2010212001|XXGvertex_oport_oport|943|0|1507|0|{2|reject0|}562|565|}
{2010212001|XXGvertex_oport_oport|944|0|1509|0|{3|reject1|}562|566|}
{2010212001|XXGvertex_oport_oport|945|0|1511|0|{4|error0|}562|567|}
{2010212001|XXGvertex_oport_oport|946|0|1513|0|{5|error1|}562|568|}
{2010212001|XXGvertex_oport_oport|947|0|1515|0|{6|log|}562|569|}
{2010211001|XXGvertex_iport_iport|948|0|1517|0|{0|in|}562|570|}
{2010214001|XXGiport_src_flow|949|0|1519|0|{0|}570|427|}
{2010007001|XXGobject_proto_object|950|0|1520|0|{}562|571|}
{2010212001|XXGvertex_oport_oport|951|0|1522|0|{0|out0|}571|572|}
{2010006001|XXGobject_psameas_object|952|0|1524|0|{metadata|out0_metadata|1|0|}572|571|}
{2010006001|XXGobject_psameas_object|953|0|1525|0|{transform0|transform0|1|0|}572|571|}
{2010212001|XXGvertex_oport_oport|954|0|1526|0|{1|out1|}571|573|}
{2010006001|XXGobject_psameas_object|955|0|1528|0|{metadata|out1_metadata|1|0|}573|571|}
{2010006001|XXGobject_psameas_object|956|0|1529|0|{transform1|transform1|1|0|}573|571|}
{2010212001|XXGvertex_oport_oport|957|0|1530|0|{2|reject0|}571|574|}
{2010006001|XXGobject_psameas_object|958|0|1532|0|{metadata|reject0_metadata|1|0|}574|571|}
{2010212001|XXGvertex_oport_oport|959|0|1533|0|{3|reject1|}571|575|}
{2010006001|XXGobject_psameas_object|960|0|1535|0|{metadata|reject1_metadata|1|0|}575|571|}
{2010212001|XXGvertex_oport_oport|961|0|1536|0|{4|error0|}571|576|}
{2010006001|XXGobject_psameas_object|962|0|1538|0|{metadata|error0_metadata|1|0|}576|571|}
{2010212001|XXGvertex_oport_oport|963|0|1539|0|{5|error1|}571|577|}
{2010006001|XXGobject_psameas_object|964|0|1541|0|{metadata|error1_metadata|1|0|}577|571|}
{2010212001|XXGvertex_oport_oport|965|0|1542|0|{6|log|}571|578|}
{2010006001|XXGobject_psameas_object|966|0|1544|0|{metadata|log_metadata|1|0|}578|571|}
{2010211001|XXGvertex_iport_iport|967|0|1545|0|{0|in|}571|579|}
{2010006001|XXGobject_psameas_object|968|0|1547|0|{metadata|in_metadata|1|0|}579|571|}
{2010006001|XXGobject_psameas_object|969|0|1548|0|{Layout|Layout|0|0|}562|402|}
{2010006001|XXGobject_psameas_object|970|0|1549|0|{in_metadata|out0_metadata|0|0|}562|49|}
{2010006001|XXGobject_psameas_object|971|0|1550|0|{out0_metadata|out0_metadata|0|0|}562|49|}
{2010006001|XXGobject_psameas_object|972|0|1551|0|{out1_metadata|out1_metadata|0|0|}562|49|}
{2010006001|XXGobject_psameas_object|973|0|1552|0|{reject0_metadata|out0_metadata|0|0|}562|49|}
{2010006001|XXGobject_psameas_object|974|0|1553|0|{reject1_metadata|out0_metadata|0|0|}562|49|}
{2010212001|XXGvertex_oport_oport|975|0|1554|0|{0|out0|}410|580|}
{2010216002|XXGoport_binding_oport|976|0|1556|0|{.5|.5|{0|}16096|}580|564|}
{2010213001|XXGoport_dst_flow|977|0|1557|0|{0|}580|10|}
{2010212001|XXGvertex_oport_oport|978|0|1558|0|{1|out1|}410|581|}
{2010216002|XXGoport_binding_oport|979|0|1560|0|{.5|.5|{0|}16097|}581|546|}
{2010213001|XXGoport_dst_flow|980|0|1561|0|{0|}581|20|}
{2010212001|XXGvertex_oport_oport|981|0|1562|0|{2|out2|}410|582|}
{2010216002|XXGoport_binding_oport|982|0|1564|0|{.5|.5|{0|}16098|}582|469|}
{2010213001|XXGoport_dst_flow|983|0|1565|0|{0|}582|31|}
{2010212001|XXGvertex_oport_oport|984|0|1566|0|{3|out3|}410|583|}
{2010216002|XXGoport_binding_oport|985|0|1568|0|{.5|.5|{0|}16099|}583|470|}
{2010213001|XXGoport_dst_flow|986|0|1569|0|{0|}583|15|}
{2010211001|XXGvertex_iport_iport|987|0|1570|0|{0|in0|}410|584|}
{2010215002|XXGiport_binding_iport|988|0|1572|0|{.5|.5|{0|}16095|}584|437|}
{2010214001|XXGiport_src_flow|989|0|1573|0|{0|}584|30|}
{2010601001|XXGgraph_vertex_vertex|990|0|1574|0|{Output_File|}1|341|}
{2010601001|XXGgraph_vertex_vertex|991|0|1575|0|{Overlay_File_Validation|}1|585|}
{2010604001|XXGgraph_flow_flow|992|0|1577|0|{Flow_1|}585|586|}
{2010604001|XXGgraph_flow_flow|993|0|1579|0|{Flow_2|}585|587|}
{2010604001|XXGgraph_flow_flow|994|0|1581|0|{Flow_3|}585|588|}
{2010604001|XXGgraph_flow_flow|995|0|1583|0|{Flow_5|}585|589|}
{2010601001|XXGgraph_vertex_vertex|996|0|1585|0|{Gather|}585|590|}
{2010212001|XXGvertex_oport_oport|997|0|1587|0|{0|out|}590|591|}
{2010213001|XXGoport_dst_flow|998|0|1589|0|{0|}591|588|}
{2010211001|XXGvertex_iport_iport|999|0|1590|0|{0|in|}590|592|}
{2010007001|XXGobject_proto_object|1000|0|1592|0|{}590|593|}
{2010212001|XXGvertex_oport_oport|1001|0|1594|0|{0|out|}593|594|}
{2010006001|XXGobject_psameas_object|1002|0|1596|0|{metadata|out_metadata|1|0|}594|593|}
{2010211001|XXGvertex_iport_iport|1003|0|1597|0|{0|in|}593|595|}
{2010006001|XXGobject_psameas_object|1004|0|1599|0|{metadata|in_metadata|1|0|}595|593|}
{2010006001|XXGobject_psameas_object|1005|0|1600|0|{Layout|Layout|0|0|}590|596|}
{2010212001|XXGvertex_oport_oport|1006|0|1602|0|{0|read|}596|597|}
{2010213001|XXGoport_dst_flow|1007|0|1604|0|{0|}597|587|}
{2010211001|XXGvertex_iport_iport|1008|0|1605|0|{0|write|}596|598|}
{2010214001|XXGiport_src_flow|1009|0|1607|0|{0|}598|586|}
{2010007001|XXGobject_proto_object|1010|0|1608|0|{}596|599|}
{2010212001|XXGvertex_oport_oport|1011|0|1610|0|{0|read|}599|600|}
{2010006001|XXGobject_psameas_object|1012|0|1612|0|{metadata|read_metadata|1|0|}600|599|}
{2010211001|XXGvertex_iport_iport|1013|0|1613|0|{0|write|}599|601|}
{2010006001|XXGobject_psameas_object|1014|0|1615|0|{metadata|write_metadata|1|0|}601|599|}
{2010006001|XXGobject_psameas_object|1015|0|1616|0|{read_metadata|out0_metadata|0|0|}596|71|}
{2010006001|XXGobject_psameas_object|1016|0|1617|0|{write_metadata|out0_metadata|0|0|}596|71|}
{2010006001|XXGobject_psameas_object|1017|0|1618|0|{in_metadata|out0_metadata|0|0|}590|71|}
{2010006001|XXGobject_psameas_object|1018|0|1619|0|{out_metadata|out0_metadata|0|0|}590|71|}
{2010601001|XXGgraph_vertex_vertex|1019|0|1620|0|{Mismatch_Count_Validation|}585|602|}
{2010212001|XXGvertex_oport_oport|1020|0|1622|0|{0|out0|}602|603|}
{2010213001|XXGoport_dst_flow|1021|0|1624|0|{0|}603|589|}
{2010212001|XXGvertex_oport_oport|1022|0|1625|0|{1|reject0|}602|604|}
{2010212001|XXGvertex_oport_oport|1023|0|1627|0|{2|error0|}602|605|}
{2010212001|XXGvertex_oport_oport|1024|0|1629|0|{3|log|}602|606|}
{2010211001|XXGvertex_iport_iport|1025|0|1631|0|{0|in|}602|607|}
{2010214001|XXGiport_src_flow|1026|0|1633|0|{0|}607|587|}
{2010007001|XXGobject_proto_object|1027|0|1634|0|{}602|608|}
{2010212001|XXGvertex_oport_oport|1028|0|1636|0|{0|out0|}608|609|}
{2010006001|XXGobject_psameas_object|1029|0|1638|0|{metadata|out0_metadata|1|0|}609|608|}
{2010006001|XXGobject_psameas_object|1030|0|1639|0|{transform0|transform0|1|0|}609|608|}
{2010212001|XXGvertex_oport_oport|1031|0|1640|0|{1|reject0|}608|610|}
{2010006001|XXGobject_psameas_object|1032|0|1642|0|{metadata|reject0_metadata|1|0|}610|608|}
{2010212001|XXGvertex_oport_oport|1033|0|1643|0|{2|error0|}608|611|}
{2010006001|XXGobject_psameas_object|1034|0|1645|0|{metadata|error0_metadata|1|0|}611|608|}
{2010212001|XXGvertex_oport_oport|1035|0|1646|0|{3|log|}608|612|}
{2010006001|XXGobject_psameas_object|1036|0|1648|0|{metadata|log_metadata|1|0|}612|608|}
{2010211001|XXGvertex_iport_iport|1037|0|1649|0|{0|in|}608|613|}
{2010006001|XXGobject_psameas_object|1038|0|1651|0|{metadata|in_metadata|1|0|}613|608|}
{2010006001|XXGobject_psameas_object|1039|0|1652|0|{Layout|Layout|0|0|}602|596|}
{2010006001|XXGobject_psameas_object|1040|0|1653|0|{in_metadata|out0_metadata|0|0|}602|71|}
{2010006001|XXGobject_psameas_object|1041|0|1654|0|{reject0_metadata|out0_metadata|0|0|}602|71|}
{2010601001|XXGgraph_vertex_vertex|1042|0|1655|0|{Non_Matching_Records|}585|596|}
{2010601001|XXGgraph_vertex_vertex|1043|0|1656|0|{Trash|}585|614|}
{2010211001|XXGvertex_iport_iport|1044|0|1658|0|{0|in|}614|615|}
{2010214001|XXGiport_src_flow|1045|0|1660|0|{0|}615|589|}
{2010007001|XXGobject_proto_object|1046|0|1661|0|{}614|616|}
{2010211001|XXGvertex_iport_iport|1047|0|1663|0|{0|in|}616|617|}
{2010006001|XXGobject_psameas_object|1048|0|1665|0|{metadata|in_metadata|1|0|}617|616|}
{2010006001|XXGobject_psameas_object|1049|0|1666|0|{Layout|Layout|0|0|}614|596|}
{2010006001|XXGobject_psameas_object|1050|0|1667|0|{in_metadata|out0_metadata|0|0|}614|602|}
{2010601001|XXGgraph_vertex_vertex|1051|0|1668|0|{is_match_0|}585|618|}
{2010212001|XXGvertex_oport_oport|1052|0|1670|0|{0|out|}618|619|}
{2010213001|XXGoport_dst_flow|1053|0|1672|0|{0|}619|586|}
{2010212001|XXGvertex_oport_oport|1054|0|1673|0|{1|deselect|}618|620|}
{2010212001|XXGvertex_oport_oport|1055|0|1675|0|{2|reject|}618|621|}
{2010212001|XXGvertex_oport_oport|1056|0|1677|0|{3|error|}618|622|}
{2010212001|XXGvertex_oport_oport|1057|0|1679|0|{4|log|}618|623|}
{2010211001|XXGvertex_iport_iport|1058|0|1681|0|{0|in|}618|624|}
{2010214001|XXGiport_src_flow|1059|0|1683|0|{0|}624|588|}
{2010007001|XXGobject_proto_object|1060|0|1684|0|{}618|625|}
{2010212001|XXGvertex_oport_oport|1061|0|1686|0|{0|out|}625|626|}
{2010006001|XXGobject_psameas_object|1062|0|1688|0|{metadata|out_metadata|1|0|}626|625|}
{2010212001|XXGvertex_oport_oport|1063|0|1689|0|{1|deselect|}625|627|}
{2010006001|XXGobject_psameas_object|1064|0|1691|0|{metadata|deselect_metadata|1|0|}627|625|}
{2010212001|XXGvertex_oport_oport|1065|0|1692|0|{2|reject|}625|628|}
{2010006001|XXGobject_psameas_object|1066|0|1694|0|{metadata|reject_metadata|1|0|}628|625|}
{2010212001|XXGvertex_oport_oport|1067|0|1695|0|{3|error|}625|629|}
{2010006001|XXGobject_psameas_object|1068|0|1697|0|{metadata|error_metadata|1|0|}629|625|}
{2010212001|XXGvertex_oport_oport|1069|0|1698|0|{4|log|}625|630|}
{2010006001|XXGobject_psameas_object|1070|0|1700|0|{metadata|log_metadata|1|0|}630|625|}
{2010211001|XXGvertex_iport_iport|1071|0|1701|0|{0|in|}625|631|}
{2010006001|XXGobject_psameas_object|1072|0|1703|0|{metadata|in_metadata|1|0|}631|625|}
{2010006001|XXGobject_psameas_object|1073|0|1704|0|{Layout|Layout|0|0|}618|596|}
{2010006001|XXGobject_psameas_object|1074|0|1705|0|{deselect_metadata|out0_metadata|0|0|}618|71|}
{2010006001|XXGobject_psameas_object|1075|0|1706|0|{in_metadata|out0_metadata|0|0|}618|71|}
{2010006001|XXGobject_psameas_object|1076|0|1707|0|{out_metadata|out0_metadata|0|0|}618|71|}
{2010006001|XXGobject_psameas_object|1077|0|1708|0|{reject_metadata|out0_metadata|0|0|}618|71|}
{2010211001|XXGvertex_iport_iport|1078|0|1709|0|{0|in0|}585|632|}
{2010215002|XXGiport_binding_iport|1079|0|1711|0|{.5|.5|{0|}15816|}632|592|}
{2010214001|XXGiport_src_flow|1080|0|1712|0|{0|}632|22|}
{2010601001|XXGgraph_vertex_vertex|1081|0|1713|0|{Overlayed_SPLIT_IDS_file|}1|83|}
{2010601001|XXGgraph_vertex_vertex|1082|0|1714|0|{PBE_Repartition_records_as_per_their_previous_partition_order|}1|633|}
{2010212001|XXGvertex_oport_oport|1083|0|1716|0|{0|out|}633|634|}
{2010213001|XXGoport_dst_flow|1084|0|1718|0|{0|}634|35|}
{2010212001|XXGvertex_oport_oport|1085|0|1719|0|{1|reject|}633|635|}
{2010212001|XXGvertex_oport_oport|1086|0|1721|0|{2|error|}633|636|}
{2010212001|XXGvertex_oport_oport|1087|0|1723|0|{3|log|}633|637|}
{2010211001|XXGvertex_iport_iport|1088|0|1725|0|{0|in|}633|638|}
{2010214001|XXGiport_src_flow|1089|0|1727|0|{0|}638|18|}
{2010007001|XXGobject_proto_object|1090|0|1728|0|{}633|639|}
{2010212001|XXGvertex_oport_oport|1091|0|1730|0|{0|out|}639|640|}
{2010006001|XXGobject_psameas_object|1092|0|1732|0|{metadata|out_metadata|1|0|}640|639|}
{2010212001|XXGvertex_oport_oport|1093|0|1733|0|{1|reject|}639|641|}
{2010006001|XXGobject_psameas_object|1094|0|1735|0|{metadata|reject_metadata|1|0|}641|639|}
{2010212001|XXGvertex_oport_oport|1095|0|1736|0|{2|error|}639|642|}
{2010006001|XXGobject_psameas_object|1096|0|1738|0|{metadata|error_metadata|1|0|}642|639|}
{2010212001|XXGvertex_oport_oport|1097|0|1739|0|{3|log|}639|643|}
{2010006001|XXGobject_psameas_object|1098|0|1741|0|{metadata|log_metadata|1|0|}643|639|}
{2010211001|XXGvertex_iport_iport|1099|0|1742|0|{0|in|}639|644|}
{2010006001|XXGobject_psameas_object|1100|0|1744|0|{metadata|in_metadata|1|0|}644|639|}
{2010006001|XXGobject_psameas_object|1101|0|1745|0|{Layout|Layout|0|0|}633|341|}
{2010006001|XXGobject_psameas_object|1102|0|1746|0|{in_metadata|out1_metadata|0|0|}633|49|}
{2010006001|XXGobject_psameas_object|1103|0|1747|0|{out_metadata|out1_metadata|0|0|}633|49|}
{2010006001|XXGobject_psameas_object|1104|0|1748|0|{reject_metadata|out1_metadata|0|0|}633|49|}
{2010601001|XXGgraph_vertex_vertex|1105|0|1749|0|{PBKS_3|}1|645|}
{2010604001|XXGgraph_flow_flow|1106|0|1751|0|{Flow_1|}645|646|}
{2010601001|XXGgraph_vertex_vertex|1107|0|1753|0|{Partition_by_Key|}645|647|}
{2010212001|XXGvertex_oport_oport|1108|0|1755|0|{0|out|}647|648|}
{2010213001|XXGoport_dst_flow|1109|0|1757|0|{0|}648|646|}
{2010211001|XXGvertex_iport_iport|1110|0|1758|0|{0|in|}647|649|}
{2010006001|XXGobject_psameas_object|1111|0|1760|0|{in_metadata|out1_metadata|0|0|}647|49|}
{2010006001|XXGobject_psameas_object|1112|0|1761|0|{out_metadata|out1_metadata|0|0|}647|49|}
{2010601001|XXGgraph_vertex_vertex|1113|0|1762|0|{Sort|}645|650|}
{2010212001|XXGvertex_oport_oport|1114|0|1764|0|{0|out|}650|651|}
{2010211001|XXGvertex_iport_iport|1115|0|1766|0|{0|in|}650|652|}
{2010214001|XXGiport_src_flow|1116|0|1768|0|{0|}652|646|}
{2010006001|XXGobject_psameas_object|1117|0|1769|0|{in_metadata|out1_metadata|0|0|}650|49|}
{2010006001|XXGobject_psameas_object|1118|0|1770|0|{out_metadata|out1_metadata|0|0|}650|49|}
{2010212001|XXGvertex_oport_oport|1119|0|1771|0|{0|out0|}645|653|}
{2010216002|XXGoport_binding_oport|1120|0|1773|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}653|651|}
{2010213001|XXGoport_dst_flow|1121|0|1774|0|{0|}653|14|}
{2010211001|XXGvertex_iport_iport|1122|0|1775|0|{0|in0|}645|654|}
{2010215002|XXGiport_binding_iport|1123|0|1777|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}654|649|}
{2010214001|XXGiport_src_flow|1124|0|1778|0|{0|}654|39|}
{2010007001|XXGobject_proto_object|1125|0|1779|0|{}645|655|}
{2010604001|XXGgraph_flow_flow|1126|0|1781|0|{Flow_1|}655|656|}
{2010601001|XXGgraph_vertex_vertex|1127|0|1783|0|{Partition_by_Key|}655|657|}
{2010212001|XXGvertex_oport_oport|1128|0|1785|0|{0|out|}657|658|}
{2010213001|XXGoport_dst_flow|1129|0|1787|0|{0|}658|656|}
{2010211001|XXGvertex_iport_iport|1130|0|1788|0|{0|in|}657|659|}
{2010007001|XXGobject_proto_object|1131|0|1790|0|{}657|660|}
{2010212001|XXGvertex_oport_oport|1132|0|1792|0|{0|out|}660|661|}
{2010006001|XXGobject_psameas_object|1133|0|1794|0|{metadata|out_metadata|1|0|}661|660|}
{2010211001|XXGvertex_iport_iport|1134|0|1795|0|{0|in|}660|662|}
{2010006001|XXGobject_psameas_object|1135|0|1797|0|{metadata|in_metadata|1|0|}662|660|}
{2010006001|XXGobject_psameas_object|1136|0|1798|0|{Layout|InputLayout|1|0|}657|655|}
{2010006001|XXGobject_psameas_object|1137|0|1799|0|{key|Key|1|0|}657|655|}
{2010601001|XXGgraph_vertex_vertex|1138|0|1800|0|{Sort|}655|663|}
{2010212001|XXGvertex_oport_oport|1139|0|1802|0|{0|out|}663|664|}
{2010211001|XXGvertex_iport_iport|1140|0|1804|0|{0|in|}663|665|}
{2010214001|XXGiport_src_flow|1141|0|1806|0|{0|}665|656|}
{2010007001|XXGobject_proto_object|1142|0|1807|0|{}663|666|}
{2010212001|XXGvertex_oport_oport|1143|0|1809|0|{0|out|}666|667|}
{2010006001|XXGobject_psameas_object|1144|0|1811|0|{metadata|out_metadata|1|0|}667|666|}
{2010211001|XXGvertex_iport_iport|1145|0|1812|0|{0|in|}666|668|}
{2010006001|XXGobject_psameas_object|1146|0|1814|0|{metadata|in_metadata|1|0|}668|666|}
{2010006001|XXGobject_psameas_object|1147|0|1815|0|{Layout|OutputLayout|1|0|}663|655|}
{2010006001|XXGobject_psameas_object|1148|0|1816|0|{key|Key|1|0|}663|655|}
{2010006001|XXGobject_psameas_object|1149|0|1817|0|{max_core|Max_core|1|0|}663|655|}
{2010212001|XXGvertex_oport_oport|1150|0|1818|0|{0|out0|}655|669|}
{2010216002|XXGoport_binding_oport|1151|0|1820|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}669|664|}
{2010211001|XXGvertex_iport_iport|1152|0|1821|0|{0|in0|}655|670|}
{2010215002|XXGiport_binding_iport|1153|0|1823|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}670|659|}
{2010006001|XXGobject_psameas_object|1154|0|1824|0|{InputLayout|Layout|0|0|}645|380|}
{2010006001|XXGobject_psameas_object|1155|0|1825|0|{OutputLayout|Layout|0|0|}645|341|}
{2010601001|XXGgraph_vertex_vertex|1156|0|1826|0|{RCPDTP_Reduced_LKP_TPL|}1|671|}
{2010007001|XXGobject_proto_object|1157|0|1828|0|{}671|672|}
{2010601001|XXGgraph_vertex_vertex|1158|0|1830|0|{RCTC3P_Reduced_LKP_TPL|}1|673|}
{2010007001|XXGobject_proto_object|1159|0|1832|0|{}673|674|}
{2010601001|XXGgraph_vertex_vertex|1160|0|1834|0|{RFMT_Split_fields_and_partition_and_record_numbers|}1|49|}
{2010601001|XXGgraph_vertex_vertex|1161|0|1835|0|{Read_CLI_IDS_files_and_Remove_Duplicates|}1|675|}
{2010604001|XXGgraph_flow_flow|1162|0|1837|0|{Flow_1|}675|676|}
{2010604001|XXGgraph_flow_flow|1163|0|1839|0|{Flow_13|}675|677|}
{2010604001|XXGgraph_flow_flow|1164|0|1841|0|{Flow_2|}675|678|}
{2010604001|XXGgraph_flow_flow|1165|0|1843|0|{Flow_3|}675|101|}
{2010604001|XXGgraph_flow_flow|1166|0|1844|0|{Flow_4|}675|109|}
{2010604001|XXGgraph_flow_flow|1167|0|1845|0|{Flow_5|}675|120|}
{2010604001|XXGgraph_flow_flow|1168|0|1846|0|{Flow_6|}675|107|}
{2010601001|XXGgraph_vertex_vertex|1169|0|1847|0|{CRT_Get_File_Names|}675|123|}
{2010601001|XXGgraph_vertex_vertex|1170|0|1848|0|{Dedup_Sorted|}675|679|}
{2010212001|XXGvertex_oport_oport|1171|0|1850|0|{0|out|}679|680|}
{2010212001|XXGvertex_oport_oport|1172|0|1852|0|{1|dup|}679|681|}
{2010212001|XXGvertex_oport_oport|1173|0|1854|0|{2|reject|}679|682|}
{2010212001|XXGvertex_oport_oport|1174|0|1856|0|{3|error|}679|683|}
{2010212001|XXGvertex_oport_oport|1175|0|1858|0|{4|log|}679|684|}
{2010211001|XXGvertex_iport_iport|1176|0|1860|0|{0|in|}679|685|}
{2010214001|XXGiport_src_flow|1177|0|1862|0|{0|}685|676|}
{2010007001|XXGobject_proto_object|1178|0|1863|0|{}679|686|}
{2010212001|XXGvertex_oport_oport|1179|0|1865|0|{0|out|}686|687|}
{2010006001|XXGobject_psameas_object|1180|0|1867|0|{metadata|out_metadata|1|0|}687|686|}
{2010212001|XXGvertex_oport_oport|1181|0|1868|0|{1|dup|}686|688|}
{2010006001|XXGobject_psameas_object|1182|0|1870|0|{metadata|dup_metadata|1|0|}688|686|}
{2010212001|XXGvertex_oport_oport|1183|0|1871|0|{2|reject|}686|689|}
{2010006001|XXGobject_psameas_object|1184|0|1873|0|{metadata|reject_metadata|1|0|}689|686|}
{2010212001|XXGvertex_oport_oport|1185|0|1874|0|{3|error|}686|690|}
{2010006001|XXGobject_psameas_object|1186|0|1876|0|{metadata|error_metadata|1|0|}690|686|}
{2010212001|XXGvertex_oport_oport|1187|0|1877|0|{4|log|}686|691|}
{2010006001|XXGobject_psameas_object|1188|0|1879|0|{metadata|log_metadata|1|0|}691|686|}
{2010211001|XXGvertex_iport_iport|1189|0|1880|0|{0|in|}686|692|}
{2010006001|XXGobject_psameas_object|1190|0|1882|0|{metadata|in_metadata|1|0|}692|686|}
{2010006001|XXGobject_psameas_object|1191|0|1883|0|{Layout|Layout|0|0|}679|693|}
{2010211001|XXGvertex_iport_iport|1192|0|1885|0|{0|write|}693|694|}
{2010214001|XXGiport_src_flow|1193|0|1887|0|{0|}694|17|}
{2010007001|XXGobject_proto_object|1194|0|1888|0|{}693|695|}
{2010211001|XXGvertex_iport_iport|1195|0|1890|0|{0|write|}695|696|}
{2010006001|XXGobject_psameas_object|1196|0|1892|0|{metadata|write_metadata|1|0|}696|695|}
{2010006001|XXGobject_psameas_object|1197|0|1893|0|{write_metadata|out_metadata|0|0|}693|99|}
{2010006001|XXGobject_psameas_object|1198|0|1894|0|{dup_metadata|out_metadata|0|0|}679|99|}
{2010006001|XXGobject_psameas_object|1199|0|1895|0|{in_metadata|out_metadata|0|0|}679|99|}
{2010006001|XXGobject_psameas_object|1200|0|1896|0|{out_metadata|out_metadata|0|0|}679|99|}
{2010006001|XXGobject_psameas_object|1201|0|1897|0|{reject_metadata|out_metadata|0|0|}679|99|}
{2010601001|XXGgraph_vertex_vertex|1202|0|1898|0|{Get_Job_Log|}675|697|}
{2010211001|XXGvertex_iport_iport|1203|0|1900|0|{0|write|}697|698|}
{2010214001|XXGiport_src_flow|1204|0|1902|0|{0|}698|677|}
{2010007001|XXGobject_proto_object|1205|0|1903|0|{}697|699|}
{2010211001|XXGvertex_iport_iport|1206|0|1905|0|{0|write|}699|700|}
{2010006001|XXGobject_psameas_object|1207|0|1907|0|{metadata|write_metadata|1|0|}700|699|}
{2010601001|XXGgraph_vertex_vertex|1208|0|1908|0|{Read_Multiple_Files|}675|99|}
{2010601001|XXGgraph_vertex_vertex|1209|0|1909|0|{Rollup_Job_Info|}675|701|}
{2010212001|XXGvertex_oport_oport|1210|0|1911|0|{0|out|}701|702|}
{2010213001|XXGoport_dst_flow|1211|0|1913|0|{0|}702|677|}
{2010212001|XXGvertex_oport_oport|1212|0|1914|0|{1|reject|}701|703|}
{2010212001|XXGvertex_oport_oport|1213|0|1916|0|{2|error|}701|704|}
{2010212001|XXGvertex_oport_oport|1214|0|1918|0|{3|log|}701|705|}
{2010211001|XXGvertex_iport_iport|1215|0|1920|0|{0|in|}701|706|}
{2010214001|XXGiport_src_flow|1216|0|1922|0|{0|}706|107|}
{2010007001|XXGobject_proto_object|1217|0|1923|0|{}701|707|}
{2010212001|XXGvertex_oport_oport|1218|0|1925|0|{0|out|}707|708|}
{2010006001|XXGobject_psameas_object|1219|0|1927|0|{metadata|out_metadata|1|0|}708|707|}
{2010212001|XXGvertex_oport_oport|1220|0|1928|0|{1|reject|}707|709|}
{2010006001|XXGobject_psameas_object|1221|0|1930|0|{metadata|reject_metadata|1|0|}709|707|}
{2010212001|XXGvertex_oport_oport|1222|0|1931|0|{2|error|}707|710|}
{2010006001|XXGobject_psameas_object|1223|0|1933|0|{metadata|error_metadata|1|0|}710|707|}
{2010212001|XXGvertex_oport_oport|1224|0|1934|0|{3|log|}707|711|}
{2010006001|XXGobject_psameas_object|1225|0|1936|0|{metadata|log_metadata|1|0|}711|707|}
{2010211001|XXGvertex_iport_iport|1226|0|1937|0|{0|in|}707|712|}
{2010006001|XXGobject_psameas_object|1227|0|1939|0|{metadata|in_metadata|1|0|}712|707|}
{2010006001|XXGobject_psameas_object|1228|0|1940|0|{in_metadata|log_metadata|0|0|}701|99|}
{2010006001|XXGobject_psameas_object|1229|0|1941|0|{out_metadata|write_metadata|0|0|}701|697|}
{2010006001|XXGobject_psameas_object|1230|0|1942|0|{reject_metadata|log_metadata|0|0|}701|99|}
{2010601001|XXGgraph_vertex_vertex|1231|0|1943|0|{Sort|}675|713|}
{2010212001|XXGvertex_oport_oport|1232|0|1945|0|{0|out|}713|714|}
{2010213001|XXGoport_dst_flow|1233|0|1947|0|{0|}714|676|}
{2010211001|XXGvertex_iport_iport|1234|0|1948|0|{0|in|}713|715|}
{2010214001|XXGiport_src_flow|1235|0|1950|0|{0|}715|678|}
{2010007001|XXGobject_proto_object|1236|0|1951|0|{}713|716|}
{2010212001|XXGvertex_oport_oport|1237|0|1953|0|{0|out|}716|717|}
{2010006001|XXGobject_psameas_object|1238|0|1955|0|{metadata|out_metadata|1|0|}717|716|}
{2010211001|XXGvertex_iport_iport|1239|0|1956|0|{0|in|}716|718|}
{2010006001|XXGobject_psameas_object|1240|0|1958|0|{metadata|in_metadata|1|0|}718|716|}
{2010006001|XXGobject_psameas_object|1241|0|1959|0|{Layout|Layout|0|0|}713|693|}
{2010006001|XXGobject_psameas_object|1242|0|1960|0|{in_metadata|out_metadata|0|0|}713|99|}
{2010006001|XXGobject_psameas_object|1243|0|1961|0|{out_metadata|out_metadata|0|0|}713|99|}
{2010601001|XXGgraph_vertex_vertex|1244|0|1962|0|{Supress_NullCarriers|}675|719|}
{2010212001|XXGvertex_oport_oport|1245|0|1964|0|{0|out|}719|720|}
{2010213001|XXGoport_dst_flow|1246|0|1966|0|{0|}720|678|}
{2010212001|XXGvertex_oport_oport|1247|0|1967|0|{1|deselect|}719|721|}
{2010213001|XXGoport_dst_flow|1248|0|1969|0|{0|}721|120|}
{2010212001|XXGvertex_oport_oport|1249|0|1970|0|{2|reject|}719|722|}
{2010212001|XXGvertex_oport_oport|1250|0|1972|0|{3|error|}719|723|}
{2010212001|XXGvertex_oport_oport|1251|0|1974|0|{4|log|}719|724|}
{2010211001|XXGvertex_iport_iport|1252|0|1976|0|{0|in|}719|725|}
{2010214001|XXGiport_src_flow|1253|0|1978|0|{0|}725|101|}
{2010007001|XXGobject_proto_object|1254|0|1979|0|{}719|726|}
{2010212001|XXGvertex_oport_oport|1255|0|1981|0|{0|out|}726|727|}
{2010006001|XXGobject_psameas_object|1256|0|1983|0|{metadata|out_metadata|1|0|}727|726|}
{2010212001|XXGvertex_oport_oport|1257|0|1984|0|{1|deselect|}726|728|}
{2010006001|XXGobject_psameas_object|1258|0|1986|0|{metadata|deselect_metadata|1|0|}728|726|}
{2010212001|XXGvertex_oport_oport|1259|0|1987|0|{2|reject|}726|729|}
{2010006001|XXGobject_psameas_object|1260|0|1989|0|{metadata|reject_metadata|1|0|}729|726|}
{2010212001|XXGvertex_oport_oport|1261|0|1990|0|{3|error|}726|730|}
{2010006001|XXGobject_psameas_object|1262|0|1992|0|{metadata|error_metadata|1|0|}730|726|}
{2010212001|XXGvertex_oport_oport|1263|0|1993|0|{4|log|}726|731|}
{2010006001|XXGobject_psameas_object|1264|0|1995|0|{metadata|log_metadata|1|0|}731|726|}
{2010211001|XXGvertex_iport_iport|1265|0|1996|0|{0|in|}726|732|}
{2010006001|XXGobject_psameas_object|1266|0|1998|0|{metadata|in_metadata|1|0|}732|726|}
{2010006001|XXGobject_psameas_object|1267|0|1999|0|{Layout|Layout|0|0|}719|118|}
{2010006001|XXGobject_psameas_object|1268|0|2000|0|{deselect_metadata|out_metadata|0|0|}719|99|}
{2010006001|XXGobject_psameas_object|1269|0|2001|0|{in_metadata|out_metadata|0|0|}719|99|}
{2010006001|XXGobject_psameas_object|1270|0|2002|0|{out_metadata|out_metadata|0|0|}719|99|}
{2010006001|XXGobject_psameas_object|1271|0|2003|0|{reject_metadata|out_metadata|0|0|}719|99|}
{2010601001|XXGgraph_vertex_vertex|1272|0|2004|0|{Supress_Null_Carriers|}675|118|}
{2010601001|XXGgraph_vertex_vertex|1273|0|2005|0|{Supress_Updates_View_Data|}675|733|}
{2010211001|XXGvertex_iport_iport|1274|0|2007|0|{0|write|}733|734|}
{2010007001|XXGobject_proto_object|1275|0|2009|0|{}733|735|}
{2010211001|XXGvertex_iport_iport|1276|0|2011|0|{0|write|}735|736|}
{2010006001|XXGobject_psameas_object|1277|0|2013|0|{metadata|write_metadata|1|0|}736|735|}
{2010212001|XXGvertex_oport_oport|1278|0|2014|0|{0|out0|}675|737|}
{2010216002|XXGoport_binding_oport|1279|0|2016|0|{.5|.5|{0|}17244|}737|680|}
{2010213001|XXGoport_dst_flow|1280|0|2017|0|{0|}737|9|}
{2010601001|XXGgraph_vertex_vertex|1281|0|2018|0|{Realign_from_CLI_format_to_f_clm_txn_new_format|}1|87|}
{2010601001|XXGgraph_vertex_vertex|1282|0|2019|0|{Replicate|}1|738|}
{2010212001|XXGvertex_oport_oport|1283|0|2021|0|{0|out|}738|739|}
{2010213001|XXGoport_dst_flow|1284|0|2023|0|{0|}739|16|}
{2010213001|XXGoport_dst_flow|1285|0|2024|0|{1|}739|25|}
{2010213001|XXGoport_dst_flow|1286|0|2025|0|{2|}739|19|}
{2010211001|XXGvertex_iport_iport|1287|0|2026|0|{0|in|}738|740|}
{2010214001|XXGiport_src_flow|1288|0|2028|0|{0|}740|24|}
{2010007001|XXGobject_proto_object|1289|0|2029|0|{}738|741|}
{2010212001|XXGvertex_oport_oport|1290|0|2031|0|{0|out|}741|742|}
{2010006001|XXGobject_psameas_object|1291|0|2033|0|{metadata|out_metadata|1|0|}742|741|}
{2010211001|XXGvertex_iport_iport|1292|0|2034|0|{0|in|}741|743|}
{2010006001|XXGobject_psameas_object|1293|0|2036|0|{metadata|in_metadata|1|0|}743|741|}
{2010006001|XXGobject_psameas_object|1294|0|2037|0|{Layout|Layout|0|0|}738|341|}
{2010006001|XXGobject_psameas_object|1295|0|2038|0|{in_metadata|in_metadata|0|0|}738|345|}
{2010006001|XXGobject_psameas_object|1296|0|2039|0|{out_metadata|in_metadata|0|0|}738|345|}
{2010601001|XXGgraph_vertex_vertex|1297|0|2040|0|{Replicate_1|}1|744|}
{2010212001|XXGvertex_oport_oport|1298|0|2042|0|{0|out|}744|745|}
{2010213001|XXGoport_dst_flow|1299|0|2044|0|{0|}745|26|}
{2010213001|XXGoport_dst_flow|1300|0|2045|0|{1|}745|21|}
{2010213001|XXGoport_dst_flow|1301|0|2046|0|{2|}745|22|}
{2010213001|XXGoport_dst_flow|1302|0|2047|0|{3|}745|37|}
{2010211001|XXGvertex_iport_iport|1303|0|2048|0|{0|in|}744|746|}
{2010214001|XXGiport_src_flow|1304|0|2050|0|{0|}746|23|}
{2010007001|XXGobject_proto_object|1305|0|2051|0|{}744|747|}
{2010212001|XXGvertex_oport_oport|1306|0|2053|0|{0|out|}747|748|}
{2010006001|XXGobject_psameas_object|1307|0|2055|0|{metadata|out_metadata|1|0|}748|747|}
{2010211001|XXGvertex_iport_iport|1308|0|2056|0|{0|in|}747|749|}
{2010006001|XXGobject_psameas_object|1309|0|2058|0|{metadata|in_metadata|1|0|}749|747|}
{2010006001|XXGobject_psameas_object|1310|0|2059|0|{Layout|Layout|0|0|}744|83|}
{2010006001|XXGobject_psameas_object|1311|0|2060|0|{in_metadata|out0_metadata|0|0|}744|71|}
{2010006001|XXGobject_psameas_object|1312|0|2061|0|{out_metadata|out0_metadata|0|0|}744|71|}
{2010601001|XXGgraph_vertex_vertex|1313|0|2062|0|{Replicate_2|}1|750|}
{2010212001|XXGvertex_oport_oport|1314|0|2064|0|{0|out|}750|751|}
{2010213001|XXGoport_dst_flow|1315|0|2066|0|{0|}751|42|}
{2010213001|XXGoport_dst_flow|1316|0|2067|0|{1|}751|43|}
{2010211001|XXGvertex_iport_iport|1317|0|2068|0|{0|in|}750|752|}
{2010214001|XXGiport_src_flow|1318|0|2070|0|{0|}752|20|}
{2010007001|XXGobject_proto_object|1319|0|2071|0|{}750|753|}
{2010212001|XXGvertex_oport_oport|1320|0|2073|0|{0|out|}753|754|}
{2010006001|XXGobject_psameas_object|1321|0|2075|0|{metadata|out_metadata|1|0|}754|753|}
{2010211001|XXGvertex_iport_iport|1322|0|2076|0|{0|in|}753|755|}
{2010006001|XXGobject_psameas_object|1323|0|2078|0|{metadata|in_metadata|1|0|}755|753|}
{2010006001|XXGobject_psameas_object|1324|0|2079|0|{Layout|Layout|0|0|}750|398|}
{2010006001|XXGobject_psameas_object|1325|0|2080|0|{in_metadata|out1_metadata|0|0|}750|49|}
{2010006001|XXGobject_psameas_object|1326|0|2081|0|{out_metadata|out1_metadata|0|0|}750|49|}
{2010601001|XXGgraph_vertex_vertex|1327|0|2082|0|{Replicate_3|}1|756|}
{2010212001|XXGvertex_oport_oport|1328|0|2084|0|{0|out|}756|757|}
{2010213001|XXGoport_dst_flow|1329|0|2086|0|{0|}757|44|}
{2010213001|XXGoport_dst_flow|1330|0|2087|0|{1|}757|11|}
{2010211001|XXGvertex_iport_iport|1331|0|2088|0|{0|in|}756|758|}
{2010214001|XXGiport_src_flow|1332|0|2090|0|{0|}758|10|}
{2010007001|XXGobject_proto_object|1333|0|2091|0|{}756|759|}
{2010212001|XXGvertex_oport_oport|1334|0|2093|0|{0|out|}759|760|}
{2010006001|XXGobject_psameas_object|1335|0|2095|0|{metadata|out_metadata|1|0|}760|759|}
{2010211001|XXGvertex_iport_iport|1336|0|2096|0|{0|in|}759|761|}
{2010006001|XXGobject_psameas_object|1337|0|2098|0|{metadata|in_metadata|1|0|}761|759|}
{2010006001|XXGobject_psameas_object|1338|0|2099|0|{Layout|Layout|0|0|}756|402|}
{2010006001|XXGobject_psameas_object|1339|0|2100|0|{in_metadata|out1_metadata|0|0|}756|49|}
{2010006001|XXGobject_psameas_object|1340|0|2101|0|{out_metadata|out1_metadata|0|0|}756|49|}
{2010601001|XXGgraph_vertex_vertex|1341|0|2102|0|{Replicate_4|}1|762|}
{2010212001|XXGvertex_oport_oport|1342|0|2104|0|{0|out|}762|763|}
{2010213001|XXGoport_dst_flow|1343|0|2106|0|{0|}763|27|}
{2010213001|XXGoport_dst_flow|1344|0|2107|0|{1|}763|41|}
{2010211001|XXGvertex_iport_iport|1345|0|2108|0|{0|in|}762|764|}
{2010214001|XXGiport_src_flow|1346|0|2110|0|{0|}764|33|}
{2010007001|XXGobject_proto_object|1347|0|2111|0|{}762|765|}
{2010212001|XXGvertex_oport_oport|1348|0|2113|0|{0|out|}765|766|}
{2010006001|XXGobject_psameas_object|1349|0|2115|0|{metadata|out_metadata|1|0|}766|765|}
{2010211001|XXGvertex_iport_iport|1350|0|2116|0|{0|in|}765|767|}
{2010006001|XXGobject_psameas_object|1351|0|2118|0|{metadata|in_metadata|1|0|}767|765|}
{2010006001|XXGobject_psameas_object|1352|0|2119|0|{Layout|Layout|0|0|}762|45|}
{2010006001|XXGobject_psameas_object|1353|0|2120|0|{in_metadata|out1_metadata|0|0|}762|49|}
{2010006001|XXGobject_psameas_object|1354|0|2121|0|{out_metadata|out1_metadata|0|0|}762|49|}
{2010601001|XXGgraph_vertex_vertex|1355|0|2122|0|{Replicate_5|}1|768|}
{2010212001|XXGvertex_oport_oport|1356|0|2124|0|{0|out|}768|769|}
{2010213001|XXGoport_dst_flow|1357|0|2126|0|{0|}769|13|}
{2010213001|XXGoport_dst_flow|1358|0|2127|0|{1|}769|12|}
{2010211001|XXGvertex_iport_iport|1359|0|2128|0|{0|in|}768|770|}
{2010214001|XXGiport_src_flow|1360|0|2130|0|{0|}770|15|}
{2010007001|XXGobject_proto_object|1361|0|2131|0|{}768|771|}
{2010212001|XXGvertex_oport_oport|1362|0|2133|0|{0|out|}771|772|}
{2010006001|XXGobject_psameas_object|1363|0|2135|0|{metadata|out_metadata|1|0|}772|771|}
{2010211001|XXGvertex_iport_iport|1364|0|2136|0|{0|in|}771|773|}
{2010006001|XXGobject_psameas_object|1365|0|2138|0|{metadata|in_metadata|1|0|}773|771|}
{2010006001|XXGobject_psameas_object|1366|0|2139|0|{Layout|Layout|0|0|}768|406|}
{2010006001|XXGobject_psameas_object|1367|0|2140|0|{in_metadata|out1_metadata|0|0|}768|49|}
{2010006001|XXGobject_psameas_object|1368|0|2141|0|{out_metadata|out1_metadata|0|0|}768|49|}
{2010601001|XXGgraph_vertex_vertex|1369|0|2142|0|{Replicate_6|}1|774|}
{2010212001|XXGvertex_oport_oport|1370|0|2144|0|{0|out|}774|775|}
{2010213001|XXGoport_dst_flow|1371|0|2146|0|{0|}775|30|}
{2010213001|XXGoport_dst_flow|1372|0|2147|0|{1|}775|29|}
{2010211001|XXGvertex_iport_iport|1373|0|2148|0|{0|in|}774|776|}
{2010214001|XXGiport_src_flow|1374|0|2150|0|{0|}776|28|}
{2010007001|XXGobject_proto_object|1375|0|2151|0|{}774|777|}
{2010212001|XXGvertex_oport_oport|1376|0|2153|0|{0|out|}777|778|}
{2010006001|XXGobject_psameas_object|1377|0|2155|0|{metadata|out_metadata|1|0|}778|777|}
{2010211001|XXGvertex_iport_iport|1378|0|2156|0|{0|in|}777|779|}
{2010006001|XXGobject_psameas_object|1379|0|2158|0|{metadata|in_metadata|1|0|}779|777|}
{2010006001|XXGobject_psameas_object|1380|0|2159|0|{Layout|Layout|0|0|}774|67|}
{2010006001|XXGobject_psameas_object|1381|0|2160|0|{in_metadata|out0_metadata|0|0|}774|49|}
{2010006001|XXGobject_psameas_object|1382|0|2161|0|{out_metadata|out0_metadata|0|0|}774|49|}
{2010601001|XXGgraph_vertex_vertex|1383|0|2162|0|{Replicate_7|}1|780|}
{2010212001|XXGvertex_oport_oport|1384|0|2164|0|{0|out|}780|781|}
{2010213001|XXGoport_dst_flow|1385|0|2166|0|{0|}781|34|}
{2010213001|XXGoport_dst_flow|1386|0|2167|0|{1|}781|32|}
{2010211001|XXGvertex_iport_iport|1387|0|2168|0|{0|in|}780|782|}
{2010214001|XXGiport_src_flow|1388|0|2170|0|{0|}782|31|}
{2010007001|XXGobject_proto_object|1389|0|2171|0|{}780|783|}
{2010212001|XXGvertex_oport_oport|1390|0|2173|0|{0|out|}783|784|}
{2010006001|XXGobject_psameas_object|1391|0|2175|0|{metadata|out_metadata|1|0|}784|783|}
{2010211001|XXGvertex_iport_iport|1392|0|2176|0|{0|in|}783|785|}
{2010006001|XXGobject_psameas_object|1393|0|2178|0|{metadata|in_metadata|1|0|}785|783|}
{2010006001|XXGobject_psameas_object|1394|0|2179|0|{Layout|Layout|0|0|}780|380|}
{2010006001|XXGobject_psameas_object|1395|0|2180|0|{in_metadata|out1_metadata|0|0|}780|49|}
{2010006001|XXGobject_psameas_object|1396|0|2181|0|{out_metadata|out1_metadata|0|0|}780|49|}
{2010601001|XXGgraph_vertex_vertex|1397|0|2182|0|{Replicate_8|}1|786|}
{2010212001|XXGvertex_oport_oport|1398|0|2184|0|{0|out|}786|787|}
{2010213001|XXGoport_dst_flow|1399|0|2186|0|{0|}787|17|}
{2010213001|XXGoport_dst_flow|1400|0|2187|0|{1|}787|38|}
{2010211001|XXGvertex_iport_iport|1401|0|2188|0|{0|in|}786|788|}
{2010214001|XXGiport_src_flow|1402|0|2190|0|{0|}788|9|}
{2010007001|XXGobject_proto_object|1403|0|2191|0|{}786|789|}
{2010212001|XXGvertex_oport_oport|1404|0|2193|0|{0|out|}789|790|}
{2010006001|XXGobject_psameas_object|1405|0|2195|0|{metadata|out_metadata|1|0|}790|789|}
{2010211001|XXGvertex_iport_iport|1406|0|2196|0|{0|in|}789|791|}
{2010006001|XXGobject_psameas_object|1407|0|2198|0|{metadata|in_metadata|1|0|}791|789|}
{2010006001|XXGobject_psameas_object|1408|0|2199|0|{Layout|Layout|0|0|}786|693|}
{2010006001|XXGobject_psameas_object|1409|0|2200|0|{in_metadata|out_metadata|0|0|}786|99|}
{2010006001|XXGobject_psameas_object|1410|0|2201|0|{out_metadata|out_metadata|0|0|}786|99|}
{2010601001|XXGgraph_vertex_vertex|1411|0|2202|0|{SORT_record_nbr_|}1|792|}
{2010212001|XXGvertex_oport_oport|1412|0|2204|0|{0|out|}792|793|}
{2010213001|XXGoport_dst_flow|1413|0|2206|0|{0|}793|36|}
{2010211001|XXGvertex_iport_iport|1414|0|2207|0|{0|in|}792|794|}
{2010214001|XXGiport_src_flow|1415|0|2209|0|{0|}794|35|}
{2010007001|XXGobject_proto_object|1416|0|2210|0|{}792|795|}
{2010212001|XXGvertex_oport_oport|1417|0|2212|0|{0|out|}795|796|}
{2010006001|XXGobject_psameas_object|1418|0|2214|0|{metadata|out_metadata|1|0|}796|795|}
{2010211001|XXGvertex_iport_iport|1419|0|2215|0|{0|in|}795|797|}
{2010006001|XXGobject_psameas_object|1420|0|2217|0|{metadata|in_metadata|1|0|}797|795|}
{2010006001|XXGobject_psameas_object|1421|0|2218|0|{Layout|Layout|0|0|}792|341|}
{2010006001|XXGobject_psameas_object|1422|0|2219|0|{in_metadata|out1_metadata|0|0|}792|49|}
{2010006001|XXGobject_psameas_object|1423|0|2220|0|{out_metadata|out1_metadata|0|0|}792|49|}
{2010601001|XXGgraph_vertex_vertex|1424|0|2221|0|{SPLIT_LKP_TPL|}1|798|}
{2010007001|XXGobject_proto_object|1425|0|2223|0|{}798|799|}
{2010601001|XXGgraph_vertex_vertex|1426|0|2225|0|{Unique_IDS_records|}1|693|}
{2010601001|XXGgraph_vertex_vertex|1427|0|2226|0|{Unload_and_assign_from_Reduced_IDS|}1|800|}
{2010212001|XXGvertex_oport_oport|1428|0|2228|0|{0|out0|}800|801|}
{2010213001|XXGoport_dst_flow|1429|0|2230|0|{0|}801|18|}
{2010212001|XXGvertex_oport_oport|1430|0|2231|0|{1|reject0|}800|802|}
{2010212001|XXGvertex_oport_oport|1431|0|2233|0|{2|error0|}800|803|}
{2010212001|XXGvertex_oport_oport|1432|0|2235|0|{3|log|}800|804|}
{2010211001|XXGvertex_iport_iport|1433|0|2237|0|{0|in|}800|805|}
{2010214001|XXGiport_src_flow|1434|0|2239|0|{0|}805|14|}
{2010007001|XXGobject_proto_object|1435|0|2240|0|{}800|806|}
{2010212001|XXGvertex_oport_oport|1436|0|2242|0|{0|out0|}806|807|}
{2010006001|XXGobject_psameas_object|1437|0|2244|0|{metadata|out0_metadata|1|0|}807|806|}
{2010006001|XXGobject_psameas_object|1438|0|2245|0|{transform0|transform0|1|0|}807|806|}
{2010212001|XXGvertex_oport_oport|1439|0|2246|0|{1|reject0|}806|808|}
{2010006001|XXGobject_psameas_object|1440|0|2248|0|{metadata|reject0_metadata|1|0|}808|806|}
{2010212001|XXGvertex_oport_oport|1441|0|2249|0|{2|error0|}806|809|}
{2010006001|XXGobject_psameas_object|1442|0|2251|0|{metadata|error0_metadata|1|0|}809|806|}
{2010212001|XXGvertex_oport_oport|1443|0|2252|0|{3|log|}806|810|}
{2010006001|XXGobject_psameas_object|1444|0|2254|0|{metadata|log_metadata|1|0|}810|806|}
{2010211001|XXGvertex_iport_iport|1445|0|2255|0|{0|in|}806|811|}
{2010006001|XXGobject_psameas_object|1446|0|2257|0|{metadata|in_metadata|1|0|}811|806|}
{2010006001|XXGobject_psameas_object|1447|0|2258|0|{Layout|Layout|0|0|}800|341|}
{2010006001|XXGobject_psameas_object|1448|0|2259|0|{in_metadata|out1_metadata|0|0|}800|49|}
{2010006001|XXGobject_psameas_object|1449|0|2260|0|{out0_metadata|out1_metadata|0|0|}800|49|}
{2010006001|XXGobject_psameas_object|1450|0|2261|0|{reject0_metadata|out1_metadata|0|0|}800|49|}
{2010601001|XXGgraph_vertex_vertex|1451|0|2262|0|{Unload_and_assign_from_SPLIT_IDS|}1|71|}
{2010601001|XXGgraph_vertex_vertex|1452|0|2263|0|{Write_Datastore_Files|}1|812|}
{2010604001|XXGgraph_flow_flow|1453|0|2265|0|{Flow_1|}812|813|}
{2010604001|XXGgraph_flow_flow|1454|0|2267|0|{Flow_2|}812|814|}
{2010604001|XXGgraph_flow_flow|1455|0|2269|0|{Flow_3|}812|815|}
{2010601001|XXGgraph_vertex_vertex|1456|0|2271|0|{Replicate|}812|816|}
{2010212001|XXGvertex_oport_oport|1457|0|2273|0|{0|out|}816|817|}
{2010213001|XXGoport_dst_flow|1458|0|2275|0|{0|}817|814|}
{2010213001|XXGoport_dst_flow|1459|0|2276|0|{1|}817|813|}
{2010211001|XXGvertex_iport_iport|1460|0|2277|0|{0|in|}816|818|}
{2010007001|XXGobject_proto_object|1461|0|2279|0|{}816|819|}
{2010212001|XXGvertex_oport_oport|1462|0|2281|0|{0|out|}819|820|}
{2010006001|XXGobject_psameas_object|1463|0|2283|0|{metadata|out_metadata|1|0|}820|819|}
{2010211001|XXGvertex_iport_iport|1464|0|2284|0|{0|in|}819|821|}
{2010006001|XXGobject_psameas_object|1465|0|2286|0|{metadata|in_metadata|1|0|}821|819|}
{2010006001|XXGobject_psameas_object|1466|0|2287|0|{Layout|Layout|0|0|}816|360|}
{2010006001|XXGobject_psameas_object|1467|0|2288|0|{in_metadata|in_metadata|0|0|}816|345|}
{2010006001|XXGobject_psameas_object|1468|0|2289|0|{out_metadata|in_metadata|0|0|}816|345|}
{2010601001|XXGgraph_vertex_vertex|1469|0|2290|0|{Select_New_NK_s_to_append_to_XREF_file|}812|822|}
{2010212001|XXGvertex_oport_oport|1470|0|2292|0|{0|out|}822|823|}
{2010213001|XXGoport_dst_flow|1471|0|2294|0|{0|}823|815|}
{2010212001|XXGvertex_oport_oport|1472|0|2295|0|{1|deselect|}822|824|}
{2010212001|XXGvertex_oport_oport|1473|0|2297|0|{2|reject|}822|825|}
{2010212001|XXGvertex_oport_oport|1474|0|2299|0|{3|error|}822|826|}
{2010212001|XXGvertex_oport_oport|1475|0|2301|0|{4|log|}822|827|}
{2010211001|XXGvertex_iport_iport|1476|0|2303|0|{0|in|}822|828|}
{2010214001|XXGiport_src_flow|1477|0|2305|0|{0|}828|814|}
{2010007001|XXGobject_proto_object|1478|0|2306|0|{}822|829|}
{2010212001|XXGvertex_oport_oport|1479|0|2308|0|{0|out|}829|830|}
{2010006001|XXGobject_psameas_object|1480|0|2310|0|{metadata|out_metadata|1|0|}830|829|}
{2010212001|XXGvertex_oport_oport|1481|0|2311|0|{1|deselect|}829|831|}
{2010006001|XXGobject_psameas_object|1482|0|2313|0|{metadata|deselect_metadata|1|0|}831|829|}
{2010212001|XXGvertex_oport_oport|1483|0|2314|0|{2|reject|}829|832|}
{2010006001|XXGobject_psameas_object|1484|0|2316|0|{metadata|reject_metadata|1|0|}832|829|}
{2010212001|XXGvertex_oport_oport|1485|0|2317|0|{3|error|}829|833|}
{2010006001|XXGobject_psameas_object|1486|0|2319|0|{metadata|error_metadata|1|0|}833|829|}
{2010212001|XXGvertex_oport_oport|1487|0|2320|0|{4|log|}829|834|}
{2010006001|XXGobject_psameas_object|1488|0|2322|0|{metadata|log_metadata|1|0|}834|829|}
{2010211001|XXGvertex_iport_iport|1489|0|2323|0|{0|in|}829|835|}
{2010006001|XXGobject_psameas_object|1490|0|2325|0|{metadata|in_metadata|1|0|}835|829|}
{2010006001|XXGobject_psameas_object|1491|0|2326|0|{Layout|Layout|0|0|}822|360|}
{2010006001|XXGobject_psameas_object|1492|0|2327|0|{deselect_metadata|in_metadata|0|0|}822|345|}
{2010006001|XXGobject_psameas_object|1493|0|2328|0|{in_metadata|in_metadata|0|0|}822|345|}
{2010006001|XXGobject_psameas_object|1494|0|2329|0|{out_metadata|in_metadata|0|0|}822|345|}
{2010006001|XXGobject_psameas_object|1495|0|2330|0|{reject_metadata|in_metadata|0|0|}822|345|}
{2010601001|XXGgraph_vertex_vertex|1496|0|2331|0|{Write_Multi_ICFF|}812|836|}
{2010605001|XXGgraph_legend_legend|1497|0|2333|0|{0|}836|837|}
{2010241001|XXGlegend_face_face|1498|0|2335|0|{}837|838|}
{2010604001|XXGgraph_flow_flow|1499|0|2337|0|{Flow_1|}836|347|}
{2010604001|XXGgraph_flow_flow|1500|0|2338|0|{Flow_8|}836|839|}
{2010601001|XXGgraph_vertex_vertex|1501|0|2340|0|{Compute_Multiple_Block_Compressed_Lookups|}836|345|}
{2010601001|XXGgraph_vertex_vertex|1502|0|2341|0|{Replicate|}836|840|}
{2010212001|XXGvertex_oport_oport|1503|0|2343|0|{0|out|}840|841|}
{2010213001|XXGoport_dst_flow|1504|0|2345|0|{0|}841|839|}
{2010211001|XXGvertex_iport_iport|1505|0|2346|0|{0|in|}840|842|}
{2010214001|XXGiport_src_flow|1506|0|2348|0|{0|}842|347|}
{2010007001|XXGobject_proto_object|1507|0|2349|0|{}840|843|}
{2010212001|XXGvertex_oport_oport|1508|0|2351|0|{0|out|}843|844|}
{2010006001|XXGobject_psameas_object|1509|0|2353|0|{metadata|out_metadata|1|0|}844|843|}
{2010211001|XXGvertex_iport_iport|1510|0|2354|0|{0|in|}843|845|}
{2010006001|XXGobject_psameas_object|1511|0|2356|0|{metadata|in_metadata|1|0|}845|843|}
{2010006001|XXGobject_psameas_object|1512|0|2357|0|{Layout|Layout|0|0|}840|360|}
{2010006001|XXGobject_psameas_object|1513|0|2358|0|{in_metadata|out_metadata|0|0|}840|345|}
{2010006001|XXGobject_psameas_object|1514|0|2359|0|{out_metadata|out_metadata|0|0|}840|345|}
{2010601001|XXGgraph_vertex_vertex|1515|0|2360|0|{WMF|}836|846|}
{2010212001|XXGvertex_oport_oport|1516|0|2362|0|{0|reject|}846|847|}
{2010212001|XXGvertex_oport_oport|1517|0|2364|0|{1|error|}846|848|}
{2010212001|XXGvertex_oport_oport|1518|0|2366|0|{2|log|}846|849|}
{2010211001|XXGvertex_iport_iport|1519|0|2368|0|{0|in|}846|850|}
{2010214001|XXGiport_src_flow|1520|0|2370|0|{0|}850|839|}
{2010007001|XXGobject_proto_object|1521|0|2371|0|{}846|851|}
{2010212001|XXGvertex_oport_oport|1522|0|2373|0|{0|reject|}851|852|}
{2010006001|XXGobject_psameas_object|1523|0|2375|0|{metadata|reject_metadata|1|0|}852|851|}
{2010212001|XXGvertex_oport_oport|1524|0|2376|0|{1|error|}851|853|}
{2010006001|XXGobject_psameas_object|1525|0|2378|0|{metadata|error_metadata|1|0|}853|851|}
{2010212001|XXGvertex_oport_oport|1526|0|2379|0|{2|log|}851|854|}
{2010006001|XXGobject_psameas_object|1527|0|2381|0|{metadata|log_metadata|1|0|}854|851|}
{2010211001|XXGvertex_iport_iport|1528|0|2382|0|{0|in|}851|855|}
{2010006001|XXGobject_psameas_object|1529|0|2384|0|{metadata|in_metadata|1|0|}855|851|}
{2010006001|XXGobject_psameas_object|1530|0|2385|0|{Layout|Layout|0|0|}846|360|}
{2010006001|XXGobject_psameas_object|1531|0|2386|0|{in_metadata|out_metadata|0|0|}846|345|}
{2010006001|XXGobject_psameas_object|1532|0|2387|0|{reject_metadata|out_metadata|0|0|}846|345|}
{2010211001|XXGvertex_iport_iport|1533|0|2388|0|{0|in0|}836|856|}
{2010215002|XXGiport_binding_iport|1534|0|2390|0|{.5|.5|{0|}11542|}856|352|}
{2010214001|XXGiport_src_flow|1535|0|2391|0|{0|}856|813|}
{2010601001|XXGgraph_vertex_vertex|1536|0|2392|0|{Write_XREF_Files|}812|857|}
{2010604001|XXGgraph_flow_flow|1537|0|2394|0|{Flow_3|}857|858|}
{2010601001|XXGgraph_vertex_vertex|1538|0|2396|0|{RFMT_Drop_columns|}857|859|}
{2010212001|XXGvertex_oport_oport|1539|0|2398|0|{0|out0|}859|860|}
{2010213001|XXGoport_dst_flow|1540|0|2400|0|{0|}860|858|}
{2010212001|XXGvertex_oport_oport|1541|0|2401|0|{1|reject0|}859|861|}
{2010212001|XXGvertex_oport_oport|1542|0|2403|0|{2|error0|}859|862|}
{2010212001|XXGvertex_oport_oport|1543|0|2405|0|{3|log|}859|863|}
{2010211001|XXGvertex_iport_iport|1544|0|2407|0|{0|in|}859|864|}
{2010007001|XXGobject_proto_object|1545|0|2409|0|{}859|865|}
{2010212001|XXGvertex_oport_oport|1546|0|2411|0|{0|out0|}865|866|}
{2010006001|XXGobject_psameas_object|1547|0|2413|0|{metadata|out0_metadata|1|0|}866|865|}
{2010006001|XXGobject_psameas_object|1548|0|2414|0|{transform0|transform0|1|0|}866|865|}
{2010212001|XXGvertex_oport_oport|1549|0|2415|0|{1|reject0|}865|867|}
{2010006001|XXGobject_psameas_object|1550|0|2417|0|{metadata|reject0_metadata|1|0|}867|865|}
{2010212001|XXGvertex_oport_oport|1551|0|2418|0|{2|error0|}865|868|}
{2010006001|XXGobject_psameas_object|1552|0|2420|0|{metadata|error0_metadata|1|0|}868|865|}
{2010212001|XXGvertex_oport_oport|1553|0|2421|0|{3|log|}865|869|}
{2010006001|XXGobject_psameas_object|1554|0|2423|0|{metadata|log_metadata|1|0|}869|865|}
{2010211001|XXGvertex_iport_iport|1555|0|2424|0|{0|in|}865|870|}
{2010006001|XXGobject_psameas_object|1556|0|2426|0|{metadata|in_metadata|1|0|}870|865|}
{2010006001|XXGobject_psameas_object|1557|0|2427|0|{Layout|Layout|0|0|}859|360|}
{2010006001|XXGobject_psameas_object|1558|0|2428|0|{in_metadata|in_metadata|0|0|}859|345|}
{2010006001|XXGobject_psameas_object|1559|0|2429|0|{reject0_metadata|in_metadata|0|0|}859|345|}
{2010601001|XXGgraph_vertex_vertex|1560|0|2430|0|{Write_Multifile_Xref_ICFF_LookUp|}857|871|}
{2010604001|XXGgraph_flow_flow|1561|0|2432|0|{Flow_2|}871|362|}
{2010604001|XXGgraph_flow_flow|1562|0|2433|0|{Flow_6|}871|364|}
{2010604001|XXGgraph_flow_flow|1563|0|2434|0|{Flow_7|}871|872|}
{2010601001|XXGgraph_vertex_vertex|1564|0|2436|0|{View_Data|}871|873|}
{2010211001|XXGvertex_iport_iport|1565|0|2438|0|{0|write|}873|874|}
{2010214001|XXGiport_src_flow|1566|0|2440|0|{0|}874|362|}
{2010007001|XXGobject_proto_object|1567|0|2441|0|{}873|875|}
{2010211001|XXGvertex_iport_iport|1568|0|2443|0|{0|write|}875|876|}
{2010006001|XXGobject_psameas_object|1569|0|2445|0|{metadata|write_metadata|1|0|}876|875|}
{2010601001|XXGgraph_vertex_vertex|1570|0|2446|0|{Write_Block_Compressed_Lookup|}871|877|}
{2010212001|XXGvertex_oport_oport|1571|0|2448|0|{0|out|}877|878|}
{2010213001|XXGoport_dst_flow|1572|0|2450|0|{0|}878|364|}
{2010212001|XXGvertex_oport_oport|1573|0|2451|0|{1|index|}877|879|}
{2010213001|XXGoport_dst_flow|1574|0|2453|0|{0|}879|872|}
{2010212001|XXGvertex_oport_oport|1575|0|2454|0|{2|address|}877|880|}
{2010211001|XXGvertex_iport_iport|1576|0|2456|0|{0|in|}877|881|}
{2010007001|XXGobject_proto_object|1577|0|2458|0|{}877|882|}
{2010212001|XXGvertex_oport_oport|1578|0|2460|0|{0|out|}882|883|}
{2010006001|XXGobject_psameas_object|1579|0|2462|0|{metadata|out_metadata|1|0|}883|882|}
{2010212001|XXGvertex_oport_oport|1580|0|2463|0|{1|index|}882|884|}
{2010006001|XXGobject_psameas_object|1581|0|2465|0|{metadata|index_metadata|1|0|}884|882|}
{2010212001|XXGvertex_oport_oport|1582|0|2466|0|{2|address|}882|885|}
{2010006001|XXGobject_psameas_object|1583|0|2468|0|{metadata|address_metadata|1|0|}885|882|}
{2010211001|XXGvertex_iport_iport|1584|0|2469|0|{0|in|}882|886|}
{2010006001|XXGobject_psameas_object|1585|0|2471|0|{metadata|in_metadata|1|0|}886|882|}
{2010006001|XXGobject_psameas_object|1586|0|2472|0|{Layout|Layout|0|0|}877|360|}
{2010006001|XXGobject_psameas_object|1587|0|2473|0|{in_metadata|out0_metadata|0|0|}877|859|}
{2010006001|XXGobject_psameas_object|1588|0|2474|0|{out_metadata|write_metadata|0|0|}877|360|}
{2010601001|XXGgraph_vertex_vertex|1589|0|2475|0|{Xref_ICFF_Data_File|}871|360|}
{2010601001|XXGgraph_vertex_vertex|1590|0|2476|0|{Xref_ICFF_Index_File|}871|887|}
{2010211001|XXGvertex_iport_iport|1591|0|2478|0|{0|write|}887|888|}
{2010214001|XXGiport_src_flow|1592|0|2480|0|{0|}888|872|}
{2010007001|XXGobject_proto_object|1593|0|2481|0|{}887|889|}
{2010211001|XXGvertex_iport_iport|1594|0|2483|0|{0|write|}889|890|}
{2010006001|XXGobject_psameas_object|1595|0|2485|0|{metadata|write_metadata|1|0|}890|889|}
{2010006001|XXGobject_psameas_object|1596|0|2486|0|{write_metadata|index_metadata|0|0|}887|877|}
{2010211001|XXGvertex_iport_iport|1597|0|2487|0|{0|in0|}871|891|}
{2010215002|XXGiport_binding_iport|1598|0|2489|0|{.5|.5|{0|}10601|}891|881|}
{2010214001|XXGiport_src_flow|1599|0|2490|0|{0|}891|858|}
{2010211001|XXGvertex_iport_iport|1600|0|2491|0|{0|in0|}857|892|}
{2010215002|XXGiport_binding_iport|1601|0|2493|0|{.5|.5|{0|}10812|}892|864|}
{2010214001|XXGiport_src_flow|1602|0|2494|0|{0|}892|815|}
{2010211001|XXGvertex_iport_iport|1603|0|2495|0|{0|in0|}812|893|}
{2010215002|XXGiport_binding_iport|1604|0|2497|0|{.5|.5|{0|}29|}893|818|}
{2010214001|XXGiport_src_flow|1605|0|2498|0|{0|}893|25|}
{2010601001|XXGgraph_vertex_vertex|1606|0|2499|0|{Write_Event_Data_Store_Insert_Update|}1|894|}
{2010604001|XXGgraph_flow_flow|1607|0|2501|0|{Flow_1|}894|895|}
{2010604001|XXGgraph_flow_flow|1608|0|2503|0|{Flow_2|}894|896|}
{2010604001|XXGgraph_flow_flow|1609|0|2505|0|{Flow_20|}894|897|}
{2010604001|XXGgraph_flow_flow|1610|0|2507|0|{Flow_23|}894|898|}
{2010601001|XXGgraph_vertex_vertex|1611|0|2509|0|{Insert|}894|899|}
{2010211001|XXGvertex_iport_iport|1612|0|2511|0|{0|write|}899|900|}
{2010214001|XXGiport_src_flow|1613|0|2513|0|{0|}900|898|}
{2010007001|XXGobject_proto_object|1614|0|2514|0|{}899|901|}
{2010211001|XXGvertex_iport_iport|1615|0|2516|0|{0|write|}901|902|}
{2010006001|XXGobject_psameas_object|1616|0|2518|0|{metadata|write_metadata|1|0|}902|901|}
{2010601001|XXGgraph_vertex_vertex|1617|0|2519|0|{Non_match_goes_as_Insert_else_Update|}894|903|}
{2010212001|XXGvertex_oport_oport|1618|0|2521|0|{0|out|}903|904|}
{2010213001|XXGoport_dst_flow|1619|0|2523|0|{0|}904|895|}
{2010212001|XXGvertex_oport_oport|1620|0|2524|0|{1|deselect|}903|905|}
{2010213001|XXGoport_dst_flow|1621|0|2526|0|{0|}905|896|}
{2010212001|XXGvertex_oport_oport|1622|0|2527|0|{2|reject|}903|906|}
{2010212001|XXGvertex_oport_oport|1623|0|2529|0|{3|error|}903|907|}
{2010212001|XXGvertex_oport_oport|1624|0|2531|0|{4|log|}903|908|}
{2010211001|XXGvertex_iport_iport|1625|0|2533|0|{0|in|}903|909|}
{2010007001|XXGobject_proto_object|1626|0|2535|0|{}903|910|}
{2010212001|XXGvertex_oport_oport|1627|0|2537|0|{0|out|}910|911|}
{2010006001|XXGobject_psameas_object|1628|0|2539|0|{metadata|out_metadata|1|0|}911|910|}
{2010212001|XXGvertex_oport_oport|1629|0|2540|0|{1|deselect|}910|912|}
{2010006001|XXGobject_psameas_object|1630|0|2542|0|{metadata|deselect_metadata|1|0|}912|910|}
{2010212001|XXGvertex_oport_oport|1631|0|2543|0|{2|reject|}910|913|}
{2010006001|XXGobject_psameas_object|1632|0|2545|0|{metadata|reject_metadata|1|0|}913|910|}
{2010212001|XXGvertex_oport_oport|1633|0|2546|0|{3|error|}910|914|}
{2010006001|XXGobject_psameas_object|1634|0|2548|0|{metadata|error_metadata|1|0|}914|910|}
{2010212001|XXGvertex_oport_oport|1635|0|2549|0|{4|log|}910|915|}
{2010006001|XXGobject_psameas_object|1636|0|2551|0|{metadata|log_metadata|1|0|}915|910|}
{2010211001|XXGvertex_iport_iport|1637|0|2552|0|{0|in|}910|916|}
{2010006001|XXGobject_psameas_object|1638|0|2554|0|{metadata|in_metadata|1|0|}916|910|}
{2010006001|XXGobject_psameas_object|1639|0|2555|0|{Layout|Layout|0|0|}903|917|}
{2010211001|XXGvertex_iport_iport|1640|0|2557|0|{0|write|}917|918|}
{2010214001|XXGiport_src_flow|1641|0|2559|0|{0|}918|897|}
{2010007001|XXGobject_proto_object|1642|0|2560|0|{}917|919|}
{2010211001|XXGvertex_iport_iport|1643|0|2562|0|{0|write|}919|920|}
{2010006001|XXGobject_psameas_object|1644|0|2564|0|{metadata|write_metadata|1|0|}920|919|}
{2010006001|XXGobject_psameas_object|1645|0|2565|0|{write_metadata|out0_metadata|0|0|}917|921|}
{2010212001|XXGvertex_oport_oport|1646|0|2567|0|{0|out0|}921|922|}
{2010213001|XXGoport_dst_flow|1647|0|2569|0|{0|}922|897|}
{2010212001|XXGvertex_oport_oport|1648|0|2570|0|{1|reject0|}921|923|}
{2010212001|XXGvertex_oport_oport|1649|0|2572|0|{2|error0|}921|924|}
{2010212001|XXGvertex_oport_oport|1650|0|2574|0|{3|log|}921|925|}
{2010211001|XXGvertex_iport_iport|1651|0|2576|0|{0|in|}921|926|}
{2010214001|XXGiport_src_flow|1652|0|2578|0|{0|}926|896|}
{2010007001|XXGobject_proto_object|1653|0|2579|0|{}921|927|}
{2010212001|XXGvertex_oport_oport|1654|0|2581|0|{0|out0|}927|928|}
{2010006001|XXGobject_psameas_object|1655|0|2583|0|{metadata|out0_metadata|1|0|}928|927|}
{2010006001|XXGobject_psameas_object|1656|0|2584|0|{transform0|transform0|1|0|}928|927|}
{2010212001|XXGvertex_oport_oport|1657|0|2585|0|{1|reject0|}927|929|}
{2010006001|XXGobject_psameas_object|1658|0|2587|0|{metadata|reject0_metadata|1|0|}929|927|}
{2010212001|XXGvertex_oport_oport|1659|0|2588|0|{2|error0|}927|930|}
{2010006001|XXGobject_psameas_object|1660|0|2590|0|{metadata|error0_metadata|1|0|}930|927|}
{2010212001|XXGvertex_oport_oport|1661|0|2591|0|{3|log|}927|931|}
{2010006001|XXGobject_psameas_object|1662|0|2593|0|{metadata|log_metadata|1|0|}931|927|}
{2010211001|XXGvertex_iport_iport|1663|0|2594|0|{0|in|}927|932|}
{2010006001|XXGobject_psameas_object|1664|0|2596|0|{metadata|in_metadata|1|0|}932|927|}
{2010006001|XXGobject_psameas_object|1665|0|2597|0|{Layout|Layout|0|0|}921|917|}
{2010006001|XXGobject_psameas_object|1666|0|2598|0|{in_metadata|in_metadata|0|0|}921|345|}
{2010006001|XXGobject_psameas_object|1667|0|2599|0|{reject0_metadata|in_metadata|0|0|}921|345|}
{2010006001|XXGobject_psameas_object|1668|0|2600|0|{deselect_metadata|in_metadata|0|0|}903|345|}
{2010006001|XXGobject_psameas_object|1669|0|2601|0|{in_metadata|in_metadata|0|0|}903|345|}
{2010006001|XXGobject_psameas_object|1670|0|2602|0|{out_metadata|in_metadata|0|0|}903|345|}
{2010006001|XXGobject_psameas_object|1671|0|2603|0|{reject_metadata|in_metadata|0|0|}903|345|}
{2010601001|XXGgraph_vertex_vertex|1672|0|2604|0|{RFMT_Drop_NK_Fields_if_any_Insert|}894|933|}
{2010212001|XXGvertex_oport_oport|1673|0|2606|0|{0|out0|}933|934|}
{2010213001|XXGoport_dst_flow|1674|0|2608|0|{0|}934|898|}
{2010212001|XXGvertex_oport_oport|1675|0|2609|0|{1|reject0|}933|935|}
{2010212001|XXGvertex_oport_oport|1676|0|2611|0|{2|error0|}933|936|}
{2010212001|XXGvertex_oport_oport|1677|0|2613|0|{3|log|}933|937|}
{2010211001|XXGvertex_iport_iport|1678|0|2615|0|{0|in|}933|938|}
{2010214001|XXGiport_src_flow|1679|0|2617|0|{0|}938|895|}
{2010007001|XXGobject_proto_object|1680|0|2618|0|{}933|939|}
{2010212001|XXGvertex_oport_oport|1681|0|2620|0|{0|out0|}939|940|}
{2010006001|XXGobject_psameas_object|1682|0|2622|0|{metadata|out0_metadata|1|0|}940|939|}
{2010006001|XXGobject_psameas_object|1683|0|2623|0|{transform0|transform0|1|0|}940|939|}
{2010212001|XXGvertex_oport_oport|1684|0|2624|0|{1|reject0|}939|941|}
{2010006001|XXGobject_psameas_object|1685|0|2626|0|{metadata|reject0_metadata|1|0|}941|939|}
{2010212001|XXGvertex_oport_oport|1686|0|2627|0|{2|error0|}939|942|}
{2010006001|XXGobject_psameas_object|1687|0|2629|0|{metadata|error0_metadata|1|0|}942|939|}
{2010212001|XXGvertex_oport_oport|1688|0|2630|0|{3|log|}939|943|}
{2010006001|XXGobject_psameas_object|1689|0|2632|0|{metadata|log_metadata|1|0|}943|939|}
{2010211001|XXGvertex_iport_iport|1690|0|2633|0|{0|in|}939|944|}
{2010006001|XXGobject_psameas_object|1691|0|2635|0|{metadata|in_metadata|1|0|}944|939|}
{2010006001|XXGobject_psameas_object|1692|0|2636|0|{Layout|Layout|0|0|}933|899|}
{2010006001|XXGobject_psameas_object|1693|0|2637|0|{in_metadata|in_metadata|0|0|}933|345|}
{2010006001|XXGobject_psameas_object|1694|0|2638|0|{reject0_metadata|in_metadata|0|0|}933|345|}
{2010601001|XXGgraph_vertex_vertex|1695|0|2639|0|{RFMT_Drop_NK_Fields_if_any_Update|}894|921|}
{2010601001|XXGgraph_vertex_vertex|1696|0|2640|0|{Update|}894|917|}
{2010211001|XXGvertex_iport_iport|1697|0|2641|0|{0|in0|}894|945|}
{2010215002|XXGiport_binding_iport|1698|0|2643|0|{.5|.5|{0|}17360|}945|909|}
{2010214001|XXGiport_src_flow|1699|0|2644|0|{0|}945|19|}
{2010601001|XXGgraph_vertex_vertex|1700|0|2645|0|{Write_Event_Log|}1|946|}
{2010604001|XXGgraph_flow_flow|1701|0|2647|0|{Flow_1|}946|947|}
{2010601001|XXGgraph_vertex_vertex|1702|0|2649|0|{Event_Log_Entry|}946|948|}
{2010212001|XXGvertex_oport_oport|1703|0|2651|0|{0|out|}948|949|}
{2010213001|XXGoport_dst_flow|1704|0|2653|0|{0|}949|947|}
{2010212001|XXGvertex_oport_oport|1705|0|2654|0|{1|error|}948|950|}
{2010212001|XXGvertex_oport_oport|1706|0|2656|0|{2|log|}948|951|}
{2010006001|XXGobject_psameas_object|1707|0|2658|0|{Layout|Layout|0|0|}948|952|}
{2010211001|XXGvertex_iport_iport|1708|0|2660|0|{0|write|}952|953|}
{2010214001|XXGiport_src_flow|1709|0|2662|0|{0|}953|947|}
{2010006001|XXGobject_psameas_object|1710|0|2663|0|{out_metadata|write_metadata|0|0|}948|952|}
{2010601001|XXGgraph_vertex_vertex|1711|0|2664|0|{Output_Event_File|}946|952|}
{2010007001|XXGobject_proto_object|1712|0|2665|0|{}946|954|}
{2010604001|XXGgraph_flow_flow|1713|0|2667|0|{Flow_1|}954|955|}
{2010601001|XXGgraph_vertex_vertex|1714|0|2669|0|{Event_Log_Entry|}954|956|}
{2010212001|XXGvertex_oport_oport|1715|0|2671|0|{0|out|}956|957|}
{2010213001|XXGoport_dst_flow|1716|0|2673|0|{0|}957|955|}
{2010212001|XXGvertex_oport_oport|1717|0|2674|0|{1|error|}956|958|}
{2010212001|XXGvertex_oport_oport|1718|0|2676|0|{2|log|}956|959|}
{2010007001|XXGobject_proto_object|1719|0|2678|0|{}956|960|}
{2010212001|XXGvertex_oport_oport|1720|0|2680|0|{0|out|}960|961|}
{2010006001|XXGobject_psameas_object|1721|0|2682|0|{metadata|out_metadata|1|0|}961|960|}
{2010212001|XXGvertex_oport_oport|1722|0|2683|0|{1|error|}960|962|}
{2010006001|XXGobject_psameas_object|1723|0|2685|0|{metadata|error_metadata|1|0|}962|960|}
{2010212001|XXGvertex_oport_oport|1724|0|2686|0|{2|log|}960|963|}
{2010006001|XXGobject_psameas_object|1725|0|2688|0|{metadata|log_metadata|1|0|}963|960|}
{2010601001|XXGgraph_vertex_vertex|1726|0|2689|0|{Output_Event_File|}954|964|}
{2010211001|XXGvertex_iport_iport|1727|0|2691|0|{0|write|}964|965|}
{2010214001|XXGiport_src_flow|1728|0|2693|0|{0|}965|955|}
{2010007001|XXGobject_proto_object|1729|0|2694|0|{}964|966|}
{2010211001|XXGvertex_iport_iport|1730|0|2696|0|{0|write|}966|967|}
{2010006001|XXGobject_psameas_object|1731|0|2698|0|{metadata|write_metadata|1|0|}967|966|}
{2010601001|XXGgraph_vertex_vertex|1732|0|2699|0|{XREF_LKP_TPL|}1|968|}
{2010007001|XXGobject_proto_object|1733|0|2701|0|{}968|969|}
{2010109001|XXGobject_property_value|1734|0|2703|0|{0|TrackingThumbprint|72|}1|970|}
