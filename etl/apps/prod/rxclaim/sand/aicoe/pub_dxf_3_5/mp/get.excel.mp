@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|529|rel_count|830|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DB_XFR/db_list.xfr";|3|1|Kl|Provides functions and types to use in PDL.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|START_CHANGES_TIME||3|9|FK|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to "", which means include all dates.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|K|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|//setup your project detail in the intermediate pset|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_NAME||3|9|RFK|The fully qualified name of the get source.  This should be all lowercase.|{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_NAME, "[.].*", "") ]|3|9|EFK|The Source System ID for this data source.  Defaults to a value based on the Source Name's Prefix.|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|sample.xlsx|3|2|FK$||{0|}}
{30001002|XXparameter|INPUT_FILE_PATH|$AI_SERIAL_PENDING|3|9|RFK|@{0|}}
{30001002|XXparameter|FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|FILE_LIST:eme|$[ [ vector INPUT_FILE_PATH + "/" + INPUT_FILE_PATTERN ] ]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST:sandbox|$[directory_listing(INPUT_FILE_PATH, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|READ_EXCEL_FLOW_INPUT_FORMAT|Both|15|2|FK$|// Specify filename, xls_content, or both.  If only filename is // specified, then Read_Excel_Flow will read the specified filename. // If only xls_content is specified, then Read_Excel_Flow will process // the xls_content as though it contained the contents of an xls or // xlsx file.  If both filename and xls_content are specified, then
// Read_Excel_Flow will process the xls_content, and tag each output // record with the specified filename. |{3|Both|XLS_Content|Filename|}}
{30001002|XXparameter|READ_EXCEL_FLOW_JAVA_OPTIONS|-Xmx4768m|3|2|FK$|Options passed directly to Java, e.g. '-Xmx512m'|{0|}}
{30001002|XXparameter|READ_EXCEL_FLOW_DATE_FORMAT|'MM/DD/YYYY'|3|2|FK$|If empty, Excel dates are output in decimal format.  Otherwise, Excel dates are output using the specified date format. The following subset of DML datetime formats is supported:
YYYY, MM, DD, HH24, MI, SS, N[NN].  For example, 'YYYY-MM-DD HH24:MI:SS.NNN'.|{0|}}
{30001002|XXparameter|HEADER_ROW_FLAG|1|1|2|RFK$|Excel row number containing column names.  Rows up to and including header-row will not be read.  Set to 0 if there is no header row|{0|}}
{30001002|XXparameter|SHEET_INDEX|1|1|9|FK|Index of sheet in Excel, starting at 1|{0|}}
{30001002|XXparameter|DO_SOURCE|0|13|9|RFK|True or False: Whether or not to produce a clean file.  If True, then no source file will be produced.|{0|}}
{30001002|XXparameter|DO_CLEAN|0|13|9|RFK|True or False: Whether or not to produce a clean file.  If True, then no source file will be produced.|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|13|9|RFK|True or False: Whether or not to produce a lookup file.  If True, then no source file will be produced.|{0|}}
{30001002|XXparameter|GET_DML_FILE|$[ AI_DML + "/get." + SOURCE_SYSTEM + "/get." + SOURCE_NAME + ".dml" ]|3|9|RK|@{0|}}
{30001002|XXparameter|GET_DML|$[ expand_type(read_type(GET_DML_FILE)) ]|3|9|RK|The record format for the source data.|{0|}}
{30001002|XXparameter|SOURCE_TYPE_NAME|source_$[ re_replace(SOURCE_NAME, "[^a-zA-Z0-9_]", "_") ]_t|3|9|RK|The type name to use in the source DML.|{0|}}
{30001002|XXparameter|ADDITIONAL_FIELDS_DML|record
end|3|9|RFK|Additional DML to be appended to the DMF header and prepended to the get DML.  Defaults to an empty record, which is ignored.|{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|/* Do Not Edit.  This file is generated automatically by combining
 * "$AI_DML/dxf_header.dml", any "$ADDITIONAL_FIELDS_DML", and
 * "$AI_DML/source.$SOURCE_SYSTEM/source.$SOURCE_NAME.dml".
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
        remove_fields(GET_DML, "line")))))
];

metadata type = $SOURCE_TYPE_NAME;|3|9|K|The input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_NAME + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_NAME + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_NAME + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_NAME + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|SOURCE_FILE_CLEAN_FLAG|1|13|2|RFK$|@{0|}}
{30001002|XXparameter|CLEANSE_CHARECTERS||3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_EXPRESSION||20|2|FK$|Filter expression|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS_KEY||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info(LOOKUP_FIELDS_KEY) ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_DML|$[
if ( not DO_LOOKUP )
  ""
else
  add_fields(
    "record\\nend",
    for ( let f in record_info(GET_DML_PLUS_HEADER) ) :
      if ( LOOKUP_FIELD_NAME_VEC == [vector] or f.name member LOOKUP_FIELD_NAME_VEC )
        f)
]|3|9|RFK|The record format for any lookup output file.  Defaults to the input DML, plus a DMF header, reduced to the fields specified in the lookup fields key.|{0|}}
{30001002|XXparameter|OUTPUT_DML|$[if ( DO_SOURCE )
  SOURCE_DML
 else if ( DO_CLEAN )
  CLEAN_DML
 else
  LOOKUP_DML
]|3|9|FK|The record format of the source, clean, or lookup output, whichever is first used.|{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/lookup.dataset_id.txt|3|9|FK||{0|}}
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
\{source_record_active_cd; source_update_dttm descending; source_sequence_number descending; source_create_dttm descending; dxf_src_dataset_id descending; dxf_src_rec_cnt descending; drop_record; $END_DATE_FIELD_NAME\}
// source_record_active_cd                                    // A (Source Active) before I (Source Inactive)
// source_update_dttm descending                              // Records updated later over earlier
// source_sequence_number descending                          // Records created later over earlier
// source_create_dttm descending                              // Records created later over earlier
// dxf_src_dataset_id descending; dxf_src_rec_cnt descending  // Records delivered later over earlier
// drop_record                                                // 0 (Inserts) over 1 (Deletes)
// $END_DATE_FIELD_NAME                                       // If all else fails, favor records that expire earlier|3|9|RFK|\{field_1; ...; field_n\}: The prefered extra dedup sort key.  Only fields that are present in the target table will be used.|{0|}}
{30001002|XXparameter|EXTRA_DEDUP_SORT_KEY|$[ make_key(
  for ( let k in key_info(DEFAULT_DEDUP_SORT_KEY) ) :
    if ( k.field_name member LOOKUP_FIELD_NAME_VEC )
      k)
]|3|9|FK|\{field_1; ...; field_n\}: A key with the extra fields to sort on before deduping by the effective natural key (the first record is kept).  Defaults to a standard set of keys from DEFAULT_DEDUP_SORT_KEY, if those fields are present.|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ make_key(vector_concat(
    key_info(re_replace(LOOKUP_KEY, " interval_bottom;.*", "\}")),
    key_info(EXTRA_DEDUP_SORT_KEY)))
]|3|9|RK|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|___ACE_Template_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|OUTPUT_DML_FILE|$[
if ( DO_SOURCE )
  SOURCE_DML_FILE 
else if ( DO_CLEAN )
  CLEAN_DML_FILE
else
  LOOKUP_DML_FILE
]|3|9|RK|@{0|}}
{30001002|XXparameter|ACE_AVAILABLE_PATTERNS|$[
begin
  result :: vector_concat([vector (string(long))""],vector_sort_dedup_first(for (let string("") file_nm in directory_listing(INPUT_FILE_PATH, INPUT_FILE_PATTERN)) : re_replace(file_nm, "[0-9]", "?")));
/*vector_concat(
    [vector (string(long))""],
    vector_sort_dedup_first(
      vector_concat([vector],
        if ( INPUT_FILE_PATTERN == "" ) [vector] else [vector INPUT_FILE_PATTERN],
                directory_listing(INPUT_FILE_PATH, "*.xls*"))));*/
end
]|3|9|RK|A vector of all the file patterns available in the Source Pending System directory, plus any existing source pattern.  The list begins with an empty entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|ACE_AVAILABLE_PATTERNS_DISPLAY_NAMES|$[ for ( let p in ACE_AVAILABLE_PATTERNS ) :
    if ( p == "" )
      "Please Select a Pattern."
    else
      p
]|3|9|RK|A vector of all the display names of the file patterns available in the Source Pending System directory, plus any existing pattern.  The list begins with a display entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:eme|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_NAME + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:sandbox|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_NAME + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:eme|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_NAME + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:sandbox|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_NAME + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|AB_ALLOW_GRAPH_IN_COMPONENT|true|13|9|EK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|1360000|714000|0|get.excel|Sripavan Pulikonda|Created 2/1/2017 7:31:56 AM|1|100|0||6||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1435000|694000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|1|1|}Job 'get.excel' Execution Status Report


Job "get.excel" Execution started at Wednesday, August 01, 2018 14:54:53
Job completed successfully at Wednesday, August 01, 2018 14:55:22

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:28
Run performed by user Anwar.Parvez
Total data moved through all flows: 0 records (-1 bytes)
Total CPU time (all processes): 1 seconds
Average CPU utilization across all nodes: 0.00 percent
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_TEMP/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL/get.$SOURCE_SYSTEM" \\
  "$INPUT_FILE_PATH/processed"

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

# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$SOURCE_SYSTEM/get.$SOURCE_NAME.summary.log $AB_REPORT"
||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@HT2||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|0|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@SOURCE_NAME - $SOURCE_NAME  |438000|46000|0|0|0|0|14855|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@[ Optional Custom Filter Cond ]|558000|140000|0|0|0|0|14832|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@[ Assign values for DXF header fields ]|802000|144000|0|0|0|0|14834|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@[ Optional Cleanse Hex values ]|333000|140000|0|0|0|0|14833|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|32768|100|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14869|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.5|{0|}14826|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{8|181000|119000|201000|119000|239000|119000|260000|119000|}14880|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}14852|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}14828|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.1744185984134674|{0|}14882|2577|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14853|530|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}14884|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.1428571492433548|{0|}14850|2577|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}14876|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.17365269362926483|{0|}14846|529|}}
{2010501005|XXGpvertex|24|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|commandline|ksh -c -e '

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
   touch -m 666 "$d"
fi
'|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[length_of(FILE_LIST) == 0]|3|9||@{0|}}
}}@1|Run Program|246000|420500|0|0|0|0|14887|Create zero byte Clean/Source/Lookup if no files present to process|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|25|0|49|0|{@{}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|26|0|51|0|{@{}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|27|0|53|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
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
{2010203004|XXGoport|28|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|29|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010503005|XXGfvertex|30|0|61|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.excel.$SOURCE_NAME.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.excel.$SOURCE_NAME.job_log.dat|3|2|$|@{0|}}
}}@0|@865000|577500|872000|443000|56000|50000|14885|Get Job Log|Ab Initio Software||1|2050|0||6||33153|-1|-1|}}
{2010202004|XXGiport|31|0|63|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|32|0|66|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|33|0|68|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|34|0|71|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|commandline|ksh -c -e 'find $INPUT_FILE_PATH/ -type f -name "$INPUT_FILE_PATTERN" \| grep -v processed \| xargs -I \{\} mv \{\} $INPUT_FILE_PATH/processed/'|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ if ( SOURCE_FILE_CLEAN_FLAG != 0  ) 1 else 0 ]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
}}@1|@568000|429000|1049000|30000|156000|145000|14888|Moves files to processed directory|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|35|0|73|0|{@{}@1204000|99000|11000|11000|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|36|0|75|0|{@{}@1039000|99000|11000|11000|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|37|0|77|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|commandline||16|2|RFO$|Command line of UNIX or Windows program to execute|{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052550|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|38|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|39|0|82|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|40|0|85|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";
include "/~$PUB_DXF_XFR/standardize.xfr";
include "/~$PUB_DXF_XFR/sys_id.xfr";
include "/~$PUB_DXF_XFR/dataset_id.xfr";

let long dxf_src_sys_id = name_to_sys_id($"SOURCE_LOGICAL_NAME");
let long dxf_src_dataset_id = if ( this_partition() == 0 ) get_dataset_id($"DATASET_ID_LOOKUP_PATH") else 0;  /* The index into the Source Process table. */
let long stride = number_of_partitions();
let string(unsigned integer(1)) dxf_src_file_name = $"INPUT_FILE_PATH" + "/" + $[string_representation(FILE_LIST[0])];
let long dxf_src_rec_cnt = this_partition() - stride + 1; /* The number of records processed from this source.  Also used as a record number on each source record. */
let start_time = now();

/* Always output 1 record.  Also increments the record counter. */
out :: length(in) =
begin
  if(dxf_src_file_name == in.filename) 
        dxf_src_rec_cnt =  dxf_src_rec_cnt + stride;
  else 
  begin
  dxf_src_file_name = in.filename;
  dxf_src_rec_cnt = 1;
  end;
  out :: 1;
end;

/* Add Source ID and Record Number.  Remove trailing blanks from strings. */
out :: normalize(in, index) =
begin
//  out.dxf_prcs_log_sk :1: dxf_prcs_log_sk;
  out.(*, name == "dxf_src_sys_id") :1: dxf_src_sys_id;
  out.(*, name == "dxf_src_dataset_id") :2: dxf_src_dataset_id;
  out.(*, name == "dxf_src_rec_cnt") :3: dxf_src_rec_cnt;
  out.(*, name == "dxf_src_file_name") :4: in.filename;
  out.(*, form == "string") :5: string_trim_no_empty(in.*);
  out.* :: in.*;
end;

/* Write the Source ID and Record Count to the log. */
log_event :: final_log_output() =
begin
  let dxf_job_event_text_t job_info = [record
    dxf_src_dataset_id  dxf_src_dataset_id,  // Only set in partition 0.
    dxf_src_file_name   dxf_src_file_name,
    dxf_src_rec_cnt     dxf_src_rec_cnt,
    dataset_start_dttm  start_time,
    dataset_end_dttm    now(),
  ];

  log_event.event_type :: "DXF Job Log: 0"; // We need to include a fake dataset ID for the rollup key that follows.
  log_event.event_text :: job_info.as_event_text();
end;|3|9|j|@{0|}}
{30001002|XXparameter|reject_threshold|Never abort|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|$[ OUTPUT_DML ]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@824952|175000|496000|56000|145000|126000|14831|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|41|0|87|0|{@{}@640000|114000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|42|0|90|0|{@{}@514000|181000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|43|0|92|0|{@{}@564000|181000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|44|0|94|0|{@{}@614000|181000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|45|0|97|0|{@{}@486000|114000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|46|0|100|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1360816304|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|47|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|48|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|49|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|50|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|52|0|117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|sheet_header_row||3|8|=|@{0|}}
{30001002|XXparameter|dateFormat||3|8|=|@{0|}}
{30001002|XXparameter|JAVA_HOME|$JAVA_HOME|3|2|$|@{0|}}
{30001002|XXparameter|java_options||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types(add_fields("record\\nend", [vector make_field("filename", "string('\\\\t')"), make_field("sheet", "string('\\\\t')")]), GET_DML)]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$[begin

result ::    if( READ_EXCEL_FLOW_INPUT_FORMAT == "Both" )
                        add_fields(source_type = "utf8 record\\nend", field_vec = [vector make_field ("filename","string('\\\\t')"), make_field("xls_content","void(big endian integer(4))")])
                else if( READ_EXCEL_FLOW_INPUT_FORMAT == "XLS_Content" )
                        add_field(source_type = "utf8 record\\nend", field_name = "xls_content", field_type = "void(big endian integer(4))")
                else if( READ_EXCEL_FLOW_INPUT_FORMAT == "Filename" )
                        add_field(source_type = "utf8 record\\nend", field_name = "filename", field_type = "string('\\\\t')");
end]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Excel/Read_Excel_Flow.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|sheet_selection|by-index|3|1|l|@{0|}}
{30001002|XXparameter|sheet_index||3|8|=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@157000|184000|271000|75000|109000|113000|14870|Read Excel Data|Ab Initio Software|Built-in 2.13.m8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|53|0|119|0|{@{}@379000|114000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|54|0|122|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|55|0|124|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|56|0|126|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|57|0|128|0|{@{}@261000|114000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|58|0|131|0|{Read Excel content from input flow|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Read_Excel_Flow|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/excel-connector.ksh|3|2|H$||{0|}}
{30001002|XXparameter|sheet_selection|by-index|15|1|Fl||{3|by-name|by-index|all|}}
{30001002|XXparameter|sheet_selection.display_name|sheet-selection|3|9|P|@{0|}}
{30001002|XXparameter|sheet_selection.update_clauses|update_value all|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name|Sheet1|3|2|RFK$|Name of sheet in Excel|{0|}}
{30001002|XXparameter|sheet_name.display_name|sheet-name|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name.keyword|sheet-name|3|9|P|@{0|}}
{30001002|XXparameter|sheet_name.condition|param sheet-selection by-name|3|15|P?|@{0|}}
{30001002|XXparameter|sheet_index|1|1|2|RFK$|Index of sheet in Excel, starting at 1|{0|}}
{30001002|XXparameter|sheet_index.display_name|sheet-index|3|9|P|@{0|}}
{30001002|XXparameter|sheet_index.keyword|sheet-index|3|9|P|@{0|}}
{30001002|XXparameter|sheet_index.condition|param sheet-selection by-index|3|15|P?|@{0|}}
{30001002|XXparameter|sheet_header_row|0|1|2|RFK$|Excel row number containing column names.  Rows up to and including header-row will not be read.  Set to 0 if there is no header row|{0|}}
{30001002|XXparameter|sheet_header_row.display_name|sheet-header-row|3|9|P|@{0|}}
{30001002|XXparameter|sheet_header_row.keyword|sheet-header-row|3|9|P|@{0|}}
{30001002|XXparameter|sheet_header_row.condition|param sheet-selection by-*|3|15|P?|@{0|}}
{30001002|XXparameter|utf8|True|13|1|FKl|Use UTF-8 encoding for output (recommended).  Otherwise, encoding will be locale specific.|{0|}}
{30001002|XXparameter|utf8.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|dateFormat||3|2|FK$|If empty, Excel dates are output in decimal format.  Otherwise, Excel dates are output using the specified date format. The following subset of DML datetime formats is supported:
YYYY, MM, DD, HH24, MI, SS, N[NN].  For example, 'YYYY-MM-DD HH24:MI:SS.NNN'.|{0|}}
{30001002|XXparameter|record_delimiter|\\0|3|2|FK$|Delimiter of last field or record.|{0|}}
{30001002|XXparameter|record_delimiter.display_name|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.keyword|record-delimiter|3|9|P|@{0|}}
{30001002|XXparameter|record_delimiter.update_clauses|update_value \\n|3|9|P|@{0|}}
{30001002|XXparameter|old_style_quoting|False|13|1|Fl|Quote quotes, tabs, and newlines for backwards compatibility with ReadSeparatedValues|{0|}}
{30001002|XXparameter|old_style_quoting.display_name|old-style-quoting|3|9|P|@{0|}}
{30001002|XXparameter|old_style_quoting.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting|True|13|1|Kl|inverse of old-style-quoting|{0|}}
{30001002|XXparameter|no_quoting.display_name|no-quoting|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting.keyword|no-quoting|3|9|P|@{0|}}
{30001002|XXparameter|no_quoting.condition|param old-style-quoting False|3|15|P?|@{0|}}
{30001002|XXparameter|formula_results|True|13|1|FKl|Extract formula results instead of the formula itself|{0|}}
{30001002|XXparameter|formula_results.display_name|formula-results|3|9|P|@{0|}}
{30001002|XXparameter|formula_results.keyword|formula-results|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation|never|15|1|FKl|Use scientific notation for output of numbers|{3|never|sometimes|always|}}
{30001002|XXparameter|scientific_notation.display_name|scientific-notation|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation.keyword|scientific-notation|3|9|P|@{0|}}
{30001002|XXparameter|scientific_notation.update_clauses|update_value sometimes|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows|True|13|1|FKl|Ignore rows that have no cell values|{0|}}
{30001002|XXparameter|skip_empty_rows.display_name|skip-empty-rows|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows.keyword|skip-empty-rows|3|9|P|@{0|}}
{30001002|XXparameter|skip_empty_rows.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|use_format|False|13|1|FKl|Extract format information associated with the cell. Use gendml after changing this.|{0|}}
{30001002|XXparameter|use_format.display_name|use-format|3|9|P|@{0|}}
{30001002|XXparameter|use_format.keyword|use-format|3|9|P|@{0|}}
{30001002|XXparameter|use_format.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes|*|3|2|RFK$|Format attributes of the cell. See $AB_COMPONENTS/Interchange/Excel/excel_utils.dml for syntax.|{0|}}
{30001002|XXparameter|format_attributes.display_name|format-attributes|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes.keyword|format-attributes|3|9|P|@{0|}}
{30001002|XXparameter|format_attributes.condition|param use-format True|3|15|P?|@{0|}}
{30001002|XXparameter|abort_on_format_error|True|13|1|RFKl|If false, ignore errors from cell format attributes|{0|}}
{30001002|XXparameter|abort_on_format_error.display_name|abort-on-format-error|3|9|P|@{0|}}
{30001002|XXparameter|abort_on_format_error.keyword|abort-on-format-error|3|9|P|@{0|}}
{30001002|XXparameter|abort_on_format_error.condition|param use-format True|3|15|P?|@{0|}}
{30001002|XXparameter|JAVA_HOME||3|2|FK$|Home directory for Java installation; if unset, $JAVA_HOME is used.|{0|}}
{30001002|XXparameter|command_options||3|2|FK$|Advanced options that are only required in unusual situations|{0|}}
{30001002|XXparameter|command_options.display_name|command-options|3|9|P|@{0|}}
{30001002|XXparameter|command_options.keyword|command-options|3|9|P|@{0|}}
{30001002|XXparameter|java_options|-Xmx768m|3|2|FK$|Options passed directly to Java, e.g. '-Xmx512m'|{0|}}
{30001002|XXparameter|java_options.display_name|java-options|3|9|P|@{0|}}
{30001002|XXparameter|java_options.keyword|java-options|3|9|P|@{0|}}
{30001002|XXparameter|readit|-read|3|2|$||{0|}}
{30001002|XXparameter|print_filename|-print-filename|3|2|$||{0|}}
{30001002|XXparameter|print_filename.display_name|print-filename|3|9|P|@{0|}}
{30001002|XXparameter|print_dml|-print-dml|3|2|$||{0|}}
{30001002|XXparameter|print_dml.display_name|print-dml|3|9|P|@{0|}}
{30001002|XXparameter|cmd_dml|excel-connector.ksh|3|2|$||{0|}}
{30001002|XXparameter|cmd_dml_params|readit positional print-dml positional print-filename positional sheet-name keyword sheet-index keyword sheet-header-row keyword utf8 keyword record-delimiter keyword use-format keyword format-attributes keyword JAVA_HOME keyword command-options keyword java-options keyword|3|2|$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl|Record Format|{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use*|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* 99.0 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version :2.12.2.m9|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword2|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword2.condition|version 2.13:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|file_missing_keyword file-missing sheet_missing_keyword sheet-missing invalid_excel_file_keyword invalid-excel-file limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp|3|2|$||{0|}}
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
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 2.16:|3|15|P?|@{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
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
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052546|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: in = "// Specify filename, xls_content, or both.  If only filename is
// specified, then Read_Excel_Flow will read the specified filename.
// If only xls_content is specified, then Read_Excel_Flow will process
// the xls_content as though it contained the contents of an xls or
// xlsx file.  If both filename and xls_content are specified, then
// Read_Excel_Flow will process the xls_content, and tag each output
// record with the specified filename.
utf8 record
  string('\\\\t') filename = ''; 
  void(big endian integer(4)) xls_content = '';
end"
metadata type: out = "utf8 record string('\\\\t') filename = ''; string('\\\\t') sheet; string('\\\\0') line; end"
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|59|0|133|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=|Record Format|{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|60|0|136|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|61|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|62|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|63|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|64|0|155|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_NAME.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1347913|399047|641000|235000|56000|50000|14883|Optional: Clean File|Ab Initio Software||1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|65|0|157|0|{@{}@631000|254000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|66|0|160|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|67|0|162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|68|0|165|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  out.(*,form=="string" && name != "newline") :1: if(not is_blank($"CLEANSE_CHARECTERS")) re_replace(string_and_hex_replace(in.*), $"CLEANSE_CHARECTERS", "");
  out.(*,form=="string" && name != "newline") :2: string_and_hex_replace(in.*);
  //out.(*,name == "newline") :3: "\\n";
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|condition|$[not is_blank(CLEANSE_CHARECTERS)]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|350000|175000|0|0|0|0|14825|Optional: Clean Hex Values|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|69|0|167|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|70|0|170|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|71|0|172|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|72|0|174|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|73|0|176|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|74|0|179|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|75|0|181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|76|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|77|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|78|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|79|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|80|0|201|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr||3|8|=|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPRESSION)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@591000|175500|42000|177000|109000|107000|14827|Optional: Data Filter|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|81|0|203|0|{@{}@150000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|82|0|206|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|83|0|208|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|84|0|210|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|85|0|212|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|86|0|214|0|{@{}@32000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|217|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|operation1|optional integer(8) select_out::select(in)|3|2|H$|Use this instead of the select_expr parameter when use_package is true.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: deselect = out
metadata type: out = deselect
metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out
metadata type: deselect = in
metadata type: in = deselect|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|88|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|89|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|90|0|225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|91|0|228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|92|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|93|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|94|0|243|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ DO_SOURCE ]|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_NAME.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1317913|219047|646000|120000|56000|50000|14851|Optional: Source File|Ab Initio Software||1|10|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|95|0|245|0|{@{}@636000|139000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|96|0|248|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|97|0|250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|98|0|253|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ DO_LOOKUP ]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("file:$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM/lookup.$SOURCE_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1317913|584047|646000|375000|56000|50000|14847|Optional: Unsorted Lookup|Ab Initio Software||1|2050|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|99|0|255|0|{@{}@636000|394000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|100|0|258|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1364510553|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|101|0|260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|102|0|263|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1086000|215000|77000|115000|50000|41000|14854|PBRR|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|103|0|265|0|{@{}@126000|129000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|104|0|268|0|{@{}@67000|129000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|105|0|271|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|106|0|273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|107|0|276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|108|0|283|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";


let long task_start_time = now();
let long task_end_time = 0;
let string("")[int] file_list = $[string_representation(FILE_LIST)];

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
  out.dataset_name :: file_list[0];
  out.dxf_src_rec_cnt :: max(job_info.dxf_src_rec_cnt);
  out.type_of_input :: 'excel';
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_path :: $"INPUT_FILE_PATH";
  out.file_size :: file_information($"INPUT_FILE_PATH" + "/" + file_list[0]).size;
  out.file_modified_dttm :: file_information($"INPUT_FILE_PATH" + "/" + file_list[0]).modified;
  out.sql_script :: "";
end;|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|max_core|$\{AI_GRAPH_MAX_CORE_MIN\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|834000|389000|0|0|0|0|14878|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|109|0|285|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|110|0|288|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|111|0|290|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|112|0|292|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|113|0|294|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|114|0|297|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|115|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|116|0|302|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|117|0|305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|118|0|308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|119|0|311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|120|0|318|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|$[ length_of(FILE_LIST) ]|3|9||@{0|}}
{30001002|XXparameter|transform|$[
begin

let string(integer(4)) v_transform = make_transform(xfr_name = "create", input_vec = [vector make_arg("index")] , local_vec = [vector make_local(local_name = "filenames", local_type = "string(int)[int]", local_init = string_representation(FILE_LIST) ) ]);

result ::    if( READ_EXCEL_FLOW_INPUT_FORMAT == "Both" )
                        add_rules(xfr = v_transform, rule_vec = [vector make_rule(lhs = "out.filename", rhs = "string_concat('" + INPUT_FILE_PATH + "', '/', filenames[index - 1])"), 
                                                                                               make_rule(lhs = "out.xls_content", rhs = "read_file(string_concat('" + INPUT_FILE_PATH + "', '/', filenames[index - 1]))") ] )
                else if( READ_EXCEL_FLOW_INPUT_FORMAT == "XLS_Content" )
                        add_rules(xfr = v_transform, rule_vec = [vector make_rule(lhs = "out.xls_content", rhs = "read_file(string_concat('" + INPUT_FILE_PATH + "', '/', filenames[index - 1]))") ] ) 
                else if( READ_EXCEL_FLOW_INPUT_FORMAT == "Filename" ) 
                        add_rules(xfr = v_transform, rule_vec = [vector make_rule(lhs = "out.filename", rhs = "string_concat('" + INPUT_FILE_PATH + "', '/', filenames[index - 1])") ] ) ;

end]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[FILE_LIST != [vector]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@25000|198000|111000|89000|60000|60000|14881|Trigger|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|121|0|320|0|{@{}@170000|114000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|122|0|323|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|123|0|325|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|124|0|327|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
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
{30001002|XXparameter|mpcmodtime|1364510557|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|125|0|329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|126|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|127|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|128|0|340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@145000|30000|0|0|0|0|14886|Version Log|Sripavan Pulikonda|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|860000|401000|3|}}
{2010240003|XXGlegend|129|0|342|0|{@{}@Summary:

1. This graph reads an Excel file as Input.
2. This process creates SOURCE / CLEAN files in AI_MFS location and also applies compression based on option provided.
3. And creates LOOKUP files either in AI_SERIAL_LOOKUP or AI_MFS_LOOKUP location and also applies compression and partitions if key is provided.|15000|42500|0|0|0|0|1526|}}
{2010242002|XXGface|130|0|344|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|131|0|346|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|135000|0|0|0|0|1524|}}
{2010242002|XXGface|132|0|348|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|133|0|350|0|{@{}@Version            Date                                            Author                                               Change Description
1.0                    Jun 02, 2016                Sripavan Pulikonda (Exusia)                         Initial Version
2.0                    Jun 12, 2018                Manav Jindal                                                    Added Read Excel Flow - Input Flow Options
                                                                                                                                                1. Filename
                                                                                                                                                2. XLS Content
                                                                                                                                                3. Both (Default)
3.0                    Dec 27, 2018              Manav Jindal                                                    Upgraded to 3.5.1 version|18000|229000|0|0|0|0|1529|}}
{2010242002|XXGface|134|0|352|0|{@{}@Calibri|0|100|0|}}
{2010600005|XXGgraph|135|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_NAME.dups.dat.gz|3|9||@{0|}}
}}@0|@1031000|369500|0|0|892000|502000|14845|prepare output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|1|}}
{2010240003|XXGlegend|136|0|356|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|137|0|358|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|138|0|360|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|139|0|362|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|140|0|364|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|141|0|366|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|142|0|368|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|143|0|370|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|144|0|372|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9927|17|}}
{2010210004|XXGflow|145|0|374|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9924|17|}}
{2010210004|XXGflow|146|0|376|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9928|1043|}}
{2010210004|XXGflow|147|0|378|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9930|2065|}}
{2010210004|XXGflow|148|0|380|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|149|0|382|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9929|19|}}
{2010210004|XXGflow|150|0|384|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9923|17|}}
{2010210004|XXGflow|151|0|386|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|152|0|388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|390|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|154|0|392|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|155|0|398|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|156|0|400|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|157|0|402|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|158|0|408|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9931|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|159|0|410|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|160|0|412|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|161|0|414|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|162|0|416|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|163|0|418|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|164|0|420|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|165|0|422|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|166|0|424|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|167|0|426|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|168|0|428|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|169|0|430|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6805|17|}}
{2010210004|XXGflow|170|0|432|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6803|20|}}
{2010210004|XXGflow|171|0|434|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6806|17|}}
{2010210004|XXGflow|172|0|436|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|173|0|438|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|174|0|440|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|175|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6807|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|176|0|444|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|177|0|447|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|178|0|449|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|179|0|451|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|180|0|453|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|181|0|455|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|182|0|458|0|{|{}@0|@472000|414500|494000|435000|56000|50000|9918|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|183|0|460|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|184|0|467|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|185|0|469|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|186|0|472|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|187|0|474|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9926|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|188|0|476|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|189|0|479|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|190|0|482|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|191|0|485|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|192|0|487|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|193|0|489|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|194|0|491|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|195|0|493|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|196|0|495|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|197|0|497|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|198|0|499|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|199|0|509|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|200|0|511|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|201|0|513|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|202|0|519|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|203|0|521|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|204|0|524|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|205|0|526|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|206|0|528|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|207|0|530|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|208|0|537|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|209|0|539|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|210|0|542|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|211|0|544|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|212|0|546|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|213|0|548|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|214|0|555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6804|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|215|0|557|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|216|0|560|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|217|0|566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|218|0|568|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|219|0|571|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|220|0|577|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|221|0|579|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|222|0|581|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|223|0|583|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|224|0|585|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|225|0|587|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|226|0|589|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|227|0|592|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|228|0|594|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|229|0|596|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|230|0|598|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|231|0|600|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|232|0|602|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|233|0|605|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|234|0|607|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|235|0|609|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|236|0|611|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|237|0|616|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|238|0|618|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|239|0|621|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|240|0|624|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|241|0|627|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|242|0|630|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|243|0|635|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|244|0|639|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|245|0|645|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|246|0|647|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|247|0|650|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|248|0|655|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|249|0|657|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|250|0|659|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|251|0|667|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|252|0|669|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|253|0|672|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|254|0|677|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|255|0|681|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|256|0|685|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|257|0|689|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|258|0|693|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$SOURCE_SYSTEM/$STEP.$SOURCE_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1464875888|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@260000|290678|0|0|892000|502000|0|prepare_output|||1|100|0||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|259|0|695|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|260|0|697|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|261|0|699|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|262|0|701|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|263|0|703|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|264|0|705|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|265|0|707|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|266|0|709|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|267|0|711|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9909|17|}}
{2010210004|XXGflow|268|0|713|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|269|0|715|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9910|1043|}}
{2010210004|XXGflow|270|0|717|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9913|2065|}}
{2010210004|XXGflow|271|0|719|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|272|0|721|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9911|19|}}
{2010210004|XXGflow|273|0|723|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|274|0|725|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|275|0|727|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|276|0|729|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|277|0|731|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|278|0|734|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|279|0|736|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|280|0|739|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|281|0|742|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|282|0|744|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|283|0|746|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|284|0|749|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|285|0|751|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|286|0|754|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|287|0|757|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9||@{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9||@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9||@{0|}}
{30001002|XXparameter|condition|$[ DO_LOOKUP and LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|3|1|l|@{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|$|@{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|$|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9912|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|288|0|759|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|289|0|761|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|290|0|763|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|291|0|765|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|292|0|767|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|293|0|769|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|294|0|771|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|295|0|773|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|296|0|775|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|297|0|777|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|298|0|779|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|299|0|781|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|300|0|783|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|301|0|785|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|302|0|787|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|303|0|789|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|304|0|791|0|{|{}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|305|0|793|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|306|0|796|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|307|0|798|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|308|0|800|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|309|0|802|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|310|0|804|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|311|0|807|0|{|{}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|312|0|809|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|313|0|812|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|314|0|814|0|{|{}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|315|0|816|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|316|0|818|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|317|0|821|0|{|{}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|318|0|823|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|319|0|826|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|320|0|828|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|321|0|830|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|322|0|832|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|323|0|835|0|{|{}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|324|0|837|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|325|0|840|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|326|0|842|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|327|0|844|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|328|0|846|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|329|0|849|0|{|{}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|330|0|851|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|331|0|854|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|332|0|857|0|{|{}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|333|0|859|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|334|0|862|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|335|0|865|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|336|0|867|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|337|0|869|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|338|0|871|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|339|0|873|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|340|0|875|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|341|0|877|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|342|0|880|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|343|0|882|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|344|0|884|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|345|0|886|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|346|0|888|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|347|0|890|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|348|0|893|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|349|0|895|0|{|{}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|350|0|897|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|351|0|899|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|352|0|902|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|353|0|904|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|354|0|907|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|355|0|910|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|356|0|913|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|357|0|916|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|358|0|921|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|359|0|925|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|360|0|929|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{30001002|XXparameter|EFFECTIVE_DATE_DIRECTION|$[ CHECK_KEYS + if ( END_DATE_FIELD_NAME == "" ) "ascending" else "descending" ]|3|9|RK|The direction to sort the effective date field, if any.  This is based on whether we have an end date or not.|{0|}}
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
{30001002|XXparameter|mpcmodtime|1462805142|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@87336|104500|0|0|884000|534000|0|dedup_and_fix_intervals|||1|100|-1||9||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|884000|533000|3|}}
{2010240003|XXGlegend|361|0|931|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|362|0|933|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|363|0|935|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|364|0|937|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|365|0|939|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|366|0|941|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|367|0|943|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|368|0|945|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|369|0|947|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|370|0|949|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|371|0|951|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|372|0|953|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|373|0|955|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|374|0|957|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|375|0|959|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|376|0|961|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|377|0|963|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|378|0|965|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|379|0|968|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|380|0|970|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|381|0|972|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|382|0|974|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|383|0|976|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|384|0|979|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|385|0|981|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|386|0|984|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|387|0|987|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|388|0|990|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|389|0|993|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|390|0|996|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|391|0|999|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|392|0|1001|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|393|0|1004|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|394|0|1006|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|395|0|1008|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|396|0|1011|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|397|0|1015|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|398|0|1017|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|399|0|1019|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|400|0|1022|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|401|0|1024|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|402|0|1027|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|403|0|1030|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
{30001002|XXparameter|transform|/* Find records with the same data values and abutting or overlapping effective dates. */
out :: key_change(in1, in2) =
begin
  out :1: ( in1.$END_DATE_FIELD_NAME < datetime_add(in2.$EFFECTIVE_DATE_FIELD_NAME, 0, 
                                                    microseconds = -($ADJACENT_INTERVAL_MICROSECONDS)) or  // 1) There is a gap, ...
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
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|404|0|1032|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|405|0|1035|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|406|0|1037|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|407|0|1039|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|408|0|1041|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|409|0|1044|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|410|0|1046|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|411|0|1049|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|412|0|1052|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|413|0|1055|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|414|0|1058|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|415|0|1061|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|/* Remember the current and previous effective dates. */
type temporary_type =
record
  $EFFECTIVE_DATE_TYPE cur_eff_dttm = NULL;
  $EFFECTIVE_DATE_TYPE prev_eff_dttm = NULL;
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
  out.cur_eff_dttm :: in.$EFFECTIVE_DATE_FIELD_NAME;
end;


/* Within a given Natural Key group, for overlapping dates, this sets the End Date/Time to the following Effective Date/Time, minus 1 second. 
This does *not* fill in gaps, however. */
out :: finalize(temp, in) =
begin
  // This works because records are sorted in descending order by Effective Date.
  out.$END_DATE_FIELD_NAME :1: if ( temp.prev_eff_dttm <= in.$END_DATE_FIELD_NAME )
    datetime_add(temp.prev_eff_dttm, 0, microseconds = -($ADJACENT_INTERVAL_MICROSECONDS));  // This is skipped for the first record in NK group.
  out.$END_DATE_FIELD_NAME :: in.$END_DATE_FIELD_NAME;  // So the first (latest) record keeps its original End Date.
  out.* :: in.*;
end;|3|9|j|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|416|0|1063|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|417|0|1066|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|418|0|1068|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|419|0|1070|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|420|0|1072|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|421|0|1075|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{2010203004|XXGoport|422|0|1077|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|423|0|1080|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|424|0|1083|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|425|0|1086|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|426|0|1089|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|427|0|1092|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|428|0|1094|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|429|0|1097|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|430|0|1100|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|431|0|1102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|432|0|1105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|433|0|1108|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|434|0|1110|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|435|0|1113|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|436|0|1116|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|437|0|1118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|438|0|1121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|439|0|1124|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|440|0|1126|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|441|0|1128|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|442|0|1130|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|443|0|1132|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|444|0|1134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|13|3|2|$|@{0|}}
{30001002|XXparameter|transform|/* Returns a record from its arguments. */
out :: rec(key, value, eff_dt, end_dt) =
begin
  out :: [record
    nk1     key,
    nk2     "",
    value   value,
    eff_dt  eff_dt,
    end_dt  end_dt,
  ];
end;


/* Creates a new test record for each given index. */
out :: create(index) =
begin
  out :: switch ( index )
    case  1: rec("dup_keys", "v1", 1, 2);
    case  2: rec("dup_keys", "v2", 1, 2);
    case  3: rec("adjacent", "same", 1, 2);
    case  4: rec("adjacent", "same", 3, 4);
    case  5: rec("overlap-diff", "v1", 1, 4);
    case  6: rec("overlap-diff", "v2", 3, 4);
    case  7: rec("overlap-same", "same", 1, 4);
    case  8: rec("overlap-same", "same", 3, 4);
    case  9: rec("overlap-mix", "same", 1, 10);
    case 10: rec("overlap-mix", "same", 3, 9);
    case 11: rec("overlap-mix", "diff", 5, 8);
    case 12: rec("overlap-mix", "same", 7, 10);
    case 13: rec("overlap-mix", "same", 9, 10);
    default: force_error("Bad index");
  end;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\|") nk1;
  string("\|>>\|") nk2;
  string("\|") value;
  date("YYYY-MM-DD")("\|") eff_dt;
  date("YYYY-MM-DD")("\|\\n") end_dt;
end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|445|0|1136|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|446|0|1139|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|447|0|1141|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|448|0|1143|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|num_records||1|2|RFO$|Number of records to generate|{0|}}
{30001002|XXparameter|num_records.display_name|num-records|3|9|P|@{0|}}
{30001002|XXparameter|transform|out::create(index)=begin out :: random_value(); end;|8|1|FOl|DML function|{0|}}
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
{30001002|XXparameter|Layout|@9|2|RF$||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|449|0|1145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|450|0|1148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|451|0|1151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|452|0|1154|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|453|0|1156|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|454|0|1158|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|write_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|455|0|1160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|456|0|1163|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|457|0|1165|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|458|0|1168|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|459|0|1170|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|460|0|1172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|461|0|1175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|462|0|1178|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|463|0|1180|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|464|0|1182|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|465|0|1185|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|466|0|1187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|467|0|1190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|468|0|1193|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/~stdout|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/~stdout", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|469|0|1195|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|470|0|1198|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403542|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|471|0|1200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|472|0|1203|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|473|0|1206|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|474|0|1209|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|475|0|1212|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|476|0|1215|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|477|0|1218|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|478|0|1221|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|479|0|1223|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|480|0|1226|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|481|0|1228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|482|0|1232|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|483|0|1234|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|484|0|1237|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|485|0|1240|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|486|0|1242|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|487|0|1245|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|488|0|1248|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|489|0|1250|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|490|0|1252|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|491|0|1256|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|492|0|1258|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|493|0|1261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|494|0|1264|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|495|0|1266|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|496|0|1269|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|497|0|1272|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|498|0|1275|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|499|0|1277|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|500|0|1279|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|501|0|1281|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|502|0|1283|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|503|0|1285|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|504|0|1287|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|505|0|1289|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|506|0|1291|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|507|0|1293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|508|0|1297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|509|0|1301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|510|0|1305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|511|0|1308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|512|0|1311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|513|0|1314|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|514|0|1317|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|515|0|1320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|516|0|1323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|517|0|1326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|518|0|1329|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|519|0|1331|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|520|0|1334|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|521|0|1337|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|522|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|523|0|1342|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|524|0|1345|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|525|0|1348|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|526|0|1351|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|527|0|1354|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|528|0|1357|0|{@{}@{1|331332|}}}
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
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_1|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_16|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_17|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_18|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_2|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_3|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_4|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_5|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_6|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_7|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_9|}1|23|}
{2010601001|XXGgraph_vertex_vertex|23|0|46|0|{Create_zero_byte_Clean_Source_Lookup_if_no_files_present_to_process|}1|24|}
{2010212001|XXGvertex_oport_oport|24|0|48|0|{0|out|}24|25|}
{2010211001|XXGvertex_iport_iport|25|0|50|0|{0|in|}24|26|}
{2010007001|XXGobject_proto_object|26|0|52|0|{}24|27|}
{2010212001|XXGvertex_oport_oport|27|0|54|0|{0|out|}27|28|}
{2010006001|XXGobject_psameas_object|28|0|56|0|{metadata|out_metadata|1|0|}28|27|}
{2010211001|XXGvertex_iport_iport|29|0|57|0|{0|in|}27|29|}
{2010006001|XXGobject_psameas_object|30|0|59|0|{metadata|in_metadata|1|0|}29|27|}
{2010601001|XXGgraph_vertex_vertex|31|0|60|0|{Get_Job_Log|}1|30|}
{2010211001|XXGvertex_iport_iport|32|0|62|0|{0|write|}30|31|}
{2010214001|XXGiport_src_flow|33|0|64|0|{0|}31|20|}
{2010007001|XXGobject_proto_object|34|0|65|0|{}30|32|}
{2010211001|XXGvertex_iport_iport|35|0|67|0|{0|write|}32|33|}
{2010006001|XXGobject_psameas_object|36|0|69|0|{metadata|write_metadata|1|0|}33|32|}
{2010601001|XXGgraph_vertex_vertex|37|0|70|0|{Moves_files_to_processed_directory|}1|34|}
{2010212001|XXGvertex_oport_oport|38|0|72|0|{0|out|}34|35|}
{2010211001|XXGvertex_iport_iport|39|0|74|0|{0|in|}34|36|}
{2010007001|XXGobject_proto_object|40|0|76|0|{}34|37|}
{2010212001|XXGvertex_oport_oport|41|0|78|0|{0|out|}37|38|}
{2010006001|XXGobject_psameas_object|42|0|80|0|{metadata|out_metadata|1|0|}38|37|}
{2010211001|XXGvertex_iport_iport|43|0|81|0|{0|in|}37|39|}
{2010006001|XXGobject_psameas_object|44|0|83|0|{metadata|in_metadata|1|0|}39|37|}
{2010601001|XXGgraph_vertex_vertex|45|0|84|0|{Normalize_Add_Job_ID_Record_Count|}1|40|}
{2010212001|XXGvertex_oport_oport|46|0|86|0|{0|out|}40|41|}
{2010213001|XXGoport_dst_flow|47|0|88|0|{0|}41|16|}
{2010212001|XXGvertex_oport_oport|48|0|89|0|{1|reject|}40|42|}
{2010212001|XXGvertex_oport_oport|49|0|91|0|{2|error|}40|43|}
{2010212001|XXGvertex_oport_oport|50|0|93|0|{3|log|}40|44|}
{2010213001|XXGoport_dst_flow|51|0|95|0|{0|}44|22|}
{2010211001|XXGvertex_iport_iport|52|0|96|0|{0|in|}40|45|}
{2010214001|XXGiport_src_flow|53|0|98|0|{0|}45|17|}
{2010007001|XXGobject_proto_object|54|0|99|0|{}40|46|}
{2010212001|XXGvertex_oport_oport|55|0|101|0|{0|out|}46|47|}
{2010006001|XXGobject_psameas_object|56|0|103|0|{metadata|out_metadata|1|0|}47|46|}
{2010212001|XXGvertex_oport_oport|57|0|104|0|{1|reject|}46|48|}
{2010006001|XXGobject_psameas_object|58|0|106|0|{metadata|reject_metadata|1|0|}48|46|}
{2010212001|XXGvertex_oport_oport|59|0|107|0|{2|error|}46|49|}
{2010006001|XXGobject_psameas_object|60|0|109|0|{metadata|error_metadata|1|0|}49|46|}
{2010212001|XXGvertex_oport_oport|61|0|110|0|{3|log|}46|50|}
{2010006001|XXGobject_psameas_object|62|0|112|0|{metadata|log_metadata|1|0|}50|46|}
{2010211001|XXGvertex_iport_iport|63|0|113|0|{0|in|}46|51|}
{2010006001|XXGobject_psameas_object|64|0|115|0|{metadata|in_metadata|1|0|}51|46|}
{2010006001|XXGobject_psameas_object|65|0|116|0|{in_metadata|out_metadata|0|0|}40|52|}
{2010212001|XXGvertex_oport_oport|66|0|118|0|{0|out|}52|53|}
{2010213001|XXGoport_dst_flow|67|0|120|0|{0|}53|13|}
{2010212001|XXGvertex_oport_oport|68|0|121|0|{1|reject|}52|54|}
{2010212001|XXGvertex_oport_oport|69|0|123|0|{2|error|}52|55|}
{2010212001|XXGvertex_oport_oport|70|0|125|0|{3|log|}52|56|}
{2010211001|XXGvertex_iport_iport|71|0|127|0|{0|in|}52|57|}
{2010214001|XXGiport_src_flow|72|0|129|0|{0|}57|15|}
{2010007001|XXGobject_proto_object|73|0|130|0|{}52|58|}
{2010212001|XXGvertex_oport_oport|74|0|132|0|{0|out|}58|59|}
{2010006001|XXGobject_psameas_object|75|0|134|0|{metadata|out_metadata|1|0|}59|58|}
{2010212001|XXGvertex_oport_oport|76|0|135|0|{1|reject|}58|60|}
{2010006001|XXGobject_psameas_object|77|0|137|0|{metadata|reject_metadata|1|0|}60|58|}
{2010212001|XXGvertex_oport_oport|78|0|138|0|{2|error|}58|61|}
{2010006001|XXGobject_psameas_object|79|0|140|0|{metadata|error_metadata|1|0|}61|58|}
{2010212001|XXGvertex_oport_oport|80|0|141|0|{3|log|}58|62|}
{2010006001|XXGobject_psameas_object|81|0|143|0|{metadata|log_metadata|1|0|}62|58|}
{2010211001|XXGvertex_iport_iport|82|0|144|0|{0|in|}58|63|}
{2010006001|XXGobject_psameas_object|83|0|146|0|{metadata|in_metadata|1|0|}63|58|}
{2010006001|XXGobject_psameas_object|84|0|147|0|{Layout|Layout|0|0|}52|40|}
{2010006001|XXGobject_psameas_object|85|0|148|0|{dateFormat|READ_EXCEL_FLOW_DATE_FORMAT|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|86|0|149|0|{java_options|READ_EXCEL_FLOW_JAVA_OPTIONS|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|87|0|150|0|{reject_metadata|in_metadata|0|0|}52|52|}
{2010006001|XXGobject_psameas_object|88|0|151|0|{sheet_header_row|HEADER_ROW_FLAG|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|89|0|152|0|{sheet_index|SHEET_INDEX|1|0|}52|1|}
{2010006001|XXGobject_psameas_object|90|0|153|0|{reject_metadata|out_metadata|0|0|}40|52|}
{2010601001|XXGgraph_vertex_vertex|91|0|154|0|{Optional_Clean_File|}1|64|}
{2010211001|XXGvertex_iport_iport|92|0|156|0|{0|write|}64|65|}
{2010214001|XXGiport_src_flow|93|0|158|0|{0|}65|18|}
{2010007001|XXGobject_proto_object|94|0|159|0|{}64|66|}
{2010211001|XXGvertex_iport_iport|95|0|161|0|{0|write|}66|67|}
{2010006001|XXGobject_psameas_object|96|0|163|0|{metadata|write_metadata|1|0|}67|66|}
{2010601001|XXGgraph_vertex_vertex|97|0|164|0|{Optional_Clean_Hex_Values|}1|68|}
{2010212001|XXGvertex_oport_oport|98|0|166|0|{0|out0|}68|69|}
{2010213001|XXGoport_dst_flow|99|0|168|0|{0|}69|14|}
{2010212001|XXGvertex_oport_oport|100|0|169|0|{1|reject0|}68|70|}
{2010212001|XXGvertex_oport_oport|101|0|171|0|{2|error0|}68|71|}
{2010212001|XXGvertex_oport_oport|102|0|173|0|{3|log|}68|72|}
{2010211001|XXGvertex_iport_iport|103|0|175|0|{0|in|}68|73|}
{2010214001|XXGiport_src_flow|104|0|177|0|{0|}73|13|}
{2010007001|XXGobject_proto_object|105|0|178|0|{}68|74|}
{2010212001|XXGvertex_oport_oport|106|0|180|0|{0|out0|}74|75|}
{2010006001|XXGobject_psameas_object|107|0|182|0|{metadata|out0_metadata|1|0|}75|74|}
{2010006001|XXGobject_psameas_object|108|0|183|0|{transform0|transform0|1|0|}75|74|}
{2010212001|XXGvertex_oport_oport|109|0|184|0|{1|reject0|}74|76|}
{2010006001|XXGobject_psameas_object|110|0|186|0|{metadata|reject0_metadata|1|0|}76|74|}
{2010212001|XXGvertex_oport_oport|111|0|187|0|{2|error0|}74|77|}
{2010006001|XXGobject_psameas_object|112|0|189|0|{metadata|error0_metadata|1|0|}77|74|}
{2010212001|XXGvertex_oport_oport|113|0|190|0|{3|log|}74|78|}
{2010006001|XXGobject_psameas_object|114|0|192|0|{metadata|log_metadata|1|0|}78|74|}
{2010211001|XXGvertex_iport_iport|115|0|193|0|{0|in|}74|79|}
{2010006001|XXGobject_psameas_object|116|0|195|0|{metadata|in_metadata|1|0|}79|74|}
{2010006001|XXGobject_psameas_object|117|0|196|0|{Layout|Layout|0|0|}68|40|}
{2010006001|XXGobject_psameas_object|118|0|197|0|{in_metadata|out_metadata|0|0|}68|52|}
{2010006001|XXGobject_psameas_object|119|0|198|0|{out0_metadata|out_metadata|0|0|}68|52|}
{2010006001|XXGobject_psameas_object|120|0|199|0|{reject0_metadata|out_metadata|0|0|}68|52|}
{2010601001|XXGgraph_vertex_vertex|121|0|200|0|{Optional_Data_Filter|}1|80|}
{2010212001|XXGvertex_oport_oport|122|0|202|0|{0|out|}80|81|}
{2010213001|XXGoport_dst_flow|123|0|204|0|{0|}81|17|}
{2010212001|XXGvertex_oport_oport|124|0|205|0|{1|deselect|}80|82|}
{2010212001|XXGvertex_oport_oport|125|0|207|0|{2|reject|}80|83|}
{2010212001|XXGvertex_oport_oport|126|0|209|0|{3|error|}80|84|}
{2010212001|XXGvertex_oport_oport|127|0|211|0|{4|log|}80|85|}
{2010211001|XXGvertex_iport_iport|128|0|213|0|{0|in|}80|86|}
{2010214001|XXGiport_src_flow|129|0|215|0|{0|}86|14|}
{2010007001|XXGobject_proto_object|130|0|216|0|{}80|87|}
{2010212001|XXGvertex_oport_oport|131|0|218|0|{0|out|}87|88|}
{2010006001|XXGobject_psameas_object|132|0|220|0|{metadata|out_metadata|1|0|}88|87|}
{2010212001|XXGvertex_oport_oport|133|0|221|0|{1|deselect|}87|89|}
{2010006001|XXGobject_psameas_object|134|0|223|0|{metadata|deselect_metadata|1|0|}89|87|}
{2010212001|XXGvertex_oport_oport|135|0|224|0|{2|reject|}87|90|}
{2010006001|XXGobject_psameas_object|136|0|226|0|{metadata|reject_metadata|1|0|}90|87|}
{2010212001|XXGvertex_oport_oport|137|0|227|0|{3|error|}87|91|}
{2010006001|XXGobject_psameas_object|138|0|229|0|{metadata|error_metadata|1|0|}91|87|}
{2010212001|XXGvertex_oport_oport|139|0|230|0|{4|log|}87|92|}
{2010006001|XXGobject_psameas_object|140|0|232|0|{metadata|log_metadata|1|0|}92|87|}
{2010211001|XXGvertex_iport_iport|141|0|233|0|{0|in|}87|93|}
{2010006001|XXGobject_psameas_object|142|0|235|0|{metadata|in_metadata|1|0|}93|87|}
{2010006001|XXGobject_psameas_object|143|0|236|0|{Layout|Layout|0|0|}80|40|}
{2010006001|XXGobject_psameas_object|144|0|237|0|{deselect_metadata|out_metadata|0|0|}80|52|}
{2010006001|XXGobject_psameas_object|145|0|238|0|{in_metadata|out_metadata|0|0|}80|52|}
{2010006001|XXGobject_psameas_object|146|0|239|0|{out_metadata|out_metadata|0|0|}80|52|}
{2010006001|XXGobject_psameas_object|147|0|240|0|{reject_metadata|out_metadata|0|0|}80|52|}
{2010006001|XXGobject_psameas_object|148|0|241|0|{select_expr|FILTER_EXPRESSION|1|0|}80|1|}
{2010601001|XXGgraph_vertex_vertex|149|0|242|0|{Optional_Source_File|}1|94|}
{2010211001|XXGvertex_iport_iport|150|0|244|0|{0|write|}94|95|}
{2010214001|XXGiport_src_flow|151|0|246|0|{0|}95|21|}
{2010007001|XXGobject_proto_object|152|0|247|0|{}94|96|}
{2010211001|XXGvertex_iport_iport|153|0|249|0|{0|write|}96|97|}
{2010006001|XXGobject_psameas_object|154|0|251|0|{metadata|write_metadata|1|0|}97|96|}
{2010601001|XXGgraph_vertex_vertex|155|0|252|0|{Optional_Unsorted_Lookup|}1|98|}
{2010211001|XXGvertex_iport_iport|156|0|254|0|{0|write|}98|99|}
{2010214001|XXGiport_src_flow|157|0|256|0|{0|}99|23|}
{2010007001|XXGobject_proto_object|158|0|257|0|{}98|100|}
{2010211001|XXGvertex_iport_iport|159|0|259|0|{0|write|}100|101|}
{2010006001|XXGobject_psameas_object|160|0|261|0|{metadata|write_metadata|1|0|}101|100|}
{2010601001|XXGgraph_vertex_vertex|161|0|262|0|{PBRR|}1|102|}
{2010212001|XXGvertex_oport_oport|162|0|264|0|{0|out|}102|103|}
{2010213001|XXGoport_dst_flow|163|0|266|0|{0|}103|19|}
{2010211001|XXGvertex_iport_iport|164|0|267|0|{0|in|}102|104|}
{2010214001|XXGiport_src_flow|165|0|269|0|{0|}104|16|}
{2010007001|XXGobject_proto_object|166|0|270|0|{}102|105|}
{2010212001|XXGvertex_oport_oport|167|0|272|0|{0|out|}105|106|}
{2010006001|XXGobject_psameas_object|168|0|274|0|{metadata|out_metadata|1|0|}106|105|}
{2010211001|XXGvertex_iport_iport|169|0|275|0|{0|in|}105|107|}
{2010006001|XXGobject_psameas_object|170|0|277|0|{metadata|in_metadata|1|0|}107|105|}
{2010006001|XXGobject_psameas_object|171|0|278|0|{Layout|Layout|0|0|}102|40|}
{2010006001|XXGobject_psameas_object|172|0|279|0|{in_metadata|out_metadata|0|0|}102|40|}
{2010006001|XXGobject_psameas_object|173|0|280|0|{out_metadata|out_metadata|0|0|}102|40|}
{2010601001|XXGgraph_vertex_vertex|174|0|281|0|{Read_Excel_Data|}1|52|}
{2010601001|XXGgraph_vertex_vertex|175|0|282|0|{Rollup_Job_Info|}1|108|}
{2010212001|XXGvertex_oport_oport|176|0|284|0|{0|out|}108|109|}
{2010213001|XXGoport_dst_flow|177|0|286|0|{0|}109|20|}
{2010212001|XXGvertex_oport_oport|178|0|287|0|{1|reject|}108|110|}
{2010212001|XXGvertex_oport_oport|179|0|289|0|{2|error|}108|111|}
{2010212001|XXGvertex_oport_oport|180|0|291|0|{3|log|}108|112|}
{2010211001|XXGvertex_iport_iport|181|0|293|0|{0|in|}108|113|}
{2010214001|XXGiport_src_flow|182|0|295|0|{0|}113|22|}
{2010007001|XXGobject_proto_object|183|0|296|0|{}108|114|}
{2010212001|XXGvertex_oport_oport|184|0|298|0|{0|out|}114|115|}
{2010006001|XXGobject_psameas_object|185|0|300|0|{metadata|out_metadata|1|0|}115|114|}
{2010212001|XXGvertex_oport_oport|186|0|301|0|{1|reject|}114|116|}
{2010006001|XXGobject_psameas_object|187|0|303|0|{metadata|reject_metadata|1|0|}116|114|}
{2010212001|XXGvertex_oport_oport|188|0|304|0|{2|error|}114|117|}
{2010006001|XXGobject_psameas_object|189|0|306|0|{metadata|error_metadata|1|0|}117|114|}
{2010212001|XXGvertex_oport_oport|190|0|307|0|{3|log|}114|118|}
{2010006001|XXGobject_psameas_object|191|0|309|0|{metadata|log_metadata|1|0|}118|114|}
{2010211001|XXGvertex_iport_iport|192|0|310|0|{0|in|}114|119|}
{2010006001|XXGobject_psameas_object|193|0|312|0|{metadata|in_metadata|1|0|}119|114|}
{2010006001|XXGobject_psameas_object|194|0|313|0|{Layout|Layout|0|0|}108|30|}
{2010006001|XXGobject_psameas_object|195|0|314|0|{in_metadata|log_metadata|0|0|}108|40|}
{2010006001|XXGobject_psameas_object|196|0|315|0|{out_metadata|write_metadata|0|0|}108|30|}
{2010006001|XXGobject_psameas_object|197|0|316|0|{reject_metadata|log_metadata|0|0|}108|40|}
{2010601001|XXGgraph_vertex_vertex|198|0|317|0|{Trigger|}1|120|}
{2010212001|XXGvertex_oport_oport|199|0|319|0|{0|out|}120|121|}
{2010213001|XXGoport_dst_flow|200|0|321|0|{0|}121|15|}
{2010212001|XXGvertex_oport_oport|201|0|322|0|{1|error|}120|122|}
{2010212001|XXGvertex_oport_oport|202|0|324|0|{2|log|}120|123|}
{2010007001|XXGobject_proto_object|203|0|326|0|{}120|124|}
{2010212001|XXGvertex_oport_oport|204|0|328|0|{0|out|}124|125|}
{2010006001|XXGobject_psameas_object|205|0|330|0|{metadata|out_metadata|1|0|}125|124|}
{2010212001|XXGvertex_oport_oport|206|0|331|0|{1|error|}124|126|}
{2010006001|XXGobject_psameas_object|207|0|333|0|{metadata|error_metadata|1|0|}126|124|}
{2010212001|XXGvertex_oport_oport|208|0|334|0|{2|log|}124|127|}
{2010006001|XXGobject_psameas_object|209|0|336|0|{metadata|log_metadata|1|0|}127|124|}
{2010006001|XXGobject_psameas_object|210|0|337|0|{Layout|Layout|0|0|}120|40|}
{2010006001|XXGobject_psameas_object|211|0|338|0|{out_metadata|in_metadata|0|0|}120|52|}
{2010601001|XXGgraph_vertex_vertex|212|0|339|0|{Version_Log|}1|128|}
{2010605001|XXGgraph_legend_legend|213|0|341|0|{0|}128|129|}
{2010241001|XXGlegend_face_face|214|0|343|0|{}129|130|}
{2010605001|XXGgraph_legend_legend|215|0|345|0|{1|}128|131|}
{2010241001|XXGlegend_face_face|216|0|347|0|{}131|132|}
{2010605001|XXGgraph_legend_legend|217|0|349|0|{2|}128|133|}
{2010241001|XXGlegend_face_face|218|0|351|0|{}133|134|}
{2010601001|XXGgraph_vertex_vertex|219|0|353|0|{prepare_output|}1|135|}
{2010605001|XXGgraph_legend_legend|220|0|355|0|{0|}135|136|}
{2010241001|XXGlegend_face_face|221|0|357|0|{}136|137|}
{2010605001|XXGgraph_legend_legend|222|0|359|0|{1|}135|138|}
{2010241001|XXGlegend_face_face|223|0|361|0|{}138|139|}
{2010605001|XXGgraph_legend_legend|224|0|363|0|{2|}135|140|}
{2010241001|XXGlegend_face_face|225|0|365|0|{}140|141|}
{2010605001|XXGgraph_legend_legend|226|0|367|0|{3|}135|142|}
{2010241001|XXGlegend_face_face|227|0|369|0|{}142|143|}
{2010604001|XXGgraph_flow_flow|228|0|371|0|{Flow_1|}135|144|}
{2010604001|XXGgraph_flow_flow|229|0|373|0|{Flow_2|}135|145|}
{2010604001|XXGgraph_flow_flow|230|0|375|0|{Flow_3|}135|146|}
{2010604001|XXGgraph_flow_flow|231|0|377|0|{Flow_4|}135|147|}
{2010604001|XXGgraph_flow_flow|232|0|379|0|{Flow_5|}135|148|}
{2010604001|XXGgraph_flow_flow|233|0|381|0|{Flow_6|}135|149|}
{2010604001|XXGgraph_flow_flow|234|0|383|0|{Flow_7|}135|150|}
{2010604001|XXGgraph_flow_flow|235|0|385|0|{Flow_8|}135|151|}
{2010601001|XXGgraph_vertex_vertex|236|0|387|0|{Copy_Out|}135|152|}
{2010212001|XXGvertex_oport_oport|237|0|389|0|{0|out|}152|153|}
{2010211001|XXGvertex_iport_iport|238|0|391|0|{0|in|}152|154|}
{2010214001|XXGiport_src_flow|239|0|393|0|{0|}154|150|}
{2010006001|XXGobject_psameas_object|240|0|394|0|{Layout|Layout|0|0|}152|94|}
{2010006001|XXGobject_psameas_object|241|0|395|0|{in_metadata|write_metadata|0|0|}152|94|}
{2010006001|XXGobject_psameas_object|242|0|396|0|{out_metadata|write_metadata|0|0|}152|94|}
{2010601001|XXGgraph_vertex_vertex|243|0|397|0|{Copy_Out_|}135|155|}
{2010212001|XXGvertex_oport_oport|244|0|399|0|{0|out|}155|156|}
{2010211001|XXGvertex_iport_iport|245|0|401|0|{0|in|}155|157|}
{2010214001|XXGiport_src_flow|246|0|403|0|{0|}157|145|}
{2010006001|XXGobject_psameas_object|247|0|404|0|{Layout|Layout|0|0|}155|64|}
{2010006001|XXGobject_psameas_object|248|0|405|0|{in_metadata|write_metadata|0|0|}155|64|}
{2010006001|XXGobject_psameas_object|249|0|406|0|{out_metadata|write_metadata|0|0|}155|64|}
{2010601001|XXGgraph_vertex_vertex|250|0|407|0|{Dedup_and_Fix_Intervals|}135|158|}
{2010605001|XXGgraph_legend_legend|251|0|409|0|{0|}158|159|}
{2010241001|XXGlegend_face_face|252|0|411|0|{}159|160|}
{2010605001|XXGgraph_legend_legend|253|0|413|0|{1|}158|161|}
{2010241001|XXGlegend_face_face|254|0|415|0|{}161|162|}
{2010605001|XXGgraph_legend_legend|255|0|417|0|{2|}158|163|}
{2010241001|XXGlegend_face_face|256|0|419|0|{}163|164|}
{2010605001|XXGgraph_legend_legend|257|0|421|0|{3|}158|165|}
{2010241001|XXGlegend_face_face|258|0|423|0|{}165|166|}
{2010605001|XXGgraph_legend_legend|259|0|425|0|{4|}158|167|}
{2010241001|XXGlegend_face_face|260|0|427|0|{}167|168|}
{2010604001|XXGgraph_flow_flow|261|0|429|0|{Flow_1|}158|169|}
{2010604001|XXGgraph_flow_flow|262|0|431|0|{Flow_2|}158|170|}
{2010604001|XXGgraph_flow_flow|263|0|433|0|{Flow_3|}158|171|}
{2010604001|XXGgraph_flow_flow|264|0|435|0|{Flow_4|}158|172|}
{2010604001|XXGgraph_flow_flow|265|0|437|0|{Flow_6|}158|173|}
{2010604001|XXGgraph_flow_flow|266|0|439|0|{Flow_7|}158|174|}
{2010601001|XXGgraph_vertex_vertex|267|0|441|0|{Dedup_by_NK_Eff_Date|}158|175|}
{2010212001|XXGvertex_oport_oport|268|0|443|0|{0|out|}175|176|}
{2010213001|XXGoport_dst_flow|269|0|445|0|{0|}176|171|}
{2010212001|XXGvertex_oport_oport|270|0|446|0|{1|dup|}175|177|}
{2010212001|XXGvertex_oport_oport|271|0|448|0|{2|reject|}175|178|}
{2010212001|XXGvertex_oport_oport|272|0|450|0|{3|error|}175|179|}
{2010212001|XXGvertex_oport_oport|273|0|452|0|{4|log|}175|180|}
{2010211001|XXGvertex_iport_iport|274|0|454|0|{0|in|}175|181|}
{2010214001|XXGiport_src_flow|275|0|456|0|{0|}181|169|}
{2010006001|XXGobject_psameas_object|276|0|457|0|{Layout|Layout|0|0|}175|182|}
{2010211001|XXGvertex_iport_iport|277|0|459|0|{0|write|}182|183|}
{2010214001|XXGiport_src_flow|278|0|461|0|{0|}183|147|}
{2010006001|XXGobject_psameas_object|279|0|462|0|{dup_metadata|write_metadata|0|0|}175|182|}
{2010006001|XXGobject_psameas_object|280|0|463|0|{in_metadata|write_metadata|0|0|}175|182|}
{2010006001|XXGobject_psameas_object|281|0|464|0|{out_metadata|write_metadata|0|0|}175|182|}
{2010006001|XXGobject_psameas_object|282|0|465|0|{reject_metadata|write_metadata|0|0|}175|182|}
{2010601001|XXGgraph_vertex_vertex|283|0|466|0|{Parition_by_Related_or_NK|}158|184|}
{2010212001|XXGvertex_oport_oport|284|0|468|0|{0|out|}184|185|}
{2010213001|XXGoport_dst_flow|285|0|470|0|{0|}185|170|}
{2010211001|XXGvertex_iport_iport|286|0|471|0|{0|in|}184|186|}
{2010006001|XXGobject_psameas_object|287|0|473|0|{Layout|Layout|0|0|}184|187|}
{2010212001|XXGvertex_oport_oport|288|0|475|0|{0|source|}187|188|}
{2010213001|XXGoport_dst_flow|289|0|477|0|{0|}188|150|}
{2010212001|XXGvertex_oport_oport|290|0|478|0|{1|clean|}187|189|}
{2010213001|XXGoport_dst_flow|291|0|480|0|{0|}189|145|}
{2010212001|XXGvertex_oport_oport|292|0|481|0|{2|lkp|}187|190|}
{2010213001|XXGoport_dst_flow|293|0|483|0|{0|}190|144|}
{2010212001|XXGvertex_oport_oport|294|0|484|0|{3|reject0|}187|191|}
{2010212001|XXGvertex_oport_oport|295|0|486|0|{4|reject1|}187|192|}
{2010212001|XXGvertex_oport_oport|296|0|488|0|{5|reject2|}187|193|}
{2010212001|XXGvertex_oport_oport|297|0|490|0|{6|error0|}187|194|}
{2010212001|XXGvertex_oport_oport|298|0|492|0|{7|error1|}187|195|}
{2010212001|XXGvertex_oport_oport|299|0|494|0|{8|error2|}187|196|}
{2010212001|XXGvertex_oport_oport|300|0|496|0|{9|log|}187|197|}
{2010211001|XXGvertex_iport_iport|301|0|498|0|{0|in|}187|198|}
{2010006001|XXGobject_psameas_object|302|0|500|0|{in_metadata|out_metadata|0|0|}187|40|}
{2010006001|XXGobject_psameas_object|303|0|501|0|{out0_metadata|write_metadata|0|0|}187|94|}
{2010006001|XXGobject_psameas_object|304|0|502|0|{out1_metadata|write_metadata|0|0|}187|64|}
{2010006001|XXGobject_psameas_object|305|0|503|0|{out2_metadata|write_metadata|0|0|}187|182|}
{2010006001|XXGobject_psameas_object|306|0|504|0|{reject0_metadata|out_metadata|0|0|}187|40|}
{2010006001|XXGobject_psameas_object|307|0|505|0|{reject1_metadata|out_metadata|0|0|}187|40|}
{2010006001|XXGobject_psameas_object|308|0|506|0|{reject2_metadata|out_metadata|0|0|}187|40|}
{2010006001|XXGobject_psameas_object|309|0|507|0|{out_metadata|write_metadata|0|0|}184|182|}
{2010601001|XXGgraph_vertex_vertex|310|0|508|0|{Replicate|}158|199|}
{2010212001|XXGvertex_oport_oport|311|0|510|0|{0|out|}199|200|}
{2010211001|XXGvertex_iport_iport|312|0|512|0|{0|in|}199|201|}
{2010214001|XXGiport_src_flow|313|0|514|0|{0|}201|174|}
{2010006001|XXGobject_psameas_object|314|0|515|0|{Layout|Layout|0|0|}199|182|}
{2010006001|XXGobject_psameas_object|315|0|516|0|{in_metadata|write_metadata|0|0|}199|182|}
{2010006001|XXGobject_psameas_object|316|0|517|0|{out_metadata|write_metadata|0|0|}199|182|}
{2010601001|XXGgraph_vertex_vertex|317|0|518|0|{Rollup_Adjoining_Eff_Dates|}158|202|}
{2010212001|XXGvertex_oport_oport|318|0|520|0|{0|out|}202|203|}
{2010213001|XXGoport_dst_flow|319|0|522|0|{0|}203|174|}
{2010212001|XXGvertex_oport_oport|320|0|523|0|{1|reject|}202|204|}
{2010212001|XXGvertex_oport_oport|321|0|525|0|{2|error|}202|205|}
{2010212001|XXGvertex_oport_oport|322|0|527|0|{3|log|}202|206|}
{2010211001|XXGvertex_iport_iport|323|0|529|0|{0|in|}202|207|}
{2010214001|XXGiport_src_flow|324|0|531|0|{0|}207|173|}
{2010006001|XXGobject_psameas_object|325|0|532|0|{Layout|Layout|0|0|}202|182|}
{2010006001|XXGobject_psameas_object|326|0|533|0|{in_metadata|write_metadata|0|0|}202|182|}
{2010006001|XXGobject_psameas_object|327|0|534|0|{out_metadata|write_metadata|0|0|}202|182|}
{2010006001|XXGobject_psameas_object|328|0|535|0|{reject_metadata|write_metadata|0|0|}202|182|}
{2010601001|XXGgraph_vertex_vertex|329|0|536|0|{Scan_to_Fix_Overlapping_Dates|}158|208|}
{2010212001|XXGvertex_oport_oport|330|0|538|0|{0|out|}208|209|}
{2010213001|XXGoport_dst_flow|331|0|540|0|{0|}209|172|}
{2010212001|XXGvertex_oport_oport|332|0|541|0|{1|reject|}208|210|}
{2010212001|XXGvertex_oport_oport|333|0|543|0|{2|error|}208|211|}
{2010212001|XXGvertex_oport_oport|334|0|545|0|{3|log|}208|212|}
{2010211001|XXGvertex_iport_iport|335|0|547|0|{0|in|}208|213|}
{2010214001|XXGiport_src_flow|336|0|549|0|{0|}213|171|}
{2010006001|XXGobject_psameas_object|337|0|550|0|{Layout|Layout|0|0|}208|182|}
{2010006001|XXGobject_psameas_object|338|0|551|0|{in_metadata|write_metadata|0|0|}208|182|}
{2010006001|XXGobject_psameas_object|339|0|552|0|{out_metadata|write_metadata|0|0|}208|182|}
{2010006001|XXGobject_psameas_object|340|0|553|0|{reject_metadata|write_metadata|0|0|}208|182|}
{2010601001|XXGgraph_vertex_vertex|341|0|554|0|{Sort_for_Dedup|}158|214|}
{2010212001|XXGvertex_oport_oport|342|0|556|0|{0|out|}214|215|}
{2010213001|XXGoport_dst_flow|343|0|558|0|{0|}215|169|}
{2010211001|XXGvertex_iport_iport|344|0|559|0|{0|in|}214|216|}
{2010214001|XXGiport_src_flow|345|0|561|0|{0|}216|170|}
{2010006001|XXGobject_psameas_object|346|0|562|0|{Layout|Layout|0|0|}214|182|}
{2010006001|XXGobject_psameas_object|347|0|563|0|{in_metadata|write_metadata|0|0|}214|182|}
{2010006001|XXGobject_psameas_object|348|0|564|0|{out_metadata|write_metadata|0|0|}214|182|}
{2010601001|XXGgraph_vertex_vertex|349|0|565|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}158|217|}
{2010212001|XXGvertex_oport_oport|350|0|567|0|{0|out|}217|218|}
{2010213001|XXGoport_dst_flow|351|0|569|0|{0|}218|173|}
{2010211001|XXGvertex_iport_iport|352|0|570|0|{0|in|}217|219|}
{2010214001|XXGiport_src_flow|353|0|572|0|{0|}219|172|}
{2010006001|XXGobject_psameas_object|354|0|573|0|{Layout|Layout|0|0|}217|182|}
{2010006001|XXGobject_psameas_object|355|0|574|0|{in_metadata|write_metadata|0|0|}217|182|}
{2010006001|XXGobject_psameas_object|356|0|575|0|{out_metadata|write_metadata|0|0|}217|182|}
{2010601001|XXGgraph_vertex_vertex|357|0|576|0|{Testing|}158|220|}
{2010605001|XXGgraph_legend_legend|358|0|578|0|{0|}220|221|}
{2010241001|XXGlegend_face_face|359|0|580|0|{}221|222|}
{2010604001|XXGgraph_flow_flow|360|0|582|0|{Flow_1|}220|223|}
{2010604001|XXGgraph_flow_flow|361|0|584|0|{Flow_8|}220|224|}
{2010601001|XXGgraph_vertex_vertex|362|0|586|0|{Create|}220|225|}
{2010212001|XXGvertex_oport_oport|363|0|588|0|{0|out|}225|226|}
{2010213001|XXGoport_dst_flow|364|0|590|0|{0|}226|224|}
{2010212001|XXGvertex_oport_oport|365|0|591|0|{1|error|}225|227|}
{2010212001|XXGvertex_oport_oport|366|0|593|0|{2|log|}225|228|}
{2010601001|XXGgraph_vertex_vertex|367|0|595|0|{Dups|}220|229|}
{2010211001|XXGvertex_iport_iport|368|0|597|0|{0|write|}229|230|}
{2010601001|XXGgraph_vertex_vertex|369|0|599|0|{Merge|}220|231|}
{2010212001|XXGvertex_oport_oport|370|0|601|0|{0|out|}231|232|}
{2010213001|XXGoport_dst_flow|371|0|603|0|{0|}232|223|}
{2010211001|XXGvertex_iport_iport|372|0|604|0|{0|in|}231|233|}
{2010601001|XXGgraph_vertex_vertex|373|0|606|0|{Partition_by_Round_robin|}220|234|}
{2010212001|XXGvertex_oport_oport|374|0|608|0|{0|out|}234|235|}
{2010211001|XXGvertex_iport_iport|375|0|610|0|{0|in|}234|236|}
{2010214001|XXGiport_src_flow|376|0|612|0|{0|}236|224|}
{2010006001|XXGobject_psameas_object|377|0|613|0|{in_metadata|out_metadata|0|0|}234|225|}
{2010006001|XXGobject_psameas_object|378|0|614|0|{out_metadata|out_metadata|0|0|}234|225|}
{2010601001|XXGgraph_vertex_vertex|379|0|615|0|{stdout|}220|237|}
{2010211001|XXGvertex_iport_iport|380|0|617|0|{0|write|}237|238|}
{2010214001|XXGiport_src_flow|381|0|619|0|{0|}238|223|}
{2010212001|XXGvertex_oport_oport|382|0|620|0|{0|out|}220|239|}
{2010216002|XXGoport_binding_oport|383|0|622|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}239|235|}
{2010211001|XXGvertex_iport_iport|384|0|623|0|{0|in0|}220|240|}
{2010215002|XXGiport_binding_iport|385|0|625|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}240|233|}
{2010211001|XXGvertex_iport_iport|386|0|626|0|{1|in1|}220|241|}
{2010215002|XXGiport_binding_iport|387|0|628|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}241|230|}
{2010212001|XXGvertex_oport_oport|388|0|629|0|{0|out|}158|242|}
{2010216002|XXGoport_binding_oport|389|0|631|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6809|}242|200|}
{2010213001|XXGoport_dst_flow|390|0|632|0|{0|}242|146|}
{2010213001|XXGoport_dst_flow|391|0|633|0|{1|}242|149|}
{2010212001|XXGvertex_oport_oport|392|0|634|0|{1|dups|}158|243|}
{2010216002|XXGoport_binding_oport|393|0|636|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6810|}243|177|}
{2010213001|XXGoport_dst_flow|394|0|637|0|{0|}243|147|}
{2010211001|XXGvertex_iport_iport|395|0|638|0|{0|in|}158|244|}
{2010215002|XXGiport_binding_iport|396|0|640|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6808|}244|186|}
{2010214001|XXGiport_src_flow|397|0|641|0|{0|}244|144|}
{2010006001|XXGobject_psameas_object|398|0|642|0|{INPUT_DML|write_metadata|0|0|}158|182|}
{2010601001|XXGgraph_vertex_vertex|399|0|643|0|{Dups|}135|182|}
{2010601001|XXGgraph_vertex_vertex|400|0|644|0|{Gather|}135|245|}
{2010212001|XXGvertex_oport_oport|401|0|646|0|{0|out|}245|246|}
{2010213001|XXGoport_dst_flow|402|0|648|0|{0|}246|151|}
{2010211001|XXGvertex_iport_iport|403|0|649|0|{0|in|}245|247|}
{2010214001|XXGiport_src_flow|404|0|651|0|{0|}247|149|}
{2010006001|XXGobject_psameas_object|405|0|652|0|{in_metadata|write_metadata|0|0|}245|98|}
{2010006001|XXGobject_psameas_object|406|0|653|0|{out_metadata|write_metadata|0|0|}245|98|}
{2010601001|XXGgraph_vertex_vertex|407|0|654|0|{Gather_|}135|248|}
{2010212001|XXGvertex_oport_oport|408|0|656|0|{0|out|}248|249|}
{2010211001|XXGvertex_iport_iport|409|0|658|0|{0|in|}248|250|}
{2010214001|XXGiport_src_flow|410|0|660|0|{0|}250|148|}
{2010214001|XXGiport_src_flow|411|0|661|0|{1|}250|151|}
{2010006001|XXGobject_psameas_object|412|0|662|0|{Layout|Layout|0|0|}248|98|}
{2010006001|XXGobject_psameas_object|413|0|663|0|{in_metadata|write_metadata|0|0|}248|98|}
{2010006001|XXGobject_psameas_object|414|0|664|0|{out_metadata|write_metadata|0|0|}248|98|}
{2010601001|XXGgraph_vertex_vertex|415|0|665|0|{Map_to_Output|}135|187|}
{2010601001|XXGgraph_vertex_vertex|416|0|666|0|{Merge|}135|251|}
{2010212001|XXGvertex_oport_oport|417|0|668|0|{0|out|}251|252|}
{2010213001|XXGoport_dst_flow|418|0|670|0|{0|}252|148|}
{2010211001|XXGvertex_iport_iport|419|0|671|0|{0|in|}251|253|}
{2010214001|XXGiport_src_flow|420|0|673|0|{0|}253|146|}
{2010006001|XXGobject_psameas_object|421|0|674|0|{in_metadata|write_metadata|0|0|}251|98|}
{2010006001|XXGobject_psameas_object|422|0|675|0|{out_metadata|write_metadata|0|0|}251|98|}
{2010212001|XXGvertex_oport_oport|423|0|676|0|{0|source|}135|254|}
{2010216002|XXGoport_binding_oport|424|0|678|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9933|}254|153|}
{2010213001|XXGoport_dst_flow|425|0|679|0|{0|}254|21|}
{2010212001|XXGvertex_oport_oport|426|0|680|0|{1|clean|}135|255|}
{2010216002|XXGoport_binding_oport|427|0|682|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9934|}255|156|}
{2010213001|XXGoport_dst_flow|428|0|683|0|{0|}255|18|}
{2010212001|XXGvertex_oport_oport|429|0|684|0|{2|lookup|}135|256|}
{2010216002|XXGoport_binding_oport|430|0|686|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9935|}256|249|}
{2010213001|XXGoport_dst_flow|431|0|687|0|{0|}256|23|}
{2010211001|XXGvertex_iport_iport|432|0|688|0|{0|in0|}135|257|}
{2010215002|XXGiport_binding_iport|433|0|690|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9932|}257|198|}
{2010214001|XXGiport_src_flow|434|0|691|0|{0|}257|19|}
{2010007001|XXGobject_proto_object|435|0|692|0|{}135|258|}
{2010605001|XXGgraph_legend_legend|436|0|694|0|{0|}258|259|}
{2010241001|XXGlegend_face_face|437|0|696|0|{}259|260|}
{2010605001|XXGgraph_legend_legend|438|0|698|0|{1|}258|261|}
{2010241001|XXGlegend_face_face|439|0|700|0|{}261|262|}
{2010605001|XXGgraph_legend_legend|440|0|702|0|{2|}258|263|}
{2010241001|XXGlegend_face_face|441|0|704|0|{}263|264|}
{2010605001|XXGgraph_legend_legend|442|0|706|0|{3|}258|265|}
{2010241001|XXGlegend_face_face|443|0|708|0|{}265|266|}
{2010604001|XXGgraph_flow_flow|444|0|710|0|{Flow_1|}258|267|}
{2010604001|XXGgraph_flow_flow|445|0|712|0|{Flow_2|}258|268|}
{2010604001|XXGgraph_flow_flow|446|0|714|0|{Flow_3|}258|269|}
{2010604001|XXGgraph_flow_flow|447|0|716|0|{Flow_4|}258|270|}
{2010604001|XXGgraph_flow_flow|448|0|718|0|{Flow_5|}258|271|}
{2010604001|XXGgraph_flow_flow|449|0|720|0|{Flow_6|}258|272|}
{2010604001|XXGgraph_flow_flow|450|0|722|0|{Flow_7|}258|273|}
{2010604001|XXGgraph_flow_flow|451|0|724|0|{Flow_8|}258|274|}
{2010601001|XXGgraph_vertex_vertex|452|0|726|0|{Copy_Out|}258|275|}
{2010212001|XXGvertex_oport_oport|453|0|728|0|{0|out|}275|276|}
{2010211001|XXGvertex_iport_iport|454|0|730|0|{0|in|}275|277|}
{2010214001|XXGiport_src_flow|455|0|732|0|{0|}277|273|}
{2010007001|XXGobject_proto_object|456|0|733|0|{}275|278|}
{2010212001|XXGvertex_oport_oport|457|0|735|0|{0|out|}278|279|}
{2010006001|XXGobject_psameas_object|458|0|737|0|{metadata|out_metadata|1|0|}279|278|}
{2010211001|XXGvertex_iport_iport|459|0|738|0|{0|in|}278|280|}
{2010006001|XXGobject_psameas_object|460|0|740|0|{metadata|in_metadata|1|0|}280|278|}
{2010601001|XXGgraph_vertex_vertex|461|0|741|0|{Copy_Out_|}258|281|}
{2010212001|XXGvertex_oport_oport|462|0|743|0|{0|out|}281|282|}
{2010211001|XXGvertex_iport_iport|463|0|745|0|{0|in|}281|283|}
{2010214001|XXGiport_src_flow|464|0|747|0|{0|}283|268|}
{2010007001|XXGobject_proto_object|465|0|748|0|{}281|284|}
{2010212001|XXGvertex_oport_oport|466|0|750|0|{0|out|}284|285|}
{2010006001|XXGobject_psameas_object|467|0|752|0|{metadata|out_metadata|1|0|}285|284|}
{2010211001|XXGvertex_iport_iport|468|0|753|0|{0|in|}284|286|}
{2010006001|XXGobject_psameas_object|469|0|755|0|{metadata|in_metadata|1|0|}286|284|}
{2010601001|XXGgraph_vertex_vertex|470|0|756|0|{Dedup_and_Fix_Intervals|}258|287|}
{2010605001|XXGgraph_legend_legend|471|0|758|0|{0|}287|288|}
{2010241001|XXGlegend_face_face|472|0|760|0|{}288|289|}
{2010605001|XXGgraph_legend_legend|473|0|762|0|{1|}287|290|}
{2010241001|XXGlegend_face_face|474|0|764|0|{}290|291|}
{2010605001|XXGgraph_legend_legend|475|0|766|0|{2|}287|292|}
{2010241001|XXGlegend_face_face|476|0|768|0|{}292|293|}
{2010605001|XXGgraph_legend_legend|477|0|770|0|{3|}287|294|}
{2010241001|XXGlegend_face_face|478|0|772|0|{}294|295|}
{2010605001|XXGgraph_legend_legend|479|0|774|0|{4|}287|296|}
{2010241001|XXGlegend_face_face|480|0|776|0|{}296|297|}
{2010604001|XXGgraph_flow_flow|481|0|778|0|{Flow_1|}287|298|}
{2010604001|XXGgraph_flow_flow|482|0|780|0|{Flow_2|}287|299|}
{2010604001|XXGgraph_flow_flow|483|0|782|0|{Flow_3|}287|300|}
{2010604001|XXGgraph_flow_flow|484|0|784|0|{Flow_4|}287|301|}
{2010604001|XXGgraph_flow_flow|485|0|786|0|{Flow_6|}287|302|}
{2010604001|XXGgraph_flow_flow|486|0|788|0|{Flow_7|}287|303|}
{2010601001|XXGgraph_vertex_vertex|487|0|790|0|{Dedup_by_NK_Eff_Date|}287|304|}
{2010212001|XXGvertex_oport_oport|488|0|792|0|{0|out|}304|305|}
{2010213001|XXGoport_dst_flow|489|0|794|0|{0|}305|300|}
{2010212001|XXGvertex_oport_oport|490|0|795|0|{1|dup|}304|306|}
{2010212001|XXGvertex_oport_oport|491|0|797|0|{2|reject|}304|307|}
{2010212001|XXGvertex_oport_oport|492|0|799|0|{3|error|}304|308|}
{2010212001|XXGvertex_oport_oport|493|0|801|0|{4|log|}304|309|}
{2010211001|XXGvertex_iport_iport|494|0|803|0|{0|in|}304|310|}
{2010214001|XXGiport_src_flow|495|0|805|0|{0|}310|298|}
{2010601001|XXGgraph_vertex_vertex|496|0|806|0|{Parition_by_Related_or_NK|}287|311|}
{2010212001|XXGvertex_oport_oport|497|0|808|0|{0|out|}311|312|}
{2010213001|XXGoport_dst_flow|498|0|810|0|{0|}312|299|}
{2010211001|XXGvertex_iport_iport|499|0|811|0|{0|in|}311|313|}
{2010601001|XXGgraph_vertex_vertex|500|0|813|0|{Replicate|}287|314|}
{2010212001|XXGvertex_oport_oport|501|0|815|0|{0|out|}314|315|}
{2010211001|XXGvertex_iport_iport|502|0|817|0|{0|in|}314|316|}
{2010214001|XXGiport_src_flow|503|0|819|0|{0|}316|303|}
{2010601001|XXGgraph_vertex_vertex|504|0|820|0|{Rollup_Adjoining_Eff_Dates|}287|317|}
{2010212001|XXGvertex_oport_oport|505|0|822|0|{0|out|}317|318|}
{2010213001|XXGoport_dst_flow|506|0|824|0|{0|}318|303|}
{2010212001|XXGvertex_oport_oport|507|0|825|0|{1|reject|}317|319|}
{2010212001|XXGvertex_oport_oport|508|0|827|0|{2|error|}317|320|}
{2010212001|XXGvertex_oport_oport|509|0|829|0|{3|log|}317|321|}
{2010211001|XXGvertex_iport_iport|510|0|831|0|{0|in|}317|322|}
{2010214001|XXGiport_src_flow|511|0|833|0|{0|}322|302|}
{2010601001|XXGgraph_vertex_vertex|512|0|834|0|{Scan_to_Fix_Overlapping_Dates|}287|323|}
{2010212001|XXGvertex_oport_oport|513|0|836|0|{0|out|}323|324|}
{2010213001|XXGoport_dst_flow|514|0|838|0|{0|}324|301|}
{2010212001|XXGvertex_oport_oport|515|0|839|0|{1|reject|}323|325|}
{2010212001|XXGvertex_oport_oport|516|0|841|0|{2|error|}323|326|}
{2010212001|XXGvertex_oport_oport|517|0|843|0|{3|log|}323|327|}
{2010211001|XXGvertex_iport_iport|518|0|845|0|{0|in|}323|328|}
{2010214001|XXGiport_src_flow|519|0|847|0|{0|}328|300|}
{2010601001|XXGgraph_vertex_vertex|520|0|848|0|{Sort_for_Dedup|}287|329|}
{2010212001|XXGvertex_oport_oport|521|0|850|0|{0|out|}329|330|}
{2010213001|XXGoport_dst_flow|522|0|852|0|{0|}330|298|}
{2010211001|XXGvertex_iport_iport|523|0|853|0|{0|in|}329|331|}
{2010214001|XXGiport_src_flow|524|0|855|0|{0|}331|299|}
{2010601001|XXGgraph_vertex_vertex|525|0|856|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}287|332|}
{2010212001|XXGvertex_oport_oport|526|0|858|0|{0|out|}332|333|}
{2010213001|XXGoport_dst_flow|527|0|860|0|{0|}333|302|}
{2010211001|XXGvertex_iport_iport|528|0|861|0|{0|in|}332|334|}
{2010214001|XXGiport_src_flow|529|0|863|0|{0|}334|301|}
{2010601001|XXGgraph_vertex_vertex|530|0|864|0|{Testing|}287|335|}
{2010605001|XXGgraph_legend_legend|531|0|866|0|{0|}335|336|}
{2010241001|XXGlegend_face_face|532|0|868|0|{}336|337|}
{2010604001|XXGgraph_flow_flow|533|0|870|0|{Flow_1|}335|338|}
{2010604001|XXGgraph_flow_flow|534|0|872|0|{Flow_8|}335|339|}
{2010601001|XXGgraph_vertex_vertex|535|0|874|0|{Create|}335|340|}
{2010212001|XXGvertex_oport_oport|536|0|876|0|{0|out|}340|341|}
{2010213001|XXGoport_dst_flow|537|0|878|0|{0|}341|339|}
{2010212001|XXGvertex_oport_oport|538|0|879|0|{1|error|}340|342|}
{2010212001|XXGvertex_oport_oport|539|0|881|0|{2|log|}340|343|}
{2010601001|XXGgraph_vertex_vertex|540|0|883|0|{Dups|}335|344|}
{2010211001|XXGvertex_iport_iport|541|0|885|0|{0|write|}344|345|}
{2010601001|XXGgraph_vertex_vertex|542|0|887|0|{Merge|}335|346|}
{2010212001|XXGvertex_oport_oport|543|0|889|0|{0|out|}346|347|}
{2010213001|XXGoport_dst_flow|544|0|891|0|{0|}347|338|}
{2010211001|XXGvertex_iport_iport|545|0|892|0|{0|in|}346|348|}
{2010601001|XXGgraph_vertex_vertex|546|0|894|0|{Partition_by_Round_robin|}335|349|}
{2010212001|XXGvertex_oport_oport|547|0|896|0|{0|out|}349|350|}
{2010211001|XXGvertex_iport_iport|548|0|898|0|{0|in|}349|351|}
{2010214001|XXGiport_src_flow|549|0|900|0|{0|}351|339|}
{2010601001|XXGgraph_vertex_vertex|550|0|901|0|{stdout|}335|352|}
{2010211001|XXGvertex_iport_iport|551|0|903|0|{0|write|}352|353|}
{2010214001|XXGiport_src_flow|552|0|905|0|{0|}353|338|}
{2010212001|XXGvertex_oport_oport|553|0|906|0|{0|out|}335|354|}
{2010216002|XXGoport_binding_oport|554|0|908|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}354|350|}
{2010211001|XXGvertex_iport_iport|555|0|909|0|{0|in0|}335|355|}
{2010215002|XXGiport_binding_iport|556|0|911|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}355|348|}
{2010211001|XXGvertex_iport_iport|557|0|912|0|{1|in1|}335|356|}
{2010215002|XXGiport_binding_iport|558|0|914|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}356|345|}
{2010212001|XXGvertex_oport_oport|559|0|915|0|{0|out|}287|357|}
{2010216002|XXGoport_binding_oport|560|0|917|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}357|315|}
{2010213001|XXGoport_dst_flow|561|0|918|0|{0|}357|269|}
{2010213001|XXGoport_dst_flow|562|0|919|0|{1|}357|272|}
{2010212001|XXGvertex_oport_oport|563|0|920|0|{1|dups|}287|358|}
{2010216002|XXGoport_binding_oport|564|0|922|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}358|306|}
{2010213001|XXGoport_dst_flow|565|0|923|0|{0|}358|270|}
{2010211001|XXGvertex_iport_iport|566|0|924|0|{0|in|}287|359|}
{2010215002|XXGiport_binding_iport|567|0|926|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}359|313|}
{2010214001|XXGiport_src_flow|568|0|927|0|{0|}359|267|}
{2010007001|XXGobject_proto_object|569|0|928|0|{}287|360|}
{2010605001|XXGgraph_legend_legend|570|0|930|0|{0|}360|361|}
{2010241001|XXGlegend_face_face|571|0|932|0|{}361|362|}
{2010605001|XXGgraph_legend_legend|572|0|934|0|{1|}360|363|}
{2010241001|XXGlegend_face_face|573|0|936|0|{}363|364|}
{2010605001|XXGgraph_legend_legend|574|0|938|0|{2|}360|365|}
{2010241001|XXGlegend_face_face|575|0|940|0|{}365|366|}
{2010605001|XXGgraph_legend_legend|576|0|942|0|{3|}360|367|}
{2010241001|XXGlegend_face_face|577|0|944|0|{}367|368|}
{2010605001|XXGgraph_legend_legend|578|0|946|0|{4|}360|369|}
{2010241001|XXGlegend_face_face|579|0|948|0|{}369|370|}
{2010604001|XXGgraph_flow_flow|580|0|950|0|{Flow_1|}360|371|}
{2010604001|XXGgraph_flow_flow|581|0|952|0|{Flow_2|}360|372|}
{2010604001|XXGgraph_flow_flow|582|0|954|0|{Flow_3|}360|373|}
{2010604001|XXGgraph_flow_flow|583|0|956|0|{Flow_4|}360|374|}
{2010604001|XXGgraph_flow_flow|584|0|958|0|{Flow_6|}360|375|}
{2010604001|XXGgraph_flow_flow|585|0|960|0|{Flow_7|}360|376|}
{2010601001|XXGgraph_vertex_vertex|586|0|962|0|{Dedup_by_NK_Eff_Date|}360|377|}
{2010212001|XXGvertex_oport_oport|587|0|964|0|{0|out|}377|378|}
{2010213001|XXGoport_dst_flow|588|0|966|0|{0|}378|373|}
{2010212001|XXGvertex_oport_oport|589|0|967|0|{1|dup|}377|379|}
{2010212001|XXGvertex_oport_oport|590|0|969|0|{2|reject|}377|380|}
{2010212001|XXGvertex_oport_oport|591|0|971|0|{3|error|}377|381|}
{2010212001|XXGvertex_oport_oport|592|0|973|0|{4|log|}377|382|}
{2010211001|XXGvertex_iport_iport|593|0|975|0|{0|in|}377|383|}
{2010214001|XXGiport_src_flow|594|0|977|0|{0|}383|371|}
{2010007001|XXGobject_proto_object|595|0|978|0|{}377|384|}
{2010212001|XXGvertex_oport_oport|596|0|980|0|{0|out|}384|385|}
{2010006001|XXGobject_psameas_object|597|0|982|0|{metadata|out_metadata|1|0|}385|384|}
{2010212001|XXGvertex_oport_oport|598|0|983|0|{1|dup|}384|386|}
{2010006001|XXGobject_psameas_object|599|0|985|0|{metadata|dup_metadata|1|0|}386|384|}
{2010212001|XXGvertex_oport_oport|600|0|986|0|{2|reject|}384|387|}
{2010006001|XXGobject_psameas_object|601|0|988|0|{metadata|reject_metadata|1|0|}387|384|}
{2010212001|XXGvertex_oport_oport|602|0|989|0|{3|error|}384|388|}
{2010006001|XXGobject_psameas_object|603|0|991|0|{metadata|error_metadata|1|0|}388|384|}
{2010212001|XXGvertex_oport_oport|604|0|992|0|{4|log|}384|389|}
{2010006001|XXGobject_psameas_object|605|0|994|0|{metadata|log_metadata|1|0|}389|384|}
{2010211001|XXGvertex_iport_iport|606|0|995|0|{0|in|}384|390|}
{2010006001|XXGobject_psameas_object|607|0|997|0|{metadata|in_metadata|1|0|}390|384|}
{2010601001|XXGgraph_vertex_vertex|608|0|998|0|{Parition_by_Related_or_NK|}360|391|}
{2010212001|XXGvertex_oport_oport|609|0|1000|0|{0|out|}391|392|}
{2010213001|XXGoport_dst_flow|610|0|1002|0|{0|}392|372|}
{2010211001|XXGvertex_iport_iport|611|0|1003|0|{0|in|}391|393|}
{2010007001|XXGobject_proto_object|612|0|1005|0|{}391|394|}
{2010212001|XXGvertex_oport_oport|613|0|1007|0|{0|out|}394|395|}
{2010006001|XXGobject_psameas_object|614|0|1009|0|{metadata|out_metadata|1|0|}395|394|}
{2010211001|XXGvertex_iport_iport|615|0|1010|0|{0|in|}394|396|}
{2010006001|XXGobject_psameas_object|616|0|1012|0|{metadata|in_metadata|1|0|}396|394|}
{2010006001|XXGobject_psameas_object|617|0|1013|0|{in_metadata|INPUT_DML|1|0|}391|360|}
{2010601001|XXGgraph_vertex_vertex|618|0|1014|0|{Replicate|}360|397|}
{2010212001|XXGvertex_oport_oport|619|0|1016|0|{0|out|}397|398|}
{2010211001|XXGvertex_iport_iport|620|0|1018|0|{0|in|}397|399|}
{2010214001|XXGiport_src_flow|621|0|1020|0|{0|}399|376|}
{2010007001|XXGobject_proto_object|622|0|1021|0|{}397|400|}
{2010212001|XXGvertex_oport_oport|623|0|1023|0|{0|out|}400|401|}
{2010006001|XXGobject_psameas_object|624|0|1025|0|{metadata|out_metadata|1|0|}401|400|}
{2010211001|XXGvertex_iport_iport|625|0|1026|0|{0|in|}400|402|}
{2010006001|XXGobject_psameas_object|626|0|1028|0|{metadata|in_metadata|1|0|}402|400|}
{2010601001|XXGgraph_vertex_vertex|627|0|1029|0|{Rollup_Adjoining_Eff_Dates|}360|403|}
{2010212001|XXGvertex_oport_oport|628|0|1031|0|{0|out|}403|404|}
{2010213001|XXGoport_dst_flow|629|0|1033|0|{0|}404|376|}
{2010212001|XXGvertex_oport_oport|630|0|1034|0|{1|reject|}403|405|}
{2010212001|XXGvertex_oport_oport|631|0|1036|0|{2|error|}403|406|}
{2010212001|XXGvertex_oport_oport|632|0|1038|0|{3|log|}403|407|}
{2010211001|XXGvertex_iport_iport|633|0|1040|0|{0|in|}403|408|}
{2010214001|XXGiport_src_flow|634|0|1042|0|{0|}408|375|}
{2010007001|XXGobject_proto_object|635|0|1043|0|{}403|409|}
{2010212001|XXGvertex_oport_oport|636|0|1045|0|{0|out|}409|410|}
{2010006001|XXGobject_psameas_object|637|0|1047|0|{metadata|out_metadata|1|0|}410|409|}
{2010212001|XXGvertex_oport_oport|638|0|1048|0|{1|reject|}409|411|}
{2010006001|XXGobject_psameas_object|639|0|1050|0|{metadata|reject_metadata|1|0|}411|409|}
{2010212001|XXGvertex_oport_oport|640|0|1051|0|{2|error|}409|412|}
{2010006001|XXGobject_psameas_object|641|0|1053|0|{metadata|error_metadata|1|0|}412|409|}
{2010212001|XXGvertex_oport_oport|642|0|1054|0|{3|log|}409|413|}
{2010006001|XXGobject_psameas_object|643|0|1056|0|{metadata|log_metadata|1|0|}413|409|}
{2010211001|XXGvertex_iport_iport|644|0|1057|0|{0|in|}409|414|}
{2010006001|XXGobject_psameas_object|645|0|1059|0|{metadata|in_metadata|1|0|}414|409|}
{2010601001|XXGgraph_vertex_vertex|646|0|1060|0|{Scan_to_Fix_Overlapping_Dates|}360|415|}
{2010212001|XXGvertex_oport_oport|647|0|1062|0|{0|out|}415|416|}
{2010213001|XXGoport_dst_flow|648|0|1064|0|{0|}416|374|}
{2010212001|XXGvertex_oport_oport|649|0|1065|0|{1|reject|}415|417|}
{2010212001|XXGvertex_oport_oport|650|0|1067|0|{2|error|}415|418|}
{2010212001|XXGvertex_oport_oport|651|0|1069|0|{3|log|}415|419|}
{2010211001|XXGvertex_iport_iport|652|0|1071|0|{0|in|}415|420|}
{2010214001|XXGiport_src_flow|653|0|1073|0|{0|}420|373|}
{2010007001|XXGobject_proto_object|654|0|1074|0|{}415|421|}
{2010212001|XXGvertex_oport_oport|655|0|1076|0|{0|out|}421|422|}
{2010006001|XXGobject_psameas_object|656|0|1078|0|{metadata|out_metadata|1|0|}422|421|}
{2010212001|XXGvertex_oport_oport|657|0|1079|0|{1|reject|}421|423|}
{2010006001|XXGobject_psameas_object|658|0|1081|0|{metadata|reject_metadata|1|0|}423|421|}
{2010212001|XXGvertex_oport_oport|659|0|1082|0|{2|error|}421|424|}
{2010006001|XXGobject_psameas_object|660|0|1084|0|{metadata|error_metadata|1|0|}424|421|}
{2010212001|XXGvertex_oport_oport|661|0|1085|0|{3|log|}421|425|}
{2010006001|XXGobject_psameas_object|662|0|1087|0|{metadata|log_metadata|1|0|}425|421|}
{2010211001|XXGvertex_iport_iport|663|0|1088|0|{0|in|}421|426|}
{2010006001|XXGobject_psameas_object|664|0|1090|0|{metadata|in_metadata|1|0|}426|421|}
{2010601001|XXGgraph_vertex_vertex|665|0|1091|0|{Sort_for_Dedup|}360|427|}
{2010212001|XXGvertex_oport_oport|666|0|1093|0|{0|out|}427|428|}
{2010213001|XXGoport_dst_flow|667|0|1095|0|{0|}428|371|}
{2010211001|XXGvertex_iport_iport|668|0|1096|0|{0|in|}427|429|}
{2010214001|XXGiport_src_flow|669|0|1098|0|{0|}429|372|}
{2010007001|XXGobject_proto_object|670|0|1099|0|{}427|430|}
{2010212001|XXGvertex_oport_oport|671|0|1101|0|{0|out|}430|431|}
{2010006001|XXGobject_psameas_object|672|0|1103|0|{metadata|out_metadata|1|0|}431|430|}
{2010211001|XXGvertex_iport_iport|673|0|1104|0|{0|in|}430|432|}
{2010006001|XXGobject_psameas_object|674|0|1106|0|{metadata|in_metadata|1|0|}432|430|}
{2010601001|XXGgraph_vertex_vertex|675|0|1107|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}360|433|}
{2010212001|XXGvertex_oport_oport|676|0|1109|0|{0|out|}433|434|}
{2010213001|XXGoport_dst_flow|677|0|1111|0|{0|}434|375|}
{2010211001|XXGvertex_iport_iport|678|0|1112|0|{0|in|}433|435|}
{2010214001|XXGiport_src_flow|679|0|1114|0|{0|}435|374|}
{2010007001|XXGobject_proto_object|680|0|1115|0|{}433|436|}
{2010212001|XXGvertex_oport_oport|681|0|1117|0|{0|out|}436|437|}
{2010006001|XXGobject_psameas_object|682|0|1119|0|{metadata|out_metadata|1|0|}437|436|}
{2010211001|XXGvertex_iport_iport|683|0|1120|0|{0|in|}436|438|}
{2010006001|XXGobject_psameas_object|684|0|1122|0|{metadata|in_metadata|1|0|}438|436|}
{2010601001|XXGgraph_vertex_vertex|685|0|1123|0|{Testing|}360|439|}
{2010605001|XXGgraph_legend_legend|686|0|1125|0|{0|}439|440|}
{2010241001|XXGlegend_face_face|687|0|1127|0|{}440|441|}
{2010604001|XXGgraph_flow_flow|688|0|1129|0|{Flow_1|}439|442|}
{2010604001|XXGgraph_flow_flow|689|0|1131|0|{Flow_8|}439|443|}
{2010601001|XXGgraph_vertex_vertex|690|0|1133|0|{Create|}439|444|}
{2010212001|XXGvertex_oport_oport|691|0|1135|0|{0|out|}444|445|}
{2010213001|XXGoport_dst_flow|692|0|1137|0|{0|}445|443|}
{2010212001|XXGvertex_oport_oport|693|0|1138|0|{1|error|}444|446|}
{2010212001|XXGvertex_oport_oport|694|0|1140|0|{2|log|}444|447|}
{2010007001|XXGobject_proto_object|695|0|1142|0|{}444|448|}
{2010212001|XXGvertex_oport_oport|696|0|1144|0|{0|out|}448|449|}
{2010006001|XXGobject_psameas_object|697|0|1146|0|{metadata|out_metadata|1|0|}449|448|}
{2010212001|XXGvertex_oport_oport|698|0|1147|0|{1|error|}448|450|}
{2010006001|XXGobject_psameas_object|699|0|1149|0|{metadata|error_metadata|1|0|}450|448|}
{2010212001|XXGvertex_oport_oport|700|0|1150|0|{2|log|}448|451|}
{2010006001|XXGobject_psameas_object|701|0|1152|0|{metadata|log_metadata|1|0|}451|448|}
{2010601001|XXGgraph_vertex_vertex|702|0|1153|0|{Dups|}439|452|}
{2010211001|XXGvertex_iport_iport|703|0|1155|0|{0|write|}452|453|}
{2010007001|XXGobject_proto_object|704|0|1157|0|{}452|454|}
{2010211001|XXGvertex_iport_iport|705|0|1159|0|{0|write|}454|455|}
{2010006001|XXGobject_psameas_object|706|0|1161|0|{metadata|write_metadata|1|0|}455|454|}
{2010601001|XXGgraph_vertex_vertex|707|0|1162|0|{Merge|}439|456|}
{2010212001|XXGvertex_oport_oport|708|0|1164|0|{0|out|}456|457|}
{2010213001|XXGoport_dst_flow|709|0|1166|0|{0|}457|442|}
{2010211001|XXGvertex_iport_iport|710|0|1167|0|{0|in|}456|458|}
{2010007001|XXGobject_proto_object|711|0|1169|0|{}456|459|}
{2010212001|XXGvertex_oport_oport|712|0|1171|0|{0|out|}459|460|}
{2010006001|XXGobject_psameas_object|713|0|1173|0|{metadata|out_metadata|1|0|}460|459|}
{2010211001|XXGvertex_iport_iport|714|0|1174|0|{0|in|}459|461|}
{2010006001|XXGobject_psameas_object|715|0|1176|0|{metadata|in_metadata|1|0|}461|459|}
{2010601001|XXGgraph_vertex_vertex|716|0|1177|0|{Partition_by_Round_robin|}439|462|}
{2010212001|XXGvertex_oport_oport|717|0|1179|0|{0|out|}462|463|}
{2010211001|XXGvertex_iport_iport|718|0|1181|0|{0|in|}462|464|}
{2010214001|XXGiport_src_flow|719|0|1183|0|{0|}464|443|}
{2010007001|XXGobject_proto_object|720|0|1184|0|{}462|465|}
{2010212001|XXGvertex_oport_oport|721|0|1186|0|{0|out|}465|466|}
{2010006001|XXGobject_psameas_object|722|0|1188|0|{metadata|out_metadata|1|0|}466|465|}
{2010211001|XXGvertex_iport_iport|723|0|1189|0|{0|in|}465|467|}
{2010006001|XXGobject_psameas_object|724|0|1191|0|{metadata|in_metadata|1|0|}467|465|}
{2010601001|XXGgraph_vertex_vertex|725|0|1192|0|{stdout|}439|468|}
{2010211001|XXGvertex_iport_iport|726|0|1194|0|{0|write|}468|469|}
{2010214001|XXGiport_src_flow|727|0|1196|0|{0|}469|442|}
{2010007001|XXGobject_proto_object|728|0|1197|0|{}468|470|}
{2010211001|XXGvertex_iport_iport|729|0|1199|0|{0|write|}470|471|}
{2010006001|XXGobject_psameas_object|730|0|1201|0|{metadata|write_metadata|1|0|}471|470|}
{2010212001|XXGvertex_oport_oport|731|0|1202|0|{0|out|}439|472|}
{2010216002|XXGoport_binding_oport|732|0|1204|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}472|463|}
{2010211001|XXGvertex_iport_iport|733|0|1205|0|{0|in0|}439|473|}
{2010215002|XXGiport_binding_iport|734|0|1207|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}473|458|}
{2010211001|XXGvertex_iport_iport|735|0|1208|0|{1|in1|}439|474|}
{2010215002|XXGiport_binding_iport|736|0|1210|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}474|453|}
{2010212001|XXGvertex_oport_oport|737|0|1211|0|{0|out|}360|475|}
{2010216002|XXGoport_binding_oport|738|0|1213|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}475|398|}
{2010212001|XXGvertex_oport_oport|739|0|1214|0|{1|dups|}360|476|}
{2010216002|XXGoport_binding_oport|740|0|1216|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}476|379|}
{2010211001|XXGvertex_iport_iport|741|0|1217|0|{0|in|}360|477|}
{2010215002|XXGiport_binding_iport|742|0|1219|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}477|393|}
{2010006001|XXGobject_psameas_object|743|0|1220|0|{INPUT_DML|write_metadata|0|0|}287|478|}
{2010211001|XXGvertex_iport_iport|744|0|1222|0|{0|write|}478|479|}
{2010214001|XXGiport_src_flow|745|0|1224|0|{0|}479|270|}
{2010007001|XXGobject_proto_object|746|0|1225|0|{}478|480|}
{2010211001|XXGvertex_iport_iport|747|0|1227|0|{0|write|}480|481|}
{2010006001|XXGobject_psameas_object|748|0|1229|0|{metadata|write_metadata|1|0|}481|480|}
{2010601001|XXGgraph_vertex_vertex|749|0|1230|0|{Dups|}258|478|}
{2010601001|XXGgraph_vertex_vertex|750|0|1231|0|{Gather|}258|482|}
{2010212001|XXGvertex_oport_oport|751|0|1233|0|{0|out|}482|483|}
{2010213001|XXGoport_dst_flow|752|0|1235|0|{0|}483|274|}
{2010211001|XXGvertex_iport_iport|753|0|1236|0|{0|in|}482|484|}
{2010214001|XXGiport_src_flow|754|0|1238|0|{0|}484|272|}
{2010007001|XXGobject_proto_object|755|0|1239|0|{}482|485|}
{2010212001|XXGvertex_oport_oport|756|0|1241|0|{0|out|}485|486|}
{2010006001|XXGobject_psameas_object|757|0|1243|0|{metadata|out_metadata|1|0|}486|485|}
{2010211001|XXGvertex_iport_iport|758|0|1244|0|{0|in|}485|487|}
{2010006001|XXGobject_psameas_object|759|0|1246|0|{metadata|in_metadata|1|0|}487|485|}
{2010601001|XXGgraph_vertex_vertex|760|0|1247|0|{Gather_|}258|488|}
{2010212001|XXGvertex_oport_oport|761|0|1249|0|{0|out|}488|489|}
{2010211001|XXGvertex_iport_iport|762|0|1251|0|{0|in|}488|490|}
{2010214001|XXGiport_src_flow|763|0|1253|0|{0|}490|271|}
{2010214001|XXGiport_src_flow|764|0|1254|0|{1|}490|274|}
{2010007001|XXGobject_proto_object|765|0|1255|0|{}488|491|}
{2010212001|XXGvertex_oport_oport|766|0|1257|0|{0|out|}491|492|}
{2010006001|XXGobject_psameas_object|767|0|1259|0|{metadata|out_metadata|1|0|}492|491|}
{2010211001|XXGvertex_iport_iport|768|0|1260|0|{0|in|}491|493|}
{2010006001|XXGobject_psameas_object|769|0|1262|0|{metadata|in_metadata|1|0|}493|491|}
{2010601001|XXGgraph_vertex_vertex|770|0|1263|0|{Map_to_Output|}258|494|}
{2010212001|XXGvertex_oport_oport|771|0|1265|0|{0|source|}494|495|}
{2010213001|XXGoport_dst_flow|772|0|1267|0|{0|}495|273|}
{2010212001|XXGvertex_oport_oport|773|0|1268|0|{1|clean|}494|496|}
{2010213001|XXGoport_dst_flow|774|0|1270|0|{0|}496|268|}
{2010212001|XXGvertex_oport_oport|775|0|1271|0|{2|lkp|}494|497|}
{2010213001|XXGoport_dst_flow|776|0|1273|0|{0|}497|267|}
{2010212001|XXGvertex_oport_oport|777|0|1274|0|{3|reject0|}494|498|}
{2010212001|XXGvertex_oport_oport|778|0|1276|0|{4|reject1|}494|499|}
{2010212001|XXGvertex_oport_oport|779|0|1278|0|{5|reject2|}494|500|}
{2010212001|XXGvertex_oport_oport|780|0|1280|0|{6|error0|}494|501|}
{2010212001|XXGvertex_oport_oport|781|0|1282|0|{7|error1|}494|502|}
{2010212001|XXGvertex_oport_oport|782|0|1284|0|{8|error2|}494|503|}
{2010212001|XXGvertex_oport_oport|783|0|1286|0|{9|log|}494|504|}
{2010211001|XXGvertex_iport_iport|784|0|1288|0|{0|in|}494|505|}
{2010007001|XXGobject_proto_object|785|0|1290|0|{}494|506|}
{2010212001|XXGvertex_oport_oport|786|0|1292|0|{0|source|}506|507|}
{2010006001|XXGobject_psameas_object|787|0|1294|0|{metadata|out0_metadata|1|0|}507|506|}
{2010006001|XXGobject_psameas_object|788|0|1295|0|{transform0|transform0|1|0|}507|506|}
{2010212001|XXGvertex_oport_oport|789|0|1296|0|{1|clean|}506|508|}
{2010006001|XXGobject_psameas_object|790|0|1298|0|{metadata|out1_metadata|1|0|}508|506|}
{2010006001|XXGobject_psameas_object|791|0|1299|0|{transform1|transform1|1|0|}508|506|}
{2010212001|XXGvertex_oport_oport|792|0|1300|0|{2|lkp|}506|509|}
{2010006001|XXGobject_psameas_object|793|0|1302|0|{metadata|out2_metadata|1|0|}509|506|}
{2010006001|XXGobject_psameas_object|794|0|1303|0|{transform2|transform2|1|0|}509|506|}
{2010212001|XXGvertex_oport_oport|795|0|1304|0|{3|reject0|}506|510|}
{2010006001|XXGobject_psameas_object|796|0|1306|0|{metadata|reject0_metadata|1|0|}510|506|}
{2010212001|XXGvertex_oport_oport|797|0|1307|0|{4|reject1|}506|511|}
{2010006001|XXGobject_psameas_object|798|0|1309|0|{metadata|reject1_metadata|1|0|}511|506|}
{2010212001|XXGvertex_oport_oport|799|0|1310|0|{5|reject2|}506|512|}
{2010006001|XXGobject_psameas_object|800|0|1312|0|{metadata|reject2_metadata|1|0|}512|506|}
{2010212001|XXGvertex_oport_oport|801|0|1313|0|{6|error0|}506|513|}
{2010006001|XXGobject_psameas_object|802|0|1315|0|{metadata|error0_metadata|1|0|}513|506|}
{2010212001|XXGvertex_oport_oport|803|0|1316|0|{7|error1|}506|514|}
{2010006001|XXGobject_psameas_object|804|0|1318|0|{metadata|error1_metadata|1|0|}514|506|}
{2010212001|XXGvertex_oport_oport|805|0|1319|0|{8|error2|}506|515|}
{2010006001|XXGobject_psameas_object|806|0|1321|0|{metadata|error2_metadata|1|0|}515|506|}
{2010212001|XXGvertex_oport_oport|807|0|1322|0|{9|log|}506|516|}
{2010006001|XXGobject_psameas_object|808|0|1324|0|{metadata|log_metadata|1|0|}516|506|}
{2010211001|XXGvertex_iport_iport|809|0|1325|0|{0|in|}506|517|}
{2010006001|XXGobject_psameas_object|810|0|1327|0|{metadata|in_metadata|1|0|}517|506|}
{2010601001|XXGgraph_vertex_vertex|811|0|1328|0|{Merge|}258|518|}
{2010212001|XXGvertex_oport_oport|812|0|1330|0|{0|out|}518|519|}
{2010213001|XXGoport_dst_flow|813|0|1332|0|{0|}519|271|}
{2010211001|XXGvertex_iport_iport|814|0|1333|0|{0|in|}518|520|}
{2010214001|XXGiport_src_flow|815|0|1335|0|{0|}520|269|}
{2010007001|XXGobject_proto_object|816|0|1336|0|{}518|521|}
{2010212001|XXGvertex_oport_oport|817|0|1338|0|{0|out|}521|522|}
{2010006001|XXGobject_psameas_object|818|0|1340|0|{metadata|out_metadata|1|0|}522|521|}
{2010211001|XXGvertex_iport_iport|819|0|1341|0|{0|in|}521|523|}
{2010006001|XXGobject_psameas_object|820|0|1343|0|{metadata|in_metadata|1|0|}523|521|}
{2010212001|XXGvertex_oport_oport|821|0|1344|0|{0|source|}258|524|}
{2010216002|XXGoport_binding_oport|822|0|1346|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9906|}524|276|}
{2010212001|XXGvertex_oport_oport|823|0|1347|0|{1|clean|}258|525|}
{2010216002|XXGoport_binding_oport|824|0|1349|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9907|}525|282|}
{2010212001|XXGvertex_oport_oport|825|0|1350|0|{2|lookup|}258|526|}
{2010216002|XXGoport_binding_oport|826|0|1352|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9908|}526|489|}
{2010211001|XXGvertex_iport_iport|827|0|1353|0|{0|in0|}258|527|}
{2010215002|XXGiport_binding_iport|828|0|1355|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9905|}527|505|}
{2010109001|XXGobject_property_value|829|0|1356|0|{0|TrackingThumbprint|72|}1|528|}
