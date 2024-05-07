@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|563|rel_count|915|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";
include "/~$PUB_DB_XFR/file_list.xfr";|8|9|K|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SUBJECT_AREA||3|9|FK|@{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/lookup.ids.dataset_id.txt|3|9|FK||{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|SOURCE_IS_REDUCED|$[first_without_error(string_split(SOURCE_LOWER, ".")[2], "") == "reduced"]|13|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|RFK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|SOURCE_FILE_PATTERN||3|9|FK|@{0|}}
{30001002|XXparameter|DO_READ_IDS_EVENT_FILE|False|13|9|RFK|@{0|}}
{30001002|XXparameter|PICK_LATEST_EVENT_FILE|False|13|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_ENTITY|$[ 
if(DO_READ_IDS_EVENT_FILE)
string_split(SOURCE_FILE_PATTERN,".")[2]
else
re_replace(re_replace(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), "[.][a-zA-Z0-9]*", ""), "_$", "")
]|3|9|RK|@{0|}}
{30001002|XXparameter|DATASET_IDENTIFIER|$[
if(SOURCE_IS_REDUCED) "one" else get_ids_dataset_identifier(SOURCE_SYSTEM + "." + SOURCE_ENTITY)
]|3|9|K|@{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK|AB_PARAMETER_ENV|13|10|RKd|@{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[ 
if (DO_READ_IDS_EVENT_FILE) 
        PUB_DATAHUB_MFS + "/event/" + SOURCE_SYSTEM
else
        string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/", DATASET_IDENTIFIER)
]|3|9|RFK|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|WATERMARK_REQUIRED|$[ if(DATASET_IDENTIFIER == "many") 1 else 0]|13|9|FK|@{0|}}
{30001002|XXparameter|WATERMARK_FILENAME|$[ 
if ( WATERMARK_REQUIRED == 1) 
 AI_SERIAL + "/get." + SOURCE_SYSTEM + "/get.watermark." + SOURCE_LOWER + ".dat"
else
 ""
]|3|9|K|This file contains value in YYYYMMDD, which indicates files are processed till the date value in water mark file.|{0|}}
{30001002|XXparameter|WATERMARK_DATE|AB_PARAMETER_ENV|3|10|FKd|date value present in Watermark file. if blank keep current days date value. For event files reading based on watermark, enter the time in YYYYMMDDHH24MISS format|{0|}}
{30001002|XXparameter|START_DATE|AB_PARAMETER_ENV|3|10|FKd|Existing logic holds start date as previous month start date if watermark_date contaings 01 in day value otherwise start date holds current month start date value. For event files reading based on watermark, time will bein YYYYMMDDHH24MISS format|{0|}}
{30001002|XXparameter|END_DATE|AB_PARAMETER_ENV|3|10|FKd|Existing logic holds end date as previous month end date if watermark_date contaings 01 in day value otherwise end date holds current month end date value. For event files reading based on watermark, time will bein YYYYMMDDHH24MISS format |{0|}}
{30001002|XXparameter|DAYS_BEFORE|0|2|9|FK|Go back to the specified number of days in addition to START_DATE to search for the files matching SOURCE_FILE_PATTERN  in IDS_DATA_PATH location in case of FACT|{0|}}
{30001002|XXparameter|DAYS_AFTER|0|2|9|FK|Go forward to the specified number of days in addition to END_DATE to search for the files matching SOURCE_FILE_PATTERN in IDS_DATA_PATH location in case of FACT|{0|}}
{30001002|XXparameter|READ_ARCHIVE_FILE|$[SOURCE_LOWER member re_split(read_file(PUB_DXF_META + "/two_step_lookup_list.dat"), "[\\r\\n ]+")]|3|9|K|@{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC|AB_PARAMETER_ENV|3|10|Kd|Based on SOURCE_FILE_PATTERN search for files in IDS_DATA_PATH depending on START_DATE, END_DATE, DAYS_BEFORE and DAYS_AFTER.|{0|}}
{30001002|XXparameter|NEW_END_DATE|$[
begin

let string("") last_file_nm = if(length_of(SOURCE_FILE_LIST_VEC) > 0) vector_stable_sort(SOURCE_FILE_LIST_VEC)[length_of(SOURCE_FILE_LIST_VEC) - 1] else "EMPTY_FILE_LIST";
//let date("YYYYMMDD") strt_dt = START_DATE;
//let date("YYYYMMDD") end_dt = END_DATE;

/*result :: if(DATASET_TYPE == "FACT" && last_file_nm != "EMPTY_FILE_LIST") 
                string_split_no_empty(last_file_nm, ".")[1] // Extract timestamp value from last filename.
          else if ( DATASET_TYPE == "FACT" && last_file_nm == "EMPTY_FILE_LIST") 
                end_dt //string_lrtrim((string(""))(end_dt - 1)); // Update END_DATE value as no file list is found for given date range.
          else  "";*/

//result :: end_dt;
result :: if( DO_READ_IDS_EVENT_FILE and WATERMARK_REQUIRED and  last_file_nm != "EMPTY_FILE_LIST") //storing last event file picked timestamp for next run
                string_split_no_empty(last_file_nm,".")[length_of(string_split_no_empty(last_file_nm,".")) - 3]                        
             else
                END_DATE;
end;
]|3|9|FK|Holds the new END_DATE value to write back into WATERMARK_FILENAME|{0|}}
{30001002|XXparameter|GET_DML_FILE|$[ 
if(DO_READ_IDS_EVENT_FILE)
  PUB_DATAHUB_DML + "/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + SOURCE_ENTITY + ".dml"
else if(SOURCE_IS_REDUCED) 
  PUB_DATAHUB_DML + "/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + SOURCE_ENTITY + ".reduced.dml" 
else (
  if(IS_IDS_DML_WITH_NK == 0)
    PUB_DATAHUB_DML + "/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + SOURCE_ENTITY + ".dml" 
  else 
    PUB_DATAHUB_DML + "/nk/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + SOURCE_ENTITY + ".dml" 
)
]|3|9|K|Path to the record format for the source data. Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|GET_DML|$[ expand_type(read_type(GET_DML_FILE)) ]|3|9|RK|The record format for the source data.|{0|}}
{30001002|XXparameter|USER_DEFINED_OUTPUT_FIELDS||3|9|FK|List of output fields selected by user. This will allow the clean/source/lookup file to be created with only those fields, the list of which is provided in this parameter.|{0|}}
{30001002|XXparameter|RMF_OUTPUT_DML|$[
if(USER_DEFINED_OUTPUT_FIELDS == "" ) join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr;\\n  decimal("\\\\x01") src_dataset_id;\\nend;', GET_DML)
else 
  join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr;\\n  decimal("\\\\x01") src_dataset_id;\\nend;', join_types(add_fields("record\\nend", for(let field in record_info(GET_DML)) : if(vector_search(string_split(USER_DEFINED_OUTPUT_FIELDS, ","), field.name) != -1) field), 
        'record
          unsigned integer(8)  dxf_hk_part1 =  0 /*Added by Integration Framework. First 8 bytes of the natural key hash.*/;
          unsigned integer(8)  dxf_hk_part2 =  0 /*Added by Integration Framework. Second 8 bytes of the natural key hash.*/;
          integer(8)  dxf_sk =  0 /*Added by Integration Framework. Surrogate key.*/;
          decimal("\\\\x01",0)   src_env_sk = NULL("") /*BIGINT*/;
          datetime("YYYYMMDDHH24MISS")("\\\\x01")   ids_updt_dttm = NULL("");
        end'));
]|3|9|RK|The re-generated output DML based on the list of User-Defined fields specified in "USER_DEFINED_OUTPUT_FIELDS" parameter. If no User-Defined fields are specified, this DML will be same as GET_DML.|{0|}}
{30001002|XXparameter|SOURCE_TYPE_NAME|source_$[ re_replace(SOURCE_LOWER, "[^a-zA-Z0-9_]", "_") ]_t|3|9|RK|The type name to use in the source DML.|{0|}}
{30001002|XXparameter|ADDITIONAL_FIELDS_DML|record
end|3|9|RFK|Additional DML to be appended to the DMF header and prepended to the get DML.  Defaults to an empty record, which is ignored.|{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|/* Do Not Edit.  This file is generated automatically by combining
 * "$AI_DML/dxf_header.dml", any "$ADDITIONAL_FIELDS_DML", and
 * "$AI_DML/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.dml".
 * Changing the Get DML and resaving the get configuration will update this file.
 */

type $SOURCE_TYPE_NAME =
$[
add_fields("record\\nend",
  record_info(
    expand_type(
      join_types(join_types(
        read_type("/~$PUB_DXF_DML/dxf_header.dml"),
        ADDITIONAL_FIELDS_DML),
        remove_fields(RMF_OUTPUT_DML, [vector "filename", "file_rec_cntr", "src_dataset_id"])))))
];

metadata type = $SOURCE_TYPE_NAME;|3|9|K|The input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|FILTER_EXPRESSION||20|9|FK||{0|}}
{30001002|XXparameter|DO_CAPTURE_PRE_DESELECT|False|13|9|FK|@{0|}}
{30001002|XXparameter|FILTER_AFTER_DEDUP_EXPR||20|9|EFK|Filter expression before reformatting|{0|}}
{30001002|XXparameter|DO_CAPTURE_POST_DESELECT|False|13|9|FK|@{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|DO_SOURCE|0|1|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|1|1|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|1|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|TRANSFORM_XFR||8|9|FK|Reformat transform|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS_KEY||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info(LOOKUP_FIELDS_KEY) ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_DML|$[ add_fields(
    "record\\nend",
    for ( let f in record_info(GET_DML_PLUS_HEADER) ) :
      if ( LOOKUP_FIELD_NAME_VEC == [vector] or f.name member LOOKUP_FIELD_NAME_VEC )
        f)
]|3|9|RFK|The record format for any lookup output file.  Defaults to the input DML, plus a DMF header, reduced to the fields specified in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_KEY||3|9|EFK|\{field_1; ...; field_n\}: Optional: The key to use for lookup.  When present, a serial lookup file will be produced.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_bottom")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[
begin
let string("") field = "";
for(let key in key_info(LOOKUP_KEY)) begin block eff_dt_fld_nm
  for(let modifiers in key.modifiers) if(starts_with(modifiers, "interval_top")) begin
    field = key.field_name;
    exit eff_dt_fld_nm;
  end    
end block eff_dt_fld_nm
result ::  field;
end
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|DO_FIX_INTERVAL|$[if(EFFECTIVE_DATE_FIELD_NAME == "" && END_DATE_FIELD_NAME == "") 0 else 1]|13|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|$[DO_FIX_INTERVAL]|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.|3|9|FK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member LOOKUP_FIELD_NAME_VEC )
      k)
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ make_key(vector_concat(
    key_info(re_replace(re_replace(LOOKUP_KEY, " interval_bottom;.*", "\}"), " interval_bottom overlapping;.*", "\}")),
    key_info(EXTRA_DEDUP_SORT_KEY)))
]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|true|13|9|EK|@{0|}}
{30001002|XXparameter|___ACE_Template_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|ACE_AVAILABLE_PATTERNS|$[
begin
  result :: vector_concat(
    [vector (string(long))""],
    vector_sort_dedup_first(
      vector_concat(
        if ( SOURCE_FILE_PATTERN == "" ) [vector] else [vector SOURCE_FILE_PATTERN],
        for ( let file in directory_listing(IDS_DATA_PATH, "*.*") ) :
          if ( re_index(file, "[.](dat)(.gz)?$") > 0 )
            re_replace(file, "([0-9][-/._0-9]*[0-9]\|processed)", "*"))));
end
]|3|9|RK|A vector of all the file patterns available in the Source Pending System directory, plus any existing source pattern.  The list begins with an empty entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|ACE_AVAILABLE_PATTERNS_DISPLAY_NAMES|$[ for ( let p in ACE_AVAILABLE_PATTERNS ) :
    if ( p == "" )
      "Please Select a Pattern."
    else
      p
]|3|9|RK|A vector of all the display names of the file patterns available in the Source Pending System directory, plus any existing pattern.  The list begins with a display entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC:eme|$[ 
string_split_no_empty(
   if (DO_READ_IDS_EVENT_FILE) 
      PUB_DATAHUB_MFS + "/event/" + SOURCE_SYSTEM + "/" + string_replace(string_replace(SOURCE_FILE_PATTERN, "*", "YYYYMMDDHH24MISS"), "?", "")
   else
        if( ends_with(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), ".dat.gz") ) 
                string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/", DATASET_IDENTIFIER, "/", string_replace(string_replace(SOURCE_FILE_PATTERN, "*", "YYYYMMDD"), "?", "")) 
        else
                string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/", DATASET_IDENTIFIER, "/", string_replace(string_replace(SOURCE_FILE_PATTERN, "*", "YYYYMMDD"), "?", ""), ".dat.gz")
, "\\n")

]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC:sandbox|$[
// If need to pick the latest event file only, parameter value for PICK_LATEST_EVENT_FILE will be true.
// If need to pick the event files on the basis of RUN_ID, parameter value for PICK_LATEST_EVENT_FILE will be false and pass the wildcard(*).
// If need to pick the ids file, DO_READ_IDS_EVENT_FILE and PICK_LATEST_EVENT_FILE will be false and process will be as it is.
// If need to pick events files from last consumed event, DO_READ_IDS_EVENT_FILE and WATERMARK_REQUIRED should be true and time in watermark file will be in format YYYYMMDDHH24MISS

begin

  let string("") file_nm = "";
  
  let datetime("YYYYMMDDHH24MISS") watermark_tm =       if( length_of(WATERMARK_DATE) == 14)
                                                                                                (datetime("YYYYMMDDHH24MISS"))WATERMARK_DATE
                                                                                        else
                                                                                                (date("YYYYMMDD"))WATERMARK_DATE;
  let datetime("YYYYMMDD") current_tm = now1();
  let string("") final_pattern=if(!ends_with(SOURCE_FILE_PATTERN ,".dat.gz")) SOURCE_FILE_PATTERN + "*.dat.gz" else SOURCE_FILE_PATTERN ;
  let string("") event_file_pattern = if(PICK_LATEST_EVENT_FILE) SOURCE_FILE_PATTERN else (string_replace(string_replace(SOURCE_FILE_PATTERN ,"?", ""), "*.dat.gz", RUN_ID + ".dat.gz")); 
  
  let decimal("") days_before = DAYS_BEFORE;
  let decimal("") days_after = DAYS_AFTER;
  
  let date("YYYYMMDD") strt_dt = if( length_of(WATERMARK_DATE) == 14)
                                                        datetime_add((date("YYYYMMDD")) (datetime("YYYYMMDDHH24MISS")) START_DATE, (-1 * days_before))
                                                  else
                                                        datetime_add((date("YYYYMMDD")) START_DATE, (-1 * days_before));
  let date("YYYYMMDD") end_dt = if( length_of(WATERMARK_DATE) == 14) 
                                                        if( (date("YYYYMM"))current_tm != (date("YYYYMM"))watermark_tm) 
                                                                datetime_add((date("YYYYMMDD"))(datetime("YYYYMMDDHH24MISS")) END_DATE, (1 * days_after)) else (date("YYYYMMDD"))(datetime("YYYYMMDDHH24MISS")) END_DATE
                                                else
                                                        if( (date("YYYYMM"))current_tm != (date("YYYYMM"))watermark_tm) 
                                                                datetime_add((date("YYYYMMDD"))END_DATE, (1 * days_after)) else (date("YYYYMMDD"))END_DATE;
  
  let string("")[int] ids_file_list = [vector];
  let date("YYYYMMDD") file_date = strt_dt;
  let datetime("YYYYMMDDHH24MISS") file_tm = START_DATE;
  
  
  if(DO_READ_IDS_EVENT_FILE && PICK_LATEST_EVENT_FILE)
        ids_file_list = [vector vector_sort((for (let string("") line in directory_listing(IDS_DATA_PATH,event_file_pattern)) : IDS_DATA_PATH + "/" + line), \{descending\})[0]];
  else if( DO_READ_IDS_EVENT_FILE and WATERMARK_REQUIRED )
        for( let file in directory_listing(IDS_DATA_PATH, final_pattern) )
        begin
                file_tm = string_split(file, ".")[4];
                ids_file_list = if(file_tm <= (string(""))END_DATE and file_tm >= (string(""))START_DATE) vector_append(ids_file_list, IDS_DATA_PATH + "/" +file) else ids_file_list;
        end
  else if(DO_READ_IDS_EVENT_FILE)
        ids_file_list = directory_listing(IDS_DATA_PATH,event_file_pattern);
  else if (DATASET_IDENTIFIER == "many" && WATERMARK_REQUIRED == 1) 
        for(let file in directory_listing(IDS_DATA_PATH, final_pattern))
        begin
                file_date = string_split(file, ".")[1];
                ids_file_list = if(file_date <= (string(""))end_dt and file_date >= (string(""))strt_dt) vector_append(ids_file_list, IDS_DATA_PATH + "/" +file) else ids_file_list;
        end
  else
        begin
                ids_file_list = for (let string("") line in directory_listing(IDS_DATA_PATH,final_pattern)) : IDS_DATA_PATH + "/" + line;
                // 3/23: Following block added for reading archive files where two step lookup is enabled
                if(READ_ARCHIVE_FILE)
                begin
                        let string("")[int] ids_archive_file_list = for(let ids_file in ids_file_list): string_replace(ids_file, ".dat.gz", "") + ".archive.dat.gz";
                        ids_file_list = vector_union(ids_file_list, ids_archive_file_list);
                end
        end
  
  result :: ids_file_list;
end;
]|3|9||@{0|}}
{30001002|XXparameter|START_DATE:eme|YYYYMMDD|3|9||@{0|}}
{30001002|XXparameter|START_DATE:sandbox|$[ 
begin
/*let date("YYYYMMDD") watermark_dt = WATERMARK_DATE;

let date("YYYYMMDD") strt_dt = if(string_substring(watermark_dt, 7, 2) == "01") 
                                        date_add_months(watermark_dt, -1) 
                                 else 
                                        datetime_add(watermark_dt, -1 * date_day(watermark_dt) + 1);*/

result ::    if( DO_READ_IDS_EVENT_FILE ) 
                        (string(""))(datetime("YYYYMMDDHH24MISS"))datetime_add((datetime("YYYYMMDDHH24MISS"))WATERMARK_DATE, seconds = 1)
                else
                        (string(""))(date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))WATERMARK_DATE, days = 1);
end;
]|3|9||@{0|}}
{30001002|XXparameter|WATERMARK_DATE:eme|YYYYMMDD|3|9||@{0|}}
{30001002|XXparameter|WATERMARK_DATE:sandbox|$[ 
begin

let datetime("YYYYMMDDHH24MISS") watermark_tm =    if(WATERMARK_REQUIRED and DO_READ_IDS_EVENT_FILE)
                                                                                        if(file_information(WATERMARK_FILENAME).found )
                                                                                                string_split_no_empty(read_file(WATERMARK_FILENAME), "\\n")[0] 
                                                                                        else
                                                                                                now1()
                                                                                    else
                                                                                                now1();
let date("YYYYMMDD") watermark_dt = if( WATERMARK_REQUIRED and not DO_READ_IDS_EVENT_FILE)
                                                                if(file_information(WATERMARK_FILENAME).found )
                                                                        (date("YYYYMMDD"))string_split_no_empty(read_file(WATERMARK_FILENAME), "\\n")[0]
                                                                else
                                                                                today()
                                                        else
                                                                        today();
result :: if(DO_READ_IDS_EVENT_FILE) 
                (string("")) watermark_tm 
             else 
                (string("")) watermark_dt;
end;
]|3|9||@{0|}}
{30001002|XXparameter|END_DATE:eme|YYYYMMDD|3|9||@{0|}}
{30001002|XXparameter|END_DATE:sandbox|$[
begin

/*let date("YYYYMMDD") watermark_dt = WATERMARK_DATE;
let date("YYYYMMDD") current_dt = today1();

let date("YYYYMMDD") end_dt = if(string_substring(watermark_dt, 7, 2) == "01") 
                                        datetime_add(watermark_dt, -1) 
                                else if( (date("YYYYMM"))current_dt != (date("YYYYMM"))watermark_dt)
                                        date_add_months(datetime_add(watermark_dt, -1 * date_day(watermark_dt)) , 1)
                                else
                                        today1();*/
result ::     if( DO_READ_IDS_EVENT_FILE ) 
                        (string(""))(datetime("YYYYMMDDHH24MISS"))now()
                else
                        (string(""))(date("YYYYMMDD"))now();
end;
]|3|9||@{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK:eme|0|3|9||@{0|}}
{30001002|XXparameter|IS_IDS_DML_WITH_NK:sandbox|$[get_ids_with_nk_flag(SOURCE_SYSTEM, SOURCE_SYSTEM + "." + SOURCE_ENTITY, AI_PSET, PUB_DATAHUB_DML)]|3|9||@{0|}}
{30001002|XXparameter|ACE_SOURCE_FILE_LIST|$[if(AB_APPCONF_EXECUTION) string_join(SOURCE_FILE_LIST_VEC, ",") else ""]|3|9|RK|List of files created from the vector of matching files, to show on the template|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|extract|Anwar.Parvez|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2005000|894000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'get.ids' Execution Status Report


Job "get.ids" Execution started at Tuesday, June 26, 2018 05:34:22
Job completed successfully at Tuesday, June 26, 2018 05:34:43

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:21
Run performed by user manav.jindal
Total data moved through all flows: 1277405 records (643566383 bytes)
Total CPU time (all processes): 29 seconds
Average CPU utilization across all nodes: 0.00 percent
||# Make sure the serial directories exist.
set -e 
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_TEMP/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL/get.$SOURCE_SYSTEM"

# Make sure the multifile directories exist.
for d in "$AI_MFS/source.$SOURCE_SYSTEM" \\
         "$AI_MFS/clean.$SOURCE_SYSTEM" \\
         "$AI_MFS_REJECT/get.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d ")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done

# Make sure the Dataset ID Lookup exists.
touch "$DATASET_ID_LOOKUP_PATH"
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|32896|120|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Source Name - $SOURCE_NAME  |599000|73000|0|0|0|0|15159|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|8388736|160|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@[ Assign values for DXF header fields ]|1515000|87000|0|0|0|0|15158|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@1.This Graph has start Script.
2. This file uses watermark file to process history data.
|17000|115000|0|0|0|0|15048|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Added input file dataset to create IDS EME dataset.|19000|674000|0|0|0|0|14870|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|0|160|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Updated out dml to include 
ADDITIONAL_FIELDS_DML 
to populate newly added column
 values in TRANSFORM XFR|865000|343000|0|0|0|0|14930|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}15162|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}15171|531|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14925|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}15140|17|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}15147|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}15166|529|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.48571428656578064|{0|}15116|2065|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}15164|2065|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.852090060710907|{0|}15170|529|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.328000009059906|{12|493000|354000|513000|354000|554000|354000|554000|204000|639000|204000|660000|204000|}15134|2065|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.7534246444702148|{12|493000|384000|523000|384000|610000|384000|610000|309000|639000|309000|660000|309000|}15156|2065|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}15151|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}14931|2065|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}15167|529|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}15168|531|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.3378378450870514|{0|}15136|17|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}15163|17|}}
{2010501005|XXGpvertex|32|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -e -c '

if [[ x"$\{SOURCE_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{SOURCE_FILE_URL\} \| sed 's/mfile://')"
   m_touch -m 666 "$d"
fi

if [[ x"$\{CLEAN_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{CLEAN_FILE_URL\} \| sed 's/mfile://')"
   m_touch -m 666 "$d"
fi

if [[ x"$\{LOOKUP_FILE_URL\}" != x"" ]]; then
   d="$(echo  $\{LOOKUP_FILE_URL\} \| sed 's/file://')"
   rm -f "$d"
   touch -m 666 "$d"
fi
'|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(SOURCE_FILE_LIST_VEC) == 0]|3|9||@{0|}}
}}@1|Run Program|1022000|574500|0|0|0|0|15098|Create zero byte Source/Clean/Lookup if no files to process.|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|33|0|65|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|34|0|67|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|35|0|69|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|36|0|71|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|37|0|74|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|38|0|77|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_AFTER_DEDUP_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|1282000|155000|0|0|0|0|15165|FBE: Post Filter|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|39|0|79|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|40|0|82|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|41|0|85|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|42|0|87|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|43|0|89|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|91|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|94|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|46|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|47|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|48|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|out0_metadata|$[ join_types(ADDITIONAL_FIELDS_DML,RMF_OUTPUT_DML) ]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[TRANSFORM_XFR != "" && length_of(transform_info(TRANSFORM_XFR).rules) > 1]|3|9||@{0|}}
{30001002|XXparameter|select||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|1044000|155000|0|0|0|0|15161|RFMT: Optional transform|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|53|0|116|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|54|0|119|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|55|0|121|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|56|0|123|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|125|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|58|0|128|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|59|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|60|0|134|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|61|0|137|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|62|0|140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|63|0|143|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|64|0|147|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Read_Multiple_Block_Compressed_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|$[
'include "/~$PUB_DXF_DML/dxf_job_event_text.dml";
/* This type is optional.*/
type lookup_type = ' + GET_DML + ';

type filenames_type = record string(integer(4)) datafile; string(integer(4)) indexfile; end;
let decimal("") src_dataset_id = 0;
let long stride = number_of_partitions();
let long seq_number = 0;
let dxf_job_event_text_t job_info = allocate();
let string("") prev_datafile_name = "";
let string("") datafile_basename = "";
let record 
    string(integer(4)) datafile; 
    string(integer(4)) indexfile; 
    string(integer(4)) datafile_basename; 
end[int] file_vec = [vector];
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") dataset_start_time = allocate();
let long file_nbr = 0;
let long seq_nbr_in_partition = 0;
  


/*extract vector of datafile and indexfile filenames from input record*/
filenames_vector::get_filenames_vector(in)=
begin
  file_vec = for(let file in in.filenames_vec) : [record datafile file.datafile indexfile string_replace(file.datafile, ".dat.gz", ".idx") datafile_basename string_lrtrim(string_substring(file.datafile, string_rindex(file.datafile, "/") + 1, string_length(file.datafile)))];
  dataset_start_time = now();
  filenames_vector :: for(let file in in.filenames_vec) : [record datafile this_partition_path(file.datafile) indexfile this_partition_path(string_replace(file.datafile, ".dat.gz", ".idx"))];
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,in,filenames)=
begin
  seq_nbr_in_partition = invocation_number();
  if(seq_nbr_in_partition == 1 \|\| filenames.datafile != prev_datafile_name) begin
    datafile_basename = string_lrtrim(string_substring(filenames.datafile, string_rindex(filenames.datafile, "/") + 1, string_length(filenames.datafile)));
    file_nbr = vector_search(file_vec, [record datafile "" indexfile "" datafile_basename datafile_basename], \{datafile_basename\});    
    job_info = [record
      dxf_src_dataset_id  src_dataset_id,
      dxf_src_file_name   file_vec[file_nbr].datafile,
      dxf_src_rec_cnt     file_nbr + 1,
      dataset_start_dttm  dataset_start_time,
      dataset_end_dttm    now()
    ];
    seq_number = this_partition() - stride + 1;
    write_to_log("summary:" + file_vec[file_nbr].datafile, job_info.as_event_text());
    prev_datafile_name = filenames.datafile;
  end
  seq_number = seq_number + stride;
  src_dataset_id = 0;
  out.ids_updt_dttm :1: if(is_null(read.ids_updt_dttm)) ' + (vector_search(record_info_item(GET_DML, "name"), "ids_create_dttm") != -1 ? 'read.ids_create_dttm' : '"19000101000000"') + ' else read.ids_updt_dttm;
  out.src_env_sk :1: first_defined(read.src_env_sk,0);   //This code has been added to handle records for which src_env_sk has been populated as NULL from rebates applications. Confirmation is needed on how to handle this on production.
  out.file_rec_cntr :1: seq_number;
  out.filename :1: filenames.datafile;
  out.src_dataset_id :1: 0;
  out.* :2: read.*;
  out.* :3: in.*;  
end;'
]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$RMF_OUTPUT_DML|3|9||@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Block-Compressed Data|304000|61000|0|0|0|0|14884|Read IDS Files|Ab Initio Software|Built-in 2.15.6.r36.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|149|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|66|0|151|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|67|0|153|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|68|0|155|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|69|0|157|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|70|0|159|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|71|0|161|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|72|0|163|0|{@{}@384|.5|.5|{0|}14883|532|}}
{2010501005|XXGpvertex|73|0|165|0|{Reads data from multiple concatenated block-compressed data files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-multi-bc-data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/merge-bc-data|3|2|H$||{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Lookup key|{0|}}
{30001002|XXparameter|_ab_key_to_port_validation_map|key read|3|2|$||{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if the reformat transform rejects records read from input files|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.15.6.r35.0|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.15.6.r35.0:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_data|Ignore (Continue, ignoring unindexed data)|15|1|Fl|What to do in case of extra (unindexed) data|{3|Reject (Reject corresponding input record)|Ignore (Continue, ignoring unindexed data)|Process (Continue, processing unindexed data)|}}
{30001002|XXparameter|extra_data.display_name|extra-data|3|9|P|@{0|}}
{30001002|XXparameter|extra_data.condition|version 2.15.2.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|extra_data_keyword|value extra-data R* reject value extra-data I* ignore value extra-data P* process default dollar_substitution Ignore|3|13|Kv|What to do in case of extra (unindexed) data|{0|}}
{30001002|XXparameter|extra_data_keyword.condition|version 2.15.2.r24.0:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp extra_data_keyword extra-data|3|2|$||{0|}}
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
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|num_variables|2|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional lookup_type read <parameter out_metadata>|3|2|H$|Metadata for records read from input files|{0|}}
{30001002|XXparameter|variable2|filenames_type filenames "record string(integer(4)) datafile; string(integer(4)) indexfile; end"|3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|filenames_vector filenames_vector "record string(integer(4)) datafile; string(integer(4)) indexfile; end [integer(4)]"|3|2|H$||{0|}}
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_operations_analysis|7|1|2|H$||{0|}}
{30001002|XXparameter|operation1|filenames_vector::get_filenames_vector(in)|3|2|H$|extract vector of datafile and indexfile filenames from input record|{0|}}
{30001002|XXparameter|operation2|optional out::reformat(read, in, filenames)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation7_analysis|filenames::copyfilenames(filenames_vector)|3|2|H$||{0|}}
{30001002|XXparameter|extra_transforms_analysis|filenames::copyfilenames(filenames_vector) = begin filenames :: filenames_vector[0];end;|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in|3|2|H$||{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=read,r|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|type2|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation3|optional out::output_for_error(error_info, read)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation4|optional error::make_error(error_info, read)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::log_error(error_info, read)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation6|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
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
}}@0|Read Multiple Block-Compressed Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|74|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|75|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|76|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|77|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|78|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|79|0|182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|80|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|81|0|188|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.pre.deselect.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.pre.deselect.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPRESSION) && DO_CAPTURE_PRE_DESELECT]|3|9||@{0|}}
}}@0|@757000|394500|0|0|0|0|15067|OFIL: Capture Pre Filter Deselect|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|82|0|190|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|83|0|193|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|84|0|195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|85|0|199|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record 
  record
    string(integer(4)) datafile; 
  end[int] filenames_vec;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_XFR/dataset_id.xfr";
let string("")[int] filenames = $[string_representation(SOURCE_FILE_LIST_VEC)];

out::create(index)=
begin
  out.filenames_vec :: for(let file in filenames) : [record datafile file];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(SOURCE_FILE_LIST_VEC) >= 1]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@49000|81000|0|0|0|0|14873|List IDS Files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|86|0|201|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|87|0|203|0|{@{}@384|.5|.5|{0|}14880|17|}}
{2010203004|XXGoport|88|0|205|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|89|0|207|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|90|0|209|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|91|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|93|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|94|0|227|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_DATA_PATH/$SOURCE_FILE_PATTERN", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH/$SOURCE_FILE_PATTERN|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$GET_DML_FILE|3|2|f$|@{0|}}
}}@0|@350000|753000|0|0|0|0|14932|First IDS file for view data|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|95|0|229|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|96|0|232|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|97|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|98|0|237|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.$RUN_ID.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.$RUN_ID.log|3|2|$|@{0|}}
}}@0|@487000|582500|0|0|0|0|15148|Get Job Log|Ab Initio Software|@1|10000|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|99|0|239|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|100|0|242|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|101|0|244|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|102|0|247|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$[SOURCE_FILE_LIST_VEC[0]]", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$[SOURCE_FILE_LIST_VEC[0]]|3|9||@{0|}}
{30001002|XXparameter|condition|AB_PARAMETER_ENV|3|10|d|@{0|}}
{30001002|XXparameter|condition:eme|1|3|9||@{0|}}
{30001002|XXparameter|condition:sandbox|0|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1)|3|1|l|@{0|}}
}}@0|@87000|743500|0|0|0|0|14926|Input File|Ab Initio Software|@1|100|0|@6|@1|-1|-1|}}
{2010203004|XXGoport|103|0|249|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|104|0|252|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|105|0|254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|106|0|257|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$PUB_DXF_XFR/dxf_process_log.get_ids.default.xfr|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|$[ GET_DML_PLUS_HEADER ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|DA_xfr_status\|\}\{56\|CTL10021\|\}\{51\|1\|DA_parameter\|\{56\|transform\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@1546952|128880|683000|208000|145000|126000|15152|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|107|0|259|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|108|0|262|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|109|0|264|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|110|0|266|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|111|0|268|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|112|0|271|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|113|0|273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|114|0|276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|115|0|279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|116|0|282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|117|0|285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|118|0|288|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|119|0|290|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|120|0|292|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010203004|XXGoport|121|0|294|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|122|0|296|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010203004|XXGoport|123|0|298|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|124|0|300|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9919|17|}}
{2010203004|XXGoport|125|0|302|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|126|0|304|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|127|0|306|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|128|0|308|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|129|0|310|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|130|0|312|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|131|0|314|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|132|0|316|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|133|0|319|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@1843913|361047|671000|180000|56000|50000|15135|Optional: Source|Ab Initio Software||1|1000|-1||6|record_id	== '397416000_A'
|33025|-1|-1|}}
{2010202004|XXGiport|134|0|321|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|135|0|324|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|136|0|326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|137|0|329|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1844913|516047|671000|285000|56000|50000|15157|Optional: Clean|Ab Initio Software||1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|138|0|331|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|139|0|334|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|140|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|141|0|339|0|{|{}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|142|0|341|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010210004|XXGflow|143|0|343|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9922|2065|}}
{2010503005|XXGfvertex|144|0|351|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.post.deselect.$RUN_ID.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.post.deselect.$RUN_ID.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_AFTER_DEDUP_EXPR) && DO_CAPTURE_POST_DESELECT]|3|9||@{0|}}
}}@0|@1262000|444500|0|0|0|0|15129|OFIL: Capture Pre Filter Deselect-1|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|145|0|353|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|146|0|356|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|147|0|358|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|148|0|361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";

type input_type = $GET_DML;
let decimal("") src_dataset_id = 0;

//Temp variables to populate event_text
let long cntr=0;
let long stride = number_of_partitions();
let long seq_number = 0; /* Assign record number on each source record.*/
//let long prev_seq_number = -1;  // This is a temporary variable to hold prev seq number, however it still holds the value of prev seq number once control goes to first record of next file.
let long log_file_seq_number = 0; // Holds the sequence number for each input record and this gets incremented with 1 for each new record from input.
let long log_file_prev_seq_number = -1; // Holds the previous sequence number however it still holds the value of prev seq number once control goes to first record of next file.
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") task_start_time = now();
let datetime("YYYY-MM-DD HH24:MI:SS.nnnnnn") dataset_start_time = allocate();
let string("") src_file_name = ""; // Holds the name of the source file to output to log.
let dxf_job_event_text_t job_info = allocate();

filename :: get_filename(in) =
begin
  log_file_seq_number = 0;
  seq_number = this_partition() - stride + 1;
  //prev_seq_number = this_partition() - stride;
  if(cntr==0) // This condition is required to store first file name to global variable.
  begin
    src_file_name = in.filename;
    cntr = cntr + 1;
  end;
  dataset_start_time = now();
  filename :: this_partition_path(in.filename); /* Assign local file name of each file picked up for processing. */
end;

out :: reformat(read, filename, in) =
begin
  src_dataset_id = in.src_dataset_id;
  if(log_file_prev_seq_number + 1 != log_file_seq_number) // Until control reaches to first record of next file, the condition remains false. Once condition is true, it tries to ouput a log record with necessary information.
  begin 
        job_info = [record
    dxf_src_dataset_id  src_dataset_id,
    dxf_src_file_name   src_file_name,
    dxf_src_rec_cnt     log_file_prev_seq_number + 1,
    dataset_start_dttm  dataset_start_time,
    dataset_end_dttm    now()
  ];
        write_to_log("summary:" + src_file_name, job_info.as_event_text());
        //prev_seq_number = seq_number; 
        log_file_prev_seq_number = log_file_seq_number;
        src_file_name = in.filename;  
  end 
  else 
  begin
        //prev_seq_number = seq_number;
        log_file_prev_seq_number = log_file_seq_number;
  end
  
  log_file_seq_number = log_file_seq_number + 1;
  seq_number = seq_number + stride;
  out.ids_updt_dttm :: if(is_null(read.ids_updt_dttm)) read.ids_create_dttm else read.ids_updt_dttm;
  out.src_env_sk :: first_defined(read.src_env_sk,0);   //This code has been added to handle records for which src_env_sk has been populated as NULL from rebates applications. Confirmation is needed on how to handle this on production.
  out.filename :: filename;
  out.file_rec_cntr :: seq_number;
  out.* :1: read.*;
  out.* :: in.*;
end;

/* Write last source file information to log as reformats fills the log information of all the other sources files. */
out :: final_log_output() =
begin
  job_info = [record
    dxf_src_dataset_id  src_dataset_id,
    dxf_src_file_name   src_file_name,
    dxf_src_rec_cnt     log_file_prev_seq_number + 1,
    dataset_start_dttm  dataset_start_time,
    dataset_end_dttm    now()
  ];

  out.event_type :: "summary:" + src_file_name;
  out.event_text :: job_info.as_event_text();
end;|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$RMF_OUTPUT_DML|3|9||@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH|3|2|$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Files|369000|67000|0|0|0|0|14873|Read IDS Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|149|0|363|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|150|0|365|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|151|0|367|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|152|0|369|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|153|0|371|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|154|0|373|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|155|0|375|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|156|0|377|0|{@{}@384|.5|.2857142984867096|{0|}14872|532|}}
{2010501005|XXGpvertex|157|0|379|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|158|0|381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|159|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|160|0|387|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|161|0|390|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|162|0|393|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|163|0|396|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|164|0|399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|165|0|402|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|$[ length_of(SOURCE_FILE_LIST_VEC) ]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\x01") filename;
  decimal("\\x01") src_dataset_id;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_XFR/dataset_id.xfr";
let string("")[int] filenames = $[string_representation(SOURCE_FILE_LIST_VEC)];

out::create(index)=
begin
  out.filename:: filenames[index - 1];
  out.src_dataset_id :: if ( this_partition() == 0 ) get_dataset_id($"DATASET_ID_LOOKUP_PATH") else 0;  /* The index into the Source Process table. */
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(SOURCE_FILE_LIST_VEC) >= 1]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@48000|81000|0|0|0|0|14861|List IDS Files-1|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|166|0|404|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|167|0|406|0|{@{}@384|.5|.5|{0|}14862|17|}}
{2010203004|XXGoport|168|0|408|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|169|0|410|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|170|0|412|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|171|0|414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|172|0|417|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|173|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|174|0|425|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPRESSION|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPRESSION)]|3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|442000|181000|0|0|0|0|15117|Optional: Filter IDS Data|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|175|0|427|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|176|0|430|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|177|0|433|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|178|0|435|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|179|0|437|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|180|0|439|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|181|0|443|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|182|0|445|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|183|0|448|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|184|0|451|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|185|0|454|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|186|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|187|0|460|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|188|0|468|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1842913|676047|671000|390000|56000|50000|15137|Optional: Lookup|Ab Initio Software||1|1000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|189|0|470|0|{@{}@661000|409000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|190|0|473|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|191|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|192|0|479|0|{Subgraph created from graph "get.ids"|{}@0|@747500|140000|0|0|0|0|15142|Pick the lastest instance of every record|Anwar.Parvez|Created 10/26/2016 7:42:45 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|804000|277000|3|}}
{2010210004|XXGflow|193|0|481|0|{@{}@384|.5|.5|{0|}12132|17|}}
{2010501005|XXGpvertex|194|0|483|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|9||@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Dedup Sorted|466000|75000|0|0|0|0|12125|DSRT \{dxf_hk_part1; dxf_hk_part2\}|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|195|0|485|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|196|0|487|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|197|0|489|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|198|0|491|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|199|0|493|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|200|0|495|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|201|0|498|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|202|0|500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|203|0|503|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|204|0|506|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|205|0|509|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|206|0|512|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|207|0|515|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|208|0|523|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|190000|56500|0|0|0|0|12133|Sort \{dxf_hk_part1; dxf_hk_part2; ids_updt_dttm\}|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|209|0|525|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|210|0|528|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|211|0|530|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|212|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|213|0|535|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|214|0|541|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|215|0|545|0|{@{}@0|0|0|0|in0|.45126353790613716|@@@13840|0|}}
{2010600005|XXGgraph|216|0|549|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|FIX_END_DATE||3|8|=|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE||3|8|=|@{0|}}
}}@0|@1492000|486678|317000|338000|892000|502000|15133|Prepare Output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.18630751967430115|891000|502000|1|}}
{2010240003|XXGlegend|217|0|551|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|218|0|553|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|219|0|555|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|220|0|557|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|221|0|559|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|222|0|561|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|223|0|563|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|224|0|565|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|225|0|569|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|226|0|572|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|227|0|574|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|228|0|577|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|229|0|579|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|230|0|581|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|231|0|583|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|232|0|589|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|591|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|234|0|593|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|235|0|599|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9927|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|236|0|601|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|237|0|603|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|238|0|605|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|239|0|607|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|240|0|609|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|241|0|611|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|242|0|613|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|243|0|615|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|244|0|617|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|245|0|619|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|246|0|621|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|247|0|623|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|248|0|625|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|249|0|627|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|250|0|629|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|251|0|631|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|252|0|633|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|253|0|635|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|254|0|638|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|255|0|640|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|256|0|642|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|257|0|644|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|258|0|646|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|259|0|654|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|260|0|656|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|261|0|659|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|262|0|663|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|263|0|665|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|264|0|667|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|265|0|673|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|266|0|675|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|267|0|678|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|268|0|680|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|269|0|682|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|270|0|684|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|271|0|691|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|272|0|693|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|273|0|696|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|274|0|698|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|275|0|700|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|276|0|702|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|277|0|709|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|278|0|711|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|279|0|714|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|280|0|720|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|281|0|722|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|282|0|725|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|283|0|731|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|284|0|736|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|285|0|740|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|286|0|746|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|287|0|748|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|288|0|751|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|289|0|756|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|758|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|291|0|760|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|292|0|768|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|293|0|770|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|294|0|773|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|295|0|778|0|{@{}@482000|349000|11000|11000|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|296|0|782|0|{@{}@482000|379000|11000|11000|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|297|0|786|0|{@{}@482000|409000|11000|11000|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|298|0|790|0|{@{}@307000|379000|11000|11000|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|299|0|794|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|True|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1497351152|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|300|0|796|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|301|0|798|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|302|0|800|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|303|0|802|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|304|0|804|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|305|0|806|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|306|0|808|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|307|0|810|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|308|0|812|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9919|17|}}
{2010210004|XXGflow|309|0|814|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|310|0|816|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|311|0|818|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9922|2065|}}
{2010210004|XXGflow|312|0|820|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|313|0|822|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|314|0|824|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|315|0|826|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|316|0|828|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|317|0|830|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|318|0|832|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|319|0|835|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|320|0|837|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|321|0|840|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|322|0|843|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|323|0|845|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|324|0|847|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|325|0|850|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520141|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|326|0|852|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|327|0|855|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|328|0|858|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9||@{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[
begin
let dml_key_info_vec final_key = [vector];
for(let key in key_info(LOOKUP_KEY)) begin
  if(key.modifiers == [vector]) begin
    final_key = vector_append(final_key, key);
  end
  for(let modifiers in key.modifiers) if(not starts_with(modifiers, "interval_bottom") && not starts_with(modifiers, "interval_top")) begin
    final_key = vector_append(final_key, key);
  end    
end
result ::  make_key(final_key);
end
]|3|9||@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
{30001002|XXparameter|FIX_END_DATE||3|8|=|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE||3|8|=|@{0|}}
{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9||@{0|}}
{30001002|XXparameter|condition|$[ DO_LOOKUP and LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9927|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|329|0|860|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|330|0|862|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|331|0|864|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|332|0|866|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|333|0|868|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|334|0|870|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|335|0|872|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|336|0|874|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|337|0|876|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|338|0|878|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|339|0|880|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|340|0|882|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|341|0|884|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|342|0|886|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|343|0|888|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|344|0|890|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|345|0|892|0|{|{}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|346|0|894|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|347|0|897|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|348|0|899|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|349|0|901|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|350|0|903|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|351|0|905|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|352|0|908|0|{|{}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|353|0|910|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|354|0|913|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|355|0|915|0|{|{}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|356|0|917|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|357|0|919|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|358|0|922|0|{|{}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|359|0|924|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|360|0|927|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|361|0|929|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|362|0|931|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|363|0|933|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|364|0|936|0|{|{}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|365|0|938|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|366|0|941|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|367|0|943|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|368|0|945|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|369|0|947|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|370|0|950|0|{|{}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|371|0|952|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|372|0|955|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|373|0|958|0|{|{}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|374|0|960|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|375|0|963|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|376|0|966|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|377|0|971|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|378|0|975|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|379|0|979|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DXF_XFR/keys.xfr";|3|9|RK||{0|}}
{30001002|XXparameter|LOOKUP_KEY|\{nk1; nk2; eff_dt interval_bottom; end_dt interval_top\}|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$1")
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$2")
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|86400|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|UNDATED_NATURAL_KEY|$[ re_replace(LOOKUP_KEY,
    "; *[^;]* interval_bottom;.*",
    "\}")
]|3|9|RFK|The lookup key minus any interval range.  For Type 2 loads, this should be set to the natural key.  Defaults to a the lookup key without any interval fields.|{0|}}
{30001002|XXparameter|PARTITION_KEY|$UNDATED_NATURAL_KEY|3|9|RFK|The key to partition on before processing.  For Type 2 loads, this should be set to the list natural key, if any, or else the natural key.  Defaults to the undated natural key.|{0|}}
{30001002|XXparameter|DEDUP_KEY|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    UNDATED_NATURAL_KEY
  else
    add_key(UNDATED_NATURAL_KEY,
      key_info(EFFECTIVE_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to use in the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the lookup key.  For Type 2 loads, set this to the natural key plus the effective date descending.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ if ( END_DATE_FIELD_NAME == "" )
    DEDUP_KEY
  else
    add_key(DEDUP_KEY,
      key_info(END_DATE_FIELD_NAME)[0])
]|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|CHECK_KEYS|$[ if ( not starts_with_key(DEDUP_SORT_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Sort Key.  Partition Key: " + PARTITION_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, PARTITION_KEY) )
    force_error("The Partition Key is not a prefix of the Dedup Key.  Partition Key: " + PARTITION_KEY + ", Dedup Key: " + DEDUP_KEY)
  else if ( not starts_with_key(DEDUP_SORT_KEY, DEDUP_KEY) )
    force_error("The Dedup Key is not a prefix of the Dedup Sort Key.  Dedup Key: " + DEDUP_KEY + ", Dedup Sort Key: " + DEDUP_SORT_KEY)
  else if ( not starts_with_key(DEDUP_KEY, UNDATED_NATURAL_KEY) )
    force_error("The Undated Natural Key is not a prefix of the Dedup Key.  Undated Natural Key: " + UNDATED_NATURAL_KEY + ", Dedup Key: " + DEDUP_KEY)
  else
    ""
]|3|9|K|Returns "" if there is no problem with the consistency of the keys.  Otherwise, forces an error.  Note that you must reference this parameter in order to force it to be evaluated at run time.|{0|}}
{30001002|XXparameter|FIX_END_DATE|True|13|9|RFK|@{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK|@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( FIX_EFFECTIVE_DATE ) "ascending" else "descending" ]|3|9|RK|The direction to sort the effective date field, if any.  This is based on whether we have an end date or not.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_SORT_KEY|$[ set_field_direction(DEDUP_SORT_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup sort key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|ADJUSTED_DEDUP_KEY|$[ set_field_direction(DEDUP_KEY, EFFECTIVE_DATE_FIELD_NAME, EFFECTIVE_DATE_DIRECTION) ]|3|9|RK|The dedup key adjusted so that any effective date has the right ascending or descending ordering.  This depends on whether there is an end date.|{0|}}
{30001002|XXparameter|INPUT_DML||7|1|RFsl|The full DML used in this subgraph.|{0|}}
{30001002|XXparameter|INPUT_FIELD_NAME_VEC|$[ record_info_item(INPUT_DML, "name") ]|3|9|RK|A vector of field names in the input DML.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_TYPE|$[ if ( EFFECTIVE_DATE_FIELD_NAME == "" )
    ""
  else
    (for ( let info in record_info(INPUT_DML) ) :
      if ( info.name == EFFECTIVE_DATE_FIELD_NAME )
        info.dml_type)[0]
]|3|9|K|The DML type of the effective date field.  Used for temporary variables.|{0|}}
{30001002|XXparameter|DIFF_DML|$[ add_fields("record\\nend",
    for ( let info in record_info(INPUT_DML) ) :
      if ( info.name not member [vector EFFECTIVE_DATE_FIELD_NAME, END_DATE_FIELD_NAME] )
        info)
]|3|9|FK|The DML used for comparing adjacent records.  Defaults to the input DML, excluding any effective or end dates.|{0|}}
{30001002|XXparameter|DROP_RECORD_DIFF_DML|$[ if ( "drop_record" member INPUT_FIELD_NAME_VEC )
      join_types("record\\n  decimal(1) drop_record;\\nend", DIFF_DML)
    else
      DIFF_DML
]|3|9|RK|The diff DML with drop_record as the first field.  This is used when comparing adjacent records.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ if ( "matching__eff_dt" member INPUT_FIELD_NAME_VEC )
      [vector "matching__eff_dt", EFFECTIVE_DATE_FIELD_NAME]
    else
      [vector EFFECTIVE_DATE_FIELD_NAME]
]|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1497351139|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|380|0|981|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|381|0|983|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|382|0|985|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|383|0|987|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|384|0|989|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|385|0|991|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|386|0|993|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|387|0|995|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|388|0|997|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|389|0|999|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|390|0|1001|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|391|0|1003|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|392|0|1005|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|393|0|1007|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|394|0|1009|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|395|0|1011|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|396|0|1013|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|397|0|1015|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|398|0|1018|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|399|0|1020|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|400|0|1022|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|401|0|1024|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|402|0|1026|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|403|0|1029|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|404|0|1031|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|405|0|1034|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|406|0|1037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|407|0|1040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|408|0|1043|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|409|0|1046|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|410|0|1049|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|411|0|1051|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|412|0|1054|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|413|0|1056|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|414|0|1058|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|415|0|1061|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|416|0|1065|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|417|0|1067|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|418|0|1069|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|419|0|1072|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403552|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|420|0|1074|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|421|0|1077|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|422|0|1080|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|/* Find records with the same data values and abutting or overlapping effective dates. */
out :: key_change(in1, in2) =
begin
  out :1: (( in1.$END_DATE_FIELD_NAME < in2.$EFFECTIVE_DATE_FIELD_NAME ) or  // 1) There is a gap, ...
            $[ string_join(                                                                                // 2) Or Drop Record changed, ...
                vector_concat( // Put the non-NULL tests before the NULLable tests.                        // 3) One of the data fields does not match.
                  for ( let i in record_info(DROP_RECORD_DIFF_DML) ) :
                    if ( not i.nullable )
                      printf("in1.%s != in2.%s", i.name, i.name),
                  for ( let i in record_info(DIFF_DML) ) :
                    if ( i.nullable )
                      printf("first_defined(in1.%s != in2.%s, is_null(in1.%s) != is_null(in2.%s))",
                             i.name, i.name, i.name, i.name)),
                " or\\n            ") ] );
  out :2: 1;
end;


/* Keep the oldest Eff Date and the latest End Date amongst a group of matching records.
Because the incoming records have the earliest End Eff Date first, this will keep the longest (last) End Date. 
Other "physical" fields come from the last (latest) record, except for the Source Sequence Number, if any. */
out :: rollup(in) =
begin
  out.* :: in.*;
  $[ string_join(
      for ( let f in KEEP_FROM_FIRST_VEC ) :
        "out." + f + " :: first(in." + f + ");",
      "\\n  ") ]
end;|3|9|j|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|423|0|1082|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|424|0|1085|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|425|0|1087|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|426|0|1089|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|427|0|1091|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|428|0|1094|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.update_clauses|retain_old_default|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of public variables in rollup|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::rollup(temp, in) : out::rollup(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
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
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|429|0|1096|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|430|0|1099|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|431|0|1102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|432|0|1105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|433|0|1108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|434|0|1111|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$[
if(FIX_END_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_eff_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_eff_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_eff_dttm :: temp.cur_eff_dttm;
  out.cur_eff_dttm :: in." + EFFECTIVE_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" + 
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_eff_dttm, 0, microseconds = -(" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n":
        "  out." + END_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + END_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + END_DATE_FIELD_NAME + " :: in." + END_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else if(FIX_EFFECTIVE_DATE)
"/* Remember the current and previous effective dates. */
type temporary_type =
record
  " + EFFECTIVE_DATE_TYPE + " cur_end_dttm = NULL;
  " + EFFECTIVE_DATE_TYPE + " prev_end_dttm = NULL;
end;


/* Initialize the Effective Date accumulator to NULL. */
temp :: initialize(in) =
begin
  temp :: allocate_with_nulls();
end;


/* Remember the new Effective Date and carry over the Previous (Later) Effective Date. */
out :: scan(temp, in) =
begin
  out.prev_end_dttm :: temp.cur_end_dttm;
  out.cur_end_dttm :: in." + END_DATE_FIELD_NAME + ";
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.\\n" +   
  ((string_index(EFFECTIVE_DATE_TYPE, "date") != 0)?
        "out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_end_dttm >= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    datetime_add(temp.prev_end_dttm, 0, microseconds = (" + ADJACENT_INTERVAL_MICROSECONDS+ "));  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*\\n":
        "  out." + EFFECTIVE_DATE_FIELD_NAME + " :1: if ( temp.prev_eff_dttm <= in." + EFFECTIVE_DATE_FIELD_NAME + " )
    temp.prev_eff_dttm - " + ADJACENT_INTERVAL_MICROSECONDS + ";  // This is skipped for the first record in NK group.
  out." + EFFECTIVE_DATE_FIELD_NAME + " :: in." + EFFECTIVE_DATE_FIELD_NAME + ";  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;\\n") + 
"end;"
else ""
]|3|9|j|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ FIX_END_DATE \|\| FIX_EFFECTIVE_DATE ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|435|0|1113|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|436|0|1116|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|437|0|1118|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|438|0|1120|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|439|0|1122|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|440|0|1125|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Ordering of input data|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.4.16:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_input_display_values|In-memory:Inputneednotbesorted Inputmustbesortedorgrouped|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input_display_values.display_name|sorted-input-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key_method|value sorted-input False True default constant True|13|13|Fv|How groups are specified|{0|}}
{30001002|XXparameter|key_method.display_name|key-method|3|9|P|@{0|}}
{30001002|XXparameter|key_method.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|key_method_display_values|Usekey_changefunction Usekeyspecifier|3|2|H$||{0|}}
{30001002|XXparameter|key_method_display_values.display_name|key-method-display-values|3|9|P|@{0|}}
{30001002|XXparameter|key||19|2|RF$|Key to define scan groups|{0|}}
{30001002|XXparameter|key.condition|param key-method True|3|15|P?|@{0|}}
{30001002|XXparameter|positional_key|value key-method False "" sameas key|19|13|Ov|Key to define rollup groups|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required and optional DML functions|{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
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
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.16.0.r3: param sorted-input False|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|10|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of intermediate steps in scan|{0|}}
{30001002|XXparameter|variable1|optional temporary_type temp|3|2|H$|Temporary variable|{0|}}
{30001002|XXparameter|operation1|optional integer(8) out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation2|optional temp ? temp::initialize(in) : NULL|3|2|H$|Initialize temporary|{0|}}
{30001002|XXparameter|operation3|temp ? temp::scan(temp, in) : out::scan(in)|3|2|H$|Do computation|{0|}}
{30001002|XXparameter|operation4|optional temp ? out::finalize(temp, in) : NULL|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation5|optional integer(8) out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6|optional integer(8) out::key_change(in in1, in in2)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|operation1_analysis|integer(8) input_select_out::input_select(in)|3|2|H$|Select input record|{0|}}
{30001002|XXparameter|operation5_analysis|integer(8) output_select_out::output_select(out)|3|2|H$|Select output record|{0|}}
{30001002|XXparameter|operation6_analysis|integer(8) key_change_out::key_change(in in, in in)|3|2|H$|Determine if key changed|{0|}}
{30001002|XXparameter|_simple_transform_operation|scan|3|2|H$|What operation should transform editor open with|{0|}}
{30001002|XXparameter|_simple_transform_operation.condition|version 3.0:|3|15|P?|@{0|}}
{30001002|XXparameter|sorted_mpname|scan|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-scan|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|filter_aggregate_analysis|out=filter_xfr(transform.input_select); out=filter_xfr(transform.output_select)|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|441|0|1127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|442|0|1130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|443|0|1133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|444|0|1136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|445|0|1139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|446|0|1142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|447|0|1144|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|448|0|1147|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|449|0|1150|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|450|0|1152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|451|0|1155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|452|0|1158|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(EFFECTIVE_DATE_FIELD_NAME) &&
   not is_blank(END_DATE_FIELD_NAME)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|453|0|1160|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|454|0|1163|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|455|0|1166|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|456|0|1168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|457|0|1171|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|458|0|1174|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|459|0|1177|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|460|0|1180|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|461|0|1185|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|462|0|1187|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|463|0|1190|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|464|0|1192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|465|0|1196|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|466|0|1198|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|467|0|1201|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|468|0|1204|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|469|0|1206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|470|0|1209|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|471|0|1212|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|472|0|1214|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|473|0|1216|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|474|0|1220|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|475|0|1222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|476|0|1225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|477|0|1228|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|478|0|1230|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|479|0|1233|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|480|0|1236|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|481|0|1239|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|482|0|1241|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|483|0|1243|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|484|0|1245|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|485|0|1247|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|486|0|1249|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|487|0|1251|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|488|0|1253|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|489|0|1255|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|490|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|491|0|1261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|492|0|1265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|493|0|1269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|494|0|1272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|495|0|1275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|496|0|1278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|497|0|1281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|498|0|1284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|499|0|1287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|500|0|1290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|501|0|1293|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|502|0|1295|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|503|0|1298|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|504|0|1301|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|505|0|1303|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|506|0|1306|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|507|0|1309|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|508|0|1312|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|509|0|1315|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|510|0|1318|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|511|0|1324|0|{Subgraph created from graph "get.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[not DO_READ_IDS_EVENT_FILE]|3|9|F||{0|}}
}}@0|@38000|184500|0|0|0|0|15169|Read IDS Data File|Anwar.Parvez|Created 8/16/2017 7:09:53 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|572000|219000|3|}}
{2010501005|XXGpvertex|512|0|1328|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Broadcast|195000|97000|0|0|0|0|14857|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|513|0|1330|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|514|0|1333|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|515|0|1336|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|516|0|1338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|517|0|1341|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|518|0|1348|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010203004|XXGoport|519|0|1352|0|{@{}@0|0|0|0|out1|0.0|@@@9232|0|}}
{2010600005|XXGgraph|520|0|1356|0|{Subgraph created from graph "get.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_READ_IDS_EVENT_FILE]|3|9|F||{0|}}
}}@0|@136500|357500|0|0|0|0|15172|Read IDS Event File|Anwar.Parvez|Created 8/16/2017 7:10:00 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|637000|225000|3|}}
{2010501005|XXGpvertex|521|0|1360|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Broadcast|199000|97000|0|0|0|0|14863|Broadcast-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|522|0|1362|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|523|0|1365|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|524|0|1368|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|525|0|1370|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|526|0|1373|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|527|0|1381|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010203004|XXGoport|528|0|1385|0|{@{}@0|0|0|0|out1|0.0|@@@9232|0|}}
{2010501005|XXGpvertex|529|0|1389|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";

let long task_start_time = now();
let long task_end_time = 0;

/* Only roll up job logs. */
out :: input_select(in) =
begin
  out :: starts_with(in.event_type, "summary:");
end;

/* Roll up all the job log entries for a given dataset. */
out :: rollup(in) =
begin
  let dxf_job_event_text_t job_info = reinterpret(in.event_text);
  let start_time = min(job_info.dataset_start_dttm);
  let min_end_time = min(job_info.dataset_end_dttm);
  let max_end_time = max(job_info.dataset_end_dttm);
  let datetime("YYYYMMDDHH24MISSnnnnnn") modified_time = datetime_from_unixtime((integer(8))multifile_information(job_info.dxf_src_file_name).modified);
  if ( task_end_time == 0 )
    task_end_time = now();  // This works because we are in an unsorted rollup, so we only see records after the last one arrives.  

  out.* :: job_info.*;
  out.dxf_src_dataset_id :: max(job_info.dxf_src_dataset_id);  // Use the value from partition 0.
  out.run_id :: $"RUN_ID";
  out.task_name :: $"AB_PSET_NAME";
  out.task_start_dttm :: task_start_time;
  out.task_end_dttm :: task_end_time;
  out.dataset_name :: string_substring(job_info.dxf_src_file_name, string_rindex(job_info.dxf_src_file_name, "/") + 1, 9999);
  out.dxf_src_rec_cnt :: sum(job_info.dxf_src_rec_cnt);
  out.type_of_input :: 'ids file'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_path :: string_substring(job_info.dxf_src_file_name, 1, string_rindex(job_info.dxf_src_file_name, "/"));
  out.file_size :: multifile_information(job_info.dxf_src_file_name).size; // Size of the control file.
  out.file_modified_dttm :: modified_time; //datetime_add(modified_time, hours=-5);
end;|3|9||@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|282000|560000|0|0|0|0|15102|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|530|0|1391|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|531|0|1394|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|532|0|1396|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|533|0|1398|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|534|0|1400|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|535|0|1404|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|536|0|1406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|537|0|1409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|538|0|1412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|539|0|1415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|540|0|1418|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|541|0|1424|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|464000|744500|0|0|0|0|14922|Trash|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@65|1|{1|0|}}}
{2010202004|XXGiport|542|0|1426|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|543|0|1429|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|544|0|1431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|545|0|1436|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|197000|728500|0|0|0|0|14924|Trash-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010202004|XXGiport|546|0|1438|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|547|0|1441|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|548|0|1443|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|549|0|1448|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|commandline|ksh -c -e 'echo "$\{NEW_END_DATE\}" > $\{WATERMARK_FILENAME\} '|3|3|c|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[WATERMARK_REQUIRED]|3|9||@{0|}}
}}@1|Run Program|802000|604500|0|0|0|0|15173|Update Watermark File|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|550|0|1450|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|551|0|1452|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|552|0|1454|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Run Program|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|553|0|1456|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|554|0|1459|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010600005|XXGgraph|555|0|1462|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@385000|45000|0|0|0|0|15160|Version Log|Gunit Kaur|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|946000|560000|3|}}
{2010240003|XXGlegend|556|0|1464|0|{@{}@Summary:

This graph reads IDS files as input and creates an CLEAN, SOURCE or LOOKUP file as output.
The graph uses watermark file to read IDS files (in case of FACT tables) or its data (in case of DIMENSION or REFERENCE tables) selectively.|15000|42500|0|0|0|0|1544|}}
{2010242002|XXGface|557|0|1466|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|558|0|1468|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|125000|0|0|0|0|1545|}}
{2010242002|XXGface|559|0|1470|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|560|0|1472|0|{@{}@Version         Date                           Author                                           Description
1.0               Jun 27 2016        Sripavan Pulikonda (Exusia)              Initial Version
2.0               Oct 21 2016        Gunit Kaur (Exusia)                            Duplicates removed
3.0               Oct 26 2017        Sripavan Pulikonda (Exusia)             Read multiple files for fact tables
4.0               Nov 18 2017       Sripavan Pulikonda (Exusia)             Monthly proessing support added
5.0               Jun 26 2018        Manav Jindal                                      Read Event files based on watermark|17000|235000|0|0|0|0|1571|}}
{2010242002|XXGface|561|0|1474|0|{@{}@Calibri|32896|120|1|}}
{2010110002|XXGconstant|562|0|1476|0|{@{}@{1|889770|}}}
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
{2010605001|XXGgraph_legend_legend|10|0|20|0|{3|}1|11|}
{2010241001|XXGlegend_face_face|11|0|22|0|{}11|12|}
{2010605001|XXGgraph_legend_legend|12|0|24|0|{4|}1|13|}
{2010241001|XXGlegend_face_face|13|0|26|0|{}13|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_1|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_10|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_11|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_12|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_13|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_14|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_15|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_16|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_18|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_2|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_3|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_4|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_5|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_6|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_7|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_8|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_9|}1|31|}
{2010601001|XXGgraph_vertex_vertex|31|0|62|0|{Create_zero_byte_Source_Clean_Lookup_if_no_files_to_process_|}1|32|}
{2010212001|XXGvertex_oport_oport|32|0|64|0|{0|out|}32|33|}
{2010211001|XXGvertex_iport_iport|33|0|66|0|{0|in|}32|34|}
{2010007001|XXGobject_proto_object|34|0|68|0|{}32|35|}
{2010212001|XXGvertex_oport_oport|35|0|70|0|{0|out|}35|36|}
{2010006001|XXGobject_psameas_object|36|0|72|0|{metadata|out_metadata|1|0|}36|35|}
{2010211001|XXGvertex_iport_iport|37|0|73|0|{0|in|}35|37|}
{2010006001|XXGobject_psameas_object|38|0|75|0|{metadata|in_metadata|1|0|}37|35|}
{2010601001|XXGgraph_vertex_vertex|39|0|76|0|{FBE_Post_Filter|}1|38|}
{2010212001|XXGvertex_oport_oport|40|0|78|0|{0|out|}38|39|}
{2010213001|XXGoport_dst_flow|41|0|80|0|{0|}39|31|}
{2010212001|XXGvertex_oport_oport|42|0|81|0|{1|deselect|}38|40|}
{2010213001|XXGoport_dst_flow|43|0|83|0|{0|}40|22|}
{2010212001|XXGvertex_oport_oport|44|0|84|0|{2|reject|}38|41|}
{2010212001|XXGvertex_oport_oport|45|0|86|0|{3|error|}38|42|}
{2010212001|XXGvertex_oport_oport|46|0|88|0|{4|log|}38|43|}
{2010211001|XXGvertex_iport_iport|47|0|90|0|{0|in|}38|44|}
{2010214001|XXGiport_src_flow|48|0|92|0|{0|}44|15|}
{2010007001|XXGobject_proto_object|49|0|93|0|{}38|45|}
{2010212001|XXGvertex_oport_oport|50|0|95|0|{0|out|}45|46|}
{2010006001|XXGobject_psameas_object|51|0|97|0|{metadata|out_metadata|1|0|}46|45|}
{2010212001|XXGvertex_oport_oport|52|0|98|0|{1|deselect|}45|47|}
{2010006001|XXGobject_psameas_object|53|0|100|0|{metadata|deselect_metadata|1|0|}47|45|}
{2010212001|XXGvertex_oport_oport|54|0|101|0|{2|reject|}45|48|}
{2010006001|XXGobject_psameas_object|55|0|103|0|{metadata|reject_metadata|1|0|}48|45|}
{2010212001|XXGvertex_oport_oport|56|0|104|0|{3|error|}45|49|}
{2010006001|XXGobject_psameas_object|57|0|106|0|{metadata|error_metadata|1|0|}49|45|}
{2010212001|XXGvertex_oport_oport|58|0|107|0|{4|log|}45|50|}
{2010006001|XXGobject_psameas_object|59|0|109|0|{metadata|log_metadata|1|0|}50|45|}
{2010211001|XXGvertex_iport_iport|60|0|110|0|{0|in|}45|51|}
{2010006001|XXGobject_psameas_object|61|0|112|0|{metadata|in_metadata|1|0|}51|45|}
{2010006001|XXGobject_psameas_object|62|0|113|0|{deselect_metadata|out0_metadata|0|0|}38|52|}
{2010212001|XXGvertex_oport_oport|63|0|115|0|{0|out0|}52|53|}
{2010213001|XXGoport_dst_flow|64|0|117|0|{0|}53|15|}
{2010212001|XXGvertex_oport_oport|65|0|118|0|{1|reject0|}52|54|}
{2010212001|XXGvertex_oport_oport|66|0|120|0|{2|error0|}52|55|}
{2010212001|XXGvertex_oport_oport|67|0|122|0|{3|log|}52|56|}
{2010211001|XXGvertex_iport_iport|68|0|124|0|{0|in|}52|57|}
{2010214001|XXGiport_src_flow|69|0|126|0|{0|}57|20|}
{2010007001|XXGobject_proto_object|70|0|127|0|{}52|58|}
{2010212001|XXGvertex_oport_oport|71|0|129|0|{0|out0|}58|59|}
{2010006001|XXGobject_psameas_object|72|0|131|0|{metadata|out0_metadata|1|0|}59|58|}
{2010006001|XXGobject_psameas_object|73|0|132|0|{transform0|transform0|1|0|}59|58|}
{2010212001|XXGvertex_oport_oport|74|0|133|0|{1|reject0|}58|60|}
{2010006001|XXGobject_psameas_object|75|0|135|0|{metadata|reject0_metadata|1|0|}60|58|}
{2010212001|XXGvertex_oport_oport|76|0|136|0|{2|error0|}58|61|}
{2010006001|XXGobject_psameas_object|77|0|138|0|{metadata|error0_metadata|1|0|}61|58|}
{2010212001|XXGvertex_oport_oport|78|0|139|0|{3|log|}58|62|}
{2010006001|XXGobject_psameas_object|79|0|141|0|{metadata|log_metadata|1|0|}62|58|}
{2010211001|XXGvertex_iport_iport|80|0|142|0|{0|in|}58|63|}
{2010006001|XXGobject_psameas_object|81|0|144|0|{metadata|in_metadata|1|0|}63|58|}
{2010006001|XXGobject_psameas_object|82|0|145|0|{Layout|Layout|0|0|}52|38|}
{2010006001|XXGobject_psameas_object|83|0|146|0|{in_metadata|out_metadata|0|0|}52|64|}
{2010212001|XXGvertex_oport_oport|84|0|148|0|{0|out|}64|65|}
{2010212001|XXGvertex_oport_oport|85|0|150|0|{1|filereject|}64|66|}
{2010212001|XXGvertex_oport_oport|86|0|152|0|{2|fileerror|}64|67|}
{2010212001|XXGvertex_oport_oport|87|0|154|0|{3|reject|}64|68|}
{2010212001|XXGvertex_oport_oport|88|0|156|0|{4|error|}64|69|}
{2010212001|XXGvertex_oport_oport|89|0|158|0|{5|log|}64|70|}
{2010211001|XXGvertex_iport_iport|90|0|160|0|{0|in|}64|71|}
{2010214001|XXGiport_src_flow|91|0|162|0|{0|}71|72|}
{2010007001|XXGobject_proto_object|92|0|164|0|{}64|73|}
{2010212001|XXGvertex_oport_oport|93|0|166|0|{0|out|}73|74|}
{2010006001|XXGobject_psameas_object|94|0|168|0|{metadata|out_metadata|1|0|}74|73|}
{2010212001|XXGvertex_oport_oport|95|0|169|0|{1|filereject|}73|75|}
{2010006001|XXGobject_psameas_object|96|0|171|0|{metadata|filereject_metadata|1|0|}75|73|}
{2010212001|XXGvertex_oport_oport|97|0|172|0|{2|fileerror|}73|76|}
{2010006001|XXGobject_psameas_object|98|0|174|0|{metadata|fileerror_metadata|1|0|}76|73|}
{2010212001|XXGvertex_oport_oport|99|0|175|0|{3|reject|}73|77|}
{2010006001|XXGobject_psameas_object|100|0|177|0|{metadata|reject_metadata|1|0|}77|73|}
{2010212001|XXGvertex_oport_oport|101|0|178|0|{4|error|}73|78|}
{2010006001|XXGobject_psameas_object|102|0|180|0|{metadata|error_metadata|1|0|}78|73|}
{2010212001|XXGvertex_oport_oport|103|0|181|0|{5|log|}73|79|}
{2010006001|XXGobject_psameas_object|104|0|183|0|{metadata|log_metadata|1|0|}79|73|}
{2010211001|XXGvertex_iport_iport|105|0|184|0|{0|in|}73|80|}
{2010006001|XXGobject_psameas_object|106|0|186|0|{metadata|in_metadata|1|0|}80|73|}
{2010006001|XXGobject_psameas_object|107|0|187|0|{Layout|Layout|0|0|}64|81|}
{2010211001|XXGvertex_iport_iport|108|0|189|0|{0|write|}81|82|}
{2010214001|XXGiport_src_flow|109|0|191|0|{0|}82|21|}
{2010007001|XXGobject_proto_object|110|0|192|0|{}81|83|}
{2010211001|XXGvertex_iport_iport|111|0|194|0|{0|write|}83|84|}
{2010006001|XXGobject_psameas_object|112|0|196|0|{metadata|write_metadata|1|0|}84|83|}
{2010006001|XXGobject_psameas_object|113|0|197|0|{write_metadata|out_metadata|0|0|}81|64|}
{2010006001|XXGobject_psameas_object|114|0|198|0|{filereject_metadata|out_metadata|0|0|}64|85|}
{2010212001|XXGvertex_oport_oport|115|0|200|0|{0|out|}85|86|}
{2010213001|XXGoport_dst_flow|116|0|202|0|{0|}86|87|}
{2010212001|XXGvertex_oport_oport|117|0|204|0|{1|error|}85|88|}
{2010212001|XXGvertex_oport_oport|118|0|206|0|{2|log|}85|89|}
{2010007001|XXGobject_proto_object|119|0|208|0|{}85|90|}
{2010212001|XXGvertex_oport_oport|120|0|210|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|121|0|212|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|122|0|213|0|{1|error|}90|92|}
{2010006001|XXGobject_psameas_object|123|0|215|0|{metadata|error_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|124|0|216|0|{2|log|}90|93|}
{2010006001|XXGobject_psameas_object|125|0|218|0|{metadata|log_metadata|1|0|}93|90|}
{2010006001|XXGobject_psameas_object|126|0|219|0|{in_metadata|out_metadata|0|0|}64|85|}
{2010006001|XXGobject_psameas_object|127|0|220|0|{reject0_metadata|out_metadata|0|0|}52|64|}
{2010006001|XXGobject_psameas_object|128|0|221|0|{transform0|TRANSFORM_XFR|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|129|0|222|0|{in_metadata|out0_metadata|0|0|}38|52|}
{2010006001|XXGobject_psameas_object|130|0|223|0|{out_metadata|out0_metadata|0|0|}38|52|}
{2010006001|XXGobject_psameas_object|131|0|224|0|{reject_metadata|out0_metadata|0|0|}38|52|}
{2010006001|XXGobject_psameas_object|132|0|225|0|{select_expr|FILTER_AFTER_DEDUP_EXPR|1|0|}38|1|}
{2010601001|XXGgraph_vertex_vertex|133|0|226|0|{First_IDS_file_for_view_data|}1|94|}
{2010212001|XXGvertex_oport_oport|134|0|228|0|{0|read|}94|95|}
{2010213001|XXGoport_dst_flow|135|0|230|0|{0|}95|27|}
{2010007001|XXGobject_proto_object|136|0|231|0|{}94|96|}
{2010212001|XXGvertex_oport_oport|137|0|233|0|{0|read|}96|97|}
{2010006001|XXGobject_psameas_object|138|0|235|0|{metadata|read_metadata|1|0|}97|96|}
{2010601001|XXGgraph_vertex_vertex|139|0|236|0|{Get_Job_Log|}1|98|}
{2010211001|XXGvertex_iport_iport|140|0|238|0|{0|write|}98|99|}
{2010214001|XXGiport_src_flow|141|0|240|0|{0|}99|19|}
{2010007001|XXGobject_proto_object|142|0|241|0|{}98|100|}
{2010211001|XXGvertex_iport_iport|143|0|243|0|{0|write|}100|101|}
{2010006001|XXGobject_psameas_object|144|0|245|0|{metadata|write_metadata|1|0|}101|100|}
{2010601001|XXGgraph_vertex_vertex|145|0|246|0|{Input_File|}1|102|}
{2010212001|XXGvertex_oport_oport|146|0|248|0|{0|read|}102|103|}
{2010213001|XXGoport_dst_flow|147|0|250|0|{0|}103|17|}
{2010007001|XXGobject_proto_object|148|0|251|0|{}102|104|}
{2010212001|XXGvertex_oport_oport|149|0|253|0|{0|read|}104|105|}
{2010006001|XXGobject_psameas_object|150|0|255|0|{metadata|read_metadata|1|0|}105|104|}
{2010601001|XXGgraph_vertex_vertex|151|0|256|0|{Normalize_Add_Job_ID_Record_Count|}1|106|}
{2010212001|XXGvertex_oport_oport|152|0|258|0|{0|out|}106|107|}
{2010213001|XXGoport_dst_flow|153|0|260|0|{0|}107|26|}
{2010212001|XXGvertex_oport_oport|154|0|261|0|{1|reject|}106|108|}
{2010212001|XXGvertex_oport_oport|155|0|263|0|{2|error|}106|109|}
{2010212001|XXGvertex_oport_oport|156|0|265|0|{3|log|}106|110|}
{2010211001|XXGvertex_iport_iport|157|0|267|0|{0|in|}106|111|}
{2010214001|XXGiport_src_flow|158|0|269|0|{0|}111|31|}
{2010007001|XXGobject_proto_object|159|0|270|0|{}106|112|}
{2010212001|XXGvertex_oport_oport|160|0|272|0|{0|out|}112|113|}
{2010006001|XXGobject_psameas_object|161|0|274|0|{metadata|out_metadata|1|0|}113|112|}
{2010212001|XXGvertex_oport_oport|162|0|275|0|{1|reject|}112|114|}
{2010006001|XXGobject_psameas_object|163|0|277|0|{metadata|reject_metadata|1|0|}114|112|}
{2010212001|XXGvertex_oport_oport|164|0|278|0|{2|error|}112|115|}
{2010006001|XXGobject_psameas_object|165|0|280|0|{metadata|error_metadata|1|0|}115|112|}
{2010212001|XXGvertex_oport_oport|166|0|281|0|{3|log|}112|116|}
{2010006001|XXGobject_psameas_object|167|0|283|0|{metadata|log_metadata|1|0|}116|112|}
{2010211001|XXGvertex_iport_iport|168|0|284|0|{0|in|}112|117|}
{2010006001|XXGobject_psameas_object|169|0|286|0|{metadata|in_metadata|1|0|}117|112|}
{2010006001|XXGobject_psameas_object|170|0|287|0|{Layout|Layout|0|0|}106|118|}
{2010212001|XXGvertex_oport_oport|171|0|289|0|{0|source|}118|119|}
{2010213001|XXGoport_dst_flow|172|0|291|0|{0|}119|120|}
{2010212001|XXGvertex_oport_oport|173|0|293|0|{1|clean|}118|121|}
{2010213001|XXGoport_dst_flow|174|0|295|0|{0|}121|122|}
{2010212001|XXGvertex_oport_oport|175|0|297|0|{2|lkp|}118|123|}
{2010213001|XXGoport_dst_flow|176|0|299|0|{0|}123|124|}
{2010212001|XXGvertex_oport_oport|177|0|301|0|{3|reject0|}118|125|}
{2010212001|XXGvertex_oport_oport|178|0|303|0|{4|reject1|}118|126|}
{2010212001|XXGvertex_oport_oport|179|0|305|0|{5|reject2|}118|127|}
{2010212001|XXGvertex_oport_oport|180|0|307|0|{6|error0|}118|128|}
{2010212001|XXGvertex_oport_oport|181|0|309|0|{7|error1|}118|129|}
{2010212001|XXGvertex_oport_oport|182|0|311|0|{8|error2|}118|130|}
{2010212001|XXGvertex_oport_oport|183|0|313|0|{9|log|}118|131|}
{2010211001|XXGvertex_iport_iport|184|0|315|0|{0|in|}118|132|}
{2010006001|XXGobject_psameas_object|185|0|317|0|{in_metadata|out_metadata|0|0|}118|106|}
{2010006001|XXGobject_psameas_object|186|0|318|0|{out0_metadata|write_metadata|0|0|}118|133|}
{2010211001|XXGvertex_iport_iport|187|0|320|0|{0|write|}133|134|}
{2010214001|XXGiport_src_flow|188|0|322|0|{0|}134|24|}
{2010007001|XXGobject_proto_object|189|0|323|0|{}133|135|}
{2010211001|XXGvertex_iport_iport|190|0|325|0|{0|write|}135|136|}
{2010006001|XXGobject_psameas_object|191|0|327|0|{metadata|write_metadata|1|0|}136|135|}
{2010006001|XXGobject_psameas_object|192|0|328|0|{out1_metadata|write_metadata|0|0|}118|137|}
{2010211001|XXGvertex_iport_iport|193|0|330|0|{0|write|}137|138|}
{2010214001|XXGiport_src_flow|194|0|332|0|{0|}138|25|}
{2010007001|XXGobject_proto_object|195|0|333|0|{}137|139|}
{2010211001|XXGvertex_iport_iport|196|0|335|0|{0|write|}139|140|}
{2010006001|XXGobject_psameas_object|197|0|337|0|{metadata|write_metadata|1|0|}140|139|}
{2010006001|XXGobject_psameas_object|198|0|338|0|{out2_metadata|write_metadata|0|0|}118|141|}
{2010211001|XXGvertex_iport_iport|199|0|340|0|{0|write|}141|142|}
{2010214001|XXGiport_src_flow|200|0|342|0|{0|}142|143|}
{2010006001|XXGobject_psameas_object|201|0|344|0|{reject0_metadata|out_metadata|0|0|}118|106|}
{2010006001|XXGobject_psameas_object|202|0|345|0|{reject1_metadata|out_metadata|0|0|}118|106|}
{2010006001|XXGobject_psameas_object|203|0|346|0|{reject2_metadata|out_metadata|0|0|}118|106|}
{2010006001|XXGobject_psameas_object|204|0|347|0|{in_metadata|out0_metadata|0|0|}106|52|}
{2010006001|XXGobject_psameas_object|205|0|348|0|{reject_metadata|out0_metadata|0|0|}106|52|}
{2010601001|XXGgraph_vertex_vertex|206|0|349|0|{OFIL_Capture_Pre_Filter_Deselect|}1|81|}
{2010601001|XXGgraph_vertex_vertex|207|0|350|0|{OFIL_Capture_Pre_Filter_Deselect_1|}1|144|}
{2010211001|XXGvertex_iport_iport|208|0|352|0|{0|write|}144|145|}
{2010214001|XXGiport_src_flow|209|0|354|0|{0|}145|22|}
{2010007001|XXGobject_proto_object|210|0|355|0|{}144|146|}
{2010211001|XXGvertex_iport_iport|211|0|357|0|{0|write|}146|147|}
{2010006001|XXGobject_psameas_object|212|0|359|0|{metadata|write_metadata|1|0|}147|146|}
{2010006001|XXGobject_psameas_object|213|0|360|0|{write_metadata|out_metadata|0|0|}144|148|}
{2010212001|XXGvertex_oport_oport|214|0|362|0|{0|out|}148|149|}
{2010212001|XXGvertex_oport_oport|215|0|364|0|{1|filereject|}148|150|}
{2010212001|XXGvertex_oport_oport|216|0|366|0|{2|fileerror|}148|151|}
{2010212001|XXGvertex_oport_oport|217|0|368|0|{3|reject|}148|152|}
{2010212001|XXGvertex_oport_oport|218|0|370|0|{4|error|}148|153|}
{2010212001|XXGvertex_oport_oport|219|0|372|0|{5|log|}148|154|}
{2010211001|XXGvertex_iport_iport|220|0|374|0|{0|in|}148|155|}
{2010214001|XXGiport_src_flow|221|0|376|0|{0|}155|156|}
{2010007001|XXGobject_proto_object|222|0|378|0|{}148|157|}
{2010212001|XXGvertex_oport_oport|223|0|380|0|{0|out|}157|158|}
{2010006001|XXGobject_psameas_object|224|0|382|0|{metadata|out_metadata|1|0|}158|157|}
{2010212001|XXGvertex_oport_oport|225|0|383|0|{1|filereject|}157|159|}
{2010006001|XXGobject_psameas_object|226|0|385|0|{metadata|filereject_metadata|1|0|}159|157|}
{2010212001|XXGvertex_oport_oport|227|0|386|0|{2|fileerror|}157|160|}
{2010006001|XXGobject_psameas_object|228|0|388|0|{metadata|fileerror_metadata|1|0|}160|157|}
{2010212001|XXGvertex_oport_oport|229|0|389|0|{3|reject|}157|161|}
{2010006001|XXGobject_psameas_object|230|0|391|0|{metadata|reject_metadata|1|0|}161|157|}
{2010212001|XXGvertex_oport_oport|231|0|392|0|{4|error|}157|162|}
{2010006001|XXGobject_psameas_object|232|0|394|0|{metadata|error_metadata|1|0|}162|157|}
{2010212001|XXGvertex_oport_oport|233|0|395|0|{5|log|}157|163|}
{2010006001|XXGobject_psameas_object|234|0|397|0|{metadata|log_metadata|1|0|}163|157|}
{2010211001|XXGvertex_iport_iport|235|0|398|0|{0|in|}157|164|}
{2010006001|XXGobject_psameas_object|236|0|400|0|{metadata|in_metadata|1|0|}164|157|}
{2010006001|XXGobject_psameas_object|237|0|401|0|{filereject_metadata|out_metadata|0|0|}148|165|}
{2010212001|XXGvertex_oport_oport|238|0|403|0|{0|out|}165|166|}
{2010213001|XXGoport_dst_flow|239|0|405|0|{0|}166|167|}
{2010212001|XXGvertex_oport_oport|240|0|407|0|{1|error|}165|168|}
{2010212001|XXGvertex_oport_oport|241|0|409|0|{2|log|}165|169|}
{2010007001|XXGobject_proto_object|242|0|411|0|{}165|170|}
{2010212001|XXGvertex_oport_oport|243|0|413|0|{0|out|}170|171|}
{2010006001|XXGobject_psameas_object|244|0|415|0|{metadata|out_metadata|1|0|}171|170|}
{2010212001|XXGvertex_oport_oport|245|0|416|0|{1|error|}170|172|}
{2010006001|XXGobject_psameas_object|246|0|418|0|{metadata|error_metadata|1|0|}172|170|}
{2010212001|XXGvertex_oport_oport|247|0|419|0|{2|log|}170|173|}
{2010006001|XXGobject_psameas_object|248|0|421|0|{metadata|log_metadata|1|0|}173|170|}
{2010006001|XXGobject_psameas_object|249|0|422|0|{in_metadata|out_metadata|0|0|}148|165|}
{2010601001|XXGgraph_vertex_vertex|250|0|423|0|{Optional_Clean|}1|137|}
{2010601001|XXGgraph_vertex_vertex|251|0|424|0|{Optional_Filter_IDS_Data|}1|174|}
{2010212001|XXGvertex_oport_oport|252|0|426|0|{0|out|}174|175|}
{2010213001|XXGoport_dst_flow|253|0|428|0|{0|}175|18|}
{2010212001|XXGvertex_oport_oport|254|0|429|0|{1|deselect|}174|176|}
{2010213001|XXGoport_dst_flow|255|0|431|0|{0|}176|21|}
{2010212001|XXGvertex_oport_oport|256|0|432|0|{2|reject|}174|177|}
{2010212001|XXGvertex_oport_oport|257|0|434|0|{3|error|}174|178|}
{2010212001|XXGvertex_oport_oport|258|0|436|0|{4|log|}174|179|}
{2010211001|XXGvertex_iport_iport|259|0|438|0|{0|in|}174|180|}
{2010214001|XXGiport_src_flow|260|0|440|0|{0|}180|28|}
{2010214001|XXGiport_src_flow|261|0|441|0|{1|}180|23|}
{2010007001|XXGobject_proto_object|262|0|442|0|{}174|181|}
{2010212001|XXGvertex_oport_oport|263|0|444|0|{0|out|}181|182|}
{2010006001|XXGobject_psameas_object|264|0|446|0|{metadata|out_metadata|1|0|}182|181|}
{2010212001|XXGvertex_oport_oport|265|0|447|0|{1|deselect|}181|183|}
{2010006001|XXGobject_psameas_object|266|0|449|0|{metadata|deselect_metadata|1|0|}183|181|}
{2010212001|XXGvertex_oport_oport|267|0|450|0|{2|reject|}181|184|}
{2010006001|XXGobject_psameas_object|268|0|452|0|{metadata|reject_metadata|1|0|}184|181|}
{2010212001|XXGvertex_oport_oport|269|0|453|0|{3|error|}181|185|}
{2010006001|XXGobject_psameas_object|270|0|455|0|{metadata|error_metadata|1|0|}185|181|}
{2010212001|XXGvertex_oport_oport|271|0|456|0|{4|log|}181|186|}
{2010006001|XXGobject_psameas_object|272|0|458|0|{metadata|log_metadata|1|0|}186|181|}
{2010211001|XXGvertex_iport_iport|273|0|459|0|{0|in|}181|187|}
{2010006001|XXGobject_psameas_object|274|0|461|0|{metadata|in_metadata|1|0|}187|181|}
{2010006001|XXGobject_psameas_object|275|0|462|0|{Layout|Layout|0|0|}174|81|}
{2010006001|XXGobject_psameas_object|276|0|463|0|{deselect_metadata|out_metadata|0|0|}174|64|}
{2010006001|XXGobject_psameas_object|277|0|464|0|{in_metadata|out_metadata|0|0|}174|64|}
{2010006001|XXGobject_psameas_object|278|0|465|0|{out_metadata|out_metadata|0|0|}174|64|}
{2010006001|XXGobject_psameas_object|279|0|466|0|{reject_metadata|out_metadata|0|0|}174|64|}
{2010601001|XXGgraph_vertex_vertex|280|0|467|0|{Optional_Lookup|}1|188|}
{2010211001|XXGvertex_iport_iport|281|0|469|0|{0|write|}188|189|}
{2010214001|XXGiport_src_flow|282|0|471|0|{0|}189|30|}
{2010007001|XXGobject_proto_object|283|0|472|0|{}188|190|}
{2010211001|XXGvertex_iport_iport|284|0|474|0|{0|write|}190|191|}
{2010006001|XXGobject_psameas_object|285|0|476|0|{metadata|write_metadata|1|0|}191|190|}
{2010601001|XXGgraph_vertex_vertex|286|0|477|0|{Optional_Source|}1|133|}
{2010601001|XXGgraph_vertex_vertex|287|0|478|0|{Pick_the_lastest_instance_of_every_record|}1|192|}
{2010604001|XXGgraph_flow_flow|288|0|480|0|{Flow_1|}192|193|}
{2010601001|XXGgraph_vertex_vertex|289|0|482|0|{DSRT_dxf_hk_part1_dxf_hk_part2_|}192|194|}
{2010212001|XXGvertex_oport_oport|290|0|484|0|{0|out|}194|195|}
{2010212001|XXGvertex_oport_oport|291|0|486|0|{1|dup|}194|196|}
{2010212001|XXGvertex_oport_oport|292|0|488|0|{2|reject|}194|197|}
{2010212001|XXGvertex_oport_oport|293|0|490|0|{3|error|}194|198|}
{2010212001|XXGvertex_oport_oport|294|0|492|0|{4|log|}194|199|}
{2010211001|XXGvertex_iport_iport|295|0|494|0|{0|in|}194|200|}
{2010214001|XXGiport_src_flow|296|0|496|0|{0|}200|193|}
{2010007001|XXGobject_proto_object|297|0|497|0|{}194|201|}
{2010212001|XXGvertex_oport_oport|298|0|499|0|{0|out|}201|202|}
{2010006001|XXGobject_psameas_object|299|0|501|0|{metadata|out_metadata|1|0|}202|201|}
{2010212001|XXGvertex_oport_oport|300|0|502|0|{1|dup|}201|203|}
{2010006001|XXGobject_psameas_object|301|0|504|0|{metadata|dup_metadata|1|0|}203|201|}
{2010212001|XXGvertex_oport_oport|302|0|505|0|{2|reject|}201|204|}
{2010006001|XXGobject_psameas_object|303|0|507|0|{metadata|reject_metadata|1|0|}204|201|}
{2010212001|XXGvertex_oport_oport|304|0|508|0|{3|error|}201|205|}
{2010006001|XXGobject_psameas_object|305|0|510|0|{metadata|error_metadata|1|0|}205|201|}
{2010212001|XXGvertex_oport_oport|306|0|511|0|{4|log|}201|206|}
{2010006001|XXGobject_psameas_object|307|0|513|0|{metadata|log_metadata|1|0|}206|201|}
{2010211001|XXGvertex_iport_iport|308|0|514|0|{0|in|}201|207|}
{2010006001|XXGobject_psameas_object|309|0|516|0|{metadata|in_metadata|1|0|}207|201|}
{2010006001|XXGobject_psameas_object|310|0|517|0|{Layout|Layout|0|0|}194|38|}
{2010006001|XXGobject_psameas_object|311|0|518|0|{dup_metadata|out_metadata|0|0|}194|64|}
{2010006001|XXGobject_psameas_object|312|0|519|0|{in_metadata|out_metadata|0|0|}194|64|}
{2010006001|XXGobject_psameas_object|313|0|520|0|{out_metadata|out_metadata|0|0|}194|64|}
{2010006001|XXGobject_psameas_object|314|0|521|0|{reject_metadata|out_metadata|0|0|}194|64|}
{2010601001|XXGgraph_vertex_vertex|315|0|522|0|{Sort_dxf_hk_part1_dxf_hk_part2_ids_updt_dttm_|}192|208|}
{2010212001|XXGvertex_oport_oport|316|0|524|0|{0|out|}208|209|}
{2010213001|XXGoport_dst_flow|317|0|526|0|{0|}209|193|}
{2010211001|XXGvertex_iport_iport|318|0|527|0|{0|in|}208|210|}
{2010007001|XXGobject_proto_object|319|0|529|0|{}208|211|}
{2010212001|XXGvertex_oport_oport|320|0|531|0|{0|out|}211|212|}
{2010006001|XXGobject_psameas_object|321|0|533|0|{metadata|out_metadata|1|0|}212|211|}
{2010211001|XXGvertex_iport_iport|322|0|534|0|{0|in|}211|213|}
{2010006001|XXGobject_psameas_object|323|0|536|0|{metadata|in_metadata|1|0|}213|211|}
{2010006001|XXGobject_psameas_object|324|0|537|0|{Layout|Layout|0|0|}208|38|}
{2010006001|XXGobject_psameas_object|325|0|538|0|{in_metadata|out_metadata|0|0|}208|64|}
{2010006001|XXGobject_psameas_object|326|0|539|0|{out_metadata|out_metadata|0|0|}208|64|}
{2010212001|XXGvertex_oport_oport|327|0|540|0|{0|out0|}192|214|}
{2010216002|XXGoport_binding_oport|328|0|542|0|{.5|.5|{0|}12135|}214|195|}
{2010213001|XXGoport_dst_flow|329|0|543|0|{0|}214|20|}
{2010211001|XXGvertex_iport_iport|330|0|544|0|{0|in0|}192|215|}
{2010215002|XXGiport_binding_iport|331|0|546|0|{.5|.5|{0|}12134|}215|210|}
{2010214001|XXGiport_src_flow|332|0|547|0|{0|}215|18|}
{2010601001|XXGgraph_vertex_vertex|333|0|548|0|{Prepare_Output|}1|216|}
{2010605001|XXGgraph_legend_legend|334|0|550|0|{0|}216|217|}
{2010241001|XXGlegend_face_face|335|0|552|0|{}217|218|}
{2010605001|XXGgraph_legend_legend|336|0|554|0|{1|}216|219|}
{2010241001|XXGlegend_face_face|337|0|556|0|{}219|220|}
{2010605001|XXGgraph_legend_legend|338|0|558|0|{2|}216|221|}
{2010241001|XXGlegend_face_face|339|0|560|0|{}221|222|}
{2010605001|XXGgraph_legend_legend|340|0|562|0|{3|}216|223|}
{2010241001|XXGlegend_face_face|341|0|564|0|{}223|224|}
{2010604001|XXGgraph_flow_flow|342|0|566|0|{Flow_1|}216|124|}
{2010604001|XXGgraph_flow_flow|343|0|567|0|{Flow_2|}216|122|}
{2010604001|XXGgraph_flow_flow|344|0|568|0|{Flow_3|}216|225|}
{2010604001|XXGgraph_flow_flow|345|0|570|0|{Flow_4|}216|143|}
{2010604001|XXGgraph_flow_flow|346|0|571|0|{Flow_5|}216|226|}
{2010604001|XXGgraph_flow_flow|347|0|573|0|{Flow_6|}216|227|}
{2010604001|XXGgraph_flow_flow|348|0|575|0|{Flow_7|}216|120|}
{2010604001|XXGgraph_flow_flow|349|0|576|0|{Flow_8|}216|228|}
{2010601001|XXGgraph_vertex_vertex|350|0|578|0|{Copy_Out|}216|229|}
{2010212001|XXGvertex_oport_oport|351|0|580|0|{0|out|}229|230|}
{2010211001|XXGvertex_iport_iport|352|0|582|0|{0|in|}229|231|}
{2010214001|XXGiport_src_flow|353|0|584|0|{0|}231|120|}
{2010006001|XXGobject_psameas_object|354|0|585|0|{Layout|Layout|0|0|}229|133|}
{2010006001|XXGobject_psameas_object|355|0|586|0|{in_metadata|write_metadata|0|0|}229|133|}
{2010006001|XXGobject_psameas_object|356|0|587|0|{out_metadata|write_metadata|0|0|}229|133|}
{2010601001|XXGgraph_vertex_vertex|357|0|588|0|{Copy_Out_|}216|232|}
{2010212001|XXGvertex_oport_oport|358|0|590|0|{0|out|}232|233|}
{2010211001|XXGvertex_iport_iport|359|0|592|0|{0|in|}232|234|}
{2010214001|XXGiport_src_flow|360|0|594|0|{0|}234|122|}
{2010006001|XXGobject_psameas_object|361|0|595|0|{Layout|Layout|0|0|}232|137|}
{2010006001|XXGobject_psameas_object|362|0|596|0|{in_metadata|write_metadata|0|0|}232|137|}
{2010006001|XXGobject_psameas_object|363|0|597|0|{out_metadata|write_metadata|0|0|}232|137|}
{2010601001|XXGgraph_vertex_vertex|364|0|598|0|{Dedup_and_Fix_Intervals|}216|235|}
{2010605001|XXGgraph_legend_legend|365|0|600|0|{0|}235|236|}
{2010241001|XXGlegend_face_face|366|0|602|0|{}236|237|}
{2010605001|XXGgraph_legend_legend|367|0|604|0|{1|}235|238|}
{2010241001|XXGlegend_face_face|368|0|606|0|{}238|239|}
{2010605001|XXGgraph_legend_legend|369|0|608|0|{2|}235|240|}
{2010241001|XXGlegend_face_face|370|0|610|0|{}240|241|}
{2010605001|XXGgraph_legend_legend|371|0|612|0|{3|}235|242|}
{2010241001|XXGlegend_face_face|372|0|614|0|{}242|243|}
{2010605001|XXGgraph_legend_legend|373|0|616|0|{4|}235|244|}
{2010241001|XXGlegend_face_face|374|0|618|0|{}244|245|}
{2010604001|XXGgraph_flow_flow|375|0|620|0|{Flow_1|}235|246|}
{2010604001|XXGgraph_flow_flow|376|0|622|0|{Flow_2|}235|247|}
{2010604001|XXGgraph_flow_flow|377|0|624|0|{Flow_3|}235|248|}
{2010604001|XXGgraph_flow_flow|378|0|626|0|{Flow_4|}235|249|}
{2010604001|XXGgraph_flow_flow|379|0|628|0|{Flow_6|}235|250|}
{2010604001|XXGgraph_flow_flow|380|0|630|0|{Flow_7|}235|251|}
{2010601001|XXGgraph_vertex_vertex|381|0|632|0|{Dedup_by_NK_Eff_Date|}235|252|}
{2010212001|XXGvertex_oport_oport|382|0|634|0|{0|out|}252|253|}
{2010213001|XXGoport_dst_flow|383|0|636|0|{0|}253|248|}
{2010212001|XXGvertex_oport_oport|384|0|637|0|{1|dup|}252|254|}
{2010212001|XXGvertex_oport_oport|385|0|639|0|{2|reject|}252|255|}
{2010212001|XXGvertex_oport_oport|386|0|641|0|{3|error|}252|256|}
{2010212001|XXGvertex_oport_oport|387|0|643|0|{4|log|}252|257|}
{2010211001|XXGvertex_iport_iport|388|0|645|0|{0|in|}252|258|}
{2010214001|XXGiport_src_flow|389|0|647|0|{0|}258|246|}
{2010006001|XXGobject_psameas_object|390|0|648|0|{Layout|Layout|0|0|}252|141|}
{2010006001|XXGobject_psameas_object|391|0|649|0|{dup_metadata|write_metadata|0|0|}252|141|}
{2010006001|XXGobject_psameas_object|392|0|650|0|{in_metadata|write_metadata|0|0|}252|141|}
{2010006001|XXGobject_psameas_object|393|0|651|0|{out_metadata|write_metadata|0|0|}252|141|}
{2010006001|XXGobject_psameas_object|394|0|652|0|{reject_metadata|write_metadata|0|0|}252|141|}
{2010601001|XXGgraph_vertex_vertex|395|0|653|0|{Parition_by_Related_or_NK|}235|259|}
{2010212001|XXGvertex_oport_oport|396|0|655|0|{0|out|}259|260|}
{2010213001|XXGoport_dst_flow|397|0|657|0|{0|}260|247|}
{2010211001|XXGvertex_iport_iport|398|0|658|0|{0|in|}259|261|}
{2010006001|XXGobject_psameas_object|399|0|660|0|{Layout|Layout|0|0|}259|118|}
{2010006001|XXGobject_psameas_object|400|0|661|0|{out_metadata|write_metadata|0|0|}259|141|}
{2010601001|XXGgraph_vertex_vertex|401|0|662|0|{Replicate|}235|262|}
{2010212001|XXGvertex_oport_oport|402|0|664|0|{0|out|}262|263|}
{2010211001|XXGvertex_iport_iport|403|0|666|0|{0|in|}262|264|}
{2010214001|XXGiport_src_flow|404|0|668|0|{0|}264|251|}
{2010006001|XXGobject_psameas_object|405|0|669|0|{Layout|Layout|0|0|}262|141|}
{2010006001|XXGobject_psameas_object|406|0|670|0|{in_metadata|write_metadata|0|0|}262|188|}
{2010006001|XXGobject_psameas_object|407|0|671|0|{out_metadata|write_metadata|0|0|}262|188|}
{2010601001|XXGgraph_vertex_vertex|408|0|672|0|{Rollup_Adjoining_Eff_Dates|}235|265|}
{2010212001|XXGvertex_oport_oport|409|0|674|0|{0|out|}265|266|}
{2010213001|XXGoport_dst_flow|410|0|676|0|{0|}266|251|}
{2010212001|XXGvertex_oport_oport|411|0|677|0|{1|reject|}265|267|}
{2010212001|XXGvertex_oport_oport|412|0|679|0|{2|error|}265|268|}
{2010212001|XXGvertex_oport_oport|413|0|681|0|{3|log|}265|269|}
{2010211001|XXGvertex_iport_iport|414|0|683|0|{0|in|}265|270|}
{2010214001|XXGiport_src_flow|415|0|685|0|{0|}270|250|}
{2010006001|XXGobject_psameas_object|416|0|686|0|{Layout|Layout|0|0|}265|141|}
{2010006001|XXGobject_psameas_object|417|0|687|0|{in_metadata|write_metadata|0|0|}265|141|}
{2010006001|XXGobject_psameas_object|418|0|688|0|{out_metadata|write_metadata|0|0|}265|141|}
{2010006001|XXGobject_psameas_object|419|0|689|0|{reject_metadata|write_metadata|0|0|}265|141|}
{2010601001|XXGgraph_vertex_vertex|420|0|690|0|{Scan_to_Fix_Overlapping_Dates|}235|271|}
{2010212001|XXGvertex_oport_oport|421|0|692|0|{0|out|}271|272|}
{2010213001|XXGoport_dst_flow|422|0|694|0|{0|}272|249|}
{2010212001|XXGvertex_oport_oport|423|0|695|0|{1|reject|}271|273|}
{2010212001|XXGvertex_oport_oport|424|0|697|0|{2|error|}271|274|}
{2010212001|XXGvertex_oport_oport|425|0|699|0|{3|log|}271|275|}
{2010211001|XXGvertex_iport_iport|426|0|701|0|{0|in|}271|276|}
{2010214001|XXGiport_src_flow|427|0|703|0|{0|}276|248|}
{2010006001|XXGobject_psameas_object|428|0|704|0|{Layout|Layout|0|0|}271|141|}
{2010006001|XXGobject_psameas_object|429|0|705|0|{in_metadata|write_metadata|0|0|}271|141|}
{2010006001|XXGobject_psameas_object|430|0|706|0|{out_metadata|write_metadata|0|0|}271|141|}
{2010006001|XXGobject_psameas_object|431|0|707|0|{reject_metadata|write_metadata|0|0|}271|141|}
{2010601001|XXGgraph_vertex_vertex|432|0|708|0|{Sort_for_Dedup|}235|277|}
{2010212001|XXGvertex_oport_oport|433|0|710|0|{0|out|}277|278|}
{2010213001|XXGoport_dst_flow|434|0|712|0|{0|}278|246|}
{2010211001|XXGvertex_iport_iport|435|0|713|0|{0|in|}277|279|}
{2010214001|XXGiport_src_flow|436|0|715|0|{0|}279|247|}
{2010006001|XXGobject_psameas_object|437|0|716|0|{Layout|Layout|0|0|}277|141|}
{2010006001|XXGobject_psameas_object|438|0|717|0|{in_metadata|write_metadata|0|0|}277|141|}
{2010006001|XXGobject_psameas_object|439|0|718|0|{out_metadata|write_metadata|0|0|}277|141|}
{2010601001|XXGgraph_vertex_vertex|440|0|719|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}235|280|}
{2010212001|XXGvertex_oport_oport|441|0|721|0|{0|out|}280|281|}
{2010213001|XXGoport_dst_flow|442|0|723|0|{0|}281|250|}
{2010211001|XXGvertex_iport_iport|443|0|724|0|{0|in|}280|282|}
{2010214001|XXGiport_src_flow|444|0|726|0|{0|}282|249|}
{2010006001|XXGobject_psameas_object|445|0|727|0|{Layout|Layout|0|0|}280|141|}
{2010006001|XXGobject_psameas_object|446|0|728|0|{in_metadata|write_metadata|0|0|}280|141|}
{2010006001|XXGobject_psameas_object|447|0|729|0|{out_metadata|write_metadata|0|0|}280|141|}
{2010212001|XXGvertex_oport_oport|448|0|730|0|{0|out|}235|283|}
{2010216002|XXGoport_binding_oport|449|0|732|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6837|}283|263|}
{2010213001|XXGoport_dst_flow|450|0|733|0|{0|}283|225|}
{2010213001|XXGoport_dst_flow|451|0|734|0|{1|}283|227|}
{2010212001|XXGvertex_oport_oport|452|0|735|0|{1|dups|}235|284|}
{2010216002|XXGoport_binding_oport|453|0|737|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6838|}284|254|}
{2010213001|XXGoport_dst_flow|454|0|738|0|{0|}284|143|}
{2010211001|XXGvertex_iport_iport|455|0|739|0|{0|in|}235|285|}
{2010215002|XXGiport_binding_iport|456|0|741|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6836|}285|261|}
{2010214001|XXGiport_src_flow|457|0|742|0|{0|}285|124|}
{2010006001|XXGobject_psameas_object|458|0|743|0|{INPUT_DML|write_metadata|0|0|}235|141|}
{2010601001|XXGgraph_vertex_vertex|459|0|744|0|{Dups|}216|141|}
{2010601001|XXGgraph_vertex_vertex|460|0|745|0|{Gather|}216|286|}
{2010212001|XXGvertex_oport_oport|461|0|747|0|{0|out|}286|287|}
{2010213001|XXGoport_dst_flow|462|0|749|0|{0|}287|228|}
{2010211001|XXGvertex_iport_iport|463|0|750|0|{0|in|}286|288|}
{2010214001|XXGiport_src_flow|464|0|752|0|{0|}288|227|}
{2010006001|XXGobject_psameas_object|465|0|753|0|{in_metadata|write_metadata|0|0|}286|188|}
{2010006001|XXGobject_psameas_object|466|0|754|0|{out_metadata|write_metadata|0|0|}286|188|}
{2010601001|XXGgraph_vertex_vertex|467|0|755|0|{Gather_|}216|289|}
{2010212001|XXGvertex_oport_oport|468|0|757|0|{0|out|}289|290|}
{2010211001|XXGvertex_iport_iport|469|0|759|0|{0|in|}289|291|}
{2010214001|XXGiport_src_flow|470|0|761|0|{0|}291|226|}
{2010214001|XXGiport_src_flow|471|0|762|0|{1|}291|228|}
{2010006001|XXGobject_psameas_object|472|0|763|0|{Layout|Layout|0|0|}289|188|}
{2010006001|XXGobject_psameas_object|473|0|764|0|{in_metadata|write_metadata|0|0|}289|188|}
{2010006001|XXGobject_psameas_object|474|0|765|0|{out_metadata|write_metadata|0|0|}289|188|}
{2010601001|XXGgraph_vertex_vertex|475|0|766|0|{Map_to_Output|}216|118|}
{2010601001|XXGgraph_vertex_vertex|476|0|767|0|{Merge|}216|292|}
{2010212001|XXGvertex_oport_oport|477|0|769|0|{0|out|}292|293|}
{2010213001|XXGoport_dst_flow|478|0|771|0|{0|}293|226|}
{2010211001|XXGvertex_iport_iport|479|0|772|0|{0|in|}292|294|}
{2010214001|XXGiport_src_flow|480|0|774|0|{0|}294|225|}
{2010006001|XXGobject_psameas_object|481|0|775|0|{in_metadata|write_metadata|0|0|}292|188|}
{2010006001|XXGobject_psameas_object|482|0|776|0|{out_metadata|write_metadata|0|0|}292|188|}
{2010212001|XXGvertex_oport_oport|483|0|777|0|{0|source|}216|295|}
{2010216002|XXGoport_binding_oport|484|0|779|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9929|}295|230|}
{2010213001|XXGoport_dst_flow|485|0|780|0|{0|}295|24|}
{2010212001|XXGvertex_oport_oport|486|0|781|0|{1|clean|}216|296|}
{2010216002|XXGoport_binding_oport|487|0|783|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9930|}296|233|}
{2010213001|XXGoport_dst_flow|488|0|784|0|{0|}296|25|}
{2010212001|XXGvertex_oport_oport|489|0|785|0|{2|lookup|}216|297|}
{2010216002|XXGoport_binding_oport|490|0|787|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9931|}297|290|}
{2010213001|XXGoport_dst_flow|491|0|788|0|{0|}297|30|}
{2010211001|XXGvertex_iport_iport|492|0|789|0|{0|in0|}216|298|}
{2010215002|XXGiport_binding_iport|493|0|791|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9928|}298|132|}
{2010214001|XXGiport_src_flow|494|0|792|0|{0|}298|26|}
{2010007001|XXGobject_proto_object|495|0|793|0|{}216|299|}
{2010605001|XXGgraph_legend_legend|496|0|795|0|{0|}299|300|}
{2010241001|XXGlegend_face_face|497|0|797|0|{}300|301|}
{2010605001|XXGgraph_legend_legend|498|0|799|0|{1|}299|302|}
{2010241001|XXGlegend_face_face|499|0|801|0|{}302|303|}
{2010605001|XXGgraph_legend_legend|500|0|803|0|{2|}299|304|}
{2010241001|XXGlegend_face_face|501|0|805|0|{}304|305|}
{2010605001|XXGgraph_legend_legend|502|0|807|0|{3|}299|306|}
{2010241001|XXGlegend_face_face|503|0|809|0|{}306|307|}
{2010604001|XXGgraph_flow_flow|504|0|811|0|{Flow_1|}299|308|}
{2010604001|XXGgraph_flow_flow|505|0|813|0|{Flow_2|}299|309|}
{2010604001|XXGgraph_flow_flow|506|0|815|0|{Flow_3|}299|310|}
{2010604001|XXGgraph_flow_flow|507|0|817|0|{Flow_4|}299|311|}
{2010604001|XXGgraph_flow_flow|508|0|819|0|{Flow_5|}299|312|}
{2010604001|XXGgraph_flow_flow|509|0|821|0|{Flow_6|}299|313|}
{2010604001|XXGgraph_flow_flow|510|0|823|0|{Flow_7|}299|314|}
{2010604001|XXGgraph_flow_flow|511|0|825|0|{Flow_8|}299|315|}
{2010601001|XXGgraph_vertex_vertex|512|0|827|0|{Copy_Out|}299|316|}
{2010212001|XXGvertex_oport_oport|513|0|829|0|{0|out|}316|317|}
{2010211001|XXGvertex_iport_iport|514|0|831|0|{0|in|}316|318|}
{2010214001|XXGiport_src_flow|515|0|833|0|{0|}318|314|}
{2010007001|XXGobject_proto_object|516|0|834|0|{}316|319|}
{2010212001|XXGvertex_oport_oport|517|0|836|0|{0|out|}319|320|}
{2010006001|XXGobject_psameas_object|518|0|838|0|{metadata|out_metadata|1|0|}320|319|}
{2010211001|XXGvertex_iport_iport|519|0|839|0|{0|in|}319|321|}
{2010006001|XXGobject_psameas_object|520|0|841|0|{metadata|in_metadata|1|0|}321|319|}
{2010601001|XXGgraph_vertex_vertex|521|0|842|0|{Copy_Out_|}299|322|}
{2010212001|XXGvertex_oport_oport|522|0|844|0|{0|out|}322|323|}
{2010211001|XXGvertex_iport_iport|523|0|846|0|{0|in|}322|324|}
{2010214001|XXGiport_src_flow|524|0|848|0|{0|}324|309|}
{2010007001|XXGobject_proto_object|525|0|849|0|{}322|325|}
{2010212001|XXGvertex_oport_oport|526|0|851|0|{0|out|}325|326|}
{2010006001|XXGobject_psameas_object|527|0|853|0|{metadata|out_metadata|1|0|}326|325|}
{2010211001|XXGvertex_iport_iport|528|0|854|0|{0|in|}325|327|}
{2010006001|XXGobject_psameas_object|529|0|856|0|{metadata|in_metadata|1|0|}327|325|}
{2010601001|XXGgraph_vertex_vertex|530|0|857|0|{Dedup_and_Fix_Intervals|}299|328|}
{2010605001|XXGgraph_legend_legend|531|0|859|0|{0|}328|329|}
{2010241001|XXGlegend_face_face|532|0|861|0|{}329|330|}
{2010605001|XXGgraph_legend_legend|533|0|863|0|{1|}328|331|}
{2010241001|XXGlegend_face_face|534|0|865|0|{}331|332|}
{2010605001|XXGgraph_legend_legend|535|0|867|0|{2|}328|333|}
{2010241001|XXGlegend_face_face|536|0|869|0|{}333|334|}
{2010605001|XXGgraph_legend_legend|537|0|871|0|{3|}328|335|}
{2010241001|XXGlegend_face_face|538|0|873|0|{}335|336|}
{2010605001|XXGgraph_legend_legend|539|0|875|0|{4|}328|337|}
{2010241001|XXGlegend_face_face|540|0|877|0|{}337|338|}
{2010604001|XXGgraph_flow_flow|541|0|879|0|{Flow_1|}328|339|}
{2010604001|XXGgraph_flow_flow|542|0|881|0|{Flow_2|}328|340|}
{2010604001|XXGgraph_flow_flow|543|0|883|0|{Flow_3|}328|341|}
{2010604001|XXGgraph_flow_flow|544|0|885|0|{Flow_4|}328|342|}
{2010604001|XXGgraph_flow_flow|545|0|887|0|{Flow_6|}328|343|}
{2010604001|XXGgraph_flow_flow|546|0|889|0|{Flow_7|}328|344|}
{2010601001|XXGgraph_vertex_vertex|547|0|891|0|{Dedup_by_NK_Eff_Date|}328|345|}
{2010212001|XXGvertex_oport_oport|548|0|893|0|{0|out|}345|346|}
{2010213001|XXGoport_dst_flow|549|0|895|0|{0|}346|341|}
{2010212001|XXGvertex_oport_oport|550|0|896|0|{1|dup|}345|347|}
{2010212001|XXGvertex_oport_oport|551|0|898|0|{2|reject|}345|348|}
{2010212001|XXGvertex_oport_oport|552|0|900|0|{3|error|}345|349|}
{2010212001|XXGvertex_oport_oport|553|0|902|0|{4|log|}345|350|}
{2010211001|XXGvertex_iport_iport|554|0|904|0|{0|in|}345|351|}
{2010214001|XXGiport_src_flow|555|0|906|0|{0|}351|339|}
{2010601001|XXGgraph_vertex_vertex|556|0|907|0|{Parition_by_Related_or_NK|}328|352|}
{2010212001|XXGvertex_oport_oport|557|0|909|0|{0|out|}352|353|}
{2010213001|XXGoport_dst_flow|558|0|911|0|{0|}353|340|}
{2010211001|XXGvertex_iport_iport|559|0|912|0|{0|in|}352|354|}
{2010601001|XXGgraph_vertex_vertex|560|0|914|0|{Replicate|}328|355|}
{2010212001|XXGvertex_oport_oport|561|0|916|0|{0|out|}355|356|}
{2010211001|XXGvertex_iport_iport|562|0|918|0|{0|in|}355|357|}
{2010214001|XXGiport_src_flow|563|0|920|0|{0|}357|344|}
{2010601001|XXGgraph_vertex_vertex|564|0|921|0|{Rollup_Adjoining_Eff_Dates|}328|358|}
{2010212001|XXGvertex_oport_oport|565|0|923|0|{0|out|}358|359|}
{2010213001|XXGoport_dst_flow|566|0|925|0|{0|}359|344|}
{2010212001|XXGvertex_oport_oport|567|0|926|0|{1|reject|}358|360|}
{2010212001|XXGvertex_oport_oport|568|0|928|0|{2|error|}358|361|}
{2010212001|XXGvertex_oport_oport|569|0|930|0|{3|log|}358|362|}
{2010211001|XXGvertex_iport_iport|570|0|932|0|{0|in|}358|363|}
{2010214001|XXGiport_src_flow|571|0|934|0|{0|}363|343|}
{2010601001|XXGgraph_vertex_vertex|572|0|935|0|{Scan_to_Fix_Overlapping_Dates|}328|364|}
{2010212001|XXGvertex_oport_oport|573|0|937|0|{0|out|}364|365|}
{2010213001|XXGoport_dst_flow|574|0|939|0|{0|}365|342|}
{2010212001|XXGvertex_oport_oport|575|0|940|0|{1|reject|}364|366|}
{2010212001|XXGvertex_oport_oport|576|0|942|0|{2|error|}364|367|}
{2010212001|XXGvertex_oport_oport|577|0|944|0|{3|log|}364|368|}
{2010211001|XXGvertex_iport_iport|578|0|946|0|{0|in|}364|369|}
{2010214001|XXGiport_src_flow|579|0|948|0|{0|}369|341|}
{2010601001|XXGgraph_vertex_vertex|580|0|949|0|{Sort_for_Dedup|}328|370|}
{2010212001|XXGvertex_oport_oport|581|0|951|0|{0|out|}370|371|}
{2010213001|XXGoport_dst_flow|582|0|953|0|{0|}371|339|}
{2010211001|XXGvertex_iport_iport|583|0|954|0|{0|in|}370|372|}
{2010214001|XXGiport_src_flow|584|0|956|0|{0|}372|340|}
{2010601001|XXGgraph_vertex_vertex|585|0|957|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}328|373|}
{2010212001|XXGvertex_oport_oport|586|0|959|0|{0|out|}373|374|}
{2010213001|XXGoport_dst_flow|587|0|961|0|{0|}374|343|}
{2010211001|XXGvertex_iport_iport|588|0|962|0|{0|in|}373|375|}
{2010214001|XXGiport_src_flow|589|0|964|0|{0|}375|342|}
{2010212001|XXGvertex_oport_oport|590|0|965|0|{0|out|}328|376|}
{2010216002|XXGoport_binding_oport|591|0|967|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6837|}376|356|}
{2010213001|XXGoport_dst_flow|592|0|968|0|{0|}376|310|}
{2010213001|XXGoport_dst_flow|593|0|969|0|{1|}376|313|}
{2010212001|XXGvertex_oport_oport|594|0|970|0|{1|dups|}328|377|}
{2010216002|XXGoport_binding_oport|595|0|972|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6838|}377|347|}
{2010213001|XXGoport_dst_flow|596|0|973|0|{0|}377|311|}
{2010211001|XXGvertex_iport_iport|597|0|974|0|{0|in|}328|378|}
{2010215002|XXGiport_binding_iport|598|0|976|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6836|}378|354|}
{2010214001|XXGiport_src_flow|599|0|977|0|{0|}378|308|}
{2010007001|XXGobject_proto_object|600|0|978|0|{}328|379|}
{2010605001|XXGgraph_legend_legend|601|0|980|0|{0|}379|380|}
{2010241001|XXGlegend_face_face|602|0|982|0|{}380|381|}
{2010605001|XXGgraph_legend_legend|603|0|984|0|{1|}379|382|}
{2010241001|XXGlegend_face_face|604|0|986|0|{}382|383|}
{2010605001|XXGgraph_legend_legend|605|0|988|0|{2|}379|384|}
{2010241001|XXGlegend_face_face|606|0|990|0|{}384|385|}
{2010605001|XXGgraph_legend_legend|607|0|992|0|{3|}379|386|}
{2010241001|XXGlegend_face_face|608|0|994|0|{}386|387|}
{2010605001|XXGgraph_legend_legend|609|0|996|0|{4|}379|388|}
{2010241001|XXGlegend_face_face|610|0|998|0|{}388|389|}
{2010604001|XXGgraph_flow_flow|611|0|1000|0|{Flow_1|}379|390|}
{2010604001|XXGgraph_flow_flow|612|0|1002|0|{Flow_2|}379|391|}
{2010604001|XXGgraph_flow_flow|613|0|1004|0|{Flow_3|}379|392|}
{2010604001|XXGgraph_flow_flow|614|0|1006|0|{Flow_4|}379|393|}
{2010604001|XXGgraph_flow_flow|615|0|1008|0|{Flow_6|}379|394|}
{2010604001|XXGgraph_flow_flow|616|0|1010|0|{Flow_7|}379|395|}
{2010601001|XXGgraph_vertex_vertex|617|0|1012|0|{Dedup_by_NK_Eff_Date|}379|396|}
{2010212001|XXGvertex_oport_oport|618|0|1014|0|{0|out|}396|397|}
{2010213001|XXGoport_dst_flow|619|0|1016|0|{0|}397|392|}
{2010212001|XXGvertex_oport_oport|620|0|1017|0|{1|dup|}396|398|}
{2010212001|XXGvertex_oport_oport|621|0|1019|0|{2|reject|}396|399|}
{2010212001|XXGvertex_oport_oport|622|0|1021|0|{3|error|}396|400|}
{2010212001|XXGvertex_oport_oport|623|0|1023|0|{4|log|}396|401|}
{2010211001|XXGvertex_iport_iport|624|0|1025|0|{0|in|}396|402|}
{2010214001|XXGiport_src_flow|625|0|1027|0|{0|}402|390|}
{2010007001|XXGobject_proto_object|626|0|1028|0|{}396|403|}
{2010212001|XXGvertex_oport_oport|627|0|1030|0|{0|out|}403|404|}
{2010006001|XXGobject_psameas_object|628|0|1032|0|{metadata|out_metadata|1|0|}404|403|}
{2010212001|XXGvertex_oport_oport|629|0|1033|0|{1|dup|}403|405|}
{2010006001|XXGobject_psameas_object|630|0|1035|0|{metadata|dup_metadata|1|0|}405|403|}
{2010212001|XXGvertex_oport_oport|631|0|1036|0|{2|reject|}403|406|}
{2010006001|XXGobject_psameas_object|632|0|1038|0|{metadata|reject_metadata|1|0|}406|403|}
{2010212001|XXGvertex_oport_oport|633|0|1039|0|{3|error|}403|407|}
{2010006001|XXGobject_psameas_object|634|0|1041|0|{metadata|error_metadata|1|0|}407|403|}
{2010212001|XXGvertex_oport_oport|635|0|1042|0|{4|log|}403|408|}
{2010006001|XXGobject_psameas_object|636|0|1044|0|{metadata|log_metadata|1|0|}408|403|}
{2010211001|XXGvertex_iport_iport|637|0|1045|0|{0|in|}403|409|}
{2010006001|XXGobject_psameas_object|638|0|1047|0|{metadata|in_metadata|1|0|}409|403|}
{2010601001|XXGgraph_vertex_vertex|639|0|1048|0|{Parition_by_Related_or_NK|}379|410|}
{2010212001|XXGvertex_oport_oport|640|0|1050|0|{0|out|}410|411|}
{2010213001|XXGoport_dst_flow|641|0|1052|0|{0|}411|391|}
{2010211001|XXGvertex_iport_iport|642|0|1053|0|{0|in|}410|412|}
{2010007001|XXGobject_proto_object|643|0|1055|0|{}410|413|}
{2010212001|XXGvertex_oport_oport|644|0|1057|0|{0|out|}413|414|}
{2010006001|XXGobject_psameas_object|645|0|1059|0|{metadata|out_metadata|1|0|}414|413|}
{2010211001|XXGvertex_iport_iport|646|0|1060|0|{0|in|}413|415|}
{2010006001|XXGobject_psameas_object|647|0|1062|0|{metadata|in_metadata|1|0|}415|413|}
{2010006001|XXGobject_psameas_object|648|0|1063|0|{in_metadata|INPUT_DML|1|0|}410|379|}
{2010601001|XXGgraph_vertex_vertex|649|0|1064|0|{Replicate|}379|416|}
{2010212001|XXGvertex_oport_oport|650|0|1066|0|{0|out|}416|417|}
{2010211001|XXGvertex_iport_iport|651|0|1068|0|{0|in|}416|418|}
{2010214001|XXGiport_src_flow|652|0|1070|0|{0|}418|395|}
{2010007001|XXGobject_proto_object|653|0|1071|0|{}416|419|}
{2010212001|XXGvertex_oport_oport|654|0|1073|0|{0|out|}419|420|}
{2010006001|XXGobject_psameas_object|655|0|1075|0|{metadata|out_metadata|1|0|}420|419|}
{2010211001|XXGvertex_iport_iport|656|0|1076|0|{0|in|}419|421|}
{2010006001|XXGobject_psameas_object|657|0|1078|0|{metadata|in_metadata|1|0|}421|419|}
{2010601001|XXGgraph_vertex_vertex|658|0|1079|0|{Rollup_Adjoining_Eff_Dates|}379|422|}
{2010212001|XXGvertex_oport_oport|659|0|1081|0|{0|out|}422|423|}
{2010213001|XXGoport_dst_flow|660|0|1083|0|{0|}423|395|}
{2010212001|XXGvertex_oport_oport|661|0|1084|0|{1|reject|}422|424|}
{2010212001|XXGvertex_oport_oport|662|0|1086|0|{2|error|}422|425|}
{2010212001|XXGvertex_oport_oport|663|0|1088|0|{3|log|}422|426|}
{2010211001|XXGvertex_iport_iport|664|0|1090|0|{0|in|}422|427|}
{2010214001|XXGiport_src_flow|665|0|1092|0|{0|}427|394|}
{2010007001|XXGobject_proto_object|666|0|1093|0|{}422|428|}
{2010212001|XXGvertex_oport_oport|667|0|1095|0|{0|out|}428|429|}
{2010006001|XXGobject_psameas_object|668|0|1097|0|{metadata|out_metadata|1|0|}429|428|}
{2010212001|XXGvertex_oport_oport|669|0|1098|0|{1|reject|}428|430|}
{2010006001|XXGobject_psameas_object|670|0|1100|0|{metadata|reject_metadata|1|0|}430|428|}
{2010212001|XXGvertex_oport_oport|671|0|1101|0|{2|error|}428|431|}
{2010006001|XXGobject_psameas_object|672|0|1103|0|{metadata|error_metadata|1|0|}431|428|}
{2010212001|XXGvertex_oport_oport|673|0|1104|0|{3|log|}428|432|}
{2010006001|XXGobject_psameas_object|674|0|1106|0|{metadata|log_metadata|1|0|}432|428|}
{2010211001|XXGvertex_iport_iport|675|0|1107|0|{0|in|}428|433|}
{2010006001|XXGobject_psameas_object|676|0|1109|0|{metadata|in_metadata|1|0|}433|428|}
{2010601001|XXGgraph_vertex_vertex|677|0|1110|0|{Scan_to_Fix_Overlapping_Dates|}379|434|}
{2010212001|XXGvertex_oport_oport|678|0|1112|0|{0|out|}434|435|}
{2010213001|XXGoport_dst_flow|679|0|1114|0|{0|}435|393|}
{2010212001|XXGvertex_oport_oport|680|0|1115|0|{1|reject|}434|436|}
{2010212001|XXGvertex_oport_oport|681|0|1117|0|{2|error|}434|437|}
{2010212001|XXGvertex_oport_oport|682|0|1119|0|{3|log|}434|438|}
{2010211001|XXGvertex_iport_iport|683|0|1121|0|{0|in|}434|439|}
{2010214001|XXGiport_src_flow|684|0|1123|0|{0|}439|392|}
{2010007001|XXGobject_proto_object|685|0|1124|0|{}434|440|}
{2010212001|XXGvertex_oport_oport|686|0|1126|0|{0|out|}440|441|}
{2010006001|XXGobject_psameas_object|687|0|1128|0|{metadata|out_metadata|1|0|}441|440|}
{2010212001|XXGvertex_oport_oport|688|0|1129|0|{1|reject|}440|442|}
{2010006001|XXGobject_psameas_object|689|0|1131|0|{metadata|reject_metadata|1|0|}442|440|}
{2010212001|XXGvertex_oport_oport|690|0|1132|0|{2|error|}440|443|}
{2010006001|XXGobject_psameas_object|691|0|1134|0|{metadata|error_metadata|1|0|}443|440|}
{2010212001|XXGvertex_oport_oport|692|0|1135|0|{3|log|}440|444|}
{2010006001|XXGobject_psameas_object|693|0|1137|0|{metadata|log_metadata|1|0|}444|440|}
{2010211001|XXGvertex_iport_iport|694|0|1138|0|{0|in|}440|445|}
{2010006001|XXGobject_psameas_object|695|0|1140|0|{metadata|in_metadata|1|0|}445|440|}
{2010601001|XXGgraph_vertex_vertex|696|0|1141|0|{Sort_for_Dedup|}379|446|}
{2010212001|XXGvertex_oport_oport|697|0|1143|0|{0|out|}446|447|}
{2010213001|XXGoport_dst_flow|698|0|1145|0|{0|}447|390|}
{2010211001|XXGvertex_iport_iport|699|0|1146|0|{0|in|}446|448|}
{2010214001|XXGiport_src_flow|700|0|1148|0|{0|}448|391|}
{2010007001|XXGobject_proto_object|701|0|1149|0|{}446|449|}
{2010212001|XXGvertex_oport_oport|702|0|1151|0|{0|out|}449|450|}
{2010006001|XXGobject_psameas_object|703|0|1153|0|{metadata|out_metadata|1|0|}450|449|}
{2010211001|XXGvertex_iport_iport|704|0|1154|0|{0|in|}449|451|}
{2010006001|XXGobject_psameas_object|705|0|1156|0|{metadata|in_metadata|1|0|}451|449|}
{2010601001|XXGgraph_vertex_vertex|706|0|1157|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}379|452|}
{2010212001|XXGvertex_oport_oport|707|0|1159|0|{0|out|}452|453|}
{2010213001|XXGoport_dst_flow|708|0|1161|0|{0|}453|394|}
{2010211001|XXGvertex_iport_iport|709|0|1162|0|{0|in|}452|454|}
{2010214001|XXGiport_src_flow|710|0|1164|0|{0|}454|393|}
{2010007001|XXGobject_proto_object|711|0|1165|0|{}452|455|}
{2010212001|XXGvertex_oport_oport|712|0|1167|0|{0|out|}455|456|}
{2010006001|XXGobject_psameas_object|713|0|1169|0|{metadata|out_metadata|1|0|}456|455|}
{2010211001|XXGvertex_iport_iport|714|0|1170|0|{0|in|}455|457|}
{2010006001|XXGobject_psameas_object|715|0|1172|0|{metadata|in_metadata|1|0|}457|455|}
{2010212001|XXGvertex_oport_oport|716|0|1173|0|{0|out|}379|458|}
{2010216002|XXGoport_binding_oport|717|0|1175|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}458|417|}
{2010212001|XXGvertex_oport_oport|718|0|1176|0|{1|dups|}379|459|}
{2010216002|XXGoport_binding_oport|719|0|1178|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}459|398|}
{2010211001|XXGvertex_iport_iport|720|0|1179|0|{0|in|}379|460|}
{2010215002|XXGiport_binding_iport|721|0|1181|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}460|412|}
{2010006001|XXGobject_psameas_object|722|0|1182|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}328|299|}
{2010006001|XXGobject_psameas_object|723|0|1183|0|{FIX_END_DATE|FIX_END_DATE|1|0|}328|299|}
{2010006001|XXGobject_psameas_object|724|0|1184|0|{INPUT_DML|write_metadata|0|0|}328|461|}
{2010211001|XXGvertex_iport_iport|725|0|1186|0|{0|write|}461|462|}
{2010214001|XXGiport_src_flow|726|0|1188|0|{0|}462|311|}
{2010007001|XXGobject_proto_object|727|0|1189|0|{}461|463|}
{2010211001|XXGvertex_iport_iport|728|0|1191|0|{0|write|}463|464|}
{2010006001|XXGobject_psameas_object|729|0|1193|0|{metadata|write_metadata|1|0|}464|463|}
{2010601001|XXGgraph_vertex_vertex|730|0|1194|0|{Dups|}299|461|}
{2010601001|XXGgraph_vertex_vertex|731|0|1195|0|{Gather|}299|465|}
{2010212001|XXGvertex_oport_oport|732|0|1197|0|{0|out|}465|466|}
{2010213001|XXGoport_dst_flow|733|0|1199|0|{0|}466|315|}
{2010211001|XXGvertex_iport_iport|734|0|1200|0|{0|in|}465|467|}
{2010214001|XXGiport_src_flow|735|0|1202|0|{0|}467|313|}
{2010007001|XXGobject_proto_object|736|0|1203|0|{}465|468|}
{2010212001|XXGvertex_oport_oport|737|0|1205|0|{0|out|}468|469|}
{2010006001|XXGobject_psameas_object|738|0|1207|0|{metadata|out_metadata|1|0|}469|468|}
{2010211001|XXGvertex_iport_iport|739|0|1208|0|{0|in|}468|470|}
{2010006001|XXGobject_psameas_object|740|0|1210|0|{metadata|in_metadata|1|0|}470|468|}
{2010601001|XXGgraph_vertex_vertex|741|0|1211|0|{Gather_|}299|471|}
{2010212001|XXGvertex_oport_oport|742|0|1213|0|{0|out|}471|472|}
{2010211001|XXGvertex_iport_iport|743|0|1215|0|{0|in|}471|473|}
{2010214001|XXGiport_src_flow|744|0|1217|0|{0|}473|312|}
{2010214001|XXGiport_src_flow|745|0|1218|0|{1|}473|315|}
{2010007001|XXGobject_proto_object|746|0|1219|0|{}471|474|}
{2010212001|XXGvertex_oport_oport|747|0|1221|0|{0|out|}474|475|}
{2010006001|XXGobject_psameas_object|748|0|1223|0|{metadata|out_metadata|1|0|}475|474|}
{2010211001|XXGvertex_iport_iport|749|0|1224|0|{0|in|}474|476|}
{2010006001|XXGobject_psameas_object|750|0|1226|0|{metadata|in_metadata|1|0|}476|474|}
{2010601001|XXGgraph_vertex_vertex|751|0|1227|0|{Map_to_Output|}299|477|}
{2010212001|XXGvertex_oport_oport|752|0|1229|0|{0|source|}477|478|}
{2010213001|XXGoport_dst_flow|753|0|1231|0|{0|}478|314|}
{2010212001|XXGvertex_oport_oport|754|0|1232|0|{1|clean|}477|479|}
{2010213001|XXGoport_dst_flow|755|0|1234|0|{0|}479|309|}
{2010212001|XXGvertex_oport_oport|756|0|1235|0|{2|lkp|}477|480|}
{2010213001|XXGoport_dst_flow|757|0|1237|0|{0|}480|308|}
{2010212001|XXGvertex_oport_oport|758|0|1238|0|{3|reject0|}477|481|}
{2010212001|XXGvertex_oport_oport|759|0|1240|0|{4|reject1|}477|482|}
{2010212001|XXGvertex_oport_oport|760|0|1242|0|{5|reject2|}477|483|}
{2010212001|XXGvertex_oport_oport|761|0|1244|0|{6|error0|}477|484|}
{2010212001|XXGvertex_oport_oport|762|0|1246|0|{7|error1|}477|485|}
{2010212001|XXGvertex_oport_oport|763|0|1248|0|{8|error2|}477|486|}
{2010212001|XXGvertex_oport_oport|764|0|1250|0|{9|log|}477|487|}
{2010211001|XXGvertex_iport_iport|765|0|1252|0|{0|in|}477|488|}
{2010007001|XXGobject_proto_object|766|0|1254|0|{}477|489|}
{2010212001|XXGvertex_oport_oport|767|0|1256|0|{0|source|}489|490|}
{2010006001|XXGobject_psameas_object|768|0|1258|0|{metadata|out0_metadata|1|0|}490|489|}
{2010006001|XXGobject_psameas_object|769|0|1259|0|{transform0|transform0|1|0|}490|489|}
{2010212001|XXGvertex_oport_oport|770|0|1260|0|{1|clean|}489|491|}
{2010006001|XXGobject_psameas_object|771|0|1262|0|{metadata|out1_metadata|1|0|}491|489|}
{2010006001|XXGobject_psameas_object|772|0|1263|0|{transform1|transform1|1|0|}491|489|}
{2010212001|XXGvertex_oport_oport|773|0|1264|0|{2|lkp|}489|492|}
{2010006001|XXGobject_psameas_object|774|0|1266|0|{metadata|out2_metadata|1|0|}492|489|}
{2010006001|XXGobject_psameas_object|775|0|1267|0|{transform2|transform2|1|0|}492|489|}
{2010212001|XXGvertex_oport_oport|776|0|1268|0|{3|reject0|}489|493|}
{2010006001|XXGobject_psameas_object|777|0|1270|0|{metadata|reject0_metadata|1|0|}493|489|}
{2010212001|XXGvertex_oport_oport|778|0|1271|0|{4|reject1|}489|494|}
{2010006001|XXGobject_psameas_object|779|0|1273|0|{metadata|reject1_metadata|1|0|}494|489|}
{2010212001|XXGvertex_oport_oport|780|0|1274|0|{5|reject2|}489|495|}
{2010006001|XXGobject_psameas_object|781|0|1276|0|{metadata|reject2_metadata|1|0|}495|489|}
{2010212001|XXGvertex_oport_oport|782|0|1277|0|{6|error0|}489|496|}
{2010006001|XXGobject_psameas_object|783|0|1279|0|{metadata|error0_metadata|1|0|}496|489|}
{2010212001|XXGvertex_oport_oport|784|0|1280|0|{7|error1|}489|497|}
{2010006001|XXGobject_psameas_object|785|0|1282|0|{metadata|error1_metadata|1|0|}497|489|}
{2010212001|XXGvertex_oport_oport|786|0|1283|0|{8|error2|}489|498|}
{2010006001|XXGobject_psameas_object|787|0|1285|0|{metadata|error2_metadata|1|0|}498|489|}
{2010212001|XXGvertex_oport_oport|788|0|1286|0|{9|log|}489|499|}
{2010006001|XXGobject_psameas_object|789|0|1288|0|{metadata|log_metadata|1|0|}499|489|}
{2010211001|XXGvertex_iport_iport|790|0|1289|0|{0|in|}489|500|}
{2010006001|XXGobject_psameas_object|791|0|1291|0|{metadata|in_metadata|1|0|}500|489|}
{2010601001|XXGgraph_vertex_vertex|792|0|1292|0|{Merge|}299|501|}
{2010212001|XXGvertex_oport_oport|793|0|1294|0|{0|out|}501|502|}
{2010213001|XXGoport_dst_flow|794|0|1296|0|{0|}502|312|}
{2010211001|XXGvertex_iport_iport|795|0|1297|0|{0|in|}501|503|}
{2010214001|XXGiport_src_flow|796|0|1299|0|{0|}503|310|}
{2010007001|XXGobject_proto_object|797|0|1300|0|{}501|504|}
{2010212001|XXGvertex_oport_oport|798|0|1302|0|{0|out|}504|505|}
{2010006001|XXGobject_psameas_object|799|0|1304|0|{metadata|out_metadata|1|0|}505|504|}
{2010211001|XXGvertex_iport_iport|800|0|1305|0|{0|in|}504|506|}
{2010006001|XXGobject_psameas_object|801|0|1307|0|{metadata|in_metadata|1|0|}506|504|}
{2010212001|XXGvertex_oport_oport|802|0|1308|0|{0|source|}299|507|}
{2010216002|XXGoport_binding_oport|803|0|1310|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9924|}507|317|}
{2010212001|XXGvertex_oport_oport|804|0|1311|0|{1|clean|}299|508|}
{2010216002|XXGoport_binding_oport|805|0|1313|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9925|}508|323|}
{2010212001|XXGvertex_oport_oport|806|0|1314|0|{2|lookup|}299|509|}
{2010216002|XXGoport_binding_oport|807|0|1316|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9926|}509|472|}
{2010211001|XXGvertex_iport_iport|808|0|1317|0|{0|in0|}299|510|}
{2010215002|XXGiport_binding_iport|809|0|1319|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9923|}510|488|}
{2010006001|XXGobject_psameas_object|810|0|1320|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}216|1|}
{2010006001|XXGobject_psameas_object|811|0|1321|0|{FIX_END_DATE|FIX_END_DATE|1|0|}216|1|}
{2010601001|XXGgraph_vertex_vertex|812|0|1322|0|{RFMT_Optional_transform|}1|52|}
{2010601001|XXGgraph_vertex_vertex|813|0|1323|0|{Read_IDS_Data_File|}1|511|}
{2010604001|XXGgraph_flow_flow|814|0|1325|0|{Flow_1|}511|87|}
{2010604001|XXGgraph_flow_flow|815|0|1326|0|{Flow_17|}511|72|}
{2010601001|XXGgraph_vertex_vertex|816|0|1327|0|{Broadcast|}511|512|}
{2010212001|XXGvertex_oport_oport|817|0|1329|0|{0|out|}512|513|}
{2010213001|XXGoport_dst_flow|818|0|1331|0|{0|}513|72|}
{2010211001|XXGvertex_iport_iport|819|0|1332|0|{0|in|}512|514|}
{2010214001|XXGiport_src_flow|820|0|1334|0|{0|}514|87|}
{2010007001|XXGobject_proto_object|821|0|1335|0|{}512|515|}
{2010212001|XXGvertex_oport_oport|822|0|1337|0|{0|out|}515|516|}
{2010006001|XXGobject_psameas_object|823|0|1339|0|{metadata|out_metadata|1|0|}516|515|}
{2010211001|XXGvertex_iport_iport|824|0|1340|0|{0|in|}515|517|}
{2010006001|XXGobject_psameas_object|825|0|1342|0|{metadata|in_metadata|1|0|}517|515|}
{2010006001|XXGobject_psameas_object|826|0|1343|0|{in_metadata|out_metadata|0|0|}512|85|}
{2010006001|XXGobject_psameas_object|827|0|1344|0|{out_metadata|out_metadata|0|0|}512|85|}
{2010601001|XXGgraph_vertex_vertex|828|0|1345|0|{List_IDS_Files|}511|85|}
{2010601001|XXGgraph_vertex_vertex|829|0|1346|0|{Read_IDS_Files|}511|64|}
{2010212001|XXGvertex_oport_oport|830|0|1347|0|{0|out0|}511|518|}
{2010216002|XXGoport_binding_oport|831|0|1349|0|{.5|.5|{0|}14885|}518|65|}
{2010213001|XXGoport_dst_flow|832|0|1350|0|{0|}518|28|}
{2010212001|XXGvertex_oport_oport|833|0|1351|0|{1|out1|}511|519|}
{2010216002|XXGoport_binding_oport|834|0|1353|0|{.5|.5|{0|}14886|}519|70|}
{2010213001|XXGoport_dst_flow|835|0|1354|0|{0|}519|29|}
{2010601001|XXGgraph_vertex_vertex|836|0|1355|0|{Read_IDS_Event_File|}1|520|}
{2010604001|XXGgraph_flow_flow|837|0|1357|0|{Flow_15|}520|167|}
{2010604001|XXGgraph_flow_flow|838|0|1358|0|{Flow_16|}520|156|}
{2010601001|XXGgraph_vertex_vertex|839|0|1359|0|{Broadcast_1|}520|521|}
{2010212001|XXGvertex_oport_oport|840|0|1361|0|{0|out|}521|522|}
{2010213001|XXGoport_dst_flow|841|0|1363|0|{0|}522|156|}
{2010211001|XXGvertex_iport_iport|842|0|1364|0|{0|in|}521|523|}
{2010214001|XXGiport_src_flow|843|0|1366|0|{0|}523|167|}
{2010007001|XXGobject_proto_object|844|0|1367|0|{}521|524|}
{2010212001|XXGvertex_oport_oport|845|0|1369|0|{0|out|}524|525|}
{2010006001|XXGobject_psameas_object|846|0|1371|0|{metadata|out_metadata|1|0|}525|524|}
{2010211001|XXGvertex_iport_iport|847|0|1372|0|{0|in|}524|526|}
{2010006001|XXGobject_psameas_object|848|0|1374|0|{metadata|in_metadata|1|0|}526|524|}
{2010006001|XXGobject_psameas_object|849|0|1375|0|{Layout|Layout|0|0|}521|165|}
{2010006001|XXGobject_psameas_object|850|0|1376|0|{in_metadata|out_metadata|0|0|}521|165|}
{2010006001|XXGobject_psameas_object|851|0|1377|0|{out_metadata|out_metadata|0|0|}521|165|}
{2010601001|XXGgraph_vertex_vertex|852|0|1378|0|{List_IDS_Files_1|}520|165|}
{2010601001|XXGgraph_vertex_vertex|853|0|1379|0|{Read_IDS_Files_1|}520|148|}
{2010212001|XXGvertex_oport_oport|854|0|1380|0|{0|out0|}520|527|}
{2010216002|XXGoport_binding_oport|855|0|1382|0|{.5|.5|{0|}14874|}527|149|}
{2010213001|XXGoport_dst_flow|856|0|1383|0|{0|}527|23|}
{2010212001|XXGvertex_oport_oport|857|0|1384|0|{1|out1|}520|528|}
{2010216002|XXGoport_binding_oport|858|0|1386|0|{.5|.5|{0|}14875|}528|154|}
{2010213001|XXGoport_dst_flow|859|0|1387|0|{0|}528|16|}
{2010601001|XXGgraph_vertex_vertex|860|0|1388|0|{Rollup_Job_Info|}1|529|}
{2010212001|XXGvertex_oport_oport|861|0|1390|0|{0|out|}529|530|}
{2010213001|XXGoport_dst_flow|862|0|1392|0|{0|}530|19|}
{2010212001|XXGvertex_oport_oport|863|0|1393|0|{1|reject|}529|531|}
{2010212001|XXGvertex_oport_oport|864|0|1395|0|{2|error|}529|532|}
{2010212001|XXGvertex_oport_oport|865|0|1397|0|{3|log|}529|533|}
{2010211001|XXGvertex_iport_iport|866|0|1399|0|{0|in|}529|534|}
{2010214001|XXGiport_src_flow|867|0|1401|0|{0|}534|16|}
{2010214001|XXGiport_src_flow|868|0|1402|0|{1|}534|29|}
{2010007001|XXGobject_proto_object|869|0|1403|0|{}529|535|}
{2010212001|XXGvertex_oport_oport|870|0|1405|0|{0|out|}535|536|}
{2010006001|XXGobject_psameas_object|871|0|1407|0|{metadata|out_metadata|1|0|}536|535|}
{2010212001|XXGvertex_oport_oport|872|0|1408|0|{1|reject|}535|537|}
{2010006001|XXGobject_psameas_object|873|0|1410|0|{metadata|reject_metadata|1|0|}537|535|}
{2010212001|XXGvertex_oport_oport|874|0|1411|0|{2|error|}535|538|}
{2010006001|XXGobject_psameas_object|875|0|1413|0|{metadata|error_metadata|1|0|}538|535|}
{2010212001|XXGvertex_oport_oport|876|0|1414|0|{3|log|}535|539|}
{2010006001|XXGobject_psameas_object|877|0|1416|0|{metadata|log_metadata|1|0|}539|535|}
{2010211001|XXGvertex_iport_iport|878|0|1417|0|{0|in|}535|540|}
{2010006001|XXGobject_psameas_object|879|0|1419|0|{metadata|in_metadata|1|0|}540|535|}
{2010006001|XXGobject_psameas_object|880|0|1420|0|{in_metadata|log_metadata|0|0|}529|64|}
{2010006001|XXGobject_psameas_object|881|0|1421|0|{out_metadata|write_metadata|0|0|}529|98|}
{2010006001|XXGobject_psameas_object|882|0|1422|0|{reject_metadata|log_metadata|0|0|}529|64|}
{2010601001|XXGgraph_vertex_vertex|883|0|1423|0|{Trash|}1|541|}
{2010211001|XXGvertex_iport_iport|884|0|1425|0|{0|in|}541|542|}
{2010214001|XXGiport_src_flow|885|0|1427|0|{0|}542|27|}
{2010007001|XXGobject_proto_object|886|0|1428|0|{}541|543|}
{2010211001|XXGvertex_iport_iport|887|0|1430|0|{0|in|}543|544|}
{2010006001|XXGobject_psameas_object|888|0|1432|0|{metadata|in_metadata|1|0|}544|543|}
{2010006001|XXGobject_psameas_object|889|0|1433|0|{Layout|Layout|0|0|}541|94|}
{2010006001|XXGobject_psameas_object|890|0|1434|0|{in_metadata|read_metadata|0|0|}541|94|}
{2010601001|XXGgraph_vertex_vertex|891|0|1435|0|{Trash_1|}1|545|}
{2010211001|XXGvertex_iport_iport|892|0|1437|0|{0|in|}545|546|}
{2010214001|XXGiport_src_flow|893|0|1439|0|{0|}546|17|}
{2010007001|XXGobject_proto_object|894|0|1440|0|{}545|547|}
{2010211001|XXGvertex_iport_iport|895|0|1442|0|{0|in|}547|548|}
{2010006001|XXGobject_psameas_object|896|0|1444|0|{metadata|in_metadata|1|0|}548|547|}
{2010006001|XXGobject_psameas_object|897|0|1445|0|{Layout|Layout|0|0|}545|102|}
{2010006001|XXGobject_psameas_object|898|0|1446|0|{in_metadata|read_metadata|0|0|}545|102|}
{2010601001|XXGgraph_vertex_vertex|899|0|1447|0|{Update_Watermark_File|}1|549|}
{2010212001|XXGvertex_oport_oport|900|0|1449|0|{0|out|}549|550|}
{2010211001|XXGvertex_iport_iport|901|0|1451|0|{0|in|}549|551|}
{2010007001|XXGobject_proto_object|902|0|1453|0|{}549|552|}
{2010212001|XXGvertex_oport_oport|903|0|1455|0|{0|out|}552|553|}
{2010006001|XXGobject_psameas_object|904|0|1457|0|{metadata|out_metadata|1|0|}553|552|}
{2010211001|XXGvertex_iport_iport|905|0|1458|0|{0|in|}552|554|}
{2010006001|XXGobject_psameas_object|906|0|1460|0|{metadata|in_metadata|1|0|}554|552|}
{2010601001|XXGgraph_vertex_vertex|907|0|1461|0|{Version_Log|}1|555|}
{2010605001|XXGgraph_legend_legend|908|0|1463|0|{0|}555|556|}
{2010241001|XXGlegend_face_face|909|0|1465|0|{}556|557|}
{2010605001|XXGgraph_legend_legend|910|0|1467|0|{1|}555|558|}
{2010241001|XXGlegend_face_face|911|0|1469|0|{}558|559|}
{2010605001|XXGgraph_legend_legend|912|0|1471|0|{2|}555|560|}
{2010241001|XXGlegend_face_face|913|0|1473|0|{}560|561|}
{2010109001|XXGobject_property_value|914|0|1475|0|{0|TrackingThumbprint|72|}1|562|}
