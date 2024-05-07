@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|638|rel_count|1038|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|3|9|K|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|START_CHANGES_TIME||3|9|FK|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to yesterday, midnight.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME||3|9|FK|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SUBJECT_AREA||3|9|FK|@{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/lookup.dataset_id.txt|3|9|FK||{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|RFK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|SOURCE_FILE_PATTERN||3|9|FK|@{0|}}
{30001002|XXparameter|IDS_PROPERTIES|$[get_ids_table_properties(SOURCE_SYSTEM + "." + re_replace(re_replace(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), "[.][a-zA-Z0-9]*", ""), "_$", ""))]|3|9|K|@{0|}}
{30001002|XXparameter|DATASET_TYPE|$[if(not is_blank(IDS_PROPERTIES.table_type)) string_upcase(IDS_PROPERTIES.table_type) else force_error("Entry not present in ids_table_properties file");]|3|9|K|@{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[ 
if ( DATASET_TYPE == "FACT") 
        string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/many")
else 
        string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/one") 
]|3|9|RFK|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.6.4|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC|AB_PARAMETER_ENV|3|10|Kd|@{0|}}
{30001002|XXparameter|GET_DML_FILE|$[ PUB_DATAHUB_DML + "/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + re_replace(re_replace(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), "[.][a-zA-Z0-9]*", ""), "_$", "") + ".dml" ]|3|9|K|Path to the record format for the source data. Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|GET_DML|$[ expand_type(read_type(GET_DML_FILE)) ]|3|9|RK|The record format for the source data.|{0|}}
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
        GET_DML))))
];

metadata type = $SOURCE_TYPE_NAME;|3|9|K|The input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|FILTER_EXPRESSION|1|20|9|RFK|A filter expression, which is only used in the development environment.|{0|}}
{30001002|XXparameter|___Output_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|DO_SOURCE|0|1|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CLEAN|1|1|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|DO_LOOKUP|0|1|9|RFK|0 or 1: Whether or not to produce a lookup file.  Defaults to 0 (False).  Note that lookup files also have parameters for subsetting their DML and for sorting, dedup'ing, and managing overlapping intervals, based on a lookup key, etc.|{0|}}
{30001002|XXparameter|OPTIONAL_FILTER|@20|9|FK|@{0|}}
{30001002|XXparameter|FILTER_FLG|False|13|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CLEAN_FILE_URL|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|K|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|LOOKUP_FILE_URL|$[ if ( not DO_LOOKUP ) "" else "file:" + AI_SERIAL_LOOKUP + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dat" ]|3|9|FK|Optional: Used by the ACE to view the lookup file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CLEAN_DML_FILE|$[ if ( not DO_CLEAN ) "" else AI_DML + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + ".dml" ]|3|9|K|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|LOOKUP_DML_FILE|$[ if ( not DO_LOOKUP ) "" else AI_DML + "/lookup." + SOURCE_SYSTEM + "/lookup." + SOURCE_LOWER + ".dml" ]|3|9|RFK|The DML file to use for the resulting lookup, if any.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CLEAN_DML|$[ if ( not DO_CLEAN ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|LOOKUP_FIELDS_KEY||3|9|FK|Optional: \{field_1; field_2, ...\}: A list of fields that should be included in the lookup DML.|{0|}}
{30001002|XXparameter|LOOKUP_FIELD_NAME_VEC|$[ for ( let k in key_info(LOOKUP_FIELDS_KEY) ) : k.field_name ]|3|9|RK|A vector of field names in the lookup fields key.|{0|}}
{30001002|XXparameter|LOOKUP_DML|$[ add_fields(
    "record\\nend",
    for ( let f in record_info(GET_DML_PLUS_HEADER) ) :
      if ( LOOKUP_FIELD_NAME_VEC == [vector] or f.name member LOOKUP_FIELD_NAME_VEC )
        f)
]|3|9|RFK|The record format for any lookup output file.  Defaults to the input DML, plus a DMF header, reduced to the fields specified in the lookup fields key.|{0|}}
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
if ( DATASET_TYPE == "FACT")
        if( ends_with(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), ".dat.gz") ) 
                string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/many/", string_replace(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), "_.dat.gz", ".dat.gz"))
        else
                string_replace(string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/many/", string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), ".dat.gz"), "_.dat.gz", ".dat.gz")
else
        if( ends_with(string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), ".dat.gz") ) 
                string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/one/", string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", "")) 
        else
                string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/one/", string_replace(string_replace(SOURCE_FILE_PATTERN, "*", ""), "?", ""), ".dat.gz")

]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC:sandbox|$[

for (let string("") line in directory_listing(IDS_DATA_PATH,SOURCE_FILE_PATTERN)) : IDS_DATA_PATH + "/" + line;

]|3|9||@{0|}}
{30001002|XXparameter|TRANSFORM_XFR||8|9|FO|Reformat transform|{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|extract|Anwar.Parvez|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1979000|703000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.6|{2|1|1|}Job 'get.ids.scan' Execution Status Report


Job "get.ids.scan" Execution started at Friday, January 13, 2017 04:16:14
***** Job execution failed at Friday, January 13, 2017 04:16:31 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:16
Run performed by user amahesh7
Total data moved through all flows: 1 records (97 bytes)
Total CPU time (all processes): 3 seconds
Average CPU utilization across all nodes: 0.00 percent
||# Make sure the serial directories exist.
mkdir -m 2775 -p \\
  "$AI_SERIAL_LOG/get.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_LOOKUP/lookup.$SOURCE_SYSTEM" \\
  "$AI_SERIAL_TEMP/get.$SOURCE_SYSTEM"

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
export AB_REPORT="summary=$AI_SERIAL_LOG/get.$SOURCE_SYSTEM/get.ids.$SOURCE_LOWER.summary.log $AB_REPORT"

||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Normal||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@SOURCE_NAME - $SOURCE_NAME  |445000|73000|0|0|0|0|12481|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|255|160|0|}}
{2010210004|XXGflow|7|0|13|0|{@{}@384|.5|.5|{0|}12478|18|}}
{2010210004|XXGflow|8|0|15|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}12473|19|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}12402|17|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}12484|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}12492|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}12483|532|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}12486|17|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.5|.328000009059906|{12|493000|354000|513000|354000|554000|354000|554000|204000|639000|204000|660000|204000|}12459|2065|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.7534246444702148|{12|493000|384000|523000|384000|610000|384000|610000|309000|639000|309000|660000|309000|}12489|2065|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{0|}12472|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}12405|2065|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}12493|529|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}12475|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.3378378450870514|{0|}12461|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}12487|17|}}
{2010243001|XXGwatcher|22|0|43|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|23|0|45|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Broadcast|141000|306000|0|0|0|0|12383|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|24|0|47|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|25|0|50|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|26|0|53|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|27|0|55|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|28|0|58|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|29|0|61|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|num_records|$[ length_of(SOURCE_FILE_LIST_VEC) ]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") filename;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform|let string("")[int] filenames = $[string_representation(SOURCE_FILE_LIST_VEC)];

out::create(index)=
begin
  out.filename:: filenames[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
}}@1|@20000|290000|0|0|0|0|12476|List IDS Files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|30|0|63|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|31|0|66|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|32|0|68|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|33|0|70|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|34|0|72|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|35|0|75|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|36|0|78|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|37|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|$OPTIONAL_FILTER|3|2|$|@{0|}}
{30001002|XXparameter|condition|$FILTER_FLG|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Filter by Expression|425000|275000|0|0|0|0|12494|Filter (Optional)|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|38|0|85|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|39|0|88|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|40|0|90|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|41|0|92|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|42|0|94|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|43|0|96|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|44|0|99|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|45|0|101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|47|0|107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|48|0|110|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|49|0|113|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|50|0|116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|51|0|119|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|type input_type =
$GET_DML;

let long stride = number_of_partitions();
let long seq_number = 0; /* Assign record number on each source record.*/

filename :: get_filename(in) =
begin
  seq_number = this_partition() - stride + 1;
  
  filename :: this_partition_path(in.filename); /* Assign local file name of each file picked up for processing. */
end;

out :: reformat(read, filename, in) =
begin
  seq_number = seq_number + stride;
  out.ids_updt_dttm :: if(is_null(read.ids_updt_dttm)) (datetime("YYYYMMDDHH24MISS"))"19000101000000" else read.ids_updt_dttm;
  out.filename :: filename;
  out.file_rec_cntr :: seq_number;
  out.* :: read.*;
end;|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr; end;', GET_DML) ]|3|9||@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH|3|2|$|@{0|}}
}}@1|Read Multiple Files|257000|276000|0|0|0|0|12480|Read IDS Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|52|0|121|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|53|0|124|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|54|0|126|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|55|0|128|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|56|0|130|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|57|0|132|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|58|0|134|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|59|0|137|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|60|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|61|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|62|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|63|0|148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|64|0|151|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|65|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|66|0|157|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|67|0|166|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_DATA_PATH/$SOURCE_FILE_PATTERN", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH/$SOURCE_FILE_PATTERN|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|$GET_DML_FILE|3|2|f$|@{0|}}
}}@0|@176000|503000|0|0|0|0|12406|First IDS file for view data|Ab Initio Software|@1|100|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|68|0|168|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|69|0|171|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|70|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|71|0|176|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
}}@1|@1546000|483500|872000|443000|56000|50000|12295|Get Job Log|Ab Initio Software||1|205|0||6||33025|-1|-1|}}
{2010202004|XXGiport|72|0|178|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|73|0|181|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|74|0|183|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|75|0|187|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|include "/~$PUB_DXF_XFR/dataset_id.xfr";
include "/~$PUB_DXF_XFR/sys_id.xfr";
include "/~$PUB_DXF_XFR/standardize.xfr";
include "/~$PUB_DXF_DML/dxf_job_event_text.dml";

let long dxf_src_sys_id = name_to_sys_id($"SUBJECT_AREA");
let long dxf_src_dataset_id = /* if ( this_partition() == 0 ) get_dataset_id("$DATASET_ID_LOOKUP_PATH") else */ 0;  /* The index into the Source Process table. */
let long dxf_src_rec_cnt=0;
let string(unsigned integer(1)) dxf_src_file_name="";
let start_time = now();

/* Always output 1 record.  Also increments the record counter. */
out :: length(in) =
begin
  out :: 1;
end;

/* Add Source ID and Record Number.  Remove trailing blanks from strings. */
out :: normalize(in, index) =
begin
  dxf_src_file_name = in.filename;
  dxf_src_rec_cnt = in.file_rec_cntr;
  out.(*, name == "dxf_src_sys_id") :1: dxf_src_sys_id;
  out.(*, name == "dxf_src_dataset_id") :2: dxf_src_dataset_id;
  out.(*, name == "dxf_src_rec_cnt") :3: dxf_src_rec_cnt;
  out.(*, name == "dxf_src_file_name") :4: dxf_src_file_name;
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
{30001002|XXparameter|out_metadata|$[GET_DML_PLUS_HEADER]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|@1432952|258880|683000|208000|145000|126000|12474|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|76|0|189|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|77|0|192|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|78|0|194|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|79|0|196|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|80|0|199|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|81|0|202|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|82|0|204|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|83|0|207|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|84|0|210|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|85|0|213|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|86|0|216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|87|0|219|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
}}@1|@57000|160500|77000|181000|135000|93000|9955|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|88|0|221|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010210004|XXGflow|89|0|223|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9952|17|}}
{2010203004|XXGoport|90|0|225|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010210004|XXGflow|91|0|227|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9953|17|}}
{2010203004|XXGoport|92|0|229|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010210004|XXGflow|93|0|231|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9954|17|}}
{2010203004|XXGoport|94|0|233|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|95|0|235|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|96|0|237|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|97|0|239|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|98|0|241|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|99|0|243|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|100|0|245|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|101|0|247|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|102|0|250|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@1|@1884913|171047|671000|180000|56000|50000|12457|Optional: Source|Ab Initio Software||1|1000|-1||6|record_id	== '397416000_A'
|33025|-1|-1|}}
{2010202004|XXGiport|103|0|252|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|104|0|255|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|105|0|257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|106|0|260|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/clean.$SOURCE_SYSTEM/clean.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@1890913|296047|671000|285000|56000|50000|12490|Optional: Clean|Ab Initio Software||1|100000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|107|0|262|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|108|0|265|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|109|0|267|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|110|0|270|0|{|{}@1|@472000|414500|494000|435000|56000|50000|9961|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|111|0|272|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010210004|XXGflow|112|0|274|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9960|2065|}}
{2010501005|XXGpvertex|113|0|279|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|let decimal("\\x01") v_rank = 1 ;
//let decimal("\\x01") prev_val = previous(in.dxf_sk) ;


/*Do computation*/
out::scan(in)=
begin
let decimal("") v_count = count();
//out.prev_val = previous(in.dxf_sk);
v_rank = if ( is_null(previous(in.dxf_sk)) ) v_count
            else if( !is_null(previous(in.dxf_sk)) && in.dxf_sk != previous(in.dxf_sk) ) v_count else v_rank ;
out.rank :: v_rank;
out.* :: in.* ;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr;\\n  decimal("\\\\x01") rank; end;', GET_DML) ]|3|9||@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
}}@1|Scan|853000|285000|0|0|0|0|12485|Scan|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|114|0|281|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|115|0|284|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|116|0|286|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|117|0|288|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|118|0|290|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|119|0|293|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{30001002|XXparameter|num_operations|11|1|2|H$|Number of operations in package|{0|}}
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
}}@0|Scan|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|120|0|295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|121|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|122|0|301|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|123|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|124|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|125|0|314|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@1883913|456047|671000|390000|56000|50000|12455|Optional: Lookup|Ab Initio Software||1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|126|0|316|0|{@{}@661000|409000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|127|0|319|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|128|0|321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|129|0|325|0|{Subgraph created from graph "get.ids.scan"|{}@0|@614000|255000|0|0|0|0|12426|Partition and Duping on SK|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|761000|176000|7|}}
{2010210004|XXGflow|130|0|327|0|{@{}@384|.5|.5|{0|}12297|17|}}
{2010243001|XXGwatcher|131|0|329|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|132|0|331|0|{@{}@384|.5|.5|{0|}12301|17|}}
{2010210004|XXGflow|133|0|333|0|{@{}@384|.5|.5|{0|}12300|17|}}
{2010501005|XXGpvertex|134|0|335|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Broadcast|664000|71000|0|0|0|0|12287|Broadcast-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|135|0|337|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|136|0|339|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|342|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|138|0|344|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|139|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|140|0|353|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dt_sk descending\}|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Dedup Sorted|476000|40000|0|0|0|0|12302|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|141|0|355|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|142|0|358|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|143|0|360|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|144|0|362|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|145|0|364|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|146|0|366|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|147|0|369|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|148|0|371|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|149|0|374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|150|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|151|0|380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|152|0|383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|153|0|386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|154|0|394|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dt_sk descending\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@40000|30000|0|0|481000|303000|12296|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|155|0|396|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|156|0|398|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|157|0|400|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|158|0|403|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|159|0|407|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|160|0|409|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|161|0|411|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|162|0|416|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|163|0|420|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|164|0|423|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|165|0|425|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|166|0|427|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|167|0|429|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|168|0|432|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|169|0|434|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|170|0|436|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|171|0|439|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|172|0|444|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|173|0|446|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|174|0|448|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|175|0|451|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|176|0|453|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|177|0|456|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|178|0|462|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|179|0|465|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|180|0|470|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|\{dt_sk descending\}|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{ids_updt_dttm descending\}|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Sort within Groups|270000|30000|0|0|0|0|12299|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|181|0|472|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|182|0|475|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|183|0|478|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|184|0|480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|185|0|483|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|186|0|489|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|187|0|493|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|188|0|497|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|\{dxf_sk descending\}|3|2|$|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
}}@0|@1013000|270000|0|0|481000|303000|12337|Partition by Key and Sort-1|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|189|0|499|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|190|0|501|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|191|0|503|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|192|0|506|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|193|0|510|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|194|0|512|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|195|0|514|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|196|0|519|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|197|0|523|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|198|0|527|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|199|0|529|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|200|0|531|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@1|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|201|0|533|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|202|0|536|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|203|0|538|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|204|0|540|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|205|0|543|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|206|0|548|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@1|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|207|0|550|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|208|0|552|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|209|0|555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|210|0|557|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|211|0|560|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|212|0|566|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|213|0|569|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|214|0|574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
}}@0|@1648000|266678|317000|338000|892000|502000|12462|Prepare Output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.18630751967430115|891000|502000|1|}}
{2010240003|XXGlegend|215|0|576|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|216|0|578|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|217|0|580|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|218|0|582|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|219|0|584|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|220|0|586|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|221|0|588|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|222|0|590|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|223|0|594|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9948|1043|}}
{2010210004|XXGflow|224|0|597|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9945|17|}}
{2010210004|XXGflow|225|0|599|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9949|19|}}
{2010210004|XXGflow|226|0|602|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|227|0|604|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|228|0|606|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|229|0|608|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|230|0|614|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|231|0|616|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|232|0|618|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|233|0|624|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9951|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|234|0|626|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|235|0|628|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|236|0|630|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|237|0|632|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|238|0|634|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|239|0|636|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|240|0|638|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|241|0|640|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|242|0|642|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|243|0|644|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|244|0|646|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6828|17|}}
{2010210004|XXGflow|245|0|648|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6833|20|}}
{2010210004|XXGflow|246|0|650|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6825|17|}}
{2010210004|XXGflow|247|0|652|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6812|17|}}
{2010210004|XXGflow|248|0|654|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6813|17|}}
{2010210004|XXGflow|249|0|656|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6809|17|}}
{2010501005|XXGpvertex|250|0|658|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@98000|203000|118000|223000|124000|107000|6826|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|251|0|660|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|252|0|663|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|253|0|665|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|254|0|667|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|255|0|669|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|256|0|671|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|257|0|679|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@79600|93132|69000|102000|92000|41000|6834|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|258|0|681|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|259|0|684|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|260|0|688|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|261|0|690|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|262|0|692|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|263|0|698|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@479000|385000|499000|405000|129000|107000|6810|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|264|0|700|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|265|0|703|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|266|0|705|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|267|0|707|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|268|0|709|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|269|0|716|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@477000|176000|497000|196000|139000|107000|6811|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|270|0|718|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|271|0|721|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|272|0|723|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|273|0|725|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|274|0|727|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|275|0|734|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@328000|62062|348000|82000|106000|89000|6829|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|276|0|736|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|277|0|739|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|278|0|745|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@131000|387000|151000|407000|135000|107000|6814|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|279|0|747|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|280|0|750|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|281|0|756|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|282|0|758|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|283|0|760|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|284|0|762|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|285|0|764|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|286|0|766|0|{|{}@1|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|287|0|768|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|288|0|771|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|289|0|773|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|290|0|775|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|291|0|777|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|292|0|779|0|{|{}@1|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|293|0|781|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|294|0|784|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|295|0|786|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|296|0|788|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|297|0|790|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|298|0|795|0|{|{}@1|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|299|0|797|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|300|0|800|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|301|0|803|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|302|0|806|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|303|0|809|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|304|0|814|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|305|0|818|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|306|0|824|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|307|0|826|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|308|0|829|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|309|0|834|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|310|0|836|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|311|0|838|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|312|0|846|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|@646000|298500|656000|313000|50000|41000|9946|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|313|0|848|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|314|0|851|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|315|0|856|0|{@{}@482000|349000|11000|11000|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|316|0|860|0|{@{}@482000|379000|11000|11000|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|317|0|864|0|{@{}@482000|409000|11000|11000|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|318|0|868|0|{@{}@307000|379000|11000|11000|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|319|0|872|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
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
{2010240003|XXGlegend|320|0|874|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|321|0|876|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|322|0|878|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|323|0|880|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|324|0|882|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|325|0|884|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|326|0|886|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|327|0|888|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|328|0|890|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9909|17|}}
{2010210004|XXGflow|329|0|892|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|330|0|894|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9910|1043|}}
{2010210004|XXGflow|331|0|896|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9913|2065|}}
{2010210004|XXGflow|332|0|898|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|333|0|900|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9911|19|}}
{2010210004|XXGflow|334|0|902|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|335|0|904|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|336|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|337|0|908|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|338|0|910|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|339|0|913|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|340|0|915|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|341|0|918|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|342|0|921|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|343|0|923|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|344|0|925|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|345|0|928|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|346|0|930|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|347|0|933|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|348|0|936|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
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
{2010240003|XXGlegend|349|0|938|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|350|0|940|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|351|0|942|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|352|0|944|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|353|0|946|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|354|0|948|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|355|0|950|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|356|0|952|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|357|0|954|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|358|0|956|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|359|0|958|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|360|0|960|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|361|0|962|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|362|0|964|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|363|0|966|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|364|0|968|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|365|0|970|0|{|{}@1|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|366|0|972|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|367|0|975|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|368|0|977|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|369|0|979|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|370|0|981|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|371|0|983|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|372|0|986|0|{|{}@1|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|373|0|988|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|374|0|991|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|375|0|993|0|{|{}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|376|0|995|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|377|0|997|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|378|0|1000|0|{|{}@1|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|379|0|1002|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|380|0|1005|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|381|0|1007|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|382|0|1009|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|383|0|1011|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|384|0|1014|0|{|{}@1|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|385|0|1016|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|386|0|1019|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|387|0|1021|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|388|0|1023|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|389|0|1025|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|390|0|1028|0|{|{}@1|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|391|0|1030|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|392|0|1033|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|393|0|1036|0|{|{}@1|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|394|0|1038|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|395|0|1041|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|396|0|1044|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|397|0|1046|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|398|0|1048|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|399|0|1050|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|400|0|1052|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|401|0|1054|0|{|{}@1|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|402|0|1056|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|403|0|1059|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|404|0|1061|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|405|0|1063|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|406|0|1065|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|407|0|1067|0|{|{}@1|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|408|0|1069|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|409|0|1072|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|410|0|1074|0|{|{}@1|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|411|0|1076|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|412|0|1078|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|413|0|1081|0|{|{}@1|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|414|0|1083|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|415|0|1086|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|416|0|1089|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|417|0|1092|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|418|0|1095|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|419|0|1100|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|420|0|1104|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|421|0|1108|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{2010240003|XXGlegend|422|0|1110|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|423|0|1112|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|424|0|1114|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|425|0|1116|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|426|0|1118|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|427|0|1120|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|428|0|1122|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|429|0|1124|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|430|0|1126|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|431|0|1128|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|432|0|1130|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|433|0|1132|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|434|0|1134|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|435|0|1136|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|436|0|1138|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|437|0|1140|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|438|0|1142|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@1|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|439|0|1144|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|440|0|1147|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|441|0|1149|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|442|0|1151|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|443|0|1153|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|444|0|1155|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|445|0|1158|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
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
{2010203004|XXGoport|446|0|1160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|447|0|1163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|448|0|1166|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|449|0|1169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|450|0|1172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|451|0|1175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|452|0|1178|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@1|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|453|0|1180|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|454|0|1183|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|455|0|1185|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|456|0|1187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|457|0|1190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|458|0|1194|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@1|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|459|0|1196|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|460|0|1198|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|461|0|1201|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|462|0|1203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|463|0|1206|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|464|0|1209|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
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
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
}}@1|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|465|0|1211|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|466|0|1214|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|467|0|1216|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|468|0|1218|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|469|0|1220|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|470|0|1223|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|471|0|1225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|472|0|1228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|473|0|1231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|474|0|1234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|475|0|1237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|476|0|1240|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
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
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: in = out
metadata type: out = in|3|9||@{0|}}
}}@1|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|477|0|1242|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|478|0|1245|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|479|0|1247|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|480|0|1249|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|481|0|1251|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|482|0|1254|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|483|0|1256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|484|0|1259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|485|0|1262|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|486|0|1265|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|487|0|1268|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|488|0|1271|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@1|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|489|0|1273|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|490|0|1276|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|491|0|1279|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|492|0|1281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|493|0|1284|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|494|0|1287|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@1|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|495|0|1289|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|496|0|1292|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|497|0|1295|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|498|0|1297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|499|0|1300|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|500|0|1303|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|501|0|1305|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|502|0|1307|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|503|0|1309|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|504|0|1311|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|505|0|1313|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|13|3|2|$|@{0|}}
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
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
}}@1|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|506|0|1315|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|507|0|1318|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|508|0|1320|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|509|0|1322|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1375403554|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|510|0|1324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|511|0|1327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|512|0|1330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|513|0|1333|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|514|0|1335|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|515|0|1337|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|516|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|517|0|1342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@1|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|518|0|1344|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|519|0|1347|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|520|0|1349|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|521|0|1351|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|522|0|1354|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|523|0|1357|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
}}@1|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|524|0|1359|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|525|0|1361|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|526|0|1364|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|527|0|1366|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|528|0|1369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|529|0|1372|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/~stdout|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/~stdout", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|530|0|1374|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|531|0|1377|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|532|0|1379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|533|0|1382|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|534|0|1385|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|535|0|1388|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|536|0|1391|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|537|0|1394|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|538|0|1397|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|539|0|1400|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|540|0|1402|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|541|0|1405|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|542|0|1407|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|543|0|1411|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@1|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|544|0|1413|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|545|0|1416|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|546|0|1419|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|547|0|1421|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|548|0|1424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|549|0|1427|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@1|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|550|0|1429|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|551|0|1431|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|552|0|1435|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|553|0|1437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|554|0|1440|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|555|0|1443|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
}}@1|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|556|0|1445|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|557|0|1448|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|558|0|1451|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|559|0|1454|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|560|0|1456|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|561|0|1458|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|562|0|1460|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|563|0|1462|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|564|0|1464|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|565|0|1466|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|566|0|1468|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|567|0|1470|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1379520143|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|out1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out2_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject2_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|error2_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|568|0|1472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|569|0|1476|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|570|0|1480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|571|0|1484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|572|0|1487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|573|0|1490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|574|0|1493|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|575|0|1496|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|576|0|1499|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|577|0|1502|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|578|0|1505|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|579|0|1508|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@1|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|580|0|1510|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|581|0|1513|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|582|0|1516|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|583|0|1518|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|584|0|1521|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|585|0|1524|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|586|0|1527|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|587|0|1530|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|588|0|1533|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|589|0|1536|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|transform0||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Reformat|1229000|270000|0|0|0|0|12488|RFMT: Optional transform|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|590|0|1538|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|591|0|1541|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|592|0|1543|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|593|0|1545|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|594|0|1547|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|595|0|1550|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|596|0|1552|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|597|0|1556|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|598|0|1559|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|599|0|1562|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|600|0|1565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|601|0|1574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{event_type\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|include "/~$PUB_DXF_DML/dxf_job_event_text.dml";


let long task_start_time = now();
let long task_end_time = 0;
let string("")[int] file_list=$[string_representation(SOURCE_FILE_LIST_VEC)];

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
  out.type_of_input :: 'ids file'; /* Or 'file' or 'ftp' */
  out.dataset_start_dttm :: start_time;
  out.dataset_min_end_dttm :: min_end_time;
  out.dataset_max_end_dttm :: max_end_time;
  out.file_path :: $"IDS_DATA_PATH";
  out.file_size :: file_information($"IDS_DATA_PATH" + "/" + file_list[0]).size;
  out.file_modified_dttm :: file_information($"IDS_DATA_PATH" + "/" + file_list[0]).modified;
  out.sql_script :: "";
end;|3|9||@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|doc_transform|out,reject,error,log :: document(in) =
begin
out.* :: in.*;
end;|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Rollup|1295000|465000|0|0|0|0|12403|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|602|0|1576|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|603|0|1579|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|604|0|1581|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|605|0|1583|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|606|0|1585|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|607|0|1588|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|608|0|1590|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|609|0|1593|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|610|0|1596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|611|0|1599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|612|0|1602|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|613|0|1610|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|290000|494500|0|0|0|0|12404|Trash|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@65|1|{1|0|}}}
{2010202004|XXGiport|614|0|1612|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|615|0|1615|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|616|0|1617|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|617|0|1622|0|{Subgraph created from graph "get.ids.scan"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[AI_PHASE == "dev"]|3|9|F||{0|}}
}}@0|@64000|106750|0|0|0|0|12491|Write DMLs|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|339000|194000|7|}}
{2010210004|XXGflow|618|0|1624|0|{@{}@384|.5|.5|{0|}12476|17|}}
{2010501005|XXGpvertex|619|0|1626|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.filename :: "dml/clean." + $"SOURCE_SYSTEM" + "/clean." + $"SOURCE_LOWER" + ".dml";
  out.contents :: string_replace($"CLEAN_DML", "\\x01", "\\\\x01");
end;|3|9||@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Create Data|41000|77000|0|0|0|0|12477|Create Data|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|620|0|1628|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|621|0|1631|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|622|0|1633|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|623|0|1635|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|624|0|1637|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|625|0|1640|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|626|0|1643|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|627|0|1646|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Metadata/ReusableDatasets/Write_Sandbox_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|/*
              NOTICE
     COPYRIGHT 2012 AB INITIO
UNPUBLISHED -- ALL RIGHTS RESERVED

This program is confidential and a trade secret of Ab Initio.
Receipt or possession conveys no rights for any purpose without
specific written consent from Ab Initio.
*/
record
  string(big endian integer(4)) filename; /* sandbox-relative name of the file to write */
  void(big endian integer(4)) contents = NULL;   /* binary contents for the file, if null, remove file */
end
|3|1|l|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|sandbox|$AI_DML/..|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL|3|2|$|@{0|}}
}}@0|Write Sandbox Files|190000|57500|0|0|0|0|12475|Write Sandbox Files|Ab Initio Software|Built-in 3.1.2.r10:|1|100|0|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|628|0|1648|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|629|0|1650|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|630|0|1652|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|631|0|1654|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|632|0|1657|0|{Writes files into a sandbox|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Write_Sandbox_Files|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/write-sandbox-files|3|2|H$||{0|}}
{30001002|XXparameter|record_kind|file|16|2|RO$|The kind of records this component expects|{0|}}
{30001002|XXparameter|sandbox||3|2|RFK$|Sandbox hosting the files. Base path for sandbox relative file paths.|{0|}}
{30001002|XXparameter|lock|True|13|1|FKl|Acquire TR lock before modifying existing objects|{0|}}
{30001002|XXparameter|break_locks|False|13|1|FKl|Break locks held by other users|{0|}}
{30001002|XXparameter|break_locks.display_name|break-locks|3|9|P|@{0|}}
{30001002|XXparameter|break_locks.keyword|break-locks|3|9|P|@{0|}}
{30001002|XXparameter|break_locks.condition|param lock True|3|15|P?|@{0|}}
{30001002|XXparameter|permissions|664|3|2|FK$|unix-style numeric permissions mask for newly created files|{0|}}
{30001002|XXparameter|create_directories|True|13|1|FKl|If True, create any parent directories as necessary|{0|}}
{30001002|XXparameter|create_directories.display_name|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|create_directories.keyword|create-directories|3|9|P|@{0|}}
{30001002|XXparameter|force_write|False|13|1|FKl|Write file even if it is unchanged.|{0|}}
{30001002|XXparameter|force_write.display_name|force-write|3|9|P|@{0|}}
{30001002|XXparameter|force_write.keyword|force-write|3|9|P|@{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
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
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|2|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(error_info, in)|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(error_info, in)|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation3|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_operations|3|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|num_callbacks|3|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = "/*
              NOTICE
     COPYRIGHT 2012 AB INITIO
UNPUBLISHED -- ALL RIGHTS RESERVED

This program is confidential and a trade secret of Ab Initio.
Receipt or possession conveys no rights for any purpose without
specific written consent from Ab Initio.
*/
record
  string(big endian integer(4)) filename; /* sandbox-relative name of the file to write */
  void(big endian integer(4)) contents = NULL;   /* binary contents for the file, if null, remove file */
end
"
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|Write Sandbox Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|633|0|1659|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|634|0|1662|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|635|0|1665|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|636|0|1668|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|637|0|1674|0|{@{}@{1|328002|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010604001|XXGgraph_flow_flow|6|0|12|0|{Flow_1|}1|7|}
{2010604001|XXGgraph_flow_flow|7|0|14|0|{Flow_11|}1|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_12|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_14|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_16|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_17|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_18|}1|13|}
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_2|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_3|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_4|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_5|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_6|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_7|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_8|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_9|}1|21|}
{2010244001|XXGflow_watcher_watcher|21|0|42|0|{}21|22|}
{2010601001|XXGgraph_vertex_vertex|22|0|44|0|{Broadcast|}1|23|}
{2010212001|XXGvertex_oport_oport|23|0|46|0|{0|out|}23|24|}
{2010213001|XXGoport_dst_flow|24|0|48|0|{0|}24|7|}
{2010211001|XXGvertex_iport_iport|25|0|49|0|{0|in|}23|25|}
{2010214001|XXGiport_src_flow|26|0|51|0|{0|}25|19|}
{2010007001|XXGobject_proto_object|27|0|52|0|{}23|26|}
{2010212001|XXGvertex_oport_oport|28|0|54|0|{0|out|}26|27|}
{2010006001|XXGobject_psameas_object|29|0|56|0|{metadata|out_metadata|1|0|}27|26|}
{2010211001|XXGvertex_iport_iport|30|0|57|0|{0|in|}26|28|}
{2010006001|XXGobject_psameas_object|31|0|59|0|{metadata|in_metadata|1|0|}28|26|}
{2010006001|XXGobject_psameas_object|32|0|60|0|{Layout|Layout|0|0|}23|29|}
{2010212001|XXGvertex_oport_oport|33|0|62|0|{0|out|}29|30|}
{2010213001|XXGoport_dst_flow|34|0|64|0|{0|}30|19|}
{2010212001|XXGvertex_oport_oport|35|0|65|0|{1|error|}29|31|}
{2010212001|XXGvertex_oport_oport|36|0|67|0|{2|log|}29|32|}
{2010007001|XXGobject_proto_object|37|0|69|0|{}29|33|}
{2010212001|XXGvertex_oport_oport|38|0|71|0|{0|out|}33|34|}
{2010006001|XXGobject_psameas_object|39|0|73|0|{metadata|out_metadata|1|0|}34|33|}
{2010212001|XXGvertex_oport_oport|40|0|74|0|{1|error|}33|35|}
{2010006001|XXGobject_psameas_object|41|0|76|0|{metadata|error_metadata|1|0|}35|33|}
{2010212001|XXGvertex_oport_oport|42|0|77|0|{2|log|}33|36|}
{2010006001|XXGobject_psameas_object|43|0|79|0|{metadata|log_metadata|1|0|}36|33|}
{2010006001|XXGobject_psameas_object|44|0|80|0|{in_metadata|out_metadata|0|0|}23|29|}
{2010006001|XXGobject_psameas_object|45|0|81|0|{out_metadata|out_metadata|0|0|}23|29|}
{2010601001|XXGgraph_vertex_vertex|46|0|82|0|{Filter_Optional_|}1|37|}
{2010212001|XXGvertex_oport_oport|47|0|84|0|{0|out|}37|38|}
{2010213001|XXGoport_dst_flow|48|0|86|0|{0|}38|18|}
{2010212001|XXGvertex_oport_oport|49|0|87|0|{1|deselect|}37|39|}
{2010212001|XXGvertex_oport_oport|50|0|89|0|{2|reject|}37|40|}
{2010212001|XXGvertex_oport_oport|51|0|91|0|{3|error|}37|41|}
{2010212001|XXGvertex_oport_oport|52|0|93|0|{4|log|}37|42|}
{2010211001|XXGvertex_iport_iport|53|0|95|0|{0|in|}37|43|}
{2010214001|XXGiport_src_flow|54|0|97|0|{0|}43|11|}
{2010007001|XXGobject_proto_object|55|0|98|0|{}37|44|}
{2010212001|XXGvertex_oport_oport|56|0|100|0|{0|out|}44|45|}
{2010006001|XXGobject_psameas_object|57|0|102|0|{metadata|out_metadata|1|0|}45|44|}
{2010212001|XXGvertex_oport_oport|58|0|103|0|{1|deselect|}44|46|}
{2010006001|XXGobject_psameas_object|59|0|105|0|{metadata|deselect_metadata|1|0|}46|44|}
{2010212001|XXGvertex_oport_oport|60|0|106|0|{2|reject|}44|47|}
{2010006001|XXGobject_psameas_object|61|0|108|0|{metadata|reject_metadata|1|0|}47|44|}
{2010212001|XXGvertex_oport_oport|62|0|109|0|{3|error|}44|48|}
{2010006001|XXGobject_psameas_object|63|0|111|0|{metadata|error_metadata|1|0|}48|44|}
{2010212001|XXGvertex_oport_oport|64|0|112|0|{4|log|}44|49|}
{2010006001|XXGobject_psameas_object|65|0|114|0|{metadata|log_metadata|1|0|}49|44|}
{2010211001|XXGvertex_iport_iport|66|0|115|0|{0|in|}44|50|}
{2010006001|XXGobject_psameas_object|67|0|117|0|{metadata|in_metadata|1|0|}50|44|}
{2010006001|XXGobject_psameas_object|68|0|118|0|{Layout|Layout|0|0|}37|51|}
{2010212001|XXGvertex_oport_oport|69|0|120|0|{0|out|}51|52|}
{2010213001|XXGoport_dst_flow|70|0|122|0|{0|}52|11|}
{2010212001|XXGvertex_oport_oport|71|0|123|0|{1|filereject|}51|53|}
{2010212001|XXGvertex_oport_oport|72|0|125|0|{2|fileerror|}51|54|}
{2010212001|XXGvertex_oport_oport|73|0|127|0|{3|reject|}51|55|}
{2010212001|XXGvertex_oport_oport|74|0|129|0|{4|error|}51|56|}
{2010212001|XXGvertex_oport_oport|75|0|131|0|{5|log|}51|57|}
{2010211001|XXGvertex_iport_iport|76|0|133|0|{0|in|}51|58|}
{2010214001|XXGiport_src_flow|77|0|135|0|{0|}58|7|}
{2010007001|XXGobject_proto_object|78|0|136|0|{}51|59|}
{2010212001|XXGvertex_oport_oport|79|0|138|0|{0|out|}59|60|}
{2010006001|XXGobject_psameas_object|80|0|140|0|{metadata|out_metadata|1|0|}60|59|}
{2010212001|XXGvertex_oport_oport|81|0|141|0|{1|filereject|}59|61|}
{2010006001|XXGobject_psameas_object|82|0|143|0|{metadata|filereject_metadata|1|0|}61|59|}
{2010212001|XXGvertex_oport_oport|83|0|144|0|{2|fileerror|}59|62|}
{2010006001|XXGobject_psameas_object|84|0|146|0|{metadata|fileerror_metadata|1|0|}62|59|}
{2010212001|XXGvertex_oport_oport|85|0|147|0|{3|reject|}59|63|}
{2010006001|XXGobject_psameas_object|86|0|149|0|{metadata|reject_metadata|1|0|}63|59|}
{2010212001|XXGvertex_oport_oport|87|0|150|0|{4|error|}59|64|}
{2010006001|XXGobject_psameas_object|88|0|152|0|{metadata|error_metadata|1|0|}64|59|}
{2010212001|XXGvertex_oport_oport|89|0|153|0|{5|log|}59|65|}
{2010006001|XXGobject_psameas_object|90|0|155|0|{metadata|log_metadata|1|0|}65|59|}
{2010211001|XXGvertex_iport_iport|91|0|156|0|{0|in|}59|66|}
{2010006001|XXGobject_psameas_object|92|0|158|0|{metadata|in_metadata|1|0|}66|59|}
{2010006001|XXGobject_psameas_object|93|0|159|0|{filereject_metadata|out_metadata|0|0|}51|29|}
{2010006001|XXGobject_psameas_object|94|0|160|0|{in_metadata|out_metadata|0|0|}51|29|}
{2010006001|XXGobject_psameas_object|95|0|161|0|{deselect_metadata|out_metadata|0|0|}37|51|}
{2010006001|XXGobject_psameas_object|96|0|162|0|{in_metadata|out_metadata|0|0|}37|51|}
{2010006001|XXGobject_psameas_object|97|0|163|0|{out_metadata|out_metadata|0|0|}37|51|}
{2010006001|XXGobject_psameas_object|98|0|164|0|{reject_metadata|out_metadata|0|0|}37|51|}
{2010601001|XXGgraph_vertex_vertex|99|0|165|0|{First_IDS_file_for_view_data|}1|67|}
{2010212001|XXGvertex_oport_oport|100|0|167|0|{0|read|}67|68|}
{2010213001|XXGoport_dst_flow|101|0|169|0|{0|}68|17|}
{2010007001|XXGobject_proto_object|102|0|170|0|{}67|69|}
{2010212001|XXGvertex_oport_oport|103|0|172|0|{0|read|}69|70|}
{2010006001|XXGobject_psameas_object|104|0|174|0|{metadata|read_metadata|1|0|}70|69|}
{2010601001|XXGgraph_vertex_vertex|105|0|175|0|{Get_Job_Log|}1|71|}
{2010211001|XXGvertex_iport_iport|106|0|177|0|{0|write|}71|72|}
{2010214001|XXGiport_src_flow|107|0|179|0|{0|}72|9|}
{2010007001|XXGobject_proto_object|108|0|180|0|{}71|73|}
{2010211001|XXGvertex_iport_iport|109|0|182|0|{0|write|}73|74|}
{2010006001|XXGobject_psameas_object|110|0|184|0|{metadata|write_metadata|1|0|}74|73|}
{2010601001|XXGgraph_vertex_vertex|111|0|185|0|{List_IDS_Files|}1|29|}
{2010601001|XXGgraph_vertex_vertex|112|0|186|0|{Normalize_Add_Job_ID_Record_Count|}1|75|}
{2010212001|XXGvertex_oport_oport|113|0|188|0|{0|out|}75|76|}
{2010213001|XXGoport_dst_flow|114|0|190|0|{0|}76|16|}
{2010212001|XXGvertex_oport_oport|115|0|191|0|{1|reject|}75|77|}
{2010212001|XXGvertex_oport_oport|116|0|193|0|{2|error|}75|78|}
{2010212001|XXGvertex_oport_oport|117|0|195|0|{3|log|}75|79|}
{2010213001|XXGoport_dst_flow|118|0|197|0|{0|}79|8|}
{2010211001|XXGvertex_iport_iport|119|0|198|0|{0|in|}75|80|}
{2010214001|XXGiport_src_flow|120|0|200|0|{0|}80|21|}
{2010007001|XXGobject_proto_object|121|0|201|0|{}75|81|}
{2010212001|XXGvertex_oport_oport|122|0|203|0|{0|out|}81|82|}
{2010006001|XXGobject_psameas_object|123|0|205|0|{metadata|out_metadata|1|0|}82|81|}
{2010212001|XXGvertex_oport_oport|124|0|206|0|{1|reject|}81|83|}
{2010006001|XXGobject_psameas_object|125|0|208|0|{metadata|reject_metadata|1|0|}83|81|}
{2010212001|XXGvertex_oport_oport|126|0|209|0|{2|error|}81|84|}
{2010006001|XXGobject_psameas_object|127|0|211|0|{metadata|error_metadata|1|0|}84|81|}
{2010212001|XXGvertex_oport_oport|128|0|212|0|{3|log|}81|85|}
{2010006001|XXGobject_psameas_object|129|0|214|0|{metadata|log_metadata|1|0|}85|81|}
{2010211001|XXGvertex_iport_iport|130|0|215|0|{0|in|}81|86|}
{2010006001|XXGobject_psameas_object|131|0|217|0|{metadata|in_metadata|1|0|}86|81|}
{2010006001|XXGobject_psameas_object|132|0|218|0|{Layout|Layout|0|0|}75|87|}
{2010212001|XXGvertex_oport_oport|133|0|220|0|{0|source|}87|88|}
{2010213001|XXGoport_dst_flow|134|0|222|0|{0|}88|89|}
{2010212001|XXGvertex_oport_oport|135|0|224|0|{1|clean|}87|90|}
{2010213001|XXGoport_dst_flow|136|0|226|0|{0|}90|91|}
{2010212001|XXGvertex_oport_oport|137|0|228|0|{2|lkp|}87|92|}
{2010213001|XXGoport_dst_flow|138|0|230|0|{0|}92|93|}
{2010212001|XXGvertex_oport_oport|139|0|232|0|{3|reject0|}87|94|}
{2010212001|XXGvertex_oport_oport|140|0|234|0|{4|reject1|}87|95|}
{2010212001|XXGvertex_oport_oport|141|0|236|0|{5|reject2|}87|96|}
{2010212001|XXGvertex_oport_oport|142|0|238|0|{6|error0|}87|97|}
{2010212001|XXGvertex_oport_oport|143|0|240|0|{7|error1|}87|98|}
{2010212001|XXGvertex_oport_oport|144|0|242|0|{8|error2|}87|99|}
{2010212001|XXGvertex_oport_oport|145|0|244|0|{9|log|}87|100|}
{2010211001|XXGvertex_iport_iport|146|0|246|0|{0|in|}87|101|}
{2010006001|XXGobject_psameas_object|147|0|248|0|{in_metadata|out_metadata|0|0|}87|75|}
{2010006001|XXGobject_psameas_object|148|0|249|0|{out0_metadata|write_metadata|0|0|}87|102|}
{2010211001|XXGvertex_iport_iport|149|0|251|0|{0|write|}102|103|}
{2010214001|XXGiport_src_flow|150|0|253|0|{0|}103|14|}
{2010007001|XXGobject_proto_object|151|0|254|0|{}102|104|}
{2010211001|XXGvertex_iport_iport|152|0|256|0|{0|write|}104|105|}
{2010006001|XXGobject_psameas_object|153|0|258|0|{metadata|write_metadata|1|0|}105|104|}
{2010006001|XXGobject_psameas_object|154|0|259|0|{out1_metadata|write_metadata|0|0|}87|106|}
{2010211001|XXGvertex_iport_iport|155|0|261|0|{0|write|}106|107|}
{2010214001|XXGiport_src_flow|156|0|263|0|{0|}107|15|}
{2010007001|XXGobject_proto_object|157|0|264|0|{}106|108|}
{2010211001|XXGvertex_iport_iport|158|0|266|0|{0|write|}108|109|}
{2010006001|XXGobject_psameas_object|159|0|268|0|{metadata|write_metadata|1|0|}109|108|}
{2010006001|XXGobject_psameas_object|160|0|269|0|{out2_metadata|write_metadata|0|0|}87|110|}
{2010211001|XXGvertex_iport_iport|161|0|271|0|{0|write|}110|111|}
{2010214001|XXGiport_src_flow|162|0|273|0|{0|}111|112|}
{2010006001|XXGobject_psameas_object|163|0|275|0|{reject0_metadata|out_metadata|0|0|}87|75|}
{2010006001|XXGobject_psameas_object|164|0|276|0|{reject1_metadata|out_metadata|0|0|}87|75|}
{2010006001|XXGobject_psameas_object|165|0|277|0|{reject2_metadata|out_metadata|0|0|}87|75|}
{2010006001|XXGobject_psameas_object|166|0|278|0|{in_metadata|out_metadata|0|0|}75|113|}
{2010212001|XXGvertex_oport_oport|167|0|280|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|168|0|282|0|{0|}114|10|}
{2010212001|XXGvertex_oport_oport|169|0|283|0|{1|reject|}113|115|}
{2010212001|XXGvertex_oport_oport|170|0|285|0|{2|error|}113|116|}
{2010212001|XXGvertex_oport_oport|171|0|287|0|{3|log|}113|117|}
{2010211001|XXGvertex_iport_iport|172|0|289|0|{0|in|}113|118|}
{2010214001|XXGiport_src_flow|173|0|291|0|{0|}118|12|}
{2010007001|XXGobject_proto_object|174|0|292|0|{}113|119|}
{2010212001|XXGvertex_oport_oport|175|0|294|0|{0|out|}119|120|}
{2010006001|XXGobject_psameas_object|176|0|296|0|{metadata|out_metadata|1|0|}120|119|}
{2010212001|XXGvertex_oport_oport|177|0|297|0|{1|reject|}119|121|}
{2010006001|XXGobject_psameas_object|178|0|299|0|{metadata|reject_metadata|1|0|}121|119|}
{2010212001|XXGvertex_oport_oport|179|0|300|0|{2|error|}119|122|}
{2010006001|XXGobject_psameas_object|180|0|302|0|{metadata|error_metadata|1|0|}122|119|}
{2010212001|XXGvertex_oport_oport|181|0|303|0|{3|log|}119|123|}
{2010006001|XXGobject_psameas_object|182|0|305|0|{metadata|log_metadata|1|0|}123|119|}
{2010211001|XXGvertex_iport_iport|183|0|306|0|{0|in|}119|124|}
{2010006001|XXGobject_psameas_object|184|0|308|0|{metadata|in_metadata|1|0|}124|119|}
{2010006001|XXGobject_psameas_object|185|0|309|0|{in_metadata|out_metadata|0|0|}113|51|}
{2010006001|XXGobject_psameas_object|186|0|310|0|{reject_metadata|out_metadata|0|0|}113|51|}
{2010006001|XXGobject_psameas_object|187|0|311|0|{reject_metadata|out_metadata|0|0|}75|113|}
{2010601001|XXGgraph_vertex_vertex|188|0|312|0|{Optional_Clean|}1|106|}
{2010601001|XXGgraph_vertex_vertex|189|0|313|0|{Optional_Lookup|}1|125|}
{2010211001|XXGvertex_iport_iport|190|0|315|0|{0|write|}125|126|}
{2010214001|XXGiport_src_flow|191|0|317|0|{0|}126|20|}
{2010007001|XXGobject_proto_object|192|0|318|0|{}125|127|}
{2010211001|XXGvertex_iport_iport|193|0|320|0|{0|write|}127|128|}
{2010006001|XXGobject_psameas_object|194|0|322|0|{metadata|write_metadata|1|0|}128|127|}
{2010601001|XXGgraph_vertex_vertex|195|0|323|0|{Optional_Source|}1|102|}
{2010601001|XXGgraph_vertex_vertex|196|0|324|0|{Partition_and_Duping_on_SK|}1|129|}
{2010604001|XXGgraph_flow_flow|197|0|326|0|{Flow_10|}129|130|}
{2010244001|XXGflow_watcher_watcher|198|0|328|0|{}130|131|}
{2010604001|XXGgraph_flow_flow|199|0|330|0|{Flow_13|}129|132|}
{2010604001|XXGgraph_flow_flow|200|0|332|0|{Flow_15|}129|133|}
{2010601001|XXGgraph_vertex_vertex|201|0|334|0|{Broadcast_1|}129|134|}
{2010212001|XXGvertex_oport_oport|202|0|336|0|{0|out|}134|135|}
{2010211001|XXGvertex_iport_iport|203|0|338|0|{0|in|}134|136|}
{2010214001|XXGiport_src_flow|204|0|340|0|{0|}136|132|}
{2010007001|XXGobject_proto_object|205|0|341|0|{}134|137|}
{2010212001|XXGvertex_oport_oport|206|0|343|0|{0|out|}137|138|}
{2010006001|XXGobject_psameas_object|207|0|345|0|{metadata|out_metadata|1|0|}138|137|}
{2010211001|XXGvertex_iport_iport|208|0|346|0|{0|in|}137|139|}
{2010006001|XXGobject_psameas_object|209|0|348|0|{metadata|in_metadata|1|0|}139|137|}
{2010006001|XXGobject_psameas_object|210|0|349|0|{Layout|Layout|0|0|}134|113|}
{2010006001|XXGobject_psameas_object|211|0|350|0|{in_metadata|out_metadata|0|0|}134|51|}
{2010006001|XXGobject_psameas_object|212|0|351|0|{out_metadata|out_metadata|0|0|}134|51|}
{2010601001|XXGgraph_vertex_vertex|213|0|352|0|{Dedup_Sorted|}129|140|}
{2010212001|XXGvertex_oport_oport|214|0|354|0|{0|out|}140|141|}
{2010213001|XXGoport_dst_flow|215|0|356|0|{0|}141|132|}
{2010212001|XXGvertex_oport_oport|216|0|357|0|{1|dup|}140|142|}
{2010212001|XXGvertex_oport_oport|217|0|359|0|{2|reject|}140|143|}
{2010212001|XXGvertex_oport_oport|218|0|361|0|{3|error|}140|144|}
{2010212001|XXGvertex_oport_oport|219|0|363|0|{4|log|}140|145|}
{2010211001|XXGvertex_iport_iport|220|0|365|0|{0|in|}140|146|}
{2010214001|XXGiport_src_flow|221|0|367|0|{0|}146|133|}
{2010007001|XXGobject_proto_object|222|0|368|0|{}140|147|}
{2010212001|XXGvertex_oport_oport|223|0|370|0|{0|out|}147|148|}
{2010006001|XXGobject_psameas_object|224|0|372|0|{metadata|out_metadata|1|0|}148|147|}
{2010212001|XXGvertex_oport_oport|225|0|373|0|{1|dup|}147|149|}
{2010006001|XXGobject_psameas_object|226|0|375|0|{metadata|dup_metadata|1|0|}149|147|}
{2010212001|XXGvertex_oport_oport|227|0|376|0|{2|reject|}147|150|}
{2010006001|XXGobject_psameas_object|228|0|378|0|{metadata|reject_metadata|1|0|}150|147|}
{2010212001|XXGvertex_oport_oport|229|0|379|0|{3|error|}147|151|}
{2010006001|XXGobject_psameas_object|230|0|381|0|{metadata|error_metadata|1|0|}151|147|}
{2010212001|XXGvertex_oport_oport|231|0|382|0|{4|log|}147|152|}
{2010006001|XXGobject_psameas_object|232|0|384|0|{metadata|log_metadata|1|0|}152|147|}
{2010211001|XXGvertex_iport_iport|233|0|385|0|{0|in|}147|153|}
{2010006001|XXGobject_psameas_object|234|0|387|0|{metadata|in_metadata|1|0|}153|147|}
{2010006001|XXGobject_psameas_object|235|0|388|0|{Layout|Layout|0|0|}140|113|}
{2010006001|XXGobject_psameas_object|236|0|389|0|{dup_metadata|out_metadata|0|0|}140|51|}
{2010006001|XXGobject_psameas_object|237|0|390|0|{in_metadata|out_metadata|0|0|}140|51|}
{2010006001|XXGobject_psameas_object|238|0|391|0|{out_metadata|out_metadata|0|0|}140|51|}
{2010006001|XXGobject_psameas_object|239|0|392|0|{reject_metadata|out_metadata|0|0|}140|51|}
{2010601001|XXGgraph_vertex_vertex|240|0|393|0|{Partition_by_Key_and_Sort|}129|154|}
{2010604001|XXGgraph_flow_flow|241|0|395|0|{Flow_1|}154|155|}
{2010601001|XXGgraph_vertex_vertex|242|0|397|0|{Partition_by_Key|}154|156|}
{2010212001|XXGvertex_oport_oport|243|0|399|0|{0|out|}156|157|}
{2010213001|XXGoport_dst_flow|244|0|401|0|{0|}157|155|}
{2010211001|XXGvertex_iport_iport|245|0|402|0|{0|in|}156|158|}
{2010006001|XXGobject_psameas_object|246|0|404|0|{in_metadata|out_metadata|0|0|}156|51|}
{2010006001|XXGobject_psameas_object|247|0|405|0|{out_metadata|out_metadata|0|0|}156|51|}
{2010601001|XXGgraph_vertex_vertex|248|0|406|0|{Sort|}154|159|}
{2010212001|XXGvertex_oport_oport|249|0|408|0|{0|out|}159|160|}
{2010211001|XXGvertex_iport_iport|250|0|410|0|{0|in|}159|161|}
{2010214001|XXGiport_src_flow|251|0|412|0|{0|}161|155|}
{2010006001|XXGobject_psameas_object|252|0|413|0|{in_metadata|out_metadata|0|0|}159|51|}
{2010006001|XXGobject_psameas_object|253|0|414|0|{out_metadata|out_metadata|0|0|}159|51|}
{2010212001|XXGvertex_oport_oport|254|0|415|0|{0|out0|}154|162|}
{2010216002|XXGoport_binding_oport|255|0|417|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}162|160|}
{2010213001|XXGoport_dst_flow|256|0|418|0|{0|}162|130|}
{2010211001|XXGvertex_iport_iport|257|0|419|0|{0|in0|}154|163|}
{2010215002|XXGiport_binding_iport|258|0|421|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}163|158|}
{2010007001|XXGobject_proto_object|259|0|422|0|{}154|164|}
{2010604001|XXGgraph_flow_flow|260|0|424|0|{Flow_1|}164|165|}
{2010601001|XXGgraph_vertex_vertex|261|0|426|0|{Partition_by_Key|}164|166|}
{2010212001|XXGvertex_oport_oport|262|0|428|0|{0|out|}166|167|}
{2010213001|XXGoport_dst_flow|263|0|430|0|{0|}167|165|}
{2010211001|XXGvertex_iport_iport|264|0|431|0|{0|in|}166|168|}
{2010007001|XXGobject_proto_object|265|0|433|0|{}166|169|}
{2010212001|XXGvertex_oport_oport|266|0|435|0|{0|out|}169|170|}
{2010006001|XXGobject_psameas_object|267|0|437|0|{metadata|out_metadata|1|0|}170|169|}
{2010211001|XXGvertex_iport_iport|268|0|438|0|{0|in|}169|171|}
{2010006001|XXGobject_psameas_object|269|0|440|0|{metadata|in_metadata|1|0|}171|169|}
{2010006001|XXGobject_psameas_object|270|0|441|0|{Layout|InputLayout|1|0|}166|164|}
{2010006001|XXGobject_psameas_object|271|0|442|0|{key|Key|1|0|}166|164|}
{2010601001|XXGgraph_vertex_vertex|272|0|443|0|{Sort|}164|172|}
{2010212001|XXGvertex_oport_oport|273|0|445|0|{0|out|}172|173|}
{2010211001|XXGvertex_iport_iport|274|0|447|0|{0|in|}172|174|}
{2010214001|XXGiport_src_flow|275|0|449|0|{0|}174|165|}
{2010007001|XXGobject_proto_object|276|0|450|0|{}172|175|}
{2010212001|XXGvertex_oport_oport|277|0|452|0|{0|out|}175|176|}
{2010006001|XXGobject_psameas_object|278|0|454|0|{metadata|out_metadata|1|0|}176|175|}
{2010211001|XXGvertex_iport_iport|279|0|455|0|{0|in|}175|177|}
{2010006001|XXGobject_psameas_object|280|0|457|0|{metadata|in_metadata|1|0|}177|175|}
{2010006001|XXGobject_psameas_object|281|0|458|0|{Layout|OutputLayout|1|0|}172|164|}
{2010006001|XXGobject_psameas_object|282|0|459|0|{key|Key|1|0|}172|164|}
{2010006001|XXGobject_psameas_object|283|0|460|0|{max_core|Max_core|1|0|}172|164|}
{2010212001|XXGvertex_oport_oport|284|0|461|0|{0|out0|}164|178|}
{2010216002|XXGoport_binding_oport|285|0|463|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}178|173|}
{2010211001|XXGvertex_iport_iport|286|0|464|0|{0|in0|}164|179|}
{2010215002|XXGiport_binding_iport|287|0|466|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}179|168|}
{2010006001|XXGobject_psameas_object|288|0|467|0|{InputLayout|Layout|0|0|}154|51|}
{2010006001|XXGobject_psameas_object|289|0|468|0|{OutputLayout|Layout|0|0|}154|113|}
{2010601001|XXGgraph_vertex_vertex|290|0|469|0|{Sort_within_Groups|}129|180|}
{2010212001|XXGvertex_oport_oport|291|0|471|0|{0|out|}180|181|}
{2010213001|XXGoport_dst_flow|292|0|473|0|{0|}181|133|}
{2010211001|XXGvertex_iport_iport|293|0|474|0|{0|in|}180|182|}
{2010214001|XXGiport_src_flow|294|0|476|0|{0|}182|130|}
{2010007001|XXGobject_proto_object|295|0|477|0|{}180|183|}
{2010212001|XXGvertex_oport_oport|296|0|479|0|{0|out|}183|184|}
{2010006001|XXGobject_psameas_object|297|0|481|0|{metadata|out_metadata|1|0|}184|183|}
{2010211001|XXGvertex_iport_iport|298|0|482|0|{0|in|}183|185|}
{2010006001|XXGobject_psameas_object|299|0|484|0|{metadata|in_metadata|1|0|}185|183|}
{2010006001|XXGobject_psameas_object|300|0|485|0|{Layout|Layout|0|0|}180|113|}
{2010006001|XXGobject_psameas_object|301|0|486|0|{in_metadata|out_metadata|0|0|}180|51|}
{2010006001|XXGobject_psameas_object|302|0|487|0|{out_metadata|out_metadata|0|0|}180|51|}
{2010212001|XXGvertex_oport_oport|303|0|488|0|{0|out0|}129|186|}
{2010216002|XXGoport_binding_oport|304|0|490|0|{.5|.5|{0|}12304|}186|135|}
{2010213001|XXGoport_dst_flow|305|0|491|0|{0|}186|12|}
{2010211001|XXGvertex_iport_iport|306|0|492|0|{0|in0|}129|187|}
{2010215002|XXGiport_binding_iport|307|0|494|0|{.5|.5|{0|}12303|}187|163|}
{2010214001|XXGiport_src_flow|308|0|495|0|{0|}187|18|}
{2010601001|XXGgraph_vertex_vertex|309|0|496|0|{Partition_by_Key_and_Sort_1|}1|188|}
{2010604001|XXGgraph_flow_flow|310|0|498|0|{Flow_1|}188|189|}
{2010601001|XXGgraph_vertex_vertex|311|0|500|0|{Partition_by_Key|}188|190|}
{2010212001|XXGvertex_oport_oport|312|0|502|0|{0|out|}190|191|}
{2010213001|XXGoport_dst_flow|313|0|504|0|{0|}191|189|}
{2010211001|XXGvertex_iport_iport|314|0|505|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|315|0|507|0|{in_metadata|out_metadata|0|0|}190|113|}
{2010006001|XXGobject_psameas_object|316|0|508|0|{out_metadata|out_metadata|0|0|}190|113|}
{2010601001|XXGgraph_vertex_vertex|317|0|509|0|{Sort|}188|193|}
{2010212001|XXGvertex_oport_oport|318|0|511|0|{0|out|}193|194|}
{2010211001|XXGvertex_iport_iport|319|0|513|0|{0|in|}193|195|}
{2010214001|XXGiport_src_flow|320|0|515|0|{0|}195|189|}
{2010006001|XXGobject_psameas_object|321|0|516|0|{in_metadata|out_metadata|0|0|}193|113|}
{2010006001|XXGobject_psameas_object|322|0|517|0|{out_metadata|out_metadata|0|0|}193|113|}
{2010212001|XXGvertex_oport_oport|323|0|518|0|{0|out0|}188|196|}
{2010216002|XXGoport_binding_oport|324|0|520|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}196|194|}
{2010213001|XXGoport_dst_flow|325|0|521|0|{0|}196|13|}
{2010211001|XXGvertex_iport_iport|326|0|522|0|{0|in0|}188|197|}
{2010215002|XXGiport_binding_iport|327|0|524|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}197|192|}
{2010214001|XXGiport_src_flow|328|0|525|0|{0|}197|10|}
{2010007001|XXGobject_proto_object|329|0|526|0|{}188|198|}
{2010604001|XXGgraph_flow_flow|330|0|528|0|{Flow_1|}198|199|}
{2010601001|XXGgraph_vertex_vertex|331|0|530|0|{Partition_by_Key|}198|200|}
{2010212001|XXGvertex_oport_oport|332|0|532|0|{0|out|}200|201|}
{2010213001|XXGoport_dst_flow|333|0|534|0|{0|}201|199|}
{2010211001|XXGvertex_iport_iport|334|0|535|0|{0|in|}200|202|}
{2010007001|XXGobject_proto_object|335|0|537|0|{}200|203|}
{2010212001|XXGvertex_oport_oport|336|0|539|0|{0|out|}203|204|}
{2010006001|XXGobject_psameas_object|337|0|541|0|{metadata|out_metadata|1|0|}204|203|}
{2010211001|XXGvertex_iport_iport|338|0|542|0|{0|in|}203|205|}
{2010006001|XXGobject_psameas_object|339|0|544|0|{metadata|in_metadata|1|0|}205|203|}
{2010006001|XXGobject_psameas_object|340|0|545|0|{Layout|InputLayout|1|0|}200|198|}
{2010006001|XXGobject_psameas_object|341|0|546|0|{key|Key|1|0|}200|198|}
{2010601001|XXGgraph_vertex_vertex|342|0|547|0|{Sort|}198|206|}
{2010212001|XXGvertex_oport_oport|343|0|549|0|{0|out|}206|207|}
{2010211001|XXGvertex_iport_iport|344|0|551|0|{0|in|}206|208|}
{2010214001|XXGiport_src_flow|345|0|553|0|{0|}208|199|}
{2010007001|XXGobject_proto_object|346|0|554|0|{}206|209|}
{2010212001|XXGvertex_oport_oport|347|0|556|0|{0|out|}209|210|}
{2010006001|XXGobject_psameas_object|348|0|558|0|{metadata|out_metadata|1|0|}210|209|}
{2010211001|XXGvertex_iport_iport|349|0|559|0|{0|in|}209|211|}
{2010006001|XXGobject_psameas_object|350|0|561|0|{metadata|in_metadata|1|0|}211|209|}
{2010006001|XXGobject_psameas_object|351|0|562|0|{Layout|OutputLayout|1|0|}206|198|}
{2010006001|XXGobject_psameas_object|352|0|563|0|{key|Key|1|0|}206|198|}
{2010006001|XXGobject_psameas_object|353|0|564|0|{max_core|Max_core|1|0|}206|198|}
{2010212001|XXGvertex_oport_oport|354|0|565|0|{0|out0|}198|212|}
{2010216002|XXGoport_binding_oport|355|0|567|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}212|207|}
{2010211001|XXGvertex_iport_iport|356|0|568|0|{0|in0|}198|213|}
{2010215002|XXGiport_binding_iport|357|0|570|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}213|202|}
{2010006001|XXGobject_psameas_object|358|0|571|0|{InputLayout|Layout|0|0|}188|113|}
{2010006001|XXGobject_psameas_object|359|0|572|0|{OutputLayout|Layout|0|0|}188|87|}
{2010601001|XXGgraph_vertex_vertex|360|0|573|0|{Prepare_Output|}1|214|}
{2010605001|XXGgraph_legend_legend|361|0|575|0|{0|}214|215|}
{2010241001|XXGlegend_face_face|362|0|577|0|{}215|216|}
{2010605001|XXGgraph_legend_legend|363|0|579|0|{1|}214|217|}
{2010241001|XXGlegend_face_face|364|0|581|0|{}217|218|}
{2010605001|XXGgraph_legend_legend|365|0|583|0|{2|}214|219|}
{2010241001|XXGlegend_face_face|366|0|585|0|{}219|220|}
{2010605001|XXGgraph_legend_legend|367|0|587|0|{3|}214|221|}
{2010241001|XXGlegend_face_face|368|0|589|0|{}221|222|}
{2010604001|XXGgraph_flow_flow|369|0|591|0|{Flow_1|}214|93|}
{2010604001|XXGgraph_flow_flow|370|0|592|0|{Flow_2|}214|91|}
{2010604001|XXGgraph_flow_flow|371|0|593|0|{Flow_3|}214|223|}
{2010604001|XXGgraph_flow_flow|372|0|595|0|{Flow_4|}214|112|}
{2010604001|XXGgraph_flow_flow|373|0|596|0|{Flow_5|}214|224|}
{2010604001|XXGgraph_flow_flow|374|0|598|0|{Flow_6|}214|225|}
{2010604001|XXGgraph_flow_flow|375|0|600|0|{Flow_7|}214|89|}
{2010604001|XXGgraph_flow_flow|376|0|601|0|{Flow_8|}214|226|}
{2010601001|XXGgraph_vertex_vertex|377|0|603|0|{Copy_Out|}214|227|}
{2010212001|XXGvertex_oport_oport|378|0|605|0|{0|out|}227|228|}
{2010211001|XXGvertex_iport_iport|379|0|607|0|{0|in|}227|229|}
{2010214001|XXGiport_src_flow|380|0|609|0|{0|}229|89|}
{2010006001|XXGobject_psameas_object|381|0|610|0|{Layout|Layout|0|0|}227|102|}
{2010006001|XXGobject_psameas_object|382|0|611|0|{in_metadata|write_metadata|0|0|}227|102|}
{2010006001|XXGobject_psameas_object|383|0|612|0|{out_metadata|write_metadata|0|0|}227|102|}
{2010601001|XXGgraph_vertex_vertex|384|0|613|0|{Copy_Out_|}214|230|}
{2010212001|XXGvertex_oport_oport|385|0|615|0|{0|out|}230|231|}
{2010211001|XXGvertex_iport_iport|386|0|617|0|{0|in|}230|232|}
{2010214001|XXGiport_src_flow|387|0|619|0|{0|}232|91|}
{2010006001|XXGobject_psameas_object|388|0|620|0|{Layout|Layout|0|0|}230|106|}
{2010006001|XXGobject_psameas_object|389|0|621|0|{in_metadata|write_metadata|0|0|}230|106|}
{2010006001|XXGobject_psameas_object|390|0|622|0|{out_metadata|write_metadata|0|0|}230|106|}
{2010601001|XXGgraph_vertex_vertex|391|0|623|0|{Dedup_and_Fix_Intervals|}214|233|}
{2010605001|XXGgraph_legend_legend|392|0|625|0|{0|}233|234|}
{2010241001|XXGlegend_face_face|393|0|627|0|{}234|235|}
{2010605001|XXGgraph_legend_legend|394|0|629|0|{1|}233|236|}
{2010241001|XXGlegend_face_face|395|0|631|0|{}236|237|}
{2010605001|XXGgraph_legend_legend|396|0|633|0|{2|}233|238|}
{2010241001|XXGlegend_face_face|397|0|635|0|{}238|239|}
{2010605001|XXGgraph_legend_legend|398|0|637|0|{3|}233|240|}
{2010241001|XXGlegend_face_face|399|0|639|0|{}240|241|}
{2010605001|XXGgraph_legend_legend|400|0|641|0|{4|}233|242|}
{2010241001|XXGlegend_face_face|401|0|643|0|{}242|243|}
{2010604001|XXGgraph_flow_flow|402|0|645|0|{Flow_1|}233|244|}
{2010604001|XXGgraph_flow_flow|403|0|647|0|{Flow_2|}233|245|}
{2010604001|XXGgraph_flow_flow|404|0|649|0|{Flow_3|}233|246|}
{2010604001|XXGgraph_flow_flow|405|0|651|0|{Flow_4|}233|247|}
{2010604001|XXGgraph_flow_flow|406|0|653|0|{Flow_6|}233|248|}
{2010604001|XXGgraph_flow_flow|407|0|655|0|{Flow_7|}233|249|}
{2010601001|XXGgraph_vertex_vertex|408|0|657|0|{Dedup_by_NK_Eff_Date|}233|250|}
{2010212001|XXGvertex_oport_oport|409|0|659|0|{0|out|}250|251|}
{2010213001|XXGoport_dst_flow|410|0|661|0|{0|}251|246|}
{2010212001|XXGvertex_oport_oport|411|0|662|0|{1|dup|}250|252|}
{2010212001|XXGvertex_oport_oport|412|0|664|0|{2|reject|}250|253|}
{2010212001|XXGvertex_oport_oport|413|0|666|0|{3|error|}250|254|}
{2010212001|XXGvertex_oport_oport|414|0|668|0|{4|log|}250|255|}
{2010211001|XXGvertex_iport_iport|415|0|670|0|{0|in|}250|256|}
{2010214001|XXGiport_src_flow|416|0|672|0|{0|}256|244|}
{2010006001|XXGobject_psameas_object|417|0|673|0|{Layout|Layout|0|0|}250|110|}
{2010006001|XXGobject_psameas_object|418|0|674|0|{dup_metadata|write_metadata|0|0|}250|110|}
{2010006001|XXGobject_psameas_object|419|0|675|0|{in_metadata|write_metadata|0|0|}250|110|}
{2010006001|XXGobject_psameas_object|420|0|676|0|{out_metadata|write_metadata|0|0|}250|110|}
{2010006001|XXGobject_psameas_object|421|0|677|0|{reject_metadata|write_metadata|0|0|}250|110|}
{2010601001|XXGgraph_vertex_vertex|422|0|678|0|{Parition_by_Related_or_NK|}233|257|}
{2010212001|XXGvertex_oport_oport|423|0|680|0|{0|out|}257|258|}
{2010213001|XXGoport_dst_flow|424|0|682|0|{0|}258|245|}
{2010211001|XXGvertex_iport_iport|425|0|683|0|{0|in|}257|259|}
{2010006001|XXGobject_psameas_object|426|0|685|0|{Layout|Layout|0|0|}257|87|}
{2010006001|XXGobject_psameas_object|427|0|686|0|{out_metadata|write_metadata|0|0|}257|110|}
{2010601001|XXGgraph_vertex_vertex|428|0|687|0|{Replicate|}233|260|}
{2010212001|XXGvertex_oport_oport|429|0|689|0|{0|out|}260|261|}
{2010211001|XXGvertex_iport_iport|430|0|691|0|{0|in|}260|262|}
{2010214001|XXGiport_src_flow|431|0|693|0|{0|}262|249|}
{2010006001|XXGobject_psameas_object|432|0|694|0|{Layout|Layout|0|0|}260|110|}
{2010006001|XXGobject_psameas_object|433|0|695|0|{in_metadata|write_metadata|0|0|}260|125|}
{2010006001|XXGobject_psameas_object|434|0|696|0|{out_metadata|write_metadata|0|0|}260|125|}
{2010601001|XXGgraph_vertex_vertex|435|0|697|0|{Rollup_Adjoining_Eff_Dates|}233|263|}
{2010212001|XXGvertex_oport_oport|436|0|699|0|{0|out|}263|264|}
{2010213001|XXGoport_dst_flow|437|0|701|0|{0|}264|249|}
{2010212001|XXGvertex_oport_oport|438|0|702|0|{1|reject|}263|265|}
{2010212001|XXGvertex_oport_oport|439|0|704|0|{2|error|}263|266|}
{2010212001|XXGvertex_oport_oport|440|0|706|0|{3|log|}263|267|}
{2010211001|XXGvertex_iport_iport|441|0|708|0|{0|in|}263|268|}
{2010214001|XXGiport_src_flow|442|0|710|0|{0|}268|248|}
{2010006001|XXGobject_psameas_object|443|0|711|0|{Layout|Layout|0|0|}263|110|}
{2010006001|XXGobject_psameas_object|444|0|712|0|{in_metadata|write_metadata|0|0|}263|110|}
{2010006001|XXGobject_psameas_object|445|0|713|0|{out_metadata|write_metadata|0|0|}263|110|}
{2010006001|XXGobject_psameas_object|446|0|714|0|{reject_metadata|write_metadata|0|0|}263|110|}
{2010601001|XXGgraph_vertex_vertex|447|0|715|0|{Scan_to_Fix_Overlapping_Dates|}233|269|}
{2010212001|XXGvertex_oport_oport|448|0|717|0|{0|out|}269|270|}
{2010213001|XXGoport_dst_flow|449|0|719|0|{0|}270|247|}
{2010212001|XXGvertex_oport_oport|450|0|720|0|{1|reject|}269|271|}
{2010212001|XXGvertex_oport_oport|451|0|722|0|{2|error|}269|272|}
{2010212001|XXGvertex_oport_oport|452|0|724|0|{3|log|}269|273|}
{2010211001|XXGvertex_iport_iport|453|0|726|0|{0|in|}269|274|}
{2010214001|XXGiport_src_flow|454|0|728|0|{0|}274|246|}
{2010006001|XXGobject_psameas_object|455|0|729|0|{Layout|Layout|0|0|}269|110|}
{2010006001|XXGobject_psameas_object|456|0|730|0|{in_metadata|write_metadata|0|0|}269|110|}
{2010006001|XXGobject_psameas_object|457|0|731|0|{out_metadata|write_metadata|0|0|}269|110|}
{2010006001|XXGobject_psameas_object|458|0|732|0|{reject_metadata|write_metadata|0|0|}269|110|}
{2010601001|XXGgraph_vertex_vertex|459|0|733|0|{Sort_for_Dedup|}233|275|}
{2010212001|XXGvertex_oport_oport|460|0|735|0|{0|out|}275|276|}
{2010213001|XXGoport_dst_flow|461|0|737|0|{0|}276|244|}
{2010211001|XXGvertex_iport_iport|462|0|738|0|{0|in|}275|277|}
{2010214001|XXGiport_src_flow|463|0|740|0|{0|}277|245|}
{2010006001|XXGobject_psameas_object|464|0|741|0|{Layout|Layout|0|0|}275|110|}
{2010006001|XXGobject_psameas_object|465|0|742|0|{in_metadata|write_metadata|0|0|}275|110|}
{2010006001|XXGobject_psameas_object|466|0|743|0|{out_metadata|write_metadata|0|0|}275|110|}
{2010601001|XXGgraph_vertex_vertex|467|0|744|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}233|278|}
{2010212001|XXGvertex_oport_oport|468|0|746|0|{0|out|}278|279|}
{2010213001|XXGoport_dst_flow|469|0|748|0|{0|}279|248|}
{2010211001|XXGvertex_iport_iport|470|0|749|0|{0|in|}278|280|}
{2010214001|XXGiport_src_flow|471|0|751|0|{0|}280|247|}
{2010006001|XXGobject_psameas_object|472|0|752|0|{Layout|Layout|0|0|}278|110|}
{2010006001|XXGobject_psameas_object|473|0|753|0|{in_metadata|write_metadata|0|0|}278|110|}
{2010006001|XXGobject_psameas_object|474|0|754|0|{out_metadata|write_metadata|0|0|}278|110|}
{2010601001|XXGgraph_vertex_vertex|475|0|755|0|{Testing|}233|281|}
{2010605001|XXGgraph_legend_legend|476|0|757|0|{0|}281|282|}
{2010241001|XXGlegend_face_face|477|0|759|0|{}282|283|}
{2010604001|XXGgraph_flow_flow|478|0|761|0|{Flow_1|}281|284|}
{2010604001|XXGgraph_flow_flow|479|0|763|0|{Flow_8|}281|285|}
{2010601001|XXGgraph_vertex_vertex|480|0|765|0|{Create|}281|286|}
{2010212001|XXGvertex_oport_oport|481|0|767|0|{0|out|}286|287|}
{2010213001|XXGoport_dst_flow|482|0|769|0|{0|}287|285|}
{2010212001|XXGvertex_oport_oport|483|0|770|0|{1|error|}286|288|}
{2010212001|XXGvertex_oport_oport|484|0|772|0|{2|log|}286|289|}
{2010601001|XXGgraph_vertex_vertex|485|0|774|0|{Dups|}281|290|}
{2010211001|XXGvertex_iport_iport|486|0|776|0|{0|write|}290|291|}
{2010601001|XXGgraph_vertex_vertex|487|0|778|0|{Merge|}281|292|}
{2010212001|XXGvertex_oport_oport|488|0|780|0|{0|out|}292|293|}
{2010213001|XXGoport_dst_flow|489|0|782|0|{0|}293|284|}
{2010211001|XXGvertex_iport_iport|490|0|783|0|{0|in|}292|294|}
{2010601001|XXGgraph_vertex_vertex|491|0|785|0|{Partition_by_Round_robin|}281|295|}
{2010212001|XXGvertex_oport_oport|492|0|787|0|{0|out|}295|296|}
{2010211001|XXGvertex_iport_iport|493|0|789|0|{0|in|}295|297|}
{2010214001|XXGiport_src_flow|494|0|791|0|{0|}297|285|}
{2010006001|XXGobject_psameas_object|495|0|792|0|{in_metadata|out_metadata|0|0|}295|286|}
{2010006001|XXGobject_psameas_object|496|0|793|0|{out_metadata|out_metadata|0|0|}295|286|}
{2010601001|XXGgraph_vertex_vertex|497|0|794|0|{stdout|}281|298|}
{2010211001|XXGvertex_iport_iport|498|0|796|0|{0|write|}298|299|}
{2010214001|XXGiport_src_flow|499|0|798|0|{0|}299|284|}
{2010212001|XXGvertex_oport_oport|500|0|799|0|{0|out|}281|300|}
{2010216002|XXGoport_binding_oport|501|0|801|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}300|296|}
{2010211001|XXGvertex_iport_iport|502|0|802|0|{0|in0|}281|301|}
{2010215002|XXGiport_binding_iport|503|0|804|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}301|294|}
{2010211001|XXGvertex_iport_iport|504|0|805|0|{1|in1|}281|302|}
{2010215002|XXGiport_binding_iport|505|0|807|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}302|291|}
{2010212001|XXGvertex_oport_oport|506|0|808|0|{0|out|}233|303|}
{2010216002|XXGoport_binding_oport|507|0|810|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6836|}303|261|}
{2010213001|XXGoport_dst_flow|508|0|811|0|{0|}303|223|}
{2010213001|XXGoport_dst_flow|509|0|812|0|{1|}303|225|}
{2010212001|XXGvertex_oport_oport|510|0|813|0|{1|dups|}233|304|}
{2010216002|XXGoport_binding_oport|511|0|815|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6837|}304|252|}
{2010213001|XXGoport_dst_flow|512|0|816|0|{0|}304|112|}
{2010211001|XXGvertex_iport_iport|513|0|817|0|{0|in|}233|305|}
{2010215002|XXGiport_binding_iport|514|0|819|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6835|}305|259|}
{2010214001|XXGiport_src_flow|515|0|820|0|{0|}305|93|}
{2010006001|XXGobject_psameas_object|516|0|821|0|{INPUT_DML|write_metadata|0|0|}233|110|}
{2010601001|XXGgraph_vertex_vertex|517|0|822|0|{Dups|}214|110|}
{2010601001|XXGgraph_vertex_vertex|518|0|823|0|{Gather|}214|306|}
{2010212001|XXGvertex_oport_oport|519|0|825|0|{0|out|}306|307|}
{2010213001|XXGoport_dst_flow|520|0|827|0|{0|}307|226|}
{2010211001|XXGvertex_iport_iport|521|0|828|0|{0|in|}306|308|}
{2010214001|XXGiport_src_flow|522|0|830|0|{0|}308|225|}
{2010006001|XXGobject_psameas_object|523|0|831|0|{in_metadata|write_metadata|0|0|}306|125|}
{2010006001|XXGobject_psameas_object|524|0|832|0|{out_metadata|write_metadata|0|0|}306|125|}
{2010601001|XXGgraph_vertex_vertex|525|0|833|0|{Gather_|}214|309|}
{2010212001|XXGvertex_oport_oport|526|0|835|0|{0|out|}309|310|}
{2010211001|XXGvertex_iport_iport|527|0|837|0|{0|in|}309|311|}
{2010214001|XXGiport_src_flow|528|0|839|0|{0|}311|224|}
{2010214001|XXGiport_src_flow|529|0|840|0|{1|}311|226|}
{2010006001|XXGobject_psameas_object|530|0|841|0|{Layout|Layout|0|0|}309|125|}
{2010006001|XXGobject_psameas_object|531|0|842|0|{in_metadata|write_metadata|0|0|}309|125|}
{2010006001|XXGobject_psameas_object|532|0|843|0|{out_metadata|write_metadata|0|0|}309|125|}
{2010601001|XXGgraph_vertex_vertex|533|0|844|0|{Map_to_Output|}214|87|}
{2010601001|XXGgraph_vertex_vertex|534|0|845|0|{Merge|}214|312|}
{2010212001|XXGvertex_oport_oport|535|0|847|0|{0|out|}312|313|}
{2010213001|XXGoport_dst_flow|536|0|849|0|{0|}313|224|}
{2010211001|XXGvertex_iport_iport|537|0|850|0|{0|in|}312|314|}
{2010214001|XXGiport_src_flow|538|0|852|0|{0|}314|223|}
{2010006001|XXGobject_psameas_object|539|0|853|0|{in_metadata|write_metadata|0|0|}312|125|}
{2010006001|XXGobject_psameas_object|540|0|854|0|{out_metadata|write_metadata|0|0|}312|125|}
{2010212001|XXGvertex_oport_oport|541|0|855|0|{0|source|}214|315|}
{2010216002|XXGoport_binding_oport|542|0|857|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9963|}315|228|}
{2010213001|XXGoport_dst_flow|543|0|858|0|{0|}315|14|}
{2010212001|XXGvertex_oport_oport|544|0|859|0|{1|clean|}214|316|}
{2010216002|XXGoport_binding_oport|545|0|861|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9964|}316|231|}
{2010213001|XXGoport_dst_flow|546|0|862|0|{0|}316|15|}
{2010212001|XXGvertex_oport_oport|547|0|863|0|{2|lookup|}214|317|}
{2010216002|XXGoport_binding_oport|548|0|865|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9965|}317|310|}
{2010213001|XXGoport_dst_flow|549|0|866|0|{0|}317|20|}
{2010211001|XXGvertex_iport_iport|550|0|867|0|{0|in0|}214|318|}
{2010215002|XXGiport_binding_iport|551|0|869|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9962|}318|101|}
{2010214001|XXGiport_src_flow|552|0|870|0|{0|}318|16|}
{2010007001|XXGobject_proto_object|553|0|871|0|{}214|319|}
{2010605001|XXGgraph_legend_legend|554|0|873|0|{0|}319|320|}
{2010241001|XXGlegend_face_face|555|0|875|0|{}320|321|}
{2010605001|XXGgraph_legend_legend|556|0|877|0|{1|}319|322|}
{2010241001|XXGlegend_face_face|557|0|879|0|{}322|323|}
{2010605001|XXGgraph_legend_legend|558|0|881|0|{2|}319|324|}
{2010241001|XXGlegend_face_face|559|0|883|0|{}324|325|}
{2010605001|XXGgraph_legend_legend|560|0|885|0|{3|}319|326|}
{2010241001|XXGlegend_face_face|561|0|887|0|{}326|327|}
{2010604001|XXGgraph_flow_flow|562|0|889|0|{Flow_1|}319|328|}
{2010604001|XXGgraph_flow_flow|563|0|891|0|{Flow_2|}319|329|}
{2010604001|XXGgraph_flow_flow|564|0|893|0|{Flow_3|}319|330|}
{2010604001|XXGgraph_flow_flow|565|0|895|0|{Flow_4|}319|331|}
{2010604001|XXGgraph_flow_flow|566|0|897|0|{Flow_5|}319|332|}
{2010604001|XXGgraph_flow_flow|567|0|899|0|{Flow_6|}319|333|}
{2010604001|XXGgraph_flow_flow|568|0|901|0|{Flow_7|}319|334|}
{2010604001|XXGgraph_flow_flow|569|0|903|0|{Flow_8|}319|335|}
{2010601001|XXGgraph_vertex_vertex|570|0|905|0|{Copy_Out|}319|336|}
{2010212001|XXGvertex_oport_oport|571|0|907|0|{0|out|}336|337|}
{2010211001|XXGvertex_iport_iport|572|0|909|0|{0|in|}336|338|}
{2010214001|XXGiport_src_flow|573|0|911|0|{0|}338|334|}
{2010007001|XXGobject_proto_object|574|0|912|0|{}336|339|}
{2010212001|XXGvertex_oport_oport|575|0|914|0|{0|out|}339|340|}
{2010006001|XXGobject_psameas_object|576|0|916|0|{metadata|out_metadata|1|0|}340|339|}
{2010211001|XXGvertex_iport_iport|577|0|917|0|{0|in|}339|341|}
{2010006001|XXGobject_psameas_object|578|0|919|0|{metadata|in_metadata|1|0|}341|339|}
{2010601001|XXGgraph_vertex_vertex|579|0|920|0|{Copy_Out_|}319|342|}
{2010212001|XXGvertex_oport_oport|580|0|922|0|{0|out|}342|343|}
{2010211001|XXGvertex_iport_iport|581|0|924|0|{0|in|}342|344|}
{2010214001|XXGiport_src_flow|582|0|926|0|{0|}344|329|}
{2010007001|XXGobject_proto_object|583|0|927|0|{}342|345|}
{2010212001|XXGvertex_oport_oport|584|0|929|0|{0|out|}345|346|}
{2010006001|XXGobject_psameas_object|585|0|931|0|{metadata|out_metadata|1|0|}346|345|}
{2010211001|XXGvertex_iport_iport|586|0|932|0|{0|in|}345|347|}
{2010006001|XXGobject_psameas_object|587|0|934|0|{metadata|in_metadata|1|0|}347|345|}
{2010601001|XXGgraph_vertex_vertex|588|0|935|0|{Dedup_and_Fix_Intervals|}319|348|}
{2010605001|XXGgraph_legend_legend|589|0|937|0|{0|}348|349|}
{2010241001|XXGlegend_face_face|590|0|939|0|{}349|350|}
{2010605001|XXGgraph_legend_legend|591|0|941|0|{1|}348|351|}
{2010241001|XXGlegend_face_face|592|0|943|0|{}351|352|}
{2010605001|XXGgraph_legend_legend|593|0|945|0|{2|}348|353|}
{2010241001|XXGlegend_face_face|594|0|947|0|{}353|354|}
{2010605001|XXGgraph_legend_legend|595|0|949|0|{3|}348|355|}
{2010241001|XXGlegend_face_face|596|0|951|0|{}355|356|}
{2010605001|XXGgraph_legend_legend|597|0|953|0|{4|}348|357|}
{2010241001|XXGlegend_face_face|598|0|955|0|{}357|358|}
{2010604001|XXGgraph_flow_flow|599|0|957|0|{Flow_1|}348|359|}
{2010604001|XXGgraph_flow_flow|600|0|959|0|{Flow_2|}348|360|}
{2010604001|XXGgraph_flow_flow|601|0|961|0|{Flow_3|}348|361|}
{2010604001|XXGgraph_flow_flow|602|0|963|0|{Flow_4|}348|362|}
{2010604001|XXGgraph_flow_flow|603|0|965|0|{Flow_6|}348|363|}
{2010604001|XXGgraph_flow_flow|604|0|967|0|{Flow_7|}348|364|}
{2010601001|XXGgraph_vertex_vertex|605|0|969|0|{Dedup_by_NK_Eff_Date|}348|365|}
{2010212001|XXGvertex_oport_oport|606|0|971|0|{0|out|}365|366|}
{2010213001|XXGoport_dst_flow|607|0|973|0|{0|}366|361|}
{2010212001|XXGvertex_oport_oport|608|0|974|0|{1|dup|}365|367|}
{2010212001|XXGvertex_oport_oport|609|0|976|0|{2|reject|}365|368|}
{2010212001|XXGvertex_oport_oport|610|0|978|0|{3|error|}365|369|}
{2010212001|XXGvertex_oport_oport|611|0|980|0|{4|log|}365|370|}
{2010211001|XXGvertex_iport_iport|612|0|982|0|{0|in|}365|371|}
{2010214001|XXGiport_src_flow|613|0|984|0|{0|}371|359|}
{2010601001|XXGgraph_vertex_vertex|614|0|985|0|{Parition_by_Related_or_NK|}348|372|}
{2010212001|XXGvertex_oport_oport|615|0|987|0|{0|out|}372|373|}
{2010213001|XXGoport_dst_flow|616|0|989|0|{0|}373|360|}
{2010211001|XXGvertex_iport_iport|617|0|990|0|{0|in|}372|374|}
{2010601001|XXGgraph_vertex_vertex|618|0|992|0|{Replicate|}348|375|}
{2010212001|XXGvertex_oport_oport|619|0|994|0|{0|out|}375|376|}
{2010211001|XXGvertex_iport_iport|620|0|996|0|{0|in|}375|377|}
{2010214001|XXGiport_src_flow|621|0|998|0|{0|}377|364|}
{2010601001|XXGgraph_vertex_vertex|622|0|999|0|{Rollup_Adjoining_Eff_Dates|}348|378|}
{2010212001|XXGvertex_oport_oport|623|0|1001|0|{0|out|}378|379|}
{2010213001|XXGoport_dst_flow|624|0|1003|0|{0|}379|364|}
{2010212001|XXGvertex_oport_oport|625|0|1004|0|{1|reject|}378|380|}
{2010212001|XXGvertex_oport_oport|626|0|1006|0|{2|error|}378|381|}
{2010212001|XXGvertex_oport_oport|627|0|1008|0|{3|log|}378|382|}
{2010211001|XXGvertex_iport_iport|628|0|1010|0|{0|in|}378|383|}
{2010214001|XXGiport_src_flow|629|0|1012|0|{0|}383|363|}
{2010601001|XXGgraph_vertex_vertex|630|0|1013|0|{Scan_to_Fix_Overlapping_Dates|}348|384|}
{2010212001|XXGvertex_oport_oport|631|0|1015|0|{0|out|}384|385|}
{2010213001|XXGoport_dst_flow|632|0|1017|0|{0|}385|362|}
{2010212001|XXGvertex_oport_oport|633|0|1018|0|{1|reject|}384|386|}
{2010212001|XXGvertex_oport_oport|634|0|1020|0|{2|error|}384|387|}
{2010212001|XXGvertex_oport_oport|635|0|1022|0|{3|log|}384|388|}
{2010211001|XXGvertex_iport_iport|636|0|1024|0|{0|in|}384|389|}
{2010214001|XXGiport_src_flow|637|0|1026|0|{0|}389|361|}
{2010601001|XXGgraph_vertex_vertex|638|0|1027|0|{Sort_for_Dedup|}348|390|}
{2010212001|XXGvertex_oport_oport|639|0|1029|0|{0|out|}390|391|}
{2010213001|XXGoport_dst_flow|640|0|1031|0|{0|}391|359|}
{2010211001|XXGvertex_iport_iport|641|0|1032|0|{0|in|}390|392|}
{2010214001|XXGiport_src_flow|642|0|1034|0|{0|}392|360|}
{2010601001|XXGgraph_vertex_vertex|643|0|1035|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}348|393|}
{2010212001|XXGvertex_oport_oport|644|0|1037|0|{0|out|}393|394|}
{2010213001|XXGoport_dst_flow|645|0|1039|0|{0|}394|363|}
{2010211001|XXGvertex_iport_iport|646|0|1040|0|{0|in|}393|395|}
{2010214001|XXGiport_src_flow|647|0|1042|0|{0|}395|362|}
{2010601001|XXGgraph_vertex_vertex|648|0|1043|0|{Testing|}348|396|}
{2010605001|XXGgraph_legend_legend|649|0|1045|0|{0|}396|397|}
{2010241001|XXGlegend_face_face|650|0|1047|0|{}397|398|}
{2010604001|XXGgraph_flow_flow|651|0|1049|0|{Flow_1|}396|399|}
{2010604001|XXGgraph_flow_flow|652|0|1051|0|{Flow_8|}396|400|}
{2010601001|XXGgraph_vertex_vertex|653|0|1053|0|{Create|}396|401|}
{2010212001|XXGvertex_oport_oport|654|0|1055|0|{0|out|}401|402|}
{2010213001|XXGoport_dst_flow|655|0|1057|0|{0|}402|400|}
{2010212001|XXGvertex_oport_oport|656|0|1058|0|{1|error|}401|403|}
{2010212001|XXGvertex_oport_oport|657|0|1060|0|{2|log|}401|404|}
{2010601001|XXGgraph_vertex_vertex|658|0|1062|0|{Dups|}396|405|}
{2010211001|XXGvertex_iport_iport|659|0|1064|0|{0|write|}405|406|}
{2010601001|XXGgraph_vertex_vertex|660|0|1066|0|{Merge|}396|407|}
{2010212001|XXGvertex_oport_oport|661|0|1068|0|{0|out|}407|408|}
{2010213001|XXGoport_dst_flow|662|0|1070|0|{0|}408|399|}
{2010211001|XXGvertex_iport_iport|663|0|1071|0|{0|in|}407|409|}
{2010601001|XXGgraph_vertex_vertex|664|0|1073|0|{Partition_by_Round_robin|}396|410|}
{2010212001|XXGvertex_oport_oport|665|0|1075|0|{0|out|}410|411|}
{2010211001|XXGvertex_iport_iport|666|0|1077|0|{0|in|}410|412|}
{2010214001|XXGiport_src_flow|667|0|1079|0|{0|}412|400|}
{2010601001|XXGgraph_vertex_vertex|668|0|1080|0|{stdout|}396|413|}
{2010211001|XXGvertex_iport_iport|669|0|1082|0|{0|write|}413|414|}
{2010214001|XXGiport_src_flow|670|0|1084|0|{0|}414|399|}
{2010212001|XXGvertex_oport_oport|671|0|1085|0|{0|out|}396|415|}
{2010216002|XXGoport_binding_oport|672|0|1087|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}415|411|}
{2010211001|XXGvertex_iport_iport|673|0|1088|0|{0|in0|}396|416|}
{2010215002|XXGiport_binding_iport|674|0|1090|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}416|409|}
{2010211001|XXGvertex_iport_iport|675|0|1091|0|{1|in1|}396|417|}
{2010215002|XXGiport_binding_iport|676|0|1093|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}417|406|}
{2010212001|XXGvertex_oport_oport|677|0|1094|0|{0|out|}348|418|}
{2010216002|XXGoport_binding_oport|678|0|1096|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}418|376|}
{2010213001|XXGoport_dst_flow|679|0|1097|0|{0|}418|330|}
{2010213001|XXGoport_dst_flow|680|0|1098|0|{1|}418|333|}
{2010212001|XXGvertex_oport_oport|681|0|1099|0|{1|dups|}348|419|}
{2010216002|XXGoport_binding_oport|682|0|1101|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}419|367|}
{2010213001|XXGoport_dst_flow|683|0|1102|0|{0|}419|331|}
{2010211001|XXGvertex_iport_iport|684|0|1103|0|{0|in|}348|420|}
{2010215002|XXGiport_binding_iport|685|0|1105|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}420|374|}
{2010214001|XXGiport_src_flow|686|0|1106|0|{0|}420|328|}
{2010007001|XXGobject_proto_object|687|0|1107|0|{}348|421|}
{2010605001|XXGgraph_legend_legend|688|0|1109|0|{0|}421|422|}
{2010241001|XXGlegend_face_face|689|0|1111|0|{}422|423|}
{2010605001|XXGgraph_legend_legend|690|0|1113|0|{1|}421|424|}
{2010241001|XXGlegend_face_face|691|0|1115|0|{}424|425|}
{2010605001|XXGgraph_legend_legend|692|0|1117|0|{2|}421|426|}
{2010241001|XXGlegend_face_face|693|0|1119|0|{}426|427|}
{2010605001|XXGgraph_legend_legend|694|0|1121|0|{3|}421|428|}
{2010241001|XXGlegend_face_face|695|0|1123|0|{}428|429|}
{2010605001|XXGgraph_legend_legend|696|0|1125|0|{4|}421|430|}
{2010241001|XXGlegend_face_face|697|0|1127|0|{}430|431|}
{2010604001|XXGgraph_flow_flow|698|0|1129|0|{Flow_1|}421|432|}
{2010604001|XXGgraph_flow_flow|699|0|1131|0|{Flow_2|}421|433|}
{2010604001|XXGgraph_flow_flow|700|0|1133|0|{Flow_3|}421|434|}
{2010604001|XXGgraph_flow_flow|701|0|1135|0|{Flow_4|}421|435|}
{2010604001|XXGgraph_flow_flow|702|0|1137|0|{Flow_6|}421|436|}
{2010604001|XXGgraph_flow_flow|703|0|1139|0|{Flow_7|}421|437|}
{2010601001|XXGgraph_vertex_vertex|704|0|1141|0|{Dedup_by_NK_Eff_Date|}421|438|}
{2010212001|XXGvertex_oport_oport|705|0|1143|0|{0|out|}438|439|}
{2010213001|XXGoport_dst_flow|706|0|1145|0|{0|}439|434|}
{2010212001|XXGvertex_oport_oport|707|0|1146|0|{1|dup|}438|440|}
{2010212001|XXGvertex_oport_oport|708|0|1148|0|{2|reject|}438|441|}
{2010212001|XXGvertex_oport_oport|709|0|1150|0|{3|error|}438|442|}
{2010212001|XXGvertex_oport_oport|710|0|1152|0|{4|log|}438|443|}
{2010211001|XXGvertex_iport_iport|711|0|1154|0|{0|in|}438|444|}
{2010214001|XXGiport_src_flow|712|0|1156|0|{0|}444|432|}
{2010007001|XXGobject_proto_object|713|0|1157|0|{}438|445|}
{2010212001|XXGvertex_oport_oport|714|0|1159|0|{0|out|}445|446|}
{2010006001|XXGobject_psameas_object|715|0|1161|0|{metadata|out_metadata|1|0|}446|445|}
{2010212001|XXGvertex_oport_oport|716|0|1162|0|{1|dup|}445|447|}
{2010006001|XXGobject_psameas_object|717|0|1164|0|{metadata|dup_metadata|1|0|}447|445|}
{2010212001|XXGvertex_oport_oport|718|0|1165|0|{2|reject|}445|448|}
{2010006001|XXGobject_psameas_object|719|0|1167|0|{metadata|reject_metadata|1|0|}448|445|}
{2010212001|XXGvertex_oport_oport|720|0|1168|0|{3|error|}445|449|}
{2010006001|XXGobject_psameas_object|721|0|1170|0|{metadata|error_metadata|1|0|}449|445|}
{2010212001|XXGvertex_oport_oport|722|0|1171|0|{4|log|}445|450|}
{2010006001|XXGobject_psameas_object|723|0|1173|0|{metadata|log_metadata|1|0|}450|445|}
{2010211001|XXGvertex_iport_iport|724|0|1174|0|{0|in|}445|451|}
{2010006001|XXGobject_psameas_object|725|0|1176|0|{metadata|in_metadata|1|0|}451|445|}
{2010601001|XXGgraph_vertex_vertex|726|0|1177|0|{Parition_by_Related_or_NK|}421|452|}
{2010212001|XXGvertex_oport_oport|727|0|1179|0|{0|out|}452|453|}
{2010213001|XXGoport_dst_flow|728|0|1181|0|{0|}453|433|}
{2010211001|XXGvertex_iport_iport|729|0|1182|0|{0|in|}452|454|}
{2010007001|XXGobject_proto_object|730|0|1184|0|{}452|455|}
{2010212001|XXGvertex_oport_oport|731|0|1186|0|{0|out|}455|456|}
{2010006001|XXGobject_psameas_object|732|0|1188|0|{metadata|out_metadata|1|0|}456|455|}
{2010211001|XXGvertex_iport_iport|733|0|1189|0|{0|in|}455|457|}
{2010006001|XXGobject_psameas_object|734|0|1191|0|{metadata|in_metadata|1|0|}457|455|}
{2010006001|XXGobject_psameas_object|735|0|1192|0|{in_metadata|INPUT_DML|1|0|}452|421|}
{2010601001|XXGgraph_vertex_vertex|736|0|1193|0|{Replicate|}421|458|}
{2010212001|XXGvertex_oport_oport|737|0|1195|0|{0|out|}458|459|}
{2010211001|XXGvertex_iport_iport|738|0|1197|0|{0|in|}458|460|}
{2010214001|XXGiport_src_flow|739|0|1199|0|{0|}460|437|}
{2010007001|XXGobject_proto_object|740|0|1200|0|{}458|461|}
{2010212001|XXGvertex_oport_oport|741|0|1202|0|{0|out|}461|462|}
{2010006001|XXGobject_psameas_object|742|0|1204|0|{metadata|out_metadata|1|0|}462|461|}
{2010211001|XXGvertex_iport_iport|743|0|1205|0|{0|in|}461|463|}
{2010006001|XXGobject_psameas_object|744|0|1207|0|{metadata|in_metadata|1|0|}463|461|}
{2010601001|XXGgraph_vertex_vertex|745|0|1208|0|{Rollup_Adjoining_Eff_Dates|}421|464|}
{2010212001|XXGvertex_oport_oport|746|0|1210|0|{0|out|}464|465|}
{2010213001|XXGoport_dst_flow|747|0|1212|0|{0|}465|437|}
{2010212001|XXGvertex_oport_oport|748|0|1213|0|{1|reject|}464|466|}
{2010212001|XXGvertex_oport_oport|749|0|1215|0|{2|error|}464|467|}
{2010212001|XXGvertex_oport_oport|750|0|1217|0|{3|log|}464|468|}
{2010211001|XXGvertex_iport_iport|751|0|1219|0|{0|in|}464|469|}
{2010214001|XXGiport_src_flow|752|0|1221|0|{0|}469|436|}
{2010007001|XXGobject_proto_object|753|0|1222|0|{}464|470|}
{2010212001|XXGvertex_oport_oport|754|0|1224|0|{0|out|}470|471|}
{2010006001|XXGobject_psameas_object|755|0|1226|0|{metadata|out_metadata|1|0|}471|470|}
{2010212001|XXGvertex_oport_oport|756|0|1227|0|{1|reject|}470|472|}
{2010006001|XXGobject_psameas_object|757|0|1229|0|{metadata|reject_metadata|1|0|}472|470|}
{2010212001|XXGvertex_oport_oport|758|0|1230|0|{2|error|}470|473|}
{2010006001|XXGobject_psameas_object|759|0|1232|0|{metadata|error_metadata|1|0|}473|470|}
{2010212001|XXGvertex_oport_oport|760|0|1233|0|{3|log|}470|474|}
{2010006001|XXGobject_psameas_object|761|0|1235|0|{metadata|log_metadata|1|0|}474|470|}
{2010211001|XXGvertex_iport_iport|762|0|1236|0|{0|in|}470|475|}
{2010006001|XXGobject_psameas_object|763|0|1238|0|{metadata|in_metadata|1|0|}475|470|}
{2010601001|XXGgraph_vertex_vertex|764|0|1239|0|{Scan_to_Fix_Overlapping_Dates|}421|476|}
{2010212001|XXGvertex_oport_oport|765|0|1241|0|{0|out|}476|477|}
{2010213001|XXGoport_dst_flow|766|0|1243|0|{0|}477|435|}
{2010212001|XXGvertex_oport_oport|767|0|1244|0|{1|reject|}476|478|}
{2010212001|XXGvertex_oport_oport|768|0|1246|0|{2|error|}476|479|}
{2010212001|XXGvertex_oport_oport|769|0|1248|0|{3|log|}476|480|}
{2010211001|XXGvertex_iport_iport|770|0|1250|0|{0|in|}476|481|}
{2010214001|XXGiport_src_flow|771|0|1252|0|{0|}481|434|}
{2010007001|XXGobject_proto_object|772|0|1253|0|{}476|482|}
{2010212001|XXGvertex_oport_oport|773|0|1255|0|{0|out|}482|483|}
{2010006001|XXGobject_psameas_object|774|0|1257|0|{metadata|out_metadata|1|0|}483|482|}
{2010212001|XXGvertex_oport_oport|775|0|1258|0|{1|reject|}482|484|}
{2010006001|XXGobject_psameas_object|776|0|1260|0|{metadata|reject_metadata|1|0|}484|482|}
{2010212001|XXGvertex_oport_oport|777|0|1261|0|{2|error|}482|485|}
{2010006001|XXGobject_psameas_object|778|0|1263|0|{metadata|error_metadata|1|0|}485|482|}
{2010212001|XXGvertex_oport_oport|779|0|1264|0|{3|log|}482|486|}
{2010006001|XXGobject_psameas_object|780|0|1266|0|{metadata|log_metadata|1|0|}486|482|}
{2010211001|XXGvertex_iport_iport|781|0|1267|0|{0|in|}482|487|}
{2010006001|XXGobject_psameas_object|782|0|1269|0|{metadata|in_metadata|1|0|}487|482|}
{2010601001|XXGgraph_vertex_vertex|783|0|1270|0|{Sort_for_Dedup|}421|488|}
{2010212001|XXGvertex_oport_oport|784|0|1272|0|{0|out|}488|489|}
{2010213001|XXGoport_dst_flow|785|0|1274|0|{0|}489|432|}
{2010211001|XXGvertex_iport_iport|786|0|1275|0|{0|in|}488|490|}
{2010214001|XXGiport_src_flow|787|0|1277|0|{0|}490|433|}
{2010007001|XXGobject_proto_object|788|0|1278|0|{}488|491|}
{2010212001|XXGvertex_oport_oport|789|0|1280|0|{0|out|}491|492|}
{2010006001|XXGobject_psameas_object|790|0|1282|0|{metadata|out_metadata|1|0|}492|491|}
{2010211001|XXGvertex_iport_iport|791|0|1283|0|{0|in|}491|493|}
{2010006001|XXGobject_psameas_object|792|0|1285|0|{metadata|in_metadata|1|0|}493|491|}
{2010601001|XXGgraph_vertex_vertex|793|0|1286|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}421|494|}
{2010212001|XXGvertex_oport_oport|794|0|1288|0|{0|out|}494|495|}
{2010213001|XXGoport_dst_flow|795|0|1290|0|{0|}495|436|}
{2010211001|XXGvertex_iport_iport|796|0|1291|0|{0|in|}494|496|}
{2010214001|XXGiport_src_flow|797|0|1293|0|{0|}496|435|}
{2010007001|XXGobject_proto_object|798|0|1294|0|{}494|497|}
{2010212001|XXGvertex_oport_oport|799|0|1296|0|{0|out|}497|498|}
{2010006001|XXGobject_psameas_object|800|0|1298|0|{metadata|out_metadata|1|0|}498|497|}
{2010211001|XXGvertex_iport_iport|801|0|1299|0|{0|in|}497|499|}
{2010006001|XXGobject_psameas_object|802|0|1301|0|{metadata|in_metadata|1|0|}499|497|}
{2010601001|XXGgraph_vertex_vertex|803|0|1302|0|{Testing|}421|500|}
{2010605001|XXGgraph_legend_legend|804|0|1304|0|{0|}500|501|}
{2010241001|XXGlegend_face_face|805|0|1306|0|{}501|502|}
{2010604001|XXGgraph_flow_flow|806|0|1308|0|{Flow_1|}500|503|}
{2010604001|XXGgraph_flow_flow|807|0|1310|0|{Flow_8|}500|504|}
{2010601001|XXGgraph_vertex_vertex|808|0|1312|0|{Create|}500|505|}
{2010212001|XXGvertex_oport_oport|809|0|1314|0|{0|out|}505|506|}
{2010213001|XXGoport_dst_flow|810|0|1316|0|{0|}506|504|}
{2010212001|XXGvertex_oport_oport|811|0|1317|0|{1|error|}505|507|}
{2010212001|XXGvertex_oport_oport|812|0|1319|0|{2|log|}505|508|}
{2010007001|XXGobject_proto_object|813|0|1321|0|{}505|509|}
{2010212001|XXGvertex_oport_oport|814|0|1323|0|{0|out|}509|510|}
{2010006001|XXGobject_psameas_object|815|0|1325|0|{metadata|out_metadata|1|0|}510|509|}
{2010212001|XXGvertex_oport_oport|816|0|1326|0|{1|error|}509|511|}
{2010006001|XXGobject_psameas_object|817|0|1328|0|{metadata|error_metadata|1|0|}511|509|}
{2010212001|XXGvertex_oport_oport|818|0|1329|0|{2|log|}509|512|}
{2010006001|XXGobject_psameas_object|819|0|1331|0|{metadata|log_metadata|1|0|}512|509|}
{2010601001|XXGgraph_vertex_vertex|820|0|1332|0|{Dups|}500|513|}
{2010211001|XXGvertex_iport_iport|821|0|1334|0|{0|write|}513|514|}
{2010007001|XXGobject_proto_object|822|0|1336|0|{}513|515|}
{2010211001|XXGvertex_iport_iport|823|0|1338|0|{0|write|}515|516|}
{2010006001|XXGobject_psameas_object|824|0|1340|0|{metadata|write_metadata|1|0|}516|515|}
{2010601001|XXGgraph_vertex_vertex|825|0|1341|0|{Merge|}500|517|}
{2010212001|XXGvertex_oport_oport|826|0|1343|0|{0|out|}517|518|}
{2010213001|XXGoport_dst_flow|827|0|1345|0|{0|}518|503|}
{2010211001|XXGvertex_iport_iport|828|0|1346|0|{0|in|}517|519|}
{2010007001|XXGobject_proto_object|829|0|1348|0|{}517|520|}
{2010212001|XXGvertex_oport_oport|830|0|1350|0|{0|out|}520|521|}
{2010006001|XXGobject_psameas_object|831|0|1352|0|{metadata|out_metadata|1|0|}521|520|}
{2010211001|XXGvertex_iport_iport|832|0|1353|0|{0|in|}520|522|}
{2010006001|XXGobject_psameas_object|833|0|1355|0|{metadata|in_metadata|1|0|}522|520|}
{2010601001|XXGgraph_vertex_vertex|834|0|1356|0|{Partition_by_Round_robin|}500|523|}
{2010212001|XXGvertex_oport_oport|835|0|1358|0|{0|out|}523|524|}
{2010211001|XXGvertex_iport_iport|836|0|1360|0|{0|in|}523|525|}
{2010214001|XXGiport_src_flow|837|0|1362|0|{0|}525|504|}
{2010007001|XXGobject_proto_object|838|0|1363|0|{}523|526|}
{2010212001|XXGvertex_oport_oport|839|0|1365|0|{0|out|}526|527|}
{2010006001|XXGobject_psameas_object|840|0|1367|0|{metadata|out_metadata|1|0|}527|526|}
{2010211001|XXGvertex_iport_iport|841|0|1368|0|{0|in|}526|528|}
{2010006001|XXGobject_psameas_object|842|0|1370|0|{metadata|in_metadata|1|0|}528|526|}
{2010601001|XXGgraph_vertex_vertex|843|0|1371|0|{stdout|}500|529|}
{2010211001|XXGvertex_iport_iport|844|0|1373|0|{0|write|}529|530|}
{2010214001|XXGiport_src_flow|845|0|1375|0|{0|}530|503|}
{2010007001|XXGobject_proto_object|846|0|1376|0|{}529|531|}
{2010211001|XXGvertex_iport_iport|847|0|1378|0|{0|write|}531|532|}
{2010006001|XXGobject_psameas_object|848|0|1380|0|{metadata|write_metadata|1|0|}532|531|}
{2010212001|XXGvertex_oport_oport|849|0|1381|0|{0|out|}500|533|}
{2010216002|XXGoport_binding_oport|850|0|1383|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}533|524|}
{2010211001|XXGvertex_iport_iport|851|0|1384|0|{0|in0|}500|534|}
{2010215002|XXGiport_binding_iport|852|0|1386|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}534|519|}
{2010211001|XXGvertex_iport_iport|853|0|1387|0|{1|in1|}500|535|}
{2010215002|XXGiport_binding_iport|854|0|1389|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}535|514|}
{2010212001|XXGvertex_oport_oport|855|0|1390|0|{0|out|}421|536|}
{2010216002|XXGoport_binding_oport|856|0|1392|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}536|459|}
{2010212001|XXGvertex_oport_oport|857|0|1393|0|{1|dups|}421|537|}
{2010216002|XXGoport_binding_oport|858|0|1395|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}537|440|}
{2010211001|XXGvertex_iport_iport|859|0|1396|0|{0|in|}421|538|}
{2010215002|XXGiport_binding_iport|860|0|1398|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}538|454|}
{2010006001|XXGobject_psameas_object|861|0|1399|0|{INPUT_DML|write_metadata|0|0|}348|539|}
{2010211001|XXGvertex_iport_iport|862|0|1401|0|{0|write|}539|540|}
{2010214001|XXGiport_src_flow|863|0|1403|0|{0|}540|331|}
{2010007001|XXGobject_proto_object|864|0|1404|0|{}539|541|}
{2010211001|XXGvertex_iport_iport|865|0|1406|0|{0|write|}541|542|}
{2010006001|XXGobject_psameas_object|866|0|1408|0|{metadata|write_metadata|1|0|}542|541|}
{2010601001|XXGgraph_vertex_vertex|867|0|1409|0|{Dups|}319|539|}
{2010601001|XXGgraph_vertex_vertex|868|0|1410|0|{Gather|}319|543|}
{2010212001|XXGvertex_oport_oport|869|0|1412|0|{0|out|}543|544|}
{2010213001|XXGoport_dst_flow|870|0|1414|0|{0|}544|335|}
{2010211001|XXGvertex_iport_iport|871|0|1415|0|{0|in|}543|545|}
{2010214001|XXGiport_src_flow|872|0|1417|0|{0|}545|333|}
{2010007001|XXGobject_proto_object|873|0|1418|0|{}543|546|}
{2010212001|XXGvertex_oport_oport|874|0|1420|0|{0|out|}546|547|}
{2010006001|XXGobject_psameas_object|875|0|1422|0|{metadata|out_metadata|1|0|}547|546|}
{2010211001|XXGvertex_iport_iport|876|0|1423|0|{0|in|}546|548|}
{2010006001|XXGobject_psameas_object|877|0|1425|0|{metadata|in_metadata|1|0|}548|546|}
{2010601001|XXGgraph_vertex_vertex|878|0|1426|0|{Gather_|}319|549|}
{2010212001|XXGvertex_oport_oport|879|0|1428|0|{0|out|}549|550|}
{2010211001|XXGvertex_iport_iport|880|0|1430|0|{0|in|}549|551|}
{2010214001|XXGiport_src_flow|881|0|1432|0|{0|}551|332|}
{2010214001|XXGiport_src_flow|882|0|1433|0|{1|}551|335|}
{2010007001|XXGobject_proto_object|883|0|1434|0|{}549|552|}
{2010212001|XXGvertex_oport_oport|884|0|1436|0|{0|out|}552|553|}
{2010006001|XXGobject_psameas_object|885|0|1438|0|{metadata|out_metadata|1|0|}553|552|}
{2010211001|XXGvertex_iport_iport|886|0|1439|0|{0|in|}552|554|}
{2010006001|XXGobject_psameas_object|887|0|1441|0|{metadata|in_metadata|1|0|}554|552|}
{2010601001|XXGgraph_vertex_vertex|888|0|1442|0|{Map_to_Output|}319|555|}
{2010212001|XXGvertex_oport_oport|889|0|1444|0|{0|source|}555|556|}
{2010213001|XXGoport_dst_flow|890|0|1446|0|{0|}556|334|}
{2010212001|XXGvertex_oport_oport|891|0|1447|0|{1|clean|}555|557|}
{2010213001|XXGoport_dst_flow|892|0|1449|0|{0|}557|329|}
{2010212001|XXGvertex_oport_oport|893|0|1450|0|{2|lkp|}555|558|}
{2010213001|XXGoport_dst_flow|894|0|1452|0|{0|}558|328|}
{2010212001|XXGvertex_oport_oport|895|0|1453|0|{3|reject0|}555|559|}
{2010212001|XXGvertex_oport_oport|896|0|1455|0|{4|reject1|}555|560|}
{2010212001|XXGvertex_oport_oport|897|0|1457|0|{5|reject2|}555|561|}
{2010212001|XXGvertex_oport_oport|898|0|1459|0|{6|error0|}555|562|}
{2010212001|XXGvertex_oport_oport|899|0|1461|0|{7|error1|}555|563|}
{2010212001|XXGvertex_oport_oport|900|0|1463|0|{8|error2|}555|564|}
{2010212001|XXGvertex_oport_oport|901|0|1465|0|{9|log|}555|565|}
{2010211001|XXGvertex_iport_iport|902|0|1467|0|{0|in|}555|566|}
{2010007001|XXGobject_proto_object|903|0|1469|0|{}555|567|}
{2010212001|XXGvertex_oport_oport|904|0|1471|0|{0|source|}567|568|}
{2010006001|XXGobject_psameas_object|905|0|1473|0|{metadata|out0_metadata|1|0|}568|567|}
{2010006001|XXGobject_psameas_object|906|0|1474|0|{transform0|transform0|1|0|}568|567|}
{2010212001|XXGvertex_oport_oport|907|0|1475|0|{1|clean|}567|569|}
{2010006001|XXGobject_psameas_object|908|0|1477|0|{metadata|out1_metadata|1|0|}569|567|}
{2010006001|XXGobject_psameas_object|909|0|1478|0|{transform1|transform1|1|0|}569|567|}
{2010212001|XXGvertex_oport_oport|910|0|1479|0|{2|lkp|}567|570|}
{2010006001|XXGobject_psameas_object|911|0|1481|0|{metadata|out2_metadata|1|0|}570|567|}
{2010006001|XXGobject_psameas_object|912|0|1482|0|{transform2|transform2|1|0|}570|567|}
{2010212001|XXGvertex_oport_oport|913|0|1483|0|{3|reject0|}567|571|}
{2010006001|XXGobject_psameas_object|914|0|1485|0|{metadata|reject0_metadata|1|0|}571|567|}
{2010212001|XXGvertex_oport_oport|915|0|1486|0|{4|reject1|}567|572|}
{2010006001|XXGobject_psameas_object|916|0|1488|0|{metadata|reject1_metadata|1|0|}572|567|}
{2010212001|XXGvertex_oport_oport|917|0|1489|0|{5|reject2|}567|573|}
{2010006001|XXGobject_psameas_object|918|0|1491|0|{metadata|reject2_metadata|1|0|}573|567|}
{2010212001|XXGvertex_oport_oport|919|0|1492|0|{6|error0|}567|574|}
{2010006001|XXGobject_psameas_object|920|0|1494|0|{metadata|error0_metadata|1|0|}574|567|}
{2010212001|XXGvertex_oport_oport|921|0|1495|0|{7|error1|}567|575|}
{2010006001|XXGobject_psameas_object|922|0|1497|0|{metadata|error1_metadata|1|0|}575|567|}
{2010212001|XXGvertex_oport_oport|923|0|1498|0|{8|error2|}567|576|}
{2010006001|XXGobject_psameas_object|924|0|1500|0|{metadata|error2_metadata|1|0|}576|567|}
{2010212001|XXGvertex_oport_oport|925|0|1501|0|{9|log|}567|577|}
{2010006001|XXGobject_psameas_object|926|0|1503|0|{metadata|log_metadata|1|0|}577|567|}
{2010211001|XXGvertex_iport_iport|927|0|1504|0|{0|in|}567|578|}
{2010006001|XXGobject_psameas_object|928|0|1506|0|{metadata|in_metadata|1|0|}578|567|}
{2010601001|XXGgraph_vertex_vertex|929|0|1507|0|{Merge|}319|579|}
{2010212001|XXGvertex_oport_oport|930|0|1509|0|{0|out|}579|580|}
{2010213001|XXGoport_dst_flow|931|0|1511|0|{0|}580|332|}
{2010211001|XXGvertex_iport_iport|932|0|1512|0|{0|in|}579|581|}
{2010214001|XXGiport_src_flow|933|0|1514|0|{0|}581|330|}
{2010007001|XXGobject_proto_object|934|0|1515|0|{}579|582|}
{2010212001|XXGvertex_oport_oport|935|0|1517|0|{0|out|}582|583|}
{2010006001|XXGobject_psameas_object|936|0|1519|0|{metadata|out_metadata|1|0|}583|582|}
{2010211001|XXGvertex_iport_iport|937|0|1520|0|{0|in|}582|584|}
{2010006001|XXGobject_psameas_object|938|0|1522|0|{metadata|in_metadata|1|0|}584|582|}
{2010212001|XXGvertex_oport_oport|939|0|1523|0|{0|source|}319|585|}
{2010216002|XXGoport_binding_oport|940|0|1525|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9906|}585|337|}
{2010212001|XXGvertex_oport_oport|941|0|1526|0|{1|clean|}319|586|}
{2010216002|XXGoport_binding_oport|942|0|1528|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9907|}586|343|}
{2010212001|XXGvertex_oport_oport|943|0|1529|0|{2|lookup|}319|587|}
{2010216002|XXGoport_binding_oport|944|0|1531|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9908|}587|550|}
{2010211001|XXGvertex_iport_iport|945|0|1532|0|{0|in0|}319|588|}
{2010215002|XXGiport_binding_iport|946|0|1534|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9905|}588|566|}
{2010601001|XXGgraph_vertex_vertex|947|0|1535|0|{RFMT_Optional_transform|}1|589|}
{2010212001|XXGvertex_oport_oport|948|0|1537|0|{0|out0|}589|590|}
{2010213001|XXGoport_dst_flow|949|0|1539|0|{0|}590|21|}
{2010212001|XXGvertex_oport_oport|950|0|1540|0|{1|reject0|}589|591|}
{2010212001|XXGvertex_oport_oport|951|0|1542|0|{2|error0|}589|592|}
{2010212001|XXGvertex_oport_oport|952|0|1544|0|{3|log|}589|593|}
{2010211001|XXGvertex_iport_iport|953|0|1546|0|{0|in|}589|594|}
{2010214001|XXGiport_src_flow|954|0|1548|0|{0|}594|13|}
{2010007001|XXGobject_proto_object|955|0|1549|0|{}589|595|}
{2010212001|XXGvertex_oport_oport|956|0|1551|0|{0|out0|}595|596|}
{2010006001|XXGobject_psameas_object|957|0|1553|0|{metadata|out0_metadata|1|0|}596|595|}
{2010006001|XXGobject_psameas_object|958|0|1554|0|{transform0|transform0|1|0|}596|595|}
{2010212001|XXGvertex_oport_oport|959|0|1555|0|{1|reject0|}595|597|}
{2010006001|XXGobject_psameas_object|960|0|1557|0|{metadata|reject0_metadata|1|0|}597|595|}
{2010212001|XXGvertex_oport_oport|961|0|1558|0|{2|error0|}595|598|}
{2010006001|XXGobject_psameas_object|962|0|1560|0|{metadata|error0_metadata|1|0|}598|595|}
{2010212001|XXGvertex_oport_oport|963|0|1561|0|{3|log|}595|599|}
{2010006001|XXGobject_psameas_object|964|0|1563|0|{metadata|log_metadata|1|0|}599|595|}
{2010211001|XXGvertex_iport_iport|965|0|1564|0|{0|in|}595|600|}
{2010006001|XXGobject_psameas_object|966|0|1566|0|{metadata|in_metadata|1|0|}600|595|}
{2010006001|XXGobject_psameas_object|967|0|1567|0|{Layout|Layout|0|0|}589|87|}
{2010006001|XXGobject_psameas_object|968|0|1568|0|{in_metadata|out_metadata|0|0|}589|113|}
{2010006001|XXGobject_psameas_object|969|0|1569|0|{out0_metadata|out_metadata|0|0|}589|113|}
{2010006001|XXGobject_psameas_object|970|0|1570|0|{reject0_metadata|out_metadata|0|0|}589|113|}
{2010006001|XXGobject_psameas_object|971|0|1571|0|{transform0|TRANSFORM_XFR|1|0|}589|1|}
{2010601001|XXGgraph_vertex_vertex|972|0|1572|0|{Read_IDS_Files|}1|51|}
{2010601001|XXGgraph_vertex_vertex|973|0|1573|0|{Rollup_Job_Info|}1|601|}
{2010212001|XXGvertex_oport_oport|974|0|1575|0|{0|out|}601|602|}
{2010213001|XXGoport_dst_flow|975|0|1577|0|{0|}602|9|}
{2010212001|XXGvertex_oport_oport|976|0|1578|0|{1|reject|}601|603|}
{2010212001|XXGvertex_oport_oport|977|0|1580|0|{2|error|}601|604|}
{2010212001|XXGvertex_oport_oport|978|0|1582|0|{3|log|}601|605|}
{2010211001|XXGvertex_iport_iport|979|0|1584|0|{0|in|}601|606|}
{2010214001|XXGiport_src_flow|980|0|1586|0|{0|}606|8|}
{2010007001|XXGobject_proto_object|981|0|1587|0|{}601|607|}
{2010212001|XXGvertex_oport_oport|982|0|1589|0|{0|out|}607|608|}
{2010006001|XXGobject_psameas_object|983|0|1591|0|{metadata|out_metadata|1|0|}608|607|}
{2010212001|XXGvertex_oport_oport|984|0|1592|0|{1|reject|}607|609|}
{2010006001|XXGobject_psameas_object|985|0|1594|0|{metadata|reject_metadata|1|0|}609|607|}
{2010212001|XXGvertex_oport_oport|986|0|1595|0|{2|error|}607|610|}
{2010006001|XXGobject_psameas_object|987|0|1597|0|{metadata|error_metadata|1|0|}610|607|}
{2010212001|XXGvertex_oport_oport|988|0|1598|0|{3|log|}607|611|}
{2010006001|XXGobject_psameas_object|989|0|1600|0|{metadata|log_metadata|1|0|}611|607|}
{2010211001|XXGvertex_iport_iport|990|0|1601|0|{0|in|}607|612|}
{2010006001|XXGobject_psameas_object|991|0|1603|0|{metadata|in_metadata|1|0|}612|607|}
{2010006001|XXGobject_psameas_object|992|0|1604|0|{Layout|Layout|0|0|}601|71|}
{2010006001|XXGobject_psameas_object|993|0|1605|0|{in_metadata|log_metadata|0|0|}601|75|}
{2010006001|XXGobject_psameas_object|994|0|1606|0|{out_metadata|write_metadata|0|0|}601|71|}
{2010006001|XXGobject_psameas_object|995|0|1607|0|{reject_metadata|log_metadata|0|0|}601|75|}
{2010601001|XXGgraph_vertex_vertex|996|0|1608|0|{Scan|}1|113|}
{2010601001|XXGgraph_vertex_vertex|997|0|1609|0|{Trash|}1|613|}
{2010211001|XXGvertex_iport_iport|998|0|1611|0|{0|in|}613|614|}
{2010214001|XXGiport_src_flow|999|0|1613|0|{0|}614|17|}
{2010007001|XXGobject_proto_object|1000|0|1614|0|{}613|615|}
{2010211001|XXGvertex_iport_iport|1001|0|1616|0|{0|in|}615|616|}
{2010006001|XXGobject_psameas_object|1002|0|1618|0|{metadata|in_metadata|1|0|}616|615|}
{2010006001|XXGobject_psameas_object|1003|0|1619|0|{Layout|Layout|0|0|}613|67|}
{2010006001|XXGobject_psameas_object|1004|0|1620|0|{in_metadata|read_metadata|0|0|}613|67|}
{2010601001|XXGgraph_vertex_vertex|1005|0|1621|0|{Write_DMLs|}1|617|}
{2010604001|XXGgraph_flow_flow|1006|0|1623|0|{Flow_10|}617|618|}
{2010601001|XXGgraph_vertex_vertex|1007|0|1625|0|{Create_Data|}617|619|}
{2010212001|XXGvertex_oport_oport|1008|0|1627|0|{0|out|}619|620|}
{2010213001|XXGoport_dst_flow|1009|0|1629|0|{0|}620|618|}
{2010212001|XXGvertex_oport_oport|1010|0|1630|0|{1|error|}619|621|}
{2010212001|XXGvertex_oport_oport|1011|0|1632|0|{2|log|}619|622|}
{2010007001|XXGobject_proto_object|1012|0|1634|0|{}619|623|}
{2010212001|XXGvertex_oport_oport|1013|0|1636|0|{0|out|}623|624|}
{2010006001|XXGobject_psameas_object|1014|0|1638|0|{metadata|out_metadata|1|0|}624|623|}
{2010212001|XXGvertex_oport_oport|1015|0|1639|0|{1|error|}623|625|}
{2010006001|XXGobject_psameas_object|1016|0|1641|0|{metadata|error_metadata|1|0|}625|623|}
{2010212001|XXGvertex_oport_oport|1017|0|1642|0|{2|log|}623|626|}
{2010006001|XXGobject_psameas_object|1018|0|1644|0|{metadata|log_metadata|1|0|}626|623|}
{2010006001|XXGobject_psameas_object|1019|0|1645|0|{Layout|Layout|0|0|}619|627|}
{2010212001|XXGvertex_oport_oport|1020|0|1647|0|{0|reject|}627|628|}
{2010212001|XXGvertex_oport_oport|1021|0|1649|0|{1|error|}627|629|}
{2010212001|XXGvertex_oport_oport|1022|0|1651|0|{2|log|}627|630|}
{2010211001|XXGvertex_iport_iport|1023|0|1653|0|{0|in|}627|631|}
{2010214001|XXGiport_src_flow|1024|0|1655|0|{0|}631|618|}
{2010007001|XXGobject_proto_object|1025|0|1656|0|{}627|632|}
{2010212001|XXGvertex_oport_oport|1026|0|1658|0|{0|reject|}632|633|}
{2010006001|XXGobject_psameas_object|1027|0|1660|0|{metadata|reject_metadata|1|0|}633|632|}
{2010212001|XXGvertex_oport_oport|1028|0|1661|0|{1|error|}632|634|}
{2010006001|XXGobject_psameas_object|1029|0|1663|0|{metadata|error_metadata|1|0|}634|632|}
{2010212001|XXGvertex_oport_oport|1030|0|1664|0|{2|log|}632|635|}
{2010006001|XXGobject_psameas_object|1031|0|1666|0|{metadata|log_metadata|1|0|}635|632|}
{2010211001|XXGvertex_iport_iport|1032|0|1667|0|{0|in|}632|636|}
{2010006001|XXGobject_psameas_object|1033|0|1669|0|{metadata|in_metadata|1|0|}636|632|}
{2010006001|XXGobject_psameas_object|1034|0|1670|0|{reject_metadata|in_metadata|0|0|}627|627|}
{2010006001|XXGobject_psameas_object|1035|0|1671|0|{out_metadata|in_metadata|0|0|}619|627|}
{2010601001|XXGgraph_vertex_vertex|1036|0|1672|0|{Write_Sandbox_Files|}617|627|}
{2010109001|XXGobject_property_value|1037|0|1673|0|{0|TrackingThumbprint|72|}1|637|}
