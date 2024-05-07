@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|595|rel_count|938|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|JOB_START_TIME|$[ (datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|RFK|YYYY-MM-DD HH24:MI:SS: The time when this job started.  Defaults to the partition start time, but for consistency across partitions, this should be provided by the calling plan.|{0|}}
{30001002|XXparameter|START_CHANGES_TIME||3|9|FK|Optional: YYYY-MM-DD HH24:MI:SS: The time to use to start selecting new or updated records or records changing effectiveness.  Defaults to "", which means include all dates.|{0|}}
{30001002|XXparameter|END_CHANGES_TIME|$[ (string(""))(datetime("YYYY-MM-DD HH24:MI:SS"))now() ]|3|9|FK|YYYY-MM-DD HH24:MI:SS: The time to use to stop selecting new or updated records or records changing effectiveness.  Defaults to now.|{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_LOGICAL_NAME|//setup your project detail in the intermediate pset|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|sample*.csv|3|9|RFK|@{0|}}
{30001002|XXparameter|INPUT_FILE_PATH|$AI_SERIAL_PENDING|3|9|RFK|@{0|}}
{30001002|XXparameter|FILE_LIST|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|TARGET_NAME|\{SYSTEM\}.\{SOURCE\}|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_downcase(TARGET_NAME) ]|3|9|RFK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[string_split_no_empty(TARGET_LOWER,".")[0]]|3|9|FK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
{30001002|XXparameter|TARGET_SOURCE|$[string_split_no_empty(TARGET_LOWER,".")[1]]|3|9|FK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.|{0|}}
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
{30001002|XXparameter|FILTER_EXPR||3|9|FK|@{0|}}
{30001002|XXparameter|RFMT_TRANSFORM||3|9|FK|@{0|}}
{30001002|XXparameter|READ_DB_NORMALIZE_XFR_FILE|$PUB_DXF_XFR/dxf_process_log.get.xml.xfr|3|9|FK|@{0|}}
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
{30001002|XXparameter|!ab_compatibility|3.5.4.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|FILE_LIST:eme|$[AI_SERIAL_PENDING + "/test.csv"]|3|9||@{0|}}
{30001002|XXparameter|FILE_LIST:sandbox|$[directory_listing(INPUT_FILE_PATH, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:eme|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|SOURCE_FILE_URL:sandbox|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + TARGET_SYSTEM + "/source." + TARGET_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:eme|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_LOWER + "." + "\{RUN_ID\}" + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|CLEAN_FILE_URL:sandbox|$[ if ( not DO_CLEAN ) "" else "mfile:" + AI_MFS + "/clean." + TARGET_SYSTEM + "/clean." + TARGET_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|DO_HEX_CLEANUP|1|15|9|FK||{2|0|1|}}
{30001002|XXparameter|CLEANSE_CHARECTERS||3|9|FK||{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|get.xml|Manav Jindal|Created 1/31/2017 9:27:28 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1372000|706000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{1|0|}Job 'get.xml' Execution Status Report

Job completed successfully at Monday, February 19, 2018 04:57:02
Run performed by user manav.jindal
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
{2010242002|XXGface|4|0|7|0|{@{}@Arial|128|160|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@[ Optional Custom Filter Cond ]|563000|112000|0|0|0|0|14160|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@[ Optional Custom Transform ]|773000|127000|0|0|0|0|14161|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@[Compressed Files.]|279000|487750|0|0|0|0|2955|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@[Uncompressed Files.]|24000|472750|0|0|0|0|2950|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@[ Assign values for DXF header fields ]|488000|377000|0|0|0|0|14162|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@TARGET_NAME - $TARGET_NAME  |713000|43000|0|0|0|0|12050|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|128|160|0|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}12059|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}14202|19|}}
{2010210004|XXGflow|19|0|37|0|{@{}@384|.5|.5|{0|}14219|2065|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}14217|17|}}
{2010210004|XXGflow|21|0|41|0|{@{}@384|.5|.5|{0|}14199|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}2956|2065|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}14214|18|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}6971|2065|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}12081|17|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}14210|17|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.04210526496171951|.5|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}14207|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}14174|17|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}14212|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}14200|17|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}14215|2065|}}
{2010501005|XXGpvertex|32|0|63|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
}}@0|Reformat|971000|151000|0|0|0|0|12026|Apply Cleanse|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|33|0|65|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|34|0|68|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|35|0|70|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|36|0|72|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|37|0|74|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|38|0|77|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|39|0|79|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|40|0|83|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|41|0|86|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|42|0|89|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|43|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|44|0|95|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Create Data|17000|166000|0|0|0|0|12027|List files|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|45|0|97|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|46|0|100|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|47|0|102|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|48|0|104|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|49|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|50|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|51|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|52|0|115|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/XML/XML_Split.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|rej0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$[  GET_DML ]|3|9||@{0|}}
{30001002|XXparameter|vector_length_prefix_type0|"big endian integer(4)"|3|1|l|@{0|}}
{30001002|XXparameter|character_set0|utf-8|3|1|l|@{0|}}
{30001002|XXparameter|selected_items0|True /UHG-PBM-CS-PriorAuth-Work-PA /UHG-PBM-CS-PriorAuth-Work-PA//* /UHG-PBM-CS-PriorAuth-Work-PA//\@* /UHG-PBM-CS-PriorAuth-Work-PA//text()|3|1|l|@{0|}}
{30001002|XXparameter|source_files|/etl/devel/appconf.prior_auth/main/users/gkaur109/orca/prior_auth/meta/PACaseExtract_XML.xsd|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|err0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|XML Split|339000|150000|0|0|0|0|12083|XML Split|Ab Initio Software|Built-in 2.15.3:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|53|0|117|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|54|0|120|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|55|0|122|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|56|0|124|0|{@{}@0|0|0|0|rej0|0.0|count|rej|0|1168|0|}}
{2010203004|XXGoport|57|0|126|0|{@{}@0|0|0|0|err0|0.0|count|err|0|1168|0|}}
{2010203004|XXGoport|58|0|128|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|59|0|130|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|60|0|133|0|{Parses an XML document into a flow of records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|xml-split|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/xml-split|3|2|H$||{0|}}
{30001002|XXparameter|count|1|1|1|Fl|Number of output ports|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|xml_doc_field_name||3|2|FK$|Name of the field in the input record that contains the XML document to be parsed. Only required if the input is a record with multiple string fields.|{0|}}
{30001002|XXparameter|xml_doc_field_name.display_name|xml-doc-field-name|3|9|P|@{0|}}
{30001002|XXparameter|xml_doc_field_name.keyword|xml-doc-field-name|3|9|P|@{0|}}
{30001002|XXparameter|source_files||3|1|FHl|Exemplar (.xml) files or an XML schema (.xsd) specification. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|source_files.display_name|source-files|3|9|P|@{0|}}
{30001002|XXparameter|base_element0||3|1|FHl|Name of base element. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|base_element0.display_name|base-element0|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0||3|1|FHl|Items of interest. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|selected_items0.display_name|selected-items0|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index_name|selected-items|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0||3|1|FHl|If not empty, specifies the name of the package that you want to contain the generated record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|generate_package0.display_name|generate-package0|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index_name|generate-package|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0||3|1|FHl|For generated packages, specifies the name of the type of the generated record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|package_type_name0.display_name|package-type-name0|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index_name|package-type-name|3|9|P|@{0|}}
{30001002|XXparameter|character_set0||3|1|FHl|Specifies the character set for character data in the generated DML record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|character_set0.display_name|character-set0|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index_name|character-set|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0||3|1|FHl|Specifies the endianness of vector length types in the generated DML. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|vector_length_prefix_type0.display_name|vector-length-prefix-type0|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index_name|vector-length-prefix-type|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0||3|1|FHl|User interface state|{0|}}
{30001002|XXparameter|ui_state0.display_name|ui-state0|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index_name|ui-state|3|9|P|@{0|}}
{30001002|XXparameter|generate_ID_fields|True|13|1|FHl|Determines whether the -generate-id-fields argument will be used|{0|}}
{30001002|XXparameter|generate_ID_fields.display_name|generate-ID-fields|3|9|P|@{0|}}
{30001002|XXparameter|generate_ID_fields.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|ID_field_name||3|1|FHl|Optional user-defined field name for use with the -generate-id-fields argument|{0|}}
{30001002|XXparameter|ID_field_name.display_name|ID-field-name|3|9|P|@{0|}}
{30001002|XXparameter|parser|expat|15|1|FKl|XML Parser to use|{2|expat|xerces|}}
{30001002|XXparameter|validation|none|15|1|FKl|What level of XML Schema validation should be applied to the input documents.|{3|none|custom|strict|}}
{30001002|XXparameter|validation.condition|version 3.0.5.r20:|3|15|P?|@{0|}}
{30001002|XXparameter|validation.update_clauses|update_value custom|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces|True|13|1|FKl|Ignore namespaces except to disambiguate elements or attributes|{0|}}
{30001002|XXparameter|ignore_namespaces.display_name|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.keyword|ignore-namespaces|3|9|P|@{0|}}
{30001002|XXparameter|ignore_namespaces.condition|param validation custom version 2.16.0:|3|15|P?|@{0|}}
{30001002|XXparameter|unknown_attributes|ignore|15|1|FKl|What should be done if an unknown attribute appears in the input document.|{2|ignore|error|}}
{30001002|XXparameter|unknown_attributes.display_name|unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|unknown_attributes.keyword|unknown-attributes|3|9|P|@{0|}}
{30001002|XXparameter|unknown_attributes.condition|param validation custom version 3.0.4.r17:|3|15|P?|@{0|}}
{30001002|XXparameter|unknown_elements|ignore|15|1|FKl|What should be done if an unknown element appears in the input document.|{2|ignore|error|}}
{30001002|XXparameter|unknown_elements.display_name|unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|unknown_elements.keyword|unknown-elements|3|9|P|@{0|}}
{30001002|XXparameter|unknown_elements.condition|param validation custom version 3.0.4.r17:|3|15|P?|@{0|}}
{30001002|XXparameter|missing_fields|ignore|15|1|FKl|What should be done if an element or attribute is missing in the input document.|{2|ignore|error|}}
{30001002|XXparameter|missing_fields.display_name|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.keyword|missing-fields|3|9|P|@{0|}}
{30001002|XXparameter|missing_fields.condition|param validation custom|3|15|P?|@{0|}}
{30001002|XXparameter|cardinality_constraints|ignore|15|1|FKl|What should be done if the minOccurs/maxOccurs constraints on an element are violated.|{2|ignore|error|}}
{30001002|XXparameter|cardinality_constraints.display_name|cardinality-constraints|3|9|P|@{0|}}
{30001002|XXparameter|cardinality_constraints.keyword|cardinality-constraints|3|9|P|@{0|}}
{30001002|XXparameter|cardinality_constraints.condition|param validation custom version 3.0.5.r20:|3|15|P?|@{0|}}
{30001002|XXparameter|check_is_valid|False|13|1|FKl|Call the is_valid function on the output record|{0|}}
{30001002|XXparameter|check_is_valid.display_name|check-is-valid|3|9|P|@{0|}}
{30001002|XXparameter|check_is_valid.keyword|check-is-valid|3|9|P|@{0|}}
{30001002|XXparameter|check_is_valid.condition|param validation custom version 3.1.0.r3:|3|15|P?|@{0|}}
{30001002|XXparameter|reset_sequence_numbers|checkpoint|15|1|FKl|Event that causes sequence numbers present in the output record to be reset to 1|{3|record|computepoint|checkpoint|}}
{30001002|XXparameter|reset_sequence_numbers.display_name|reset-sequence-numbers|3|9|P|@{0|}}
{30001002|XXparameter|reset_sequence_numbers.keyword|reset-sequence-numbers|3|9|P|@{0|}}
{30001002|XXparameter|reset_sequence_numbers.condition|version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|reset_sequence_numbers.update_clauses|update_value record|3|9|P|@{0|}}
{30001002|XXparameter|vector_based_subkeys|True|13|1|FKl|If true, sequence numbers for vectors will equal one plus the vector index.  If false, vector sequence numbers will be a running element count.|{0|}}
{30001002|XXparameter|vector_based_subkeys.display_name|vector-based-subkeys|3|9|P|@{0|}}
{30001002|XXparameter|vector_based_subkeys.keyword|vector-based-subkeys|3|9|P|@{0|}}
{30001002|XXparameter|vector_based_subkeys.condition|version 3.0.4.r17:|3|15|P?|@{0|}}
{30001002|XXparameter|vector_based_subkeys.update_clauses|update_value False|3|9|P|@{0|}}
{30001002|XXparameter|always_stream_input|False|13|1|FKl|Always read the input document as a character stream to minimize memory usage. The component normally does this automatically. The cases in which it doesn't are when the reject port is connected, when the component is folded or when the input record contains fields after the xml document. If you set this parameter to true, rejects will not be sent to the reject port, the component will be prevented from folding and if there are fields after the xml document, they will be empty in the output record.|{0|}}
{30001002|XXparameter|always_stream_input.display_name|always-stream-input|3|9|P|@{0|}}
{30001002|XXparameter|always_stream_input.keyword|always-stream-input|3|9|P|@{0|}}
{30001002|XXparameter|always_stream_input.condition|version 2.16.1.r8:|3|15|P?|@{0|}}
{30001002|XXparameter|normalization_strategy|Full|15|1|Fl|Controls the condition for generating output records.  If set to 'Base elements only', output records are generated only when a base element occurs, which means that there may be no records written.  If set to 'Full', output records are generated even when a base element does not occur (with fields corresponding to the missing element set to NULL), and there will always be at least one output record written.|{2|Full|Base elements only|}}
{30001002|XXparameter|normalization_strategy.display_name|normalization-strategy|3|9|P|@{0|}}
{30001002|XXparameter|normalization_strategy.condition|version 3.1.1.r6:|3|15|P?|@{0|}}
{30001002|XXparameter|normalization_strategy.update_clauses|update_value Baseelementsonly|3|9|P|@{0|}}
{30001002|XXparameter|normalize|value normalization-strategy Full full value normalization-strategy Base* base-elements-only default dollar_substitution full|3|13|Kv||{0|}}
{30001002|XXparameter|normalize.condition|version 3.1.1.r6:|3|15|P?|@{0|}}
{30001002|XXparameter|parse_error_package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|parse_error_package.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|package0||8|1|FOl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|package0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|package0.index_name|package|3|9|P|@{0|}}
{30001002|XXparameter|package0.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying a Handle Errors component to which errors can be directed.|{0|}}
{30001002|XXparameter|error_group.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|log_group.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_only_when_unanimous|False|13|1|FKl|If true, no reject records are generated if any output port successfully processes the entire document.|{0|}}
{30001002|XXparameter|reject_only_when_unanimous.display_name|reject-only-when-unanimous|3|9|P|@{0|}}
{30001002|XXparameter|reject_only_when_unanimous.keyword|reject-only-when-unanimous|3|9|P|@{0|}}
{30001002|XXparameter|reject_only_when_unanimous.condition|version 3.1.0.r5:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_only_when_unanimous.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold|Abort on first reject|15|1|Fl|When to abort if input records are rejected|{3|Abort on first reject|Never abort|Use limit/ramp|}}
{30001002|XXparameter|reject_threshold.display_name|reject-threshold|3|9|P|@{0|}}
{30001002|XXparameter|reject_threshold.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|limit|0|1|2|F$|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit.condition|param reject-threshold Use* version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp|0.0|2|2|F$|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp.condition|param reject-threshold Use* version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|limit_keyword|value reject-threshold Never* 0 value reject-threshold Abort* 0 sameas limit default dollar_substitution 0|1|13|Kv|Maximum rejected records before failure|{0|}}
{30001002|XXparameter|limit_keyword.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|ramp_keyword|value reject-threshold Never* -1 value reject-threshold Abort* 0.0 sameas ramp default dollar_substitution 0.0|2|13|Kv|Rate of rejected records|{0|}}
{30001002|XXparameter|ramp_keyword.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp|3|2|$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|logging.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|version 3.0.1.r10: param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|log_output||15|1|Fl|Frequency of output records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_output.condition|param logging True version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of reject records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True version 3.0.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|reject_port_version|2.11:|3|2|H$|Version that reject port became available|{0|}}
{30001002|XXparameter|reject_port_version.display_name|reject-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject=in; rej*=in|3|2|H$||{0|}}
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
{30001002|XXparameter|eme_dataset_mapping|@40|9|F|Location in which to create a dataset corresponding to this component.|{0|}}
{30001002|XXparameter|eme_dataset_metadata||7|1|Fl|DML to use for a dataset corresponding to this component.|{0|}}
{30001002|XXparameter|num_variables|1|1|2|H$|Number of data types in package|{0|}}
{30001002|XXparameter|variable1|optional input_type xread <parameter eme_dataset_metadata>|3|2|H$|Metadata for records from input XML files|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset_mapping(file)=xread,r|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type xread <parameter eme_dataset_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count out|3|1|l||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|rej0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|err0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject,error,rej[*],err[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375655|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: rej = in
metadata type: err = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|XML Split|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|61|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|vector_length_prefix_type0||3|8|FH=|Specifies the endianness of vector length types in the generated DML. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|vector_length_prefix_type0.display_name|vector-length-prefix-type0|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|vector_length_prefix_type0.index_name|vector-length-prefix-type|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0||3|8|FH=|For generated packages, specifies the name of the type of the generated record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|package_type_name0.display_name|package-type-name0|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|package_type_name0.index_name|package-type-name|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0||3|8|FH=|User interface state|{0|}}
{30001002|XXparameter|ui_state0.display_name|ui-state0|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|ui_state0.index_name|ui-state|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0||3|8|FH=|If not empty, specifies the name of the package that you want to contain the generated record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|generate_package0.display_name|generate-package0|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|generate_package0.index_name|generate-package|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0||3|8|FH=|Items of interest. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|selected_items0.display_name|selected-items0|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|selected_items0.index_name|selected-items|3|9|P|@{0|}}
{30001002|XXparameter|base_element0||3|8|FH=|Name of base element. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|base_element0.display_name|base-element0|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|base_element0.index_name|base-element|3|9|P|@{0|}}
{30001002|XXparameter|character_set0||3|8|FH=|Specifies the character set for character data in the generated DML record format. If you directly modify this parameter, you must run the Import XML dialog for the change to take effect.|{0|}}
{30001002|XXparameter|character_set0.display_name|character-set0|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|character_set0.index_name|character-set|3|9|P|@{0|}}
{30001002|XXparameter|package0||8|8|FO=|Package containing transforms and data types|{0|}}
{30001002|XXparameter|package0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|package0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|package0.index_name|package|3|9|P|@{0|}}
{30001002|XXparameter|package0.condition|version 3.0.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|62|0|146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|63|0|149|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|64|0|152|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|rej0|0.0|count|rej|0|1168|0|}}
{2010203004|XXGoport|65|0|155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|err0|0.0|count|err|0|1168|0|}}
{2010203004|XXGoport|66|0|158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|67|0|161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|68|0|165|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|/*extract filename from input record*/
filename::get_filename(in)=
begin
filename :: in.filename;
end;|3|3|c|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|string(1)|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Read Multiple Files|156000|146000|0|0|0|0|12061|Read Multiple Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|69|0|167|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|70|0|170|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|71|0|172|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|72|0|174|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|73|0|176|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|74|0|178|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|75|0|180|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|76|0|183|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|77|0|185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|78|0|188|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|79|0|191|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|80|0|194|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|81|0|197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|82|0|200|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|83|0|203|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|84|0|213|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Filter by Expression|781000|151000|0|0|0|0|14175|Filter records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|85|0|215|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|86|0|218|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|87|0|220|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|88|0|222|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|89|0|224|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|90|0|226|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|91|0|229|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|92|0|231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|93|0|234|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|94|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|95|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|96|0|243|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|97|0|246|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|98|0|254|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.csv.$TARGET_LOWER.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.csv.$TARGET_LOWER.job_log.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
}}@0|@953000|613500|872000|443000|56000|50000|14211|Get Job Log|Ab Initio Software||1|205|0||6||33025|-1|-1|}}
{2010202004|XXGiport|99|0|256|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|100|0|259|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|101|0|261|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|102|0|265|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE_URL.gz|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|@234000|576750|0|0|0|0|6972|MFS File|Ab Initio Software|@1|100|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|103|0|267|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|104|0|270|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|105|0|272|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|106|0|275|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$OUTPUT_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@54000|576750|0|0|0|0|2947|MFS File-1|Ab Initio Software|@1|205|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|107|0|277|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|108|0|279|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|109|0|281|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|110|0|285|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform|$READ_DB_NORMALIZE_XFR_FILE|3|9|fj|@{0|}}
{30001002|XXparameter|out_metadata|$[ OUTPUT_DML ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@517952|398880|683000|208000|145000|126000|14205|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|111|0|287|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|112|0|290|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|113|0|292|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|114|0|294|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|115|0|297|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|116|0|300|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|117|0|302|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|118|0|305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|119|0|308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|120|0|311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|121|0|314|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|122|0|320|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_CLEAN|3|9||@{0|}}
{30001002|XXparameter|Layout|$CLEAN_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CLEAN_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CLEAN_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1284913|430047|1153000|334000|56000|50000|14220|Optional: Clean|Ab Initio Software||1|8000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|123|0|322|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|124|0|325|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|125|0|327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|126|0|330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_LOOKUP|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@1280913|565047|1153000|434000|56000|50000|14166|Optional: Lookup|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|127|0|332|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|128|0|335|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|129|0|337|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|130|0|340|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$SOURCE_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|3\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\}|3|9|P|@{0|}}
}}@0|@1280913|320047|1153000|234000|56000|50000|14164|Optional: Source|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|131|0|342|0|{@{}@1143000|254000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|132|0|345|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|133|0|347|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|134|0|350|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Partition by Round-robin|811000|441000|0|0|0|0|14213|Partition by Round-robin|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|135|0|352|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|136|0|355|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|137|0|358|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|138|0|360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|139|0|363|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|140|0|369|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|transform0|include "/~$PUB_DXF_XFR/standardize.xfr";

/*Reformat operation*/
out::reformat(in)=
begin
  out.(*,form=="string" && name != "newline") :1: if($DO_HEX_CLEANUP && not is_blank($"CLEANSE_CHARECTERS")) re_replace(string_and_hex_replace(in.*), $"CLEANSE_CHARECTERS", "");
  out.(*,form=="string" && name != "newline") :2: if(not $DO_HEX_CLEANUP && not is_blank($"CLEANSE_CHARECTERS")) re_replace(in.*, $"CLEANSE_CHARECTERS", "");
  out.(*,form=="string" && name != "newline") :3: string_lrtrim(in.*);
  out.* :: in.*;
end;|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|548000|141000|0|0|0|0|14201|RFMT: Bugfix and Clean Hex Values|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|141|0|371|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|142|0|374|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|143|0|376|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|144|0|378|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|145|0|380|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|146|0|383|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|147|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|148|0|389|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|149|0|392|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|150|0|395|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|151|0|398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|152|0|406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Rollup|688000|595000|0|0|0|0|14209|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|153|0|408|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|154|0|411|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|155|0|413|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|156|0|415|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|157|0|417|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|158|0|420|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|159|0|422|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|160|0|425|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|161|0|428|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|162|0|431|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|163|0|434|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|164|0|441|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$OUTPUT_FILE_URL.gz|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata||3|8|=|@{0|}}
}}@0|@231000|403750|0|0|0|0|2957|Serial File|Ab Initio Software|@1|205|0||6||33089|-1|-1|}}
{2010203004|XXGoport|165|0|443|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|166|0|446|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|167|0|448|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|168|0|451|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$OUTPUT_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|mode|0x0001|3|2|$|@{0|}}
}}@0|@51000|398750|0|0|0|0|2977|Serial File-1|Ab Initio Software|@1|100|0||6||33089|-1|-1|}}
{2010203004|XXGoport|169|0|453|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|170|0|455|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|171|0|457|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|172|0|461|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|379000|395250|0|0|0|0|2951|Trash-2|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|173|0|463|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|174|0|466|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|175|0|468|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|176|0|473|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|394000|565250|0|0|0|0|2952|Trash-3|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|177|0|475|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|178|0|478|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|179|0|480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|180|0|485|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@89000|36000|0|0|0|0|14221|Version Log|Manav Jindal|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|853000|349000|3|}}
{2010240003|XXGlegend|181|0|487|0|{@{}@Date|92000|251000|0|0|0|0|1474|}}
{2010242002|XXGface|182|0|489|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|183|0|491|0|{@{}@Author|217000|251000|0|0|0|0|1473|}}
{2010242002|XXGface|184|0|493|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|185|0|495|0|{@{}@Description|417000|251000|0|0|0|0|1472|}}
{2010242002|XXGface|186|0|497|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|187|0|499|0|{@{}@Version|17000|251000|0|0|0|0|1470|}}
{2010242002|XXGface|188|0|501|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|189|0|503|0|{@{}@Initial version|412000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|190|0|505|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|191|0|507|0|{@{}@Sep 27 2016|82000|268000|0|0|0|0|1528|}}
{2010242002|XXGface|192|0|509|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|193|0|511|0|{@{}@1.0|17000|268000|0|0|0|0|1455|}}
{2010242002|XXGface|194|0|513|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|195|0|515|0|{@{}@Manav Jindal (Exusia)|187000|268000|0|0|0|0|1529|}}
{2010242002|XXGface|196|0|517|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|197|0|519|0|{@{}@Summary:

1. This graph reads the XML file from INPUT_FILE_PATH location mathing INPUT_FILE_PATTTERN.
2. This process creates SOURCE / CLEAN files in AI_MFS location and also applies compression based on option provided.
3. And creates LOOKUP files either in AI_SERIAL_LOOKUP or AI_MFS_LOOKUP location and also applies compression and partitions if key is provided.|15000|42500|0|0|0|0|1526|}}
{2010242002|XXGface|198|0|521|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|199|0|523|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|135000|0|0|0|0|1527|}}
{2010242002|XXGface|200|0|525|0|{@{}@Candara|0|100|0|}}
{2010600005|XXGgraph|201|0|528|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/prepare_output.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|DUP_FILE_URL|mfile:$AI_MFS_REJECT/$STEP.$TARGET_SYSTEM/$STEP.$TARGET_LOWER.dups.dat.gz|3|9||@{0|}}
}}@0|@970000|402500|0|0|892000|502000|14218|prepare output|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|891000|502000|1|}}
{2010240003|XXGlegend|202|0|530|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|203|0|532|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|204|0|534|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|205|0|536|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|206|0|538|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|207|0|540|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|208|0|542|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|209|0|544|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|210|0|546|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9909|17|}}
{2010210004|XXGflow|211|0|548|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|212|0|550|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9910|1043|}}
{2010210004|XXGflow|213|0|552|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9917|2065|}}
{2010210004|XXGflow|214|0|554|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|215|0|556|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9911|19|}}
{2010210004|XXGflow|216|0|558|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|217|0|560|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|218|0|562|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|219|0|564|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|220|0|566|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|221|0|572|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|222|0|574|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|223|0|576|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|224|0|582|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_DML||3|8|s=|@{0|}}
}}@0|@310336|269500|331000|292000|884000|534000|9912|Dedup and Fix Intervals|||1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}.17873303592205048|884000|533000|1|}}
{2010240003|XXGlegend|225|0|584|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|226|0|586|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|227|0|588|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|228|0|590|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|229|0|592|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|230|0|594|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|231|0|596|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|232|0|598|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|233|0|600|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|234|0|602|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|235|0|604|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|236|0|606|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|237|0|608|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|238|0|610|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|239|0|612|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|240|0|614|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|241|0|616|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|242|0|618|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|243|0|621|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|244|0|623|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|245|0|625|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|246|0|627|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|247|0|629|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|248|0|632|0|{|{}@0|@472000|414500|494000|435000|56000|50000|9918|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|249|0|634|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|250|0|641|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|251|0|643|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|252|0|646|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|253|0|648|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|out1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|254|0|650|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|255|0|653|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|256|0|656|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|257|0|659|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|258|0|661|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|259|0|663|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|260|0|665|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|261|0|667|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|262|0|669|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|263|0|671|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|264|0|673|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|265|0|683|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|266|0|685|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|267|0|687|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|268|0|693|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|269|0|695|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|270|0|698|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|271|0|700|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|272|0|702|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|273|0|704|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|274|0|711|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|275|0|713|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|276|0|716|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|277|0|718|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|278|0|720|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|279|0|722|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|280|0|729|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|281|0|731|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|282|0|734|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|283|0|740|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|284|0|742|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|285|0|745|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|286|0|751|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|287|0|753|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|288|0|755|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|289|0|757|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|290|0|759|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|291|0|761|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|292|0|763|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|293|0|766|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|294|0|768|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|295|0|770|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|296|0|772|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|297|0|774|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|298|0|776|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|299|0|779|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|300|0|781|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|301|0|783|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|302|0|785|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|303|0|790|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|304|0|792|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|305|0|795|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|306|0|798|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|307|0|801|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|308|0|804|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|309|0|809|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|310|0|813|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010501005|XXGpvertex|311|0|819|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|312|0|821|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|313|0|824|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|314|0|829|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|315|0|831|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|316|0|833|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|317|0|841|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|318|0|843|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|319|0|846|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|320|0|851|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|321|0|855|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|322|0|859|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|323|0|863|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|324|0|867|0|{Subgraph created from graph "clean.db_edw"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|LOOKUP_KEY|$LOOKUP_KEY|3|9|FK|\{key1; key2...\}: Optional: A key that can optionally end with either an interval field or a pair of interval bottom and top feilds.  All key fields must be present in the input DML.  If this is omitted, then you must explictly specify the other parameters.|{0|}}
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
{2010240003|XXGlegend|325|0|869|0|{@{}@Disabled if no lookup key|316000|250000|336000|270000|145000|16000|9843|}}
{2010242002|XXGface|326|0|871|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|327|0|873|0|{@{}@Always
Disabled|786000|395000|806000|415000|50000|32000|9896|}}
{2010242002|XXGface|328|0|875|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|329|0|877|0|{@{}@Disabled if no 
lookup key|621000|235000|641000|260000|82000|32000|9897|}}
{2010242002|XXGface|330|0|879|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|331|0|881|0|{@{}@Enabled if no 
lookup key|621000|445000|641000|465000|79000|32000|9875|}}
{2010242002|XXGface|332|0|883|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|333|0|885|0|{@{}@384|.5|0.0|{12|222000|259000|242000|259000|242000|259000|242000|339000|299000|339000|320000|339000|}9909|17|}}
{2010210004|XXGflow|334|0|887|0|{@{}@384|.5|.1120000034570694|{8|222000|229000|252000|229000|740000|229000|761000|229000|}9853|17|}}
{2010210004|XXGflow|335|0|889|0|{@{}@384|.5|.5|{8|499000|334000|529000|334000|624000|334000|645000|334000|}9910|1043|}}
{2010210004|XXGflow|336|0|891|0|{@{}@384|.5|.5|{10|409000|398000|409000|418000|409000|459000|462000|459000|483000|459000|}9913|2065|}}
{2010210004|XXGflow|337|0|893|0|{@{}@384|.5|1.0|{12|716000|334000|736000|334000|771000|334000|771000|379000|771000|379000|792000|379000|}9902|17|}}
{2010210004|XXGflow|338|0|895|0|{@{}@384|.5|.5|{12|499000|344000|519000|344000|569000|344000|569000|434000|620000|434000|641000|434000|}9911|19|}}
{2010210004|XXGflow|339|0|897|0|{@{}@384|.5|0.0|{12|222000|199000|242000|199000|242000|199000|242000|104000|745000|104000|766000|104000|}9852|17|}}
{2010210004|XXGflow|340|0|899|0|{@{}@384|.5|1.0|{12|712000|434000|732000|434000|771000|434000|771000|389000|771000|389000|792000|389000|}9903|17|}}
{2010501005|XXGpvertex|341|0|901|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@769000|75000|777000|84000|54000|41000|9858|Copy Out|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|342|0|903|0|{@{}@830000|99000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|343|0|905|0|{@{}@767000|99000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|344|0|908|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|345|0|910|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|346|0|913|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|347|0|916|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@764000|200000|772000|209000|54000|41000|9859|Copy Out.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|348|0|918|0|{@{}@825000|224000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|349|0|920|0|{@{}@762000|224000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|350|0|923|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|351|0|925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|352|0|928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|353|0|931|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/dedup_and_fix_intervals.mp|3|9|Pf|@{0|}}
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
{2010240003|XXGlegend|354|0|933|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|355|0|935|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|356|0|937|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|357|0|939|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|358|0|941|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|359|0|943|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|360|0|945|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|361|0|947|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|362|0|949|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|363|0|951|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|364|0|953|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|365|0|955|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|366|0|957|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|367|0|959|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|368|0|961|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|369|0|963|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|370|0|965|0|{|{}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|371|0|967|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|372|0|970|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|373|0|972|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|374|0|974|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|375|0|976|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|376|0|978|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|377|0|981|0|{|{}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|378|0|983|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|379|0|986|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|380|0|988|0|{|{}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|381|0|990|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|382|0|992|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|383|0|995|0|{|{}@0|@479000|385000|499000|405000|129000|107000|6791|Rollup Adjoining Eff Dates|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|384|0|997|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|385|0|1000|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|386|0|1002|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|387|0|1004|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|388|0|1006|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|389|0|1009|0|{|{}@0|@477000|176000|497000|196000|139000|107000|6788|Scan to Fix Overlapping Dates|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|390|0|1011|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|391|0|1014|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|392|0|1016|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|393|0|1018|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|394|0|1020|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|395|0|1023|0|{|{}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|396|0|1025|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|397|0|1028|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|398|0|1031|0|{|{}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|399|0|1033|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|400|0|1036|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|401|0|1039|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|402|0|1041|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|403|0|1043|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|404|0|1045|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|405|0|1047|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|406|0|1049|0|{|{}@0|@17000|56000|37000|76000|60000|60000|6764|Create|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|407|0|1051|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|408|0|1054|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|409|0|1056|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|410|0|1058|0|{|{}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|411|0|1060|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|412|0|1062|0|{|{}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|413|0|1064|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|414|0|1067|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|415|0|1069|0|{|{}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|416|0|1071|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|417|0|1073|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|418|0|1076|0|{|{}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|419|0|1078|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|420|0|1081|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|421|0|1084|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|422|0|1087|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|423|0|1090|0|{@{}@488000|329000|11000|21000|out|.5|@@@14352|0|}}
{2010203004|XXGoport|424|0|1095|0|{@{}@404000|387000|11000|11000|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|425|0|1099|0|{@{}@321000|334000|11000|11000|in|.5|@@@14096|0|}}
{2010600005|XXGgraph|426|0|1103|0|{Subgraph created from graph "kimbo"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
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
{2010240003|XXGlegend|427|0|1105|0|{@{}@When neighboring records have the 
same data values, we combine them.|620000|447000|635000|467000|215000|32000|6798|}}
{2010242002|XXGface|428|0|1107|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|429|0|1109|0|{@{}@The Effective Date will be Descending if 
There is an End Date, Else Ascending.|52000|318000|72000|338000|230000|32000|6663|}}
{2010242002|XXGface|430|0|1111|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|431|0|1113|0|{@{}@Disabled if There 
is No End Date|618000|388000|633000|408000|100000|32000|6797|}}
{2010242002|XXGface|432|0|1115|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|433|0|1117|0|{@{}@Disabled if There 
is No End Date|628000|183000|643000|203000|100000|32000|6796|}}
{2010242002|XXGface|434|0|1119|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|435|0|1121|0|{@{}@Disabled if There 
is No End Date|278000|393000|293000|413000|100000|32000|6799|}}
{2010242002|XXGface|436|0|1123|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|437|0|1125|0|{@{}@384|.44516128301620483|.5|{12|464000|124000|484000|124000|484000|190000|86000|190000|86000|274000|107000|274000|}6770|17|}}
{2010210004|XXGflow|438|0|1127|0|{@{}@384|.44516128301620483|.5|{8|171000|124000|191000|124000|316000|124000|337000|124000|}6780|20|}}
{2010210004|XXGflow|439|0|1129|0|{@{}@384|.44516128301620483|.5|{8|252000|249000|272000|249000|465000|249000|486000|249000|}6786|17|}}
{2010210004|XXGflow|440|0|1131|0|{@{}@384|.5951219797134399|.5|{12|646000|249000|666000|249000|666000|373000|119000|373000|119000|459000|140000|459000|}6787|17|}}
{2010210004|XXGflow|441|0|1133|0|{@{}@384|.44516128301620483|.5|{8|296000|459000|316000|459000|467000|459000|488000|459000|}6789|17|}}
{2010210004|XXGflow|442|0|1135|0|{@{}@384|.44516128301620483|1.0|{12|638000|459000|658000|459000|752000|459000|752000|284000|752000|284000|773000|284000|}6790|17|}}
{2010501005|XXGpvertex|443|0|1137|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|check_sort|False|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
}}@0|@98000|203000|118000|223000|124000|107000|6677|Dedup by NK, Eff Date|Ab Initio Software|Built-in 2.0:|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|444|0|1139|0|{@{}@241000|244000|11000|11000|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|445|0|1142|0|{@{}@241000|294000|11000|11000|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|446|0|1144|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|447|0|1146|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|448|0|1148|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|449|0|1150|0|{@{}@108000|269000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|450|0|1153|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|451|0|1155|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|452|0|1158|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|453|0|1161|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|454|0|1164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|455|0|1167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|456|0|1170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|457|0|1173|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|2|Pf$|@{0|}}
}}@0|@79600|93132|69000|102000|92000|41000|6781|Parition by Related or NK|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|458|0|1175|0|{@{}@160000|119000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|459|0|1178|0|{@{}@59000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|460|0|1180|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|461|0|1182|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|462|0|1185|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|463|0|1189|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
}}@0|@775673|257329|784000|266000|54000|41000|6779|Replicate|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|464|0|1191|0|{@{}@837000|279000|11000|11000|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|465|0|1193|0|{@{}@774000|279000|11000|11000|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|466|0|1196|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|467|0|1198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|468|0|1201|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|469|0|1204|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key_method|False|3|1|l|@{0|}}
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
{2010203004|XXGoport|470|0|1206|0|{@{}@627000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|471|0|1209|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|472|0|1211|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|473|0|1213|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|474|0|1215|0|{@{}@489000|454000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|475|0|1218|0|{Generates data records that summarize groups of data records.  Rollup in memory maximizes performance by keeping intermediate results in main memory.  Rollup sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|476|0|1220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|477|0|1223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|478|0|1226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|479|0|1229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|480|0|1232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|481|0|1235|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
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
{2010203004|XXGoport|482|0|1237|0|{@{}@635000|244000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|483|0|1240|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|484|0|1242|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|485|0|1244|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|486|0|1246|0|{@{}@487000|244000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|487|0|1249|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{2010203004|XXGoport|488|0|1251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|489|0|1254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|490|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|491|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|492|0|1263|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|493|0|1266|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$ADJUSTED_DEDUP_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
}}@0|@328000|62062|348000|82000|106000|89000|6768|Sort for Dedup|Ab Initio Software|Built-in|1|10|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|494|0|1268|0|{@{}@453000|119000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|495|0|1271|0|{@{}@338000|119000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|496|0|1274|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|497|0|1276|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|498|0|1279|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|499|0|1282|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|major_key|$UNDATED_NATURAL_KEY|3|2|$|@{0|}}
{30001002|XXparameter|minor_key|\{$EFFECTIVE_DATE_FIELD_NAME; $END_DATE_FIELD_NAME\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|allow_unsorted|True|3|1|l|@{0|}}
{30001002|XXparameter|condition|$[ END_DATE_FIELD_NAME != "" ]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
}}@0|@131000|387000|151000|407000|135000|107000|6731|Sort within NK by Eff Dt, End Dt|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|500|0|1284|0|{@{}@285000|454000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|501|0|1287|0|{@{}@141000|454000|11000|11000|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|502|0|1290|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|503|0|1292|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|504|0|1295|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|505|0|1298|0|{Subgraph created from graph "kimbo"|{}@0|@516500|22000|535000|42000|822000|206000|6782|Testing|Kimbo Mundy||1|100|-1||9||32833|{0|}0|0|{0|}{0|}{0|}{0|}.3654080331325531|821000|206000|3|}}
{2010240003|XXGlegend|506|0|1300|0|{@{}@Expected Output:
adjacent\|\|>>\|same\|1900-01-02\|1900-01-05\|
dup_keys\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v1\|1900-01-02\|1900-01-03\|
overlap-diff\|\|>>\|v2\|1900-01-04\|1900-01-05\|
overlap-mix\|\|>>\|same\|1900-01-02\|1900-01-05\|
overlap-mix\|\|>>\|diff\|1900-01-06\|1900-01-07\|
overlap-mix\|\|>>\|same\|1900-01-08\|1900-01-11\|
overlap-same\|\|>>\|same\|1900-01-02\|1900-01-05\||535000|25000|555000|45000|270000|144000|6782|}}
{2010242002|XXGface|507|0|1302|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|508|0|1304|0|{@{}@384|.5|.5|{8|400000|179000|420000|179000|427000|179000|448000|179000|}6778|17|}}
{2010210004|XXGflow|509|0|1306|0|{@{}@384|.5|.5|{8|107000|104000|127000|104000|151000|104000|172000|104000|}6763|17|}}
{2010501005|XXGpvertex|510|0|1308|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|num_records|13|3|2|$|@{0|}}
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
{2010203004|XXGoport|511|0|1310|0|{@{}@96000|99000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|512|0|1313|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|513|0|1315|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|514|0|1317|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|515|0|1319|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|516|0|1322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|517|0|1325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|518|0|1328|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/test.create/test.create.test1.dups.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@379000|49500|401000|70000|56000|50000|6783|Dups|Ab Initio Software||1|10|0||6||32897|-1|-1|}}
{2010202004|XXGiport|519|0|1330|0|{@{}@424000|60000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|520|0|1332|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|521|0|1334|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|522|0|1337|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$PARTITION_KEY|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@326000|151500|332000|161000|58000|41000|6779|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|523|0|1339|0|{@{}@389000|174000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|524|0|1342|0|{@{}@322000|174000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|525|0|1344|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|526|0|1346|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|527|0|1349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|528|0|1352|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
}}@0|@173000|73500|183000|83000|50000|41000|6752|Partition by Round-robin|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|529|0|1354|0|{@{}@232000|99000|11000|11000|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|530|0|1356|0|{@{}@173000|99000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|531|0|1359|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|532|0|1361|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|533|0|1364|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|534|0|1367|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:/~stdout|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("/~stdout", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@437000|136000|459000|156000|56000|50000|6758|stdout|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|535|0|1369|0|{@{}@449000|174000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|536|0|1372|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|537|0|1374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010203004|XXGoport|538|0|1377|0|{@{}@525000|74000|11000|11000|out|.5|@@@14099|0|}}
{2010202004|XXGiport|539|0|1380|0|{@{}@834000|74000|11000|11000|in0|.5|@@@63762|0|}}
{2010202004|XXGiport|540|0|1383|0|{@{}@679000|32000|11000|11000|in1|.5|@@@12960|0|}}
{2010203004|XXGoport|541|0|1386|0|{@{}@0|0|0|0|out|.5|@@@14352|0|}}
{2010203004|XXGoport|542|0|1389|0|{@{}@0|0|0|0|dups|.5|@@@13456|0|}}
{2010202004|XXGiport|543|0|1392|0|{@{}@0|0|0|0|in|.5|@@@14096|0|}}
{2010503005|XXGfvertex|544|0|1395|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$DUP_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$DUP_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$LOOKUP_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@472000|414500|494000|435000|56000|50000|9914|Dups|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|545|0|1397|0|{@{}@484000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|546|0|1400|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|547|0|1402|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|548|0|1406|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ LOOKUP_KEY == "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@642000|401500|652000|416000|50000|41000|9899|Gather|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|549|0|1408|0|{@{}@701000|429000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|550|0|1411|0|{@{}@642000|429000|11000|11000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|551|0|1414|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|552|0|1416|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|553|0|1419|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|554|0|1422|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
}}@0|@793000|351500|803000|366000|50000|41000|9904|Gather.|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|555|0|1424|0|{@{}@852000|379000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|556|0|1426|0|{@{}@793000|374000|11000|21000|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|557|0|1430|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|558|0|1432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|559|0|1435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|560|0|1438|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|mfile:$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@57000|160500|77000|181000|135000|93000|9863|Map to Output|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|561|0|1440|0|{@{}@211000|194000|11000|11000|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|562|0|1443|0|{@{}@211000|224000|11000|11000|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|563|0|1446|0|{@{}@211000|254000|11000|11000|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|564|0|1449|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|565|0|1451|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|566|0|1453|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|567|0|1455|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|568|0|1457|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|569|0|1459|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|570|0|1461|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|571|0|1463|0|{@{}@67000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|572|0|1465|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|573|0|1467|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|source|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|574|0|1471|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|clean|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|575|0|1475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|lkp|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|576|0|1479|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|577|0|1482|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|578|0|1485|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|579|0|1488|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|580|0|1491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|581|0|1494|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|582|0|1497|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|583|0|1500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|584|0|1503|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ LOOKUP_KEY != "" ]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
}}@0|@646000|298500|656000|313000|50000|41000|9901|Merge|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|585|0|1505|0|{@{}@705000|329000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|586|0|1508|0|{@{}@646000|329000|11000|11000|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|587|0|1511|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|588|0|1513|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|589|0|1516|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010203004|XXGoport|590|0|1519|0|{@{}@0|0|0|0|source|.16666666666666666|@@@14352|0|}}
{2010203004|XXGoport|591|0|1522|0|{@{}@0|0|0|0|clean|.5|@@@14352|0|}}
{2010203004|XXGoport|592|0|1525|0|{@{}@0|0|0|0|lookup|.8333333333333333|@@@14736|0|}}
{2010202004|XXGiport|593|0|1528|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010110002|XXGconstant|594|0|1531|0|{@{}@{1|4656244|}}}
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
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_1|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_10|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_11|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_12|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_13|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_19|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_2|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_20|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_3|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_4|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_5|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_6|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_7|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_8|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_9|}1|31|}
{2010601001|XXGgraph_vertex_vertex|31|0|62|0|{Apply_Cleanse|}1|32|}
{2010212001|XXGvertex_oport_oport|32|0|64|0|{0|out0|}32|33|}
{2010213001|XXGoport_dst_flow|33|0|66|0|{0|}33|18|}
{2010212001|XXGvertex_oport_oport|34|0|67|0|{1|reject0|}32|34|}
{2010212001|XXGvertex_oport_oport|35|0|69|0|{2|error0|}32|35|}
{2010212001|XXGvertex_oport_oport|36|0|71|0|{3|log|}32|36|}
{2010211001|XXGvertex_iport_iport|37|0|73|0|{0|in|}32|37|}
{2010214001|XXGiport_src_flow|38|0|75|0|{0|}37|28|}
{2010007001|XXGobject_proto_object|39|0|76|0|{}32|38|}
{2010212001|XXGvertex_oport_oport|40|0|78|0|{0|out0|}38|39|}
{2010006001|XXGobject_psameas_object|41|0|80|0|{metadata|out0_metadata|1|0|}39|38|}
{2010006001|XXGobject_psameas_object|42|0|81|0|{transform0|transform0|1|0|}39|38|}
{2010212001|XXGvertex_oport_oport|43|0|82|0|{1|reject0|}38|40|}
{2010006001|XXGobject_psameas_object|44|0|84|0|{metadata|reject0_metadata|1|0|}40|38|}
{2010212001|XXGvertex_oport_oport|45|0|85|0|{2|error0|}38|41|}
{2010006001|XXGobject_psameas_object|46|0|87|0|{metadata|error0_metadata|1|0|}41|38|}
{2010212001|XXGvertex_oport_oport|47|0|88|0|{3|log|}38|42|}
{2010006001|XXGobject_psameas_object|48|0|90|0|{metadata|log_metadata|1|0|}42|38|}
{2010211001|XXGvertex_iport_iport|49|0|91|0|{0|in|}38|43|}
{2010006001|XXGobject_psameas_object|50|0|93|0|{metadata|in_metadata|1|0|}43|38|}
{2010006001|XXGobject_psameas_object|51|0|94|0|{Layout|Layout|0|0|}32|44|}
{2010212001|XXGvertex_oport_oport|52|0|96|0|{0|out|}44|45|}
{2010213001|XXGoport_dst_flow|53|0|98|0|{0|}45|17|}
{2010212001|XXGvertex_oport_oport|54|0|99|0|{1|error|}44|46|}
{2010212001|XXGvertex_oport_oport|55|0|101|0|{2|log|}44|47|}
{2010007001|XXGobject_proto_object|56|0|103|0|{}44|48|}
{2010212001|XXGvertex_oport_oport|57|0|105|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|58|0|107|0|{metadata|out_metadata|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|59|0|108|0|{1|error|}48|50|}
{2010006001|XXGobject_psameas_object|60|0|110|0|{metadata|error_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|61|0|111|0|{2|log|}48|51|}
{2010006001|XXGobject_psameas_object|62|0|113|0|{metadata|log_metadata|1|0|}51|48|}
{2010006001|XXGobject_psameas_object|63|0|114|0|{in_metadata|out0_metadata|0|0|}32|52|}
{2010212001|XXGvertex_oport_oport|64|0|116|0|{0|out0|}52|53|}
{2010213001|XXGoport_dst_flow|65|0|118|0|{0|}53|21|}
{2010212001|XXGvertex_oport_oport|66|0|119|0|{1|reject|}52|54|}
{2010212001|XXGvertex_oport_oport|67|0|121|0|{2|error|}52|55|}
{2010212001|XXGvertex_oport_oport|68|0|123|0|{3|rej0|}52|56|}
{2010212001|XXGvertex_oport_oport|69|0|125|0|{4|err0|}52|57|}
{2010212001|XXGvertex_oport_oport|70|0|127|0|{5|log|}52|58|}
{2010211001|XXGvertex_iport_iport|71|0|129|0|{0|in|}52|59|}
{2010214001|XXGiport_src_flow|72|0|131|0|{0|}59|25|}
{2010007001|XXGobject_proto_object|73|0|132|0|{}52|60|}
{2010212001|XXGvertex_oport_oport|74|0|134|0|{0|out0|}60|61|}
{2010006001|XXGobject_psameas_object|75|0|136|0|{base_element0|base_element0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|76|0|137|0|{character_set0|character_set0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|77|0|138|0|{generate_package0|generate_package0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|78|0|139|0|{metadata|out0_metadata|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|79|0|140|0|{package0|package0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|80|0|141|0|{package_type_name0|package_type_name0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|81|0|142|0|{selected_items0|selected_items0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|82|0|143|0|{ui_state0|ui_state0|1|0|}61|60|}
{2010006001|XXGobject_psameas_object|83|0|144|0|{vector_length_prefix_type0|vector_length_prefix_type0|1|0|}61|60|}
{2010212001|XXGvertex_oport_oport|84|0|145|0|{1|reject|}60|62|}
{2010006001|XXGobject_psameas_object|85|0|147|0|{metadata|reject_metadata|1|0|}62|60|}
{2010212001|XXGvertex_oport_oport|86|0|148|0|{2|error|}60|63|}
{2010006001|XXGobject_psameas_object|87|0|150|0|{metadata|error_metadata|1|0|}63|60|}
{2010212001|XXGvertex_oport_oport|88|0|151|0|{3|rej0|}60|64|}
{2010006001|XXGobject_psameas_object|89|0|153|0|{metadata|rej0_metadata|1|0|}64|60|}
{2010212001|XXGvertex_oport_oport|90|0|154|0|{4|err0|}60|65|}
{2010006001|XXGobject_psameas_object|91|0|156|0|{metadata|err0_metadata|1|0|}65|60|}
{2010212001|XXGvertex_oport_oport|92|0|157|0|{5|log|}60|66|}
{2010006001|XXGobject_psameas_object|93|0|159|0|{metadata|log_metadata|1|0|}66|60|}
{2010211001|XXGvertex_iport_iport|94|0|160|0|{0|in|}60|67|}
{2010006001|XXGobject_psameas_object|95|0|162|0|{metadata|in_metadata|1|0|}67|60|}
{2010006001|XXGobject_psameas_object|96|0|163|0|{Layout|Layout|0|0|}52|44|}
{2010006001|XXGobject_psameas_object|97|0|164|0|{in_metadata|out_metadata|0|0|}52|68|}
{2010212001|XXGvertex_oport_oport|98|0|166|0|{0|out|}68|69|}
{2010213001|XXGoport_dst_flow|99|0|168|0|{0|}69|25|}
{2010212001|XXGvertex_oport_oport|100|0|169|0|{1|filereject|}68|70|}
{2010212001|XXGvertex_oport_oport|101|0|171|0|{2|fileerror|}68|71|}
{2010212001|XXGvertex_oport_oport|102|0|173|0|{3|reject|}68|72|}
{2010212001|XXGvertex_oport_oport|103|0|175|0|{4|error|}68|73|}
{2010212001|XXGvertex_oport_oport|104|0|177|0|{5|log|}68|74|}
{2010211001|XXGvertex_iport_iport|105|0|179|0|{0|in|}68|75|}
{2010214001|XXGiport_src_flow|106|0|181|0|{0|}75|17|}
{2010007001|XXGobject_proto_object|107|0|182|0|{}68|76|}
{2010212001|XXGvertex_oport_oport|108|0|184|0|{0|out|}76|77|}
{2010006001|XXGobject_psameas_object|109|0|186|0|{metadata|out_metadata|1|0|}77|76|}
{2010212001|XXGvertex_oport_oport|110|0|187|0|{1|filereject|}76|78|}
{2010006001|XXGobject_psameas_object|111|0|189|0|{metadata|filereject_metadata|1|0|}78|76|}
{2010212001|XXGvertex_oport_oport|112|0|190|0|{2|fileerror|}76|79|}
{2010006001|XXGobject_psameas_object|113|0|192|0|{metadata|fileerror_metadata|1|0|}79|76|}
{2010212001|XXGvertex_oport_oport|114|0|193|0|{3|reject|}76|80|}
{2010006001|XXGobject_psameas_object|115|0|195|0|{metadata|reject_metadata|1|0|}80|76|}
{2010212001|XXGvertex_oport_oport|116|0|196|0|{4|error|}76|81|}
{2010006001|XXGobject_psameas_object|117|0|198|0|{metadata|error_metadata|1|0|}81|76|}
{2010212001|XXGvertex_oport_oport|118|0|199|0|{5|log|}76|82|}
{2010006001|XXGobject_psameas_object|119|0|201|0|{metadata|log_metadata|1|0|}82|76|}
{2010211001|XXGvertex_iport_iport|120|0|202|0|{0|in|}76|83|}
{2010006001|XXGobject_psameas_object|121|0|204|0|{metadata|in_metadata|1|0|}83|76|}
{2010006001|XXGobject_psameas_object|122|0|205|0|{Layout|Layout|0|0|}68|44|}
{2010006001|XXGobject_psameas_object|123|0|206|0|{filereject_metadata|out_metadata|0|0|}68|44|}
{2010006001|XXGobject_psameas_object|124|0|207|0|{in_metadata|out_metadata|0|0|}68|44|}
{2010006001|XXGobject_psameas_object|125|0|208|0|{rej0_metadata|out_metadata|0|0|}52|68|}
{2010006001|XXGobject_psameas_object|126|0|209|0|{reject_metadata|out_metadata|0|0|}52|68|}
{2010006001|XXGobject_psameas_object|127|0|210|0|{out0_metadata|out0_metadata|0|0|}32|52|}
{2010006001|XXGobject_psameas_object|128|0|211|0|{reject0_metadata|out0_metadata|0|0|}32|52|}
{2010601001|XXGgraph_vertex_vertex|129|0|212|0|{Filter_records|}1|84|}
{2010212001|XXGvertex_oport_oport|130|0|214|0|{0|out|}84|85|}
{2010213001|XXGoport_dst_flow|131|0|216|0|{0|}85|28|}
{2010212001|XXGvertex_oport_oport|132|0|217|0|{1|deselect|}84|86|}
{2010212001|XXGvertex_oport_oport|133|0|219|0|{2|reject|}84|87|}
{2010212001|XXGvertex_oport_oport|134|0|221|0|{3|error|}84|88|}
{2010212001|XXGvertex_oport_oport|135|0|223|0|{4|log|}84|89|}
{2010211001|XXGvertex_iport_iport|136|0|225|0|{0|in|}84|90|}
{2010214001|XXGiport_src_flow|137|0|227|0|{0|}90|30|}
{2010007001|XXGobject_proto_object|138|0|228|0|{}84|91|}
{2010212001|XXGvertex_oport_oport|139|0|230|0|{0|out|}91|92|}
{2010006001|XXGobject_psameas_object|140|0|232|0|{metadata|out_metadata|1|0|}92|91|}
{2010212001|XXGvertex_oport_oport|141|0|233|0|{1|deselect|}91|93|}
{2010006001|XXGobject_psameas_object|142|0|235|0|{metadata|deselect_metadata|1|0|}93|91|}
{2010212001|XXGvertex_oport_oport|143|0|236|0|{2|reject|}91|94|}
{2010006001|XXGobject_psameas_object|144|0|238|0|{metadata|reject_metadata|1|0|}94|91|}
{2010212001|XXGvertex_oport_oport|145|0|239|0|{3|error|}91|95|}
{2010006001|XXGobject_psameas_object|146|0|241|0|{metadata|error_metadata|1|0|}95|91|}
{2010212001|XXGvertex_oport_oport|147|0|242|0|{4|log|}91|96|}
{2010006001|XXGobject_psameas_object|148|0|244|0|{metadata|log_metadata|1|0|}96|91|}
{2010211001|XXGvertex_iport_iport|149|0|245|0|{0|in|}91|97|}
{2010006001|XXGobject_psameas_object|150|0|247|0|{metadata|in_metadata|1|0|}97|91|}
{2010006001|XXGobject_psameas_object|151|0|248|0|{Layout|Layout|0|0|}84|44|}
{2010006001|XXGobject_psameas_object|152|0|249|0|{deselect_metadata|out0_metadata|0|0|}84|52|}
{2010006001|XXGobject_psameas_object|153|0|250|0|{in_metadata|out0_metadata|0|0|}84|52|}
{2010006001|XXGobject_psameas_object|154|0|251|0|{out_metadata|out0_metadata|0|0|}84|52|}
{2010006001|XXGobject_psameas_object|155|0|252|0|{reject_metadata|out0_metadata|0|0|}84|52|}
{2010601001|XXGgraph_vertex_vertex|156|0|253|0|{Get_Job_Log|}1|98|}
{2010211001|XXGvertex_iport_iport|157|0|255|0|{0|write|}98|99|}
{2010214001|XXGiport_src_flow|158|0|257|0|{0|}99|26|}
{2010007001|XXGobject_proto_object|159|0|258|0|{}98|100|}
{2010211001|XXGvertex_iport_iport|160|0|260|0|{0|write|}100|101|}
{2010006001|XXGobject_psameas_object|161|0|262|0|{metadata|write_metadata|1|0|}101|100|}
{2010601001|XXGgraph_vertex_vertex|162|0|263|0|{List_files|}1|44|}
{2010601001|XXGgraph_vertex_vertex|163|0|264|0|{MFS_File|}1|102|}
{2010212001|XXGvertex_oport_oport|164|0|266|0|{0|read|}102|103|}
{2010213001|XXGoport_dst_flow|165|0|268|0|{0|}103|24|}
{2010007001|XXGobject_proto_object|166|0|269|0|{}102|104|}
{2010212001|XXGvertex_oport_oport|167|0|271|0|{0|read|}104|105|}
{2010006001|XXGobject_psameas_object|168|0|273|0|{metadata|read_metadata|1|0|}105|104|}
{2010006001|XXGobject_psameas_object|169|0|274|0|{read_metadata|read_metadata|0|0|}102|106|}
{2010212001|XXGvertex_oport_oport|170|0|276|0|{0|read|}106|107|}
{2010007001|XXGobject_proto_object|171|0|278|0|{}106|108|}
{2010212001|XXGvertex_oport_oport|172|0|280|0|{0|read|}108|109|}
{2010006001|XXGobject_psameas_object|173|0|282|0|{metadata|read_metadata|1|0|}109|108|}
{2010601001|XXGgraph_vertex_vertex|174|0|283|0|{MFS_File_1|}1|106|}
{2010601001|XXGgraph_vertex_vertex|175|0|284|0|{Normalize_Add_Job_ID_Record_Count|}1|110|}
{2010212001|XXGvertex_oport_oport|176|0|286|0|{0|out|}110|111|}
{2010213001|XXGoport_dst_flow|177|0|288|0|{0|}111|29|}
{2010212001|XXGvertex_oport_oport|178|0|289|0|{1|reject|}110|112|}
{2010212001|XXGvertex_oport_oport|179|0|291|0|{2|error|}110|113|}
{2010212001|XXGvertex_oport_oport|180|0|293|0|{3|log|}110|114|}
{2010213001|XXGoport_dst_flow|181|0|295|0|{0|}114|27|}
{2010211001|XXGvertex_iport_iport|182|0|296|0|{0|in|}110|115|}
{2010214001|XXGiport_src_flow|183|0|298|0|{0|}115|18|}
{2010007001|XXGobject_proto_object|184|0|299|0|{}110|116|}
{2010212001|XXGvertex_oport_oport|185|0|301|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|186|0|303|0|{metadata|out_metadata|1|0|}117|116|}
{2010212001|XXGvertex_oport_oport|187|0|304|0|{1|reject|}116|118|}
{2010006001|XXGobject_psameas_object|188|0|306|0|{metadata|reject_metadata|1|0|}118|116|}
{2010212001|XXGvertex_oport_oport|189|0|307|0|{2|error|}116|119|}
{2010006001|XXGobject_psameas_object|190|0|309|0|{metadata|error_metadata|1|0|}119|116|}
{2010212001|XXGvertex_oport_oport|191|0|310|0|{3|log|}116|120|}
{2010006001|XXGobject_psameas_object|192|0|312|0|{metadata|log_metadata|1|0|}120|116|}
{2010211001|XXGvertex_iport_iport|193|0|313|0|{0|in|}116|121|}
{2010006001|XXGobject_psameas_object|194|0|315|0|{metadata|in_metadata|1|0|}121|116|}
{2010006001|XXGobject_psameas_object|195|0|316|0|{Layout|Layout|0|0|}110|98|}
{2010006001|XXGobject_psameas_object|196|0|317|0|{in_metadata|out0_metadata|0|0|}110|52|}
{2010006001|XXGobject_psameas_object|197|0|318|0|{reject_metadata|out0_metadata|0|0|}110|52|}
{2010601001|XXGgraph_vertex_vertex|198|0|319|0|{Optional_Clean|}1|122|}
{2010211001|XXGvertex_iport_iport|199|0|321|0|{0|write|}122|123|}
{2010214001|XXGiport_src_flow|200|0|323|0|{0|}123|19|}
{2010007001|XXGobject_proto_object|201|0|324|0|{}122|124|}
{2010211001|XXGvertex_iport_iport|202|0|326|0|{0|write|}124|125|}
{2010006001|XXGobject_psameas_object|203|0|328|0|{metadata|write_metadata|1|0|}125|124|}
{2010601001|XXGgraph_vertex_vertex|204|0|329|0|{Optional_Lookup|}1|126|}
{2010211001|XXGvertex_iport_iport|205|0|331|0|{0|write|}126|127|}
{2010214001|XXGiport_src_flow|206|0|333|0|{0|}127|20|}
{2010007001|XXGobject_proto_object|207|0|334|0|{}126|128|}
{2010211001|XXGvertex_iport_iport|208|0|336|0|{0|write|}128|129|}
{2010006001|XXGobject_psameas_object|209|0|338|0|{metadata|write_metadata|1|0|}129|128|}
{2010601001|XXGgraph_vertex_vertex|210|0|339|0|{Optional_Source|}1|130|}
{2010211001|XXGvertex_iport_iport|211|0|341|0|{0|write|}130|131|}
{2010214001|XXGiport_src_flow|212|0|343|0|{0|}131|31|}
{2010007001|XXGobject_proto_object|213|0|344|0|{}130|132|}
{2010211001|XXGvertex_iport_iport|214|0|346|0|{0|write|}132|133|}
{2010006001|XXGobject_psameas_object|215|0|348|0|{metadata|write_metadata|1|0|}133|132|}
{2010601001|XXGgraph_vertex_vertex|216|0|349|0|{Partition_by_Round_robin|}1|134|}
{2010212001|XXGvertex_oport_oport|217|0|351|0|{0|out|}134|135|}
{2010213001|XXGoport_dst_flow|218|0|353|0|{0|}135|23|}
{2010211001|XXGvertex_iport_iport|219|0|354|0|{0|in|}134|136|}
{2010214001|XXGiport_src_flow|220|0|356|0|{0|}136|29|}
{2010007001|XXGobject_proto_object|221|0|357|0|{}134|137|}
{2010212001|XXGvertex_oport_oport|222|0|359|0|{0|out|}137|138|}
{2010006001|XXGobject_psameas_object|223|0|361|0|{metadata|out_metadata|1|0|}138|137|}
{2010211001|XXGvertex_iport_iport|224|0|362|0|{0|in|}137|139|}
{2010006001|XXGobject_psameas_object|225|0|364|0|{metadata|in_metadata|1|0|}139|137|}
{2010006001|XXGobject_psameas_object|226|0|365|0|{Layout|Layout|0|0|}134|98|}
{2010006001|XXGobject_psameas_object|227|0|366|0|{in_metadata|out_metadata|0|0|}134|110|}
{2010006001|XXGobject_psameas_object|228|0|367|0|{out_metadata|out_metadata|0|0|}134|110|}
{2010601001|XXGgraph_vertex_vertex|229|0|368|0|{RFMT_Bugfix_and_Clean_Hex_Values|}1|140|}
{2010212001|XXGvertex_oport_oport|230|0|370|0|{0|out0|}140|141|}
{2010213001|XXGoport_dst_flow|231|0|372|0|{0|}141|30|}
{2010212001|XXGvertex_oport_oport|232|0|373|0|{1|reject0|}140|142|}
{2010212001|XXGvertex_oport_oport|233|0|375|0|{2|error0|}140|143|}
{2010212001|XXGvertex_oport_oport|234|0|377|0|{3|log|}140|144|}
{2010211001|XXGvertex_iport_iport|235|0|379|0|{0|in|}140|145|}
{2010214001|XXGiport_src_flow|236|0|381|0|{0|}145|21|}
{2010007001|XXGobject_proto_object|237|0|382|0|{}140|146|}
{2010212001|XXGvertex_oport_oport|238|0|384|0|{0|out0|}146|147|}
{2010006001|XXGobject_psameas_object|239|0|386|0|{metadata|out0_metadata|1|0|}147|146|}
{2010006001|XXGobject_psameas_object|240|0|387|0|{transform0|transform0|1|0|}147|146|}
{2010212001|XXGvertex_oport_oport|241|0|388|0|{1|reject0|}146|148|}
{2010006001|XXGobject_psameas_object|242|0|390|0|{metadata|reject0_metadata|1|0|}148|146|}
{2010212001|XXGvertex_oport_oport|243|0|391|0|{2|error0|}146|149|}
{2010006001|XXGobject_psameas_object|244|0|393|0|{metadata|error0_metadata|1|0|}149|146|}
{2010212001|XXGvertex_oport_oport|245|0|394|0|{3|log|}146|150|}
{2010006001|XXGobject_psameas_object|246|0|396|0|{metadata|log_metadata|1|0|}150|146|}
{2010211001|XXGvertex_iport_iport|247|0|397|0|{0|in|}146|151|}
{2010006001|XXGobject_psameas_object|248|0|399|0|{metadata|in_metadata|1|0|}151|146|}
{2010006001|XXGobject_psameas_object|249|0|400|0|{Layout|Layout|0|0|}140|44|}
{2010006001|XXGobject_psameas_object|250|0|401|0|{in_metadata|out0_metadata|0|0|}140|52|}
{2010006001|XXGobject_psameas_object|251|0|402|0|{out0_metadata|out0_metadata|0|0|}140|52|}
{2010006001|XXGobject_psameas_object|252|0|403|0|{reject0_metadata|out0_metadata|0|0|}140|52|}
{2010601001|XXGgraph_vertex_vertex|253|0|404|0|{Read_Multiple_Files|}1|68|}
{2010601001|XXGgraph_vertex_vertex|254|0|405|0|{Rollup_Job_Info|}1|152|}
{2010212001|XXGvertex_oport_oport|255|0|407|0|{0|out|}152|153|}
{2010213001|XXGoport_dst_flow|256|0|409|0|{0|}153|26|}
{2010212001|XXGvertex_oport_oport|257|0|410|0|{1|reject|}152|154|}
{2010212001|XXGvertex_oport_oport|258|0|412|0|{2|error|}152|155|}
{2010212001|XXGvertex_oport_oport|259|0|414|0|{3|log|}152|156|}
{2010211001|XXGvertex_iport_iport|260|0|416|0|{0|in|}152|157|}
{2010214001|XXGiport_src_flow|261|0|418|0|{0|}157|27|}
{2010007001|XXGobject_proto_object|262|0|419|0|{}152|158|}
{2010212001|XXGvertex_oport_oport|263|0|421|0|{0|out|}158|159|}
{2010006001|XXGobject_psameas_object|264|0|423|0|{metadata|out_metadata|1|0|}159|158|}
{2010212001|XXGvertex_oport_oport|265|0|424|0|{1|reject|}158|160|}
{2010006001|XXGobject_psameas_object|266|0|426|0|{metadata|reject_metadata|1|0|}160|158|}
{2010212001|XXGvertex_oport_oport|267|0|427|0|{2|error|}158|161|}
{2010006001|XXGobject_psameas_object|268|0|429|0|{metadata|error_metadata|1|0|}161|158|}
{2010212001|XXGvertex_oport_oport|269|0|430|0|{3|log|}158|162|}
{2010006001|XXGobject_psameas_object|270|0|432|0|{metadata|log_metadata|1|0|}162|158|}
{2010211001|XXGvertex_iport_iport|271|0|433|0|{0|in|}158|163|}
{2010006001|XXGobject_psameas_object|272|0|435|0|{metadata|in_metadata|1|0|}163|158|}
{2010006001|XXGobject_psameas_object|273|0|436|0|{Layout|Layout|0|0|}152|98|}
{2010006001|XXGobject_psameas_object|274|0|437|0|{in_metadata|log_metadata|0|0|}152|110|}
{2010006001|XXGobject_psameas_object|275|0|438|0|{out_metadata|write_metadata|0|0|}152|98|}
{2010006001|XXGobject_psameas_object|276|0|439|0|{reject_metadata|log_metadata|0|0|}152|110|}
{2010601001|XXGgraph_vertex_vertex|277|0|440|0|{Serial_File|}1|164|}
{2010212001|XXGvertex_oport_oport|278|0|442|0|{0|read|}164|165|}
{2010213001|XXGoport_dst_flow|279|0|444|0|{0|}165|22|}
{2010007001|XXGobject_proto_object|280|0|445|0|{}164|166|}
{2010212001|XXGvertex_oport_oport|281|0|447|0|{0|read|}166|167|}
{2010006001|XXGobject_psameas_object|282|0|449|0|{metadata|read_metadata|1|0|}167|166|}
{2010006001|XXGobject_psameas_object|283|0|450|0|{read_metadata|read_metadata|0|0|}164|168|}
{2010212001|XXGvertex_oport_oport|284|0|452|0|{0|read|}168|169|}
{2010007001|XXGobject_proto_object|285|0|454|0|{}168|170|}
{2010212001|XXGvertex_oport_oport|286|0|456|0|{0|read|}170|171|}
{2010006001|XXGobject_psameas_object|287|0|458|0|{metadata|read_metadata|1|0|}171|170|}
{2010601001|XXGgraph_vertex_vertex|288|0|459|0|{Serial_File_1|}1|168|}
{2010601001|XXGgraph_vertex_vertex|289|0|460|0|{Trash_2|}1|172|}
{2010211001|XXGvertex_iport_iport|290|0|462|0|{0|in|}172|173|}
{2010214001|XXGiport_src_flow|291|0|464|0|{0|}173|22|}
{2010007001|XXGobject_proto_object|292|0|465|0|{}172|174|}
{2010211001|XXGvertex_iport_iport|293|0|467|0|{0|in|}174|175|}
{2010006001|XXGobject_psameas_object|294|0|469|0|{metadata|in_metadata|1|0|}175|174|}
{2010006001|XXGobject_psameas_object|295|0|470|0|{Layout|Layout|0|0|}172|164|}
{2010006001|XXGobject_psameas_object|296|0|471|0|{in_metadata|read_metadata|0|0|}172|168|}
{2010601001|XXGgraph_vertex_vertex|297|0|472|0|{Trash_3|}1|176|}
{2010211001|XXGvertex_iport_iport|298|0|474|0|{0|in|}176|177|}
{2010214001|XXGiport_src_flow|299|0|476|0|{0|}177|24|}
{2010007001|XXGobject_proto_object|300|0|477|0|{}176|178|}
{2010211001|XXGvertex_iport_iport|301|0|479|0|{0|in|}178|179|}
{2010006001|XXGobject_psameas_object|302|0|481|0|{metadata|in_metadata|1|0|}179|178|}
{2010006001|XXGobject_psameas_object|303|0|482|0|{Layout|Layout|0|0|}176|102|}
{2010006001|XXGobject_psameas_object|304|0|483|0|{in_metadata|read_metadata|0|0|}176|106|}
{2010601001|XXGgraph_vertex_vertex|305|0|484|0|{Version_Log|}1|180|}
{2010605001|XXGgraph_legend_legend|306|0|486|0|{0|}180|181|}
{2010241001|XXGlegend_face_face|307|0|488|0|{}181|182|}
{2010605001|XXGgraph_legend_legend|308|0|490|0|{1|}180|183|}
{2010241001|XXGlegend_face_face|309|0|492|0|{}183|184|}
{2010605001|XXGgraph_legend_legend|310|0|494|0|{2|}180|185|}
{2010241001|XXGlegend_face_face|311|0|496|0|{}185|186|}
{2010605001|XXGgraph_legend_legend|312|0|498|0|{3|}180|187|}
{2010241001|XXGlegend_face_face|313|0|500|0|{}187|188|}
{2010605001|XXGgraph_legend_legend|314|0|502|0|{4|}180|189|}
{2010241001|XXGlegend_face_face|315|0|504|0|{}189|190|}
{2010605001|XXGgraph_legend_legend|316|0|506|0|{5|}180|191|}
{2010241001|XXGlegend_face_face|317|0|508|0|{}191|192|}
{2010605001|XXGgraph_legend_legend|318|0|510|0|{6|}180|193|}
{2010241001|XXGlegend_face_face|319|0|512|0|{}193|194|}
{2010605001|XXGgraph_legend_legend|320|0|514|0|{7|}180|195|}
{2010241001|XXGlegend_face_face|321|0|516|0|{}195|196|}
{2010605001|XXGgraph_legend_legend|322|0|518|0|{8|}180|197|}
{2010241001|XXGlegend_face_face|323|0|520|0|{}197|198|}
{2010605001|XXGgraph_legend_legend|324|0|522|0|{9|}180|199|}
{2010241001|XXGlegend_face_face|325|0|524|0|{}199|200|}
{2010601001|XXGgraph_vertex_vertex|326|0|526|0|{XML_Split|}1|52|}
{2010601001|XXGgraph_vertex_vertex|327|0|527|0|{prepare_output|}1|201|}
{2010605001|XXGgraph_legend_legend|328|0|529|0|{0|}201|202|}
{2010241001|XXGlegend_face_face|329|0|531|0|{}202|203|}
{2010605001|XXGgraph_legend_legend|330|0|533|0|{1|}201|204|}
{2010241001|XXGlegend_face_face|331|0|535|0|{}204|205|}
{2010605001|XXGgraph_legend_legend|332|0|537|0|{2|}201|206|}
{2010241001|XXGlegend_face_face|333|0|539|0|{}206|207|}
{2010605001|XXGgraph_legend_legend|334|0|541|0|{3|}201|208|}
{2010241001|XXGlegend_face_face|335|0|543|0|{}208|209|}
{2010604001|XXGgraph_flow_flow|336|0|545|0|{Flow_1|}201|210|}
{2010604001|XXGgraph_flow_flow|337|0|547|0|{Flow_2|}201|211|}
{2010604001|XXGgraph_flow_flow|338|0|549|0|{Flow_3|}201|212|}
{2010604001|XXGgraph_flow_flow|339|0|551|0|{Flow_4|}201|213|}
{2010604001|XXGgraph_flow_flow|340|0|553|0|{Flow_5|}201|214|}
{2010604001|XXGgraph_flow_flow|341|0|555|0|{Flow_6|}201|215|}
{2010604001|XXGgraph_flow_flow|342|0|557|0|{Flow_7|}201|216|}
{2010604001|XXGgraph_flow_flow|343|0|559|0|{Flow_8|}201|217|}
{2010601001|XXGgraph_vertex_vertex|344|0|561|0|{Copy_Out|}201|218|}
{2010212001|XXGvertex_oport_oport|345|0|563|0|{0|out|}218|219|}
{2010211001|XXGvertex_iport_iport|346|0|565|0|{0|in|}218|220|}
{2010214001|XXGiport_src_flow|347|0|567|0|{0|}220|216|}
{2010006001|XXGobject_psameas_object|348|0|568|0|{Layout|Layout|0|0|}218|130|}
{2010006001|XXGobject_psameas_object|349|0|569|0|{in_metadata|write_metadata|0|0|}218|130|}
{2010006001|XXGobject_psameas_object|350|0|570|0|{out_metadata|write_metadata|0|0|}218|130|}
{2010601001|XXGgraph_vertex_vertex|351|0|571|0|{Copy_Out_|}201|221|}
{2010212001|XXGvertex_oport_oport|352|0|573|0|{0|out|}221|222|}
{2010211001|XXGvertex_iport_iport|353|0|575|0|{0|in|}221|223|}
{2010214001|XXGiport_src_flow|354|0|577|0|{0|}223|211|}
{2010006001|XXGobject_psameas_object|355|0|578|0|{Layout|Layout|0|0|}221|122|}
{2010006001|XXGobject_psameas_object|356|0|579|0|{in_metadata|write_metadata|0|0|}221|122|}
{2010006001|XXGobject_psameas_object|357|0|580|0|{out_metadata|write_metadata|0|0|}221|122|}
{2010601001|XXGgraph_vertex_vertex|358|0|581|0|{Dedup_and_Fix_Intervals|}201|224|}
{2010605001|XXGgraph_legend_legend|359|0|583|0|{0|}224|225|}
{2010241001|XXGlegend_face_face|360|0|585|0|{}225|226|}
{2010605001|XXGgraph_legend_legend|361|0|587|0|{1|}224|227|}
{2010241001|XXGlegend_face_face|362|0|589|0|{}227|228|}
{2010605001|XXGgraph_legend_legend|363|0|591|0|{2|}224|229|}
{2010241001|XXGlegend_face_face|364|0|593|0|{}229|230|}
{2010605001|XXGgraph_legend_legend|365|0|595|0|{3|}224|231|}
{2010241001|XXGlegend_face_face|366|0|597|0|{}231|232|}
{2010605001|XXGgraph_legend_legend|367|0|599|0|{4|}224|233|}
{2010241001|XXGlegend_face_face|368|0|601|0|{}233|234|}
{2010604001|XXGgraph_flow_flow|369|0|603|0|{Flow_1|}224|235|}
{2010604001|XXGgraph_flow_flow|370|0|605|0|{Flow_2|}224|236|}
{2010604001|XXGgraph_flow_flow|371|0|607|0|{Flow_3|}224|237|}
{2010604001|XXGgraph_flow_flow|372|0|609|0|{Flow_4|}224|238|}
{2010604001|XXGgraph_flow_flow|373|0|611|0|{Flow_6|}224|239|}
{2010604001|XXGgraph_flow_flow|374|0|613|0|{Flow_7|}224|240|}
{2010601001|XXGgraph_vertex_vertex|375|0|615|0|{Dedup_by_NK_Eff_Date|}224|241|}
{2010212001|XXGvertex_oport_oport|376|0|617|0|{0|out|}241|242|}
{2010213001|XXGoport_dst_flow|377|0|619|0|{0|}242|237|}
{2010212001|XXGvertex_oport_oport|378|0|620|0|{1|dup|}241|243|}
{2010212001|XXGvertex_oport_oport|379|0|622|0|{2|reject|}241|244|}
{2010212001|XXGvertex_oport_oport|380|0|624|0|{3|error|}241|245|}
{2010212001|XXGvertex_oport_oport|381|0|626|0|{4|log|}241|246|}
{2010211001|XXGvertex_iport_iport|382|0|628|0|{0|in|}241|247|}
{2010214001|XXGiport_src_flow|383|0|630|0|{0|}247|235|}
{2010006001|XXGobject_psameas_object|384|0|631|0|{Layout|Layout|0|0|}241|248|}
{2010211001|XXGvertex_iport_iport|385|0|633|0|{0|write|}248|249|}
{2010214001|XXGiport_src_flow|386|0|635|0|{0|}249|213|}
{2010006001|XXGobject_psameas_object|387|0|636|0|{dup_metadata|write_metadata|0|0|}241|248|}
{2010006001|XXGobject_psameas_object|388|0|637|0|{in_metadata|write_metadata|0|0|}241|248|}
{2010006001|XXGobject_psameas_object|389|0|638|0|{out_metadata|write_metadata|0|0|}241|248|}
{2010006001|XXGobject_psameas_object|390|0|639|0|{reject_metadata|write_metadata|0|0|}241|248|}
{2010601001|XXGgraph_vertex_vertex|391|0|640|0|{Parition_by_Related_or_NK|}224|250|}
{2010212001|XXGvertex_oport_oport|392|0|642|0|{0|out|}250|251|}
{2010213001|XXGoport_dst_flow|393|0|644|0|{0|}251|236|}
{2010211001|XXGvertex_iport_iport|394|0|645|0|{0|in|}250|252|}
{2010006001|XXGobject_psameas_object|395|0|647|0|{Layout|Layout|0|0|}250|253|}
{2010212001|XXGvertex_oport_oport|396|0|649|0|{0|source|}253|254|}
{2010213001|XXGoport_dst_flow|397|0|651|0|{0|}254|216|}
{2010212001|XXGvertex_oport_oport|398|0|652|0|{1|clean|}253|255|}
{2010213001|XXGoport_dst_flow|399|0|654|0|{0|}255|211|}
{2010212001|XXGvertex_oport_oport|400|0|655|0|{2|lkp|}253|256|}
{2010213001|XXGoport_dst_flow|401|0|657|0|{0|}256|210|}
{2010212001|XXGvertex_oport_oport|402|0|658|0|{3|reject0|}253|257|}
{2010212001|XXGvertex_oport_oport|403|0|660|0|{4|reject1|}253|258|}
{2010212001|XXGvertex_oport_oport|404|0|662|0|{5|reject2|}253|259|}
{2010212001|XXGvertex_oport_oport|405|0|664|0|{6|error0|}253|260|}
{2010212001|XXGvertex_oport_oport|406|0|666|0|{7|error1|}253|261|}
{2010212001|XXGvertex_oport_oport|407|0|668|0|{8|error2|}253|262|}
{2010212001|XXGvertex_oport_oport|408|0|670|0|{9|log|}253|263|}
{2010211001|XXGvertex_iport_iport|409|0|672|0|{0|in|}253|264|}
{2010006001|XXGobject_psameas_object|410|0|674|0|{in_metadata|out_metadata|0|0|}253|110|}
{2010006001|XXGobject_psameas_object|411|0|675|0|{out0_metadata|write_metadata|0|0|}253|130|}
{2010006001|XXGobject_psameas_object|412|0|676|0|{out1_metadata|write_metadata|0|0|}253|122|}
{2010006001|XXGobject_psameas_object|413|0|677|0|{out2_metadata|write_metadata|0|0|}253|248|}
{2010006001|XXGobject_psameas_object|414|0|678|0|{reject0_metadata|out_metadata|0|0|}253|110|}
{2010006001|XXGobject_psameas_object|415|0|679|0|{reject1_metadata|out_metadata|0|0|}253|110|}
{2010006001|XXGobject_psameas_object|416|0|680|0|{reject2_metadata|out_metadata|0|0|}253|110|}
{2010006001|XXGobject_psameas_object|417|0|681|0|{out_metadata|write_metadata|0|0|}250|248|}
{2010601001|XXGgraph_vertex_vertex|418|0|682|0|{Replicate|}224|265|}
{2010212001|XXGvertex_oport_oport|419|0|684|0|{0|out|}265|266|}
{2010211001|XXGvertex_iport_iport|420|0|686|0|{0|in|}265|267|}
{2010214001|XXGiport_src_flow|421|0|688|0|{0|}267|240|}
{2010006001|XXGobject_psameas_object|422|0|689|0|{Layout|Layout|0|0|}265|248|}
{2010006001|XXGobject_psameas_object|423|0|690|0|{in_metadata|write_metadata|0|0|}265|126|}
{2010006001|XXGobject_psameas_object|424|0|691|0|{out_metadata|write_metadata|0|0|}265|126|}
{2010601001|XXGgraph_vertex_vertex|425|0|692|0|{Rollup_Adjoining_Eff_Dates|}224|268|}
{2010212001|XXGvertex_oport_oport|426|0|694|0|{0|out|}268|269|}
{2010213001|XXGoport_dst_flow|427|0|696|0|{0|}269|240|}
{2010212001|XXGvertex_oport_oport|428|0|697|0|{1|reject|}268|270|}
{2010212001|XXGvertex_oport_oport|429|0|699|0|{2|error|}268|271|}
{2010212001|XXGvertex_oport_oport|430|0|701|0|{3|log|}268|272|}
{2010211001|XXGvertex_iport_iport|431|0|703|0|{0|in|}268|273|}
{2010214001|XXGiport_src_flow|432|0|705|0|{0|}273|239|}
{2010006001|XXGobject_psameas_object|433|0|706|0|{Layout|Layout|0|0|}268|248|}
{2010006001|XXGobject_psameas_object|434|0|707|0|{in_metadata|write_metadata|0|0|}268|248|}
{2010006001|XXGobject_psameas_object|435|0|708|0|{out_metadata|write_metadata|0|0|}268|248|}
{2010006001|XXGobject_psameas_object|436|0|709|0|{reject_metadata|write_metadata|0|0|}268|248|}
{2010601001|XXGgraph_vertex_vertex|437|0|710|0|{Scan_to_Fix_Overlapping_Dates|}224|274|}
{2010212001|XXGvertex_oport_oport|438|0|712|0|{0|out|}274|275|}
{2010213001|XXGoport_dst_flow|439|0|714|0|{0|}275|238|}
{2010212001|XXGvertex_oport_oport|440|0|715|0|{1|reject|}274|276|}
{2010212001|XXGvertex_oport_oport|441|0|717|0|{2|error|}274|277|}
{2010212001|XXGvertex_oport_oport|442|0|719|0|{3|log|}274|278|}
{2010211001|XXGvertex_iport_iport|443|0|721|0|{0|in|}274|279|}
{2010214001|XXGiport_src_flow|444|0|723|0|{0|}279|237|}
{2010006001|XXGobject_psameas_object|445|0|724|0|{Layout|Layout|0|0|}274|248|}
{2010006001|XXGobject_psameas_object|446|0|725|0|{in_metadata|write_metadata|0|0|}274|248|}
{2010006001|XXGobject_psameas_object|447|0|726|0|{out_metadata|write_metadata|0|0|}274|248|}
{2010006001|XXGobject_psameas_object|448|0|727|0|{reject_metadata|write_metadata|0|0|}274|248|}
{2010601001|XXGgraph_vertex_vertex|449|0|728|0|{Sort_for_Dedup|}224|280|}
{2010212001|XXGvertex_oport_oport|450|0|730|0|{0|out|}280|281|}
{2010213001|XXGoport_dst_flow|451|0|732|0|{0|}281|235|}
{2010211001|XXGvertex_iport_iport|452|0|733|0|{0|in|}280|282|}
{2010214001|XXGiport_src_flow|453|0|735|0|{0|}282|236|}
{2010006001|XXGobject_psameas_object|454|0|736|0|{Layout|Layout|0|0|}280|248|}
{2010006001|XXGobject_psameas_object|455|0|737|0|{in_metadata|write_metadata|0|0|}280|248|}
{2010006001|XXGobject_psameas_object|456|0|738|0|{out_metadata|write_metadata|0|0|}280|248|}
{2010601001|XXGgraph_vertex_vertex|457|0|739|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}224|283|}
{2010212001|XXGvertex_oport_oport|458|0|741|0|{0|out|}283|284|}
{2010213001|XXGoport_dst_flow|459|0|743|0|{0|}284|239|}
{2010211001|XXGvertex_iport_iport|460|0|744|0|{0|in|}283|285|}
{2010214001|XXGiport_src_flow|461|0|746|0|{0|}285|238|}
{2010006001|XXGobject_psameas_object|462|0|747|0|{Layout|Layout|0|0|}283|248|}
{2010006001|XXGobject_psameas_object|463|0|748|0|{in_metadata|write_metadata|0|0|}283|248|}
{2010006001|XXGobject_psameas_object|464|0|749|0|{out_metadata|write_metadata|0|0|}283|248|}
{2010601001|XXGgraph_vertex_vertex|465|0|750|0|{Testing|}224|286|}
{2010605001|XXGgraph_legend_legend|466|0|752|0|{0|}286|287|}
{2010241001|XXGlegend_face_face|467|0|754|0|{}287|288|}
{2010604001|XXGgraph_flow_flow|468|0|756|0|{Flow_1|}286|289|}
{2010604001|XXGgraph_flow_flow|469|0|758|0|{Flow_8|}286|290|}
{2010601001|XXGgraph_vertex_vertex|470|0|760|0|{Create|}286|291|}
{2010212001|XXGvertex_oport_oport|471|0|762|0|{0|out|}291|292|}
{2010213001|XXGoport_dst_flow|472|0|764|0|{0|}292|290|}
{2010212001|XXGvertex_oport_oport|473|0|765|0|{1|error|}291|293|}
{2010212001|XXGvertex_oport_oport|474|0|767|0|{2|log|}291|294|}
{2010601001|XXGgraph_vertex_vertex|475|0|769|0|{Dups|}286|295|}
{2010211001|XXGvertex_iport_iport|476|0|771|0|{0|write|}295|296|}
{2010601001|XXGgraph_vertex_vertex|477|0|773|0|{Merge|}286|297|}
{2010212001|XXGvertex_oport_oport|478|0|775|0|{0|out|}297|298|}
{2010213001|XXGoport_dst_flow|479|0|777|0|{0|}298|289|}
{2010211001|XXGvertex_iport_iport|480|0|778|0|{0|in|}297|299|}
{2010601001|XXGgraph_vertex_vertex|481|0|780|0|{Partition_by_Round_robin|}286|300|}
{2010212001|XXGvertex_oport_oport|482|0|782|0|{0|out|}300|301|}
{2010211001|XXGvertex_iport_iport|483|0|784|0|{0|in|}300|302|}
{2010214001|XXGiport_src_flow|484|0|786|0|{0|}302|290|}
{2010006001|XXGobject_psameas_object|485|0|787|0|{in_metadata|out_metadata|0|0|}300|291|}
{2010006001|XXGobject_psameas_object|486|0|788|0|{out_metadata|out_metadata|0|0|}300|291|}
{2010601001|XXGgraph_vertex_vertex|487|0|789|0|{stdout|}286|303|}
{2010211001|XXGvertex_iport_iport|488|0|791|0|{0|write|}303|304|}
{2010214001|XXGiport_src_flow|489|0|793|0|{0|}304|289|}
{2010212001|XXGvertex_oport_oport|490|0|794|0|{0|out|}286|305|}
{2010216002|XXGoport_binding_oport|491|0|796|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}305|301|}
{2010211001|XXGvertex_iport_iport|492|0|797|0|{0|in0|}286|306|}
{2010215002|XXGiport_binding_iport|493|0|799|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}306|299|}
{2010211001|XXGvertex_iport_iport|494|0|800|0|{1|in1|}286|307|}
{2010215002|XXGiport_binding_iport|495|0|802|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}307|296|}
{2010212001|XXGvertex_oport_oport|496|0|803|0|{0|out|}224|308|}
{2010216002|XXGoport_binding_oport|497|0|805|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}308|266|}
{2010213001|XXGoport_dst_flow|498|0|806|0|{0|}308|212|}
{2010213001|XXGoport_dst_flow|499|0|807|0|{1|}308|215|}
{2010212001|XXGvertex_oport_oport|500|0|808|0|{1|dups|}224|309|}
{2010216002|XXGoport_binding_oport|501|0|810|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}309|243|}
{2010213001|XXGoport_dst_flow|502|0|811|0|{0|}309|213|}
{2010211001|XXGvertex_iport_iport|503|0|812|0|{0|in|}224|310|}
{2010215002|XXGiport_binding_iport|504|0|814|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}310|252|}
{2010214001|XXGiport_src_flow|505|0|815|0|{0|}310|210|}
{2010006001|XXGobject_psameas_object|506|0|816|0|{INPUT_DML|write_metadata|0|0|}224|248|}
{2010601001|XXGgraph_vertex_vertex|507|0|817|0|{Dups|}201|248|}
{2010601001|XXGgraph_vertex_vertex|508|0|818|0|{Gather|}201|311|}
{2010212001|XXGvertex_oport_oport|509|0|820|0|{0|out|}311|312|}
{2010213001|XXGoport_dst_flow|510|0|822|0|{0|}312|217|}
{2010211001|XXGvertex_iport_iport|511|0|823|0|{0|in|}311|313|}
{2010214001|XXGiport_src_flow|512|0|825|0|{0|}313|215|}
{2010006001|XXGobject_psameas_object|513|0|826|0|{in_metadata|write_metadata|0|0|}311|126|}
{2010006001|XXGobject_psameas_object|514|0|827|0|{out_metadata|write_metadata|0|0|}311|126|}
{2010601001|XXGgraph_vertex_vertex|515|0|828|0|{Gather_|}201|314|}
{2010212001|XXGvertex_oport_oport|516|0|830|0|{0|out|}314|315|}
{2010211001|XXGvertex_iport_iport|517|0|832|0|{0|in|}314|316|}
{2010214001|XXGiport_src_flow|518|0|834|0|{0|}316|214|}
{2010214001|XXGiport_src_flow|519|0|835|0|{1|}316|217|}
{2010006001|XXGobject_psameas_object|520|0|836|0|{Layout|Layout|0|0|}314|126|}
{2010006001|XXGobject_psameas_object|521|0|837|0|{in_metadata|write_metadata|0|0|}314|126|}
{2010006001|XXGobject_psameas_object|522|0|838|0|{out_metadata|write_metadata|0|0|}314|126|}
{2010601001|XXGgraph_vertex_vertex|523|0|839|0|{Map_to_Output|}201|253|}
{2010601001|XXGgraph_vertex_vertex|524|0|840|0|{Merge|}201|317|}
{2010212001|XXGvertex_oport_oport|525|0|842|0|{0|out|}317|318|}
{2010213001|XXGoport_dst_flow|526|0|844|0|{0|}318|214|}
{2010211001|XXGvertex_iport_iport|527|0|845|0|{0|in|}317|319|}
{2010214001|XXGiport_src_flow|528|0|847|0|{0|}319|212|}
{2010006001|XXGobject_psameas_object|529|0|848|0|{in_metadata|write_metadata|0|0|}317|126|}
{2010006001|XXGobject_psameas_object|530|0|849|0|{out_metadata|write_metadata|0|0|}317|126|}
{2010212001|XXGvertex_oport_oport|531|0|850|0|{0|source|}201|320|}
{2010216002|XXGoport_binding_oport|532|0|852|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9920|}320|219|}
{2010213001|XXGoport_dst_flow|533|0|853|0|{0|}320|31|}
{2010212001|XXGvertex_oport_oport|534|0|854|0|{1|clean|}201|321|}
{2010216002|XXGoport_binding_oport|535|0|856|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9921|}321|222|}
{2010213001|XXGoport_dst_flow|536|0|857|0|{0|}321|19|}
{2010212001|XXGvertex_oport_oport|537|0|858|0|{2|lookup|}201|322|}
{2010216002|XXGoport_binding_oport|538|0|860|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9922|}322|315|}
{2010213001|XXGoport_dst_flow|539|0|861|0|{0|}322|20|}
{2010211001|XXGvertex_iport_iport|540|0|862|0|{0|in0|}201|323|}
{2010215002|XXGiport_binding_iport|541|0|864|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9919|}323|264|}
{2010214001|XXGiport_src_flow|542|0|865|0|{0|}323|23|}
{2010007001|XXGobject_proto_object|543|0|866|0|{}201|324|}
{2010605001|XXGgraph_legend_legend|544|0|868|0|{0|}324|325|}
{2010241001|XXGlegend_face_face|545|0|870|0|{}325|326|}
{2010605001|XXGgraph_legend_legend|546|0|872|0|{1|}324|327|}
{2010241001|XXGlegend_face_face|547|0|874|0|{}327|328|}
{2010605001|XXGgraph_legend_legend|548|0|876|0|{2|}324|329|}
{2010241001|XXGlegend_face_face|549|0|878|0|{}329|330|}
{2010605001|XXGgraph_legend_legend|550|0|880|0|{3|}324|331|}
{2010241001|XXGlegend_face_face|551|0|882|0|{}331|332|}
{2010604001|XXGgraph_flow_flow|552|0|884|0|{Flow_1|}324|333|}
{2010604001|XXGgraph_flow_flow|553|0|886|0|{Flow_2|}324|334|}
{2010604001|XXGgraph_flow_flow|554|0|888|0|{Flow_3|}324|335|}
{2010604001|XXGgraph_flow_flow|555|0|890|0|{Flow_4|}324|336|}
{2010604001|XXGgraph_flow_flow|556|0|892|0|{Flow_5|}324|337|}
{2010604001|XXGgraph_flow_flow|557|0|894|0|{Flow_6|}324|338|}
{2010604001|XXGgraph_flow_flow|558|0|896|0|{Flow_7|}324|339|}
{2010604001|XXGgraph_flow_flow|559|0|898|0|{Flow_8|}324|340|}
{2010601001|XXGgraph_vertex_vertex|560|0|900|0|{Copy_Out|}324|341|}
{2010212001|XXGvertex_oport_oport|561|0|902|0|{0|out|}341|342|}
{2010211001|XXGvertex_iport_iport|562|0|904|0|{0|in|}341|343|}
{2010214001|XXGiport_src_flow|563|0|906|0|{0|}343|339|}
{2010007001|XXGobject_proto_object|564|0|907|0|{}341|344|}
{2010212001|XXGvertex_oport_oport|565|0|909|0|{0|out|}344|345|}
{2010006001|XXGobject_psameas_object|566|0|911|0|{metadata|out_metadata|1|0|}345|344|}
{2010211001|XXGvertex_iport_iport|567|0|912|0|{0|in|}344|346|}
{2010006001|XXGobject_psameas_object|568|0|914|0|{metadata|in_metadata|1|0|}346|344|}
{2010601001|XXGgraph_vertex_vertex|569|0|915|0|{Copy_Out_|}324|347|}
{2010212001|XXGvertex_oport_oport|570|0|917|0|{0|out|}347|348|}
{2010211001|XXGvertex_iport_iport|571|0|919|0|{0|in|}347|349|}
{2010214001|XXGiport_src_flow|572|0|921|0|{0|}349|334|}
{2010007001|XXGobject_proto_object|573|0|922|0|{}347|350|}
{2010212001|XXGvertex_oport_oport|574|0|924|0|{0|out|}350|351|}
{2010006001|XXGobject_psameas_object|575|0|926|0|{metadata|out_metadata|1|0|}351|350|}
{2010211001|XXGvertex_iport_iport|576|0|927|0|{0|in|}350|352|}
{2010006001|XXGobject_psameas_object|577|0|929|0|{metadata|in_metadata|1|0|}352|350|}
{2010601001|XXGgraph_vertex_vertex|578|0|930|0|{Dedup_and_Fix_Intervals|}324|353|}
{2010605001|XXGgraph_legend_legend|579|0|932|0|{0|}353|354|}
{2010241001|XXGlegend_face_face|580|0|934|0|{}354|355|}
{2010605001|XXGgraph_legend_legend|581|0|936|0|{1|}353|356|}
{2010241001|XXGlegend_face_face|582|0|938|0|{}356|357|}
{2010605001|XXGgraph_legend_legend|583|0|940|0|{2|}353|358|}
{2010241001|XXGlegend_face_face|584|0|942|0|{}358|359|}
{2010605001|XXGgraph_legend_legend|585|0|944|0|{3|}353|360|}
{2010241001|XXGlegend_face_face|586|0|946|0|{}360|361|}
{2010605001|XXGgraph_legend_legend|587|0|948|0|{4|}353|362|}
{2010241001|XXGlegend_face_face|588|0|950|0|{}362|363|}
{2010604001|XXGgraph_flow_flow|589|0|952|0|{Flow_1|}353|364|}
{2010604001|XXGgraph_flow_flow|590|0|954|0|{Flow_2|}353|365|}
{2010604001|XXGgraph_flow_flow|591|0|956|0|{Flow_3|}353|366|}
{2010604001|XXGgraph_flow_flow|592|0|958|0|{Flow_4|}353|367|}
{2010604001|XXGgraph_flow_flow|593|0|960|0|{Flow_6|}353|368|}
{2010604001|XXGgraph_flow_flow|594|0|962|0|{Flow_7|}353|369|}
{2010601001|XXGgraph_vertex_vertex|595|0|964|0|{Dedup_by_NK_Eff_Date|}353|370|}
{2010212001|XXGvertex_oport_oport|596|0|966|0|{0|out|}370|371|}
{2010213001|XXGoport_dst_flow|597|0|968|0|{0|}371|366|}
{2010212001|XXGvertex_oport_oport|598|0|969|0|{1|dup|}370|372|}
{2010212001|XXGvertex_oport_oport|599|0|971|0|{2|reject|}370|373|}
{2010212001|XXGvertex_oport_oport|600|0|973|0|{3|error|}370|374|}
{2010212001|XXGvertex_oport_oport|601|0|975|0|{4|log|}370|375|}
{2010211001|XXGvertex_iport_iport|602|0|977|0|{0|in|}370|376|}
{2010214001|XXGiport_src_flow|603|0|979|0|{0|}376|364|}
{2010601001|XXGgraph_vertex_vertex|604|0|980|0|{Parition_by_Related_or_NK|}353|377|}
{2010212001|XXGvertex_oport_oport|605|0|982|0|{0|out|}377|378|}
{2010213001|XXGoport_dst_flow|606|0|984|0|{0|}378|365|}
{2010211001|XXGvertex_iport_iport|607|0|985|0|{0|in|}377|379|}
{2010601001|XXGgraph_vertex_vertex|608|0|987|0|{Replicate|}353|380|}
{2010212001|XXGvertex_oport_oport|609|0|989|0|{0|out|}380|381|}
{2010211001|XXGvertex_iport_iport|610|0|991|0|{0|in|}380|382|}
{2010214001|XXGiport_src_flow|611|0|993|0|{0|}382|369|}
{2010601001|XXGgraph_vertex_vertex|612|0|994|0|{Rollup_Adjoining_Eff_Dates|}353|383|}
{2010212001|XXGvertex_oport_oport|613|0|996|0|{0|out|}383|384|}
{2010213001|XXGoport_dst_flow|614|0|998|0|{0|}384|369|}
{2010212001|XXGvertex_oport_oport|615|0|999|0|{1|reject|}383|385|}
{2010212001|XXGvertex_oport_oport|616|0|1001|0|{2|error|}383|386|}
{2010212001|XXGvertex_oport_oport|617|0|1003|0|{3|log|}383|387|}
{2010211001|XXGvertex_iport_iport|618|0|1005|0|{0|in|}383|388|}
{2010214001|XXGiport_src_flow|619|0|1007|0|{0|}388|368|}
{2010601001|XXGgraph_vertex_vertex|620|0|1008|0|{Scan_to_Fix_Overlapping_Dates|}353|389|}
{2010212001|XXGvertex_oport_oport|621|0|1010|0|{0|out|}389|390|}
{2010213001|XXGoport_dst_flow|622|0|1012|0|{0|}390|367|}
{2010212001|XXGvertex_oport_oport|623|0|1013|0|{1|reject|}389|391|}
{2010212001|XXGvertex_oport_oport|624|0|1015|0|{2|error|}389|392|}
{2010212001|XXGvertex_oport_oport|625|0|1017|0|{3|log|}389|393|}
{2010211001|XXGvertex_iport_iport|626|0|1019|0|{0|in|}389|394|}
{2010214001|XXGiport_src_flow|627|0|1021|0|{0|}394|366|}
{2010601001|XXGgraph_vertex_vertex|628|0|1022|0|{Sort_for_Dedup|}353|395|}
{2010212001|XXGvertex_oport_oport|629|0|1024|0|{0|out|}395|396|}
{2010213001|XXGoport_dst_flow|630|0|1026|0|{0|}396|364|}
{2010211001|XXGvertex_iport_iport|631|0|1027|0|{0|in|}395|397|}
{2010214001|XXGiport_src_flow|632|0|1029|0|{0|}397|365|}
{2010601001|XXGgraph_vertex_vertex|633|0|1030|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}353|398|}
{2010212001|XXGvertex_oport_oport|634|0|1032|0|{0|out|}398|399|}
{2010213001|XXGoport_dst_flow|635|0|1034|0|{0|}399|368|}
{2010211001|XXGvertex_iport_iport|636|0|1035|0|{0|in|}398|400|}
{2010214001|XXGiport_src_flow|637|0|1037|0|{0|}400|367|}
{2010601001|XXGgraph_vertex_vertex|638|0|1038|0|{Testing|}353|401|}
{2010605001|XXGgraph_legend_legend|639|0|1040|0|{0|}401|402|}
{2010241001|XXGlegend_face_face|640|0|1042|0|{}402|403|}
{2010604001|XXGgraph_flow_flow|641|0|1044|0|{Flow_1|}401|404|}
{2010604001|XXGgraph_flow_flow|642|0|1046|0|{Flow_8|}401|405|}
{2010601001|XXGgraph_vertex_vertex|643|0|1048|0|{Create|}401|406|}
{2010212001|XXGvertex_oport_oport|644|0|1050|0|{0|out|}406|407|}
{2010213001|XXGoport_dst_flow|645|0|1052|0|{0|}407|405|}
{2010212001|XXGvertex_oport_oport|646|0|1053|0|{1|error|}406|408|}
{2010212001|XXGvertex_oport_oport|647|0|1055|0|{2|log|}406|409|}
{2010601001|XXGgraph_vertex_vertex|648|0|1057|0|{Dups|}401|410|}
{2010211001|XXGvertex_iport_iport|649|0|1059|0|{0|write|}410|411|}
{2010601001|XXGgraph_vertex_vertex|650|0|1061|0|{Merge|}401|412|}
{2010212001|XXGvertex_oport_oport|651|0|1063|0|{0|out|}412|413|}
{2010213001|XXGoport_dst_flow|652|0|1065|0|{0|}413|404|}
{2010211001|XXGvertex_iport_iport|653|0|1066|0|{0|in|}412|414|}
{2010601001|XXGgraph_vertex_vertex|654|0|1068|0|{Partition_by_Round_robin|}401|415|}
{2010212001|XXGvertex_oport_oport|655|0|1070|0|{0|out|}415|416|}
{2010211001|XXGvertex_iport_iport|656|0|1072|0|{0|in|}415|417|}
{2010214001|XXGiport_src_flow|657|0|1074|0|{0|}417|405|}
{2010601001|XXGgraph_vertex_vertex|658|0|1075|0|{stdout|}401|418|}
{2010211001|XXGvertex_iport_iport|659|0|1077|0|{0|write|}418|419|}
{2010214001|XXGiport_src_flow|660|0|1079|0|{0|}419|404|}
{2010212001|XXGvertex_oport_oport|661|0|1080|0|{0|out|}401|420|}
{2010216002|XXGoport_binding_oport|662|0|1082|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}420|416|}
{2010211001|XXGvertex_iport_iport|663|0|1083|0|{0|in0|}401|421|}
{2010215002|XXGiport_binding_iport|664|0|1085|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}421|414|}
{2010211001|XXGvertex_iport_iport|665|0|1086|0|{1|in1|}401|422|}
{2010215002|XXGiport_binding_iport|666|0|1088|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}422|411|}
{2010212001|XXGvertex_oport_oport|667|0|1089|0|{0|out|}353|423|}
{2010216002|XXGoport_binding_oport|668|0|1091|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}423|381|}
{2010213001|XXGoport_dst_flow|669|0|1092|0|{0|}423|335|}
{2010213001|XXGoport_dst_flow|670|0|1093|0|{1|}423|338|}
{2010212001|XXGvertex_oport_oport|671|0|1094|0|{1|dups|}353|424|}
{2010216002|XXGoport_binding_oport|672|0|1096|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}424|372|}
{2010213001|XXGoport_dst_flow|673|0|1097|0|{0|}424|336|}
{2010211001|XXGvertex_iport_iport|674|0|1098|0|{0|in|}353|425|}
{2010215002|XXGiport_binding_iport|675|0|1100|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}425|379|}
{2010214001|XXGiport_src_flow|676|0|1101|0|{0|}425|333|}
{2010007001|XXGobject_proto_object|677|0|1102|0|{}353|426|}
{2010605001|XXGgraph_legend_legend|678|0|1104|0|{0|}426|427|}
{2010241001|XXGlegend_face_face|679|0|1106|0|{}427|428|}
{2010605001|XXGgraph_legend_legend|680|0|1108|0|{1|}426|429|}
{2010241001|XXGlegend_face_face|681|0|1110|0|{}429|430|}
{2010605001|XXGgraph_legend_legend|682|0|1112|0|{2|}426|431|}
{2010241001|XXGlegend_face_face|683|0|1114|0|{}431|432|}
{2010605001|XXGgraph_legend_legend|684|0|1116|0|{3|}426|433|}
{2010241001|XXGlegend_face_face|685|0|1118|0|{}433|434|}
{2010605001|XXGgraph_legend_legend|686|0|1120|0|{4|}426|435|}
{2010241001|XXGlegend_face_face|687|0|1122|0|{}435|436|}
{2010604001|XXGgraph_flow_flow|688|0|1124|0|{Flow_1|}426|437|}
{2010604001|XXGgraph_flow_flow|689|0|1126|0|{Flow_2|}426|438|}
{2010604001|XXGgraph_flow_flow|690|0|1128|0|{Flow_3|}426|439|}
{2010604001|XXGgraph_flow_flow|691|0|1130|0|{Flow_4|}426|440|}
{2010604001|XXGgraph_flow_flow|692|0|1132|0|{Flow_6|}426|441|}
{2010604001|XXGgraph_flow_flow|693|0|1134|0|{Flow_7|}426|442|}
{2010601001|XXGgraph_vertex_vertex|694|0|1136|0|{Dedup_by_NK_Eff_Date|}426|443|}
{2010212001|XXGvertex_oport_oport|695|0|1138|0|{0|out|}443|444|}
{2010213001|XXGoport_dst_flow|696|0|1140|0|{0|}444|439|}
{2010212001|XXGvertex_oport_oport|697|0|1141|0|{1|dup|}443|445|}
{2010212001|XXGvertex_oport_oport|698|0|1143|0|{2|reject|}443|446|}
{2010212001|XXGvertex_oport_oport|699|0|1145|0|{3|error|}443|447|}
{2010212001|XXGvertex_oport_oport|700|0|1147|0|{4|log|}443|448|}
{2010211001|XXGvertex_iport_iport|701|0|1149|0|{0|in|}443|449|}
{2010214001|XXGiport_src_flow|702|0|1151|0|{0|}449|437|}
{2010007001|XXGobject_proto_object|703|0|1152|0|{}443|450|}
{2010212001|XXGvertex_oport_oport|704|0|1154|0|{0|out|}450|451|}
{2010006001|XXGobject_psameas_object|705|0|1156|0|{metadata|out_metadata|1|0|}451|450|}
{2010212001|XXGvertex_oport_oport|706|0|1157|0|{1|dup|}450|452|}
{2010006001|XXGobject_psameas_object|707|0|1159|0|{metadata|dup_metadata|1|0|}452|450|}
{2010212001|XXGvertex_oport_oport|708|0|1160|0|{2|reject|}450|453|}
{2010006001|XXGobject_psameas_object|709|0|1162|0|{metadata|reject_metadata|1|0|}453|450|}
{2010212001|XXGvertex_oport_oport|710|0|1163|0|{3|error|}450|454|}
{2010006001|XXGobject_psameas_object|711|0|1165|0|{metadata|error_metadata|1|0|}454|450|}
{2010212001|XXGvertex_oport_oport|712|0|1166|0|{4|log|}450|455|}
{2010006001|XXGobject_psameas_object|713|0|1168|0|{metadata|log_metadata|1|0|}455|450|}
{2010211001|XXGvertex_iport_iport|714|0|1169|0|{0|in|}450|456|}
{2010006001|XXGobject_psameas_object|715|0|1171|0|{metadata|in_metadata|1|0|}456|450|}
{2010601001|XXGgraph_vertex_vertex|716|0|1172|0|{Parition_by_Related_or_NK|}426|457|}
{2010212001|XXGvertex_oport_oport|717|0|1174|0|{0|out|}457|458|}
{2010213001|XXGoport_dst_flow|718|0|1176|0|{0|}458|438|}
{2010211001|XXGvertex_iport_iport|719|0|1177|0|{0|in|}457|459|}
{2010007001|XXGobject_proto_object|720|0|1179|0|{}457|460|}
{2010212001|XXGvertex_oport_oport|721|0|1181|0|{0|out|}460|461|}
{2010006001|XXGobject_psameas_object|722|0|1183|0|{metadata|out_metadata|1|0|}461|460|}
{2010211001|XXGvertex_iport_iport|723|0|1184|0|{0|in|}460|462|}
{2010006001|XXGobject_psameas_object|724|0|1186|0|{metadata|in_metadata|1|0|}462|460|}
{2010006001|XXGobject_psameas_object|725|0|1187|0|{in_metadata|INPUT_DML|1|0|}457|426|}
{2010601001|XXGgraph_vertex_vertex|726|0|1188|0|{Replicate|}426|463|}
{2010212001|XXGvertex_oport_oport|727|0|1190|0|{0|out|}463|464|}
{2010211001|XXGvertex_iport_iport|728|0|1192|0|{0|in|}463|465|}
{2010214001|XXGiport_src_flow|729|0|1194|0|{0|}465|442|}
{2010007001|XXGobject_proto_object|730|0|1195|0|{}463|466|}
{2010212001|XXGvertex_oport_oport|731|0|1197|0|{0|out|}466|467|}
{2010006001|XXGobject_psameas_object|732|0|1199|0|{metadata|out_metadata|1|0|}467|466|}
{2010211001|XXGvertex_iport_iport|733|0|1200|0|{0|in|}466|468|}
{2010006001|XXGobject_psameas_object|734|0|1202|0|{metadata|in_metadata|1|0|}468|466|}
{2010601001|XXGgraph_vertex_vertex|735|0|1203|0|{Rollup_Adjoining_Eff_Dates|}426|469|}
{2010212001|XXGvertex_oport_oport|736|0|1205|0|{0|out|}469|470|}
{2010213001|XXGoport_dst_flow|737|0|1207|0|{0|}470|442|}
{2010212001|XXGvertex_oport_oport|738|0|1208|0|{1|reject|}469|471|}
{2010212001|XXGvertex_oport_oport|739|0|1210|0|{2|error|}469|472|}
{2010212001|XXGvertex_oport_oport|740|0|1212|0|{3|log|}469|473|}
{2010211001|XXGvertex_iport_iport|741|0|1214|0|{0|in|}469|474|}
{2010214001|XXGiport_src_flow|742|0|1216|0|{0|}474|441|}
{2010007001|XXGobject_proto_object|743|0|1217|0|{}469|475|}
{2010212001|XXGvertex_oport_oport|744|0|1219|0|{0|out|}475|476|}
{2010006001|XXGobject_psameas_object|745|0|1221|0|{metadata|out_metadata|1|0|}476|475|}
{2010212001|XXGvertex_oport_oport|746|0|1222|0|{1|reject|}475|477|}
{2010006001|XXGobject_psameas_object|747|0|1224|0|{metadata|reject_metadata|1|0|}477|475|}
{2010212001|XXGvertex_oport_oport|748|0|1225|0|{2|error|}475|478|}
{2010006001|XXGobject_psameas_object|749|0|1227|0|{metadata|error_metadata|1|0|}478|475|}
{2010212001|XXGvertex_oport_oport|750|0|1228|0|{3|log|}475|479|}
{2010006001|XXGobject_psameas_object|751|0|1230|0|{metadata|log_metadata|1|0|}479|475|}
{2010211001|XXGvertex_iport_iport|752|0|1231|0|{0|in|}475|480|}
{2010006001|XXGobject_psameas_object|753|0|1233|0|{metadata|in_metadata|1|0|}480|475|}
{2010601001|XXGgraph_vertex_vertex|754|0|1234|0|{Scan_to_Fix_Overlapping_Dates|}426|481|}
{2010212001|XXGvertex_oport_oport|755|0|1236|0|{0|out|}481|482|}
{2010213001|XXGoport_dst_flow|756|0|1238|0|{0|}482|440|}
{2010212001|XXGvertex_oport_oport|757|0|1239|0|{1|reject|}481|483|}
{2010212001|XXGvertex_oport_oport|758|0|1241|0|{2|error|}481|484|}
{2010212001|XXGvertex_oport_oport|759|0|1243|0|{3|log|}481|485|}
{2010211001|XXGvertex_iport_iport|760|0|1245|0|{0|in|}481|486|}
{2010214001|XXGiport_src_flow|761|0|1247|0|{0|}486|439|}
{2010007001|XXGobject_proto_object|762|0|1248|0|{}481|487|}
{2010212001|XXGvertex_oport_oport|763|0|1250|0|{0|out|}487|488|}
{2010006001|XXGobject_psameas_object|764|0|1252|0|{metadata|out_metadata|1|0|}488|487|}
{2010212001|XXGvertex_oport_oport|765|0|1253|0|{1|reject|}487|489|}
{2010006001|XXGobject_psameas_object|766|0|1255|0|{metadata|reject_metadata|1|0|}489|487|}
{2010212001|XXGvertex_oport_oport|767|0|1256|0|{2|error|}487|490|}
{2010006001|XXGobject_psameas_object|768|0|1258|0|{metadata|error_metadata|1|0|}490|487|}
{2010212001|XXGvertex_oport_oport|769|0|1259|0|{3|log|}487|491|}
{2010006001|XXGobject_psameas_object|770|0|1261|0|{metadata|log_metadata|1|0|}491|487|}
{2010211001|XXGvertex_iport_iport|771|0|1262|0|{0|in|}487|492|}
{2010006001|XXGobject_psameas_object|772|0|1264|0|{metadata|in_metadata|1|0|}492|487|}
{2010601001|XXGgraph_vertex_vertex|773|0|1265|0|{Sort_for_Dedup|}426|493|}
{2010212001|XXGvertex_oport_oport|774|0|1267|0|{0|out|}493|494|}
{2010213001|XXGoport_dst_flow|775|0|1269|0|{0|}494|437|}
{2010211001|XXGvertex_iport_iport|776|0|1270|0|{0|in|}493|495|}
{2010214001|XXGiport_src_flow|777|0|1272|0|{0|}495|438|}
{2010007001|XXGobject_proto_object|778|0|1273|0|{}493|496|}
{2010212001|XXGvertex_oport_oport|779|0|1275|0|{0|out|}496|497|}
{2010006001|XXGobject_psameas_object|780|0|1277|0|{metadata|out_metadata|1|0|}497|496|}
{2010211001|XXGvertex_iport_iport|781|0|1278|0|{0|in|}496|498|}
{2010006001|XXGobject_psameas_object|782|0|1280|0|{metadata|in_metadata|1|0|}498|496|}
{2010601001|XXGgraph_vertex_vertex|783|0|1281|0|{Sort_within_NK_by_Eff_Dt_End_Dt|}426|499|}
{2010212001|XXGvertex_oport_oport|784|0|1283|0|{0|out|}499|500|}
{2010213001|XXGoport_dst_flow|785|0|1285|0|{0|}500|441|}
{2010211001|XXGvertex_iport_iport|786|0|1286|0|{0|in|}499|501|}
{2010214001|XXGiport_src_flow|787|0|1288|0|{0|}501|440|}
{2010007001|XXGobject_proto_object|788|0|1289|0|{}499|502|}
{2010212001|XXGvertex_oport_oport|789|0|1291|0|{0|out|}502|503|}
{2010006001|XXGobject_psameas_object|790|0|1293|0|{metadata|out_metadata|1|0|}503|502|}
{2010211001|XXGvertex_iport_iport|791|0|1294|0|{0|in|}502|504|}
{2010006001|XXGobject_psameas_object|792|0|1296|0|{metadata|in_metadata|1|0|}504|502|}
{2010601001|XXGgraph_vertex_vertex|793|0|1297|0|{Testing|}426|505|}
{2010605001|XXGgraph_legend_legend|794|0|1299|0|{0|}505|506|}
{2010241001|XXGlegend_face_face|795|0|1301|0|{}506|507|}
{2010604001|XXGgraph_flow_flow|796|0|1303|0|{Flow_1|}505|508|}
{2010604001|XXGgraph_flow_flow|797|0|1305|0|{Flow_8|}505|509|}
{2010601001|XXGgraph_vertex_vertex|798|0|1307|0|{Create|}505|510|}
{2010212001|XXGvertex_oport_oport|799|0|1309|0|{0|out|}510|511|}
{2010213001|XXGoport_dst_flow|800|0|1311|0|{0|}511|509|}
{2010212001|XXGvertex_oport_oport|801|0|1312|0|{1|error|}510|512|}
{2010212001|XXGvertex_oport_oport|802|0|1314|0|{2|log|}510|513|}
{2010007001|XXGobject_proto_object|803|0|1316|0|{}510|514|}
{2010212001|XXGvertex_oport_oport|804|0|1318|0|{0|out|}514|515|}
{2010006001|XXGobject_psameas_object|805|0|1320|0|{metadata|out_metadata|1|0|}515|514|}
{2010212001|XXGvertex_oport_oport|806|0|1321|0|{1|error|}514|516|}
{2010006001|XXGobject_psameas_object|807|0|1323|0|{metadata|error_metadata|1|0|}516|514|}
{2010212001|XXGvertex_oport_oport|808|0|1324|0|{2|log|}514|517|}
{2010006001|XXGobject_psameas_object|809|0|1326|0|{metadata|log_metadata|1|0|}517|514|}
{2010601001|XXGgraph_vertex_vertex|810|0|1327|0|{Dups|}505|518|}
{2010211001|XXGvertex_iport_iport|811|0|1329|0|{0|write|}518|519|}
{2010007001|XXGobject_proto_object|812|0|1331|0|{}518|520|}
{2010211001|XXGvertex_iport_iport|813|0|1333|0|{0|write|}520|521|}
{2010006001|XXGobject_psameas_object|814|0|1335|0|{metadata|write_metadata|1|0|}521|520|}
{2010601001|XXGgraph_vertex_vertex|815|0|1336|0|{Merge|}505|522|}
{2010212001|XXGvertex_oport_oport|816|0|1338|0|{0|out|}522|523|}
{2010213001|XXGoport_dst_flow|817|0|1340|0|{0|}523|508|}
{2010211001|XXGvertex_iport_iport|818|0|1341|0|{0|in|}522|524|}
{2010007001|XXGobject_proto_object|819|0|1343|0|{}522|525|}
{2010212001|XXGvertex_oport_oport|820|0|1345|0|{0|out|}525|526|}
{2010006001|XXGobject_psameas_object|821|0|1347|0|{metadata|out_metadata|1|0|}526|525|}
{2010211001|XXGvertex_iport_iport|822|0|1348|0|{0|in|}525|527|}
{2010006001|XXGobject_psameas_object|823|0|1350|0|{metadata|in_metadata|1|0|}527|525|}
{2010601001|XXGgraph_vertex_vertex|824|0|1351|0|{Partition_by_Round_robin|}505|528|}
{2010212001|XXGvertex_oport_oport|825|0|1353|0|{0|out|}528|529|}
{2010211001|XXGvertex_iport_iport|826|0|1355|0|{0|in|}528|530|}
{2010214001|XXGiport_src_flow|827|0|1357|0|{0|}530|509|}
{2010007001|XXGobject_proto_object|828|0|1358|0|{}528|531|}
{2010212001|XXGvertex_oport_oport|829|0|1360|0|{0|out|}531|532|}
{2010006001|XXGobject_psameas_object|830|0|1362|0|{metadata|out_metadata|1|0|}532|531|}
{2010211001|XXGvertex_iport_iport|831|0|1363|0|{0|in|}531|533|}
{2010006001|XXGobject_psameas_object|832|0|1365|0|{metadata|in_metadata|1|0|}533|531|}
{2010601001|XXGgraph_vertex_vertex|833|0|1366|0|{stdout|}505|534|}
{2010211001|XXGvertex_iport_iport|834|0|1368|0|{0|write|}534|535|}
{2010214001|XXGiport_src_flow|835|0|1370|0|{0|}535|508|}
{2010007001|XXGobject_proto_object|836|0|1371|0|{}534|536|}
{2010211001|XXGvertex_iport_iport|837|0|1373|0|{0|write|}536|537|}
{2010006001|XXGobject_psameas_object|838|0|1375|0|{metadata|write_metadata|1|0|}537|536|}
{2010212001|XXGvertex_oport_oport|839|0|1376|0|{0|out|}505|538|}
{2010216002|XXGoport_binding_oport|840|0|1378|0|{.5|.5|{10|242000|104000|262000|104000|262000|124000|39000|124000|19000|124000|}6786|}538|529|}
{2010211001|XXGvertex_iport_iport|841|0|1379|0|{0|in0|}505|539|}
{2010215002|XXGiport_binding_iport|842|0|1381|0|{.5|.5|{10|322000|179000|302000|179000|302000|124000|820000|124000|840000|124000|}6784|}539|524|}
{2010211001|XXGvertex_iport_iport|843|0|1382|0|{1|in1|}505|540|}
{2010215002|XXGiport_binding_iport|844|0|1384|0|{.5|.5|{12|429000|60000|429000|40000|429000|40000|429000|42000|429000|42000|429000|22000|}6785|}540|519|}
{2010212001|XXGvertex_oport_oport|845|0|1385|0|{0|out|}426|541|}
{2010216002|XXGoport_binding_oport|846|0|1387|0|{.5|.5|{8|847000|284000|867000|284000|881000|284000|901000|284000|}6801|}541|464|}
{2010212001|XXGvertex_oport_oport|847|0|1388|0|{1|dups|}426|542|}
{2010216002|XXGoport_binding_oport|848|0|1390|0|{.5|.5|{10|251000|299000|271000|299000|459000|299000|459000|531000|459000|551000|}6802|}542|445|}
{2010211001|XXGvertex_iport_iport|849|0|1391|0|{0|in|}426|543|}
{2010215002|XXGiport_binding_iport|850|0|1393|0|{.5|.5|{12|59000|124000|39000|124000|39000|124000|39000|284000|38000|284000|18000|284000|}6800|}543|459|}
{2010006001|XXGobject_psameas_object|851|0|1394|0|{INPUT_DML|write_metadata|0|0|}353|544|}
{2010211001|XXGvertex_iport_iport|852|0|1396|0|{0|write|}544|545|}
{2010214001|XXGiport_src_flow|853|0|1398|0|{0|}545|336|}
{2010007001|XXGobject_proto_object|854|0|1399|0|{}544|546|}
{2010211001|XXGvertex_iport_iport|855|0|1401|0|{0|write|}546|547|}
{2010006001|XXGobject_psameas_object|856|0|1403|0|{metadata|write_metadata|1|0|}547|546|}
{2010601001|XXGgraph_vertex_vertex|857|0|1404|0|{Dups|}324|544|}
{2010601001|XXGgraph_vertex_vertex|858|0|1405|0|{Gather|}324|548|}
{2010212001|XXGvertex_oport_oport|859|0|1407|0|{0|out|}548|549|}
{2010213001|XXGoport_dst_flow|860|0|1409|0|{0|}549|340|}
{2010211001|XXGvertex_iport_iport|861|0|1410|0|{0|in|}548|550|}
{2010214001|XXGiport_src_flow|862|0|1412|0|{0|}550|338|}
{2010007001|XXGobject_proto_object|863|0|1413|0|{}548|551|}
{2010212001|XXGvertex_oport_oport|864|0|1415|0|{0|out|}551|552|}
{2010006001|XXGobject_psameas_object|865|0|1417|0|{metadata|out_metadata|1|0|}552|551|}
{2010211001|XXGvertex_iport_iport|866|0|1418|0|{0|in|}551|553|}
{2010006001|XXGobject_psameas_object|867|0|1420|0|{metadata|in_metadata|1|0|}553|551|}
{2010601001|XXGgraph_vertex_vertex|868|0|1421|0|{Gather_|}324|554|}
{2010212001|XXGvertex_oport_oport|869|0|1423|0|{0|out|}554|555|}
{2010211001|XXGvertex_iport_iport|870|0|1425|0|{0|in|}554|556|}
{2010214001|XXGiport_src_flow|871|0|1427|0|{0|}556|337|}
{2010214001|XXGiport_src_flow|872|0|1428|0|{1|}556|340|}
{2010007001|XXGobject_proto_object|873|0|1429|0|{}554|557|}
{2010212001|XXGvertex_oport_oport|874|0|1431|0|{0|out|}557|558|}
{2010006001|XXGobject_psameas_object|875|0|1433|0|{metadata|out_metadata|1|0|}558|557|}
{2010211001|XXGvertex_iport_iport|876|0|1434|0|{0|in|}557|559|}
{2010006001|XXGobject_psameas_object|877|0|1436|0|{metadata|in_metadata|1|0|}559|557|}
{2010601001|XXGgraph_vertex_vertex|878|0|1437|0|{Map_to_Output|}324|560|}
{2010212001|XXGvertex_oport_oport|879|0|1439|0|{0|source|}560|561|}
{2010213001|XXGoport_dst_flow|880|0|1441|0|{0|}561|339|}
{2010212001|XXGvertex_oport_oport|881|0|1442|0|{1|clean|}560|562|}
{2010213001|XXGoport_dst_flow|882|0|1444|0|{0|}562|334|}
{2010212001|XXGvertex_oport_oport|883|0|1445|0|{2|lkp|}560|563|}
{2010213001|XXGoport_dst_flow|884|0|1447|0|{0|}563|333|}
{2010212001|XXGvertex_oport_oport|885|0|1448|0|{3|reject0|}560|564|}
{2010212001|XXGvertex_oport_oport|886|0|1450|0|{4|reject1|}560|565|}
{2010212001|XXGvertex_oport_oport|887|0|1452|0|{5|reject2|}560|566|}
{2010212001|XXGvertex_oport_oport|888|0|1454|0|{6|error0|}560|567|}
{2010212001|XXGvertex_oport_oport|889|0|1456|0|{7|error1|}560|568|}
{2010212001|XXGvertex_oport_oport|890|0|1458|0|{8|error2|}560|569|}
{2010212001|XXGvertex_oport_oport|891|0|1460|0|{9|log|}560|570|}
{2010211001|XXGvertex_iport_iport|892|0|1462|0|{0|in|}560|571|}
{2010007001|XXGobject_proto_object|893|0|1464|0|{}560|572|}
{2010212001|XXGvertex_oport_oport|894|0|1466|0|{0|source|}572|573|}
{2010006001|XXGobject_psameas_object|895|0|1468|0|{metadata|out0_metadata|1|0|}573|572|}
{2010006001|XXGobject_psameas_object|896|0|1469|0|{transform0|transform0|1|0|}573|572|}
{2010212001|XXGvertex_oport_oport|897|0|1470|0|{1|clean|}572|574|}
{2010006001|XXGobject_psameas_object|898|0|1472|0|{metadata|out1_metadata|1|0|}574|572|}
{2010006001|XXGobject_psameas_object|899|0|1473|0|{transform1|transform1|1|0|}574|572|}
{2010212001|XXGvertex_oport_oport|900|0|1474|0|{2|lkp|}572|575|}
{2010006001|XXGobject_psameas_object|901|0|1476|0|{metadata|out2_metadata|1|0|}575|572|}
{2010006001|XXGobject_psameas_object|902|0|1477|0|{transform2|transform2|1|0|}575|572|}
{2010212001|XXGvertex_oport_oport|903|0|1478|0|{3|reject0|}572|576|}
{2010006001|XXGobject_psameas_object|904|0|1480|0|{metadata|reject0_metadata|1|0|}576|572|}
{2010212001|XXGvertex_oport_oport|905|0|1481|0|{4|reject1|}572|577|}
{2010006001|XXGobject_psameas_object|906|0|1483|0|{metadata|reject1_metadata|1|0|}577|572|}
{2010212001|XXGvertex_oport_oport|907|0|1484|0|{5|reject2|}572|578|}
{2010006001|XXGobject_psameas_object|908|0|1486|0|{metadata|reject2_metadata|1|0|}578|572|}
{2010212001|XXGvertex_oport_oport|909|0|1487|0|{6|error0|}572|579|}
{2010006001|XXGobject_psameas_object|910|0|1489|0|{metadata|error0_metadata|1|0|}579|572|}
{2010212001|XXGvertex_oport_oport|911|0|1490|0|{7|error1|}572|580|}
{2010006001|XXGobject_psameas_object|912|0|1492|0|{metadata|error1_metadata|1|0|}580|572|}
{2010212001|XXGvertex_oport_oport|913|0|1493|0|{8|error2|}572|581|}
{2010006001|XXGobject_psameas_object|914|0|1495|0|{metadata|error2_metadata|1|0|}581|572|}
{2010212001|XXGvertex_oport_oport|915|0|1496|0|{9|log|}572|582|}
{2010006001|XXGobject_psameas_object|916|0|1498|0|{metadata|log_metadata|1|0|}582|572|}
{2010211001|XXGvertex_iport_iport|917|0|1499|0|{0|in|}572|583|}
{2010006001|XXGobject_psameas_object|918|0|1501|0|{metadata|in_metadata|1|0|}583|572|}
{2010601001|XXGgraph_vertex_vertex|919|0|1502|0|{Merge|}324|584|}
{2010212001|XXGvertex_oport_oport|920|0|1504|0|{0|out|}584|585|}
{2010213001|XXGoport_dst_flow|921|0|1506|0|{0|}585|337|}
{2010211001|XXGvertex_iport_iport|922|0|1507|0|{0|in|}584|586|}
{2010214001|XXGiport_src_flow|923|0|1509|0|{0|}586|335|}
{2010007001|XXGobject_proto_object|924|0|1510|0|{}584|587|}
{2010212001|XXGvertex_oport_oport|925|0|1512|0|{0|out|}587|588|}
{2010006001|XXGobject_psameas_object|926|0|1514|0|{metadata|out_metadata|1|0|}588|587|}
{2010211001|XXGvertex_iport_iport|927|0|1515|0|{0|in|}587|589|}
{2010006001|XXGobject_psameas_object|928|0|1517|0|{metadata|in_metadata|1|0|}589|587|}
{2010212001|XXGvertex_oport_oport|929|0|1518|0|{0|source|}324|590|}
{2010216002|XXGoport_binding_oport|930|0|1520|0|{.5|1.0|{8|840000|104000|860000|104000|890000|104000|910000|104000|}9906|}590|342|}
{2010212001|XXGvertex_oport_oport|931|0|1521|0|{1|clean|}324|591|}
{2010216002|XXGoport_binding_oport|932|0|1523|0|{.5|1.0|{12|835000|229000|855000|229000|890000|229000|890000|269000|890000|269000|910000|269000|}9907|}591|348|}
{2010212001|XXGvertex_oport_oport|933|0|1524|0|{2|lookup|}324|592|}
{2010216002|XXGoport_binding_oport|934|0|1526|0|{.5|.5|{12|862000|384000|882000|384000|886000|384000|886000|439000|890000|439000|910000|439000|}9908|}592|555|}
{2010211001|XXGvertex_iport_iport|935|0|1527|0|{0|in0|}324|593|}
{2010215002|XXGiport_binding_iport|936|0|1529|0|{.5|.5|{12|67000|229000|47000|229000|43000|229000|43000|269000|39000|269000|19000|269000|}9905|}593|571|}
{2010109001|XXGobject_property_value|937|0|1530|0|{0|TrackingThumbprint|72|}1|594|}
