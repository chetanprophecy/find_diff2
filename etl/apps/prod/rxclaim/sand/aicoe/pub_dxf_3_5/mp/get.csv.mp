@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|401|rel_count|660|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|JOB_START_TIME|$[ (datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|RFK|YYYY-MM-DD HH24:MI:SS: The time when this job started.  Defaults to the partition start time, but for consistency across partitions, this should be provided by the calling plan.|{0|}}
{30001002|XXparameter|START_CHANGES_TIME||3|9|FK|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to "", which means include all dates.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|K|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|//setup your project detail in the intermediate pset|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|sample*.csv|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH|$AI_SERIAL_PENDING|3|9|RFK|@{0|}}
{30001002|XXparameter|FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|TARGET_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[string_split_no_empty(TARGET_LOWER,".")[0]]|3|9|FK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
{30001002|XXparameter|TARGET_SOURCE|$[string_split_no_empty(TARGET_LOWER,".")[1]]|3|9|FK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
{30001002|XXparameter|SKIP_HEADER_RECORD|False|13|1|FKl|Skip header record|{0|}}
{30001002|XXparameter|FIELD_SEPARATOR|,|15|2|RFK$|Field separator character(s) (defaults to comma)|{2|,|\\t|}}
{30001002|XXparameter|RECORD_SEPARATOR|'\\n'|15|2|RFK$|Record separator character(s) (defaults to newline)|{2|'\\n'|'\\r\\n'|}}
{30001002|XXparameter|ESCAPE_CHARACTER||3|2|FK$|Escape character|{0|}}
{30001002|XXparameter|QUOTE_ENCODED_BY_REPEAT|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|DO_SOURCE|0|13|9|FK|@{2|0|1|}}
{30001002|XXparameter|DO_CLEAN|0|13|9|FK|@{2|0|1|}}
{30001002|XXparameter|DO_LOOKUP|0|13|9|FK|@{2|0|1|}}
{30001002|XXparameter|GET_DML_FILE|$[ AI_DML + "/get." + TARGET_SYSTEM + "/get." + TARGET_LOWER + ".dml" ]|3|9|RK|@{0|}}
{30001002|XXparameter|GET_DML|$[ expand_type(read_type(GET_DML_FILE)) ]|3|9|RK|The record format for the source data.|{0|}}
{30001002|XXparameter|SOURCE_TYPE_NAME|source_$[ re_replace(TARGET_LOWER, "[^a-zA-Z0-9_]", "_") ]_t|3|9|RK|The type name to use in the source DML.|{0|}}
{30001002|XXparameter|ADDITIONAL_FIELDS_DML|record
end|3|9|RFK|Additional DML to be appended to the DMF header and prepended to the get DML.  Defaults to an empty record, which is ignored.|{0|}}
{30001002|XXparameter|GET_DML_PLUS_HEADER|/* Do Not Edit.  This file is generated automatically by combining
 * "$AI_DML/dxf_header.dml", any "$ADDITIONAL_FIELDS_DML", and
 * "$AI_DML/get.$TARGET_SYSTEM/get.$TARGET_LOWER.dml".
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
        GET_DML))))
];

metadata type = $SOURCE_TYPE_NAME;|3|9|K|The input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|AB_PARAMETER_ENV|3|10|Kd|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_LOWER + ".dat" ]|3|9|K|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + TARGET_SYSTEM + "/source." + TARGET_LOWER + ".dml" ]|3|9|RK|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_LOWER + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + TARGET_SYSTEM + "/lookup." + TARGET_LOWER + ".dml" ]|3|9|RK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|FILTER_EXPR|1|3|9|FK|@{0|}}
{30001002|XXparameter|RFMT_TRANSFORM||3|9|FK|@{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.default.xfr|3|9|FK|@{0|}}
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
{30001002|XXparameter|OUTPUT_DML|$[
if ( DO_SOURCE )
  SOURCE_DML
else if ( DO_CLEAN )
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
]|3|9|RO|\{field_1; ...; field_n\}: Fields to sort on for dedup.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|1|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$[ [vector EFFECTIVE_DATE_FIELD_NAME] ]|3|9|RFK|A vector of fields that are to be preserved from the earlier record when two matching, adjacent records are merged.  Typically, this is anything related to the start date.|{0|}}
{30001002|XXparameter|___ACE_Template_Parameters___||3|1|Kl||{0|}}
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
  result :: vector_concat(
    [vector (string(long))""],
    vector_sort_dedup_first(
      vector_concat(
        if ( INPUT_FILE_PATTERN == "" ) [vector] else [vector INPUT_FILE_PATTERN],
                directory_listing(INPUT_FILE_PATH, "*.csv"))));
end
]|3|9|RK|A vector of all the file patterns available in the Source Pending System directory, plus any existing source pattern.  The list begins with an empty entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|ACE_AVAILABLE_PATTERNS_DISPLAY_NAMES|$[ for ( let p in ACE_AVAILABLE_PATTERNS ) :
    if ( p == "" )
      "Please Select a Pattern."
    else
      p
]|3|9|RK|A vector of all the display names of the file patterns available in the Source Pending System directory, plus any existing pattern.  The list begins with a display entry to match if no pattern is selected.|{0|}}
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE_LIST:eme|$[AI_SERIAL_PENDING + "/test.csv"]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST:sandbox|$[directory_listing(INPUT_FILE_PATH, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:eme|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:sandbox|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:eme|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:sandbox|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_CLEAN_FLAG|1|13|2|RFK$|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|get.multi_csv|sripavan.pulikonda|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1666000|702000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{2|0|0|}Job 'get.csv' Execution Status Report


Job "get.csv" Execution started at Tuesday, July 03, 2018 05:19:04
***** Job execution failed at Tuesday, July 03, 2018 05:19:19 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:14
Run performed by user spulikon
Total data moved through all flows: 3 records (315 bytes)
Total CPU time (all processes): 8 seconds
Average CPU utilization across all nodes: 0.00 percent
||# Make sure the multifile directories exist.
for d in "$AI_MFS/source.$TARGET_SYSTEM" \\
         "$AI_MFS/clean.$TARGET_SYSTEM" \\
        "$AI_SERIAL_LOG/get.$TARGET_SYSTEM" \\
        "$AI_SERIAL/get.$TARGET_SYSTEM" \\
        "$AI_SERIAL_LOOKUP/lookup.$TARGET_SYSTEM" \\
        "$AI_MFS_REJECT/get.$TARGET_SYSTEM" \\
         "$AI_MFS/get.$TARGET_SYSTEM"; do
  d="$(echo $d \| sed 's/mfile://')"
  p="$(dirname "$d")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$d" ]] \|\| m_mkdir -mode 2775 "$d"
done


# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$TARGET_SYSTEM/get.csv.$TARGET_LOWER.summary.log $AB_REPORT"
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@HT2||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|32768|100|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@[ Optional Custom Filter Cond ]|481000|185000|0|0|0|0|7037|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@[ Optional Custom Transform ]|701000|170000|0|0|0|0|14275|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@[Compressed Files.]|282000|540750|0|0|0|0|2955|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@[Uncompressed Files.]|27000|525750|0|0|0|0|2950|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@[ Assign values for DXF header fields ]|886000|170000|0|0|0|0|7038|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@TARGET_NAME - $TARGET_NAME  |311000|66000|0|0|0|0|14167|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|17|0|33|0|{@{}@Filter header record
is moved to RMF|158000|333000|0|0|0|0|14270|}}
{2010242002|XXGface|18|0|35|0|{@{}@Arial|32768|100|1|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14284|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}14267|19|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14258|2065|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}14210|17|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}2956|2065|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}14205|18|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}6971|2065|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}14285|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}14281|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}14280|17|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}14232|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}14268|17|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}14262|17|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}14212|2065|}}
{2010501005|XXGpvertex|33|0|65|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform0|$\{RFMT_TRANSFORM\}|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(RFMT_TRANSFORM)]|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|704000|204000|0|0|0|0|14234|Apply Cleanse|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|34|0|67|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|35|0|70|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|36|0|72|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|37|0|74|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|38|0|76|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|39|0|79|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|40|0|81|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|41|0|85|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|42|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|43|0|91|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|44|0|94|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|45|0|97|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") filename;
end;|3|1|l|@{0|}}
{30001002|XXparameter|num_records|$[length_of(FILE_LIST)]|3|9||@{0|}}
{30001002|XXparameter|transform|let string(int)[int] filenames = $[string_representation(FILE_LIST)];


out::create(index)=
begin
        out.filename:: $'INPUT_FILE_PATH' + "/" + filenames[index - 1];

end;|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_PENDING|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[length_of(FILE_LIST) >= 1]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|25000|219000|0|0|0|0|14279|List files|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|46|0|99|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|47|0|102|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|48|0|104|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|49|0|106|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|Create Data|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|50|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|51|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|52|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|53|0|117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Read_Separated_Values.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|field_separator||3|8|=|@{0|}}
{30001002|XXparameter|record_separator||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types('record\\n  string("\\\\x01") filename;\\nend;', GET_DML) ]|3|9||@{0|}}
{30001002|XXparameter|escape_character||3|8|=|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Read Separated Values|334000|195000|0|0|0|0|14263|Parse Seperated Values|Ab Initio Software|Built-in 2.11:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|54|0|119|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|55|0|122|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010202004|XXGiport|56|0|124|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|57|0|127|0|{Reads comma-separated values, tab-separated values, and like data.  Supports a variety of quoting and escaping conventions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|read-sv|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/read-sv|3|2|H$||{0|}}
{30001002|XXparameter|field_separator||3|2|FK$|Field separator character(s) (defaults to comma)|{0|}}
{30001002|XXparameter|field_separator.display_name|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|field_separator.keyword|field-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator||3|2|FK$|Record separator character(s) (defaults to newline)|{0|}}
{30001002|XXparameter|record_separator.display_name|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|record_separator.keyword|record-separator|3|9|P|@{0|}}
{30001002|XXparameter|quote_character||3|2|FK$|Quote character (defaults to "; use 'none' if no quote character)|{0|}}
{30001002|XXparameter|quote_character.display_name|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_character.keyword|quote-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character||3|2|FK$|Escape character|{0|}}
{30001002|XXparameter|escape_character.display_name|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|escape_character.keyword|escape-character|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat|False|13|1|FKl|Quote character is encoded by repeating (rather than escaping)|{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.display_name|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|quote_encoded_by_repeat.keyword|quote-encoded-by-repeat|3|9|P|@{0|}}
{30001002|XXparameter|add_fields_if_needed|False|13|1|FKl|Pad record with blank fields if necessary|{0|}}
{30001002|XXparameter|add_fields_if_needed.display_name|add-fields-if-needed|3|9|P|@{0|}}
{30001002|XXparameter|add_fields_if_needed.keyword|add-fields-if-needed|3|9|P|@{0|}}
{30001002|XXparameter|ignore_extra_fields|False|13|1|FKl|Ignore extra fields if present|{0|}}
{30001002|XXparameter|ignore_extra_fields.display_name|ignore-extra-fields|3|9|P|@{0|}}
{30001002|XXparameter|ignore_extra_fields.keyword|ignore-extra-fields|3|9|P|@{0|}}
{30001002|XXparameter|skip_header_record|False|13|1|FKl|Skip header record|{0|}}
{30001002|XXparameter|skip_header_record.display_name|skip-header-record|3|9|P|@{0|}}
{30001002|XXparameter|skip_header_record.keyword|skip-header-record|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one|False|13|1|FKl|Treat adjacent field delimiters as one|{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.display_name|treat-adjacent-delimiters-as-one|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.keyword|treat-adjacent-delimiters-as-one|3|9|P|@{0|}}
{30001002|XXparameter|treat_adjacent_delimiters_as_one.condition|version 2.12:|3|15|P?|@{0|}}
{30001002|XXparameter|remove_bom|False|13|1|FKl|Remove the byte-order-mark if it exists at the beginning of the data.|{0|}}
{30001002|XXparameter|remove_bom.display_name|remove-bom|3|9|P|@{0|}}
{30001002|XXparameter|remove_bom.keyword|remove-bom|3|9|P|@{0|}}
{30001002|XXparameter|remove_bom.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|initial_quote_only|False|13|1|FKl|Only interpret quote characters in a field if the first character in the field is a quote.|{0|}}
{30001002|XXparameter|initial_quote_only.display_name|initial-quote-only|3|9|P|@{0|}}
{30001002|XXparameter|initial_quote_only.keyword|initial-quote-only|3|9|P|@{0|}}
{30001002|XXparameter|initial_quote_only.condition|version 2.15:|3|15|P?|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=all_to_all(in); out=all_to_all(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|Read Separated Values|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|58|0|129|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|59|0|132|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010202004|XXGiport|60|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|61|0|141|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/

type input_type =
record
string($RECORD_SEPARATOR) data;
end;

filename::get_filename(in)=
begin
filename :: in.filename;
end;

out :: reformat(read, filename, in) =
begin
  out.filename :: re_replace(filename, '/.*/', ''); // Removing absolute file path to reduce the file space.
  out.* :: read.*;
end;|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
string($'FIELD_SEPARATOR') filename;
string($RECORD_SEPARATOR) data;
end|3|9||@{0|}}
{30001002|XXparameter|filter|Range (Read a subset of records from each file)|3|1|l|@{0|}}
{30001002|XXparameter|skip_count|$[if(SKIP_HEADER_RECORD) 1 else 0 ]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Files|159000|214000|0|0|0|0|14286|Read All Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|62|0|143|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|63|0|146|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|64|0|148|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|65|0|150|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|66|0|152|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|67|0|154|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|68|0|156|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|69|0|159|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'rcfile' (RCFile format).|{5|uninterpreted|seqfile|parquet|orc|rcfile|}}
{30001002|XXparameter|format.condition|param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format parquet True value format orc True value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RCFile, ORC File, or Parquet File. Column numbers are zero-based. For ORC file and Parquet file, if this is set, the direct name mapping via DML field names will be ignored.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
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
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,filereject,fileerror,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|70|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|71|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|72|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|73|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|74|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|75|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|76|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|77|0|189|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|524000|204000|0|0|0|0|14231|Filter records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|78|0|191|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|79|0|194|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|80|0|196|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|81|0|198|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|82|0|200|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|202|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|205|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|85|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|86|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|87|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|88|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|89|0|219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|91|0|230|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.csv.$TARGET_LOWER.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.csv.$TARGET_LOWER.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
}}@0|@1267000|401500|872000|443000|56000|50000|14271|Get Job Log|Ab Initio Software||1|205|0||6||33025|-1|-1|}}
{2010202004|XXGiport|92|0|232|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|93|0|235|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|94|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|95|0|241|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE_URL.gz|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|@237000|629750|0|0|0|0|6972|MFS File|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|96|0|243|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|97|0|246|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|98|0|248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|99|0|251|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@57000|629750|0|0|0|0|2947|MFS File-1|Ab Initio Software|@1|205|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|100|0|253|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|101|0|255|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|102|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|103|0|262|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|commandline|ksh -c -e 'find $INPUT_FILE_PATH/ -type f -name "$INPUT_FILE_PATTERN" \| grep -v processed \| xargs -I \{\} mv \{\} $INPUT_FILE_PATH/processed/'|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ if ( SOURCE_FILE_CLEAN_FLAG != 0  ) 1 else 0 ]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Run_Program.mpc|3|2|Pf$|@{0|}}
}}@1|@705000|463000|1049000|30000|156000|145000|14283|Moves files to processed directory|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|264|0|{@{}@1204000|99000|11000|11000|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|105|0|266|0|{@{}@1039000|99000|11000|11000|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|106|0|268|0|{Executes a standard UNIX or Windows program.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|filter|3|1|Hl||{0|}}
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
{2010203004|XXGoport|107|0|270|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2260|0|}}
{2010202004|XXGiport|108|0|273|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@1732|0|}}
{2010501005|XXGpvertex|109|0|276|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$READ_DB_NORMALIZE_XFR_FILE|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|$[ OUTPUT_DML ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@914952|191880|683000|208000|145000|126000|14269|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|110|0|278|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|111|0|281|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|112|0|283|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|113|0|285|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|114|0|288|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|115|0|291|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|116|0|293|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|117|0|296|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|118|0|299|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|119|0|302|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|120|0|305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|121|0|311|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CLEAN_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1572913|223047|1153000|334000|56000|50000|14259|Optional: Clean|Ab Initio Software||1|100000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|122|0|313|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|123|0|316|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1400276304|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|124|0|318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|125|0|321|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1577913|378047|1153000|434000|56000|50000|14211|Optional: Lookup|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|126|0|323|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|127|0|326|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1400276304|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|128|0|328|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|129|0|331|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SOURCE_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|3\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@1572913|98047|1153000|234000|56000|50000|14213|Optional: Source|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|130|0|333|0|{@{}@1143000|254000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|131|0|336|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1400276304|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|132|0|338|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|133|0|342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|1149000|234000|0|0|0|0|14182|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|134|0|344|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|135|0|347|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|136|0|350|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|137|0|352|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|138|0|355|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|139|0|362|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
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
  out.type_of_input :: 'csv'; /* Or 'file' or 'ftp' */
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
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|1076000|383000|0|0|0|0|14282|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|140|0|364|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|141|0|367|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|142|0|369|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|143|0|371|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|144|0|373|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|145|0|376|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|146|0|378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|147|0|381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|148|0|384|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|149|0|387|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|150|0|390|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|151|0|397|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$OUTPUT_FILE_URL.gz|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|@234000|456750|0|0|0|0|2957|Serial File|Ab Initio Software|@1|205|0||6||33089|-1|-1|}}
{2010203004|XXGoport|152|0|399|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|153|0|402|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|154|0|404|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|155|0|407|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$OUTPUT_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@54000|451750|0|0|0|0|2977|Serial File-1|Ab Initio Software|@1|100|0||6||33089|-1|-1|}}
{2010203004|XXGoport|156|0|409|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|157|0|411|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|Fsl||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|158|0|413|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|159|0|418|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|382000|448250|0|0|0|0|2951|Trash-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|160|0|420|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|161|0|423|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|162|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|163|0|430|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|397000|618250|0|0|0|0|2952|Trash-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|164|0|432|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|165|0|435|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|166|0|437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|167|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
}}@0|@77000|39000|0|0|0|0|14219|Version Log|Sripavan Pulikonda|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|853000|349000|3|}}
{2010240003|XXGlegend|168|0|444|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|169|0|446|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|170|0|448|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|171|0|450|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|172|0|452|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|173|0|454|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|174|0|456|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|175|0|458|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|176|0|460|0|{@{}@Initial version|412000|268000|0|0|0|0|1532|}}
{2010242002|XXGface|177|0|462|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|178|0|464|0|{@{}@May 13 2016|82000|268000|0|0|0|0|1530|}}
{2010242002|XXGface|179|0|466|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|180|0|468|0|{@{}@1.0|17000|268000|0|0|0|0|1528|}}
{2010242002|XXGface|181|0|470|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|182|0|472|0|{@{}@Sripavan Pulikonda (Exusia)|187000|268000|0|0|0|0|1531|}}
{2010242002|XXGface|183|0|474|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|184|0|476|0|{@{}@Summary:

1. This graph reads the CSV file from INPUT_FILE_PATH location mathing INPUT_FILE_PATTTERN.
2. This process creates SOURCE / CLEAN files in AI_MFS location and also applies compression based on option provided.
3. And creates LOOKUP files either in AI_SERIAL_LOOKUP or AI_MFS_LOOKUP location and also applies compression and partitions if key is provided.|15000|42500|0|0|0|0|1533|}}
{2010242002|XXGface|185|0|478|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|186|0|480|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|135000|0|0|0|0|1529|}}
{2010242002|XXGface|187|0|482|0|{@{}@Candara|0|100|0|}}
{2010600005|XXGgraph|188|0|484|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
{30001002|XXparameter|EFFECTIVE_DATE_FIELD_NAME|$EFFECTIVE_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the start of the interval, if any.  This is often set to the effective start date.  Defaults to the interval_bottom field in the lookup key, if any.|{0|}}
{30001002|XXparameter|END_DATE_FIELD_NAME|$END_DATE_FIELD_NAME|3|9|FK|Optional: The name of the field that contains the end of the interval, if any.  This is often set to the effective end date or termination date.  Defaults to the interval_top field in the lookup key, if any.|{0|}}
{30001002|XXparameter|ADJACENT_INTERVAL_MICROSECONDS|$ADJACENT_INTERVAL_MICROSECONDS|3|9|FK|#: The number of microseconds between adjacent effective and end dates.  Typically 1 or 1000000 (a second) or 86400000000 (a day).|{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$DEDUP_SORT_KEY|3|9|RFK|\{key1; key2...\}: The key to sort by, before the dedup.  All key fields must be present in the input DML.  Defaults to a value based on the dedup key.  For Type 2 loads, set this to the dedup key plus the end effective date.  We keep the shorter records on the theory that they would be newer.|{0|}}
{30001002|XXparameter|KEEP_FROM_FIRST_VEC|$KEEP_FROM_FIRST_VEC|3|9|RFK|A vector of fields that should be copied from the earlier record when two matching, adjacent records are merged.  Defaults to the effective date and DMF matching effective date, if any.|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|STEP|get|3|9|RFK|The step name.  Used to prefix the Dups reject file name.|{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$TARGET_SYSTEM/$STEP.$TARGET_LOWER.dups.dat.gz|3|9|FK|@{0|}}
{30001002|XXparameter|FIX_END_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|FIX_EFFECTIVE_DATE|False|13|9|RFK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1510140317|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition|$[length_of(FILE_LIST) >= 1]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@1283000|195500|0|0|892000|502000|14209|prepare output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|3|}}
{2010240003|XXGlegend|189|0|486|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|190|0|488|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|191|0|490|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|192|0|492|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|193|0|494|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|194|0|496|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|195|0|498|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|196|0|500|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|197|0|502|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9948|17|}}
{2010210004|XXGflow|198|0|504|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9947|17|}}
{2010210004|XXGflow|199|0|506|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9920|1043|}}
{2010210004|XXGflow|200|0|508|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9940|2065|}}
{2010210004|XXGflow|201|0|510|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|202|0|512|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9921|19|}}
{2010210004|XXGflow|203|0|514|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9946|17|}}
{2010210004|XXGflow|204|0|516|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|205|0|518|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|206|0|520|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|207|0|522|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|208|0|525|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|209|0|527|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|210|0|530|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|211|0|536|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|212|0|538|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|213|0|540|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|214|0|543|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|215|0|545|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|216|0|548|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|217|0|554|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
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
{2010240003|XXGlegend|218|0|556|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|219|0|558|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|220|0|560|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|221|0|562|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|222|0|564|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|223|0|566|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|224|0|568|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|225|0|570|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|226|0|572|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|227|0|574|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|228|0|576|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|229|0|578|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|230|0|580|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|231|0|582|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|232|0|584|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|233|0|586|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|234|0|588|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|235|0|590|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|236|0|593|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|237|0|595|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|238|0|597|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|239|0|599|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|240|0|601|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|241|0|604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|protection|0644|3|2|$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9941|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|242|0|606|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|243|0|609|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|244|0|611|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|245|0|618|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|246|0|620|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|247|0|623|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|248|0|625|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9949|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|249|0|627|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|250|0|630|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|251|0|633|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|252|0|636|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|253|0|638|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|254|0|640|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|255|0|642|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|256|0|644|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|257|0|646|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|258|0|648|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|259|0|650|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|260|0|652|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|261|0|654|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|262|0|658|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|263|0|662|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|264|0|666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|265|0|669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|266|0|672|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|267|0|675|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|268|0|678|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|269|0|681|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|270|0|684|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|271|0|687|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|272|0|698|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|273|0|700|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|274|0|702|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|275|0|708|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6816|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|276|0|710|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|277|0|713|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|278|0|715|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|279|0|717|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|280|0|719|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|281|0|726|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6835|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|282|0|728|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|283|0|731|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|284|0|733|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|285|0|735|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|286|0|737|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|287|0|744|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|288|0|746|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|289|0|749|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|290|0|755|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|291|0|757|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|292|0|760|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|293|0|766|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|294|0|771|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|295|0|775|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|296|0|779|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{2010240003|XXGlegend|297|0|781|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|298|0|783|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|299|0|785|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|300|0|787|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|301|0|789|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|302|0|791|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|303|0|793|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6826|}}
{2010242002|XXGface|304|0|795|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|305|0|797|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|306|0|799|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|307|0|801|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6818|17|}}
{2010210004|XXGflow|308|0|803|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6817|20|}}
{2010210004|XXGflow|309|0|805|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6833|17|}}
{2010210004|XXGflow|310|0|807|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6834|17|}}
{2010210004|XXGflow|311|0|809|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6828|17|}}
{2010210004|XXGflow|312|0|811|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6815|17|}}
{2010501005|XXGpvertex|313|0|813|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|314|0|815|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|315|0|818|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|316|0|820|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|317|0|822|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|318|0|824|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|319|0|826|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|320|0|829|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|321|0|831|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|322|0|834|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|323|0|837|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|324|0|840|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|325|0|843|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|326|0|846|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|327|0|849|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|328|0|851|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|329|0|854|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|330|0|856|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|331|0|858|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|332|0|861|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|333|0|865|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|334|0|867|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|335|0|869|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|336|0|872|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403552|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|337|0|874|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|338|0|877|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|339|0|880|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
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
{2010203004|XXGoport|340|0|882|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|341|0|885|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|342|0|887|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|343|0|889|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|344|0|891|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|345|0|894|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|346|0|896|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|347|0|899|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|348|0|902|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|349|0|905|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|350|0|908|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|351|0|911|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
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
{2010203004|XXGoport|352|0|913|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|353|0|916|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|354|0|918|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|355|0|920|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|356|0|922|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|357|0|925|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{2010203004|XXGoport|358|0|927|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|359|0|930|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|360|0|933|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|361|0|936|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|362|0|939|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|363|0|942|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6819|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|364|0|944|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|365|0|947|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|366|0|950|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|367|0|952|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|368|0|955|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|369|0|958|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(EFFECTIVE_DATE_FIELD_NAME) &&
   not is_blank(END_DATE_FIELD_NAME)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6829|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|370|0|960|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|371|0|963|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|372|0|966|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|373|0|968|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|374|0|971|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|375|0|974|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|376|0|977|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|377|0|980|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|378|0|987|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|379|0|989|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|380|0|992|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|381|0|995|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|382|0|997|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|383|0|1000|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|384|0|1005|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|385|0|1007|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|386|0|1009|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|387|0|1013|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|388|0|1015|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|389|0|1018|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|390|0|1025|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|391|0|1027|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|392|0|1030|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|393|0|1033|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|394|0|1035|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|395|0|1038|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|396|0|1043|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|397|0|1047|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|398|0|1051|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|399|0|1055|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|400|0|1059|0|{@{}@{1|3940112|}}}
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
{2010605001|XXGgraph_legend_legend|14|0|28|0|{5|}1|15|}
{2010241001|XXGlegend_face_face|15|0|30|0|{}15|16|}
{2010605001|XXGgraph_legend_legend|16|0|32|0|{6|}1|17|}
{2010241001|XXGlegend_face_face|17|0|34|0|{}17|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_1|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_10|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_11|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_12|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_19|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_2|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_20|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_3|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_4|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_5|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_6|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_7|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_8|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_9|}1|32|}
{2010601001|XXGgraph_vertex_vertex|32|0|64|0|{Apply_Cleanse|}1|33|}
{2010212001|XXGvertex_oport_oport|33|0|66|0|{0|out0|}33|34|}
{2010213001|XXGoport_dst_flow|34|0|68|0|{0|}34|20|}
{2010212001|XXGvertex_oport_oport|35|0|69|0|{1|reject0|}33|35|}
{2010212001|XXGvertex_oport_oport|36|0|71|0|{2|error0|}33|36|}
{2010212001|XXGvertex_oport_oport|37|0|73|0|{3|log|}33|37|}
{2010211001|XXGvertex_iport_iport|38|0|75|0|{0|in|}33|38|}
{2010214001|XXGiport_src_flow|39|0|77|0|{0|}38|29|}
{2010007001|XXGobject_proto_object|40|0|78|0|{}33|39|}
{2010212001|XXGvertex_oport_oport|41|0|80|0|{0|out0|}39|40|}
{2010006001|XXGobject_psameas_object|42|0|82|0|{metadata|out0_metadata|1|0|}40|39|}
{2010006001|XXGobject_psameas_object|43|0|83|0|{transform0|transform0|1|0|}40|39|}
{2010212001|XXGvertex_oport_oport|44|0|84|0|{1|reject0|}39|41|}
{2010006001|XXGobject_psameas_object|45|0|86|0|{metadata|reject0_metadata|1|0|}41|39|}
{2010212001|XXGvertex_oport_oport|46|0|87|0|{2|error0|}39|42|}
{2010006001|XXGobject_psameas_object|47|0|89|0|{metadata|error0_metadata|1|0|}42|39|}
{2010212001|XXGvertex_oport_oport|48|0|90|0|{3|log|}39|43|}
{2010006001|XXGobject_psameas_object|49|0|92|0|{metadata|log_metadata|1|0|}43|39|}
{2010211001|XXGvertex_iport_iport|50|0|93|0|{0|in|}39|44|}
{2010006001|XXGobject_psameas_object|51|0|95|0|{metadata|in_metadata|1|0|}44|39|}
{2010006001|XXGobject_psameas_object|52|0|96|0|{Layout|Layout|0|0|}33|45|}
{2010212001|XXGvertex_oport_oport|53|0|98|0|{0|out|}45|46|}
{2010213001|XXGoport_dst_flow|54|0|100|0|{0|}46|19|}
{2010212001|XXGvertex_oport_oport|55|0|101|0|{1|error|}45|47|}
{2010212001|XXGvertex_oport_oport|56|0|103|0|{2|log|}45|48|}
{2010007001|XXGobject_proto_object|57|0|105|0|{}45|49|}
{2010212001|XXGvertex_oport_oport|58|0|107|0|{0|out|}49|50|}
{2010006001|XXGobject_psameas_object|59|0|109|0|{metadata|out_metadata|1|0|}50|49|}
{2010212001|XXGvertex_oport_oport|60|0|110|0|{1|error|}49|51|}
{2010006001|XXGobject_psameas_object|61|0|112|0|{metadata|error_metadata|1|0|}51|49|}
{2010212001|XXGvertex_oport_oport|62|0|113|0|{2|log|}49|52|}
{2010006001|XXGobject_psameas_object|63|0|115|0|{metadata|log_metadata|1|0|}52|49|}
{2010006001|XXGobject_psameas_object|64|0|116|0|{in_metadata|out_metadata|0|0|}33|53|}
{2010212001|XXGvertex_oport_oport|65|0|118|0|{0|out|}53|54|}
{2010213001|XXGoport_dst_flow|66|0|120|0|{0|}54|31|}
{2010212001|XXGvertex_oport_oport|67|0|121|0|{1|reject|}53|55|}
{2010211001|XXGvertex_iport_iport|68|0|123|0|{0|in|}53|56|}
{2010214001|XXGiport_src_flow|69|0|125|0|{0|}56|26|}
{2010007001|XXGobject_proto_object|70|0|126|0|{}53|57|}
{2010212001|XXGvertex_oport_oport|71|0|128|0|{0|out|}57|58|}
{2010006001|XXGobject_psameas_object|72|0|130|0|{metadata|out_metadata|1|0|}58|57|}
{2010212001|XXGvertex_oport_oport|73|0|131|0|{1|reject|}57|59|}
{2010006001|XXGobject_psameas_object|74|0|133|0|{metadata|reject_metadata|1|0|}59|57|}
{2010211001|XXGvertex_iport_iport|75|0|134|0|{0|in|}57|60|}
{2010006001|XXGobject_psameas_object|76|0|136|0|{metadata|in_metadata|1|0|}60|57|}
{2010006001|XXGobject_psameas_object|77|0|137|0|{Layout|Layout|0|0|}53|45|}
{2010006001|XXGobject_psameas_object|78|0|138|0|{escape_character|ESCAPE_CHARACTER|1|0|}53|1|}
{2010006001|XXGobject_psameas_object|79|0|139|0|{field_separator|FIELD_SEPARATOR|1|0|}53|1|}
{2010006001|XXGobject_psameas_object|80|0|140|0|{in_metadata|out_metadata|0|0|}53|61|}
{2010212001|XXGvertex_oport_oport|81|0|142|0|{0|out|}61|62|}
{2010213001|XXGoport_dst_flow|82|0|144|0|{0|}62|26|}
{2010212001|XXGvertex_oport_oport|83|0|145|0|{1|filereject|}61|63|}
{2010212001|XXGvertex_oport_oport|84|0|147|0|{2|fileerror|}61|64|}
{2010212001|XXGvertex_oport_oport|85|0|149|0|{3|reject|}61|65|}
{2010212001|XXGvertex_oport_oport|86|0|151|0|{4|error|}61|66|}
{2010212001|XXGvertex_oport_oport|87|0|153|0|{5|log|}61|67|}
{2010211001|XXGvertex_iport_iport|88|0|155|0|{0|in|}61|68|}
{2010214001|XXGiport_src_flow|89|0|157|0|{0|}68|19|}
{2010007001|XXGobject_proto_object|90|0|158|0|{}61|69|}
{2010212001|XXGvertex_oport_oport|91|0|160|0|{0|out|}69|70|}
{2010006001|XXGobject_psameas_object|92|0|162|0|{metadata|out_metadata|1|0|}70|69|}
{2010212001|XXGvertex_oport_oport|93|0|163|0|{1|filereject|}69|71|}
{2010006001|XXGobject_psameas_object|94|0|165|0|{metadata|filereject_metadata|1|0|}71|69|}
{2010212001|XXGvertex_oport_oport|95|0|166|0|{2|fileerror|}69|72|}
{2010006001|XXGobject_psameas_object|96|0|168|0|{metadata|fileerror_metadata|1|0|}72|69|}
{2010212001|XXGvertex_oport_oport|97|0|169|0|{3|reject|}69|73|}
{2010006001|XXGobject_psameas_object|98|0|171|0|{metadata|reject_metadata|1|0|}73|69|}
{2010212001|XXGvertex_oport_oport|99|0|172|0|{4|error|}69|74|}
{2010006001|XXGobject_psameas_object|100|0|174|0|{metadata|error_metadata|1|0|}74|69|}
{2010212001|XXGvertex_oport_oport|101|0|175|0|{5|log|}69|75|}
{2010006001|XXGobject_psameas_object|102|0|177|0|{metadata|log_metadata|1|0|}75|69|}
{2010211001|XXGvertex_iport_iport|103|0|178|0|{0|in|}69|76|}
{2010006001|XXGobject_psameas_object|104|0|180|0|{metadata|in_metadata|1|0|}76|69|}
{2010006001|XXGobject_psameas_object|105|0|181|0|{Layout|Layout|0|0|}61|45|}
{2010006001|XXGobject_psameas_object|106|0|182|0|{filereject_metadata|out_metadata|0|0|}61|45|}
{2010006001|XXGobject_psameas_object|107|0|183|0|{in_metadata|out_metadata|0|0|}61|45|}
{2010006001|XXGobject_psameas_object|108|0|184|0|{quote_encoded_by_repeat|QUOTE_ENCODED_BY_REPEAT|1|0|}53|1|}
{2010006001|XXGobject_psameas_object|109|0|185|0|{record_separator|RECORD_SEPARATOR|1|0|}53|1|}
{2010006001|XXGobject_psameas_object|110|0|186|0|{out0_metadata|out_metadata|0|0|}33|53|}
{2010006001|XXGobject_psameas_object|111|0|187|0|{reject0_metadata|out_metadata|0|0|}33|53|}
{2010601001|XXGgraph_vertex_vertex|112|0|188|0|{Filter_records|}1|77|}
{2010212001|XXGvertex_oport_oport|113|0|190|0|{0|out|}77|78|}
{2010213001|XXGoport_dst_flow|114|0|192|0|{0|}78|29|}
{2010212001|XXGvertex_oport_oport|115|0|193|0|{1|deselect|}77|79|}
{2010212001|XXGvertex_oport_oport|116|0|195|0|{2|reject|}77|80|}
{2010212001|XXGvertex_oport_oport|117|0|197|0|{3|error|}77|81|}
{2010212001|XXGvertex_oport_oport|118|0|199|0|{4|log|}77|82|}
{2010211001|XXGvertex_iport_iport|119|0|201|0|{0|in|}77|83|}
{2010214001|XXGiport_src_flow|120|0|203|0|{0|}83|31|}
{2010007001|XXGobject_proto_object|121|0|204|0|{}77|84|}
{2010212001|XXGvertex_oport_oport|122|0|206|0|{0|out|}84|85|}
{2010006001|XXGobject_psameas_object|123|0|208|0|{metadata|out_metadata|1|0|}85|84|}
{2010212001|XXGvertex_oport_oport|124|0|209|0|{1|deselect|}84|86|}
{2010006001|XXGobject_psameas_object|125|0|211|0|{metadata|deselect_metadata|1|0|}86|84|}
{2010212001|XXGvertex_oport_oport|126|0|212|0|{2|reject|}84|87|}
{2010006001|XXGobject_psameas_object|127|0|214|0|{metadata|reject_metadata|1|0|}87|84|}
{2010212001|XXGvertex_oport_oport|128|0|215|0|{3|error|}84|88|}
{2010006001|XXGobject_psameas_object|129|0|217|0|{metadata|error_metadata|1|0|}88|84|}
{2010212001|XXGvertex_oport_oport|130|0|218|0|{4|log|}84|89|}
{2010006001|XXGobject_psameas_object|131|0|220|0|{metadata|log_metadata|1|0|}89|84|}
{2010211001|XXGvertex_iport_iport|132|0|221|0|{0|in|}84|90|}
{2010006001|XXGobject_psameas_object|133|0|223|0|{metadata|in_metadata|1|0|}90|84|}
{2010006001|XXGobject_psameas_object|134|0|224|0|{Layout|Layout|0|0|}77|45|}
{2010006001|XXGobject_psameas_object|135|0|225|0|{deselect_metadata|out_metadata|0|0|}77|53|}
{2010006001|XXGobject_psameas_object|136|0|226|0|{in_metadata|out_metadata|0|0|}77|53|}
{2010006001|XXGobject_psameas_object|137|0|227|0|{out_metadata|out_metadata|0|0|}77|53|}
{2010006001|XXGobject_psameas_object|138|0|228|0|{reject_metadata|out_metadata|0|0|}77|53|}
{2010601001|XXGgraph_vertex_vertex|139|0|229|0|{Get_Job_Log|}1|91|}
{2010211001|XXGvertex_iport_iport|140|0|231|0|{0|write|}91|92|}
{2010214001|XXGiport_src_flow|141|0|233|0|{0|}92|27|}
{2010007001|XXGobject_proto_object|142|0|234|0|{}91|93|}
{2010211001|XXGvertex_iport_iport|143|0|236|0|{0|write|}93|94|}
{2010006001|XXGobject_psameas_object|144|0|238|0|{metadata|write_metadata|1|0|}94|93|}
{2010601001|XXGgraph_vertex_vertex|145|0|239|0|{List_files|}1|45|}
{2010601001|XXGgraph_vertex_vertex|146|0|240|0|{MFS_File|}1|95|}
{2010212001|XXGvertex_oport_oport|147|0|242|0|{0|read|}95|96|}
{2010213001|XXGoport_dst_flow|148|0|244|0|{0|}96|25|}
{2010007001|XXGobject_proto_object|149|0|245|0|{}95|97|}
{2010212001|XXGvertex_oport_oport|150|0|247|0|{0|read|}97|98|}
{2010006001|XXGobject_psameas_object|151|0|249|0|{metadata|read_metadata|1|0|}98|97|}
{2010006001|XXGobject_psameas_object|152|0|250|0|{read_metadata|read_metadata|0|0|}95|99|}
{2010212001|XXGvertex_oport_oport|153|0|252|0|{0|read|}99|100|}
{2010007001|XXGobject_proto_object|154|0|254|0|{}99|101|}
{2010212001|XXGvertex_oport_oport|155|0|256|0|{0|read|}101|102|}
{2010006001|XXGobject_psameas_object|156|0|258|0|{metadata|read_metadata|1|0|}102|101|}
{2010006001|XXGobject_psameas_object|157|0|259|0|{read_metadata|out_metadata|0|0|}99|53|}
{2010601001|XXGgraph_vertex_vertex|158|0|260|0|{MFS_File_1|}1|99|}
{2010601001|XXGgraph_vertex_vertex|159|0|261|0|{Moves_files_to_processed_directory|}1|103|}
{2010212001|XXGvertex_oport_oport|160|0|263|0|{0|out|}103|104|}
{2010211001|XXGvertex_iport_iport|161|0|265|0|{0|in|}103|105|}
{2010007001|XXGobject_proto_object|162|0|267|0|{}103|106|}
{2010212001|XXGvertex_oport_oport|163|0|269|0|{0|out|}106|107|}
{2010006001|XXGobject_psameas_object|164|0|271|0|{metadata|out_metadata|1|0|}107|106|}
{2010211001|XXGvertex_iport_iport|165|0|272|0|{0|in|}106|108|}
{2010006001|XXGobject_psameas_object|166|0|274|0|{metadata|in_metadata|1|0|}108|106|}
{2010601001|XXGgraph_vertex_vertex|167|0|275|0|{Normalize_Add_Job_ID_Record_Count|}1|109|}
{2010212001|XXGvertex_oport_oport|168|0|277|0|{0|out|}109|110|}
{2010213001|XXGoport_dst_flow|169|0|279|0|{0|}110|30|}
{2010212001|XXGvertex_oport_oport|170|0|280|0|{1|reject|}109|111|}
{2010212001|XXGvertex_oport_oport|171|0|282|0|{2|error|}109|112|}
{2010212001|XXGvertex_oport_oport|172|0|284|0|{3|log|}109|113|}
{2010213001|XXGoport_dst_flow|173|0|286|0|{0|}113|28|}
{2010211001|XXGvertex_iport_iport|174|0|287|0|{0|in|}109|114|}
{2010214001|XXGiport_src_flow|175|0|289|0|{0|}114|20|}
{2010007001|XXGobject_proto_object|176|0|290|0|{}109|115|}
{2010212001|XXGvertex_oport_oport|177|0|292|0|{0|out|}115|116|}
{2010006001|XXGobject_psameas_object|178|0|294|0|{metadata|out_metadata|1|0|}116|115|}
{2010212001|XXGvertex_oport_oport|179|0|295|0|{1|reject|}115|117|}
{2010006001|XXGobject_psameas_object|180|0|297|0|{metadata|reject_metadata|1|0|}117|115|}
{2010212001|XXGvertex_oport_oport|181|0|298|0|{2|error|}115|118|}
{2010006001|XXGobject_psameas_object|182|0|300|0|{metadata|error_metadata|1|0|}118|115|}
{2010212001|XXGvertex_oport_oport|183|0|301|0|{3|log|}115|119|}
{2010006001|XXGobject_psameas_object|184|0|303|0|{metadata|log_metadata|1|0|}119|115|}
{2010211001|XXGvertex_iport_iport|185|0|304|0|{0|in|}115|120|}
{2010006001|XXGobject_psameas_object|186|0|306|0|{metadata|in_metadata|1|0|}120|115|}
{2010006001|XXGobject_psameas_object|187|0|307|0|{Layout|Layout|0|0|}109|91|}
{2010006001|XXGobject_psameas_object|188|0|308|0|{in_metadata|out_metadata|0|0|}109|53|}
{2010006001|XXGobject_psameas_object|189|0|309|0|{reject_metadata|out_metadata|0|0|}109|53|}
{2010601001|XXGgraph_vertex_vertex|190|0|310|0|{Optional_Clean|}1|121|}
{2010211001|XXGvertex_iport_iport|191|0|312|0|{0|write|}121|122|}
{2010214001|XXGiport_src_flow|192|0|314|0|{0|}122|21|}
{2010007001|XXGobject_proto_object|193|0|315|0|{}121|123|}
{2010211001|XXGvertex_iport_iport|194|0|317|0|{0|write|}123|124|}
{2010006001|XXGobject_psameas_object|195|0|319|0|{metadata|write_metadata|1|0|}124|123|}
{2010601001|XXGgraph_vertex_vertex|196|0|320|0|{Optional_Lookup|}1|125|}
{2010211001|XXGvertex_iport_iport|197|0|322|0|{0|write|}125|126|}
{2010214001|XXGiport_src_flow|198|0|324|0|{0|}126|22|}
{2010007001|XXGobject_proto_object|199|0|325|0|{}125|127|}
{2010211001|XXGvertex_iport_iport|200|0|327|0|{0|write|}127|128|}
{2010006001|XXGobject_psameas_object|201|0|329|0|{metadata|write_metadata|1|0|}128|127|}
{2010601001|XXGgraph_vertex_vertex|202|0|330|0|{Optional_Source|}1|129|}
{2010211001|XXGvertex_iport_iport|203|0|332|0|{0|write|}129|130|}
{2010214001|XXGiport_src_flow|204|0|334|0|{0|}130|32|}
{2010007001|XXGobject_proto_object|205|0|335|0|{}129|131|}
{2010211001|XXGvertex_iport_iport|206|0|337|0|{0|write|}131|132|}
{2010006001|XXGobject_psameas_object|207|0|339|0|{metadata|write_metadata|1|0|}132|131|}
{2010601001|XXGgraph_vertex_vertex|208|0|340|0|{Parse_Seperated_Values|}1|53|}
{2010601001|XXGgraph_vertex_vertex|209|0|341|0|{Partition_by_Round_robin|}1|133|}
{2010212001|XXGvertex_oport_oport|210|0|343|0|{0|out|}133|134|}
{2010213001|XXGoport_dst_flow|211|0|345|0|{0|}134|24|}
{2010211001|XXGvertex_iport_iport|212|0|346|0|{0|in|}133|135|}
{2010214001|XXGiport_src_flow|213|0|348|0|{0|}135|30|}
{2010007001|XXGobject_proto_object|214|0|349|0|{}133|136|}
{2010212001|XXGvertex_oport_oport|215|0|351|0|{0|out|}136|137|}
{2010006001|XXGobject_psameas_object|216|0|353|0|{metadata|out_metadata|1|0|}137|136|}
{2010211001|XXGvertex_iport_iport|217|0|354|0|{0|in|}136|138|}
{2010006001|XXGobject_psameas_object|218|0|356|0|{metadata|in_metadata|1|0|}138|136|}
{2010006001|XXGobject_psameas_object|219|0|357|0|{Layout|Layout|0|0|}133|91|}
{2010006001|XXGobject_psameas_object|220|0|358|0|{in_metadata|out_metadata|0|0|}133|109|}
{2010006001|XXGobject_psameas_object|221|0|359|0|{out_metadata|out_metadata|0|0|}133|109|}
{2010601001|XXGgraph_vertex_vertex|222|0|360|0|{Read_All_Files|}1|61|}
{2010601001|XXGgraph_vertex_vertex|223|0|361|0|{Rollup_Job_Info|}1|139|}
{2010212001|XXGvertex_oport_oport|224|0|363|0|{0|out|}139|140|}
{2010213001|XXGoport_dst_flow|225|0|365|0|{0|}140|27|}
{2010212001|XXGvertex_oport_oport|226|0|366|0|{1|reject|}139|141|}
{2010212001|XXGvertex_oport_oport|227|0|368|0|{2|error|}139|142|}
{2010212001|XXGvertex_oport_oport|228|0|370|0|{3|log|}139|143|}
{2010211001|XXGvertex_iport_iport|229|0|372|0|{0|in|}139|144|}
{2010214001|XXGiport_src_flow|230|0|374|0|{0|}144|28|}
{2010007001|XXGobject_proto_object|231|0|375|0|{}139|145|}
{2010212001|XXGvertex_oport_oport|232|0|377|0|{0|out|}145|146|}
{2010006001|XXGobject_psameas_object|233|0|379|0|{metadata|out_metadata|1|0|}146|145|}
{2010212001|XXGvertex_oport_oport|234|0|380|0|{1|reject|}145|147|}
{2010006001|XXGobject_psameas_object|235|0|382|0|{metadata|reject_metadata|1|0|}147|145|}
{2010212001|XXGvertex_oport_oport|236|0|383|0|{2|error|}145|148|}
{2010006001|XXGobject_psameas_object|237|0|385|0|{metadata|error_metadata|1|0|}148|145|}
{2010212001|XXGvertex_oport_oport|238|0|386|0|{3|log|}145|149|}
{2010006001|XXGobject_psameas_object|239|0|388|0|{metadata|log_metadata|1|0|}149|145|}
{2010211001|XXGvertex_iport_iport|240|0|389|0|{0|in|}145|150|}
{2010006001|XXGobject_psameas_object|241|0|391|0|{metadata|in_metadata|1|0|}150|145|}
{2010006001|XXGobject_psameas_object|242|0|392|0|{Layout|Layout|0|0|}139|91|}
{2010006001|XXGobject_psameas_object|243|0|393|0|{in_metadata|log_metadata|0|0|}139|109|}
{2010006001|XXGobject_psameas_object|244|0|394|0|{out_metadata|write_metadata|0|0|}139|91|}
{2010006001|XXGobject_psameas_object|245|0|395|0|{reject_metadata|log_metadata|0|0|}139|109|}
{2010601001|XXGgraph_vertex_vertex|246|0|396|0|{Serial_File|}1|151|}
{2010212001|XXGvertex_oport_oport|247|0|398|0|{0|read|}151|152|}
{2010213001|XXGoport_dst_flow|248|0|400|0|{0|}152|23|}
{2010007001|XXGobject_proto_object|249|0|401|0|{}151|153|}
{2010212001|XXGvertex_oport_oport|250|0|403|0|{0|read|}153|154|}
{2010006001|XXGobject_psameas_object|251|0|405|0|{metadata|read_metadata|1|0|}154|153|}
{2010006001|XXGobject_psameas_object|252|0|406|0|{read_metadata|read_metadata|0|0|}151|155|}
{2010212001|XXGvertex_oport_oport|253|0|408|0|{0|read|}155|156|}
{2010007001|XXGobject_proto_object|254|0|410|0|{}155|157|}
{2010212001|XXGvertex_oport_oport|255|0|412|0|{0|read|}157|158|}
{2010006001|XXGobject_psameas_object|256|0|414|0|{metadata|read_metadata|1|0|}158|157|}
{2010006001|XXGobject_psameas_object|257|0|415|0|{read_metadata|out_metadata|0|0|}155|53|}
{2010601001|XXGgraph_vertex_vertex|258|0|416|0|{Serial_File_1|}1|155|}
{2010601001|XXGgraph_vertex_vertex|259|0|417|0|{Trash_2|}1|159|}
{2010211001|XXGvertex_iport_iport|260|0|419|0|{0|in|}159|160|}
{2010214001|XXGiport_src_flow|261|0|421|0|{0|}160|23|}
{2010007001|XXGobject_proto_object|262|0|422|0|{}159|161|}
{2010211001|XXGvertex_iport_iport|263|0|424|0|{0|in|}161|162|}
{2010006001|XXGobject_psameas_object|264|0|426|0|{metadata|in_metadata|1|0|}162|161|}
{2010006001|XXGobject_psameas_object|265|0|427|0|{Layout|Layout|0|0|}159|151|}
{2010006001|XXGobject_psameas_object|266|0|428|0|{in_metadata|read_metadata|0|0|}159|155|}
{2010601001|XXGgraph_vertex_vertex|267|0|429|0|{Trash_3|}1|163|}
{2010211001|XXGvertex_iport_iport|268|0|431|0|{0|in|}163|164|}
{2010214001|XXGiport_src_flow|269|0|433|0|{0|}164|25|}
{2010007001|XXGobject_proto_object|270|0|434|0|{}163|165|}
{2010211001|XXGvertex_iport_iport|271|0|436|0|{0|in|}165|166|}
{2010006001|XXGobject_psameas_object|272|0|438|0|{metadata|in_metadata|1|0|}166|165|}
{2010006001|XXGobject_psameas_object|273|0|439|0|{Layout|Layout|0|0|}163|95|}
{2010006001|XXGobject_psameas_object|274|0|440|0|{in_metadata|read_metadata|0|0|}163|99|}
{2010601001|XXGgraph_vertex_vertex|275|0|441|0|{Version_Log|}1|167|}
{2010605001|XXGgraph_legend_legend|276|0|443|0|{0|}167|168|}
{2010241001|XXGlegend_face_face|277|0|445|0|{}168|169|}
{2010605001|XXGgraph_legend_legend|278|0|447|0|{1|}167|170|}
{2010241001|XXGlegend_face_face|279|0|449|0|{}170|171|}
{2010605001|XXGgraph_legend_legend|280|0|451|0|{2|}167|172|}
{2010241001|XXGlegend_face_face|281|0|453|0|{}172|173|}
{2010605001|XXGgraph_legend_legend|282|0|455|0|{3|}167|174|}
{2010241001|XXGlegend_face_face|283|0|457|0|{}174|175|}
{2010605001|XXGgraph_legend_legend|284|0|459|0|{4|}167|176|}
{2010241001|XXGlegend_face_face|285|0|461|0|{}176|177|}
{2010605001|XXGgraph_legend_legend|286|0|463|0|{5|}167|178|}
{2010241001|XXGlegend_face_face|287|0|465|0|{}178|179|}
{2010605001|XXGgraph_legend_legend|288|0|467|0|{6|}167|180|}
{2010241001|XXGlegend_face_face|289|0|469|0|{}180|181|}
{2010605001|XXGgraph_legend_legend|290|0|471|0|{7|}167|182|}
{2010241001|XXGlegend_face_face|291|0|473|0|{}182|183|}
{2010605001|XXGgraph_legend_legend|292|0|475|0|{8|}167|184|}
{2010241001|XXGlegend_face_face|293|0|477|0|{}184|185|}
{2010605001|XXGgraph_legend_legend|294|0|479|0|{9|}167|186|}
{2010241001|XXGlegend_face_face|295|0|481|0|{}186|187|}
{2010601001|XXGgraph_vertex_vertex|296|0|483|0|{prepare_output|}1|188|}
{2010605001|XXGgraph_legend_legend|297|0|485|0|{0|}188|189|}
{2010241001|XXGlegend_face_face|298|0|487|0|{}189|190|}
{2010605001|XXGgraph_legend_legend|299|0|489|0|{1|}188|191|}
{2010241001|XXGlegend_face_face|300|0|491|0|{}191|192|}
{2010605001|XXGgraph_legend_legend|301|0|493|0|{2|}188|193|}
{2010241001|XXGlegend_face_face|302|0|495|0|{}193|194|}
{2010605001|XXGgraph_legend_legend|303|0|497|0|{3|}188|195|}
{2010241001|XXGlegend_face_face|304|0|499|0|{}195|196|}
{2010604001|XXGgraph_flow_flow|305|0|501|0|{Flow_1|}188|197|}
{2010604001|XXGgraph_flow_flow|306|0|503|0|{Flow_2|}188|198|}
{2010604001|XXGgraph_flow_flow|307|0|505|0|{Flow_3|}188|199|}
{2010604001|XXGgraph_flow_flow|308|0|507|0|{Flow_4|}188|200|}
{2010604001|XXGgraph_flow_flow|309|0|509|0|{Flow_5|}188|201|}
{2010604001|XXGgraph_flow_flow|310|0|511|0|{Flow_6|}188|202|}
{2010604001|XXGgraph_flow_flow|311|0|513|0|{Flow_7|}188|203|}
{2010604001|XXGgraph_flow_flow|312|0|515|0|{Flow_8|}188|204|}
{2010601001|XXGgraph_vertex_vertex|313|0|517|0|{Copy_Out|}188|205|}
{2010212001|XXGvertex_oport_oport|314|0|519|0|{0|out|}205|206|}
{2010211001|XXGvertex_iport_iport|315|0|521|0|{0|in|}205|207|}
{2010214001|XXGiport_src_flow|316|0|523|0|{0|}207|203|}
{2010007001|XXGobject_proto_object|317|0|524|0|{}205|208|}
{2010212001|XXGvertex_oport_oport|318|0|526|0|{0|out|}208|209|}
{2010006001|XXGobject_psameas_object|319|0|528|0|{metadata|out_metadata|1|0|}209|208|}
{2010211001|XXGvertex_iport_iport|320|0|529|0|{0|in|}208|210|}
{2010006001|XXGobject_psameas_object|321|0|531|0|{metadata|in_metadata|1|0|}210|208|}
{2010006001|XXGobject_psameas_object|322|0|532|0|{Layout|Layout|0|0|}205|129|}
{2010006001|XXGobject_psameas_object|323|0|533|0|{in_metadata|write_metadata|0|0|}205|129|}
{2010006001|XXGobject_psameas_object|324|0|534|0|{out_metadata|write_metadata|0|0|}205|129|}
{2010601001|XXGgraph_vertex_vertex|325|0|535|0|{Copy_Out_|}188|211|}
{2010212001|XXGvertex_oport_oport|326|0|537|0|{0|out|}211|212|}
{2010211001|XXGvertex_iport_iport|327|0|539|0|{0|in|}211|213|}
{2010214001|XXGiport_src_flow|328|0|541|0|{0|}213|198|}
{2010007001|XXGobject_proto_object|329|0|542|0|{}211|214|}
{2010212001|XXGvertex_oport_oport|330|0|544|0|{0|out|}214|215|}
{2010006001|XXGobject_psameas_object|331|0|546|0|{metadata|out_metadata|1|0|}215|214|}
{2010211001|XXGvertex_iport_iport|332|0|547|0|{0|in|}214|216|}
{2010006001|XXGobject_psameas_object|333|0|549|0|{metadata|in_metadata|1|0|}216|214|}
{2010006001|XXGobject_psameas_object|334|0|550|0|{Layout|Layout|0|0|}211|121|}
{2010006001|XXGobject_psameas_object|335|0|551|0|{in_metadata|write_metadata|0|0|}211|121|}
{2010006001|XXGobject_psameas_object|336|0|552|0|{out_metadata|write_metadata|0|0|}211|121|}
{2010601001|XXGgraph_vertex_vertex|337|0|553|0|{Dedup_and_Fix_Intervals|}188|217|}
{2010605001|XXGgraph_legend_legend|338|0|555|0|{0|}217|218|}
{2010241001|XXGlegend_face_face|339|0|557|0|{}218|219|}
{2010605001|XXGgraph_legend_legend|340|0|559|0|{1|}217|220|}
{2010241001|XXGlegend_face_face|341|0|561|0|{}220|221|}
{2010605001|XXGgraph_legend_legend|342|0|563|0|{2|}217|222|}
{2010241001|XXGlegend_face_face|343|0|565|0|{}222|223|}
{2010605001|XXGgraph_legend_legend|344|0|567|0|{3|}217|224|}
{2010241001|XXGlegend_face_face|345|0|569|0|{}224|225|}
{2010605001|XXGgraph_legend_legend|346|0|571|0|{4|}217|226|}
{2010241001|XXGlegend_face_face|347|0|573|0|{}226|227|}
{2010604001|XXGgraph_flow_flow|348|0|575|0|{Flow_1|}217|228|}
{2010604001|XXGgraph_flow_flow|349|0|577|0|{Flow_2|}217|229|}
{2010604001|XXGgraph_flow_flow|350|0|579|0|{Flow_3|}217|230|}
{2010604001|XXGgraph_flow_flow|351|0|581|0|{Flow_4|}217|231|}
{2010604001|XXGgraph_flow_flow|352|0|583|0|{Flow_6|}217|232|}
{2010604001|XXGgraph_flow_flow|353|0|585|0|{Flow_7|}217|233|}
{2010601001|XXGgraph_vertex_vertex|354|0|587|0|{Dedup_by_NK_Eff_Date|}217|234|}
{2010212001|XXGvertex_oport_oport|355|0|589|0|{0|out|}234|235|}
{2010213001|XXGoport_dst_flow|356|0|591|0|{0|}235|230|}
{2010212001|XXGvertex_oport_oport|357|0|592|0|{1|dup|}234|236|}
{2010212001|XXGvertex_oport_oport|358|0|594|0|{2|reject|}234|237|}
{2010212001|XXGvertex_oport_oport|359|0|596|0|{3|error|}234|238|}
{2010212001|XXGvertex_oport_oport|360|0|598|0|{4|log|}234|239|}
{2010211001|XXGvertex_iport_iport|361|0|600|0|{0|in|}234|240|}
{2010214001|XXGiport_src_flow|362|0|602|0|{0|}240|228|}
{2010006001|XXGobject_psameas_object|363|0|603|0|{Layout|Layout|0|0|}234|241|}
{2010211001|XXGvertex_iport_iport|364|0|605|0|{0|write|}241|242|}
{2010214001|XXGiport_src_flow|365|0|607|0|{0|}242|200|}
{2010007001|XXGobject_proto_object|366|0|608|0|{}241|243|}
{2010211001|XXGvertex_iport_iport|367|0|610|0|{0|write|}243|244|}
{2010006001|XXGobject_psameas_object|368|0|612|0|{metadata|write_metadata|1|0|}244|243|}
{2010006001|XXGobject_psameas_object|369|0|613|0|{dup_metadata|write_metadata|0|0|}234|241|}
{2010006001|XXGobject_psameas_object|370|0|614|0|{in_metadata|write_metadata|0|0|}234|241|}
{2010006001|XXGobject_psameas_object|371|0|615|0|{out_metadata|write_metadata|0|0|}234|241|}
{2010006001|XXGobject_psameas_object|372|0|616|0|{reject_metadata|write_metadata|0|0|}234|241|}
{2010601001|XXGgraph_vertex_vertex|373|0|617|0|{Parition_by_Related_or_NK|}217|245|}
{2010212001|XXGvertex_oport_oport|374|0|619|0|{0|out|}245|246|}
{2010213001|XXGoport_dst_flow|375|0|621|0|{0|}246|229|}
{2010211001|XXGvertex_iport_iport|376|0|622|0|{0|in|}245|247|}
{2010006001|XXGobject_psameas_object|377|0|624|0|{Layout|Layout|0|0|}245|248|}
{2010212001|XXGvertex_oport_oport|378|0|626|0|{0|source|}248|249|}
{2010213001|XXGoport_dst_flow|379|0|628|0|{0|}249|203|}
{2010212001|XXGvertex_oport_oport|380|0|629|0|{1|clean|}248|250|}
{2010213001|XXGoport_dst_flow|381|0|631|0|{0|}250|198|}
{2010212001|XXGvertex_oport_oport|382|0|632|0|{2|lkp|}248|251|}
{2010213001|XXGoport_dst_flow|383|0|634|0|{0|}251|197|}
{2010212001|XXGvertex_oport_oport|384|0|635|0|{3|reject0|}248|252|}
{2010212001|XXGvertex_oport_oport|385|0|637|0|{4|reject1|}248|253|}
{2010212001|XXGvertex_oport_oport|386|0|639|0|{5|reject2|}248|254|}
{2010212001|XXGvertex_oport_oport|387|0|641|0|{6|error0|}248|255|}
{2010212001|XXGvertex_oport_oport|388|0|643|0|{7|error1|}248|256|}
{2010212001|XXGvertex_oport_oport|389|0|645|0|{8|error2|}248|257|}
{2010212001|XXGvertex_oport_oport|390|0|647|0|{9|log|}248|258|}
{2010211001|XXGvertex_iport_iport|391|0|649|0|{0|in|}248|259|}
{2010007001|XXGobject_proto_object|392|0|651|0|{}248|260|}
{2010212001|XXGvertex_oport_oport|393|0|653|0|{0|source|}260|261|}
{2010006001|XXGobject_psameas_object|394|0|655|0|{metadata|out0_metadata|1|0|}261|260|}
{2010006001|XXGobject_psameas_object|395|0|656|0|{transform0|transform0|1|0|}261|260|}
{2010212001|XXGvertex_oport_oport|396|0|657|0|{1|clean|}260|262|}
{2010006001|XXGobject_psameas_object|397|0|659|0|{metadata|out1_metadata|1|0|}262|260|}
{2010006001|XXGobject_psameas_object|398|0|660|0|{transform1|transform1|1|0|}262|260|}
{2010212001|XXGvertex_oport_oport|399|0|661|0|{2|lkp|}260|263|}
{2010006001|XXGobject_psameas_object|400|0|663|0|{metadata|out2_metadata|1|0|}263|260|}
{2010006001|XXGobject_psameas_object|401|0|664|0|{transform2|transform2|1|0|}263|260|}
{2010212001|XXGvertex_oport_oport|402|0|665|0|{3|reject0|}260|264|}
{2010006001|XXGobject_psameas_object|403|0|667|0|{metadata|reject0_metadata|1|0|}264|260|}
{2010212001|XXGvertex_oport_oport|404|0|668|0|{4|reject1|}260|265|}
{2010006001|XXGobject_psameas_object|405|0|670|0|{metadata|reject1_metadata|1|0|}265|260|}
{2010212001|XXGvertex_oport_oport|406|0|671|0|{5|reject2|}260|266|}
{2010006001|XXGobject_psameas_object|407|0|673|0|{metadata|reject2_metadata|1|0|}266|260|}
{2010212001|XXGvertex_oport_oport|408|0|674|0|{6|error0|}260|267|}
{2010006001|XXGobject_psameas_object|409|0|676|0|{metadata|error0_metadata|1|0|}267|260|}
{2010212001|XXGvertex_oport_oport|410|0|677|0|{7|error1|}260|268|}
{2010006001|XXGobject_psameas_object|411|0|679|0|{metadata|error1_metadata|1|0|}268|260|}
{2010212001|XXGvertex_oport_oport|412|0|680|0|{8|error2|}260|269|}
{2010006001|XXGobject_psameas_object|413|0|682|0|{metadata|error2_metadata|1|0|}269|260|}
{2010212001|XXGvertex_oport_oport|414|0|683|0|{9|log|}260|270|}
{2010006001|XXGobject_psameas_object|415|0|685|0|{metadata|log_metadata|1|0|}270|260|}
{2010211001|XXGvertex_iport_iport|416|0|686|0|{0|in|}260|271|}
{2010006001|XXGobject_psameas_object|417|0|688|0|{metadata|in_metadata|1|0|}271|260|}
{2010006001|XXGobject_psameas_object|418|0|689|0|{in_metadata|out_metadata|0|0|}248|109|}
{2010006001|XXGobject_psameas_object|419|0|690|0|{out0_metadata|write_metadata|0|0|}248|129|}
{2010006001|XXGobject_psameas_object|420|0|691|0|{out1_metadata|write_metadata|0|0|}248|121|}
{2010006001|XXGobject_psameas_object|421|0|692|0|{out2_metadata|write_metadata|0|0|}248|241|}
{2010006001|XXGobject_psameas_object|422|0|693|0|{reject0_metadata|out_metadata|0|0|}248|109|}
{2010006001|XXGobject_psameas_object|423|0|694|0|{reject1_metadata|out_metadata|0|0|}248|109|}
{2010006001|XXGobject_psameas_object|424|0|695|0|{reject2_metadata|out_metadata|0|0|}248|109|}
{2010006001|XXGobject_psameas_object|425|0|696|0|{out_metadata|write_metadata|0|0|}245|241|}
{2010601001|XXGgraph_vertex_vertex|426|0|697|0|{Replicate|}217|272|}
{2010212001|XXGvertex_oport_oport|427|0|699|0|{0|out|}272|273|}
{2010211001|XXGvertex_iport_iport|428|0|701|0|{0|in|}272|274|}
{2010214001|XXGiport_src_flow|429|0|703|0|{0|}274|233|}
{2010006001|XXGobject_psameas_object|430|0|704|0|{Layout|Layout|0|0|}272|241|}
{2010006001|XXGobject_psameas_object|431|0|705|0|{in_metadata|write_metadata|0|0|}272|125|}
{2010006001|XXGobject_psameas_object|432|0|706|0|{out_metadata|write_metadata|0|0|}272|125|}
{2010601001|XXGgraph_vertex_vertex|433|0|707|0|{Rollup_Adjoining_Eff_Dates|}217|275|}
{2010212001|XXGvertex_oport_oport|434|0|709|0|{0|out|}275|276|}
{2010213001|XXGoport_dst_flow|435|0|711|0|{0|}276|233|}
{2010212001|XXGvertex_oport_oport|436|0|712|0|{1|reject|}275|277|}
{2010212001|XXGvertex_oport_oport|437|0|714|0|{2|error|}275|278|}
{2010212001|XXGvertex_oport_oport|438|0|716|0|{3|log|}275|279|}
{2010211001|XXGvertex_iport_iport|439|0|718|0|{0|in|}275|280|}
{2010214001|XXGiport_src_flow|440|0|720|0|{0|}280|232|}
{2010006001|XXGobject_psameas_object|441|0|721|0|{Layout|Layout|0|0|}275|241|}
{2010006001|XXGobject_psameas_object|442|0|722|0|{in_metadata|write_metadata|0|0|}275|241|}
{2010006001|XXGobject_psameas_object|443|0|723|0|{out_metadata|write_metadata|0|0|}275|241|}
{2010006001|XXGobject_psameas_object|444|0|724|0|{reject_metadata|write_metadata|0|0|}275|241|}
{2010601001|XXGgraph_vertex_vertex|445|0|725|0|{Scan_to_Fix_Overlapping_Dates|}217|281|}
{2010212001|XXGvertex_oport_oport|446|0|727|0|{0|out|}281|282|}
{2010213001|XXGoport_dst_flow|447|0|729|0|{0|}282|231|}
{2010212001|XXGvertex_oport_oport|448|0|730|0|{1|reject|}281|283|}
{2010212001|XXGvertex_oport_oport|449|0|732|0|{2|error|}281|284|}
{2010212001|XXGvertex_oport_oport|450|0|734|0|{3|log|}281|285|}
{2010211001|XXGvertex_iport_iport|451|0|736|0|{0|in|}281|286|}
{2010214001|XXGiport_src_flow|452|0|738|0|{0|}286|230|}
{2010006001|XXGobject_psameas_object|453|0|739|0|{Layout|Layout|0|0|}281|241|}
{2010006001|XXGobject_psameas_object|454|0|740|0|{in_metadata|write_metadata|0|0|}281|241|}
{2010006001|XXGobject_psameas_object|455|0|741|0|{out_metadata|write_metadata|0|0|}281|241|}
{2010006001|XXGobject_psameas_object|456|0|742|0|{reject_metadata|write_metadata|0|0|}281|241|}
{2010601001|XXGgraph_vertex_vertex|457|0|743|0|{Sort_for_Dedup|}217|287|}
{2010212001|XXGvertex_oport_oport|458|0|745|0|{0|out|}287|288|}
{2010213001|XXGoport_dst_flow|459|0|747|0|{0|}288|228|}
{2010211001|XXGvertex_iport_iport|460|0|748|0|{0|in|}287|289|}
{2010214001|XXGiport_src_flow|461|0|750|0|{0|}289|229|}
{2010006001|XXGobject_psameas_object|462|0|751|0|{Layout|Layout|0|0|}287|241|}
{2010006001|XXGobject_psameas_object|463|0|752|0|{in_metadata|write_metadata|0|0|}287|241|}
{2010006001|XXGobject_psameas_object|464|0|753|0|{out_metadata|write_metadata|0|0|}287|241|}
{2010601001|XXGgraph_vertex_vertex|465|0|754|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}217|290|}
{2010212001|XXGvertex_oport_oport|466|0|756|0|{0|out|}290|291|}
{2010213001|XXGoport_dst_flow|467|0|758|0|{0|}291|232|}
{2010211001|XXGvertex_iport_iport|468|0|759|0|{0|in|}290|292|}
{2010214001|XXGiport_src_flow|469|0|761|0|{0|}292|231|}
{2010006001|XXGobject_psameas_object|470|0|762|0|{Layout|Layout|0|0|}290|241|}
{2010006001|XXGobject_psameas_object|471|0|763|0|{in_metadata|write_metadata|0|0|}290|241|}
{2010006001|XXGobject_psameas_object|472|0|764|0|{out_metadata|write_metadata|0|0|}290|241|}
{2010212001|XXGvertex_oport_oport|473|0|765|0|{0|out|}217|293|}
{2010216002|XXGoport_binding_oport|474|0|767|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6837|}293|273|}
{2010213001|XXGoport_dst_flow|475|0|768|0|{0|}293|199|}
{2010213001|XXGoport_dst_flow|476|0|769|0|{1|}293|202|}
{2010212001|XXGvertex_oport_oport|477|0|770|0|{1|dups|}217|294|}
{2010216002|XXGoport_binding_oport|478|0|772|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6838|}294|236|}
{2010213001|XXGoport_dst_flow|479|0|773|0|{0|}294|200|}
{2010211001|XXGvertex_iport_iport|480|0|774|0|{0|in|}217|295|}
{2010215002|XXGiport_binding_iport|481|0|776|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6836|}295|247|}
{2010214001|XXGiport_src_flow|482|0|777|0|{0|}295|197|}
{2010007001|XXGobject_proto_object|483|0|778|0|{}217|296|}
{2010605001|XXGgraph_legend_legend|484|0|780|0|{0|}296|297|}
{2010241001|XXGlegend_face_face|485|0|782|0|{}297|298|}
{2010605001|XXGgraph_legend_legend|486|0|784|0|{1|}296|299|}
{2010241001|XXGlegend_face_face|487|0|786|0|{}299|300|}
{2010605001|XXGgraph_legend_legend|488|0|788|0|{2|}296|301|}
{2010241001|XXGlegend_face_face|489|0|790|0|{}301|302|}
{2010605001|XXGgraph_legend_legend|490|0|792|0|{3|}296|303|}
{2010241001|XXGlegend_face_face|491|0|794|0|{}303|304|}
{2010605001|XXGgraph_legend_legend|492|0|796|0|{4|}296|305|}
{2010241001|XXGlegend_face_face|493|0|798|0|{}305|306|}
{2010604001|XXGgraph_flow_flow|494|0|800|0|{Flow_1|}296|307|}
{2010604001|XXGgraph_flow_flow|495|0|802|0|{Flow_2|}296|308|}
{2010604001|XXGgraph_flow_flow|496|0|804|0|{Flow_3|}296|309|}
{2010604001|XXGgraph_flow_flow|497|0|806|0|{Flow_4|}296|310|}
{2010604001|XXGgraph_flow_flow|498|0|808|0|{Flow_6|}296|311|}
{2010604001|XXGgraph_flow_flow|499|0|810|0|{Flow_7|}296|312|}
{2010601001|XXGgraph_vertex_vertex|500|0|812|0|{Dedup_by_NK_Eff_Date|}296|313|}
{2010212001|XXGvertex_oport_oport|501|0|814|0|{0|out|}313|314|}
{2010213001|XXGoport_dst_flow|502|0|816|0|{0|}314|309|}
{2010212001|XXGvertex_oport_oport|503|0|817|0|{1|dup|}313|315|}
{2010212001|XXGvertex_oport_oport|504|0|819|0|{2|reject|}313|316|}
{2010212001|XXGvertex_oport_oport|505|0|821|0|{3|error|}313|317|}
{2010212001|XXGvertex_oport_oport|506|0|823|0|{4|log|}313|318|}
{2010211001|XXGvertex_iport_iport|507|0|825|0|{0|in|}313|319|}
{2010214001|XXGiport_src_flow|508|0|827|0|{0|}319|307|}
{2010007001|XXGobject_proto_object|509|0|828|0|{}313|320|}
{2010212001|XXGvertex_oport_oport|510|0|830|0|{0|out|}320|321|}
{2010006001|XXGobject_psameas_object|511|0|832|0|{metadata|out_metadata|1|0|}321|320|}
{2010212001|XXGvertex_oport_oport|512|0|833|0|{1|dup|}320|322|}
{2010006001|XXGobject_psameas_object|513|0|835|0|{metadata|dup_metadata|1|0|}322|320|}
{2010212001|XXGvertex_oport_oport|514|0|836|0|{2|reject|}320|323|}
{2010006001|XXGobject_psameas_object|515|0|838|0|{metadata|reject_metadata|1|0|}323|320|}
{2010212001|XXGvertex_oport_oport|516|0|839|0|{3|error|}320|324|}
{2010006001|XXGobject_psameas_object|517|0|841|0|{metadata|error_metadata|1|0|}324|320|}
{2010212001|XXGvertex_oport_oport|518|0|842|0|{4|log|}320|325|}
{2010006001|XXGobject_psameas_object|519|0|844|0|{metadata|log_metadata|1|0|}325|320|}
{2010211001|XXGvertex_iport_iport|520|0|845|0|{0|in|}320|326|}
{2010006001|XXGobject_psameas_object|521|0|847|0|{metadata|in_metadata|1|0|}326|320|}
{2010601001|XXGgraph_vertex_vertex|522|0|848|0|{Parition_by_Related_or_NK|}296|327|}
{2010212001|XXGvertex_oport_oport|523|0|850|0|{0|out|}327|328|}
{2010213001|XXGoport_dst_flow|524|0|852|0|{0|}328|308|}
{2010211001|XXGvertex_iport_iport|525|0|853|0|{0|in|}327|329|}
{2010007001|XXGobject_proto_object|526|0|855|0|{}327|330|}
{2010212001|XXGvertex_oport_oport|527|0|857|0|{0|out|}330|331|}
{2010006001|XXGobject_psameas_object|528|0|859|0|{metadata|out_metadata|1|0|}331|330|}
{2010211001|XXGvertex_iport_iport|529|0|860|0|{0|in|}330|332|}
{2010006001|XXGobject_psameas_object|530|0|862|0|{metadata|in_metadata|1|0|}332|330|}
{2010006001|XXGobject_psameas_object|531|0|863|0|{in_metadata|INPUT_DML|1|0|}327|296|}
{2010601001|XXGgraph_vertex_vertex|532|0|864|0|{Replicate|}296|333|}
{2010212001|XXGvertex_oport_oport|533|0|866|0|{0|out|}333|334|}
{2010211001|XXGvertex_iport_iport|534|0|868|0|{0|in|}333|335|}
{2010214001|XXGiport_src_flow|535|0|870|0|{0|}335|312|}
{2010007001|XXGobject_proto_object|536|0|871|0|{}333|336|}
{2010212001|XXGvertex_oport_oport|537|0|873|0|{0|out|}336|337|}
{2010006001|XXGobject_psameas_object|538|0|875|0|{metadata|out_metadata|1|0|}337|336|}
{2010211001|XXGvertex_iport_iport|539|0|876|0|{0|in|}336|338|}
{2010006001|XXGobject_psameas_object|540|0|878|0|{metadata|in_metadata|1|0|}338|336|}
{2010601001|XXGgraph_vertex_vertex|541|0|879|0|{Rollup_Adjoining_Eff_Dates|}296|339|}
{2010212001|XXGvertex_oport_oport|542|0|881|0|{0|out|}339|340|}
{2010213001|XXGoport_dst_flow|543|0|883|0|{0|}340|312|}
{2010212001|XXGvertex_oport_oport|544|0|884|0|{1|reject|}339|341|}
{2010212001|XXGvertex_oport_oport|545|0|886|0|{2|error|}339|342|}
{2010212001|XXGvertex_oport_oport|546|0|888|0|{3|log|}339|343|}
{2010211001|XXGvertex_iport_iport|547|0|890|0|{0|in|}339|344|}
{2010214001|XXGiport_src_flow|548|0|892|0|{0|}344|311|}
{2010007001|XXGobject_proto_object|549|0|893|0|{}339|345|}
{2010212001|XXGvertex_oport_oport|550|0|895|0|{0|out|}345|346|}
{2010006001|XXGobject_psameas_object|551|0|897|0|{metadata|out_metadata|1|0|}346|345|}
{2010212001|XXGvertex_oport_oport|552|0|898|0|{1|reject|}345|347|}
{2010006001|XXGobject_psameas_object|553|0|900|0|{metadata|reject_metadata|1|0|}347|345|}
{2010212001|XXGvertex_oport_oport|554|0|901|0|{2|error|}345|348|}
{2010006001|XXGobject_psameas_object|555|0|903|0|{metadata|error_metadata|1|0|}348|345|}
{2010212001|XXGvertex_oport_oport|556|0|904|0|{3|log|}345|349|}
{2010006001|XXGobject_psameas_object|557|0|906|0|{metadata|log_metadata|1|0|}349|345|}
{2010211001|XXGvertex_iport_iport|558|0|907|0|{0|in|}345|350|}
{2010006001|XXGobject_psameas_object|559|0|909|0|{metadata|in_metadata|1|0|}350|345|}
{2010601001|XXGgraph_vertex_vertex|560|0|910|0|{Scan_to_Fix_Overlapping_Dates|}296|351|}
{2010212001|XXGvertex_oport_oport|561|0|912|0|{0|out|}351|352|}
{2010213001|XXGoport_dst_flow|562|0|914|0|{0|}352|310|}
{2010212001|XXGvertex_oport_oport|563|0|915|0|{1|reject|}351|353|}
{2010212001|XXGvertex_oport_oport|564|0|917|0|{2|error|}351|354|}
{2010212001|XXGvertex_oport_oport|565|0|919|0|{3|log|}351|355|}
{2010211001|XXGvertex_iport_iport|566|0|921|0|{0|in|}351|356|}
{2010214001|XXGiport_src_flow|567|0|923|0|{0|}356|309|}
{2010007001|XXGobject_proto_object|568|0|924|0|{}351|357|}
{2010212001|XXGvertex_oport_oport|569|0|926|0|{0|out|}357|358|}
{2010006001|XXGobject_psameas_object|570|0|928|0|{metadata|out_metadata|1|0|}358|357|}
{2010212001|XXGvertex_oport_oport|571|0|929|0|{1|reject|}357|359|}
{2010006001|XXGobject_psameas_object|572|0|931|0|{metadata|reject_metadata|1|0|}359|357|}
{2010212001|XXGvertex_oport_oport|573|0|932|0|{2|error|}357|360|}
{2010006001|XXGobject_psameas_object|574|0|934|0|{metadata|error_metadata|1|0|}360|357|}
{2010212001|XXGvertex_oport_oport|575|0|935|0|{3|log|}357|361|}
{2010006001|XXGobject_psameas_object|576|0|937|0|{metadata|log_metadata|1|0|}361|357|}
{2010211001|XXGvertex_iport_iport|577|0|938|0|{0|in|}357|362|}
{2010006001|XXGobject_psameas_object|578|0|940|0|{metadata|in_metadata|1|0|}362|357|}
{2010601001|XXGgraph_vertex_vertex|579|0|941|0|{Sort_for_Dedup|}296|363|}
{2010212001|XXGvertex_oport_oport|580|0|943|0|{0|out|}363|364|}
{2010213001|XXGoport_dst_flow|581|0|945|0|{0|}364|307|}
{2010211001|XXGvertex_iport_iport|582|0|946|0|{0|in|}363|365|}
{2010214001|XXGiport_src_flow|583|0|948|0|{0|}365|308|}
{2010007001|XXGobject_proto_object|584|0|949|0|{}363|366|}
{2010212001|XXGvertex_oport_oport|585|0|951|0|{0|out|}366|367|}
{2010006001|XXGobject_psameas_object|586|0|953|0|{metadata|out_metadata|1|0|}367|366|}
{2010211001|XXGvertex_iport_iport|587|0|954|0|{0|in|}366|368|}
{2010006001|XXGobject_psameas_object|588|0|956|0|{metadata|in_metadata|1|0|}368|366|}
{2010601001|XXGgraph_vertex_vertex|589|0|957|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}296|369|}
{2010212001|XXGvertex_oport_oport|590|0|959|0|{0|out|}369|370|}
{2010213001|XXGoport_dst_flow|591|0|961|0|{0|}370|311|}
{2010211001|XXGvertex_iport_iport|592|0|962|0|{0|in|}369|371|}
{2010214001|XXGiport_src_flow|593|0|964|0|{0|}371|310|}
{2010007001|XXGobject_proto_object|594|0|965|0|{}369|372|}
{2010212001|XXGvertex_oport_oport|595|0|967|0|{0|out|}372|373|}
{2010006001|XXGobject_psameas_object|596|0|969|0|{metadata|out_metadata|1|0|}373|372|}
{2010211001|XXGvertex_iport_iport|597|0|970|0|{0|in|}372|374|}
{2010006001|XXGobject_psameas_object|598|0|972|0|{metadata|in_metadata|1|0|}374|372|}
{2010212001|XXGvertex_oport_oport|599|0|973|0|{0|out|}296|375|}
{2010216002|XXGoport_binding_oport|600|0|975|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6831|}375|334|}
{2010212001|XXGvertex_oport_oport|601|0|976|0|{1|dups|}296|376|}
{2010216002|XXGoport_binding_oport|602|0|978|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6832|}376|315|}
{2010211001|XXGvertex_iport_iport|603|0|979|0|{0|in|}296|377|}
{2010215002|XXGiport_binding_iport|604|0|981|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6830|}377|329|}
{2010006001|XXGobject_psameas_object|605|0|982|0|{FIX_EFFECTIVE_DATE|FIX_EFFECTIVE_DATE|1|0|}217|188|}
{2010006001|XXGobject_psameas_object|606|0|983|0|{FIX_END_DATE|FIX_END_DATE|1|0|}217|188|}
{2010006001|XXGobject_psameas_object|607|0|984|0|{INPUT_DML|write_metadata|0|0|}217|241|}
{2010601001|XXGgraph_vertex_vertex|608|0|985|0|{Dups|}188|241|}
{2010601001|XXGgraph_vertex_vertex|609|0|986|0|{Gather|}188|378|}
{2010212001|XXGvertex_oport_oport|610|0|988|0|{0|out|}378|379|}
{2010213001|XXGoport_dst_flow|611|0|990|0|{0|}379|204|}
{2010211001|XXGvertex_iport_iport|612|0|991|0|{0|in|}378|380|}
{2010214001|XXGiport_src_flow|613|0|993|0|{0|}380|202|}
{2010007001|XXGobject_proto_object|614|0|994|0|{}378|381|}
{2010212001|XXGvertex_oport_oport|615|0|996|0|{0|out|}381|382|}
{2010006001|XXGobject_psameas_object|616|0|998|0|{metadata|out_metadata|1|0|}382|381|}
{2010211001|XXGvertex_iport_iport|617|0|999|0|{0|in|}381|383|}
{2010006001|XXGobject_psameas_object|618|0|1001|0|{metadata|in_metadata|1|0|}383|381|}
{2010006001|XXGobject_psameas_object|619|0|1002|0|{in_metadata|write_metadata|0|0|}378|125|}
{2010006001|XXGobject_psameas_object|620|0|1003|0|{out_metadata|write_metadata|0|0|}378|125|}
{2010601001|XXGgraph_vertex_vertex|621|0|1004|0|{Gather_|}188|384|}
{2010212001|XXGvertex_oport_oport|622|0|1006|0|{0|out|}384|385|}
{2010211001|XXGvertex_iport_iport|623|0|1008|0|{0|in|}384|386|}
{2010214001|XXGiport_src_flow|624|0|1010|0|{0|}386|201|}
{2010214001|XXGiport_src_flow|625|0|1011|0|{1|}386|204|}
{2010007001|XXGobject_proto_object|626|0|1012|0|{}384|387|}
{2010212001|XXGvertex_oport_oport|627|0|1014|0|{0|out|}387|388|}
{2010006001|XXGobject_psameas_object|628|0|1016|0|{metadata|out_metadata|1|0|}388|387|}
{2010211001|XXGvertex_iport_iport|629|0|1017|0|{0|in|}387|389|}
{2010006001|XXGobject_psameas_object|630|0|1019|0|{metadata|in_metadata|1|0|}389|387|}
{2010006001|XXGobject_psameas_object|631|0|1020|0|{Layout|Layout|0|0|}384|125|}
{2010006001|XXGobject_psameas_object|632|0|1021|0|{in_metadata|write_metadata|0|0|}384|125|}
{2010006001|XXGobject_psameas_object|633|0|1022|0|{out_metadata|write_metadata|0|0|}384|125|}
{2010601001|XXGgraph_vertex_vertex|634|0|1023|0|{Map_to_Output|}188|248|}
{2010601001|XXGgraph_vertex_vertex|635|0|1024|0|{Merge|}188|390|}
{2010212001|XXGvertex_oport_oport|636|0|1026|0|{0|out|}390|391|}
{2010213001|XXGoport_dst_flow|637|0|1028|0|{0|}391|201|}
{2010211001|XXGvertex_iport_iport|638|0|1029|0|{0|in|}390|392|}
{2010214001|XXGiport_src_flow|639|0|1031|0|{0|}392|199|}
{2010007001|XXGobject_proto_object|640|0|1032|0|{}390|393|}
{2010212001|XXGvertex_oport_oport|641|0|1034|0|{0|out|}393|394|}
{2010006001|XXGobject_psameas_object|642|0|1036|0|{metadata|out_metadata|1|0|}394|393|}
{2010211001|XXGvertex_iport_iport|643|0|1037|0|{0|in|}393|395|}
{2010006001|XXGobject_psameas_object|644|0|1039|0|{metadata|in_metadata|1|0|}395|393|}
{2010006001|XXGobject_psameas_object|645|0|1040|0|{in_metadata|write_metadata|0|0|}390|125|}
{2010006001|XXGobject_psameas_object|646|0|1041|0|{out_metadata|write_metadata|0|0|}390|125|}
{2010212001|XXGvertex_oport_oport|647|0|1042|0|{0|source|}188|396|}
{2010216002|XXGoport_binding_oport|648|0|1044|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9951|}396|206|}
{2010213001|XXGoport_dst_flow|649|0|1045|0|{0|}396|32|}
{2010212001|XXGvertex_oport_oport|650|0|1046|0|{1|clean|}188|397|}
{2010216002|XXGoport_binding_oport|651|0|1048|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9952|}397|212|}
{2010213001|XXGoport_dst_flow|652|0|1049|0|{0|}397|21|}
{2010212001|XXGvertex_oport_oport|653|0|1050|0|{2|lookup|}188|398|}
{2010216002|XXGoport_binding_oport|654|0|1052|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9953|}398|385|}
{2010213001|XXGoport_dst_flow|655|0|1053|0|{0|}398|22|}
{2010211001|XXGvertex_iport_iport|656|0|1054|0|{0|in0|}188|399|}
{2010215002|XXGiport_binding_iport|657|0|1056|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9950|}399|259|}
{2010214001|XXGiport_src_flow|658|0|1057|0|{0|}399|24|}
{2010109001|XXGobject_property_value|659|0|1058|0|{0|TrackingThumbprint|72|}1|400|}
