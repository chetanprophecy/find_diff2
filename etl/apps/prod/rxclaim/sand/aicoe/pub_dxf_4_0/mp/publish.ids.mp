@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|503|rel_count|918|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_CATALOG|@3|9|EFK|@{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "~$PUB_DXF_XFR/event/event_registration.xfr";
include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|9|RK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EFF_DATE|$[ (date("YYYY-MM-DD"))(today() - 1) ]|3|9|REFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|RUN_DTTM|$[ (datetime("YYYYMMDDHH24MISS")) now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|DATA_MART_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|DATASET_FULL_OR_DELTA|FULL|15|9|EFK|@{2|FULL|DELTA|}}
{30001002|XXparameter|SUBJECT_AREA|orca_rebates|3|9|FK|@{0|}}
{30001002|XXparameter|DATASET_ID_LOOKUP_PATH|$AI_SERIAL_LOOKUP/lookup.dataset_id.txt|3|9|FK||{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|SOURCE_NAME|\{SYSTEM\}.\{SOURCE\}  // This must be set appropriately in the private pset.|3|9|RFK|The fully qualified "logical" name of the source dataset.  One period (.) is expected.|{0|}}
{30001002|XXparameter|SOURCE_LOWER|$[ string_downcase(SOURCE_NAME) ]|3|9|RK|The source name, downcased to avoid problems with case-insensitive file systems, such as Windows.|{0|}}
{30001002|XXparameter|SOURCE_SYSTEM|$[ re_replace(SOURCE_LOWER, "[.].*", "") ]|3|9|RFK|The name for the system providing this data source.  Defaults to a value based on the source name's prefix.  This is an Input parameter so that its value can be referenced in the intermediate pset.|{0|}}
{30001002|XXparameter|SOURCE|$[ string_split( SOURCE_LOWER, ".") [1]]|3|9|FK|@{0|}}
{30001002|XXparameter|SOURCE_FILE_PATTERN|$[ string_concat( SOURCE, '.??????????????.dat.gz')]|3|9|FK|@{0|}}
{30001002|XXparameter|IDS_PROPERTIES|$[ get_ids_table_properties( SOURCE_SYSTEM + "." + re_replace( re_replace( re_replace( string_replace( string_replace( SOURCE_FILE_PATTERN, "*", ""), "?", ""), "[.][a-zA-Z0-9]*", ""), "_$", ""), "_$", ""))]|3|9|K|@{0|}}
{30001002|XXparameter|DATASET_TYPE|$[if( not is_blank( IDS_PROPERTIES.table_type)) string_upcase( IDS_PROPERTIES.table_type) else force_error( "Entry not present in ids_table_properties file");]|3|9|K|@{0|}}
{30001002|XXparameter|IDS_DATA_PATH|$[ 
if ( DATASET_TYPE == "FACT") 
        string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/many")
else 
        string_concat(PUB_DATAHUB_MFS_LOOKUP,"/ids/" ,SOURCE_SYSTEM,"/one") 
]|3|9|RFK|Data path where IDS files will be written|{0|}}
{30001002|XXparameter|SOURCE_FILE_TYPE|SERIAL|15|9|FK|Whether the Output is Serial or MFS|{2|MFS|SERIAL|}}
{30001002|XXparameter|LATEST_DATA_TMSTMP|$[ AI_SERIAL_TEMP + '/consumption_log/latest.combine.consumption_log.' + DATA_MART_NAME + '.' + SOURCE + '.lkp']|3|9|REFK|@{0|}}
{30001002|XXparameter|LATEST_DATA_TMSTMP_UTC|AB_PARAMETER_ENV|3|10|FKd|UTC COnverted LATEST_DATA_TMSTMP|{0|}}
{30001002|XXparameter|SOURCE_FILE_LIST_VEC|AB_PARAMETER_ENV|3|10|FKd|@{0|}}
{30001002|XXparameter|GET_DML_FILE|$[ PUB_DATAHUB_DML + "/" + SOURCE_SYSTEM + "/" + SOURCE_SYSTEM + "." + re_replace( re_replace( re_replace( string_replace( string_replace( SOURCE_FILE_PATTERN, "*", ""), "?", ""), "[.][a-zA-Z0-9]*", ""), "_$", ""), "_$", "") + ".dml" ]|3|9|FK|Path to the record format for the source data. Defaults to a file name based on the source name.|{0|}}
{30001002|XXparameter|GET_DML|$[ if( DATASET_FULL_OR_DELTA == "DELTA") join_types( "record\\n string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete\\n end", expand_type( read_type( GET_DML_FILE))) else expand_type( read_type( GET_DML_FILE))]|3|9|RK|The record format for the source data.|{0|}}
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
{30001002|XXparameter|DO_SOURCE|1|13|9|RFK|0 or 1: Whether or not to produce the source file.  Defaults to 1 (True).|{0|}}
{30001002|XXparameter|DO_CTRL|1|13|9|RFK|0 or 1: Whether or not to produce a clean file.  Defaults to 0 (False).|{0|}}
{30001002|XXparameter|SOURCE_FILE_URL|$[ if ( not DO_SOURCE ) "" else "mfile:" + AI_MFS + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|RFK|Optional: Used by the ACE to view the source file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|CTRL_FILE_URL|$[ if ( not DO_CTRL ) "" else "mfile:" + AI_MFS + "/clean." + SOURCE_SYSTEM + "/clean." + SOURCE_LOWER + "." + RUN_ID + ".dat.gz" ]|3|9|FK|Optional: Used by the ACE to view the clean file, if any.  Will be empty if none.|{0|}}
{30001002|XXparameter|SOURCE_DML_FILE|$[ if ( not DO_SOURCE ) "" else AI_DML + "/source." + SOURCE_SYSTEM + "/source." + SOURCE_LOWER + ".dml" ]|3|9|RFK|The DML file to use for the "source" results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|CTRL_DML_FILE|$PUB_DXF_DML/ids/cpp_inbound_control_file.dml|3|9|FK|The DML file to use for the results.  Also used by the ACE to update that DML file.  If not used, then this will be empty.|{0|}}
{30001002|XXparameter|SOURCE_DML|$[ if ( not DO_SOURCE ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the source file.  Defaults to the input DML, plus a DMF header.|{0|}}
{30001002|XXparameter|CTRL_DML|$[ if ( not DO_CTRL ) "" else GET_DML_PLUS_HEADER ]|3|9|FK|The record format of the output file.  Defaults to the input DML, plus a DMF header.|{0|}}
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
{30001002|XXparameter|___NORMALIZE_Parameters___||3|9|K|@{0|}}
{30001002|XXparameter|NORMALIZE_XFR|$PUB_DXF_XFR/ids/publish_ids_nrmlz_default.xfr|3|9|RFK|@{0|}}
{30001002|XXparameter|___CTRL_Rollup_Parameters___||3|9|K|@{0|}}
{30001002|XXparameter|CTRL_RLLP_XFR|$[ PUB_DXF_XFR + '/ids/publish_ids_ctrl_rllp.xfr']|3|9|RFK|@{0|}}
{30001002|XXparameter|CTRL_RLLP_KEY|\{\}|3|9|RFK|@{0|}}
{30001002|XXparameter|___Audit_Parameters___||3|9|K|@{0|}}
{30001002|XXparameter|ETL_APP_USER|AB_PARAMETER_ENV|3|10|RFKd|@{0|}}
{30001002|XXparameter|___Filter_Control_Info_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|FLTR_CTRL_INFO_SEL|event_type == "Control File Info"|3|9|RFK|@{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_FILE|$[ AI_SERIAL + '/consumption_log/consumption_log.' + DATA_MART_NAME + '.' + SOURCE + '.dat']|3|9|FK|Just for ready reference of the Combine Code. Need to Delete after dev is complete.|{0|}}
{30001002|XXparameter|INTERIM_EVENT_CONSUMPTION_FILE|$[ AI_SERIAL + '/consumption_log/interim_log.' + DATA_MART_NAME  + '.' + SOURCE + '.dat' ]|3|9|FK|@{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_DML|$PUB_DXF_DML/event/event_consumption_log.dml|3|9|FK|@{0|}}
{30001002|XXparameter|LATEST_EVENT_CONSUMPTION_ENTRY_FILE|$[ AI_SERIAL_TEMP + 'latest_consumption_log.cpp.' + SOURCE + '.dat']|3|9|FK|@{0|}}
{30001002|XXparameter|___Partition_And_Or_Sort_Parameters___||3|9|K|@{0|}}
{30001002|XXparameter|PARTITIONING_SCHEME|$[ if( length_of( multifile_information( IDS_DATA_PATH)) != length_of( SOURCE_FILE_URL)) "PBRR" else "NPNS"]|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY||3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY||3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|___Combine_Consumption_Log___||3|9|K|@{0|}}
{30001002|XXparameter|COMBINE_CONSUMPTION_FILE|$[ AI_SERIAL + '/consumption_log/combine.consumption_log.' + DATA_MART_NAME + '.' + SOURCE + '.dat']|3|9|FK|Just for ready reference of the Combine Code. Need to Delete after dev is complete.|{0|}}
{30001002|XXparameter|COMBINE_CONSUMPTION_DML|$PUB_DXF_DML/event/event_consumption_log.dml|3|9|FK|@{0|}}
{30001002|XXparameter|Comment__Dedup_Parameters___|#### Dedup Parameters ####|3|9|RK|@{0|}}
{30001002|XXparameter|DO_DEDUP|$[ if( DATASET_FULL_OR_DELTA == "FULL") 1 else 0]|13|9|RFK|Whether we need to dedup the input records - True for FULL Datasets|{0|}}
{30001002|XXparameter|USE_HASH_FOR_DEDUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEYS|$[ get_ids_table_nk( SOURCE_NAME)]|3|9|RFK|@{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
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
begin

//This code snippet identifies the files that need to be read :: files that were created later than LATEST_DATA_TMSTMP_UTC
let datetime("YYYYMMDDHH24MISS") _lst_read_combine_tmstmp = LATEST_DATA_TMSTMP_UTC;
let string("")[int] _files_to_be_read_vec = [vector];

for (let string("") line in directory_listing( IDS_DATA_PATH, SOURCE_FILE_PATTERN))
begin

  if( datetime_from_unixtime( multifile_information( IDS_DATA_PATH + "/" + line).created) > _lst_read_combine_tmstmp)
  begin

    _files_to_be_read_vec = vector_append( _files_to_be_read_vec, IDS_DATA_PATH + "/" + line);
  end;
end

result :: _files_to_be_read_vec;

end
]|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_USER:eme|APP_ORCA_RXCLAIM|3|9||@{0|}}
{30001002|XXparameter|ETL_APP_USER:sandbox|$(whoami)|3|9||@{0|}}
{30001002|XXparameter|LATEST_DATA_TMSTMP_UTC:eme|00010101000000|3|9||@{0|}}
{30001002|XXparameter|LATEST_DATA_TMSTMP_UTC:sandbox|$( m_eval '(datetime("YYYYMMDDHH24MISS")) timezone_to_utc("America/Chicago", ((datetime("YYYYMMDDHH24MISS")) $LATEST_DATA_TMSTMP))' \| tr -d '"')|3|9||@{0|}}
{30001002|XXparameter|DEDUP_PBK_KEY|$NATURAL_KEYS|3|9|RFK|@{0|}}
{30001002|XXparameter|DEDUP_SORT_KEY|$[ string_concat( "\{", string_filter_out( NATURAL_KEYS, "\{\}"), ";ids_create_dttm;ids_updt_dttm\}")]|3|9|RFK|@{0|}}
{30001002|XXparameter|DEDUP_DEDUP_KEY|$DEDUP_PBK_KEY|3|9|RFK|@{0|}}
{30001002|XXparameter|DEDUP_KEEP_WHICH|last|15|9|RFK|Decides the record to be kept by the Dedup component : Last as Default value to keep the latest Updt_Dttm|{3|first|last|unique-only|}}
{30001002|XXparameter|___Data_Suppression___|@3|9|K|@{0|}}
{30001002|XXparameter|___Data_Suppression___.__copy_was_declaration|1|3|9|PH|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION.__copy_was_declaration|1|3|9|PH|@{0|}}
{30001002|XXparameter|OUTBOUND_FILTER_LKP_NAME|$[string_concat(AI_SERIAL_LOOKUP, "/", "filter_expression_outbound.dat")]|3|9|EFK|@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$[begin

let string("") lookup_contents = if(file_information(OUTBOUND_FILTER_LKP_NAME).found) read_file(OUTBOUND_FILTER_LKP_NAME) else ""; 
result :: lookup_contents;

end]|3|9|K|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|extract|Anwar.Parvez|@1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2268000|765000|7|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{3|1|1|1|}Job 'publish.ids' Execution Status Report


Job "publish.ids" Execution started at Thursday, May 24, 2018 12:53:47
Job completed successfully at Thursday, May 24, 2018 12:53:59

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:00:12
Run performed by user Anwar.Parvez
Total data moved through all flows: 0 records (0 bytes)
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
{2010705002|XXGrunsettings|3|0|5|0|{@{}@IDW PLM Dev 1 4.0||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial|0|160|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@SOURCE_NAME - $SOURCE_NAME  |199000|43000|0|0|0|0|12121|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@For DELTA files only|1475000|150000|0|0|0|0|13004|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Sends out a control info
record to log port|922000|227000|0|0|0|0|13034|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|255|160|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Global outbound data
suppression|363000|233000|0|0|0|0|13197|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}13090|529|}}
{2010210004|XXGflow|14|0|27|0|{@{}@384|.04210526496171951|.09164969623088837|{12|754000|344000|754000|364000|754000|368000|643000|368000|643000|469000|664000|469000|}13069|17|}}
{2010210004|XXGflow|15|0|29|0|{@{}@384|.5|.5|{0|}13078|17|}}
{2010210004|XXGflow|16|0|31|0|{@{}@384|.5|.5|{8|791000|469000|811000|469000|840000|469000|861000|469000|}13070|17|}}
{2010210004|XXGflow|17|0|33|0|{@{}@384|.5|.5|{0|}13076|17|}}
{2010210004|XXGflow|18|0|35|0|{@{}@384|.5|.5|{0|}13198|529|}}
{2010210004|XXGflow|19|0|37|0|{@{}@0|.5|.5|{0|}13199|17|}}
{2010210004|XXGflow|20|0|39|0|{@{}@384|.5|.5|{0|}13087|529|}}
{2010210004|XXGflow|21|0|41|0|{@{}@0|.5|.5|{0|}13200|17|}}
{2010210004|XXGflow|22|0|43|0|{@{}@384|.5|.5|{0|}13083|2065|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}13082|17|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}13064|19|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}13061|531|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}12748|2065|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}13072|18|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}13074|17|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}13077|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}13080|17|}}
{2010600005|XXGgraph|31|0|61|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/optional_partitioning.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|PARTITIONING_SCHEME|$PARTITIONING_SCHEME|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@0|@1905500|475000|0|0|0|0|13203|Ctrl : Partition And/Or Sort|ajrambar.kad|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|1|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}12433|17|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}12439|17|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}12444|17|}}
{2010210004|XXGflow|38|0|75|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|39|0|77|0|{@{}@384|.5|.5|{0|}12438|20|}}
{2010210004|XXGflow|40|0|79|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|41|0|81|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|42|0|83|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Gather|495000|504000|0|0|0|0|12449|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|43|0|85|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|44|0|88|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|45|0|91|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_CTRL|3|9||@{0|}}
{30001002|XXparameter|Layout|$CTRL_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$CTRL_FILE_URL", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$CTRL_DML_FILE|3|2|f$|@{0|}}
}}@1|Output File|2175913|496047|671000|285000|56000|50000|13211|Optional: Ctrl|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|46|0|93|0|{@{}@661000|304000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|47|0|96|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|48|0|98|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|49|0|103|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Gather|522000|390000|0|0|0|0|12450|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|50|0|105|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|51|0|108|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|52|0|114|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Key|307000|116000|0|0|0|0|12451|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|53|0|116|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|54|0|119|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|55|0|124|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Round-robin|521000|231000|0|0|0|0|12452|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|126|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|57|0|129|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|58|0|134|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|514000|114000|0|0|0|0|12453|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|59|0|136|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|60|0|139|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|61|0|144|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|101000|181000|0|0|0|0|12455|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|62|0|146|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|63|0|152|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|64|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|932000|225000|0|0|0|0|12457|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|65|0|159|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|66|0|161|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|67|0|170|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Sort|654000|83000|0|0|0|0|12458|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|172|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|69|0|175|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|70|0|181|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|71|0|185|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|72|0|189|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|PBRR|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY||3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY||3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1600692440|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@353500|150000|0|0|0|0|12392|Partition And/Or Sort||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|7|}}
{2010210004|XXGflow|73|0|191|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|74|0|193|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|75|0|195|0|{@{}@384|.5|.5|{0|}12433|17|}}
{2010210004|XXGflow|76|0|197|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|77|0|199|0|{@{}@384|.5|.5|{0|}12439|17|}}
{2010210004|XXGflow|78|0|201|0|{@{}@384|.5|.5|{0|}12444|17|}}
{2010210004|XXGflow|79|0|203|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|80|0|205|0|{@{}@384|.5|.5|{0|}12438|20|}}
{2010210004|XXGflow|81|0|207|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|82|0|209|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|83|0|211|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[PARTITIONING_SCHEME == "GTHR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@1|Gather|495000|504000|0|0|0|0|12449|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|84|0|213|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|85|0|216|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|86|0|219|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|87|0|221|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|88|0|224|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|89|0|227|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "NPNS"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@1|Gather|522000|390000|0|0|0|0|12450|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|90|0|229|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|91|0|232|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|92|0|235|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|93|0|237|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|94|0|240|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|95|0|243|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Partition by Key|307000|116000|0|0|0|0|12451|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|96|0|245|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|97|0|248|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|98|0|251|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|99|0|253|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|100|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|101|0|259|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@1|Replicate|101000|181000|0|0|0|0|12455|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|102|0|261|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|103|0|267|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|104|0|269|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|105|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|106|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|107|0|277|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "PBRR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Partition by Round-robin|521000|231000|0|0|0|0|12452|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|108|0|279|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|109|0|282|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|110|0|285|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|111|0|287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|112|0|290|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|113|0|294|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS", "SORT"]]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Replicate|514000|114000|0|0|0|0|12453|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|296|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|115|0|299|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|116|0|302|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|117|0|304|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|118|0|307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|119|0|310|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
}}@1|Replicate|932000|225000|0|0|0|0|12457|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|120|0|312|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|121|0|314|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|122|0|320|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|123|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|124|0|325|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|125|0|330|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$SRT_KEY|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "SORT", "PBKS"]]|3|9||@{0|}}
}}@1|Sort|654000|83000|0|0|0|0|12458|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|126|0|332|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|127|0|335|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|128|0|338|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|129|0|340|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|130|0|343|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|131|0|346|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|132|0|349|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|133|0|352|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/data_suppression.outbound.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|$ENABLE_OUTBOUND_SUPPRESSION|3|9||@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|$EXPRESSION_LOOKUP_CONTENTS|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@367000|301000|0|0|0|0|13202|Data Suppression - Outbound|Anwar.Parvez|Created 4/11/2019 9:01:10 AM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|0|0|5|}}
{2010600005|XXGgraph|134|0|354|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|$PUB_DXF_COMPONENTS/data_suppression.outbound.mp|44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
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
{30001002|XXparameter|EXPRESSION_LOOKUP_CONTENTS|@3|9|FK|@{0|}}
{30001002|XXparameter|ENABLE_OUTBOUND_SUPPRESSION|True|13|9|RFK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|in0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|in0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|out0_metadata||7|9|RF||{0|}}
{30001002|XXparameter|out0_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|deselect_metadata||7|9|RF||{0|}}
{30001002|XXparameter|deselect_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1563451632|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in0 = out0
metadata type: out0 = in0
metadata type: in0 = deselect
metadata type: deselect = in0|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface|||1|100|-1|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|7|}}
{2010203004|XXGoport|135|0|356|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|136|0|359|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|137|0|362|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010203004|XXGoport|138|0|365|0|{@{}@0|0|0|0|out0|0.0|@@@14736|0|}}
{2010203004|XXGoport|139|0|368|0|{@{}@0|0|0|0|deselect|0.0|@@@14736|0|}}
{2010202004|XXGiport|140|0|371|0|{@{}@0|0|0|0|in0|0.0|@@@14224|0|}}
{2010501005|XXGpvertex|141|0|374|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|type input_type =
$GET_DML;

let long stride = number_of_partitions();
let long seq_number = 0; /* Assign record number on each source record.*/

filename :: get_filename(in) =
begin
  seq_number = this_partition() - stride + 1;
  
  filename :: this_partition_path( in.filename); /* Assign local file name of each file picked up for processing. */
end;

out :: reformat(read, filename, in) =
begin
  seq_number = seq_number + stride;
  
  out.filename :: filename;
  out.file_rec_cntr :: seq_number;
  out.* :: read.*;
end;|3|9||@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$[ join_types('record\\n  string("\\\\x01") filename;\\n  decimal("\\\\x01") file_rec_cntr;end;', GET_DML) ]|3|9||@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Read Multiple Files|315000|71000|0|0|0|0|12255|RMF : Read IDS Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|142|0|376|0|{@{}@0|0|0|0|out|0.0|@@@2452|0|}}
{2010203004|XXGoport|143|0|378|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|144|0|380|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|145|0|382|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|146|0|384|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|147|0|386|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|148|0|388|0|{@{}@0|0|0|0|in|0.0|@@@1556|0|}}
{2010210004|XXGflow|149|0|390|0|{@{}@384|.5|.5|{0|}12244|532|}}
{2010501005|XXGpvertex|150|0|392|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
{30001002|XXparameter|image__|/~ab_home/bin/readfiles|3|2|H$||{0|}}
{30001002|XXparameter|NoHidePorts|in out|3|2|H$||{0|}}
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
{30001002|XXparameter|file_empty_keyword|value file-empty F* Fail value file-empty N* Notify value file-empty I* Ignore value file-empty A* Accept default dollar_substitution Ignore|3|13|Kv|What to do if an input file is empty|{0|}}
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
{30001002|XXparameter|format|uninterpreted|15|1|FKl|The input file format: 'uninterpreted' (read raw data), 'seqfile' (Hadoop sequence file), 'parquet' (Parquet format), 'orc' (ORC format), 'avro' (Avro format), 'texttable' (Hive text table).|{6|uninterpreted|seqfile|parquet|orc|avro|texttable|}}
{30001002|XXparameter|format.condition|param_exact interpret_hadoop_data True param_exact stream_raw_data False version 3.2.2.r15.0:|3|15|P?|@{0|}}
{30001002|XXparameter|select_columns_condition|value format rcfile True value format * False default constant False|13|13|v|Hidden condition for deciding select-columns visibility|{0|}}
{30001002|XXparameter|select_columns||3|2|FK$|A comma-separated list of column number to read from RC File. Column numbers are zero-based.|{0|}}
{30001002|XXparameter|select_columns.display_name|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.keyword|select-columns|3|9|P|@{0|}}
{30001002|XXparameter|select_columns.condition|param select_columns_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|schema_file||3|2|FK$|Location of schema file for reading avro files, prefix with file: or hdfs:. If not specified, data will be read using the schema in the data file.|{0|}}
{30001002|XXparameter|schema_file.display_name|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.keyword|schema-file|3|9|P|@{0|}}
{30001002|XXparameter|schema_file.condition|param format avro|3|15|P?|@{0|}}
{30001002|XXparameter|predicate_condition|value format parquet True value format orc True value format * False default constant True|13|13|v|Hidden condition for deciding predicate-filter visibility|{0|}}
{30001002|XXparameter|predicate_filter||20|2|FK$|Pushdown predicate filter for orc and parquet|{0|}}
{30001002|XXparameter|predicate_filter.display_name|predicate-filter|3|9|P|@{0|}}
{30001002|XXparameter|predicate_filter.keyword|predicate-filter|3|9|P|@{0|}}
{30001002|XXparameter|predicate_filter.condition|param predicate_condition True|3|15|P?|@{0|}}
{30001002|XXparameter|read_options||3|2|FK$|Additional options to pass to the Hadoop reader. The format is a comma separated list of name=value pairs.|{0|}}
{30001002|XXparameter|read_options.display_name|read-options|3|9|P|@{0|}}
{30001002|XXparameter|read_options.keyword|read-options|3|9|P|@{0|}}
{30001002|XXparameter|read_options.condition|param interpret_hadoop_data True|3|15|P?|@{0|}}
{30001002|XXparameter|config_file||28|2|FK$|The configuration file for the multiplexer.|{0|}}
{30001002|XXparameter|config_file.display_name|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.keyword|config-file|3|9|P|@{0|}}
{30001002|XXparameter|config_file.condition|version 4.0.1.r5.0.0:|3|15|P?|@{0|}}
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
{30001002|XXparameter|type1|filename_type filename "string('', charset='x-ab-internal')"|3|2|H$|Metadata for get_filename result|{0|}}
{30001002|XXparameter|num_operations|9|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|filename::get_filename(in)|3|2|H$|extract filename from input record|{0|}}
{30001002|XXparameter|operation2|optional long out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation2_analysis|optional long finished_out::finished(read, filename, in)|3|2|H$|Check if done reading file|{0|}}
{30001002|XXparameter|operation3|optional out::reformat(read, filename, in)|3|2|H$|Create output record|{0|}}
{30001002|XXparameter|operation3_analysis|optional out::reformat(read, filename, in optional)|3|2|H$||{0|}}
{30001002|XXparameter|operation4|optional read::repair_input(void(integer(4)) rawbytes, filename)|3|2|H$|Repair malformed input record from file|{0|}}
{30001002|XXparameter|type1_analysis|filename_type filename "string('', charset='x-ab-internal')"|3|2|H$||{0|}}
{30001002|XXparameter|variable1_analysis|optional input_type read <parameter out_metadata>|3|2|H$||{0|}}
{30001002|XXparameter|port_analysis|reject=^read ; out=^read; filereject=in; in=optional_null()|3|2|H$||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
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
{30001002|XXparameter|mpcmodtime|1594404656|1|1|Hl|The last modification time of this component's template|{0|}}
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
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Read Multiple Files|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|151|0|394|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2452|0|}}
{2010203004|XXGoport|152|0|397|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|153|0|400|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|154|0|403|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|155|0|406|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|156|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|157|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1556|0|}}
{2010501005|XXGpvertex|158|0|415|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|num_records|$[ length_of( SOURCE_FILE_LIST_VEC)]|3|9||@{0|}}
{30001002|XXparameter|transform|let string("")[int] filenames = $[ if( length_of( SOURCE_FILE_LIST_VEC) > 0 ) string_representation( SOURCE_FILE_LIST_VEC) else "[vector]"];

out :: create( index)=
begin

  out.filename:: filenames[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("") filename;
end|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Create Data|49000|85000|0|0|0|0|12253|List IDS Files|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|159|0|417|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010210004|XXGflow|160|0|419|0|{@{}@384|.5|.5|{0|}12247|17|}}
{2010203004|XXGoport|161|0|421|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|162|0|423|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|163|0|425|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|164|0|427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|165|0|430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|166|0|433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010600005|XXGgraph|167|0|440|0|{Subgraph created from graph "publish.ids"|{}@0|@593250|302500|0|0|0|0|13088|Dedup|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|487000|242000|7|}}
{2010240003|XXGlegend|168|0|442|0|{@{}@Only one of these is enabled at runtime,
when DO_DEDUP is true|69000|178000|0|0|0|0|13018|}}
{2010242002|XXGface|169|0|444|0|{@{}@Arial|0|160|0|}}
{2010210004|XXGflow|170|0|446|0|{@{}@384|.5|.5|{0|}13014|529|}}
{2010600005|XXGgraph|171|0|448|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_DEDUP and USE_HASH_FOR_DEDUP]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@300000|30000|0|0|0|0|13013|Dedup Data Using HK|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|607000|270000|7|}}
{2010210004|XXGflow|172|0|450|0|{@{}@384|.5|.5|{0|}12701|17|}}
{2010501005|XXGpvertex|173|0|452|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2\}|3|9||@{0|}}
{30001002|XXparameter|keep|last|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|330500|80000|0|0|0|0|12705|Dedup \{dxf_hk_part1; dxf_hk_part2\}|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|174|0|454|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|175|0|456|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|176|0|458|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|177|0|460|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|178|0|462|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|179|0|464|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|180|0|467|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|181|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|182|0|472|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|183|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|184|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|185|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|186|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|187|0|492|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1; dxf_hk_part2; ids_updt_dttm\}|3|2|$|@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|1|l|@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Sort|79000|72500|0|0|0|0|12707|Sort \{dxf_hk_part1; dxf_hk_part2; ids_updt_dttm\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|188|0|494|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|189|0|497|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|190|0|499|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|191|0|501|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|192|0|504|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|193|0|510|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|194|0|513|0|{@{}@0|0|0|0|in0|.5929824561403508|@@@13840|0|}}
{2010600005|XXGgraph|195|0|517|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[DO_DEDUP and not USE_HASH_FOR_DEDUP]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@40000|30000|0|0|0|0|13016|Dedup Data Using NK|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|409000|169000|7|}}
{2010210004|XXGflow|196|0|519|0|{@{}@384|.5|.5|{0|}12698|17|}}
{2010501005|XXGpvertex|197|0|521|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$DEDUP_DEDUP_KEY|3|9||@{0|}}
{30001002|XXparameter|keep|$DEDUP_KEEP_WHICH|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Dedup Sorted|225500|30000|0|0|0|0|12702|DedSrt : DEDUP_KEY|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|198|0|523|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|199|0|525|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|200|0|527|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|201|0|529|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|202|0|531|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|203|0|533|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|204|0|536|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|dup_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|205|0|538|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|206|0|541|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|207|0|544|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|208|0|547|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|209|0|550|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|210|0|553|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010600005|XXGgraph|211|0|561|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DXF_COMPONENTS/optional_partitioning.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|PARTITIONING_SCHEME|PBKS|3|9||@{0|}}
{30001002|XXparameter|PBK_KEY|$DEDUP_PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|SRT_KEY|$DEDUP_SORT_KEY|3|9||@{0|}}
}}@0|@40000|35000|0|0|0|0|12704|Dedup Prttn|ajrambar.kad|@1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|1|}}
{2010210004|XXGflow|212|0|563|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|213|0|565|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|214|0|567|0|{@{}@384|.5|.5|{0|}12433|17|}}
{2010210004|XXGflow|215|0|569|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|216|0|571|0|{@{}@384|.5|.5|{0|}12439|17|}}
{2010210004|XXGflow|217|0|573|0|{@{}@384|.5|.5|{0|}12444|17|}}
{2010210004|XXGflow|218|0|575|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|219|0|577|0|{@{}@384|.5|.5|{0|}12438|20|}}
{2010210004|XXGflow|220|0|579|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|221|0|581|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|222|0|583|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Gather|495000|504000|0|0|0|0|12449|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|223|0|585|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|224|0|588|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|225|0|594|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Gather|522000|390000|0|0|0|0|12450|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|226|0|596|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|227|0|599|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|228|0|605|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Key|307000|116000|0|0|0|0|12451|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|229|0|607|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|230|0|610|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|231|0|615|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Round-robin|521000|231000|0|0|0|0|12452|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|232|0|617|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|233|0|620|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|234|0|625|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|514000|114000|0|0|0|0|12453|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|235|0|627|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|236|0|630|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|237|0|635|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|101000|181000|0|0|0|0|12455|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|238|0|637|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|239|0|643|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|240|0|648|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|932000|225000|0|0|0|0|12457|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|650|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|242|0|652|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|243|0|661|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Sort|654000|83000|0|0|0|0|12458|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|244|0|663|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|245|0|666|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|246|0|672|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|247|0|676|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|248|0|679|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|PBRR|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY||3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY||3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1600692440|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|@353500|150000|0|0|0|0|12392|Partition And/Or Sort||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1080000|567000|7|}}
{2010210004|XXGflow|249|0|681|0|{@{}@384|.5|.43525180220603943|{0|}12425|20|}}
{2010210004|XXGflow|250|0|683|0|{@{}@384|.5|.5|{0|}12443|17|}}
{2010210004|XXGflow|251|0|685|0|{@{}@384|.5|.5|{0|}12433|17|}}
{2010210004|XXGflow|252|0|687|0|{@{}@384|.5|.5|{0|}12434|532|}}
{2010210004|XXGflow|253|0|689|0|{@{}@384|.5|.5|{0|}12439|17|}}
{2010210004|XXGflow|254|0|691|0|{@{}@384|.5|.5|{0|}12444|17|}}
{2010210004|XXGflow|255|0|693|0|{@{}@384|.5|.5507692098617554|{0|}12426|17|}}
{2010210004|XXGflow|256|0|695|0|{@{}@384|.5|.5|{0|}12438|20|}}
{2010210004|XXGflow|257|0|697|0|{@{}@384|.5|.5|{0|}12404|17|}}
{2010210004|XXGflow|258|0|699|0|{@{}@384|.5|.5|{0|}12422|532|}}
{2010501005|XXGpvertex|259|0|701|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[PARTITIONING_SCHEME == "GTHR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@1|Gather|495000|504000|0|0|0|0|12449|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|260|0|703|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|261|0|706|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|262|0|709|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|263|0|711|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|264|0|714|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|265|0|717|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "NPNS"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
}}@1|Gather|522000|390000|0|0|0|0|12450|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|266|0|719|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|267|0|722|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|268|0|725|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|269|0|727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|270|0|730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|271|0|733|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Partition by Key|307000|116000|0|0|0|0|12451|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|272|0|735|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|273|0|738|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|274|0|741|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|275|0|743|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|276|0|746|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|277|0|749|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
}}@1|Replicate|101000|181000|0|0|0|0|12455|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|278|0|751|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|279|0|757|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|280|0|759|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|281|0|761|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|282|0|764|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|283|0|767|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "PBRR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Partition by Round-robin|521000|231000|0|0|0|0|12452|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|284|0|769|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|285|0|772|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|286|0|775|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|287|0|777|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|288|0|780|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|289|0|784|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS", "SORT"]]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@1|Replicate|514000|114000|0|0|0|0|12453|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|786|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|291|0|789|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|292|0|792|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|293|0|794|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|294|0|797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|295|0|800|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
}}@1|Replicate|932000|225000|0|0|0|0|12457|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|296|0|802|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|297|0|804|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|298|0|810|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|299|0|812|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|300|0|815|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|301|0|820|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$SRT_KEY|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "SORT", "PBKS"]]|3|9||@{0|}}
}}@1|Sort|654000|83000|0|0|0|0|12458|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|302|0|822|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|303|0|825|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|304|0|828|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|305|0|830|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|306|0|833|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|307|0|836|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|308|0|839|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010203004|XXGoport|309|0|842|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|310|0|846|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010203004|XXGoport|311|0|849|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|312|0|853|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|313|0|857|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|$PARTITIONING_SCHEME|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY|$PBK_KEY|3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY|$SRT_KEY|3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1523551639|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@1153500|285000|0|0|0|0|13084|Departition - for SERIAL Output||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|594000|270000|7|}}
{2010210004|XXGflow|314|0|859|0|{@{}@384|.5|.43525180220603943|{0|}12471|20|}}
{2010210004|XXGflow|315|0|861|0|{@{}@384|.5|.5507692098617554|{0|}12472|17|}}
{2010501005|XXGpvertex|316|0|863|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[PARTITIONING_SCHEME == "GTHR" or SOURCE_FILE_TYPE == "SERIAL"]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Gather|270000|119000|0|0|0|0|12474|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|317|0|865|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|318|0|868|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|319|0|871|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|320|0|873|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|321|0|876|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|322|0|879|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$DO_SOURCE|3|9||@{0|}}
{30001002|XXparameter|Layout|$SOURCE_FILE_URL|3|9||@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS/source.$SOURCE_SYSTEM/source.$SOURCE_LOWER.\{RUN_ID\}.dat.gz", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$SOURCE_DML_FILE|3|9|f|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|4\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_output_compressed_file_extension_functions\|\}\}\{56\|Compressed files should be written using dataset extension .gz
\|\}\}\}\}|3|9|P|@{0|}}
}}@1|Output File|1400913|311047|671000|180000|56000|50000|13215|Source|Ab Initio Software|@1|100000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|323|0|881|0|{@{}@661000|199000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|324|0|884|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|325|0|886|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|326|0|891|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|91000|121000|0|0|0|0|12476|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|327|0|893|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|328|0|896|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|329|0|898|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|330|0|900|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|331|0|903|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|332|0|906|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|101000|181000|0|0|0|0|12464|Rplct: Input Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|333|0|908|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010210004|XXGflow|334|0|910|0|{@{}@384|.5|.5|{0|}12457|17|}}
{2010210004|XXGflow|335|0|912|0|{@{}@384|.5|.5|{0|}12458|17|}}
{2010202004|XXGiport|336|0|914|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|337|0|916|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|338|0|918|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|339|0|921|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|340|0|929|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|427000|120000|0|0|0|0|12478|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|341|0|931|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|342|0|933|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|343|0|936|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|344|0|938|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|345|0|941|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010203004|XXGoport|346|0|947|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|347|0|951|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010501005|XXGpvertex|348|0|955|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|Trash|497000|487500|0|0|0|0|13204|Discard Suppressed Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010202004|XXGiport|349|0|957|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|350|0|960|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|351|0|962|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|352|0|967|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ DATASET_FULL_OR_DELTA == "DELTA"]|3|9|F||{0|}}
}}@0|@1490250|185125|0|0|0|0|13063|Event Consumption Log Entry|Ajrambar.Kad|Created 8/25/2016 9:43:07 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|384000|196000|3|}}
{2010210004|XXGflow|353|0|969|0|{@{}@384|.5|.5|{0|}10393|17|}}
{2010210004|XXGflow|354|0|971|0|{@{}@384|.5|.5|{0|}10392|17|}}
{2010503005|XXGfvertex|355|0|973|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$EVENT_CONSUMPTION_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@2|Output File|290000|125000|0|0|0|0|10395|Consumption Log|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|356|0|975|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|357|0|978|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|358|0|980|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|359|0|983|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$INTERIM_EVENT_CONSUMPTION_FILE|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@2|Input File|28000|125500|0|0|0|0|10396|Interim Events Log|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|360|0|985|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|361|0|988|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|362|0|990|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|363|0|993|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@2|Replicate|183000|135000|0|0|0|0|10397|Updating Consumption Entry|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|364|0|995|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|365|0|998|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|366|0|1001|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|367|0|1003|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|368|0|1006|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|369|0|1012|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|select_expr|$FLTR_CTRL_INFO_SEL|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|1206452|494880|0|0|0|0|13205|FBE : Filter Control Info|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|370|0|1014|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|371|0|1017|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|372|0|1020|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|373|0|1022|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|374|0|1024|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|375|0|1026|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|376|0|1029|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
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
{2010203004|XXGoport|377|0|1031|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|378|0|1034|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|379|0|1037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|380|0|1040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|381|0|1043|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|382|0|1046|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|383|0|1049|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/get.ids.$SOURCE_LOWER.job_log.dat", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/dxf_process_log.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|2\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\}|3|9|P|@{0|}}
}}@1|Output File|2180000|668500|872000|443000|56000|50000|13208|Get Job Log|Ab Initio Software|@1|205|0||6||33025|-1|-1|}}
{2010202004|XXGiport|384|0|1051|0|{@{}@862000|464000|11000|11000|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|385|0|1054|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|386|0|1056|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|387|0|1059|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
{30001002|XXparameter|key|$CTRL_RLLP_KEY|3|9||@{0|}}
{30001002|XXparameter|transform|$CTRL_RLLP_XFR|3|3|fcj|@{0|}}
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE_QUARTER|3|2|$|@{0|}}
{30001002|XXparameter|condition|$DO_CTRL|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Rollup|1580000|480000|0|0|0|0|13212|Rllp : Gen Ctrl File|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|388|0|1061|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|389|0|1064|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|390|0|1066|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|391|0|1068|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|392|0|1071|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|393|0|1074|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{30001002|XXparameter|log_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Rollup|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|394|0|1076|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|395|0|1079|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|396|0|1082|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|397|0|1085|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|398|0|1088|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|399|0|1098|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|select_expr|$FILTER_EXPRESSION|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPRESSION) and FILTER_EXPRESSION != "1"]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Filter by Expression|211000|286000|0|0|0|0|13206|Filter IDS Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|400|0|1100|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|401|0|1103|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|402|0|1105|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|403|0|1107|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|404|0|1109|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|405|0|1111|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|406|0|1114|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|407|0|1116|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|408|0|1119|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|409|0|1122|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1125|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|411|0|1128|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|412|0|1131|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|413|0|1139|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$IDS_DATA_PATH/$SOURCE_FILE_PATTERN|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$IDS_DATA_PATH/$SOURCE_FILE_PATTERN", "pdl") create_update 1 is_db 0]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$GET_DML_FILE|3|2|f$|@{0|}}
}}@0|Input File|40000|548000|0|0|0|0|13207|First IDS file for view data|Ab Initio Software|@1|100000|-1||6||33089|-1|-1|}}
{2010203004|XXGoport|414|0|1141|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|415|0|1144|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|416|0|1146|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|417|0|1150|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|1797000|505000|0|0|0|0|13209|NoOp|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|418|0|1152|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|419|0|1155|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|420|0|1158|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|421|0|1160|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|422|0|1163|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|423|0|1169|0|{Adds Source IDs and Record Counts.  Also logs the totals.

We use a Normalize here so that other kinds of filtering or expansion could be done as well.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|transform|$NORMALIZE_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|1\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|DA_xfr_status\|\}\{56\|CTL10021\|\}\{51\|1\|DA_parameter\|\{56\|transform\|\}\}\{\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Normalize|975952|288880|683000|208000|145000|126000|13210|Normalize: Add Job ID & Record Count|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|424|0|1171|0|{@{}@827000|264000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|425|0|1174|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|426|0|1176|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|427|0|1178|0|{@{}@749000|333000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|428|0|1181|0|{@{}@673000|264000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|429|0|1184|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|430|0|1186|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|431|0|1189|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|432|0|1192|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|433|0|1195|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|434|0|1198|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|435|0|1206|0|{Subgraph created from graph "publish.ids"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|PARTITIONING_SCHEME|$PARTITIONING_SCHEME|15|9|RFK|The Partitioning Scheme to use : for layout depth changes and required partitioning : valid choices : SORT, NBNS [ No Sort No partitioning], PBKS, PBK, PBRR : default PBRR or NBNS|{6|PBRR|NPNS|PBK|PBKS|SORT|GTHR|}}
{30001002|XXparameter|PBK_KEY|$PBK_KEY|3|9|FK|PBK_KEY : Key for partitioning|{0|}}
{30001002|XXparameter|SRT_KEY|$SRT_KEY|3|9|FK|Key For Sort|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|mpcmodtime|1523551639|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBRR", "PBK", "PBKS", "SORT"] and SOURCE_FILE_TYPE == "MFS"]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@778500|285000|0|0|0|0|13081|Partition And/Or Sort - for MFS Output||@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1051000|382000|7|}}
{2010210004|XXGflow|436|0|1208|0|{@{}@384|.5|.5|{0|}12448|17|}}
{2010210004|XXGflow|437|0|1211|0|{@{}@384|.5|.5|{0|}12455|532|}}
{2010210004|XXGflow|438|0|1213|0|{@{}@384|.5|.5|{0|}12454|17|}}
{2010210004|XXGflow|439|0|1216|0|{@{}@384|.5|.5|{0|}12446|532|}}
{2010501005|XXGpvertex|440|0|1218|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Key.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$PBK_KEY|3|9||@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Key|307000|116000|0|0|0|0|12460|PBK : \{PBK_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|441|0|1220|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|442|0|1223|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|443|0|1226|0|{Distributes data records to its output flow partitions according to key values.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|1|Hl||{0|}}
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
{2010203004|XXGoport|444|0|1228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|445|0|1231|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|446|0|1237|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME == "PBRR"]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Partition by Round-robin|521000|231000|0|0|0|0|12461|PBRR|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|447|0|1239|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|448|0|1242|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|449|0|1245|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|450|0|1247|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|451|0|1250|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|452|0|1256|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "PBK", "PBKS", "SORT"]]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|514000|114000|0|0|0|0|12462|Rplct|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|453|0|1258|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|454|0|1261|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|455|0|1264|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|456|0|1266|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|457|0|1269|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|458|0|1272|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|932000|225000|0|0|0|0|12466|Rplct : Ouput Layout|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|459|0|1274|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|460|0|1276|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|461|0|1280|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Replicate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|462|0|1282|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|463|0|1285|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|464|0|1295|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|key|$SRT_KEY|3|9||@{0|}}
{30001002|XXparameter|max_core|$AI_SORT_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[ PARTITIONING_SCHEME member [vector "SORT", "PBKS"]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Sort|654000|83000|0|0|0|0|12467|Srt : \{SRT_KEY\}|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|465|0|1297|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|466|0|1300|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|467|0|1303|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{2010203004|XXGoport|468|0|1305|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|469|0|1308|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|470|0|1314|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010202004|XXGiport|471|0|1318|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|472|0|1322|0|{Subgraph created from graph "publish.ids"|{}@0|@15000|285500|0|0|0|0|12996|Read IDS Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|726000|447000|7|}}
{2010501005|XXGpvertex|473|0|1326|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Broadcast|190000|101000|0|0|0|0|12252|Broadcast|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|474|0|1328|0|{@{}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|475|0|1331|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|476|0|1334|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|477|0|1336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|478|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|479|0|1347|0|{@{}@0|0|0|0|out0|0.0|@@@10256|0|}}
{2010501005|XXGpvertex|480|0|1352|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|sorted_input|False|3|1|l|@{0|}}
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
{30001002|XXparameter|max_core|$AI_GRAPH_MAX_CORE|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not DO_SOURCE]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|doc_transform|out,reject,error,log :: document(in) =
begin
out.* :: in.*;
end;|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@1|Rollup|1911000|655000|0|0|0|0|13213|Rollup Job Info|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|481|0|1354|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|482|0|1357|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|483|0|1359|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|484|0|1361|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|485|0|1363|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|486|0|1367|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|487|0|1369|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|488|0|1372|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|489|0|1375|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|490|0|1378|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|491|0|1381|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|492|0|1388|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|1463000|505000|0|0|0|0|13214|Rplct : Dummy|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|493|0|1390|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|494|0|1393|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|495|0|1396|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|496|0|1398|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|497|0|1401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|498|0|1408|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|@3|9|s|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|154000|539500|0|0|0|0|13216|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||65|1|{1|0|}}}
{2010202004|XXGiport|499|0|1410|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|500|0|1413|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher, fan_in_ok|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1594404659|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_ab_semantic_schema|9|1|1|Hnl|@{0|}}
}}@0|Trash|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|501|0|1415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010110002|XXGconstant|502|0|1419|0|{@{}@{1|7338927|}}}
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
{2010604001|XXGgraph_flow_flow|13|0|26|0|{Flow_10|}1|14|}
{2010604001|XXGgraph_flow_flow|14|0|28|0|{Flow_11|}1|15|}
{2010604001|XXGgraph_flow_flow|15|0|30|0|{Flow_12|}1|16|}
{2010604001|XXGgraph_flow_flow|16|0|32|0|{Flow_13|}1|17|}
{2010604001|XXGgraph_flow_flow|17|0|34|0|{Flow_14|}1|18|}
{2010604001|XXGgraph_flow_flow|18|0|36|0|{Flow_15|}1|19|}
{2010604001|XXGgraph_flow_flow|19|0|38|0|{Flow_16|}1|20|}
{2010604001|XXGgraph_flow_flow|20|0|40|0|{Flow_17|}1|21|}
{2010604001|XXGgraph_flow_flow|21|0|42|0|{Flow_2|}1|22|}
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_20|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_3|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_4|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_5|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_6|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_7|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_8|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_9|}1|30|}
{2010601001|XXGgraph_vertex_vertex|30|0|60|0|{Ctrl_Partition_And_Or_Sort|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_1|}31|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_14|}31|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_15|}31|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_17|}31|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_18|}31|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_19|}31|37|}
{2010604001|XXGgraph_flow_flow|37|0|74|0|{Flow_2|}31|38|}
{2010604001|XXGgraph_flow_flow|38|0|76|0|{Flow_3|}31|39|}
{2010604001|XXGgraph_flow_flow|39|0|78|0|{Flow_6|}31|40|}
{2010604001|XXGgraph_flow_flow|40|0|80|0|{Flow_7|}31|41|}
{2010601001|XXGgraph_vertex_vertex|41|0|82|0|{Gather|}31|42|}
{2010212001|XXGvertex_oport_oport|42|0|84|0|{0|out|}42|43|}
{2010213001|XXGoport_dst_flow|43|0|86|0|{0|}43|38|}
{2010211001|XXGvertex_iport_iport|44|0|87|0|{0|in|}42|44|}
{2010214001|XXGiport_src_flow|45|0|89|0|{0|}44|32|}
{2010006001|XXGobject_psameas_object|46|0|90|0|{Layout|Layout|0|0|}42|45|}
{2010211001|XXGvertex_iport_iport|47|0|92|0|{0|write|}45|46|}
{2010214001|XXGiport_src_flow|48|0|94|0|{0|}46|28|}
{2010007001|XXGobject_proto_object|49|0|95|0|{}45|47|}
{2010211001|XXGvertex_iport_iport|50|0|97|0|{0|write|}47|48|}
{2010006001|XXGobject_psameas_object|51|0|99|0|{metadata|write_metadata|1|0|}48|47|}
{2010006001|XXGobject_psameas_object|52|0|100|0|{in_metadata|write_metadata|0|0|}42|45|}
{2010006001|XXGobject_psameas_object|53|0|101|0|{out_metadata|write_metadata|0|0|}42|45|}
{2010601001|XXGgraph_vertex_vertex|54|0|102|0|{Gather_1|}31|49|}
{2010212001|XXGvertex_oport_oport|55|0|104|0|{0|out|}49|50|}
{2010213001|XXGoport_dst_flow|56|0|106|0|{0|}50|36|}
{2010211001|XXGvertex_iport_iport|57|0|107|0|{0|in|}49|51|}
{2010214001|XXGiport_src_flow|58|0|109|0|{0|}51|39|}
{2010006001|XXGobject_psameas_object|59|0|110|0|{Layout|Layout|0|0|}49|45|}
{2010006001|XXGobject_psameas_object|60|0|111|0|{in_metadata|write_metadata|0|0|}49|45|}
{2010006001|XXGobject_psameas_object|61|0|112|0|{out_metadata|write_metadata|0|0|}49|45|}
{2010601001|XXGgraph_vertex_vertex|62|0|113|0|{PBK_PBK_KEY_|}31|52|}
{2010212001|XXGvertex_oport_oport|63|0|115|0|{0|out|}52|53|}
{2010213001|XXGoport_dst_flow|64|0|117|0|{0|}53|41|}
{2010211001|XXGvertex_iport_iport|65|0|118|0|{0|in|}52|54|}
{2010214001|XXGiport_src_flow|66|0|120|0|{0|}54|40|}
{2010006001|XXGobject_psameas_object|67|0|121|0|{in_metadata|write_metadata|0|0|}52|45|}
{2010006001|XXGobject_psameas_object|68|0|122|0|{out_metadata|write_metadata|0|0|}52|45|}
{2010601001|XXGgraph_vertex_vertex|69|0|123|0|{PBRR|}31|55|}
{2010212001|XXGvertex_oport_oport|70|0|125|0|{0|out|}55|56|}
{2010213001|XXGoport_dst_flow|71|0|127|0|{0|}56|35|}
{2010211001|XXGvertex_iport_iport|72|0|128|0|{0|in|}55|57|}
{2010214001|XXGiport_src_flow|73|0|130|0|{0|}57|34|}
{2010006001|XXGobject_psameas_object|74|0|131|0|{in_metadata|write_metadata|0|0|}55|45|}
{2010006001|XXGobject_psameas_object|75|0|132|0|{out_metadata|write_metadata|0|0|}55|45|}
{2010601001|XXGgraph_vertex_vertex|76|0|133|0|{Rplct|}31|58|}
{2010212001|XXGvertex_oport_oport|77|0|135|0|{0|out|}58|59|}
{2010213001|XXGoport_dst_flow|78|0|137|0|{0|}59|33|}
{2010211001|XXGvertex_iport_iport|79|0|138|0|{0|in|}58|60|}
{2010214001|XXGiport_src_flow|80|0|140|0|{0|}60|41|}
{2010006001|XXGobject_psameas_object|81|0|141|0|{in_metadata|write_metadata|0|0|}58|45|}
{2010006001|XXGobject_psameas_object|82|0|142|0|{out_metadata|write_metadata|0|0|}58|45|}
{2010601001|XXGgraph_vertex_vertex|83|0|143|0|{Rplct_Input_Layout|}31|61|}
{2010212001|XXGvertex_oport_oport|84|0|145|0|{0|out|}61|62|}
{2010213001|XXGoport_dst_flow|85|0|147|0|{0|}62|40|}
{2010213001|XXGoport_dst_flow|86|0|148|0|{1|}62|34|}
{2010213001|XXGoport_dst_flow|87|0|149|0|{2|}62|39|}
{2010213001|XXGoport_dst_flow|88|0|150|0|{3|}62|32|}
{2010211001|XXGvertex_iport_iport|89|0|151|0|{0|in|}61|63|}
{2010006001|XXGobject_psameas_object|90|0|153|0|{Layout|Layout|0|0|}61|45|}
{2010006001|XXGobject_psameas_object|91|0|154|0|{in_metadata|write_metadata|0|0|}61|45|}
{2010006001|XXGobject_psameas_object|92|0|155|0|{out_metadata|write_metadata|0|0|}61|45|}
{2010601001|XXGgraph_vertex_vertex|93|0|156|0|{Rplct_Ouput_Layout|}31|64|}
{2010212001|XXGvertex_oport_oport|94|0|158|0|{0|out|}64|65|}
{2010211001|XXGvertex_iport_iport|95|0|160|0|{0|in|}64|66|}
{2010214001|XXGiport_src_flow|96|0|162|0|{0|}66|37|}
{2010214001|XXGiport_src_flow|97|0|163|0|{1|}66|35|}
{2010214001|XXGiport_src_flow|98|0|164|0|{2|}66|36|}
{2010214001|XXGiport_src_flow|99|0|165|0|{3|}66|38|}
{2010006001|XXGobject_psameas_object|100|0|166|0|{Layout|Layout|0|0|}64|45|}
{2010006001|XXGobject_psameas_object|101|0|167|0|{in_metadata|write_metadata|0|0|}64|45|}
{2010006001|XXGobject_psameas_object|102|0|168|0|{out_metadata|write_metadata|0|0|}64|45|}
{2010601001|XXGgraph_vertex_vertex|103|0|169|0|{Srt_SRT_KEY_|}31|67|}
{2010212001|XXGvertex_oport_oport|104|0|171|0|{0|out|}67|68|}
{2010213001|XXGoport_dst_flow|105|0|173|0|{0|}68|37|}
{2010211001|XXGvertex_iport_iport|106|0|174|0|{0|in|}67|69|}
{2010214001|XXGiport_src_flow|107|0|176|0|{0|}69|33|}
{2010006001|XXGobject_psameas_object|108|0|177|0|{Layout|Layout|0|0|}67|45|}
{2010006001|XXGobject_psameas_object|109|0|178|0|{in_metadata|write_metadata|0|0|}67|45|}
{2010006001|XXGobject_psameas_object|110|0|179|0|{out_metadata|write_metadata|0|0|}67|45|}
{2010212001|XXGvertex_oport_oport|111|0|180|0|{0|out0|}31|70|}
{2010216002|XXGoport_binding_oport|112|0|182|0|{.5|.5|{0|}12456|}70|65|}
{2010213001|XXGoport_dst_flow|113|0|183|0|{0|}70|28|}
{2010211001|XXGvertex_iport_iport|114|0|184|0|{0|in0|}31|71|}
{2010215002|XXGiport_binding_iport|115|0|186|0|{.5|.5|{0|}12454|}71|63|}
{2010214001|XXGiport_src_flow|116|0|187|0|{0|}71|27|}
{2010007001|XXGobject_proto_object|117|0|188|0|{}31|72|}
{2010604001|XXGgraph_flow_flow|118|0|190|0|{Flow_1|}72|73|}
{2010604001|XXGgraph_flow_flow|119|0|192|0|{Flow_14|}72|74|}
{2010604001|XXGgraph_flow_flow|120|0|194|0|{Flow_15|}72|75|}
{2010604001|XXGgraph_flow_flow|121|0|196|0|{Flow_17|}72|76|}
{2010604001|XXGgraph_flow_flow|122|0|198|0|{Flow_18|}72|77|}
{2010604001|XXGgraph_flow_flow|123|0|200|0|{Flow_19|}72|78|}
{2010604001|XXGgraph_flow_flow|124|0|202|0|{Flow_2|}72|79|}
{2010604001|XXGgraph_flow_flow|125|0|204|0|{Flow_3|}72|80|}
{2010604001|XXGgraph_flow_flow|126|0|206|0|{Flow_6|}72|81|}
{2010604001|XXGgraph_flow_flow|127|0|208|0|{Flow_7|}72|82|}
{2010601001|XXGgraph_vertex_vertex|128|0|210|0|{Gather|}72|83|}
{2010212001|XXGvertex_oport_oport|129|0|212|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|130|0|214|0|{0|}84|79|}
{2010211001|XXGvertex_iport_iport|131|0|215|0|{0|in|}83|85|}
{2010214001|XXGiport_src_flow|132|0|217|0|{0|}85|73|}
{2010007001|XXGobject_proto_object|133|0|218|0|{}83|86|}
{2010212001|XXGvertex_oport_oport|134|0|220|0|{0|out|}86|87|}
{2010006001|XXGobject_psameas_object|135|0|222|0|{metadata|out_metadata|1|0|}87|86|}
{2010211001|XXGvertex_iport_iport|136|0|223|0|{0|in|}86|88|}
{2010006001|XXGobject_psameas_object|137|0|225|0|{metadata|in_metadata|1|0|}88|86|}
{2010601001|XXGgraph_vertex_vertex|138|0|226|0|{Gather_1|}72|89|}
{2010212001|XXGvertex_oport_oport|139|0|228|0|{0|out|}89|90|}
{2010213001|XXGoport_dst_flow|140|0|230|0|{0|}90|77|}
{2010211001|XXGvertex_iport_iport|141|0|231|0|{0|in|}89|91|}
{2010214001|XXGiport_src_flow|142|0|233|0|{0|}91|80|}
{2010007001|XXGobject_proto_object|143|0|234|0|{}89|92|}
{2010212001|XXGvertex_oport_oport|144|0|236|0|{0|out|}92|93|}
{2010006001|XXGobject_psameas_object|145|0|238|0|{metadata|out_metadata|1|0|}93|92|}
{2010211001|XXGvertex_iport_iport|146|0|239|0|{0|in|}92|94|}
{2010006001|XXGobject_psameas_object|147|0|241|0|{metadata|in_metadata|1|0|}94|92|}
{2010601001|XXGgraph_vertex_vertex|148|0|242|0|{PBK_PBK_KEY_|}72|95|}
{2010212001|XXGvertex_oport_oport|149|0|244|0|{0|out|}95|96|}
{2010213001|XXGoport_dst_flow|150|0|246|0|{0|}96|82|}
{2010211001|XXGvertex_iport_iport|151|0|247|0|{0|in|}95|97|}
{2010214001|XXGiport_src_flow|152|0|249|0|{0|}97|81|}
{2010007001|XXGobject_proto_object|153|0|250|0|{}95|98|}
{2010212001|XXGvertex_oport_oport|154|0|252|0|{0|out|}98|99|}
{2010006001|XXGobject_psameas_object|155|0|254|0|{metadata|out_metadata|1|0|}99|98|}
{2010211001|XXGvertex_iport_iport|156|0|255|0|{0|in|}98|100|}
{2010006001|XXGobject_psameas_object|157|0|257|0|{metadata|in_metadata|1|0|}100|98|}
{2010006001|XXGobject_psameas_object|158|0|258|0|{Layout|Layout|0|0|}95|101|}
{2010212001|XXGvertex_oport_oport|159|0|260|0|{0|out|}101|102|}
{2010213001|XXGoport_dst_flow|160|0|262|0|{0|}102|81|}
{2010213001|XXGoport_dst_flow|161|0|263|0|{1|}102|75|}
{2010213001|XXGoport_dst_flow|162|0|264|0|{2|}102|80|}
{2010213001|XXGoport_dst_flow|163|0|265|0|{3|}102|73|}
{2010211001|XXGvertex_iport_iport|164|0|266|0|{0|in|}101|103|}
{2010007001|XXGobject_proto_object|165|0|268|0|{}101|104|}
{2010212001|XXGvertex_oport_oport|166|0|270|0|{0|out|}104|105|}
{2010006001|XXGobject_psameas_object|167|0|272|0|{metadata|out_metadata|1|0|}105|104|}
{2010211001|XXGvertex_iport_iport|168|0|273|0|{0|in|}104|106|}
{2010006001|XXGobject_psameas_object|169|0|275|0|{metadata|in_metadata|1|0|}106|104|}
{2010601001|XXGgraph_vertex_vertex|170|0|276|0|{PBRR|}72|107|}
{2010212001|XXGvertex_oport_oport|171|0|278|0|{0|out|}107|108|}
{2010213001|XXGoport_dst_flow|172|0|280|0|{0|}108|76|}
{2010211001|XXGvertex_iport_iport|173|0|281|0|{0|in|}107|109|}
{2010214001|XXGiport_src_flow|174|0|283|0|{0|}109|75|}
{2010007001|XXGobject_proto_object|175|0|284|0|{}107|110|}
{2010212001|XXGvertex_oport_oport|176|0|286|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|177|0|288|0|{metadata|out_metadata|1|0|}111|110|}
{2010211001|XXGvertex_iport_iport|178|0|289|0|{0|in|}110|112|}
{2010006001|XXGobject_psameas_object|179|0|291|0|{metadata|in_metadata|1|0|}112|110|}
{2010006001|XXGobject_psameas_object|180|0|292|0|{Layout|Layout|0|0|}107|101|}
{2010601001|XXGgraph_vertex_vertex|181|0|293|0|{Rplct|}72|113|}
{2010212001|XXGvertex_oport_oport|182|0|295|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|183|0|297|0|{0|}114|74|}
{2010211001|XXGvertex_iport_iport|184|0|298|0|{0|in|}113|115|}
{2010214001|XXGiport_src_flow|185|0|300|0|{0|}115|82|}
{2010007001|XXGobject_proto_object|186|0|301|0|{}113|116|}
{2010212001|XXGvertex_oport_oport|187|0|303|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|188|0|305|0|{metadata|out_metadata|1|0|}117|116|}
{2010211001|XXGvertex_iport_iport|189|0|306|0|{0|in|}116|118|}
{2010006001|XXGobject_psameas_object|190|0|308|0|{metadata|in_metadata|1|0|}118|116|}
{2010006001|XXGobject_psameas_object|191|0|309|0|{Layout|Layout|0|0|}113|119|}
{2010212001|XXGvertex_oport_oport|192|0|311|0|{0|out|}119|120|}
{2010211001|XXGvertex_iport_iport|193|0|313|0|{0|in|}119|121|}
{2010214001|XXGiport_src_flow|194|0|315|0|{0|}121|78|}
{2010214001|XXGiport_src_flow|195|0|316|0|{1|}121|76|}
{2010214001|XXGiport_src_flow|196|0|317|0|{2|}121|77|}
{2010214001|XXGiport_src_flow|197|0|318|0|{3|}121|79|}
{2010007001|XXGobject_proto_object|198|0|319|0|{}119|122|}
{2010212001|XXGvertex_oport_oport|199|0|321|0|{0|out|}122|123|}
{2010006001|XXGobject_psameas_object|200|0|323|0|{metadata|out_metadata|1|0|}123|122|}
{2010211001|XXGvertex_iport_iport|201|0|324|0|{0|in|}122|124|}
{2010006001|XXGobject_psameas_object|202|0|326|0|{metadata|in_metadata|1|0|}124|122|}
{2010601001|XXGgraph_vertex_vertex|203|0|327|0|{Rplct_Input_Layout|}72|101|}
{2010601001|XXGgraph_vertex_vertex|204|0|328|0|{Rplct_Ouput_Layout|}72|119|}
{2010601001|XXGgraph_vertex_vertex|205|0|329|0|{Srt_SRT_KEY_|}72|125|}
{2010212001|XXGvertex_oport_oport|206|0|331|0|{0|out|}125|126|}
{2010213001|XXGoport_dst_flow|207|0|333|0|{0|}126|78|}
{2010211001|XXGvertex_iport_iport|208|0|334|0|{0|in|}125|127|}
{2010214001|XXGiport_src_flow|209|0|336|0|{0|}127|74|}
{2010007001|XXGobject_proto_object|210|0|337|0|{}125|128|}
{2010212001|XXGvertex_oport_oport|211|0|339|0|{0|out|}128|129|}
{2010006001|XXGobject_psameas_object|212|0|341|0|{metadata|out_metadata|1|0|}129|128|}
{2010211001|XXGvertex_iport_iport|213|0|342|0|{0|in|}128|130|}
{2010006001|XXGobject_psameas_object|214|0|344|0|{metadata|in_metadata|1|0|}130|128|}
{2010212001|XXGvertex_oport_oport|215|0|345|0|{0|out0|}72|131|}
{2010216002|XXGoport_binding_oport|216|0|347|0|{.5|.5|{0|}12456|}131|120|}
{2010211001|XXGvertex_iport_iport|217|0|348|0|{0|in0|}72|132|}
{2010215002|XXGiport_binding_iport|218|0|350|0|{.5|.5|{0|}12454|}132|103|}
{2010601001|XXGgraph_vertex_vertex|219|0|351|0|{Data_Suppression_Outbound|}1|133|}
{2010401001|XXGvertex_prototype_vertex|220|0|353|0|{}133|134|}
{2010212001|XXGvertex_oport_oport|221|0|355|0|{0|out0|}134|135|}
{2010006001|XXGobject_psameas_object|222|0|357|0|{metadata|out0_metadata|1|0|}135|134|}
{2010212001|XXGvertex_oport_oport|223|0|358|0|{1|deselect|}134|136|}
{2010006001|XXGobject_psameas_object|224|0|360|0|{metadata|deselect_metadata|1|0|}136|134|}
{2010211001|XXGvertex_iport_iport|225|0|361|0|{0|in0|}134|137|}
{2010006001|XXGobject_psameas_object|226|0|363|0|{metadata|in0_metadata|1|0|}137|134|}
{2010212001|XXGvertex_oport_oport|227|0|364|0|{0|out0|}133|138|}
{2010213001|XXGoport_dst_flow|228|0|366|0|{0|}138|19|}
{2010212001|XXGvertex_oport_oport|229|0|367|0|{1|deselect|}133|139|}
{2010213001|XXGoport_dst_flow|230|0|369|0|{0|}139|21|}
{2010211001|XXGvertex_iport_iport|231|0|370|0|{0|in0|}133|140|}
{2010214001|XXGiport_src_flow|232|0|372|0|{0|}140|18|}
{2010006001|XXGobject_psameas_object|233|0|373|0|{Layout|Layout|0|0|}133|141|}
{2010212001|XXGvertex_oport_oport|234|0|375|0|{0|out|}141|142|}
{2010212001|XXGvertex_oport_oport|235|0|377|0|{1|filereject|}141|143|}
{2010212001|XXGvertex_oport_oport|236|0|379|0|{2|fileerror|}141|144|}
{2010212001|XXGvertex_oport_oport|237|0|381|0|{3|reject|}141|145|}
{2010212001|XXGvertex_oport_oport|238|0|383|0|{4|error|}141|146|}
{2010212001|XXGvertex_oport_oport|239|0|385|0|{5|log|}141|147|}
{2010211001|XXGvertex_iport_iport|240|0|387|0|{0|in|}141|148|}
{2010214001|XXGiport_src_flow|241|0|389|0|{0|}148|149|}
{2010007001|XXGobject_proto_object|242|0|391|0|{}141|150|}
{2010212001|XXGvertex_oport_oport|243|0|393|0|{0|out|}150|151|}
{2010006001|XXGobject_psameas_object|244|0|395|0|{metadata|out_metadata|1|0|}151|150|}
{2010212001|XXGvertex_oport_oport|245|0|396|0|{1|filereject|}150|152|}
{2010006001|XXGobject_psameas_object|246|0|398|0|{metadata|filereject_metadata|1|0|}152|150|}
{2010212001|XXGvertex_oport_oport|247|0|399|0|{2|fileerror|}150|153|}
{2010006001|XXGobject_psameas_object|248|0|401|0|{metadata|fileerror_metadata|1|0|}153|150|}
{2010212001|XXGvertex_oport_oport|249|0|402|0|{3|reject|}150|154|}
{2010006001|XXGobject_psameas_object|250|0|404|0|{metadata|reject_metadata|1|0|}154|150|}
{2010212001|XXGvertex_oport_oport|251|0|405|0|{4|error|}150|155|}
{2010006001|XXGobject_psameas_object|252|0|407|0|{metadata|error_metadata|1|0|}155|150|}
{2010212001|XXGvertex_oport_oport|253|0|408|0|{5|log|}150|156|}
{2010006001|XXGobject_psameas_object|254|0|410|0|{metadata|log_metadata|1|0|}156|150|}
{2010211001|XXGvertex_iport_iport|255|0|411|0|{0|in|}150|157|}
{2010006001|XXGobject_psameas_object|256|0|413|0|{metadata|in_metadata|1|0|}157|150|}
{2010006001|XXGobject_psameas_object|257|0|414|0|{filereject_metadata|out_metadata|0|0|}141|158|}
{2010212001|XXGvertex_oport_oport|258|0|416|0|{0|out|}158|159|}
{2010213001|XXGoport_dst_flow|259|0|418|0|{0|}159|160|}
{2010212001|XXGvertex_oport_oport|260|0|420|0|{1|error|}158|161|}
{2010212001|XXGvertex_oport_oport|261|0|422|0|{2|log|}158|162|}
{2010007001|XXGobject_proto_object|262|0|424|0|{}158|163|}
{2010212001|XXGvertex_oport_oport|263|0|426|0|{0|out|}163|164|}
{2010006001|XXGobject_psameas_object|264|0|428|0|{metadata|out_metadata|1|0|}164|163|}
{2010212001|XXGvertex_oport_oport|265|0|429|0|{1|error|}163|165|}
{2010006001|XXGobject_psameas_object|266|0|431|0|{metadata|error_metadata|1|0|}165|163|}
{2010212001|XXGvertex_oport_oport|267|0|432|0|{2|log|}163|166|}
{2010006001|XXGobject_psameas_object|268|0|434|0|{metadata|log_metadata|1|0|}166|163|}
{2010006001|XXGobject_psameas_object|269|0|435|0|{in_metadata|out_metadata|0|0|}141|158|}
{2010006001|XXGobject_psameas_object|270|0|436|0|{deselect_metadata|out_metadata|0|0|}133|141|}
{2010006001|XXGobject_psameas_object|271|0|437|0|{in0_metadata|out_metadata|0|0|}133|141|}
{2010006001|XXGobject_psameas_object|272|0|438|0|{out0_metadata|out_metadata|0|0|}133|141|}
{2010601001|XXGgraph_vertex_vertex|273|0|439|0|{Dedup|}1|167|}
{2010605001|XXGgraph_legend_legend|274|0|441|0|{0|}167|168|}
{2010241001|XXGlegend_face_face|275|0|443|0|{}168|169|}
{2010604001|XXGgraph_flow_flow|276|0|445|0|{Flow_14|}167|170|}
{2010601001|XXGgraph_vertex_vertex|277|0|447|0|{Dedup_Data_Using_HK|}167|171|}
{2010604001|XXGgraph_flow_flow|278|0|449|0|{Flow_1|}171|172|}
{2010601001|XXGgraph_vertex_vertex|279|0|451|0|{Dedup_dxf_hk_part1_dxf_hk_part2_|}171|173|}
{2010212001|XXGvertex_oport_oport|280|0|453|0|{0|out|}173|174|}
{2010212001|XXGvertex_oport_oport|281|0|455|0|{1|dup|}173|175|}
{2010212001|XXGvertex_oport_oport|282|0|457|0|{2|reject|}173|176|}
{2010212001|XXGvertex_oport_oport|283|0|459|0|{3|error|}173|177|}
{2010212001|XXGvertex_oport_oport|284|0|461|0|{4|log|}173|178|}
{2010211001|XXGvertex_iport_iport|285|0|463|0|{0|in|}173|179|}
{2010214001|XXGiport_src_flow|286|0|465|0|{0|}179|172|}
{2010007001|XXGobject_proto_object|287|0|466|0|{}173|180|}
{2010212001|XXGvertex_oport_oport|288|0|468|0|{0|out|}180|181|}
{2010006001|XXGobject_psameas_object|289|0|470|0|{metadata|out_metadata|1|0|}181|180|}
{2010212001|XXGvertex_oport_oport|290|0|471|0|{1|dup|}180|182|}
{2010006001|XXGobject_psameas_object|291|0|473|0|{metadata|dup_metadata|1|0|}182|180|}
{2010212001|XXGvertex_oport_oport|292|0|474|0|{2|reject|}180|183|}
{2010006001|XXGobject_psameas_object|293|0|476|0|{metadata|reject_metadata|1|0|}183|180|}
{2010212001|XXGvertex_oport_oport|294|0|477|0|{3|error|}180|184|}
{2010006001|XXGobject_psameas_object|295|0|479|0|{metadata|error_metadata|1|0|}184|180|}
{2010212001|XXGvertex_oport_oport|296|0|480|0|{4|log|}180|185|}
{2010006001|XXGobject_psameas_object|297|0|482|0|{metadata|log_metadata|1|0|}185|180|}
{2010211001|XXGvertex_iport_iport|298|0|483|0|{0|in|}180|186|}
{2010006001|XXGobject_psameas_object|299|0|485|0|{metadata|in_metadata|1|0|}186|180|}
{2010006001|XXGobject_psameas_object|300|0|486|0|{Layout|Layout|0|0|}173|133|}
{2010006001|XXGobject_psameas_object|301|0|487|0|{dup_metadata|out_metadata|0|0|}173|141|}
{2010006001|XXGobject_psameas_object|302|0|488|0|{in_metadata|out_metadata|0|0|}173|141|}
{2010006001|XXGobject_psameas_object|303|0|489|0|{out_metadata|out_metadata|0|0|}173|141|}
{2010006001|XXGobject_psameas_object|304|0|490|0|{reject_metadata|out_metadata|0|0|}173|141|}
{2010601001|XXGgraph_vertex_vertex|305|0|491|0|{Sort_dxf_hk_part1_dxf_hk_part2_ids_updt_dttm_|}171|187|}
{2010212001|XXGvertex_oport_oport|306|0|493|0|{0|out|}187|188|}
{2010213001|XXGoport_dst_flow|307|0|495|0|{0|}188|172|}
{2010211001|XXGvertex_iport_iport|308|0|496|0|{0|in|}187|189|}
{2010007001|XXGobject_proto_object|309|0|498|0|{}187|190|}
{2010212001|XXGvertex_oport_oport|310|0|500|0|{0|out|}190|191|}
{2010006001|XXGobject_psameas_object|311|0|502|0|{metadata|out_metadata|1|0|}191|190|}
{2010211001|XXGvertex_iport_iport|312|0|503|0|{0|in|}190|192|}
{2010006001|XXGobject_psameas_object|313|0|505|0|{metadata|in_metadata|1|0|}192|190|}
{2010006001|XXGobject_psameas_object|314|0|506|0|{Layout|Layout|0|0|}187|133|}
{2010006001|XXGobject_psameas_object|315|0|507|0|{in_metadata|out_metadata|0|0|}187|141|}
{2010006001|XXGobject_psameas_object|316|0|508|0|{out_metadata|out_metadata|0|0|}187|141|}
{2010212001|XXGvertex_oport_oport|317|0|509|0|{0|out0|}171|193|}
{2010216002|XXGoport_binding_oport|318|0|511|0|{.5|.5|{0|}12704|}193|174|}
{2010211001|XXGvertex_iport_iport|319|0|512|0|{0|in0|}171|194|}
{2010215002|XXGiport_binding_iport|320|0|514|0|{.5|.5|{0|}12706|}194|189|}
{2010214001|XXGiport_src_flow|321|0|515|0|{0|}194|170|}
{2010601001|XXGgraph_vertex_vertex|322|0|516|0|{Dedup_Data_Using_NK|}167|195|}
{2010604001|XXGgraph_flow_flow|323|0|518|0|{Flow_16|}195|196|}
{2010601001|XXGgraph_vertex_vertex|324|0|520|0|{DedSrt_DEDUP_KEY|}195|197|}
{2010212001|XXGvertex_oport_oport|325|0|522|0|{0|out|}197|198|}
{2010212001|XXGvertex_oport_oport|326|0|524|0|{1|dup|}197|199|}
{2010212001|XXGvertex_oport_oport|327|0|526|0|{2|reject|}197|200|}
{2010212001|XXGvertex_oport_oport|328|0|528|0|{3|error|}197|201|}
{2010212001|XXGvertex_oport_oport|329|0|530|0|{4|log|}197|202|}
{2010211001|XXGvertex_iport_iport|330|0|532|0|{0|in|}197|203|}
{2010214001|XXGiport_src_flow|331|0|534|0|{0|}203|196|}
{2010007001|XXGobject_proto_object|332|0|535|0|{}197|204|}
{2010212001|XXGvertex_oport_oport|333|0|537|0|{0|out|}204|205|}
{2010006001|XXGobject_psameas_object|334|0|539|0|{metadata|out_metadata|1|0|}205|204|}
{2010212001|XXGvertex_oport_oport|335|0|540|0|{1|dup|}204|206|}
{2010006001|XXGobject_psameas_object|336|0|542|0|{metadata|dup_metadata|1|0|}206|204|}
{2010212001|XXGvertex_oport_oport|337|0|543|0|{2|reject|}204|207|}
{2010006001|XXGobject_psameas_object|338|0|545|0|{metadata|reject_metadata|1|0|}207|204|}
{2010212001|XXGvertex_oport_oport|339|0|546|0|{3|error|}204|208|}
{2010006001|XXGobject_psameas_object|340|0|548|0|{metadata|error_metadata|1|0|}208|204|}
{2010212001|XXGvertex_oport_oport|341|0|549|0|{4|log|}204|209|}
{2010006001|XXGobject_psameas_object|342|0|551|0|{metadata|log_metadata|1|0|}209|204|}
{2010211001|XXGvertex_iport_iport|343|0|552|0|{0|in|}204|210|}
{2010006001|XXGobject_psameas_object|344|0|554|0|{metadata|in_metadata|1|0|}210|204|}
{2010006001|XXGobject_psameas_object|345|0|555|0|{Layout|Layout|0|0|}197|133|}
{2010006001|XXGobject_psameas_object|346|0|556|0|{dup_metadata|out_metadata|0|0|}197|141|}
{2010006001|XXGobject_psameas_object|347|0|557|0|{in_metadata|out_metadata|0|0|}197|141|}
{2010006001|XXGobject_psameas_object|348|0|558|0|{out_metadata|out_metadata|0|0|}197|141|}
{2010006001|XXGobject_psameas_object|349|0|559|0|{reject_metadata|out_metadata|0|0|}197|141|}
{2010601001|XXGgraph_vertex_vertex|350|0|560|0|{Dedup_Prttn|}195|211|}
{2010604001|XXGgraph_flow_flow|351|0|562|0|{Flow_1|}211|212|}
{2010604001|XXGgraph_flow_flow|352|0|564|0|{Flow_14|}211|213|}
{2010604001|XXGgraph_flow_flow|353|0|566|0|{Flow_15|}211|214|}
{2010604001|XXGgraph_flow_flow|354|0|568|0|{Flow_17|}211|215|}
{2010604001|XXGgraph_flow_flow|355|0|570|0|{Flow_18|}211|216|}
{2010604001|XXGgraph_flow_flow|356|0|572|0|{Flow_19|}211|217|}
{2010604001|XXGgraph_flow_flow|357|0|574|0|{Flow_2|}211|218|}
{2010604001|XXGgraph_flow_flow|358|0|576|0|{Flow_3|}211|219|}
{2010604001|XXGgraph_flow_flow|359|0|578|0|{Flow_6|}211|220|}
{2010604001|XXGgraph_flow_flow|360|0|580|0|{Flow_7|}211|221|}
{2010601001|XXGgraph_vertex_vertex|361|0|582|0|{Gather|}211|222|}
{2010212001|XXGvertex_oport_oport|362|0|584|0|{0|out|}222|223|}
{2010213001|XXGoport_dst_flow|363|0|586|0|{0|}223|218|}
{2010211001|XXGvertex_iport_iport|364|0|587|0|{0|in|}222|224|}
{2010214001|XXGiport_src_flow|365|0|589|0|{0|}224|212|}
{2010006001|XXGobject_psameas_object|366|0|590|0|{Layout|Layout|0|0|}222|133|}
{2010006001|XXGobject_psameas_object|367|0|591|0|{in_metadata|out_metadata|0|0|}222|141|}
{2010006001|XXGobject_psameas_object|368|0|592|0|{out_metadata|out_metadata|0|0|}222|141|}
{2010601001|XXGgraph_vertex_vertex|369|0|593|0|{Gather_1|}211|225|}
{2010212001|XXGvertex_oport_oport|370|0|595|0|{0|out|}225|226|}
{2010213001|XXGoport_dst_flow|371|0|597|0|{0|}226|216|}
{2010211001|XXGvertex_iport_iport|372|0|598|0|{0|in|}225|227|}
{2010214001|XXGiport_src_flow|373|0|600|0|{0|}227|219|}
{2010006001|XXGobject_psameas_object|374|0|601|0|{Layout|Layout|0|0|}225|133|}
{2010006001|XXGobject_psameas_object|375|0|602|0|{in_metadata|out_metadata|0|0|}225|141|}
{2010006001|XXGobject_psameas_object|376|0|603|0|{out_metadata|out_metadata|0|0|}225|141|}
{2010601001|XXGgraph_vertex_vertex|377|0|604|0|{PBK_PBK_KEY_|}211|228|}
{2010212001|XXGvertex_oport_oport|378|0|606|0|{0|out|}228|229|}
{2010213001|XXGoport_dst_flow|379|0|608|0|{0|}229|221|}
{2010211001|XXGvertex_iport_iport|380|0|609|0|{0|in|}228|230|}
{2010214001|XXGiport_src_flow|381|0|611|0|{0|}230|220|}
{2010006001|XXGobject_psameas_object|382|0|612|0|{in_metadata|out_metadata|0|0|}228|141|}
{2010006001|XXGobject_psameas_object|383|0|613|0|{out_metadata|out_metadata|0|0|}228|141|}
{2010601001|XXGgraph_vertex_vertex|384|0|614|0|{PBRR|}211|231|}
{2010212001|XXGvertex_oport_oport|385|0|616|0|{0|out|}231|232|}
{2010213001|XXGoport_dst_flow|386|0|618|0|{0|}232|215|}
{2010211001|XXGvertex_iport_iport|387|0|619|0|{0|in|}231|233|}
{2010214001|XXGiport_src_flow|388|0|621|0|{0|}233|214|}
{2010006001|XXGobject_psameas_object|389|0|622|0|{in_metadata|out_metadata|0|0|}231|141|}
{2010006001|XXGobject_psameas_object|390|0|623|0|{out_metadata|out_metadata|0|0|}231|141|}
{2010601001|XXGgraph_vertex_vertex|391|0|624|0|{Rplct|}211|234|}
{2010212001|XXGvertex_oport_oport|392|0|626|0|{0|out|}234|235|}
{2010213001|XXGoport_dst_flow|393|0|628|0|{0|}235|213|}
{2010211001|XXGvertex_iport_iport|394|0|629|0|{0|in|}234|236|}
{2010214001|XXGiport_src_flow|395|0|631|0|{0|}236|221|}
{2010006001|XXGobject_psameas_object|396|0|632|0|{in_metadata|out_metadata|0|0|}234|141|}
{2010006001|XXGobject_psameas_object|397|0|633|0|{out_metadata|out_metadata|0|0|}234|141|}
{2010601001|XXGgraph_vertex_vertex|398|0|634|0|{Rplct_Input_Layout|}211|237|}
{2010212001|XXGvertex_oport_oport|399|0|636|0|{0|out|}237|238|}
{2010213001|XXGoport_dst_flow|400|0|638|0|{0|}238|220|}
{2010213001|XXGoport_dst_flow|401|0|639|0|{1|}238|214|}
{2010213001|XXGoport_dst_flow|402|0|640|0|{2|}238|219|}
{2010213001|XXGoport_dst_flow|403|0|641|0|{3|}238|212|}
{2010211001|XXGvertex_iport_iport|404|0|642|0|{0|in|}237|239|}
{2010006001|XXGobject_psameas_object|405|0|644|0|{Layout|Layout|0|0|}237|133|}
{2010006001|XXGobject_psameas_object|406|0|645|0|{in_metadata|out_metadata|0|0|}237|141|}
{2010006001|XXGobject_psameas_object|407|0|646|0|{out_metadata|out_metadata|0|0|}237|141|}
{2010601001|XXGgraph_vertex_vertex|408|0|647|0|{Rplct_Ouput_Layout|}211|240|}
{2010212001|XXGvertex_oport_oport|409|0|649|0|{0|out|}240|241|}
{2010211001|XXGvertex_iport_iport|410|0|651|0|{0|in|}240|242|}
{2010214001|XXGiport_src_flow|411|0|653|0|{0|}242|217|}
{2010214001|XXGiport_src_flow|412|0|654|0|{1|}242|215|}
{2010214001|XXGiport_src_flow|413|0|655|0|{2|}242|216|}
{2010214001|XXGiport_src_flow|414|0|656|0|{3|}242|218|}
{2010006001|XXGobject_psameas_object|415|0|657|0|{Layout|Layout|0|0|}240|237|}
{2010006001|XXGobject_psameas_object|416|0|658|0|{in_metadata|out_metadata|0|0|}240|141|}
{2010006001|XXGobject_psameas_object|417|0|659|0|{out_metadata|out_metadata|0|0|}240|141|}
{2010601001|XXGgraph_vertex_vertex|418|0|660|0|{Srt_SRT_KEY_|}211|243|}
{2010212001|XXGvertex_oport_oport|419|0|662|0|{0|out|}243|244|}
{2010213001|XXGoport_dst_flow|420|0|664|0|{0|}244|217|}
{2010211001|XXGvertex_iport_iport|421|0|665|0|{0|in|}243|245|}
{2010214001|XXGiport_src_flow|422|0|667|0|{0|}245|213|}
{2010006001|XXGobject_psameas_object|423|0|668|0|{Layout|Layout|0|0|}243|237|}
{2010006001|XXGobject_psameas_object|424|0|669|0|{in_metadata|out_metadata|0|0|}243|141|}
{2010006001|XXGobject_psameas_object|425|0|670|0|{out_metadata|out_metadata|0|0|}243|141|}
{2010212001|XXGvertex_oport_oport|426|0|671|0|{0|out0|}211|246|}
{2010216002|XXGoport_binding_oport|427|0|673|0|{.5|.5|{0|}12456|}246|241|}
{2010213001|XXGoport_dst_flow|428|0|674|0|{0|}246|196|}
{2010211001|XXGvertex_iport_iport|429|0|675|0|{0|in0|}211|247|}
{2010215002|XXGiport_binding_iport|430|0|677|0|{.5|.5|{0|}12454|}247|239|}
{2010007001|XXGobject_proto_object|431|0|678|0|{}211|248|}
{2010604001|XXGgraph_flow_flow|432|0|680|0|{Flow_1|}248|249|}
{2010604001|XXGgraph_flow_flow|433|0|682|0|{Flow_14|}248|250|}
{2010604001|XXGgraph_flow_flow|434|0|684|0|{Flow_15|}248|251|}
{2010604001|XXGgraph_flow_flow|435|0|686|0|{Flow_17|}248|252|}
{2010604001|XXGgraph_flow_flow|436|0|688|0|{Flow_18|}248|253|}
{2010604001|XXGgraph_flow_flow|437|0|690|0|{Flow_19|}248|254|}
{2010604001|XXGgraph_flow_flow|438|0|692|0|{Flow_2|}248|255|}
{2010604001|XXGgraph_flow_flow|439|0|694|0|{Flow_3|}248|256|}
{2010604001|XXGgraph_flow_flow|440|0|696|0|{Flow_6|}248|257|}
{2010604001|XXGgraph_flow_flow|441|0|698|0|{Flow_7|}248|258|}
{2010601001|XXGgraph_vertex_vertex|442|0|700|0|{Gather|}248|259|}
{2010212001|XXGvertex_oport_oport|443|0|702|0|{0|out|}259|260|}
{2010213001|XXGoport_dst_flow|444|0|704|0|{0|}260|255|}
{2010211001|XXGvertex_iport_iport|445|0|705|0|{0|in|}259|261|}
{2010214001|XXGiport_src_flow|446|0|707|0|{0|}261|249|}
{2010007001|XXGobject_proto_object|447|0|708|0|{}259|262|}
{2010212001|XXGvertex_oport_oport|448|0|710|0|{0|out|}262|263|}
{2010006001|XXGobject_psameas_object|449|0|712|0|{metadata|out_metadata|1|0|}263|262|}
{2010211001|XXGvertex_iport_iport|450|0|713|0|{0|in|}262|264|}
{2010006001|XXGobject_psameas_object|451|0|715|0|{metadata|in_metadata|1|0|}264|262|}
{2010601001|XXGgraph_vertex_vertex|452|0|716|0|{Gather_1|}248|265|}
{2010212001|XXGvertex_oport_oport|453|0|718|0|{0|out|}265|266|}
{2010213001|XXGoport_dst_flow|454|0|720|0|{0|}266|253|}
{2010211001|XXGvertex_iport_iport|455|0|721|0|{0|in|}265|267|}
{2010214001|XXGiport_src_flow|456|0|723|0|{0|}267|256|}
{2010007001|XXGobject_proto_object|457|0|724|0|{}265|268|}
{2010212001|XXGvertex_oport_oport|458|0|726|0|{0|out|}268|269|}
{2010006001|XXGobject_psameas_object|459|0|728|0|{metadata|out_metadata|1|0|}269|268|}
{2010211001|XXGvertex_iport_iport|460|0|729|0|{0|in|}268|270|}
{2010006001|XXGobject_psameas_object|461|0|731|0|{metadata|in_metadata|1|0|}270|268|}
{2010601001|XXGgraph_vertex_vertex|462|0|732|0|{PBK_PBK_KEY_|}248|271|}
{2010212001|XXGvertex_oport_oport|463|0|734|0|{0|out|}271|272|}
{2010213001|XXGoport_dst_flow|464|0|736|0|{0|}272|258|}
{2010211001|XXGvertex_iport_iport|465|0|737|0|{0|in|}271|273|}
{2010214001|XXGiport_src_flow|466|0|739|0|{0|}273|257|}
{2010007001|XXGobject_proto_object|467|0|740|0|{}271|274|}
{2010212001|XXGvertex_oport_oport|468|0|742|0|{0|out|}274|275|}
{2010006001|XXGobject_psameas_object|469|0|744|0|{metadata|out_metadata|1|0|}275|274|}
{2010211001|XXGvertex_iport_iport|470|0|745|0|{0|in|}274|276|}
{2010006001|XXGobject_psameas_object|471|0|747|0|{metadata|in_metadata|1|0|}276|274|}
{2010006001|XXGobject_psameas_object|472|0|748|0|{Layout|Layout|0|0|}271|277|}
{2010212001|XXGvertex_oport_oport|473|0|750|0|{0|out|}277|278|}
{2010213001|XXGoport_dst_flow|474|0|752|0|{0|}278|257|}
{2010213001|XXGoport_dst_flow|475|0|753|0|{1|}278|251|}
{2010213001|XXGoport_dst_flow|476|0|754|0|{2|}278|256|}
{2010213001|XXGoport_dst_flow|477|0|755|0|{3|}278|249|}
{2010211001|XXGvertex_iport_iport|478|0|756|0|{0|in|}277|279|}
{2010007001|XXGobject_proto_object|479|0|758|0|{}277|280|}
{2010212001|XXGvertex_oport_oport|480|0|760|0|{0|out|}280|281|}
{2010006001|XXGobject_psameas_object|481|0|762|0|{metadata|out_metadata|1|0|}281|280|}
{2010211001|XXGvertex_iport_iport|482|0|763|0|{0|in|}280|282|}
{2010006001|XXGobject_psameas_object|483|0|765|0|{metadata|in_metadata|1|0|}282|280|}
{2010601001|XXGgraph_vertex_vertex|484|0|766|0|{PBRR|}248|283|}
{2010212001|XXGvertex_oport_oport|485|0|768|0|{0|out|}283|284|}
{2010213001|XXGoport_dst_flow|486|0|770|0|{0|}284|252|}
{2010211001|XXGvertex_iport_iport|487|0|771|0|{0|in|}283|285|}
{2010214001|XXGiport_src_flow|488|0|773|0|{0|}285|251|}
{2010007001|XXGobject_proto_object|489|0|774|0|{}283|286|}
{2010212001|XXGvertex_oport_oport|490|0|776|0|{0|out|}286|287|}
{2010006001|XXGobject_psameas_object|491|0|778|0|{metadata|out_metadata|1|0|}287|286|}
{2010211001|XXGvertex_iport_iport|492|0|779|0|{0|in|}286|288|}
{2010006001|XXGobject_psameas_object|493|0|781|0|{metadata|in_metadata|1|0|}288|286|}
{2010006001|XXGobject_psameas_object|494|0|782|0|{Layout|Layout|0|0|}283|277|}
{2010601001|XXGgraph_vertex_vertex|495|0|783|0|{Rplct|}248|289|}
{2010212001|XXGvertex_oport_oport|496|0|785|0|{0|out|}289|290|}
{2010213001|XXGoport_dst_flow|497|0|787|0|{0|}290|250|}
{2010211001|XXGvertex_iport_iport|498|0|788|0|{0|in|}289|291|}
{2010214001|XXGiport_src_flow|499|0|790|0|{0|}291|258|}
{2010007001|XXGobject_proto_object|500|0|791|0|{}289|292|}
{2010212001|XXGvertex_oport_oport|501|0|793|0|{0|out|}292|293|}
{2010006001|XXGobject_psameas_object|502|0|795|0|{metadata|out_metadata|1|0|}293|292|}
{2010211001|XXGvertex_iport_iport|503|0|796|0|{0|in|}292|294|}
{2010006001|XXGobject_psameas_object|504|0|798|0|{metadata|in_metadata|1|0|}294|292|}
{2010006001|XXGobject_psameas_object|505|0|799|0|{Layout|Layout|0|0|}289|295|}
{2010212001|XXGvertex_oport_oport|506|0|801|0|{0|out|}295|296|}
{2010211001|XXGvertex_iport_iport|507|0|803|0|{0|in|}295|297|}
{2010214001|XXGiport_src_flow|508|0|805|0|{0|}297|254|}
{2010214001|XXGiport_src_flow|509|0|806|0|{1|}297|252|}
{2010214001|XXGiport_src_flow|510|0|807|0|{2|}297|253|}
{2010214001|XXGiport_src_flow|511|0|808|0|{3|}297|255|}
{2010007001|XXGobject_proto_object|512|0|809|0|{}295|298|}
{2010212001|XXGvertex_oport_oport|513|0|811|0|{0|out|}298|299|}
{2010006001|XXGobject_psameas_object|514|0|813|0|{metadata|out_metadata|1|0|}299|298|}
{2010211001|XXGvertex_iport_iport|515|0|814|0|{0|in|}298|300|}
{2010006001|XXGobject_psameas_object|516|0|816|0|{metadata|in_metadata|1|0|}300|298|}
{2010601001|XXGgraph_vertex_vertex|517|0|817|0|{Rplct_Input_Layout|}248|277|}
{2010601001|XXGgraph_vertex_vertex|518|0|818|0|{Rplct_Ouput_Layout|}248|295|}
{2010601001|XXGgraph_vertex_vertex|519|0|819|0|{Srt_SRT_KEY_|}248|301|}
{2010212001|XXGvertex_oport_oport|520|0|821|0|{0|out|}301|302|}
{2010213001|XXGoport_dst_flow|521|0|823|0|{0|}302|254|}
{2010211001|XXGvertex_iport_iport|522|0|824|0|{0|in|}301|303|}
{2010214001|XXGiport_src_flow|523|0|826|0|{0|}303|250|}
{2010007001|XXGobject_proto_object|524|0|827|0|{}301|304|}
{2010212001|XXGvertex_oport_oport|525|0|829|0|{0|out|}304|305|}
{2010006001|XXGobject_psameas_object|526|0|831|0|{metadata|out_metadata|1|0|}305|304|}
{2010211001|XXGvertex_iport_iport|527|0|832|0|{0|in|}304|306|}
{2010006001|XXGobject_psameas_object|528|0|834|0|{metadata|in_metadata|1|0|}306|304|}
{2010212001|XXGvertex_oport_oport|529|0|835|0|{0|out0|}248|307|}
{2010216002|XXGoport_binding_oport|530|0|837|0|{.5|.5|{0|}12456|}307|296|}
{2010211001|XXGvertex_iport_iport|531|0|838|0|{0|in0|}248|308|}
{2010215002|XXGiport_binding_iport|532|0|840|0|{.5|.5|{0|}12454|}308|279|}
{2010212001|XXGvertex_oport_oport|533|0|841|0|{0|out0|}195|309|}
{2010216002|XXGoport_binding_oport|534|0|843|0|{.5|.5|{0|}12701|}309|198|}
{2010213001|XXGoport_dst_flow|535|0|844|0|{0|}309|170|}
{2010211001|XXGvertex_iport_iport|536|0|845|0|{0|in0|}195|310|}
{2010215002|XXGiport_binding_iport|537|0|847|0|{.5|.5|{0|}12703|}310|247|}
{2010212001|XXGvertex_oport_oport|538|0|848|0|{0|out0|}167|311|}
{2010216002|XXGoport_binding_oport|539|0|850|0|{.5|.5|{0|}13015|}311|193|}
{2010213001|XXGoport_dst_flow|540|0|851|0|{0|}311|20|}
{2010211001|XXGvertex_iport_iport|541|0|852|0|{0|in0|}167|312|}
{2010215002|XXGiport_binding_iport|542|0|854|0|{.5|.5|{0|}13017|}312|310|}
{2010214001|XXGiport_src_flow|543|0|855|0|{0|}312|19|}
{2010601001|XXGgraph_vertex_vertex|544|0|856|0|{Departition_for_SERIAL_Output|}1|313|}
{2010604001|XXGgraph_flow_flow|545|0|858|0|{Flow_1|}313|314|}
{2010604001|XXGgraph_flow_flow|546|0|860|0|{Flow_2|}313|315|}
{2010601001|XXGgraph_vertex_vertex|547|0|862|0|{Gather|}313|316|}
{2010212001|XXGvertex_oport_oport|548|0|864|0|{0|out|}316|317|}
{2010213001|XXGoport_dst_flow|549|0|866|0|{0|}317|315|}
{2010211001|XXGvertex_iport_iport|550|0|867|0|{0|in|}316|318|}
{2010214001|XXGiport_src_flow|551|0|869|0|{0|}318|314|}
{2010007001|XXGobject_proto_object|552|0|870|0|{}316|319|}
{2010212001|XXGvertex_oport_oport|553|0|872|0|{0|out|}319|320|}
{2010006001|XXGobject_psameas_object|554|0|874|0|{metadata|out_metadata|1|0|}320|319|}
{2010211001|XXGvertex_iport_iport|555|0|875|0|{0|in|}319|321|}
{2010006001|XXGobject_psameas_object|556|0|877|0|{metadata|in_metadata|1|0|}321|319|}
{2010006001|XXGobject_psameas_object|557|0|878|0|{Layout|Layout|0|0|}316|322|}
{2010211001|XXGvertex_iport_iport|558|0|880|0|{0|write|}322|323|}
{2010214001|XXGiport_src_flow|559|0|882|0|{0|}323|22|}
{2010007001|XXGobject_proto_object|560|0|883|0|{}322|324|}
{2010211001|XXGvertex_iport_iport|561|0|885|0|{0|write|}324|325|}
{2010006001|XXGobject_psameas_object|562|0|887|0|{metadata|write_metadata|1|0|}325|324|}
{2010006001|XXGobject_psameas_object|563|0|888|0|{in_metadata|write_metadata|0|0|}316|322|}
{2010006001|XXGobject_psameas_object|564|0|889|0|{out_metadata|write_metadata|0|0|}316|322|}
{2010601001|XXGgraph_vertex_vertex|565|0|890|0|{Rplct_Input_Layout|}313|326|}
{2010212001|XXGvertex_oport_oport|566|0|892|0|{0|out|}326|327|}
{2010213001|XXGoport_dst_flow|567|0|894|0|{0|}327|314|}
{2010211001|XXGvertex_iport_iport|568|0|895|0|{0|in|}326|328|}
{2010007001|XXGobject_proto_object|569|0|897|0|{}326|329|}
{2010212001|XXGvertex_oport_oport|570|0|899|0|{0|out|}329|330|}
{2010006001|XXGobject_psameas_object|571|0|901|0|{metadata|out_metadata|1|0|}330|329|}
{2010211001|XXGvertex_iport_iport|572|0|902|0|{0|in|}329|331|}
{2010006001|XXGobject_psameas_object|573|0|904|0|{metadata|in_metadata|1|0|}331|329|}
{2010006001|XXGobject_psameas_object|574|0|905|0|{Layout|Layout|0|0|}326|332|}
{2010212001|XXGvertex_oport_oport|575|0|907|0|{0|out|}332|333|}
{2010213001|XXGoport_dst_flow|576|0|909|0|{0|}333|334|}
{2010213001|XXGoport_dst_flow|577|0|911|0|{1|}333|335|}
{2010211001|XXGvertex_iport_iport|578|0|913|0|{0|in|}332|336|}
{2010007001|XXGobject_proto_object|579|0|915|0|{}332|337|}
{2010212001|XXGvertex_oport_oport|580|0|917|0|{0|out|}337|338|}
{2010006001|XXGobject_psameas_object|581|0|919|0|{metadata|out_metadata|1|0|}338|337|}
{2010211001|XXGvertex_iport_iport|582|0|920|0|{0|in|}337|339|}
{2010006001|XXGobject_psameas_object|583|0|922|0|{metadata|in_metadata|1|0|}339|337|}
{2010006001|XXGobject_psameas_object|584|0|923|0|{Layout|Layout|0|0|}332|133|}
{2010006001|XXGobject_psameas_object|585|0|924|0|{in_metadata|out_metadata|0|0|}332|141|}
{2010006001|XXGobject_psameas_object|586|0|925|0|{out_metadata|out_metadata|0|0|}332|141|}
{2010006001|XXGobject_psameas_object|587|0|926|0|{in_metadata|write_metadata|0|0|}326|322|}
{2010006001|XXGobject_psameas_object|588|0|927|0|{out_metadata|write_metadata|0|0|}326|322|}
{2010601001|XXGgraph_vertex_vertex|589|0|928|0|{Rplct_Ouput_Layout|}313|340|}
{2010212001|XXGvertex_oport_oport|590|0|930|0|{0|out|}340|341|}
{2010211001|XXGvertex_iport_iport|591|0|932|0|{0|in|}340|342|}
{2010214001|XXGiport_src_flow|592|0|934|0|{0|}342|315|}
{2010007001|XXGobject_proto_object|593|0|935|0|{}340|343|}
{2010212001|XXGvertex_oport_oport|594|0|937|0|{0|out|}343|344|}
{2010006001|XXGobject_psameas_object|595|0|939|0|{metadata|out_metadata|1|0|}344|343|}
{2010211001|XXGvertex_iport_iport|596|0|940|0|{0|in|}343|345|}
{2010006001|XXGobject_psameas_object|597|0|942|0|{metadata|in_metadata|1|0|}345|343|}
{2010006001|XXGobject_psameas_object|598|0|943|0|{Layout|Layout|0|0|}340|322|}
{2010006001|XXGobject_psameas_object|599|0|944|0|{in_metadata|write_metadata|0|0|}340|322|}
{2010006001|XXGobject_psameas_object|600|0|945|0|{out_metadata|write_metadata|0|0|}340|322|}
{2010212001|XXGvertex_oport_oport|601|0|946|0|{0|out0|}313|346|}
{2010216002|XXGoport_binding_oport|602|0|948|0|{.5|.5|{0|}12477|}346|341|}
{2010213001|XXGoport_dst_flow|603|0|949|0|{0|}346|22|}
{2010211001|XXGvertex_iport_iport|604|0|950|0|{0|in0|}313|347|}
{2010215002|XXGiport_binding_iport|605|0|952|0|{.5|.5|{0|}12475|}347|328|}
{2010214001|XXGiport_src_flow|606|0|953|0|{0|}347|23|}
{2010601001|XXGgraph_vertex_vertex|607|0|954|0|{Discard_Suppressed_Data|}1|348|}
{2010211001|XXGvertex_iport_iport|608|0|956|0|{0|in|}348|349|}
{2010214001|XXGiport_src_flow|609|0|958|0|{0|}349|21|}
{2010007001|XXGobject_proto_object|610|0|959|0|{}348|350|}
{2010211001|XXGvertex_iport_iport|611|0|961|0|{0|in|}350|351|}
{2010006001|XXGobject_psameas_object|612|0|963|0|{metadata|in_metadata|1|0|}351|350|}
{2010006001|XXGobject_psameas_object|613|0|964|0|{Layout|Layout|0|0|}348|133|}
{2010006001|XXGobject_psameas_object|614|0|965|0|{in_metadata|out_metadata|0|0|}348|141|}
{2010601001|XXGgraph_vertex_vertex|615|0|966|0|{Event_Consumption_Log_Entry|}1|352|}
{2010604001|XXGgraph_flow_flow|616|0|968|0|{Flow_18|}352|353|}
{2010604001|XXGgraph_flow_flow|617|0|970|0|{Flow_22|}352|354|}
{2010601001|XXGgraph_vertex_vertex|618|0|972|0|{Consumption_Log|}352|355|}
{2010211001|XXGvertex_iport_iport|619|0|974|0|{0|write|}355|356|}
{2010214001|XXGiport_src_flow|620|0|976|0|{0|}356|353|}
{2010007001|XXGobject_proto_object|621|0|977|0|{}355|357|}
{2010211001|XXGvertex_iport_iport|622|0|979|0|{0|write|}357|358|}
{2010006001|XXGobject_psameas_object|623|0|981|0|{metadata|write_metadata|1|0|}358|357|}
{2010601001|XXGgraph_vertex_vertex|624|0|982|0|{Interim_Events_Log|}352|359|}
{2010212001|XXGvertex_oport_oport|625|0|984|0|{0|read|}359|360|}
{2010213001|XXGoport_dst_flow|626|0|986|0|{0|}360|354|}
{2010007001|XXGobject_proto_object|627|0|987|0|{}359|361|}
{2010212001|XXGvertex_oport_oport|628|0|989|0|{0|read|}361|362|}
{2010006001|XXGobject_psameas_object|629|0|991|0|{metadata|read_metadata|1|0|}362|361|}
{2010601001|XXGgraph_vertex_vertex|630|0|992|0|{Updating_Consumption_Entry|}352|363|}
{2010212001|XXGvertex_oport_oport|631|0|994|0|{0|out|}363|364|}
{2010213001|XXGoport_dst_flow|632|0|996|0|{0|}364|353|}
{2010211001|XXGvertex_iport_iport|633|0|997|0|{0|in|}363|365|}
{2010214001|XXGiport_src_flow|634|0|999|0|{0|}365|354|}
{2010007001|XXGobject_proto_object|635|0|1000|0|{}363|366|}
{2010212001|XXGvertex_oport_oport|636|0|1002|0|{0|out|}366|367|}
{2010006001|XXGobject_psameas_object|637|0|1004|0|{metadata|out_metadata|1|0|}367|366|}
{2010211001|XXGvertex_iport_iport|638|0|1005|0|{0|in|}366|368|}
{2010006001|XXGobject_psameas_object|639|0|1007|0|{metadata|in_metadata|1|0|}368|366|}
{2010006001|XXGobject_psameas_object|640|0|1008|0|{Layout|Layout|0|0|}363|355|}
{2010006001|XXGobject_psameas_object|641|0|1009|0|{in_metadata|read_metadata|0|0|}363|359|}
{2010006001|XXGobject_psameas_object|642|0|1010|0|{out_metadata|read_metadata|0|0|}363|359|}
{2010601001|XXGgraph_vertex_vertex|643|0|1011|0|{FBE_Filter_Control_Info|}1|369|}
{2010212001|XXGvertex_oport_oport|644|0|1013|0|{0|out|}369|370|}
{2010213001|XXGoport_dst_flow|645|0|1015|0|{0|}370|25|}
{2010212001|XXGvertex_oport_oport|646|0|1016|0|{1|deselect|}369|371|}
{2010213001|XXGoport_dst_flow|647|0|1018|0|{0|}371|14|}
{2010212001|XXGvertex_oport_oport|648|0|1019|0|{2|reject|}369|372|}
{2010212001|XXGvertex_oport_oport|649|0|1021|0|{3|error|}369|373|}
{2010212001|XXGvertex_oport_oport|650|0|1023|0|{4|log|}369|374|}
{2010211001|XXGvertex_iport_iport|651|0|1025|0|{0|in|}369|375|}
{2010214001|XXGiport_src_flow|652|0|1027|0|{0|}375|24|}
{2010007001|XXGobject_proto_object|653|0|1028|0|{}369|376|}
{2010212001|XXGvertex_oport_oport|654|0|1030|0|{0|out|}376|377|}
{2010006001|XXGobject_psameas_object|655|0|1032|0|{metadata|out_metadata|1|0|}377|376|}
{2010212001|XXGvertex_oport_oport|656|0|1033|0|{1|deselect|}376|378|}
{2010006001|XXGobject_psameas_object|657|0|1035|0|{metadata|deselect_metadata|1|0|}378|376|}
{2010212001|XXGvertex_oport_oport|658|0|1036|0|{2|reject|}376|379|}
{2010006001|XXGobject_psameas_object|659|0|1038|0|{metadata|reject_metadata|1|0|}379|376|}
{2010212001|XXGvertex_oport_oport|660|0|1039|0|{3|error|}376|380|}
{2010006001|XXGobject_psameas_object|661|0|1041|0|{metadata|error_metadata|1|0|}380|376|}
{2010212001|XXGvertex_oport_oport|662|0|1042|0|{4|log|}376|381|}
{2010006001|XXGobject_psameas_object|663|0|1044|0|{metadata|log_metadata|1|0|}381|376|}
{2010211001|XXGvertex_iport_iport|664|0|1045|0|{0|in|}376|382|}
{2010006001|XXGobject_psameas_object|665|0|1047|0|{metadata|in_metadata|1|0|}382|376|}
{2010006001|XXGobject_psameas_object|666|0|1048|0|{Layout|Layout|0|0|}369|383|}
{2010211001|XXGvertex_iport_iport|667|0|1050|0|{0|write|}383|384|}
{2010214001|XXGiport_src_flow|668|0|1052|0|{0|}384|16|}
{2010007001|XXGobject_proto_object|669|0|1053|0|{}383|385|}
{2010211001|XXGvertex_iport_iport|670|0|1055|0|{0|write|}385|386|}
{2010006001|XXGobject_psameas_object|671|0|1057|0|{metadata|write_metadata|1|0|}386|385|}
{2010006001|XXGobject_psameas_object|672|0|1058|0|{deselect_metadata|log_metadata|0|0|}369|387|}
{2010212001|XXGvertex_oport_oport|673|0|1060|0|{0|out|}387|388|}
{2010213001|XXGoport_dst_flow|674|0|1062|0|{0|}388|29|}
{2010212001|XXGvertex_oport_oport|675|0|1063|0|{1|reject|}387|389|}
{2010212001|XXGvertex_oport_oport|676|0|1065|0|{2|error|}387|390|}
{2010212001|XXGvertex_oport_oport|677|0|1067|0|{3|log|}387|391|}
{2010213001|XXGoport_dst_flow|678|0|1069|0|{0|}391|15|}
{2010211001|XXGvertex_iport_iport|679|0|1070|0|{0|in|}387|392|}
{2010214001|XXGiport_src_flow|680|0|1072|0|{0|}392|17|}
{2010007001|XXGobject_proto_object|681|0|1073|0|{}387|393|}
{2010212001|XXGvertex_oport_oport|682|0|1075|0|{0|out|}393|394|}
{2010006001|XXGobject_psameas_object|683|0|1077|0|{metadata|out_metadata|1|0|}394|393|}
{2010212001|XXGvertex_oport_oport|684|0|1078|0|{1|reject|}393|395|}
{2010006001|XXGobject_psameas_object|685|0|1080|0|{metadata|reject_metadata|1|0|}395|393|}
{2010212001|XXGvertex_oport_oport|686|0|1081|0|{2|error|}393|396|}
{2010006001|XXGobject_psameas_object|687|0|1083|0|{metadata|error_metadata|1|0|}396|393|}
{2010212001|XXGvertex_oport_oport|688|0|1084|0|{3|log|}393|397|}
{2010006001|XXGobject_psameas_object|689|0|1086|0|{metadata|log_metadata|1|0|}397|393|}
{2010211001|XXGvertex_iport_iport|690|0|1087|0|{0|in|}393|398|}
{2010006001|XXGobject_psameas_object|691|0|1089|0|{metadata|in_metadata|1|0|}398|393|}
{2010006001|XXGobject_psameas_object|692|0|1090|0|{Layout|Layout|0|0|}387|383|}
{2010006001|XXGobject_psameas_object|693|0|1091|0|{in_metadata|log_metadata|0|0|}387|387|}
{2010006001|XXGobject_psameas_object|694|0|1092|0|{out_metadata|write_metadata|0|0|}387|45|}
{2010006001|XXGobject_psameas_object|695|0|1093|0|{reject_metadata|log_metadata|0|0|}387|387|}
{2010006001|XXGobject_psameas_object|696|0|1094|0|{in_metadata|log_metadata|0|0|}369|387|}
{2010006001|XXGobject_psameas_object|697|0|1095|0|{out_metadata|log_metadata|0|0|}369|387|}
{2010006001|XXGobject_psameas_object|698|0|1096|0|{reject_metadata|log_metadata|0|0|}369|387|}
{2010601001|XXGgraph_vertex_vertex|699|0|1097|0|{Filter_IDS_Data|}1|399|}
{2010212001|XXGvertex_oport_oport|700|0|1099|0|{0|out|}399|400|}
{2010213001|XXGoport_dst_flow|701|0|1101|0|{0|}400|18|}
{2010212001|XXGvertex_oport_oport|702|0|1102|0|{1|deselect|}399|401|}
{2010212001|XXGvertex_oport_oport|703|0|1104|0|{2|reject|}399|402|}
{2010212001|XXGvertex_oport_oport|704|0|1106|0|{3|error|}399|403|}
{2010212001|XXGvertex_oport_oport|705|0|1108|0|{4|log|}399|404|}
{2010211001|XXGvertex_iport_iport|706|0|1110|0|{0|in|}399|405|}
{2010214001|XXGiport_src_flow|707|0|1112|0|{0|}405|13|}
{2010007001|XXGobject_proto_object|708|0|1113|0|{}399|406|}
{2010212001|XXGvertex_oport_oport|709|0|1115|0|{0|out|}406|407|}
{2010006001|XXGobject_psameas_object|710|0|1117|0|{metadata|out_metadata|1|0|}407|406|}
{2010212001|XXGvertex_oport_oport|711|0|1118|0|{1|deselect|}406|408|}
{2010006001|XXGobject_psameas_object|712|0|1120|0|{metadata|deselect_metadata|1|0|}408|406|}
{2010212001|XXGvertex_oport_oport|713|0|1121|0|{2|reject|}406|409|}
{2010006001|XXGobject_psameas_object|714|0|1123|0|{metadata|reject_metadata|1|0|}409|406|}
{2010212001|XXGvertex_oport_oport|715|0|1124|0|{3|error|}406|410|}
{2010006001|XXGobject_psameas_object|716|0|1126|0|{metadata|error_metadata|1|0|}410|406|}
{2010212001|XXGvertex_oport_oport|717|0|1127|0|{4|log|}406|411|}
{2010006001|XXGobject_psameas_object|718|0|1129|0|{metadata|log_metadata|1|0|}411|406|}
{2010211001|XXGvertex_iport_iport|719|0|1130|0|{0|in|}406|412|}
{2010006001|XXGobject_psameas_object|720|0|1132|0|{metadata|in_metadata|1|0|}412|406|}
{2010006001|XXGobject_psameas_object|721|0|1133|0|{Layout|Layout|0|0|}399|141|}
{2010006001|XXGobject_psameas_object|722|0|1134|0|{deselect_metadata|out_metadata|0|0|}399|141|}
{2010006001|XXGobject_psameas_object|723|0|1135|0|{in_metadata|out_metadata|0|0|}399|141|}
{2010006001|XXGobject_psameas_object|724|0|1136|0|{out_metadata|out_metadata|0|0|}399|141|}
{2010006001|XXGobject_psameas_object|725|0|1137|0|{reject_metadata|out_metadata|0|0|}399|141|}
{2010601001|XXGgraph_vertex_vertex|726|0|1138|0|{First_IDS_file_for_view_data|}1|413|}
{2010212001|XXGvertex_oport_oport|727|0|1140|0|{0|read|}413|414|}
{2010213001|XXGoport_dst_flow|728|0|1142|0|{0|}414|26|}
{2010007001|XXGobject_proto_object|729|0|1143|0|{}413|415|}
{2010212001|XXGvertex_oport_oport|730|0|1145|0|{0|read|}415|416|}
{2010006001|XXGobject_psameas_object|731|0|1147|0|{metadata|read_metadata|1|0|}416|415|}
{2010601001|XXGgraph_vertex_vertex|732|0|1148|0|{Get_Job_Log|}1|383|}
{2010601001|XXGgraph_vertex_vertex|733|0|1149|0|{NoOp|}1|417|}
{2010212001|XXGvertex_oport_oport|734|0|1151|0|{0|out|}417|418|}
{2010213001|XXGoport_dst_flow|735|0|1153|0|{0|}418|27|}
{2010211001|XXGvertex_iport_iport|736|0|1154|0|{0|in|}417|419|}
{2010214001|XXGiport_src_flow|737|0|1156|0|{0|}419|29|}
{2010007001|XXGobject_proto_object|738|0|1157|0|{}417|420|}
{2010212001|XXGvertex_oport_oport|739|0|1159|0|{0|out|}420|421|}
{2010006001|XXGobject_psameas_object|740|0|1161|0|{metadata|out_metadata|1|0|}421|420|}
{2010211001|XXGvertex_iport_iport|741|0|1162|0|{0|in|}420|422|}
{2010006001|XXGobject_psameas_object|742|0|1164|0|{metadata|in_metadata|1|0|}422|420|}
{2010006001|XXGobject_psameas_object|743|0|1165|0|{Layout|Layout|0|0|}417|383|}
{2010006001|XXGobject_psameas_object|744|0|1166|0|{in_metadata|write_metadata|0|0|}417|45|}
{2010006001|XXGobject_psameas_object|745|0|1167|0|{out_metadata|write_metadata|0|0|}417|45|}
{2010601001|XXGgraph_vertex_vertex|746|0|1168|0|{Normalize_Add_Job_ID_Record_Count|}1|423|}
{2010212001|XXGvertex_oport_oport|747|0|1170|0|{0|out|}423|424|}
{2010213001|XXGoport_dst_flow|748|0|1172|0|{0|}424|23|}
{2010212001|XXGvertex_oport_oport|749|0|1173|0|{1|reject|}423|425|}
{2010212001|XXGvertex_oport_oport|750|0|1175|0|{2|error|}423|426|}
{2010212001|XXGvertex_oport_oport|751|0|1177|0|{3|log|}423|427|}
{2010213001|XXGoport_dst_flow|752|0|1179|0|{0|}427|24|}
{2010211001|XXGvertex_iport_iport|753|0|1180|0|{0|in|}423|428|}
{2010214001|XXGiport_src_flow|754|0|1182|0|{0|}428|30|}
{2010007001|XXGobject_proto_object|755|0|1183|0|{}423|429|}
{2010212001|XXGvertex_oport_oport|756|0|1185|0|{0|out|}429|430|}
{2010006001|XXGobject_psameas_object|757|0|1187|0|{metadata|out_metadata|1|0|}430|429|}
{2010212001|XXGvertex_oport_oport|758|0|1188|0|{1|reject|}429|431|}
{2010006001|XXGobject_psameas_object|759|0|1190|0|{metadata|reject_metadata|1|0|}431|429|}
{2010212001|XXGvertex_oport_oport|760|0|1191|0|{2|error|}429|432|}
{2010006001|XXGobject_psameas_object|761|0|1193|0|{metadata|error_metadata|1|0|}432|429|}
{2010212001|XXGvertex_oport_oport|762|0|1194|0|{3|log|}429|433|}
{2010006001|XXGobject_psameas_object|763|0|1196|0|{metadata|log_metadata|1|0|}433|429|}
{2010211001|XXGvertex_iport_iport|764|0|1197|0|{0|in|}429|434|}
{2010006001|XXGobject_psameas_object|765|0|1199|0|{metadata|in_metadata|1|0|}434|429|}
{2010006001|XXGobject_psameas_object|766|0|1200|0|{Layout|Layout|0|0|}423|332|}
{2010006001|XXGobject_psameas_object|767|0|1201|0|{in_metadata|out_metadata|0|0|}423|141|}
{2010006001|XXGobject_psameas_object|768|0|1202|0|{out_metadata|write_metadata|0|0|}423|322|}
{2010006001|XXGobject_psameas_object|769|0|1203|0|{reject_metadata|out_metadata|0|0|}423|141|}
{2010601001|XXGgraph_vertex_vertex|770|0|1204|0|{Optional_Ctrl|}1|45|}
{2010601001|XXGgraph_vertex_vertex|771|0|1205|0|{Partition_And_Or_Sort_for_MFS_Output|}1|435|}
{2010604001|XXGgraph_flow_flow|772|0|1207|0|{Flow_14|}435|436|}
{2010604001|XXGgraph_flow_flow|773|0|1209|0|{Flow_15|}435|335|}
{2010604001|XXGgraph_flow_flow|774|0|1210|0|{Flow_17|}435|437|}
{2010604001|XXGgraph_flow_flow|775|0|1212|0|{Flow_19|}435|438|}
{2010604001|XXGgraph_flow_flow|776|0|1214|0|{Flow_6|}435|334|}
{2010604001|XXGgraph_flow_flow|777|0|1215|0|{Flow_7|}435|439|}
{2010601001|XXGgraph_vertex_vertex|778|0|1217|0|{PBK_PBK_KEY_|}435|440|}
{2010212001|XXGvertex_oport_oport|779|0|1219|0|{0|out|}440|441|}
{2010213001|XXGoport_dst_flow|780|0|1221|0|{0|}441|439|}
{2010211001|XXGvertex_iport_iport|781|0|1222|0|{0|in|}440|442|}
{2010214001|XXGiport_src_flow|782|0|1224|0|{0|}442|334|}
{2010007001|XXGobject_proto_object|783|0|1225|0|{}440|443|}
{2010212001|XXGvertex_oport_oport|784|0|1227|0|{0|out|}443|444|}
{2010006001|XXGobject_psameas_object|785|0|1229|0|{metadata|out_metadata|1|0|}444|443|}
{2010211001|XXGvertex_iport_iport|786|0|1230|0|{0|in|}443|445|}
{2010006001|XXGobject_psameas_object|787|0|1232|0|{metadata|in_metadata|1|0|}445|443|}
{2010006001|XXGobject_psameas_object|788|0|1233|0|{Layout|Layout|0|0|}440|332|}
{2010006001|XXGobject_psameas_object|789|0|1234|0|{in_metadata|out_metadata|0|0|}440|141|}
{2010006001|XXGobject_psameas_object|790|0|1235|0|{out_metadata|out_metadata|0|0|}440|141|}
{2010601001|XXGgraph_vertex_vertex|791|0|1236|0|{PBRR|}435|446|}
{2010212001|XXGvertex_oport_oport|792|0|1238|0|{0|out|}446|447|}
{2010213001|XXGoport_dst_flow|793|0|1240|0|{0|}447|437|}
{2010211001|XXGvertex_iport_iport|794|0|1241|0|{0|in|}446|448|}
{2010214001|XXGiport_src_flow|795|0|1243|0|{0|}448|335|}
{2010007001|XXGobject_proto_object|796|0|1244|0|{}446|449|}
{2010212001|XXGvertex_oport_oport|797|0|1246|0|{0|out|}449|450|}
{2010006001|XXGobject_psameas_object|798|0|1248|0|{metadata|out_metadata|1|0|}450|449|}
{2010211001|XXGvertex_iport_iport|799|0|1249|0|{0|in|}449|451|}
{2010006001|XXGobject_psameas_object|800|0|1251|0|{metadata|in_metadata|1|0|}451|449|}
{2010006001|XXGobject_psameas_object|801|0|1252|0|{Layout|Layout|0|0|}446|332|}
{2010006001|XXGobject_psameas_object|802|0|1253|0|{in_metadata|out_metadata|0|0|}446|141|}
{2010006001|XXGobject_psameas_object|803|0|1254|0|{out_metadata|out_metadata|0|0|}446|141|}
{2010601001|XXGgraph_vertex_vertex|804|0|1255|0|{Rplct|}435|452|}
{2010212001|XXGvertex_oport_oport|805|0|1257|0|{0|out|}452|453|}
{2010213001|XXGoport_dst_flow|806|0|1259|0|{0|}453|436|}
{2010211001|XXGvertex_iport_iport|807|0|1260|0|{0|in|}452|454|}
{2010214001|XXGiport_src_flow|808|0|1262|0|{0|}454|439|}
{2010007001|XXGobject_proto_object|809|0|1263|0|{}452|455|}
{2010212001|XXGvertex_oport_oport|810|0|1265|0|{0|out|}455|456|}
{2010006001|XXGobject_psameas_object|811|0|1267|0|{metadata|out_metadata|1|0|}456|455|}
{2010211001|XXGvertex_iport_iport|812|0|1268|0|{0|in|}455|457|}
{2010006001|XXGobject_psameas_object|813|0|1270|0|{metadata|in_metadata|1|0|}457|455|}
{2010006001|XXGobject_psameas_object|814|0|1271|0|{Layout|Layout|0|0|}452|458|}
{2010212001|XXGvertex_oport_oport|815|0|1273|0|{0|out|}458|459|}
{2010211001|XXGvertex_iport_iport|816|0|1275|0|{0|in|}458|460|}
{2010214001|XXGiport_src_flow|817|0|1277|0|{0|}460|438|}
{2010214001|XXGiport_src_flow|818|0|1278|0|{1|}460|437|}
{2010007001|XXGobject_proto_object|819|0|1279|0|{}458|461|}
{2010212001|XXGvertex_oport_oport|820|0|1281|0|{0|out|}461|462|}
{2010006001|XXGobject_psameas_object|821|0|1283|0|{metadata|out_metadata|1|0|}462|461|}
{2010211001|XXGvertex_iport_iport|822|0|1284|0|{0|in|}461|463|}
{2010006001|XXGobject_psameas_object|823|0|1286|0|{metadata|in_metadata|1|0|}463|461|}
{2010006001|XXGobject_psameas_object|824|0|1287|0|{Layout|Layout|0|0|}458|332|}
{2010006001|XXGobject_psameas_object|825|0|1288|0|{in_metadata|out_metadata|0|0|}458|141|}
{2010006001|XXGobject_psameas_object|826|0|1289|0|{out_metadata|out_metadata|0|0|}458|141|}
{2010006001|XXGobject_psameas_object|827|0|1290|0|{in_metadata|out_metadata|0|0|}452|141|}
{2010006001|XXGobject_psameas_object|828|0|1291|0|{out_metadata|out_metadata|0|0|}452|141|}
{2010601001|XXGgraph_vertex_vertex|829|0|1292|0|{Rplct_Input_Layout|}435|332|}
{2010601001|XXGgraph_vertex_vertex|830|0|1293|0|{Rplct_Ouput_Layout|}435|458|}
{2010601001|XXGgraph_vertex_vertex|831|0|1294|0|{Srt_SRT_KEY_|}435|464|}
{2010212001|XXGvertex_oport_oport|832|0|1296|0|{0|out|}464|465|}
{2010213001|XXGoport_dst_flow|833|0|1298|0|{0|}465|438|}
{2010211001|XXGvertex_iport_iport|834|0|1299|0|{0|in|}464|466|}
{2010214001|XXGiport_src_flow|835|0|1301|0|{0|}466|436|}
{2010007001|XXGobject_proto_object|836|0|1302|0|{}464|467|}
{2010212001|XXGvertex_oport_oport|837|0|1304|0|{0|out|}467|468|}
{2010006001|XXGobject_psameas_object|838|0|1306|0|{metadata|out_metadata|1|0|}468|467|}
{2010211001|XXGvertex_iport_iport|839|0|1307|0|{0|in|}467|469|}
{2010006001|XXGobject_psameas_object|840|0|1309|0|{metadata|in_metadata|1|0|}469|467|}
{2010006001|XXGobject_psameas_object|841|0|1310|0|{Layout|Layout|0|0|}464|332|}
{2010006001|XXGobject_psameas_object|842|0|1311|0|{in_metadata|out_metadata|0|0|}464|141|}
{2010006001|XXGobject_psameas_object|843|0|1312|0|{out_metadata|out_metadata|0|0|}464|141|}
{2010212001|XXGvertex_oport_oport|844|0|1313|0|{0|out0|}435|470|}
{2010216002|XXGoport_binding_oport|845|0|1315|0|{.5|.5|{0|}12465|}470|459|}
{2010213001|XXGoport_dst_flow|846|0|1316|0|{0|}470|30|}
{2010211001|XXGvertex_iport_iport|847|0|1317|0|{0|in0|}435|471|}
{2010215002|XXGiport_binding_iport|848|0|1319|0|{.5|.5|{0|}12463|}471|336|}
{2010214001|XXGiport_src_flow|849|0|1320|0|{0|}471|20|}
{2010601001|XXGgraph_vertex_vertex|850|0|1321|0|{Read_IDS_Files|}1|472|}
{2010604001|XXGgraph_flow_flow|851|0|1323|0|{Flow_1|}472|149|}
{2010604001|XXGgraph_flow_flow|852|0|1324|0|{Flow_7|}472|160|}
{2010601001|XXGgraph_vertex_vertex|853|0|1325|0|{Broadcast|}472|473|}
{2010212001|XXGvertex_oport_oport|854|0|1327|0|{0|out|}473|474|}
{2010213001|XXGoport_dst_flow|855|0|1329|0|{0|}474|149|}
{2010211001|XXGvertex_iport_iport|856|0|1330|0|{0|in|}473|475|}
{2010214001|XXGiport_src_flow|857|0|1332|0|{0|}475|160|}
{2010007001|XXGobject_proto_object|858|0|1333|0|{}473|476|}
{2010212001|XXGvertex_oport_oport|859|0|1335|0|{0|out|}476|477|}
{2010006001|XXGobject_psameas_object|860|0|1337|0|{metadata|out_metadata|1|0|}477|476|}
{2010211001|XXGvertex_iport_iport|861|0|1338|0|{0|in|}476|478|}
{2010006001|XXGobject_psameas_object|862|0|1340|0|{metadata|in_metadata|1|0|}478|476|}
{2010006001|XXGobject_psameas_object|863|0|1341|0|{Layout|Layout|0|0|}473|158|}
{2010006001|XXGobject_psameas_object|864|0|1342|0|{in_metadata|out_metadata|0|0|}473|158|}
{2010006001|XXGobject_psameas_object|865|0|1343|0|{out_metadata|out_metadata|0|0|}473|158|}
{2010601001|XXGgraph_vertex_vertex|866|0|1344|0|{List_IDS_Files|}472|158|}
{2010601001|XXGgraph_vertex_vertex|867|0|1345|0|{RMF_Read_IDS_Files|}472|141|}
{2010212001|XXGvertex_oport_oport|868|0|1346|0|{0|out0|}472|479|}
{2010216002|XXGoport_binding_oport|869|0|1348|0|{.5|.5|{0|}12254|}479|142|}
{2010213001|XXGoport_dst_flow|870|0|1349|0|{0|}479|13|}
{2010601001|XXGgraph_vertex_vertex|871|0|1350|0|{Rllp_Gen_Ctrl_File|}1|387|}
{2010601001|XXGgraph_vertex_vertex|872|0|1351|0|{Rollup_Job_Info|}1|480|}
{2010212001|XXGvertex_oport_oport|873|0|1353|0|{0|out|}480|481|}
{2010213001|XXGoport_dst_flow|874|0|1355|0|{0|}481|16|}
{2010212001|XXGvertex_oport_oport|875|0|1356|0|{1|reject|}480|482|}
{2010212001|XXGvertex_oport_oport|876|0|1358|0|{2|error|}480|483|}
{2010212001|XXGvertex_oport_oport|877|0|1360|0|{3|log|}480|484|}
{2010211001|XXGvertex_iport_iport|878|0|1362|0|{0|in|}480|485|}
{2010214001|XXGiport_src_flow|879|0|1364|0|{0|}485|15|}
{2010214001|XXGiport_src_flow|880|0|1365|0|{1|}485|14|}
{2010007001|XXGobject_proto_object|881|0|1366|0|{}480|486|}
{2010212001|XXGvertex_oport_oport|882|0|1368|0|{0|out|}486|487|}
{2010006001|XXGobject_psameas_object|883|0|1370|0|{metadata|out_metadata|1|0|}487|486|}
{2010212001|XXGvertex_oport_oport|884|0|1371|0|{1|reject|}486|488|}
{2010006001|XXGobject_psameas_object|885|0|1373|0|{metadata|reject_metadata|1|0|}488|486|}
{2010212001|XXGvertex_oport_oport|886|0|1374|0|{2|error|}486|489|}
{2010006001|XXGobject_psameas_object|887|0|1376|0|{metadata|error_metadata|1|0|}489|486|}
{2010212001|XXGvertex_oport_oport|888|0|1377|0|{3|log|}486|490|}
{2010006001|XXGobject_psameas_object|889|0|1379|0|{metadata|log_metadata|1|0|}490|486|}
{2010211001|XXGvertex_iport_iport|890|0|1380|0|{0|in|}486|491|}
{2010006001|XXGobject_psameas_object|891|0|1382|0|{metadata|in_metadata|1|0|}491|486|}
{2010006001|XXGobject_psameas_object|892|0|1383|0|{Layout|Layout|0|0|}480|383|}
{2010006001|XXGobject_psameas_object|893|0|1384|0|{in_metadata|log_metadata|0|0|}480|387|}
{2010006001|XXGobject_psameas_object|894|0|1385|0|{out_metadata|write_metadata|0|0|}480|383|}
{2010006001|XXGobject_psameas_object|895|0|1386|0|{reject_metadata|log_metadata|0|0|}480|387|}
{2010601001|XXGgraph_vertex_vertex|896|0|1387|0|{Rplct_Dummy|}1|492|}
{2010212001|XXGvertex_oport_oport|897|0|1389|0|{0|out|}492|493|}
{2010213001|XXGoport_dst_flow|898|0|1391|0|{0|}493|17|}
{2010211001|XXGvertex_iport_iport|899|0|1392|0|{0|in|}492|494|}
{2010214001|XXGiport_src_flow|900|0|1394|0|{0|}494|25|}
{2010007001|XXGobject_proto_object|901|0|1395|0|{}492|495|}
{2010212001|XXGvertex_oport_oport|902|0|1397|0|{0|out|}495|496|}
{2010006001|XXGobject_psameas_object|903|0|1399|0|{metadata|out_metadata|1|0|}496|495|}
{2010211001|XXGvertex_iport_iport|904|0|1400|0|{0|in|}495|497|}
{2010006001|XXGobject_psameas_object|905|0|1402|0|{metadata|in_metadata|1|0|}497|495|}
{2010006001|XXGobject_psameas_object|906|0|1403|0|{Layout|Layout|0|0|}492|383|}
{2010006001|XXGobject_psameas_object|907|0|1404|0|{in_metadata|log_metadata|0|0|}492|387|}
{2010006001|XXGobject_psameas_object|908|0|1405|0|{out_metadata|log_metadata|0|0|}492|387|}
{2010601001|XXGgraph_vertex_vertex|909|0|1406|0|{Source|}1|322|}
{2010601001|XXGgraph_vertex_vertex|910|0|1407|0|{Trash|}1|498|}
{2010211001|XXGvertex_iport_iport|911|0|1409|0|{0|in|}498|499|}
{2010214001|XXGiport_src_flow|912|0|1411|0|{0|}499|26|}
{2010007001|XXGobject_proto_object|913|0|1412|0|{}498|500|}
{2010211001|XXGvertex_iport_iport|914|0|1414|0|{0|in|}500|501|}
{2010006001|XXGobject_psameas_object|915|0|1416|0|{metadata|in_metadata|1|0|}501|500|}
{2010006001|XXGobject_psameas_object|916|0|1417|0|{in_metadata|read_metadata|0|0|}498|413|}
{2010109001|XXGobject_property_value|917|0|1418|0|{0|TrackingThumbprint|72|}1|502|}
