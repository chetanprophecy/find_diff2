@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|4|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|633|rel_count|1090|}
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
{30001002|XXparameter|DATASET_TYPE|$[if(get_ids_table_type(IDS_META_STRING) =="fact" ) "FACT" else "DIM"
]|3|9|FK|This will retrieve table properties from IDS properties meta file|{2|FACT|DIM|}}
{30001002|XXparameter|EVENT_CHANNEL_ID|1|3|9|FK|@{0|}}
{30001002|XXparameter|FACT_DATA_PARTITION_KEY||3|9|FK|This must be a date column with YYYYMMDD|{0|}}
{30001002|XXparameter|IS_WRITE_REDUCED_DATASET|False|13|9|FK|@{0|}}
{30001002|XXparameter|IS_SUPPRESS_UPDATE_FOR_HIST|N|15|9|FK|This parameter if true, will supress any updates |{2|N|Y|}}
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
{30001002|XXparameter|CDC_FLAG_RECORD_TYPE|record
  unsigned integer(1) flag=0;
  decimal("\\x01") src_env_rank=0;
end|3|9|K|These columns are added into target dml for some intermediate data processing needs|{0|}}
{30001002|XXparameter|TARGET_DML|$[read_type(PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml") ]|3|9|RK|The DML for the target dataset.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|INTER_DML|$[join_types(TARGET_DML,CDC_FLAG_RECORD_TYPE)]|3|9|K|@{0|}}
{30001002|XXparameter|ICFF_KEY|dxf_hk_part1|3|9|K|A common fixed ( Hardcoded)  ICFF key used across ORCA . |{0|}}
{30001002|XXparameter|IDS_AUDIT_TYPE|include "~$PUB_DXF_DML/generic_data_types.dml";
metadata type = ids_audit_type;|3|9|K|@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML|AB_PARAMETER_ENV|3|10|FKd|DML that will be used to create single ICFF subset fact file that may diffrent ICFF Lookup key than main FACT|{0|}}
{30001002|XXparameter|REDUCED_DATASET_ICFF_KEY||3|9|FK|Please provide valid key expression like \{abc;def \}|{0|}}
{30001002|XXparameter|F_ERROR_FOR_MISSING_REDUCED_ICFF_KEY|$[if(IS_WRITE_REDUCED_DATASET && is_blank(REDUCED_DATASET_ICFF_KEY)) force_error("IS_WRITE_REDUCED_DATASET Flag is set as True ,But key value for reduced dataset is not set in parameter:
REDUCED_DATASET_ICFF_KEY","MISSING REDUCED ICFF KEY") else "";]|3|9|FK|@{0|}}
{30001002|XXparameter|________File_Parameters____________|@3|9|K|@{0|}}
{30001002|XXparameter|INPUT_FILE_DRIVING_MASK|$[if(starts_with(AB_PSET_NAME,"placeholder_")) "placeholder" else "split"]|3|9|EFK|This parameter will decide that ,this is a placeholder file or split file|{0|}}
{30001002|XXparameter|INPUT_FILE|AB_PARAMETER_ENV|3|10|Kd|SPLIT or placeholder input file |{0|}}
{30001002|XXparameter|INPUT_FILE_EME|$[ if(INPUT_FILE_DRIVING_MASK =="split") string_concat( AI_MFS,"/split/" ,INPUT_FILE_DRIVING_MASK , ".\{ILM\}." , SUBJECT_AREA ,".", TARGET_ENTITY ,  ".\{RUN_ID\}.dat.gz" ) 
else string_concat( AI_MFS,"/placeholder/" ,INPUT_FILE_DRIVING_MASK  , ".\{ILM\}.\{SOURCE\}.\{SOURCE\}." , TARGET_ENTITY , ".\{RUN_ID\}.dat.gz" ) ]|3|9|K|Parameter created for EME dataset|{0|}}
{30001002|XXparameter|INPUT_FILE_STRING|$[string_join(INPUT_FILE,"\|")]|3|9|EK|@{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[ if ( DATASET_TYPE == "FACT") string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/many") 
   else string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/one") ]|3|9|K|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|XREF_KEY_ICFF_FILE|$[ string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat.gz")]|3|9|K|key file location used in fact key lookup process|{0|}}
{30001002|XXparameter|XREF_KEY_INDEX_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".idx")]|3|9|K|Index file for fact key lookup process|{0|}}
{30001002|XXparameter|ICFF_FILE|$[if ( DATASET_TYPE == "FACT") XREF_KEY_ICFF_FILE 
else  string_concat(IDS_DATA_PATH , "/" , TARGET_ENTITY , ".dat.gz" ) ]|3|9|K|Main ICFF file - Xref  data file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|ICFF_INDEX_FILE|$[ if( DATASET_TYPE == "FACT") XREF_KEY_INDEX_FILE else string_concat(IDS_DATA_PATH,"/" ,TARGET_ENTITY,".idx") ]|3|9|K|MAIN ICFF index file - Xref index file is used in case dataset type is FACT|{0|}}
{30001002|XXparameter|REDUCED_ICFF_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/one","/" , TARGET_ENTITY , ".reduced.dat.gz") ]|3|9|K|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|REDUCED_INDEX_FILE|$[string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SUBJECT_AREA,"/one","/" , TARGET_ENTITY , ".reduced.idx") ]|3|9|K|IF optional reduced single FACT ICFF  file needs to be created|{0|}}
{30001002|XXparameter|INSERT_FILE|AB_PARAMETER_ENV|3|10|Kd|Insert file for distribution event|{0|}}
{30001002|XXparameter|UPDATE_FILE|AB_PARAMETER_ENV|3|10|Kd|Update file for distribution event|{0|}}
{30001002|XXparameter|XREF_FILE_EXIST|AB_PARAMETER_ENV|1|10|Kd|Parameter to check existence of xref file|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INPUT_LOOKUP_FILE|AB_PARAMETER_ENV|3|10|Kd|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_LOOKUP_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".dat")]|3|9|K|Location where lookup for MAP will be produced|{0|}}
{30001002|XXparameter|XREF_NON_ICFF_INDEX_FILE|$[string_concat(PUB_DATAHUB_DXF_LOOKUP,"/ids/",SUBJECT_AREA,"/xref/xref.",TARGET_ENTITY,".idx")]|3|9|K|Location where xref lokkup file IDX for Map keying process will be created|{0|}}
{30001002|XXparameter|MAX_SK_LOOKUP_FILE|$[string_concat(PUB_DATAHUB_SERIAL_LOOKUP,"/ids/",SUBJECT_AREA,"/max_sk/max_sk.",TARGET_ENTITY,".dat")]|3|9|K|This will be dim max sk lookup file |{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$[ string_concat(PUB_DATAHUB_SERIAL ,"/event_log/event_log.",SUBJECT_AREA,".", TARGET_ENTITY , ".dat") ]|3|9|K|Event log file |{0|}}
{30001002|XXparameter|______Dependent_Parameters_____________________________|@3|9|K|@{0|}}
{30001002|XXparameter|READ_SPLIT_PORT_OUT_DML|$[if(INPUT_FILE_DRIVING_MASK=="split") SPLIT_DML else PLACEHOLDER_READ_DML ]|3|9|K|In case of Split file a SPLIT DML will be used , In placeholder a dml with \\n target fields value will be used|{0|}}
{30001002|XXparameter|IDS_MAP_XFR_HINT|AB_PARAMETER_ENV|3|10|Kd|This parameter will get xfr hint by reading split file and deriving output type|{0|}}
{30001002|XXparameter|MAX_SK_VALUE|AB_PARAMETER_ENV|3|10|Kd|This is Max SK value for a given dimension|{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_KEY|\{dxf_hk_part1; dxf_hk_part2;dxf_sk;grp_hrchy_sk;hash_key;hash_key_half\}|3|9|FK|Optional: \{field1; field2;...\}: A key that includes fields that cannot be changed on an update.|{0|}}
{30001002|XXparameter|FIELDS_TO_IGNORE_VEC|$[ for ( let k in key_info(FIELDS_TO_IGNORE_KEY) ) :
    k.field_name
]|3|9|RK|A vector of field names that are ignored in comparisions and updates.|{0|}}
{30001002|XXparameter|TARGET_INFO_VEC|$[ for ( let info in record_info(TARGET_DML) ) :
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
 for (i, i < vec_length)
        begin block create_expr
            hash_expr = string_concat( hash_expr ,";", COMPARE_FIELDS_VEC[i] )  ;
        end block create_expr
result :: string_concat(string_replace_first( hash_expr ,";","\{" ),"\}");
end;
]|3|9|K|@{0|}}
{30001002|XXparameter|DIFF_DML|$[ add_fields(
    "record\\nend",
    (dml_field_info_vec)for ( let info in TARGET_INFO_VEC ) :
      if ( info.name member COMPARE_FIELDS_VEC )
        info)
]|3|9|RK|The DML of the fields to compare.|{0|}}
{30001002|XXparameter|DIM_CDC_XFR|$['include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
include "' + PUB_DXF_XFR + '/common_functions.xfr";
let string("") v_input_file_type="' + INPUT_FILE_DRIVING_MASK +'";
let string("") hist_load_suppress_flag="' + IS_SUPPRESS_UPDATE_FOR_HIST + '" ;
//Flag =0 -- Same record
//Flag =1 -- New records - for insert
//Flag =2 -- Change  record - for update
// Make surrogate key as well part of CDC compare , excluding book keeping columns  ( Natural keys , Non Natural keys ( exclude book keeping fileds) 

type lookup_record_type = ' + TARGET_DML + ';' +

' let hash_key_type v_hash_key_full= [vector 0 ,0 ];
let int v_flag=0;
let decimal("") v_dxf_src_env_rank_lookup_record=0;

let  unsigned integer(8) v_hash_key_half=0;
let lookup_identifier_type current_lookup = lookup_not_loaded();
let lookup_record_type lookup_record_value = allocate_with_nulls();
let lookup_record_type exact_record_value=allocate_with_defaults();
let lookup_record_type exact_next_record_value=allocate_with_nulls();
let  hash_key_type v_record_hash_from_in=allocate_with_defaults();
let hash_key_type  v_record_hash_from_lkp=allocate_with_defaults(); 

//These parameters are only added to get count of values.
/*Reformat operation*/
let decimal ("") insert_record_count=0;
let decimal("") update_record_count=0;
let decimal("") same_record_count=0;
let decimal("") total_record_count=0;

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
//This count process is only to capture every type of record count for Audit purpose . This is not part of any CDC process.
        same_record_count = if (v_flag==0) (same_record_count + 1)  else same_record_count;
        insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        total_record_count =total_record_count +1;

        v_dxf_src_env_rank_lookup_record=first_defined(lookup("SRC_ENVRT_ID",exact_record_value.dxf_src_sys_id).src_env_rnk , 99999 ) ; // A default 99999 will be assigned if no lookup match is found.
        //in.src_env_rank will have default value of 9999 for sources ,where no rank is defined in src_envrt_id lkp file
        // Updates will be suppressesd
        // File type is placeholder .
        //Source that is updating is not a golden ( Most accurate source).
        out.flag :: if( (v_flag == 2 && v_input_file_type=="placeholder" ) or ( v_flag == 2 && v_dxf_src_env_rank_lookup_record < in.src_env_rank  ) or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ; 
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        out.ids_create_uid :: if ( v_flag == 2 ) exact_record_value.ids_create_uid else in.ids_create_uid ; //If record is an update record , value will come from lookup record value .
        out.ids_create_dttm :: if ( v_flag == 2 ) exact_record_value.ids_create_dttm else in.ids_create_dttm ; //If record is an update record , value will be populated from lookup
        out.ids_create_run_id :: if ( v_flag == 2 ) exact_record_value.ids_create_run_id else in.ids_create_run_id ; //If record is an update record , value will be populated from lookup
        out.* :: in.*;

end


out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count , 
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end; ' ]|3|9|K|DIM CDC uses IDS full data file ICFF|{0|}}
{30001002|XXparameter|FACT_CDC_XFR|$['include "' + PUB_DXF_DML + '/generic_data_types.dml" ;
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
let decimal ("") insert_record_count=0;
let decimal("") update_record_count=0;
let decimal("") same_record_count=0;
let decimal("") total_record_count=0;

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
        same_record_count = if (v_flag==0) (same_record_count + 1)  else same_record_count;
        insert_record_count = if ( v_flag==1) (insert_record_count + 1 ) else insert_record_count;
        update_record_count  =if ( v_flag==2 ) (update_record_count + 1 )  else update_record_count ;
        total_record_count =total_record_count +1;

        
        out.flag :: if( (v_flag == 2 && v_input_file_type=="placeholder" )  or ( v_flag == 2 && hist_load_suppress_flag=="Y"  ) ) 3 else v_flag ; // Supress updates if file is placeholder
        out.dxf_sk :: if ( v_flag == 2 ) exact_record_value.dxf_sk else in.dxf_sk ; //If record is an update record , dxf sk will be populated from lookup record value .
        
        out.* :: in.*;

end


out :: final_log_output() =
begin
  out.event_type :: "CDC COUNTS";
  out.event_text :: string_concat("INSERT_RECORD_COUNT = ", insert_record_count,
                                  ";UPDATE_RECORD_COUNT = ", update_record_count , 
                                   ";SAME_RECORD_COUNT = ", same_record_count ,
                                   ";TOTAL_RECORD_COUNT = ", total_record_count );
end; ' ]|3|9|K|FACT CDC uses xref ICFF to perform CDC |{0|}}
{30001002|XXparameter|CDC_XFR|$[ if ( DATASET_TYPE == "FACT") FACT_CDC_XFR else DIM_CDC_XFR ]|3|9|K|XFR for FACT and Dimensions will be diffrent - FACT CDC will only use xref and find probable updates . DIM uses main data ICFF and compares all column to get confirmed update|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|6\|\{53\|error_suppression\|2\|\{56\|Write_ICFFs.Audit_ICFF\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Write_ICFFs.Write_Audit_ICFF.out to Write_ICFFs.Audit_ICFF.write:
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
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|4|1|1|Hnl|@{0|}}
{30001002|XXparameter|DXF_SK_XFR|$[ if ( DATASET_TYPE == "FACT" && is_blank(FACT_DATA_PARTITION_KEY))
         'let decimal(8) etl_partition_date = (decimal(8)) (date("YYYYMMDD")) now();
out :: reformat(in) =
         begin
          out.* :: in.*;
          out.dxf_sk :: etl_partition_date ;
        end; '
   else if (DATASET_TYPE == "FACT")
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
{30001002|XXparameter|FACT_MULTI_ICFF_XFR|$[ if ( DATASET_TYPE == "FACT" &&  is_blank(FACT_DATA_PARTITION_KEY))

' /*extract filename from input record*/
//Initailize a dummy value for validation of filename expression 
//Assuming a col. dxf_src_sys_id
let string(8) v_fact_data_partition_key=(date("YYYYMMDD")) now();
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
else if ( DATASET_TYPE == "FACT" &&  ! is_blank(FACT_DATA_PARTITION_KEY))
  
        ' /*extract filename from input record*/
        //Initailize a dummy value for validation of filename expression 
        //Assuming a col. dxf_src_sys_id
                filename::get_filename(in)=
        begin 
                     filename:: ' +  ' "mfile:'  + IDS_DATA_PATH + '/' + TARGET_ENTITY + '."  + (string("8")) (date("YYYYMMDD")) in.'  + FACT_DATA_PARTITION_KEY + ' +  ".dat.gz"; ' 
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
{30001002|XXparameter|UPDATE_FILE:sandbox|$[string_concat(PUB_DATAHUB_MFS,"/event/",SUBJECT_AREA,"/",APP_NM,"." ,ILM_NAME,".",,TARGET_ENTITY,".update.",RUN_ID,".dat.gz")]|3|9||@{0|}}
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
{30001002|XXparameter|IDS_MAP_XFR_HINT:sandbox|in.*|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:eme|$[PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml"]|3|9||@{0|}}
{30001002|XXparameter|REDUCED_DATASET_DML:sandbox|$[begin
let string("") dml_file=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".dml" ;
let string("") dml_file_reduced=PUB_DATAHUB_DML +"/" +SUBJECT_AREA +  "/" + SUBJECT_AREA  + "." + TARGET_ENTITY + ".reduced.dml" ;
result:: if(file_information(dml_file_reduced).found) dml_file_reduced else dml_file;
end]|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|1190000|518000|0|load.icff|Kimbo Mundy|Created 6/1/2011 9:09:11 AM|1|10|0||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1400000|821000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|1|1|1|}Job 'load.rcmelp.icff' Execution Status Report

||if [[ ! -f "$ICFF_FILE" ]] ; then
  m_touch "mfile:$ICFF_FILE"
fi

if [[ ! -f "$ICFF_INDEX_FILE" ]] ; then
  m_touch "mfile:$ICFF_INDEX_FILE"
fi

if  [[ ! -f "$XREF_NON_ICFF_LOOKUP_FILE" ]] ; then
  m_touch "$XREF_NON_ICFF_LOOKUP_FILE"
fi

##Check processed directory exist : AI_MFS/placeholder/processed 
if [ ! -d "$AI_MFS/placeholder/processed" ]; then
  m_mkdir "$AI_MFS/placeholder/processed"
fi

##Check processed directory exist : AI_MFS/placeholder/processed 
if [ ! -d "$AI_MFS/split/processed" ]; then
  m_mkdir "$AI_MFS/split/processed"
fi

if  [[ ! -f "$EVENT_LOG_FILE" ]] ; then
  m_touch "$EVENT_LOG_FILE"
fi

export AB_REPORT="summary=$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$TARGET_LOWER.summary.log $AB_REPORT"
|#Move processed files to /processed directory
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

if [ $DATASET_TYPE == "FACT" ]
then
        if [ x"$IDS_DATA_PATH" == "x" ]
        then
	   echo " IDS Data path is not resolved in parameter :IDS_DATA_PATH"
	 else 
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
		
	fi 
fi

|@CLAIM_DW_SBOXSt|33206783|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV_3.5-apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@IDS LOAD and CDC|458000|69000|0|0|0|0|13513|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Rounded MT Bold|32768|360|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Flow =1 -- New records - for insert

Flow =2 -- Change  record - for update|860000|367000|0|0|0|0|12395|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|90|1|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}13547|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}13560|2065|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}13540|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}13462|531|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13550|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}13559|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}13561|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}13566|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}13548|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}13567|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}13564|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}13551|17|}}
{2010600005|XXGgraph|21|0|41|0|{Subgraph created from graph "load.type1.icff"|{}@0|@656000|357500|0|0|0|0|13541|Determine Actions|Mukesh Singh|Created 4/7/2016 5:34:31 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|781000|559000|3|}}
{2010240003|XXGlegend|22|0|43|0|{@{}@//Flow =0 -- Same record
//Flow =1 -- New records - for insert
//Flow =2 -- Change  record - for update
Flow =4 -- Updates that were supressed 
due to reason , I.e they were loaded via placeholder record or have lower  src rank priority|19000|409000|0|0|0|0|10576|}}
{2010242002|XXGface|23|0|45|0|{@{}@Arial|8388608|110|1|}}
{2010240003|XXGlegend|24|0|47|0|{@{}@Same records|484000|32000|0|0|0|0|10496|}}
{2010242002|XXGface|25|0|49|0|{@{}@Arial|16711680|90|1|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}10589|17|}}
{2010501005|XXGpvertex|27|0|53|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|output_index|output_index_out :: output_index(in) =
begin
output_index_out :: 
        if(in.flag==0) 0
        else if (in.flag==1) 1
        else if (in.flag==2) 2
        else if (in.flag==3) 3;
        
end;|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|out1_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|out2_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out3_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error3_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|155000|195000|0|0|0|0|10590|RFMT:Identify Actions|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|28|0|55|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|29|0|58|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|30|0|60|0|{@{}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|31|0|62|0|{@{}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|32|0|64|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|33|0|66|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|34|0|68|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|35|0|70|0|{@{}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|36|0|72|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|37|0|74|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|38|0|76|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|39|0|78|0|{@{}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|40|0|80|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|41|0|82|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|42|0|84|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|43|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|44|0|90|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|45|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|46|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform3||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|47|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|48|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|49|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|50|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|51|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|52|0|117|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|53|0|120|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|54|0|123|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|55|0|126|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|56|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|57|0|132|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{DXF_SK_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|191000|100000|0|0|0|0|11084|RFMT:Assign SK|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|58|0|134|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|59|0|136|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|60|0|138|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|61|0|140|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|142|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|63|0|144|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|64|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|65|0|150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|66|0|153|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|67|0|156|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|159|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|164|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{CDC_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|out0_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|957250|140500|0|0|0|0|12279|RFMT:lookUp IDS & CDC|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|70|0|166|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|71|0|168|0|{@{}@384|.5|.5|{0|}12278|17|}}
{2010203004|XXGoport|72|0|170|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|73|0|172|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|74|0|174|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|75|0|176|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|76|0|178|0|{@{}@384|.5|.5|{0|}12318|17|}}
{2010501005|XXGpvertex|77|0|180|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|78|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|79|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|80|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|81|0|192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|82|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|83|0|204|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|577000|35000|0|0|0|0|10495|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|84|0|206|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|85|0|209|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|86|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|87|0|216|0|{@{}@0|0|0|0|out0|.9122807017543859|@@@14352|0|}}
{2010203004|XXGoport|88|0|220|0|{@{}@0|0|0|0|out1|.5050100200400801|@@@14352|0|}}
{2010203004|XXGoport|89|0|224|0|{@{}@0|0|0|0|out2|.42765685019206146|@@@13328|0|}}
{2010202004|XXGiport|90|0|228|0|{@{}@0|0|0|0|in1|.8070175438596491|@@@13840|0|}}
{2010503005|XXGfvertex|91|0|232|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.dups.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=j|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.dups.$RUN_ID.dat.gz|3|2|$|@{0|}}
}}@0|@412000|509500|389000|280000|56000|50000|13553|Duplicates|Ab Initio Software||1|100000|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|92|0|234|0|{@{}@414000|270000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|93|0|237|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|94|0|239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|95|0|243|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
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
}}@0|@164316|507580|151000|271000|56000|50000|13461|Errors|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|96|0|245|0|{@{}@174000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|97|0|248|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|98|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|99|0|253|0|{|{}@0|@872000|180500|0|0|0|0|13552|Generate SK for insert record|Mukesh Singh|Created 5/15/2016 8:16:13 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|615000|285000|3|}}
{2010240003|XXGlegend|100|0|255|0|{@{}@For FACTS ,  data partition value will be assigned in dxf_sk column|15000|36000|0|0|0|0|11078|}}
{2010242002|XXGface|101|0|257|0|{@{}@Arial Narrow|32768|100|0|}}
{2010203004|XXGoport|102|0|260|0|{@{}@0|0|0|0|out0|.4280701754385965|@@@14352|0|}}
{2010202004|XXGiport|103|0|264|0|{@{}@0|0|0|0|in0|.4936708860759494|@@@13840|0|}}
{2010600005|XXGgraph|104|0|268|0|{Subgraph created from graph "load.icff"|{}@0|@502500|705750|0|0|0|0|13463|Get Count|Mukesh Singh|Created 4/12/2016 4:27:50 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|860000|357000|3|}}
{2010240003|XXGlegend|105|0|270|0|{@{}@$AI_SERIAL_LOG : 
Count detail|685000|225500|0|0|0|0|11758|}}
{2010242002|XXGface|106|0|272|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|107|0|274|0|{@{}@Normalize is used to get count of 
all type of CDC in one 
Handle LOG  process|215000|232000|0|0|0|0|11785|}}
{2010242002|XXGface|108|0|276|0|{@{}@Arial Narrow|8421504|100|3|}}
{2010210004|XXGflow|109|0|278|0|{@{}@384|.5|.5|{0|}11799|17|}}
{2010210004|XXGflow|110|0|280|0|{@{}@384|.5|.5|{0|}11806|17|}}
{2010210004|XXGflow|111|0|282|0|{@{}@384|.5|.5|{0|}11800|17|}}
{2010503005|XXGfvertex|112|0|284|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/load.$SUBJECT_AREA/count.$ILM_NAME.$TARGET_ENTITY.\{RUN_ID\}.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/load.$SUBJECT_AREA/count.$ILM_NAME.$TARGET_ENTITY.$RUN_ID.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/audit_count_computed_source.dml|3|2|f$|@{0|}}
}}@0|@706000|153000|0|0|0|0|11807|Count file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|113|0|286|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|114|0|289|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|115|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|116|0|294|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@75000|163000|0|0|0|0|11751|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|117|0|296|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|118|0|299|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|119|0|301|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|120|0|303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|121|0|306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|122|0|310|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|CDC|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@385000|631500|0|0|0|0|13257|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|123|0|312|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|124|0|315|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|125|0|317|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|126|0|319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|127|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|128|0|328|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|let datetime("YYYY-MM-DD HH24:MI:SS") current_time=now1();

/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/
out::length(in)=
begin
out :: 4;
end;

/*Do computation*/
out::normalize(in,index)=
begin
out.pset_name :: if ( is_blank("$\{AB_PSET_NAME\}"))  "$\{AB_GRAPH_NAME\}" else "$\{AB_PSET_NAME\}";
out.process_nm :: if( index == 0) "CDC INSERT RECORD COUNT "
                  else if (index ==1) "CDC UPDATE RECORD COUNT"
                  else if (index ==2) "CDC SAME  RECORD COUNT"
                  else if (index ==3) "CDC TOTAL RECORD COUNT";
out.src_info :: "ETL CDC PROCESS ";
out.run_dttm :: current_time;
out.process_type :: "$\{DATASET_TYPE\}" + " LOAD ";
out.record_count :: string_split(string_split(in.event_text,";")[index ],"=")[1];
out.* :: in.*;
end;
out :: input_select(in) =
begin
  out :: string_lrtrim(in.event_type)=="CDC COUNTS";
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|223000|146500|0|0|0|0|11801|Normalize|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|129|0|330|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|130|0|333|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|131|0|335|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|132|0|337|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|133|0|339|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|134|0|342|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
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
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate types in transform package|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|optional integer(8) out::length(in)|3|2|H$|Number of records to output.  Either this function or finished() must be defined.|{0|}}
{30001002|XXparameter|operation4|temp ? temp::normalize(temp, in, integer(8) index) : out::normalize(in, integer(8) index)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation5|optional temp ? integer(8) finished_out::finished(temp, in, integer(8) index) : integer(8) finished_out::finished(in, integer(8) index)|3|2|H$|Are we done with this input record?  Either this function or length() must be defined.|{0|}}
{30001002|XXparameter|operation6|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$||{0|}}
{30001002|XXparameter|operation3_analysis|integer(8) length_out::length(in)|3|2|H$|Number of records to output|{0|}}
{30001002|XXparameter|operation7_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
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
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|135|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|136|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|137|0|350|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|138|0|353|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|139|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|140|0|363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{process_nm\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.record_count::sum(in.record_count);
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@445000|124000|0|0|0|0|11798|RollUp: Count -Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|141|0|365|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|142|0|368|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|143|0|370|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|144|0|372|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|145|0|374|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|146|0|377|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|147|0|379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|148|0|382|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|149|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|150|0|388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|151|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|152|0|398|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010503005|XXGfvertex|153|0|403|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
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
}}@0|@49316|514580|36000|271000|56000|50000|13459|Invalid|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|154|0|405|0|{@{}@59000|261000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|155|0|408|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|156|0|410|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|157|0|413|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$[
begin

let string("") rfmt_xfr = make_transform("reformat", [vector make_arg("in")], [vector make_arg("out")]);

let dml_field_info_vec split_dml_info = record_info(SPLIT_DML);
let record 
string("") field_name;
string("") subrec_name;
end[int] split_dml_fields = [vector];

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
                        rfmt_xfr = add_rule(rfmt_xfr, "out." + field.subrec_name + field.field_name, "string_split(in.target_fields_line, '\\\\x01')[" + (string(""))(decimal(""))(index_of(field) - 10) + "]");
        end;
end

result :: rfmt_xfr;

end
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$\{SPLIT_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[INPUT_FILE_DRIVING_MASK == "placeholder"]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|235000|185000|0|0|0|0|5631|RFMT: Re-Construct for Placeholder|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|158|0|415|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|159|0|417|0|{@{}@384|.5|.5|{0|}5637|17|}}
{2010203004|XXGoport|160|0|419|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|161|0|421|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|162|0|423|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|163|0|425|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|164|0|427|0|{@{}@384|.5|.5|{8|166000|269000|186000|269000|270000|269000|291000|269000|}5658|17|}}
{2010501005|XXGpvertex|165|0|429|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|166|0|431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|167|0|435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|168|0|438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|169|0|441|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|170|0|444|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|171|0|447|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|let string("") file_path=string_concat("$\{AI_MFS\}","/","$\{INPUT_FILE_DRIVING_MASK\}","/");
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
}}@0|@252391|63666|272000|84000|118000|113000|117|Read Multiple Splits|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|172|0|449|0|{@{}@389000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|173|0|451|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|174|0|453|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|175|0|455|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|176|0|457|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|177|0|459|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|178|0|461|0|{@{}@262000|124000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|179|0|463|0|{@{}@384|.5|.5|{8|147000|129000|167000|129000|240000|129000|261000|129000|}122|17|}}
{2010243001|XXGwatcher|180|0|465|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|181|0|467|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|182|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|183|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|184|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|185|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|186|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|187|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|188|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|189|0|490|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(SPLIT_FILE_NAME_VEC) ]|3|9||@{0|}}
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
}}@0|@57000|79000|77000|99000|60000|60000|123|Find All Splits|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|190|0|492|0|{@{}@136000|124000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|191|0|495|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|192|0|497|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|193|0|499|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|194|0|501|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|195|0|504|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|196|0|507|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|197|0|514|0|{Subgraph created from graph "load.type1.icff"|{}@0|@360875|336000|0|0|0|0|13562|LookUp and CDC on HASH Keys|Mukesh Singh|Created 4/8/2016 1:07:05 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1402000|393000|3|}}
{2010240003|XXGlegend|198|0|516|0|{@{}@1. CDC Process based on ICFF Data files for DIMS
2.CDC process for FACT based on Xref files
3. This process will also ignore updates from coming source
, if record in IDS is from Golden source .|926000|293000|0|0|0|0|12133|}}
{2010242002|XXGface|199|0|518|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|200|0|520|0|{@{}@384|.5|.5|{0|}12315|17|}}
{2010210004|XXGflow|201|0|522|0|{@{}@384|.5|.5|{0|}12317|529|}}
{2010210004|XXGflow|202|0|526|0|{@{}@384|.5|.5|{0|}12312|17|}}
{2010600005|XXGgraph|203|0|528|0|{Subgraph created from graph "LookUp and CDC on HASH Keys"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@710000|136000|0|0|0|0|12319|Dedup- On Hash of Target NK|Mukesh Singh|Created 6/13/2016 6:54:40 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|576000|243000|3|}}
{2010240003|XXGlegend|204|0|530|0|{@{}@Handle Log source for record count|-465000|-85000|0|0|0|0|11949|}}
{2010242002|XXGface|205|0|532|0|{@{}@Arial Rounded MT Bold|0|100|0|}}
{2010210004|XXGflow|206|0|534|0|{@{}@384|.5|.5|{0|}12044|17|}}
{2010243001|XXGwatcher|207|0|536|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|208|0|538|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; flc5n1; flcpda; flcqda\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|321000|72500|0|0|0|0|12045|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|209|0|540|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|210|0|542|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|211|0|544|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|212|0|546|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|213|0|548|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|214|0|550|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|215|0|553|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|216|0|555|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|217|0|558|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|218|0|561|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|219|0|564|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|220|0|567|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|221|0|570|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|222|0|578|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|minor_key|\{dxf_hk_part2; src_env_rank; flc5n1; flcpda; flcqda\}|3|2|$|@{0|}}
{30001002|XXparameter|major_key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|65000|65000|0|0|0|0|12043|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|223|0|580|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|224|0|583|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|225|0|585|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|226|0|587|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|227|0|590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|228|0|594|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$\{INTER_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
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
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|263000|140000|0|0|0|0|12314|RFMT: Get Hash and src_env_rank|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|229|0|596|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|230|0|599|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|231|0|601|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|232|0|603|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|233|0|605|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|234|0|608|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|235|0|610|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|236|0|614|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|237|0|617|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|238|0|620|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|239|0|623|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|240|0|627|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
   out.* :: $\{IDS_MAP_XFR_HINT\};
end;|3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|doc_transform|out0,reject0,error0,log :: document(in) =
begin
out0.* :: in.*;
end;|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|76000|142500|0|0|0|0|12297|RFMT: Map to IDS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|629|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|242|0|632|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|243|0|634|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|244|0|636|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|245|0|638|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|246|0|640|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|247|0|642|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|248|0|646|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|249|0|649|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|250|0|652|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|251|0|655|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|252|0|663|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010203004|XXGoport|253|0|667|0|{@{}@0|0|0|0|out1|.5069444444444444|@@@13328|0|}}
{2010202004|XXGiport|254|0|670|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|255|0|674|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@481000|151000|0|0|481000|303000|12316|PBKS:\{ICFF_KEY\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|256|0|676|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|257|0|678|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|258|0|680|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|259|0|683|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|260|0|687|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|261|0|689|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|262|0|691|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|263|0|696|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|264|0|700|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|265|0|704|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|266|0|706|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|267|0|708|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|268|0|710|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|269|0|713|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|270|0|715|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|271|0|717|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|272|0|720|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|273|0|725|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|274|0|727|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|275|0|729|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|276|0|732|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|277|0|734|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|278|0|737|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|279|0|743|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|280|0|746|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|281|0|753|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|$BOOKKEEPING_FIELDS_MAP_XFR|3|9|fj|@{0|}}
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
}}@0|@1219376|140902|302000|216000|156000|107000|12267|RFMT: Set IDS Audit Fields|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|282|0|755|0|{@{}@457000|264000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|283|0|757|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|284|0|759|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|285|0|761|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|286|0|763|0|{@{}@292000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|287|0|766|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|288|0|768|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|289|0|772|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|290|0|775|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|291|0|778|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|292|0|781|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|293|0|789|0|{@{}@0|0|0|0|out1|.5829471733086191|@@@13328|0|}}
{2010203004|XXGoport|294|0|793|0|{@{}@0|0|0|0|out0|.40232558139534885|@@@14352|0|}}
{2010202004|XXGiport|295|0|797|0|{@{}@0|0|0|0|in0|.375|@@@13840|0|}}
{2010600005|XXGgraph|296|0|801|0|{Subgraph created from graph "load.type1.icff"|{}@0|@360000|229750|0|0|0|0|13507|LookUps|Mukesh Singh|Created 4/5/2016 5:28:10 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|489000|387000|3|}}
{2010240003|XXGlegend|297|0|803|0|{@{}@Disabled input file 
to view ICFF lookup data|294000|119500|0|0|0|0|10281|}}
{2010242002|XXGface|298|0|805|0|{@{}@Arial|12632256|90|0|}}
{2010240003|XXGlegend|299|0|807|0|{@{}@This will be IDS ICFF Data file if Dataset is DIM
Will be Xref ICFF Data file if Dataset is FACT|17000|122000|0|0|0|0|10286|}}
{2010242002|XXGface|300|0|809|0|{@{}@Arial Narrow|32768|100|0|}}
{2010240003|XXGlegend|301|0|811|0|{@{}@This is a serial lookup file for deciding SRC Rank|17000|349000|0|0|0|0|10284|}}
{2010242002|XXGface|302|0|813|0|{@{}@Arial Narrow|32768|100|0|}}
{2010503005|XXGfvertex|303|0|815|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|RecordFormat|$[if(DATASET_TYPE=="FACT") XREF_KEY_FILE_DML else TARGET_DML ]|3|9||@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|keep_on_disk|True|3|1|l|@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
}}@0|@76000|58000|0|0|0|0|10289|ICFF_TEMPLATE_IDS|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|304|0|817|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010503005|XXGfvertex|305|0|819|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{ICFF_FILE\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{ICFF_FILE\}|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$[if(DATASET_TYPE=="FACT") XREF_KEY_FILE_DML else TARGET_DML ]|3|9||@{0|}}
}}@0|@299000|65000|0|0|0|0|10291|ICFF lookup FILE for IDS|Ab Initio Software|@1|400|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|306|0|821|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|307|0|823|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|308|0|825|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|309|0|828|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("lookup", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUB_DXF_META/lookup.src_envrt_id1.txt", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$PUB_DXF_META/lookup.src_envrt_id.txt|3|2|$|@{0|}}
{30001002|XXparameter|RecordFormat|include "$PUB_DXF_DML/generic_data_types.dml";
metadata type = ids_src_envrt_lookup_type;|3|2|$|@{0|}}
{30001002|XXparameter|key|\{src_env_sk\}|3|2|$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|~\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|DA_vertex_status\|\}\{56\|CTL10026\|\}\{51\|0\|\}\{\}\}\}\}|3|9|P|@{0|}}
}}@0|@81000|272500|0|0|0|0|10290|SRC_ENVRT_ID|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010503005|XXGfvertex|310|0|830|0|{Lookup files are components containing shared data. Use lookup files with the DML lookup functions to access records according to a key.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010600005|XXGgraph|311|0|832|0|{Subgraph created from graph "load"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|9|F||{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|6\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Find_All_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|Read_Shreds.Read_Multiple_Shreds\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Read_Shreds.Find_All_Shreds.out to Read_Shreds.Read_Shreds.Read_Multiple_Shreds.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@42000|345780|60000|128000|766000|498000|13549|Read Split or Placeholder|Mukesh Singh|Created 4/4/2016 10:47:41 PM|1|10|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.16993464529514313|796000|461000|3|}}
{2010240003|XXGlegend|312|0|834|0|{@{}@This componenet was added due to problem in 
reading placeholder file with split dml directly|204000|335000|0|0|0|0|5589|}}
{2010242002|XXGface|313|0|836|0|{@{}@Arial Narrow|32768|100|0|}}
{2010210004|XXGflow|314|0|840|0|{@{}@384|.5|.5|{6|714000|323000|714000|343000|714000|364000|}5638|19|}}
{2010501005|XXGpvertex|315|0|842|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LogFile|file:$AI_SERIAL_LOG/load.$SUBJECT_AREA/load.$ILM_NAME.$TARGET_ENTITY.invalid.log|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Gather_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_one_phase_in_graph\|\}\}\{56\|Error in flow from Read_Shreds.Validate_Records.log to Read_Shreds.Gather_Logs_Invalid.in:
  Only one phase in graph should be used unless logical business reason.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@666785|363634|692000|375000|40000|47000|5584|Gather Logs: Invalid|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|316|0|844|0|{@{}@709000|365000|11000|11000|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|317|0|847|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|logger|3|1|Hl||{0|}}
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
{2010202004|XXGiport|318|0|849|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@786|0|}}
{2010501005|XXGpvertex|319|0|852|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|reject_threshold|Use limit/ramp|3|1|l|@{0|}}
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
}}@0|@500000|204000|615000|224000|123000|89000|5639|RFMT:Validate Records|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|320|0|854|0|{@{}@737000|264000|11000|11000|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|321|0|856|0|{@{}@629000|312000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|322|0|858|0|{@{}@669000|312000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|323|0|860|0|{@{}@709000|312000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|324|0|863|0|{@{}@605000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|325|0|866|0|{Separates valid data records from invalid data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|validate|3|1|Hl||{0|}}
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
{2010203004|XXGoport|326|0|868|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2192|0|}}
{2010203004|XXGoport|327|0|871|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|328|0|874|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|329|0|877|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|330|0|880|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|331|0|889|0|{Subgraph created from graph "Read Shreds"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|TARGET_NAME|$TARGET_NAME|3|9|RFK|The name of the target dataset to load, including its "logical" schema name.|{0|}}
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
}}@0|@20000|201667|34000|233000|592000|364000|5659|Read Splits|Mukesh Singh|Created 4/11/2016 3:08:57 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}.2060810774564743|592000|363000|3|}}
{2010210004|XXGflow|332|0|892|0|{@{}@384|.5|.5|{8|373000|314000|373000|314000|396000|314000|403000|314000|}113|2065|}}
{2010503005|XXGfvertex|333|0|895|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$FIRST_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$\{SPLIT_DML\}|3|3|cj|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
}}@0|@284652|269948|307000|290000|56000|50000|114|For View Data|Kimbo Mundy||1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|334|0|897|0|{@{}@362000|309000|11000|11000|read|0.0|@@@2160|0|}}
{2010503005|XXGfvertex|335|0|900|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|336|0|902|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2160|0|}}
{2010501005|XXGpvertex|337|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@377000|251666|414000|280000|56000|72000|6|Trash|Ab Initio Software|Built-in|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|338|0|908|0|{@{}@404000|309000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|339|0|911|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|340|0|913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|341|0|917|0|{@{}@155000|264000|11000|11000|out0|.5|@@@14736|0|}}
{2010203004|XXGoport|342|0|921|0|{@{}@189000|164000|11000|11000|out0|.5|@@@14480|0|}}
{2010203004|XXGoport|343|0|925|0|{@{}@154000|211000|11000|11000|error|.75|@@@13464|0|}}
{2010203004|XXGoport|344|0|929|0|{@{}@0|0|0|0|out1|.6407035175879398|@@@13328|0|}}
{2010501005|XXGpvertex|345|0|933|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|1088000|235000|0|0|0|0|13280|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|346|0|935|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|347|0|939|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|348|0|942|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|349|0|944|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|350|0|947|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|351|0|950|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@1|@584000|80000|0|0|0|0|12077|IDS ICFF|Ab Initio Software|@1|100000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|352|0|952|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010210004|XXGflow|353|0|954|0|{@{}@384|.5|.5|{0|}12076|2065|}}
{2010202004|XXGiport|354|0|956|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|355|0|958|0|{@{}@384|.5|.5|{0|}12075|17|}}
{2010503005|XXGfvertex|356|0|960|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|357|0|962|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|358|0|965|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|359|0|970|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$INPUT_FILE_DRIVING_MASK.$ILM_NAME.$TARGET_ENTITY.supp_updates.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/load.$SUBJECT_AREA/load.$INPUT_FILE_DRIVING_MASK.$ILM_NAME.$TARGET_ENTITY.supp_updates.$RUN_ID.dat.gz|3|2|$|@{0|}}
}}@0|@697000|509500|389000|280000|56000|50000|13465|Supressed Updates|Ab Initio Software||1|100|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|360|0|972|0|{@{}@414000|270000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|361|0|975|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|362|0|977|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|363|0|980|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_TYPE != 'FACT']|3|9|F||{0|}}
}}@0|@1237000|197500|0|0|0|0|13565|Update Max SK|Mukesh Singh|Created 5/15/2016 8:15:49 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1358000|604000|3|}}
{2010240003|XXGlegend|364|0|982|0|{@{}@Create an insert record for Max 
SK if there is zero insert|620000|555000|0|0|0|0|282|}}
{2010242002|XXGface|365|0|984|0|{@{}@Arial Rounded MT Bold|8421504|110|0|}}
{2010210004|XXGflow|366|0|986|0|{@{}@384|.5|.5|{0|}304|17|}}
{2010210004|XXGflow|367|0|988|0|{@{}@384|.5|.5|{0|}310|19|}}
{2010210004|XXGflow|368|0|990|0|{@{}@384|.5|.5|{0|}316|17|}}
{2010210004|XXGflow|369|0|992|0|{@{}@384|.5|.5|{0|}305|17|}}
{2010210004|XXGflow|370|0|994|0|{@{}@384|.5|.5|{0|}309|17|}}
{2010501005|XXGpvertex|371|0|996|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.sk_value :: "$\{MAX_SK_VALUE\}";
end|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|667000|452500|0|0|0|0|290|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|372|0|998|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|373|0|1001|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|374|0|1003|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|375|0|1005|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|376|0|1007|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|377|0|1010|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|378|0|1013|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|379|0|1016|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|file:$MAX_SK_LOOKUP_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$MAX_SK_LOOKUP_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|record
  decimal("\\n") max_sk = 0;
end;|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0062|3|2|$|@{0|}}
}}@0|@1147000|302500|0|0|0|0|317|Write Max SK file|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|380|0|1018|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|381|0|1021|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|382|0|1023|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|383|0|1026|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
}}@0|Reformat|94000|220000|0|0|0|0|272|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|384|0|1028|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|385|0|1031|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|386|0|1033|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|387|0|1035|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|388|0|1037|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|389|0|1039|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|390|0|1041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|391|0|1045|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|392|0|1048|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|393|0|1051|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|394|0|1054|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|395|0|1060|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|547000|237500|0|0|0|0|242|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|396|0|1062|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|397|0|1065|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|398|0|1068|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|399|0|1070|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|400|0|1073|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|401|0|1080|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
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
}}@0|Rollup|305000|200000|0|0|0|0|311|Rollup-Per Partition|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|402|0|1082|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|403|0|1085|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|404|0|1087|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|405|0|1089|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|406|0|1091|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|407|0|1094|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|408|0|1096|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|409|0|1099|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|411|0|1105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|412|0|1108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|413|0|1115|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
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
}}@0|Rollup|865000|285000|0|0|0|0|307|Rollup-Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|414|0|1117|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|415|0|1120|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|416|0|1122|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|417|0|1124|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|418|0|1126|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|419|0|1130|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|420|0|1132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|421|0|1135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|422|0|1138|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|423|0|1141|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|424|0|1144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|425|0|1152|0|{@{}@0|0|0|0|in0|.5278969957081545|@@@13840|0|}}
{2010600005|XXGgraph|426|0|1156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@35000|60000|0|0|0|0|13120|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|791000|470000|3|}}
{2010240003|XXGlegend|427|0|1158|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|428|0|1160|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|429|0|1162|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|430|0|1164|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|431|0|1166|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|432|0|1168|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|433|0|1170|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|434|0|1172|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|435|0|1174|0|{@{}@1.0|17000|88000|0|0|0|0|14|}}
{2010242002|XXGface|436|0|1176|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|437|0|1178|0|{@{}@Apr 11 2016|82000|88000|0|0|0|0|100|}}
{2010242002|XXGface|438|0|1180|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|439|0|1182|0|{@{}@Mukesh.Singh (Exusia)|187000|88000|0|0|0|0|101|}}
{2010242002|XXGface|440|0|1184|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|441|0|1186|0|{@{}@Initial version
|412000|83000|0|0|0|0|102|}}
{2010242002|XXGface|442|0|1188|0|{@{}@Arial Narrow|0|100|0|}}
{2010600005|XXGgraph|443|0|1190|0|{Subgraph created from graph "load.type1.icff"|{}@0|@1218000|336500|0|0|0|0|13568|Write  Data Store files|Mukesh Singh|Created 4/7/2016 5:34:21 PM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1032000|763000|3|}}
{2010240003|XXGlegend|444|0|1192|0|{@{}@Insert|269000|171000|0|0|0|0|10982|}}
{2010242002|XXGface|445|0|1194|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010240003|XXGlegend|446|0|1196|0|{@{}@Update|274000|356000|0|0|0|0|10981|}}
{2010242002|XXGface|447|0|1198|0|{@{}@Arial Rounded MT Bold|16711680|110|0|}}
{2010210004|XXGflow|448|0|1200|0|{@{}@384|.5|.5|{0|}10978|1041|}}
{2010210004|XXGflow|449|0|1202|0|{@{}@384|.5|.5|{0|}10979|1041|}}
{2010501005|XXGpvertex|450|0|1204|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|140000|180000|0|0|0|0|10492|Replicate for Insert|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|451|0|1206|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|452|0|1209|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|453|0|1211|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|454|0|1213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|455|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|456|0|1222|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|145000|335000|0|0|0|0|10607|Replicate for Update|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|457|0|1224|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|458|0|1227|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|459|0|1229|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|460|0|1231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|461|0|1234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|462|0|1240|0|{|{}@0|@486000|222500|0|0|0|0|10980|Write IDS Data Store|Mukesh Singh|Created 4/6/2016 10:00:15 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1250000|663000|3|}}
{2010210004|XXGflow|463|0|1242|0|{@{}@384|.5|.5|{0|}11534|17|}}
{2010210004|XXGflow|464|0|1244|0|{@{}@384|.5|.5|{0|}11548|17|}}
{2010210004|XXGflow|465|0|1246|0|{@{}@384|.5|.5|{0|}11546|17|}}
{2010210004|XXGflow|466|0|1248|0|{@{}@384|.5|.5|{0|}11538|17|}}
{2010501005|XXGpvertex|467|0|1250|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{$\{ICFF_KEY\}\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|96000|199500|0|0|0|0|11535|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|468|0|1252|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|469|0|1255|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|470|0|1257|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|471|0|1259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|472|0|1262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010600005|XXGgraph|473|0|1268|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[IS_WRITE_REDUCED_DATASET]|3|9|F||{0|}}
}}@0|@571500|410000|0|0|0|0|11539|Reduced Single ICFF|Mukesh Singh|Created 10/31/2016 3:48:29 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1141000|432000|3|}}
{2010210004|XXGflow|474|0|1270|0|{@{}@384|.5|.5|{0|}12338|2065|}}
{2010210004|XXGflow|475|0|1272|0|{@{}@384|.5|.5|{0|}12336|17|}}
{2010210004|XXGflow|476|0|1274|0|{@{}@384|.5|.5|{0|}12324|17|}}
{2010210004|XXGflow|477|0|1276|0|{@{}@384|.5|.5|{0|}12326|17|}}
{2010210004|XXGflow|478|0|1278|0|{@{}@384|.5|.5|{0|}12334|17|}}
{2010503005|XXGfvertex|479|0|1280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
}}@1|@899000|65000|0|0|0|0|12339|New Data File-4|Ab Initio Software|@1|400|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|480|0|1282|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|481|0|1285|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|482|0|1287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|483|0|1290|0|{Repartitions data records by key values and then sorts the records within each partition.
COPYRIGHT 2004 AB INITIO
ALL RIGHTS RESERVED
USE AND DISCLOSURE IS RESTRICTED BY CONFIDENTIALITY & LICENSE CONDITIONS|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@246000|111000|0|0|481000|303000|12327|PBKS:\{ICFF_KEY-dxf_hk_part1\}|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|484|0|1292|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|485|0|1294|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|486|0|1296|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|487|0|1299|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|488|0|1302|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|489|0|1304|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|490|0|1306|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|491|0|1311|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|492|0|1315|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|493|0|1319|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|494|0|1321|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|495|0|1323|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|496|0|1325|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|497|0|1328|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|498|0|1330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|499|0|1332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|500|0|1335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|501|0|1340|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|502|0|1342|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|503|0|1344|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|504|0|1347|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|505|0|1349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|506|0|1352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|507|0|1358|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|508|0|1361|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010503005|XXGfvertex|509|0|1365|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1);|3|1|l|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
}}@0|@749000|65000|0|0|0|0|12337|REDUCED ICFF|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|510|0|1367|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|511|0|1370|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|512|0|1373|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|513|0|1375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|514|0|1378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|515|0|1382|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$REDUCED_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$REDUCED_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|void(1)|7|1|RFl||{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@749000|240000|0|0|0|0|12325|REDUCED Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|516|0|1384|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|517|0|1387|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|518|0|1389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|519|0|1392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out0_metadata|$REDUCED_DATASET_DML|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "~$PUB_DXF_XFR/common_functions.xfr";
include "~$PUB_DXF_DML/generic_data_types.dml";
out :: reformat(in) =
begin
   let hash_key_combine_type dxf_hk =  reinterpret(get_hash(in, $"REDUCED_DATASET_ICFF_KEY")) ;
   out.dxf_hk_part1 :: dxf_hk.dxf_hk_part1;
   out.dxf_hk_part2 :: dxf_hk.dxf_hk_part2;

   out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|53000|105000|0|0|0|0|12335|RFMT:Get Hash On Reduced File Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|520|0|1394|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|521|0|1397|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|522|0|1399|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|523|0|1401|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|524|0|1403|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|525|0|1405|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|526|0|1407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|527|0|1411|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|528|0|1414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|529|0|1417|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|530|0|1420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|531|0|1424|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Compute_Multiple_Block_Compressed_Lookups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$\{FACT_MULTI_ICFF_XFR\}|3|3|c|@{0|}}
{30001002|XXparameter|max_files|$MAX_FILES_TO_WRITE|3|2|$|@{0|}}
{30001002|XXparameter|file_limits|None (No limits on resource usage)|3|1|l|@{0|}}
{30001002|XXparameter|compression_level|1|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@40000|38000|0|0|0|0|11486|Compute Multiple Block-Compressed Lookups|Ab Initio Software|Built-in 3.1.1.r6.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|532|0|1426|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|533|0|1428|0|{@{}@384|.5|.5|{0|}11485|17|}}
{2010203004|XXGoport|534|0|1430|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|535|0|1432|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|536|0|1434|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|537|0|1436|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|538|0|1438|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|539|0|1440|0|{Compresses and indexes data as block-compressed lookups to be written by Write Multiple Files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|compute-bc-lookups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|540|0|1442|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|541|0|1445|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|542|0|1448|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|543|0|1451|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|544|0|1454|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|545|0|1457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|546|0|1463|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|9||@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@500000|105000|0|0|0|0|12316|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|547|0|1465|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|548|0|1468|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|549|0|1471|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|550|0|1473|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|551|0|1476|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|552|0|1478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|553|0|1481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|554|0|1484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|555|0|1487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|556|0|1493|0|{@{}@0|0|0|0|in0|.36342592592592593|@@@13840|0|}}
{2010501005|XXGpvertex|557|0|1497|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|189000|199500|0|0|0|0|11533|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|558|0|1499|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|559|0|1504|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|560|0|1507|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|561|0|1509|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|562|0|1512|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|563|0|1518|0|{Subgraph created from graph "Write IDS Data Store"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_TYPE=="DIM"]|3|9|F||{0|}}
}}@0|@559000|44000|0|0|0|0|11549|Write Dim Datasets|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|921000|583000|3|}}
{2010210004|XXGflow|564|0|1521|0|{@{}@384|.5|.5|{0|}12067|17|}}
{2010210004|XXGflow|565|0|1523|0|{@{}@384|.5|.5|{0|}12062|2065|}}
{2010210004|XXGflow|566|0|1525|0|{@{}@384|.5|.5|{0|}12064|17|}}
{2010210004|XXGflow|567|0|1528|0|{@{}@384|.5|.5|{0|}12073|17|}}
{2010501005|XXGpvertex|568|0|1530|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; flc5n1; flcpda; flcqda\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|331000|462500|0|0|0|0|12065|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|569|0|1532|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|570|0|1534|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|571|0|1536|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|572|0|1538|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|573|0|1540|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|574|0|1542|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|575|0|1545|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|576|0|1547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|577|0|1550|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|578|0|1553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|579|0|1556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|580|0|1559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|581|0|1562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|582|0|1566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@24000|465000|0|0|0|0|12060|New Data File-5|Ab Initio Software|@1|4000|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|583|0|1568|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|584|0|1571|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|585|0|1573|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|586|0|1580|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_INDEX_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_INDEX_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@1|@589000|185000|0|0|0|0|12074|IDS Index File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|587|0|1582|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|588|0|1585|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|589|0|1587|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|590|0|1590|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$ICFF_KEY|3|2|$|@{0|}}
{30001002|XXparameter|block_size|1048576|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|compression_level|5|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@240000|70000|0|0|0|0|12069|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|591|0|1592|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|592|0|1595|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|593|0|1598|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|594|0|1600|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|595|0|1602|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|596|0|1604|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|597|0|1607|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|598|0|1610|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|599|0|1613|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|600|0|1619|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; flc5n1; flcpda; flcqda\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|230000|245000|0|0|0|0|12063|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|601|0|1621|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|602|0|1624|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|603|0|1628|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|604|0|1630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|605|0|1633|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010503005|XXGfvertex|606|0|1639|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$ICFF_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$ICFF_FILE|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$\{TARGET_DML\}|3|3|c|@{0|}}
}}@2|@829000|100000|0|0|0|0|10933|New Data File-4|Ab Initio Software|@1|100000|-1||6||33089|-1|-1|}}
{2010202004|XXGiport|607|0|1641|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|608|0|1644|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|609|0|1646|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|610|0|1650|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|204000|459500|0|0|0|0|12068|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010203004|XXGoport|611|0|1652|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|612|0|1655|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|613|0|1657|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|614|0|1659|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|615|0|1662|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010202004|XXGiport|616|0|1668|0|{@{}@0|0|0|0|in1|.1457975986277873|@@@13840|0|}}
{2010600005|XXGgraph|617|0|1672|0|{Subgraph created from graph "Write Fact Datasets"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DATASET_TYPE=="FACT"]|3|9|F||{0|}}
}}@0|@565000|231000|0|0|0|0|11547|Write Multi ICFF|Mukesh Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|525000|251000|3|}}
{2010501005|XXGpvertex|618|0|1676|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Write_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@305000|65000|0|0|0|0|11483|Write Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|619|0|1678|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|620|0|1680|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|621|0|1682|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|622|0|1684|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|623|0|1687|0|{Writes records to a set of output files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|writefiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|624|0|1689|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|625|0|1692|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|626|0|1695|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|627|0|1698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|628|0|1704|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010202004|XXGiport|629|0|1708|0|{@{}@0|0|0|0|in0|.53|@@@13840|0|}}
{2010202004|XXGiport|630|0|1713|0|{@{}@0|0|0|0|in2|.4166666666666667|@@@13840|0|}}
{2010202004|XXGiport|631|0|1717|0|{@{}@0|0|0|0|in0|.8824786324786325|@@@13840|0|}}
{2010110002|XXGconstant|632|0|1721|0|{@{}@{1|7239633|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_14|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_2|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_3|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_4|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_5|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_6|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_7|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_8|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_9|}1|20|}
{2010601001|XXGgraph_vertex_vertex|20|0|40|0|{Determine_Actions|}1|21|}
{2010605001|XXGgraph_legend_legend|21|0|42|0|{0|}21|22|}
{2010241001|XXGlegend_face_face|22|0|44|0|{}22|23|}
{2010605001|XXGgraph_legend_legend|23|0|46|0|{1|}21|24|}
{2010241001|XXGlegend_face_face|24|0|48|0|{}24|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_1|}21|26|}
{2010601001|XXGgraph_vertex_vertex|26|0|52|0|{RFMT_Identify_Actions|}21|27|}
{2010212001|XXGvertex_oport_oport|27|0|54|0|{0|out0|}27|28|}
{2010213001|XXGoport_dst_flow|28|0|56|0|{0|}28|26|}
{2010212001|XXGvertex_oport_oport|29|0|57|0|{1|out1|}27|29|}
{2010212001|XXGvertex_oport_oport|30|0|59|0|{2|out2|}27|30|}
{2010212001|XXGvertex_oport_oport|31|0|61|0|{3|out3|}27|31|}
{2010212001|XXGvertex_oport_oport|32|0|63|0|{4|reject0|}27|32|}
{2010212001|XXGvertex_oport_oport|33|0|65|0|{5|reject1|}27|33|}
{2010212001|XXGvertex_oport_oport|34|0|67|0|{6|reject2|}27|34|}
{2010212001|XXGvertex_oport_oport|35|0|69|0|{7|reject3|}27|35|}
{2010212001|XXGvertex_oport_oport|36|0|71|0|{8|error0|}27|36|}
{2010212001|XXGvertex_oport_oport|37|0|73|0|{9|error1|}27|37|}
{2010212001|XXGvertex_oport_oport|38|0|75|0|{10|error2|}27|38|}
{2010212001|XXGvertex_oport_oport|39|0|77|0|{11|error3|}27|39|}
{2010212001|XXGvertex_oport_oport|40|0|79|0|{12|log|}27|40|}
{2010211001|XXGvertex_iport_iport|41|0|81|0|{0|in|}27|41|}
{2010007001|XXGobject_proto_object|42|0|83|0|{}27|42|}
{2010212001|XXGvertex_oport_oport|43|0|85|0|{0|out0|}42|43|}
{2010006001|XXGobject_psameas_object|44|0|87|0|{metadata|out0_metadata|1|0|}43|42|}
{2010006001|XXGobject_psameas_object|45|0|88|0|{transform0|transform0|1|0|}43|42|}
{2010212001|XXGvertex_oport_oport|46|0|89|0|{1|out1|}42|44|}
{2010006001|XXGobject_psameas_object|47|0|91|0|{metadata|out1_metadata|1|0|}44|42|}
{2010006001|XXGobject_psameas_object|48|0|92|0|{transform1|transform1|1|0|}44|42|}
{2010212001|XXGvertex_oport_oport|49|0|93|0|{2|out2|}42|45|}
{2010006001|XXGobject_psameas_object|50|0|95|0|{metadata|out2_metadata|1|0|}45|42|}
{2010006001|XXGobject_psameas_object|51|0|96|0|{transform2|transform2|1|0|}45|42|}
{2010212001|XXGvertex_oport_oport|52|0|97|0|{3|out3|}42|46|}
{2010006001|XXGobject_psameas_object|53|0|99|0|{metadata|out3_metadata|1|0|}46|42|}
{2010006001|XXGobject_psameas_object|54|0|100|0|{transform3|transform3|1|0|}46|42|}
{2010212001|XXGvertex_oport_oport|55|0|101|0|{4|reject0|}42|47|}
{2010006001|XXGobject_psameas_object|56|0|103|0|{metadata|reject0_metadata|1|0|}47|42|}
{2010212001|XXGvertex_oport_oport|57|0|104|0|{5|reject1|}42|48|}
{2010006001|XXGobject_psameas_object|58|0|106|0|{metadata|reject1_metadata|1|0|}48|42|}
{2010212001|XXGvertex_oport_oport|59|0|107|0|{6|reject2|}42|49|}
{2010006001|XXGobject_psameas_object|60|0|109|0|{metadata|reject2_metadata|1|0|}49|42|}
{2010212001|XXGvertex_oport_oport|61|0|110|0|{7|reject3|}42|50|}
{2010006001|XXGobject_psameas_object|62|0|112|0|{metadata|reject3_metadata|1|0|}50|42|}
{2010212001|XXGvertex_oport_oport|63|0|113|0|{8|error0|}42|51|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{metadata|error0_metadata|1|0|}51|42|}
{2010212001|XXGvertex_oport_oport|65|0|116|0|{9|error1|}42|52|}
{2010006001|XXGobject_psameas_object|66|0|118|0|{metadata|error1_metadata|1|0|}52|42|}
{2010212001|XXGvertex_oport_oport|67|0|119|0|{10|error2|}42|53|}
{2010006001|XXGobject_psameas_object|68|0|121|0|{metadata|error2_metadata|1|0|}53|42|}
{2010212001|XXGvertex_oport_oport|69|0|122|0|{11|error3|}42|54|}
{2010006001|XXGobject_psameas_object|70|0|124|0|{metadata|error3_metadata|1|0|}54|42|}
{2010212001|XXGvertex_oport_oport|71|0|125|0|{12|log|}42|55|}
{2010006001|XXGobject_psameas_object|72|0|127|0|{metadata|log_metadata|1|0|}55|42|}
{2010211001|XXGvertex_iport_iport|73|0|128|0|{0|in|}42|56|}
{2010006001|XXGobject_psameas_object|74|0|130|0|{metadata|in_metadata|1|0|}56|42|}
{2010006001|XXGobject_psameas_object|75|0|131|0|{Layout|Layout|0|0|}27|57|}
{2010212001|XXGvertex_oport_oport|76|0|133|0|{0|out0|}57|58|}
{2010212001|XXGvertex_oport_oport|77|0|135|0|{1|reject0|}57|59|}
{2010212001|XXGvertex_oport_oport|78|0|137|0|{2|error0|}57|60|}
{2010212001|XXGvertex_oport_oport|79|0|139|0|{3|log|}57|61|}
{2010211001|XXGvertex_iport_iport|80|0|141|0|{0|in|}57|62|}
{2010007001|XXGobject_proto_object|81|0|143|0|{}57|63|}
{2010212001|XXGvertex_oport_oport|82|0|145|0|{0|out0|}63|64|}
{2010006001|XXGobject_psameas_object|83|0|147|0|{metadata|out0_metadata|1|0|}64|63|}
{2010006001|XXGobject_psameas_object|84|0|148|0|{transform0|transform0|1|0|}64|63|}
{2010212001|XXGvertex_oport_oport|85|0|149|0|{1|reject0|}63|65|}
{2010006001|XXGobject_psameas_object|86|0|151|0|{metadata|reject0_metadata|1|0|}65|63|}
{2010212001|XXGvertex_oport_oport|87|0|152|0|{2|error0|}63|66|}
{2010006001|XXGobject_psameas_object|88|0|154|0|{metadata|error0_metadata|1|0|}66|63|}
{2010212001|XXGvertex_oport_oport|89|0|155|0|{3|log|}63|67|}
{2010006001|XXGobject_psameas_object|90|0|157|0|{metadata|log_metadata|1|0|}67|63|}
{2010211001|XXGvertex_iport_iport|91|0|158|0|{0|in|}63|68|}
{2010006001|XXGobject_psameas_object|92|0|160|0|{metadata|in_metadata|1|0|}68|63|}
{2010006001|XXGobject_psameas_object|93|0|161|0|{in_metadata|out1_metadata|0|0|}57|27|}
{2010006001|XXGobject_psameas_object|94|0|162|0|{reject0_metadata|out1_metadata|0|0|}57|27|}
{2010006001|XXGobject_psameas_object|95|0|163|0|{in_metadata|out0_metadata|0|0|}27|69|}
{2010212001|XXGvertex_oport_oport|96|0|165|0|{0|out0|}69|70|}
{2010213001|XXGoport_dst_flow|97|0|167|0|{0|}70|71|}
{2010212001|XXGvertex_oport_oport|98|0|169|0|{1|reject0|}69|72|}
{2010212001|XXGvertex_oport_oport|99|0|171|0|{2|error0|}69|73|}
{2010212001|XXGvertex_oport_oport|100|0|173|0|{3|log|}69|74|}
{2010211001|XXGvertex_iport_iport|101|0|175|0|{0|in|}69|75|}
{2010214001|XXGiport_src_flow|102|0|177|0|{0|}75|76|}
{2010007001|XXGobject_proto_object|103|0|179|0|{}69|77|}
{2010212001|XXGvertex_oport_oport|104|0|181|0|{0|out0|}77|78|}
{2010006001|XXGobject_psameas_object|105|0|183|0|{metadata|out0_metadata|1|0|}78|77|}
{2010006001|XXGobject_psameas_object|106|0|184|0|{transform0|transform0|1|0|}78|77|}
{2010212001|XXGvertex_oport_oport|107|0|185|0|{1|reject0|}77|79|}
{2010006001|XXGobject_psameas_object|108|0|187|0|{metadata|reject0_metadata|1|0|}79|77|}
{2010212001|XXGvertex_oport_oport|109|0|188|0|{2|error0|}77|80|}
{2010006001|XXGobject_psameas_object|110|0|190|0|{metadata|error0_metadata|1|0|}80|77|}
{2010212001|XXGvertex_oport_oport|111|0|191|0|{3|log|}77|81|}
{2010006001|XXGobject_psameas_object|112|0|193|0|{metadata|log_metadata|1|0|}81|77|}
{2010211001|XXGvertex_iport_iport|113|0|194|0|{0|in|}77|82|}
{2010006001|XXGobject_psameas_object|114|0|196|0|{metadata|in_metadata|1|0|}82|77|}
{2010006001|XXGobject_psameas_object|115|0|197|0|{Layout|Layout|0|0|}69|57|}
{2010006001|XXGobject_psameas_object|116|0|198|0|{reject0_metadata|in_metadata|0|0|}69|69|}
{2010006001|XXGobject_psameas_object|117|0|199|0|{reject0_metadata|out0_metadata|0|0|}27|69|}
{2010006001|XXGobject_psameas_object|118|0|200|0|{reject1_metadata|out0_metadata|0|0|}27|69|}
{2010006001|XXGobject_psameas_object|119|0|201|0|{reject2_metadata|out0_metadata|0|0|}27|69|}
{2010006001|XXGobject_psameas_object|120|0|202|0|{reject3_metadata|out0_metadata|0|0|}27|69|}
{2010601001|XXGgraph_vertex_vertex|121|0|203|0|{Trash|}21|83|}
{2010211001|XXGvertex_iport_iport|122|0|205|0|{0|in|}83|84|}
{2010214001|XXGiport_src_flow|123|0|207|0|{0|}84|26|}
{2010007001|XXGobject_proto_object|124|0|208|0|{}83|85|}
{2010211001|XXGvertex_iport_iport|125|0|210|0|{0|in|}85|86|}
{2010006001|XXGobject_psameas_object|126|0|212|0|{metadata|in_metadata|1|0|}86|85|}
{2010006001|XXGobject_psameas_object|127|0|213|0|{Layout|Layout|0|0|}83|57|}
{2010006001|XXGobject_psameas_object|128|0|214|0|{in_metadata|out0_metadata|0|0|}83|27|}
{2010212001|XXGvertex_oport_oport|129|0|215|0|{0|out0|}21|87|}
{2010216002|XXGoport_binding_oport|130|0|217|0|{.5|.5|{0|}10592|}87|30|}
{2010213001|XXGoport_dst_flow|131|0|218|0|{0|}87|18|}
{2010212001|XXGvertex_oport_oport|132|0|219|0|{1|out1|}21|88|}
{2010216002|XXGoport_binding_oport|133|0|221|0|{.5|.5|{0|}10593|}88|29|}
{2010213001|XXGoport_dst_flow|134|0|222|0|{0|}88|13|}
{2010212001|XXGvertex_oport_oport|135|0|223|0|{2|out2|}21|89|}
{2010216002|XXGoport_binding_oport|136|0|225|0|{.5|.5|{0|}10594|}89|31|}
{2010213001|XXGoport_dst_flow|137|0|226|0|{0|}89|11|}
{2010211001|XXGvertex_iport_iport|138|0|227|0|{0|in1|}21|90|}
{2010215002|XXGiport_binding_iport|139|0|229|0|{.5|.5|{0|}10591|}90|41|}
{2010214001|XXGiport_src_flow|140|0|230|0|{0|}90|15|}
{2010601001|XXGgraph_vertex_vertex|141|0|231|0|{Duplicates|}1|91|}
{2010211001|XXGvertex_iport_iport|142|0|233|0|{0|write|}91|92|}
{2010214001|XXGiport_src_flow|143|0|235|0|{0|}92|10|}
{2010007001|XXGobject_proto_object|144|0|236|0|{}91|93|}
{2010211001|XXGvertex_iport_iport|145|0|238|0|{0|write|}93|94|}
{2010006001|XXGobject_psameas_object|146|0|240|0|{metadata|write_metadata|1|0|}94|93|}
{2010006001|XXGobject_psameas_object|147|0|241|0|{write_metadata|in_metadata|0|0|}91|69|}
{2010601001|XXGgraph_vertex_vertex|148|0|242|0|{Errors|}1|95|}
{2010211001|XXGvertex_iport_iport|149|0|244|0|{0|write|}95|96|}
{2010214001|XXGiport_src_flow|150|0|246|0|{0|}96|9|}
{2010007001|XXGobject_proto_object|151|0|247|0|{}95|97|}
{2010211001|XXGvertex_iport_iport|152|0|249|0|{0|write|}97|98|}
{2010006001|XXGobject_psameas_object|153|0|251|0|{metadata|write_metadata|1|0|}98|97|}
{2010601001|XXGgraph_vertex_vertex|154|0|252|0|{Generate_SK_for_insert_record|}1|99|}
{2010605001|XXGgraph_legend_legend|155|0|254|0|{0|}99|100|}
{2010241001|XXGlegend_face_face|156|0|256|0|{}100|101|}
{2010601001|XXGgraph_vertex_vertex|157|0|258|0|{RFMT_Assign_SK|}99|57|}
{2010212001|XXGvertex_oport_oport|158|0|259|0|{0|out0|}99|102|}
{2010216002|XXGoport_binding_oport|159|0|261|0|{.5|.5|{0|}11083|}102|58|}
{2010213001|XXGoport_dst_flow|160|0|262|0|{0|}102|20|}
{2010211001|XXGvertex_iport_iport|161|0|263|0|{0|in0|}99|103|}
{2010215002|XXGiport_binding_iport|162|0|265|0|{.5|.5|{0|}11082|}103|62|}
{2010214001|XXGiport_src_flow|163|0|266|0|{0|}103|13|}
{2010601001|XXGgraph_vertex_vertex|164|0|267|0|{Get_Count|}1|104|}
{2010605001|XXGgraph_legend_legend|165|0|269|0|{0|}104|105|}
{2010241001|XXGlegend_face_face|166|0|271|0|{}105|106|}
{2010605001|XXGgraph_legend_legend|167|0|273|0|{1|}104|107|}
{2010241001|XXGlegend_face_face|168|0|275|0|{}107|108|}
{2010604001|XXGgraph_flow_flow|169|0|277|0|{Flow_1|}104|109|}
{2010604001|XXGgraph_flow_flow|170|0|279|0|{Flow_2|}104|110|}
{2010604001|XXGgraph_flow_flow|171|0|281|0|{Flow_3|}104|111|}
{2010601001|XXGgraph_vertex_vertex|172|0|283|0|{Count_file|}104|112|}
{2010211001|XXGvertex_iport_iport|173|0|285|0|{0|write|}112|113|}
{2010214001|XXGiport_src_flow|174|0|287|0|{0|}113|110|}
{2010007001|XXGobject_proto_object|175|0|288|0|{}112|114|}
{2010211001|XXGvertex_iport_iport|176|0|290|0|{0|write|}114|115|}
{2010006001|XXGobject_psameas_object|177|0|292|0|{metadata|write_metadata|1|0|}115|114|}
{2010601001|XXGgraph_vertex_vertex|178|0|293|0|{Gather_1|}104|116|}
{2010212001|XXGvertex_oport_oport|179|0|295|0|{0|out|}116|117|}
{2010213001|XXGoport_dst_flow|180|0|297|0|{0|}117|109|}
{2010211001|XXGvertex_iport_iport|181|0|298|0|{0|in|}116|118|}
{2010007001|XXGobject_proto_object|182|0|300|0|{}116|119|}
{2010212001|XXGvertex_oport_oport|183|0|302|0|{0|out|}119|120|}
{2010006001|XXGobject_psameas_object|184|0|304|0|{metadata|out_metadata|1|0|}120|119|}
{2010211001|XXGvertex_iport_iport|185|0|305|0|{0|in|}119|121|}
{2010006001|XXGobject_psameas_object|186|0|307|0|{metadata|in_metadata|1|0|}121|119|}
{2010006001|XXGobject_psameas_object|187|0|308|0|{Layout|Layout|0|0|}116|112|}
{2010006001|XXGobject_psameas_object|188|0|309|0|{in_metadata|in_metadata|0|0|}116|122|}
{2010212001|XXGvertex_oport_oport|189|0|311|0|{0|log|}122|123|}
{2010213001|XXGoport_dst_flow|190|0|313|0|{0|}123|12|}
{2010211001|XXGvertex_iport_iport|191|0|314|0|{0|in|}122|124|}
{2010007001|XXGobject_proto_object|192|0|316|0|{}122|125|}
{2010212001|XXGvertex_oport_oport|193|0|318|0|{0|log|}125|126|}
{2010006001|XXGobject_psameas_object|194|0|320|0|{metadata|log_metadata|1|0|}126|125|}
{2010211001|XXGvertex_iport_iport|195|0|321|0|{0|in|}125|127|}
{2010006001|XXGobject_psameas_object|196|0|323|0|{metadata|in_metadata|1|0|}127|125|}
{2010006001|XXGobject_psameas_object|197|0|324|0|{Layout|Layout|0|0|}122|27|}
{2010006001|XXGobject_psameas_object|198|0|325|0|{log_metadata|in_metadata|0|0|}122|122|}
{2010006001|XXGobject_psameas_object|199|0|326|0|{out_metadata|in_metadata|0|0|}116|122|}
{2010601001|XXGgraph_vertex_vertex|200|0|327|0|{Normalize|}104|128|}
{2010212001|XXGvertex_oport_oport|201|0|329|0|{0|out|}128|129|}
{2010213001|XXGoport_dst_flow|202|0|331|0|{0|}129|111|}
{2010212001|XXGvertex_oport_oport|203|0|332|0|{1|reject|}128|130|}
{2010212001|XXGvertex_oport_oport|204|0|334|0|{2|error|}128|131|}
{2010212001|XXGvertex_oport_oport|205|0|336|0|{3|log|}128|132|}
{2010211001|XXGvertex_iport_iport|206|0|338|0|{0|in|}128|133|}
{2010214001|XXGiport_src_flow|207|0|340|0|{0|}133|109|}
{2010007001|XXGobject_proto_object|208|0|341|0|{}128|134|}
{2010212001|XXGvertex_oport_oport|209|0|343|0|{0|out|}134|135|}
{2010006001|XXGobject_psameas_object|210|0|345|0|{metadata|out_metadata|1|0|}135|134|}
{2010212001|XXGvertex_oport_oport|211|0|346|0|{1|reject|}134|136|}
{2010006001|XXGobject_psameas_object|212|0|348|0|{metadata|reject_metadata|1|0|}136|134|}
{2010212001|XXGvertex_oport_oport|213|0|349|0|{2|error|}134|137|}
{2010006001|XXGobject_psameas_object|214|0|351|0|{metadata|error_metadata|1|0|}137|134|}
{2010212001|XXGvertex_oport_oport|215|0|352|0|{3|log|}134|138|}
{2010006001|XXGobject_psameas_object|216|0|354|0|{metadata|log_metadata|1|0|}138|134|}
{2010211001|XXGvertex_iport_iport|217|0|355|0|{0|in|}134|139|}
{2010006001|XXGobject_psameas_object|218|0|357|0|{metadata|in_metadata|1|0|}139|134|}
{2010006001|XXGobject_psameas_object|219|0|358|0|{Layout|Layout|0|0|}128|112|}
{2010006001|XXGobject_psameas_object|220|0|359|0|{in_metadata|in_metadata|0|0|}128|122|}
{2010006001|XXGobject_psameas_object|221|0|360|0|{out_metadata|write_metadata|0|0|}128|112|}
{2010006001|XXGobject_psameas_object|222|0|361|0|{reject_metadata|in_metadata|0|0|}128|122|}
{2010601001|XXGgraph_vertex_vertex|223|0|362|0|{RollUp_Count_Serial|}104|140|}
{2010212001|XXGvertex_oport_oport|224|0|364|0|{0|out|}140|141|}
{2010213001|XXGoport_dst_flow|225|0|366|0|{0|}141|110|}
{2010212001|XXGvertex_oport_oport|226|0|367|0|{1|reject|}140|142|}
{2010212001|XXGvertex_oport_oport|227|0|369|0|{2|error|}140|143|}
{2010212001|XXGvertex_oport_oport|228|0|371|0|{3|log|}140|144|}
{2010211001|XXGvertex_iport_iport|229|0|373|0|{0|in|}140|145|}
{2010214001|XXGiport_src_flow|230|0|375|0|{0|}145|111|}
{2010007001|XXGobject_proto_object|231|0|376|0|{}140|146|}
{2010212001|XXGvertex_oport_oport|232|0|378|0|{0|out|}146|147|}
{2010006001|XXGobject_psameas_object|233|0|380|0|{metadata|out_metadata|1|0|}147|146|}
{2010212001|XXGvertex_oport_oport|234|0|381|0|{1|reject|}146|148|}
{2010006001|XXGobject_psameas_object|235|0|383|0|{metadata|reject_metadata|1|0|}148|146|}
{2010212001|XXGvertex_oport_oport|236|0|384|0|{2|error|}146|149|}
{2010006001|XXGobject_psameas_object|237|0|386|0|{metadata|error_metadata|1|0|}149|146|}
{2010212001|XXGvertex_oport_oport|238|0|387|0|{3|log|}146|150|}
{2010006001|XXGobject_psameas_object|239|0|389|0|{metadata|log_metadata|1|0|}150|146|}
{2010211001|XXGvertex_iport_iport|240|0|390|0|{0|in|}146|151|}
{2010006001|XXGobject_psameas_object|241|0|392|0|{metadata|in_metadata|1|0|}151|146|}
{2010006001|XXGobject_psameas_object|242|0|393|0|{Layout|Layout|0|0|}140|112|}
{2010006001|XXGobject_psameas_object|243|0|394|0|{in_metadata|write_metadata|0|0|}140|112|}
{2010006001|XXGobject_psameas_object|244|0|395|0|{out_metadata|write_metadata|0|0|}140|112|}
{2010006001|XXGobject_psameas_object|245|0|396|0|{reject_metadata|write_metadata|0|0|}140|112|}
{2010211001|XXGvertex_iport_iport|246|0|397|0|{0|in0|}104|152|}
{2010215002|XXGiport_binding_iport|247|0|399|0|{.5|.5|{0|}11808|}152|118|}
{2010214001|XXGiport_src_flow|248|0|400|0|{0|}152|12|}
{2010601001|XXGgraph_vertex_vertex|249|0|401|0|{Handle_Logs|}1|122|}
{2010601001|XXGgraph_vertex_vertex|250|0|402|0|{Invalid|}1|153|}
{2010211001|XXGvertex_iport_iport|251|0|404|0|{0|write|}153|154|}
{2010214001|XXGiport_src_flow|252|0|406|0|{0|}154|17|}
{2010007001|XXGobject_proto_object|253|0|407|0|{}153|155|}
{2010211001|XXGvertex_iport_iport|254|0|409|0|{0|write|}155|156|}
{2010006001|XXGobject_psameas_object|255|0|411|0|{metadata|write_metadata|1|0|}156|155|}
{2010006001|XXGobject_psameas_object|256|0|412|0|{write_metadata|out0_metadata|0|0|}153|157|}
{2010212001|XXGvertex_oport_oport|257|0|414|0|{0|out0|}157|158|}
{2010213001|XXGoport_dst_flow|258|0|416|0|{0|}158|159|}
{2010212001|XXGvertex_oport_oport|259|0|418|0|{1|reject0|}157|160|}
{2010212001|XXGvertex_oport_oport|260|0|420|0|{2|error0|}157|161|}
{2010212001|XXGvertex_oport_oport|261|0|422|0|{3|log|}157|162|}
{2010211001|XXGvertex_iport_iport|262|0|424|0|{0|in|}157|163|}
{2010214001|XXGiport_src_flow|263|0|426|0|{0|}163|164|}
{2010007001|XXGobject_proto_object|264|0|428|0|{}157|165|}
{2010212001|XXGvertex_oport_oport|265|0|430|0|{0|out0|}165|166|}
{2010006001|XXGobject_psameas_object|266|0|432|0|{metadata|out0_metadata|1|0|}166|165|}
{2010006001|XXGobject_psameas_object|267|0|433|0|{transform0|transform0|1|0|}166|165|}
{2010212001|XXGvertex_oport_oport|268|0|434|0|{1|reject0|}165|167|}
{2010006001|XXGobject_psameas_object|269|0|436|0|{metadata|reject0_metadata|1|0|}167|165|}
{2010212001|XXGvertex_oport_oport|270|0|437|0|{2|error0|}165|168|}
{2010006001|XXGobject_psameas_object|271|0|439|0|{metadata|error0_metadata|1|0|}168|165|}
{2010212001|XXGvertex_oport_oport|272|0|440|0|{3|log|}165|169|}
{2010006001|XXGobject_psameas_object|273|0|442|0|{metadata|log_metadata|1|0|}169|165|}
{2010211001|XXGvertex_iport_iport|274|0|443|0|{0|in|}165|170|}
{2010006001|XXGobject_psameas_object|275|0|445|0|{metadata|in_metadata|1|0|}170|165|}
{2010006001|XXGobject_psameas_object|276|0|446|0|{Layout|Layout|0|0|}157|171|}
{2010212001|XXGvertex_oport_oport|277|0|448|0|{0|out|}171|172|}
{2010212001|XXGvertex_oport_oport|278|0|450|0|{1|filereject|}171|173|}
{2010212001|XXGvertex_oport_oport|279|0|452|0|{2|fileerror|}171|174|}
{2010212001|XXGvertex_oport_oport|280|0|454|0|{3|reject|}171|175|}
{2010212001|XXGvertex_oport_oport|281|0|456|0|{4|error|}171|176|}
{2010212001|XXGvertex_oport_oport|282|0|458|0|{5|log|}171|177|}
{2010211001|XXGvertex_iport_iport|283|0|460|0|{0|in|}171|178|}
{2010214001|XXGiport_src_flow|284|0|462|0|{0|}178|179|}
{2010244001|XXGflow_watcher_watcher|285|0|464|0|{}179|180|}
{2010007001|XXGobject_proto_object|286|0|466|0|{}171|181|}
{2010212001|XXGvertex_oport_oport|287|0|468|0|{0|out|}181|182|}
{2010006001|XXGobject_psameas_object|288|0|470|0|{metadata|out_metadata|1|0|}182|181|}
{2010212001|XXGvertex_oport_oport|289|0|471|0|{1|filereject|}181|183|}
{2010006001|XXGobject_psameas_object|290|0|473|0|{metadata|filereject_metadata|1|0|}183|181|}
{2010212001|XXGvertex_oport_oport|291|0|474|0|{2|fileerror|}181|184|}
{2010006001|XXGobject_psameas_object|292|0|476|0|{metadata|fileerror_metadata|1|0|}184|181|}
{2010212001|XXGvertex_oport_oport|293|0|477|0|{3|reject|}181|185|}
{2010006001|XXGobject_psameas_object|294|0|479|0|{metadata|reject_metadata|1|0|}185|181|}
{2010212001|XXGvertex_oport_oport|295|0|480|0|{4|error|}181|186|}
{2010006001|XXGobject_psameas_object|296|0|482|0|{metadata|error_metadata|1|0|}186|181|}
{2010212001|XXGvertex_oport_oport|297|0|483|0|{5|log|}181|187|}
{2010006001|XXGobject_psameas_object|298|0|485|0|{metadata|log_metadata|1|0|}187|181|}
{2010211001|XXGvertex_iport_iport|299|0|486|0|{0|in|}181|188|}
{2010006001|XXGobject_psameas_object|300|0|488|0|{metadata|in_metadata|1|0|}188|181|}
{2010006001|XXGobject_psameas_object|301|0|489|0|{filereject_metadata|out_metadata|0|0|}171|189|}
{2010212001|XXGvertex_oport_oport|302|0|491|0|{0|out|}189|190|}
{2010213001|XXGoport_dst_flow|303|0|493|0|{0|}190|179|}
{2010212001|XXGvertex_oport_oport|304|0|494|0|{1|error|}189|191|}
{2010212001|XXGvertex_oport_oport|305|0|496|0|{2|log|}189|192|}
{2010007001|XXGobject_proto_object|306|0|498|0|{}189|193|}
{2010212001|XXGvertex_oport_oport|307|0|500|0|{0|out|}193|194|}
{2010006001|XXGobject_psameas_object|308|0|502|0|{metadata|out_metadata|1|0|}194|193|}
{2010212001|XXGvertex_oport_oport|309|0|503|0|{1|error|}193|195|}
{2010006001|XXGobject_psameas_object|310|0|505|0|{metadata|error_metadata|1|0|}195|193|}
{2010212001|XXGvertex_oport_oport|311|0|506|0|{2|log|}193|196|}
{2010006001|XXGobject_psameas_object|312|0|508|0|{metadata|log_metadata|1|0|}196|193|}
{2010006001|XXGobject_psameas_object|313|0|509|0|{Layout|Layout|0|0|}189|171|}
{2010006001|XXGobject_psameas_object|314|0|510|0|{in_metadata|out_metadata|0|0|}171|189|}
{2010006001|XXGobject_psameas_object|315|0|511|0|{in_metadata|out_metadata|0|0|}157|171|}
{2010006001|XXGobject_psameas_object|316|0|512|0|{reject0_metadata|out_metadata|0|0|}157|171|}
{2010601001|XXGgraph_vertex_vertex|317|0|513|0|{LookUp_and_CDC_on_HASH_Keys|}1|197|}
{2010605001|XXGgraph_legend_legend|318|0|515|0|{0|}197|198|}
{2010241001|XXGlegend_face_face|319|0|517|0|{}198|199|}
{2010604001|XXGgraph_flow_flow|320|0|519|0|{Flow_1|}197|200|}
{2010604001|XXGgraph_flow_flow|321|0|521|0|{Flow_2|}197|201|}
{2010604001|XXGgraph_flow_flow|322|0|523|0|{Flow_3|}197|76|}
{2010604001|XXGgraph_flow_flow|323|0|524|0|{Flow_4|}197|71|}
{2010604001|XXGgraph_flow_flow|324|0|525|0|{Flow_5|}197|202|}
{2010601001|XXGgraph_vertex_vertex|325|0|527|0|{Dedup_On_Hash_of_Target_NK|}197|203|}
{2010605001|XXGgraph_legend_legend|326|0|529|0|{0|}203|204|}
{2010241001|XXGlegend_face_face|327|0|531|0|{}204|205|}
{2010604001|XXGgraph_flow_flow|328|0|533|0|{Flow_3|}203|206|}
{2010244001|XXGflow_watcher_watcher|329|0|535|0|{}206|207|}
{2010601001|XXGgraph_vertex_vertex|330|0|537|0|{Dedup_Sorted|}203|208|}
{2010212001|XXGvertex_oport_oport|331|0|539|0|{0|out|}208|209|}
{2010212001|XXGvertex_oport_oport|332|0|541|0|{1|dup|}208|210|}
{2010212001|XXGvertex_oport_oport|333|0|543|0|{2|reject|}208|211|}
{2010212001|XXGvertex_oport_oport|334|0|545|0|{3|error|}208|212|}
{2010212001|XXGvertex_oport_oport|335|0|547|0|{4|log|}208|213|}
{2010211001|XXGvertex_iport_iport|336|0|549|0|{0|in|}208|214|}
{2010214001|XXGiport_src_flow|337|0|551|0|{0|}214|206|}
{2010007001|XXGobject_proto_object|338|0|552|0|{}208|215|}
{2010212001|XXGvertex_oport_oport|339|0|554|0|{0|out|}215|216|}
{2010006001|XXGobject_psameas_object|340|0|556|0|{metadata|out_metadata|1|0|}216|215|}
{2010212001|XXGvertex_oport_oport|341|0|557|0|{1|dup|}215|217|}
{2010006001|XXGobject_psameas_object|342|0|559|0|{metadata|dup_metadata|1|0|}217|215|}
{2010212001|XXGvertex_oport_oport|343|0|560|0|{2|reject|}215|218|}
{2010006001|XXGobject_psameas_object|344|0|562|0|{metadata|reject_metadata|1|0|}218|215|}
{2010212001|XXGvertex_oport_oport|345|0|563|0|{3|error|}215|219|}
{2010006001|XXGobject_psameas_object|346|0|565|0|{metadata|error_metadata|1|0|}219|215|}
{2010212001|XXGvertex_oport_oport|347|0|566|0|{4|log|}215|220|}
{2010006001|XXGobject_psameas_object|348|0|568|0|{metadata|log_metadata|1|0|}220|215|}
{2010211001|XXGvertex_iport_iport|349|0|569|0|{0|in|}215|221|}
{2010006001|XXGobject_psameas_object|350|0|571|0|{metadata|in_metadata|1|0|}221|215|}
{2010006001|XXGobject_psameas_object|351|0|572|0|{Layout|Layout|0|0|}208|91|}
{2010006001|XXGobject_psameas_object|352|0|573|0|{dup_metadata|in_metadata|0|0|}208|69|}
{2010006001|XXGobject_psameas_object|353|0|574|0|{in_metadata|in_metadata|0|0|}208|69|}
{2010006001|XXGobject_psameas_object|354|0|575|0|{out_metadata|in_metadata|0|0|}208|69|}
{2010006001|XXGobject_psameas_object|355|0|576|0|{reject_metadata|in_metadata|0|0|}208|69|}
{2010601001|XXGgraph_vertex_vertex|356|0|577|0|{Sort_within_Groups|}203|222|}
{2010212001|XXGvertex_oport_oport|357|0|579|0|{0|out|}222|223|}
{2010213001|XXGoport_dst_flow|358|0|581|0|{0|}223|206|}
{2010211001|XXGvertex_iport_iport|359|0|582|0|{0|in|}222|224|}
{2010007001|XXGobject_proto_object|360|0|584|0|{}222|225|}
{2010212001|XXGvertex_oport_oport|361|0|586|0|{0|out|}225|226|}
{2010006001|XXGobject_psameas_object|362|0|588|0|{metadata|out_metadata|1|0|}226|225|}
{2010211001|XXGvertex_iport_iport|363|0|589|0|{0|in|}225|227|}
{2010006001|XXGobject_psameas_object|364|0|591|0|{metadata|in_metadata|1|0|}227|225|}
{2010006001|XXGobject_psameas_object|365|0|592|0|{Layout|Layout|0|0|}222|91|}
{2010006001|XXGobject_psameas_object|366|0|593|0|{in_metadata|out0_metadata|0|0|}222|228|}
{2010212001|XXGvertex_oport_oport|367|0|595|0|{0|out0|}228|229|}
{2010213001|XXGoport_dst_flow|368|0|597|0|{0|}229|200|}
{2010212001|XXGvertex_oport_oport|369|0|598|0|{1|reject0|}228|230|}
{2010212001|XXGvertex_oport_oport|370|0|600|0|{2|error0|}228|231|}
{2010212001|XXGvertex_oport_oport|371|0|602|0|{3|log|}228|232|}
{2010211001|XXGvertex_iport_iport|372|0|604|0|{0|in|}228|233|}
{2010214001|XXGiport_src_flow|373|0|606|0|{0|}233|202|}
{2010007001|XXGobject_proto_object|374|0|607|0|{}228|234|}
{2010212001|XXGvertex_oport_oport|375|0|609|0|{0|out0|}234|235|}
{2010006001|XXGobject_psameas_object|376|0|611|0|{metadata|out0_metadata|1|0|}235|234|}
{2010006001|XXGobject_psameas_object|377|0|612|0|{transform0|transform0|1|0|}235|234|}
{2010212001|XXGvertex_oport_oport|378|0|613|0|{1|reject0|}234|236|}
{2010006001|XXGobject_psameas_object|379|0|615|0|{metadata|reject0_metadata|1|0|}236|234|}
{2010212001|XXGvertex_oport_oport|380|0|616|0|{2|error0|}234|237|}
{2010006001|XXGobject_psameas_object|381|0|618|0|{metadata|error0_metadata|1|0|}237|234|}
{2010212001|XXGvertex_oport_oport|382|0|619|0|{3|log|}234|238|}
{2010006001|XXGobject_psameas_object|383|0|621|0|{metadata|log_metadata|1|0|}238|234|}
{2010211001|XXGvertex_iport_iport|384|0|622|0|{0|in|}234|239|}
{2010006001|XXGobject_psameas_object|385|0|624|0|{metadata|in_metadata|1|0|}239|234|}
{2010006001|XXGobject_psameas_object|386|0|625|0|{Layout|Layout|0|0|}228|171|}
{2010006001|XXGobject_psameas_object|387|0|626|0|{in_metadata|out0_metadata|0|0|}228|240|}
{2010212001|XXGvertex_oport_oport|388|0|628|0|{0|out0|}240|241|}
{2010213001|XXGoport_dst_flow|389|0|630|0|{0|}241|202|}
{2010212001|XXGvertex_oport_oport|390|0|631|0|{1|reject0|}240|242|}
{2010212001|XXGvertex_oport_oport|391|0|633|0|{2|error0|}240|243|}
{2010212001|XXGvertex_oport_oport|392|0|635|0|{3|log|}240|244|}
{2010211001|XXGvertex_iport_iport|393|0|637|0|{0|in|}240|245|}
{2010007001|XXGobject_proto_object|394|0|639|0|{}240|246|}
{2010212001|XXGvertex_oport_oport|395|0|641|0|{0|out0|}246|247|}
{2010006001|XXGobject_psameas_object|396|0|643|0|{metadata|out0_metadata|1|0|}247|246|}
{2010006001|XXGobject_psameas_object|397|0|644|0|{transform0|transform0|1|0|}247|246|}
{2010212001|XXGvertex_oport_oport|398|0|645|0|{1|reject0|}246|248|}
{2010006001|XXGobject_psameas_object|399|0|647|0|{metadata|reject0_metadata|1|0|}248|246|}
{2010212001|XXGvertex_oport_oport|400|0|648|0|{2|error0|}246|249|}
{2010006001|XXGobject_psameas_object|401|0|650|0|{metadata|error0_metadata|1|0|}249|246|}
{2010212001|XXGvertex_oport_oport|402|0|651|0|{3|log|}246|250|}
{2010006001|XXGobject_psameas_object|403|0|653|0|{metadata|log_metadata|1|0|}250|246|}
{2010211001|XXGvertex_iport_iport|404|0|654|0|{0|in|}246|251|}
{2010006001|XXGobject_psameas_object|405|0|656|0|{metadata|in_metadata|1|0|}251|246|}
{2010006001|XXGobject_psameas_object|406|0|657|0|{Layout|Layout|0|0|}240|171|}
{2010006001|XXGobject_psameas_object|407|0|658|0|{in_metadata|out0_metadata|0|0|}240|157|}
{2010006001|XXGobject_psameas_object|408|0|659|0|{reject0_metadata|out0_metadata|0|0|}240|157|}
{2010006001|XXGobject_psameas_object|409|0|660|0|{reject0_metadata|out0_metadata|0|0|}228|240|}
{2010006001|XXGobject_psameas_object|410|0|661|0|{out_metadata|in_metadata|0|0|}222|69|}
{2010212001|XXGvertex_oport_oport|411|0|662|0|{0|out0|}203|252|}
{2010216002|XXGoport_binding_oport|412|0|664|0|{.5|.5|{0|}12040|}252|209|}
{2010213001|XXGoport_dst_flow|413|0|665|0|{0|}252|76|}
{2010212001|XXGvertex_oport_oport|414|0|666|0|{1|out1|}203|253|}
{2010216002|XXGoport_binding_oport|415|0|668|0|{.5|.5|{0|}12041|}253|210|}
{2010211001|XXGvertex_iport_iport|416|0|669|0|{0|in0|}203|254|}
{2010215002|XXGiport_binding_iport|417|0|671|0|{.5|.5|{0|}12039|}254|224|}
{2010214001|XXGiport_src_flow|418|0|672|0|{0|}254|201|}
{2010601001|XXGgraph_vertex_vertex|419|0|673|0|{PBKS_ICFF_KEY_|}197|255|}
{2010604001|XXGgraph_flow_flow|420|0|675|0|{Flow_1|}255|256|}
{2010601001|XXGgraph_vertex_vertex|421|0|677|0|{Partition_by_Key|}255|257|}
{2010212001|XXGvertex_oport_oport|422|0|679|0|{0|out|}257|258|}
{2010213001|XXGoport_dst_flow|423|0|681|0|{0|}258|256|}
{2010211001|XXGvertex_iport_iport|424|0|682|0|{0|in|}257|259|}
{2010006001|XXGobject_psameas_object|425|0|684|0|{in_metadata|out0_metadata|0|0|}257|228|}
{2010006001|XXGobject_psameas_object|426|0|685|0|{out_metadata|out0_metadata|0|0|}257|228|}
{2010601001|XXGgraph_vertex_vertex|427|0|686|0|{Sort|}255|260|}
{2010212001|XXGvertex_oport_oport|428|0|688|0|{0|out|}260|261|}
{2010211001|XXGvertex_iport_iport|429|0|690|0|{0|in|}260|262|}
{2010214001|XXGiport_src_flow|430|0|692|0|{0|}262|256|}
{2010006001|XXGobject_psameas_object|431|0|693|0|{in_metadata|out0_metadata|0|0|}260|228|}
{2010006001|XXGobject_psameas_object|432|0|694|0|{out_metadata|out0_metadata|0|0|}260|228|}
{2010212001|XXGvertex_oport_oport|433|0|695|0|{0|out0|}255|263|}
{2010216002|XXGoport_binding_oport|434|0|697|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}263|261|}
{2010213001|XXGoport_dst_flow|435|0|698|0|{0|}263|201|}
{2010211001|XXGvertex_iport_iport|436|0|699|0|{0|in0|}255|264|}
{2010215002|XXGiport_binding_iport|437|0|701|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}264|259|}
{2010214001|XXGiport_src_flow|438|0|702|0|{0|}264|200|}
{2010007001|XXGobject_proto_object|439|0|703|0|{}255|265|}
{2010604001|XXGgraph_flow_flow|440|0|705|0|{Flow_1|}265|266|}
{2010601001|XXGgraph_vertex_vertex|441|0|707|0|{Partition_by_Key|}265|267|}
{2010212001|XXGvertex_oport_oport|442|0|709|0|{0|out|}267|268|}
{2010213001|XXGoport_dst_flow|443|0|711|0|{0|}268|266|}
{2010211001|XXGvertex_iport_iport|444|0|712|0|{0|in|}267|269|}
{2010007001|XXGobject_proto_object|445|0|714|0|{}267|270|}
{2010212001|XXGvertex_oport_oport|446|0|716|0|{0|out|}270|271|}
{2010006001|XXGobject_psameas_object|447|0|718|0|{metadata|out_metadata|1|0|}271|270|}
{2010211001|XXGvertex_iport_iport|448|0|719|0|{0|in|}270|272|}
{2010006001|XXGobject_psameas_object|449|0|721|0|{metadata|in_metadata|1|0|}272|270|}
{2010006001|XXGobject_psameas_object|450|0|722|0|{Layout|InputLayout|1|0|}267|265|}
{2010006001|XXGobject_psameas_object|451|0|723|0|{key|Key|1|0|}267|265|}
{2010601001|XXGgraph_vertex_vertex|452|0|724|0|{Sort|}265|273|}
{2010212001|XXGvertex_oport_oport|453|0|726|0|{0|out|}273|274|}
{2010211001|XXGvertex_iport_iport|454|0|728|0|{0|in|}273|275|}
{2010214001|XXGiport_src_flow|455|0|730|0|{0|}275|266|}
{2010007001|XXGobject_proto_object|456|0|731|0|{}273|276|}
{2010212001|XXGvertex_oport_oport|457|0|733|0|{0|out|}276|277|}
{2010006001|XXGobject_psameas_object|458|0|735|0|{metadata|out_metadata|1|0|}277|276|}
{2010211001|XXGvertex_iport_iport|459|0|736|0|{0|in|}276|278|}
{2010006001|XXGobject_psameas_object|460|0|738|0|{metadata|in_metadata|1|0|}278|276|}
{2010006001|XXGobject_psameas_object|461|0|739|0|{Layout|OutputLayout|1|0|}273|265|}
{2010006001|XXGobject_psameas_object|462|0|740|0|{key|Key|1|0|}273|265|}
{2010006001|XXGobject_psameas_object|463|0|741|0|{max_core|Max_core|1|0|}273|265|}
{2010212001|XXGvertex_oport_oport|464|0|742|0|{0|out0|}265|279|}
{2010216002|XXGoport_binding_oport|465|0|744|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}279|274|}
{2010211001|XXGvertex_iport_iport|466|0|745|0|{0|in0|}265|280|}
{2010215002|XXGiport_binding_iport|467|0|747|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}280|269|}
{2010006001|XXGobject_psameas_object|468|0|748|0|{InputLayout|Layout|0|0|}255|171|}
{2010006001|XXGobject_psameas_object|469|0|749|0|{OutputLayout|Layout|0|0|}255|91|}
{2010601001|XXGgraph_vertex_vertex|470|0|750|0|{RFMT_Get_Hash_and_src_env_rank|}197|228|}
{2010601001|XXGgraph_vertex_vertex|471|0|751|0|{RFMT_Map_to_IDS|}197|240|}
{2010601001|XXGgraph_vertex_vertex|472|0|752|0|{RFMT_Set_IDS_Audit_Fields|}197|281|}
{2010212001|XXGvertex_oport_oport|473|0|754|0|{0|out0|}281|282|}
{2010212001|XXGvertex_oport_oport|474|0|756|0|{1|reject0|}281|283|}
{2010212001|XXGvertex_oport_oport|475|0|758|0|{2|error0|}281|284|}
{2010212001|XXGvertex_oport_oport|476|0|760|0|{3|log|}281|285|}
{2010211001|XXGvertex_iport_iport|477|0|762|0|{0|in|}281|286|}
{2010214001|XXGiport_src_flow|478|0|764|0|{0|}286|71|}
{2010007001|XXGobject_proto_object|479|0|765|0|{}281|287|}
{2010212001|XXGvertex_oport_oport|480|0|767|0|{0|out0|}287|288|}
{2010006001|XXGobject_psameas_object|481|0|769|0|{metadata|out0_metadata|1|0|}288|287|}
{2010006001|XXGobject_psameas_object|482|0|770|0|{transform0|transform0|1|0|}288|287|}
{2010212001|XXGvertex_oport_oport|483|0|771|0|{1|reject0|}287|289|}
{2010006001|XXGobject_psameas_object|484|0|773|0|{metadata|reject0_metadata|1|0|}289|287|}
{2010212001|XXGvertex_oport_oport|485|0|774|0|{2|error0|}287|290|}
{2010006001|XXGobject_psameas_object|486|0|776|0|{metadata|error0_metadata|1|0|}290|287|}
{2010212001|XXGvertex_oport_oport|487|0|777|0|{3|log|}287|291|}
{2010006001|XXGobject_psameas_object|488|0|779|0|{metadata|log_metadata|1|0|}291|287|}
{2010211001|XXGvertex_iport_iport|489|0|780|0|{0|in|}287|292|}
{2010006001|XXGobject_psameas_object|490|0|782|0|{metadata|in_metadata|1|0|}292|287|}
{2010006001|XXGobject_psameas_object|491|0|783|0|{Layout|Layout|0|0|}281|57|}
{2010006001|XXGobject_psameas_object|492|0|784|0|{in_metadata|out0_metadata|0|0|}281|69|}
{2010006001|XXGobject_psameas_object|493|0|785|0|{out0_metadata|out0_metadata|0|0|}281|69|}
{2010006001|XXGobject_psameas_object|494|0|786|0|{reject0_metadata|out0_metadata|0|0|}281|69|}
{2010601001|XXGgraph_vertex_vertex|495|0|787|0|{RFMT_lookUp_IDS_CDC|}197|69|}
{2010212001|XXGvertex_oport_oport|496|0|788|0|{0|out1|}197|293|}
{2010216002|XXGoport_binding_oport|497|0|790|0|{.5|.5|{0|}12307|}293|253|}
{2010213001|XXGoport_dst_flow|498|0|791|0|{0|}293|10|}
{2010212001|XXGvertex_oport_oport|499|0|792|0|{1|out0|}197|294|}
{2010216002|XXGoport_binding_oport|500|0|794|0|{.5|.5|{0|}12308|}294|282|}
{2010213001|XXGoport_dst_flow|501|0|795|0|{0|}294|15|}
{2010211001|XXGvertex_iport_iport|502|0|796|0|{0|in0|}197|295|}
{2010215002|XXGiport_binding_iport|503|0|798|0|{.5|.5|{0|}12306|}295|245|}
{2010214001|XXGiport_src_flow|504|0|799|0|{0|}295|14|}
{2010601001|XXGgraph_vertex_vertex|505|0|800|0|{LookUps|}1|296|}
{2010605001|XXGgraph_legend_legend|506|0|802|0|{0|}296|297|}
{2010241001|XXGlegend_face_face|507|0|804|0|{}297|298|}
{2010605001|XXGgraph_legend_legend|508|0|806|0|{1|}296|299|}
{2010241001|XXGlegend_face_face|509|0|808|0|{}299|300|}
{2010605001|XXGgraph_legend_legend|510|0|810|0|{2|}296|301|}
{2010241001|XXGlegend_face_face|511|0|812|0|{}301|302|}
{2010601001|XXGgraph_vertex_vertex|512|0|814|0|{ICFF_TEMPLATE_IDS|}296|303|}
{2010007001|XXGobject_proto_object|513|0|816|0|{}303|304|}
{2010601001|XXGgraph_vertex_vertex|514|0|818|0|{ICFF_lookup_FILE_for_IDS|}296|305|}
{2010212001|XXGvertex_oport_oport|515|0|820|0|{0|read|}305|306|}
{2010007001|XXGobject_proto_object|516|0|822|0|{}305|307|}
{2010212001|XXGvertex_oport_oport|517|0|824|0|{0|read|}307|308|}
{2010006001|XXGobject_psameas_object|518|0|826|0|{metadata|read_metadata|1|0|}308|307|}
{2010601001|XXGgraph_vertex_vertex|519|0|827|0|{SRC_ENVRT_ID|}296|309|}
{2010007001|XXGobject_proto_object|520|0|829|0|{}309|310|}
{2010601001|XXGgraph_vertex_vertex|521|0|831|0|{Read_Split_or_Placeholder|}1|311|}
{2010605001|XXGgraph_legend_legend|522|0|833|0|{0|}311|312|}
{2010241001|XXGlegend_face_face|523|0|835|0|{}312|313|}
{2010604001|XXGgraph_flow_flow|524|0|837|0|{Flow_1|}311|164|}
{2010604001|XXGgraph_flow_flow|525|0|838|0|{Flow_2|}311|159|}
{2010604001|XXGgraph_flow_flow|526|0|839|0|{Flow_3|}311|314|}
{2010601001|XXGgraph_vertex_vertex|527|0|841|0|{Gather_Logs_Invalid|}311|315|}
{2010211001|XXGvertex_iport_iport|528|0|843|0|{0|in|}315|316|}
{2010214001|XXGiport_src_flow|529|0|845|0|{0|}316|314|}
{2010007001|XXGobject_proto_object|530|0|846|0|{}315|317|}
{2010211001|XXGvertex_iport_iport|531|0|848|0|{0|in|}317|318|}
{2010006001|XXGobject_psameas_object|532|0|850|0|{metadata|in_metadata|1|0|}318|317|}
{2010006001|XXGobject_psameas_object|533|0|851|0|{in_metadata|log_metadata|0|0|}315|319|}
{2010212001|XXGvertex_oport_oport|534|0|853|0|{0|out|}319|320|}
{2010212001|XXGvertex_oport_oport|535|0|855|0|{1|reject|}319|321|}
{2010212001|XXGvertex_oport_oport|536|0|857|0|{2|error|}319|322|}
{2010212001|XXGvertex_oport_oport|537|0|859|0|{3|log|}319|323|}
{2010213001|XXGoport_dst_flow|538|0|861|0|{0|}323|314|}
{2010211001|XXGvertex_iport_iport|539|0|862|0|{0|in|}319|324|}
{2010214001|XXGiport_src_flow|540|0|864|0|{0|}324|159|}
{2010007001|XXGobject_proto_object|541|0|865|0|{}319|325|}
{2010212001|XXGvertex_oport_oport|542|0|867|0|{0|out|}325|326|}
{2010006001|XXGobject_psameas_object|543|0|869|0|{metadata|out_metadata|1|0|}326|325|}
{2010212001|XXGvertex_oport_oport|544|0|870|0|{1|reject|}325|327|}
{2010006001|XXGobject_psameas_object|545|0|872|0|{metadata|reject_metadata|1|0|}327|325|}
{2010212001|XXGvertex_oport_oport|546|0|873|0|{2|error|}325|328|}
{2010006001|XXGobject_psameas_object|547|0|875|0|{metadata|error_metadata|1|0|}328|325|}
{2010212001|XXGvertex_oport_oport|548|0|876|0|{3|log|}325|329|}
{2010006001|XXGobject_psameas_object|549|0|878|0|{metadata|log_metadata|1|0|}329|325|}
{2010211001|XXGvertex_iport_iport|550|0|879|0|{0|in|}325|330|}
{2010006001|XXGobject_psameas_object|551|0|881|0|{metadata|in_metadata|1|0|}330|325|}
{2010006001|XXGobject_psameas_object|552|0|882|0|{Layout|Layout|0|0|}319|171|}
{2010006001|XXGobject_psameas_object|553|0|883|0|{in_metadata|out0_metadata|0|0|}319|157|}
{2010006001|XXGobject_psameas_object|554|0|884|0|{out_metadata|out0_metadata|0|0|}319|157|}
{2010006001|XXGobject_psameas_object|555|0|885|0|{reject_metadata|out0_metadata|0|0|}319|157|}
{2010601001|XXGgraph_vertex_vertex|556|0|886|0|{RFMT_Re_Construct_for_Placeholder|}311|157|}
{2010601001|XXGgraph_vertex_vertex|557|0|887|0|{RFMT_Validate_Records|}311|319|}
{2010601001|XXGgraph_vertex_vertex|558|0|888|0|{Read_Splits|}311|331|}
{2010604001|XXGgraph_flow_flow|559|0|890|0|{Flow_6|}331|179|}
{2010604001|XXGgraph_flow_flow|560|0|891|0|{Flow_7|}331|332|}
{2010601001|XXGgraph_vertex_vertex|561|0|893|0|{Find_All_Splits|}331|189|}
{2010601001|XXGgraph_vertex_vertex|562|0|894|0|{For_View_Data|}331|333|}
{2010212001|XXGvertex_oport_oport|563|0|896|0|{0|read|}333|334|}
{2010213001|XXGoport_dst_flow|564|0|898|0|{0|}334|332|}
{2010007001|XXGobject_proto_object|565|0|899|0|{}333|335|}
{2010212001|XXGvertex_oport_oport|566|0|901|0|{0|read|}335|336|}
{2010006001|XXGobject_psameas_object|567|0|903|0|{metadata|read_metadata|1|0|}336|335|}
{2010601001|XXGgraph_vertex_vertex|568|0|904|0|{Read_Multiple_Splits|}331|171|}
{2010601001|XXGgraph_vertex_vertex|569|0|905|0|{Trash|}331|337|}
{2010211001|XXGvertex_iport_iport|570|0|907|0|{0|in|}337|338|}
{2010214001|XXGiport_src_flow|571|0|909|0|{0|}338|332|}
{2010007001|XXGobject_proto_object|572|0|910|0|{}337|339|}
{2010211001|XXGvertex_iport_iport|573|0|912|0|{0|in|}339|340|}
{2010006001|XXGobject_psameas_object|574|0|914|0|{metadata|in_metadata|1|0|}340|339|}
{2010006001|XXGobject_psameas_object|575|0|915|0|{in_metadata|read_metadata|0|0|}337|333|}
{2010212001|XXGvertex_oport_oport|576|0|916|0|{0|out0|}331|341|}
{2010216002|XXGoport_binding_oport|577|0|918|0|{.5|.5|{12|399000|129000|419000|129000|504000|129000|504000|199000|590000|199000|610000|199000|}121|}341|172|}
{2010213001|XXGoport_dst_flow|578|0|919|0|{0|}341|164|}
{2010212001|XXGvertex_oport_oport|579|0|920|0|{0|out0|}311|342|}
{2010216002|XXGoport_binding_oport|580|0|922|0|{.5|.5|{6|747000|269000|767000|269000|787000|269000|}5655|}342|320|}
{2010213001|XXGoport_dst_flow|581|0|923|0|{0|}342|14|}
{2010212001|XXGvertex_oport_oport|582|0|924|0|{1|error|}311|343|}
{2010216002|XXGoport_binding_oport|583|0|926|0|{1.0|.5|{12|674000|322000|674000|342000|674000|498000|594000|498000|594000|498000|594000|518000|}5656|}343|322|}
{2010213001|XXGoport_dst_flow|584|0|927|0|{0|}343|9|}
{2010212001|XXGvertex_oport_oport|585|0|928|0|{2|out1|}311|344|}
{2010216002|XXGoport_binding_oport|586|0|930|0|{.5|.5|{0|}5657|}344|321|}
{2010213001|XXGoport_dst_flow|587|0|931|0|{0|}344|17|}
{2010601001|XXGgraph_vertex_vertex|588|0|932|0|{Replicate|}1|345|}
{2010212001|XXGvertex_oport_oport|589|0|934|0|{0|out|}345|346|}
{2010213001|XXGoport_dst_flow|590|0|936|0|{0|}346|19|}
{2010213001|XXGoport_dst_flow|591|0|937|0|{1|}346|16|}
{2010211001|XXGvertex_iport_iport|592|0|938|0|{0|in|}345|347|}
{2010214001|XXGiport_src_flow|593|0|940|0|{0|}347|20|}
{2010007001|XXGobject_proto_object|594|0|941|0|{}345|348|}
{2010212001|XXGvertex_oport_oport|595|0|943|0|{0|out|}348|349|}
{2010006001|XXGobject_psameas_object|596|0|945|0|{metadata|out_metadata|1|0|}349|348|}
{2010211001|XXGvertex_iport_iport|597|0|946|0|{0|in|}348|350|}
{2010006001|XXGobject_psameas_object|598|0|948|0|{metadata|in_metadata|1|0|}350|348|}
{2010006001|XXGobject_psameas_object|599|0|949|0|{Layout|Layout|0|0|}345|351|}
{2010212001|XXGvertex_oport_oport|600|0|951|0|{0|read|}351|352|}
{2010213001|XXGoport_dst_flow|601|0|953|0|{0|}352|353|}
{2010211001|XXGvertex_iport_iport|602|0|955|0|{0|write|}351|354|}
{2010214001|XXGiport_src_flow|603|0|957|0|{0|}354|355|}
{2010007001|XXGobject_proto_object|604|0|959|0|{}351|356|}
{2010212001|XXGvertex_oport_oport|605|0|961|0|{0|read|}356|357|}
{2010006001|XXGobject_psameas_object|606|0|963|0|{metadata|read_metadata|1|0|}357|356|}
{2010211001|XXGvertex_iport_iport|607|0|964|0|{0|write|}356|358|}
{2010006001|XXGobject_psameas_object|608|0|966|0|{metadata|write_metadata|1|0|}358|356|}
{2010006001|XXGobject_psameas_object|609|0|967|0|{in_metadata|out0_metadata|0|0|}345|57|}
{2010006001|XXGobject_psameas_object|610|0|968|0|{out_metadata|out0_metadata|0|0|}345|57|}
{2010601001|XXGgraph_vertex_vertex|611|0|969|0|{Supressed_Updates|}1|359|}
{2010211001|XXGvertex_iport_iport|612|0|971|0|{0|write|}359|360|}
{2010214001|XXGiport_src_flow|613|0|973|0|{0|}360|11|}
{2010007001|XXGobject_proto_object|614|0|974|0|{}359|361|}
{2010211001|XXGvertex_iport_iport|615|0|976|0|{0|write|}361|362|}
{2010006001|XXGobject_psameas_object|616|0|978|0|{metadata|write_metadata|1|0|}362|361|}
{2010601001|XXGgraph_vertex_vertex|617|0|979|0|{Update_Max_SK|}1|363|}
{2010605001|XXGgraph_legend_legend|618|0|981|0|{0|}363|364|}
{2010241001|XXGlegend_face_face|619|0|983|0|{}364|365|}
{2010604001|XXGgraph_flow_flow|620|0|985|0|{Flow_2|}363|366|}
{2010604001|XXGgraph_flow_flow|621|0|987|0|{Flow_3|}363|367|}
{2010604001|XXGgraph_flow_flow|622|0|989|0|{Flow_4|}363|368|}
{2010604001|XXGgraph_flow_flow|623|0|991|0|{Flow_5|}363|369|}
{2010604001|XXGgraph_flow_flow|624|0|993|0|{Flow_6|}363|370|}
{2010601001|XXGgraph_vertex_vertex|625|0|995|0|{Create_Data|}363|371|}
{2010212001|XXGvertex_oport_oport|626|0|997|0|{0|out|}371|372|}
{2010213001|XXGoport_dst_flow|627|0|999|0|{0|}372|369|}
{2010212001|XXGvertex_oport_oport|628|0|1000|0|{1|error|}371|373|}
{2010212001|XXGvertex_oport_oport|629|0|1002|0|{2|log|}371|374|}
{2010007001|XXGobject_proto_object|630|0|1004|0|{}371|375|}
{2010212001|XXGvertex_oport_oport|631|0|1006|0|{0|out|}375|376|}
{2010006001|XXGobject_psameas_object|632|0|1008|0|{metadata|out_metadata|1|0|}376|375|}
{2010212001|XXGvertex_oport_oport|633|0|1009|0|{1|error|}375|377|}
{2010006001|XXGobject_psameas_object|634|0|1011|0|{metadata|error_metadata|1|0|}377|375|}
{2010212001|XXGvertex_oport_oport|635|0|1012|0|{2|log|}375|378|}
{2010006001|XXGobject_psameas_object|636|0|1014|0|{metadata|log_metadata|1|0|}378|375|}
{2010006001|XXGobject_psameas_object|637|0|1015|0|{Layout|Layout|0|0|}371|379|}
{2010211001|XXGvertex_iport_iport|638|0|1017|0|{0|write|}379|380|}
{2010214001|XXGiport_src_flow|639|0|1019|0|{0|}380|368|}
{2010007001|XXGobject_proto_object|640|0|1020|0|{}379|381|}
{2010211001|XXGvertex_iport_iport|641|0|1022|0|{0|write|}381|382|}
{2010006001|XXGobject_psameas_object|642|0|1024|0|{metadata|write_metadata|1|0|}382|381|}
{2010006001|XXGobject_psameas_object|643|0|1025|0|{out_metadata|out0_metadata|0|0|}371|383|}
{2010212001|XXGvertex_oport_oport|644|0|1027|0|{0|out0|}383|384|}
{2010213001|XXGoport_dst_flow|645|0|1029|0|{0|}384|370|}
{2010212001|XXGvertex_oport_oport|646|0|1030|0|{1|reject0|}383|385|}
{2010212001|XXGvertex_oport_oport|647|0|1032|0|{2|error0|}383|386|}
{2010212001|XXGvertex_oport_oport|648|0|1034|0|{3|log|}383|387|}
{2010211001|XXGvertex_iport_iport|649|0|1036|0|{0|in|}383|388|}
{2010007001|XXGobject_proto_object|650|0|1038|0|{}383|389|}
{2010212001|XXGvertex_oport_oport|651|0|1040|0|{0|out0|}389|390|}
{2010006001|XXGobject_psameas_object|652|0|1042|0|{metadata|out0_metadata|1|0|}390|389|}
{2010006001|XXGobject_psameas_object|653|0|1043|0|{transform0|transform0|1|0|}390|389|}
{2010212001|XXGvertex_oport_oport|654|0|1044|0|{1|reject0|}389|391|}
{2010006001|XXGobject_psameas_object|655|0|1046|0|{metadata|reject0_metadata|1|0|}391|389|}
{2010212001|XXGvertex_oport_oport|656|0|1047|0|{2|error0|}389|392|}
{2010006001|XXGobject_psameas_object|657|0|1049|0|{metadata|error0_metadata|1|0|}392|389|}
{2010212001|XXGvertex_oport_oport|658|0|1050|0|{3|log|}389|393|}
{2010006001|XXGobject_psameas_object|659|0|1052|0|{metadata|log_metadata|1|0|}393|389|}
{2010211001|XXGvertex_iport_iport|660|0|1053|0|{0|in|}389|394|}
{2010006001|XXGobject_psameas_object|661|0|1055|0|{metadata|in_metadata|1|0|}394|389|}
{2010006001|XXGobject_psameas_object|662|0|1056|0|{Layout|Layout|0|0|}383|351|}
{2010006001|XXGobject_psameas_object|663|0|1057|0|{in_metadata|out0_metadata|0|0|}383|57|}
{2010006001|XXGobject_psameas_object|664|0|1058|0|{reject0_metadata|out0_metadata|0|0|}383|57|}
{2010601001|XXGgraph_vertex_vertex|665|0|1059|0|{Gather|}363|395|}
{2010212001|XXGvertex_oport_oport|666|0|1061|0|{0|out|}395|396|}
{2010213001|XXGoport_dst_flow|667|0|1063|0|{0|}396|366|}
{2010211001|XXGvertex_iport_iport|668|0|1064|0|{0|in|}395|397|}
{2010214001|XXGiport_src_flow|669|0|1066|0|{0|}397|367|}
{2010007001|XXGobject_proto_object|670|0|1067|0|{}395|398|}
{2010212001|XXGvertex_oport_oport|671|0|1069|0|{0|out|}398|399|}
{2010006001|XXGobject_psameas_object|672|0|1071|0|{metadata|out_metadata|1|0|}399|398|}
{2010211001|XXGvertex_iport_iport|673|0|1072|0|{0|in|}398|400|}
{2010006001|XXGobject_psameas_object|674|0|1074|0|{metadata|in_metadata|1|0|}400|398|}
{2010006001|XXGobject_psameas_object|675|0|1075|0|{Layout|Layout|0|0|}395|379|}
{2010006001|XXGobject_psameas_object|676|0|1076|0|{in_metadata|out0_metadata|0|0|}395|383|}
{2010006001|XXGobject_psameas_object|677|0|1077|0|{out_metadata|out0_metadata|0|0|}395|383|}
{2010601001|XXGgraph_vertex_vertex|678|0|1078|0|{Reformat|}363|383|}
{2010601001|XXGgraph_vertex_vertex|679|0|1079|0|{Rollup_Per_Partition|}363|401|}
{2010212001|XXGvertex_oport_oport|680|0|1081|0|{0|out|}401|402|}
{2010213001|XXGoport_dst_flow|681|0|1083|0|{0|}402|367|}
{2010212001|XXGvertex_oport_oport|682|0|1084|0|{1|reject|}401|403|}
{2010212001|XXGvertex_oport_oport|683|0|1086|0|{2|error|}401|404|}
{2010212001|XXGvertex_oport_oport|684|0|1088|0|{3|log|}401|405|}
{2010211001|XXGvertex_iport_iport|685|0|1090|0|{0|in|}401|406|}
{2010214001|XXGiport_src_flow|686|0|1092|0|{0|}406|370|}
{2010007001|XXGobject_proto_object|687|0|1093|0|{}401|407|}
{2010212001|XXGvertex_oport_oport|688|0|1095|0|{0|out|}407|408|}
{2010006001|XXGobject_psameas_object|689|0|1097|0|{metadata|out_metadata|1|0|}408|407|}
{2010212001|XXGvertex_oport_oport|690|0|1098|0|{1|reject|}407|409|}
{2010006001|XXGobject_psameas_object|691|0|1100|0|{metadata|reject_metadata|1|0|}409|407|}
{2010212001|XXGvertex_oport_oport|692|0|1101|0|{2|error|}407|410|}
{2010006001|XXGobject_psameas_object|693|0|1103|0|{metadata|error_metadata|1|0|}410|407|}
{2010212001|XXGvertex_oport_oport|694|0|1104|0|{3|log|}407|411|}
{2010006001|XXGobject_psameas_object|695|0|1106|0|{metadata|log_metadata|1|0|}411|407|}
{2010211001|XXGvertex_iport_iport|696|0|1107|0|{0|in|}407|412|}
{2010006001|XXGobject_psameas_object|697|0|1109|0|{metadata|in_metadata|1|0|}412|407|}
{2010006001|XXGobject_psameas_object|698|0|1110|0|{Layout|Layout|0|0|}401|351|}
{2010006001|XXGobject_psameas_object|699|0|1111|0|{in_metadata|out0_metadata|0|0|}401|383|}
{2010006001|XXGobject_psameas_object|700|0|1112|0|{out_metadata|out0_metadata|0|0|}401|383|}
{2010006001|XXGobject_psameas_object|701|0|1113|0|{reject_metadata|out0_metadata|0|0|}401|383|}
{2010601001|XXGgraph_vertex_vertex|702|0|1114|0|{Rollup_Serial|}363|413|}
{2010212001|XXGvertex_oport_oport|703|0|1116|0|{0|out|}413|414|}
{2010213001|XXGoport_dst_flow|704|0|1118|0|{0|}414|368|}
{2010212001|XXGvertex_oport_oport|705|0|1119|0|{1|reject|}413|415|}
{2010212001|XXGvertex_oport_oport|706|0|1121|0|{2|error|}413|416|}
{2010212001|XXGvertex_oport_oport|707|0|1123|0|{3|log|}413|417|}
{2010211001|XXGvertex_iport_iport|708|0|1125|0|{0|in|}413|418|}
{2010214001|XXGiport_src_flow|709|0|1127|0|{0|}418|366|}
{2010214001|XXGiport_src_flow|710|0|1128|0|{1|}418|369|}
{2010007001|XXGobject_proto_object|711|0|1129|0|{}413|419|}
{2010212001|XXGvertex_oport_oport|712|0|1131|0|{0|out|}419|420|}
{2010006001|XXGobject_psameas_object|713|0|1133|0|{metadata|out_metadata|1|0|}420|419|}
{2010212001|XXGvertex_oport_oport|714|0|1134|0|{1|reject|}419|421|}
{2010006001|XXGobject_psameas_object|715|0|1136|0|{metadata|reject_metadata|1|0|}421|419|}
{2010212001|XXGvertex_oport_oport|716|0|1137|0|{2|error|}419|422|}
{2010006001|XXGobject_psameas_object|717|0|1139|0|{metadata|error_metadata|1|0|}422|419|}
{2010212001|XXGvertex_oport_oport|718|0|1140|0|{3|log|}419|423|}
{2010006001|XXGobject_psameas_object|719|0|1142|0|{metadata|log_metadata|1|0|}423|419|}
{2010211001|XXGvertex_iport_iport|720|0|1143|0|{0|in|}419|424|}
{2010006001|XXGobject_psameas_object|721|0|1145|0|{metadata|in_metadata|1|0|}424|419|}
{2010006001|XXGobject_psameas_object|722|0|1146|0|{Layout|Layout|0|0|}413|379|}
{2010006001|XXGobject_psameas_object|723|0|1147|0|{in_metadata|out0_metadata|0|0|}413|383|}
{2010006001|XXGobject_psameas_object|724|0|1148|0|{out_metadata|write_metadata|0|0|}413|379|}
{2010006001|XXGobject_psameas_object|725|0|1149|0|{reject_metadata|out0_metadata|0|0|}413|383|}
{2010601001|XXGgraph_vertex_vertex|726|0|1150|0|{Write_Max_SK_file|}363|379|}
{2010211001|XXGvertex_iport_iport|727|0|1151|0|{0|in0|}363|425|}
{2010215002|XXGiport_binding_iport|728|0|1153|0|{.5|.5|{0|}315|}425|388|}
{2010214001|XXGiport_src_flow|729|0|1154|0|{0|}425|19|}
{2010601001|XXGgraph_vertex_vertex|730|0|1155|0|{Version_Log|}1|426|}
{2010605001|XXGgraph_legend_legend|731|0|1157|0|{0|}426|427|}
{2010241001|XXGlegend_face_face|732|0|1159|0|{}427|428|}
{2010605001|XXGgraph_legend_legend|733|0|1161|0|{1|}426|429|}
{2010241001|XXGlegend_face_face|734|0|1163|0|{}429|430|}
{2010605001|XXGgraph_legend_legend|735|0|1165|0|{2|}426|431|}
{2010241001|XXGlegend_face_face|736|0|1167|0|{}431|432|}
{2010605001|XXGgraph_legend_legend|737|0|1169|0|{3|}426|433|}
{2010241001|XXGlegend_face_face|738|0|1171|0|{}433|434|}
{2010605001|XXGgraph_legend_legend|739|0|1173|0|{4|}426|435|}
{2010241001|XXGlegend_face_face|740|0|1175|0|{}435|436|}
{2010605001|XXGgraph_legend_legend|741|0|1177|0|{5|}426|437|}
{2010241001|XXGlegend_face_face|742|0|1179|0|{}437|438|}
{2010605001|XXGgraph_legend_legend|743|0|1181|0|{6|}426|439|}
{2010241001|XXGlegend_face_face|744|0|1183|0|{}439|440|}
{2010605001|XXGgraph_legend_legend|745|0|1185|0|{7|}426|441|}
{2010241001|XXGlegend_face_face|746|0|1187|0|{}441|442|}
{2010601001|XXGgraph_vertex_vertex|747|0|1189|0|{Write_Data_Store_files|}1|443|}
{2010605001|XXGgraph_legend_legend|748|0|1191|0|{0|}443|444|}
{2010241001|XXGlegend_face_face|749|0|1193|0|{}444|445|}
{2010605001|XXGgraph_legend_legend|750|0|1195|0|{1|}443|446|}
{2010241001|XXGlegend_face_face|751|0|1197|0|{}446|447|}
{2010604001|XXGgraph_flow_flow|752|0|1199|0|{Flow_1|}443|448|}
{2010604001|XXGgraph_flow_flow|753|0|1201|0|{Flow_4|}443|449|}
{2010601001|XXGgraph_vertex_vertex|754|0|1203|0|{Replicate_for_Insert|}443|450|}
{2010212001|XXGvertex_oport_oport|755|0|1205|0|{0|out|}450|451|}
{2010213001|XXGoport_dst_flow|756|0|1207|0|{0|}451|448|}
{2010211001|XXGvertex_iport_iport|757|0|1208|0|{0|in|}450|452|}
{2010007001|XXGobject_proto_object|758|0|1210|0|{}450|453|}
{2010212001|XXGvertex_oport_oport|759|0|1212|0|{0|out|}453|454|}
{2010006001|XXGobject_psameas_object|760|0|1214|0|{metadata|out_metadata|1|0|}454|453|}
{2010211001|XXGvertex_iport_iport|761|0|1215|0|{0|in|}453|455|}
{2010006001|XXGobject_psameas_object|762|0|1217|0|{metadata|in_metadata|1|0|}455|453|}
{2010006001|XXGobject_psameas_object|763|0|1218|0|{Layout|Layout|0|0|}450|351|}
{2010006001|XXGobject_psameas_object|764|0|1219|0|{in_metadata|out0_metadata|0|0|}450|57|}
{2010006001|XXGobject_psameas_object|765|0|1220|0|{out_metadata|out0_metadata|0|0|}450|57|}
{2010601001|XXGgraph_vertex_vertex|766|0|1221|0|{Replicate_for_Update|}443|456|}
{2010212001|XXGvertex_oport_oport|767|0|1223|0|{0|out|}456|457|}
{2010213001|XXGoport_dst_flow|768|0|1225|0|{0|}457|449|}
{2010211001|XXGvertex_iport_iport|769|0|1226|0|{0|in|}456|458|}
{2010007001|XXGobject_proto_object|770|0|1228|0|{}456|459|}
{2010212001|XXGvertex_oport_oport|771|0|1230|0|{0|out|}459|460|}
{2010006001|XXGobject_psameas_object|772|0|1232|0|{metadata|out_metadata|1|0|}460|459|}
{2010211001|XXGvertex_iport_iport|773|0|1233|0|{0|in|}459|461|}
{2010006001|XXGobject_psameas_object|774|0|1235|0|{metadata|in_metadata|1|0|}461|459|}
{2010006001|XXGobject_psameas_object|775|0|1236|0|{Layout|Layout|0|0|}456|351|}
{2010006001|XXGobject_psameas_object|776|0|1237|0|{in_metadata|out2_metadata|0|0|}456|27|}
{2010006001|XXGobject_psameas_object|777|0|1238|0|{out_metadata|out2_metadata|0|0|}456|27|}
{2010601001|XXGgraph_vertex_vertex|778|0|1239|0|{Write_IDS_Data_Store|}443|462|}
{2010604001|XXGgraph_flow_flow|779|0|1241|0|{Flow_1|}462|463|}
{2010604001|XXGgraph_flow_flow|780|0|1243|0|{Flow_2|}462|464|}
{2010604001|XXGgraph_flow_flow|781|0|1245|0|{Flow_3|}462|465|}
{2010604001|XXGgraph_flow_flow|782|0|1247|0|{Flow_4|}462|466|}
{2010601001|XXGgraph_vertex_vertex|783|0|1249|0|{Merge|}462|467|}
{2010212001|XXGvertex_oport_oport|784|0|1251|0|{0|out|}467|468|}
{2010213001|XXGoport_dst_flow|785|0|1253|0|{0|}468|463|}
{2010211001|XXGvertex_iport_iport|786|0|1254|0|{0|in|}467|469|}
{2010007001|XXGobject_proto_object|787|0|1256|0|{}467|470|}
{2010212001|XXGvertex_oport_oport|788|0|1258|0|{0|out|}470|471|}
{2010006001|XXGobject_psameas_object|789|0|1260|0|{metadata|out_metadata|1|0|}471|470|}
{2010211001|XXGvertex_iport_iport|790|0|1261|0|{0|in|}470|472|}
{2010006001|XXGobject_psameas_object|791|0|1263|0|{metadata|in_metadata|1|0|}472|470|}
{2010006001|XXGobject_psameas_object|792|0|1264|0|{Layout|Layout|0|0|}467|351|}
{2010006001|XXGobject_psameas_object|793|0|1265|0|{in_metadata|out2_metadata|0|0|}467|27|}
{2010006001|XXGobject_psameas_object|794|0|1266|0|{out_metadata|out2_metadata|0|0|}467|27|}
{2010601001|XXGgraph_vertex_vertex|795|0|1267|0|{Reduced_Single_ICFF|}462|473|}
{2010604001|XXGgraph_flow_flow|796|0|1269|0|{Flow_1|}473|474|}
{2010604001|XXGgraph_flow_flow|797|0|1271|0|{Flow_2|}473|475|}
{2010604001|XXGgraph_flow_flow|798|0|1273|0|{Flow_3|}473|476|}
{2010604001|XXGgraph_flow_flow|799|0|1275|0|{Flow_4|}473|477|}
{2010604001|XXGgraph_flow_flow|800|0|1277|0|{Flow_6|}473|478|}
{2010601001|XXGgraph_vertex_vertex|801|0|1279|0|{New_Data_File_4|}473|479|}
{2010211001|XXGvertex_iport_iport|802|0|1281|0|{0|write|}479|480|}
{2010214001|XXGiport_src_flow|803|0|1283|0|{0|}480|474|}
{2010007001|XXGobject_proto_object|804|0|1284|0|{}479|481|}
{2010211001|XXGvertex_iport_iport|805|0|1286|0|{0|write|}481|482|}
{2010006001|XXGobject_psameas_object|806|0|1288|0|{metadata|write_metadata|1|0|}482|481|}
{2010601001|XXGgraph_vertex_vertex|807|0|1289|0|{PBKS_ICFF_KEY_dxf_hk_part1_|}473|483|}
{2010604001|XXGgraph_flow_flow|808|0|1291|0|{Flow_1|}483|484|}
{2010601001|XXGgraph_vertex_vertex|809|0|1293|0|{Partition_by_Key|}483|485|}
{2010212001|XXGvertex_oport_oport|810|0|1295|0|{0|out|}485|486|}
{2010213001|XXGoport_dst_flow|811|0|1297|0|{0|}486|484|}
{2010211001|XXGvertex_iport_iport|812|0|1298|0|{0|in|}485|487|}
{2010006001|XXGobject_psameas_object|813|0|1300|0|{out_metadata|in_metadata|0|0|}485|485|}
{2010601001|XXGgraph_vertex_vertex|814|0|1301|0|{Sort|}483|488|}
{2010212001|XXGvertex_oport_oport|815|0|1303|0|{0|out|}488|489|}
{2010211001|XXGvertex_iport_iport|816|0|1305|0|{0|in|}488|490|}
{2010214001|XXGiport_src_flow|817|0|1307|0|{0|}490|484|}
{2010006001|XXGobject_psameas_object|818|0|1308|0|{in_metadata|in_metadata|0|0|}488|485|}
{2010006001|XXGobject_psameas_object|819|0|1309|0|{out_metadata|in_metadata|0|0|}488|485|}
{2010212001|XXGvertex_oport_oport|820|0|1310|0|{0|out0|}483|491|}
{2010216002|XXGoport_binding_oport|821|0|1312|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}491|489|}
{2010213001|XXGoport_dst_flow|822|0|1313|0|{0|}491|477|}
{2010211001|XXGvertex_iport_iport|823|0|1314|0|{0|in0|}483|492|}
{2010215002|XXGiport_binding_iport|824|0|1316|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}492|487|}
{2010214001|XXGiport_src_flow|825|0|1317|0|{0|}492|478|}
{2010007001|XXGobject_proto_object|826|0|1318|0|{}483|493|}
{2010604001|XXGgraph_flow_flow|827|0|1320|0|{Flow_1|}493|494|}
{2010601001|XXGgraph_vertex_vertex|828|0|1322|0|{Partition_by_Key|}493|495|}
{2010212001|XXGvertex_oport_oport|829|0|1324|0|{0|out|}495|496|}
{2010213001|XXGoport_dst_flow|830|0|1326|0|{0|}496|494|}
{2010211001|XXGvertex_iport_iport|831|0|1327|0|{0|in|}495|497|}
{2010007001|XXGobject_proto_object|832|0|1329|0|{}495|498|}
{2010212001|XXGvertex_oport_oport|833|0|1331|0|{0|out|}498|499|}
{2010006001|XXGobject_psameas_object|834|0|1333|0|{metadata|out_metadata|1|0|}499|498|}
{2010211001|XXGvertex_iport_iport|835|0|1334|0|{0|in|}498|500|}
{2010006001|XXGobject_psameas_object|836|0|1336|0|{metadata|in_metadata|1|0|}500|498|}
{2010006001|XXGobject_psameas_object|837|0|1337|0|{Layout|InputLayout|1|0|}495|493|}
{2010006001|XXGobject_psameas_object|838|0|1338|0|{key|Key|1|0|}495|493|}
{2010601001|XXGgraph_vertex_vertex|839|0|1339|0|{Sort|}493|501|}
{2010212001|XXGvertex_oport_oport|840|0|1341|0|{0|out|}501|502|}
{2010211001|XXGvertex_iport_iport|841|0|1343|0|{0|in|}501|503|}
{2010214001|XXGiport_src_flow|842|0|1345|0|{0|}503|494|}
{2010007001|XXGobject_proto_object|843|0|1346|0|{}501|504|}
{2010212001|XXGvertex_oport_oport|844|0|1348|0|{0|out|}504|505|}
{2010006001|XXGobject_psameas_object|845|0|1350|0|{metadata|out_metadata|1|0|}505|504|}
{2010211001|XXGvertex_iport_iport|846|0|1351|0|{0|in|}504|506|}
{2010006001|XXGobject_psameas_object|847|0|1353|0|{metadata|in_metadata|1|0|}506|504|}
{2010006001|XXGobject_psameas_object|848|0|1354|0|{Layout|OutputLayout|1|0|}501|493|}
{2010006001|XXGobject_psameas_object|849|0|1355|0|{key|Key|1|0|}501|493|}
{2010006001|XXGobject_psameas_object|850|0|1356|0|{max_core|Max_core|1|0|}501|493|}
{2010212001|XXGvertex_oport_oport|851|0|1357|0|{0|out0|}493|507|}
{2010216002|XXGoport_binding_oport|852|0|1359|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}507|502|}
{2010211001|XXGvertex_iport_iport|853|0|1360|0|{0|in0|}493|508|}
{2010215002|XXGiport_binding_iport|854|0|1362|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}508|497|}
{2010006001|XXGobject_psameas_object|855|0|1363|0|{InputLayout|Layout|0|0|}483|351|}
{2010006001|XXGobject_psameas_object|856|0|1364|0|{OutputLayout|Layout|0|0|}483|509|}
{2010212001|XXGvertex_oport_oport|857|0|1366|0|{0|read|}509|510|}
{2010213001|XXGoport_dst_flow|858|0|1368|0|{0|}510|474|}
{2010211001|XXGvertex_iport_iport|859|0|1369|0|{0|write|}509|511|}
{2010214001|XXGiport_src_flow|860|0|1371|0|{0|}511|475|}
{2010007001|XXGobject_proto_object|861|0|1372|0|{}509|512|}
{2010212001|XXGvertex_oport_oport|862|0|1374|0|{0|read|}512|513|}
{2010006001|XXGobject_psameas_object|863|0|1376|0|{metadata|read_metadata|1|0|}513|512|}
{2010211001|XXGvertex_iport_iport|864|0|1377|0|{0|write|}512|514|}
{2010006001|XXGobject_psameas_object|865|0|1379|0|{metadata|write_metadata|1|0|}514|512|}
{2010601001|XXGgraph_vertex_vertex|866|0|1380|0|{REDUCED_ICFF|}473|509|}
{2010601001|XXGgraph_vertex_vertex|867|0|1381|0|{REDUCED_Index_File|}473|515|}
{2010211001|XXGvertex_iport_iport|868|0|1383|0|{0|write|}515|516|}
{2010214001|XXGiport_src_flow|869|0|1385|0|{0|}516|476|}
{2010007001|XXGobject_proto_object|870|0|1386|0|{}515|517|}
{2010211001|XXGvertex_iport_iport|871|0|1388|0|{0|write|}517|518|}
{2010006001|XXGobject_psameas_object|872|0|1390|0|{metadata|write_metadata|1|0|}518|517|}
{2010601001|XXGgraph_vertex_vertex|873|0|1391|0|{RFMT_Get_Hash_On_Reduced_File_Key|}473|519|}
{2010212001|XXGvertex_oport_oport|874|0|1393|0|{0|out0|}519|520|}
{2010213001|XXGoport_dst_flow|875|0|1395|0|{0|}520|478|}
{2010212001|XXGvertex_oport_oport|876|0|1396|0|{1|reject0|}519|521|}
{2010212001|XXGvertex_oport_oport|877|0|1398|0|{2|error0|}519|522|}
{2010212001|XXGvertex_oport_oport|878|0|1400|0|{3|log|}519|523|}
{2010211001|XXGvertex_iport_iport|879|0|1402|0|{0|in|}519|524|}
{2010007001|XXGobject_proto_object|880|0|1404|0|{}519|525|}
{2010212001|XXGvertex_oport_oport|881|0|1406|0|{0|out0|}525|526|}
{2010006001|XXGobject_psameas_object|882|0|1408|0|{metadata|out0_metadata|1|0|}526|525|}
{2010006001|XXGobject_psameas_object|883|0|1409|0|{transform0|transform0|1|0|}526|525|}
{2010212001|XXGvertex_oport_oport|884|0|1410|0|{1|reject0|}525|527|}
{2010006001|XXGobject_psameas_object|885|0|1412|0|{metadata|reject0_metadata|1|0|}527|525|}
{2010212001|XXGvertex_oport_oport|886|0|1413|0|{2|error0|}525|528|}
{2010006001|XXGobject_psameas_object|887|0|1415|0|{metadata|error0_metadata|1|0|}528|525|}
{2010212001|XXGvertex_oport_oport|888|0|1416|0|{3|log|}525|529|}
{2010006001|XXGobject_psameas_object|889|0|1418|0|{metadata|log_metadata|1|0|}529|525|}
{2010211001|XXGvertex_iport_iport|890|0|1419|0|{0|in|}525|530|}
{2010006001|XXGobject_psameas_object|891|0|1421|0|{metadata|in_metadata|1|0|}530|525|}
{2010006001|XXGobject_psameas_object|892|0|1422|0|{Layout|Layout|0|0|}519|351|}
{2010006001|XXGobject_psameas_object|893|0|1423|0|{in_metadata|in_metadata|0|0|}519|531|}
{2010212001|XXGvertex_oport_oport|894|0|1425|0|{0|out|}531|532|}
{2010213001|XXGoport_dst_flow|895|0|1427|0|{0|}532|533|}
{2010212001|XXGvertex_oport_oport|896|0|1429|0|{1|reject|}531|534|}
{2010212001|XXGvertex_oport_oport|897|0|1431|0|{2|error|}531|535|}
{2010212001|XXGvertex_oport_oport|898|0|1433|0|{3|log|}531|536|}
{2010212001|XXGvertex_oport_oport|899|0|1435|0|{4|address|}531|537|}
{2010211001|XXGvertex_iport_iport|900|0|1437|0|{0|in|}531|538|}
{2010007001|XXGobject_proto_object|901|0|1439|0|{}531|539|}
{2010212001|XXGvertex_oport_oport|902|0|1441|0|{0|out|}539|540|}
{2010006001|XXGobject_psameas_object|903|0|1443|0|{metadata|out_metadata|1|0|}540|539|}
{2010212001|XXGvertex_oport_oport|904|0|1444|0|{1|reject|}539|541|}
{2010006001|XXGobject_psameas_object|905|0|1446|0|{metadata|reject_metadata|1|0|}541|539|}
{2010212001|XXGvertex_oport_oport|906|0|1447|0|{2|error|}539|542|}
{2010006001|XXGobject_psameas_object|907|0|1449|0|{metadata|error_metadata|1|0|}542|539|}
{2010212001|XXGvertex_oport_oport|908|0|1450|0|{3|log|}539|543|}
{2010006001|XXGobject_psameas_object|909|0|1452|0|{metadata|log_metadata|1|0|}543|539|}
{2010212001|XXGvertex_oport_oport|910|0|1453|0|{4|address|}539|544|}
{2010006001|XXGobject_psameas_object|911|0|1455|0|{metadata|address_metadata|1|0|}544|539|}
{2010211001|XXGvertex_iport_iport|912|0|1456|0|{0|in|}539|545|}
{2010006001|XXGobject_psameas_object|913|0|1458|0|{metadata|in_metadata|1|0|}545|539|}
{2010006001|XXGobject_psameas_object|914|0|1459|0|{Layout|Layout|0|0|}531|351|}
{2010006001|XXGobject_psameas_object|915|0|1460|0|{reject_metadata|in_metadata|0|0|}531|531|}
{2010006001|XXGobject_psameas_object|916|0|1461|0|{reject0_metadata|in_metadata|0|0|}519|531|}
{2010601001|XXGgraph_vertex_vertex|917|0|1462|0|{Write_Block_Compressed_Lookup|}473|546|}
{2010212001|XXGvertex_oport_oport|918|0|1464|0|{0|out|}546|547|}
{2010213001|XXGoport_dst_flow|919|0|1466|0|{0|}547|475|}
{2010212001|XXGvertex_oport_oport|920|0|1467|0|{1|index|}546|548|}
{2010213001|XXGoport_dst_flow|921|0|1469|0|{0|}548|476|}
{2010212001|XXGvertex_oport_oport|922|0|1470|0|{2|address|}546|549|}
{2010211001|XXGvertex_iport_iport|923|0|1472|0|{0|in|}546|550|}
{2010214001|XXGiport_src_flow|924|0|1474|0|{0|}550|477|}
{2010007001|XXGobject_proto_object|925|0|1475|0|{}546|551|}
{2010212001|XXGvertex_oport_oport|926|0|1477|0|{0|out|}551|552|}
{2010006001|XXGobject_psameas_object|927|0|1479|0|{metadata|out_metadata|1|0|}552|551|}
{2010212001|XXGvertex_oport_oport|928|0|1480|0|{1|index|}551|553|}
{2010006001|XXGobject_psameas_object|929|0|1482|0|{metadata|index_metadata|1|0|}553|551|}
{2010212001|XXGvertex_oport_oport|930|0|1483|0|{2|address|}551|554|}
{2010006001|XXGobject_psameas_object|931|0|1485|0|{metadata|address_metadata|1|0|}554|551|}
{2010211001|XXGvertex_iport_iport|932|0|1486|0|{0|in|}551|555|}
{2010006001|XXGobject_psameas_object|933|0|1488|0|{metadata|in_metadata|1|0|}555|551|}
{2010006001|XXGobject_psameas_object|934|0|1489|0|{Layout|Layout|0|0|}546|509|}
{2010006001|XXGobject_psameas_object|935|0|1490|0|{in_metadata|in_metadata|0|0|}546|485|}
{2010006001|XXGobject_psameas_object|936|0|1491|0|{out_metadata|write_metadata|0|0|}546|509|}
{2010211001|XXGvertex_iport_iport|937|0|1492|0|{0|in0|}473|556|}
{2010215002|XXGiport_binding_iport|938|0|1494|0|{.5|.5|{0|}12340|}556|524|}
{2010214001|XXGiport_src_flow|939|0|1495|0|{0|}556|466|}
{2010601001|XXGgraph_vertex_vertex|940|0|1496|0|{Replicate|}462|557|}
{2010212001|XXGvertex_oport_oport|941|0|1498|0|{0|out|}557|558|}
{2010213001|XXGoport_dst_flow|942|0|1500|0|{0|}558|464|}
{2010213001|XXGoport_dst_flow|943|0|1501|0|{1|}558|465|}
{2010213001|XXGoport_dst_flow|944|0|1502|0|{2|}558|466|}
{2010211001|XXGvertex_iport_iport|945|0|1503|0|{0|in|}557|559|}
{2010214001|XXGiport_src_flow|946|0|1505|0|{0|}559|463|}
{2010007001|XXGobject_proto_object|947|0|1506|0|{}557|560|}
{2010212001|XXGvertex_oport_oport|948|0|1508|0|{0|out|}560|561|}
{2010006001|XXGobject_psameas_object|949|0|1510|0|{metadata|out_metadata|1|0|}561|560|}
{2010211001|XXGvertex_iport_iport|950|0|1511|0|{0|in|}560|562|}
{2010006001|XXGobject_psameas_object|951|0|1513|0|{metadata|in_metadata|1|0|}562|560|}
{2010006001|XXGobject_psameas_object|952|0|1514|0|{Layout|Layout|0|0|}557|351|}
{2010006001|XXGobject_psameas_object|953|0|1515|0|{in_metadata|in_metadata|0|0|}557|531|}
{2010006001|XXGobject_psameas_object|954|0|1516|0|{out_metadata|in_metadata|0|0|}557|531|}
{2010601001|XXGgraph_vertex_vertex|955|0|1517|0|{Write_Dim_Datasets|}462|563|}
{2010604001|XXGgraph_flow_flow|956|0|1519|0|{Flow_1|}563|353|}
{2010604001|XXGgraph_flow_flow|957|0|1520|0|{Flow_2|}563|564|}
{2010604001|XXGgraph_flow_flow|958|0|1522|0|{Flow_3|}563|565|}
{2010604001|XXGgraph_flow_flow|959|0|1524|0|{Flow_4|}563|566|}
{2010604001|XXGgraph_flow_flow|960|0|1526|0|{Flow_6|}563|355|}
{2010604001|XXGgraph_flow_flow|961|0|1527|0|{Flow_7|}563|567|}
{2010601001|XXGgraph_vertex_vertex|962|0|1529|0|{Dedup_Sorted|}563|568|}
{2010212001|XXGvertex_oport_oport|963|0|1531|0|{0|out|}568|569|}
{2010212001|XXGvertex_oport_oport|964|0|1533|0|{1|dup|}568|570|}
{2010212001|XXGvertex_oport_oport|965|0|1535|0|{2|reject|}568|571|}
{2010212001|XXGvertex_oport_oport|966|0|1537|0|{3|error|}568|572|}
{2010212001|XXGvertex_oport_oport|967|0|1539|0|{4|log|}568|573|}
{2010211001|XXGvertex_iport_iport|968|0|1541|0|{0|in|}568|574|}
{2010214001|XXGiport_src_flow|969|0|1543|0|{0|}574|566|}
{2010007001|XXGobject_proto_object|970|0|1544|0|{}568|575|}
{2010212001|XXGvertex_oport_oport|971|0|1546|0|{0|out|}575|576|}
{2010006001|XXGobject_psameas_object|972|0|1548|0|{metadata|out_metadata|1|0|}576|575|}
{2010212001|XXGvertex_oport_oport|973|0|1549|0|{1|dup|}575|577|}
{2010006001|XXGobject_psameas_object|974|0|1551|0|{metadata|dup_metadata|1|0|}577|575|}
{2010212001|XXGvertex_oport_oport|975|0|1552|0|{2|reject|}575|578|}
{2010006001|XXGobject_psameas_object|976|0|1554|0|{metadata|reject_metadata|1|0|}578|575|}
{2010212001|XXGvertex_oport_oport|977|0|1555|0|{3|error|}575|579|}
{2010006001|XXGobject_psameas_object|978|0|1557|0|{metadata|error_metadata|1|0|}579|575|}
{2010212001|XXGvertex_oport_oport|979|0|1558|0|{4|log|}575|580|}
{2010006001|XXGobject_psameas_object|980|0|1560|0|{metadata|log_metadata|1|0|}580|575|}
{2010211001|XXGvertex_iport_iport|981|0|1561|0|{0|in|}575|581|}
{2010006001|XXGobject_psameas_object|982|0|1563|0|{metadata|in_metadata|1|0|}581|575|}
{2010006001|XXGobject_psameas_object|983|0|1564|0|{Layout|Layout|0|0|}568|351|}
{2010006001|XXGobject_psameas_object|984|0|1565|0|{dup_metadata|read_metadata|0|0|}568|582|}
{2010212001|XXGvertex_oport_oport|985|0|1567|0|{0|read|}582|583|}
{2010213001|XXGoport_dst_flow|986|0|1569|0|{0|}583|565|}
{2010007001|XXGobject_proto_object|987|0|1570|0|{}582|584|}
{2010212001|XXGvertex_oport_oport|988|0|1572|0|{0|read|}584|585|}
{2010006001|XXGobject_psameas_object|989|0|1574|0|{metadata|read_metadata|1|0|}585|584|}
{2010006001|XXGobject_psameas_object|990|0|1575|0|{in_metadata|read_metadata|0|0|}568|582|}
{2010006001|XXGobject_psameas_object|991|0|1576|0|{out_metadata|read_metadata|0|0|}568|582|}
{2010006001|XXGobject_psameas_object|992|0|1577|0|{reject_metadata|read_metadata|0|0|}568|582|}
{2010601001|XXGgraph_vertex_vertex|993|0|1578|0|{IDS_ICFF|}563|351|}
{2010601001|XXGgraph_vertex_vertex|994|0|1579|0|{IDS_Index_File|}563|586|}
{2010211001|XXGvertex_iport_iport|995|0|1581|0|{0|write|}586|587|}
{2010214001|XXGiport_src_flow|996|0|1583|0|{0|}587|567|}
{2010007001|XXGobject_proto_object|997|0|1584|0|{}586|588|}
{2010211001|XXGvertex_iport_iport|998|0|1586|0|{0|write|}588|589|}
{2010006001|XXGobject_psameas_object|999|0|1588|0|{metadata|write_metadata|1|0|}589|588|}
{2010006001|XXGobject_psameas_object|1000|0|1589|0|{write_metadata|index_metadata|0|0|}586|590|}
{2010212001|XXGvertex_oport_oport|1001|0|1591|0|{0|out|}590|591|}
{2010213001|XXGoport_dst_flow|1002|0|1593|0|{0|}591|355|}
{2010212001|XXGvertex_oport_oport|1003|0|1594|0|{1|index|}590|592|}
{2010213001|XXGoport_dst_flow|1004|0|1596|0|{0|}592|567|}
{2010212001|XXGvertex_oport_oport|1005|0|1597|0|{2|address|}590|593|}
{2010211001|XXGvertex_iport_iport|1006|0|1599|0|{0|in|}590|594|}
{2010007001|XXGobject_proto_object|1007|0|1601|0|{}590|595|}
{2010212001|XXGvertex_oport_oport|1008|0|1603|0|{0|out|}595|596|}
{2010006001|XXGobject_psameas_object|1009|0|1605|0|{metadata|out_metadata|1|0|}596|595|}
{2010212001|XXGvertex_oport_oport|1010|0|1606|0|{1|index|}595|597|}
{2010006001|XXGobject_psameas_object|1011|0|1608|0|{metadata|index_metadata|1|0|}597|595|}
{2010212001|XXGvertex_oport_oport|1012|0|1609|0|{2|address|}595|598|}
{2010006001|XXGobject_psameas_object|1013|0|1611|0|{metadata|address_metadata|1|0|}598|595|}
{2010211001|XXGvertex_iport_iport|1014|0|1612|0|{0|in|}595|599|}
{2010006001|XXGobject_psameas_object|1015|0|1614|0|{metadata|in_metadata|1|0|}599|595|}
{2010006001|XXGobject_psameas_object|1016|0|1615|0|{Layout|Layout|0|0|}590|351|}
{2010006001|XXGobject_psameas_object|1017|0|1616|0|{in_metadata|in_metadata|0|0|}590|531|}
{2010006001|XXGobject_psameas_object|1018|0|1617|0|{out_metadata|write_metadata|0|0|}590|351|}
{2010601001|XXGgraph_vertex_vertex|1019|0|1618|0|{Merge|}563|600|}
{2010212001|XXGvertex_oport_oport|1020|0|1620|0|{0|out|}600|601|}
{2010213001|XXGoport_dst_flow|1021|0|1622|0|{0|}601|566|}
{2010211001|XXGvertex_iport_iport|1022|0|1623|0|{0|in|}600|602|}
{2010214001|XXGiport_src_flow|1023|0|1625|0|{0|}602|564|}
{2010214001|XXGiport_src_flow|1024|0|1626|0|{1|}602|565|}
{2010007001|XXGobject_proto_object|1025|0|1627|0|{}600|603|}
{2010212001|XXGvertex_oport_oport|1026|0|1629|0|{0|out|}603|604|}
{2010006001|XXGobject_psameas_object|1027|0|1631|0|{metadata|out_metadata|1|0|}604|603|}
{2010211001|XXGvertex_iport_iport|1028|0|1632|0|{0|in|}603|605|}
{2010006001|XXGobject_psameas_object|1029|0|1634|0|{metadata|in_metadata|1|0|}605|603|}
{2010006001|XXGobject_psameas_object|1030|0|1635|0|{Layout|Layout|0|0|}600|351|}
{2010006001|XXGobject_psameas_object|1031|0|1636|0|{in_metadata|read_metadata|0|0|}600|582|}
{2010006001|XXGobject_psameas_object|1032|0|1637|0|{out_metadata|read_metadata|0|0|}600|582|}
{2010601001|XXGgraph_vertex_vertex|1033|0|1638|0|{New_Data_File_4|}563|606|}
{2010211001|XXGvertex_iport_iport|1034|0|1640|0|{0|write|}606|607|}
{2010214001|XXGiport_src_flow|1035|0|1642|0|{0|}607|353|}
{2010007001|XXGobject_proto_object|1036|0|1643|0|{}606|608|}
{2010211001|XXGvertex_iport_iport|1037|0|1645|0|{0|write|}608|609|}
{2010006001|XXGobject_psameas_object|1038|0|1647|0|{metadata|write_metadata|1|0|}609|608|}
{2010601001|XXGgraph_vertex_vertex|1039|0|1648|0|{New_Data_File_5|}563|582|}
{2010601001|XXGgraph_vertex_vertex|1040|0|1649|0|{Replicate|}563|610|}
{2010212001|XXGvertex_oport_oport|1041|0|1651|0|{0|out|}610|611|}
{2010213001|XXGoport_dst_flow|1042|0|1653|0|{0|}611|564|}
{2010211001|XXGvertex_iport_iport|1043|0|1654|0|{0|in|}610|612|}
{2010007001|XXGobject_proto_object|1044|0|1656|0|{}610|613|}
{2010212001|XXGvertex_oport_oport|1045|0|1658|0|{0|out|}613|614|}
{2010006001|XXGobject_psameas_object|1046|0|1660|0|{metadata|out_metadata|1|0|}614|613|}
{2010211001|XXGvertex_iport_iport|1047|0|1661|0|{0|in|}613|615|}
{2010006001|XXGobject_psameas_object|1048|0|1663|0|{metadata|in_metadata|1|0|}615|613|}
{2010006001|XXGobject_psameas_object|1049|0|1664|0|{in_metadata|read_metadata|0|0|}610|582|}
{2010006001|XXGobject_psameas_object|1050|0|1665|0|{out_metadata|read_metadata|0|0|}610|582|}
{2010601001|XXGgraph_vertex_vertex|1051|0|1666|0|{Write_Block_Compressed_Lookup|}563|590|}
{2010211001|XXGvertex_iport_iport|1052|0|1667|0|{0|in1|}563|616|}
{2010215002|XXGiport_binding_iport|1053|0|1669|0|{.5|.5|{0|}12066|}616|594|}
{2010214001|XXGiport_src_flow|1054|0|1670|0|{0|}616|464|}
{2010601001|XXGgraph_vertex_vertex|1055|0|1671|0|{Write_Multi_ICFF|}462|617|}
{2010604001|XXGgraph_flow_flow|1056|0|1673|0|{Flow_8|}617|533|}
{2010601001|XXGgraph_vertex_vertex|1057|0|1674|0|{Compute_Multiple_Block_Compressed_Lookups|}617|531|}
{2010601001|XXGgraph_vertex_vertex|1058|0|1675|0|{Write_Multiple_Files|}617|618|}
{2010212001|XXGvertex_oport_oport|1059|0|1677|0|{0|reject|}618|619|}
{2010212001|XXGvertex_oport_oport|1060|0|1679|0|{1|error|}618|620|}
{2010212001|XXGvertex_oport_oport|1061|0|1681|0|{2|log|}618|621|}
{2010211001|XXGvertex_iport_iport|1062|0|1683|0|{0|in|}618|622|}
{2010214001|XXGiport_src_flow|1063|0|1685|0|{0|}622|533|}
{2010007001|XXGobject_proto_object|1064|0|1686|0|{}618|623|}
{2010212001|XXGvertex_oport_oport|1065|0|1688|0|{0|reject|}623|624|}
{2010006001|XXGobject_psameas_object|1066|0|1690|0|{metadata|reject_metadata|1|0|}624|623|}
{2010212001|XXGvertex_oport_oport|1067|0|1691|0|{1|error|}623|625|}
{2010006001|XXGobject_psameas_object|1068|0|1693|0|{metadata|error_metadata|1|0|}625|623|}
{2010212001|XXGvertex_oport_oport|1069|0|1694|0|{2|log|}623|626|}
{2010006001|XXGobject_psameas_object|1070|0|1696|0|{metadata|log_metadata|1|0|}626|623|}
{2010211001|XXGvertex_iport_iport|1071|0|1697|0|{0|in|}623|627|}
{2010006001|XXGobject_psameas_object|1072|0|1699|0|{metadata|in_metadata|1|0|}627|623|}
{2010006001|XXGobject_psameas_object|1073|0|1700|0|{Layout|Layout|0|0|}618|351|}
{2010006001|XXGobject_psameas_object|1074|0|1701|0|{in_metadata|out_metadata|0|0|}618|531|}
{2010006001|XXGobject_psameas_object|1075|0|1702|0|{reject_metadata|out_metadata|0|0|}618|531|}
{2010211001|XXGvertex_iport_iport|1076|0|1703|0|{0|in0|}617|628|}
{2010215002|XXGiport_binding_iport|1077|0|1705|0|{.5|.5|{0|}11487|}628|538|}
{2010214001|XXGiport_src_flow|1078|0|1706|0|{0|}628|465|}
{2010211001|XXGvertex_iport_iport|1079|0|1707|0|{0|in0|}462|629|}
{2010215002|XXGiport_binding_iport|1080|0|1709|0|{.5|.5|{0|}11543|}629|469|}
{2010214001|XXGiport_src_flow|1081|0|1710|0|{0|}629|448|}
{2010214001|XXGiport_src_flow|1082|0|1711|0|{1|}629|449|}
{2010211001|XXGvertex_iport_iport|1083|0|1712|0|{0|in2|}443|630|}
{2010215002|XXGiport_binding_iport|1084|0|1714|0|{.5|.5|{0|}10971|}630|452|}
{2010214001|XXGiport_src_flow|1085|0|1715|0|{0|}630|16|}
{2010211001|XXGvertex_iport_iport|1086|0|1716|0|{1|in0|}443|631|}
{2010215002|XXGiport_binding_iport|1087|0|1718|0|{.5|.5|{0|}10972|}631|458|}
{2010214001|XXGiport_src_flow|1088|0|1719|0|{0|}631|18|}
{2010109001|XXGobject_property_value|1089|0|1720|0|{0|TrackingThumbprint|72|}1|632|}
