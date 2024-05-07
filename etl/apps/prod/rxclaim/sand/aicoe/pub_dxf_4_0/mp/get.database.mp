@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|665|rel_count|1102|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_CATALOG|@3|9|EFK|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DB_XFR/db_list.xfr";|8|1|RFKl|Provides functions and types to use in PDL.|{0|}}
{30001002|XXparameter|AB_MAX_RECORD_BUFFER|5000000|3|9|EFK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|QUERY_TYPE_ID|@3|9|RFK|@{0|}}
{30001002|XXparameter|STEP_NAME|get|3|9|RFK|@{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|NOTES||3|2|FK$|Use this to save useful information, such as run times, record counts, and data sizes.  For example: 30.5 min, 122.5 M rec, 64.0 GB|{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|FK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
{30001002|XXparameter|VARIATION||3|9|FK|@{0|}}
{30001002|XXparameter|EXTRACT_START_CHANGES_TIME_FILE|$[ AI_SERIAL + "/get." + SOURCE_SYSTEM + "/get.watermark." + SOURCE_NAME + ".dat" ]|3|9|RK|@{0|}}
{30001002|XXparameter|START_CHANGES_TIME|AB_PARAMETER_ENV|3|10|FKd|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to "", which means include all dates.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME|AB_PARAMETER_ENV|3|10|FKd|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|DO_QUERY_IN_PARALLEL|False|13|9|FK|0 or 1: Whether to read the database in parallel.  Defaults to 0 (False).|{2|0|1|}}
{30001002|XXparameter|SELECT_HINT||3|9|FK|Optional: A SQL comment to be used as a hint in the source SELECT statement.|{0|}}
{30001002|XXparameter|WHERE_CLAUSE||3|9|FK|Optional, a WHERE clause to add to the query to filter and, if there are multiple tables, join the table(s).  This is required if there are multiple tables, or if there is a client filter.|{0|}}
{30001002|XXparameter|CLIENT_FILTER_CLAUSE||3|9|FK|Optional: A SQL expression that is added to the query to filter the results.  Use this to limit which clients are returned.|{0|}}
{30001002|XXparameter|SOURCE_DBMS_TYPE|@15|9|RFK|@{4|netezza|oracle|mssql|informix|}}
{30001002|XXparameter|SOURCE_UNLOAD_INTERFACE|api|3|9|FK|@{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|FKl||{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/../lookup.dataset_id.txt|3|9|FK|The path to a file used to provide unique IDs.  These IDs are used to track the handling of different datasets.|{0|}}
{30001002|XXparameter|SOURCE_DB_LIST||3|9|RFK|A list of source schemas/users/databases, one per line, with the fields separated by spaces.  The first of these is used for the output DML.  Comments beginning with # are ignored.|{0|}}
{30001002|XXparameter|DEFAULT_SOURCE_DB_PROJECT|@3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_DB_PROJECT|$DEFAULT_SOURCE_DB_PROJECT|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_DB_INFO_VEC|$[ 
if(QUERY_TYPE_ID == "1")
  get_db_info_vec(SOURCE_DB_LIST, AI_SERIAL, AI_MFS)
else if(QUERY_TYPE_ID member [vector "2", "3"])
  get_db_info_vec_db_project(SOURCE_DB_LIST, SOURCE_DB_PROJECT, AI_SERIAL, AI_MFS)
]|3|9|RFK|A vector of information about the source schemas/users/databases.|{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|$SOURCE_SYSTEM|3|9|RFK|Logical Schema Name for the Source DB. Defaults to Physical Schema Name i.e. SOURC_SYSTEM parameter|{0|}}
{30001002|XXparameter|___Netezza_Parameters___|TODO: Move these into the subgraphs. -Kimbo 4/7/14|3|1|Kl||{0|}}
{30001002|XXparameter|NETEZZA_DISTINCT_DATASLICEID|AB_PARAMETER_ENV|3|10|EKd|A string with a list of data slice IDs available in Netezza, if unloading in parallel.|{0|}}
{30001002|XXparameter|NETEZZA_DSLICE_LIST_VEC|$[begin
let string("")[int]datasliceid_vec = string_split(NETEZZA_DISTINCT_DATASLICEID, "\\n");
let no_dataslices = length_of(datasliceid_vec);
let int dop = (decimal(""))AI_MFS_DEPTH;
let int i;
let int ii;
let int counter=0;
let int[int] entries_to_pad=allocate();
let int result_size = no_dataslices/dop;
let int result_remainder = no_dataslices%dop;
let string("")result_entry="";
let string("")[int] result_vec=allocate();

if (no_dataslices==0) //Not sure what this would mean
  force_error("No dataslices found for table");
else if (no_dataslices < dop) //This should be very rare - no SPUs should generally exceed DOP
  result_size = 1;
else if (result_remainder > 0)
  entries_to_pad = make_constant_vector(result_remainder,1);

for(i, i<dop)
begin
  result_entry="";
  for (ii, ii<result_size)
    begin
    result_entry = result_entry + (is_blank(result_entry)?"":",") + null_if_error(string_replace(datasliceid_vec[counter],'\|',''), "");
    counter=counter+1;
    if (result_remainder && first_without_error(entries_to_pad[i]==1,0))
      begin
        result_entry = result_entry + (is_blank(result_entry)?"":",") + null_if_error(string_replace(datasliceid_vec[counter],'\|',''), "");
        counter = counter+1;
        entries_to_pad[i]=0;
      end
    end
  result_vec = vector_append(result_vec, result_entry);
end

result :: string_representation(result_vec);

end]|3|9|K|A vector of lists of data slice IDs to be assigned to each partition.|{0|}}
{30001002|XXparameter|SOURCE_DBC_FILE|$[SOURCE_DB_INFO_VEC[0].dbc_file]|3|9|REK|Path to the source database project's database configuration (DBC) file.  Defaults to a value based on the Source Name.|{0|}}
{30001002|XXparameter|SOURCE_DB_DML|$[SOURCE_DB_INFO_VEC[0].dml_directory]|3|9|REK|Path to the source database project's database directory.  Used to derive other source database project directories.|{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.get_database.default.xfr|3|9|FK||{0|}}
{30001002|XXparameter|NETEZZA_DISTINCT_DATASLICEID:eme|$[ if ( DO_QUERY_IN_PARALLEL ) "1\|\\n2\|\\n3\|\\n4\|\\n" else "" ]|3|9||@{0|}}
{30001002|XXparameter|NETEZZA_DISTINCT_DATASLICEID:sandbox|$( if [ $DO_QUERY_IN_PARALLEL != 0 && $SOURCE_DBMS_TYPE = "netezza" ]; then
     m_db unload $NETEZZA_DBC_FILE -select "SELECT ds_id FROM _v_dslice" -column_delimiter "\|"
   else
     echo '';
   fi;
)|3|9||@{0|}}
{30001002|XXparameter|ABLOCAL_EXPR|$[ if(DO_QUERY_IN_PARALLEL && SOURCE_DBMS_TYPE == "netezza")

    "switch(number_of_partitions())
      case -1 : '1=2' ;//non component (gendml etc) so make it cheap
      case 1 : '1=1' ;//serial
      default : (' datasliceid in (' + (" + NETEZZA_DSLICE_LIST_VEC + "[this_partition()]) + ')' );
    end"
   else
     ""
]|3|9|FK|A fragment of SQL to use to allocate data to each partition of a parallel unload.  Defaults to empty, except for Netezza, parallel unloads.|{0|}}
{30001002|XXparameter|___Local_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_TABLE_LIST|# Schema Name\|Unqualified Table Name\|Opt: Fields (No Spaces)\|Opt: SQL Abbrev\|Opt: DML Prefix\|
schema_1\|table_1|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_TABLE_INFO_VEC|$[
begin
  let string("") line_to_process = "";
  let string("")[int] word_vec = [vector];
  let string("") table_name = "";
  let string("") schema_name = "";
  let string("") fields = ""; 
  let string("") sql_abbrev = ""; 
  let string("") dml_prefix = ""; 
  let string("")[int] field_vec = allocate_with_nulls();
  let dml_field_info_vec info_vec = [vector];
  let src_table_list = string_split_no_empty(SOURCE_TABLE_LIST, "\\n");
  result :: for ( let i = 1, i < length_of(src_table_list) ) begin
                line_to_process = src_table_list[i];
                word_vec = re_split_no_empty(line_to_process, '[\\t ]+');
                schema_name = re_replace(word_vec[0], ".*[.]", ""); // Remove any schema qualifier.
                table_name = re_replace(word_vec[1], ".*[.]", ""); // Remove any schema qualifier.
                fields     = null_if_error(word_vec[2]); // Optional
                sql_abbrev = null_if_error(word_vec[3]); // Optional
                dml_prefix = null_if_error(word_vec[4]); // Optional
                field_vec = first_defined(null_if_error(re_split_no_empty(fields, "[ ,;\{\}]+")), NULL);
                info_vec = record_info(read_type(SOURCE_DB_DML + "/" + schema_name + "/" + schema_name + "." + table_name + ".dml"));
  end
  :  [record
    schema_name     schema_name
    table_name      table_name
    sql_alias       first_defined(null_if_error("  " + sql_abbrev), "  " + table_name)
    sql_abbrev      first_defined(null_if_error("  " + sql_abbrev), "  " + table_name)
    dml_prefix      first_defined(null_if_error(dml_prefix + "_"), " ")
    record_info     if ( is_null(field_vec) ) info_vec 
                    else for ( let i in info_vec ) : if (i.name member field_vec ) i
  ];

end
]|3|9|RK|@{0|}}
{30001002|XXparameter|SOURCE_FIELD_INFO_VEC|$[
begin
  let num = 0;
  let field_info_vec = for ( let tbl in SOURCE_TABLE_INFO_VEC ) : 
    for ( let info in tbl.record_info ) :
      if ( info.name != "newline" ) begin
        let sql_field_name = info.name;
        let full_field_name = tbl.dml_prefix + sql_field_name; // Add the prefix to the field name.
        num = num + 1;
        info.name = full_field_name;
        result :: [record
          field_num      num
          sql_field_name tbl.sql_abbrev + "." + sql_field_name
          dml_info       info
        ];
      end;
  result :: if(QUERY_TYPE_ID member [vector "1", "2"]) vector_sort(
    vector_sort_dedup_first(field_info_vec, \{dml_info.name\}), // Remove duplicates...
    \{field_num\}) else [vector];                                             // and then put back in the original order.
end
]|3|9|K|A vector of field names, including any prefixes.|{0|}}
{30001002|XXparameter|SOURCE_DB_LAYOUT|$[ 
if ( DO_QUERY_IN_PARALLEL )
  SOURCE_DB_INFO_VEC[0].mfs_layout
else
  SOURCE_DB_INFO_VEC[0].serial_layout
]|3|9|RFK|The layout to use for the Input Table component.  This may be on a remote DB gateway.  Defaults to database layout for mssql (cannot be changed for mssql) and serial layout for other dbms types.|{0|}}
{30001002|XXparameter|SOURCE_DB_LOCAL_LAYOUT|$[ 
if ( DO_QUERY_IN_PARALLEL )
  SOURCE_DB_INFO_VEC[0].mfs_local_layout
else
  SOURCE_DB_INFO_VEC[0].serial_layout
]|3|9|RFK|If a remote DB gateway is used, then this must be a layout on the local server(s).|{0|}}
{30001002|XXparameter|UNLOAD_LOG_FILE_PATH|$[string_lrtrim(string_substring(SOURCE_DB_LOCAL_LAYOUT, string_index(SOURCE_DB_LOCAL_LAYOUT, "/"), string_length(SOURCE_DB_LOCAL_LAYOUT))) + "/" + STEP_NAME + "." + SOURCE_SYSTEM]|3|9|RK|@{0|}}
{30001002|XXparameter|MAX_SQL_FIELD_WIDTH|$[ first_defined(
    vector_max(
      for ( let f in SOURCE_FIELD_INFO_VEC ) :
        (decimal(""))string_length(f.sql_field_name)),
    0)
]|3|9|K|The width of the widest SQL field reference.|{0|}}
{30001002|XXparameter|SELECT_FIELDS|$[ string_replace(string_join(
  for ( let f in SOURCE_FIELD_INFO_VEC ) :
    if ( re_replace(f.sql_field_name, "^.*[.]", "") == f.dml_info.name )
      f.sql_field_name
    else
      printf(string_replace("%-36s AS %s", "36", MAX_SQL_FIELD_WIDTH),
        f.sql_field_name,
        f.dml_info.name),
  "\\n     , "), '_at__at_cnd', '"\@\@CND"')
]|3|9|K|A fully qulified list of fields to include in the SELECT statement, indented appropriately.|{0|}}
{30001002|XXparameter|FROM_CLAUSE|$[ 
begin

let string("") from_clause;
let string("")[int] from_clause_vec = [vector];
let decimal("") physical_schema_index = -1;
let string("") tbl_str = "";
let db_info_vec = SOURCE_DB_INFO_VEC;

for ( let tbl in SOURCE_TABLE_INFO_VEC ) begin 
        physical_schema_index = vector_search(db_info_vec, [record logical_schema tbl.schema_name physical_schema "" dml_directory "" dbms_type "" parameter_prefix "" parameterized_dml_directory "" dbc_file "" pset_directory "" run_directory "" xfr_directory "" serial_layout "" mfs_layout "" mfs_local_layout ""], \{logical_schema\});
        tbl_str = if(SOURCE_DBMS_TYPE == "mssql") tbl.table_name + "  " + tbl.sql_alias else db_info_vec[physical_schema_index].physical_schema + "." + tbl.table_name + "  " + tbl.sql_alias;
        from_clause_vec = vector_append(from_clause_vec, tbl_str);
end 
       
if(QUERY_TYPE_ID member [vector "1", "2"])
from_clause = 'FROM    ' + string_join( for ( let tbl in from_clause_vec ) : tbl,  "\\n     , ");
else if(QUERY_TYPE_ID == "3") begin from_clause = "";
end

result :: from_clause;
end


]|3|9|FK|A vector of FROM clauses for the source SELECT statements.  This is derived from the given DB and table lists.|{0|}}
{30001002|XXparameter|PROCESS_SOURCE|$[ if(QUERY_TYPE_ID == "1") re_replace(re_replace(FROM_CLAUSE, "^.*FROM +[a-z\|0-9]*.", ""), " .*", "") else "" ]|3|9|FK||{0|}}
{30001002|XXparameter|SQL|@3|9|FK|@{0|}}
{30001002|XXparameter|READ_TBL_SQL_ABLOCAL|AB_PARAMETER_ENV|3|10|RKd|A vector of source SELECT statements.|{0|}}
{30001002|XXparameter|READ_TBL_SQL|$[ if(QUERY_TYPE_ID == "1") re_replace(string_replace(READ_TBL_SQL_ABLOCAL,'  WHERE ABLOCAL()',''),'\\n   AND ABLOCAL\\\\(\\\\)','') else READ_TBL_SQL_ABLOCAL ]|3|9|RK|@{0|}}
{30001002|XXparameter|READ_TBL_GENDML|AB_PARAMETER_ENV|3|10|RKd|Data will be unloaded using this layout|{0|}}
{30001002|XXparameter|READ_TBL_GENDML:eme|$[
first_without_error(
  read_type(AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml"),
  read_type(AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml"),
  read_type(AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml"))
]|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_GENDML:sandbox|$( m_db gendml $SOURCE_DBC_FILE -field_type_preference variable -select "$READ_TBL_SQL" )|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_GEN_DELIMITED_DML|AB_PARAMETER_ENV|3|10|RKd|Output file will be generated using this layout|{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|$[
begin
  let info_vec = record_info(READ_TBL_GEN_DELIMITED_DML);
  
  result :: join_types(
    read_type("/~$PUB_DXF_DML/dxf_header.dml"),
    add_fields("record\\nend", info_vec));
end
]|3|9|RK|The input DML, optimized, plus a DMF header.|{0|}}
{30001002|XXparameter|PARTITION_KEY||19|9|FK|Optional: \{key1; key2;...\}: The field(s) to partition on, if any.|{0|}}
{30001002|XXparameter|SORT_KEY|$PARTITION_KEY|19|9|FK|Optional: \{key1; key2;...\}: The field(s) to sort on, if any.|{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|DO_SOURCE|0|1|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|0|1|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|1|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|AB_PARAMETER_ENV|3|10|RFKd|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|AB_PARAMETER_ENV|3|10|RFKd|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dat" ]|3|9|RFK|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|RFK|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|RFK|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml" ]|3|9|RFK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML_PLUS_HEADER ]|3|9|RK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|RK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info("\{" + string_replace(LOOKUP_FIELDS, ",", ";") + "\}") ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_DML|$[
if ( not DO_LOOKUP )
  ""
else
  add_fields(
    "record\\nend",
    for ( let f in record_info(GET_DML_PLUS_HEADER) ) :
      if ( LOOKUP_FIELD_NAME_VEC == [vector] or f.name member LOOKUP_FIELD_NAME_VEC )
        f)
]|3|9|RK|The record format for any lookup output file.  Defaults to the input DML, plus a DMF header, reduced to the fields specified in the lookup fields key.|{0|}}
{30001002|XXparameter|OUTPUT_DML|$[
if ( SOURCE_DML != "" )
  SOURCE_DML
else if ( CLEAN_DML != "" )
  CLEAN_DML
else
  LOOKUP_DML
]|3|9|FK|The record format of the source, clean, or lookup output, whichever is first used.|{0|}}
{30001002|XXparameter|LOOKUP_KEY||3|9|EFK|\{field_1; ...; field_n\}: Optional: The key to use for lookup.  When present, a serial lookup file will be produced.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$1")
]|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$[ re_match_replace(LOOKUP_KEY,
    ".*; *(.*) interval_bottom; *(.*) interval_top",
    "$2")
]|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|DEFAULT_DEDUP_SORT_KEY|// This must be set appropriately in the intermediate pset.
\{rec_stat_cd; update_ts descending; insert_ts descending; dxf_src_dataset_id descending; dxf_src_rec_cnt descending; drop_record; $END_DATE_FIELD_NAME\}
// rec_stat_cd                                    // A (Source Active) before I (Source Inactive)
// update_ts descending                              // Records updated later over earlier
// insert_ts descending                              // Records created later over earlier
// dxf_src_dataset_id descending; dxf_src_rec_cnt descending  // Records delivered later over earlier
// drop_record                                                // 0 (Inserts) over 1 (Deletes)
// $END_DATE_FIELD_NAME                                       // If all else fails, favor records that expire earlier|3|9|RFK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member LOOKUP_FIELD_NAME_VEC )
      k)
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ make_key(vector_concat(for (let key in key_info(LOOKUP_KEY)) key.modifiers = [vector]; : key, 
for (let key in key_info(EXTRA_DEDUP_SORT_KEY)) key.modifiers = [vector]; : key))
]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|DO_PUBLISH_CLEAN_FILE|0|1|9|RFK|@{0|}}
{30001002|XXparameter|PUBLIC_CLEAN_FILE_URL|$[
begin
let string("") v_source_entity=string_split(SOURCE_LOWER,".")[1];
let string ("") v_source_system=SOURCE_SYSTEM; //if(is_blank(SOURCE_SYSTEM_OVERRIDE)) SOURCE_SYSTEM else SOURCE_SYSTEM_OVERRIDE ;
result :: if(DO_PUBLISH_CLEAN_FILE == 1) PUB_DATAHUB_MFS + "/raw/clean." + v_source_system + "/clean." + v_source_system + "." + v_source_entity + "." +  RUN_ID + ".dat.gz" else "";
end
]|3|9|K|@{0|}}
{30001002|XXparameter|PUBLIC_CLEAN_DML_FILE|$[
begin
let string("") v_source_entity=string_split(SOURCE_LOWER,".")[1];
let string ("") v_source_system=SOURCE_SYSTEM; //if(is_blank(SOURCE_SYSTEM_OVERRIDE)) SOURCE_SYSTEM else SOURCE_SYSTEM_OVERRIDE ;
result :: if(DO_PUBLISH_CLEAN_FILE) PUB_DATAHUB_DML + "/raw/clean." + v_source_system + "/clean." + v_source_system + "." + v_source_entity + ".dml" else "";
end
]|3|9|K|@{0|}}
{30001002|XXparameter|EVENT_LOG_DIR|$[
PUB_DATAHUB_SERIAL + "/event_log/raw/";
]|28|9|FK|@{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$[
begin
let string ("") v_source_system=SOURCE_SYSTEM;
result :: PUB_DATAHUB_SERIAL + "/event_log/raw/event_log." + v_source_system + "." + string_split(SOURCE_LOWER, ".")[1] + ".dat";
end
]|3|9|RFK|@{0|}}
{30001002|XXparameter|APP_NM|$[begin
let int v_length=length_of(string_split(AI_DML,"/"));
result :: string_split(AI_DML,"/")[v_length -2 ] ;
end ]|3|9|FK|APP name |{0|}}
{30001002|XXparameter|___Operational_Console_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|OC_INFO|Source: SOURCE_LOWER
Start: $START_CHANGES_TIME
End: $END_CHANGES_TIME
Parallel: $DO_QUERY_IN_PARALLEL
Notes: $NOTES|3|9|RFK|Information to display in the Operational Console.|{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_NATIVE_OPTIONS|-commandTail escapeChar '\\'|3|9|RFK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:eme|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:sandbox|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:eme|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:sandbox|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|DO_HEX_CLEANUP|1|15|9|FK||{2|0|1|}}
{30001002|XXparameter|CLEANSE_CHARECTERS|@3|9|FK||{0|}}
{30001002|XXparameter|CLEANSE_XFR|$[' include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  out.(*,form=="string" && name != "newline") :1: if(not is_blank("' + CLEANSE_CHARECTERS +'")) re_replace(string_and_hex_replace(in.*),"' + CLEANSE_CHARECTERS + '", "");
  out.(*,form=="string" && name != "newline") :2: string_and_hex_replace(in.*);

  out.* :: in.*;
end;']|3|9|RFK|@{0|}}
{30001002|XXparameter|START_CHANGES_TIME:eme|""|3|9||@{0|}}
{30001002|XXparameter|START_CHANGES_TIME:sandbox|$[ if(file_information(EXTRACT_START_CHANGES_TIME_FILE).found) read_file(EXTRACT_START_CHANGES_TIME_FILE) else "" ]|3|9||@{0|}}
{30001002|XXparameter|END_CHANGES_TIME:eme|""|3|9||@{0|}}
{30001002|XXparameter|END_CHANGES_TIME:sandbox|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_SQL_ABLOCAL:eme|""|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_SQL_ABLOCAL:sandbox|$[ 
begin
let v_local_where_clause_file_location=AI_SERIAL + "/override/get." + SOURCE_LOWER + ".txt";
let string("") v_where_clause=if(file_information(v_local_where_clause_file_location).found) read_file(v_local_where_clause_file_location) else WHERE_CLAUSE ;
let string("")[int] read_sql_vec = [vector];
let decimal("")[int] indexes = [vector];
let decimal("") physical_schema_index = -1;
let string("") read_sql = "";
let string("") sel_flds = if(is_blank(SELECT_FIELDS)) " * " else SELECT_FIELDS;
let db_info_vec = SOURCE_DB_INFO_VEC;

if(QUERY_TYPE_ID member [vector "1", "2"]) read_sql = 
  "SELECT " + (if ( SELECT_HINT == "" ) "" else SELECT_HINT + "\\n       ") + SELECT_FIELDS + "\\n" +
  FROM_CLAUSE + "\\n" +
  v_where_clause +
  (if ( CLIENT_FILTER_CLAUSE == "" ) "" else "\\n   AND ( " + CLIENT_FILTER_CLAUSE + " )") +
  (if ( v_where_clause == "" && ABLOCAL_EXPR != "" ) "  WHERE ABLOCAL()" else "") +
  (if ( v_where_clause != "" && ABLOCAL_EXPR != "" ) "\\n   AND ABLOCAL()" else "");
else if(QUERY_TYPE_ID == "3") begin
  read_sql = SQL;
  for(let tbl in SOURCE_TABLE_INFO_VEC) begin
    physical_schema_index = vector_search(db_info_vec, [record logical_schema tbl.schema_name physical_schema "" dml_directory "" dbms_type "" parameter_prefix "" parameterized_dml_directory "" dbc_file "" pset_directory "" run_directory "" xfr_directory "" serial_layout "" mfs_layout "" mfs_local_layout ""], \{logical_schema\});
    read_sql = string_replace(read_sql, tbl.schema_name + "." + tbl.table_name, SOURCE_DB_INFO_VEC[physical_schema_index].physical_schema + "." + tbl.table_name); 
  end
end

result :: read_sql;

end
]|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_GEN_DELIMITED_DML:eme|$[
first_without_error(
  read_type(AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml"),
  read_type(AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml"),
  read_type(AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml"))
]|3|9||@{0|}}
{30001002|XXparameter|READ_TBL_GEN_DELIMITED_DML:sandbox|$( m_db gendml $SOURCE_DBC_FILE -field_type_preference delimited -select "$READ_TBL_SQL" )|3|9||@{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST|@3|9|FK|@{0|}}
{30001002|XXparameter|INBOUND_OBFUS_EXP_LKP_NAME|$[string_concat(AI_SERIAL_LOOKUP, "/", "obfuscation_criteria_inbound.dat")]|3|9|EFK|@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$[begin

let string("") lookup_contents = if(file_information(INBOUND_OBFUS_EXP_LKP_NAME).found) read_file(INBOUND_OBFUS_EXP_LKP_NAME) else ""; 
result :: lookup_contents;

end]|3|9|K|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|get.database|Gunit Kaur|Created 1/31/2017 9:25:17 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1238000|750000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.3.2|{2|1|1|}Job 'get.database' Execution Status Report

Job completed successfully at Friday, September 25, 2020 13:36:59
Run performed by user rjadha14
||# Make sure the multifile directories exist.
for d in "$AI_MFS/source.$SOURCE_SYSTEM" \\
         "$AI_MFS/clean.$SOURCE_SYSTEM" \\
         "$PUB_DATAHUB_MFS/raw/clean.$SOURCE_SYSTEM" \\
         "$AI_MFS_REJECT/get.$SOURCE_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done
if [[ ! -d "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL_LOG/get.db_log.start_job.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOG/get.db_log.start_job.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL/get.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL/get.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL_LOG/get.db_log.end_job.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOG/get.db_log.end_job.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL_LOG/get.db_log.delete_start_job.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOG/get.db_log.delete_start_job.$SOURCE_SYSTEM"
fi

if [[ ! -d "$AI_MFS/source.$SOURCE_SYSTEM" ]]; then
  m_mkdir  "$AI_MFS/source.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_MFS/clean.$SOURCE_SYSTEM" ]]; then
  m_mkdir  "$AI_MFS/clean.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_MFS/get.$SOURCE_SYSTEM" ]]; then
  m_mkdir  "$AI_MFS/get.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL_LOOKUP/lookup.clean.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOOKUP/lookup.clean.$SOURCE_SYSTEM"
fi
if [[ ! -d "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM" ]]; then
  mkdir -p "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM"
fi

if [[ ! -e "$UNLOAD_LOG_FILE_PATH" ]]; then
  m_mkdir  "$UNLOAD_LOG_FILE_PATH"
fi

# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$SOURCE_SYSTEM/get.$SOURCE_LOWER.summary.log $AB_REPORT"


|if [[ x"$RUN_ID" = x"0" && -f "$AI_RAW_TRACKING_FILE" ]]; then
  AB_REPORT="monitor,flows totals" m_report_tracking -phase-end "$AI_RAW_TRACKING_FILE" \|
    egrep 'Optional_Dedup.Replicate * out\|__table_.unload * out\|End_Job_Log * in\| dup\| reject\| second' 1>&2
fi


|@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@apvrd55593||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Narrow|32768|120|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Get from Multiple Databases|17000|36000|369000|36000|649000|56000|17122|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|280|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@Source DBMS: $SOURCE_DBMS_TYPE
Unload Interface: $SOURCE_UNLOAD_INTERFACE
Table Name: $SOURCE_NAME  |16000|104000|0|0|0|0|17123|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial Narrow|32768|120|1|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Global inbound data
Obfuscation|275000|190000|0|0|0|0|17164|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}17139|2065|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}17198|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}17142|19|}}
{2010243001|XXGwatcher|14|0|27|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}17120|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}17126|2065|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}17195|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}17194|2065|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}17118|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}17196|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}17215|17|}}
{2010600005|XXGgraph|22|0|43|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_obfuscation.inbound.mgi|3|2|Pf$|@{0|}}
{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST|$OBFUSCATE_FIELDS_LIST|3|9||@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$EXPRESSION_LOOKUP_CONTENTS|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@279000|250000|0|0|0|0|17199|Data Obfuscation Inbound|Anwar.Parvez|Created 4/15/2019 7:13:17 PM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010600005|XXGgraph|23|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_obfuscation.inbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
{30001002|XXparameter|!_ab_graph_interface|1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|condition.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionOutputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|implementation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|False|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|OBFUSCATE_FIELDS_LIST||3|9|FK|@{0|}}
{30001002|XXparameter|mpcmodtime|1563452196|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|24|0|47|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010202004|XXGiport|25|0|50|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|26|0|53|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010202004|XXGiport|27|0|56|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010501005|XXGpvertex|28|0|59|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@0|Reformat|57000|160500|77000|181000|135000|93000|9956|Map to Output|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|29|0|61|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|30|0|63|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9932|17|}}
{2010203004|XXGoport|31|0|65|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|32|0|67|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9933|17|}}
{2010203004|XXGoport|33|0|69|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|34|0|71|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9934|17|}}
{2010203004|XXGoport|35|0|73|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|36|0|75|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|37|0|77|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|38|0|79|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|39|0|81|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|40|0|83|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|41|0|85|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|42|0|87|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|43|0|89|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Reformat|234000|32000|244000|57000|147000|127000|7168|Bugfix Reformat clean hex values|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|44|0|91|0|{@{}@390000|114000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|45|0|93|0|{@{}@384|.5|.5|{0|}7156|17|}}
{2010203004|XXGoport|46|0|95|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|47|0|97|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|48|0|99|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|49|0|101|0|{@{}@234000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010210004|XXGflow|50|0|103|0|{@{}@384|.5|.5|{0|}7158|17|}}
{2010600005|XXGgraph|51|0|105|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|2|3|9|P|@{0|}}
}}@0|@32000|62500|0|0|0|0|7164|read db|gunit.kaur|@1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010203004|XXGoport|52|0|107|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010503005|XXGfvertex|53|0|111|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|3\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|Output File|678913|109047|1153000|234000|56000|50000|17210|Optional: Source|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|54|0|113|0|{@{}@1143000|254000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|55|0|116|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|56|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|57|0|121|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
}}@0|Output File|913913|159047|1153000|334000|56000|50000|17207|Optional: Clean|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|58|0|123|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|59|0|126|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|60|0|128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|61|0|131|0|{|{}@0|Output File|472000|414500|494000|435000|56000|50000|9951|Dups|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|62|0|133|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|63|0|135|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9940|2065|}}
{2010600005|XXGgraph|64|0|142|0|{Subgraph created from graph "load.icff"|{}@0|@307500|554250|0|0|0|0|17143|Get Count|Mukesh Singh|Created 4/12/2016 4:27:50 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1122000|306000|3|}}
{2010210004|XXGflow|65|0|144|0|{@{}@384|.5|.5|{0|}15003|17|}}
{2010210004|XXGflow|66|0|146|0|{@{}@384|.5|.5|{0|}14999|17|}}
{2010243001|XXGwatcher|67|0|148|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|68|0|150|0|{@{}@384|.5|.5|{0|}15006|17|}}
{2010210004|XXGflow|69|0|152|0|{@{}@384|.5|.5|{0|}14995|17|}}
{2010210004|XXGflow|70|0|154|0|{@{}@384|.5|.5|{0|}14997|17|}}
{2010501005|XXGpvertex|71|0|156|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|select_expr|event_type=="finish"|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|184000|107500|0|0|0|0|15008|FBE- Get finish event types|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|72|0|158|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|73|0|161|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|74|0|163|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|75|0|165|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|76|0|167|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|77|0|169|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|78|0|172|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|6|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|filter_aggregate_analysis|out=filter(select_expr); deselect=filter(select_expr); out=filter_xfr(package.select); deselect=filter_xfr(package.select);|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation6|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|deselect_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Filter by Expression|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|79|0|174|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|80|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|81|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|82|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|83|0|186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|84|0|189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|85|0|192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.database.$SOURCE_NAME.$RUN_ID.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.database.$SOURCE_NAME.\{RUN_ID\}.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML//audit/audit.get_count.dml|3|2|f$|@{0|}}
}}@0|Output File|995000|148500|0|0|0|0|15011|Get Job Log (Formatted)|Ab Initio Software|@1|10000|0||6||33025|-1|-1|}}
{2010202004|XXGiport|86|0|194|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|87|0|197|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|88|0|199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|89|0|202|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|log_group|GET_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Handle Logs|65000|460000|0|0|0|0|17205|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|90|0|204|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|91|0|207|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|92|0|209|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name identifying this Handle Logs component.|{0|}}
{30001002|XXparameter|gather_transactions|False|13|1|FKl|Add Gather Transactions between in port and implicitly connected components|{0|}}
{30001002|XXparameter|gather_transactions.condition|version 3.5.2.r7.0:|3|15|P?|@{0|}}
{30001002|XXparameter|discard_empty_computepoints|True|13|1|FKl|Specify for implicitly added Gather Transactions  value of discard_empty_computepoints parameter|{0|}}
{30001002|XXparameter|discard_empty_computepoints.condition|param gather_transactions True version 3.5.2.r7.0:|3|15|P?|@{0|}}
{30001002|XXparameter|port_analysis|log=exact(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404658|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/log-info.dml")
metadata type: log = in|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Handle Logs|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|93|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|94|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|95|0|221|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|65000|158000|0|0|0|0|15010|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|223|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|97|0|226|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|98|0|228|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|99|0|230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|100|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|101|0|240|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|out :: reformat(in) =
begin
  out.component :: if(string_index(in.component,"Map_to_ILM")) string_split(in.component,".")[0] else string_concat(string_split(in.component,".")[0],".",string_split(in.component,".")[1]);
  out.read_count::string_filter(string_split(in.event_text,"(")[0],"0123456789"); //Get read count from flow
  out.write_count:: string_filter(string_split(string_split(in.event_text,"(")[1],")")[1],"0123456789");  //get write count 
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|record
string("\\x01") component="";
decimal("\\x01") read_count=0;
decimal("\\n") write_count=0;
end|3|1|l|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|389000|117500|0|0|0|0|15012|RFMT- Get Counts all partitions|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|102|0|242|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|103|0|245|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|104|0|247|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|105|0|249|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|106|0|251|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|107|0|254|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|108|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|109|0|260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|110|0|263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|111|0|266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|112|0|269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|275|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|let int v_length=length_of(string_split($"AI_DML","/"));
let string("") v_program_nm = string_split($"AI_DML","/")[v_length -3 ];


out :: reformat(in) =
begin
  

  out.application_nm :: $"APP_NM";
  out.program_nm :: string_upcase(v_program_nm);
  out.src_file_nm :: $"SOURCE_NAME";
  out.get_file_count :: in.write_count ;
  out.get_run_date ::(datetime("YYYYMMDDHH24MISS")) (datetime("YYYY-MM-DD HH24:MI:SS")) $"START_CHANGES_TIME" ;
  out.run_date :: (date("YYYYMMDD")) (datetime("YYYY-MM-DD HH24:MI:SS")) $"START_CHANGES_TIME" ;
  out.get_run_id :: $"RUN_ID";

end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|779000|117500|0|0|0|0|15013|RFMT- Get Counts all partitions-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|277|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|115|0|280|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|116|0|282|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|117|0|284|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|118|0|286|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|289|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|120|0|291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|121|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|122|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|123|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|125|0|311|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.read_count::sum(in.read_count);
  out.write_count :: sum(in.write_count);
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|605000|119000|0|0|0|0|15014|RollUp: Count in Serial|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|126|0|313|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|127|0|316|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|128|0|318|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|129|0|320|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|130|0|322|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|131|0|325|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted or grouped.|{0|}}
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
{30001002|XXparameter|major_key.condition|param grouped-input True param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|132|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|133|0|330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|134|0|333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|135|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|136|0|339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|137|0|346|0|{@{}@0|0|0|0|in0|.3638968481375358|@@@13840|0|}}
{2010503005|XXGfvertex|138|0|350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.database.$SOURCE_NAME.$RUN_ID.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.datalake.$TARGET_NAME.\{RUN_ID\}.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/audit/audit.get_count.dml|3|2|f$|@{0|}}
}}@1|Input File|573000|681000|0|0|0|0|17204|Get Job Log (Formatted)|Ab Initio Software|@1|500|0||6||33025|-1|-1|}}
{2010203004|XXGoport|139|0|352|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|140|0|355|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|141|0|357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|142|0|361|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[DO_CLEAN && DO_PUBLISH_CLEAN_FILE]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|864000|230000|0|0|0|0|17206|Map from clean to publish clean|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|143|0|363|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|144|0|366|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|145|0|369|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|146|0|371|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|147|0|373|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|148|0|375|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|149|0|377|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|150|0|379|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|151|0|382|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|152|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|153|0|388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|154|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|155|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|156|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|157|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|158|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|159|0|407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|160|0|413|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[DO_CLEAN && DO_PUBLISH_CLEAN_FILE]|3|9||@{0|}}
{30001002|XXparameter|Layout|$PUBLIC_CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$PUBLIC_CLEAN_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUBLIC_CLEAN_DML_FILE|3|2|f$|@{0|}}
}}@0|Output File|1142913|364047|1153000|334000|56000|50000|17209|Optional: Public Clean File|Ab Initio Software|@158501|158520|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|161|0|415|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|162|0|418|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|163|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|164|0|426|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
}}@0|Output File|678913|424047|1153000|434000|56000|50000|17208|Optional: Lookup|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|165|0|428|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|166|0|431|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|167|0|433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|168|0|438|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|FIX_END_DATE|False|3|9||@{0|}}
}}@0|@565000|236500|0|0|892000|502000|17211|Prepare Output|Kimbo Mundy|Created 12/5/2013 10:59:43 PM|1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|1|}}
{2010240003|XXGlegend|169|0|440|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|170|0|442|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|171|0|444|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|172|0|446|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|173|0|448|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|174|0|450|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|175|0|452|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|176|0|454|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|177|0|458|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|178|0|461|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|179|0|463|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|180|0|466|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|181|0|468|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|769000|75000|777000|84000|54000|41000|9947|Copy Out|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|182|0|470|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|183|0|472|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|184|0|478|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|764000|200000|772000|209000|54000|41000|9949|Copy Out.|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|185|0|480|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|186|0|482|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|187|0|488|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9950|Dedup and Fix Intervals|Kimbo Mundy|Created 12/6/2013 6:52:46 PM|1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|1|}}
{2010240003|XXGlegend|188|0|490|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|189|0|492|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|190|0|494|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|191|0|496|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|192|0|498|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|193|0|500|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|194|0|502|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|195|0|504|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|196|0|506|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|197|0|508|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|198|0|510|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|199|0|512|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|200|0|514|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|201|0|516|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|202|0|518|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|203|0|520|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|204|0|522|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Dedup Sorted|98000|203000|118000|223000|124000|107000|6836|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|205|0|524|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|206|0|527|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|207|0|529|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|208|0|531|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|209|0|533|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|210|0|535|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|211|0|543|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Key|79600|93132|69000|102000|92000|41000|6838|Parition by Related or NK|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|545|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|213|0|548|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|214|0|552|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|775673|257329|784000|266000|54000|41000|6840|Replicate|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|215|0|554|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|216|0|556|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|217|0|562|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Rollup|479000|385000|499000|405000|129000|107000|6841|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|218|0|564|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|219|0|567|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|220|0|569|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|221|0|571|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|222|0|573|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|223|0|580|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Scan|477000|176000|497000|196000|139000|107000|6842|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|224|0|582|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|225|0|585|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|226|0|587|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|227|0|589|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|228|0|591|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|229|0|598|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort|328000|62062|348000|82000|106000|89000|6843|Sort for Dedup|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|230|0|600|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|231|0|603|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|232|0|609|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|131000|387000|151000|407000|135000|107000|6844|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|611|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|234|0|614|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|235|0|620|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|236|0|625|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|237|0|629|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|238|0|635|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Gather|642000|401500|652000|416000|50000|41000|9952|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|239|0|637|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|240|0|640|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|241|0|645|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|793000|351500|803000|366000|50000|41000|9954|Gather.|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|242|0|647|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|243|0|649|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|244|0|657|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Merge|646000|298500|656000|313000|50000|41000|9957|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|245|0|659|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|246|0|662|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50963|0|}}
{2010203004|XXGoport|247|0|667|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|248|0|671|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|249|0|675|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|250|0|679|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|251|0|683|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1600347986|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|252|0|685|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|253|0|687|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|254|0|689|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|255|0|691|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|256|0|693|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|257|0|695|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|258|0|697|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|259|0|699|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|260|0|701|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9934|17|}}
{2010210004|XXGflow|261|0|703|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9933|17|}}
{2010210004|XXGflow|262|0|705|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|263|0|707|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9940|2065|}}
{2010210004|XXGflow|264|0|709|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|265|0|711|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|266|0|713|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9932|17|}}
{2010210004|XXGflow|267|0|715|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|268|0|717|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
}}@0|Replicate|769000|75000|777000|84000|54000|41000|9947|Copy Out|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|269|0|719|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|270|0|721|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|271|0|724|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|272|0|726|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|273|0|729|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|274|0|732|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
}}@0|Replicate|764000|200000|772000|209000|54000|41000|9949|Copy Out.|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|275|0|734|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|276|0|736|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|277|0|739|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|278|0|741|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|279|0|744|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|280|0|747|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
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
}}@0|@310336|269500|331000|292000|884000|534000|9950|Dedup and Fix Intervals|Kimbo Mundy|Created 12/6/2013 6:52:46 PM|1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|1|}}
{2010240003|XXGlegend|281|0|749|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|282|0|751|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|283|0|753|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|284|0|755|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|285|0|757|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|286|0|759|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|287|0|761|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|288|0|763|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|289|0|765|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|290|0|767|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|291|0|769|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|292|0|771|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|293|0|773|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|294|0|775|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|295|0|777|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|296|0|779|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|297|0|781|0|{|{}@0|Dedup Sorted|98000|203000|118000|223000|124000|107000|6836|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|298|0|783|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|299|0|786|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|300|0|788|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|301|0|790|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|302|0|792|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|303|0|794|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|304|0|797|0|{|{}@0|Partition by Key|79600|93132|69000|102000|92000|41000|6838|Parition by Related or NK|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|305|0|799|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|306|0|802|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|307|0|804|0|{|{}@0|Replicate|775673|257329|784000|266000|54000|41000|6840|Replicate|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|308|0|806|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|309|0|808|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|310|0|811|0|{|{}@0|Rollup|479000|385000|499000|405000|129000|107000|6841|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|311|0|813|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|312|0|816|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|313|0|818|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|314|0|820|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|315|0|822|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|316|0|825|0|{|{}@0|Scan|477000|176000|497000|196000|139000|107000|6842|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|317|0|827|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|318|0|830|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|319|0|832|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|320|0|834|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|321|0|836|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|322|0|839|0|{|{}@0|Sort|328000|62062|348000|82000|106000|89000|6843|Sort for Dedup|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|323|0|841|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|324|0|844|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|325|0|847|0|{|{}@0|Sort within Groups|131000|387000|151000|407000|135000|107000|6844|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|326|0|849|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|327|0|852|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|328|0|855|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|329|0|860|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|330|0|864|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|331|0|868|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1600333770|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|332|0|870|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|333|0|872|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|334|0|874|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|335|0|876|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|336|0|878|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|337|0|880|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|338|0|882|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|339|0|884|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|340|0|886|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|341|0|888|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|342|0|890|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|343|0|892|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|344|0|894|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|345|0|896|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|346|0|898|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|347|0|900|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|348|0|902|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|Dedup Sorted|98000|203000|118000|223000|124000|107000|6836|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|349|0|904|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|350|0|907|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|351|0|909|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|352|0|911|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|353|0|913|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|354|0|915|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|355|0|918|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,dup,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Dedup Sorted|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|356|0|920|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|357|0|923|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|358|0|926|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|359|0|929|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|360|0|932|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|361|0|935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|362|0|938|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
}}@0|Partition by Key|79600|93132|69000|102000|92000|41000|6838|Parition by Related or NK|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|363|0|940|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|364|0|943|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|365|0|945|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
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
}}@0|Partition by Key|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|366|0|947|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|367|0|950|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|368|0|954|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
}}@0|Replicate|775673|257329|784000|266000|54000|41000|6840|Replicate|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|369|0|956|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|370|0|958|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|371|0|961|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|372|0|963|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|373|0|966|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|374|0|969|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
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
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|479000|385000|499000|405000|129000|107000|6841|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|375|0|971|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|376|0|974|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|377|0|976|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|378|0|978|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|379|0|980|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|983|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted or grouped.|{0|}}
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
{30001002|XXparameter|major_key.condition|param grouped-input True param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|381|0|985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|382|0|988|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|383|0|991|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|384|0|994|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|385|0|997|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|386|0|1000|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
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
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Scan|477000|176000|497000|196000|139000|107000|6842|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|387|0|1002|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|388|0|1005|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|389|0|1007|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|390|0|1009|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|391|0|1011|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|392|0|1014|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not ordered or grouped. In this case, SCAN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.4.16:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|12|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|event_info_t event_info "record int event_type; end"|3|2|H$|Information about the kind of event that happened|{0|}}
{30001002|XXparameter|operation7|optional out::output_for_error(error_info, in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation8|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation9|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation10|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|operation11|optional out::output_at_event(event_info)|3|2|H$|Function to allow the output of an additional record at event|{0|}}
{30001002|XXparameter|operation12|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Scan|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|393|0|1016|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|394|0|1019|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|395|0|1022|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|396|0|1025|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|397|0|1028|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|398|0|1031|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
}}@0|Sort|328000|62062|348000|82000|106000|89000|6843|Sort for Dedup|Ab Initio Software|Built-in 1.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|399|0|1033|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|400|0|1036|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|401|0|1039|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|402|0|1041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|403|0|1044|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|404|0|1047|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(EFFECTIVE_DATE_FIELD_NAME) &&
   not is_blank(END_DATE_FIELD_NAME)]|3|9||@{0|}}
}}@0|Sort within Groups|131000|387000|151000|407000|135000|107000|6844|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|405|0|1049|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|406|0|1052|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|407|0|1055|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Sort within Groups|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|408|0|1057|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|409|0|1060|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|410|0|1063|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|411|0|1066|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|412|0|1069|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|413|0|1074|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
}}@0|Output File|472000|414500|494000|435000|56000|50000|9951|Dups|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|414|0|1076|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|415|0|1079|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|416|0|1081|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|417|0|1085|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
}}@0|Gather|642000|401500|652000|416000|50000|41000|9952|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|418|0|1087|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|419|0|1090|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|420|0|1093|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|421|0|1095|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|422|0|1098|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|423|0|1101|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
}}@0|Gather|793000|351500|803000|366000|50000|41000|9954|Gather.|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|424|0|1103|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|425|0|1105|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|426|0|1109|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|427|0|1111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|428|0|1114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|429|0|1117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|log_group|GET_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|57000|160500|77000|181000|135000|93000|9956|Map to Output|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|430|0|1119|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|431|0|1122|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|432|0|1125|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|433|0|1128|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|434|0|1130|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|435|0|1132|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|436|0|1134|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|437|0|1136|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|438|0|1138|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|439|0|1140|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|440|0|1142|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|441|0|1144|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|3|1|1|Fl|Number of reformat transforms|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|transform0||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform1||8|1|FOl|Reformat transform|{0|}}
{30001002|XXparameter|transform2||8|1|FOl|Reformat transform|{0|}}
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
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|442|0|1146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|443|0|1150|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|444|0|1154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|445|0|1158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|446|0|1161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|447|0|1164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|448|0|1167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|449|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|450|0|1173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|451|0|1176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|452|0|1179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|453|0|1182|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
}}@0|Merge|646000|298500|656000|313000|50000|41000|9957|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|454|0|1184|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|455|0|1187|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50963|0|}}
{2010501005|XXGpvertex|456|0|1190|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Merge|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|457|0|1192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|458|0|1195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50963|0|}}
{2010203004|XXGoport|459|0|1198|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|460|0|1201|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|461|0|1204|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|462|0|1207|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|463|0|1210|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|let decimal("")[int] output_files_enable_vec = for(let enable in [vector $DO_SOURCE, $DO_CLEAN, $DO_LOOKUP]) : if(enable ==  1) enable;
out :: reformat(in) =
begin
  out.record_count :: in.get_file_count/(length_of(output_files_enable_vec));
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Reformat|740000|666500|0|0|0|0|17212|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|464|0|1212|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|465|0|1215|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|466|0|1217|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|467|0|1219|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|468|0|1221|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|469|0|1224|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|470|0|1226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|471|0|1230|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|472|0|1233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|473|0|1236|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|474|0|1239|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|475|0|1242|0|{|{}@1|Output File|365000|144500|0|0|0|0|13394|Output Event File|Ab Initio Software|@1|400|0||6||33025|-1|-1|}}
{2010202004|XXGiport|476|0|1244|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010210004|XXGflow|477|0|1246|0|{@{}@384|.5|.5|{0|}13387|17|}}
{2010501005|XXGpvertex|478|0|1249|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Fuse|206000|145000|0|0|0|0|13393|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|479|0|1251|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|480|0|1254|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|481|0|1256|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|482|0|1258|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|483|0|1260|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|484|0|1262|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|485|0|1264|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010210004|XXGflow|486|0|1266|0|{@{}@384|.5|.5|{0|}13389|17|}}
{2010202004|XXGiport|487|0|1268|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010600005|XXGgraph|488|0|1275|0|{Subgraph created from graph "get.db_multi"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/get.read_db.multi.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|DO_HEX_CLEANUP||3|8|=|@{0|}}
{30001002|XXparameter|SOURCE_DB_LAYOUT|$SOURCE_DB_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DB_LOCAL_LAYOUT|$SOURCE_DB_LOCAL_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|PARTITION_KEY||3|8|=|@{0|}}
{30001002|XXparameter|SORT_KEY||3|8|=|@{0|}}
{30001002|XXparameter|CLEANSE_CHARECTERS||3|8|=|@{0|}}
{30001002|XXparameter|CLEANSE_XFR|$CLEANSE_XFR|3|9||@{0|}}
}}@0|@54000|254500|0|0|966000|546000|17221|get.read db.multi|Kimbo Mundy||1|100|0||9||36865|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1042000|627000|1|}}
{2010210004|XXGflow|489|0|1277|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}7136|17|}}
{2010210004|XXGflow|490|0|1279|0|{@{}@384|.6541666388511658|.5|{0|}7153|17|}}
{2010210004|XXGflow|491|0|1281|0|{@{}@384|.5|.5|{0|}7149|20|}}
{2010210004|XXGflow|492|0|1284|0|{@{}@384|.5|.5|{0|}7144|17|}}
{2010210004|XXGflow|493|0|1287|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}7166|19|}}
{2010210004|XXGflow|494|0|1289|0|{@{}@384|.5|.5|{0|}7151|20|}}
{2010210004|XXGflow|495|0|1291|0|{@{}@384|.5|.5|{0|}7152|17|}}
{2010210004|XXGflow|496|0|1293|0|{@{}@384|.5|.5|{0|}7165|17|}}
{2010210004|XXGflow|497|0|1295|0|{@{}@384|.5|.5|{0|}7147|17|}}
{2010503005|XXGfvertex|498|0|1298|0|{|{}@0|Output File|680000|492500|872000|443000|56000|50000|7169|Get Job Log|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|499|0|1300|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|500|0|1303|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Normalize|327952|282880|683000|208000|145000|126000|7171|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|501|0|1305|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|502|0|1307|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|503|0|1309|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|504|0|1311|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|505|0|1314|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|506|0|1320|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Partition by Key|600000|190000|657000|99000|88000|41000|7172|Optional: Partition by Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|507|0|1322|0|{@{}@744000|114000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|508|0|1325|0|{@{}@647000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|509|0|1330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Sort|108000|295000|463000|225000|116000|89000|7173|Optional: Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|510|0|1332|0|{@{}@578000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|511|0|1335|0|{@{}@453000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|512|0|1340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|668000|81500|458000|98000|54000|41000|7174|Repartition Locally, if Needed|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|513|0|1342|0|{@{}@511000|114000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|514|0|1345|0|{@{}@448000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|515|0|1350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|466000|90000|0|0|0|0|7175|Replicate: input layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|516|0|1352|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|517|0|1356|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|518|0|1362|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|892000|91000|0|0|0|0|7176|Replicate: output layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|519|0|1364|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|520|0|1367|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|521|0|1374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@0|Rollup|445000|468500|675000|414000|106000|107000|7177|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|522|0|1376|0|{@{}@780000|464000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|523|0|1379|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|524|0|1381|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|525|0|1383|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|526|0|1385|0|{@{}@665000|464000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|527|0|1392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|752000|190000|0|0|0|0|7178|dummy replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|528|0|1394|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|529|0|1397|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|530|0|1404|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010600005|XXGgraph|531|0|1408|0|{Subgraph created from graph "get.db_multi"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|RUN_ID|$RUN_ID|3|9|RFK||{0|}}
{30001002|XXparameter|STEP_NAME|$STEP_NAME|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DBC_FILE|$SOURCE_DBC_FILE|3|9|RFK|Path to the source database project's database configuration (DBC) file.  Defaults to a value based on the Source Name.|{0|}}
{30001002|XXparameter|SOURCE_DBMS_TYPE|$SOURCE_DBMS_TYPE|3|9|FK|@{4|netezza|oracle|mssql|informix|}}
{30001002|XXparameter|SOURCE_DBMS_UNLOAD_INTERFACE|$SOURCE_UNLOAD_INTERFACE|15|9|FK||{0|}}
{30001002|XXparameter|UNLOAD_DB_IMPLEMENTATION|$[
if(SOURCE_DBMS_TYPE == 'netezza') PUB_DXF_COMPONENTS + "/read_db.netezza.mp" 
else if(SOURCE_DBMS_TYPE == 'oracle') PUB_DXF_COMPONENTS + "/read_db.oracle.mp" 
else if(SOURCE_DBMS_TYPE == 'mssql') PUB_DXF_COMPONENTS + "/read_db.mssql.mp" 
else if(SOURCE_DBMS_TYPE == 'informix') PUB_DXF_COMPONENTS + "/read_db.informix.mp"
else if(SOURCE_DBMS_TYPE == 'mysql') PUB_DXF_COMPONENTS + "/read_db.mysql.mp"
else if(SOURCE_DBMS_TYPE == 'odbc') PUB_DXF_COMPONENTS + "/read_db.odbc.mp"  //regulatory changes
]|3|9|RK|@{0|}}
{30001002|XXparameter|READ_SQL|$READ_TBL_SQL_ABLOCAL|3|9|RFK|The SQL to execute to read from the DB.|{0|}}
{30001002|XXparameter|SOURCE_DB_DML|$READ_TBL_GENDML|3|9|RFK|Path to the source database project's database directory.  Used to derive other source database project directories.|{0|}}
{30001002|XXparameter|OUTPUT_DML|$OUTPUT_DML|3|9|RFK|Layout with which the output file will be created|{0|}}
{30001002|XXparameter|SOURCE_DML_NO_MAXIMUM_LENGTH|$[ re_replace(SOURCE_DB_DML,', maximum_length=[0-9]*','') ]|3|9|RK||{0|}}
{30001002|XXparameter|DO_HEX_CLEANUP|0|15|9|FK|@{2|0|1|}}
{30001002|XXparameter|SOURCE_LOWER|$SOURCE_LOWER|3|9|RFK|@{0|}}
{30001002|XXparameter|VARIATION|$VARIATION|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$SOURCE_SYSTEM|3|9|RFK|The logical name of the source of the get.|{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|$SOURCE_LOGICAL_NAME|3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DB_LAYOUT||3|9|RFK|The layout to use for the Input Table component.  This may be on a remote DB gateway.  Defaults to database layout for mssql and serial layout for other dbms types.|{0|}}
{30001002|XXparameter|SOURCE_DB_LOCAL_LAYOUT||3|9|RFK|If a remote DB gateway is used, then this must be a layout on the local server(s). Defaults to $AI_MFS.|{0|}}
{30001002|XXparameter|DO_REPARTITION_LOCALLY|$[ SOURCE_DB_LAYOUT != SOURCE_DB_LOCAL_LAYOUT or
   SOURCE_DB_LAYOUT != AI_MFS
]|3|9|RK|0 or 1: Whether or not we need to repartition the DB layout for local processing.|{0|}}
{30001002|XXparameter|ABLOCAL_EXPR|$ABLOCAL_EXPR|3|9|FK|Optional: An SQL expression to use to select records for different source DB partitions, if any.|{0|}}
{30001002|XXparameter|SQL_SCRIPT|$[ re_replace(re_replace(string_replace(string_replace(READ_SQL,'  WHERE ABLOCAL()',''),'\\n   AND ABLOCAL()',''), "[\\x01- ]+", " "), " , ", ", ")  ]|3|9|RFK|The SQL used to read the source, for the process log.|{0|}}
{30001002|XXparameter|DATASET_NAME|$[ re_replace(re_replace(FROM_CLAUSE, "[\\x01- ]+", " "), "^ *FROM +", "") ]|3|9|FK|@{0|}}
{30001002|XXparameter|PARTITION_KEY||19|9|FK|Optional: \{key1; key2;...\}: The field(s) to partition on, if any.|{0|}}
{30001002|XXparameter|SORT_KEY||19|9|FK|Optional: \{key1; key2;...\}: The field(s) to sort on, if any.|{0|}}
{30001002|XXparameter|AB_PSET_NAME|$AB_PSET_NAME|3|9|RFK||{0|}}
{30001002|XXparameter|NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.get_database.default.xfr|8|9|RFKfj|Required and optional DML functions|{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_NATIVE_OPTIONS|-commandTail escapeChar '\\'|3|9|RFK|@{0|}}
{30001002|XXparameter|CLEANSE_CHARECTERS||3|9|FK|@{0|}}
{30001002|XXparameter|CLEANSE_XFR|$[' include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  out.(*,form=="string" && name != "newline") :1: if(not is_blank(' + CLEANSE_CHARECTERS +')) re_replace(string_and_hex_replace(in.*),' + CLEANSE_CHARECTERS + ', "");
  out.(*,form=="string" && name != "newline") :2: string_and_hex_replace(in.*);

  out.* :: in.*;
end;']|3|9|F|XFR applied for standard Cleansing process|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1659451949|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@15000|110488|0|0|966000|546000|0|get.db_multi.read_iseries_db|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1042000|601000|3|}}
{2010210004|XXGflow|532|0|1410|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}7136|17|}}
{2010210004|XXGflow|533|0|1412|0|{@{}@384|.6541666388511658|.5|{0|}7153|17|}}
{2010210004|XXGflow|534|0|1414|0|{@{}@384|.5|.5|{0|}7149|20|}}
{2010210004|XXGflow|535|0|1416|0|{@{}@384|.5|.5|{0|}7158|17|}}
{2010210004|XXGflow|536|0|1418|0|{@{}@384|.5|.5|{0|}7144|17|}}
{2010210004|XXGflow|537|0|1420|0|{@{}@384|.5|.5|{0|}7156|17|}}
{2010210004|XXGflow|538|0|1422|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}7166|19|}}
{2010210004|XXGflow|539|0|1424|0|{@{}@384|.5|.5|{0|}7151|20|}}
{2010210004|XXGflow|540|0|1426|0|{@{}@384|.5|.5|{0|}7152|17|}}
{2010210004|XXGflow|541|0|1428|0|{@{}@384|.5|.5|{0|}7165|17|}}
{2010210004|XXGflow|542|0|1430|0|{@{}@384|.5|.5|{0|}7147|17|}}
{2010501005|XXGpvertex|543|0|1432|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform0|$CLEANSE_XFR|3|9||@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_DML|3|9||@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|234000|32000|244000|57000|147000|127000|7168|Bugfix Reformat clean hex values|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|544|0|1434|0|{@{}@390000|114000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|545|0|1437|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|546|0|1439|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|547|0|1441|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|548|0|1443|0|{@{}@234000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|549|0|1446|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|550|0|1448|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|551|0|1452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|552|0|1455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|553|0|1458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|554|0|1461|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|555|0|1465|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.$SOURCE_NAME.$RUN_ID.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.$SOURCE_NAME.$RUN_ID.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|Output File|680000|492500|872000|443000|56000|50000|7169|Get Job Log|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|556|0|1467|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|557|0|1470|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|558|0|1472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|559|0|1475|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform||3|8|=j|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|327952|282880|683000|208000|145000|126000|7171|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|560|0|1477|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|561|0|1479|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|562|0|1481|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|563|0|1483|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|564|0|1486|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|565|0|1489|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Normalize|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|566|0|1491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|567|0|1494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|568|0|1497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|569|0|1500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|570|0|1503|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|571|0|1507|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[DO_REPARTITION_LOCALLY && PARTITION_KEY != ""]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|Partition by Key|600000|190000|657000|99000|88000|41000|7172|Optional: Partition by Key|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|572|0|1509|0|{@{}@744000|114000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|573|0|1512|0|{@{}@647000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|574|0|1515|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field to partition on|{0|}}
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
}}@0|Partition by Key|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|575|0|1517|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|576|0|1520|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|577|0|1523|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
}}@0|Replicate|466000|90000|0|0|0|0|7175|Replicate: input layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|578|0|1525|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|579|0|1529|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|580|0|1532|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|581|0|1534|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|582|0|1537|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|583|0|1541|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ SORT_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
}}@0|Sort|108000|295000|463000|225000|116000|89000|7173|Optional: Sort|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|584|0|1543|0|{@{}@578000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|585|0|1546|0|{@{}@453000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|586|0|1549|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|587|0|1551|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|588|0|1554|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|589|0|1558|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[DO_REPARTITION_LOCALLY && PARTITION_KEY == ""]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|Partition by Round-robin|668000|81500|458000|98000|54000|41000|7174|Repartition Locally, if Needed|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|590|0|1560|0|{@{}@511000|114000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|591|0|1563|0|{@{}@448000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|592|0|1566|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|593|0|1568|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|594|0|1571|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|595|0|1576|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
}}@0|Replicate|892000|91000|0|0|0|0|7176|Replicate: output layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|596|0|1578|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|597|0|1581|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|598|0|1585|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|599|0|1587|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|600|0|1590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|601|0|1593|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";


let long task_start_time = now();
let long task_end_time = 0;


/* Only roll up job logs. */
out :: input_select(in) =
begin
  out :: starts_with(in.event_type, "DXF Job Log: ");
end;


/* Roll up all the job log entries for a given dataset. */
out :: rollup(in) =
begin
  let dxf_job_event_text_t job_info = reinterpret(in.event_text);
  let start_time = min(job_info.dataset_start_dttm);
  let min_end_time = min(job_info.dataset_end_dttm);
  let max_end_time = max(job_info.dataset_end_dttm);
  if ( task_end_time == 0 )
    task_end_time = now();  // This works because we are in an unsorted rollup, so we only see records after the last one arrives.

  out.* :: job_info.*;
  out.dxf_src_dataset_id :: max(job_info.dxf_src_dataset_id);  // Use the value from partition 0.
  out.run_id :: $"RUN_ID";
  out.task_name :: $"AB_PSET_NAME";
  out.task_start_dttm :: task_start_time;
  out.task_end_dttm :: task_end_time;
  out.dataset_name :: $"DATASET_NAME";
  out.dxf_src_rec_cnt :: max(job_info.dxf_src_rec_cnt);
  out.type_of_input :: 'table'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_size :: NULL;
  out.file_modified_dttm :: NULL;
  out.sql_script :: $"SQL_SCRIPT";
end;|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|doc_transform|out,reject,error,log :: document(in) =
begin
  let dmf_job_event_text_t job_info = parse(in.event_text);
  let start_time = min(job_info.dataset_start_dttm);
  let min_end_time = min(job_info.dataset_end_dttm);
  let max_end_time = max(job_info.dataset_end_dttm);
  if ( task_end_time == 0 )
    task_end_time = now();  // This works because we are in an unsorted rollup, so we only see records after the last one arrives.

  out.* :: job_info.*;
  out.dmf_src_dataset_id :: max(job_info.dmf_src_dataset_id);  // Use the value from partition 0.
  out.run_id :: $"RUN_ID";
  out.task_name :: $"AB_PSET_NAME";
  out.task_start_dttm :: task_start_time;
  out.task_end_dttm :: task_end_time;
  out.dataset_name :: $"DATASET_NAME";
  out.dmf_src_rec_cnt :: max(job_info.dmf_src_rec_cnt);
  out.type_of_input :: 'table'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_size :: NULL;
  out.file_modified_dttm :: NULL;
  out.sql_script :: $"SQL_SCRIPT";
end;|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|445000|468500|675000|414000|106000|107000|7177|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|602|0|1595|0|{@{}@780000|464000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|603|0|1598|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|604|0|1600|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|605|0|1602|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|606|0|1604|0|{@{}@665000|464000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|607|0|1607|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/transform|3|2|H$||{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted or grouped.|{0|}}
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
{30001002|XXparameter|major_key.condition|param grouped-input True param sorted-input False version 2.14.102:|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|13|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation13|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|6|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|608|0|1609|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|609|0|1612|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|610|0|1615|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|611|0|1618|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|612|0|1621|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|613|0|1624|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[DO_REPARTITION_LOCALLY && PARTITION_KEY != ""]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|Replicate|752000|190000|0|0|0|0|7178|dummy replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|614|0|1626|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|615|0|1629|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|616|0|1632|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|617|0|1634|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|618|0|1637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|619|0|1640|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/read_db.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|implementation|$UNLOAD_DB_IMPLEMENTATION|3|9|f|@{0|}}
{30001002|XXparameter|STEP_NAME|$STEP_NAME|3|9||@{0|}}
{30001002|XXparameter|SOURCE_LOWER|$SOURCE_LOWER|3|9||@{0|}}
{30001002|XXparameter|VARIATION|$VARIATION|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_LAYOUT|$SOURCE_DB_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DATA_LOCAL_LAYOUT|$SOURCE_DB_LOCAL_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DBMS|$SOURCE_DBMS_TYPE|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DBMS_UNLOAD_INTERFACE||3|8|=|@{0|}}
{30001002|XXparameter|SOURCE_DATA_DBC_FILE|$SOURCE_DBC_FILE|3|9||@{0|}}
{30001002|XXparameter|READ_DB_SQL|$SQL_SCRIPT|3|9||@{0|}}
{30001002|XXparameter|READ_DB_DML|$SOURCE_DML_NO_MAXIMUM_LENGTH|3|9||@{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_NATIVE_OPTIONS|$SOURCE_DATA_DB_NATIVE_OPTIONS|3|9||@{0|}}
}}@0|@32000|62500|0|0|0|0|7164|read db|gunit.kaur|@1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|1|}}
{2010600005|XXGgraph|620|0|1642|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation||44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
{30001002|XXparameter|!_ab_graph_interface|1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|8|1|1|Hnl|@{0|}}
{30001002|XXparameter|condition.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|condition_interpretation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|conditionOutputPort.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|implementation.group|dsg.base|3|9|P|@{0|}}
{30001002|XXparameter|error_group|@3|9|F|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group|@3|9|F|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|_ab_graph_is_handler|False|13|1|Hl|Optional graph_is_handler.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP_NAME||3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_LOWER||3|9|RFK|@{0|}}
{30001002|XXparameter|VARIATION||3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_LAYOUT||3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DATA_LOCAL_LAYOUT||3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DBMS||3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DBMS_UNLOAD_INTERFACE||15|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_DATA_DBC_FILE||3|9|RFK|@{0|}}
{30001002|XXparameter|READ_DB_SQL||3|9|RFK|@{0|}}
{30001002|XXparameter|READ_DB_DML||3|9|RFK|@{0|}}
{30001002|XXparameter|SOURCE_DATA_DB_NATIVE_OPTIONS||3|9|FK|@{0|}}
{30001002|XXparameter|Layout|$SOURCE_DATA_LOCAL_LAYOUT|9|9|RF||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|outward|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata|$READ_DB_DML|7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1466681595|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface||@1|100|-1||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|621|0|1644|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|outward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|622|0|1647|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|623|0|1651|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010600005|XXGgraph|624|0|1658|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/write_raw_event_log.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[DO_PUBLISH_CLEAN_FILE == 1]|3|9||@{0|}}
{30001002|XXparameter|RAW_FILE|$PUBLIC_CLEAN_FILE_URL|3|9||@{0|}}
{30001002|XXparameter|DATA_START_DATE|$[(datetime("YYYYMMDDHH24MISS"))(datetime("YYYY-MM-DD HH24:MI:SS"))START_CHANGES_TIME]|3|9||@{0|}}
{30001002|XXparameter|DATA_END_DATE|$[(datetime("YYYYMMDDHH24MISS"))(datetime("YYYY-MM-DD HH24:MI:SS"))END_CHANGES_TIME]|3|9||@{0|}}
{30001002|XXparameter|SQL|$READ_TBL_SQL|3|9||@{0|}}
}}@0|@865000|505000|0|0|0|0|17214|write raw event log|gkaur109|@1|100|0|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|537000|317000|5|}}
{2010501005|XXGpvertex|625|0|1662|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Create Data|57000|137500|0|0|0|0|13391|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|626|0|1664|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|627|0|1667|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|628|0|1669|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|629|0|1675|0|{@{}@0|0|0|0|in0|.14152700186219738|@@@13328|0|}}
{2010600005|XXGgraph|630|0|1679|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|EVENT_CHANNEL_ID|1|3|9|FK|@{0|}}
{30001002|XXparameter|RAW_FILE|$CLEAN_FILE_URL|3|9|RFK||{0|}}
{30001002|XXparameter|SOURCE_NAME|$SOURCE_LOWER|3|9|RFK||{0|}}
{30001002|XXparameter|DATA_START_DATE|$START_CHANGES_TIME|3|9|RFK|@{0|}}
{30001002|XXparameter|DATA_END_DATE|$END_CHANGES_TIME|3|9|RFK|@{0|}}
{30001002|XXparameter|SQL|@3|9|FK|@{0|}}
{30001002|XXparameter|FILE_LIST|@3|9|FK|@{0|}}
{30001002|XXparameter|EVENT_LOG_FILE|$EVENT_LOG_FILE|3|9|RFK||{0|}}
{30001002|XXparameter|ETL_APP_ID|$(whoami)|3|9|RFK||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1600349532|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|write_raw_event_log||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|537000|317000|7|}}
{2010210004|XXGflow|631|0|1681|0|{@{}@384|.5|.5|{0|}13387|17|}}
{2010210004|XXGflow|632|0|1683|0|{@{}@384|.5|.5|{0|}13389|17|}}
{2010501005|XXGpvertex|633|0|1685|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|let datetime("YYYYMMDDHH24MISS") curent_datetime=(datetime("YYYYMMDDHH24MISS")) now();
out::create(index) = begin
  out.channel_id :: $EVENT_CHANNEL_ID;
  out.entity_name :: $"SOURCE_NAME";
  out.watermark :: (datetime("YYYYMMDDHH24MISS")) curent_datetime;
  out.raw_file :: $"RAW_FILE";
  out.record_count :: 0;
  out.start_dttm :: (datetime("YYYYMMDDHH24MISS")) $"DATA_START_DATE";
  out.end_dttm :: (datetime("YYYYMMDDHH24MISS")) $"DATA_END_DATE";
  out.sql :: $"SQL";
  out.file_list :: $"FILE_LIST";
  out.user_id :: $"ETL_APP_ID";
  out.run_id :: $"RUN_ID";
end;|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Create Data|57000|137500|0|0|0|0|13391|Event Log Entry|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|634|0|1687|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|635|0|1690|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|636|0|1692|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|637|0|1694|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|start_index|1|1|2|F$|Value to pass as index on first call to create()|{0|}}
{30001002|XXparameter|start_index.display_name|start-index|3|9|P|@{0|}}
{30001002|XXparameter|start_index.condition|version 3.3.4.r13.0:|3|15|P?|@{0|}}
{30001002|XXparameter|start_index_non_default|value start-index 1 False default constant True|13|13|Rv|Automatically set to True if start-index != 1|{0|}}
{30001002|XXparameter|start_index_non_default.display_name|start-index-non-default|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl|sameas start-index default dollar_substitution 1|1|13|Kv|Passed for use as index on first call to create() only if not defaulted|{0|}}
{30001002|XXparameter|start_index_impl.display_name|start-index-impl|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl.keyword|start-index-impl|3|9|P|@{0|}}
{30001002|XXparameter|start_index_impl.condition|param start-index-non-default True|3|15|P?|@{0|}}
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
{30001002|XXparameter|operation1|out::create(long index)|3|2|H$|Function taking integer index counting 1,2,3,4... to produce records on the output.|{0|}}
{30001002|XXparameter|continuous_analysis|continuous ? subscriber :|3|2|H$||{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, unsigned integer(8) in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|638|0|1696|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|639|0|1699|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|640|0|1702|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|641|0|1705|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Fuse.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|out::fuse(in0,in1)=
begin
  out.record_count :: in1.record_count;
  out.* :: in0.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in1_metadata|record
  decimal("\\x01", maximum_length=10)  record_count = 0;
end|3|1|l|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Fuse|206000|145000|0|0|0|0|13393|Fuse|Ab Initio Software|Built-in 2.10:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|642|0|1707|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|643|0|1710|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|644|0|1712|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|645|0|1714|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|646|0|1716|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|647|0|1718|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|648|0|1720|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|649|0|1723|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010501005|XXGpvertex|650|0|1725|0|{Applies a transform to the corresponding records from each input flow. The transform is first applied to the first record on each flow, then to the second, and so on. The result of the transform is sent out of the out port.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|fuse-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|7|1|2|H$|Number of operations in package|{0|}}
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
{30001002|XXparameter|operation7|optional ::on_startup(long in_recovery)|3|2|H$|Function executed at graph startup|{0|}}
{30001002|XXparameter|num_callbacks|5|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Fuse|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|651|0|1727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|652|0|1730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|653|0|1733|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|654|0|1736|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|655|0|1739|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|656|0|1742|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|657|0|1745|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1936|0|}}
{2010202004|XXGiport|658|0|1748|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1936|0|}}
{2010503005|XXGfvertex|659|0|1752|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$EVENT_LOG_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$EVENT_LOG_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|include "~$PUB_DXF_DML/event/event.dml";
metadata type = raw_event_type;|3|3|c|@{0|}}
}}@1|Output File|365000|144500|0|0|0|0|13394|Output Event File|Ab Initio Software|@1|400|0||6||33025|-1|-1|}}
{2010202004|XXGiport|660|0|1754|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|661|0|1757|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|662|0|1759|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|663|0|1762|0|{@{}@0|0|0|0|in0|.14152700186219738|@@@13328|0|}}
{2010110002|XXGconstant|664|0|1765|0|{@{}@{1|5197599|}}}
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
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_2|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_25|}1|13|}
{2010244001|XXGflow_watcher_watcher|13|0|26|0|{}13|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_26|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_28|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_3|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_4|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_5|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_6|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_7|}1|21|}
{2010601001|XXGgraph_vertex_vertex|21|0|42|0|{Data_Obfuscation_Inbound|}1|22|}
{2010401001|XXGvertex_prototype_vertex|22|0|44|0|{}22|23|}
{2010212001|XXGvertex_oport_oport|23|0|46|0|{0|out0|}23|24|}
{2010006001|XXGobject_psameas_object|24|0|48|0|{metadata|out0_metadata|1|0|}24|23|}
{2010211001|XXGvertex_iport_iport|25|0|49|0|{0|in0|}23|25|}
{2010006001|XXGobject_psameas_object|26|0|51|0|{metadata|in0_metadata|1|0|}25|23|}
{2010212001|XXGvertex_oport_oport|27|0|52|0|{0|out0|}22|26|}
{2010213001|XXGoport_dst_flow|28|0|54|0|{0|}26|12|}
{2010211001|XXGvertex_iport_iport|29|0|55|0|{0|in0|}22|27|}
{2010214001|XXGiport_src_flow|30|0|57|0|{0|}27|21|}
{2010006001|XXGobject_psameas_object|31|0|58|0|{Layout|Layout|0|0|}22|28|}
{2010212001|XXGvertex_oport_oport|32|0|60|0|{0|source|}28|29|}
{2010213001|XXGoport_dst_flow|33|0|62|0|{0|}29|30|}
{2010212001|XXGvertex_oport_oport|34|0|64|0|{1|clean|}28|31|}
{2010213001|XXGoport_dst_flow|35|0|66|0|{0|}31|32|}
{2010212001|XXGvertex_oport_oport|36|0|68|0|{2|lkp|}28|33|}
{2010213001|XXGoport_dst_flow|37|0|70|0|{0|}33|34|}
{2010212001|XXGvertex_oport_oport|38|0|72|0|{3|reject0|}28|35|}
{2010212001|XXGvertex_oport_oport|39|0|74|0|{4|reject1|}28|36|}
{2010212001|XXGvertex_oport_oport|40|0|76|0|{5|reject2|}28|37|}
{2010212001|XXGvertex_oport_oport|41|0|78|0|{6|error0|}28|38|}
{2010212001|XXGvertex_oport_oport|42|0|80|0|{7|error1|}28|39|}
{2010212001|XXGvertex_oport_oport|43|0|82|0|{8|error2|}28|40|}
{2010212001|XXGvertex_oport_oport|44|0|84|0|{9|log|}28|41|}
{2010211001|XXGvertex_iport_iport|45|0|86|0|{0|in|}28|42|}
{2010006001|XXGobject_psameas_object|46|0|88|0|{in_metadata|out0_metadata|0|0|}28|43|}
{2010212001|XXGvertex_oport_oport|47|0|90|0|{0|out0|}43|44|}
{2010213001|XXGoport_dst_flow|48|0|92|0|{0|}44|45|}
{2010212001|XXGvertex_oport_oport|49|0|94|0|{1|reject0|}43|46|}
{2010212001|XXGvertex_oport_oport|50|0|96|0|{2|error0|}43|47|}
{2010212001|XXGvertex_oport_oport|51|0|98|0|{3|log|}43|48|}
{2010211001|XXGvertex_iport_iport|52|0|100|0|{0|in|}43|49|}
{2010214001|XXGiport_src_flow|53|0|102|0|{0|}49|50|}
{2010006001|XXGobject_psameas_object|54|0|104|0|{Layout|Layout|0|0|}43|51|}
{2010212001|XXGvertex_oport_oport|55|0|106|0|{0|out0|}51|52|}
{2010213001|XXGoport_dst_flow|56|0|108|0|{0|}52|50|}
{2010006001|XXGobject_psameas_object|57|0|109|0|{in_metadata|out0_metadata|0|0|}43|51|}
{2010006001|XXGobject_psameas_object|58|0|110|0|{out0_metadata|write_metadata|0|0|}28|53|}
{2010211001|XXGvertex_iport_iport|59|0|112|0|{0|write|}53|54|}
{2010214001|XXGiport_src_flow|60|0|114|0|{0|}54|18|}
{2010007001|XXGobject_proto_object|61|0|115|0|{}53|55|}
{2010211001|XXGvertex_iport_iport|62|0|117|0|{0|write|}55|56|}
{2010006001|XXGobject_psameas_object|63|0|119|0|{metadata|write_metadata|1|0|}56|55|}
{2010006001|XXGobject_psameas_object|64|0|120|0|{out1_metadata|write_metadata|0|0|}28|57|}
{2010211001|XXGvertex_iport_iport|65|0|122|0|{0|write|}57|58|}
{2010214001|XXGiport_src_flow|66|0|124|0|{0|}58|11|}
{2010007001|XXGobject_proto_object|67|0|125|0|{}57|59|}
{2010211001|XXGvertex_iport_iport|68|0|127|0|{0|write|}59|60|}
{2010006001|XXGobject_psameas_object|69|0|129|0|{metadata|write_metadata|1|0|}60|59|}
{2010006001|XXGobject_psameas_object|70|0|130|0|{out2_metadata|write_metadata|0|0|}28|61|}
{2010211001|XXGvertex_iport_iport|71|0|132|0|{0|write|}61|62|}
{2010214001|XXGiport_src_flow|72|0|134|0|{0|}62|63|}
{2010006001|XXGobject_psameas_object|73|0|136|0|{reject0_metadata|out0_metadata|0|0|}28|43|}
{2010006001|XXGobject_psameas_object|74|0|137|0|{reject1_metadata|out0_metadata|0|0|}28|43|}
{2010006001|XXGobject_psameas_object|75|0|138|0|{reject2_metadata|out0_metadata|0|0|}28|43|}
{2010006001|XXGobject_psameas_object|76|0|139|0|{in0_metadata|out0_metadata|0|0|}22|43|}
{2010006001|XXGobject_psameas_object|77|0|140|0|{out0_metadata|out0_metadata|0|0|}22|43|}
{2010601001|XXGgraph_vertex_vertex|78|0|141|0|{Get_Count|}1|64|}
{2010604001|XXGgraph_flow_flow|79|0|143|0|{Flow_1|}64|65|}
{2010604001|XXGgraph_flow_flow|80|0|145|0|{Flow_2|}64|66|}
{2010244001|XXGflow_watcher_watcher|81|0|147|0|{}66|67|}
{2010604001|XXGgraph_flow_flow|82|0|149|0|{Flow_3|}64|68|}
{2010604001|XXGgraph_flow_flow|83|0|151|0|{Flow_4|}64|69|}
{2010604001|XXGgraph_flow_flow|84|0|153|0|{Flow_5|}64|70|}
{2010601001|XXGgraph_vertex_vertex|85|0|155|0|{FBE_Get_finish_event_types|}64|71|}
{2010212001|XXGvertex_oport_oport|86|0|157|0|{0|out|}71|72|}
{2010213001|XXGoport_dst_flow|87|0|159|0|{0|}72|70|}
{2010212001|XXGvertex_oport_oport|88|0|160|0|{1|deselect|}71|73|}
{2010212001|XXGvertex_oport_oport|89|0|162|0|{2|reject|}71|74|}
{2010212001|XXGvertex_oport_oport|90|0|164|0|{3|error|}71|75|}
{2010212001|XXGvertex_oport_oport|91|0|166|0|{4|log|}71|76|}
{2010211001|XXGvertex_iport_iport|92|0|168|0|{0|in|}71|77|}
{2010214001|XXGiport_src_flow|93|0|170|0|{0|}77|69|}
{2010007001|XXGobject_proto_object|94|0|171|0|{}71|78|}
{2010212001|XXGvertex_oport_oport|95|0|173|0|{0|out|}78|79|}
{2010006001|XXGobject_psameas_object|96|0|175|0|{metadata|out_metadata|1|0|}79|78|}
{2010212001|XXGvertex_oport_oport|97|0|176|0|{1|deselect|}78|80|}
{2010006001|XXGobject_psameas_object|98|0|178|0|{metadata|deselect_metadata|1|0|}80|78|}
{2010212001|XXGvertex_oport_oport|99|0|179|0|{2|reject|}78|81|}
{2010006001|XXGobject_psameas_object|100|0|181|0|{metadata|reject_metadata|1|0|}81|78|}
{2010212001|XXGvertex_oport_oport|101|0|182|0|{3|error|}78|82|}
{2010006001|XXGobject_psameas_object|102|0|184|0|{metadata|error_metadata|1|0|}82|78|}
{2010212001|XXGvertex_oport_oport|103|0|185|0|{4|log|}78|83|}
{2010006001|XXGobject_psameas_object|104|0|187|0|{metadata|log_metadata|1|0|}83|78|}
{2010211001|XXGvertex_iport_iport|105|0|188|0|{0|in|}78|84|}
{2010006001|XXGobject_psameas_object|106|0|190|0|{metadata|in_metadata|1|0|}84|78|}
{2010006001|XXGobject_psameas_object|107|0|191|0|{Layout|Layout|0|0|}71|85|}
{2010211001|XXGvertex_iport_iport|108|0|193|0|{0|write|}85|86|}
{2010214001|XXGiport_src_flow|109|0|195|0|{0|}86|68|}
{2010007001|XXGobject_proto_object|110|0|196|0|{}85|87|}
{2010211001|XXGvertex_iport_iport|111|0|198|0|{0|write|}87|88|}
{2010006001|XXGobject_psameas_object|112|0|200|0|{metadata|write_metadata|1|0|}88|87|}
{2010006001|XXGobject_psameas_object|113|0|201|0|{deselect_metadata|in_metadata|0|0|}71|89|}
{2010212001|XXGvertex_oport_oport|114|0|203|0|{0|log|}89|90|}
{2010213001|XXGoport_dst_flow|115|0|205|0|{0|}90|13|}
{2010211001|XXGvertex_iport_iport|116|0|206|0|{0|in|}89|91|}
{2010007001|XXGobject_proto_object|117|0|208|0|{}89|92|}
{2010212001|XXGvertex_oport_oport|118|0|210|0|{0|log|}92|93|}
{2010006001|XXGobject_psameas_object|119|0|212|0|{metadata|log_metadata|1|0|}93|92|}
{2010211001|XXGvertex_iport_iport|120|0|213|0|{0|in|}92|94|}
{2010006001|XXGobject_psameas_object|121|0|215|0|{metadata|in_metadata|1|0|}94|92|}
{2010006001|XXGobject_psameas_object|122|0|216|0|{log_metadata|in_metadata|0|0|}89|89|}
{2010006001|XXGobject_psameas_object|123|0|217|0|{in_metadata|in_metadata|0|0|}71|89|}
{2010006001|XXGobject_psameas_object|124|0|218|0|{out_metadata|in_metadata|0|0|}71|89|}
{2010006001|XXGobject_psameas_object|125|0|219|0|{reject_metadata|in_metadata|0|0|}71|89|}
{2010601001|XXGgraph_vertex_vertex|126|0|220|0|{Gather_1|}64|95|}
{2010212001|XXGvertex_oport_oport|127|0|222|0|{0|out|}95|96|}
{2010213001|XXGoport_dst_flow|128|0|224|0|{0|}96|69|}
{2010211001|XXGvertex_iport_iport|129|0|225|0|{0|in|}95|97|}
{2010007001|XXGobject_proto_object|130|0|227|0|{}95|98|}
{2010212001|XXGvertex_oport_oport|131|0|229|0|{0|out|}98|99|}
{2010006001|XXGobject_psameas_object|132|0|231|0|{metadata|out_metadata|1|0|}99|98|}
{2010211001|XXGvertex_iport_iport|133|0|232|0|{0|in|}98|100|}
{2010006001|XXGobject_psameas_object|134|0|234|0|{metadata|in_metadata|1|0|}100|98|}
{2010006001|XXGobject_psameas_object|135|0|235|0|{Layout|Layout|0|0|}95|85|}
{2010006001|XXGobject_psameas_object|136|0|236|0|{in_metadata|in_metadata|0|0|}95|89|}
{2010006001|XXGobject_psameas_object|137|0|237|0|{out_metadata|in_metadata|0|0|}95|89|}
{2010601001|XXGgraph_vertex_vertex|138|0|238|0|{Get_Job_Log_Formatted_|}64|85|}
{2010601001|XXGgraph_vertex_vertex|139|0|239|0|{RFMT_Get_Counts_all_partitions|}64|101|}
{2010212001|XXGvertex_oport_oport|140|0|241|0|{0|out0|}101|102|}
{2010213001|XXGoport_dst_flow|141|0|243|0|{0|}102|66|}
{2010212001|XXGvertex_oport_oport|142|0|244|0|{1|reject0|}101|103|}
{2010212001|XXGvertex_oport_oport|143|0|246|0|{2|error0|}101|104|}
{2010212001|XXGvertex_oport_oport|144|0|248|0|{3|log|}101|105|}
{2010211001|XXGvertex_iport_iport|145|0|250|0|{0|in|}101|106|}
{2010214001|XXGiport_src_flow|146|0|252|0|{0|}106|70|}
{2010007001|XXGobject_proto_object|147|0|253|0|{}101|107|}
{2010212001|XXGvertex_oport_oport|148|0|255|0|{0|out0|}107|108|}
{2010006001|XXGobject_psameas_object|149|0|257|0|{metadata|out0_metadata|1|0|}108|107|}
{2010006001|XXGobject_psameas_object|150|0|258|0|{transform0|transform0|1|0|}108|107|}
{2010212001|XXGvertex_oport_oport|151|0|259|0|{1|reject0|}107|109|}
{2010006001|XXGobject_psameas_object|152|0|261|0|{metadata|reject0_metadata|1|0|}109|107|}
{2010212001|XXGvertex_oport_oport|153|0|262|0|{2|error0|}107|110|}
{2010006001|XXGobject_psameas_object|154|0|264|0|{metadata|error0_metadata|1|0|}110|107|}
{2010212001|XXGvertex_oport_oport|155|0|265|0|{3|log|}107|111|}
{2010006001|XXGobject_psameas_object|156|0|267|0|{metadata|log_metadata|1|0|}111|107|}
{2010211001|XXGvertex_iport_iport|157|0|268|0|{0|in|}107|112|}
{2010006001|XXGobject_psameas_object|158|0|270|0|{metadata|in_metadata|1|0|}112|107|}
{2010006001|XXGobject_psameas_object|159|0|271|0|{Layout|Layout|0|0|}101|85|}
{2010006001|XXGobject_psameas_object|160|0|272|0|{in_metadata|in_metadata|0|0|}101|89|}
{2010006001|XXGobject_psameas_object|161|0|273|0|{reject0_metadata|in_metadata|0|0|}101|89|}
{2010601001|XXGgraph_vertex_vertex|162|0|274|0|{RFMT_Get_Counts_all_partitions_1|}64|113|}
{2010212001|XXGvertex_oport_oport|163|0|276|0|{0|out0|}113|114|}
{2010213001|XXGoport_dst_flow|164|0|278|0|{0|}114|68|}
{2010212001|XXGvertex_oport_oport|165|0|279|0|{1|reject0|}113|115|}
{2010212001|XXGvertex_oport_oport|166|0|281|0|{2|error0|}113|116|}
{2010212001|XXGvertex_oport_oport|167|0|283|0|{3|log|}113|117|}
{2010211001|XXGvertex_iport_iport|168|0|285|0|{0|in|}113|118|}
{2010214001|XXGiport_src_flow|169|0|287|0|{0|}118|65|}
{2010007001|XXGobject_proto_object|170|0|288|0|{}113|119|}
{2010212001|XXGvertex_oport_oport|171|0|290|0|{0|out0|}119|120|}
{2010006001|XXGobject_psameas_object|172|0|292|0|{metadata|out0_metadata|1|0|}120|119|}
{2010006001|XXGobject_psameas_object|173|0|293|0|{transform0|transform0|1|0|}120|119|}
{2010212001|XXGvertex_oport_oport|174|0|294|0|{1|reject0|}119|121|}
{2010006001|XXGobject_psameas_object|175|0|296|0|{metadata|reject0_metadata|1|0|}121|119|}
{2010212001|XXGvertex_oport_oport|176|0|297|0|{2|error0|}119|122|}
{2010006001|XXGobject_psameas_object|177|0|299|0|{metadata|error0_metadata|1|0|}122|119|}
{2010212001|XXGvertex_oport_oport|178|0|300|0|{3|log|}119|123|}
{2010006001|XXGobject_psameas_object|179|0|302|0|{metadata|log_metadata|1|0|}123|119|}
{2010211001|XXGvertex_iport_iport|180|0|303|0|{0|in|}119|124|}
{2010006001|XXGobject_psameas_object|181|0|305|0|{metadata|in_metadata|1|0|}124|119|}
{2010006001|XXGobject_psameas_object|182|0|306|0|{Layout|Layout|0|0|}113|85|}
{2010006001|XXGobject_psameas_object|183|0|307|0|{in_metadata|out0_metadata|0|0|}113|101|}
{2010006001|XXGobject_psameas_object|184|0|308|0|{out0_metadata|write_metadata|0|0|}113|85|}
{2010006001|XXGobject_psameas_object|185|0|309|0|{reject0_metadata|out0_metadata|0|0|}113|101|}
{2010601001|XXGgraph_vertex_vertex|186|0|310|0|{RollUp_Count_in_Serial|}64|125|}
{2010212001|XXGvertex_oport_oport|187|0|312|0|{0|out|}125|126|}
{2010213001|XXGoport_dst_flow|188|0|314|0|{0|}126|65|}
{2010212001|XXGvertex_oport_oport|189|0|315|0|{1|reject|}125|127|}
{2010212001|XXGvertex_oport_oport|190|0|317|0|{2|error|}125|128|}
{2010212001|XXGvertex_oport_oport|191|0|319|0|{3|log|}125|129|}
{2010211001|XXGvertex_iport_iport|192|0|321|0|{0|in|}125|130|}
{2010214001|XXGiport_src_flow|193|0|323|0|{0|}130|66|}
{2010007001|XXGobject_proto_object|194|0|324|0|{}125|131|}
{2010212001|XXGvertex_oport_oport|195|0|326|0|{0|out|}131|132|}
{2010006001|XXGobject_psameas_object|196|0|328|0|{metadata|out_metadata|1|0|}132|131|}
{2010212001|XXGvertex_oport_oport|197|0|329|0|{1|reject|}131|133|}
{2010006001|XXGobject_psameas_object|198|0|331|0|{metadata|reject_metadata|1|0|}133|131|}
{2010212001|XXGvertex_oport_oport|199|0|332|0|{2|error|}131|134|}
{2010006001|XXGobject_psameas_object|200|0|334|0|{metadata|error_metadata|1|0|}134|131|}
{2010212001|XXGvertex_oport_oport|201|0|335|0|{3|log|}131|135|}
{2010006001|XXGobject_psameas_object|202|0|337|0|{metadata|log_metadata|1|0|}135|131|}
{2010211001|XXGvertex_iport_iport|203|0|338|0|{0|in|}131|136|}
{2010006001|XXGobject_psameas_object|204|0|340|0|{metadata|in_metadata|1|0|}136|131|}
{2010006001|XXGobject_psameas_object|205|0|341|0|{Layout|Layout|0|0|}125|85|}
{2010006001|XXGobject_psameas_object|206|0|342|0|{in_metadata|out0_metadata|0|0|}125|101|}
{2010006001|XXGobject_psameas_object|207|0|343|0|{out_metadata|out0_metadata|0|0|}125|101|}
{2010006001|XXGobject_psameas_object|208|0|344|0|{reject_metadata|out0_metadata|0|0|}125|101|}
{2010211001|XXGvertex_iport_iport|209|0|345|0|{0|in0|}64|137|}
{2010215002|XXGiport_binding_iport|210|0|347|0|{.5|.5|{0|}15009|}137|97|}
{2010214001|XXGiport_src_flow|211|0|348|0|{0|}137|13|}
{2010601001|XXGgraph_vertex_vertex|212|0|349|0|{Get_Job_Log_Formatted_|}1|138|}
{2010212001|XXGvertex_oport_oport|213|0|351|0|{0|read|}138|139|}
{2010213001|XXGoport_dst_flow|214|0|353|0|{0|}139|19|}
{2010007001|XXGobject_proto_object|215|0|354|0|{}138|140|}
{2010212001|XXGvertex_oport_oport|216|0|356|0|{0|read|}140|141|}
{2010006001|XXGobject_psameas_object|217|0|358|0|{metadata|read_metadata|1|0|}141|140|}
{2010601001|XXGgraph_vertex_vertex|218|0|359|0|{Handle_Logs|}1|89|}
{2010601001|XXGgraph_vertex_vertex|219|0|360|0|{Map_from_clean_to_publish_clean|}1|142|}
{2010212001|XXGvertex_oport_oport|220|0|362|0|{0|out0|}142|143|}
{2010213001|XXGoport_dst_flow|221|0|364|0|{0|}143|11|}
{2010212001|XXGvertex_oport_oport|222|0|365|0|{1|out1|}142|144|}
{2010213001|XXGoport_dst_flow|223|0|367|0|{0|}144|16|}
{2010212001|XXGvertex_oport_oport|224|0|368|0|{2|reject0|}142|145|}
{2010212001|XXGvertex_oport_oport|225|0|370|0|{3|reject1|}142|146|}
{2010212001|XXGvertex_oport_oport|226|0|372|0|{4|error0|}142|147|}
{2010212001|XXGvertex_oport_oport|227|0|374|0|{5|error1|}142|148|}
{2010212001|XXGvertex_oport_oport|228|0|376|0|{6|log|}142|149|}
{2010211001|XXGvertex_iport_iport|229|0|378|0|{0|in|}142|150|}
{2010214001|XXGiport_src_flow|230|0|380|0|{0|}150|17|}
{2010007001|XXGobject_proto_object|231|0|381|0|{}142|151|}
{2010212001|XXGvertex_oport_oport|232|0|383|0|{0|out0|}151|152|}
{2010006001|XXGobject_psameas_object|233|0|385|0|{metadata|out0_metadata|1|0|}152|151|}
{2010006001|XXGobject_psameas_object|234|0|386|0|{transform0|transform0|1|0|}152|151|}
{2010212001|XXGvertex_oport_oport|235|0|387|0|{1|out1|}151|153|}
{2010006001|XXGobject_psameas_object|236|0|389|0|{metadata|out1_metadata|1|0|}153|151|}
{2010006001|XXGobject_psameas_object|237|0|390|0|{transform1|transform1|1|0|}153|151|}
{2010212001|XXGvertex_oport_oport|238|0|391|0|{2|reject0|}151|154|}
{2010006001|XXGobject_psameas_object|239|0|393|0|{metadata|reject0_metadata|1|0|}154|151|}
{2010212001|XXGvertex_oport_oport|240|0|394|0|{3|reject1|}151|155|}
{2010006001|XXGobject_psameas_object|241|0|396|0|{metadata|reject1_metadata|1|0|}155|151|}
{2010212001|XXGvertex_oport_oport|242|0|397|0|{4|error0|}151|156|}
{2010006001|XXGobject_psameas_object|243|0|399|0|{metadata|error0_metadata|1|0|}156|151|}
{2010212001|XXGvertex_oport_oport|244|0|400|0|{5|error1|}151|157|}
{2010006001|XXGobject_psameas_object|245|0|402|0|{metadata|error1_metadata|1|0|}157|151|}
{2010212001|XXGvertex_oport_oport|246|0|403|0|{6|log|}151|158|}
{2010006001|XXGobject_psameas_object|247|0|405|0|{metadata|log_metadata|1|0|}158|151|}
{2010211001|XXGvertex_iport_iport|248|0|406|0|{0|in|}151|159|}
{2010006001|XXGobject_psameas_object|249|0|408|0|{metadata|in_metadata|1|0|}159|151|}
{2010006001|XXGobject_psameas_object|250|0|409|0|{Layout|Layout|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|251|0|410|0|{in_metadata|write_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|252|0|411|0|{out0_metadata|write_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|253|0|412|0|{out1_metadata|write_metadata|0|0|}142|160|}
{2010211001|XXGvertex_iport_iport|254|0|414|0|{0|write|}160|161|}
{2010214001|XXGiport_src_flow|255|0|416|0|{0|}161|16|}
{2010007001|XXGobject_proto_object|256|0|417|0|{}160|162|}
{2010211001|XXGvertex_iport_iport|257|0|419|0|{0|write|}162|163|}
{2010006001|XXGobject_psameas_object|258|0|421|0|{metadata|write_metadata|1|0|}163|162|}
{2010006001|XXGobject_psameas_object|259|0|422|0|{reject0_metadata|write_metadata|0|0|}142|57|}
{2010006001|XXGobject_psameas_object|260|0|423|0|{reject1_metadata|write_metadata|0|0|}142|57|}
{2010601001|XXGgraph_vertex_vertex|261|0|424|0|{Optional_Clean|}1|57|}
{2010601001|XXGgraph_vertex_vertex|262|0|425|0|{Optional_Lookup|}1|164|}
{2010211001|XXGvertex_iport_iport|263|0|427|0|{0|write|}164|165|}
{2010214001|XXGiport_src_flow|264|0|429|0|{0|}165|20|}
{2010007001|XXGobject_proto_object|265|0|430|0|{}164|166|}
{2010211001|XXGvertex_iport_iport|266|0|432|0|{0|write|}166|167|}
{2010006001|XXGobject_psameas_object|267|0|434|0|{metadata|write_metadata|1|0|}167|166|}
{2010601001|XXGgraph_vertex_vertex|268|0|435|0|{Optional_Public_Clean_File|}1|160|}
{2010601001|XXGgraph_vertex_vertex|269|0|436|0|{Optional_Source|}1|53|}
{2010601001|XXGgraph_vertex_vertex|270|0|437|0|{Prepare_Output|}1|168|}
{2010605001|XXGgraph_legend_legend|271|0|439|0|{0|}168|169|}
{2010241001|XXGlegend_face_face|272|0|441|0|{}169|170|}
{2010605001|XXGgraph_legend_legend|273|0|443|0|{1|}168|171|}
{2010241001|XXGlegend_face_face|274|0|445|0|{}171|172|}
{2010605001|XXGgraph_legend_legend|275|0|447|0|{2|}168|173|}
{2010241001|XXGlegend_face_face|276|0|449|0|{}173|174|}
{2010605001|XXGgraph_legend_legend|277|0|451|0|{3|}168|175|}
{2010241001|XXGlegend_face_face|278|0|453|0|{}175|176|}
{2010604001|XXGgraph_flow_flow|279|0|455|0|{Flow_1|}168|34|}
{2010604001|XXGgraph_flow_flow|280|0|456|0|{Flow_2|}168|32|}
{2010604001|XXGgraph_flow_flow|281|0|457|0|{Flow_3|}168|177|}
{2010604001|XXGgraph_flow_flow|282|0|459|0|{Flow_4|}168|63|}
{2010604001|XXGgraph_flow_flow|283|0|460|0|{Flow_5|}168|178|}
{2010604001|XXGgraph_flow_flow|284|0|462|0|{Flow_6|}168|179|}
{2010604001|XXGgraph_flow_flow|285|0|464|0|{Flow_7|}168|30|}
{2010604001|XXGgraph_flow_flow|286|0|465|0|{Flow_8|}168|180|}
{2010601001|XXGgraph_vertex_vertex|287|0|467|0|{Copy_Out|}168|181|}
{2010212001|XXGvertex_oport_oport|288|0|469|0|{0|out|}181|182|}
{2010211001|XXGvertex_iport_iport|289|0|471|0|{0|in|}181|183|}
{2010214001|XXGiport_src_flow|290|0|473|0|{0|}183|30|}
{2010006001|XXGobject_psameas_object|291|0|474|0|{Layout|Layout|0|0|}181|53|}
{2010006001|XXGobject_psameas_object|292|0|475|0|{in_metadata|write_metadata|0|0|}181|53|}
{2010006001|XXGobject_psameas_object|293|0|476|0|{out_metadata|write_metadata|0|0|}181|53|}
{2010601001|XXGgraph_vertex_vertex|294|0|477|0|{Copy_Out_|}168|184|}
{2010212001|XXGvertex_oport_oport|295|0|479|0|{0|out|}184|185|}
{2010211001|XXGvertex_iport_iport|296|0|481|0|{0|in|}184|186|}
{2010214001|XXGiport_src_flow|297|0|483|0|{0|}186|32|}
{2010006001|XXGobject_psameas_object|298|0|484|0|{Layout|Layout|0|0|}184|57|}
{2010006001|XXGobject_psameas_object|299|0|485|0|{in_metadata|write_metadata|0|0|}184|57|}
{2010006001|XXGobject_psameas_object|300|0|486|0|{out_metadata|write_metadata|0|0|}184|57|}
{2010601001|XXGgraph_vertex_vertex|301|0|487|0|{Dedup_and_Fix_Intervals|}168|187|}
{2010605001|XXGgraph_legend_legend|302|0|489|0|{0|}187|188|}
{2010241001|XXGlegend_face_face|303|0|491|0|{}188|189|}
{2010605001|XXGgraph_legend_legend|304|0|493|0|{1|}187|190|}
{2010241001|XXGlegend_face_face|305|0|495|0|{}190|191|}
{2010605001|XXGgraph_legend_legend|306|0|497|0|{2|}187|192|}
{2010241001|XXGlegend_face_face|307|0|499|0|{}192|193|}
{2010605001|XXGgraph_legend_legend|308|0|501|0|{3|}187|194|}
{2010241001|XXGlegend_face_face|309|0|503|0|{}194|195|}
{2010605001|XXGgraph_legend_legend|310|0|505|0|{4|}187|196|}
{2010241001|XXGlegend_face_face|311|0|507|0|{}196|197|}
{2010604001|XXGgraph_flow_flow|312|0|509|0|{Flow_1|}187|198|}
{2010604001|XXGgraph_flow_flow|313|0|511|0|{Flow_2|}187|199|}
{2010604001|XXGgraph_flow_flow|314|0|513|0|{Flow_3|}187|200|}
{2010604001|XXGgraph_flow_flow|315|0|515|0|{Flow_4|}187|201|}
{2010604001|XXGgraph_flow_flow|316|0|517|0|{Flow_6|}187|202|}
{2010604001|XXGgraph_flow_flow|317|0|519|0|{Flow_7|}187|203|}
{2010601001|XXGgraph_vertex_vertex|318|0|521|0|{Dedup_by_NK_Eff_Date|}187|204|}
{2010212001|XXGvertex_oport_oport|319|0|523|0|{0|out|}204|205|}
{2010213001|XXGoport_dst_flow|320|0|525|0|{0|}205|200|}
{2010212001|XXGvertex_oport_oport|321|0|526|0|{1|dup|}204|206|}
{2010212001|XXGvertex_oport_oport|322|0|528|0|{2|reject|}204|207|}
{2010212001|XXGvertex_oport_oport|323|0|530|0|{3|error|}204|208|}
{2010212001|XXGvertex_oport_oport|324|0|532|0|{4|log|}204|209|}
{2010211001|XXGvertex_iport_iport|325|0|534|0|{0|in|}204|210|}
{2010214001|XXGiport_src_flow|326|0|536|0|{0|}210|198|}
{2010006001|XXGobject_psameas_object|327|0|537|0|{Layout|Layout|0|0|}204|61|}
{2010006001|XXGobject_psameas_object|328|0|538|0|{dup_metadata|write_metadata|0|0|}204|61|}
{2010006001|XXGobject_psameas_object|329|0|539|0|{in_metadata|write_metadata|0|0|}204|61|}
{2010006001|XXGobject_psameas_object|330|0|540|0|{out_metadata|write_metadata|0|0|}204|61|}
{2010006001|XXGobject_psameas_object|331|0|541|0|{reject_metadata|write_metadata|0|0|}204|61|}
{2010601001|XXGgraph_vertex_vertex|332|0|542|0|{Parition_by_Related_or_NK|}187|211|}
{2010212001|XXGvertex_oport_oport|333|0|544|0|{0|out|}211|212|}
{2010213001|XXGoport_dst_flow|334|0|546|0|{0|}212|199|}
{2010211001|XXGvertex_iport_iport|335|0|547|0|{0|in|}211|213|}
{2010006001|XXGobject_psameas_object|336|0|549|0|{Layout|Layout|0|0|}211|28|}
{2010006001|XXGobject_psameas_object|337|0|550|0|{out_metadata|write_metadata|0|0|}211|61|}
{2010601001|XXGgraph_vertex_vertex|338|0|551|0|{Replicate|}187|214|}
{2010212001|XXGvertex_oport_oport|339|0|553|0|{0|out|}214|215|}
{2010211001|XXGvertex_iport_iport|340|0|555|0|{0|in|}214|216|}
{2010214001|XXGiport_src_flow|341|0|557|0|{0|}216|203|}
{2010006001|XXGobject_psameas_object|342|0|558|0|{Layout|Layout|0|0|}214|61|}
{2010006001|XXGobject_psameas_object|343|0|559|0|{in_metadata|write_metadata|0|0|}214|164|}
{2010006001|XXGobject_psameas_object|344|0|560|0|{out_metadata|write_metadata|0|0|}214|164|}
{2010601001|XXGgraph_vertex_vertex|345|0|561|0|{Rollup_Adjoining_Eff_Dates|}187|217|}
{2010212001|XXGvertex_oport_oport|346|0|563|0|{0|out|}217|218|}
{2010213001|XXGoport_dst_flow|347|0|565|0|{0|}218|203|}
{2010212001|XXGvertex_oport_oport|348|0|566|0|{1|reject|}217|219|}
{2010212001|XXGvertex_oport_oport|349|0|568|0|{2|error|}217|220|}
{2010212001|XXGvertex_oport_oport|350|0|570|0|{3|log|}217|221|}
{2010211001|XXGvertex_iport_iport|351|0|572|0|{0|in|}217|222|}
{2010214001|XXGiport_src_flow|352|0|574|0|{0|}222|202|}
{2010006001|XXGobject_psameas_object|353|0|575|0|{Layout|Layout|0|0|}217|61|}
{2010006001|XXGobject_psameas_object|354|0|576|0|{in_metadata|write_metadata|0|0|}217|61|}
{2010006001|XXGobject_psameas_object|355|0|577|0|{out_metadata|write_metadata|0|0|}217|61|}
{2010006001|XXGobject_psameas_object|356|0|578|0|{reject_metadata|write_metadata|0|0|}217|61|}
{2010601001|XXGgraph_vertex_vertex|357|0|579|0|{Scan_to_Fix_Overlapping_Dates|}187|223|}
{2010212001|XXGvertex_oport_oport|358|0|581|0|{0|out|}223|224|}
{2010213001|XXGoport_dst_flow|359|0|583|0|{0|}224|201|}
{2010212001|XXGvertex_oport_oport|360|0|584|0|{1|reject|}223|225|}
{2010212001|XXGvertex_oport_oport|361|0|586|0|{2|error|}223|226|}
{2010212001|XXGvertex_oport_oport|362|0|588|0|{3|log|}223|227|}
{2010211001|XXGvertex_iport_iport|363|0|590|0|{0|in|}223|228|}
{2010214001|XXGiport_src_flow|364|0|592|0|{0|}228|200|}
{2010006001|XXGobject_psameas_object|365|0|593|0|{Layout|Layout|0|0|}223|61|}
{2010006001|XXGobject_psameas_object|366|0|594|0|{in_metadata|write_metadata|0|0|}223|61|}
{2010006001|XXGobject_psameas_object|367|0|595|0|{out_metadata|write_metadata|0|0|}223|61|}
{2010006001|XXGobject_psameas_object|368|0|596|0|{reject_metadata|write_metadata|0|0|}223|61|}
{2010601001|XXGgraph_vertex_vertex|369|0|597|0|{Sort_for_Dedup|}187|229|}
{2010212001|XXGvertex_oport_oport|370|0|599|0|{0|out|}229|230|}
{2010213001|XXGoport_dst_flow|371|0|601|0|{0|}230|198|}
{2010211001|XXGvertex_iport_iport|372|0|602|0|{0|in|}229|231|}
{2010214001|XXGiport_src_flow|373|0|604|0|{0|}231|199|}
{2010006001|XXGobject_psameas_object|374|0|605|0|{Layout|Layout|0|0|}229|61|}
{2010006001|XXGobject_psameas_object|375|0|606|0|{in_metadata|write_metadata|0|0|}229|61|}
{2010006001|XXGobject_psameas_object|376|0|607|0|{out_metadata|write_metadata|0|0|}229|61|}
{2010601001|XXGgraph_vertex_vertex|377|0|608|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}187|232|}
{2010212001|XXGvertex_oport_oport|378|0|610|0|{0|out|}232|233|}
{2010213001|XXGoport_dst_flow|379|0|612|0|{0|}233|202|}
{2010211001|XXGvertex_iport_iport|380|0|613|0|{0|in|}232|234|}
{2010214001|XXGiport_src_flow|381|0|615|0|{0|}234|201|}
{2010006001|XXGobject_psameas_object|382|0|616|0|{Layout|Layout|0|0|}232|61|}
{2010006001|XXGobject_psameas_object|383|0|617|0|{in_metadata|write_metadata|0|0|}232|61|}
{2010006001|XXGobject_psameas_object|384|0|618|0|{out_metadata|write_metadata|0|0|}232|61|}
{2010212001|XXGvertex_oport_oport|385|0|619|0|{0|out|}187|235|}
{2010216002|XXGoport_binding_oport|386|0|621|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6839|}235|215|}
{2010213001|XXGoport_dst_flow|387|0|622|0|{0|}235|177|}
{2010213001|XXGoport_dst_flow|388|0|623|0|{1|}235|179|}
{2010212001|XXGvertex_oport_oport|389|0|624|0|{1|dups|}187|236|}
{2010216002|XXGoport_binding_oport|390|0|626|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6835|}236|206|}
{2010213001|XXGoport_dst_flow|391|0|627|0|{0|}236|63|}
{2010211001|XXGvertex_iport_iport|392|0|628|0|{0|in|}187|237|}
{2010215002|XXGiport_binding_iport|393|0|630|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6837|}237|213|}
{2010214001|XXGiport_src_flow|394|0|631|0|{0|}237|34|}
{2010006001|XXGobject_psameas_object|395|0|632|0|{INPUT_DML|write_metadata|0|0|}187|61|}
{2010601001|XXGgraph_vertex_vertex|396|0|633|0|{Dups|}168|61|}
{2010601001|XXGgraph_vertex_vertex|397|0|634|0|{Gather|}168|238|}
{2010212001|XXGvertex_oport_oport|398|0|636|0|{0|out|}238|239|}
{2010213001|XXGoport_dst_flow|399|0|638|0|{0|}239|180|}
{2010211001|XXGvertex_iport_iport|400|0|639|0|{0|in|}238|240|}
{2010214001|XXGiport_src_flow|401|0|641|0|{0|}240|179|}
{2010006001|XXGobject_psameas_object|402|0|642|0|{in_metadata|write_metadata|0|0|}238|164|}
{2010006001|XXGobject_psameas_object|403|0|643|0|{out_metadata|write_metadata|0|0|}238|164|}
{2010601001|XXGgraph_vertex_vertex|404|0|644|0|{Gather_|}168|241|}
{2010212001|XXGvertex_oport_oport|405|0|646|0|{0|out|}241|242|}
{2010211001|XXGvertex_iport_iport|406|0|648|0|{0|in|}241|243|}
{2010214001|XXGiport_src_flow|407|0|650|0|{0|}243|178|}
{2010214001|XXGiport_src_flow|408|0|651|0|{1|}243|180|}
{2010006001|XXGobject_psameas_object|409|0|652|0|{Layout|Layout|0|0|}241|164|}
{2010006001|XXGobject_psameas_object|410|0|653|0|{in_metadata|write_metadata|0|0|}241|164|}
{2010006001|XXGobject_psameas_object|411|0|654|0|{out_metadata|write_metadata|0|0|}241|164|}
{2010601001|XXGgraph_vertex_vertex|412|0|655|0|{Map_to_Output|}168|28|}
{2010601001|XXGgraph_vertex_vertex|413|0|656|0|{Merge|}168|244|}
{2010212001|XXGvertex_oport_oport|414|0|658|0|{0|out|}244|245|}
{2010213001|XXGoport_dst_flow|415|0|660|0|{0|}245|178|}
{2010211001|XXGvertex_iport_iport|416|0|661|0|{0|in|}244|246|}
{2010214001|XXGiport_src_flow|417|0|663|0|{0|}246|177|}
{2010006001|XXGobject_psameas_object|418|0|664|0|{in_metadata|write_metadata|0|0|}244|164|}
{2010006001|XXGobject_psameas_object|419|0|665|0|{out_metadata|write_metadata|0|0|}244|164|}
{2010212001|XXGvertex_oport_oport|420|0|666|0|{0|source|}168|247|}
{2010216002|XXGoport_binding_oport|421|0|668|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9943|}247|182|}
{2010213001|XXGoport_dst_flow|422|0|669|0|{0|}247|18|}
{2010212001|XXGvertex_oport_oport|423|0|670|0|{1|clean|}168|248|}
{2010216002|XXGoport_binding_oport|424|0|672|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9948|}248|185|}
{2010213001|XXGoport_dst_flow|425|0|673|0|{0|}248|17|}
{2010212001|XXGvertex_oport_oport|426|0|674|0|{2|lookup|}168|249|}
{2010216002|XXGoport_binding_oport|427|0|676|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9953|}249|242|}
{2010213001|XXGoport_dst_flow|428|0|677|0|{0|}249|20|}
{2010211001|XXGvertex_iport_iport|429|0|678|0|{0|in0|}168|250|}
{2010215002|XXGiport_binding_iport|430|0|680|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9955|}250|42|}
{2010214001|XXGiport_src_flow|431|0|681|0|{0|}250|12|}
{2010007001|XXGobject_proto_object|432|0|682|0|{}168|251|}
{2010605001|XXGgraph_legend_legend|433|0|684|0|{0|}251|252|}
{2010241001|XXGlegend_face_face|434|0|686|0|{}252|253|}
{2010605001|XXGgraph_legend_legend|435|0|688|0|{1|}251|254|}
{2010241001|XXGlegend_face_face|436|0|690|0|{}254|255|}
{2010605001|XXGgraph_legend_legend|437|0|692|0|{2|}251|256|}
{2010241001|XXGlegend_face_face|438|0|694|0|{}256|257|}
{2010605001|XXGgraph_legend_legend|439|0|696|0|{3|}251|258|}
{2010241001|XXGlegend_face_face|440|0|698|0|{}258|259|}
{2010604001|XXGgraph_flow_flow|441|0|700|0|{Flow_1|}251|260|}
{2010604001|XXGgraph_flow_flow|442|0|702|0|{Flow_2|}251|261|}
{2010604001|XXGgraph_flow_flow|443|0|704|0|{Flow_3|}251|262|}
{2010604001|XXGgraph_flow_flow|444|0|706|0|{Flow_4|}251|263|}
{2010604001|XXGgraph_flow_flow|445|0|708|0|{Flow_5|}251|264|}
{2010604001|XXGgraph_flow_flow|446|0|710|0|{Flow_6|}251|265|}
{2010604001|XXGgraph_flow_flow|447|0|712|0|{Flow_7|}251|266|}
{2010604001|XXGgraph_flow_flow|448|0|714|0|{Flow_8|}251|267|}
{2010601001|XXGgraph_vertex_vertex|449|0|716|0|{Copy_Out|}251|268|}
{2010212001|XXGvertex_oport_oport|450|0|718|0|{0|out|}268|269|}
{2010211001|XXGvertex_iport_iport|451|0|720|0|{0|in|}268|270|}
{2010214001|XXGiport_src_flow|452|0|722|0|{0|}270|266|}
{2010007001|XXGobject_proto_object|453|0|723|0|{}268|271|}
{2010212001|XXGvertex_oport_oport|454|0|725|0|{0|out|}271|272|}
{2010006001|XXGobject_psameas_object|455|0|727|0|{metadata|out_metadata|1|0|}272|271|}
{2010211001|XXGvertex_iport_iport|456|0|728|0|{0|in|}271|273|}
{2010006001|XXGobject_psameas_object|457|0|730|0|{metadata|in_metadata|1|0|}273|271|}
{2010601001|XXGgraph_vertex_vertex|458|0|731|0|{Copy_Out_|}251|274|}
{2010212001|XXGvertex_oport_oport|459|0|733|0|{0|out|}274|275|}
{2010211001|XXGvertex_iport_iport|460|0|735|0|{0|in|}274|276|}
{2010214001|XXGiport_src_flow|461|0|737|0|{0|}276|261|}
{2010007001|XXGobject_proto_object|462|0|738|0|{}274|277|}
{2010212001|XXGvertex_oport_oport|463|0|740|0|{0|out|}277|278|}
{2010006001|XXGobject_psameas_object|464|0|742|0|{metadata|out_metadata|1|0|}278|277|}
{2010211001|XXGvertex_iport_iport|465|0|743|0|{0|in|}277|279|}
{2010006001|XXGobject_psameas_object|466|0|745|0|{metadata|in_metadata|1|0|}279|277|}
{2010601001|XXGgraph_vertex_vertex|467|0|746|0|{Dedup_and_Fix_Intervals|}251|280|}
{2010605001|XXGgraph_legend_legend|468|0|748|0|{0|}280|281|}
{2010241001|XXGlegend_face_face|469|0|750|0|{}281|282|}
{2010605001|XXGgraph_legend_legend|470|0|752|0|{1|}280|283|}
{2010241001|XXGlegend_face_face|471|0|754|0|{}283|284|}
{2010605001|XXGgraph_legend_legend|472|0|756|0|{2|}280|285|}
{2010241001|XXGlegend_face_face|473|0|758|0|{}285|286|}
{2010605001|XXGgraph_legend_legend|474|0|760|0|{3|}280|287|}
{2010241001|XXGlegend_face_face|475|0|762|0|{}287|288|}
{2010605001|XXGgraph_legend_legend|476|0|764|0|{4|}280|289|}
{2010241001|XXGlegend_face_face|477|0|766|0|{}289|290|}
{2010604001|XXGgraph_flow_flow|478|0|768|0|{Flow_1|}280|291|}
{2010604001|XXGgraph_flow_flow|479|0|770|0|{Flow_2|}280|292|}
{2010604001|XXGgraph_flow_flow|480|0|772|0|{Flow_3|}280|293|}
{2010604001|XXGgraph_flow_flow|481|0|774|0|{Flow_4|}280|294|}
{2010604001|XXGgraph_flow_flow|482|0|776|0|{Flow_6|}280|295|}
{2010604001|XXGgraph_flow_flow|483|0|778|0|{Flow_7|}280|296|}
{2010601001|XXGgraph_vertex_vertex|484|0|780|0|{Dedup_by_NK_Eff_Date|}280|297|}
{2010212001|XXGvertex_oport_oport|485|0|782|0|{0|out|}297|298|}
{2010213001|XXGoport_dst_flow|486|0|784|0|{0|}298|293|}
{2010212001|XXGvertex_oport_oport|487|0|785|0|{1|dup|}297|299|}
{2010212001|XXGvertex_oport_oport|488|0|787|0|{2|reject|}297|300|}
{2010212001|XXGvertex_oport_oport|489|0|789|0|{3|error|}297|301|}
{2010212001|XXGvertex_oport_oport|490|0|791|0|{4|log|}297|302|}
{2010211001|XXGvertex_iport_iport|491|0|793|0|{0|in|}297|303|}
{2010214001|XXGiport_src_flow|492|0|795|0|{0|}303|291|}
{2010601001|XXGgraph_vertex_vertex|493|0|796|0|{Parition_by_Related_or_NK|}280|304|}
{2010212001|XXGvertex_oport_oport|494|0|798|0|{0|out|}304|305|}
{2010213001|XXGoport_dst_flow|495|0|800|0|{0|}305|292|}
{2010211001|XXGvertex_iport_iport|496|0|801|0|{0|in|}304|306|}
{2010601001|XXGgraph_vertex_vertex|497|0|803|0|{Replicate|}280|307|}
{2010212001|XXGvertex_oport_oport|498|0|805|0|{0|out|}307|308|}
{2010211001|XXGvertex_iport_iport|499|0|807|0|{0|in|}307|309|}
{2010214001|XXGiport_src_flow|500|0|809|0|{0|}309|296|}
{2010601001|XXGgraph_vertex_vertex|501|0|810|0|{Rollup_Adjoining_Eff_Dates|}280|310|}
{2010212001|XXGvertex_oport_oport|502|0|812|0|{0|out|}310|311|}
{2010213001|XXGoport_dst_flow|503|0|814|0|{0|}311|296|}
{2010212001|XXGvertex_oport_oport|504|0|815|0|{1|reject|}310|312|}
{2010212001|XXGvertex_oport_oport|505|0|817|0|{2|error|}310|313|}
{2010212001|XXGvertex_oport_oport|506|0|819|0|{3|log|}310|314|}
{2010211001|XXGvertex_iport_iport|507|0|821|0|{0|in|}310|315|}
{2010214001|XXGiport_src_flow|508|0|823|0|{0|}315|295|}
{2010601001|XXGgraph_vertex_vertex|509|0|824|0|{Scan_to_Fix_Overlapping_Dates|}280|316|}
{2010212001|XXGvertex_oport_oport|510|0|826|0|{0|out|}316|317|}
{2010213001|XXGoport_dst_flow|511|0|828|0|{0|}317|294|}
{2010212001|XXGvertex_oport_oport|512|0|829|0|{1|reject|}316|318|}
{2010212001|XXGvertex_oport_oport|513|0|831|0|{2|error|}316|319|}
{2010212001|XXGvertex_oport_oport|514|0|833|0|{3|log|}316|320|}
{2010211001|XXGvertex_iport_iport|515|0|835|0|{0|in|}316|321|}
{2010214001|XXGiport_src_flow|516|0|837|0|{0|}321|293|}
{2010601001|XXGgraph_vertex_vertex|517|0|838|0|{Sort_for_Dedup|}280|322|}
{2010212001|XXGvertex_oport_oport|518|0|840|0|{0|out|}322|323|}
{2010213001|XXGoport_dst_flow|519|0|842|0|{0|}323|291|}
{2010211001|XXGvertex_iport_iport|520|0|843|0|{0|in|}322|324|}
{2010214001|XXGiport_src_flow|521|0|845|0|{0|}324|292|}
{2010601001|XXGgraph_vertex_vertex|522|0|846|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}280|325|}
{2010212001|XXGvertex_oport_oport|523|0|848|0|{0|out|}325|326|}
{2010213001|XXGoport_dst_flow|524|0|850|0|{0|}326|295|}
{2010211001|XXGvertex_iport_iport|525|0|851|0|{0|in|}325|327|}
{2010214001|XXGiport_src_flow|526|0|853|0|{0|}327|294|}
{2010212001|XXGvertex_oport_oport|527|0|854|0|{0|out|}280|328|}
{2010216002|XXGoport_binding_oport|528|0|856|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6839|}328|308|}
{2010213001|XXGoport_dst_flow|529|0|857|0|{0|}328|262|}
{2010213001|XXGoport_dst_flow|530|0|858|0|{1|}328|265|}
{2010212001|XXGvertex_oport_oport|531|0|859|0|{1|dups|}280|329|}
{2010216002|XXGoport_binding_oport|532|0|861|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6835|}329|299|}
{2010213001|XXGoport_dst_flow|533|0|862|0|{0|}329|263|}
{2010211001|XXGvertex_iport_iport|534|0|863|0|{0|in|}280|330|}
{2010215002|XXGiport_binding_iport|535|0|865|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6837|}330|306|}
{2010214001|XXGiport_src_flow|536|0|866|0|{0|}330|260|}
{2010007001|XXGobject_proto_object|537|0|867|0|{}280|331|}
{2010605001|XXGgraph_legend_legend|538|0|869|0|{0|}331|332|}
{2010241001|XXGlegend_face_face|539|0|871|0|{}332|333|}
{2010605001|XXGgraph_legend_legend|540|0|873|0|{1|}331|334|}
{2010241001|XXGlegend_face_face|541|0|875|0|{}334|335|}
{2010605001|XXGgraph_legend_legend|542|0|877|0|{2|}331|336|}
{2010241001|XXGlegend_face_face|543|0|879|0|{}336|337|}
{2010605001|XXGgraph_legend_legend|544|0|881|0|{3|}331|338|}
{2010241001|XXGlegend_face_face|545|0|883|0|{}338|339|}
{2010605001|XXGgraph_legend_legend|546|0|885|0|{4|}331|340|}
{2010241001|XXGlegend_face_face|547|0|887|0|{}340|341|}
{2010604001|XXGgraph_flow_flow|548|0|889|0|{Flow_1|}331|342|}
{2010604001|XXGgraph_flow_flow|549|0|891|0|{Flow_2|}331|343|}
{2010604001|XXGgraph_flow_flow|550|0|893|0|{Flow_3|}331|344|}
{2010604001|XXGgraph_flow_flow|551|0|895|0|{Flow_4|}331|345|}
{2010604001|XXGgraph_flow_flow|552|0|897|0|{Flow_6|}331|346|}
{2010604001|XXGgraph_flow_flow|553|0|899|0|{Flow_7|}331|347|}
{2010601001|XXGgraph_vertex_vertex|554|0|901|0|{Dedup_by_NK_Eff_Date|}331|348|}
{2010212001|XXGvertex_oport_oport|555|0|903|0|{0|out|}348|349|}
{2010213001|XXGoport_dst_flow|556|0|905|0|{0|}349|344|}
{2010212001|XXGvertex_oport_oport|557|0|906|0|{1|dup|}348|350|}
{2010212001|XXGvertex_oport_oport|558|0|908|0|{2|reject|}348|351|}
{2010212001|XXGvertex_oport_oport|559|0|910|0|{3|error|}348|352|}
{2010212001|XXGvertex_oport_oport|560|0|912|0|{4|log|}348|353|}
{2010211001|XXGvertex_iport_iport|561|0|914|0|{0|in|}348|354|}
{2010214001|XXGiport_src_flow|562|0|916|0|{0|}354|342|}
{2010007001|XXGobject_proto_object|563|0|917|0|{}348|355|}
{2010212001|XXGvertex_oport_oport|564|0|919|0|{0|out|}355|356|}
{2010006001|XXGobject_psameas_object|565|0|921|0|{metadata|out_metadata|1|0|}356|355|}
{2010212001|XXGvertex_oport_oport|566|0|922|0|{1|dup|}355|357|}
{2010006001|XXGobject_psameas_object|567|0|924|0|{metadata|dup_metadata|1|0|}357|355|}
{2010212001|XXGvertex_oport_oport|568|0|925|0|{2|reject|}355|358|}
{2010006001|XXGobject_psameas_object|569|0|927|0|{metadata|reject_metadata|1|0|}358|355|}
{2010212001|XXGvertex_oport_oport|570|0|928|0|{3|error|}355|359|}
{2010006001|XXGobject_psameas_object|571|0|930|0|{metadata|error_metadata|1|0|}359|355|}
{2010212001|XXGvertex_oport_oport|572|0|931|0|{4|log|}355|360|}
{2010006001|XXGobject_psameas_object|573|0|933|0|{metadata|log_metadata|1|0|}360|355|}
{2010211001|XXGvertex_iport_iport|574|0|934|0|{0|in|}355|361|}
{2010006001|XXGobject_psameas_object|575|0|936|0|{metadata|in_metadata|1|0|}361|355|}
{2010601001|XXGgraph_vertex_vertex|576|0|937|0|{Parition_by_Related_or_NK|}331|362|}
{2010212001|XXGvertex_oport_oport|577|0|939|0|{0|out|}362|363|}
{2010213001|XXGoport_dst_flow|578|0|941|0|{0|}363|343|}
{2010211001|XXGvertex_iport_iport|579|0|942|0|{0|in|}362|364|}
{2010007001|XXGobject_proto_object|580|0|944|0|{}362|365|}
{2010212001|XXGvertex_oport_oport|581|0|946|0|{0|out|}365|366|}
{2010006001|XXGobject_psameas_object|582|0|948|0|{metadata|out_metadata|1|0|}366|365|}
{2010211001|XXGvertex_iport_iport|583|0|949|0|{0|in|}365|367|}
{2010006001|XXGobject_psameas_object|584|0|951|0|{metadata|in_metadata|1|0|}367|365|}
{2010006001|XXGobject_psameas_object|585|0|952|0|{in_metadata|INPUT_DML|1|0|}362|331|}
{2010601001|XXGgraph_vertex_vertex|586|0|953|0|{Replicate|}331|368|}
{2010212001|XXGvertex_oport_oport|587|0|955|0|{0|out|}368|369|}
{2010211001|XXGvertex_iport_iport|588|0|957|0|{0|in|}368|370|}
{2010214001|XXGiport_src_flow|589|0|959|0|{0|}370|347|}
{2010007001|XXGobject_proto_object|590|0|960|0|{}368|371|}
{2010212001|XXGvertex_oport_oport|591|0|962|0|{0|out|}371|372|}
{2010006001|XXGobject_psameas_object|592|0|964|0|{metadata|out_metadata|1|0|}372|371|}
{2010211001|XXGvertex_iport_iport|593|0|965|0|{0|in|}371|373|}
{2010006001|XXGobject_psameas_object|594|0|967|0|{metadata|in_metadata|1|0|}373|371|}
{2010601001|XXGgraph_vertex_vertex|595|0|968|0|{Rollup_Adjoining_Eff_Dates|}331|374|}
{2010212001|XXGvertex_oport_oport|596|0|970|0|{0|out|}374|375|}
{2010213001|XXGoport_dst_flow|597|0|972|0|{0|}375|347|}
{2010212001|XXGvertex_oport_oport|598|0|973|0|{1|reject|}374|376|}
{2010212001|XXGvertex_oport_oport|599|0|975|0|{2|error|}374|377|}
{2010212001|XXGvertex_oport_oport|600|0|977|0|{3|log|}374|378|}
{2010211001|XXGvertex_iport_iport|601|0|979|0|{0|in|}374|379|}
{2010214001|XXGiport_src_flow|602|0|981|0|{0|}379|346|}
{2010007001|XXGobject_proto_object|603|0|982|0|{}374|380|}
{2010212001|XXGvertex_oport_oport|604|0|984|0|{0|out|}380|381|}
{2010006001|XXGobject_psameas_object|605|0|986|0|{metadata|out_metadata|1|0|}381|380|}
{2010212001|XXGvertex_oport_oport|606|0|987|0|{1|reject|}380|382|}
{2010006001|XXGobject_psameas_object|607|0|989|0|{metadata|reject_metadata|1|0|}382|380|}
{2010212001|XXGvertex_oport_oport|608|0|990|0|{2|error|}380|383|}
{2010006001|XXGobject_psameas_object|609|0|992|0|{metadata|error_metadata|1|0|}383|380|}
{2010212001|XXGvertex_oport_oport|610|0|993|0|{3|log|}380|384|}
{2010006001|XXGobject_psameas_object|611|0|995|0|{metadata|log_metadata|1|0|}384|380|}
{2010211001|XXGvertex_iport_iport|612|0|996|0|{0|in|}380|385|}
{2010006001|XXGobject_psameas_object|613|0|998|0|{metadata|in_metadata|1|0|}385|380|}
{2010601001|XXGgraph_vertex_vertex|614|0|999|0|{Scan_to_Fix_Overlapping_Dates|}331|386|}
{2010212001|XXGvertex_oport_oport|615|0|1001|0|{0|out|}386|387|}
{2010213001|XXGoport_dst_flow|616|0|1003|0|{0|}387|345|}
{2010212001|XXGvertex_oport_oport|617|0|1004|0|{1|reject|}386|388|}
{2010212001|XXGvertex_oport_oport|618|0|1006|0|{2|error|}386|389|}
{2010212001|XXGvertex_oport_oport|619|0|1008|0|{3|log|}386|390|}
{2010211001|XXGvertex_iport_iport|620|0|1010|0|{0|in|}386|391|}
{2010214001|XXGiport_src_flow|621|0|1012|0|{0|}391|344|}
{2010007001|XXGobject_proto_object|622|0|1013|0|{}386|392|}
{2010212001|XXGvertex_oport_oport|623|0|1015|0|{0|out|}392|393|}
{2010006001|XXGobject_psameas_object|624|0|1017|0|{metadata|out_metadata|1|0|}393|392|}
{2010212001|XXGvertex_oport_oport|625|0|1018|0|{1|reject|}392|394|}
{2010006001|XXGobject_psameas_object|626|0|1020|0|{metadata|reject_metadata|1|0|}394|392|}
{2010212001|XXGvertex_oport_oport|627|0|1021|0|{2|error|}392|395|}
{2010006001|XXGobject_psameas_object|628|0|1023|0|{metadata|error_metadata|1|0|}395|392|}
{2010212001|XXGvertex_oport_oport|629|0|1024|0|{3|log|}392|396|}
{2010006001|XXGobject_psameas_object|630|0|1026|0|{metadata|log_metadata|1|0|}396|392|}
{2010211001|XXGvertex_iport_iport|631|0|1027|0|{0|in|}392|397|}
{2010006001|XXGobject_psameas_object|632|0|1029|0|{metadata|in_metadata|1|0|}397|392|}
{2010601001|XXGgraph_vertex_vertex|633|0|1030|0|{Sort_for_Dedup|}331|398|}
{2010212001|XXGvertex_oport_oport|634|0|1032|0|{0|out|}398|399|}
{2010213001|XXGoport_dst_flow|635|0|1034|0|{0|}399|342|}
{2010211001|XXGvertex_iport_iport|636|0|1035|0|{0|in|}398|400|}
{2010214001|XXGiport_src_flow|637|0|1037|0|{0|}400|343|}
{2010007001|XXGobject_proto_object|638|0|1038|0|{}398|401|}
{2010212001|XXGvertex_oport_oport|639|0|1040|0|{0|out|}401|402|}
{2010006001|XXGobject_psameas_object|640|0|1042|0|{metadata|out_metadata|1|0|}402|401|}
{2010211001|XXGvertex_iport_iport|641|0|1043|0|{0|in|}401|403|}
{2010006001|XXGobject_psameas_object|642|0|1045|0|{metadata|in_metadata|1|0|}403|401|}
{2010601001|XXGgraph_vertex_vertex|643|0|1046|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}331|404|}
{2010212001|XXGvertex_oport_oport|644|0|1048|0|{0|out|}404|405|}
{2010213001|XXGoport_dst_flow|645|0|1050|0|{0|}405|346|}
{2010211001|XXGvertex_iport_iport|646|0|1051|0|{0|in|}404|406|}
{2010214001|XXGiport_src_flow|647|0|1053|0|{0|}406|345|}
{2010007001|XXGobject_proto_object|648|0|1054|0|{}404|407|}
{2010212001|XXGvertex_oport_oport|649|0|1056|0|{0|out|}407|408|}
{2010006001|XXGobject_psameas_object|650|0|1058|0|{metadata|out_metadata|1|0|}408|407|}
{2010211001|XXGvertex_iport_iport|651|0|1059|0|{0|in|}407|409|}
{2010006001|XXGobject_psameas_object|652|0|1061|0|{metadata|in_metadata|1|0|}409|407|}
{2010212001|XXGvertex_oport_oport|653|0|1062|0|{0|out|}331|410|}
{2010216002|XXGoport_binding_oport|654|0|1064|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6839|}410|369|}
{2010212001|XXGvertex_oport_oport|655|0|1065|0|{1|dups|}331|411|}
{2010216002|XXGoport_binding_oport|656|0|1067|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6835|}411|350|}
{2010211001|XXGvertex_iport_iport|657|0|1068|0|{0|in|}331|412|}
{2010215002|XXGiport_binding_iport|658|0|1070|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6837|}412|364|}
{2010006001|XXGobject_psameas_object|659|0|1071|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}280|251|}
{2010006001|XXGobject_psameas_object|660|0|1072|0|{FIX_END_DATE|FIX_END_DATE|1|0|}280|251|}
{2010006001|XXGobject_psameas_object|661|0|1073|0|{INPUT_DML|write_metadata|0|0|}280|413|}
{2010211001|XXGvertex_iport_iport|662|0|1075|0|{0|write|}413|414|}
{2010214001|XXGiport_src_flow|663|0|1077|0|{0|}414|263|}
{2010007001|XXGobject_proto_object|664|0|1078|0|{}413|415|}
{2010211001|XXGvertex_iport_iport|665|0|1080|0|{0|write|}415|416|}
{2010006001|XXGobject_psameas_object|666|0|1082|0|{metadata|write_metadata|1|0|}416|415|}
{2010601001|XXGgraph_vertex_vertex|667|0|1083|0|{Dups|}251|413|}
{2010601001|XXGgraph_vertex_vertex|668|0|1084|0|{Gather|}251|417|}
{2010212001|XXGvertex_oport_oport|669|0|1086|0|{0|out|}417|418|}
{2010213001|XXGoport_dst_flow|670|0|1088|0|{0|}418|267|}
{2010211001|XXGvertex_iport_iport|671|0|1089|0|{0|in|}417|419|}
{2010214001|XXGiport_src_flow|672|0|1091|0|{0|}419|265|}
{2010007001|XXGobject_proto_object|673|0|1092|0|{}417|420|}
{2010212001|XXGvertex_oport_oport|674|0|1094|0|{0|out|}420|421|}
{2010006001|XXGobject_psameas_object|675|0|1096|0|{metadata|out_metadata|1|0|}421|420|}
{2010211001|XXGvertex_iport_iport|676|0|1097|0|{0|in|}420|422|}
{2010006001|XXGobject_psameas_object|677|0|1099|0|{metadata|in_metadata|1|0|}422|420|}
{2010601001|XXGgraph_vertex_vertex|678|0|1100|0|{Gather_|}251|423|}
{2010212001|XXGvertex_oport_oport|679|0|1102|0|{0|out|}423|424|}
{2010211001|XXGvertex_iport_iport|680|0|1104|0|{0|in|}423|425|}
{2010214001|XXGiport_src_flow|681|0|1106|0|{0|}425|264|}
{2010214001|XXGiport_src_flow|682|0|1107|0|{1|}425|267|}
{2010007001|XXGobject_proto_object|683|0|1108|0|{}423|426|}
{2010212001|XXGvertex_oport_oport|684|0|1110|0|{0|out|}426|427|}
{2010006001|XXGobject_psameas_object|685|0|1112|0|{metadata|out_metadata|1|0|}427|426|}
{2010211001|XXGvertex_iport_iport|686|0|1113|0|{0|in|}426|428|}
{2010006001|XXGobject_psameas_object|687|0|1115|0|{metadata|in_metadata|1|0|}428|426|}
{2010601001|XXGgraph_vertex_vertex|688|0|1116|0|{Map_to_Output|}251|429|}
{2010212001|XXGvertex_oport_oport|689|0|1118|0|{0|source|}429|430|}
{2010213001|XXGoport_dst_flow|690|0|1120|0|{0|}430|266|}
{2010212001|XXGvertex_oport_oport|691|0|1121|0|{1|clean|}429|431|}
{2010213001|XXGoport_dst_flow|692|0|1123|0|{0|}431|261|}
{2010212001|XXGvertex_oport_oport|693|0|1124|0|{2|lkp|}429|432|}
{2010213001|XXGoport_dst_flow|694|0|1126|0|{0|}432|260|}
{2010212001|XXGvertex_oport_oport|695|0|1127|0|{3|reject0|}429|433|}
{2010212001|XXGvertex_oport_oport|696|0|1129|0|{4|reject1|}429|434|}
{2010212001|XXGvertex_oport_oport|697|0|1131|0|{5|reject2|}429|435|}
{2010212001|XXGvertex_oport_oport|698|0|1133|0|{6|error0|}429|436|}
{2010212001|XXGvertex_oport_oport|699|0|1135|0|{7|error1|}429|437|}
{2010212001|XXGvertex_oport_oport|700|0|1137|0|{8|error2|}429|438|}
{2010212001|XXGvertex_oport_oport|701|0|1139|0|{9|log|}429|439|}
{2010211001|XXGvertex_iport_iport|702|0|1141|0|{0|in|}429|440|}
{2010007001|XXGobject_proto_object|703|0|1143|0|{}429|441|}
{2010212001|XXGvertex_oport_oport|704|0|1145|0|{0|source|}441|442|}
{2010006001|XXGobject_psameas_object|705|0|1147|0|{metadata|out0_metadata|1|0|}442|441|}
{2010006001|XXGobject_psameas_object|706|0|1148|0|{transform0|transform0|1|0|}442|441|}
{2010212001|XXGvertex_oport_oport|707|0|1149|0|{1|clean|}441|443|}
{2010006001|XXGobject_psameas_object|708|0|1151|0|{metadata|out1_metadata|1|0|}443|441|}
{2010006001|XXGobject_psameas_object|709|0|1152|0|{transform1|transform1|1|0|}443|441|}
{2010212001|XXGvertex_oport_oport|710|0|1153|0|{2|lkp|}441|444|}
{2010006001|XXGobject_psameas_object|711|0|1155|0|{metadata|out2_metadata|1|0|}444|441|}
{2010006001|XXGobject_psameas_object|712|0|1156|0|{transform2|transform2|1|0|}444|441|}
{2010212001|XXGvertex_oport_oport|713|0|1157|0|{3|reject0|}441|445|}
{2010006001|XXGobject_psameas_object|714|0|1159|0|{metadata|reject0_metadata|1|0|}445|441|}
{2010212001|XXGvertex_oport_oport|715|0|1160|0|{4|reject1|}441|446|}
{2010006001|XXGobject_psameas_object|716|0|1162|0|{metadata|reject1_metadata|1|0|}446|441|}
{2010212001|XXGvertex_oport_oport|717|0|1163|0|{5|reject2|}441|447|}
{2010006001|XXGobject_psameas_object|718|0|1165|0|{metadata|reject2_metadata|1|0|}447|441|}
{2010212001|XXGvertex_oport_oport|719|0|1166|0|{6|error0|}441|448|}
{2010006001|XXGobject_psameas_object|720|0|1168|0|{metadata|error0_metadata|1|0|}448|441|}
{2010212001|XXGvertex_oport_oport|721|0|1169|0|{7|error1|}441|449|}
{2010006001|XXGobject_psameas_object|722|0|1171|0|{metadata|error1_metadata|1|0|}449|441|}
{2010212001|XXGvertex_oport_oport|723|0|1172|0|{8|error2|}441|450|}
{2010006001|XXGobject_psameas_object|724|0|1174|0|{metadata|error2_metadata|1|0|}450|441|}
{2010212001|XXGvertex_oport_oport|725|0|1175|0|{9|log|}441|451|}
{2010006001|XXGobject_psameas_object|726|0|1177|0|{metadata|log_metadata|1|0|}451|441|}
{2010211001|XXGvertex_iport_iport|727|0|1178|0|{0|in|}441|452|}
{2010006001|XXGobject_psameas_object|728|0|1180|0|{metadata|in_metadata|1|0|}452|441|}
{2010601001|XXGgraph_vertex_vertex|729|0|1181|0|{Merge|}251|453|}
{2010212001|XXGvertex_oport_oport|730|0|1183|0|{0|out|}453|454|}
{2010213001|XXGoport_dst_flow|731|0|1185|0|{0|}454|264|}
{2010211001|XXGvertex_iport_iport|732|0|1186|0|{0|in|}453|455|}
{2010214001|XXGiport_src_flow|733|0|1188|0|{0|}455|262|}
{2010007001|XXGobject_proto_object|734|0|1189|0|{}453|456|}
{2010212001|XXGvertex_oport_oport|735|0|1191|0|{0|out|}456|457|}
{2010006001|XXGobject_psameas_object|736|0|1193|0|{metadata|out_metadata|1|0|}457|456|}
{2010211001|XXGvertex_iport_iport|737|0|1194|0|{0|in|}456|458|}
{2010006001|XXGobject_psameas_object|738|0|1196|0|{metadata|in_metadata|1|0|}458|456|}
{2010212001|XXGvertex_oport_oport|739|0|1197|0|{0|source|}251|459|}
{2010216002|XXGoport_binding_oport|740|0|1199|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9943|}459|269|}
{2010212001|XXGvertex_oport_oport|741|0|1200|0|{1|clean|}251|460|}
{2010216002|XXGoport_binding_oport|742|0|1202|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9948|}460|275|}
{2010212001|XXGvertex_oport_oport|743|0|1203|0|{2|lookup|}251|461|}
{2010216002|XXGoport_binding_oport|744|0|1205|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9953|}461|424|}
{2010211001|XXGvertex_iport_iport|745|0|1206|0|{0|in0|}251|462|}
{2010215002|XXGiport_binding_iport|746|0|1208|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9955|}462|440|}
{2010601001|XXGgraph_vertex_vertex|747|0|1209|0|{Reformat|}1|463|}
{2010212001|XXGvertex_oport_oport|748|0|1211|0|{0|out0|}463|464|}
{2010213001|XXGoport_dst_flow|749|0|1213|0|{0|}464|15|}
{2010212001|XXGvertex_oport_oport|750|0|1214|0|{1|reject0|}463|465|}
{2010212001|XXGvertex_oport_oport|751|0|1216|0|{2|error0|}463|466|}
{2010212001|XXGvertex_oport_oport|752|0|1218|0|{3|log|}463|467|}
{2010211001|XXGvertex_iport_iport|753|0|1220|0|{0|in|}463|468|}
{2010214001|XXGiport_src_flow|754|0|1222|0|{0|}468|19|}
{2010007001|XXGobject_proto_object|755|0|1223|0|{}463|469|}
{2010212001|XXGvertex_oport_oport|756|0|1225|0|{0|out0|}469|470|}
{2010006001|XXGobject_psameas_object|757|0|1227|0|{metadata|out0_metadata|1|0|}470|469|}
{2010006001|XXGobject_psameas_object|758|0|1228|0|{transform0|transform0|1|0|}470|469|}
{2010212001|XXGvertex_oport_oport|759|0|1229|0|{1|reject0|}469|471|}
{2010006001|XXGobject_psameas_object|760|0|1231|0|{metadata|reject0_metadata|1|0|}471|469|}
{2010212001|XXGvertex_oport_oport|761|0|1232|0|{2|error0|}469|472|}
{2010006001|XXGobject_psameas_object|762|0|1234|0|{metadata|error0_metadata|1|0|}472|469|}
{2010212001|XXGvertex_oport_oport|763|0|1235|0|{3|log|}469|473|}
{2010006001|XXGobject_psameas_object|764|0|1237|0|{metadata|log_metadata|1|0|}473|469|}
{2010211001|XXGvertex_iport_iport|765|0|1238|0|{0|in|}469|474|}
{2010006001|XXGobject_psameas_object|766|0|1240|0|{metadata|in_metadata|1|0|}474|469|}
{2010006001|XXGobject_psameas_object|767|0|1241|0|{Layout|Layout|0|0|}463|475|}
{2010211001|XXGvertex_iport_iport|768|0|1243|0|{0|write|}475|476|}
{2010214001|XXGiport_src_flow|769|0|1245|0|{0|}476|477|}
{2010006001|XXGobject_psameas_object|770|0|1247|0|{in_metadata|read_metadata|0|0|}463|138|}
{2010006001|XXGobject_psameas_object|771|0|1248|0|{out0_metadata|in1_metadata|0|0|}463|478|}
{2010212001|XXGvertex_oport_oport|772|0|1250|0|{0|out|}478|479|}
{2010213001|XXGoport_dst_flow|773|0|1252|0|{0|}479|477|}
{2010212001|XXGvertex_oport_oport|774|0|1253|0|{1|reject0|}478|480|}
{2010212001|XXGvertex_oport_oport|775|0|1255|0|{2|reject1|}478|481|}
{2010212001|XXGvertex_oport_oport|776|0|1257|0|{3|error0|}478|482|}
{2010212001|XXGvertex_oport_oport|777|0|1259|0|{4|error1|}478|483|}
{2010212001|XXGvertex_oport_oport|778|0|1261|0|{5|log|}478|484|}
{2010211001|XXGvertex_iport_iport|779|0|1263|0|{0|in0|}478|485|}
{2010214001|XXGiport_src_flow|780|0|1265|0|{0|}485|486|}
{2010211001|XXGvertex_iport_iport|781|0|1267|0|{1|in1|}478|487|}
{2010006001|XXGobject_psameas_object|782|0|1269|0|{Layout|Layout|0|0|}478|475|}
{2010006001|XXGobject_psameas_object|783|0|1270|0|{in0_metadata|write_metadata|0|0|}478|475|}
{2010006001|XXGobject_psameas_object|784|0|1271|0|{out_metadata|write_metadata|0|0|}478|475|}
{2010006001|XXGobject_psameas_object|785|0|1272|0|{reject0_metadata|write_metadata|0|0|}478|475|}
{2010006001|XXGobject_psameas_object|786|0|1273|0|{reject0_metadata|read_metadata|0|0|}463|138|}
{2010601001|XXGgraph_vertex_vertex|787|0|1274|0|{get_read_db_multi|}1|488|}
{2010604001|XXGgraph_flow_flow|788|0|1276|0|{Flow_1|}488|489|}
{2010604001|XXGgraph_flow_flow|789|0|1278|0|{Flow_10|}488|490|}
{2010604001|XXGgraph_flow_flow|790|0|1280|0|{Flow_11|}488|491|}
{2010604001|XXGgraph_flow_flow|791|0|1282|0|{Flow_2|}488|50|}
{2010604001|XXGgraph_flow_flow|792|0|1283|0|{Flow_3|}488|492|}
{2010604001|XXGgraph_flow_flow|793|0|1285|0|{Flow_4|}488|45|}
{2010604001|XXGgraph_flow_flow|794|0|1286|0|{Flow_5|}488|493|}
{2010604001|XXGgraph_flow_flow|795|0|1288|0|{Flow_6|}488|494|}
{2010604001|XXGgraph_flow_flow|796|0|1290|0|{Flow_7|}488|495|}
{2010604001|XXGgraph_flow_flow|797|0|1292|0|{Flow_8|}488|496|}
{2010604001|XXGgraph_flow_flow|798|0|1294|0|{Flow_9|}488|497|}
{2010601001|XXGgraph_vertex_vertex|799|0|1296|0|{Bugfix_Reformat_clean_hex_values|}488|43|}
{2010601001|XXGgraph_vertex_vertex|800|0|1297|0|{Get_Job_Log|}488|498|}
{2010211001|XXGvertex_iport_iport|801|0|1299|0|{0|write|}498|499|}
{2010214001|XXGiport_src_flow|802|0|1301|0|{0|}499|489|}
{2010601001|XXGgraph_vertex_vertex|803|0|1302|0|{Normalize_Add_Job_ID_Record_Count|}488|500|}
{2010212001|XXGvertex_oport_oport|804|0|1304|0|{0|out|}500|501|}
{2010212001|XXGvertex_oport_oport|805|0|1306|0|{1|reject|}500|502|}
{2010212001|XXGvertex_oport_oport|806|0|1308|0|{2|error|}500|503|}
{2010212001|XXGvertex_oport_oport|807|0|1310|0|{3|log|}500|504|}
{2010213001|XXGoport_dst_flow|808|0|1312|0|{0|}504|493|}
{2010211001|XXGvertex_iport_iport|809|0|1313|0|{0|in|}500|505|}
{2010214001|XXGiport_src_flow|810|0|1315|0|{0|}505|496|}
{2010006001|XXGobject_psameas_object|811|0|1316|0|{in_metadata|out0_metadata|0|0|}500|43|}
{2010006001|XXGobject_psameas_object|812|0|1317|0|{out_metadata|out0_metadata|0|0|}500|43|}
{2010006001|XXGobject_psameas_object|813|0|1318|0|{reject_metadata|out0_metadata|0|0|}500|43|}
{2010601001|XXGgraph_vertex_vertex|814|0|1319|0|{Optional_Partition_by_Key|}488|506|}
{2010212001|XXGvertex_oport_oport|815|0|1321|0|{0|out|}506|507|}
{2010213001|XXGoport_dst_flow|816|0|1323|0|{0|}507|491|}
{2010211001|XXGvertex_iport_iport|817|0|1324|0|{0|in|}506|508|}
{2010214001|XXGiport_src_flow|818|0|1326|0|{0|}508|497|}
{2010006001|XXGobject_psameas_object|819|0|1327|0|{in_metadata|out0_metadata|0|0|}506|43|}
{2010006001|XXGobject_psameas_object|820|0|1328|0|{out_metadata|out0_metadata|0|0|}506|43|}
{2010601001|XXGgraph_vertex_vertex|821|0|1329|0|{Optional_Sort|}488|509|}
{2010212001|XXGvertex_oport_oport|822|0|1331|0|{0|out|}509|510|}
{2010213001|XXGoport_dst_flow|823|0|1333|0|{0|}510|496|}
{2010211001|XXGvertex_iport_iport|824|0|1334|0|{0|in|}509|511|}
{2010214001|XXGiport_src_flow|825|0|1336|0|{0|}511|490|}
{2010006001|XXGobject_psameas_object|826|0|1337|0|{in_metadata|out0_metadata|0|0|}509|43|}
{2010006001|XXGobject_psameas_object|827|0|1338|0|{out_metadata|out0_metadata|0|0|}509|43|}
{2010601001|XXGgraph_vertex_vertex|828|0|1339|0|{Repartition_Locally_if_Needed|}488|512|}
{2010212001|XXGvertex_oport_oport|829|0|1341|0|{0|out|}512|513|}
{2010213001|XXGoport_dst_flow|830|0|1343|0|{0|}513|494|}
{2010211001|XXGvertex_iport_iport|831|0|1344|0|{0|in|}512|514|}
{2010214001|XXGiport_src_flow|832|0|1346|0|{0|}514|492|}
{2010006001|XXGobject_psameas_object|833|0|1347|0|{in_metadata|out0_metadata|0|0|}512|43|}
{2010006001|XXGobject_psameas_object|834|0|1348|0|{out_metadata|out0_metadata|0|0|}512|43|}
{2010601001|XXGgraph_vertex_vertex|835|0|1349|0|{Replicate_input_layout|}488|515|}
{2010212001|XXGvertex_oport_oport|836|0|1351|0|{0|out|}515|516|}
{2010213001|XXGoport_dst_flow|837|0|1353|0|{0|}516|492|}
{2010213001|XXGoport_dst_flow|838|0|1354|0|{1|}516|497|}
{2010211001|XXGvertex_iport_iport|839|0|1355|0|{0|in|}515|517|}
{2010214001|XXGiport_src_flow|840|0|1357|0|{0|}517|45|}
{2010006001|XXGobject_psameas_object|841|0|1358|0|{Layout|Layout|0|0|}515|51|}
{2010006001|XXGobject_psameas_object|842|0|1359|0|{in_metadata|out0_metadata|0|0|}515|43|}
{2010006001|XXGobject_psameas_object|843|0|1360|0|{out_metadata|out0_metadata|0|0|}515|43|}
{2010601001|XXGgraph_vertex_vertex|844|0|1361|0|{Replicate_output_layout|}488|518|}
{2010212001|XXGvertex_oport_oport|845|0|1363|0|{0|out|}518|519|}
{2010213001|XXGoport_dst_flow|846|0|1365|0|{0|}519|490|}
{2010211001|XXGvertex_iport_iport|847|0|1366|0|{0|in|}518|520|}
{2010214001|XXGiport_src_flow|848|0|1368|0|{0|}520|494|}
{2010214001|XXGiport_src_flow|849|0|1369|0|{1|}520|495|}
{2010006001|XXGobject_psameas_object|850|0|1370|0|{Layout|Layout|0|0|}518|509|}
{2010006001|XXGobject_psameas_object|851|0|1371|0|{in_metadata|out0_metadata|0|0|}518|43|}
{2010006001|XXGobject_psameas_object|852|0|1372|0|{out_metadata|out0_metadata|0|0|}518|43|}
{2010601001|XXGgraph_vertex_vertex|853|0|1373|0|{Rollup_Job_Info|}488|521|}
{2010212001|XXGvertex_oport_oport|854|0|1375|0|{0|out|}521|522|}
{2010213001|XXGoport_dst_flow|855|0|1377|0|{0|}522|489|}
{2010212001|XXGvertex_oport_oport|856|0|1378|0|{1|reject|}521|523|}
{2010212001|XXGvertex_oport_oport|857|0|1380|0|{2|error|}521|524|}
{2010212001|XXGvertex_oport_oport|858|0|1382|0|{3|log|}521|525|}
{2010211001|XXGvertex_iport_iport|859|0|1384|0|{0|in|}521|526|}
{2010214001|XXGiport_src_flow|860|0|1386|0|{0|}526|493|}
{2010006001|XXGobject_psameas_object|861|0|1387|0|{Layout|Layout|0|0|}521|498|}
{2010006001|XXGobject_psameas_object|862|0|1388|0|{in_metadata|log_metadata|0|0|}521|500|}
{2010006001|XXGobject_psameas_object|863|0|1389|0|{out_metadata|write_metadata|0|0|}521|498|}
{2010006001|XXGobject_psameas_object|864|0|1390|0|{reject_metadata|log_metadata|0|0|}521|500|}
{2010601001|XXGgraph_vertex_vertex|865|0|1391|0|{dummy_replicate|}488|527|}
{2010212001|XXGvertex_oport_oport|866|0|1393|0|{0|out|}527|528|}
{2010213001|XXGoport_dst_flow|867|0|1395|0|{0|}528|495|}
{2010211001|XXGvertex_iport_iport|868|0|1396|0|{0|in|}527|529|}
{2010214001|XXGiport_src_flow|869|0|1398|0|{0|}529|491|}
{2010006001|XXGobject_psameas_object|870|0|1399|0|{Layout|Layout|0|0|}527|509|}
{2010006001|XXGobject_psameas_object|871|0|1400|0|{in_metadata|out0_metadata|0|0|}527|43|}
{2010006001|XXGobject_psameas_object|872|0|1401|0|{out_metadata|out0_metadata|0|0|}527|43|}
{2010601001|XXGgraph_vertex_vertex|873|0|1402|0|{read_db|}488|51|}
{2010212001|XXGvertex_oport_oport|874|0|1403|0|{0|out0|}488|530|}
{2010216002|XXGoport_binding_oport|875|0|1405|0|{.5|1.0|{12|837000|269000|857000|269000|967000|269000|967000|294000|967000|294000|987000|294000|}7170|}530|501|}
{2010213001|XXGoport_dst_flow|876|0|1406|0|{0|}530|21|}
{2010007001|XXGobject_proto_object|877|0|1407|0|{}488|531|}
{2010604001|XXGgraph_flow_flow|878|0|1409|0|{Flow_1|}531|532|}
{2010604001|XXGgraph_flow_flow|879|0|1411|0|{Flow_10|}531|533|}
{2010604001|XXGgraph_flow_flow|880|0|1413|0|{Flow_11|}531|534|}
{2010604001|XXGgraph_flow_flow|881|0|1415|0|{Flow_2|}531|535|}
{2010604001|XXGgraph_flow_flow|882|0|1417|0|{Flow_3|}531|536|}
{2010604001|XXGgraph_flow_flow|883|0|1419|0|{Flow_4|}531|537|}
{2010604001|XXGgraph_flow_flow|884|0|1421|0|{Flow_5|}531|538|}
{2010604001|XXGgraph_flow_flow|885|0|1423|0|{Flow_6|}531|539|}
{2010604001|XXGgraph_flow_flow|886|0|1425|0|{Flow_7|}531|540|}
{2010604001|XXGgraph_flow_flow|887|0|1427|0|{Flow_8|}531|541|}
{2010604001|XXGgraph_flow_flow|888|0|1429|0|{Flow_9|}531|542|}
{2010601001|XXGgraph_vertex_vertex|889|0|1431|0|{Bugfix_Reformat_clean_hex_values|}531|543|}
{2010212001|XXGvertex_oport_oport|890|0|1433|0|{0|out0|}543|544|}
{2010213001|XXGoport_dst_flow|891|0|1435|0|{0|}544|537|}
{2010212001|XXGvertex_oport_oport|892|0|1436|0|{1|reject0|}543|545|}
{2010212001|XXGvertex_oport_oport|893|0|1438|0|{2|error0|}543|546|}
{2010212001|XXGvertex_oport_oport|894|0|1440|0|{3|log|}543|547|}
{2010211001|XXGvertex_iport_iport|895|0|1442|0|{0|in|}543|548|}
{2010214001|XXGiport_src_flow|896|0|1444|0|{0|}548|535|}
{2010007001|XXGobject_proto_object|897|0|1445|0|{}543|549|}
{2010212001|XXGvertex_oport_oport|898|0|1447|0|{0|out0|}549|550|}
{2010006001|XXGobject_psameas_object|899|0|1449|0|{metadata|out0_metadata|1|0|}550|549|}
{2010006001|XXGobject_psameas_object|900|0|1450|0|{transform0|transform0|1|0|}550|549|}
{2010212001|XXGvertex_oport_oport|901|0|1451|0|{1|reject0|}549|551|}
{2010006001|XXGobject_psameas_object|902|0|1453|0|{metadata|reject0_metadata|1|0|}551|549|}
{2010212001|XXGvertex_oport_oport|903|0|1454|0|{2|error0|}549|552|}
{2010006001|XXGobject_psameas_object|904|0|1456|0|{metadata|error0_metadata|1|0|}552|549|}
{2010212001|XXGvertex_oport_oport|905|0|1457|0|{3|log|}549|553|}
{2010006001|XXGobject_psameas_object|906|0|1459|0|{metadata|log_metadata|1|0|}553|549|}
{2010211001|XXGvertex_iport_iport|907|0|1460|0|{0|in|}549|554|}
{2010006001|XXGobject_psameas_object|908|0|1462|0|{metadata|in_metadata|1|0|}554|549|}
{2010006001|XXGobject_psameas_object|909|0|1463|0|{reject0_metadata|out0_metadata|0|0|}543|543|}
{2010601001|XXGgraph_vertex_vertex|910|0|1464|0|{Get_Job_Log|}531|555|}
{2010211001|XXGvertex_iport_iport|911|0|1466|0|{0|write|}555|556|}
{2010214001|XXGiport_src_flow|912|0|1468|0|{0|}556|532|}
{2010007001|XXGobject_proto_object|913|0|1469|0|{}555|557|}
{2010211001|XXGvertex_iport_iport|914|0|1471|0|{0|write|}557|558|}
{2010006001|XXGobject_psameas_object|915|0|1473|0|{metadata|write_metadata|1|0|}558|557|}
{2010601001|XXGgraph_vertex_vertex|916|0|1474|0|{Normalize_Add_Job_ID_Record_Count|}531|559|}
{2010212001|XXGvertex_oport_oport|917|0|1476|0|{0|out|}559|560|}
{2010212001|XXGvertex_oport_oport|918|0|1478|0|{1|reject|}559|561|}
{2010212001|XXGvertex_oport_oport|919|0|1480|0|{2|error|}559|562|}
{2010212001|XXGvertex_oport_oport|920|0|1482|0|{3|log|}559|563|}
{2010213001|XXGoport_dst_flow|921|0|1484|0|{0|}563|538|}
{2010211001|XXGvertex_iport_iport|922|0|1485|0|{0|in|}559|564|}
{2010214001|XXGiport_src_flow|923|0|1487|0|{0|}564|541|}
{2010007001|XXGobject_proto_object|924|0|1488|0|{}559|565|}
{2010212001|XXGvertex_oport_oport|925|0|1490|0|{0|out|}565|566|}
{2010006001|XXGobject_psameas_object|926|0|1492|0|{metadata|out_metadata|1|0|}566|565|}
{2010212001|XXGvertex_oport_oport|927|0|1493|0|{1|reject|}565|567|}
{2010006001|XXGobject_psameas_object|928|0|1495|0|{metadata|reject_metadata|1|0|}567|565|}
{2010212001|XXGvertex_oport_oport|929|0|1496|0|{2|error|}565|568|}
{2010006001|XXGobject_psameas_object|930|0|1498|0|{metadata|error_metadata|1|0|}568|565|}
{2010212001|XXGvertex_oport_oport|931|0|1499|0|{3|log|}565|569|}
{2010006001|XXGobject_psameas_object|932|0|1501|0|{metadata|log_metadata|1|0|}569|565|}
{2010211001|XXGvertex_iport_iport|933|0|1502|0|{0|in|}565|570|}
{2010006001|XXGobject_psameas_object|934|0|1504|0|{metadata|in_metadata|1|0|}570|565|}
{2010006001|XXGobject_psameas_object|935|0|1505|0|{transform|NORMALIZE_XFR_FILE|1|0|}559|531|}
{2010601001|XXGgraph_vertex_vertex|936|0|1506|0|{Optional_Partition_by_Key|}531|571|}
{2010212001|XXGvertex_oport_oport|937|0|1508|0|{0|out|}571|572|}
{2010213001|XXGoport_dst_flow|938|0|1510|0|{0|}572|534|}
{2010211001|XXGvertex_iport_iport|939|0|1511|0|{0|in|}571|573|}
{2010214001|XXGiport_src_flow|940|0|1513|0|{0|}573|542|}
{2010007001|XXGobject_proto_object|941|0|1514|0|{}571|574|}
{2010212001|XXGvertex_oport_oport|942|0|1516|0|{0|out|}574|575|}
{2010006001|XXGobject_psameas_object|943|0|1518|0|{metadata|out_metadata|1|0|}575|574|}
{2010211001|XXGvertex_iport_iport|944|0|1519|0|{0|in|}574|576|}
{2010006001|XXGobject_psameas_object|945|0|1521|0|{metadata|in_metadata|1|0|}576|574|}
{2010006001|XXGobject_psameas_object|946|0|1522|0|{Layout|Layout|0|0|}571|577|}
{2010212001|XXGvertex_oport_oport|947|0|1524|0|{0|out|}577|578|}
{2010213001|XXGoport_dst_flow|948|0|1526|0|{0|}578|536|}
{2010213001|XXGoport_dst_flow|949|0|1527|0|{1|}578|542|}
{2010211001|XXGvertex_iport_iport|950|0|1528|0|{0|in|}577|579|}
{2010214001|XXGiport_src_flow|951|0|1530|0|{0|}579|537|}
{2010007001|XXGobject_proto_object|952|0|1531|0|{}577|580|}
{2010212001|XXGvertex_oport_oport|953|0|1533|0|{0|out|}580|581|}
{2010006001|XXGobject_psameas_object|954|0|1535|0|{metadata|out_metadata|1|0|}581|580|}
{2010211001|XXGvertex_iport_iport|955|0|1536|0|{0|in|}580|582|}
{2010006001|XXGobject_psameas_object|956|0|1538|0|{metadata|in_metadata|1|0|}582|580|}
{2010006001|XXGobject_psameas_object|957|0|1539|0|{key|PARTITION_KEY|1|0|}571|531|}
{2010601001|XXGgraph_vertex_vertex|958|0|1540|0|{Optional_Sort|}531|583|}
{2010212001|XXGvertex_oport_oport|959|0|1542|0|{0|out|}583|584|}
{2010213001|XXGoport_dst_flow|960|0|1544|0|{0|}584|541|}
{2010211001|XXGvertex_iport_iport|961|0|1545|0|{0|in|}583|585|}
{2010214001|XXGiport_src_flow|962|0|1547|0|{0|}585|533|}
{2010007001|XXGobject_proto_object|963|0|1548|0|{}583|586|}
{2010212001|XXGvertex_oport_oport|964|0|1550|0|{0|out|}586|587|}
{2010006001|XXGobject_psameas_object|965|0|1552|0|{metadata|out_metadata|1|0|}587|586|}
{2010211001|XXGvertex_iport_iport|966|0|1553|0|{0|in|}586|588|}
{2010006001|XXGobject_psameas_object|967|0|1555|0|{metadata|in_metadata|1|0|}588|586|}
{2010006001|XXGobject_psameas_object|968|0|1556|0|{key|SORT_KEY|1|0|}583|531|}
{2010601001|XXGgraph_vertex_vertex|969|0|1557|0|{Repartition_Locally_if_Needed|}531|589|}
{2010212001|XXGvertex_oport_oport|970|0|1559|0|{0|out|}589|590|}
{2010213001|XXGoport_dst_flow|971|0|1561|0|{0|}590|539|}
{2010211001|XXGvertex_iport_iport|972|0|1562|0|{0|in|}589|591|}
{2010214001|XXGiport_src_flow|973|0|1564|0|{0|}591|536|}
{2010007001|XXGobject_proto_object|974|0|1565|0|{}589|592|}
{2010212001|XXGvertex_oport_oport|975|0|1567|0|{0|out|}592|593|}
{2010006001|XXGobject_psameas_object|976|0|1569|0|{metadata|out_metadata|1|0|}593|592|}
{2010211001|XXGvertex_iport_iport|977|0|1570|0|{0|in|}592|594|}
{2010006001|XXGobject_psameas_object|978|0|1572|0|{metadata|in_metadata|1|0|}594|592|}
{2010006001|XXGobject_psameas_object|979|0|1573|0|{Layout|Layout|0|0|}589|577|}
{2010601001|XXGgraph_vertex_vertex|980|0|1574|0|{Replicate_input_layout|}531|577|}
{2010601001|XXGgraph_vertex_vertex|981|0|1575|0|{Replicate_output_layout|}531|595|}
{2010212001|XXGvertex_oport_oport|982|0|1577|0|{0|out|}595|596|}
{2010213001|XXGoport_dst_flow|983|0|1579|0|{0|}596|533|}
{2010211001|XXGvertex_iport_iport|984|0|1580|0|{0|in|}595|597|}
{2010214001|XXGiport_src_flow|985|0|1582|0|{0|}597|539|}
{2010214001|XXGiport_src_flow|986|0|1583|0|{1|}597|540|}
{2010007001|XXGobject_proto_object|987|0|1584|0|{}595|598|}
{2010212001|XXGvertex_oport_oport|988|0|1586|0|{0|out|}598|599|}
{2010006001|XXGobject_psameas_object|989|0|1588|0|{metadata|out_metadata|1|0|}599|598|}
{2010211001|XXGvertex_iport_iport|990|0|1589|0|{0|in|}598|600|}
{2010006001|XXGobject_psameas_object|991|0|1591|0|{metadata|in_metadata|1|0|}600|598|}
{2010601001|XXGgraph_vertex_vertex|992|0|1592|0|{Rollup_Job_Info|}531|601|}
{2010212001|XXGvertex_oport_oport|993|0|1594|0|{0|out|}601|602|}
{2010213001|XXGoport_dst_flow|994|0|1596|0|{0|}602|532|}
{2010212001|XXGvertex_oport_oport|995|0|1597|0|{1|reject|}601|603|}
{2010212001|XXGvertex_oport_oport|996|0|1599|0|{2|error|}601|604|}
{2010212001|XXGvertex_oport_oport|997|0|1601|0|{3|log|}601|605|}
{2010211001|XXGvertex_iport_iport|998|0|1603|0|{0|in|}601|606|}
{2010214001|XXGiport_src_flow|999|0|1605|0|{0|}606|538|}
{2010007001|XXGobject_proto_object|1000|0|1606|0|{}601|607|}
{2010212001|XXGvertex_oport_oport|1001|0|1608|0|{0|out|}607|608|}
{2010006001|XXGobject_psameas_object|1002|0|1610|0|{metadata|out_metadata|1|0|}608|607|}
{2010212001|XXGvertex_oport_oport|1003|0|1611|0|{1|reject|}607|609|}
{2010006001|XXGobject_psameas_object|1004|0|1613|0|{metadata|reject_metadata|1|0|}609|607|}
{2010212001|XXGvertex_oport_oport|1005|0|1614|0|{2|error|}607|610|}
{2010006001|XXGobject_psameas_object|1006|0|1616|0|{metadata|error_metadata|1|0|}610|607|}
{2010212001|XXGvertex_oport_oport|1007|0|1617|0|{3|log|}607|611|}
{2010006001|XXGobject_psameas_object|1008|0|1619|0|{metadata|log_metadata|1|0|}611|607|}
{2010211001|XXGvertex_iport_iport|1009|0|1620|0|{0|in|}607|612|}
{2010006001|XXGobject_psameas_object|1010|0|1622|0|{metadata|in_metadata|1|0|}612|607|}
{2010601001|XXGgraph_vertex_vertex|1011|0|1623|0|{dummy_replicate|}531|613|}
{2010212001|XXGvertex_oport_oport|1012|0|1625|0|{0|out|}613|614|}
{2010213001|XXGoport_dst_flow|1013|0|1627|0|{0|}614|540|}
{2010211001|XXGvertex_iport_iport|1014|0|1628|0|{0|in|}613|615|}
{2010214001|XXGiport_src_flow|1015|0|1630|0|{0|}615|534|}
{2010007001|XXGobject_proto_object|1016|0|1631|0|{}613|616|}
{2010212001|XXGvertex_oport_oport|1017|0|1633|0|{0|out|}616|617|}
{2010006001|XXGobject_psameas_object|1018|0|1635|0|{metadata|out_metadata|1|0|}617|616|}
{2010211001|XXGvertex_iport_iport|1019|0|1636|0|{0|in|}616|618|}
{2010006001|XXGobject_psameas_object|1020|0|1638|0|{metadata|in_metadata|1|0|}618|616|}
{2010601001|XXGgraph_vertex_vertex|1021|0|1639|0|{read_db|}531|619|}
{2010401001|XXGvertex_prototype_vertex|1022|0|1641|0|{}619|620|}
{2010212001|XXGvertex_oport_oport|1023|0|1643|0|{0|out0|}620|621|}
{2010006001|XXGobject_psameas_object|1024|0|1645|0|{metadata|out0_metadata|1|0|}621|620|}
{2010212001|XXGvertex_oport_oport|1025|0|1646|0|{0|out0|}619|622|}
{2010213001|XXGoport_dst_flow|1026|0|1648|0|{0|}622|535|}
{2010006001|XXGobject_psameas_object|1027|0|1649|0|{SOURCE_DBMS_UNLOAD_INTERFACE|SOURCE_DBMS_UNLOAD_INTERFACE|1|0|}619|531|}
{2010212001|XXGvertex_oport_oport|1028|0|1650|0|{0|out0|}531|623|}
{2010216002|XXGoport_binding_oport|1029|0|1652|0|{.5|1.0|{12|837000|269000|857000|269000|967000|269000|967000|294000|967000|294000|987000|294000|}7170|}623|560|}
{2010006001|XXGobject_psameas_object|1030|0|1653|0|{CLEANSE_CHARECTERS|CLEANSE_CHARECTERS|1|0|}488|1|}
{2010006001|XXGobject_psameas_object|1031|0|1654|0|{DO_HEX_CLEANUP|DO_HEX_CLEANUP|1|0|}488|1|}
{2010006001|XXGobject_psameas_object|1032|0|1655|0|{PARTITION_KEY|PARTITION_KEY|1|0|}488|1|}
{2010006001|XXGobject_psameas_object|1033|0|1656|0|{SORT_KEY|SORT_KEY|1|0|}488|1|}
{2010601001|XXGgraph_vertex_vertex|1034|0|1657|0|{write_raw_event_log|}1|624|}
{2010604001|XXGgraph_flow_flow|1035|0|1659|0|{Flow_1|}624|477|}
{2010604001|XXGgraph_flow_flow|1036|0|1660|0|{Flow_2|}624|486|}
{2010601001|XXGgraph_vertex_vertex|1037|0|1661|0|{Event_Log_Entry|}624|625|}
{2010212001|XXGvertex_oport_oport|1038|0|1663|0|{0|out|}625|626|}
{2010213001|XXGoport_dst_flow|1039|0|1665|0|{0|}626|486|}
{2010212001|XXGvertex_oport_oport|1040|0|1666|0|{1|error|}625|627|}
{2010212001|XXGvertex_oport_oport|1041|0|1668|0|{2|log|}625|628|}
{2010006001|XXGobject_psameas_object|1042|0|1670|0|{Layout|Layout|0|0|}625|475|}
{2010006001|XXGobject_psameas_object|1043|0|1671|0|{out_metadata|write_metadata|0|0|}625|475|}
{2010601001|XXGgraph_vertex_vertex|1044|0|1672|0|{Fuse|}624|478|}
{2010601001|XXGgraph_vertex_vertex|1045|0|1673|0|{Output_Event_File|}624|475|}
{2010211001|XXGvertex_iport_iport|1046|0|1674|0|{0|in0|}624|629|}
{2010215002|XXGiport_binding_iport|1047|0|1676|0|{.5|.5|{0|}13392|}629|487|}
{2010214001|XXGiport_src_flow|1048|0|1677|0|{0|}629|15|}
{2010007001|XXGobject_proto_object|1049|0|1678|0|{}624|630|}
{2010604001|XXGgraph_flow_flow|1050|0|1680|0|{Flow_1|}630|631|}
{2010604001|XXGgraph_flow_flow|1051|0|1682|0|{Flow_2|}630|632|}
{2010601001|XXGgraph_vertex_vertex|1052|0|1684|0|{Event_Log_Entry|}630|633|}
{2010212001|XXGvertex_oport_oport|1053|0|1686|0|{0|out|}633|634|}
{2010213001|XXGoport_dst_flow|1054|0|1688|0|{0|}634|632|}
{2010212001|XXGvertex_oport_oport|1055|0|1689|0|{1|error|}633|635|}
{2010212001|XXGvertex_oport_oport|1056|0|1691|0|{2|log|}633|636|}
{2010007001|XXGobject_proto_object|1057|0|1693|0|{}633|637|}
{2010212001|XXGvertex_oport_oport|1058|0|1695|0|{0|out|}637|638|}
{2010006001|XXGobject_psameas_object|1059|0|1697|0|{metadata|out_metadata|1|0|}638|637|}
{2010212001|XXGvertex_oport_oport|1060|0|1698|0|{1|error|}637|639|}
{2010006001|XXGobject_psameas_object|1061|0|1700|0|{metadata|error_metadata|1|0|}639|637|}
{2010212001|XXGvertex_oport_oport|1062|0|1701|0|{2|log|}637|640|}
{2010006001|XXGobject_psameas_object|1063|0|1703|0|{metadata|log_metadata|1|0|}640|637|}
{2010601001|XXGgraph_vertex_vertex|1064|0|1704|0|{Fuse|}630|641|}
{2010212001|XXGvertex_oport_oport|1065|0|1706|0|{0|out|}641|642|}
{2010213001|XXGoport_dst_flow|1066|0|1708|0|{0|}642|631|}
{2010212001|XXGvertex_oport_oport|1067|0|1709|0|{1|reject0|}641|643|}
{2010212001|XXGvertex_oport_oport|1068|0|1711|0|{2|reject1|}641|644|}
{2010212001|XXGvertex_oport_oport|1069|0|1713|0|{3|error0|}641|645|}
{2010212001|XXGvertex_oport_oport|1070|0|1715|0|{4|error1|}641|646|}
{2010212001|XXGvertex_oport_oport|1071|0|1717|0|{5|log|}641|647|}
{2010211001|XXGvertex_iport_iport|1072|0|1719|0|{0|in0|}641|648|}
{2010214001|XXGiport_src_flow|1073|0|1721|0|{0|}648|632|}
{2010211001|XXGvertex_iport_iport|1074|0|1722|0|{1|in1|}641|649|}
{2010007001|XXGobject_proto_object|1075|0|1724|0|{}641|650|}
{2010212001|XXGvertex_oport_oport|1076|0|1726|0|{0|out|}650|651|}
{2010006001|XXGobject_psameas_object|1077|0|1728|0|{metadata|out_metadata|1|0|}651|650|}
{2010212001|XXGvertex_oport_oport|1078|0|1729|0|{1|reject0|}650|652|}
{2010006001|XXGobject_psameas_object|1079|0|1731|0|{metadata|reject0_metadata|1|0|}652|650|}
{2010212001|XXGvertex_oport_oport|1080|0|1732|0|{2|reject1|}650|653|}
{2010006001|XXGobject_psameas_object|1081|0|1734|0|{metadata|reject1_metadata|1|0|}653|650|}
{2010212001|XXGvertex_oport_oport|1082|0|1735|0|{3|error0|}650|654|}
{2010006001|XXGobject_psameas_object|1083|0|1737|0|{metadata|error0_metadata|1|0|}654|650|}
{2010212001|XXGvertex_oport_oport|1084|0|1738|0|{4|error1|}650|655|}
{2010006001|XXGobject_psameas_object|1085|0|1740|0|{metadata|error1_metadata|1|0|}655|650|}
{2010212001|XXGvertex_oport_oport|1086|0|1741|0|{5|log|}650|656|}
{2010006001|XXGobject_psameas_object|1087|0|1743|0|{metadata|log_metadata|1|0|}656|650|}
{2010211001|XXGvertex_iport_iport|1088|0|1744|0|{0|in0|}650|657|}
{2010006001|XXGobject_psameas_object|1089|0|1746|0|{metadata|in0_metadata|1|0|}657|650|}
{2010211001|XXGvertex_iport_iport|1090|0|1747|0|{1|in1|}650|658|}
{2010006001|XXGobject_psameas_object|1091|0|1749|0|{metadata|in1_metadata|1|0|}658|650|}
{2010006001|XXGobject_psameas_object|1092|0|1750|0|{reject1_metadata|in1_metadata|0|0|}641|641|}
{2010601001|XXGgraph_vertex_vertex|1093|0|1751|0|{Output_Event_File|}630|659|}
{2010211001|XXGvertex_iport_iport|1094|0|1753|0|{0|write|}659|660|}
{2010214001|XXGiport_src_flow|1095|0|1755|0|{0|}660|631|}
{2010007001|XXGobject_proto_object|1096|0|1756|0|{}659|661|}
{2010211001|XXGvertex_iport_iport|1097|0|1758|0|{0|write|}661|662|}
{2010006001|XXGobject_psameas_object|1098|0|1760|0|{metadata|write_metadata|1|0|}662|661|}
{2010211001|XXGvertex_iport_iport|1099|0|1761|0|{0|in0|}630|663|}
{2010215002|XXGiport_binding_iport|1100|0|1763|0|{.5|.5|{0|}13392|}663|649|}
{2010109001|XXGobject_property_value|1101|0|1764|0|{0|TrackingThumbprint|72|}1|664|}
