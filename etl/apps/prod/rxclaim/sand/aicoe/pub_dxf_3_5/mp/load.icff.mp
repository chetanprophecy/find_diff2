@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|1147|rel_count|2011|}
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
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|NOTES||3|2|K$|Use this to save useful information, such as run times, record counts, and data sizes.  For example: 30.5 min, 122.5 M rec, 64.0 GB|{0|}}
{30001002|XXparameter|TARGET_NAME||3|9|FK|The name of the target table to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RK|The cananonical form of the full "logical" target table name.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_LOWER, ".*[.]", "") ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|SUBJECT_AREA|$[ string_downcase(string_split(TARGET_NAME,".")[0]) ]|3|9|K|Subject area defined as per IDS|{0|}}
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
{30001002|XXparameter|SPLIT_DML|$[read_file(SPLIT_DML_FILE)]|3|9|RK|The record format of the shred.|{0|}}
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
{30001002|XXparameter|INPUT_FILE|AB_PARAMETER_ENV|3|10|Kd|SPLIT or placeholder input file |{0|}}
{30001002|XXparameter|INPUT_FILE_EME|$[ if(INPUT_FILE_DRIVING_MASK =="split") string_concat( AI_MFS,"/split/" ,INPUT_FILE_DRIVING_MASK , ".\{ILM\}." , SUBJECT_AREA ,".", TARGET_ENTITY ,  ".\{RUN_ID\}.dat.gz" ) 
else string_concat( AI_MFS,"/placeholder/" ,INPUT_FILE_DRIVING_MASK  , ".\{ILM\}.\{SOURCE\}.\{SOURCE\}." , TARGET_ENTITY , ".\{RUN_ID\}.dat.gz" ) ]|3|9|K|Parameter created for EME dataset|{0|}}
{30001002|XXparameter|INPUT_FILE_STRING|$[string_join(INPUT_FILE,"\|")]|3|9|EK|@{0|}}
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
{30001002|XXparameter|TARGET_NK_DML|$[
if(IS_IDS_DML_WITH_NK)
read_type(PUB_DATAHUB_DML +"/nk/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml") 
else 
read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml")
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DML|$[read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml") ]|3|9|RK|The DML for the target dataset.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|IS_IDS_AUDIT_COL_AT_END|$[begin
let string("")[int] v_ids_sudit_type_nm_vec =record_info_item_expanded(IDS_AUDIT_TYPE, item = "name" );
let string("")[int] v_ids_target_type_nm_vec =record_info_item_expanded(TARGET_DML, item = "name" );
let int v_audit_loop_count=length_of(v_ids_sudit_type_nm_vec) + 1 ;
let string("")[v_audit_loop_count] v_get_audit_columns_from_t_dml_vec=allocate_with_defaults();
let int v_num_of_col_in_target_dml=length_of(v_ids_target_type_nm_vec);
let int j=0;
for (let int i=v_num_of_col_in_target_dml - v_audit_loop_count , i < v_num_of_col_in_target_dml )
   begin
     v_get_audit_columns_from_t_dml_vec[j]=v_ids_target_type_nm_vec[i];
     j=j + 1 ;
    end
 
result:: if( string_join(vector_difference(v_get_audit_columns_from_t_dml_vec,v_ids_sudit_type_nm_vec),"")=="newline" 
                      or length_of(vector_difference(v_get_audit_columns_from_t_dml_vec,v_ids_sudit_type_nm_vec))==0 ) "True"
         else 
            force_error(string_concat( "Following IDS Audit column must be at end of DML :  " ,"\\n", string_join(v_ids_sudit_type_nm_vec,"\\n"),"\\n","newline", "\\n" ,
             "However current ids DML has following column at end of record ",string_join(v_get_audit_columns_from_t_dml_vec,"\\n")) );
end ]|3|9|FK|This Parameter will provide a check in IDS DML , that IDS audit column must be at End of DML|{0|}}
{30001002|XXparameter|INTER_DML|$[join_types(TARGET_NK_DML,CDC_FLAG_RECORD_TYPE)]|3|9|K|@{0|}}
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
{30001002|XXparameter|UPDATE_FILE|AB_PARAMETER_ENV|3|10|Kd|Update file for distribution event|{0|}}
{30001002|XXparameter|XREF_FILE_EXIST|AB_PARAMETER_ENV|1|10|Kd|Parameter to check existence of xref file|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INPUT_LOOKUP_FILE|AB_PARAMETER_ENV|3|10|Kd|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_LOOKUP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat")]|3|9|K|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INDEX_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".idx")]|3|9|K|Location where xref lokkup file IDX for Map keying process will be created|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_LOOKUP_TEMP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".temp.dat")]|3|9|K|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INDEX_TEMP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".temp.idx")]|3|9|K|Location where xref lokkup file IDX for Map keying process will be created|{0|}}
{30001002|XXparameter|MAX_SK_LOOKUP_FILE|$[string_concat(PUB_DATAHUB_SERIAL_LOOKUP,"/ids/",SUBJECT_AREA,"/max_sk/max_sk.",TARGET_ENTITY,".dat")]|3|9|K|This will be dim max sk lookup file |{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$[ string_concat(PUB_DATAHUB_SERIAL ,"/event_log/event_log.",SUBJECT_AREA,".", TARGET_ENTITY , ".dat") ]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|______Dependent_Parameters_____________________________|@3|9|K|@{0|}}
{30001002|XXparameter|READ_SPLIT_PORT_OUT_DML|$[if(INPUT_FILE_DRIVING_MASK=="split") SPLIT_DML else PLACEHOLDER_READ_DML ]|3|9|K|In case of Split file a SPLIT DML will be used , In placeholder a dml with \\n target fields value will be used|{0|}}
{30001002|XXparameter|IDS_MAP_XFR_HINT|AB_PARAMETER_ENV|3|10|Kd|This parameter will get xfr hint by reading split file and deriving output type|{0|}}
{30001002|XXparameter|MAX_SK_VALUE|AB_PARAMETER_ENV|3|10|Kd|This is Max SK value for a given dimension|{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_KEY|\{dxf_hk_part1; dxf_hk_part2;dxf_sk;grp_hrchy_sk;hash_key;hash_key_half\}|3|9|FK|Optional: \{field1; field2;...\}: A key that includes fields that cannot be changed on an update.|{0|}}
{30001002|XXparameter|DO_NOT_UPDATE_COL_LIST|@3|9|FK|Please Provide columns that will not be updated,  even if a record is an update record . Column must be comma separated like : d3iqhr,d3irhr,d3ithr,d3bzik|{0|}}
{30001002|XXparameter|DO_NOT_UPDATE_COL_XFR|$[ begin 
let string("") v_xfr="";
let int i=0;
let string("")[int] v_not_to_update_col_vec=string_split_no_empty(DO_NOT_UPDATE_COL_LIST,",");
let int v_col_num=length_of(v_not_to_update_col_vec);
if(v_col_num > 0) 
   begin 
       for (i,i < v_col_num)
         begin 
         v_xfr= string_concat(v_xfr , '\\t\\n' ,'out.' + string_lrtrim(v_not_to_update_col_vec[i]) + ' :1: if ( v_flag == 2 ) exact_record_value.'  + 
                v_not_to_update_col_vec[i] + ' else ' + IDS_MAP_XFR_HINT + '.' +  string_lrtrim(v_not_to_update_col_vec[i]) +';') ;
         end
    end
result :: v_xfr ;

end
]|3|9|K|@{0|}}
{30001002|XXparameter|DO_TWO_STEP_LOOKUP|$[if(file_information(PUB_DXF_META + "/two_step_lookup_list.dat").found)  TARGET_LOWER member string_split(string_filter_out(read_file(PUB_DXF_META + "/two_step_lookup_list.dat"),"\\r"),"\\n") else 0 ]|1|9|K|This list provide two step lookup flag|{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_VEC|$[ for ( let k in key_info(FIELDS_TO_IGNORE_KEY) ) :
    k.field_name
]|3|9|RK|A vector of field names that are ignored in comparisions and updates.|{0|}}
{30001002|XXparameter|TARGET_INFO_VEC|$[ for ( let info in record_info(TARGET_NK_DML) ) :
    if ( info.name != "newline" )
      info
]|3|9|RK|A vector of information about all of the fields in the target DML, excluding "newline".|{0|}}
{30001002|XXparameter|TARGET_FIELDS_VEC|$[ for ( let i in TARGET_INFO_VEC ) :
    i.name
]|3|9|RK|A vector of field names in the target table, excluding "newline".  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|TARGET_FIELDS_WIDTH|$[ vector_max(
    for ( let n in TARGET_FIELDS_VEC ) :
      (decimal(""))string_length(n))
]|3|9|RK|The length of the widest field name in the target table.|{0|}}
{30001002|XXparameter|SPLIT_INFO_VEC|$[ record_info(SPLIT_DML) ]|3|9|RK|A vector of field names in the shred.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|SPLIT_FIELDS_VEC|$[ record_info_item(SPLIT_DML, "name") ]|3|9|RK|A vector of field names in the shred.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
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
{30001002|XXparameter|FIELDS_TO_COMPARE|$[ string_join(
    for ( let n in TARGET_FIELDS_VEC ) :
      if ( n not member BOOKKEEPING_FIELDS_VEC and
           n not member FIELDS_TO_IGNORE_VEC and
           n not member NATURAL_KEY_FIELDS_VEC 
          )
        n,
    "\\n")
]|3|9|RK|The list of fields that can be changed on an update.  Defaults to all fields except PK, if any, the NK, the physical fields, and any fields to ignore.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|COMPARE_FIELDS_VEC|$[begin
let int i;
let string(int)[int] ALL_COMPARISON_COLUMNS = re_split_no_empty( re_replace(FIELDS_TO_COMPARE, "(?m-s)#.*", ""),  "[^a-zA-Z0-9_]");
let int vec_length=length_of(ALL_COMPARISON_COLUMNS) ; 
let string("") matching_line="";
 for (i, i < vec_length)
        begin block match_found
           if ( (ALL_COMPARISON_COLUMNS[i] !="hash_key")  ) 
                matching_line=string_concat( matching_line, ",", ALL_COMPARISON_COLUMNS[i]);
        exit match_found ; 
        end block match_found
result :: string_split_no_empty(matching_line,",");
end;
]|3|9|RK|A vector of field names that are allowed in comparisions and updates.|{0|}}
{30001002|XXparameter|FIELDS_TO_COMPARE_HASH_EXPR|$[begin
let string("\\x01") hash_expr="";
let int i;
let int vec_length=length_of(COMPARE_FIELDS_VEC); 
if(vec_length != 0)
 for (i, i < vec_length)
        begin block create_expr
            hash_expr = string_concat( hash_expr ,";", COMPARE_FIELDS_VEC[i] )  ;
        end block create_expr
result :: if(vec_length == 0) "\{\}"  else string_concat(string_replace_first( hash_expr ,";","\{" ),"\}");
end;
]|3|9|K|@{0|}}
{30001002|XXparameter|DIFF_DML|$[ add_fields(
    "record\\nend",
    (dml_field_info_vec)for ( let info in TARGET_INFO_VEC ) :
      if ( info.name member COMPARE_FIELDS_VEC )
        info)
]|3|9|RK|The DML of the fields to compare.|{0|}}
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
{30001002|XXparameter|DIM_CDC_XFR|$[
if(not (TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split"))
'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
let string("") v_input_file_type="' + INPUT_FILE_DRIVING_MASK +'";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;
//Flag =0 -- Same record
//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update
// Make surrogate key as well part of CDC compare , excluding book keeping columns  ( Natural keys , Non Natural keys ( exclude book keeping fileds) 

type lookup_record_type = ' + TARGET_NK_DML + ';' +

' let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let int v_flag=0;
let decimal("") v_dxf_src_env_rank_lookup_record=0;
let int v_true_update_flag=0;

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
//let decimal("") suppressed_update_record_count=0;

 // if (current_lookup == lookup_not_loaded()) 
       // current_lookup = lookup_load(this_partition_path("' + ICFF_FILE + '"),this_partition_path("' + ICFF_INDEX_FILE + '),"ICFF_TEMPLATE" );

//let lookup_record_type lookup_record_value;
out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();
 if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + ICFF_FILE + '"),this_partition_path("'+ICFF_INDEX_FILE+'"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first iteration itself 
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
         
                                                                 
//Till Above , the code to find exact record is over .
//Do CDC based on full hash key ( 128 bit) murmur hash algorithm .
    
        v_record_hash_from_in= get_hash(in,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        v_record_hash_from_lkp= get_hash(exact_record_value,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        
//Asign Flags to identify change records 
        v_flag =      if (exact_record_value.dxf_hk_part1 == 0 or exact_record_value.dxf_hk_part2 ==0  ) 1  // Insert 
                     else if ( v_record_hash_from_in == v_record_hash_from_lkp ) 0  //Same  
                     else if( v_record_hash_from_in != v_record_hash_from_lkp )  2  //update
                     else 99; 


        v_dxf_src_env_rank_lookup_record=first_defined(lookup("SRC_ENVRT_ID",exact_record_value.dxf_src_sys_id).src_env_rnk , 99999 ) ; // A default 99999 will be assigned if no lookup match is found.
        v_true_update_flag=if( (v_flag == 2 && v_input_file_type=="placeholder" ) or ( v_flag == 2 && v_dxf_src_env_rank_lookup_record < in.src_env_rank  ) or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ;
        
        //This count process is only to capture every type of record count for Audit purpose . This is not part of any CDC process.
        //same_record_count = if (v_flag==0) (same_record_count + 1)  else same_record_count;
        //insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        //update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        //suppressed_update_record_count =if ( v_true_update_flag==3 ) (suppressed_update_record_count + 1 )  else suppressed_update_record_count ;
        //total_record_count =total_record_count +1;
        
        //in.src_env_rank will have default value of 9999 for sources ,where no rank is defined in src_envrt_id lkp file
        // Updates will be suppressesd
        // File type is placeholder .
        //Source that is updating is not a golden ( Most accurate source).
        out.flag :: v_true_update_flag ; 
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        out.ids_create_uid :: if ( v_flag == 2 ) exact_record_value.ids_create_uid else in.ids_create_uid ; //If record is an update record , value will come from lookup record value .
        out.ids_create_dttm :: if ( v_flag == 2 ) exact_record_value.ids_create_dttm else in.ids_create_dttm ; //If record is an update record , value will be populated from lookup
        out.ids_create_run_id :: if ( v_flag == 2 ) exact_record_value.ids_create_run_id else in.ids_create_run_id ; //If record is an update record , value will be populated from lookup
        '+  DO_NOT_UPDATE_COL_XFR + '
        out.* :: in.*;

end

/*
out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count ,
                                   "; SUPPRESSED_UPDATE_RECORD_COUNT =", suppressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end;*/ ' 
else ''
]|8|9|K|DIM CDC uses IDS full data file ICFF|{0|}}
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
{30001002|XXparameter|CDC_XFR|$[ 
if( (TRUNCATE_AND_LOAD && INPUT_FILE_DRIVING_MASK == "split") ) TRUNCATE_AND_LOAD_XFR
else if ( DATASET_IDENTIFIER == "many" or USE_XREF_FOR_CDC) FACT_CDC_XFR 
else DIM_CDC_XFR 
]|3|9|K|XFR for FACT and Dimensions will be diffrent - FACT CDC will only use xref and find probable updates . DIM uses main data ICFF and compares all column to get confirmed update|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|7\|\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Audit_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Audit_ICFF.out to Write_ICFFs.Audit_ICFF.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Audit_Index\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Audit_ICFF.index to Write_ICFFs.Audit_Index.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Main_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Main_ICFF.out to Write_ICFFs.Main_ICFF.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Main_Index\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Main_ICFF.index to Write_ICFFs.Main_Index.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Write_Audit_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Determine_Actions.audit to Write_ICFFs.audit:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Write_Main_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Determine_Actions.icff to Write_ICFFs.icff:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Write_Event_Log.Event_Log_Entry\|\}\{53\|status_info\|4\|\{56\|DA_fixed_param_error\|\}\{56\|CTL10086\|\}\{51\|1\|DA_parameter\|\{56\|transform\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
{30001002|XXparameter|ARCHIVE_CDC_XFR|$[ 
begin
result :: 'include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";

let string("") v_input_file_type="' + INPUT_FILE_DRIVING_MASK +'";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;
//Flag =0 -- Same record
//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update
// Make surrogate key as well part of CDC compare , excluding book keeping columns  ( Natural keys , Non Natural keys ( exclude book keeping fileds) 

type lookup_record_type = ' + TARGET_NK_DML + ';\\n\\n' +

'let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let int v_flag=0;
let decimal("") v_dxf_src_env_rank_lookup_record=0;
let int v_true_update_flag=0;

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
//let decimal("") suppressed_update_record_count=0;

 // if (current_lookup == lookup_not_loaded()) 
       // current_lookup = lookup_load(this_partition_path("' + ARCHIVE_ICFF_FILE + '"),this_partition_path("' + ARCHIVE_ICFF_INDEX_FILE + '),"ICFF_TEMPLATE" );

//let lookup_record_type lookup_record_value;
out::reformat(in) =
begin
 let integer(2) match_count=0;
 exact_record_value=allocate_with_defaults();
 if (current_lookup == lookup_not_loaded()) 
     current_lookup = lookup_load(this_partition_path("' + ARCHIVE_ICFF_FILE + '"),this_partition_path("' + ARCHIVE_ICFF_INDEX_FILE + '"),"ICFF_TEMPLATE_IDS" );  
 lookup_record_value = first_defined(lookup_last(current_lookup, "ICFF_TEMPLATE_IDS", in.dxf_hk_part1),allocate_with_defaults() );
 exact_record_value=allocate_with_defaults();
 exact_record_value = if (lookup_record_value.dxf_hk_part1 ==0 ) lookup_record_value               // No Match found on half hash key , So this is insert record.
                      else if  ( in.dxf_hk_part2 == lookup_record_value.dxf_hk_part2 ) lookup_record_value  //A match is found on dxf part1 as well as dxf part2 keys , this is an exact match in first iteration itself 
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

1. Hash_key_half found a match in Achive IDS :
        a.It also found a found a match with full hash key 
             1. Go ahead and compare column hash for CDC to find update .
             
2.dxf_hk_part1 has no match in Archive IDS 
      a.This become an update record .
*/                                                                       
         
                                                                 
//Till Above , the code to find exact record is over .
//Do CDC based on full hash key ( 128 bit) murmur hash algorithm .
    
        v_record_hash_from_in= get_hash(in,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        v_record_hash_from_lkp= get_hash(exact_record_value,"'+FIELDS_TO_COMPARE_HASH_EXPR+'" ); 
        
//Asign Flags to identify change records 
        v_flag =  if ( v_record_hash_from_in == v_record_hash_from_lkp ) 0  //Same  
                     else if( v_record_hash_from_in != v_record_hash_from_lkp )  2  //update
                     else 99; 


        v_dxf_src_env_rank_lookup_record=first_defined(lookup("SRC_ENVRT_ID",exact_record_value.dxf_src_sys_id).src_env_rnk , 99999 ) ; // A default 99999 will be assigned if no lookup match is found.
        v_true_update_flag=if( (v_flag == 2 && v_input_file_type=="placeholder" ) or ( v_flag == 2 && v_dxf_src_env_rank_lookup_record < in.src_env_rank  ) or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ;
        
        //This count process is only to capture every type of record count for Audit purpose . This is not part of any CDC process.
        //same_record_count = if (v_flag==0) (same_record_count + 1)  else same_record_count;
        //insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        //update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        //suppressed_update_record_count =if ( v_true_update_flag==3 ) (suppressed_update_record_count + 1 )  else suppressed_update_record_count ;
        //total_record_count =total_record_count +1;
        
        //in.src_env_rank will have default value of 9999 for sources ,where no rank is defined in src_envrt_id lkp file
        // Updates will be suppressesd
        // File type is placeholder .
        //Source that is updating is not a golden ( Most accurate source).
        out.flag :: v_true_update_flag ; 
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        out.ids_create_uid :: if ( v_flag == 2 ) exact_record_value.ids_create_uid else in.ids_create_uid ; //If record is an update record , value will come from lookup record value .
        out.ids_create_dttm :: if ( v_flag == 2 ) exact_record_value.ids_create_dttm else in.ids_create_dttm ; //If record is an update record , value will be populated from lookup
        out.ids_create_run_id :: if ( v_flag == 2 ) exact_record_value.ids_create_run_id else in.ids_create_run_id ; //If record is an update record , value will be populated from lookup
        '+  DO_NOT_UPDATE_COL_XFR + '
        out.* :: in.*;

end

/*
out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count ,
                                   "; SUPPRESSED_UPDATE_RECORD_COUNT =", suppressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end; */ ';
end
]|8|9|FK|@{0|}}
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
{30001002|XXparameter|XREF_FILE_EXIST:eme|1|3|9||@{0|}}
{30001002|XXparameter|XREF_FILE_EXIST:sandbox|$[file_information(string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat")).found]|3|9||@{0|}}
{30001002|XXparameter|MAX_SK_VALUE:eme|0|3|9||@{0|}}
{30001002|XXparameter|MAX_SK_VALUE:sandbox|$[if(file_information(MAX_SK_LOOKUP_FILE).found) read_file(MAX_SK_LOOKUP_FILE) else "0"]|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:eme||3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID:sandbox|$(whoami)|3|9||@{0|}}
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
{30001002|XXparameter|INSERT_FILE:eme|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.\{RUN_ID\}.dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|INSERT_FILE:sandbox|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,".",ILM_NAME,".",TARGET_ENTITY,".insert.",RUN_ID,".dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|UPDATE_FILE:eme|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,TARGET_ENTITY,".update.\{RUN_ID\}.dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|UPDATE_FILE:sandbox|$[if(TRUNCATE_AND_LOAD) '' else string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,TARGET_ENTITY,".update.",RUN_ID,".dat.gz")]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE:eme|$[ if(INPUT_FILE_DRIVING_MASK =="split") string_concat( AI_MFS,"/split/" ,INPUT_FILE_DRIVING_MASK , ".\{ILM\}." , SUBJECT_AREA ,".", TARGET_ENTITY ,  ".\{RUN_ID\}.dat.gz" ) 
else string_concat( AI_MFS,"/placeholder/" ,INPUT_FILE_DRIVING_MASK  , ".\{ILM\}.\{SOURCE\}.\{SOURCE\}." , TARGET_ENTITY , ".\{RUN_ID\}.dat.gz" ) ]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE:sandbox|$[ //Initialized default run_id value for developement and unit testing 
//In production a unique run_id value will be passed via top level run all plan
begin
  let split_dir = AI_MFS + "/" + INPUT_FILE_DRIVING_MASK ;
  let string("") v_run_id= if( RUN_ID == "0" ) "??????????????" else  RUN_ID ;
  let pattern = if (INPUT_FILE_DRIVING_MASK == "split") string_concat(INPUT_FILE_DRIVING_MASK ,".*"  ,"." ,  SUBJECT_AREA , "." , TARGET_ENTITY , "." , v_run_id , ".dat.gz")
                else string_concat("placeholder.*.*.*.",SUBJECT_AREA,".",TARGET_ENTITY,".",v_run_id,".dat.gz") ;
  let file_name_vec = directory_listing(split_dir, pattern);
  if ( length_of(file_name_vec) == 0  )
    force_error( string_concat( "No ",INPUT_FILE_DRIVING_MASK ," files found" ,
      ": Target Table: " ,  TARGET_ENTITY ,
      ", Pattern:\\n" , split_dir + "/" , pattern));
  result :: file_name_vec;
end
]|3|9||@{0|}}
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
if ( vec_length > 2) 
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
result :: if(vec_length == 2 or type_vec_length == 0) "in" else string_concat("in." ,string_filter_out(string_split_no_empty(string_lrtrim(matching_type)," ")[1],";")) ;
end;
]|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:eme|$[PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml"]|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:sandbox|$[begin
let string("") dml_file=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml" ;
let string("") dml_file_reduced=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".reduced.dml" ;
result:: if(file_information(dml_file_reduced).found) dml_file_reduced else dml_file;
end]|3|9||@{0|}}
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
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|1190000|518000|0|load.icff|Mukesh Singh|Created 6/1/2011 9:09:11 AM|1|10|0||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1566000|733000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{5|1|1|1|1|1|}Job 'load.icff' Execution Status Report


Job "load.icff" Execution started at Friday, November 15, 2019 01:39:14
***** Job manually cancelled at Friday, November 15, 2019 01:39:59 *****

------------------------------
Job Statistics:

Job status at termination: Cancelled
Run time (wall clock): 0:00:45
Run performed by user manav.jindal
||#! /bin/ksh -e

#Check ids subject are dir
if [[ ! -d $\{IDS_DATA_PATH\} ]];then
        echo "Creating directory $\{IDS_DATA_PATH\}"
        m_mkdir -p -m 2775 $\{IDS_DATA_PATH\}
fi

#Check event file dir
if [[ ! -d $\{PUB_DATAHUB_MFS\}/event/$\{SUBJECT_AREA\} ]];then
        echo "Creating directory $\{PUB_DATAHUB_MFS\}/event/$\{SUBJECT_AREA\}"
        m_mkdir -p -m 2775 $\{PUB_DATAHUB_MFS\}/event/$\{SUBJECT_AREA\}
fi

#Check XREF DIR
XREF_DIR=`dirname $\{XREF_KEY_ICFF_FILE\}`
if [[ ! -d $\{XREF_DIR\} ]];then
        echo "Creating directory $\{XREF_DIR\}"
        m_mkdir -p -m 2775 $\{XREF_DIR\}
fi

#Check REJECT DIR
if [[ ! -d $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\} ]];then
        echo "Creating directory $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\}"
        m_mkdir -p -m 2775 $\{AI_MFS_REJECT\}/load.$\{SUBJECT_AREA\}
fi

#Check MAX_SK DIR
if [[ ! -d $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk ]];then
        echo "Creating directory $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk"
        m_mkdir -p -m 2775 $\{PUB_DATAHUB_SERIAL_LOOKUP\}/ids/$\{SUBJECT_AREA\}/max_sk
fi

#Check AI_SERIAL_LOG IDS Subject Area DIR
if [[ ! -d $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\} ]];then
        echo "Creating directory $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\}"
        m_mkdir -p -m 2775 $\{AI_SERIAL_LOG\}/load.$\{SUBJECT_AREA\}
fi

if [[ ! -f "$ICFF_FILE" ]] ; then
  m_touch "mfile:$ICFF_FILE"
fi

if [[ ! -f "$ICFF_INDEX_FILE" ]] ; then
  m_touch "mfile:$ICFF_INDEX_FILE"
fi

if  [[ ! -f "$XREF_KEY_ICFF_FILE" && $IS_WRITE_MFS_XREF_ICFF == "Y" ]] ; then
 echo IS_WRITE_MFS_XREF_ICFF=$IS_WRITE_MFS_XREF_ICFF
  m_touch "$XREF_KEY_ICFF_FILE"
fi

if  [[ ! -f "$XREF_KEY_INDEX_FILE" && $IS_WRITE_MFS_XREF_ICFF == "Y" ]] ; then
  m_touch "$XREF_KEY_INDEX_FILE"
fi

##Check processed directory exist : AI_MFS/placeholder/processed 
if [ ! -d "$AI_MFS/placeholder/processed" ]; then
  m_mkdir -p -m 2775 "$AI_MFS/placeholder/processed"
fi

##Check processed directory exist : AI_MFS/split/processed 
if [ ! -d "$AI_MFS/split/processed" ]; then
  m_mkdir -p -m 2775 "$AI_MFS/split/processed"
fi


if [[ ! -d `dirname "$EVENT_LOG_FILE"` ]]; then
        m_mkdir -p -m 2775 `dirname "$EVENT_LOG_FILE"`
fi

if  [[ ! -f "$EVENT_LOG_FILE" ]] ; then
  m_touch "$EVENT_LOG_FILE"
fi

COUNT_DIR=`dirname $COUNT_LOG_FL`
if [[ ! -d $COUNT_DIR ]];then
        m_mkdir -m 2775 -p $COUNT_DIR
fi

if [ -f $AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$TARGET_LOWER.summary.log ];then
        export AB_REPORT="summary=$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$TARGET_LOWER.summary.log $AB_REPORT"
fi
|#! /bin/ksh -e

#Move processed files to /processed directory
if [ $mpjret -eq 0 ]
then
        for i in $( echo $INPUT_FILE_STRING \| tr "\|" " " ); do  
                m_mv "$AI_MFS/$INPUT_FILE_DRIVING_MASK/$i" "$AI_MFS/$INPUT_FILE_DRIVING_MASK/processed/$i" 
        done; 
else
        echo "Graph Failed"
fi


if [[ ( x"$AB_APPCONF_EXECUTION" = x"true" \|\| x"$AB_APPCONF_EXECUTION" = x"True" ) && -f "$AI_RAW_TRACKING_FILE" ]]; then
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \| egrep 'Update_Target.Flow_2\| dup\| reject\| second' 1>&2
fi


if [[ ( $mpjret -eq 0 ) && ( "$IS_WRITE_MFS_XREF_ICFF" != "Y") &&  ( x"$XREF_KEY_ICFF_FILE" != "x" ) && ( x"$XREF_KEY_INDEX_TEMP_FILE " != "x" ) ]]
then
        echo " Renaming Non  ICFF temp xref's to main xref's "
        m_mv $XREF_NON_ICFF_LOOKUP_TEMP_FILE $XREF_NON_ICFF_LOOKUP_FILE
        m_mv $XREF_NON_ICFF_INDEX_TEMP_FILE $XREF_NON_ICFF_INDEX_FILE  
fi
|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@HT2||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Trebuchet MS|128|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@IDS LOAD and CDC|458000|69000|0|0|0|0|14584|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Rounded MT Bold|32768|360|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Flow =1 -- New records - for insert

Flow =2 -- Change  record - for update|860000|362000|0|0|0|0|14554|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|90|1|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Target Name: $TARGET_NAME  |505000|155000|0|0|0|0|14438|}}
{2010242002|XXGface|10|0|19|0|{@{}@Trebuchet MS|128|120|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}14651|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14656|2065|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14624|2065|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14643|531|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|1.0|{0|}14635|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14630|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14654|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}14655|17|}}
{2010243001|XXGwatcher|19|0|37|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.22834645211696625|{0|}14633|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14652|2065|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}14634|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.190476194024086|{0|}14597|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}14631|17|}}
{2010600005|XXGgraph|25|0|49|0|{Subgraph created from graph "load.type1.icff"|{}@0|@656000|352500|0|0|0|0|14625|Determine Actions|Mukesh Singh|Created 4/7/2016 5:34:31 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|781000|559000|3|}}
{2010240003|XXGlegend|26|0|51|0|{@{}@//Flow =0 -- Same record
//Flow =1 -- New records - for insert
//Flow =2 -- Change  record - for update
Flow =4 -- Updates that were supressed 
due to reason , I.e they were loaded via placeholder record or have lower  src rank priority|19000|409000|0|0|0|0|10621|}}
{2010242002|XXGface|27|0|53|0|{@{}@Arial|8388608|110|1|}}
{2010240003|XXGlegend|28|0|55|0|{@{}@Same records|484000|32000|0|0|0|0|10496|}}
{2010242002|XXGface|29|0|57|0|{@{}@Arial|16711680|90|1|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}10634|17|}}
{2010501005|XXGpvertex|31|0|61|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|out1_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|out2_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|out3_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|output_index|let decimal ("") insert_record_count=0;
let decimal("") update_record_count=0;
let decimal("") same_record_count=0;
let decimal("") total_record_count=0;
let decimal("") suppressed_update_record_count=0;

output_index_out :: output_index(in) =
begin
        same_record_count = if (in.flag==0) (same_record_count + 1)  else same_record_count;
        insert_record_count = if ( in.flag==1) (insert_record_count + 1 ) else insert_record_count;
        update_record_count  =if ( in.flag==2 ) (update_record_count + 1 )  else update_record_count ;
        suppressed_update_record_count =if ( in.flag==3 ) (suppressed_update_record_count + 1 )  else suppressed_update_record_count ;
        total_record_count =total_record_count +1;
        
  output_index_out :: if(in.flag==0) 
                                        0
                                else if (in.flag==1) 
                                        1
                                else if (in.flag==2) 
                                        2
                                else if (in.flag==3) 
                                        3;
end;


out :: final_log_output() =
begin
       
  out.event_type :: "CDC COUNTS";
   out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count ,
                                   "; SUPPRESSED_UPDATE_RECORD_COUNT =", suppressed_update_record_count ,
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error3_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|155000|195000|0|0|0|0|10635|RFMT:Identify Actions|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|32|0|63|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|33|0|66|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|34|0|68|0|{@{}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|35|0|70|0|{@{}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|36|0|72|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|37|0|74|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|38|0|76|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|39|0|78|0|{@{}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|40|0|80|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|41|0|82|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|42|0|84|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|43|0|86|0|{@{}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|44|0|88|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|90|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|46|0|92|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|4|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform3||8|1|FOl|Reformat transform|{0|}}
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
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out3_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject3_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error3_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|47|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|48|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|49|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|50|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform3||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|51|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|52|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|53|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|54|0|119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|55|0|122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|56|0|125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|57|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|58|0|131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|59|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|60|0|137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|61|0|140|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{DXF_SK_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|191000|100000|0|0|0|0|11090|RFMT:Assign SK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|62|0|142|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|63|0|144|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|64|0|146|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|65|0|148|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|66|0|150|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|152|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|68|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|69|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|70|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|71|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{CDC_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|993250|273500|0|0|0|0|12875|RFMT: Main IDS CDC|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|74|0|175|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|75|0|177|0|{@{}@384|.5|.5|{0|}12874|17|}}
{2010203004|XXGoport|76|0|179|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|77|0|181|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|183|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|185|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|80|0|187|0|{@{}@384|.5|.5|{0|}12873|17|}}
{2010501005|XXGpvertex|81|0|189|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|82|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|83|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|84|0|198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|85|0|201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|86|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|213|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Trash|577000|35000|0|0|0|0|10616|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|88|0|215|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|89|0|218|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153113|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|90|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|91|0|225|0|{@{}@0|0|0|0|out1|.5050100200400801|@@@14352|0|}}
{2010203004|XXGoport|92|0|229|0|{@{}@0|0|0|0|out2|.42765685019206146|@@@13328|0|}}
{2010203004|XXGoport|93|0|233|0|{@{}@0|0|0|0|out0|.6404293381037567|@@@14352|0|}}
{2010202004|XXGiport|94|0|237|0|{@{}@0|0|0|0|in1|.8070175438596491|@@@13840|0|}}
{2010503005|XXGfvertex|95|0|241|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.dups.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.dups.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@407000|550500|389000|280000|56000|50000|14610|Duplicates|Ab Initio Software||1|1000|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|96|0|243|0|{@{}@414000|270000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|97|0|246|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1367640594|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|98|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|99|0|252|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.error.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.error.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$AB_HOME/include/error-info.dml|3|9|f|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.error to Errors.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@1|@159316|552580|151000|271000|56000|50000|14578|Errors|Ab Initio Software||1|100|0||6||32897|-1|-1|}}
{2010202004|XXGiport|100|0|254|0|{@{}@174000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|101|0|257|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|102|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|103|0|262|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|AB_PARAMETER_ENV|3|10|Fd||{0|}}
{30001002|XXparameter|condition:eme|0|3|9||@{0|}}
{30001002|XXparameter|condition:sandbox|$[
not (file_information(XREF_NON_ICFF_LOOKUP_FILE).found && file_information(XREF_NON_ICFF_INDEX_FILE).found)
]|3|9||@{0|}}
}}@0|@170000|60000|0|0|0|0|14551|First Run Activity|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|791000|589000|3|}}
{2010600005|XXGgraph|104|0|264|0|{Subgraph created from graph "First Run Activity"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF == "N"]|3|9|F||{0|}}
}}@0|@236500|88500|0|0|0|0|1|NON ICFF Empty Lookup|Mukesh.singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|558000|328000|3|}}
{2010210004|XXGflow|105|0|266|0|{@{}@384|.5|.5|{0|}28|17|}}
{2010210004|XXGflow|106|0|268|0|{@{}@384|.5|.5|{0|}31|17|}}
{2010210004|XXGflow|107|0|270|0|{@{}@384|.5|.5|{0|}33|17|}}
{2010501005|XXGpvertex|108|0|272|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|num_records|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|59000|114000|0|0|0|0|27|CRT: Generate 0 data|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|109|0|274|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|110|0|277|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|111|0|279|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|112|0|281|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|113|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|114|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|115|0|289|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|116|0|292|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@0|@422000|104000|0|0|0|0|32|OFIL: Xref Non ICFF lookup|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|117|0|294|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|118|0|297|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|119|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|120|0|304|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@0|@427000|239000|0|0|0|0|34|OFIL: Xref Non ICFF lookup index|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|121|0|306|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|122|0|309|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|123|0|311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|124|0|314|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Write Lookup|205000|107000|0|0|0|0|30|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|125|0|316|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|126|0|319|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|127|0|322|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|128|0|325|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count index|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|index0_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,index[*]::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|129|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|130|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|131|0|334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|132|0|341|0|{|{}@0|@882000|195500|0|0|0|0|14632|Generate SK for insert record|Mukesh Singh|Created 5/15/2016 8:16:13 PM|1|100|-1|@9|@36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|615000|285000|3|}}
{2010240003|XXGlegend|133|0|343|0|{@{}@For FACTS ,  data partition value will be assigned in dxf_sk column|15000|36000|0|0|0|0|11078|}}
{2010242002|XXGface|134|0|345|0|{@{}@Arial Narrow|32768|100|0|}}
{2010203004|XXGoport|135|0|348|0|{@{}@0|0|0|0|out0|.4280701754385965|@@@14352|0|}}
{2010202004|XXGiport|136|0|352|0|{@{}@0|0|0|0|in0|.4936708860759494|@@@13840|0|}}
{2010600005|XXGgraph|137|0|356|0|{Subgraph created from graph "load.icff"|{}@0|@1057500|590750|0|0|0|0|14644|Get Count|Mukesh Singh|Created 4/12/2016 4:27:50 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1411000|480000|3|}}
{2010240003|XXGlegend|138|0|358|0|{@{}@Will be deprecated soon|1227000|431000|0|0|0|0|14485|}}
{2010242002|XXGface|139|0|360|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|140|0|362|0|{@{}@Use this for auditing|1088000|132000|0|0|0|0|14440|}}
{2010242002|XXGface|141|0|364|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|142|0|366|0|{@{}@384|.5|.5|{0|}14506|17|}}
{2010210004|XXGflow|143|0|368|0|{@{}@384|.5|.5|{0|}14502|17|}}
{2010210004|XXGflow|144|0|370|0|{@{}@384|.5|.5|{0|}14515|1041|}}
{2010243001|XXGwatcher|145|0|372|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|146|0|374|0|{@{}@384|.5|.5|{0|}14511|17|}}
{2010243001|XXGwatcher|147|0|376|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|148|0|378|0|{@{}@384|.5|.5|{0|}14513|17|}}
{2010243001|XXGwatcher|149|0|380|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|150|0|382|0|{@{}@384|.5|.5|{0|}14508|17|}}
{2010243001|XXGwatcher|151|0|384|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|152|0|386|0|{@{}@384|.5|.5|{0|}14509|17|}}
{2010243001|XXGwatcher|153|0|388|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|154|0|390|0|{@{}@384|.5|.5|{0|}14516|1041|}}
{2010243001|XXGwatcher|155|0|392|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|156|0|394|0|{@{}@0|.5|.5|{0|}14519|17|}}
{2010503005|XXGfvertex|157|0|396|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/load.$SUBJECT_AREA/count.$ILM_NAME.$TARGET_ENTITY.\{RUN_ID\}.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/load.audit.$ILM_NAME.$TARGET_ENTITY.$RUN_ID.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/audit/audit.load_ids_log_count.dml|3|2|f$|@{0|}}
}}@4|@1261000|363000|0|0|0|0|14445|AI_SERIAL File|Ab Initio Software|@1|10000|0||6||33089|-1|-1|}}
{2010202004|XXGiport|158|0|398|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|159|0|401|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|160|0|403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|161|0|406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|event_type=="CDC COUNTS"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Filter by Expression|177000|192500|0|0|0|0|14507|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|162|0|408|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|163|0|411|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|164|0|414|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|165|0|416|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|166|0|418|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|167|0|420|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|168|0|423|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|169|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|170|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|171|0|431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|172|0|434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|174|0|440|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|175|0|443|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$COUNT_LOG_FL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$COUNT_LOG_FL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/audit/audit.load_ids_log_count.dml|3|2|f$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@4|@1113000|218000|0|0|0|0|14520|PUB_DATAHUB file|Ab Initio Software|@1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|176|0|445|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|177|0|448|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|178|0|450|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|179|0|453|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@900000|516500|0|0|0|0|14558|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0||6||34817|1|{1|0|}}}
{2010203004|XXGoport|180|0|455|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|181|0|458|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|182|0|460|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name identifying this Handle Logs component.|{0|}}
{30001002|XXparameter|port_analysis|log=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/log-info.dml")
metadata type: log = in|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|183|0|462|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|184|0|465|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|185|0|473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|let int ilm_parm_len=length_of(string_split("$\{AI_DML\}","/")); 
let string("") v_app_nm=string_split("$\{AI_DML\}","/")[ilm_parm_len - 2 ];
let string("") v_program_nm=string_upcase(string_split("$\{AI_DML\}","/")[ilm_parm_len - 3 ]);


/*Function combining one record from each input to produce one record on the output.*/
out::fuse(in0,in1)=
begin

  out.run_id :: "$\{RUN_ID\}";
  out.run_date :: in0.run_date;
  out.ids_nm :: "$\{TARGET_LOWER\}";
  out.program_nm :: v_program_nm;
  //out.insert_rec_count :: in0.insert_rec_count;
  out.insert_rec_count :: if( "$\{TRUNCATE_AND_LOAD\}" member [vector "True", "true", "1"] )
                                        in0.insert_rec_count + in0.update_rec_count
                                      else
                                        in0.insert_rec_count;
  out.supp_update_rec_count :: in0.supp_update_rec_count;
  //out.update_rec_count :: in0.update_rec_count;
  out.update_rec_count :: if( "$\{TRUNCATE_AND_LOAD\}" member [vector "True", "true", "1"] )
                                                0
                                       else 
                                                in0.update_rec_count;
  out.same_rec_count :: in0.same_rec_count;
  out.total_rec_count :: in0.total_rec_count;
  out.duplicate_rec_count :: in1.duplicate_rec_count ;
   out.* :: in0.*;
  out.application_nm :: v_app_nm;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Fuse|906000|206500|0|0|0|0|14518|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|186|0|475|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|187|0|478|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|188|0|480|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|189|0|482|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|190|0|484|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|191|0|486|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|192|0|488|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|193|0|491|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|194|0|494|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|195|0|496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|196|0|499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|197|0|502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|198|0|505|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|199|0|508|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|200|0|511|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|201|0|514|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|202|0|517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|203|0|522|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string("") v_input_file_name = $[ string_representation(INPUT_FILE)][0];

out :: rollup(in) =
begin
out.duplicate_rec_count :: sum(in.write_count);
out.run_date :: (datetime("YYYYMMDDHH24MISS")) now();
out.ilm_nm :: first_defined(string_split(v_input_file_name,".")[1],"X");
out.file_src_type :: first_defined(string_split(v_input_file_name,".")[0],"X"); 
out.run_id :: $"RUN_ID";
out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$PUB_DXF_DML/audit/audit.load_ids_log_count.dml|3|2|f$|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_MIN|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|@680000|289000|0|0|0|0|14495|RollUp: Count in Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|204|0|524|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|205|0|527|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|206|0|529|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|207|0|531|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|208|0|533|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|209|0|536|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Uskey_changfunction Uskespecifier|3|2|H$||{0|}}
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
{30001002|XXparameter|grouped_input_display_values|Datinogroupebmajokey Datigroupebmajokey|3|2|H$||{0|}}
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
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|210|0|538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|211|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|212|0|544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|213|0|547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|214|0|550|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|215|0|554|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\\x01") component="";
decimal("\\x01") read_count=0;
decimal("\\n") write_count=0;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.component :: if(string_index(in.component,"Map_to_ILM")) string_split(in.component,".")[0] else string_concat(string_split(in.component,".")[0],".",string_split(in.component,".")[1]);
  out.read_count::string_filter(string_split(in.event_text,"(")[0],"0123456789"); //Get read count from flow
  out.write_count:: string_filter(string_split(in.event_text,"(")[0],"0123456789"); //Get read count from flow
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select|string_index(component,"RFMT_Capture_Dup_Count_For_Audit") && event_type=="finish"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Reformat|429000|287500|0|0|0|0|14510|RFMT- Get Dedup Flow Count|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|216|0|556|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|217|0|559|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|218|0|561|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|219|0|563|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|220|0|565|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|221|0|568|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|222|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|223|0|574|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|224|0|577|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|225|0|580|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|226|0|583|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|227|0|593|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|@60000|223000|0|0|0|0|14468|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|595|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|229|0|598|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|230|0|600|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|231|0|602|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|232|0|605|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|233|0|612|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|let datetime("YYYYMMDDHH24MISS") current_time=now1();
/*Do computation*/

out::reformat(in)=
begin
let int v_len= length_of(string_split(in.event_text,";"));

out.insert_rec_count :: string_split(string_split(in.event_text,";")[v_len - v_len ],"=")[1];
out.update_rec_count :: string_split(string_split(in.event_text,";")[v_len - (v_len -1)  ],"=")[1];
out.supp_update_rec_count:: string_split(string_split(in.event_text,";")[v_len - (v_len -2)  ],"=")[1];
out.same_rec_count :: string_split(string_split(in.event_text,";")[v_len - (v_len - 3) ],"=")[1];
out.total_rec_count:: string_split(string_split(in.event_text,";")[v_len  - (v_len -4)  ],"=")[1];
out.run_date:: current_time;
out.run_id :: "$\{RUN_ID\}";
out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|Reformat|434000|95000|0|0|0|0|14512|RFMT-GET CDC count|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|234|0|614|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|235|0|617|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|236|0|619|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|237|0|621|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|238|0|623|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|239|0|626|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|240|0|628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|241|0|632|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|242|0|635|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|243|0|638|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|244|0|641|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|245|0|649|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@4|Replicate|1107000|310000|0|0|0|0|14503|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||4161|1|{1|0|}}}
{2010203004|XXGoport|246|0|651|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|247|0|654|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|248|0|656|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|249|0|658|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|250|0|661|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|251|0|667|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{run_id\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let string("") v_input_file_name = $[ string_representation(INPUT_FILE)][0];

out :: rollup(in) =
begin
  out.insert_rec_count::sum(in.insert_rec_count);
  out.update_rec_count :: sum(in.update_rec_count);
  out.ilm_nm :: first_defined(string_split(v_input_file_name,".")[1],"X");
  out.file_src_type :: first_defined(string_split(v_input_file_name,".")[0],"X"); 
  out.same_rec_count :: sum(in.same_rec_count);
  out.supp_update_rec_count :: sum(in.supp_update_rec_count);
  out.total_rec_count :: sum(in.total_rec_count);
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_MIN|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@4|@675000|94000|0|0|0|0|14514|RollUp: Count -Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|252|0|669|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|253|0|672|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|254|0|674|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|255|0|676|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|256|0|678|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|257|0|681|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Uskey_changfunction Uskespecifier|3|2|H$||{0|}}
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
{30001002|XXparameter|grouped_input_display_values|Datinogroupebmajokey Datigroupebmajokey|3|2|H$||{0|}}
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
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation8|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation9|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation11|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|258|0|683|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|259|0|686|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|260|0|689|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|261|0|692|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|262|0|695|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|263|0|703|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010503005|XXGfvertex|264|0|708|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.invalid.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.invalid.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.invalid to Invalid.write:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@49316|549580|36000|271000|56000|50000|14392|Invalid|Ab Initio Software||1|30000|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|265|0|710|0|{@{}@59000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|266|0|713|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|267|0|715|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|268|0|718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);

let dml_field_info_vec split_dml_info = record_info(SPLIT_DML);

let record 
string("") field_name;
string("") subrec_name;
end[int] split_dml_fields = [vector];


rfmt_xfr = add_local(rfmt_xfr, "target_flds_line", "string('\\\\x01')[int] ", "string_split(in.target_fields_line, '\\\\x01')", "converts vector to local variable to reduce repeated vector operation");

for(let field in split_dml_info) begin
        if(!is_null(field.typename))
                for(let in_field in record_info_item(field.dml_type, "name")) split_dml_fields = vector_append(split_dml_fields, [record field_name in_field subrec_name field.name + "."]);
        else split_dml_fields = vector_append(split_dml_fields, [record field_name field.name subrec_name ""]);
end

for(let field in split_dml_fields) begin
        switch(field.field_name)
                case "is_equal":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "is_equal", "in.is_equal");
                case "drop_record":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "drop_record", "in.drop_record");
                case "matching__eff_dt":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "matching__eff_dt", "in.matching__eff_dt");
                case "dxf_src_dataset_id":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_src_dataset_id", "in.dxf_src_dataset_id");
                case "dxf_src_rec_cnt":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_src_rec_cnt", "in.dxf_src_rec_cnt");
                case "dxf_src_sys_id":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_src_sys_id", "in.dxf_src_sys_id");
                case "dxf_src_file_name":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_src_file_name", "in.dxf_src_file_name");
                case "dxf_hk_part1":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_hk_part1", "in.dxf_hk_part1");
                case "dxf_hk_part2":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_hk_part2", "in.dxf_hk_part2");
                case "dxf_sk":
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + "dxf_sk", "in.dxf_sk");
                case "newline":
                        rfmt_xfr = rfmt_xfr;
                default:
                        //rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + field.field_name, "string_split(in.target_fields_line, '\\\\x01')[" + (string(""))(decimal(""))(index_of(field) - 10) + "]");
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + field.field_name, "target_flds_line[" + (string(""))(decimal(""))(index_of(field) - 10) + "]");
        end;
end

result :: rfmt_xfr;

end
]|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{SPLIT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[INPUT_FILE_DRIVING_MASK == "placeholder"]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|235000|185000|0|0|0|0|5681|RFMT: Re-Construct for Placeholder|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|269|0|720|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|270|0|722|0|{@{}@384|.5|.5|{0|}5680|17|}}
{2010203004|XXGoport|271|0|724|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|272|0|726|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|273|0|728|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|274|0|730|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|275|0|732|0|{@{}@384|.5|.5|{8|166000|269000|186000|269000|270000|269000|291000|269000|}5701|17|}}
{2010501005|XXGpvertex|276|0|734|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|277|0|736|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|278|0|740|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|279|0|743|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|280|0|746|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|281|0|749|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|282|0|752|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|let string("") file_path=string_concat("$\{AI_MFS\}","/","$\{INPUT_FILE_DRIVING_MASK\}","/");
filename :: get_filename(in) =
begin

  filename :: this_partition_path(string_concat( file_path ,in.file_name));
end;|3|3|c|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS/split|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE_EME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$\{READ_SPLIT_PORT_OUT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
}}@1|@252391|63666|272000|84000|118000|113000|130|Read Multiple Splits|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|283|0|754|0|{@{}@389000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|284|0|756|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|285|0|758|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|286|0|760|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|287|0|762|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|288|0|764|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|289|0|766|0|{@{}@262000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|290|0|768|0|{@{}@384|.5|.5|{8|147000|129000|167000|129000|240000|129000|261000|129000|}138|17|}}
{2010501005|XXGpvertex|291|0|770|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|292|0|772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|293|0|775|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|294|0|778|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|295|0|781|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|296|0|784|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|297|0|787|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|298|0|790|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|299|0|793|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(SPLIT_FILE_NAME_VEC) ]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] shred_file_name_vec = $[ string_representation(SPLIT_FILE_NAME_VEC) ];

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
}}@1|@57000|79000|77000|99000|60000|60000|139|Find All Splits|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|300|0|795|0|{@{}@136000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|301|0|798|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|302|0|800|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|303|0|802|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|304|0|804|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|305|0|807|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|306|0|810|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|307|0|817|0|{Subgraph created from graph "load.type1.icff"|{}@0|@355875|341000|0|0|0|0|14657|LookUp and CDC on HASH Keys|Mukesh Singh|Created 4/8/2016 1:07:05 PM|1|100|-1|@9|@36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2065000|579000|3|}}
{2010240003|XXGlegend|308|0|819|0|{@{}@1. CDC Process based on ICFF Data files for DIMS
2.CDC process for FACT based on Xref files
3. This process will also ignore updates from coming source
, if record in IDS is from Golden source .|1207000|499000|0|0|0|0|12783|}}
{2010242002|XXGface|309|0|821|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|310|0|823|0|{@{}@384|.5|.5|{0|}12910|17|}}
{2010210004|XXGflow|311|0|825|0|{@{}@384|.5|.5|{0|}12843|17|}}
{2010210004|XXGflow|312|0|827|0|{@{}@384|.5|.11981566995382309|{0|}12871|1041|}}
{2010243001|XXGwatcher|313|0|829|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|314|0|831|0|{@{}@384|.5|0.0|{0|}12856|1041|}}
{2010243001|XXGwatcher|315|0|833|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|316|0|835|0|{@{}@384|.5|.5|{0|}12911|529|}}
{2010210004|XXGflow|317|0|837|0|{@{}@0|.5|.5|{0|}12858|17|}}
{2010210004|XXGflow|318|0|840|0|{@{}@0|.5|.5|{0|}12913|17|}}
{2010210004|XXGflow|319|0|842|0|{@{}@384|.5|.5|{0|}12840|17|}}
{2010210004|XXGflow|320|0|844|0|{@{}@384|.5|.5|{0|}12870|17|}}
{2010210004|XXGflow|321|0|846|0|{@{}@384|.5|.5|{0|}12854|1041|}}
{2010243001|XXGwatcher|322|0|848|0|{@{}@1|100|-1||0|}}
{2010600005|XXGgraph|323|0|851|0|{Subgraph created from graph "LookUp and CDC on HASH Keys"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@135000|386000|0|0|0|0|12803|Dedup- On Hash of Target NK|Mukesh Singh|Created 6/13/2016 6:54:40 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|576000|389000|3|}}
{2010240003|XXGlegend|324|0|853|0|{@{}@Handle Log source for record count|-465000|-85000|0|0|0|0|11949|}}
{2010242002|XXGface|325|0|855|0|{@{}@Arial Rounded MT Bold|0|100|0|}}
{2010240003|XXGlegend|326|0|857|0|{@{}@Never Change lebel;|194000|289000|0|0|0|0|12068|}}
{2010242002|XXGface|327|0|859|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|328|0|861|0|{@{}@384|.5|.5|{0|}12081|17|}}
{2010210004|XXGflow|329|0|863|0|{@{}@384|.5|.5|{0|}12074|17|}}
{2010501005|XXGpvertex|330|0|865|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2;\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|321000|72500|0|0|0|0|12073|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|331|0|867|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|332|0|869|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|333|0|872|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|334|0|874|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|335|0|876|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|336|0|878|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|337|0|881|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
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
{2010203004|XXGoport|338|0|883|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|339|0|886|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|340|0|889|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|341|0|892|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|342|0|895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|343|0|898|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|344|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|322000|212500|0|0|0|0|12082|RFMT- Capture Dup Count For Audit|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|345|0|908|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|346|0|910|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|347|0|912|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|348|0|914|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|349|0|916|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|350|0|919|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|351|0|921|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|352|0|925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|353|0|928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|354|0|931|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|355|0|934|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|356|0|941|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; src_env_rank; sort_file_date descending; dxf_src_rec_cnt descending\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort within Groups|65000|65000|0|0|0|0|12075|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|357|0|943|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|358|0|946|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|359|0|948|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|360|0|950|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|361|0|953|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|362|0|957|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
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
{30001002|XXparameter|out0_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|345000|160000|0|0|0|0|12909|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|363|0|959|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|364|0|962|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|365|0|964|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|366|0|966|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|367|0|968|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|368|0|971|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|369|0|973|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|370|0|977|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|371|0|980|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|372|0|983|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|373|0|986|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|374|0|990|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|transform0|$[
begin

result :: if(IS_IDS_DML_WITH_NK) 
                add_rules(xfr = make_transform("reformat",[vector make_arg("in")]), 
                        rule_vec = [vector make_rule(lhs = "out.sort_file_date", rhs = string_concat(IDS_MAP_XFR_HINT, ".dxf_src_dataset_id")),
                                                    make_rule(lhs = "out.dxf_src_rec_cnt", rhs = string_concat(IDS_MAP_XFR_HINT, ".dxf_src_rec_cnt")),
                                                    make_rule(lhs = "out.*", rhs = string_concat(IDS_MAP_XFR_HINT, ".*"), priority = 1),
                                                    make_rule(lhs = "out.*", rhs = "in.*", priority = 2)])
             else
                add_rules(xfr = make_transform("reformat",[vector make_arg("in")]), 
                        rule_vec = [vector make_rule(lhs = "out.sort_file_date", rhs = string_concat(IDS_MAP_XFR_HINT, ".dxf_src_dataset_id")),
                                                    make_rule(lhs = "out.dxf_src_rec_cnt", rhs = string_concat(IDS_MAP_XFR_HINT, ".dxf_src_rec_cnt")),
                                                    make_rule(lhs = "out.*", rhs = string_concat(IDS_MAP_XFR_HINT, ".*"), priority = 1)]);
end]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|80000|160000|0|0|0|0|12914|RFMT: Map to IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|375|0|992|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|376|0|995|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|377|0|997|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|378|0|999|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|379|0|1001|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|1003|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|381|0|1005|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|382|0|1009|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|383|0|1012|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|384|0|1015|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|385|0|1018|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|386|0|1026|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010203004|XXGoport|387|0|1030|0|{@{}@0|0|0|0|out1|.6979166666666666|@@@13328|0|}}
{2010202004|XXGiport|388|0|1033|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|389|0|1037|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|flag == 1|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ INPUT_FILE_DRIVING_MASK == "split" and DO_TWO_STEP_LOOKUP == 1  and not USE_XREF_FOR_CDC and not TRUNCATE_AND_LOAD and DATASET_IDENTIFIER != "many" ]|3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|1233000|266000|0|0|0|0|12872|FBE: Segregate Found/Not Found in Main IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|390|0|1039|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|391|0|1042|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|392|0|1045|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|393|0|1047|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|394|0|1049|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|395|0|1051|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|396|0|1054|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|397|0|1056|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|398|0|1059|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|399|0|1062|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|400|0|1065|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|401|0|1068|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|402|0|1071|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|403|0|1079|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[ DATASET_IDENTIFIER == "one" and not TRUNCATE_AND_LOAD and not USE_XREF_FOR_CDC ]|3|9||@{0|}}
{30001002|XXparameter|select_expr|flag == 2|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|676000|381000|0|0|0|0|12845|FBE: Segregate Inserts & Updates|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|404|0|1081|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|405|0|1084|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|406|0|1087|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|407|0|1089|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|408|0|1091|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|409|0|1093|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|410|0|1096|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|411|0|1098|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|412|0|1101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|413|0|1104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|414|0|1107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|415|0|1110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|416|0|1113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|417|0|1121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[DATASET_IDENTIFIER == "one" and not TRUNCATE_AND_LOAD and not USE_XREF_FOR_CDC]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|1697000|451000|0|0|0|0|12857|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|418|0|1123|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|419|0|1126|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|420|0|1131|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|421|0|1133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|422|0|1136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010600005|XXGgraph|423|0|1142|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@633000|171000|0|0|481000|303000|12912|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|424|0|1144|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|425|0|1146|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|426|0|1148|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|427|0|1151|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|428|0|1155|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|429|0|1157|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|430|0|1159|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|431|0|1164|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|432|0|1168|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|433|0|1172|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|434|0|1174|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|435|0|1176|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|436|0|1178|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|437|0|1181|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|438|0|1183|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|439|0|1185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|440|0|1188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|441|0|1193|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|442|0|1195|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|443|0|1197|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|444|0|1200|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|445|0|1202|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|446|0|1205|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|447|0|1211|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|448|0|1214|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|449|0|1219|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ INPUT_FILE_DRIVING_MASK == "split" and DO_TWO_STEP_LOOKUP == 1  and not USE_XREF_FOR_CDC and not TRUNCATE_AND_LOAD and DATASET_IDENTIFIER != "many" ]|3|9||@{0|}}
{30001002|XXparameter|transform0|$\{ARCHIVE_CDC_XFR\}|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|1664000|86000|0|0|0|0|12853|RFMT: CDC With Archive IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|450|0|1221|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|451|0|1224|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|452|0|1226|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|453|0|1228|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|454|0|1230|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|455|0|1233|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|456|0|1235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|457|0|1239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|458|0|1242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|459|0|1245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|460|0|1248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|461|0|1258|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|$BOOKKEEPING_FIELDS_MAP_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|error0_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Read_Shreds.out0 to Read_Shreds.Set_Bookkeeping_Fields.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@1896376|410902|302000|216000|156000|107000|12859|RFMT: Set IDS Audit Fields|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|462|0|1260|0|{@{}@457000|264000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|463|0|1262|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|464|0|1264|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|465|0|1266|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|466|0|1268|0|{@{}@292000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|467|0|1271|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::reformat(in)|3|2|H$|Reformat operation|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out*|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in;out*=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select)|3|2|H$||{0|}}
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
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|468|0|1273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|469|0|1277|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|470|0|1280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|471|0|1283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|472|0|1286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|473|0|1293|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|$\{DIM_XREF_CDC_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[ DATASET_IDENTIFIER == "one" and not TRUNCATE_AND_LOAD and not USE_XREF_FOR_CDC ]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|418000|391000|0|0|0|0|12842|RFMT: XREF CDC|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|474|0|1295|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|475|0|1298|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|476|0|1300|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|477|0|1302|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|478|0|1304|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|479|0|1307|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|480|0|1309|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|481|0|1313|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|482|0|1316|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|483|0|1319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|484|0|1322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|485|0|1329|0|{@{}@0|0|0|0|out0|.40232558139534885|@@@14352|0|}}
{2010203004|XXGoport|486|0|1333|0|{@{}@0|0|0|0|out1|.5235567352355673|@@@13328|0|}}
{2010202004|XXGiport|487|0|1337|0|{@{}@0|0|0|0|in0|.375|@@@13840|0|}}
{2010600005|XXGgraph|488|0|1341|0|{Subgraph created from graph "load.type1.icff"|{}@0|@360000|229750|0|0|0|0|14579|LookUps|Mukesh Singh|Created 4/5/2016 5:28:10 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|471000|666000|3|}}
{2010240003|XXGlegend|489|0|1343|0|{@{}@Disabled input file 
to view ICFF lookup data|294000|119500|0|0|0|0|10281|}}
{2010242002|XXGface|490|0|1345|0|{@{}@Arial|12632256|90|0|}}
{2010240003|XXGlegend|491|0|1347|0|{@{}@This will be IDS ICFF Data file if Dataset is DIM
Will be Xref ICFF Data file if Dataset is FACT|17000|122000|0|0|0|0|10286|}}
{2010242002|XXGface|492|0|1349|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|493|0|1351|0|{@{}@This is a serial lookup file for deciding SRC Rank|197000|349000|0|0|0|0|10309|}}
{2010242002|XXGface|494|0|1353|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|495|0|1355|0|{@{}@384|.5|.5|{0|}10327|17|}}
{2010503005|XXGfvertex|496|0|1357|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$[if(DATASET_IDENTIFIER == "many" or USE_XREF_FOR_CDC) XREF_KEY_FILE_DML else TARGET_NK_DML ]|3|9||@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
}}@0|@76000|58000|0|0|0|0|10301|ICFF_TEMPLATE_IDS|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|497|0|1359|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|498|0|1361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
}}@0|@76000|463000|0|0|0|0|10300|ICFF_TEMPLATE_XREF|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|499|0|1363|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|500|0|1365|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{ICFF_FILE\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{ICFF_FILE\}|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$[if(DATASET_IDENTIFIER == "many") XREF_KEY_FILE_DML else TARGET_DML ]|3|9||@{0|}}
}}@0|@299000|65000|0|0|0|0|10291|ICFF lookup FILE for IDS|Ab Initio Software|@1|400|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|501|0|1367|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|502|0|1369|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1455153111|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|503|0|1371|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|504|0|1374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|9||@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
}}@0|@76000|603000|0|0|0|0|10298|REG_TEMPLATE_XREF|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|505|0|1376|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance orc_file|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|False|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|keep_on_disk.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|block_compressed|False|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|block_compressed.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|orc_file|False|13|1|Fl|Set to true if it is Hive ORC file|{0|}}
{30001002|XXparameter|orc_file.condition|mode lookup version 3.2.2.r15.0: param_exact direct_addressed True param_exact block_compressed False|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|506|0|1378|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DXF_META/lookup.src_envrt_id1.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOOKUP/lookup.src_envrt_id.overridden.$TARGET_LOWER.dat|3|2|$|@{0|}}
{30001002|XXparameter|key|\{src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|~\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|DA_vertex_status\|\}\{56\|CTL10026\|\}\{51\|0\|\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|write_metadata|include "$\{PUB_DXF_DML\}/generic_data_types.dml";
metadata type = ids_src_envrt_lookup_type;|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0262|3|2|$|@{0|}}
}}@0|@281000|272500|0|0|0|0|10328|SRC_ENVRT_ID|Ab Initio Software|@1|6000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|507|0|1380|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|508|0|1383|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0200|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|509|0|1385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|510|0|1388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|num_records|$[length_of(SRC_ENVRT_ID_DATA_OVERRIDDEN)]|3|9||@{0|}}
{30001002|XXparameter|transform|let recs = $[string_representation(SRC_ENVRT_ID_DATA_OVERRIDDEN)];

out::create(index) = begin
  out.* :: recs[index - 1].*;
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|73000|271000|0|0|0|0|10322|SRC_ENVRT_ID Records with Override Ranks|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|511|0|1390|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|512|0|1393|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|513|0|1395|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|514|0|1397|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|515|0|1399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|516|0|1402|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|517|0|1405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|518|0|1410|0|{Subgraph created from graph "load"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|6\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Find_All_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Read_Shreds.Find_All_Shreds.out to Read_Shreds.Read_Shreds.Read_Multiple_Shreds.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@42000|340780|60000|128000|766000|498000|14653|Read Split or Placeholder|Mukesh Singh|Created 4/4/2016 10:47:41 PM|1|10|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.16993464529514313|796000|462000|3|}}
{2010240003|XXGlegend|519|0|1412|0|{@{}@This componenet was added due to problem in 
reading placeholder file with split dml directly|204000|335000|0|0|0|0|5589|}}
{2010242002|XXGface|520|0|1414|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|521|0|1418|0|{@{}@384|.5|.5|{6|714000|323000|714000|343000|714000|364000|}5638|19|}}
{2010501005|XXGpvertex|522|0|1420|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LogFile|file:$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.invalid.log|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Gather_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Validate_Records.log to Read_Shreds.Gather_Logs_Invalid.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@666785|363634|692000|375000|40000|47000|5584|Gather Logs: Invalid|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|523|0|1422|0|{@{}@709000|365000|11000|11000|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|524|0|1425|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|logger|3|1|Hl||{0|}}
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
{2010202004|XXGiport|525|0|1427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|526|0|1430|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Validate_Records.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|reject_threshold|Use limit/ramp|3|1|l|@{0|}}
{30001002|XXparameter|limit|$LOAD_REJECT_LIMIT|3|2|$|@{0|}}
{30001002|XXparameter|ramp|$LOAD_REJECT_RAMP|3|2|$|@{0|}}
{30001002|XXparameter|logging|True|3|1|l|@{0|}}
{30001002|XXparameter|log_reject|1000|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[DO_DATA_VALIDATION]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Set_Bookkeeping_Fields.out0 to Read_Shreds.Validate_Records.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
}}@1|Validate Records|500000|204000|615000|224000|123000|89000|5706|RFMT:Validate Records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|527|0|1432|0|{@{}@737000|264000|11000|11000|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|528|0|1434|0|{@{}@629000|312000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|529|0|1436|0|{@{}@669000|312000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|530|0|1438|0|{@{}@709000|312000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|531|0|1441|0|{@{}@605000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|532|0|1444|0|{Separates valid data records from invalid data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|validate|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1571783024|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Validate Records|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|533|0|1446|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|534|0|1449|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|535|0|1452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|536|0|1455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|537|0|1458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|538|0|1467|0|{Subgraph created from graph "Read Shreds"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|TARGET_NAME|$TARGET_NAME|3|9|RFK|The name of the target dataset to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$TARGET_ENTITY|3|9|RK|The cananonical form of the full "logical" target table name.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_LOWER, "[.].*", "") ]|3|9|RK|The business-friendly or "logical" name of the schema/user/database for the target table.|{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME_VEC|AB_PARAMETER_ENV|3|10|RKd|A vector of shred file names that match both the ILM pattern and the "logical" target table name.|{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME_VEC:eme|$[ [vector INPUT_FILE_DRIVING_MASK + ".\{ILM_NAME\}" + "." + SUBJECT_AREA + "." + TARGET_ENTITY + ".\{RUN_ID\}.dat.gz"] ]|3|9||@{0|}}
{30001002|XXparameter|SPLIT_FILE_NAME_VEC:sandbox|$INPUT_FILE|3|9||@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1397017960|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|FIRST_FILE|$AI_MFS/split/$[ SPLIT_FILE_NAME_VEC[0]]|3|9|FK|first split file|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@20000|201667|34000|233000|592000|364000|5702|Read Splits|Mukesh Singh|Created 4/11/2016 3:08:57 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.2060810774564743|592000|363000|3|}}
{2010210004|XXGflow|539|0|1470|0|{@{}@384|.5|.5|{8|373000|314000|373000|314000|396000|314000|403000|314000|}122|2065|}}
{2010503005|XXGfvertex|540|0|1473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$FIRST_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$\{SPLIT_DML\}|3|3|cj|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@1|@284652|269948|307000|290000|56000|50000|123|For View Data|Kimbo Mundy||1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|541|0|1475|0|{@{}@362000|309000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|542|0|1478|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|543|0|1480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|544|0|1484|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@377000|251666|414000|280000|56000|72000|6|Trash|Ab Initio Software|Built-in|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|545|0|1486|0|{@{}@404000|309000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|546|0|1489|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|547|0|1491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|548|0|1495|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010203004|XXGoport|549|0|1499|0|{@{}@189000|164000|11000|11000|out0|.5|@@@14480|0|}}
{2010203004|XXGoport|550|0|1503|0|{@{}@154000|211000|11000|11000|error|.75|@@@13464|0|}}
{2010203004|XXGoport|551|0|1507|0|{@{}@0|0|0|0|out1|.6407035175879398|@@@13328|0|}}
{2010501005|XXGpvertex|552|0|1511|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|1138000|245000|0|0|0|0|14555|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|553|0|1513|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|554|0|1518|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|555|0|1521|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153113|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|556|0|1523|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|557|0|1526|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|558|0|1532|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$INPUT_FILE_DRIVING_MASK.$ILM_NAME.$TARGET_ENTITY.supp_updates.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$INPUT_FILE_DRIVING_MASK.$ILM_NAME.$TARGET_ENTITY.supp_updates.$RUN_ID.dat.gz|3|2|$|@{0|}}
}}@2|@697000|554500|389000|280000|56000|50000|14605|Supressed Updates|Ab Initio Software||1|100|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|559|0|1534|0|{@{}@414000|270000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|560|0|1537|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1367640594|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|561|0|1539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|562|0|1542|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_IDENTIFIER != "many"]|3|9|F||{0|}}
}}@0|@1351000|122500|0|0|0|0|14598|Update Max SK|Mukesh Singh|Created 5/15/2016 8:15:49 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1358000|605000|3|}}
{2010240003|XXGlegend|563|0|1544|0|{@{}@Create an insert record for Max 
SK if there is zero insert|620000|555000|0|0|0|0|282|}}
{2010242002|XXGface|564|0|1546|0|{@{}@Arial Rounded MT Bold|8421504|110|0|}}
{2010210004|XXGflow|565|0|1548|0|{@{}@384|.5|.5|{0|}327|17|}}
{2010210004|XXGflow|566|0|1550|0|{@{}@384|.5|.5|{0|}333|19|}}
{2010210004|XXGflow|567|0|1552|0|{@{}@384|.5|.5|{0|}339|17|}}
{2010210004|XXGflow|568|0|1554|0|{@{}@384|.5|.5|{0|}328|17|}}
{2010210004|XXGflow|569|0|1556|0|{@{}@384|.5|.5|{0|}332|17|}}
{2010501005|XXGpvertex|570|0|1558|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.sk_value :: "$\{MAX_SK_VALUE\}";
end|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Create Data|667000|452500|0|0|0|0|290|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|571|0|1560|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|572|0|1563|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|573|0|1565|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|574|0|1567|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|575|0|1569|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|576|0|1572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|577|0|1575|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|578|0|1578|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$MAX_SK_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$MAX_SK_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
  decimal("\\n") max_sk = 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@3|@1147000|302500|0|0|0|0|340|Write Max SK file|Ab Initio Software|@1|30000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|579|0|1580|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|580|0|1583|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
{30001002|XXparameter|mode|0x0001|1|2|FH$|modes of access|{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153111|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|write_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|581|0|1585|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|582|0|1588|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|record
  decimal("\\n") sk_value = 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.sk_value :: in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|94000|220000|0|0|0|0|326|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|583|0|1590|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|584|0|1593|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|585|0|1595|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|586|0|1597|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|587|0|1599|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|588|0|1601|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|589|0|1603|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|590|0|1607|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|591|0|1610|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|592|0|1613|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|593|0|1616|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|594|0|1622|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Gather|547000|237500|0|0|0|0|325|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|595|0|1624|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|596|0|1627|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|597|0|1630|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153113|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Gather|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|598|0|1632|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|599|0|1635|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|600|0|1642|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.sk_value :: max(in.sk_value);
end;|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Rollup|305000|200000|0|0|0|0|334|Rollup-Per Partition|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|601|0|1644|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|602|0|1647|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|603|0|1649|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|604|0|1651|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|605|0|1653|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|606|0|1656|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Uskey_changfunction Uskespecifier|3|2|H$||{0|}}
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
{30001002|XXparameter|grouped_input_display_values|Datinogroupebmajokey Datigroupebmajokey|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|607|0|1658|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|608|0|1661|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|609|0|1664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|610|0|1667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|611|0|1670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|612|0|1677|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.max_sk :: max(in.sk_value);   
end|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@3|Rollup|865000|285000|0|0|0|0|329|Rollup-Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|613|0|1679|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|614|0|1682|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|615|0|1684|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|616|0|1686|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|617|0|1688|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|618|0|1692|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, ROLLUP processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Uskey_changfunction Uskespecifier|3|2|H$||{0|}}
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
{30001002|XXparameter|grouped_input_display_values|Datinogroupebmajokey Datigroupebmajokey|3|2|H$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153114|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|619|0|1694|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|620|0|1697|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|621|0|1700|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|622|0|1703|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|623|0|1706|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|624|0|1714|0|{@{}@0|0|0|0|in0|.5278969957081545|@@@13840|0|}}
{2010600005|XXGgraph|625|0|1718|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@35000|60000|0|0|0|0|14550|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|791000|470000|3|}}
{2010240003|XXGlegend|626|0|1720|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|627|0|1722|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|628|0|1724|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|629|0|1726|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|630|0|1728|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|631|0|1730|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|632|0|1732|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|633|0|1734|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|634|0|1736|0|{@{}@1.0|17000|88000|0|0|0|0|14|}}
{2010242002|XXGface|635|0|1738|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|636|0|1740|0|{@{}@Apr 11 2016|82000|88000|0|0|0|0|100|}}
{2010242002|XXGface|637|0|1742|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|638|0|1744|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|101|}}
{2010242002|XXGface|639|0|1746|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|640|0|1748|0|{@{}@Initial version
|412000|83000|0|0|0|0|102|}}
{2010242002|XXGface|641|0|1750|0|{@{}@Arial Narrow|0|100|0|}}
{2010600005|XXGgraph|642|0|1752|0|{Subgraph created from graph "load.type1.icff"|{}@0|@1373000|331500|0|0|0|0|14636|Write  Data Store files|Mukesh Singh|Created 4/7/2016 5:34:21 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|706000|860000|3|}}
{2010240003|XXGlegend|643|0|1754|0|{@{}@Update|337000|696000|0|0|0|0|14022|}}
{2010242002|XXGface|644|0|1756|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010240003|XXGlegend|645|0|1758|0|{@{}@Insert|347000|426000|0|0|0|0|14050|}}
{2010242002|XXGface|646|0|1760|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010240003|XXGlegend|647|0|1762|0|{@{}@Update|347000|506000|0|0|0|0|14051|}}
{2010242002|XXGface|648|0|1764|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010240003|XXGlegend|649|0|1766|0|{@{}@Insert|337000|661000|0|0|0|0|14052|}}
{2010242002|XXGface|650|0|1768|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010210004|XXGflow|651|0|1770|0|{@{}@384|.5|0.0|{0|}14273|1041|}}
{2010210004|XXGflow|652|0|1772|0|{@{}@384|.5|.5404624342918396|{0|}14276|17|}}
{2010210004|XXGflow|653|0|1774|0|{@{}@384|.5|.670694887638092|{0|}14277|17|}}
{2010210004|XXGflow|654|0|1776|0|{@{}@384|.5|.4839650094509125|{0|}14274|1041|}}
{2010210004|XXGflow|655|0|1778|0|{@{}@384|.5|.16254417598247528|{0|}14279|17|}}
{2010210004|XXGflow|656|0|1780|0|{@{}@384|.5|.025974025949835777|{0|}14280|17|}}
{2010501005|XXGpvertex|657|0|1782|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|73000|340000|0|0|0|0|14196|Replicate for Insert|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|658|0|1784|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|659|0|1789|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|660|0|1791|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153113|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|661|0|1793|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|662|0|1796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|663|0|1799|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
}}@2|Replicate|177000|152000|0|0|0|0|13987|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|664|0|1801|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010210004|XXGflow|665|0|1803|0|{@{}@384|.5|.5|{0|}13986|17|}}
{2010202004|XXGiport|666|0|1805|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|667|0|1807|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|668|0|1809|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|669|0|1812|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|670|0|1819|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|38000|620000|0|0|0|0|14199|Replicate for Update|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|671|0|1821|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|672|0|1826|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|673|0|1828|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1455153113|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|674|0|1830|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|675|0|1833|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|676|0|1839|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[(not TRUNCATE_AND_LOAD) && (not IS_SUPRESS_EVENT_FILES)]|3|9|F||{0|}}
}}@0|@474000|407500|0|0|0|0|14278|Write - Event Data Store -Insert & Update|Mukesh Singh|Created 5/25/2016 11:25:54 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|878000|407000|3|}}
{2010210004|XXGflow|677|0|1841|0|{@{}@384|.5|.5|{0|}107|2065|}}
{2010210004|XXGflow|678|0|1843|0|{@{}@384|.5|.5|{0|}109|2065|}}
{2010503005|XXGfvertex|679|0|1845|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INSERT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INSERT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@2|@321000|82500|0|0|0|0|108|Insert|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|680|0|1847|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|681|0|1850|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|682|0|1852|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|683|0|1855|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|59000|48500|0|0|0|0|82|RFMT: Drop NK Fields if any-Insert|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|684|0|1857|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|685|0|1860|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|686|0|1862|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|687|0|1864|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|688|0|1866|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|689|0|1868|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|690|0|1870|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|691|0|1874|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|692|0|1877|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|693|0|1880|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|694|0|1883|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|695|0|1889|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|58000|250000|0|0|0|0|86|RFMT: Drop NK Fields if any-Update|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|696|0|1891|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|697|0|1894|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|698|0|1896|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|699|0|1898|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|700|0|1900|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|701|0|1902|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|702|0|1904|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|703|0|1908|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|704|0|1911|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|705|0|1914|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|706|0|1917|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|707|0|1920|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$UPDATE_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$UPDATE_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0046|3|2|$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@2|@341000|282500|0|0|0|0|110|Update|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|708|0|1922|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|709|0|1925|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|710|0|1927|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|711|0|1934|0|{@{}@0|0|0|0|in0|.26044226044226043|@@@13840|0|}}
{2010202004|XXGiport|712|0|1938|0|{@{}@0|0|0|0|in1|.7051597051597052|@@@13840|0|}}
{2010600005|XXGgraph|713|0|1942|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[TRUNCATE_AND_LOAD && ( not IS_SUPRESS_EVENT_FILES ) ]|3|9|F||{0|}}
}}@0|@464000|617500|0|0|0|0|14281|Write - Event Data Store for Truncate & Load -Insert|Mukesh Singh|Created 5/25/2016 11:25:54 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|770000|407000|3|}}
{2010210004|XXGflow|714|0|1944|0|{@{}@384|.5|.5|{0|}13991|2065|}}
{2010503005|XXGfvertex|715|0|1947|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INSERT_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$INSERT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@2|@567000|142500|0|0|0|0|13992|Insert|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|716|0|1949|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|717|0|1952|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|718|0|1954|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|719|0|1957|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|318000|110000|0|0|0|0|13984|RFMT: Drop NK Fields if any|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|720|0|1959|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|721|0|1962|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|722|0|1964|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|723|0|1966|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|724|0|1968|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|725|0|1971|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|726|0|1973|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|727|0|1977|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|728|0|1980|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|729|0|1983|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|730|0|1986|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|731|0|1994|0|{@{}@0|0|0|0|in0|.4201474201474201|@@@13840|0|}}
{2010600005|XXGgraph|732|0|1999|0|{|{}@0|@489000|207500|0|0|0|0|14275|Write IDS Data Store|Mukesh Singh|Created 4/6/2016 10:00:15 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|793000|555000|3|}}
{2010210004|XXGflow|733|0|2001|0|{@{}@384|.5|.5|{0|}11625|17|}}
{2010210004|XXGflow|734|0|2003|0|{@{}@384|.5|.21468926966190338|{0|}11660|17|}}
{2010210004|XXGflow|735|0|2005|0|{@{}@0|.5|.5|{0|}11662|17|}}
{2010210004|XXGflow|736|0|2007|0|{@{}@384|.5|.12105263024568558|{0|}11664|17|}}
{2010501005|XXGpvertex|737|0|2009|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{$\{ICFF_KEY\}\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Merge|96000|199500|0|0|0|0|11586|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|738|0|2011|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|739|0|2014|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|740|0|2016|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to merge on|{0|}}
{30001002|XXparameter|check_sort|True|13|1|FKl|Abort on first record that is out of sorted order|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.1.2.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|741|0|2018|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|742|0|2021|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010503005|XXGfvertex|743|0|2024|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@494000|64500|0|0|0|0|10601|IDS ICFF|Ab Initio Software|@1|30000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|744|0|2026|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|745|0|2028|0|{@{}@384|.5|.5|{0|}10600|2065|}}
{2010202004|XXGiport|746|0|2030|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|747|0|2032|0|{@{}@384|.5|.5|{0|}10599|17|}}
{2010503005|XXGfvertex|748|0|2034|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|749|0|2036|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|750|0|2039|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|751|0|2044|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_REDUCED_DATASET]|3|9|F||{0|}}
}}@0|@571500|410000|0|0|0|0|11665|Reduced Single ICFF|Mukesh Singh|Created 10/31/2016 3:48:29 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1222000|310000|3|}}
{2010210004|XXGflow|752|0|2046|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|753|0|2048|0|{@{}@384|.5|.5|{0|}12463|17|}}
{2010210004|XXGflow|754|0|2050|0|{@{}@384|.5|.5|{0|}12466|17|}}
{2010210004|XXGflow|755|0|2052|0|{@{}@384|.5|.5|{0|}12415|17|}}
{2010210004|XXGflow|756|0|2054|0|{@{}@384|.5|.5|{0|}12464|2065|}}
{2010210004|XXGflow|757|0|2056|0|{@{}@384|.5|.5|{0|}12426|17|}}
{2010501005|XXGpvertex|758|0|2058|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$REDUCED_FILE_FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(REDUCED_FILE_FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Filter by Expression|252000|147500|0|0|0|0|12417|FBE:Add postFilter|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|759|0|2060|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|760|0|2063|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|761|0|2065|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|762|0|2067|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|763|0|2069|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|764|0|2071|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|765|0|2074|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|766|0|2076|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|767|0|2079|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|768|0|2082|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|769|0|2085|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|770|0|2088|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|771|0|2091|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|772|0|2095|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  if($"NATURAL_KEY" != $"REDUCED_DATASET_ICFF_KEY") reinterpret(get_hash(in, $"REDUCED_DATASET_ICFF_KEY")) else [record dxf_hk_part1 in.dxf_hk_part1 dxf_hk_part2 in.dxf_hk_part2];
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;

   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|48000|125000|0|0|0|0|12412|RFMT:Get Hash On Reduced File Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|773|0|2097|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|774|0|2100|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|775|0|2102|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|776|0|2104|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|777|0|2106|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|778|0|2108|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|779|0|2110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|780|0|2114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|781|0|2117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|782|0|2120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|783|0|2123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|784|0|2132|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
}}@3|@1129000|70250|0|0|0|0|12385|New Data File-4|Ab Initio Software|@1|400|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|785|0|2134|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|786|0|2137|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|787|0|2139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|788|0|2142|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[NATURAL_KEY != REDUCED_DATASET_ICFF_KEY]|3|9||@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@456000|141000|0|0|481000|303000|12428|PBKS:\{ICFF_KEY-dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|789|0|2144|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|790|0|2146|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|791|0|2148|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|792|0|2151|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|793|0|2154|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|794|0|2156|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|795|0|2158|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|796|0|2163|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|797|0|2167|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|798|0|2171|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|799|0|2173|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|800|0|2175|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
}}@2|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|801|0|2177|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|802|0|2180|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|803|0|2182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|804|0|2184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|805|0|2187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|806|0|2192|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@2|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|807|0|2194|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|808|0|2196|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|809|0|2199|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|810|0|2201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|811|0|2204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|812|0|2210|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|813|0|2213|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|814|0|2217|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@974000|70250|0|0|0|0|12465|REDUCED ICFF|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|815|0|2219|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|816|0|2222|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|817|0|2225|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|818|0|2227|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|819|0|2230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|820|0|2234|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@979000|220250|0|0|0|0|12467|REDUCED Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|821|0|2236|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|822|0|2239|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|823|0|2241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|824|0|2245|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Write Block-Compressed Lookup|720000|130250|0|0|0|0|12462|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|825|0|2247|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|826|0|2250|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|827|0|2253|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|828|0|2255|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|829|0|2258|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|830|0|2260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|831|0|2263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|832|0|2266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|833|0|2269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|834|0|2275|0|{@{}@0|0|0|0|in0|.36342592592592593|@@@13840|0|}}
{2010501005|XXGpvertex|835|0|2279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|274000|199500|0|0|0|0|11627|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|836|0|2281|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|837|0|2286|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|838|0|2289|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|839|0|2291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|840|0|2294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|841|0|2300|0|{Subgraph created from graph "Write IDS Data Store"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_IDENTIFIER == "one"]|3|9|F||{0|}}
}}@0|@559000|44000|0|0|0|0|11661|Write Dim Datasets|Mukesh Singh|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|712000|344000|3|}}
{2010210004|XXGflow|842|0|2302|0|{@{}@384|.5|.5|{0|}10576|17|}}
{2010210004|XXGflow|843|0|2306|0|{@{}@384|.5|.5|{0|}10602|17|}}
{2010503005|XXGfvertex|844|0|2309|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@499000|219500|0|0|0|0|10603|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|845|0|2311|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|846|0|2314|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|847|0|2316|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|848|0|2319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Write Block-Compressed Lookup|240000|129500|0|0|0|0|10598|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|849|0|2321|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|850|0|2324|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|851|0|2327|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|852|0|2329|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|853|0|2332|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|854|0|2334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|855|0|2337|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|856|0|2340|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|857|0|2343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|858|0|2349|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|104000|173000|0|0|0|0|10557|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|859|0|2351|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|860|0|2354|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|861|0|2356|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|862|0|2358|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|863|0|2361|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|864|0|2367|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
}}@3|@619000|64500|0|0|0|0|10556|View Data|Ab Initio Software|@1|1000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|865|0|2369|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|866|0|2372|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|867|0|2374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|868|0|2378|0|{@{}@0|0|0|0|in0|.5436046511627907|@@@13840|0|}}
{2010600005|XXGgraph|869|0|2382|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_IDENTIFIER == "many"]|3|9|F||{0|}}
}}@0|@565000|231000|0|0|0|0|11663|Write Multi ICFF|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|653000|521000|3|}}
{2010240003|XXGlegend|870|0|2384|0|{@{}@Write Fact Datasets in IDS many folder|270000|389000|0|0|0|0|11507|}}
{2010242002|XXGface|871|0|2386|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|872|0|2388|0|{@{}@384|.5|.5|{0|}11537|17|}}
{2010210004|XXGflow|873|0|2390|0|{@{}@384|.5|.5|{0|}11534|17|}}
{2010501005|XXGpvertex|874|0|2392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$\{FACT_MULTI_ICFF_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$\{TARGET_NK_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@70000|33000|0|0|0|0|11538|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|875|0|2394|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|876|0|2397|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|877|0|2399|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|878|0|2401|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|879|0|2403|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|880|0|2405|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|881|0|2407|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|882|0|2409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|883|0|2412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|884|0|2415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|885|0|2418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|886|0|2421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|887|0|2424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|888|0|2428|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|Replicate|304000|80000|0|0|0|0|11525|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|889|0|2430|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|890|0|2433|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|891|0|2436|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|892|0|2438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|893|0|2441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|894|0|2446|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|permissions|664|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|@447000|65000|0|0|0|0|11535|WMF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32833|1|{1|0|}}}
{2010203004|XXGoport|895|0|2448|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|896|0|2450|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|897|0|2452|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|898|0|2454|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|899|0|2457|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|900|0|2459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|901|0|2462|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|902|0|2465|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|903|0|2468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|904|0|2473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|$\{FACT_MULTI_ICFF_XFR\}|3|9||@{0|}}
{30001002|XXparameter|key|$\{ICFF_KEY\}|3|3|c|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|permissions|644|3|2|$|@{0|}}
{30001002|XXparameter|overwrite|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Write Multiple Block-Compressed Lookups|270000|186000|0|0|0|0|11539|Write Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 2.14.97:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|905|0|2475|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|906|0|2477|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|907|0|2479|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|908|0|2481|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|909|0|2483|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|910|0|2485|0|{Writes records to a set of output files and indexes them as block-compressed lookups.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-bc-lookups|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/writefiles|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFK$|Field to lookup on|{0|}}
{30001002|XXparameter|key.condition|param direct_addressed False|3|15|P?|@{0|}}
{30001002|XXparameter|key_index||19|2|FK$|Field used for index key|{0|}}
{30001002|XXparameter|key_index.condition|param direct_addressed True|3|15|P?|@{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key write|3|2|$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|continuous|False|13|1|FKl|If True, allow continuous-flow operation. If False, allow batch-mode operation|{0|}}
{30001002|XXparameter|continuous.condition|version 2.14.105:|3|15|P?|@{0|}}
{30001002|XXparameter|grouped|False|13|1|FKl|If True, each output file is closed before a new file is opened.|{0|}}
{30001002|XXparameter|grouped.condition|version 2.14.134:|3|15|P?|@{0|}}
{30001002|XXparameter|block_size|32768|1|2|FK$|Block size for data compression|{0|}}
{30001002|XXparameter|bitmap_size|0|1|2|FK$|Size of the screening bitmap. Set miss_rate instead for automatic sizing.|{0|}}
{30001002|XXparameter|miss_rate|0|1|2|FK$|Specify a value from - 0: No bitmap, 1: Very Low(1 in 10000), 2: Low(1 in 1000), 3: Medium(1 in 100), 4: High(1 in 10). Bitmap is sized automatically to achieve this miss rate.|{0|}}
{30001002|XXparameter|miss_rate.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|compression_level||1|2|FK$|Compression (0 = none, 1 = least, 9 = most, unset = AB_DEFAULT_COMPRESSION_LEVEL)|{0|}}
{30001002|XXparameter|compression_level.condition|version 3.1.2.r10.0:|3|15|P?|@{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if block compressed lookup to be written is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|version 2.15.5.r34:|3|15|P?|@{0|}}
{30001002|XXparameter|overwrite|True|13|1|FKl|If True, overwrite existing output files. If False, append to existing files|{0|}}
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
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|keyword_map|key_index key limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
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
{30001002|XXparameter|log_checkpoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_checkpoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_computepoint|0|15|1|RFKl|Frequency of computepoint records to log|{2|0|1|}}
{30001002|XXparameter|log_computepoint.condition|version 3.0.4.r17: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_computepoint.update_clauses|update_value 1|3|9|P|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|truncate_on_recovery|True|13|1|Kl|If True, allow truncation of output files during recovery. If False, skip data during replay|{0|}}
{30001002|XXparameter|truncate_on_recovery.display_name|truncate-on-recovery|3|9|P|@{0|}}
{30001002|XXparameter|truncate_on_recovery.keyword|truncate-on-recovery|3|9|P|@{0|}}
{30001002|XXparameter|truncate_on_recovery.condition|version 2.15.1.r22:|3|15|P?|@{0|}}
{30001002|XXparameter|empty_type||3|2|H$||{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional output_type write <parameter in_metadata>|3|2|H$|Metadata for records written to output files|{0|}}
{30001002|XXparameter|num_types|5|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filename_type filename "string('')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|type2|indexname_type indexname "string('')"|3|2|H$|Metadata for get_indexname result|{0|}}
{30001002|XXparameter|type3|unused_type unused "int"|3|2|H$|Metadata for output of on_blip function|{0|}}
{30001002|XXparameter|num_operations|8|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation1_analysis|filename::get_filename(in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation2|optional indexname::get_indexname(filename)|3|2|H$|extract index filename from data filename|{0|}}
{30001002|XXparameter|operation3|optional write::reformat(in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|write::reformat(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$|Create address port output record from input record and its direct address|{0|}}
{30001002|XXparameter|operation4_analysis|address::create_address_output(in, bc_lookup_address_type bc_address)|3|2|H$||{0|}}
{30001002|XXparameter|operation5|optional unused::on_blip()|3|2|H$|Invoked on checkpoint or computepoint|{0|}}
{30001002|XXparameter|variable1_analysis|optional output_type write <parameter in_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('')"|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=in; ^write=in;|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=write,w|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|publisher|3|2|H$||{0|}}
{30001002|XXparameter|type4|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type5|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation6|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation7|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation8|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|address_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log,address::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Multiple Block-Compressed Lookups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|911|0|2487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|912|0|2490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|913|0|2493|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|914|0|2496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|915|0|2499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|916|0|2505|0|{@{}@0|0|0|0|in1|.5335892514395394|@@@13840|0|}}
{2010202004|XXGiport|917|0|2509|0|{@{}@0|0|0|0|in0|.53|@@@13840|0|}}
{2010600005|XXGgraph|918|0|2514|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
}}@0|@278000|102500|0|0|0|0|14272|Write Xref files|Mukesh Singh|Created 5/4/2016 8:35:29 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|972000|480000|3|}}
{2010240003|XXGlegend|919|0|2516|0|{@{}@This kind of Xref will be created for very
 large dimension and FACT datasets|461000|28000|0|0|0|0|10705|}}
{2010242002|XXGface|920|0|2518|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|921|0|2520|0|{@{}@This kind of Xref will be created for small to medium 
 sized dimensions|451000|408000|0|0|0|0|10706|}}
{2010242002|XXGface|922|0|2522|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|923|0|2524|0|{@{}@384|.5|.5|{0|}10774|529|}}
{2010210004|XXGflow|924|0|2526|0|{@{}@384|.5|.5|{0|}10784|17|}}
{2010210004|XXGflow|925|0|2528|0|{@{}@384|.5|.5|{0|}10828|17|}}
{2010210004|XXGflow|926|0|2530|0|{@{}@384|.5|.5|{0|}10826|17|}}
{2010501005|XXGpvertex|927|0|2532|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|438000|211500|0|0|0|0|10775|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|928|0|2534|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|929|0|2538|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|930|0|2541|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|931|0|2543|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|932|0|2546|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|933|0|2550|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|81000|176500|0|0|0|0|10785|RFMT: Drop columns|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|934|0|2552|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|935|0|2555|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|936|0|2557|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|937|0|2559|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|938|0|2561|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|939|0|2563|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|940|0|2565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|941|0|2569|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|942|0|2572|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|943|0|2575|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|944|0|2578|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|945|0|2586|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|306000|215000|0|0|0|0|10765|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|946|0|2588|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|947|0|2591|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|948|0|2594|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|949|0|2596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|950|0|2599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|951|0|2605|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="Y" or DATASET_IDENTIFIER == "many" ]|3|9|F||{0|}}
}}@0|@589000|70000|0|0|0|0|10829|Write Multifile Xref ICFF LookUp|Mukesh Singh|Created 6/22/2016 2:01:49 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|631000|309000|3|}}
{2010210004|XXGflow|952|0|2607|0|{@{}@384|.5|.5|{0|}10615|2065|}}
{2010210004|XXGflow|953|0|2609|0|{@{}@384|.5|.5|{0|}10614|17|}}
{2010210004|XXGflow|954|0|2611|0|{@{}@384|.5|.5|{0|}10612|17|}}
{2010503005|XXGfvertex|955|0|2613|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{XREF_KEY_FILE_DML\}|3|3|c|@{0|}}
}}@3|@514000|85000|0|0|0|0|10571|View Data|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|956|0|2615|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|957|0|2618|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|958|0|2620|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|959|0|2623|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|key_index|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Write Block-Compressed Lookup|45000|100000|0|0|0|0|10608|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|960|0|2625|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|961|0|2628|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|962|0|2631|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|963|0|2633|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|964|0|2635|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Block-Compressed Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|965|0|2637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|966|0|2640|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|967|0|2643|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|968|0|2646|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|969|0|2649|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@354000|85000|0|0|0|0|10616|Xref ICFF Data File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|970|0|2651|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|971|0|2654|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|972|0|2657|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|973|0|2659|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|974|0|2662|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|975|0|2668|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_KEY_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_KEY_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@2|@354000|220000|0|0|0|0|10613|Xref ICFF Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|976|0|2670|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|977|0|2673|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|978|0|2675|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|979|0|2679|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|980|0|2683|0|{Subgraph created from graph "Write Xref ICFF's"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_MFS_XREF_ICFF =="N" && DATASET_IDENTIFIER != "many" ]|3|9|F||{0|}}
}}@0|@597500|267000|0|0|0|0|10827|Write Non ICFF Xref LookUp|Mukesh Singh|Created 6/22/2016 2:01:24 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1466000|451000|3|}}
{2010240003|XXGlegend|981|0|2685|0|{@{}@This type of xref is created only for 
dimensions that has less than 10m record

Write index do not support idx append , everytime a new index file has to be created|18000|36000|0|0|0|0|10783|}}
{2010242002|XXGface|982|0|2687|0|{@{}@Arial|32768|100|1|}}
{2010210004|XXGflow|983|0|2689|0|{@{}@384|.5|.5|{0|}10942|529|}}
{2010210004|XXGflow|984|0|2691|0|{@{}@384|.5|.5|{0|}10952|17|}}
{2010210004|XXGflow|985|0|2693|0|{@{}@384|.5|.5|{0|}10954|17|}}
{2010501005|XXGpvertex|986|0|2695|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.dxf_hk.dxf_hk_part1 :: in.dxf_hk_part1;
  out.dxf_hk.dxf_hk_part2 :: in.dxf_hk_part2;
  out.dxf_sk :: in.dxf_sk;
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Reformat|100000|175000|0|0|0|0|10891|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|987|0|2697|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|988|0|2700|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|989|0|2702|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|990|0|2704|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|991|0|2706|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|992|0|2708|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|993|0|2710|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|994|0|2714|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|995|0|2717|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|996|0|2720|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|997|0|2723|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|998|0|2728|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@3|Write Lookup|601000|90000|0|0|0|0|11018|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|999|0|2730|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|1000|0|2732|0|{@{}@384|.5|.5|{0|}11019|17|}}
{2010203004|XXGoport|1001|0|2734|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010210004|XXGflow|1002|0|2736|0|{@{}@384|.5|.5|{0|}11021|17|}}
{2010202004|XXGiport|1003|0|2738|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|1004|0|2740|0|{@{}@384|.5|.5|{0|}10985|17|}}
{2010501005|XXGpvertex|1005|0|2742|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1006|0|2744|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1007|0|2747|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|1008|0|2751|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1009|0|2754|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@3|@855000|220000|0|0|0|0|11022|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|1010|0|2756|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|1011|0|2759|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|1012|0|2761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|1013|0|2767|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|327000|195000|0|0|0|0|10945|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1014|0|2769|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1015|0|2773|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|1016|0|2776|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1017|0|2778|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1018|0|2781|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|1019|0|2787|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="MPP"]|3|9|F||{0|}}
}}@0|@623500|62500|0|0|0|0|10953|for MPP Server Architecture|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|912000|427000|3|}}
{2010240003|XXGlegend|1020|0|2789|0|{@{}@This file will only read one partition of data , since every partion 
will have same data due to usage of brodcast while creating main data file|16000|340000|0|0|0|0|10889|}}
{2010242002|XXGface|1021|0|2791|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|1022|0|2793|0|{@{}@384|.5|.5|{0|}10867|1041|}}
{2010210004|XXGflow|1023|0|2795|0|{@{}@384|.5|.5|{0|}10900|17|}}
{2010210004|XXGflow|1024|0|2797|0|{@{}@384|.5|.5|{0|}10941|17|}}
{2010210004|XXGflow|1025|0|2799|0|{@{}@384|.5|.5|{0|}10950|17|}}
{2010210004|XXGflow|1026|0|2801|0|{@{}@384|.5|.5|{0|}10952|17|}}
{2010210004|XXGflow|1027|0|2803|0|{@{}@384|.5|.5|{0|}10899|17|}}
{2010210004|XXGflow|1028|0|2805|0|{@{}@384|.5|.5|{0|}10937|20|}}
{2010210004|XXGflow|1029|0|2807|0|{@{}@384|.5|.5|{0|}10905|1044|}}
{2010501005|XXGpvertex|1030|0|2809|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Broadcast|470000|115000|0|0|0|0|10871|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1031|0|2811|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|1032|0|2814|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1033|0|2817|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
}}@0|Broadcast|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1034|0|2819|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|1035|0|2822|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1036|0|2826|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key0|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|include "~$PUB_DXF_DML/generic_data_types.dml";

metadata type = xref_serial_lookup_type;|3|3|c|@{0|}}
}}@3|Write Lookup|586000|85000|0|0|0|0|10949|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1037|0|2828|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1038|0|2831|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|1039|0|2834|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1040|0|2837|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1543507692|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|Write Lookup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1041|0|2839|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1042|0|2842|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|1043|0|2846|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1044|0|2849|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INDEX_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_INDEX_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@3|@795000|190000|0|0|0|0|10953|Xref Index file|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|1045|0|2851|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|1046|0|2854|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|1047|0|2856|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|1048|0|2862|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Concatenate|245000|115000|0|0|0|0|10859|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1049|0|2864|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1050|0|2867|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|1051|0|2871|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Concatenate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1052|0|2873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1053|0|2876|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|1054|0|2882|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Partition by Round-robin|215000|250000|0|0|0|0|10906|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1055|0|2884|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|1056|0|2887|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1057|0|2890|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1058|0|2892|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|1059|0|2895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1060|0|2898|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_INPUT_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$XREF_NON_ICFF_INPUT_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[XREF_FILE_EXIST]|3|9||@{0|}}
}}@2|@56000|240000|0|0|0|0|10942|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|1061|0|2900|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1062|0|2903|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|1063|0|2905|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1064|0|2912|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|98000|106500|0|0|0|0|10866|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1065|0|2914|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1066|0|2917|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|1067|0|2919|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1068|0|2921|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1069|0|2924|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|1070|0|2930|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@2|Sort|321000|92500|0|0|0|0|10901|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1071|0|2932|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1072|0|2935|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1073|0|2938|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1074|0|2940|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1075|0|2943|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1076|0|2950|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@3|@791000|85000|0|0|0|0|10951|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|1077|0|2952|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|1078|0|2955|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|1079|0|2957|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|1080|0|2962|0|{@{}@0|0|0|0|in0|.49848024316109424|@@@13840|0|}}
{2010600005|XXGgraph|1081|0|2966|0|{Subgraph created from graph "Write Non ICFF Xref LookUp"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DXF_SERVER_ARCHITECTURE =="SMP"]|3|9|F||{0|}}
}}@0|@628500|237500|0|0|0|0|10955|for SMP Server Architecture|Mukesh Singh|Created 6/24/2016 3:07:05 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|955000|351000|3|}}
{2010210004|XXGflow|1082|0|2968|0|{@{}@384|.5|.5|{0|}10996|17|}}
{2010210004|XXGflow|1083|0|2970|0|{@{}@384|.5|.5|{0|}10998|17|}}
{2010210004|XXGflow|1084|0|2972|0|{@{}@384|.5|.5|{0|}11000|19|}}
{2010210004|XXGflow|1085|0|2977|0|{@{}@384|.5|.5|{0|}10999|18|}}
{2010501005|XXGpvertex|1086|0|2979|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Gather|450000|115000|0|0|0|0|10978|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1087|0|2981|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1088|0|2984|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|1089|0|2987|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1090|0|2989|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1091|0|2992|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|1092|0|2998|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Partition by Round-robin|202000|260000|0|0|0|0|10905|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1093|0|3000|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|1094|0|3003|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1095|0|3006|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Partition by Round-robin|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|1096|0|3008|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|1097|0|3011|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1098|0|3014|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@2|@56000|250000|0|0|0|0|10997|Prev-Xref Data file|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|1099|0|3016|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|1100|0|3019|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|1101|0|3021|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|1102|0|3028|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@2|Replicate|79000|87500|0|0|0|0|10955|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1103|0|3030|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1104|0|3033|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|1105|0|3035|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1106|0|3037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|1107|0|3040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|1108|0|3046|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@2|Sort|266000|92500|0|0|0|0|11001|Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|1109|0|3048|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1110|0|3051|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|1111|0|3055|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1112|0|3057|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|1113|0|3060|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|1114|0|3067|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$XREF_NON_ICFF_LOOKUP_TEMP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$XREF_NON_ICFF_LOOKUP_TEMP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
}}@3|@846000|90000|0|0|0|0|11020|Xref Data file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|1115|0|3069|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|1116|0|3072|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|1117|0|3074|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|1118|0|3079|0|{@{}@0|0|0|0|in0|.39886039886039887|@@@13840|0|}}
{2010202004|XXGiport|1119|0|3083|0|{@{}@0|0|0|0|in0|.56282722513089|@@@13840|0|}}
{2010202004|XXGiport|1120|0|3087|0|{@{}@0|0|0|0|in0|.5318181818181819|@@@13840|0|}}
{2010202004|XXGiport|1121|0|3090|0|{@{}@0|0|0|0|in2|.4166666666666667|@@@13840|0|}}
{2010202004|XXGiport|1122|0|3094|0|{@{}@0|0|0|0|in0|.8824786324786325|@@@13840|0|}}
{2010202004|XXGiport|1123|0|3098|0|{@{}@0|0|0|0|in1|.11533420707732635|@@@13840|0|}}
{2010600005|XXGgraph|1124|0|3102|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/write_event_log.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|UPDATE_FILE|$UPDATE_FILE|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_ID|$ETL_APP_ID|3|9||@{0|}}
}}@0|@1270000|507500|0|0|0|0|14645|Write            Event   Log|Mukesh.Singh|Created 11/16/2016 4:58:07 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|426000|222000|1|}}
{2010210004|XXGflow|1125|0|3104|0|{@{}@384|.5|.5|{0|}13378|17|}}
{2010501005|XXGpvertex|1126|0|3106|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@3|Create Data|52000|102500|0|0|0|0|13377|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1127|0|3108|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1128|0|3111|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1129|0|3113|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|1130|0|3115|0|{|{}@3|@306000|109500|0|0|0|0|13379|Output Event File|Ab Initio Software|@1|400|0||6||33025|-1|-1|}}
{2010202004|XXGiport|1131|0|3117|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|1132|0|3122|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|1|3|2|F$||{0|}}
{30001002|XXparameter|EVENT_CHANNEL_ID|1|3|9|FK|@{0|}}
{30001002|XXparameter|INSERT_FILE|$INSERT_FILE|3|9|RFK||{0|}}
{30001002|XXparameter|UPDATE_FILE||3|9|FK||{0|}}
{30001002|XXparameter|DATASET_NM|$IDS_META_STRING|3|9|RFK||{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$EVENT_LOG_FILE|3|9|RFK||{0|}}
{30001002|XXparameter|IDS_TABLE_NAME|$DATASET_NM|3|9|FK|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1547621801|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|ETL_APP_ID|$(whoami)|3|9|RFK||{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
}}@0|@1245000|482500|0|0|0|0|13514|Write            Event   Log|||1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|426000|222000|3|}}
{2010210004|XXGflow|1133|0|3124|0|{@{}@384|.5|.5|{0|}13378|17|}}
{2010501005|XXGpvertex|1134|0|3126|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|let datetime("YYYYMMDDHH24MISS") curent_datetime=(datetime("YYYYMMDDHH24MISS")) now();
/* let int v_insert_file_sep_id=length_of(string_split("$\{INSERT_FILE\}","/")) ; */
/* let int v_update_file_sep_id=length_of(string_split("$\{UPDATE_FILE\}","/")); */
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
}}@3|Create Data|52000|102500|0|0|0|0|13377|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|1135|0|3128|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1136|0|3131|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1137|0|3133|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|1138|0|3135|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|1139|0|3137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|1140|0|3140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|1141|0|3143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|1142|0|3146|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_LOG_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$EVENT_LOG_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|include "~$PUB_DXF_DML/event/event.dml";
metadata type = event_type;|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@3|@306000|109500|0|0|0|0|13379|Output Event File|Ab Initio Software|@1|400|0||6||33025|-1|-1|}}
{2010202004|XXGiport|1143|0|3148|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|1144|0|3151|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|1145|0|3153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010110002|XXGconstant|1146|0|3156|0|{@{}@{1|444148|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010605001|XXGgraph_legend_legend|8|0|16|0|{2|}1|9|}
{2010241001|XXGlegend_face_face|9|0|18|0|{}9|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_1|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_10|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_11|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_14|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_16|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_2|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_3|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_4|}1|18|}
{2010244001|XXGflow_watcher_watcher|18|0|36|0|{}18|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_5|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_6|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_7|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_8|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_9|}1|24|}
{2010601001|XXGgraph_vertex_vertex|24|0|48|0|{Determine_Actions|}1|25|}
{2010605001|XXGgraph_legend_legend|25|0|50|0|{0|}25|26|}
{2010241001|XXGlegend_face_face|26|0|52|0|{}26|27|}
{2010605001|XXGgraph_legend_legend|27|0|54|0|{1|}25|28|}
{2010241001|XXGlegend_face_face|28|0|56|0|{}28|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_1|}25|30|}
{2010601001|XXGgraph_vertex_vertex|30|0|60|0|{RFMT_Identify_Actions|}25|31|}
{2010212001|XXGvertex_oport_oport|31|0|62|0|{0|out0|}31|32|}
{2010213001|XXGoport_dst_flow|32|0|64|0|{0|}32|30|}
{2010212001|XXGvertex_oport_oport|33|0|65|0|{1|out1|}31|33|}
{2010212001|XXGvertex_oport_oport|34|0|67|0|{2|out2|}31|34|}
{2010212001|XXGvertex_oport_oport|35|0|69|0|{3|out3|}31|35|}
{2010212001|XXGvertex_oport_oport|36|0|71|0|{4|reject0|}31|36|}
{2010212001|XXGvertex_oport_oport|37|0|73|0|{5|reject1|}31|37|}
{2010212001|XXGvertex_oport_oport|38|0|75|0|{6|reject2|}31|38|}
{2010212001|XXGvertex_oport_oport|39|0|77|0|{7|reject3|}31|39|}
{2010212001|XXGvertex_oport_oport|40|0|79|0|{8|error0|}31|40|}
{2010212001|XXGvertex_oport_oport|41|0|81|0|{9|error1|}31|41|}
{2010212001|XXGvertex_oport_oport|42|0|83|0|{10|error2|}31|42|}
{2010212001|XXGvertex_oport_oport|43|0|85|0|{11|error3|}31|43|}
{2010212001|XXGvertex_oport_oport|44|0|87|0|{12|log|}31|44|}
{2010211001|XXGvertex_iport_iport|45|0|89|0|{0|in|}31|45|}
{2010007001|XXGobject_proto_object|46|0|91|0|{}31|46|}
{2010212001|XXGvertex_oport_oport|47|0|93|0|{0|out0|}46|47|}
{2010006001|XXGobject_psameas_object|48|0|95|0|{metadata|out0_metadata|1|0|}47|46|}
{2010006001|XXGobject_psameas_object|49|0|96|0|{transform0|transform0|1|0|}47|46|}
{2010212001|XXGvertex_oport_oport|50|0|97|0|{1|out1|}46|48|}
{2010006001|XXGobject_psameas_object|51|0|99|0|{metadata|out1_metadata|1|0|}48|46|}
{2010006001|XXGobject_psameas_object|52|0|100|0|{transform1|transform1|1|0|}48|46|}
{2010212001|XXGvertex_oport_oport|53|0|101|0|{2|out2|}46|49|}
{2010006001|XXGobject_psameas_object|54|0|103|0|{metadata|out2_metadata|1|0|}49|46|}
{2010006001|XXGobject_psameas_object|55|0|104|0|{transform2|transform2|1|0|}49|46|}
{2010212001|XXGvertex_oport_oport|56|0|105|0|{3|out3|}46|50|}
{2010006001|XXGobject_psameas_object|57|0|107|0|{metadata|out3_metadata|1|0|}50|46|}
{2010006001|XXGobject_psameas_object|58|0|108|0|{transform3|transform3|1|0|}50|46|}
{2010212001|XXGvertex_oport_oport|59|0|109|0|{4|reject0|}46|51|}
{2010006001|XXGobject_psameas_object|60|0|111|0|{metadata|reject0_metadata|1|0|}51|46|}
{2010212001|XXGvertex_oport_oport|61|0|112|0|{5|reject1|}46|52|}
{2010006001|XXGobject_psameas_object|62|0|114|0|{metadata|reject1_metadata|1|0|}52|46|}
{2010212001|XXGvertex_oport_oport|63|0|115|0|{6|reject2|}46|53|}
{2010006001|XXGobject_psameas_object|64|0|117|0|{metadata|reject2_metadata|1|0|}53|46|}
{2010212001|XXGvertex_oport_oport|65|0|118|0|{7|reject3|}46|54|}
{2010006001|XXGobject_psameas_object|66|0|120|0|{metadata|reject3_metadata|1|0|}54|46|}
{2010212001|XXGvertex_oport_oport|67|0|121|0|{8|error0|}46|55|}
{2010006001|XXGobject_psameas_object|68|0|123|0|{metadata|error0_metadata|1|0|}55|46|}
{2010212001|XXGvertex_oport_oport|69|0|124|0|{9|error1|}46|56|}
{2010006001|XXGobject_psameas_object|70|0|126|0|{metadata|error1_metadata|1|0|}56|46|}
{2010212001|XXGvertex_oport_oport|71|0|127|0|{10|error2|}46|57|}
{2010006001|XXGobject_psameas_object|72|0|129|0|{metadata|error2_metadata|1|0|}57|46|}
{2010212001|XXGvertex_oport_oport|73|0|130|0|{11|error3|}46|58|}
{2010006001|XXGobject_psameas_object|74|0|132|0|{metadata|error3_metadata|1|0|}58|46|}
{2010212001|XXGvertex_oport_oport|75|0|133|0|{12|log|}46|59|}
{2010006001|XXGobject_psameas_object|76|0|135|0|{metadata|log_metadata|1|0|}59|46|}
{2010211001|XXGvertex_iport_iport|77|0|136|0|{0|in|}46|60|}
{2010006001|XXGobject_psameas_object|78|0|138|0|{metadata|in_metadata|1|0|}60|46|}
{2010006001|XXGobject_psameas_object|79|0|139|0|{Layout|Layout|0|0|}31|61|}
{2010212001|XXGvertex_oport_oport|80|0|141|0|{0|out0|}61|62|}
{2010212001|XXGvertex_oport_oport|81|0|143|0|{1|reject0|}61|63|}
{2010212001|XXGvertex_oport_oport|82|0|145|0|{2|error0|}61|64|}
{2010212001|XXGvertex_oport_oport|83|0|147|0|{3|log|}61|65|}
{2010211001|XXGvertex_iport_iport|84|0|149|0|{0|in|}61|66|}
{2010007001|XXGobject_proto_object|85|0|151|0|{}61|67|}
{2010212001|XXGvertex_oport_oport|86|0|153|0|{0|out0|}67|68|}
{2010006001|XXGobject_psameas_object|87|0|155|0|{metadata|out0_metadata|1|0|}68|67|}
{2010006001|XXGobject_psameas_object|88|0|156|0|{transform0|transform0|1|0|}68|67|}
{2010212001|XXGvertex_oport_oport|89|0|157|0|{1|reject0|}67|69|}
{2010006001|XXGobject_psameas_object|90|0|159|0|{metadata|reject0_metadata|1|0|}69|67|}
{2010212001|XXGvertex_oport_oport|91|0|160|0|{2|error0|}67|70|}
{2010006001|XXGobject_psameas_object|92|0|162|0|{metadata|error0_metadata|1|0|}70|67|}
{2010212001|XXGvertex_oport_oport|93|0|163|0|{3|log|}67|71|}
{2010006001|XXGobject_psameas_object|94|0|165|0|{metadata|log_metadata|1|0|}71|67|}
{2010211001|XXGvertex_iport_iport|95|0|166|0|{0|in|}67|72|}
{2010006001|XXGobject_psameas_object|96|0|168|0|{metadata|in_metadata|1|0|}72|67|}
{2010006001|XXGobject_psameas_object|97|0|169|0|{in_metadata|out1_metadata|0|0|}61|31|}
{2010006001|XXGobject_psameas_object|98|0|170|0|{out0_metadata|out1_metadata|0|0|}61|31|}
{2010006001|XXGobject_psameas_object|99|0|171|0|{reject0_metadata|out1_metadata|0|0|}61|31|}
{2010006001|XXGobject_psameas_object|100|0|172|0|{in_metadata|in_metadata|0|0|}31|73|}
{2010212001|XXGvertex_oport_oport|101|0|174|0|{0|out0|}73|74|}
{2010213001|XXGoport_dst_flow|102|0|176|0|{0|}74|75|}
{2010212001|XXGvertex_oport_oport|103|0|178|0|{1|reject0|}73|76|}
{2010212001|XXGvertex_oport_oport|104|0|180|0|{2|error0|}73|77|}
{2010212001|XXGvertex_oport_oport|105|0|182|0|{3|log|}73|78|}
{2010211001|XXGvertex_iport_iport|106|0|184|0|{0|in|}73|79|}
{2010214001|XXGiport_src_flow|107|0|186|0|{0|}79|80|}
{2010007001|XXGobject_proto_object|108|0|188|0|{}73|81|}
{2010212001|XXGvertex_oport_oport|109|0|190|0|{0|out0|}81|82|}
{2010006001|XXGobject_psameas_object|110|0|192|0|{metadata|out0_metadata|1|0|}82|81|}
{2010006001|XXGobject_psameas_object|111|0|193|0|{transform0|transform0|1|0|}82|81|}
{2010212001|XXGvertex_oport_oport|112|0|194|0|{1|reject0|}81|83|}
{2010006001|XXGobject_psameas_object|113|0|196|0|{metadata|reject0_metadata|1|0|}83|81|}
{2010212001|XXGvertex_oport_oport|114|0|197|0|{2|error0|}81|84|}
{2010006001|XXGobject_psameas_object|115|0|199|0|{metadata|error0_metadata|1|0|}84|81|}
{2010212001|XXGvertex_oport_oport|116|0|200|0|{3|log|}81|85|}
{2010006001|XXGobject_psameas_object|117|0|202|0|{metadata|log_metadata|1|0|}85|81|}
{2010211001|XXGvertex_iport_iport|118|0|203|0|{0|in|}81|86|}
{2010006001|XXGobject_psameas_object|119|0|205|0|{metadata|in_metadata|1|0|}86|81|}
{2010006001|XXGobject_psameas_object|120|0|206|0|{Layout|Layout|0|0|}73|61|}
{2010006001|XXGobject_psameas_object|121|0|207|0|{reject0_metadata|in_metadata|0|0|}73|73|}
{2010006001|XXGobject_psameas_object|122|0|208|0|{reject0_metadata|in_metadata|0|0|}31|73|}
{2010006001|XXGobject_psameas_object|123|0|209|0|{reject1_metadata|in_metadata|0|0|}31|73|}
{2010006001|XXGobject_psameas_object|124|0|210|0|{reject2_metadata|in_metadata|0|0|}31|73|}
{2010006001|XXGobject_psameas_object|125|0|211|0|{reject3_metadata|in_metadata|0|0|}31|73|}
{2010601001|XXGgraph_vertex_vertex|126|0|212|0|{Trash|}25|87|}
{2010211001|XXGvertex_iport_iport|127|0|214|0|{0|in|}87|88|}
{2010214001|XXGiport_src_flow|128|0|216|0|{0|}88|30|}
{2010007001|XXGobject_proto_object|129|0|217|0|{}87|89|}
{2010211001|XXGvertex_iport_iport|130|0|219|0|{0|in|}89|90|}
{2010006001|XXGobject_psameas_object|131|0|221|0|{metadata|in_metadata|1|0|}90|89|}
{2010006001|XXGobject_psameas_object|132|0|222|0|{Layout|Layout|0|0|}87|61|}
{2010006001|XXGobject_psameas_object|133|0|223|0|{in_metadata|out0_metadata|0|0|}87|31|}
{2010212001|XXGvertex_oport_oport|134|0|224|0|{0|out1|}25|91|}
{2010216002|XXGoport_binding_oport|135|0|226|0|{.5|.5|{0|}10637|}91|33|}
{2010213001|XXGoport_dst_flow|136|0|227|0|{0|}91|16|}
{2010212001|XXGvertex_oport_oport|137|0|228|0|{1|out2|}25|92|}
{2010216002|XXGoport_binding_oport|138|0|230|0|{.5|.5|{0|}10638|}92|35|}
{2010213001|XXGoport_dst_flow|139|0|231|0|{0|}92|13|}
{2010212001|XXGvertex_oport_oport|140|0|232|0|{2|out0|}25|93|}
{2010216002|XXGoport_binding_oport|141|0|234|0|{.5|.5|{0|}10639|}93|34|}
{2010213001|XXGoport_dst_flow|142|0|235|0|{0|}93|22|}
{2010211001|XXGvertex_iport_iport|143|0|236|0|{0|in1|}25|94|}
{2010215002|XXGiport_binding_iport|144|0|238|0|{.5|.5|{0|}10636|}94|45|}
{2010214001|XXGiport_src_flow|145|0|239|0|{0|}94|18|}
{2010601001|XXGgraph_vertex_vertex|146|0|240|0|{Duplicates|}1|95|}
{2010211001|XXGvertex_iport_iport|147|0|242|0|{0|write|}95|96|}
{2010214001|XXGiport_src_flow|148|0|244|0|{0|}96|12|}
{2010007001|XXGobject_proto_object|149|0|245|0|{}95|97|}
{2010211001|XXGvertex_iport_iport|150|0|247|0|{0|write|}97|98|}
{2010006001|XXGobject_psameas_object|151|0|249|0|{metadata|write_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|152|0|250|0|{write_metadata|in_metadata|0|0|}95|73|}
{2010601001|XXGgraph_vertex_vertex|153|0|251|0|{Errors|}1|99|}
{2010211001|XXGvertex_iport_iport|154|0|253|0|{0|write|}99|100|}
{2010214001|XXGiport_src_flow|155|0|255|0|{0|}100|11|}
{2010007001|XXGobject_proto_object|156|0|256|0|{}99|101|}
{2010211001|XXGvertex_iport_iport|157|0|258|0|{0|write|}101|102|}
{2010006001|XXGobject_psameas_object|158|0|260|0|{metadata|write_metadata|1|0|}102|101|}
{2010601001|XXGgraph_vertex_vertex|159|0|261|0|{First_Run_Activity|}1|103|}
{2010601001|XXGgraph_vertex_vertex|160|0|263|0|{NON_ICFF_Empty_Lookup|}103|104|}
{2010604001|XXGgraph_flow_flow|161|0|265|0|{Flow_1|}104|105|}
{2010604001|XXGgraph_flow_flow|162|0|267|0|{Flow_2|}104|106|}
{2010604001|XXGgraph_flow_flow|163|0|269|0|{Flow_3|}104|107|}
{2010601001|XXGgraph_vertex_vertex|164|0|271|0|{CRT_Generate_0_data|}104|108|}
{2010212001|XXGvertex_oport_oport|165|0|273|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|166|0|275|0|{0|}109|105|}
{2010212001|XXGvertex_oport_oport|167|0|276|0|{1|error|}108|110|}
{2010212001|XXGvertex_oport_oport|168|0|278|0|{2|log|}108|111|}
{2010007001|XXGobject_proto_object|169|0|280|0|{}108|112|}
{2010212001|XXGvertex_oport_oport|170|0|282|0|{0|out|}112|113|}
{2010006001|XXGobject_psameas_object|171|0|284|0|{metadata|out_metadata|1|0|}113|112|}
{2010212001|XXGvertex_oport_oport|172|0|285|0|{1|error|}112|114|}
{2010006001|XXGobject_psameas_object|173|0|287|0|{metadata|error_metadata|1|0|}114|112|}
{2010212001|XXGvertex_oport_oport|174|0|288|0|{2|log|}112|115|}
{2010006001|XXGobject_psameas_object|175|0|290|0|{metadata|log_metadata|1|0|}115|112|}
{2010006001|XXGobject_psameas_object|176|0|291|0|{Layout|Layout|0|0|}108|116|}
{2010211001|XXGvertex_iport_iport|177|0|293|0|{0|write|}116|117|}
{2010214001|XXGiport_src_flow|178|0|295|0|{0|}117|106|}
{2010007001|XXGobject_proto_object|179|0|296|0|{}116|118|}
{2010211001|XXGvertex_iport_iport|180|0|298|0|{0|write|}118|119|}
{2010006001|XXGobject_psameas_object|181|0|300|0|{metadata|write_metadata|1|0|}119|118|}
{2010006001|XXGobject_psameas_object|182|0|301|0|{out_metadata|write_metadata|0|0|}108|116|}
{2010601001|XXGgraph_vertex_vertex|183|0|302|0|{OFIL_Xref_Non_ICFF_lookup|}104|116|}
{2010601001|XXGgraph_vertex_vertex|184|0|303|0|{OFIL_Xref_Non_ICFF_lookup_index|}104|120|}
{2010211001|XXGvertex_iport_iport|185|0|305|0|{0|write|}120|121|}
{2010214001|XXGiport_src_flow|186|0|307|0|{0|}121|107|}
{2010007001|XXGobject_proto_object|187|0|308|0|{}120|122|}
{2010211001|XXGvertex_iport_iport|188|0|310|0|{0|write|}122|123|}
{2010006001|XXGobject_psameas_object|189|0|312|0|{metadata|write_metadata|1|0|}123|122|}
{2010006001|XXGobject_psameas_object|190|0|313|0|{write_metadata|index0_metadata|0|0|}120|124|}
{2010212001|XXGvertex_oport_oport|191|0|315|0|{0|out|}124|125|}
{2010213001|XXGoport_dst_flow|192|0|317|0|{0|}125|106|}
{2010212001|XXGvertex_oport_oport|193|0|318|0|{1|index0|}124|126|}
{2010213001|XXGoport_dst_flow|194|0|320|0|{0|}126|107|}
{2010211001|XXGvertex_iport_iport|195|0|321|0|{0|in|}124|127|}
{2010214001|XXGiport_src_flow|196|0|323|0|{0|}127|105|}
{2010007001|XXGobject_proto_object|197|0|324|0|{}124|128|}
{2010212001|XXGvertex_oport_oport|198|0|326|0|{0|out|}128|129|}
{2010006001|XXGobject_psameas_object|199|0|328|0|{metadata|out_metadata|1|0|}129|128|}
{2010212001|XXGvertex_oport_oport|200|0|329|0|{1|index0|}128|130|}
{2010006001|XXGobject_psameas_object|201|0|331|0|{key0|key0|1|0|}130|128|}
{2010006001|XXGobject_psameas_object|202|0|332|0|{metadata|index0_metadata|1|0|}130|128|}
{2010211001|XXGvertex_iport_iport|203|0|333|0|{0|in|}128|131|}
{2010006001|XXGobject_psameas_object|204|0|335|0|{metadata|in_metadata|1|0|}131|128|}
{2010006001|XXGobject_psameas_object|205|0|336|0|{Layout|Layout|0|0|}124|116|}
{2010006001|XXGobject_psameas_object|206|0|337|0|{in_metadata|write_metadata|0|0|}124|116|}
{2010006001|XXGobject_psameas_object|207|0|338|0|{out_metadata|write_metadata|0|0|}124|116|}
{2010601001|XXGgraph_vertex_vertex|208|0|339|0|{Write_Lookup|}104|124|}
{2010601001|XXGgraph_vertex_vertex|209|0|340|0|{Generate_SK_for_insert_record|}1|132|}
{2010605001|XXGgraph_legend_legend|210|0|342|0|{0|}132|133|}
{2010241001|XXGlegend_face_face|211|0|344|0|{}133|134|}
{2010601001|XXGgraph_vertex_vertex|212|0|346|0|{RFMT_Assign_SK|}132|61|}
{2010212001|XXGvertex_oport_oport|213|0|347|0|{0|out0|}132|135|}
{2010216002|XXGoport_binding_oport|214|0|349|0|{.5|.5|{0|}11089|}135|62|}
{2010213001|XXGoport_dst_flow|215|0|350|0|{0|}135|24|}
{2010211001|XXGvertex_iport_iport|216|0|351|0|{0|in0|}132|136|}
{2010215002|XXGiport_binding_iport|217|0|353|0|{.5|.5|{0|}11088|}136|66|}
{2010214001|XXGiport_src_flow|218|0|354|0|{0|}136|16|}
{2010601001|XXGgraph_vertex_vertex|219|0|355|0|{Get_Count|}1|137|}
{2010605001|XXGgraph_legend_legend|220|0|357|0|{0|}137|138|}
{2010241001|XXGlegend_face_face|221|0|359|0|{}138|139|}
{2010605001|XXGgraph_legend_legend|222|0|361|0|{1|}137|140|}
{2010241001|XXGlegend_face_face|223|0|363|0|{}140|141|}
{2010604001|XXGgraph_flow_flow|224|0|365|0|{Flow_1|}137|142|}
{2010604001|XXGgraph_flow_flow|225|0|367|0|{Flow_10|}137|143|}
{2010604001|XXGgraph_flow_flow|226|0|369|0|{Flow_2|}137|144|}
{2010244001|XXGflow_watcher_watcher|227|0|371|0|{}144|145|}
{2010604001|XXGgraph_flow_flow|228|0|373|0|{Flow_3|}137|146|}
{2010244001|XXGflow_watcher_watcher|229|0|375|0|{}146|147|}
{2010604001|XXGgraph_flow_flow|230|0|377|0|{Flow_4|}137|148|}
{2010244001|XXGflow_watcher_watcher|231|0|379|0|{}148|149|}
{2010604001|XXGgraph_flow_flow|232|0|381|0|{Flow_5|}137|150|}
{2010244001|XXGflow_watcher_watcher|233|0|383|0|{}150|151|}
{2010604001|XXGgraph_flow_flow|234|0|385|0|{Flow_6|}137|152|}
{2010244001|XXGflow_watcher_watcher|235|0|387|0|{}152|153|}
{2010604001|XXGgraph_flow_flow|236|0|389|0|{Flow_7|}137|154|}
{2010244001|XXGflow_watcher_watcher|237|0|391|0|{}154|155|}
{2010604001|XXGgraph_flow_flow|238|0|393|0|{Flow_8|}137|156|}
{2010601001|XXGgraph_vertex_vertex|239|0|395|0|{AI_SERIAL_File|}137|157|}
{2010211001|XXGvertex_iport_iport|240|0|397|0|{0|write|}157|158|}
{2010214001|XXGiport_src_flow|241|0|399|0|{0|}158|143|}
{2010007001|XXGobject_proto_object|242|0|400|0|{}157|159|}
{2010211001|XXGvertex_iport_iport|243|0|402|0|{0|write|}159|160|}
{2010006001|XXGobject_psameas_object|244|0|404|0|{metadata|write_metadata|1|0|}160|159|}
{2010601001|XXGgraph_vertex_vertex|245|0|405|0|{Filter_by_Expression|}137|161|}
{2010212001|XXGvertex_oport_oport|246|0|407|0|{0|out|}161|162|}
{2010213001|XXGoport_dst_flow|247|0|409|0|{0|}162|146|}
{2010212001|XXGvertex_oport_oport|248|0|410|0|{1|deselect|}161|163|}
{2010213001|XXGoport_dst_flow|249|0|412|0|{0|}163|150|}
{2010212001|XXGvertex_oport_oport|250|0|413|0|{2|reject|}161|164|}
{2010212001|XXGvertex_oport_oport|251|0|415|0|{3|error|}161|165|}
{2010212001|XXGvertex_oport_oport|252|0|417|0|{4|log|}161|166|}
{2010211001|XXGvertex_iport_iport|253|0|419|0|{0|in|}161|167|}
{2010214001|XXGiport_src_flow|254|0|421|0|{0|}167|142|}
{2010007001|XXGobject_proto_object|255|0|422|0|{}161|168|}
{2010212001|XXGvertex_oport_oport|256|0|424|0|{0|out|}168|169|}
{2010006001|XXGobject_psameas_object|257|0|426|0|{metadata|out_metadata|1|0|}169|168|}
{2010212001|XXGvertex_oport_oport|258|0|427|0|{1|deselect|}168|170|}
{2010006001|XXGobject_psameas_object|259|0|429|0|{metadata|deselect_metadata|1|0|}170|168|}
{2010212001|XXGvertex_oport_oport|260|0|430|0|{2|reject|}168|171|}
{2010006001|XXGobject_psameas_object|261|0|432|0|{metadata|reject_metadata|1|0|}171|168|}
{2010212001|XXGvertex_oport_oport|262|0|433|0|{3|error|}168|172|}
{2010006001|XXGobject_psameas_object|263|0|435|0|{metadata|error_metadata|1|0|}172|168|}
{2010212001|XXGvertex_oport_oport|264|0|436|0|{4|log|}168|173|}
{2010006001|XXGobject_psameas_object|265|0|438|0|{metadata|log_metadata|1|0|}173|168|}
{2010211001|XXGvertex_iport_iport|266|0|439|0|{0|in|}168|174|}
{2010006001|XXGobject_psameas_object|267|0|441|0|{metadata|in_metadata|1|0|}174|168|}
{2010006001|XXGobject_psameas_object|268|0|442|0|{Layout|Layout|0|0|}161|175|}
{2010211001|XXGvertex_iport_iport|269|0|444|0|{0|write|}175|176|}
{2010214001|XXGiport_src_flow|270|0|446|0|{0|}176|156|}
{2010007001|XXGobject_proto_object|271|0|447|0|{}175|177|}
{2010211001|XXGvertex_iport_iport|272|0|449|0|{0|write|}177|178|}
{2010006001|XXGobject_psameas_object|273|0|451|0|{metadata|write_metadata|1|0|}178|177|}
{2010006001|XXGobject_psameas_object|274|0|452|0|{deselect_metadata|in_metadata|0|0|}161|179|}
{2010212001|XXGvertex_oport_oport|275|0|454|0|{0|log|}179|180|}
{2010213001|XXGoport_dst_flow|276|0|456|0|{0|}180|14|}
{2010211001|XXGvertex_iport_iport|277|0|457|0|{0|in|}179|181|}
{2010007001|XXGobject_proto_object|278|0|459|0|{}179|182|}
{2010212001|XXGvertex_oport_oport|279|0|461|0|{0|log|}182|183|}
{2010006001|XXGobject_psameas_object|280|0|463|0|{metadata|log_metadata|1|0|}183|182|}
{2010211001|XXGvertex_iport_iport|281|0|464|0|{0|in|}182|184|}
{2010006001|XXGobject_psameas_object|282|0|466|0|{metadata|in_metadata|1|0|}184|182|}
{2010006001|XXGobject_psameas_object|283|0|467|0|{Layout|Layout|0|0|}179|31|}
{2010006001|XXGobject_psameas_object|284|0|468|0|{log_metadata|in_metadata|0|0|}179|179|}
{2010006001|XXGobject_psameas_object|285|0|469|0|{in_metadata|in_metadata|0|0|}161|179|}
{2010006001|XXGobject_psameas_object|286|0|470|0|{out_metadata|in_metadata|0|0|}161|179|}
{2010006001|XXGobject_psameas_object|287|0|471|0|{reject_metadata|in_metadata|0|0|}161|179|}
{2010601001|XXGgraph_vertex_vertex|288|0|472|0|{Fuse|}137|185|}
{2010212001|XXGvertex_oport_oport|289|0|474|0|{0|out|}185|186|}
{2010213001|XXGoport_dst_flow|290|0|476|0|{0|}186|156|}
{2010212001|XXGvertex_oport_oport|291|0|477|0|{1|reject0|}185|187|}
{2010212001|XXGvertex_oport_oport|292|0|479|0|{2|reject1|}185|188|}
{2010212001|XXGvertex_oport_oport|293|0|481|0|{3|error0|}185|189|}
{2010212001|XXGvertex_oport_oport|294|0|483|0|{4|error1|}185|190|}
{2010212001|XXGvertex_oport_oport|295|0|485|0|{5|log|}185|191|}
{2010211001|XXGvertex_iport_iport|296|0|487|0|{0|in0|}185|192|}
{2010214001|XXGiport_src_flow|297|0|489|0|{0|}192|144|}
{2010211001|XXGvertex_iport_iport|298|0|490|0|{1|in1|}185|193|}
{2010214001|XXGiport_src_flow|299|0|492|0|{0|}193|154|}
{2010007001|XXGobject_proto_object|300|0|493|0|{}185|194|}
{2010212001|XXGvertex_oport_oport|301|0|495|0|{0|out|}194|195|}
{2010006001|XXGobject_psameas_object|302|0|497|0|{metadata|out_metadata|1|0|}195|194|}
{2010212001|XXGvertex_oport_oport|303|0|498|0|{1|reject0|}194|196|}
{2010006001|XXGobject_psameas_object|304|0|500|0|{metadata|reject0_metadata|1|0|}196|194|}
{2010212001|XXGvertex_oport_oport|305|0|501|0|{2|reject1|}194|197|}
{2010006001|XXGobject_psameas_object|306|0|503|0|{metadata|reject1_metadata|1|0|}197|194|}
{2010212001|XXGvertex_oport_oport|307|0|504|0|{3|error0|}194|198|}
{2010006001|XXGobject_psameas_object|308|0|506|0|{metadata|error0_metadata|1|0|}198|194|}
{2010212001|XXGvertex_oport_oport|309|0|507|0|{4|error1|}194|199|}
{2010006001|XXGobject_psameas_object|310|0|509|0|{metadata|error1_metadata|1|0|}199|194|}
{2010212001|XXGvertex_oport_oport|311|0|510|0|{5|log|}194|200|}
{2010006001|XXGobject_psameas_object|312|0|512|0|{metadata|log_metadata|1|0|}200|194|}
{2010211001|XXGvertex_iport_iport|313|0|513|0|{0|in0|}194|201|}
{2010006001|XXGobject_psameas_object|314|0|515|0|{metadata|in0_metadata|1|0|}201|194|}
{2010211001|XXGvertex_iport_iport|315|0|516|0|{1|in1|}194|202|}
{2010006001|XXGobject_psameas_object|316|0|518|0|{metadata|in1_metadata|1|0|}202|194|}
{2010006001|XXGobject_psameas_object|317|0|519|0|{Layout|Layout|0|0|}185|175|}
{2010006001|XXGobject_psameas_object|318|0|520|0|{in0_metadata|write_metadata|0|0|}185|175|}
{2010006001|XXGobject_psameas_object|319|0|521|0|{in1_metadata|out_metadata|0|0|}185|203|}
{2010212001|XXGvertex_oport_oport|320|0|523|0|{0|out|}203|204|}
{2010213001|XXGoport_dst_flow|321|0|525|0|{0|}204|154|}
{2010212001|XXGvertex_oport_oport|322|0|526|0|{1|reject|}203|205|}
{2010212001|XXGvertex_oport_oport|323|0|528|0|{2|error|}203|206|}
{2010212001|XXGvertex_oport_oport|324|0|530|0|{3|log|}203|207|}
{2010211001|XXGvertex_iport_iport|325|0|532|0|{0|in|}203|208|}
{2010214001|XXGiport_src_flow|326|0|534|0|{0|}208|152|}
{2010007001|XXGobject_proto_object|327|0|535|0|{}203|209|}
{2010212001|XXGvertex_oport_oport|328|0|537|0|{0|out|}209|210|}
{2010006001|XXGobject_psameas_object|329|0|539|0|{metadata|out_metadata|1|0|}210|209|}
{2010212001|XXGvertex_oport_oport|330|0|540|0|{1|reject|}209|211|}
{2010006001|XXGobject_psameas_object|331|0|542|0|{metadata|reject_metadata|1|0|}211|209|}
{2010212001|XXGvertex_oport_oport|332|0|543|0|{2|error|}209|212|}
{2010006001|XXGobject_psameas_object|333|0|545|0|{metadata|error_metadata|1|0|}212|209|}
{2010212001|XXGvertex_oport_oport|334|0|546|0|{3|log|}209|213|}
{2010006001|XXGobject_psameas_object|335|0|548|0|{metadata|log_metadata|1|0|}213|209|}
{2010211001|XXGvertex_iport_iport|336|0|549|0|{0|in|}209|214|}
{2010006001|XXGobject_psameas_object|337|0|551|0|{metadata|in_metadata|1|0|}214|209|}
{2010006001|XXGobject_psameas_object|338|0|552|0|{Layout|Layout|0|0|}203|175|}
{2010006001|XXGobject_psameas_object|339|0|553|0|{in_metadata|out0_metadata|0|0|}203|215|}
{2010212001|XXGvertex_oport_oport|340|0|555|0|{0|out0|}215|216|}
{2010213001|XXGoport_dst_flow|341|0|557|0|{0|}216|152|}
{2010212001|XXGvertex_oport_oport|342|0|558|0|{1|reject0|}215|217|}
{2010212001|XXGvertex_oport_oport|343|0|560|0|{2|error0|}215|218|}
{2010212001|XXGvertex_oport_oport|344|0|562|0|{3|log|}215|219|}
{2010211001|XXGvertex_iport_iport|345|0|564|0|{0|in|}215|220|}
{2010214001|XXGiport_src_flow|346|0|566|0|{0|}220|150|}
{2010007001|XXGobject_proto_object|347|0|567|0|{}215|221|}
{2010212001|XXGvertex_oport_oport|348|0|569|0|{0|out0|}221|222|}
{2010006001|XXGobject_psameas_object|349|0|571|0|{metadata|out0_metadata|1|0|}222|221|}
{2010006001|XXGobject_psameas_object|350|0|572|0|{transform0|transform0|1|0|}222|221|}
{2010212001|XXGvertex_oport_oport|351|0|573|0|{1|reject0|}221|223|}
{2010006001|XXGobject_psameas_object|352|0|575|0|{metadata|reject0_metadata|1|0|}223|221|}
{2010212001|XXGvertex_oport_oport|353|0|576|0|{2|error0|}221|224|}
{2010006001|XXGobject_psameas_object|354|0|578|0|{metadata|error0_metadata|1|0|}224|221|}
{2010212001|XXGvertex_oport_oport|355|0|579|0|{3|log|}221|225|}
{2010006001|XXGobject_psameas_object|356|0|581|0|{metadata|log_metadata|1|0|}225|221|}
{2010211001|XXGvertex_iport_iport|357|0|582|0|{0|in|}221|226|}
{2010006001|XXGobject_psameas_object|358|0|584|0|{metadata|in_metadata|1|0|}226|221|}
{2010006001|XXGobject_psameas_object|359|0|585|0|{Layout|Layout|0|0|}215|175|}
{2010006001|XXGobject_psameas_object|360|0|586|0|{in_metadata|in_metadata|0|0|}215|179|}
{2010006001|XXGobject_psameas_object|361|0|587|0|{reject0_metadata|in_metadata|0|0|}215|179|}
{2010006001|XXGobject_psameas_object|362|0|588|0|{reject_metadata|out0_metadata|0|0|}203|215|}
{2010006001|XXGobject_psameas_object|363|0|589|0|{out_metadata|write_metadata|0|0|}185|175|}
{2010006001|XXGobject_psameas_object|364|0|590|0|{reject0_metadata|write_metadata|0|0|}185|175|}
{2010006001|XXGobject_psameas_object|365|0|591|0|{reject1_metadata|out_metadata|0|0|}185|203|}
{2010601001|XXGgraph_vertex_vertex|366|0|592|0|{Gather_1|}137|227|}
{2010212001|XXGvertex_oport_oport|367|0|594|0|{0|out|}227|228|}
{2010213001|XXGoport_dst_flow|368|0|596|0|{0|}228|142|}
{2010211001|XXGvertex_iport_iport|369|0|597|0|{0|in|}227|229|}
{2010007001|XXGobject_proto_object|370|0|599|0|{}227|230|}
{2010212001|XXGvertex_oport_oport|371|0|601|0|{0|out|}230|231|}
{2010006001|XXGobject_psameas_object|372|0|603|0|{metadata|out_metadata|1|0|}231|230|}
{2010211001|XXGvertex_iport_iport|373|0|604|0|{0|in|}230|232|}
{2010006001|XXGobject_psameas_object|374|0|606|0|{metadata|in_metadata|1|0|}232|230|}
{2010006001|XXGobject_psameas_object|375|0|607|0|{Layout|Layout|0|0|}227|175|}
{2010006001|XXGobject_psameas_object|376|0|608|0|{in_metadata|in_metadata|0|0|}227|179|}
{2010006001|XXGobject_psameas_object|377|0|609|0|{out_metadata|in_metadata|0|0|}227|179|}
{2010601001|XXGgraph_vertex_vertex|378|0|610|0|{PUB_DATAHUB_file|}137|175|}
{2010601001|XXGgraph_vertex_vertex|379|0|611|0|{RFMT_GET_CDC_count|}137|233|}
{2010212001|XXGvertex_oport_oport|380|0|613|0|{0|out0|}233|234|}
{2010213001|XXGoport_dst_flow|381|0|615|0|{0|}234|148|}
{2010212001|XXGvertex_oport_oport|382|0|616|0|{1|reject0|}233|235|}
{2010212001|XXGvertex_oport_oport|383|0|618|0|{2|error0|}233|236|}
{2010212001|XXGvertex_oport_oport|384|0|620|0|{3|log|}233|237|}
{2010211001|XXGvertex_iport_iport|385|0|622|0|{0|in|}233|238|}
{2010214001|XXGiport_src_flow|386|0|624|0|{0|}238|146|}
{2010007001|XXGobject_proto_object|387|0|625|0|{}233|239|}
{2010212001|XXGvertex_oport_oport|388|0|627|0|{0|out0|}239|240|}
{2010006001|XXGobject_psameas_object|389|0|629|0|{metadata|out0_metadata|1|0|}240|239|}
{2010006001|XXGobject_psameas_object|390|0|630|0|{transform0|transform0|1|0|}240|239|}
{2010212001|XXGvertex_oport_oport|391|0|631|0|{1|reject0|}239|241|}
{2010006001|XXGobject_psameas_object|392|0|633|0|{metadata|reject0_metadata|1|0|}241|239|}
{2010212001|XXGvertex_oport_oport|393|0|634|0|{2|error0|}239|242|}
{2010006001|XXGobject_psameas_object|394|0|636|0|{metadata|error0_metadata|1|0|}242|239|}
{2010212001|XXGvertex_oport_oport|395|0|637|0|{3|log|}239|243|}
{2010006001|XXGobject_psameas_object|396|0|639|0|{metadata|log_metadata|1|0|}243|239|}
{2010211001|XXGvertex_iport_iport|397|0|640|0|{0|in|}239|244|}
{2010006001|XXGobject_psameas_object|398|0|642|0|{metadata|in_metadata|1|0|}244|239|}
{2010006001|XXGobject_psameas_object|399|0|643|0|{Layout|Layout|0|0|}233|175|}
{2010006001|XXGobject_psameas_object|400|0|644|0|{in_metadata|in_metadata|0|0|}233|179|}
{2010006001|XXGobject_psameas_object|401|0|645|0|{out0_metadata|write_metadata|0|0|}233|175|}
{2010006001|XXGobject_psameas_object|402|0|646|0|{reject0_metadata|in_metadata|0|0|}233|179|}
{2010601001|XXGgraph_vertex_vertex|403|0|647|0|{RFMT_Get_Dedup_Flow_Count|}137|215|}
{2010601001|XXGgraph_vertex_vertex|404|0|648|0|{Replicate|}137|245|}
{2010212001|XXGvertex_oport_oport|405|0|650|0|{0|out|}245|246|}
{2010213001|XXGoport_dst_flow|406|0|652|0|{0|}246|143|}
{2010211001|XXGvertex_iport_iport|407|0|653|0|{0|in|}245|247|}
{2010007001|XXGobject_proto_object|408|0|655|0|{}245|248|}
{2010212001|XXGvertex_oport_oport|409|0|657|0|{0|out|}248|249|}
{2010006001|XXGobject_psameas_object|410|0|659|0|{metadata|out_metadata|1|0|}249|248|}
{2010211001|XXGvertex_iport_iport|411|0|660|0|{0|in|}248|250|}
{2010006001|XXGobject_psameas_object|412|0|662|0|{metadata|in_metadata|1|0|}250|248|}
{2010006001|XXGobject_psameas_object|413|0|663|0|{Layout|Layout|0|0|}245|175|}
{2010006001|XXGobject_psameas_object|414|0|664|0|{in_metadata|write_metadata|0|0|}245|157|}
{2010006001|XXGobject_psameas_object|415|0|665|0|{out_metadata|write_metadata|0|0|}245|157|}
{2010601001|XXGgraph_vertex_vertex|416|0|666|0|{RollUp_Count_Serial|}137|251|}
{2010212001|XXGvertex_oport_oport|417|0|668|0|{0|out|}251|252|}
{2010213001|XXGoport_dst_flow|418|0|670|0|{0|}252|144|}
{2010212001|XXGvertex_oport_oport|419|0|671|0|{1|reject|}251|253|}
{2010212001|XXGvertex_oport_oport|420|0|673|0|{2|error|}251|254|}
{2010212001|XXGvertex_oport_oport|421|0|675|0|{3|log|}251|255|}
{2010211001|XXGvertex_iport_iport|422|0|677|0|{0|in|}251|256|}
{2010214001|XXGiport_src_flow|423|0|679|0|{0|}256|148|}
{2010007001|XXGobject_proto_object|424|0|680|0|{}251|257|}
{2010212001|XXGvertex_oport_oport|425|0|682|0|{0|out|}257|258|}
{2010006001|XXGobject_psameas_object|426|0|684|0|{metadata|out_metadata|1|0|}258|257|}
{2010212001|XXGvertex_oport_oport|427|0|685|0|{1|reject|}257|259|}
{2010006001|XXGobject_psameas_object|428|0|687|0|{metadata|reject_metadata|1|0|}259|257|}
{2010212001|XXGvertex_oport_oport|429|0|688|0|{2|error|}257|260|}
{2010006001|XXGobject_psameas_object|430|0|690|0|{metadata|error_metadata|1|0|}260|257|}
{2010212001|XXGvertex_oport_oport|431|0|691|0|{3|log|}257|261|}
{2010006001|XXGobject_psameas_object|432|0|693|0|{metadata|log_metadata|1|0|}261|257|}
{2010211001|XXGvertex_iport_iport|433|0|694|0|{0|in|}257|262|}
{2010006001|XXGobject_psameas_object|434|0|696|0|{metadata|in_metadata|1|0|}262|257|}
{2010006001|XXGobject_psameas_object|435|0|697|0|{Layout|Layout|0|0|}251|175|}
{2010006001|XXGobject_psameas_object|436|0|698|0|{in_metadata|write_metadata|0|0|}251|175|}
{2010006001|XXGobject_psameas_object|437|0|699|0|{out_metadata|write_metadata|0|0|}251|175|}
{2010006001|XXGobject_psameas_object|438|0|700|0|{reject_metadata|write_metadata|0|0|}251|175|}
{2010601001|XXGgraph_vertex_vertex|439|0|701|0|{RollUp_Count_in_Serial|}137|203|}
{2010211001|XXGvertex_iport_iport|440|0|702|0|{0|in0|}137|263|}
{2010215002|XXGiport_binding_iport|441|0|704|0|{.5|.5|{0|}14501|}263|229|}
{2010214001|XXGiport_src_flow|442|0|705|0|{0|}263|14|}
{2010601001|XXGgraph_vertex_vertex|443|0|706|0|{Handle_Logs|}1|179|}
{2010601001|XXGgraph_vertex_vertex|444|0|707|0|{Invalid|}1|264|}
{2010211001|XXGvertex_iport_iport|445|0|709|0|{0|write|}264|265|}
{2010214001|XXGiport_src_flow|446|0|711|0|{0|}265|21|}
{2010007001|XXGobject_proto_object|447|0|712|0|{}264|266|}
{2010211001|XXGvertex_iport_iport|448|0|714|0|{0|write|}266|267|}
{2010006001|XXGobject_psameas_object|449|0|716|0|{metadata|write_metadata|1|0|}267|266|}
{2010006001|XXGobject_psameas_object|450|0|717|0|{write_metadata|out0_metadata|0|0|}264|268|}
{2010212001|XXGvertex_oport_oport|451|0|719|0|{0|out0|}268|269|}
{2010213001|XXGoport_dst_flow|452|0|721|0|{0|}269|270|}
{2010212001|XXGvertex_oport_oport|453|0|723|0|{1|reject0|}268|271|}
{2010212001|XXGvertex_oport_oport|454|0|725|0|{2|error0|}268|272|}
{2010212001|XXGvertex_oport_oport|455|0|727|0|{3|log|}268|273|}
{2010211001|XXGvertex_iport_iport|456|0|729|0|{0|in|}268|274|}
{2010214001|XXGiport_src_flow|457|0|731|0|{0|}274|275|}
{2010007001|XXGobject_proto_object|458|0|733|0|{}268|276|}
{2010212001|XXGvertex_oport_oport|459|0|735|0|{0|out0|}276|277|}
{2010006001|XXGobject_psameas_object|460|0|737|0|{metadata|out0_metadata|1|0|}277|276|}
{2010006001|XXGobject_psameas_object|461|0|738|0|{transform0|transform0|1|0|}277|276|}
{2010212001|XXGvertex_oport_oport|462|0|739|0|{1|reject0|}276|278|}
{2010006001|XXGobject_psameas_object|463|0|741|0|{metadata|reject0_metadata|1|0|}278|276|}
{2010212001|XXGvertex_oport_oport|464|0|742|0|{2|error0|}276|279|}
{2010006001|XXGobject_psameas_object|465|0|744|0|{metadata|error0_metadata|1|0|}279|276|}
{2010212001|XXGvertex_oport_oport|466|0|745|0|{3|log|}276|280|}
{2010006001|XXGobject_psameas_object|467|0|747|0|{metadata|log_metadata|1|0|}280|276|}
{2010211001|XXGvertex_iport_iport|468|0|748|0|{0|in|}276|281|}
{2010006001|XXGobject_psameas_object|469|0|750|0|{metadata|in_metadata|1|0|}281|276|}
{2010006001|XXGobject_psameas_object|470|0|751|0|{Layout|Layout|0|0|}268|282|}
{2010212001|XXGvertex_oport_oport|471|0|753|0|{0|out|}282|283|}
{2010212001|XXGvertex_oport_oport|472|0|755|0|{1|filereject|}282|284|}
{2010212001|XXGvertex_oport_oport|473|0|757|0|{2|fileerror|}282|285|}
{2010212001|XXGvertex_oport_oport|474|0|759|0|{3|reject|}282|286|}
{2010212001|XXGvertex_oport_oport|475|0|761|0|{4|error|}282|287|}
{2010212001|XXGvertex_oport_oport|476|0|763|0|{5|log|}282|288|}
{2010211001|XXGvertex_iport_iport|477|0|765|0|{0|in|}282|289|}
{2010214001|XXGiport_src_flow|478|0|767|0|{0|}289|290|}
{2010007001|XXGobject_proto_object|479|0|769|0|{}282|291|}
{2010212001|XXGvertex_oport_oport|480|0|771|0|{0|out|}291|292|}
{2010006001|XXGobject_psameas_object|481|0|773|0|{metadata|out_metadata|1|0|}292|291|}
{2010212001|XXGvertex_oport_oport|482|0|774|0|{1|filereject|}291|293|}
{2010006001|XXGobject_psameas_object|483|0|776|0|{metadata|filereject_metadata|1|0|}293|291|}
{2010212001|XXGvertex_oport_oport|484|0|777|0|{2|fileerror|}291|294|}
{2010006001|XXGobject_psameas_object|485|0|779|0|{metadata|fileerror_metadata|1|0|}294|291|}
{2010212001|XXGvertex_oport_oport|486|0|780|0|{3|reject|}291|295|}
{2010006001|XXGobject_psameas_object|487|0|782|0|{metadata|reject_metadata|1|0|}295|291|}
{2010212001|XXGvertex_oport_oport|488|0|783|0|{4|error|}291|296|}
{2010006001|XXGobject_psameas_object|489|0|785|0|{metadata|error_metadata|1|0|}296|291|}
{2010212001|XXGvertex_oport_oport|490|0|786|0|{5|log|}291|297|}
{2010006001|XXGobject_psameas_object|491|0|788|0|{metadata|log_metadata|1|0|}297|291|}
{2010211001|XXGvertex_iport_iport|492|0|789|0|{0|in|}291|298|}
{2010006001|XXGobject_psameas_object|493|0|791|0|{metadata|in_metadata|1|0|}298|291|}
{2010006001|XXGobject_psameas_object|494|0|792|0|{filereject_metadata|out_metadata|0|0|}282|299|}
{2010212001|XXGvertex_oport_oport|495|0|794|0|{0|out|}299|300|}
{2010213001|XXGoport_dst_flow|496|0|796|0|{0|}300|290|}
{2010212001|XXGvertex_oport_oport|497|0|797|0|{1|error|}299|301|}
{2010212001|XXGvertex_oport_oport|498|0|799|0|{2|log|}299|302|}
{2010007001|XXGobject_proto_object|499|0|801|0|{}299|303|}
{2010212001|XXGvertex_oport_oport|500|0|803|0|{0|out|}303|304|}
{2010006001|XXGobject_psameas_object|501|0|805|0|{metadata|out_metadata|1|0|}304|303|}
{2010212001|XXGvertex_oport_oport|502|0|806|0|{1|error|}303|305|}
{2010006001|XXGobject_psameas_object|503|0|808|0|{metadata|error_metadata|1|0|}305|303|}
{2010212001|XXGvertex_oport_oport|504|0|809|0|{2|log|}303|306|}
{2010006001|XXGobject_psameas_object|505|0|811|0|{metadata|log_metadata|1|0|}306|303|}
{2010006001|XXGobject_psameas_object|506|0|812|0|{Layout|Layout|0|0|}299|282|}
{2010006001|XXGobject_psameas_object|507|0|813|0|{in_metadata|out_metadata|0|0|}282|299|}
{2010006001|XXGobject_psameas_object|508|0|814|0|{in_metadata|out_metadata|0|0|}268|282|}
{2010006001|XXGobject_psameas_object|509|0|815|0|{reject0_metadata|out_metadata|0|0|}268|282|}
{2010601001|XXGgraph_vertex_vertex|510|0|816|0|{LookUp_and_CDC_on_HASH_Keys|}1|307|}
{2010605001|XXGgraph_legend_legend|511|0|818|0|{0|}307|308|}
{2010241001|XXGlegend_face_face|512|0|820|0|{}308|309|}
{2010604001|XXGgraph_flow_flow|513|0|822|0|{Flow_1|}307|310|}
{2010604001|XXGgraph_flow_flow|514|0|824|0|{Flow_11|}307|311|}
{2010604001|XXGgraph_flow_flow|515|0|826|0|{Flow_12|}307|312|}
{2010244001|XXGflow_watcher_watcher|516|0|828|0|{}312|313|}
{2010604001|XXGgraph_flow_flow|517|0|830|0|{Flow_13|}307|314|}
{2010244001|XXGflow_watcher_watcher|518|0|832|0|{}314|315|}
{2010604001|XXGgraph_flow_flow|519|0|834|0|{Flow_2|}307|316|}
{2010604001|XXGgraph_flow_flow|520|0|836|0|{Flow_3|}307|317|}
{2010604001|XXGgraph_flow_flow|521|0|838|0|{Flow_4|}307|80|}
{2010604001|XXGgraph_flow_flow|522|0|839|0|{Flow_5|}307|318|}
{2010604001|XXGgraph_flow_flow|523|0|841|0|{Flow_6|}307|319|}
{2010604001|XXGgraph_flow_flow|524|0|843|0|{Flow_7|}307|320|}
{2010604001|XXGgraph_flow_flow|525|0|845|0|{Flow_8|}307|321|}
{2010244001|XXGflow_watcher_watcher|526|0|847|0|{}321|322|}
{2010604001|XXGgraph_flow_flow|527|0|849|0|{Flow_9|}307|75|}
{2010601001|XXGgraph_vertex_vertex|528|0|850|0|{Dedup_On_Hash_of_Target_NK|}307|323|}
{2010605001|XXGgraph_legend_legend|529|0|852|0|{0|}323|324|}
{2010241001|XXGlegend_face_face|530|0|854|0|{}324|325|}
{2010605001|XXGgraph_legend_legend|531|0|856|0|{1|}323|326|}
{2010241001|XXGlegend_face_face|532|0|858|0|{}326|327|}
{2010604001|XXGgraph_flow_flow|533|0|860|0|{Flow_1|}323|328|}
{2010604001|XXGgraph_flow_flow|534|0|862|0|{Flow_3|}323|329|}
{2010601001|XXGgraph_vertex_vertex|535|0|864|0|{Dedup_Sorted|}323|330|}
{2010212001|XXGvertex_oport_oport|536|0|866|0|{0|out|}330|331|}
{2010212001|XXGvertex_oport_oport|537|0|868|0|{1|dup|}330|332|}
{2010213001|XXGoport_dst_flow|538|0|870|0|{0|}332|328|}
{2010212001|XXGvertex_oport_oport|539|0|871|0|{2|reject|}330|333|}
{2010212001|XXGvertex_oport_oport|540|0|873|0|{3|error|}330|334|}
{2010212001|XXGvertex_oport_oport|541|0|875|0|{4|log|}330|335|}
{2010211001|XXGvertex_iport_iport|542|0|877|0|{0|in|}330|336|}
{2010214001|XXGiport_src_flow|543|0|879|0|{0|}336|329|}
{2010007001|XXGobject_proto_object|544|0|880|0|{}330|337|}
{2010212001|XXGvertex_oport_oport|545|0|882|0|{0|out|}337|338|}
{2010006001|XXGobject_psameas_object|546|0|884|0|{metadata|out_metadata|1|0|}338|337|}
{2010212001|XXGvertex_oport_oport|547|0|885|0|{1|dup|}337|339|}
{2010006001|XXGobject_psameas_object|548|0|887|0|{metadata|dup_metadata|1|0|}339|337|}
{2010212001|XXGvertex_oport_oport|549|0|888|0|{2|reject|}337|340|}
{2010006001|XXGobject_psameas_object|550|0|890|0|{metadata|reject_metadata|1|0|}340|337|}
{2010212001|XXGvertex_oport_oport|551|0|891|0|{3|error|}337|341|}
{2010006001|XXGobject_psameas_object|552|0|893|0|{metadata|error_metadata|1|0|}341|337|}
{2010212001|XXGvertex_oport_oport|553|0|894|0|{4|log|}337|342|}
{2010006001|XXGobject_psameas_object|554|0|896|0|{metadata|log_metadata|1|0|}342|337|}
{2010211001|XXGvertex_iport_iport|555|0|897|0|{0|in|}337|343|}
{2010006001|XXGobject_psameas_object|556|0|899|0|{metadata|in_metadata|1|0|}343|337|}
{2010006001|XXGobject_psameas_object|557|0|900|0|{Layout|Layout|0|0|}330|95|}
{2010006001|XXGobject_psameas_object|558|0|901|0|{dup_metadata|in_metadata|0|0|}330|73|}
{2010006001|XXGobject_psameas_object|559|0|902|0|{in_metadata|in_metadata|0|0|}330|73|}
{2010006001|XXGobject_psameas_object|560|0|903|0|{out_metadata|in_metadata|0|0|}330|73|}
{2010006001|XXGobject_psameas_object|561|0|904|0|{reject_metadata|in_metadata|0|0|}330|73|}
{2010601001|XXGgraph_vertex_vertex|562|0|905|0|{RFMT_Capture_Dup_Count_For_Audit|}323|344|}
{2010212001|XXGvertex_oport_oport|563|0|907|0|{0|out0|}344|345|}
{2010212001|XXGvertex_oport_oport|564|0|909|0|{1|reject0|}344|346|}
{2010212001|XXGvertex_oport_oport|565|0|911|0|{2|error0|}344|347|}
{2010212001|XXGvertex_oport_oport|566|0|913|0|{3|log|}344|348|}
{2010211001|XXGvertex_iport_iport|567|0|915|0|{0|in|}344|349|}
{2010214001|XXGiport_src_flow|568|0|917|0|{0|}349|328|}
{2010007001|XXGobject_proto_object|569|0|918|0|{}344|350|}
{2010212001|XXGvertex_oport_oport|570|0|920|0|{0|out0|}350|351|}
{2010006001|XXGobject_psameas_object|571|0|922|0|{metadata|out0_metadata|1|0|}351|350|}
{2010006001|XXGobject_psameas_object|572|0|923|0|{transform0|transform0|1|0|}351|350|}
{2010212001|XXGvertex_oport_oport|573|0|924|0|{1|reject0|}350|352|}
{2010006001|XXGobject_psameas_object|574|0|926|0|{metadata|reject0_metadata|1|0|}352|350|}
{2010212001|XXGvertex_oport_oport|575|0|927|0|{2|error0|}350|353|}
{2010006001|XXGobject_psameas_object|576|0|929|0|{metadata|error0_metadata|1|0|}353|350|}
{2010212001|XXGvertex_oport_oport|577|0|930|0|{3|log|}350|354|}
{2010006001|XXGobject_psameas_object|578|0|932|0|{metadata|log_metadata|1|0|}354|350|}
{2010211001|XXGvertex_iport_iport|579|0|933|0|{0|in|}350|355|}
{2010006001|XXGobject_psameas_object|580|0|935|0|{metadata|in_metadata|1|0|}355|350|}
{2010006001|XXGobject_psameas_object|581|0|936|0|{Layout|Layout|0|0|}344|95|}
{2010006001|XXGobject_psameas_object|582|0|937|0|{in_metadata|in_metadata|0|0|}344|73|}
{2010006001|XXGobject_psameas_object|583|0|938|0|{out0_metadata|in_metadata|0|0|}344|73|}
{2010006001|XXGobject_psameas_object|584|0|939|0|{reject0_metadata|in_metadata|0|0|}344|73|}
{2010601001|XXGgraph_vertex_vertex|585|0|940|0|{Sort_within_Groups|}323|356|}
{2010212001|XXGvertex_oport_oport|586|0|942|0|{0|out|}356|357|}
{2010213001|XXGoport_dst_flow|587|0|944|0|{0|}357|329|}
{2010211001|XXGvertex_iport_iport|588|0|945|0|{0|in|}356|358|}
{2010007001|XXGobject_proto_object|589|0|947|0|{}356|359|}
{2010212001|XXGvertex_oport_oport|590|0|949|0|{0|out|}359|360|}
{2010006001|XXGobject_psameas_object|591|0|951|0|{metadata|out_metadata|1|0|}360|359|}
{2010211001|XXGvertex_iport_iport|592|0|952|0|{0|in|}359|361|}
{2010006001|XXGobject_psameas_object|593|0|954|0|{metadata|in_metadata|1|0|}361|359|}
{2010006001|XXGobject_psameas_object|594|0|955|0|{Layout|Layout|0|0|}356|95|}
{2010006001|XXGobject_psameas_object|595|0|956|0|{in_metadata|out0_metadata|0|0|}356|362|}
{2010212001|XXGvertex_oport_oport|596|0|958|0|{0|out0|}362|363|}
{2010213001|XXGoport_dst_flow|597|0|960|0|{0|}363|310|}
{2010212001|XXGvertex_oport_oport|598|0|961|0|{1|reject0|}362|364|}
{2010212001|XXGvertex_oport_oport|599|0|963|0|{2|error0|}362|365|}
{2010212001|XXGvertex_oport_oport|600|0|965|0|{3|log|}362|366|}
{2010211001|XXGvertex_iport_iport|601|0|967|0|{0|in|}362|367|}
{2010214001|XXGiport_src_flow|602|0|969|0|{0|}367|318|}
{2010007001|XXGobject_proto_object|603|0|970|0|{}362|368|}
{2010212001|XXGvertex_oport_oport|604|0|972|0|{0|out0|}368|369|}
{2010006001|XXGobject_psameas_object|605|0|974|0|{metadata|out0_metadata|1|0|}369|368|}
{2010006001|XXGobject_psameas_object|606|0|975|0|{transform0|transform0|1|0|}369|368|}
{2010212001|XXGvertex_oport_oport|607|0|976|0|{1|reject0|}368|370|}
{2010006001|XXGobject_psameas_object|608|0|978|0|{metadata|reject0_metadata|1|0|}370|368|}
{2010212001|XXGvertex_oport_oport|609|0|979|0|{2|error0|}368|371|}
{2010006001|XXGobject_psameas_object|610|0|981|0|{metadata|error0_metadata|1|0|}371|368|}
{2010212001|XXGvertex_oport_oport|611|0|982|0|{3|log|}368|372|}
{2010006001|XXGobject_psameas_object|612|0|984|0|{metadata|log_metadata|1|0|}372|368|}
{2010211001|XXGvertex_iport_iport|613|0|985|0|{0|in|}368|373|}
{2010006001|XXGobject_psameas_object|614|0|987|0|{metadata|in_metadata|1|0|}373|368|}
{2010006001|XXGobject_psameas_object|615|0|988|0|{Layout|Layout|0|0|}362|282|}
{2010006001|XXGobject_psameas_object|616|0|989|0|{in_metadata|out0_metadata|0|0|}362|374|}
{2010212001|XXGvertex_oport_oport|617|0|991|0|{0|out0|}374|375|}
{2010213001|XXGoport_dst_flow|618|0|993|0|{0|}375|318|}
{2010212001|XXGvertex_oport_oport|619|0|994|0|{1|reject0|}374|376|}
{2010212001|XXGvertex_oport_oport|620|0|996|0|{2|error0|}374|377|}
{2010212001|XXGvertex_oport_oport|621|0|998|0|{3|log|}374|378|}
{2010211001|XXGvertex_iport_iport|622|0|1000|0|{0|in|}374|379|}
{2010007001|XXGobject_proto_object|623|0|1002|0|{}374|380|}
{2010212001|XXGvertex_oport_oport|624|0|1004|0|{0|out0|}380|381|}
{2010006001|XXGobject_psameas_object|625|0|1006|0|{metadata|out0_metadata|1|0|}381|380|}
{2010006001|XXGobject_psameas_object|626|0|1007|0|{transform0|transform0|1|0|}381|380|}
{2010212001|XXGvertex_oport_oport|627|0|1008|0|{1|reject0|}380|382|}
{2010006001|XXGobject_psameas_object|628|0|1010|0|{metadata|reject0_metadata|1|0|}382|380|}
{2010212001|XXGvertex_oport_oport|629|0|1011|0|{2|error0|}380|383|}
{2010006001|XXGobject_psameas_object|630|0|1013|0|{metadata|error0_metadata|1|0|}383|380|}
{2010212001|XXGvertex_oport_oport|631|0|1014|0|{3|log|}380|384|}
{2010006001|XXGobject_psameas_object|632|0|1016|0|{metadata|log_metadata|1|0|}384|380|}
{2010211001|XXGvertex_iport_iport|633|0|1017|0|{0|in|}380|385|}
{2010006001|XXGobject_psameas_object|634|0|1019|0|{metadata|in_metadata|1|0|}385|380|}
{2010006001|XXGobject_psameas_object|635|0|1020|0|{Layout|Layout|0|0|}374|282|}
{2010006001|XXGobject_psameas_object|636|0|1021|0|{in_metadata|out0_metadata|0|0|}374|268|}
{2010006001|XXGobject_psameas_object|637|0|1022|0|{reject0_metadata|out0_metadata|0|0|}374|268|}
{2010006001|XXGobject_psameas_object|638|0|1023|0|{reject0_metadata|out0_metadata|0|0|}362|374|}
{2010006001|XXGobject_psameas_object|639|0|1024|0|{out_metadata|in_metadata|0|0|}356|73|}
{2010212001|XXGvertex_oport_oport|640|0|1025|0|{0|out0|}323|386|}
{2010216002|XXGoport_binding_oport|641|0|1027|0|{.5|.5|{0|}12084|}386|331|}
{2010213001|XXGoport_dst_flow|642|0|1028|0|{0|}386|319|}
{2010212001|XXGvertex_oport_oport|643|0|1029|0|{1|out1|}323|387|}
{2010216002|XXGoport_binding_oport|644|0|1031|0|{.5|.5|{0|}12085|}387|345|}
{2010211001|XXGvertex_iport_iport|645|0|1032|0|{0|in0|}323|388|}
{2010215002|XXGiport_binding_iport|646|0|1034|0|{.5|.5|{0|}12083|}388|358|}
{2010214001|XXGiport_src_flow|647|0|1035|0|{0|}388|316|}
{2010601001|XXGgraph_vertex_vertex|648|0|1036|0|{FBE_Segregate_Found_Not_Found_in_Main_IDS|}307|389|}
{2010212001|XXGvertex_oport_oport|649|0|1038|0|{0|out|}389|390|}
{2010213001|XXGoport_dst_flow|650|0|1040|0|{0|}390|320|}
{2010212001|XXGvertex_oport_oport|651|0|1041|0|{1|deselect|}389|391|}
{2010213001|XXGoport_dst_flow|652|0|1043|0|{0|}391|312|}
{2010212001|XXGvertex_oport_oport|653|0|1044|0|{2|reject|}389|392|}
{2010212001|XXGvertex_oport_oport|654|0|1046|0|{3|error|}389|393|}
{2010212001|XXGvertex_oport_oport|655|0|1048|0|{4|log|}389|394|}
{2010211001|XXGvertex_iport_iport|656|0|1050|0|{0|in|}389|395|}
{2010214001|XXGiport_src_flow|657|0|1052|0|{0|}395|75|}
{2010007001|XXGobject_proto_object|658|0|1053|0|{}389|396|}
{2010212001|XXGvertex_oport_oport|659|0|1055|0|{0|out|}396|397|}
{2010006001|XXGobject_psameas_object|660|0|1057|0|{metadata|out_metadata|1|0|}397|396|}
{2010212001|XXGvertex_oport_oport|661|0|1058|0|{1|deselect|}396|398|}
{2010006001|XXGobject_psameas_object|662|0|1060|0|{metadata|deselect_metadata|1|0|}398|396|}
{2010212001|XXGvertex_oport_oport|663|0|1061|0|{2|reject|}396|399|}
{2010006001|XXGobject_psameas_object|664|0|1063|0|{metadata|reject_metadata|1|0|}399|396|}
{2010212001|XXGvertex_oport_oport|665|0|1064|0|{3|error|}396|400|}
{2010006001|XXGobject_psameas_object|666|0|1066|0|{metadata|error_metadata|1|0|}400|396|}
{2010212001|XXGvertex_oport_oport|667|0|1067|0|{4|log|}396|401|}
{2010006001|XXGobject_psameas_object|668|0|1069|0|{metadata|log_metadata|1|0|}401|396|}
{2010211001|XXGvertex_iport_iport|669|0|1070|0|{0|in|}396|402|}
{2010006001|XXGobject_psameas_object|670|0|1072|0|{metadata|in_metadata|1|0|}402|396|}
{2010006001|XXGobject_psameas_object|671|0|1073|0|{Layout|Layout|0|0|}389|61|}
{2010006001|XXGobject_psameas_object|672|0|1074|0|{deselect_metadata|out0_metadata|0|0|}389|73|}
{2010006001|XXGobject_psameas_object|673|0|1075|0|{in_metadata|out0_metadata|0|0|}389|73|}
{2010006001|XXGobject_psameas_object|674|0|1076|0|{out_metadata|out0_metadata|0|0|}389|73|}
{2010006001|XXGobject_psameas_object|675|0|1077|0|{reject_metadata|out0_metadata|0|0|}389|73|}
{2010601001|XXGgraph_vertex_vertex|676|0|1078|0|{FBE_Segregate_Inserts_Updates|}307|403|}
{2010212001|XXGvertex_oport_oport|677|0|1080|0|{0|out|}403|404|}
{2010213001|XXGoport_dst_flow|678|0|1082|0|{0|}404|80|}
{2010212001|XXGvertex_oport_oport|679|0|1083|0|{1|deselect|}403|405|}
{2010213001|XXGoport_dst_flow|680|0|1085|0|{0|}405|314|}
{2010212001|XXGvertex_oport_oport|681|0|1086|0|{2|reject|}403|406|}
{2010212001|XXGvertex_oport_oport|682|0|1088|0|{3|error|}403|407|}
{2010212001|XXGvertex_oport_oport|683|0|1090|0|{4|log|}403|408|}
{2010211001|XXGvertex_iport_iport|684|0|1092|0|{0|in|}403|409|}
{2010214001|XXGiport_src_flow|685|0|1094|0|{0|}409|311|}
{2010007001|XXGobject_proto_object|686|0|1095|0|{}403|410|}
{2010212001|XXGvertex_oport_oport|687|0|1097|0|{0|out|}410|411|}
{2010006001|XXGobject_psameas_object|688|0|1099|0|{metadata|out_metadata|1|0|}411|410|}
{2010212001|XXGvertex_oport_oport|689|0|1100|0|{1|deselect|}410|412|}
{2010006001|XXGobject_psameas_object|690|0|1102|0|{metadata|deselect_metadata|1|0|}412|410|}
{2010212001|XXGvertex_oport_oport|691|0|1103|0|{2|reject|}410|413|}
{2010006001|XXGobject_psameas_object|692|0|1105|0|{metadata|reject_metadata|1|0|}413|410|}
{2010212001|XXGvertex_oport_oport|693|0|1106|0|{3|error|}410|414|}
{2010006001|XXGobject_psameas_object|694|0|1108|0|{metadata|error_metadata|1|0|}414|410|}
{2010212001|XXGvertex_oport_oport|695|0|1109|0|{4|log|}410|415|}
{2010006001|XXGobject_psameas_object|696|0|1111|0|{metadata|log_metadata|1|0|}415|410|}
{2010211001|XXGvertex_iport_iport|697|0|1112|0|{0|in|}410|416|}
{2010006001|XXGobject_psameas_object|698|0|1114|0|{metadata|in_metadata|1|0|}416|410|}
{2010006001|XXGobject_psameas_object|699|0|1115|0|{Layout|Layout|0|0|}403|61|}
{2010006001|XXGobject_psameas_object|700|0|1116|0|{deselect_metadata|in_metadata|0|0|}403|73|}
{2010006001|XXGobject_psameas_object|701|0|1117|0|{in_metadata|in_metadata|0|0|}403|73|}
{2010006001|XXGobject_psameas_object|702|0|1118|0|{out_metadata|in_metadata|0|0|}403|73|}
{2010006001|XXGobject_psameas_object|703|0|1119|0|{reject_metadata|in_metadata|0|0|}403|73|}
{2010601001|XXGgraph_vertex_vertex|704|0|1120|0|{Merge|}307|417|}
{2010212001|XXGvertex_oport_oport|705|0|1122|0|{0|out|}417|418|}
{2010213001|XXGoport_dst_flow|706|0|1124|0|{0|}418|317|}
{2010211001|XXGvertex_iport_iport|707|0|1125|0|{0|in|}417|419|}
{2010214001|XXGiport_src_flow|708|0|1127|0|{0|}419|321|}
{2010214001|XXGiport_src_flow|709|0|1128|0|{1|}419|312|}
{2010214001|XXGiport_src_flow|710|0|1129|0|{2|}419|314|}
{2010007001|XXGobject_proto_object|711|0|1130|0|{}417|420|}
{2010212001|XXGvertex_oport_oport|712|0|1132|0|{0|out|}420|421|}
{2010006001|XXGobject_psameas_object|713|0|1134|0|{metadata|out_metadata|1|0|}421|420|}
{2010211001|XXGvertex_iport_iport|714|0|1135|0|{0|in|}420|422|}
{2010006001|XXGobject_psameas_object|715|0|1137|0|{metadata|in_metadata|1|0|}422|420|}
{2010006001|XXGobject_psameas_object|716|0|1138|0|{Layout|Layout|0|0|}417|61|}
{2010006001|XXGobject_psameas_object|717|0|1139|0|{in_metadata|in_metadata|0|0|}417|73|}
{2010006001|XXGobject_psameas_object|718|0|1140|0|{out_metadata|in_metadata|0|0|}417|73|}
{2010601001|XXGgraph_vertex_vertex|719|0|1141|0|{PBKS_ICFF_KEY_|}307|423|}
{2010604001|XXGgraph_flow_flow|720|0|1143|0|{Flow_1|}423|424|}
{2010601001|XXGgraph_vertex_vertex|721|0|1145|0|{Partition_by_Key|}423|425|}
{2010212001|XXGvertex_oport_oport|722|0|1147|0|{0|out|}425|426|}
{2010213001|XXGoport_dst_flow|723|0|1149|0|{0|}426|424|}
{2010211001|XXGvertex_iport_iport|724|0|1150|0|{0|in|}425|427|}
{2010006001|XXGobject_psameas_object|725|0|1152|0|{in_metadata|out0_metadata|0|0|}425|362|}
{2010006001|XXGobject_psameas_object|726|0|1153|0|{out_metadata|out0_metadata|0|0|}425|362|}
{2010601001|XXGgraph_vertex_vertex|727|0|1154|0|{Sort|}423|428|}
{2010212001|XXGvertex_oport_oport|728|0|1156|0|{0|out|}428|429|}
{2010211001|XXGvertex_iport_iport|729|0|1158|0|{0|in|}428|430|}
{2010214001|XXGiport_src_flow|730|0|1160|0|{0|}430|424|}
{2010006001|XXGobject_psameas_object|731|0|1161|0|{in_metadata|out0_metadata|0|0|}428|362|}
{2010006001|XXGobject_psameas_object|732|0|1162|0|{out_metadata|out0_metadata|0|0|}428|362|}
{2010212001|XXGvertex_oport_oport|733|0|1163|0|{0|out0|}423|431|}
{2010216002|XXGoport_binding_oport|734|0|1165|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}431|429|}
{2010213001|XXGoport_dst_flow|735|0|1166|0|{0|}431|316|}
{2010211001|XXGvertex_iport_iport|736|0|1167|0|{0|in0|}423|432|}
{2010215002|XXGiport_binding_iport|737|0|1169|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}432|427|}
{2010214001|XXGiport_src_flow|738|0|1170|0|{0|}432|310|}
{2010007001|XXGobject_proto_object|739|0|1171|0|{}423|433|}
{2010604001|XXGgraph_flow_flow|740|0|1173|0|{Flow_1|}433|434|}
{2010601001|XXGgraph_vertex_vertex|741|0|1175|0|{Partition_by_Key|}433|435|}
{2010212001|XXGvertex_oport_oport|742|0|1177|0|{0|out|}435|436|}
{2010213001|XXGoport_dst_flow|743|0|1179|0|{0|}436|434|}
{2010211001|XXGvertex_iport_iport|744|0|1180|0|{0|in|}435|437|}
{2010007001|XXGobject_proto_object|745|0|1182|0|{}435|438|}
{2010212001|XXGvertex_oport_oport|746|0|1184|0|{0|out|}438|439|}
{2010006001|XXGobject_psameas_object|747|0|1186|0|{metadata|out_metadata|1|0|}439|438|}
{2010211001|XXGvertex_iport_iport|748|0|1187|0|{0|in|}438|440|}
{2010006001|XXGobject_psameas_object|749|0|1189|0|{metadata|in_metadata|1|0|}440|438|}
{2010006001|XXGobject_psameas_object|750|0|1190|0|{Layout|InputLayout|1|0|}435|433|}
{2010006001|XXGobject_psameas_object|751|0|1191|0|{key|Key|1|0|}435|433|}
{2010601001|XXGgraph_vertex_vertex|752|0|1192|0|{Sort|}433|441|}
{2010212001|XXGvertex_oport_oport|753|0|1194|0|{0|out|}441|442|}
{2010211001|XXGvertex_iport_iport|754|0|1196|0|{0|in|}441|443|}
{2010214001|XXGiport_src_flow|755|0|1198|0|{0|}443|434|}
{2010007001|XXGobject_proto_object|756|0|1199|0|{}441|444|}
{2010212001|XXGvertex_oport_oport|757|0|1201|0|{0|out|}444|445|}
{2010006001|XXGobject_psameas_object|758|0|1203|0|{metadata|out_metadata|1|0|}445|444|}
{2010211001|XXGvertex_iport_iport|759|0|1204|0|{0|in|}444|446|}
{2010006001|XXGobject_psameas_object|760|0|1206|0|{metadata|in_metadata|1|0|}446|444|}
{2010006001|XXGobject_psameas_object|761|0|1207|0|{Layout|OutputLayout|1|0|}441|433|}
{2010006001|XXGobject_psameas_object|762|0|1208|0|{key|Key|1|0|}441|433|}
{2010006001|XXGobject_psameas_object|763|0|1209|0|{max_core|Max_core|1|0|}441|433|}
{2010212001|XXGvertex_oport_oport|764|0|1210|0|{0|out0|}433|447|}
{2010216002|XXGoport_binding_oport|765|0|1212|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}447|442|}
{2010211001|XXGvertex_iport_iport|766|0|1213|0|{0|in0|}433|448|}
{2010215002|XXGiport_binding_iport|767|0|1215|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}448|437|}
{2010006001|XXGobject_psameas_object|768|0|1216|0|{InputLayout|Layout|0|0|}423|282|}
{2010006001|XXGobject_psameas_object|769|0|1217|0|{OutputLayout|Layout|0|0|}423|95|}
{2010601001|XXGgraph_vertex_vertex|770|0|1218|0|{RFMT_CDC_With_Archive_IDS|}307|449|}
{2010212001|XXGvertex_oport_oport|771|0|1220|0|{0|out0|}449|450|}
{2010213001|XXGoport_dst_flow|772|0|1222|0|{0|}450|321|}
{2010212001|XXGvertex_oport_oport|773|0|1223|0|{1|reject0|}449|451|}
{2010212001|XXGvertex_oport_oport|774|0|1225|0|{2|error0|}449|452|}
{2010212001|XXGvertex_oport_oport|775|0|1227|0|{3|log|}449|453|}
{2010211001|XXGvertex_iport_iport|776|0|1229|0|{0|in|}449|454|}
{2010214001|XXGiport_src_flow|777|0|1231|0|{0|}454|320|}
{2010007001|XXGobject_proto_object|778|0|1232|0|{}449|455|}
{2010212001|XXGvertex_oport_oport|779|0|1234|0|{0|out0|}455|456|}
{2010006001|XXGobject_psameas_object|780|0|1236|0|{metadata|out0_metadata|1|0|}456|455|}
{2010006001|XXGobject_psameas_object|781|0|1237|0|{transform0|transform0|1|0|}456|455|}
{2010212001|XXGvertex_oport_oport|782|0|1238|0|{1|reject0|}455|457|}
{2010006001|XXGobject_psameas_object|783|0|1240|0|{metadata|reject0_metadata|1|0|}457|455|}
{2010212001|XXGvertex_oport_oport|784|0|1241|0|{2|error0|}455|458|}
{2010006001|XXGobject_psameas_object|785|0|1243|0|{metadata|error0_metadata|1|0|}458|455|}
{2010212001|XXGvertex_oport_oport|786|0|1244|0|{3|log|}455|459|}
{2010006001|XXGobject_psameas_object|787|0|1246|0|{metadata|log_metadata|1|0|}459|455|}
{2010211001|XXGvertex_iport_iport|788|0|1247|0|{0|in|}455|460|}
{2010006001|XXGobject_psameas_object|789|0|1249|0|{metadata|in_metadata|1|0|}460|455|}
{2010006001|XXGobject_psameas_object|790|0|1250|0|{Layout|Layout|0|0|}449|61|}
{2010006001|XXGobject_psameas_object|791|0|1251|0|{in_metadata|out0_metadata|0|0|}449|73|}
{2010006001|XXGobject_psameas_object|792|0|1252|0|{out0_metadata|in_metadata|0|0|}449|73|}
{2010006001|XXGobject_psameas_object|793|0|1253|0|{reject0_metadata|out0_metadata|0|0|}449|73|}
{2010601001|XXGgraph_vertex_vertex|794|0|1254|0|{RFMT_Get_Hash_and_src_env_rank|}307|362|}
{2010601001|XXGgraph_vertex_vertex|795|0|1255|0|{RFMT_Main_IDS_CDC|}307|73|}
{2010601001|XXGgraph_vertex_vertex|796|0|1256|0|{RFMT_Map_to_IDS|}307|374|}
{2010601001|XXGgraph_vertex_vertex|797|0|1257|0|{RFMT_Set_IDS_Audit_Fields|}307|461|}
{2010212001|XXGvertex_oport_oport|798|0|1259|0|{0|out0|}461|462|}
{2010212001|XXGvertex_oport_oport|799|0|1261|0|{1|reject0|}461|463|}
{2010212001|XXGvertex_oport_oport|800|0|1263|0|{2|error0|}461|464|}
{2010212001|XXGvertex_oport_oport|801|0|1265|0|{3|log|}461|465|}
{2010211001|XXGvertex_iport_iport|802|0|1267|0|{0|in|}461|466|}
{2010214001|XXGiport_src_flow|803|0|1269|0|{0|}466|317|}
{2010007001|XXGobject_proto_object|804|0|1270|0|{}461|467|}
{2010212001|XXGvertex_oport_oport|805|0|1272|0|{0|out0|}467|468|}
{2010006001|XXGobject_psameas_object|806|0|1274|0|{metadata|out0_metadata|1|0|}468|467|}
{2010006001|XXGobject_psameas_object|807|0|1275|0|{transform0|transform0|1|0|}468|467|}
{2010212001|XXGvertex_oport_oport|808|0|1276|0|{1|reject0|}467|469|}
{2010006001|XXGobject_psameas_object|809|0|1278|0|{metadata|reject0_metadata|1|0|}469|467|}
{2010212001|XXGvertex_oport_oport|810|0|1279|0|{2|error0|}467|470|}
{2010006001|XXGobject_psameas_object|811|0|1281|0|{metadata|error0_metadata|1|0|}470|467|}
{2010212001|XXGvertex_oport_oport|812|0|1282|0|{3|log|}467|471|}
{2010006001|XXGobject_psameas_object|813|0|1284|0|{metadata|log_metadata|1|0|}471|467|}
{2010211001|XXGvertex_iport_iport|814|0|1285|0|{0|in|}467|472|}
{2010006001|XXGobject_psameas_object|815|0|1287|0|{metadata|in_metadata|1|0|}472|467|}
{2010006001|XXGobject_psameas_object|816|0|1288|0|{Layout|Layout|0|0|}461|61|}
{2010006001|XXGobject_psameas_object|817|0|1289|0|{in_metadata|in_metadata|0|0|}461|73|}
{2010006001|XXGobject_psameas_object|818|0|1290|0|{out0_metadata|in_metadata|0|0|}461|73|}
{2010006001|XXGobject_psameas_object|819|0|1291|0|{reject0_metadata|in_metadata|0|0|}461|73|}
{2010601001|XXGgraph_vertex_vertex|820|0|1292|0|{RFMT_XREF_CDC|}307|473|}
{2010212001|XXGvertex_oport_oport|821|0|1294|0|{0|out0|}473|474|}
{2010213001|XXGoport_dst_flow|822|0|1296|0|{0|}474|311|}
{2010212001|XXGvertex_oport_oport|823|0|1297|0|{1|reject0|}473|475|}
{2010212001|XXGvertex_oport_oport|824|0|1299|0|{2|error0|}473|476|}
{2010212001|XXGvertex_oport_oport|825|0|1301|0|{3|log|}473|477|}
{2010211001|XXGvertex_iport_iport|826|0|1303|0|{0|in|}473|478|}
{2010214001|XXGiport_src_flow|827|0|1305|0|{0|}478|319|}
{2010007001|XXGobject_proto_object|828|0|1306|0|{}473|479|}
{2010212001|XXGvertex_oport_oport|829|0|1308|0|{0|out0|}479|480|}
{2010006001|XXGobject_psameas_object|830|0|1310|0|{metadata|out0_metadata|1|0|}480|479|}
{2010006001|XXGobject_psameas_object|831|0|1311|0|{transform0|transform0|1|0|}480|479|}
{2010212001|XXGvertex_oport_oport|832|0|1312|0|{1|reject0|}479|481|}
{2010006001|XXGobject_psameas_object|833|0|1314|0|{metadata|reject0_metadata|1|0|}481|479|}
{2010212001|XXGvertex_oport_oport|834|0|1315|0|{2|error0|}479|482|}
{2010006001|XXGobject_psameas_object|835|0|1317|0|{metadata|error0_metadata|1|0|}482|479|}
{2010212001|XXGvertex_oport_oport|836|0|1318|0|{3|log|}479|483|}
{2010006001|XXGobject_psameas_object|837|0|1320|0|{metadata|log_metadata|1|0|}483|479|}
{2010211001|XXGvertex_iport_iport|838|0|1321|0|{0|in|}479|484|}
{2010006001|XXGobject_psameas_object|839|0|1323|0|{metadata|in_metadata|1|0|}484|479|}
{2010006001|XXGobject_psameas_object|840|0|1324|0|{Layout|Layout|0|0|}473|61|}
{2010006001|XXGobject_psameas_object|841|0|1325|0|{in_metadata|in_metadata|0|0|}473|73|}
{2010006001|XXGobject_psameas_object|842|0|1326|0|{out0_metadata|in_metadata|0|0|}473|73|}
{2010006001|XXGobject_psameas_object|843|0|1327|0|{reject0_metadata|in_metadata|0|0|}473|73|}
{2010212001|XXGvertex_oport_oport|844|0|1328|0|{0|out0|}307|485|}
{2010216002|XXGoport_binding_oport|845|0|1330|0|{.5|.5|{0|}12764|}485|462|}
{2010213001|XXGoport_dst_flow|846|0|1331|0|{0|}485|18|}
{2010212001|XXGvertex_oport_oport|847|0|1332|0|{1|out1|}307|486|}
{2010216002|XXGoport_binding_oport|848|0|1334|0|{.5|.5|{0|}12765|}486|387|}
{2010213001|XXGoport_dst_flow|849|0|1335|0|{0|}486|12|}
{2010211001|XXGvertex_iport_iport|850|0|1336|0|{0|in0|}307|487|}
{2010215002|XXGiport_binding_iport|851|0|1338|0|{.5|.5|{0|}12879|}487|379|}
{2010214001|XXGiport_src_flow|852|0|1339|0|{0|}487|17|}
{2010601001|XXGgraph_vertex_vertex|853|0|1340|0|{LookUps|}1|488|}
{2010605001|XXGgraph_legend_legend|854|0|1342|0|{0|}488|489|}
{2010241001|XXGlegend_face_face|855|0|1344|0|{}489|490|}
{2010605001|XXGgraph_legend_legend|856|0|1346|0|{1|}488|491|}
{2010241001|XXGlegend_face_face|857|0|1348|0|{}491|492|}
{2010605001|XXGgraph_legend_legend|858|0|1350|0|{2|}488|493|}
{2010241001|XXGlegend_face_face|859|0|1352|0|{}493|494|}
{2010604001|XXGgraph_flow_flow|860|0|1354|0|{Flow_1|}488|495|}
{2010601001|XXGgraph_vertex_vertex|861|0|1356|0|{ICFF_TEMPLATE_IDS|}488|496|}
{2010007001|XXGobject_proto_object|862|0|1358|0|{}496|497|}
{2010601001|XXGgraph_vertex_vertex|863|0|1360|0|{ICFF_TEMPLATE_XREF|}488|498|}
{2010007001|XXGobject_proto_object|864|0|1362|0|{}498|499|}
{2010601001|XXGgraph_vertex_vertex|865|0|1364|0|{ICFF_lookup_FILE_for_IDS|}488|500|}
{2010212001|XXGvertex_oport_oport|866|0|1366|0|{0|read|}500|501|}
{2010007001|XXGobject_proto_object|867|0|1368|0|{}500|502|}
{2010212001|XXGvertex_oport_oport|868|0|1370|0|{0|read|}502|503|}
{2010006001|XXGobject_psameas_object|869|0|1372|0|{metadata|read_metadata|1|0|}503|502|}
{2010601001|XXGgraph_vertex_vertex|870|0|1373|0|{REG_TEMPLATE_XREF|}488|504|}
{2010007001|XXGobject_proto_object|871|0|1375|0|{}504|505|}
{2010601001|XXGgraph_vertex_vertex|872|0|1377|0|{SRC_ENVRT_ID|}488|506|}
{2010211001|XXGvertex_iport_iport|873|0|1379|0|{0|write|}506|507|}
{2010214001|XXGiport_src_flow|874|0|1381|0|{0|}507|495|}
{2010007001|XXGobject_proto_object|875|0|1382|0|{}506|508|}
{2010211001|XXGvertex_iport_iport|876|0|1384|0|{0|write|}508|509|}
{2010006001|XXGobject_psameas_object|877|0|1386|0|{metadata|write_metadata|1|0|}509|508|}
{2010601001|XXGgraph_vertex_vertex|878|0|1387|0|{SRC_ENVRT_ID_Records_with_Override_Ranks|}488|510|}
{2010212001|XXGvertex_oport_oport|879|0|1389|0|{0|out|}510|511|}
{2010213001|XXGoport_dst_flow|880|0|1391|0|{0|}511|495|}
{2010212001|XXGvertex_oport_oport|881|0|1392|0|{1|error|}510|512|}
{2010212001|XXGvertex_oport_oport|882|0|1394|0|{2|log|}510|513|}
{2010007001|XXGobject_proto_object|883|0|1396|0|{}510|514|}
{2010212001|XXGvertex_oport_oport|884|0|1398|0|{0|out|}514|515|}
{2010006001|XXGobject_psameas_object|885|0|1400|0|{metadata|out_metadata|1|0|}515|514|}
{2010212001|XXGvertex_oport_oport|886|0|1401|0|{1|error|}514|516|}
{2010006001|XXGobject_psameas_object|887|0|1403|0|{metadata|error_metadata|1|0|}516|514|}
{2010212001|XXGvertex_oport_oport|888|0|1404|0|{2|log|}514|517|}
{2010006001|XXGobject_psameas_object|889|0|1406|0|{metadata|log_metadata|1|0|}517|514|}
{2010006001|XXGobject_psameas_object|890|0|1407|0|{Layout|Layout|0|0|}510|506|}
{2010006001|XXGobject_psameas_object|891|0|1408|0|{out_metadata|write_metadata|0|0|}510|506|}
{2010601001|XXGgraph_vertex_vertex|892|0|1409|0|{Read_Split_or_Placeholder|}1|518|}
{2010605001|XXGgraph_legend_legend|893|0|1411|0|{0|}518|519|}
{2010241001|XXGlegend_face_face|894|0|1413|0|{}519|520|}
{2010604001|XXGgraph_flow_flow|895|0|1415|0|{Flow_1|}518|275|}
{2010604001|XXGgraph_flow_flow|896|0|1416|0|{Flow_2|}518|270|}
{2010604001|XXGgraph_flow_flow|897|0|1417|0|{Flow_3|}518|521|}
{2010601001|XXGgraph_vertex_vertex|898|0|1419|0|{Gather_Logs_Invalid|}518|522|}
{2010211001|XXGvertex_iport_iport|899|0|1421|0|{0|in|}522|523|}
{2010214001|XXGiport_src_flow|900|0|1423|0|{0|}523|521|}
{2010007001|XXGobject_proto_object|901|0|1424|0|{}522|524|}
{2010211001|XXGvertex_iport_iport|902|0|1426|0|{0|in|}524|525|}
{2010006001|XXGobject_psameas_object|903|0|1428|0|{metadata|in_metadata|1|0|}525|524|}
{2010006001|XXGobject_psameas_object|904|0|1429|0|{in_metadata|log_metadata|0|0|}522|526|}
{2010212001|XXGvertex_oport_oport|905|0|1431|0|{0|out|}526|527|}
{2010212001|XXGvertex_oport_oport|906|0|1433|0|{1|reject|}526|528|}
{2010212001|XXGvertex_oport_oport|907|0|1435|0|{2|error|}526|529|}
{2010212001|XXGvertex_oport_oport|908|0|1437|0|{3|log|}526|530|}
{2010213001|XXGoport_dst_flow|909|0|1439|0|{0|}530|521|}
{2010211001|XXGvertex_iport_iport|910|0|1440|0|{0|in|}526|531|}
{2010214001|XXGiport_src_flow|911|0|1442|0|{0|}531|270|}
{2010007001|XXGobject_proto_object|912|0|1443|0|{}526|532|}
{2010212001|XXGvertex_oport_oport|913|0|1445|0|{0|out|}532|533|}
{2010006001|XXGobject_psameas_object|914|0|1447|0|{metadata|out_metadata|1|0|}533|532|}
{2010212001|XXGvertex_oport_oport|915|0|1448|0|{1|reject|}532|534|}
{2010006001|XXGobject_psameas_object|916|0|1450|0|{metadata|reject_metadata|1|0|}534|532|}
{2010212001|XXGvertex_oport_oport|917|0|1451|0|{2|error|}532|535|}
{2010006001|XXGobject_psameas_object|918|0|1453|0|{metadata|error_metadata|1|0|}535|532|}
{2010212001|XXGvertex_oport_oport|919|0|1454|0|{3|log|}532|536|}
{2010006001|XXGobject_psameas_object|920|0|1456|0|{metadata|log_metadata|1|0|}536|532|}
{2010211001|XXGvertex_iport_iport|921|0|1457|0|{0|in|}532|537|}
{2010006001|XXGobject_psameas_object|922|0|1459|0|{metadata|in_metadata|1|0|}537|532|}
{2010006001|XXGobject_psameas_object|923|0|1460|0|{Layout|Layout|0|0|}526|282|}
{2010006001|XXGobject_psameas_object|924|0|1461|0|{in_metadata|out0_metadata|0|0|}526|268|}
{2010006001|XXGobject_psameas_object|925|0|1462|0|{out_metadata|out0_metadata|0|0|}526|268|}
{2010006001|XXGobject_psameas_object|926|0|1463|0|{reject_metadata|out0_metadata|0|0|}526|268|}
{2010601001|XXGgraph_vertex_vertex|927|0|1464|0|{RFMT_Re_Construct_for_Placeholder|}518|268|}
{2010601001|XXGgraph_vertex_vertex|928|0|1465|0|{RFMT_Validate_Records|}518|526|}
{2010601001|XXGgraph_vertex_vertex|929|0|1466|0|{Read_Splits|}518|538|}
{2010604001|XXGgraph_flow_flow|930|0|1468|0|{Flow_6|}538|290|}
{2010604001|XXGgraph_flow_flow|931|0|1469|0|{Flow_7|}538|539|}
{2010601001|XXGgraph_vertex_vertex|932|0|1471|0|{Find_All_Splits|}538|299|}
{2010601001|XXGgraph_vertex_vertex|933|0|1472|0|{For_View_Data|}538|540|}
{2010212001|XXGvertex_oport_oport|934|0|1474|0|{0|read|}540|541|}
{2010213001|XXGoport_dst_flow|935|0|1476|0|{0|}541|539|}
{2010007001|XXGobject_proto_object|936|0|1477|0|{}540|542|}
{2010212001|XXGvertex_oport_oport|937|0|1479|0|{0|read|}542|543|}
{2010006001|XXGobject_psameas_object|938|0|1481|0|{metadata|read_metadata|1|0|}543|542|}
{2010601001|XXGgraph_vertex_vertex|939|0|1482|0|{Read_Multiple_Splits|}538|282|}
{2010601001|XXGgraph_vertex_vertex|940|0|1483|0|{Trash|}538|544|}
{2010211001|XXGvertex_iport_iport|941|0|1485|0|{0|in|}544|545|}
{2010214001|XXGiport_src_flow|942|0|1487|0|{0|}545|539|}
{2010007001|XXGobject_proto_object|943|0|1488|0|{}544|546|}
{2010211001|XXGvertex_iport_iport|944|0|1490|0|{0|in|}546|547|}
{2010006001|XXGobject_psameas_object|945|0|1492|0|{metadata|in_metadata|1|0|}547|546|}
{2010006001|XXGobject_psameas_object|946|0|1493|0|{in_metadata|read_metadata|0|0|}544|540|}
{2010212001|XXGvertex_oport_oport|947|0|1494|0|{0|out0|}538|548|}
{2010216002|XXGoport_binding_oport|948|0|1496|0|{.5|.5|{0|}137|}548|283|}
{2010213001|XXGoport_dst_flow|949|0|1497|0|{0|}548|275|}
{2010212001|XXGvertex_oport_oport|950|0|1498|0|{0|out0|}518|549|}
{2010216002|XXGoport_binding_oport|951|0|1500|0|{.5|.5|{6|747000|269000|767000|269000|787000|269000|}5704|}549|527|}
{2010213001|XXGoport_dst_flow|952|0|1501|0|{0|}549|17|}
{2010212001|XXGvertex_oport_oport|953|0|1502|0|{1|error|}518|550|}
{2010216002|XXGoport_binding_oport|954|0|1504|0|{1.0|.5|{12|674000|322000|674000|342000|674000|498000|594000|498000|594000|498000|594000|518000|}5705|}550|529|}
{2010213001|XXGoport_dst_flow|955|0|1505|0|{0|}550|11|}
{2010212001|XXGvertex_oport_oport|956|0|1506|0|{2|out1|}518|551|}
{2010216002|XXGoport_binding_oport|957|0|1508|0|{.5|.5|{0|}5703|}551|528|}
{2010213001|XXGoport_dst_flow|958|0|1509|0|{0|}551|21|}
{2010601001|XXGgraph_vertex_vertex|959|0|1510|0|{Replicate|}1|552|}
{2010212001|XXGvertex_oport_oport|960|0|1512|0|{0|out|}552|553|}
{2010213001|XXGoport_dst_flow|961|0|1514|0|{0|}553|23|}
{2010213001|XXGoport_dst_flow|962|0|1515|0|{1|}553|15|}
{2010213001|XXGoport_dst_flow|963|0|1516|0|{2|}553|20|}
{2010211001|XXGvertex_iport_iport|964|0|1517|0|{0|in|}552|554|}
{2010214001|XXGiport_src_flow|965|0|1519|0|{0|}554|24|}
{2010007001|XXGobject_proto_object|966|0|1520|0|{}552|555|}
{2010212001|XXGvertex_oport_oport|967|0|1522|0|{0|out|}555|556|}
{2010006001|XXGobject_psameas_object|968|0|1524|0|{metadata|out_metadata|1|0|}556|555|}
{2010211001|XXGvertex_iport_iport|969|0|1525|0|{0|in|}555|557|}
{2010006001|XXGobject_psameas_object|970|0|1527|0|{metadata|in_metadata|1|0|}557|555|}
{2010006001|XXGobject_psameas_object|971|0|1528|0|{Layout|Layout|0|0|}552|61|}
{2010006001|XXGobject_psameas_object|972|0|1529|0|{in_metadata|out1_metadata|0|0|}552|31|}
{2010006001|XXGobject_psameas_object|973|0|1530|0|{out_metadata|out1_metadata|0|0|}552|31|}
{2010601001|XXGgraph_vertex_vertex|974|0|1531|0|{Supressed_Updates|}1|558|}
{2010211001|XXGvertex_iport_iport|975|0|1533|0|{0|write|}558|559|}
{2010214001|XXGiport_src_flow|976|0|1535|0|{0|}559|13|}
{2010007001|XXGobject_proto_object|977|0|1536|0|{}558|560|}
{2010211001|XXGvertex_iport_iport|978|0|1538|0|{0|write|}560|561|}
{2010006001|XXGobject_psameas_object|979|0|1540|0|{metadata|write_metadata|1|0|}561|560|}
{2010601001|XXGgraph_vertex_vertex|980|0|1541|0|{Update_Max_SK|}1|562|}
{2010605001|XXGgraph_legend_legend|981|0|1543|0|{0|}562|563|}
{2010241001|XXGlegend_face_face|982|0|1545|0|{}563|564|}
{2010604001|XXGgraph_flow_flow|983|0|1547|0|{Flow_2|}562|565|}
{2010604001|XXGgraph_flow_flow|984|0|1549|0|{Flow_3|}562|566|}
{2010604001|XXGgraph_flow_flow|985|0|1551|0|{Flow_4|}562|567|}
{2010604001|XXGgraph_flow_flow|986|0|1553|0|{Flow_5|}562|568|}
{2010604001|XXGgraph_flow_flow|987|0|1555|0|{Flow_6|}562|569|}
{2010601001|XXGgraph_vertex_vertex|988|0|1557|0|{Create_Data|}562|570|}
{2010212001|XXGvertex_oport_oport|989|0|1559|0|{0|out|}570|571|}
{2010213001|XXGoport_dst_flow|990|0|1561|0|{0|}571|568|}
{2010212001|XXGvertex_oport_oport|991|0|1562|0|{1|error|}570|572|}
{2010212001|XXGvertex_oport_oport|992|0|1564|0|{2|log|}570|573|}
{2010007001|XXGobject_proto_object|993|0|1566|0|{}570|574|}
{2010212001|XXGvertex_oport_oport|994|0|1568|0|{0|out|}574|575|}
{2010006001|XXGobject_psameas_object|995|0|1570|0|{metadata|out_metadata|1|0|}575|574|}
{2010212001|XXGvertex_oport_oport|996|0|1571|0|{1|error|}574|576|}
{2010006001|XXGobject_psameas_object|997|0|1573|0|{metadata|error_metadata|1|0|}576|574|}
{2010212001|XXGvertex_oport_oport|998|0|1574|0|{2|log|}574|577|}
{2010006001|XXGobject_psameas_object|999|0|1576|0|{metadata|log_metadata|1|0|}577|574|}
{2010006001|XXGobject_psameas_object|1000|0|1577|0|{Layout|Layout|0|0|}570|578|}
{2010211001|XXGvertex_iport_iport|1001|0|1579|0|{0|write|}578|579|}
{2010214001|XXGiport_src_flow|1002|0|1581|0|{0|}579|567|}
{2010007001|XXGobject_proto_object|1003|0|1582|0|{}578|580|}
{2010211001|XXGvertex_iport_iport|1004|0|1584|0|{0|write|}580|581|}
{2010006001|XXGobject_psameas_object|1005|0|1586|0|{metadata|write_metadata|1|0|}581|580|}
{2010006001|XXGobject_psameas_object|1006|0|1587|0|{out_metadata|out0_metadata|0|0|}570|582|}
{2010212001|XXGvertex_oport_oport|1007|0|1589|0|{0|out0|}582|583|}
{2010213001|XXGoport_dst_flow|1008|0|1591|0|{0|}583|569|}
{2010212001|XXGvertex_oport_oport|1009|0|1592|0|{1|reject0|}582|584|}
{2010212001|XXGvertex_oport_oport|1010|0|1594|0|{2|error0|}582|585|}
{2010212001|XXGvertex_oport_oport|1011|0|1596|0|{3|log|}582|586|}
{2010211001|XXGvertex_iport_iport|1012|0|1598|0|{0|in|}582|587|}
{2010007001|XXGobject_proto_object|1013|0|1600|0|{}582|588|}
{2010212001|XXGvertex_oport_oport|1014|0|1602|0|{0|out0|}588|589|}
{2010006001|XXGobject_psameas_object|1015|0|1604|0|{metadata|out0_metadata|1|0|}589|588|}
{2010006001|XXGobject_psameas_object|1016|0|1605|0|{transform0|transform0|1|0|}589|588|}
{2010212001|XXGvertex_oport_oport|1017|0|1606|0|{1|reject0|}588|590|}
{2010006001|XXGobject_psameas_object|1018|0|1608|0|{metadata|reject0_metadata|1|0|}590|588|}
{2010212001|XXGvertex_oport_oport|1019|0|1609|0|{2|error0|}588|591|}
{2010006001|XXGobject_psameas_object|1020|0|1611|0|{metadata|error0_metadata|1|0|}591|588|}
{2010212001|XXGvertex_oport_oport|1021|0|1612|0|{3|log|}588|592|}
{2010006001|XXGobject_psameas_object|1022|0|1614|0|{metadata|log_metadata|1|0|}592|588|}
{2010211001|XXGvertex_iport_iport|1023|0|1615|0|{0|in|}588|593|}
{2010006001|XXGobject_psameas_object|1024|0|1617|0|{metadata|in_metadata|1|0|}593|588|}
{2010006001|XXGobject_psameas_object|1025|0|1618|0|{Layout|Layout|0|0|}582|61|}
{2010006001|XXGobject_psameas_object|1026|0|1619|0|{in_metadata|out1_metadata|0|0|}582|31|}
{2010006001|XXGobject_psameas_object|1027|0|1620|0|{reject0_metadata|out1_metadata|0|0|}582|31|}
{2010601001|XXGgraph_vertex_vertex|1028|0|1621|0|{Gather|}562|594|}
{2010212001|XXGvertex_oport_oport|1029|0|1623|0|{0|out|}594|595|}
{2010213001|XXGoport_dst_flow|1030|0|1625|0|{0|}595|565|}
{2010211001|XXGvertex_iport_iport|1031|0|1626|0|{0|in|}594|596|}
{2010214001|XXGiport_src_flow|1032|0|1628|0|{0|}596|566|}
{2010007001|XXGobject_proto_object|1033|0|1629|0|{}594|597|}
{2010212001|XXGvertex_oport_oport|1034|0|1631|0|{0|out|}597|598|}
{2010006001|XXGobject_psameas_object|1035|0|1633|0|{metadata|out_metadata|1|0|}598|597|}
{2010211001|XXGvertex_iport_iport|1036|0|1634|0|{0|in|}597|599|}
{2010006001|XXGobject_psameas_object|1037|0|1636|0|{metadata|in_metadata|1|0|}599|597|}
{2010006001|XXGobject_psameas_object|1038|0|1637|0|{Layout|Layout|0|0|}594|578|}
{2010006001|XXGobject_psameas_object|1039|0|1638|0|{in_metadata|out0_metadata|0|0|}594|582|}
{2010006001|XXGobject_psameas_object|1040|0|1639|0|{out_metadata|out0_metadata|0|0|}594|582|}
{2010601001|XXGgraph_vertex_vertex|1041|0|1640|0|{Reformat|}562|582|}
{2010601001|XXGgraph_vertex_vertex|1042|0|1641|0|{Rollup_Per_Partition|}562|600|}
{2010212001|XXGvertex_oport_oport|1043|0|1643|0|{0|out|}600|601|}
{2010213001|XXGoport_dst_flow|1044|0|1645|0|{0|}601|566|}
{2010212001|XXGvertex_oport_oport|1045|0|1646|0|{1|reject|}600|602|}
{2010212001|XXGvertex_oport_oport|1046|0|1648|0|{2|error|}600|603|}
{2010212001|XXGvertex_oport_oport|1047|0|1650|0|{3|log|}600|604|}
{2010211001|XXGvertex_iport_iport|1048|0|1652|0|{0|in|}600|605|}
{2010214001|XXGiport_src_flow|1049|0|1654|0|{0|}605|569|}
{2010007001|XXGobject_proto_object|1050|0|1655|0|{}600|606|}
{2010212001|XXGvertex_oport_oport|1051|0|1657|0|{0|out|}606|607|}
{2010006001|XXGobject_psameas_object|1052|0|1659|0|{metadata|out_metadata|1|0|}607|606|}
{2010212001|XXGvertex_oport_oport|1053|0|1660|0|{1|reject|}606|608|}
{2010006001|XXGobject_psameas_object|1054|0|1662|0|{metadata|reject_metadata|1|0|}608|606|}
{2010212001|XXGvertex_oport_oport|1055|0|1663|0|{2|error|}606|609|}
{2010006001|XXGobject_psameas_object|1056|0|1665|0|{metadata|error_metadata|1|0|}609|606|}
{2010212001|XXGvertex_oport_oport|1057|0|1666|0|{3|log|}606|610|}
{2010006001|XXGobject_psameas_object|1058|0|1668|0|{metadata|log_metadata|1|0|}610|606|}
{2010211001|XXGvertex_iport_iport|1059|0|1669|0|{0|in|}606|611|}
{2010006001|XXGobject_psameas_object|1060|0|1671|0|{metadata|in_metadata|1|0|}611|606|}
{2010006001|XXGobject_psameas_object|1061|0|1672|0|{Layout|Layout|0|0|}600|61|}
{2010006001|XXGobject_psameas_object|1062|0|1673|0|{in_metadata|out0_metadata|0|0|}600|582|}
{2010006001|XXGobject_psameas_object|1063|0|1674|0|{out_metadata|out0_metadata|0|0|}600|582|}
{2010006001|XXGobject_psameas_object|1064|0|1675|0|{reject_metadata|out0_metadata|0|0|}600|582|}
{2010601001|XXGgraph_vertex_vertex|1065|0|1676|0|{Rollup_Serial|}562|612|}
{2010212001|XXGvertex_oport_oport|1066|0|1678|0|{0|out|}612|613|}
{2010213001|XXGoport_dst_flow|1067|0|1680|0|{0|}613|567|}
{2010212001|XXGvertex_oport_oport|1068|0|1681|0|{1|reject|}612|614|}
{2010212001|XXGvertex_oport_oport|1069|0|1683|0|{2|error|}612|615|}
{2010212001|XXGvertex_oport_oport|1070|0|1685|0|{3|log|}612|616|}
{2010211001|XXGvertex_iport_iport|1071|0|1687|0|{0|in|}612|617|}
{2010214001|XXGiport_src_flow|1072|0|1689|0|{0|}617|565|}
{2010214001|XXGiport_src_flow|1073|0|1690|0|{1|}617|568|}
{2010007001|XXGobject_proto_object|1074|0|1691|0|{}612|618|}
{2010212001|XXGvertex_oport_oport|1075|0|1693|0|{0|out|}618|619|}
{2010006001|XXGobject_psameas_object|1076|0|1695|0|{metadata|out_metadata|1|0|}619|618|}
{2010212001|XXGvertex_oport_oport|1077|0|1696|0|{1|reject|}618|620|}
{2010006001|XXGobject_psameas_object|1078|0|1698|0|{metadata|reject_metadata|1|0|}620|618|}
{2010212001|XXGvertex_oport_oport|1079|0|1699|0|{2|error|}618|621|}
{2010006001|XXGobject_psameas_object|1080|0|1701|0|{metadata|error_metadata|1|0|}621|618|}
{2010212001|XXGvertex_oport_oport|1081|0|1702|0|{3|log|}618|622|}
{2010006001|XXGobject_psameas_object|1082|0|1704|0|{metadata|log_metadata|1|0|}622|618|}
{2010211001|XXGvertex_iport_iport|1083|0|1705|0|{0|in|}618|623|}
{2010006001|XXGobject_psameas_object|1084|0|1707|0|{metadata|in_metadata|1|0|}623|618|}
{2010006001|XXGobject_psameas_object|1085|0|1708|0|{Layout|Layout|0|0|}612|578|}
{2010006001|XXGobject_psameas_object|1086|0|1709|0|{in_metadata|out0_metadata|0|0|}612|582|}
{2010006001|XXGobject_psameas_object|1087|0|1710|0|{out_metadata|write_metadata|0|0|}612|578|}
{2010006001|XXGobject_psameas_object|1088|0|1711|0|{reject_metadata|out0_metadata|0|0|}612|582|}
{2010601001|XXGgraph_vertex_vertex|1089|0|1712|0|{Write_Max_SK_file|}562|578|}
{2010211001|XXGvertex_iport_iport|1090|0|1713|0|{0|in0|}562|624|}
{2010215002|XXGiport_binding_iport|1091|0|1715|0|{.5|.5|{0|}341|}624|587|}
{2010214001|XXGiport_src_flow|1092|0|1716|0|{0|}624|23|}
{2010601001|XXGgraph_vertex_vertex|1093|0|1717|0|{Version_Log|}1|625|}
{2010605001|XXGgraph_legend_legend|1094|0|1719|0|{0|}625|626|}
{2010241001|XXGlegend_face_face|1095|0|1721|0|{}626|627|}
{2010605001|XXGgraph_legend_legend|1096|0|1723|0|{1|}625|628|}
{2010241001|XXGlegend_face_face|1097|0|1725|0|{}628|629|}
{2010605001|XXGgraph_legend_legend|1098|0|1727|0|{2|}625|630|}
{2010241001|XXGlegend_face_face|1099|0|1729|0|{}630|631|}
{2010605001|XXGgraph_legend_legend|1100|0|1731|0|{3|}625|632|}
{2010241001|XXGlegend_face_face|1101|0|1733|0|{}632|633|}
{2010605001|XXGgraph_legend_legend|1102|0|1735|0|{4|}625|634|}
{2010241001|XXGlegend_face_face|1103|0|1737|0|{}634|635|}
{2010605001|XXGgraph_legend_legend|1104|0|1739|0|{5|}625|636|}
{2010241001|XXGlegend_face_face|1105|0|1741|0|{}636|637|}
{2010605001|XXGgraph_legend_legend|1106|0|1743|0|{6|}625|638|}
{2010241001|XXGlegend_face_face|1107|0|1745|0|{}638|639|}
{2010605001|XXGgraph_legend_legend|1108|0|1747|0|{7|}625|640|}
{2010241001|XXGlegend_face_face|1109|0|1749|0|{}640|641|}
{2010601001|XXGgraph_vertex_vertex|1110|0|1751|0|{Write_Data_Store_files|}1|642|}
{2010605001|XXGgraph_legend_legend|1111|0|1753|0|{0|}642|643|}
{2010241001|XXGlegend_face_face|1112|0|1755|0|{}643|644|}
{2010605001|XXGgraph_legend_legend|1113|0|1757|0|{1|}642|645|}
{2010241001|XXGlegend_face_face|1114|0|1759|0|{}645|646|}
{2010605001|XXGgraph_legend_legend|1115|0|1761|0|{2|}642|647|}
{2010241001|XXGlegend_face_face|1116|0|1763|0|{}647|648|}
{2010605001|XXGgraph_legend_legend|1117|0|1765|0|{3|}642|649|}
{2010241001|XXGlegend_face_face|1118|0|1767|0|{}649|650|}
{2010604001|XXGgraph_flow_flow|1119|0|1769|0|{Flow_1|}642|651|}
{2010604001|XXGgraph_flow_flow|1120|0|1771|0|{Flow_2|}642|652|}
{2010604001|XXGgraph_flow_flow|1121|0|1773|0|{Flow_3|}642|653|}
{2010604001|XXGgraph_flow_flow|1122|0|1775|0|{Flow_4|}642|654|}
{2010604001|XXGgraph_flow_flow|1123|0|1777|0|{Flow_5|}642|655|}
{2010604001|XXGgraph_flow_flow|1124|0|1779|0|{Flow_6|}642|656|}
{2010601001|XXGgraph_vertex_vertex|1125|0|1781|0|{Replicate_for_Insert|}642|657|}
{2010212001|XXGvertex_oport_oport|1126|0|1783|0|{0|out|}657|658|}
{2010213001|XXGoport_dst_flow|1127|0|1785|0|{0|}658|651|}
{2010213001|XXGoport_dst_flow|1128|0|1786|0|{1|}658|652|}
{2010213001|XXGoport_dst_flow|1129|0|1787|0|{2|}658|655|}
{2010211001|XXGvertex_iport_iport|1130|0|1788|0|{0|in|}657|659|}
{2010007001|XXGobject_proto_object|1131|0|1790|0|{}657|660|}
{2010212001|XXGvertex_oport_oport|1132|0|1792|0|{0|out|}660|661|}
{2010006001|XXGobject_psameas_object|1133|0|1794|0|{metadata|out_metadata|1|0|}661|660|}
{2010211001|XXGvertex_iport_iport|1134|0|1795|0|{0|in|}660|662|}
{2010006001|XXGobject_psameas_object|1135|0|1797|0|{metadata|in_metadata|1|0|}662|660|}
{2010006001|XXGobject_psameas_object|1136|0|1798|0|{Layout|Layout|0|0|}657|663|}
{2010212001|XXGvertex_oport_oport|1137|0|1800|0|{0|out|}663|664|}
{2010213001|XXGoport_dst_flow|1138|0|1802|0|{0|}664|665|}
{2010211001|XXGvertex_iport_iport|1139|0|1804|0|{0|in|}663|666|}
{2010007001|XXGobject_proto_object|1140|0|1806|0|{}663|667|}
{2010212001|XXGvertex_oport_oport|1141|0|1808|0|{0|out|}667|668|}
{2010006001|XXGobject_psameas_object|1142|0|1810|0|{metadata|out_metadata|1|0|}668|667|}
{2010211001|XXGvertex_iport_iport|1143|0|1811|0|{0|in|}667|669|}
{2010006001|XXGobject_psameas_object|1144|0|1813|0|{metadata|in_metadata|1|0|}669|667|}
{2010006001|XXGobject_psameas_object|1145|0|1814|0|{in_metadata|out2_metadata|0|0|}663|31|}
{2010006001|XXGobject_psameas_object|1146|0|1815|0|{out_metadata|out2_metadata|0|0|}663|31|}
{2010006001|XXGobject_psameas_object|1147|0|1816|0|{in_metadata|out1_metadata|0|0|}657|31|}
{2010006001|XXGobject_psameas_object|1148|0|1817|0|{out_metadata|out2_metadata|0|0|}657|31|}
{2010601001|XXGgraph_vertex_vertex|1149|0|1818|0|{Replicate_for_Update|}642|670|}
{2010212001|XXGvertex_oport_oport|1150|0|1820|0|{0|out|}670|671|}
{2010213001|XXGoport_dst_flow|1151|0|1822|0|{0|}671|654|}
{2010213001|XXGoport_dst_flow|1152|0|1823|0|{1|}671|653|}
{2010213001|XXGoport_dst_flow|1153|0|1824|0|{2|}671|656|}
{2010211001|XXGvertex_iport_iport|1154|0|1825|0|{0|in|}670|672|}
{2010007001|XXGobject_proto_object|1155|0|1827|0|{}670|673|}
{2010212001|XXGvertex_oport_oport|1156|0|1829|0|{0|out|}673|674|}
{2010006001|XXGobject_psameas_object|1157|0|1831|0|{metadata|out_metadata|1|0|}674|673|}
{2010211001|XXGvertex_iport_iport|1158|0|1832|0|{0|in|}673|675|}
{2010006001|XXGobject_psameas_object|1159|0|1834|0|{metadata|in_metadata|1|0|}675|673|}
{2010006001|XXGobject_psameas_object|1160|0|1835|0|{Layout|Layout|0|0|}670|663|}
{2010006001|XXGobject_psameas_object|1161|0|1836|0|{in_metadata|out2_metadata|0|0|}670|31|}
{2010006001|XXGobject_psameas_object|1162|0|1837|0|{out_metadata|out2_metadata|0|0|}670|31|}
{2010601001|XXGgraph_vertex_vertex|1163|0|1838|0|{Write_Event_Data_Store_Insert_Update|}642|676|}
{2010604001|XXGgraph_flow_flow|1164|0|1840|0|{Flow_1|}676|677|}
{2010604001|XXGgraph_flow_flow|1165|0|1842|0|{Flow_2|}676|678|}
{2010601001|XXGgraph_vertex_vertex|1166|0|1844|0|{Insert|}676|679|}
{2010211001|XXGvertex_iport_iport|1167|0|1846|0|{0|write|}679|680|}
{2010214001|XXGiport_src_flow|1168|0|1848|0|{0|}680|677|}
{2010007001|XXGobject_proto_object|1169|0|1849|0|{}679|681|}
{2010211001|XXGvertex_iport_iport|1170|0|1851|0|{0|write|}681|682|}
{2010006001|XXGobject_psameas_object|1171|0|1853|0|{metadata|write_metadata|1|0|}682|681|}
{2010601001|XXGgraph_vertex_vertex|1172|0|1854|0|{RFMT_Drop_NK_Fields_if_any_Insert|}676|683|}
{2010212001|XXGvertex_oport_oport|1173|0|1856|0|{0|out0|}683|684|}
{2010213001|XXGoport_dst_flow|1174|0|1858|0|{0|}684|677|}
{2010212001|XXGvertex_oport_oport|1175|0|1859|0|{1|reject0|}683|685|}
{2010212001|XXGvertex_oport_oport|1176|0|1861|0|{2|error0|}683|686|}
{2010212001|XXGvertex_oport_oport|1177|0|1863|0|{3|log|}683|687|}
{2010211001|XXGvertex_iport_iport|1178|0|1865|0|{0|in|}683|688|}
{2010007001|XXGobject_proto_object|1179|0|1867|0|{}683|689|}
{2010212001|XXGvertex_oport_oport|1180|0|1869|0|{0|out0|}689|690|}
{2010006001|XXGobject_psameas_object|1181|0|1871|0|{metadata|out0_metadata|1|0|}690|689|}
{2010006001|XXGobject_psameas_object|1182|0|1872|0|{transform0|transform0|1|0|}690|689|}
{2010212001|XXGvertex_oport_oport|1183|0|1873|0|{1|reject0|}689|691|}
{2010006001|XXGobject_psameas_object|1184|0|1875|0|{metadata|reject0_metadata|1|0|}691|689|}
{2010212001|XXGvertex_oport_oport|1185|0|1876|0|{2|error0|}689|692|}
{2010006001|XXGobject_psameas_object|1186|0|1878|0|{metadata|error0_metadata|1|0|}692|689|}
{2010212001|XXGvertex_oport_oport|1187|0|1879|0|{3|log|}689|693|}
{2010006001|XXGobject_psameas_object|1188|0|1881|0|{metadata|log_metadata|1|0|}693|689|}
{2010211001|XXGvertex_iport_iport|1189|0|1882|0|{0|in|}689|694|}
{2010006001|XXGobject_psameas_object|1190|0|1884|0|{metadata|in_metadata|1|0|}694|689|}
{2010006001|XXGobject_psameas_object|1191|0|1885|0|{Layout|Layout|0|0|}683|679|}
{2010006001|XXGobject_psameas_object|1192|0|1886|0|{in_metadata|out2_metadata|0|0|}683|31|}
{2010006001|XXGobject_psameas_object|1193|0|1887|0|{reject0_metadata|out2_metadata|0|0|}683|31|}
{2010601001|XXGgraph_vertex_vertex|1194|0|1888|0|{RFMT_Drop_NK_Fields_if_any_Update|}676|695|}
{2010212001|XXGvertex_oport_oport|1195|0|1890|0|{0|out0|}695|696|}
{2010213001|XXGoport_dst_flow|1196|0|1892|0|{0|}696|678|}
{2010212001|XXGvertex_oport_oport|1197|0|1893|0|{1|reject0|}695|697|}
{2010212001|XXGvertex_oport_oport|1198|0|1895|0|{2|error0|}695|698|}
{2010212001|XXGvertex_oport_oport|1199|0|1897|0|{3|log|}695|699|}
{2010211001|XXGvertex_iport_iport|1200|0|1899|0|{0|in|}695|700|}
{2010007001|XXGobject_proto_object|1201|0|1901|0|{}695|701|}
{2010212001|XXGvertex_oport_oport|1202|0|1903|0|{0|out0|}701|702|}
{2010006001|XXGobject_psameas_object|1203|0|1905|0|{metadata|out0_metadata|1|0|}702|701|}
{2010006001|XXGobject_psameas_object|1204|0|1906|0|{transform0|transform0|1|0|}702|701|}
{2010212001|XXGvertex_oport_oport|1205|0|1907|0|{1|reject0|}701|703|}
{2010006001|XXGobject_psameas_object|1206|0|1909|0|{metadata|reject0_metadata|1|0|}703|701|}
{2010212001|XXGvertex_oport_oport|1207|0|1910|0|{2|error0|}701|704|}
{2010006001|XXGobject_psameas_object|1208|0|1912|0|{metadata|error0_metadata|1|0|}704|701|}
{2010212001|XXGvertex_oport_oport|1209|0|1913|0|{3|log|}701|705|}
{2010006001|XXGobject_psameas_object|1210|0|1915|0|{metadata|log_metadata|1|0|}705|701|}
{2010211001|XXGvertex_iport_iport|1211|0|1916|0|{0|in|}701|706|}
{2010006001|XXGobject_psameas_object|1212|0|1918|0|{metadata|in_metadata|1|0|}706|701|}
{2010006001|XXGobject_psameas_object|1213|0|1919|0|{Layout|Layout|0|0|}695|707|}
{2010211001|XXGvertex_iport_iport|1214|0|1921|0|{0|write|}707|708|}
{2010214001|XXGiport_src_flow|1215|0|1923|0|{0|}708|678|}
{2010007001|XXGobject_proto_object|1216|0|1924|0|{}707|709|}
{2010211001|XXGvertex_iport_iport|1217|0|1926|0|{0|write|}709|710|}
{2010006001|XXGobject_psameas_object|1218|0|1928|0|{metadata|write_metadata|1|0|}710|709|}
{2010006001|XXGobject_psameas_object|1219|0|1929|0|{write_metadata|out0_metadata|0|0|}707|695|}
{2010006001|XXGobject_psameas_object|1220|0|1930|0|{in_metadata|out2_metadata|0|0|}695|31|}
{2010006001|XXGobject_psameas_object|1221|0|1931|0|{reject0_metadata|out2_metadata|0|0|}695|31|}
{2010601001|XXGgraph_vertex_vertex|1222|0|1932|0|{Update|}676|707|}
{2010211001|XXGvertex_iport_iport|1223|0|1933|0|{0|in0|}676|711|}
{2010215002|XXGiport_binding_iport|1224|0|1935|0|{.5|.5|{0|}105|}711|688|}
{2010214001|XXGiport_src_flow|1225|0|1936|0|{0|}711|652|}
{2010211001|XXGvertex_iport_iport|1226|0|1937|0|{1|in1|}676|712|}
{2010215002|XXGiport_binding_iport|1227|0|1939|0|{.5|.5|{0|}106|}712|700|}
{2010214001|XXGiport_src_flow|1228|0|1940|0|{0|}712|653|}
{2010601001|XXGgraph_vertex_vertex|1229|0|1941|0|{Write_Event_Data_Store_for_Truncate_Load_Insert|}642|713|}
{2010604001|XXGgraph_flow_flow|1230|0|1943|0|{Flow_1|}713|714|}
{2010604001|XXGgraph_flow_flow|1231|0|1945|0|{Flow_2|}713|665|}
{2010601001|XXGgraph_vertex_vertex|1232|0|1946|0|{Insert|}713|715|}
{2010211001|XXGvertex_iport_iport|1233|0|1948|0|{0|write|}715|716|}
{2010214001|XXGiport_src_flow|1234|0|1950|0|{0|}716|714|}
{2010007001|XXGobject_proto_object|1235|0|1951|0|{}715|717|}
{2010211001|XXGvertex_iport_iport|1236|0|1953|0|{0|write|}717|718|}
{2010006001|XXGobject_psameas_object|1237|0|1955|0|{metadata|write_metadata|1|0|}718|717|}
{2010601001|XXGgraph_vertex_vertex|1238|0|1956|0|{RFMT_Drop_NK_Fields_if_any|}713|719|}
{2010212001|XXGvertex_oport_oport|1239|0|1958|0|{0|out0|}719|720|}
{2010213001|XXGoport_dst_flow|1240|0|1960|0|{0|}720|714|}
{2010212001|XXGvertex_oport_oport|1241|0|1961|0|{1|reject0|}719|721|}
{2010212001|XXGvertex_oport_oport|1242|0|1963|0|{2|error0|}719|722|}
{2010212001|XXGvertex_oport_oport|1243|0|1965|0|{3|log|}719|723|}
{2010211001|XXGvertex_iport_iport|1244|0|1967|0|{0|in|}719|724|}
{2010214001|XXGiport_src_flow|1245|0|1969|0|{0|}724|665|}
{2010007001|XXGobject_proto_object|1246|0|1970|0|{}719|725|}
{2010212001|XXGvertex_oport_oport|1247|0|1972|0|{0|out0|}725|726|}
{2010006001|XXGobject_psameas_object|1248|0|1974|0|{metadata|out0_metadata|1|0|}726|725|}
{2010006001|XXGobject_psameas_object|1249|0|1975|0|{transform0|transform0|1|0|}726|725|}
{2010212001|XXGvertex_oport_oport|1250|0|1976|0|{1|reject0|}725|727|}
{2010006001|XXGobject_psameas_object|1251|0|1978|0|{metadata|reject0_metadata|1|0|}727|725|}
{2010212001|XXGvertex_oport_oport|1252|0|1979|0|{2|error0|}725|728|}
{2010006001|XXGobject_psameas_object|1253|0|1981|0|{metadata|error0_metadata|1|0|}728|725|}
{2010212001|XXGvertex_oport_oport|1254|0|1982|0|{3|log|}725|729|}
{2010006001|XXGobject_psameas_object|1255|0|1984|0|{metadata|log_metadata|1|0|}729|725|}
{2010211001|XXGvertex_iport_iport|1256|0|1985|0|{0|in|}725|730|}
{2010006001|XXGobject_psameas_object|1257|0|1987|0|{metadata|in_metadata|1|0|}730|725|}
{2010006001|XXGobject_psameas_object|1258|0|1988|0|{Layout|Layout|0|0|}719|715|}
{2010006001|XXGobject_psameas_object|1259|0|1989|0|{in_metadata|out2_metadata|0|0|}719|31|}
{2010006001|XXGobject_psameas_object|1260|0|1990|0|{out0_metadata|write_metadata|0|0|}719|715|}
{2010006001|XXGobject_psameas_object|1261|0|1991|0|{reject0_metadata|out2_metadata|0|0|}719|31|}
{2010601001|XXGgraph_vertex_vertex|1262|0|1992|0|{Replicate|}713|663|}
{2010211001|XXGvertex_iport_iport|1263|0|1993|0|{0|in0|}713|731|}
{2010215002|XXGiport_binding_iport|1264|0|1995|0|{.5|.5|{0|}13990|}731|666|}
{2010214001|XXGiport_src_flow|1265|0|1996|0|{0|}731|655|}
{2010214001|XXGiport_src_flow|1266|0|1997|0|{1|}731|656|}
{2010601001|XXGgraph_vertex_vertex|1267|0|1998|0|{Write_IDS_Data_Store|}642|732|}
{2010604001|XXGgraph_flow_flow|1268|0|2000|0|{Flow_1|}732|733|}
{2010604001|XXGgraph_flow_flow|1269|0|2002|0|{Flow_2|}732|734|}
{2010604001|XXGgraph_flow_flow|1270|0|2004|0|{Flow_3|}732|735|}
{2010604001|XXGgraph_flow_flow|1271|0|2006|0|{Flow_4|}732|736|}
{2010601001|XXGgraph_vertex_vertex|1272|0|2008|0|{Merge|}732|737|}
{2010212001|XXGvertex_oport_oport|1273|0|2010|0|{0|out|}737|738|}
{2010213001|XXGoport_dst_flow|1274|0|2012|0|{0|}738|733|}
{2010211001|XXGvertex_iport_iport|1275|0|2013|0|{0|in|}737|739|}
{2010007001|XXGobject_proto_object|1276|0|2015|0|{}737|740|}
{2010212001|XXGvertex_oport_oport|1277|0|2017|0|{0|out|}740|741|}
{2010006001|XXGobject_psameas_object|1278|0|2019|0|{metadata|out_metadata|1|0|}741|740|}
{2010211001|XXGvertex_iport_iport|1279|0|2020|0|{0|in|}740|742|}
{2010006001|XXGobject_psameas_object|1280|0|2022|0|{metadata|in_metadata|1|0|}742|740|}
{2010006001|XXGobject_psameas_object|1281|0|2023|0|{Layout|Layout|0|0|}737|743|}
{2010212001|XXGvertex_oport_oport|1282|0|2025|0|{0|read|}743|744|}
{2010213001|XXGoport_dst_flow|1283|0|2027|0|{0|}744|745|}
{2010211001|XXGvertex_iport_iport|1284|0|2029|0|{0|write|}743|746|}
{2010214001|XXGiport_src_flow|1285|0|2031|0|{0|}746|747|}
{2010007001|XXGobject_proto_object|1286|0|2033|0|{}743|748|}
{2010212001|XXGvertex_oport_oport|1287|0|2035|0|{0|read|}748|749|}
{2010006001|XXGobject_psameas_object|1288|0|2037|0|{metadata|read_metadata|1|0|}749|748|}
{2010211001|XXGvertex_iport_iport|1289|0|2038|0|{0|write|}748|750|}
{2010006001|XXGobject_psameas_object|1290|0|2040|0|{metadata|write_metadata|1|0|}750|748|}
{2010006001|XXGobject_psameas_object|1291|0|2041|0|{in_metadata|out2_metadata|0|0|}737|31|}
{2010006001|XXGobject_psameas_object|1292|0|2042|0|{out_metadata|out2_metadata|0|0|}737|31|}
{2010601001|XXGgraph_vertex_vertex|1293|0|2043|0|{Reduced_Single_ICFF|}732|751|}
{2010604001|XXGgraph_flow_flow|1294|0|2045|0|{Flow_1|}751|752|}
{2010604001|XXGgraph_flow_flow|1295|0|2047|0|{Flow_2|}751|753|}
{2010604001|XXGgraph_flow_flow|1296|0|2049|0|{Flow_3|}751|754|}
{2010604001|XXGgraph_flow_flow|1297|0|2051|0|{Flow_4|}751|755|}
{2010604001|XXGgraph_flow_flow|1298|0|2053|0|{Flow_5|}751|756|}
{2010604001|XXGgraph_flow_flow|1299|0|2055|0|{Flow_6|}751|757|}
{2010601001|XXGgraph_vertex_vertex|1300|0|2057|0|{FBE_Add_postFilter|}751|758|}
{2010212001|XXGvertex_oport_oport|1301|0|2059|0|{0|out|}758|759|}
{2010213001|XXGoport_dst_flow|1302|0|2061|0|{0|}759|757|}
{2010212001|XXGvertex_oport_oport|1303|0|2062|0|{1|deselect|}758|760|}
{2010212001|XXGvertex_oport_oport|1304|0|2064|0|{2|reject|}758|761|}
{2010212001|XXGvertex_oport_oport|1305|0|2066|0|{3|error|}758|762|}
{2010212001|XXGvertex_oport_oport|1306|0|2068|0|{4|log|}758|763|}
{2010211001|XXGvertex_iport_iport|1307|0|2070|0|{0|in|}758|764|}
{2010214001|XXGiport_src_flow|1308|0|2072|0|{0|}764|755|}
{2010007001|XXGobject_proto_object|1309|0|2073|0|{}758|765|}
{2010212001|XXGvertex_oport_oport|1310|0|2075|0|{0|out|}765|766|}
{2010006001|XXGobject_psameas_object|1311|0|2077|0|{metadata|out_metadata|1|0|}766|765|}
{2010212001|XXGvertex_oport_oport|1312|0|2078|0|{1|deselect|}765|767|}
{2010006001|XXGobject_psameas_object|1313|0|2080|0|{metadata|deselect_metadata|1|0|}767|765|}
{2010212001|XXGvertex_oport_oport|1314|0|2081|0|{2|reject|}765|768|}
{2010006001|XXGobject_psameas_object|1315|0|2083|0|{metadata|reject_metadata|1|0|}768|765|}
{2010212001|XXGvertex_oport_oport|1316|0|2084|0|{3|error|}765|769|}
{2010006001|XXGobject_psameas_object|1317|0|2086|0|{metadata|error_metadata|1|0|}769|765|}
{2010212001|XXGvertex_oport_oport|1318|0|2087|0|{4|log|}765|770|}
{2010006001|XXGobject_psameas_object|1319|0|2089|0|{metadata|log_metadata|1|0|}770|765|}
{2010211001|XXGvertex_iport_iport|1320|0|2090|0|{0|in|}765|771|}
{2010006001|XXGobject_psameas_object|1321|0|2092|0|{metadata|in_metadata|1|0|}771|765|}
{2010006001|XXGobject_psameas_object|1322|0|2093|0|{Layout|Layout|0|0|}758|743|}
{2010006001|XXGobject_psameas_object|1323|0|2094|0|{deselect_metadata|out0_metadata|0|0|}758|772|}
{2010212001|XXGvertex_oport_oport|1324|0|2096|0|{0|out0|}772|773|}
{2010213001|XXGoport_dst_flow|1325|0|2098|0|{0|}773|755|}
{2010212001|XXGvertex_oport_oport|1326|0|2099|0|{1|reject0|}772|774|}
{2010212001|XXGvertex_oport_oport|1327|0|2101|0|{2|error0|}772|775|}
{2010212001|XXGvertex_oport_oport|1328|0|2103|0|{3|log|}772|776|}
{2010211001|XXGvertex_iport_iport|1329|0|2105|0|{0|in|}772|777|}
{2010007001|XXGobject_proto_object|1330|0|2107|0|{}772|778|}
{2010212001|XXGvertex_oport_oport|1331|0|2109|0|{0|out0|}778|779|}
{2010006001|XXGobject_psameas_object|1332|0|2111|0|{metadata|out0_metadata|1|0|}779|778|}
{2010006001|XXGobject_psameas_object|1333|0|2112|0|{transform0|transform0|1|0|}779|778|}
{2010212001|XXGvertex_oport_oport|1334|0|2113|0|{1|reject0|}778|780|}
{2010006001|XXGobject_psameas_object|1335|0|2115|0|{metadata|reject0_metadata|1|0|}780|778|}
{2010212001|XXGvertex_oport_oport|1336|0|2116|0|{2|error0|}778|781|}
{2010006001|XXGobject_psameas_object|1337|0|2118|0|{metadata|error0_metadata|1|0|}781|778|}
{2010212001|XXGvertex_oport_oport|1338|0|2119|0|{3|log|}778|782|}
{2010006001|XXGobject_psameas_object|1339|0|2121|0|{metadata|log_metadata|1|0|}782|778|}
{2010211001|XXGvertex_iport_iport|1340|0|2122|0|{0|in|}778|783|}
{2010006001|XXGobject_psameas_object|1341|0|2124|0|{metadata|in_metadata|1|0|}783|778|}
{2010006001|XXGobject_psameas_object|1342|0|2125|0|{Layout|Layout|0|0|}772|743|}
{2010006001|XXGobject_psameas_object|1343|0|2126|0|{in_metadata|out2_metadata|0|0|}772|31|}
{2010006001|XXGobject_psameas_object|1344|0|2127|0|{reject0_metadata|out2_metadata|0|0|}772|31|}
{2010006001|XXGobject_psameas_object|1345|0|2128|0|{in_metadata|out0_metadata|0|0|}758|772|}
{2010006001|XXGobject_psameas_object|1346|0|2129|0|{out_metadata|out0_metadata|0|0|}758|772|}
{2010006001|XXGobject_psameas_object|1347|0|2130|0|{reject_metadata|out0_metadata|0|0|}758|772|}
{2010601001|XXGgraph_vertex_vertex|1348|0|2131|0|{New_Data_File_4|}751|784|}
{2010211001|XXGvertex_iport_iport|1349|0|2133|0|{0|write|}784|785|}
{2010214001|XXGiport_src_flow|1350|0|2135|0|{0|}785|756|}
{2010007001|XXGobject_proto_object|1351|0|2136|0|{}784|786|}
{2010211001|XXGvertex_iport_iport|1352|0|2138|0|{0|write|}786|787|}
{2010006001|XXGobject_psameas_object|1353|0|2140|0|{metadata|write_metadata|1|0|}787|786|}
{2010601001|XXGgraph_vertex_vertex|1354|0|2141|0|{PBKS_ICFF_KEY_dxf_hk_part1_|}751|788|}
{2010604001|XXGgraph_flow_flow|1355|0|2143|0|{Flow_1|}788|789|}
{2010601001|XXGgraph_vertex_vertex|1356|0|2145|0|{Partition_by_Key|}788|790|}
{2010212001|XXGvertex_oport_oport|1357|0|2147|0|{0|out|}790|791|}
{2010213001|XXGoport_dst_flow|1358|0|2149|0|{0|}791|789|}
{2010211001|XXGvertex_iport_iport|1359|0|2150|0|{0|in|}790|792|}
{2010006001|XXGobject_psameas_object|1360|0|2152|0|{out_metadata|in_metadata|0|0|}790|790|}
{2010601001|XXGgraph_vertex_vertex|1361|0|2153|0|{Sort|}788|793|}
{2010212001|XXGvertex_oport_oport|1362|0|2155|0|{0|out|}793|794|}
{2010211001|XXGvertex_iport_iport|1363|0|2157|0|{0|in|}793|795|}
{2010214001|XXGiport_src_flow|1364|0|2159|0|{0|}795|789|}
{2010006001|XXGobject_psameas_object|1365|0|2160|0|{in_metadata|in_metadata|0|0|}793|790|}
{2010006001|XXGobject_psameas_object|1366|0|2161|0|{out_metadata|in_metadata|0|0|}793|790|}
{2010212001|XXGvertex_oport_oport|1367|0|2162|0|{0|out0|}788|796|}
{2010216002|XXGoport_binding_oport|1368|0|2164|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}796|794|}
{2010213001|XXGoport_dst_flow|1369|0|2165|0|{0|}796|752|}
{2010211001|XXGvertex_iport_iport|1370|0|2166|0|{0|in0|}788|797|}
{2010215002|XXGiport_binding_iport|1371|0|2168|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}797|792|}
{2010214001|XXGiport_src_flow|1372|0|2169|0|{0|}797|757|}
{2010007001|XXGobject_proto_object|1373|0|2170|0|{}788|798|}
{2010604001|XXGgraph_flow_flow|1374|0|2172|0|{Flow_1|}798|799|}
{2010601001|XXGgraph_vertex_vertex|1375|0|2174|0|{Partition_by_Key|}798|800|}
{2010212001|XXGvertex_oport_oport|1376|0|2176|0|{0|out|}800|801|}
{2010213001|XXGoport_dst_flow|1377|0|2178|0|{0|}801|799|}
{2010211001|XXGvertex_iport_iport|1378|0|2179|0|{0|in|}800|802|}
{2010007001|XXGobject_proto_object|1379|0|2181|0|{}800|803|}
{2010212001|XXGvertex_oport_oport|1380|0|2183|0|{0|out|}803|804|}
{2010006001|XXGobject_psameas_object|1381|0|2185|0|{metadata|out_metadata|1|0|}804|803|}
{2010211001|XXGvertex_iport_iport|1382|0|2186|0|{0|in|}803|805|}
{2010006001|XXGobject_psameas_object|1383|0|2188|0|{metadata|in_metadata|1|0|}805|803|}
{2010006001|XXGobject_psameas_object|1384|0|2189|0|{Layout|InputLayout|1|0|}800|798|}
{2010006001|XXGobject_psameas_object|1385|0|2190|0|{key|Key|1|0|}800|798|}
{2010601001|XXGgraph_vertex_vertex|1386|0|2191|0|{Sort|}798|806|}
{2010212001|XXGvertex_oport_oport|1387|0|2193|0|{0|out|}806|807|}
{2010211001|XXGvertex_iport_iport|1388|0|2195|0|{0|in|}806|808|}
{2010214001|XXGiport_src_flow|1389|0|2197|0|{0|}808|799|}
{2010007001|XXGobject_proto_object|1390|0|2198|0|{}806|809|}
{2010212001|XXGvertex_oport_oport|1391|0|2200|0|{0|out|}809|810|}
{2010006001|XXGobject_psameas_object|1392|0|2202|0|{metadata|out_metadata|1|0|}810|809|}
{2010211001|XXGvertex_iport_iport|1393|0|2203|0|{0|in|}809|811|}
{2010006001|XXGobject_psameas_object|1394|0|2205|0|{metadata|in_metadata|1|0|}811|809|}
{2010006001|XXGobject_psameas_object|1395|0|2206|0|{Layout|OutputLayout|1|0|}806|798|}
{2010006001|XXGobject_psameas_object|1396|0|2207|0|{key|Key|1|0|}806|798|}
{2010006001|XXGobject_psameas_object|1397|0|2208|0|{max_core|Max_core|1|0|}806|798|}
{2010212001|XXGvertex_oport_oport|1398|0|2209|0|{0|out0|}798|812|}
{2010216002|XXGoport_binding_oport|1399|0|2211|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}812|807|}
{2010211001|XXGvertex_iport_iport|1400|0|2212|0|{0|in0|}798|813|}
{2010215002|XXGiport_binding_iport|1401|0|2214|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}813|802|}
{2010006001|XXGobject_psameas_object|1402|0|2215|0|{InputLayout|Layout|0|0|}788|743|}
{2010006001|XXGobject_psameas_object|1403|0|2216|0|{OutputLayout|Layout|0|0|}788|814|}
{2010212001|XXGvertex_oport_oport|1404|0|2218|0|{0|read|}814|815|}
{2010213001|XXGoport_dst_flow|1405|0|2220|0|{0|}815|756|}
{2010211001|XXGvertex_iport_iport|1406|0|2221|0|{0|write|}814|816|}
{2010214001|XXGiport_src_flow|1407|0|2223|0|{0|}816|753|}
{2010007001|XXGobject_proto_object|1408|0|2224|0|{}814|817|}
{2010212001|XXGvertex_oport_oport|1409|0|2226|0|{0|read|}817|818|}
{2010006001|XXGobject_psameas_object|1410|0|2228|0|{metadata|read_metadata|1|0|}818|817|}
{2010211001|XXGvertex_iport_iport|1411|0|2229|0|{0|write|}817|819|}
{2010006001|XXGobject_psameas_object|1412|0|2231|0|{metadata|write_metadata|1|0|}819|817|}
{2010601001|XXGgraph_vertex_vertex|1413|0|2232|0|{REDUCED_ICFF|}751|814|}
{2010601001|XXGgraph_vertex_vertex|1414|0|2233|0|{REDUCED_Index_File|}751|820|}
{2010211001|XXGvertex_iport_iport|1415|0|2235|0|{0|write|}820|821|}
{2010214001|XXGiport_src_flow|1416|0|2237|0|{0|}821|754|}
{2010007001|XXGobject_proto_object|1417|0|2238|0|{}820|822|}
{2010211001|XXGvertex_iport_iport|1418|0|2240|0|{0|write|}822|823|}
{2010006001|XXGobject_psameas_object|1419|0|2242|0|{metadata|write_metadata|1|0|}823|822|}
{2010601001|XXGgraph_vertex_vertex|1420|0|2243|0|{RFMT_Get_Hash_On_Reduced_File_Key|}751|772|}
{2010601001|XXGgraph_vertex_vertex|1421|0|2244|0|{Write_Block_Compressed_Lookup|}751|824|}
{2010212001|XXGvertex_oport_oport|1422|0|2246|0|{0|out|}824|825|}
{2010213001|XXGoport_dst_flow|1423|0|2248|0|{0|}825|753|}
{2010212001|XXGvertex_oport_oport|1424|0|2249|0|{1|index|}824|826|}
{2010213001|XXGoport_dst_flow|1425|0|2251|0|{0|}826|754|}
{2010212001|XXGvertex_oport_oport|1426|0|2252|0|{2|address|}824|827|}
{2010211001|XXGvertex_iport_iport|1427|0|2254|0|{0|in|}824|828|}
{2010214001|XXGiport_src_flow|1428|0|2256|0|{0|}828|752|}
{2010007001|XXGobject_proto_object|1429|0|2257|0|{}824|829|}
{2010212001|XXGvertex_oport_oport|1430|0|2259|0|{0|out|}829|830|}
{2010006001|XXGobject_psameas_object|1431|0|2261|0|{metadata|out_metadata|1|0|}830|829|}
{2010212001|XXGvertex_oport_oport|1432|0|2262|0|{1|index|}829|831|}
{2010006001|XXGobject_psameas_object|1433|0|2264|0|{metadata|index_metadata|1|0|}831|829|}
{2010212001|XXGvertex_oport_oport|1434|0|2265|0|{2|address|}829|832|}
{2010006001|XXGobject_psameas_object|1435|0|2267|0|{metadata|address_metadata|1|0|}832|829|}
{2010211001|XXGvertex_iport_iport|1436|0|2268|0|{0|in|}829|833|}
{2010006001|XXGobject_psameas_object|1437|0|2270|0|{metadata|in_metadata|1|0|}833|829|}
{2010006001|XXGobject_psameas_object|1438|0|2271|0|{Layout|Layout|0|0|}824|814|}
{2010006001|XXGobject_psameas_object|1439|0|2272|0|{in_metadata|in_metadata|0|0|}824|790|}
{2010006001|XXGobject_psameas_object|1440|0|2273|0|{out_metadata|write_metadata|0|0|}824|814|}
{2010211001|XXGvertex_iport_iport|1441|0|2274|0|{0|in0|}751|834|}
{2010215002|XXGiport_binding_iport|1442|0|2276|0|{.5|.5|{0|}12442|}834|777|}
{2010214001|XXGiport_src_flow|1443|0|2277|0|{0|}834|736|}
{2010601001|XXGgraph_vertex_vertex|1444|0|2278|0|{Replicate|}732|835|}
{2010212001|XXGvertex_oport_oport|1445|0|2280|0|{0|out|}835|836|}
{2010213001|XXGoport_dst_flow|1446|0|2282|0|{0|}836|734|}
{2010213001|XXGoport_dst_flow|1447|0|2283|0|{1|}836|735|}
{2010213001|XXGoport_dst_flow|1448|0|2284|0|{2|}836|736|}
{2010211001|XXGvertex_iport_iport|1449|0|2285|0|{0|in|}835|837|}
{2010214001|XXGiport_src_flow|1450|0|2287|0|{0|}837|733|}
{2010007001|XXGobject_proto_object|1451|0|2288|0|{}835|838|}
{2010212001|XXGvertex_oport_oport|1452|0|2290|0|{0|out|}838|839|}
{2010006001|XXGobject_psameas_object|1453|0|2292|0|{metadata|out_metadata|1|0|}839|838|}
{2010211001|XXGvertex_iport_iport|1454|0|2293|0|{0|in|}838|840|}
{2010006001|XXGobject_psameas_object|1455|0|2295|0|{metadata|in_metadata|1|0|}840|838|}
{2010006001|XXGobject_psameas_object|1456|0|2296|0|{Layout|Layout|0|0|}835|743|}
{2010006001|XXGobject_psameas_object|1457|0|2297|0|{in_metadata|out2_metadata|0|0|}835|31|}
{2010006001|XXGobject_psameas_object|1458|0|2298|0|{out_metadata|out2_metadata|0|0|}835|31|}
{2010601001|XXGgraph_vertex_vertex|1459|0|2299|0|{Write_Dim_Datasets|}732|841|}
{2010604001|XXGgraph_flow_flow|1460|0|2301|0|{Flow_1|}841|842|}
{2010604001|XXGgraph_flow_flow|1461|0|2303|0|{Flow_2|}841|745|}
{2010604001|XXGgraph_flow_flow|1462|0|2304|0|{Flow_6|}841|747|}
{2010604001|XXGgraph_flow_flow|1463|0|2305|0|{Flow_7|}841|843|}
{2010601001|XXGgraph_vertex_vertex|1464|0|2307|0|{IDS_ICFF|}841|743|}
{2010601001|XXGgraph_vertex_vertex|1465|0|2308|0|{IDS_Index_File|}841|844|}
{2010211001|XXGvertex_iport_iport|1466|0|2310|0|{0|write|}844|845|}
{2010214001|XXGiport_src_flow|1467|0|2312|0|{0|}845|843|}
{2010007001|XXGobject_proto_object|1468|0|2313|0|{}844|846|}
{2010211001|XXGvertex_iport_iport|1469|0|2315|0|{0|write|}846|847|}
{2010006001|XXGobject_psameas_object|1470|0|2317|0|{metadata|write_metadata|1|0|}847|846|}
{2010006001|XXGobject_psameas_object|1471|0|2318|0|{write_metadata|index_metadata|0|0|}844|848|}
{2010212001|XXGvertex_oport_oport|1472|0|2320|0|{0|out|}848|849|}
{2010213001|XXGoport_dst_flow|1473|0|2322|0|{0|}849|747|}
{2010212001|XXGvertex_oport_oport|1474|0|2323|0|{1|index|}848|850|}
{2010213001|XXGoport_dst_flow|1475|0|2325|0|{0|}850|843|}
{2010212001|XXGvertex_oport_oport|1476|0|2326|0|{2|address|}848|851|}
{2010211001|XXGvertex_iport_iport|1477|0|2328|0|{0|in|}848|852|}
{2010214001|XXGiport_src_flow|1478|0|2330|0|{0|}852|842|}
{2010007001|XXGobject_proto_object|1479|0|2331|0|{}848|853|}
{2010212001|XXGvertex_oport_oport|1480|0|2333|0|{0|out|}853|854|}
{2010006001|XXGobject_psameas_object|1481|0|2335|0|{metadata|out_metadata|1|0|}854|853|}
{2010212001|XXGvertex_oport_oport|1482|0|2336|0|{1|index|}853|855|}
{2010006001|XXGobject_psameas_object|1483|0|2338|0|{metadata|index_metadata|1|0|}855|853|}
{2010212001|XXGvertex_oport_oport|1484|0|2339|0|{2|address|}853|856|}
{2010006001|XXGobject_psameas_object|1485|0|2341|0|{metadata|address_metadata|1|0|}856|853|}
{2010211001|XXGvertex_iport_iport|1486|0|2342|0|{0|in|}853|857|}
{2010006001|XXGobject_psameas_object|1487|0|2344|0|{metadata|in_metadata|1|0|}857|853|}
{2010006001|XXGobject_psameas_object|1488|0|2345|0|{Layout|Layout|0|0|}848|743|}
{2010006001|XXGobject_psameas_object|1489|0|2346|0|{in_metadata|out2_metadata|0|0|}848|31|}
{2010006001|XXGobject_psameas_object|1490|0|2347|0|{out_metadata|write_metadata|0|0|}848|743|}
{2010601001|XXGgraph_vertex_vertex|1491|0|2348|0|{Replicate|}841|858|}
{2010212001|XXGvertex_oport_oport|1492|0|2350|0|{0|out|}858|859|}
{2010213001|XXGoport_dst_flow|1493|0|2352|0|{0|}859|842|}
{2010211001|XXGvertex_iport_iport|1494|0|2353|0|{0|in|}858|860|}
{2010007001|XXGobject_proto_object|1495|0|2355|0|{}858|861|}
{2010212001|XXGvertex_oport_oport|1496|0|2357|0|{0|out|}861|862|}
{2010006001|XXGobject_psameas_object|1497|0|2359|0|{metadata|out_metadata|1|0|}862|861|}
{2010211001|XXGvertex_iport_iport|1498|0|2360|0|{0|in|}861|863|}
{2010006001|XXGobject_psameas_object|1499|0|2362|0|{metadata|in_metadata|1|0|}863|861|}
{2010006001|XXGobject_psameas_object|1500|0|2363|0|{Layout|Layout|0|0|}858|743|}
{2010006001|XXGobject_psameas_object|1501|0|2364|0|{in_metadata|out2_metadata|0|0|}858|31|}
{2010006001|XXGobject_psameas_object|1502|0|2365|0|{out_metadata|out2_metadata|0|0|}858|31|}
{2010601001|XXGgraph_vertex_vertex|1503|0|2366|0|{View_Data|}841|864|}
{2010211001|XXGvertex_iport_iport|1504|0|2368|0|{0|write|}864|865|}
{2010214001|XXGiport_src_flow|1505|0|2370|0|{0|}865|745|}
{2010007001|XXGobject_proto_object|1506|0|2371|0|{}864|866|}
{2010211001|XXGvertex_iport_iport|1507|0|2373|0|{0|write|}866|867|}
{2010006001|XXGobject_psameas_object|1508|0|2375|0|{metadata|write_metadata|1|0|}867|866|}
{2010601001|XXGgraph_vertex_vertex|1509|0|2376|0|{Write_Block_Compressed_Lookup|}841|848|}
{2010211001|XXGvertex_iport_iport|1510|0|2377|0|{0|in0|}841|868|}
{2010215002|XXGiport_binding_iport|1511|0|2379|0|{.5|.5|{0|}10572|}868|860|}
{2010214001|XXGiport_src_flow|1512|0|2380|0|{0|}868|734|}
{2010601001|XXGgraph_vertex_vertex|1513|0|2381|0|{Write_Multi_ICFF|}732|869|}
{2010605001|XXGgraph_legend_legend|1514|0|2383|0|{0|}869|870|}
{2010241001|XXGlegend_face_face|1515|0|2385|0|{}870|871|}
{2010604001|XXGgraph_flow_flow|1516|0|2387|0|{Flow_1|}869|872|}
{2010604001|XXGgraph_flow_flow|1517|0|2389|0|{Flow_8|}869|873|}
{2010601001|XXGgraph_vertex_vertex|1518|0|2391|0|{Compute_Multiple_Block_Compressed_Lookups|}869|874|}
{2010212001|XXGvertex_oport_oport|1519|0|2393|0|{0|out|}874|875|}
{2010213001|XXGoport_dst_flow|1520|0|2395|0|{0|}875|872|}
{2010212001|XXGvertex_oport_oport|1521|0|2396|0|{1|reject|}874|876|}
{2010212001|XXGvertex_oport_oport|1522|0|2398|0|{2|error|}874|877|}
{2010212001|XXGvertex_oport_oport|1523|0|2400|0|{3|log|}874|878|}
{2010212001|XXGvertex_oport_oport|1524|0|2402|0|{4|address|}874|879|}
{2010211001|XXGvertex_iport_iport|1525|0|2404|0|{0|in|}874|880|}
{2010007001|XXGobject_proto_object|1526|0|2406|0|{}874|881|}
{2010212001|XXGvertex_oport_oport|1527|0|2408|0|{0|out|}881|882|}
{2010006001|XXGobject_psameas_object|1528|0|2410|0|{metadata|out_metadata|1|0|}882|881|}
{2010212001|XXGvertex_oport_oport|1529|0|2411|0|{1|reject|}881|883|}
{2010006001|XXGobject_psameas_object|1530|0|2413|0|{metadata|reject_metadata|1|0|}883|881|}
{2010212001|XXGvertex_oport_oport|1531|0|2414|0|{2|error|}881|884|}
{2010006001|XXGobject_psameas_object|1532|0|2416|0|{metadata|error_metadata|1|0|}884|881|}
{2010212001|XXGvertex_oport_oport|1533|0|2417|0|{3|log|}881|885|}
{2010006001|XXGobject_psameas_object|1534|0|2419|0|{metadata|log_metadata|1|0|}885|881|}
{2010212001|XXGvertex_oport_oport|1535|0|2420|0|{4|address|}881|886|}
{2010006001|XXGobject_psameas_object|1536|0|2422|0|{metadata|address_metadata|1|0|}886|881|}
{2010211001|XXGvertex_iport_iport|1537|0|2423|0|{0|in|}881|887|}
{2010006001|XXGobject_psameas_object|1538|0|2425|0|{metadata|in_metadata|1|0|}887|881|}
{2010006001|XXGobject_psameas_object|1539|0|2426|0|{reject_metadata|in_metadata|0|0|}874|874|}
{2010601001|XXGgraph_vertex_vertex|1540|0|2427|0|{Replicate|}869|888|}
{2010212001|XXGvertex_oport_oport|1541|0|2429|0|{0|out|}888|889|}
{2010213001|XXGoport_dst_flow|1542|0|2431|0|{0|}889|873|}
{2010211001|XXGvertex_iport_iport|1543|0|2432|0|{0|in|}888|890|}
{2010214001|XXGiport_src_flow|1544|0|2434|0|{0|}890|872|}
{2010007001|XXGobject_proto_object|1545|0|2435|0|{}888|891|}
{2010212001|XXGvertex_oport_oport|1546|0|2437|0|{0|out|}891|892|}
{2010006001|XXGobject_psameas_object|1547|0|2439|0|{metadata|out_metadata|1|0|}892|891|}
{2010211001|XXGvertex_iport_iport|1548|0|2440|0|{0|in|}891|893|}
{2010006001|XXGobject_psameas_object|1549|0|2442|0|{metadata|in_metadata|1|0|}893|891|}
{2010006001|XXGobject_psameas_object|1550|0|2443|0|{in_metadata|out_metadata|0|0|}888|874|}
{2010006001|XXGobject_psameas_object|1551|0|2444|0|{out_metadata|out_metadata|0|0|}888|874|}
{2010601001|XXGgraph_vertex_vertex|1552|0|2445|0|{WMF|}869|894|}
{2010212001|XXGvertex_oport_oport|1553|0|2447|0|{0|reject|}894|895|}
{2010212001|XXGvertex_oport_oport|1554|0|2449|0|{1|error|}894|896|}
{2010212001|XXGvertex_oport_oport|1555|0|2451|0|{2|log|}894|897|}
{2010211001|XXGvertex_iport_iport|1556|0|2453|0|{0|in|}894|898|}
{2010214001|XXGiport_src_flow|1557|0|2455|0|{0|}898|873|}
{2010007001|XXGobject_proto_object|1558|0|2456|0|{}894|899|}
{2010212001|XXGvertex_oport_oport|1559|0|2458|0|{0|reject|}899|900|}
{2010006001|XXGobject_psameas_object|1560|0|2460|0|{metadata|reject_metadata|1|0|}900|899|}
{2010212001|XXGvertex_oport_oport|1561|0|2461|0|{1|error|}899|901|}
{2010006001|XXGobject_psameas_object|1562|0|2463|0|{metadata|error_metadata|1|0|}901|899|}
{2010212001|XXGvertex_oport_oport|1563|0|2464|0|{2|log|}899|902|}
{2010006001|XXGobject_psameas_object|1564|0|2466|0|{metadata|log_metadata|1|0|}902|899|}
{2010211001|XXGvertex_iport_iport|1565|0|2467|0|{0|in|}899|903|}
{2010006001|XXGobject_psameas_object|1566|0|2469|0|{metadata|in_metadata|1|0|}903|899|}
{2010006001|XXGobject_psameas_object|1567|0|2470|0|{in_metadata|out_metadata|0|0|}894|874|}
{2010006001|XXGobject_psameas_object|1568|0|2471|0|{reject_metadata|out_metadata|0|0|}894|874|}
{2010601001|XXGgraph_vertex_vertex|1569|0|2472|0|{Write_Multiple_Block_Compressed_Lookups|}869|904|}
{2010212001|XXGvertex_oport_oport|1570|0|2474|0|{0|reject|}904|905|}
{2010212001|XXGvertex_oport_oport|1571|0|2476|0|{1|error|}904|906|}
{2010212001|XXGvertex_oport_oport|1572|0|2478|0|{2|log|}904|907|}
{2010212001|XXGvertex_oport_oport|1573|0|2480|0|{3|address|}904|908|}
{2010211001|XXGvertex_iport_iport|1574|0|2482|0|{0|in|}904|909|}
{2010007001|XXGobject_proto_object|1575|0|2484|0|{}904|910|}
{2010212001|XXGvertex_oport_oport|1576|0|2486|0|{0|reject|}910|911|}
{2010006001|XXGobject_psameas_object|1577|0|2488|0|{metadata|reject_metadata|1|0|}911|910|}
{2010212001|XXGvertex_oport_oport|1578|0|2489|0|{1|error|}910|912|}
{2010006001|XXGobject_psameas_object|1579|0|2491|0|{metadata|error_metadata|1|0|}912|910|}
{2010212001|XXGvertex_oport_oport|1580|0|2492|0|{2|log|}910|913|}
{2010006001|XXGobject_psameas_object|1581|0|2494|0|{metadata|log_metadata|1|0|}913|910|}
{2010212001|XXGvertex_oport_oport|1582|0|2495|0|{3|address|}910|914|}
{2010006001|XXGobject_psameas_object|1583|0|2497|0|{metadata|address_metadata|1|0|}914|910|}
{2010211001|XXGvertex_iport_iport|1584|0|2498|0|{0|in|}910|915|}
{2010006001|XXGobject_psameas_object|1585|0|2500|0|{metadata|in_metadata|1|0|}915|910|}
{2010006001|XXGobject_psameas_object|1586|0|2501|0|{Layout|Layout|0|0|}904|743|}
{2010006001|XXGobject_psameas_object|1587|0|2502|0|{in_metadata|out2_metadata|0|0|}904|31|}
{2010006001|XXGobject_psameas_object|1588|0|2503|0|{reject_metadata|out2_metadata|0|0|}904|31|}
{2010211001|XXGvertex_iport_iport|1589|0|2504|0|{0|in1|}869|916|}
{2010215002|XXGiport_binding_iport|1590|0|2506|0|{.5|.5|{0|}11533|}916|909|}
{2010214001|XXGiport_src_flow|1591|0|2507|0|{0|}916|735|}
{2010211001|XXGvertex_iport_iport|1592|0|2508|0|{0|in0|}732|917|}
{2010215002|XXGiport_binding_iport|1593|0|2510|0|{.5|.5|{0|}11641|}917|739|}
{2010214001|XXGiport_src_flow|1594|0|2511|0|{0|}917|651|}
{2010214001|XXGiport_src_flow|1595|0|2512|0|{1|}917|654|}
{2010601001|XXGgraph_vertex_vertex|1596|0|2513|0|{Write_Xref_files|}642|918|}
{2010605001|XXGgraph_legend_legend|1597|0|2515|0|{0|}918|919|}
{2010241001|XXGlegend_face_face|1598|0|2517|0|{}919|920|}
{2010605001|XXGgraph_legend_legend|1599|0|2519|0|{1|}918|921|}
{2010241001|XXGlegend_face_face|1600|0|2521|0|{}921|922|}
{2010604001|XXGgraph_flow_flow|1601|0|2523|0|{Flow_1|}918|923|}
{2010604001|XXGgraph_flow_flow|1602|0|2525|0|{Flow_2|}918|924|}
{2010604001|XXGgraph_flow_flow|1603|0|2527|0|{Flow_3|}918|925|}
{2010604001|XXGgraph_flow_flow|1604|0|2529|0|{Flow_4|}918|926|}
{2010601001|XXGgraph_vertex_vertex|1605|0|2531|0|{Dummy_Replicate|}918|927|}
{2010212001|XXGvertex_oport_oport|1606|0|2533|0|{0|out|}927|928|}
{2010213001|XXGoport_dst_flow|1607|0|2535|0|{0|}928|925|}
{2010213001|XXGoport_dst_flow|1608|0|2536|0|{1|}928|926|}
{2010211001|XXGvertex_iport_iport|1609|0|2537|0|{0|in|}927|929|}
{2010214001|XXGiport_src_flow|1610|0|2539|0|{0|}929|923|}
{2010007001|XXGobject_proto_object|1611|0|2540|0|{}927|930|}
{2010212001|XXGvertex_oport_oport|1612|0|2542|0|{0|out|}930|931|}
{2010006001|XXGobject_psameas_object|1613|0|2544|0|{metadata|out_metadata|1|0|}931|930|}
{2010211001|XXGvertex_iport_iport|1614|0|2545|0|{0|in|}930|932|}
{2010006001|XXGobject_psameas_object|1615|0|2547|0|{metadata|in_metadata|1|0|}932|930|}
{2010006001|XXGobject_psameas_object|1616|0|2548|0|{Layout|Layout|0|0|}927|61|}
{2010006001|XXGobject_psameas_object|1617|0|2549|0|{in_metadata|out0_metadata|0|0|}927|933|}
{2010212001|XXGvertex_oport_oport|1618|0|2551|0|{0|out0|}933|934|}
{2010213001|XXGoport_dst_flow|1619|0|2553|0|{0|}934|924|}
{2010212001|XXGvertex_oport_oport|1620|0|2554|0|{1|reject0|}933|935|}
{2010212001|XXGvertex_oport_oport|1621|0|2556|0|{2|error0|}933|936|}
{2010212001|XXGvertex_oport_oport|1622|0|2558|0|{3|log|}933|937|}
{2010211001|XXGvertex_iport_iport|1623|0|2560|0|{0|in|}933|938|}
{2010007001|XXGobject_proto_object|1624|0|2562|0|{}933|939|}
{2010212001|XXGvertex_oport_oport|1625|0|2564|0|{0|out0|}939|940|}
{2010006001|XXGobject_psameas_object|1626|0|2566|0|{metadata|out0_metadata|1|0|}940|939|}
{2010006001|XXGobject_psameas_object|1627|0|2567|0|{transform0|transform0|1|0|}940|939|}
{2010212001|XXGvertex_oport_oport|1628|0|2568|0|{1|reject0|}939|941|}
{2010006001|XXGobject_psameas_object|1629|0|2570|0|{metadata|reject0_metadata|1|0|}941|939|}
{2010212001|XXGvertex_oport_oport|1630|0|2571|0|{2|error0|}939|942|}
{2010006001|XXGobject_psameas_object|1631|0|2573|0|{metadata|error0_metadata|1|0|}942|939|}
{2010212001|XXGvertex_oport_oport|1632|0|2574|0|{3|log|}939|943|}
{2010006001|XXGobject_psameas_object|1633|0|2576|0|{metadata|log_metadata|1|0|}943|939|}
{2010211001|XXGvertex_iport_iport|1634|0|2577|0|{0|in|}939|944|}
{2010006001|XXGobject_psameas_object|1635|0|2579|0|{metadata|in_metadata|1|0|}944|939|}
{2010006001|XXGobject_psameas_object|1636|0|2580|0|{Layout|Layout|0|0|}933|61|}
{2010006001|XXGobject_psameas_object|1637|0|2581|0|{in_metadata|out1_metadata|0|0|}933|31|}
{2010006001|XXGobject_psameas_object|1638|0|2582|0|{reject0_metadata|out1_metadata|0|0|}933|31|}
{2010006001|XXGobject_psameas_object|1639|0|2583|0|{out_metadata|out0_metadata|0|0|}927|933|}
{2010601001|XXGgraph_vertex_vertex|1640|0|2584|0|{RFMT_Drop_columns|}918|933|}
{2010601001|XXGgraph_vertex_vertex|1641|0|2585|0|{Replicate|}918|945|}
{2010212001|XXGvertex_oport_oport|1642|0|2587|0|{0|out|}945|946|}
{2010213001|XXGoport_dst_flow|1643|0|2589|0|{0|}946|923|}
{2010211001|XXGvertex_iport_iport|1644|0|2590|0|{0|in|}945|947|}
{2010214001|XXGiport_src_flow|1645|0|2592|0|{0|}947|924|}
{2010007001|XXGobject_proto_object|1646|0|2593|0|{}945|948|}
{2010212001|XXGvertex_oport_oport|1647|0|2595|0|{0|out|}948|949|}
{2010006001|XXGobject_psameas_object|1648|0|2597|0|{metadata|out_metadata|1|0|}949|948|}
{2010211001|XXGvertex_iport_iport|1649|0|2598|0|{0|in|}948|950|}
{2010006001|XXGobject_psameas_object|1650|0|2600|0|{metadata|in_metadata|1|0|}950|948|}
{2010006001|XXGobject_psameas_object|1651|0|2601|0|{Layout|Layout|0|0|}945|61|}
{2010006001|XXGobject_psameas_object|1652|0|2602|0|{in_metadata|out0_metadata|0|0|}945|933|}
{2010006001|XXGobject_psameas_object|1653|0|2603|0|{out_metadata|out0_metadata|0|0|}945|933|}
{2010601001|XXGgraph_vertex_vertex|1654|0|2604|0|{Write_Multifile_Xref_ICFF_LookUp|}918|951|}
{2010604001|XXGgraph_flow_flow|1655|0|2606|0|{Flow_2|}951|952|}
{2010604001|XXGgraph_flow_flow|1656|0|2608|0|{Flow_6|}951|953|}
{2010604001|XXGgraph_flow_flow|1657|0|2610|0|{Flow_7|}951|954|}
{2010601001|XXGgraph_vertex_vertex|1658|0|2612|0|{View_Data|}951|955|}
{2010211001|XXGvertex_iport_iport|1659|0|2614|0|{0|write|}955|956|}
{2010214001|XXGiport_src_flow|1660|0|2616|0|{0|}956|952|}
{2010007001|XXGobject_proto_object|1661|0|2617|0|{}955|957|}
{2010211001|XXGvertex_iport_iport|1662|0|2619|0|{0|write|}957|958|}
{2010006001|XXGobject_psameas_object|1663|0|2621|0|{metadata|write_metadata|1|0|}958|957|}
{2010601001|XXGgraph_vertex_vertex|1664|0|2622|0|{Write_Block_Compressed_Lookup|}951|959|}
{2010212001|XXGvertex_oport_oport|1665|0|2624|0|{0|out|}959|960|}
{2010213001|XXGoport_dst_flow|1666|0|2626|0|{0|}960|953|}
{2010212001|XXGvertex_oport_oport|1667|0|2627|0|{1|index|}959|961|}
{2010213001|XXGoport_dst_flow|1668|0|2629|0|{0|}961|954|}
{2010212001|XXGvertex_oport_oport|1669|0|2630|0|{2|address|}959|962|}
{2010211001|XXGvertex_iport_iport|1670|0|2632|0|{0|in|}959|963|}
{2010007001|XXGobject_proto_object|1671|0|2634|0|{}959|964|}
{2010212001|XXGvertex_oport_oport|1672|0|2636|0|{0|out|}964|965|}
{2010006001|XXGobject_psameas_object|1673|0|2638|0|{metadata|out_metadata|1|0|}965|964|}
{2010212001|XXGvertex_oport_oport|1674|0|2639|0|{1|index|}964|966|}
{2010006001|XXGobject_psameas_object|1675|0|2641|0|{metadata|index_metadata|1|0|}966|964|}
{2010212001|XXGvertex_oport_oport|1676|0|2642|0|{2|address|}964|967|}
{2010006001|XXGobject_psameas_object|1677|0|2644|0|{metadata|address_metadata|1|0|}967|964|}
{2010211001|XXGvertex_iport_iport|1678|0|2645|0|{0|in|}964|968|}
{2010006001|XXGobject_psameas_object|1679|0|2647|0|{metadata|in_metadata|1|0|}968|964|}
{2010006001|XXGobject_psameas_object|1680|0|2648|0|{Layout|Layout|0|0|}959|969|}
{2010212001|XXGvertex_oport_oport|1681|0|2650|0|{0|read|}969|970|}
{2010213001|XXGoport_dst_flow|1682|0|2652|0|{0|}970|952|}
{2010211001|XXGvertex_iport_iport|1683|0|2653|0|{0|write|}969|971|}
{2010214001|XXGiport_src_flow|1684|0|2655|0|{0|}971|953|}
{2010007001|XXGobject_proto_object|1685|0|2656|0|{}969|972|}
{2010212001|XXGvertex_oport_oport|1686|0|2658|0|{0|read|}972|973|}
{2010006001|XXGobject_psameas_object|1687|0|2660|0|{metadata|read_metadata|1|0|}973|972|}
{2010211001|XXGvertex_iport_iport|1688|0|2661|0|{0|write|}972|974|}
{2010006001|XXGobject_psameas_object|1689|0|2663|0|{metadata|write_metadata|1|0|}974|972|}
{2010006001|XXGobject_psameas_object|1690|0|2664|0|{in_metadata|out0_metadata|0|0|}959|933|}
{2010006001|XXGobject_psameas_object|1691|0|2665|0|{out_metadata|write_metadata|0|0|}959|969|}
{2010601001|XXGgraph_vertex_vertex|1692|0|2666|0|{Xref_ICFF_Data_File|}951|969|}
{2010601001|XXGgraph_vertex_vertex|1693|0|2667|0|{Xref_ICFF_Index_File|}951|975|}
{2010211001|XXGvertex_iport_iport|1694|0|2669|0|{0|write|}975|976|}
{2010214001|XXGiport_src_flow|1695|0|2671|0|{0|}976|954|}
{2010007001|XXGobject_proto_object|1696|0|2672|0|{}975|977|}
{2010211001|XXGvertex_iport_iport|1697|0|2674|0|{0|write|}977|978|}
{2010006001|XXGobject_psameas_object|1698|0|2676|0|{metadata|write_metadata|1|0|}978|977|}
{2010006001|XXGobject_psameas_object|1699|0|2677|0|{write_metadata|index_metadata|0|0|}975|959|}
{2010211001|XXGvertex_iport_iport|1700|0|2678|0|{0|in0|}951|979|}
{2010215002|XXGiport_binding_iport|1701|0|2680|0|{.5|.5|{0|}10590|}979|963|}
{2010214001|XXGiport_src_flow|1702|0|2681|0|{0|}979|925|}
{2010601001|XXGgraph_vertex_vertex|1703|0|2682|0|{Write_Non_ICFF_Xref_LookUp|}918|980|}
{2010605001|XXGgraph_legend_legend|1704|0|2684|0|{0|}980|981|}
{2010241001|XXGlegend_face_face|1705|0|2686|0|{}981|982|}
{2010604001|XXGgraph_flow_flow|1706|0|2688|0|{Flow_1|}980|983|}
{2010604001|XXGgraph_flow_flow|1707|0|2690|0|{Flow_2|}980|984|}
{2010604001|XXGgraph_flow_flow|1708|0|2692|0|{Flow_3|}980|985|}
{2010601001|XXGgraph_vertex_vertex|1709|0|2694|0|{Reformat|}980|986|}
{2010212001|XXGvertex_oport_oport|1710|0|2696|0|{0|out0|}986|987|}
{2010213001|XXGoport_dst_flow|1711|0|2698|0|{0|}987|983|}
{2010212001|XXGvertex_oport_oport|1712|0|2699|0|{1|reject0|}986|988|}
{2010212001|XXGvertex_oport_oport|1713|0|2701|0|{2|error0|}986|989|}
{2010212001|XXGvertex_oport_oport|1714|0|2703|0|{3|log|}986|990|}
{2010211001|XXGvertex_iport_iport|1715|0|2705|0|{0|in|}986|991|}
{2010007001|XXGobject_proto_object|1716|0|2707|0|{}986|992|}
{2010212001|XXGvertex_oport_oport|1717|0|2709|0|{0|out0|}992|993|}
{2010006001|XXGobject_psameas_object|1718|0|2711|0|{metadata|out0_metadata|1|0|}993|992|}
{2010006001|XXGobject_psameas_object|1719|0|2712|0|{transform0|transform0|1|0|}993|992|}
{2010212001|XXGvertex_oport_oport|1720|0|2713|0|{1|reject0|}992|994|}
{2010006001|XXGobject_psameas_object|1721|0|2715|0|{metadata|reject0_metadata|1|0|}994|992|}
{2010212001|XXGvertex_oport_oport|1722|0|2716|0|{2|error0|}992|995|}
{2010006001|XXGobject_psameas_object|1723|0|2718|0|{metadata|error0_metadata|1|0|}995|992|}
{2010212001|XXGvertex_oport_oport|1724|0|2719|0|{3|log|}992|996|}
{2010006001|XXGobject_psameas_object|1725|0|2721|0|{metadata|log_metadata|1|0|}996|992|}
{2010211001|XXGvertex_iport_iport|1726|0|2722|0|{0|in|}992|997|}
{2010006001|XXGobject_psameas_object|1727|0|2724|0|{metadata|in_metadata|1|0|}997|992|}
{2010006001|XXGobject_psameas_object|1728|0|2725|0|{Layout|Layout|0|0|}986|61|}
{2010006001|XXGobject_psameas_object|1729|0|2726|0|{in_metadata|out0_metadata|0|0|}986|933|}
{2010006001|XXGobject_psameas_object|1730|0|2727|0|{out0_metadata|out_metadata|0|0|}986|998|}
{2010212001|XXGvertex_oport_oport|1731|0|2729|0|{0|out|}998|999|}
{2010213001|XXGoport_dst_flow|1732|0|2731|0|{0|}999|1000|}
{2010212001|XXGvertex_oport_oport|1733|0|2733|0|{1|index0|}998|1001|}
{2010213001|XXGoport_dst_flow|1734|0|2735|0|{0|}1001|1002|}
{2010211001|XXGvertex_iport_iport|1735|0|2737|0|{0|in|}998|1003|}
{2010214001|XXGiport_src_flow|1736|0|2739|0|{0|}1003|1004|}
{2010007001|XXGobject_proto_object|1737|0|2741|0|{}998|1005|}
{2010212001|XXGvertex_oport_oport|1738|0|2743|0|{0|out|}1005|1006|}
{2010006001|XXGobject_psameas_object|1739|0|2745|0|{metadata|out_metadata|1|0|}1006|1005|}
{2010212001|XXGvertex_oport_oport|1740|0|2746|0|{1|index0|}1005|1007|}
{2010006001|XXGobject_psameas_object|1741|0|2748|0|{key0|key0|1|0|}1007|1005|}
{2010006001|XXGobject_psameas_object|1742|0|2749|0|{metadata|index0_metadata|1|0|}1007|1005|}
{2010211001|XXGvertex_iport_iport|1743|0|2750|0|{0|in|}1005|1008|}
{2010006001|XXGobject_psameas_object|1744|0|2752|0|{metadata|in_metadata|1|0|}1008|1005|}
{2010006001|XXGobject_psameas_object|1745|0|2753|0|{Layout|Layout|0|0|}998|1009|}
{2010211001|XXGvertex_iport_iport|1746|0|2755|0|{0|write|}1009|1010|}
{2010214001|XXGiport_src_flow|1747|0|2757|0|{0|}1010|1002|}
{2010007001|XXGobject_proto_object|1748|0|2758|0|{}1009|1011|}
{2010211001|XXGvertex_iport_iport|1749|0|2760|0|{0|write|}1011|1012|}
{2010006001|XXGobject_psameas_object|1750|0|2762|0|{metadata|write_metadata|1|0|}1012|1011|}
{2010006001|XXGobject_psameas_object|1751|0|2763|0|{write_metadata|index0_metadata|0|0|}1009|998|}
{2010006001|XXGobject_psameas_object|1752|0|2764|0|{in_metadata|out_metadata|0|0|}998|998|}
{2010006001|XXGobject_psameas_object|1753|0|2765|0|{reject0_metadata|out0_metadata|0|0|}986|933|}
{2010601001|XXGgraph_vertex_vertex|1754|0|2766|0|{Replicate|}980|1013|}
{2010212001|XXGvertex_oport_oport|1755|0|2768|0|{0|out|}1013|1014|}
{2010213001|XXGoport_dst_flow|1756|0|2770|0|{0|}1014|984|}
{2010213001|XXGoport_dst_flow|1757|0|2771|0|{1|}1014|985|}
{2010211001|XXGvertex_iport_iport|1758|0|2772|0|{0|in|}1013|1015|}
{2010214001|XXGiport_src_flow|1759|0|2774|0|{0|}1015|983|}
{2010007001|XXGobject_proto_object|1760|0|2775|0|{}1013|1016|}
{2010212001|XXGvertex_oport_oport|1761|0|2777|0|{0|out|}1016|1017|}
{2010006001|XXGobject_psameas_object|1762|0|2779|0|{metadata|out_metadata|1|0|}1017|1016|}
{2010211001|XXGvertex_iport_iport|1763|0|2780|0|{0|in|}1016|1018|}
{2010006001|XXGobject_psameas_object|1764|0|2782|0|{metadata|in_metadata|1|0|}1018|1016|}
{2010006001|XXGobject_psameas_object|1765|0|2783|0|{Layout|Layout|0|0|}1013|61|}
{2010006001|XXGobject_psameas_object|1766|0|2784|0|{in_metadata|out_metadata|0|0|}1013|998|}
{2010006001|XXGobject_psameas_object|1767|0|2785|0|{out_metadata|out_metadata|0|0|}1013|998|}
{2010601001|XXGgraph_vertex_vertex|1768|0|2786|0|{for_MPP_Server_Architecture|}980|1019|}
{2010605001|XXGgraph_legend_legend|1769|0|2788|0|{0|}1019|1020|}
{2010241001|XXGlegend_face_face|1770|0|2790|0|{}1020|1021|}
{2010604001|XXGgraph_flow_flow|1771|0|2792|0|{Flow_1|}1019|1022|}
{2010604001|XXGgraph_flow_flow|1772|0|2794|0|{Flow_2|}1019|1023|}
{2010604001|XXGgraph_flow_flow|1773|0|2796|0|{Flow_3|}1019|1024|}
{2010604001|XXGgraph_flow_flow|1774|0|2798|0|{Flow_4|}1019|1025|}
{2010604001|XXGgraph_flow_flow|1775|0|2800|0|{Flow_5|}1019|1026|}
{2010604001|XXGgraph_flow_flow|1776|0|2802|0|{Flow_6|}1019|1027|}
{2010604001|XXGgraph_flow_flow|1777|0|2804|0|{Flow_7|}1019|1028|}
{2010604001|XXGgraph_flow_flow|1778|0|2806|0|{Flow_8|}1019|1029|}
{2010601001|XXGgraph_vertex_vertex|1779|0|2808|0|{Broadcast|}1019|1030|}
{2010212001|XXGvertex_oport_oport|1780|0|2810|0|{0|out|}1030|1031|}
{2010213001|XXGoport_dst_flow|1781|0|2812|0|{0|}1031|1028|}
{2010211001|XXGvertex_iport_iport|1782|0|2813|0|{0|in|}1030|1032|}
{2010214001|XXGiport_src_flow|1783|0|2815|0|{0|}1032|1023|}
{2010007001|XXGobject_proto_object|1784|0|2816|0|{}1030|1033|}
{2010212001|XXGvertex_oport_oport|1785|0|2818|0|{0|out|}1033|1034|}
{2010006001|XXGobject_psameas_object|1786|0|2820|0|{metadata|out_metadata|1|0|}1034|1033|}
{2010211001|XXGvertex_iport_iport|1787|0|2821|0|{0|in|}1033|1035|}
{2010006001|XXGobject_psameas_object|1788|0|2823|0|{metadata|in_metadata|1|0|}1035|1033|}
{2010006001|XXGobject_psameas_object|1789|0|2824|0|{Layout|Layout|0|0|}1030|61|}
{2010006001|XXGobject_psameas_object|1790|0|2825|0|{in_metadata|out_metadata|0|0|}1030|1036|}
{2010212001|XXGvertex_oport_oport|1791|0|2827|0|{0|out|}1036|1037|}
{2010213001|XXGoport_dst_flow|1792|0|2829|0|{0|}1037|1025|}
{2010212001|XXGvertex_oport_oport|1793|0|2830|0|{1|index0|}1036|1038|}
{2010213001|XXGoport_dst_flow|1794|0|2832|0|{0|}1038|1026|}
{2010211001|XXGvertex_iport_iport|1795|0|2833|0|{0|in|}1036|1039|}
{2010214001|XXGiport_src_flow|1796|0|2835|0|{0|}1039|1028|}
{2010007001|XXGobject_proto_object|1797|0|2836|0|{}1036|1040|}
{2010212001|XXGvertex_oport_oport|1798|0|2838|0|{0|out|}1040|1041|}
{2010006001|XXGobject_psameas_object|1799|0|2840|0|{metadata|out_metadata|1|0|}1041|1040|}
{2010212001|XXGvertex_oport_oport|1800|0|2841|0|{1|index0|}1040|1042|}
{2010006001|XXGobject_psameas_object|1801|0|2843|0|{key0|key0|1|0|}1042|1040|}
{2010006001|XXGobject_psameas_object|1802|0|2844|0|{metadata|index0_metadata|1|0|}1042|1040|}
{2010211001|XXGvertex_iport_iport|1803|0|2845|0|{0|in|}1040|1043|}
{2010006001|XXGobject_psameas_object|1804|0|2847|0|{metadata|in_metadata|1|0|}1043|1040|}
{2010006001|XXGobject_psameas_object|1805|0|2848|0|{Layout|Layout|0|0|}1036|1044|}
{2010211001|XXGvertex_iport_iport|1806|0|2850|0|{0|write|}1044|1045|}
{2010214001|XXGiport_src_flow|1807|0|2852|0|{0|}1045|1026|}
{2010007001|XXGobject_proto_object|1808|0|2853|0|{}1044|1046|}
{2010211001|XXGvertex_iport_iport|1809|0|2855|0|{0|write|}1046|1047|}
{2010006001|XXGobject_psameas_object|1810|0|2857|0|{metadata|write_metadata|1|0|}1047|1046|}
{2010006001|XXGobject_psameas_object|1811|0|2858|0|{write_metadata|index0_metadata|0|0|}1044|1036|}
{2010006001|XXGobject_psameas_object|1812|0|2859|0|{in_metadata|out_metadata|0|0|}1036|1036|}
{2010006001|XXGobject_psameas_object|1813|0|2860|0|{out_metadata|out_metadata|0|0|}1030|1036|}
{2010601001|XXGgraph_vertex_vertex|1814|0|2861|0|{Concatenate|}1019|1048|}
{2010212001|XXGvertex_oport_oport|1815|0|2863|0|{0|out|}1048|1049|}
{2010213001|XXGoport_dst_flow|1816|0|2865|0|{0|}1049|1027|}
{2010211001|XXGvertex_iport_iport|1817|0|2866|0|{0|in|}1048|1050|}
{2010214001|XXGiport_src_flow|1818|0|2868|0|{0|}1050|1022|}
{2010214001|XXGiport_src_flow|1819|0|2869|0|{1|}1050|1029|}
{2010007001|XXGobject_proto_object|1820|0|2870|0|{}1048|1051|}
{2010212001|XXGvertex_oport_oport|1821|0|2872|0|{0|out|}1051|1052|}
{2010006001|XXGobject_psameas_object|1822|0|2874|0|{metadata|out_metadata|1|0|}1052|1051|}
{2010211001|XXGvertex_iport_iport|1823|0|2875|0|{0|in|}1051|1053|}
{2010006001|XXGobject_psameas_object|1824|0|2877|0|{metadata|in_metadata|1|0|}1053|1051|}
{2010006001|XXGobject_psameas_object|1825|0|2878|0|{Layout|Layout|0|0|}1048|61|}
{2010006001|XXGobject_psameas_object|1826|0|2879|0|{in_metadata|out_metadata|0|0|}1048|1036|}
{2010006001|XXGobject_psameas_object|1827|0|2880|0|{out_metadata|out_metadata|0|0|}1048|1036|}
{2010601001|XXGgraph_vertex_vertex|1828|0|2881|0|{Partition_by_Round_robin|}1019|1054|}
{2010212001|XXGvertex_oport_oport|1829|0|2883|0|{0|out|}1054|1055|}
{2010213001|XXGoport_dst_flow|1830|0|2885|0|{0|}1055|1029|}
{2010211001|XXGvertex_iport_iport|1831|0|2886|0|{0|in|}1054|1056|}
{2010214001|XXGiport_src_flow|1832|0|2888|0|{0|}1056|1024|}
{2010007001|XXGobject_proto_object|1833|0|2889|0|{}1054|1057|}
{2010212001|XXGvertex_oport_oport|1834|0|2891|0|{0|out|}1057|1058|}
{2010006001|XXGobject_psameas_object|1835|0|2893|0|{metadata|out_metadata|1|0|}1058|1057|}
{2010211001|XXGvertex_iport_iport|1836|0|2894|0|{0|in|}1057|1059|}
{2010006001|XXGobject_psameas_object|1837|0|2896|0|{metadata|in_metadata|1|0|}1059|1057|}
{2010006001|XXGobject_psameas_object|1838|0|2897|0|{Layout|Layout|0|0|}1054|1060|}
{2010212001|XXGvertex_oport_oport|1839|0|2899|0|{0|read|}1060|1061|}
{2010213001|XXGoport_dst_flow|1840|0|2901|0|{0|}1061|1024|}
{2010007001|XXGobject_proto_object|1841|0|2902|0|{}1060|1062|}
{2010212001|XXGvertex_oport_oport|1842|0|2904|0|{0|read|}1062|1063|}
{2010006001|XXGobject_psameas_object|1843|0|2906|0|{metadata|read_metadata|1|0|}1063|1062|}
{2010006001|XXGobject_psameas_object|1844|0|2907|0|{read_metadata|out_metadata|0|0|}1060|1036|}
{2010006001|XXGobject_psameas_object|1845|0|2908|0|{in_metadata|out_metadata|0|0|}1054|1036|}
{2010006001|XXGobject_psameas_object|1846|0|2909|0|{out_metadata|out_metadata|0|0|}1054|1036|}
{2010601001|XXGgraph_vertex_vertex|1847|0|2910|0|{Prev_Xref_Data_file|}1019|1060|}
{2010601001|XXGgraph_vertex_vertex|1848|0|2911|0|{Replicate|}1019|1064|}
{2010212001|XXGvertex_oport_oport|1849|0|2913|0|{0|out|}1064|1065|}
{2010213001|XXGoport_dst_flow|1850|0|2915|0|{0|}1065|1022|}
{2010211001|XXGvertex_iport_iport|1851|0|2916|0|{0|in|}1064|1066|}
{2010007001|XXGobject_proto_object|1852|0|2918|0|{}1064|1067|}
{2010212001|XXGvertex_oport_oport|1853|0|2920|0|{0|out|}1067|1068|}
{2010006001|XXGobject_psameas_object|1854|0|2922|0|{metadata|out_metadata|1|0|}1068|1067|}
{2010211001|XXGvertex_iport_iport|1855|0|2923|0|{0|in|}1067|1069|}
{2010006001|XXGobject_psameas_object|1856|0|2925|0|{metadata|in_metadata|1|0|}1069|1067|}
{2010006001|XXGobject_psameas_object|1857|0|2926|0|{Layout|Layout|0|0|}1064|61|}
{2010006001|XXGobject_psameas_object|1858|0|2927|0|{in_metadata|out_metadata|0|0|}1064|1036|}
{2010006001|XXGobject_psameas_object|1859|0|2928|0|{out_metadata|out_metadata|0|0|}1064|1036|}
{2010601001|XXGgraph_vertex_vertex|1860|0|2929|0|{Sort|}1019|1070|}
{2010212001|XXGvertex_oport_oport|1861|0|2931|0|{0|out|}1070|1071|}
{2010213001|XXGoport_dst_flow|1862|0|2933|0|{0|}1071|1023|}
{2010211001|XXGvertex_iport_iport|1863|0|2934|0|{0|in|}1070|1072|}
{2010214001|XXGiport_src_flow|1864|0|2936|0|{0|}1072|1027|}
{2010007001|XXGobject_proto_object|1865|0|2937|0|{}1070|1073|}
{2010212001|XXGvertex_oport_oport|1866|0|2939|0|{0|out|}1073|1074|}
{2010006001|XXGobject_psameas_object|1867|0|2941|0|{metadata|out_metadata|1|0|}1074|1073|}
{2010211001|XXGvertex_iport_iport|1868|0|2942|0|{0|in|}1073|1075|}
{2010006001|XXGobject_psameas_object|1869|0|2944|0|{metadata|in_metadata|1|0|}1075|1073|}
{2010006001|XXGobject_psameas_object|1870|0|2945|0|{Layout|Layout|0|0|}1070|986|}
{2010006001|XXGobject_psameas_object|1871|0|2946|0|{in_metadata|out_metadata|0|0|}1070|1036|}
{2010006001|XXGobject_psameas_object|1872|0|2947|0|{out_metadata|out_metadata|0|0|}1070|1036|}
{2010601001|XXGgraph_vertex_vertex|1873|0|2948|0|{Write_Lookup|}1019|1036|}
{2010601001|XXGgraph_vertex_vertex|1874|0|2949|0|{Xref_Data_file|}1019|1076|}
{2010211001|XXGvertex_iport_iport|1875|0|2951|0|{0|write|}1076|1077|}
{2010214001|XXGiport_src_flow|1876|0|2953|0|{0|}1077|1025|}
{2010007001|XXGobject_proto_object|1877|0|2954|0|{}1076|1078|}
{2010211001|XXGvertex_iport_iport|1878|0|2956|0|{0|write|}1078|1079|}
{2010006001|XXGobject_psameas_object|1879|0|2958|0|{metadata|write_metadata|1|0|}1079|1078|}
{2010006001|XXGobject_psameas_object|1880|0|2959|0|{write_metadata|out_metadata|0|0|}1076|1036|}
{2010601001|XXGgraph_vertex_vertex|1881|0|2960|0|{Xref_Index_file|}1019|1044|}
{2010211001|XXGvertex_iport_iport|1882|0|2961|0|{0|in0|}1019|1080|}
{2010215002|XXGiport_binding_iport|1883|0|2963|0|{.5|.5|{0|}10936|}1080|1066|}
{2010214001|XXGiport_src_flow|1884|0|2964|0|{0|}1080|984|}
{2010601001|XXGgraph_vertex_vertex|1885|0|2965|0|{for_SMP_Server_Architecture|}980|1081|}
{2010604001|XXGgraph_flow_flow|1886|0|2967|0|{Flow_1|}1081|1082|}
{2010604001|XXGgraph_flow_flow|1887|0|2969|0|{Flow_2|}1081|1083|}
{2010604001|XXGgraph_flow_flow|1888|0|2971|0|{Flow_3|}1081|1084|}
{2010604001|XXGgraph_flow_flow|1889|0|2973|0|{Flow_4|}1081|1000|}
{2010604001|XXGgraph_flow_flow|1890|0|2974|0|{Flow_5|}1081|1002|}
{2010604001|XXGgraph_flow_flow|1891|0|2975|0|{Flow_6|}1081|1004|}
{2010604001|XXGgraph_flow_flow|1892|0|2976|0|{Flow_7|}1081|1085|}
{2010601001|XXGgraph_vertex_vertex|1893|0|2978|0|{Gather|}1081|1086|}
{2010212001|XXGvertex_oport_oport|1894|0|2980|0|{0|out|}1086|1087|}
{2010213001|XXGoport_dst_flow|1895|0|2982|0|{0|}1087|1004|}
{2010211001|XXGvertex_iport_iport|1896|0|2983|0|{0|in|}1086|1088|}
{2010214001|XXGiport_src_flow|1897|0|2985|0|{0|}1088|1084|}
{2010007001|XXGobject_proto_object|1898|0|2986|0|{}1086|1089|}
{2010212001|XXGvertex_oport_oport|1899|0|2988|0|{0|out|}1089|1090|}
{2010006001|XXGobject_psameas_object|1900|0|2990|0|{metadata|out_metadata|1|0|}1090|1089|}
{2010211001|XXGvertex_iport_iport|1901|0|2991|0|{0|in|}1089|1091|}
{2010006001|XXGobject_psameas_object|1902|0|2993|0|{metadata|in_metadata|1|0|}1091|1089|}
{2010006001|XXGobject_psameas_object|1903|0|2994|0|{Layout|Layout|0|0|}1086|1009|}
{2010006001|XXGobject_psameas_object|1904|0|2995|0|{in_metadata|out_metadata|0|0|}1086|998|}
{2010006001|XXGobject_psameas_object|1905|0|2996|0|{out_metadata|out_metadata|0|0|}1086|998|}
{2010601001|XXGgraph_vertex_vertex|1906|0|2997|0|{Partition_by_Round_robin|}1081|1092|}
{2010212001|XXGvertex_oport_oport|1907|0|2999|0|{0|out|}1092|1093|}
{2010213001|XXGoport_dst_flow|1908|0|3001|0|{0|}1093|1085|}
{2010211001|XXGvertex_iport_iport|1909|0|3002|0|{0|in|}1092|1094|}
{2010214001|XXGiport_src_flow|1910|0|3004|0|{0|}1094|1082|}
{2010007001|XXGobject_proto_object|1911|0|3005|0|{}1092|1095|}
{2010212001|XXGvertex_oport_oport|1912|0|3007|0|{0|out|}1095|1096|}
{2010006001|XXGobject_psameas_object|1913|0|3009|0|{metadata|out_metadata|1|0|}1096|1095|}
{2010211001|XXGvertex_iport_iport|1914|0|3010|0|{0|in|}1095|1097|}
{2010006001|XXGobject_psameas_object|1915|0|3012|0|{metadata|in_metadata|1|0|}1097|1095|}
{2010006001|XXGobject_psameas_object|1916|0|3013|0|{Layout|Layout|0|0|}1092|1098|}
{2010212001|XXGvertex_oport_oport|1917|0|3015|0|{0|read|}1098|1099|}
{2010213001|XXGoport_dst_flow|1918|0|3017|0|{0|}1099|1082|}
{2010007001|XXGobject_proto_object|1919|0|3018|0|{}1098|1100|}
{2010212001|XXGvertex_oport_oport|1920|0|3020|0|{0|read|}1100|1101|}
{2010006001|XXGobject_psameas_object|1921|0|3022|0|{metadata|read_metadata|1|0|}1101|1100|}
{2010006001|XXGobject_psameas_object|1922|0|3023|0|{read_metadata|out_metadata|0|0|}1098|998|}
{2010006001|XXGobject_psameas_object|1923|0|3024|0|{in_metadata|out_metadata|0|0|}1092|998|}
{2010006001|XXGobject_psameas_object|1924|0|3025|0|{out_metadata|out_metadata|0|0|}1092|998|}
{2010601001|XXGgraph_vertex_vertex|1925|0|3026|0|{Prev_Xref_Data_file|}1081|1098|}
{2010601001|XXGgraph_vertex_vertex|1926|0|3027|0|{Replicate|}1081|1102|}
{2010212001|XXGvertex_oport_oport|1927|0|3029|0|{0|out|}1102|1103|}
{2010213001|XXGoport_dst_flow|1928|0|3031|0|{0|}1103|1083|}
{2010211001|XXGvertex_iport_iport|1929|0|3032|0|{0|in|}1102|1104|}
{2010007001|XXGobject_proto_object|1930|0|3034|0|{}1102|1105|}
{2010212001|XXGvertex_oport_oport|1931|0|3036|0|{0|out|}1105|1106|}
{2010006001|XXGobject_psameas_object|1932|0|3038|0|{metadata|out_metadata|1|0|}1106|1105|}
{2010211001|XXGvertex_iport_iport|1933|0|3039|0|{0|in|}1105|1107|}
{2010006001|XXGobject_psameas_object|1934|0|3041|0|{metadata|in_metadata|1|0|}1107|1105|}
{2010006001|XXGobject_psameas_object|1935|0|3042|0|{Layout|Layout|0|0|}1102|61|}
{2010006001|XXGobject_psameas_object|1936|0|3043|0|{in_metadata|out_metadata|0|0|}1102|998|}
{2010006001|XXGobject_psameas_object|1937|0|3044|0|{out_metadata|out_metadata|0|0|}1102|998|}
{2010601001|XXGgraph_vertex_vertex|1938|0|3045|0|{Sort|}1081|1108|}
{2010212001|XXGvertex_oport_oport|1939|0|3047|0|{0|out|}1108|1109|}
{2010213001|XXGoport_dst_flow|1940|0|3049|0|{0|}1109|1084|}
{2010211001|XXGvertex_iport_iport|1941|0|3050|0|{0|in|}1108|1110|}
{2010214001|XXGiport_src_flow|1942|0|3052|0|{0|}1110|1083|}
{2010214001|XXGiport_src_flow|1943|0|3053|0|{1|}1110|1085|}
{2010007001|XXGobject_proto_object|1944|0|3054|0|{}1108|1111|}
{2010212001|XXGvertex_oport_oport|1945|0|3056|0|{0|out|}1111|1112|}
{2010006001|XXGobject_psameas_object|1946|0|3058|0|{metadata|out_metadata|1|0|}1112|1111|}
{2010211001|XXGvertex_iport_iport|1947|0|3059|0|{0|in|}1111|1113|}
{2010006001|XXGobject_psameas_object|1948|0|3061|0|{metadata|in_metadata|1|0|}1113|1111|}
{2010006001|XXGobject_psameas_object|1949|0|3062|0|{Layout|Layout|0|0|}1108|986|}
{2010006001|XXGobject_psameas_object|1950|0|3063|0|{in_metadata|out_metadata|0|0|}1108|998|}
{2010006001|XXGobject_psameas_object|1951|0|3064|0|{out_metadata|out_metadata|0|0|}1108|998|}
{2010601001|XXGgraph_vertex_vertex|1952|0|3065|0|{Write_Lookup|}1081|998|}
{2010601001|XXGgraph_vertex_vertex|1953|0|3066|0|{Xref_Data_file|}1081|1114|}
{2010211001|XXGvertex_iport_iport|1954|0|3068|0|{0|write|}1114|1115|}
{2010214001|XXGiport_src_flow|1955|0|3070|0|{0|}1115|1000|}
{2010007001|XXGobject_proto_object|1956|0|3071|0|{}1114|1116|}
{2010211001|XXGvertex_iport_iport|1957|0|3073|0|{0|write|}1116|1117|}
{2010006001|XXGobject_psameas_object|1958|0|3075|0|{metadata|write_metadata|1|0|}1117|1116|}
{2010006001|XXGobject_psameas_object|1959|0|3076|0|{write_metadata|out_metadata|0|0|}1114|998|}
{2010601001|XXGgraph_vertex_vertex|1960|0|3077|0|{Xref_Index_file|}1081|1009|}
{2010211001|XXGvertex_iport_iport|1961|0|3078|0|{0|in0|}1081|1118|}
{2010215002|XXGiport_binding_iport|1962|0|3080|0|{.5|.5|{0|}11017|}1118|1104|}
{2010214001|XXGiport_src_flow|1963|0|3081|0|{0|}1118|985|}
{2010211001|XXGvertex_iport_iport|1964|0|3082|0|{0|in0|}980|1119|}
{2010215002|XXGiport_binding_iport|1965|0|3084|0|{.5|.5|{0|}10937|}1119|991|}
{2010214001|XXGiport_src_flow|1966|0|3085|0|{0|}1119|926|}
{2010211001|XXGvertex_iport_iport|1967|0|3086|0|{0|in0|}918|1120|}
{2010215002|XXGiport_binding_iport|1968|0|3088|0|{.5|.5|{0|}10815|}1120|938|}
{2010211001|XXGvertex_iport_iport|1969|0|3089|0|{0|in2|}642|1121|}
{2010215002|XXGiport_binding_iport|1970|0|3091|0|{.5|.5|{0|}14238|}1121|659|}
{2010214001|XXGiport_src_flow|1971|0|3092|0|{0|}1121|20|}
{2010211001|XXGvertex_iport_iport|1972|0|3093|0|{1|in0|}642|1122|}
{2010215002|XXGiport_binding_iport|1973|0|3095|0|{.5|.5|{0|}14239|}1122|672|}
{2010214001|XXGiport_src_flow|1974|0|3096|0|{0|}1122|22|}
{2010211001|XXGvertex_iport_iport|1975|0|3097|0|{2|in1|}642|1123|}
{2010215002|XXGiport_binding_iport|1976|0|3099|0|{.5|.5|{0|}14240|}1123|1120|}
{2010214001|XXGiport_src_flow|1977|0|3100|0|{0|}1123|15|}
{2010601001|XXGgraph_vertex_vertex|1978|0|3101|0|{Write_Event_Log|}1|1124|}
{2010604001|XXGgraph_flow_flow|1979|0|3103|0|{Flow_1|}1124|1125|}
{2010601001|XXGgraph_vertex_vertex|1980|0|3105|0|{Event_Log_Entry|}1124|1126|}
{2010212001|XXGvertex_oport_oport|1981|0|3107|0|{0|out|}1126|1127|}
{2010213001|XXGoport_dst_flow|1982|0|3109|0|{0|}1127|1125|}
{2010212001|XXGvertex_oport_oport|1983|0|3110|0|{1|error|}1126|1128|}
{2010212001|XXGvertex_oport_oport|1984|0|3112|0|{2|log|}1126|1129|}
{2010006001|XXGobject_psameas_object|1985|0|3114|0|{Layout|Layout|0|0|}1126|1130|}
{2010211001|XXGvertex_iport_iport|1986|0|3116|0|{0|write|}1130|1131|}
{2010214001|XXGiport_src_flow|1987|0|3118|0|{0|}1131|1125|}
{2010006001|XXGobject_psameas_object|1988|0|3119|0|{out_metadata|write_metadata|0|0|}1126|1130|}
{2010601001|XXGgraph_vertex_vertex|1989|0|3120|0|{Output_Event_File|}1124|1130|}
{2010007001|XXGobject_proto_object|1990|0|3121|0|{}1124|1132|}
{2010604001|XXGgraph_flow_flow|1991|0|3123|0|{Flow_1|}1132|1133|}
{2010601001|XXGgraph_vertex_vertex|1992|0|3125|0|{Event_Log_Entry|}1132|1134|}
{2010212001|XXGvertex_oport_oport|1993|0|3127|0|{0|out|}1134|1135|}
{2010213001|XXGoport_dst_flow|1994|0|3129|0|{0|}1135|1133|}
{2010212001|XXGvertex_oport_oport|1995|0|3130|0|{1|error|}1134|1136|}
{2010212001|XXGvertex_oport_oport|1996|0|3132|0|{2|log|}1134|1137|}
{2010007001|XXGobject_proto_object|1997|0|3134|0|{}1134|1138|}
{2010212001|XXGvertex_oport_oport|1998|0|3136|0|{0|out|}1138|1139|}
{2010006001|XXGobject_psameas_object|1999|0|3138|0|{metadata|out_metadata|1|0|}1139|1138|}
{2010212001|XXGvertex_oport_oport|2000|0|3139|0|{1|error|}1138|1140|}
{2010006001|XXGobject_psameas_object|2001|0|3141|0|{metadata|error_metadata|1|0|}1140|1138|}
{2010212001|XXGvertex_oport_oport|2002|0|3142|0|{2|log|}1138|1141|}
{2010006001|XXGobject_psameas_object|2003|0|3144|0|{metadata|log_metadata|1|0|}1141|1138|}
{2010601001|XXGgraph_vertex_vertex|2004|0|3145|0|{Output_Event_File|}1132|1142|}
{2010211001|XXGvertex_iport_iport|2005|0|3147|0|{0|write|}1142|1143|}
{2010214001|XXGiport_src_flow|2006|0|3149|0|{0|}1143|1133|}
{2010007001|XXGobject_proto_object|2007|0|3150|0|{}1142|1144|}
{2010211001|XXGvertex_iport_iport|2008|0|3152|0|{0|write|}1144|1145|}
{2010006001|XXGobject_psameas_object|2009|0|3154|0|{metadata|write_metadata|1|0|}1145|1144|}
{2010109001|XXGobject_property_value|2010|0|3155|0|{0|TrackingThumbprint|72|}1|1146|}
