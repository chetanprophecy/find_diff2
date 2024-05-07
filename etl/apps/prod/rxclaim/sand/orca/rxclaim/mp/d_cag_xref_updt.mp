@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|9|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|254|rel_count|463|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|FKl|Provides functions and types to use in PDL.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|LOAD_START_TIME|$[ (datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn"))now() ]|3|9|RK|YYYY-MM-DD hh24:mi:ss.nnnnnn: The time the load graph was started up.  Used to set the create and update dates to the same time across partitions.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|LOAD_REJECT_LIMIT|0|3|9|RFK|The number of rejected records to allow before checking the Load Reject Ramp for failure.|{0|}}
{30001002|XXparameter|LOAD_REJECT_RAMP|0|3|9|RFK|0.###: The rate of rejected records (after the Load Reject Limit) to allow.  If this rate is exceeded, then the load graph will fail.  Defaults to a project setting.|{0|}}
{30001002|XXparameter|DO_DATA_VALIDATION|True|13|9|FK|@{0|}}
{30001002|XXparameter|BOOKKEEPING_FIELDS|dxf_src_sys_id
ids_src_envrt_id
ids_src_envrt_nm
ids_create_dttm
ids_create_uid
ids_create_run_id
ids_updt_dttm
ids_updt_uid
ids_updt_run_id
ids_rec_stat_cd|3|9|RFK|The list of bookkeeping or "physical" fields.|{0|}}
{30001002|XXparameter|BOOKKEEPING_FIELDS_VEC|$[ string_split(BOOKKEEPING_FIELDS ,"\\r\\n")]|3|9|RK|A vector of bookkeeping or "physical" fields.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|UPDATE_BOOKKEEPING_FIELDS|ids_rec_stat_cd
ids_run_id
ids_src_envrt_id
ids_updt_dttm
ids_updt_uid
dxf_src_sys_id|3|9|RFK|The list of bookkeeping or "physical" fields that can be changed during updates.|{0|}}
{30001002|XXparameter|UPDATE_BOOKKEEPING_FIELDS_VEC|$[ string_split(UPDATE_BOOKKEEPING_FIELDS ,"\\r\\n")]|3|9|RK|A vector of bookkeeping or "physical" fields that can be changed during updates.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|APP_NM|dummy|3|9|FK|This value should be defined in intermediate parameter|{0|}}
{30001002|XXparameter|TARGET_DML_DIR|$AI_DML|3|9|K|The DML directory in the target DB project.|{0|}}
{30001002|XXparameter|ILM_NAME|@3|9|FK|This will be subdirectory under which all DML and data will be present in datahub location|{0|}}
{30001002|XXparameter|BOOKKEEPING_FIELDS_MAP_XFR|$PUB_DXF_XFR/default_physical_fields.xfr|3|9|FK|@{0|}}
{30001002|XXparameter|ETL_APP_ID|AB_PARAMETER_ENV|3|10|Kd|ETL(Unix) Id that was used to run this process|{0|}}
{30001002|XXparameter|ETL_APP_ID:eme||3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|NOTES||3|2|K$|Use this to save useful information, such as run times, record counts, and data sizes.  For example: 30.5 min, 122.5 M rec, 64.0 GB|{0|}}
{30001002|XXparameter|TARGET_NAME||3|9|FK|The name of the target table to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RK|The cananonical form of the full "logical" target table name.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_LOWER, ".*[.]", "") ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|SUBJECT_AREA|ids_common|3|9|K|Subject area defined as per IDS|{0|}}
{30001002|XXparameter|IDS_META_STRING|$[SUBJECT_AREA + "." + TARGET_ENTITY]|3|9|K|This string will be used to get value from ids meta property file|{0|}}
{30001002|XXparameter|IS_WRITE_MFS_XREF_ICFF|$[if(get_ids_table_properties(IDS_META_STRING).storage_type=="icff") "Y" else "N" ]|3|9|K|This will decide if MFS Xref ICFF will be written or serial xref will be written|{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[get_ids_dataset_identifier(IDS_META_STRING)]|3|9|EFK|@{0|}}
{30001002|XXparameter|EVENT_CHANNEL_ID|1|3|9|FK|@{0|}}
{30001002|XXparameter|FACT_DATA_PARTITION_KEY||3|9|FK|This must be a date column with YYYYMMDD|{0|}}
{30001002|XXparameter|IS_WRITE_REDUCED_DATASET|False|13|9|FK|@{0|}}
{30001002|XXparameter|IS_SUPPRESS_UPDATE_FOR_HIST|N|15|9|FK|This parameter if true, will supress any updates |{2|N|Y|}}
{30001002|XXparameter|IS_SUPRESS_EVENT_FILES|False|13|9|FK|If this parameter is True , Eevnt file will not be created |{0|}}
{30001002|XXparameter|USE_XREF_FOR_CDC|False|13|9|FK|@{0|}}
{30001002|XXparameter|___DML_and_Record_Type_and_KEY_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|SPLIT_DML_FILE|$[AI_DML +"/split." +SUBJECT_AREA + "/split." +SUBJECT_AREA+"." + TARGET_ENTITY + ".dml"]|3|9|K|Split DML file|{0|}}
{30001002|XXparameter|HASH_RECORD|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = hash_key_combine_type;|7|9|K|Value will come from generic_data_types.dml file defined in PUB_DXF_DML location|{0|}}
{30001002|XXparameter|XREF_LOOKUP_TYPE_DML|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = xref_lookup_type;|7|9|RK|@{0|}}
{30001002|XXparameter|PLACEHOLDER_READ_DML|/*
This DML is the output DML of Reformat component. It contians the two fields,
dimension and target which are used to determine the name of the palceholder
file in the WMF compoenent. Additionally it contains the split type 2 header
fields, dxf header fields, IDS audit fields and dxf hk and sk fields. Also, 
it contains the field target_fields_line, which holds the data to be stored 
'\\x01' delimited target fields.
*/

$[join_types('record\\nend',
        join_types(
               join_types(read_type(PUB_DXF_DML + "/split_header.type2.dml"), 
                                join_types(read_type(PUB_DXF_DML + "/dxf_header.dml"), 
                        XREF_LOOKUP_TYPE_DML)
                ), 
        'record\\n  string("\\\\n") target_fields_line;\\nend')
)]|7|9|RK|@{0|}}
{30001002|XXparameter|XREF_KEY_FILE_DML|$[
join_types(HASH_RECORD,'record\\n integer(8) dxf_sk=0;  \\n end')]|7|9|K|DML for universal dim xref file|{0|}}
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
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|A common fixed ( Hardcoded)  ICFF key used across ORCA . |{0|}}
{30001002|XXparameter|IDS_AUDIT_TYPE|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = ids_audit_type;|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_DATASET_FIELDS|@3|9|FK|@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML|AB_PARAMETER_ENV|3|10|FKd|DML that will be used to create single ICFF subset fact file that may diffrent ICFF Lookup key than main FACT|{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:eme|$[PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml"]|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:sandbox|$[begin
let string("") dml_file=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml" ;
let string("") dml_file_reduced=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".reduced.dml" ;
result:: if(file_information(dml_file_reduced).found) dml_file_reduced else dml_file;
end]|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_ICFF_KEY||3|9|FK|Please provide valid key expression like \{abc;def \}|{0|}}
{30001002|XXparameter|F_ERROR_FOR_REQ_FIELDS_REDUCED_DML|$[ 
begin
     if(IS_WRITE_REDUCED_DATASET)
        begin
                let string("")[] req_fields_vec = [vector "src_env_sk", "ids_updt_dttm"];
                let string("")[] match_field_vec;
                let string("")[] miss_field_vec; 
                let string("")[] reduced_dml_vec= record_info_item(read_type(REDUCED_DATASET_DML), item= "name" );
                match_field_vec = for ( let field in req_fields_vec ) : 
                                        if(field member reduced_dml_vec ) 
                                                field;

                miss_field_vec = vector_difference(req_fields_vec,match_field_vec);
                if(length_of(miss_field_vec) >0 and AI_PHASE != "prod" )  //Added Phase condition to stop failure for existing psets running in prod
                        force_error("Error : Required Fields " + string_join(miss_field_vec , " , ") + " are missing in Reduced Dataset DML");
         end                  
        
     result:: "";
end;
]|3|9|K|This will check if fields src_env_sk and ids_updt_dttm are available in reduced dataset dml. If not Graph will force to fail. |{0|}}
{30001002|XXparameter|F_ERROR_FOR_MISSING_REDUCED_ICFF_KEY|$[if(IS_WRITE_REDUCED_DATASET && is_blank(REDUCED_DATASET_ICFF_KEY)) force_error("IS_WRITE_REDUCED_DATASET Flag is set as True ,But key value for reduced dataset is not set in parameter:
REDUCED_DATASET_ICFF_KEY","MISSING REDUCED ICFF KEY") else "";]|3|9|FK|@{0|}}
{30001002|XXparameter|________File_Parameters____________|@3|9|K|@{0|}}
{30001002|XXparameter|INPUT_FILE_DRIVING_MASK|$[if(starts_with(AB_PSET_NAME,"placeholder_")) "placeholder" else "split"]|3|9|EFK|This parameter will decide that ,this is a placeholder file or split file|{0|}}
{30001002|XXparameter|INPUT_FILE_EME|$[ if(INPUT_FILE_DRIVING_MASK =="split") string_concat( AI_MFS,"/split/" ,INPUT_FILE_DRIVING_MASK , ".\{ILM\}." , SUBJECT_AREA ,".", TARGET_ENTITY ,  ".\{RUN_ID\}.dat.gz" ) 
else string_concat( AI_MFS,"/placeholder/" ,INPUT_FILE_DRIVING_MASK  , ".\{ILM\}.\{SOURCE\}.\{SOURCE\}." , TARGET_ENTITY , ".\{RUN_ID\}.dat.gz" ) ]|3|9|K|Parameter created for EME dataset|{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK|$[
begin
let pset_info_type load_pset = allocate_with_defaults();
let string("") is_ids_dml_with_nk_flag = "False";
let decimal("") tnl_index = -1;
if(INPUT_FILE_DRIVING_MASK == "placeholder" && file_information(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset").found) begin
load_pset = pset_info(read_file(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset"));
tnl_index = vector_search(load_pset.parameters, [record name "IS_IDS_DML_WITH_NK" value "" interpretation "" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});
if(tnl_index != -1)
is_ids_dml_with_nk_flag = load_pset.parameters[tnl_index].value;
end
result :: is_ids_dml_with_nk_flag;
end
]|13|9|FK|@{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[ string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA, "/", DATASET_IDENTIFIER)  ]|3|9|EK|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE|$[ string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat.gz")]|3|9|K|key file location used in fact key lookup process|{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".idx")]|3|9|K|Index file for fact key lookup process|{0|}}
{30001002|XXparameter|ICFF_FILE|$[if ( DATASET_IDENTIFIER == "many") XREF_KEY_ICFF_FILE 
else  string_concat(IDS_DATA_PATH , "/" , TARGET_ENTITY , ".dat.gz" ) ]|3|9|K|Main ICFF file - Xref  data file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$[ if( DATASET_IDENTIFIER == "many") XREF_KEY_INDEX_FILE else string_concat(IDS_DATA_PATH,"/" ,TARGET_ENTITY,".idx") ]|3|9|K|MAIN ICFF index file - Xref index file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|ARCHIVE_ICFF_FILE|$[string_concat(IDS_DATA_PATH , "/" , TARGET_ENTITY , ".archive.dat.gz")]|3|9|K|Main ICFF file - Xref  data file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|ARCHIVE_ICFF_INDEX_FILE|$[string_concat(IDS_DATA_PATH , "/" , TARGET_ENTITY , ".archive.idx")]|3|9|K|MAIN ICFF index file - Xref index file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|REDUCED_ICFF_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/one","/" , TARGET_ENTITY , ".reduced.dat.gz") ]|3|9|K|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_INDEX_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/one","/" , TARGET_ENTITY , ".reduced.idx") ]|3|9|K|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_FILE_FILTER_EXPR|@3|9|FK|@{0|}}
{30001002|XXparameter|INSERT_FILE|AB_PARAMETER_ENV|3|10|Kd|Insert file for distribution event|{0|}}
{30001002|XXparameter|INSERT_FILE:eme|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.\{RUN_ID\}.dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|INSERT_FILE:sandbox|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.",RUN_ID,".dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|INSERT_FILE_AZDA|AB_PARAMETER_ENV|3|10|Kd||{0|}}
{30001002|XXparameter|INSERT_FILE_AZDA:sandbox|$[string_concat(PUB_DATAHUB_MFS,"/event_azda/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.",RUN_ID,".dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|INSERT_FILE_AZDA:eme|$[string_concat(PUB_DATAHUB_MFS,"/event_azda/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.\{RUN_ID\}.dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|XREF_FILE_EXIST|AB_PARAMETER_ENV|1|10|Kd|Parameter to check existence of xref file|{0|}}
{30001002|XXparameter|XREF_FILE_EXIST:eme|1|3|9||@{0|}}
{30001002|XXparameter|XREF_FILE_EXIST:sandbox|$[file_information(string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat")).found]|3|9||@{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INPUT_LOOKUP_FILE|AB_PARAMETER_ENV|3|10|Kd|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INPUT_LOOKUP_FILE:eme|$[begin
let v_file_nm=string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat");
result:: v_file_nm ;
end ]|3|9||@{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INPUT_LOOKUP_FILE:sandbox|$[begin
let v_file_nm=string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat");
result:: if(DXF_SERVER_ARCHITECTURE=="SMP") 
                v_file_nm
        else if (XREF_FILE_EXIST == 1 && DXF_SERVER_ARCHITECTURE=="MPP" )
                multifile_information(v_file_nm).paths[0] 
        else v_file_nm ;
end ]|3|9||@{0|}}
{30001002|XXparameter|XREF_NON_ICFF_LOOKUP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/updated_xref.",TARGET_ENTITY,".dat")]|3|9|K|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INDEX_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/updated_xref.",TARGET_ENTITY,".idx")]|3|9|K|Location where xref lokkup file IDX for Map keying process will be created|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_LOOKUP_TEMP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/updated_xref.",TARGET_ENTITY,".temp.dat")]|3|9|K|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INDEX_TEMP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/updated_xref.",TARGET_ENTITY,".temp.idx")]|3|9|K|Location where xref lokkup file IDX for Map keying process will be created|{0|}}
{30001002|XXparameter|MAX_SK_LOOKUP_FILE|$[
begin
let string("") datanode_value="//abidatanode8";
result :: if(string_like(PUB_DATAHUB_SERIAL_LOOKUP, "%mfs%")) string_concat(datanode_value, PUB_DATAHUB_SERIAL_LOOKUP,"/ids/",SUBJECT_AREA,"/max_sk/max_sk.",TARGET_ENTITY,".dat")
 else string_concat(PUB_DATAHUB_SERIAL_LOOKUP,"/ids/",SUBJECT_AREA,"/max_sk/max_sk.",TARGET_ENTITY,".dat");

end]|3|9|K|This will be dim max sk lookup file |{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$[ string_concat(PUB_DATAHUB_SERIAL ,"/event_log/event_log.",SUBJECT_AREA,".", TARGET_ENTITY , ".dat") ]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|______Dependent_Parameters_____________________________|@3|9|K|@{0|}}
{30001002|XXparameter|MAX_SK_VALUE|AB_PARAMETER_ENV|3|10|Kd|This is Max SK value for a given dimension|{0|}}
{30001002|XXparameter|MAX_SK_VALUE:eme|0|3|9||@{0|}}
{30001002|XXparameter|MAX_SK_VALUE:sandbox|$[if(file_information(MAX_SK_LOOKUP_FILE).found) read_file(MAX_SK_LOOKUP_FILE) else "0"]|3|9||@{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_KEY|\{dxf_hk_part1; dxf_hk_part2;dxf_sk;grp_hrchy_sk;hash_key;hash_key_half\}|3|9|FK|Optional: \{field1; field2;...\}: A key that includes fields that cannot be changed on an update.|{0|}}
{30001002|XXparameter|DO_NOT_UPDATE_COL_LIST|@3|9|FK|Please Provide columns that will not be updated,  even if a record is an update record . Column must be comma separated like : d3iqhr,d3irhr,d3ithr,d3bzik|{0|}}
{30001002|XXparameter|DO_TWO_STEP_LOOKUP|$[if(file_information(PUB_DXF_META + "/two_step_lookup_list.dat").found)  TARGET_LOWER member string_split(string_filter_out(read_file(PUB_DXF_META + "/two_step_lookup_list.dat"),"\\r"),"\\n") else 0 ]|1|9|K|This list provide two step lookup flag|{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_VEC|$[ for ( let k in key_info(FIELDS_TO_IGNORE_KEY) ) :
    k.field_name
]|3|9|RK|A vector of field names that are ignored in comparisions and updates.|{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.
\{source_record_active_cd; source_update_dttm descending; source_sequence_number descending; source_create_dttm descending; dxf_src_dataset_id descending; dxf_src_rec_cnt descending; drop_record\}
// source_record_active_cd                                    // A (Source Active) before I (Source Inactive)
// source_update_dttm descending                              // Records updated later over earlier
// source_sequence_number descending                          // Records created later over earlier
// source_create_dttm descending                              // Records created later over earlier
// dxf_src_dataset_id descending; dxf_src_rec_cnt descending  // Records delivered later over earlier
// drop_record                                                // 0 (Inserts) over 1 (Deletes)|3|9|RK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|NATURAL_KEY|$[get_ids_table_nk(IDS_META_STRING)]|3|9|FK|\{field_1; ...; field_n\}: The natural key for the target table, without any effective date fields.|{0|}}
{30001002|XXparameter|NATURAL_KEY_FIELDS_VEC|$[ for ( let k in key_info(NATURAL_KEY) ) : k.field_name ]|3|9|RK|A vector of natural key field names.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD|$[
begin
let pset_info_type load_pset = allocate_with_defaults();
let string("") truncate_and_load_flag = "False";
let decimal("") tnl_index = -1;
if(INPUT_FILE_DRIVING_MASK == "placeholder" && file_information(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset").found) begin
load_pset = pset_info(read_file(AI_PSET + "/load." + SUBJECT_AREA + "/load." + TARGET_LOWER + ".pset"));
tnl_index = vector_search(load_pset.parameters, [record name "TRUNCATE_AND_LOAD" value "" interpretation "" value_in_file 0 interpret_file_contents 0 overridable 1], \{name\});
if(tnl_index != -1)
truncate_and_load_flag = load_pset.parameters[tnl_index].value;
end
result :: truncate_and_load_flag;
end
]|13|9|FK|@{0|}}
{30001002|XXparameter|FACT_CDC_XFR|$[
if(not (TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split"))
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
let string("") v_input_file_type="$\{INPUT_FILE_DRIVING_MASK\}";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;
//Flag =0 -- Same record
//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update
// Make surrogate key as well part of CDC compare , excluding book keeping columns  ( Natural keys , Non Natural keys ( exclude book keeping fileds) 

type lookup_record_type = ' + XREF_KEY_FILE_DML + ';' +

' let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let int v_flag=0;

let  unsigned integer(8) v_hash_key_half=0;
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value=allocate_with_defaults();
let lookup_record_type exact_next_record_value=allocate_with_nulls();
let  hash_key_type v_record_hash_from_in=allocate_with_defaults();
let hash_key_type  v_record_hash_from_lkp=allocate_with_defaults(); 

//These parameters are only added to get count of values.
/*Reformat operation*/
//let decimal ("") insert_record_count=0;
//let decimal("") update_record_count=0;
//let decimal("") same_record_count=0;
//let decimal("") total_record_count=0;
//let decimal("") supressed_update_record_count=0;

 // if (current_lookup == lookup_not_loaded()) 
       // current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("' + XREF_KEY_INDEX_FILE + '),"ICFF_TEMPLATE" );

//let lookup_record_type lookup_record_value;
out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();
 if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("'+XREF_KEY_INDEX_FILE+'"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                      else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                      begin
                        match_count=lookup_count(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1);
                          begin block exact_record_match
                             for (let int k, k < match_count)
                               begin 
                                exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1) else lookup_previous(current_lookup,"ICFF_TEMPLATE_IDS");
                                 if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                  begin
                                        exact_record_value = exact_next_record_value;
                                        exit  exact_record_match;
                                  end
                                                                                                 
                             end
                          end block exact_record_match
                       result :: exact_record_value ;
                       end ; 
                                                                      
                                                                    
                                                                         
/* Match Cases 

1. Hash_key_half found a match in IDS ICFF  :
        a.It also found a found a match with full hash key 
             1. Go ahead and compare column hash for CDC to find update .
             
        b.Hash key half has a match but there is no mtach for hash_key (full)
            1. It become insert .
2.dxf_hk_part1 has no match in IDS ICFF 
      a.This become an insert record .
*/                                                                       
         
                                                                 

        
//Asign Flags to identify change records 
        v_flag =   if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  ) 1  // Insert 
                   else 2;
                     
//This count process is only to capture every type of record count for Audit purpose . This is not part of any CDC process.
        //same_record_count =  same_record_count;
        //insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        //update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        //total_record_count =total_record_count +1;

        
        out.flag :: if( (v_flag == 2 && v_input_file_type=="placeholder" )  or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ; // Supress updates if file is placeholder
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        
        out.* :: in.*;

end

/*
out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count , 
                                   ";SUPRESSED_UPDATE_RECORD_COUNT = ", supressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end;*/ ' 
else ''
]|8|9|K|FACT CDC uses xref ICFF to perform CDC |{0|}}
{30001002|XXparameter|DIM_XREF_CDC_XFR|$[
if( IS_WRITE_MFS_XREF_ICFF == "Y" and not (TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split"))
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
let string("") v_input_file_type="$\{INPUT_FILE_DRIVING_MASK\}";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;

//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update


let int v_flag=0;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let xref_lookup_type lookup_record_value = allocate_with_nulls();
let xref_lookup_type exact_record_value=allocate_with_defaults();
let xref_lookup_type exact_next_record_value=allocate_with_nulls();

//These parameters are only added to get count of values.
/*Reformat operation*/


out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();

        if (current_lookup == lookup_not_loaded()) 
                current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("'+XREF_KEY_INDEX_FILE+'"),"ICFF_TEMPLATE_XREF" );  
 
                lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1),allocate_with_defaults() );
                exact_record_value=allocate_with_defaults();
                exact_record_value =  if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                                                else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first inetration itself 
                                                else                                                                        //A Match is found on half hash key but not on full hash key, find exact match inside iteration  .
                                                        begin
                                                                match_count=lookup_count(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1);
                                                                begin block exact_record_match
                                                                        for (let int k, k < match_count)
                                                                                begin 
                                                                                        exact_next_record_value = if( k == 0 ) lookup_last(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1) else lookup_previous(current_lookup,"ICFF_TEMPLATE_XREF");
                                                                                        if ( in.dxf_hk_part2 == exact_next_record_value.dxf_hk_part2 ) 
                                                                                                begin
                                                                                                        exact_record_value = exact_next_record_value;
                                                                                                        exit  exact_record_match;
                                                                                                end
                                                                                                 
                                                                                end
                                                                end block exact_record_match
                                                        result :: exact_record_value ;
                                                        end ; 
    
//Asign Flags to identify change records 
        v_flag =   if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  ) 1  // Insert 
                   else 2;
                     
       
        out.flag :: if( (v_flag == 2 && v_input_file_type=="placeholder" )  or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ; // Supress updates if file is placeholder
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        
        out.* :: in.*;

end

' 
else if( IS_WRITE_MFS_XREF_ICFF != "Y" and not (TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split"))

'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
let string("") v_input_file_type="$\{INPUT_FILE_DRIVING_MASK\}";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;

//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update

let int v_flag=0;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let xref_serial_lookup_type lookup_record_value = allocate_with_nulls();

let hash_key_combine_type dxf_hk = allocate_with_defaults();

/*Reformat operation*/

out::reformat(in) =
begin
 let integer(2) match_count=0;
 
        if (current_lookup == lookup_not_loaded()) 
                current_lookup = lookup_load(this_partition_path("' + XREF_NON_ICFF_LOOKUP_FILE + '"),this_partition_path("' + XREF_NON_ICFF_INDEX_FILE + '"),"REG_TEMPLATE_XREF" ); 
 
                dxf_hk = [record dxf_hk_part1 in.dxf_hk_part1 dxf_hk_part2 in.dxf_hk_part2];

                lookup_record_value = first_defined(lookup_last(current_lookup, "REG_TEMPLATE_XREF", dxf_hk), allocate_with_defaults() );

                v_flag =     if(lookup_record_value.dxf_hk == dxf_hk)
                                        2
                                else 
                                        1;
                                  
        
        out.flag :: if( (v_flag == 2 && v_input_file_type=="placeholder" )  or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ; // Supress updates if file is placeholder
        out.dxf_sk :: if ( v_flag == 2 ) lookup_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        
        out.* :: in.*;

end

'
else ''
]|3|9|K|@{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD_XFR|$[
begin

let lkp_split_stmts = if(IS_WRITE_MFS_XREF_ICFF == "Y")
'
  if (current_lookup == lookup_not_loaded()) 
        current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("' + XREF_KEY_INDEX_FILE + '"),"ICFF_TEMPLATE_XREF" );
  lkp_cnt = lookup_count(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1);
  v_flag = 1;
  if(lkp_cnt > 0) begin
        icff_lkp_rec = lookup_last(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1);        
        if(lkp_cnt == 1 && icff_lkp_rec.dxf_hk_part2 == in.dxf_hk_part2) begin
          v_flag = 2;
          dxf_sk = icff_lkp_rec.dxf_sk;
        end
        else if(lkp_cnt > 1) begin
          for(let i = 0, i < lkp_cnt - 1) begin
            icff_lkp_rec = lookup_previous(current_lookup, "ICFF_TEMPLATE_XREF");
            if(icff_lkp_rec.dxf_hk_part2 == in.dxf_hk_part2) begin
              v_flag = 2;
              dxf_sk = icff_lkp_rec.dxf_sk;
            end
          end
        end
  end'     
else 
'
  if (current_lookup == lookup_not_loaded()) 
        current_lookup = lookup_load(this_partition_path("' + XREF_NON_ICFF_LOOKUP_FILE + '"),this_partition_path("' + XREF_NON_ICFF_INDEX_FILE + '"),"REG_TEMPLATE_XREF" );
  v_flag = 1;
  dxf_hk = [record dxf_hk_part1 in.dxf_hk_part1 dxf_hk_part2 in.dxf_hk_part2];
  if(lookup_match(current_lookup, "REG_TEMPLATE_XREF", dxf_hk)) begin
    v_flag = 2;
    dxf_sk = lookup(current_lookup, "REG_TEMPLATE_XREF", dxf_hk).dxf_sk;
  end;';

let lkp_plchldr_stmts = if(IS_WRITE_MFS_XREF_ICFF == "Y")
'
  if (current_lookup == lookup_not_loaded()) 
        current_lookup = lookup_load(this_partition_path("' + XREF_KEY_ICFF_FILE + '"),this_partition_path("' + XREF_KEY_INDEX_FILE + '"),"ICFF_TEMPLATE_XREF" );
  lkp_cnt = lookup_count(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1);
  v_flag = 1;
  if(lkp_cnt > 0) begin
        icff_lkp_rec = lookup_last(current_lookup, "ICFF_TEMPLATE_XREF", in.dxf_hk_part1);        
        if(lkp_cnt == 1 && icff_lkp_rec.dxf_hk_part2 == in.dxf_hk_part2) begin
          v_flag = 0;
          dxf_sk = icff_lkp_rec.dxf_sk;
        end
        else if(lkp_cnt > 1) begin
          for(let i = 0, i < lkp_cnt - 1) begin
            icff_lkp_rec = lookup_previous(current_lookup, "ICFF_TEMPLATE_XREF");
            if(icff_lkp_rec.dxf_hk_part2 == in.dxf_hk_part2) begin
              v_flag = 0;
              dxf_sk = icff_lkp_rec.dxf_sk;
            end
          end
        end
  end'     
else 
'
  if (current_lookup == lookup_not_loaded()) 
        current_lookup = lookup_load(this_partition_path("' + XREF_NON_ICFF_LOOKUP_FILE + '"),this_partition_path("' + XREF_NON_ICFF_INDEX_FILE + '"),"REG_TEMPLATE_XREF" );
  v_flag = 1;
  dxf_hk = [record dxf_hk_part1 in.dxf_hk_part1 dxf_hk_part2 in.dxf_hk_part2];
  if(lookup_match(current_lookup, "REG_TEMPLATE_XREF", dxf_hk)) begin
    v_flag = 0;
    dxf_sk = lookup(current_lookup, "REG_TEMPLATE_XREF", dxf_hk).dxf_sk;
  end;';

result :: if((TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split"))
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let xref_lookup_type icff_lkp_rec = allocate_with_defaults();
let decimal("") v_flag = -1;
let decimal("") dxf_sk = -1;
let decimal("") lkp_cnt = 0;
let hash_key_combine_type dxf_hk = allocate_with_defaults();
//These parameters are only added to get count of values.

let decimal ("") insert_record_count=0;
let decimal("") update_record_count=0;
let decimal("") same_record_count=0;
let decimal("") total_record_count=0;
let decimal("") supressed_update_record_count=0;
out :: reformat(in) = 
begin\\n' + 
lkp_split_stmts + 
'
\\n  
        same_record_count =  same_record_count;
        insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        total_record_count =total_record_count +1;
  out.flag :: v_flag;
  out.dxf_sk :: dxf_sk; 
  out.* ::  in.*;
end
out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count , 
                                   ";SUPRESSED_UPDATE_RECORD_COUNT = ", supressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end; 
'
else if((TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "placeholder")) 
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;

let lookup_identifier_type current_lookup = lookup_not_loaded();
let xref_lookup_type icff_lkp_rec = allocate_with_defaults();
let decimal("") v_flag = -1;
let decimal("") dxf_sk = -1;
let decimal("") lkp_cnt = 0;
let hash_key_combine_type dxf_hk = allocate_with_defaults();
//These parameters are only added to get count of values.

let decimal ("") insert_record_count=0;
let decimal("") update_record_count=0;
let decimal("") same_record_count=0;
let decimal("") total_record_count=0;
let decimal("") supressed_update_record_count=0;
out :: reformat(in) = 
begin\\n' + 
lkp_plchldr_stmts + 
'
\\n
        same_record_count =  same_record_count;
        insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        total_record_count =total_record_count +1;
  out.flag :: v_flag;
  out.dxf_sk :: dxf_sk; 
  out.* ::  in.*;
end

/*
out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count , 
                                   ";SUPRESSED_UPDATE_RECORD_COUNT = ", supressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end; */
'
else '';

end
]|8|9|K|@{0|}}
{30001002|XXparameter|DXF_SK_XFR|$[ if ( DATASET_IDENTIFIER == "many" && is_blank(FACT_DATA_PARTITION_KEY))
         'let decimal(8) etl_partition_date = (decimal(8)) (date("YYYYMMDD")) now();
out :: reformat(in) =
         begin
          out.* :: in.*;
          out.dxf_sk :: etl_partition_date ;
        end; '
   else if (DATASET_IDENTIFIER == "many")
     'out :: reformat(in) =
        begin
          out.* :: in.*;
          out.dxf_sk :: in.' + FACT_DATA_PARTITION_KEY + ' ;
        end; '

   else 
  
'let decimal("") max_sk=' +  MAX_SK_VALUE  +';
        out :: reformat(in) =
        begin
          out.* :: in.*;
          out.dxf_sk :: max_sk + ((next_in_sequence() )* number_of_partitions()) + this_partition() ;
        end;'
]|3|9|K|This will be xfr value for dxf_sk column generation|{0|}}
{30001002|XXparameter|FACT_MULTI_ICFF_XFR|$[ if ( DATASET_IDENTIFIER == "many" &&  is_blank(FACT_DATA_PARTITION_KEY))

' /*extract filename from input record*/
//Initailize a dummy value for validation of filename expression 
//Assuming a col. dxf_src_sys_id
let string(8) v_fact_data_partition_key= string_substring("' + RUN_ID + '",1,8);
        filename::get_filename(in)=
        begin 
                     filename:: ' +  ' "mfile:'  + IDS_DATA_PATH + '/' + TARGET_ENTITY + '."'  +  ' +  v_fact_data_partition_key  + ' + '".dat.gz"; ' 
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
else if ( DATASET_IDENTIFIER == "many" &&  ! is_blank(FACT_DATA_PARTITION_KEY))
  
        ' /*extract filename from input record*/
        //Initailize a dummy value for validation of filename expression 
        //Assuming a col. dxf_src_sys_id
                filename::get_filename(in)=
        begin 
                     filename:: ' +  ' "mfile:'  + IDS_DATA_PATH + '/' + TARGET_ENTITY + '."  + (string(8)) (date("YYYYMMDD")) in.'  + FACT_DATA_PARTITION_KEY + ' +  ".dat.gz"; ' 
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
else " NO Use"  
]|3|9|K|Resolving XFR at PDL for MUlti ICFF compute block component |{0|}}
{30001002|XXparameter|IDS_DS_ARCHIVE_FILTER_EXPR||3|9|FK|This is used in icff maintenance to create target |{0|}}
{30001002|XXparameter|COUNT_LOG_FL|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|COUNT_LOG_FL:eme|$[string_concat(PUB_DATAHUB_SERIAL_LOG,"/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".",\{RUN_ID\},".dat")]|3|9||@{0|}}
{30001002|XXparameter|COUNT_LOG_FL:sandbox|$[string_concat(PUB_DATAHUB_SERIAL_LOG,"/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".",RUN_ID,".dat")]|3|9||@{0|}}
{30001002|XXparameter|SRC_RANK_OVERRIDE_FILE|$[""]|3|9|FK|@{0|}}
{30001002|XXparameter|SRC_ENVRT_ID_DATA_OVERRIDDEN|$[begin
  let string("\\x01")[] file_lines = string_split_no_empty(read_file(PUB_DXF_META + "/lookup.src_envrt_id.txt"), "\\n");
  let ids_src_envrt_lookup_type[] recs = for(let line in file_lines): reinterpret(line);
  let string("\\x01")[] overrides_lines = if(SRC_RANK_OVERRIDE_FILE == "") [vector] else string_split_no_empty(read_file(SRC_RANK_OVERRIDE_FILE), "\\n");
  let record string("\|") source; decimal("\\x01") rank; end[] overrides = for(let line in overrides_lines): reinterpret(line);

  for(let i, i < length_of(recs))
  begin
    let ind = vector_search(overrides, [record source recs[i].src_env_nm rank -1], \{source\});
    if(ind != -1)
      recs[i].src_env_rnk = overrides[ind].rank;
    recs[i].newline = "\\n"; // newline is getting set to \\001, and if string is appended with newline then reinterpret fails, so hardcode it
  end

  result :: recs;
end]|3|9|RK|@{0|}}
{30001002|XXparameter|ACE_SRC_RANKINGS_OVERRIDDEN|$[
  if(AB_APPCONF_EXECUTION)
    string_join(for(let entry in vector_sort(SRC_ENVRT_ID_DATA_OVERRIDDEN, \{src_env_rnk\})): entry.src_env_nm, "\\n")
  else
    ""
]|3|9|K|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
}}@0|@0|0|0|0|0|0|0|d_cag_xref_updt|gkudte|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1536000|809000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{2|1|1|}Job 'd_cag_xref_updt' Execution Status Report

Job completed successfully at Wednesday, January 31, 2024 13:45:57
Run performed by user gkudte
||||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Optum-QA||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|5|0|9|0|{@{}@0|.5|.5|{0|}122|2065|}}
{2010210004|XXGflow|6|0|11|0|{@{}@0|.5|.5|{0|}37|17|}}
{2010210004|XXGflow|7|0|13|0|{@{}@0|.5|.5|{0|}39|17|}}
{2010503005|XXGfvertex|8|0|15|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_INPUT_LOOKUP_FILE|3|2|$|@{0|}}
}}@0|Input File|65000|270000|0|0|0|0|123|IDS|Ab Initio Software|@1|50000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|9|0|17|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|10|0|20|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|11|0|22|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|12|0|25|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@448000|251000|0|0|481000|303000|38|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|13|0|27|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|14|0|29|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|15|0|31|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|16|0|34|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|17|0|38|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|18|0|40|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|19|0|42|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|20|0|47|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|21|0|51|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|22|0|55|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|23|0|57|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|24|0|59|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|25|0|61|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|26|0|64|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|27|0|66|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|28|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|29|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|30|0|76|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|31|0|78|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|32|0|80|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|33|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|34|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|35|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|36|0|94|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|37|0|97|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|38|0|102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|/*Reformat operation*/
out::reformat(in)=
begin
out.*::in.*;
  out.dxf_sk :: if(in.dxf_hk_part1 == 5372287528105672704 and in.dxf_hk_part2 == 3961942297491883014 and in.dxf_sk == 30712852) 30714390 else in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|241000|260000|0|0|0|0|34|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|39|0|104|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|40|0|107|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|109|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|42|0|111|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|43|0|113|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|44|0|116|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indexes_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|45|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|46|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|47|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|48|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|50|0|138|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
}}@0|@743000|237500|0|0|0|0|121|Write Xref files|Mukesh Singh|Created 5/4/2016 8:35:29 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|972000|480000|3|}}
{2010240003|XXGlegend|51|0|140|0|{@{}@This kind of Xref will be created for very
 large dimension and FACT datasets|461000|28000|0|0|0|0|10705|}}
{2010242002|XXGface|52|0|142|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|53|0|144|0|{@{}@This kind of Xref will be created for small to medium 
 sized dimensions|451000|408000|0|0|0|0|10706|}}
{2010242002|XXGface|54|0|146|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|55|0|148|0|{@{}@384|.5|.5|{0|}10774|529|}}
{2010210004|XXGflow|56|0|150|0|{@{}@384|.5|.5|{0|}10784|17|}}
{2010210004|XXGflow|57|0|152|0|{@{}@384|.5|.5|{0|}10834|17|}}
{2010210004|XXGflow|58|0|154|0|{@{}@384|.5|.5|{0|}10836|17|}}
{2010501005|XXGpvertex|59|0|156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|438000|211500|0|0|0|0|10830|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|60|0|158|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|61|0|162|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|62|0|165|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|63|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|64|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|65|0|174|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|81000|176500|0|0|0|0|10832|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|66|0|176|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|67|0|179|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|68|0|181|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|69|0|183|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|70|0|185|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|71|0|187|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indexes_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|72|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|73|0|193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|74|0|196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|75|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|76|0|202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|210|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|306000|215000|0|0|0|0|10833|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||4097|1|{1|0|}}}
{2010203004|XXGoport|78|0|212|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|79|0|215|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|80|0|218|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|81|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|82|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|83|0|229|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@589000|70000|0|0|0|0|10835|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32833|{0|}0|0|{0|}{0|}{0|}{0|}1.0|631000|309000|3|}}
{2010210004|XXGflow|84|0|231|0|{@{}@384|.5|.5|{0|}10615|2065|}}
{2010210004|XXGflow|85|0|233|0|{@{}@384|.5|.5|{0|}10622|17|}}
{2010210004|XXGflow|86|0|235|0|{@{}@384|.5|.5|{0|}10623|17|}}
{2010503005|XXGfvertex|87|0|237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@1|Output File|514000|85000|0|0|0|0|10617|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|88|0|239|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|89|0|242|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|90|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|91|0|247|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|$ICFF_BLOCK_SIZE|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|$ICFF_COMPRESSION_LEVEL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Block-Compressed Lookup|45000|100000|0|0|0|0|10624|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|92|0|249|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|93|0|252|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|94|0|255|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|95|0|257|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|96|0|259|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|97|0|261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|98|0|264|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|99|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|100|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|101|0|273|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|Intermediate File|354000|85000|0|0|0|0|10620|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|102|0|275|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|103|0|278|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|104|0|281|0|{Represents one file, many files, or a multifile of intermediate results that your graph writes and saves for review.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0063|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Intermediate File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|105|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|106|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|107|0|292|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|Output File|354000|220000|0|0|0|0|10621|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|108|0|294|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|109|0|297|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|110|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|111|0|303|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|112|0|307|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="N" && DATASET_IDENTIFIER != "many" ]|3|9|F||{0|}}
}}@0|@597500|267000|0|0|0|0|10837|Write Non ICFF Xref LookUp|Mukesh Singh|Created 6/22/2016 2:01:24 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1466000|451000|3|}}
{2010240003|XXGlegend|113|0|309|0|{@{}@This type of xref is created only for 
dimensions that has less than 10m record

Write index do not support idx append , everytime a new index file has to be created|18000|36000|0|0|0|0|10783|}}
{2010242002|XXGface|114|0|311|0|{@{}@Arial|32768|100|1|}}
{2010210004|XXGflow|115|0|313|0|{@{}@384|.5|.5|{0|}10963|529|}}
{2010210004|XXGflow|116|0|315|0|{@{}@384|.5|.5|{0|}10965|17|}}
{2010210004|XXGflow|117|0|317|0|{@{}@384|.5|.5|{0|}10961|17|}}
{2010501005|XXGpvertex|118|0|319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.dxf_hk.dxf_hk_part1 :: in.dxf_hk_part1;
  out.dxf_hk.dxf_hk_part2 :: in.dxf_hk_part2;
  out.dxf_sk :: in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Reformat|100000|175000|0|0|0|0|10964|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|119|0|321|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|120|0|324|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|121|0|326|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|122|0|328|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|123|0|330|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|124|0|332|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|output_indexes_signature|int[int] output_indexes_out::output_indexes(in)|3|2|H$|Function returning vector of indexes of output ports|{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|legacy_xfr;reject*=in;out*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|7|2|Ff$||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|125|0|334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|126|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|127|0|341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|128|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|129|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|130|0|352|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@1|Write Lookup|601000|90000|0|0|0|0|11035|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|131|0|354|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|132|0|356|0|{@{}@384|.5|.5|{0|}11033|17|}}
{2010203004|XXGoport|133|0|358|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010210004|XXGflow|134|0|360|0|{@{}@384|.5|.5|{0|}11034|17|}}
{2010202004|XXGiport|135|0|362|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|136|0|364|0|{@{}@384|.5|.5|{0|}11032|17|}}
{2010501005|XXGpvertex|137|0|366|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of indexes|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|key0||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|138|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|139|0|371|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|140|0|375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|141|0|378|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|Output File|855000|220000|0|0|0|0|11031|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|142|0|380|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|143|0|383|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|144|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|145|0|391|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|327000|195000|0|0|0|0|10958|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|146|0|393|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|147|0|397|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|148|0|400|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|149|0|402|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|150|0|405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|151|0|411|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="MPP"]|3|9|F||{0|}}
}}@0|@623500|62500|0|0|0|0|10966|for MPP Server Architecture|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|912000|427000|3|}}
{2010240003|XXGlegend|152|0|413|0|{@{}@This file will only read one partition of data , since every partion 
will have same data due to usage of brodcast while creating main data file|16000|340000|0|0|0|0|10889|}}
{2010242002|XXGface|153|0|415|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|154|0|417|0|{@{}@384|.5|.5|{0|}10867|1041|}}
{2010210004|XXGflow|155|0|419|0|{@{}@384|.5|.5|{0|}10900|17|}}
{2010210004|XXGflow|156|0|421|0|{@{}@384|.5|.5|{0|}10973|17|}}
{2010210004|XXGflow|157|0|423|0|{@{}@384|.5|.5|{0|}10970|17|}}
{2010210004|XXGflow|158|0|425|0|{@{}@384|.5|.5|{0|}10968|17|}}
{2010210004|XXGflow|159|0|427|0|{@{}@384|.5|.5|{0|}10899|17|}}
{2010210004|XXGflow|160|0|429|0|{@{}@384|.5|.5|{0|}10964|20|}}
{2010210004|XXGflow|161|0|431|0|{@{}@384|.5|.5|{0|}10974|1044|}}
{2010501005|XXGpvertex|162|0|433|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|470000|115000|0|0|0|0|10954|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|163|0|435|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|164|0|438|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|165|0|441|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|166|0|443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|167|0|446|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|168|0|450|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@1|Write Lookup|586000|85000|0|0|0|0|10967|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||36865|1|{1|0|}}}
{2010203004|XXGoport|169|0|452|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|170|0|455|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|171|0|458|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|461|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of indexes|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|key0||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|173|0|463|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|174|0|466|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|175|0|470|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|176|0|473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|Output File|795000|190000|0|0|0|0|10969|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|177|0|475|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|178|0|478|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|179|0|480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|180|0|486|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Concatenate|245000|115000|0|0|0|0|10955|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|181|0|488|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|182|0|491|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|183|0|495|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|184|0|497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|186|0|506|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|215000|250000|0|0|0|0|10975|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|187|0|508|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|188|0|511|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|189|0|514|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|190|0|516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|191|0|519|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|192|0|525|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[XREF_FILE_EXIST]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_INPUT_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INPUT_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|Input File|56000|240000|0|0|0|0|10972|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|193|0|527|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|194|0|530|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|195|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|196|0|536|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|98000|106500|0|0|0|0|10959|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|197|0|538|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|198|0|541|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|199|0|543|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|200|0|545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|201|0|548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|202|0|554|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|321000|92500|0|0|0|0|10960|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|203|0|556|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|204|0|559|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|205|0|562|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|206|0|564|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|207|0|567|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|208|0|574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|Output File|791000|85000|0|0|0|0|10971|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|209|0|576|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|210|0|579|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|211|0|581|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|212|0|586|0|{@{}@0|0|0|0|in0|.49848024316109424|@@@13840|0|}}
{2010600005|XXGgraph|213|0|590|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="SMP"]|3|9|F||{0|}}
}}@0|@628500|237500|0|0|0|0|10962|for SMP Server Architecture|Mukesh Singh|Created 6/24/2016 3:07:05 PM|1|100|-1|@9|@34881|{0|}0|0|{0|}{0|}{0|}{0|}1.0|955000|351000|3|}}
{2010210004|XXGflow|214|0|592|0|{@{}@384|.5|.5|{0|}10996|17|}}
{2010210004|XXGflow|215|0|594|0|{@{}@384|.5|.5|{0|}10998|17|}}
{2010210004|XXGflow|216|0|596|0|{@{}@384|.5|.5|{0|}11000|19|}}
{2010210004|XXGflow|217|0|601|0|{@{}@384|.5|.5|{0|}10999|18|}}
{2010501005|XXGpvertex|218|0|603|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|450000|115000|0|0|0|0|11023|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|219|0|605|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|220|0|608|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|221|0|611|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|222|0|613|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|223|0|616|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|224|0|622|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|202000|260000|0|0|0|0|11024|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|225|0|624|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|226|0|627|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|630|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|roundrobin-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|block_size|1|1|2|RFO$|Number of records before switching to the next port|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|228|0|632|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|229|0|635|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|230|0|638|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|Input File|56000|250000|0|0|0|0|11025|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|231|0|640|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|232|0|643|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Input File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|233|0|645|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|234|0|652|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|79000|87500|0|0|0|0|11027|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|235|0|654|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|236|0|657|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|237|0|659|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|238|0|661|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|239|0|664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|240|0|670|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|266000|92500|0|0|0|0|11028|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|241|0|672|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|242|0|675|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|243|0|679|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Sort|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|244|0|681|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|245|0|684|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|246|0|691|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|Output File|846000|90000|0|0|0|0|11030|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|247|0|693|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|248|0|696|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0062|1|2|FH$|modes of access|{0|}}
{30001002|XXparameter|translate_format|False|13|1|Fl|If true, translate the file format.|{0|}}
{30001002|XXparameter|translate_format.condition|version 4.0.0.r1.0:|3|15|P?|@{0|}}
{30001002|XXparameter|format|uninterpreted|15|1|FKl|'uninterpreted' (raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoopy_condition|value format uninterpreted False value format * True default constant False|13|13|Hv|Hidden condition for deciding hadoop-codec visibility|{0|}}
{30001002|XXparameter|hadoopy_condition.condition|param_exact translate_format True|3|15|P?|@{0|}}
{30001002|XXparameter|hadoop_codec|Uncompressed|15|1|FKl|Compression for writing hadoop specific file format. orc=\{ZLIB,SNAPPY,LZO\}, parquet=\{GZIP,SNAPPY,LZO\}, seqfile=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4,LZO\}, avro=\{SNAPPY,Deflate,BZIP2\}, texttable=\{GZIP,SNAPPY,Deflate,BZIP2,LZ4\}|{8|Uncompressed|GZIP|SNAPPY|Deflate|BZIP2|ZLIB|LZ4|LZO|}}
{30001002|XXparameter|hadoop_codec.display_name|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.keyword|hadoop-codec|3|9|P|@{0|}}
{30001002|XXparameter|hadoop_codec.condition|param_exact hadoopy_condition True param_exact translate_format True|3|15|P?|@{0|}}
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
{30001002|XXparameter|Layout||28|9|RF||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Output File|0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|249|0|698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|250|0|703|0|{@{}@0|0|0|0|in0|.39886039886039887|@@@13840|0|}}
{2010202004|XXGiport|251|0|707|0|{@{}@0|0|0|0|in0|.56282722513089|@@@13840|0|}}
{2010202004|XXGiport|252|0|711|0|{@{}@0|0|0|0|in0|.5318181818181819|@@@13840|0|}}
{2010110002|XXGconstant|253|0|715|0|{@{}@{1|3161896|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010604001|XXGgraph_flow_flow|4|0|8|0|{Flow_1|}1|5|}
{2010604001|XXGgraph_flow_flow|5|0|10|0|{Flow_2|}1|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_3|}1|7|}
{2010601001|XXGgraph_vertex_vertex|7|0|14|0|{IDS|}1|8|}
{2010212001|XXGvertex_oport_oport|8|0|16|0|{0|read|}8|9|}
{2010213001|XXGoport_dst_flow|9|0|18|0|{0|}9|5|}
{2010007001|XXGobject_proto_object|10|0|19|0|{}8|10|}
{2010212001|XXGvertex_oport_oport|11|0|21|0|{0|read|}10|11|}
{2010006001|XXGobject_psameas_object|12|0|23|0|{metadata|read_metadata|1|0|}11|10|}
{2010601001|XXGgraph_vertex_vertex|13|0|24|0|{PBKS_ICFF_KEY_|}1|12|}
{2010604001|XXGgraph_flow_flow|14|0|26|0|{Flow_1|}12|13|}
{2010601001|XXGgraph_vertex_vertex|15|0|28|0|{Partition_by_Key|}12|14|}
{2010212001|XXGvertex_oport_oport|16|0|30|0|{0|out|}14|15|}
{2010213001|XXGoport_dst_flow|17|0|32|0|{0|}15|13|}
{2010211001|XXGvertex_iport_iport|18|0|33|0|{0|in|}14|16|}
{2010006001|XXGobject_psameas_object|19|0|35|0|{in_metadata|read_metadata|0|0|}14|8|}
{2010006001|XXGobject_psameas_object|20|0|36|0|{out_metadata|read_metadata|0|0|}14|8|}
{2010601001|XXGgraph_vertex_vertex|21|0|37|0|{Sort|}12|17|}
{2010212001|XXGvertex_oport_oport|22|0|39|0|{0|out|}17|18|}
{2010211001|XXGvertex_iport_iport|23|0|41|0|{0|in|}17|19|}
{2010214001|XXGiport_src_flow|24|0|43|0|{0|}19|13|}
{2010006001|XXGobject_psameas_object|25|0|44|0|{in_metadata|read_metadata|0|0|}17|8|}
{2010006001|XXGobject_psameas_object|26|0|45|0|{out_metadata|read_metadata|0|0|}17|8|}
{2010212001|XXGvertex_oport_oport|27|0|46|0|{0|out0|}12|20|}
{2010216002|XXGoport_binding_oport|28|0|48|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}20|18|}
{2010213001|XXGoport_dst_flow|29|0|49|0|{0|}20|7|}
{2010211001|XXGvertex_iport_iport|30|0|50|0|{0|in0|}12|21|}
{2010215002|XXGiport_binding_iport|31|0|52|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}21|16|}
{2010214001|XXGiport_src_flow|32|0|53|0|{0|}21|6|}
{2010007001|XXGobject_proto_object|33|0|54|0|{}12|22|}
{2010604001|XXGgraph_flow_flow|34|0|56|0|{Flow_1|}22|23|}
{2010601001|XXGgraph_vertex_vertex|35|0|58|0|{Partition_by_Key|}22|24|}
{2010212001|XXGvertex_oport_oport|36|0|60|0|{0|out|}24|25|}
{2010213001|XXGoport_dst_flow|37|0|62|0|{0|}25|23|}
{2010211001|XXGvertex_iport_iport|38|0|63|0|{0|in|}24|26|}
{2010007001|XXGobject_proto_object|39|0|65|0|{}24|27|}
{2010212001|XXGvertex_oport_oport|40|0|67|0|{0|out|}27|28|}
{2010006001|XXGobject_psameas_object|41|0|69|0|{metadata|out_metadata|1|0|}28|27|}
{2010211001|XXGvertex_iport_iport|42|0|70|0|{0|in|}27|29|}
{2010006001|XXGobject_psameas_object|43|0|72|0|{metadata|in_metadata|1|0|}29|27|}
{2010006001|XXGobject_psameas_object|44|0|73|0|{Layout|InputLayout|1|0|}24|22|}
{2010006001|XXGobject_psameas_object|45|0|74|0|{key|Key|1|0|}24|22|}
{2010601001|XXGgraph_vertex_vertex|46|0|75|0|{Sort|}22|30|}
{2010212001|XXGvertex_oport_oport|47|0|77|0|{0|out|}30|31|}
{2010211001|XXGvertex_iport_iport|48|0|79|0|{0|in|}30|32|}
{2010214001|XXGiport_src_flow|49|0|81|0|{0|}32|23|}
{2010007001|XXGobject_proto_object|50|0|82|0|{}30|33|}
{2010212001|XXGvertex_oport_oport|51|0|84|0|{0|out|}33|34|}
{2010006001|XXGobject_psameas_object|52|0|86|0|{metadata|out_metadata|1|0|}34|33|}
{2010211001|XXGvertex_iport_iport|53|0|87|0|{0|in|}33|35|}
{2010006001|XXGobject_psameas_object|54|0|89|0|{metadata|in_metadata|1|0|}35|33|}
{2010006001|XXGobject_psameas_object|55|0|90|0|{Layout|OutputLayout|1|0|}30|22|}
{2010006001|XXGobject_psameas_object|56|0|91|0|{key|Key|1|0|}30|22|}
{2010006001|XXGobject_psameas_object|57|0|92|0|{max_core|Max_core|1|0|}30|22|}
{2010212001|XXGvertex_oport_oport|58|0|93|0|{0|out0|}22|36|}
{2010216002|XXGoport_binding_oport|59|0|95|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}36|31|}
{2010211001|XXGvertex_iport_iport|60|0|96|0|{0|in0|}22|37|}
{2010215002|XXGiport_binding_iport|61|0|98|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}37|26|}
{2010006001|XXGobject_psameas_object|62|0|99|0|{InputLayout|Layout|0|0|}12|8|}
{2010006001|XXGobject_psameas_object|63|0|100|0|{OutputLayout|Layout|0|0|}12|8|}
{2010601001|XXGgraph_vertex_vertex|64|0|101|0|{Reformat|}1|38|}
{2010212001|XXGvertex_oport_oport|65|0|103|0|{0|out0|}38|39|}
{2010213001|XXGoport_dst_flow|66|0|105|0|{0|}39|6|}
{2010212001|XXGvertex_oport_oport|67|0|106|0|{1|reject0|}38|40|}
{2010212001|XXGvertex_oport_oport|68|0|108|0|{2|error0|}38|41|}
{2010212001|XXGvertex_oport_oport|69|0|110|0|{3|log|}38|42|}
{2010211001|XXGvertex_iport_iport|70|0|112|0|{0|in|}38|43|}
{2010214001|XXGiport_src_flow|71|0|114|0|{0|}43|5|}
{2010007001|XXGobject_proto_object|72|0|115|0|{}38|44|}
{2010212001|XXGvertex_oport_oport|73|0|117|0|{0|out0|}44|45|}
{2010006001|XXGobject_psameas_object|74|0|119|0|{metadata|out0_metadata|1|0|}45|44|}
{2010006001|XXGobject_psameas_object|75|0|120|0|{transform0|transform0|1|0|}45|44|}
{2010212001|XXGvertex_oport_oport|76|0|121|0|{1|reject0|}44|46|}
{2010006001|XXGobject_psameas_object|77|0|123|0|{metadata|reject0_metadata|1|0|}46|44|}
{2010212001|XXGvertex_oport_oport|78|0|124|0|{2|error0|}44|47|}
{2010006001|XXGobject_psameas_object|79|0|126|0|{metadata|error0_metadata|1|0|}47|44|}
{2010212001|XXGvertex_oport_oport|80|0|127|0|{3|log|}44|48|}
{2010006001|XXGobject_psameas_object|81|0|129|0|{metadata|log_metadata|1|0|}48|44|}
{2010211001|XXGvertex_iport_iport|82|0|130|0|{0|in|}44|49|}
{2010006001|XXGobject_psameas_object|83|0|132|0|{metadata|in_metadata|1|0|}49|44|}
{2010006001|XXGobject_psameas_object|84|0|133|0|{Layout|Layout|0|0|}38|8|}
{2010006001|XXGobject_psameas_object|85|0|134|0|{in_metadata|read_metadata|0|0|}38|8|}
{2010006001|XXGobject_psameas_object|86|0|135|0|{out0_metadata|read_metadata|0|0|}38|8|}
{2010006001|XXGobject_psameas_object|87|0|136|0|{reject0_metadata|read_metadata|0|0|}38|8|}
{2010601001|XXGgraph_vertex_vertex|88|0|137|0|{Write_Xref_files|}1|50|}
{2010605001|XXGgraph_legend_legend|89|0|139|0|{0|}50|51|}
{2010241001|XXGlegend_face_face|90|0|141|0|{}51|52|}
{2010605001|XXGgraph_legend_legend|91|0|143|0|{1|}50|53|}
{2010241001|XXGlegend_face_face|92|0|145|0|{}53|54|}
{2010604001|XXGgraph_flow_flow|93|0|147|0|{Flow_1|}50|55|}
{2010604001|XXGgraph_flow_flow|94|0|149|0|{Flow_2|}50|56|}
{2010604001|XXGgraph_flow_flow|95|0|151|0|{Flow_3|}50|57|}
{2010604001|XXGgraph_flow_flow|96|0|153|0|{Flow_4|}50|58|}
{2010601001|XXGgraph_vertex_vertex|97|0|155|0|{Dummy_Replicate|}50|59|}
{2010212001|XXGvertex_oport_oport|98|0|157|0|{0|out|}59|60|}
{2010213001|XXGoport_dst_flow|99|0|159|0|{0|}60|57|}
{2010213001|XXGoport_dst_flow|100|0|160|0|{1|}60|58|}
{2010211001|XXGvertex_iport_iport|101|0|161|0|{0|in|}59|61|}
{2010214001|XXGiport_src_flow|102|0|163|0|{0|}61|55|}
{2010007001|XXGobject_proto_object|103|0|164|0|{}59|62|}
{2010212001|XXGvertex_oport_oport|104|0|166|0|{0|out|}62|63|}
{2010006001|XXGobject_psameas_object|105|0|168|0|{metadata|out_metadata|1|0|}63|62|}
{2010211001|XXGvertex_iport_iport|106|0|169|0|{0|in|}62|64|}
{2010006001|XXGobject_psameas_object|107|0|171|0|{metadata|in_metadata|1|0|}64|62|}
{2010006001|XXGobject_psameas_object|108|0|172|0|{Layout|Layout|0|0|}59|8|}
{2010006001|XXGobject_psameas_object|109|0|173|0|{in_metadata|out0_metadata|0|0|}59|65|}
{2010212001|XXGvertex_oport_oport|110|0|175|0|{0|out0|}65|66|}
{2010213001|XXGoport_dst_flow|111|0|177|0|{0|}66|56|}
{2010212001|XXGvertex_oport_oport|112|0|178|0|{1|reject0|}65|67|}
{2010212001|XXGvertex_oport_oport|113|0|180|0|{2|error0|}65|68|}
{2010212001|XXGvertex_oport_oport|114|0|182|0|{3|log|}65|69|}
{2010211001|XXGvertex_iport_iport|115|0|184|0|{0|in|}65|70|}
{2010007001|XXGobject_proto_object|116|0|186|0|{}65|71|}
{2010212001|XXGvertex_oport_oport|117|0|188|0|{0|out0|}71|72|}
{2010006001|XXGobject_psameas_object|118|0|190|0|{metadata|out0_metadata|1|0|}72|71|}
{2010006001|XXGobject_psameas_object|119|0|191|0|{transform0|transform0|1|0|}72|71|}
{2010212001|XXGvertex_oport_oport|120|0|192|0|{1|reject0|}71|73|}
{2010006001|XXGobject_psameas_object|121|0|194|0|{metadata|reject0_metadata|1|0|}73|71|}
{2010212001|XXGvertex_oport_oport|122|0|195|0|{2|error0|}71|74|}
{2010006001|XXGobject_psameas_object|123|0|197|0|{metadata|error0_metadata|1|0|}74|71|}
{2010212001|XXGvertex_oport_oport|124|0|198|0|{3|log|}71|75|}
{2010006001|XXGobject_psameas_object|125|0|200|0|{metadata|log_metadata|1|0|}75|71|}
{2010211001|XXGvertex_iport_iport|126|0|201|0|{0|in|}71|76|}
{2010006001|XXGobject_psameas_object|127|0|203|0|{metadata|in_metadata|1|0|}76|71|}
{2010006001|XXGobject_psameas_object|128|0|204|0|{Layout|Layout|0|0|}65|8|}
{2010006001|XXGobject_psameas_object|129|0|205|0|{in_metadata|read_metadata|0|0|}65|8|}
{2010006001|XXGobject_psameas_object|130|0|206|0|{reject0_metadata|read_metadata|0|0|}65|8|}
{2010006001|XXGobject_psameas_object|131|0|207|0|{out_metadata|out0_metadata|0|0|}59|65|}
{2010601001|XXGgraph_vertex_vertex|132|0|208|0|{RFMT_Drop_columns|}50|65|}
{2010601001|XXGgraph_vertex_vertex|133|0|209|0|{Replicate|}50|77|}
{2010212001|XXGvertex_oport_oport|134|0|211|0|{0|out|}77|78|}
{2010213001|XXGoport_dst_flow|135|0|213|0|{0|}78|55|}
{2010211001|XXGvertex_iport_iport|136|0|214|0|{0|in|}77|79|}
{2010214001|XXGiport_src_flow|137|0|216|0|{0|}79|56|}
{2010007001|XXGobject_proto_object|138|0|217|0|{}77|80|}
{2010212001|XXGvertex_oport_oport|139|0|219|0|{0|out|}80|81|}
{2010006001|XXGobject_psameas_object|140|0|221|0|{metadata|out_metadata|1|0|}81|80|}
{2010211001|XXGvertex_iport_iport|141|0|222|0|{0|in|}80|82|}
{2010006001|XXGobject_psameas_object|142|0|224|0|{metadata|in_metadata|1|0|}82|80|}
{2010006001|XXGobject_psameas_object|143|0|225|0|{Layout|Layout|0|0|}77|8|}
{2010006001|XXGobject_psameas_object|144|0|226|0|{in_metadata|out0_metadata|0|0|}77|65|}
{2010006001|XXGobject_psameas_object|145|0|227|0|{out_metadata|out0_metadata|0|0|}77|65|}
{2010601001|XXGgraph_vertex_vertex|146|0|228|0|{Write_Multifile_Xref_ICFF_LookUp|}50|83|}
{2010604001|XXGgraph_flow_flow|147|0|230|0|{Flow_2|}83|84|}
{2010604001|XXGgraph_flow_flow|148|0|232|0|{Flow_6|}83|85|}
{2010604001|XXGgraph_flow_flow|149|0|234|0|{Flow_7|}83|86|}
{2010601001|XXGgraph_vertex_vertex|150|0|236|0|{View_Data|}83|87|}
{2010211001|XXGvertex_iport_iport|151|0|238|0|{0|write|}87|88|}
{2010214001|XXGiport_src_flow|152|0|240|0|{0|}88|84|}
{2010007001|XXGobject_proto_object|153|0|241|0|{}87|89|}
{2010211001|XXGvertex_iport_iport|154|0|243|0|{0|write|}89|90|}
{2010006001|XXGobject_psameas_object|155|0|245|0|{metadata|write_metadata|1|0|}90|89|}
{2010601001|XXGgraph_vertex_vertex|156|0|246|0|{Write_Block_Compressed_Lookup|}83|91|}
{2010212001|XXGvertex_oport_oport|157|0|248|0|{0|out|}91|92|}
{2010213001|XXGoport_dst_flow|158|0|250|0|{0|}92|85|}
{2010212001|XXGvertex_oport_oport|159|0|251|0|{1|index|}91|93|}
{2010213001|XXGoport_dst_flow|160|0|253|0|{0|}93|86|}
{2010212001|XXGvertex_oport_oport|161|0|254|0|{2|address|}91|94|}
{2010211001|XXGvertex_iport_iport|162|0|256|0|{0|in|}91|95|}
{2010007001|XXGobject_proto_object|163|0|258|0|{}91|96|}
{2010212001|XXGvertex_oport_oport|164|0|260|0|{0|out|}96|97|}
{2010006001|XXGobject_psameas_object|165|0|262|0|{metadata|out_metadata|1|0|}97|96|}
{2010212001|XXGvertex_oport_oport|166|0|263|0|{1|index|}96|98|}
{2010006001|XXGobject_psameas_object|167|0|265|0|{metadata|index_metadata|1|0|}98|96|}
{2010212001|XXGvertex_oport_oport|168|0|266|0|{2|address|}96|99|}
{2010006001|XXGobject_psameas_object|169|0|268|0|{metadata|address_metadata|1|0|}99|96|}
{2010211001|XXGvertex_iport_iport|170|0|269|0|{0|in|}96|100|}
{2010006001|XXGobject_psameas_object|171|0|271|0|{metadata|in_metadata|1|0|}100|96|}
{2010006001|XXGobject_psameas_object|172|0|272|0|{Layout|Layout|0|0|}91|101|}
{2010212001|XXGvertex_oport_oport|173|0|274|0|{0|read|}101|102|}
{2010213001|XXGoport_dst_flow|174|0|276|0|{0|}102|84|}
{2010211001|XXGvertex_iport_iport|175|0|277|0|{0|write|}101|103|}
{2010214001|XXGiport_src_flow|176|0|279|0|{0|}103|85|}
{2010007001|XXGobject_proto_object|177|0|280|0|{}101|104|}
{2010212001|XXGvertex_oport_oport|178|0|282|0|{0|read|}104|105|}
{2010006001|XXGobject_psameas_object|179|0|284|0|{metadata|read_metadata|1|0|}105|104|}
{2010211001|XXGvertex_iport_iport|180|0|285|0|{0|write|}104|106|}
{2010006001|XXGobject_psameas_object|181|0|287|0|{metadata|write_metadata|1|0|}106|104|}
{2010006001|XXGobject_psameas_object|182|0|288|0|{in_metadata|out0_metadata|0|0|}91|65|}
{2010006001|XXGobject_psameas_object|183|0|289|0|{out_metadata|write_metadata|0|0|}91|101|}
{2010601001|XXGgraph_vertex_vertex|184|0|290|0|{Xref_ICFF_Data_File|}83|101|}
{2010601001|XXGgraph_vertex_vertex|185|0|291|0|{Xref_ICFF_Index_File|}83|107|}
{2010211001|XXGvertex_iport_iport|186|0|293|0|{0|write|}107|108|}
{2010214001|XXGiport_src_flow|187|0|295|0|{0|}108|86|}
{2010007001|XXGobject_proto_object|188|0|296|0|{}107|109|}
{2010211001|XXGvertex_iport_iport|189|0|298|0|{0|write|}109|110|}
{2010006001|XXGobject_psameas_object|190|0|300|0|{metadata|write_metadata|1|0|}110|109|}
{2010006001|XXGobject_psameas_object|191|0|301|0|{write_metadata|index_metadata|0|0|}107|91|}
{2010211001|XXGvertex_iport_iport|192|0|302|0|{0|in0|}83|111|}
{2010215002|XXGiport_binding_iport|193|0|304|0|{.5|.5|{0|}10618|}111|95|}
{2010214001|XXGiport_src_flow|194|0|305|0|{0|}111|57|}
{2010601001|XXGgraph_vertex_vertex|195|0|306|0|{Write_Non_ICFF_Xref_LookUp|}50|112|}
{2010605001|XXGgraph_legend_legend|196|0|308|0|{0|}112|113|}
{2010241001|XXGlegend_face_face|197|0|310|0|{}113|114|}
{2010604001|XXGgraph_flow_flow|198|0|312|0|{Flow_1|}112|115|}
{2010604001|XXGgraph_flow_flow|199|0|314|0|{Flow_2|}112|116|}
{2010604001|XXGgraph_flow_flow|200|0|316|0|{Flow_3|}112|117|}
{2010601001|XXGgraph_vertex_vertex|201|0|318|0|{Reformat|}112|118|}
{2010212001|XXGvertex_oport_oport|202|0|320|0|{0|out0|}118|119|}
{2010213001|XXGoport_dst_flow|203|0|322|0|{0|}119|115|}
{2010212001|XXGvertex_oport_oport|204|0|323|0|{1|reject0|}118|120|}
{2010212001|XXGvertex_oport_oport|205|0|325|0|{2|error0|}118|121|}
{2010212001|XXGvertex_oport_oport|206|0|327|0|{3|log|}118|122|}
{2010211001|XXGvertex_iport_iport|207|0|329|0|{0|in|}118|123|}
{2010007001|XXGobject_proto_object|208|0|331|0|{}118|124|}
{2010212001|XXGvertex_oport_oport|209|0|333|0|{0|out0|}124|125|}
{2010006001|XXGobject_psameas_object|210|0|335|0|{metadata|out0_metadata|1|0|}125|124|}
{2010006001|XXGobject_psameas_object|211|0|336|0|{transform0|transform0|1|0|}125|124|}
{2010212001|XXGvertex_oport_oport|212|0|337|0|{1|reject0|}124|126|}
{2010006001|XXGobject_psameas_object|213|0|339|0|{metadata|reject0_metadata|1|0|}126|124|}
{2010212001|XXGvertex_oport_oport|214|0|340|0|{2|error0|}124|127|}
{2010006001|XXGobject_psameas_object|215|0|342|0|{metadata|error0_metadata|1|0|}127|124|}
{2010212001|XXGvertex_oport_oport|216|0|343|0|{3|log|}124|128|}
{2010006001|XXGobject_psameas_object|217|0|345|0|{metadata|log_metadata|1|0|}128|124|}
{2010211001|XXGvertex_iport_iport|218|0|346|0|{0|in|}124|129|}
{2010006001|XXGobject_psameas_object|219|0|348|0|{metadata|in_metadata|1|0|}129|124|}
{2010006001|XXGobject_psameas_object|220|0|349|0|{Layout|Layout|0|0|}118|8|}
{2010006001|XXGobject_psameas_object|221|0|350|0|{in_metadata|out0_metadata|0|0|}118|65|}
{2010006001|XXGobject_psameas_object|222|0|351|0|{out0_metadata|out_metadata|0|0|}118|130|}
{2010212001|XXGvertex_oport_oport|223|0|353|0|{0|out|}130|131|}
{2010213001|XXGoport_dst_flow|224|0|355|0|{0|}131|132|}
{2010212001|XXGvertex_oport_oport|225|0|357|0|{1|index0|}130|133|}
{2010213001|XXGoport_dst_flow|226|0|359|0|{0|}133|134|}
{2010211001|XXGvertex_iport_iport|227|0|361|0|{0|in|}130|135|}
{2010214001|XXGiport_src_flow|228|0|363|0|{0|}135|136|}
{2010007001|XXGobject_proto_object|229|0|365|0|{}130|137|}
{2010212001|XXGvertex_oport_oport|230|0|367|0|{0|out|}137|138|}
{2010006001|XXGobject_psameas_object|231|0|369|0|{metadata|out_metadata|1|0|}138|137|}
{2010212001|XXGvertex_oport_oport|232|0|370|0|{1|index0|}137|139|}
{2010006001|XXGobject_psameas_object|233|0|372|0|{key0|key0|1|0|}139|137|}
{2010006001|XXGobject_psameas_object|234|0|373|0|{metadata|index0_metadata|1|0|}139|137|}
{2010211001|XXGvertex_iport_iport|235|0|374|0|{0|in|}137|140|}
{2010006001|XXGobject_psameas_object|236|0|376|0|{metadata|in_metadata|1|0|}140|137|}
{2010006001|XXGobject_psameas_object|237|0|377|0|{Layout|Layout|0|0|}130|141|}
{2010211001|XXGvertex_iport_iport|238|0|379|0|{0|write|}141|142|}
{2010214001|XXGiport_src_flow|239|0|381|0|{0|}142|134|}
{2010007001|XXGobject_proto_object|240|0|382|0|{}141|143|}
{2010211001|XXGvertex_iport_iport|241|0|384|0|{0|write|}143|144|}
{2010006001|XXGobject_psameas_object|242|0|386|0|{metadata|write_metadata|1|0|}144|143|}
{2010006001|XXGobject_psameas_object|243|0|387|0|{write_metadata|index0_metadata|0|0|}141|130|}
{2010006001|XXGobject_psameas_object|244|0|388|0|{in_metadata|out_metadata|0|0|}130|130|}
{2010006001|XXGobject_psameas_object|245|0|389|0|{reject0_metadata|out0_metadata|0|0|}118|65|}
{2010601001|XXGgraph_vertex_vertex|246|0|390|0|{Replicate|}112|145|}
{2010212001|XXGvertex_oport_oport|247|0|392|0|{0|out|}145|146|}
{2010213001|XXGoport_dst_flow|248|0|394|0|{0|}146|116|}
{2010213001|XXGoport_dst_flow|249|0|395|0|{1|}146|117|}
{2010211001|XXGvertex_iport_iport|250|0|396|0|{0|in|}145|147|}
{2010214001|XXGiport_src_flow|251|0|398|0|{0|}147|115|}
{2010007001|XXGobject_proto_object|252|0|399|0|{}145|148|}
{2010212001|XXGvertex_oport_oport|253|0|401|0|{0|out|}148|149|}
{2010006001|XXGobject_psameas_object|254|0|403|0|{metadata|out_metadata|1|0|}149|148|}
{2010211001|XXGvertex_iport_iport|255|0|404|0|{0|in|}148|150|}
{2010006001|XXGobject_psameas_object|256|0|406|0|{metadata|in_metadata|1|0|}150|148|}
{2010006001|XXGobject_psameas_object|257|0|407|0|{Layout|Layout|0|0|}145|118|}
{2010006001|XXGobject_psameas_object|258|0|408|0|{in_metadata|out_metadata|0|0|}145|130|}
{2010006001|XXGobject_psameas_object|259|0|409|0|{out_metadata|out_metadata|0|0|}145|130|}
{2010601001|XXGgraph_vertex_vertex|260|0|410|0|{for_MPP_Server_Architecture|}112|151|}
{2010605001|XXGgraph_legend_legend|261|0|412|0|{0|}151|152|}
{2010241001|XXGlegend_face_face|262|0|414|0|{}152|153|}
{2010604001|XXGgraph_flow_flow|263|0|416|0|{Flow_1|}151|154|}
{2010604001|XXGgraph_flow_flow|264|0|418|0|{Flow_2|}151|155|}
{2010604001|XXGgraph_flow_flow|265|0|420|0|{Flow_3|}151|156|}
{2010604001|XXGgraph_flow_flow|266|0|422|0|{Flow_4|}151|157|}
{2010604001|XXGgraph_flow_flow|267|0|424|0|{Flow_5|}151|158|}
{2010604001|XXGgraph_flow_flow|268|0|426|0|{Flow_6|}151|159|}
{2010604001|XXGgraph_flow_flow|269|0|428|0|{Flow_7|}151|160|}
{2010604001|XXGgraph_flow_flow|270|0|430|0|{Flow_8|}151|161|}
{2010601001|XXGgraph_vertex_vertex|271|0|432|0|{Broadcast|}151|162|}
{2010212001|XXGvertex_oport_oport|272|0|434|0|{0|out|}162|163|}
{2010213001|XXGoport_dst_flow|273|0|436|0|{0|}163|160|}
{2010211001|XXGvertex_iport_iport|274|0|437|0|{0|in|}162|164|}
{2010214001|XXGiport_src_flow|275|0|439|0|{0|}164|155|}
{2010007001|XXGobject_proto_object|276|0|440|0|{}162|165|}
{2010212001|XXGvertex_oport_oport|277|0|442|0|{0|out|}165|166|}
{2010006001|XXGobject_psameas_object|278|0|444|0|{metadata|out_metadata|1|0|}166|165|}
{2010211001|XXGvertex_iport_iport|279|0|445|0|{0|in|}165|167|}
{2010006001|XXGobject_psameas_object|280|0|447|0|{metadata|in_metadata|1|0|}167|165|}
{2010006001|XXGobject_psameas_object|281|0|448|0|{Layout|Layout|0|0|}162|118|}
{2010006001|XXGobject_psameas_object|282|0|449|0|{in_metadata|out_metadata|0|0|}162|168|}
{2010212001|XXGvertex_oport_oport|283|0|451|0|{0|out|}168|169|}
{2010213001|XXGoport_dst_flow|284|0|453|0|{0|}169|157|}
{2010212001|XXGvertex_oport_oport|285|0|454|0|{1|index0|}168|170|}
{2010213001|XXGoport_dst_flow|286|0|456|0|{0|}170|158|}
{2010211001|XXGvertex_iport_iport|287|0|457|0|{0|in|}168|171|}
{2010214001|XXGiport_src_flow|288|0|459|0|{0|}171|160|}
{2010007001|XXGobject_proto_object|289|0|460|0|{}168|172|}
{2010212001|XXGvertex_oport_oport|290|0|462|0|{0|out|}172|173|}
{2010006001|XXGobject_psameas_object|291|0|464|0|{metadata|out_metadata|1|0|}173|172|}
{2010212001|XXGvertex_oport_oport|292|0|465|0|{1|index0|}172|174|}
{2010006001|XXGobject_psameas_object|293|0|467|0|{key0|key0|1|0|}174|172|}
{2010006001|XXGobject_psameas_object|294|0|468|0|{metadata|index0_metadata|1|0|}174|172|}
{2010211001|XXGvertex_iport_iport|295|0|469|0|{0|in|}172|175|}
{2010006001|XXGobject_psameas_object|296|0|471|0|{metadata|in_metadata|1|0|}175|172|}
{2010006001|XXGobject_psameas_object|297|0|472|0|{Layout|Layout|0|0|}168|176|}
{2010211001|XXGvertex_iport_iport|298|0|474|0|{0|write|}176|177|}
{2010214001|XXGiport_src_flow|299|0|476|0|{0|}177|158|}
{2010007001|XXGobject_proto_object|300|0|477|0|{}176|178|}
{2010211001|XXGvertex_iport_iport|301|0|479|0|{0|write|}178|179|}
{2010006001|XXGobject_psameas_object|302|0|481|0|{metadata|write_metadata|1|0|}179|178|}
{2010006001|XXGobject_psameas_object|303|0|482|0|{write_metadata|index0_metadata|0|0|}176|168|}
{2010006001|XXGobject_psameas_object|304|0|483|0|{in_metadata|out_metadata|0|0|}168|168|}
{2010006001|XXGobject_psameas_object|305|0|484|0|{out_metadata|out_metadata|0|0|}162|168|}
{2010601001|XXGgraph_vertex_vertex|306|0|485|0|{Concatenate|}151|180|}
{2010212001|XXGvertex_oport_oport|307|0|487|0|{0|out|}180|181|}
{2010213001|XXGoport_dst_flow|308|0|489|0|{0|}181|159|}
{2010211001|XXGvertex_iport_iport|309|0|490|0|{0|in|}180|182|}
{2010214001|XXGiport_src_flow|310|0|492|0|{0|}182|154|}
{2010214001|XXGiport_src_flow|311|0|493|0|{1|}182|161|}
{2010007001|XXGobject_proto_object|312|0|494|0|{}180|183|}
{2010212001|XXGvertex_oport_oport|313|0|496|0|{0|out|}183|184|}
{2010006001|XXGobject_psameas_object|314|0|498|0|{metadata|out_metadata|1|0|}184|183|}
{2010211001|XXGvertex_iport_iport|315|0|499|0|{0|in|}183|185|}
{2010006001|XXGobject_psameas_object|316|0|501|0|{metadata|in_metadata|1|0|}185|183|}
{2010006001|XXGobject_psameas_object|317|0|502|0|{Layout|Layout|0|0|}180|118|}
{2010006001|XXGobject_psameas_object|318|0|503|0|{in_metadata|out_metadata|0|0|}180|168|}
{2010006001|XXGobject_psameas_object|319|0|504|0|{out_metadata|out_metadata|0|0|}180|168|}
{2010601001|XXGgraph_vertex_vertex|320|0|505|0|{Partition_by_Round_robin|}151|186|}
{2010212001|XXGvertex_oport_oport|321|0|507|0|{0|out|}186|187|}
{2010213001|XXGoport_dst_flow|322|0|509|0|{0|}187|161|}
{2010211001|XXGvertex_iport_iport|323|0|510|0|{0|in|}186|188|}
{2010214001|XXGiport_src_flow|324|0|512|0|{0|}188|156|}
{2010007001|XXGobject_proto_object|325|0|513|0|{}186|189|}
{2010212001|XXGvertex_oport_oport|326|0|515|0|{0|out|}189|190|}
{2010006001|XXGobject_psameas_object|327|0|517|0|{metadata|out_metadata|1|0|}190|189|}
{2010211001|XXGvertex_iport_iport|328|0|518|0|{0|in|}189|191|}
{2010006001|XXGobject_psameas_object|329|0|520|0|{metadata|in_metadata|1|0|}191|189|}
{2010006001|XXGobject_psameas_object|330|0|521|0|{Layout|Layout|0|0|}186|118|}
{2010006001|XXGobject_psameas_object|331|0|522|0|{in_metadata|out_metadata|0|0|}186|168|}
{2010006001|XXGobject_psameas_object|332|0|523|0|{out_metadata|out_metadata|0|0|}186|168|}
{2010601001|XXGgraph_vertex_vertex|333|0|524|0|{Prev_Xref_Data_file|}151|192|}
{2010212001|XXGvertex_oport_oport|334|0|526|0|{0|read|}192|193|}
{2010213001|XXGoport_dst_flow|335|0|528|0|{0|}193|156|}
{2010007001|XXGobject_proto_object|336|0|529|0|{}192|194|}
{2010212001|XXGvertex_oport_oport|337|0|531|0|{0|read|}194|195|}
{2010006001|XXGobject_psameas_object|338|0|533|0|{metadata|read_metadata|1|0|}195|194|}
{2010006001|XXGobject_psameas_object|339|0|534|0|{read_metadata|out_metadata|0|0|}192|168|}
{2010601001|XXGgraph_vertex_vertex|340|0|535|0|{Replicate|}151|196|}
{2010212001|XXGvertex_oport_oport|341|0|537|0|{0|out|}196|197|}
{2010213001|XXGoport_dst_flow|342|0|539|0|{0|}197|154|}
{2010211001|XXGvertex_iport_iport|343|0|540|0|{0|in|}196|198|}
{2010007001|XXGobject_proto_object|344|0|542|0|{}196|199|}
{2010212001|XXGvertex_oport_oport|345|0|544|0|{0|out|}199|200|}
{2010006001|XXGobject_psameas_object|346|0|546|0|{metadata|out_metadata|1|0|}200|199|}
{2010211001|XXGvertex_iport_iport|347|0|547|0|{0|in|}199|201|}
{2010006001|XXGobject_psameas_object|348|0|549|0|{metadata|in_metadata|1|0|}201|199|}
{2010006001|XXGobject_psameas_object|349|0|550|0|{Layout|Layout|0|0|}196|118|}
{2010006001|XXGobject_psameas_object|350|0|551|0|{in_metadata|out_metadata|0|0|}196|168|}
{2010006001|XXGobject_psameas_object|351|0|552|0|{out_metadata|out_metadata|0|0|}196|168|}
{2010601001|XXGgraph_vertex_vertex|352|0|553|0|{Sort|}151|202|}
{2010212001|XXGvertex_oport_oport|353|0|555|0|{0|out|}202|203|}
{2010213001|XXGoport_dst_flow|354|0|557|0|{0|}203|155|}
{2010211001|XXGvertex_iport_iport|355|0|558|0|{0|in|}202|204|}
{2010214001|XXGiport_src_flow|356|0|560|0|{0|}204|159|}
{2010007001|XXGobject_proto_object|357|0|561|0|{}202|205|}
{2010212001|XXGvertex_oport_oport|358|0|563|0|{0|out|}205|206|}
{2010006001|XXGobject_psameas_object|359|0|565|0|{metadata|out_metadata|1|0|}206|205|}
{2010211001|XXGvertex_iport_iport|360|0|566|0|{0|in|}205|207|}
{2010006001|XXGobject_psameas_object|361|0|568|0|{metadata|in_metadata|1|0|}207|205|}
{2010006001|XXGobject_psameas_object|362|0|569|0|{Layout|Layout|0|0|}202|118|}
{2010006001|XXGobject_psameas_object|363|0|570|0|{in_metadata|out_metadata|0|0|}202|168|}
{2010006001|XXGobject_psameas_object|364|0|571|0|{out_metadata|out_metadata|0|0|}202|168|}
{2010601001|XXGgraph_vertex_vertex|365|0|572|0|{Write_Lookup|}151|168|}
{2010601001|XXGgraph_vertex_vertex|366|0|573|0|{Xref_Data_file|}151|208|}
{2010211001|XXGvertex_iport_iport|367|0|575|0|{0|write|}208|209|}
{2010214001|XXGiport_src_flow|368|0|577|0|{0|}209|157|}
{2010007001|XXGobject_proto_object|369|0|578|0|{}208|210|}
{2010211001|XXGvertex_iport_iport|370|0|580|0|{0|write|}210|211|}
{2010006001|XXGobject_psameas_object|371|0|582|0|{metadata|write_metadata|1|0|}211|210|}
{2010006001|XXGobject_psameas_object|372|0|583|0|{write_metadata|out_metadata|0|0|}208|168|}
{2010601001|XXGgraph_vertex_vertex|373|0|584|0|{Xref_Index_file|}151|176|}
{2010211001|XXGvertex_iport_iport|374|0|585|0|{0|in0|}151|212|}
{2010215002|XXGiport_binding_iport|375|0|587|0|{.5|.5|{0|}10958|}212|198|}
{2010214001|XXGiport_src_flow|376|0|588|0|{0|}212|116|}
{2010601001|XXGgraph_vertex_vertex|377|0|589|0|{for_SMP_Server_Architecture|}112|213|}
{2010604001|XXGgraph_flow_flow|378|0|591|0|{Flow_1|}213|214|}
{2010604001|XXGgraph_flow_flow|379|0|593|0|{Flow_2|}213|215|}
{2010604001|XXGgraph_flow_flow|380|0|595|0|{Flow_3|}213|216|}
{2010604001|XXGgraph_flow_flow|381|0|597|0|{Flow_4|}213|132|}
{2010604001|XXGgraph_flow_flow|382|0|598|0|{Flow_5|}213|134|}
{2010604001|XXGgraph_flow_flow|383|0|599|0|{Flow_6|}213|136|}
{2010604001|XXGgraph_flow_flow|384|0|600|0|{Flow_7|}213|217|}
{2010601001|XXGgraph_vertex_vertex|385|0|602|0|{Gather|}213|218|}
{2010212001|XXGvertex_oport_oport|386|0|604|0|{0|out|}218|219|}
{2010213001|XXGoport_dst_flow|387|0|606|0|{0|}219|136|}
{2010211001|XXGvertex_iport_iport|388|0|607|0|{0|in|}218|220|}
{2010214001|XXGiport_src_flow|389|0|609|0|{0|}220|216|}
{2010007001|XXGobject_proto_object|390|0|610|0|{}218|221|}
{2010212001|XXGvertex_oport_oport|391|0|612|0|{0|out|}221|222|}
{2010006001|XXGobject_psameas_object|392|0|614|0|{metadata|out_metadata|1|0|}222|221|}
{2010211001|XXGvertex_iport_iport|393|0|615|0|{0|in|}221|223|}
{2010006001|XXGobject_psameas_object|394|0|617|0|{metadata|in_metadata|1|0|}223|221|}
{2010006001|XXGobject_psameas_object|395|0|618|0|{Layout|Layout|0|0|}218|141|}
{2010006001|XXGobject_psameas_object|396|0|619|0|{in_metadata|out_metadata|0|0|}218|130|}
{2010006001|XXGobject_psameas_object|397|0|620|0|{out_metadata|out_metadata|0|0|}218|130|}
{2010601001|XXGgraph_vertex_vertex|398|0|621|0|{Partition_by_Round_robin|}213|224|}
{2010212001|XXGvertex_oport_oport|399|0|623|0|{0|out|}224|225|}
{2010213001|XXGoport_dst_flow|400|0|625|0|{0|}225|217|}
{2010211001|XXGvertex_iport_iport|401|0|626|0|{0|in|}224|226|}
{2010214001|XXGiport_src_flow|402|0|628|0|{0|}226|214|}
{2010007001|XXGobject_proto_object|403|0|629|0|{}224|227|}
{2010212001|XXGvertex_oport_oport|404|0|631|0|{0|out|}227|228|}
{2010006001|XXGobject_psameas_object|405|0|633|0|{metadata|out_metadata|1|0|}228|227|}
{2010211001|XXGvertex_iport_iport|406|0|634|0|{0|in|}227|229|}
{2010006001|XXGobject_psameas_object|407|0|636|0|{metadata|in_metadata|1|0|}229|227|}
{2010006001|XXGobject_psameas_object|408|0|637|0|{Layout|Layout|0|0|}224|230|}
{2010212001|XXGvertex_oport_oport|409|0|639|0|{0|read|}230|231|}
{2010213001|XXGoport_dst_flow|410|0|641|0|{0|}231|214|}
{2010007001|XXGobject_proto_object|411|0|642|0|{}230|232|}
{2010212001|XXGvertex_oport_oport|412|0|644|0|{0|read|}232|233|}
{2010006001|XXGobject_psameas_object|413|0|646|0|{metadata|read_metadata|1|0|}233|232|}
{2010006001|XXGobject_psameas_object|414|0|647|0|{read_metadata|out_metadata|0|0|}230|130|}
{2010006001|XXGobject_psameas_object|415|0|648|0|{in_metadata|out_metadata|0|0|}224|130|}
{2010006001|XXGobject_psameas_object|416|0|649|0|{out_metadata|out_metadata|0|0|}224|130|}
{2010601001|XXGgraph_vertex_vertex|417|0|650|0|{Prev_Xref_Data_file|}213|230|}
{2010601001|XXGgraph_vertex_vertex|418|0|651|0|{Replicate|}213|234|}
{2010212001|XXGvertex_oport_oport|419|0|653|0|{0|out|}234|235|}
{2010213001|XXGoport_dst_flow|420|0|655|0|{0|}235|215|}
{2010211001|XXGvertex_iport_iport|421|0|656|0|{0|in|}234|236|}
{2010007001|XXGobject_proto_object|422|0|658|0|{}234|237|}
{2010212001|XXGvertex_oport_oport|423|0|660|0|{0|out|}237|238|}
{2010006001|XXGobject_psameas_object|424|0|662|0|{metadata|out_metadata|1|0|}238|237|}
{2010211001|XXGvertex_iport_iport|425|0|663|0|{0|in|}237|239|}
{2010006001|XXGobject_psameas_object|426|0|665|0|{metadata|in_metadata|1|0|}239|237|}
{2010006001|XXGobject_psameas_object|427|0|666|0|{Layout|Layout|0|0|}234|118|}
{2010006001|XXGobject_psameas_object|428|0|667|0|{in_metadata|out_metadata|0|0|}234|130|}
{2010006001|XXGobject_psameas_object|429|0|668|0|{out_metadata|out_metadata|0|0|}234|130|}
{2010601001|XXGgraph_vertex_vertex|430|0|669|0|{Sort|}213|240|}
{2010212001|XXGvertex_oport_oport|431|0|671|0|{0|out|}240|241|}
{2010213001|XXGoport_dst_flow|432|0|673|0|{0|}241|216|}
{2010211001|XXGvertex_iport_iport|433|0|674|0|{0|in|}240|242|}
{2010214001|XXGiport_src_flow|434|0|676|0|{0|}242|215|}
{2010214001|XXGiport_src_flow|435|0|677|0|{1|}242|217|}
{2010007001|XXGobject_proto_object|436|0|678|0|{}240|243|}
{2010212001|XXGvertex_oport_oport|437|0|680|0|{0|out|}243|244|}
{2010006001|XXGobject_psameas_object|438|0|682|0|{metadata|out_metadata|1|0|}244|243|}
{2010211001|XXGvertex_iport_iport|439|0|683|0|{0|in|}243|245|}
{2010006001|XXGobject_psameas_object|440|0|685|0|{metadata|in_metadata|1|0|}245|243|}
{2010006001|XXGobject_psameas_object|441|0|686|0|{Layout|Layout|0|0|}240|118|}
{2010006001|XXGobject_psameas_object|442|0|687|0|{in_metadata|out_metadata|0|0|}240|130|}
{2010006001|XXGobject_psameas_object|443|0|688|0|{out_metadata|out_metadata|0|0|}240|130|}
{2010601001|XXGgraph_vertex_vertex|444|0|689|0|{Write_Lookup|}213|130|}
{2010601001|XXGgraph_vertex_vertex|445|0|690|0|{Xref_Data_file|}213|246|}
{2010211001|XXGvertex_iport_iport|446|0|692|0|{0|write|}246|247|}
{2010214001|XXGiport_src_flow|447|0|694|0|{0|}247|132|}
{2010007001|XXGobject_proto_object|448|0|695|0|{}246|248|}
{2010211001|XXGvertex_iport_iport|449|0|697|0|{0|write|}248|249|}
{2010006001|XXGobject_psameas_object|450|0|699|0|{metadata|write_metadata|1|0|}249|248|}
{2010006001|XXGobject_psameas_object|451|0|700|0|{write_metadata|out_metadata|0|0|}246|130|}
{2010601001|XXGgraph_vertex_vertex|452|0|701|0|{Xref_Index_file|}213|141|}
{2010211001|XXGvertex_iport_iport|453|0|702|0|{0|in0|}213|250|}
{2010215002|XXGiport_binding_iport|454|0|704|0|{.5|.5|{0|}11026|}250|236|}
{2010214001|XXGiport_src_flow|455|0|705|0|{0|}250|117|}
{2010211001|XXGvertex_iport_iport|456|0|706|0|{0|in0|}112|251|}
{2010215002|XXGiport_binding_iport|457|0|708|0|{.5|.5|{0|}10956|}251|123|}
{2010214001|XXGiport_src_flow|458|0|709|0|{0|}251|58|}
{2010211001|XXGvertex_iport_iport|459|0|710|0|{0|in0|}50|252|}
{2010215002|XXGiport_binding_iport|460|0|712|0|{.5|.5|{0|}10831|}252|70|}
{2010214001|XXGiport_src_flow|461|0|713|0|{0|}252|7|}
{2010109001|XXGobject_property_value|462|0|714|0|{0|TrackingThumbprint|72|}1|253|}
