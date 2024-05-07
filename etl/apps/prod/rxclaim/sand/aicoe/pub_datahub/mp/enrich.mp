@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|597|rel_count|1024|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS||24|3|Kc||{0|}}
{30001002|XXparameter|___Intermediate_Pset_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_PATH_SERIAL|$AI_SERIAL_LOOKUP|3|2|EK$|When creating a lookup, this path will be used for serial output|{0|}}
{30001002|XXparameter|LOOKUP_PATH_MFS|$AI_MFS_LOOKUP|3|2|EK$|When creating a lookup, this path will be used for MFS output|{0|}}
{30001002|XXparameter|AI_DML|$AI_DML|3|9|EFK|This parameter is added to resolve DML   path in scope of private project|{0|}}
{30001002|XXparameter|AI_XFR|$AI_XFR|3|9|EFK|This parameter is added to resolve XFR  path in scope of private project|{0|}}
{30001002|XXparameter|AI_CAT|$AI_CAT|3|9|EFK|This parameter is added to resolve CAT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS_PENDING|$AI_MFS_PENDING|3|9|FK|This parameter is added to resolve MFS PENDING  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_PENDING|$AI_SERIAL_PENDING|3|9|FK|This parameter is added to resolve SERIAL PENDING  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_TEMP|$AI_SERIAL_TEMP|3|9|FK|This parameter is added to resolve SERIAL TEMP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS_TEMP|$AI_MFS_TEMP|3|9|FK|This parameter is added to resolve MFS TEMP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_LOOKUP|$AI_SERIAL_LOOKUP|3|9|FK|This parameter is added to resolve SERIAL LOOKUP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS_REJECT|$AI_MFS_REJECT|3|9|FK|This parameter is added to resolve MFS REJECT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_REJECT|$AI_SERIAL_REJECT|3|9|FK|This parameter is added to resolve REJECT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_LOG|$AI_SERIAL_LOG|3|9|FK|This parameter is added to resolve LOG path in scope of private project|{0|}}
{30001002|XXparameter|JAVA_HOME|AI_PHASE|3|10|EFKd|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|RUN_ID|$[(decimal(","))(integer(8))now1()]|3|9|EFK||{0|}}
{30001002|XXparameter|EXTERNAL_RUN_ID||3|9|FK|A unique identifier for the run. This is typically passed in from an outer plan that wants to keep track of tasks that ran in a single plan run. This is used, for example, in setting up the log file name of the list of files read.|{0|}}
{30001002|XXparameter|AB_CATALOG||3|2|EFK$|Catalog file containing all the lookups that will be used in the XFR|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|INPUT_FILE_PATH||3|2|RFK$|Ful path of the input file to be transformed. This supports file patterns also, e.g. $AI_SERIAL_PENDING/source.*.YYYYMMDD.dat|{0|}}
{30001002|XXparameter|READ_EXCEL|N|3|9|FK|This parameter will be passed if input file is excel|{0|}}
{30001002|XXparameter|SHEET_INDEX|3|3|2|RFK$|@{0|}}
{30001002|XXparameter|INPUT_FILE_DML||3|2|RFK$|File containing the record format of the input file.|{0|}}
{30001002|XXparameter|HEADER_COUNT|@3|9|FK|Number of headers in the file. Only applicable for serial input.|{0|}}
{30001002|XXparameter|SORT_KEY|@3|9|FK|@{0|}}
{30001002|XXparameter|USE_DEDUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|USE_SCAN|False|13|9|FK|@{0|}}
{30001002|XXparameter|USE_ROLLUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|SCAN_XFR|@3|9|FK|@{0|}}
{30001002|XXparameter|ROLLUP_XFR|$AI_XFR/aggr.rt270p.xfr|3|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION|AB_PARAMETER_ENV|3|10|RKd|Directory where the input file is located.|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$[string_substring(INPUT_FILE_PATH, string_rindex(INPUT_FILE_PATH, "/") + 1, 999)]|3|9|RK|@{0|}}
{30001002|XXparameter|IS_MFS|AB_PARAMETER_ENV|13|10|RKd|Flag to signify if the source is a multifile.|{0|}}
{30001002|XXparameter|INPUT_FILE|@3|9|FK|This parameter will be passed if input file is excel|{0|}}
{30001002|XXparameter|OUTPUT_DATASET_TYPE|TRANSACTION|15|9|FK|Type of dataset to be created. TRANSACTION for fact type or incremental files, and REFERENCE for lookup type data.|{2|REFERENCE|TRANSACTION|}}
{30001002|XXparameter|DATE_ATTACH|$[ (string("")) (date("YYYYMMDD")) now1()]|3|9|K|This paremeter will be used to construct the log error and reject file names.|{0|}}
{30001002|XXparameter|OUTPUT_FILE_NAME|@3|9|RFK|Name with which the output should be created.|{0|}}
{30001002|XXparameter|OUTPUT_FILE_LOCATION|$[
 if ( OUTPUT_DATASET_TYPE =='TRANSACTION'  &&  string_like(OUTPUT_FILE_NAME, "%.gz") ) AI_MFS_TEMP + '/' + OUTPUT_FILE_NAME
 else if 
 ( OUTPUT_DATASET_TYPE =='TRANSACTION') AI_MFS_TEMP + '/' + OUTPUT_FILE_NAME + '.gz'
else 
AI_SERIAL_LOOKUP + '/' + OUTPUT_FILE_NAME ]|3|9|RK|Full path of the output file of enrich. Location depends on the type of output.|{0|}}
{30001002|XXparameter|CLEAN_OUT_FILE_NAME|$[if(string_index(OUTPUT_FILE_NAME ,".dat.gz"))
string_replace(OUTPUT_FILE_NAME, ".dat.gz", "")
else if (string_index(OUTPUT_FILE_NAME ,".dat"))
string_replace(OUTPUT_FILE_NAME, ".dat", "")
else OUTPUT_FILE_NAME
]|3|9|K|This parameter is to derive a logical name for error , reject , deselect filename without .dat or .dat.gz|{0|}}
{30001002|XXparameter|ERROR_FILE_NAME|$[ CLEAN_OUT_FILE_NAME + "_" + DATE_ATTACH + ".error" ]|3|9|K|File containing error messages generated when running the enrichment transform.|{0|}}
{30001002|XXparameter|REJECT_FILE_NAME|$[ CLEAN_OUT_FILE_NAME + "_" + DATE_ATTACH + ".reject" ]|3|9|K|File containing rejected records generated when running the enrichment transform.|{0|}}
{30001002|XXparameter|DESELECT_FILE_NAME|$[ "deselect_" + CLEAN_OUT_FILE_NAME   ]|3|9|FK|Name of the file created from deselect port of filter component.|{0|}}
{30001002|XXparameter|OUTPUT_FILE_DML||3|2|RFK$|Record format of the enriched output file.|{0|}}
{30001002|XXparameter|FILTER_EXPR||3|2|FK$|Expression to filter useful records from the input file.|{0|}}
{30001002|XXparameter|MAPPING_XFR||3|2|FK$|Path of external XFR file for enrichment.|{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!ab_compatibility|3.2.4.1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|IS_MFS:sandbox|$[file_information(INPUT_FILE_LOCATION + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION:eme|$AI_SERIAL_PENDING|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION:sandbox|$[string_prefix(INPUT_FILE_PATH, string_rindex(INPUT_FILE_PATH, "/"))]|3|9||@{0|}}
{30001002|XXparameter|POST_FILTER_EXPR|@3|9|FK|This filter will be used to remove or drop any record after applying transformation logic|{0|}}
{30001002|XXparameter|___Other_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|FIRST_FILE|$[first_without_error(INPUT_FILE_LOCATION + directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0]  , "No_Matching_File" )
]|3|9|EK|This parameter is used in disabled input file to view first file in graph for resolving data and layout issues|{0|}}
{30001002|XXparameter|FIRST_FILE_NAME|$[first_without_error(directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0],"No_Matching_File" ) ]|3|9|RK|Name of the file , many xfr's needs file name to publish|{0|}}
{30001002|XXparameter|condition|@3|2|F$||{0|}}
{30001002|XXparameter|JAVA_HOME:dev|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:qa|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:uat|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:prod|/etc/alternatives/java_sdk_1.6.0|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|926000|588000|0|enrich|anwar.parvez|Created 6/12/2015 2:24:18 PM|1|100|-1||9||2049|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2058000|909000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.2.3|{1|1|}Job 'enrich' Execution Status Report


Job "enrich" Execution started at Monday, October 05, 2015 12:39:18
Job completed successfully at Monday, October 05, 2015 12:54:43

------------------------------
Job Statistics:

Job status at termination: Done
Run time (wall clock): 0:15:24
Run performed by user Mukesh.Singh
Total data moved through all flows: 0 records (-1 bytes)
Total CPU time (all processes): 3383 seconds
Average CPU utilization across all nodes: 0.00 percent
||||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Query-It||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Arial Rounded MT Bold|8388608|100|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@
Generic graph to transform a source for COGS. The 
transformations are passed in as an XFR file and
the reference data is available in the catalog pointed
to by the parameter AB_CATALOG.

|471000|16000|36000|51000|315000|64000|11383|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Condition:
[not IS_MFS]|214000|309000|0|0|0|0|10959|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Condition:
[! is_blank(FILTER_EXPR)]|484000|349000|0|0|0|0|11286|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Condition:
[not IS_MFS]|349000|309000|0|0|0|0|11224|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Condition:
$[OUTPUT_DATASET_TYPE==
'REFERENCE']|1854000|329000|0|0|0|0|11276|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@Condition:
$[OUTPUT_DATASET_TYPE==
'TRANSACTION']|1849000|134000|0|0|0|0|11274|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|17|0|33|0|{@{}@Disabled input file component to view data of first file|16000|581000|36000|51000|315000|64000|10733|}}
{2010242002|XXGface|18|0|35|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|19|0|37|0|{@{}@When we remove this, the
order of the records will get
disturbed. So need to take
care of that before removing
this.|1780000|620000|0|0|0|0|11283|}}
{2010242002|XXGface|20|0|39|0|{@{}@Arial|255|100|0|}}
{2010240003|XXGlegend|21|0|41|0|{@{}@Temporary subgraph
Only for msawp and crxawp|1780000|555000|0|0|0|0|11291|}}
{2010242002|XXGface|22|0|43|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|23|0|45|0|{@{}@Condition:
[! is_blank(FILTER_EXPR)]|599000|504000|0|0|0|0|11003|}}
{2010242002|XXGface|24|0|47|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|25|0|49|0|{@{}@$AI_SERIAL_LOG : 
Count detail|1189000|859000|0|0|0|0|11236|}}
{2010242002|XXGface|26|0|51|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|27|0|53|0|{@{}@Condition:
$[not is_blank(SORT_KEY)]

This Subgraph will be disabled
 in most of the cases|1184000|359000|0|0|0|0|11377|}}
{2010242002|XXGface|28|0|55|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|29|0|57|0|{@{}@Optional Dedup,Rollup & Scan :

If some enrichment requires aggregate
 functionality ,this subgraph should be used
|1140000|115000|0|0|0|0|11382|}}
{2010242002|XXGface|30|0|59|0|{@{}@Arial Rounded MT Bold|8388608|100|0|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}11392|19|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}11390|2065|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}11389|2065|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}11314|2065|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}11395|17|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}11268|531|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}11266|529|}}
{2010210004|XXGflow|38|0|75|0|{@{}@384|.5|.5|{0|}11385|17|}}
{2010210004|XXGflow|39|0|77|0|{@{}@384|.5|.5|{0|}11372|17|}}
{2010210004|XXGflow|40|0|79|0|{@{}@384|.5|.5|{0|}11384|17|}}
{2010210004|XXGflow|41|0|81|0|{@{}@384|.5|.5|{0|}11388|17|}}
{2010210004|XXGflow|42|0|83|0|{@{}@384|.5|.5|{0|}11281|17|}}
{2010210004|XXGflow|43|0|85|0|{@{}@384|.5|.5|{0|}11225|530|}}
{2010210004|XXGflow|44|0|87|0|{@{}@384|.5|.5|{0|}11313|17|}}
{2010210004|XXGflow|45|0|89|0|{@{}@384|.5|.5|{0|}11280|19|}}
{2010210004|XXGflow|46|0|91|0|{@{}@384|.5|.5|{0|}11278|17|}}
{2010210004|XXGflow|47|0|93|0|{@{}@384|.5|.5|{0|}11340|2065|}}
{2010210004|XXGflow|48|0|95|0|{@{}@384|.5|.5|{0|}11387|17|}}
{2010501005|XXGpvertex|49|0|97|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(POST_FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|select_expr|$POST_FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1456000|207500|0|0|0|0|11373|APPLY POST FILTER|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|50|0|99|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|51|0|102|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|52|0|104|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|53|0|106|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|54|0|108|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|55|0|110|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|56|0|113|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|57|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|58|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|59|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|60|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|61|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|62|0|130|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|63|0|133|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|$OUTPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_LOCATION", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_DATASET_TYPE=='TRANSACTION']|3|9||@{0|}}
}}@0|@1948000|231000|705000|396000|56000|50000|11341|Enrich O/P|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|64|0|135|0|{@{}@695000|414000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|65|0|138|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1368052545|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|66|0|140|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|67|0|147|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|$MAPPING_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|ENRICH|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
}}@0|@770000|215000|515000|385000|126000|69000|11391|Apply Mappings|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|149|0|{@{}@640000|414000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|69|0|152|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|70|0|155|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|71|0|158|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|160|0|{@{}@505000|414000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|163|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|reject0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052550|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|74|0|165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|75|0|169|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|76|0|172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|77|0|175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|79|0|181|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|xls|$INPUT_FILE|3|2|$|@{0|}}
{30001002|XXparameter|sheet_header_row|1|3|2|$|@{0|}}
{30001002|XXparameter|JAVA_HOME|$JAVA_HOME|3|2|$|@{0|}}
{30001002|XXparameter|java_options|-Xmx2768m|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Excel/Read_Excel.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|sheet_index|$SHEET_INDEX|3|2|$|@{0|}}
{30001002|XXparameter|dateFormat|MM/DD/YYYY|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_PENDING|3|2|$|@{0|}}
}}@0|@40000|57000|60000|77000|143000|113000|6652|Read Excel Spreadsheet|Ab Initio Software|Built-in 2.13.m8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|183|0|{@{}@202000|119000|11000|11000|out|0.0|@@@2512|0|}}
{2010501005|XXGpvertex|81|0|185|0|{Reads an Excel spreadsheet|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Read_Excel|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/excel-connector.ksh|3|2|H$||{0|}}
{30001002|XXparameter|xls||18|2|RFK$|Excel filename. Note that 'Location:' must be set to 'Host', not 'Local'.|{0|}}
{30001002|XXparameter|sheet_selection|by-index|15|1|Fl|Method of selecting sheet(s)|{3|by-name|by-index|all|}}
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
{30001002|XXparameter|record_delimiter|\\0|3|2|FK$|Delimiter of last field or record.  \\0 is recommended to facilitate handling of embedded newlines without quoting.|{0|}}
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
{30001002|XXparameter|print_dml|-print-dml|3|2|$||{0|}}
{30001002|XXparameter|print_dml.display_name|print-dml|3|9|P|@{0|}}
{30001002|XXparameter|cmd_dml|excel-connector.ksh|3|2|$||{0|}}
{30001002|XXparameter|cmd_dml_params|readit positional print-dml positional xls keyword sheet-name keyword sheet-index keyword sheet-header-row keyword utf8 keyword record-delimiter keyword use-format keyword format-attributes keyword JAVA_HOME keyword command-options keyword java-options keyword|3|2|$||{0|}}
{30001002|XXparameter|out_metadata|generated cmd_dml manual|7|13|RFv|Record Format|{0|}}
{30001002|XXparameter|dataset_analysis|eme_dataset(file)=out,r|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052546|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: out = "utf8 record string('\\\\t') sheet; string('\\\\0') line; end"|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|82|0|187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=|Record Format|{0|}}
}}@0|0|0|0|out|0.0|@@@2512|0|}}
{2010501005|XXGpvertex|83|0|192|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@502000|232000|317000|377000|132000|89000|11315|Apply Pre Filter|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|84|0|194|0|{@{}@448000|414000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|85|0|197|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|86|0|200|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|87|0|202|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|88|0|204|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|89|0|206|0|{@{}@307000|414000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|90|0|209|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|deselect_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,deselect,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052550|1|1|Hl|The last modification time of this component's template|{0|}}
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
{2010203004|XXGoport|91|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|92|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|93|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|94|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|95|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|96|0|226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|97|0|234|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_TEMP/filter/$DESELECT_FILE_NAME.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_TEMP/filter/$DESELECT_FILE_NAME.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ not is_blank(FILTER_EXPR)]|3|9||@{0|}}
}}@0|@652832|399106|600000|359000|56000|50000|11235|Deselect O/p file|Ab Initio Software||1|100|-1||6|claimstatuscd=='R'|33153|-1|-1|}}
{2010202004|XXGiport|98|0|236|0|{@{}@624000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|99|0|239|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1308869937|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|100|0|241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|101|0|245|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1704000|245000|0|0|0|0|11273|Dummy - Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|102|0|247|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|103|0|251|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|104|0|254|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|105|0|256|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|106|0|259|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|107|0|265|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@367000|270000|0|0|0|0|11226|Dummy Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|108|0|267|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|109|0|270|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|110|0|273|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|111|0|275|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|112|0|278|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|113|0|284|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1002000|242500|0|0|0|0|11381|Dummy - Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|114|0|286|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|115|0|289|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|116|0|292|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|117|0|294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|118|0|297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|119|0|304|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/$ERROR_FILE_NAME.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$ERROR_FILE_NAME.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@867832|403106|600000|359000|56000|50000|11165|Errors|Ab Initio Software||1|10|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|120|0|306|0|{@{}@624000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|121|0|309|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1308869937|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|122|0|311|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|123|0|315|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/$REJECT_FILE_NAME.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$REJECT_FILE_NAME.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=j|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@757388|399354|479000|359000|56000|50000|11163|Failed|Ab Initio Software||1|10|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|124|0|317|0|{@{}@504000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|125|0|320|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1308869937|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|126|0|322|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|127|0|326|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_DATASET_TYPE=='REFERENCE']|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@1632000|450000|0|0|0|0|11282|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|128|0|328|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|129|0|331|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|130|0|334|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|131|0|336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|132|0|339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010503005|XXGfvertex|133|0|342|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$OUTPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$OUTPUT_FILE_LOCATION", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$OUTPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_DATASET_TYPE=='REFERENCE']|3|9||@{0|}}
}}@0|@1968000|441000|705000|396000|56000|50000|11277|Intermediate LKP File|Ab Initio Software||1|9999999|0||6||33025|-1|-1|}}
{2010202004|XXGiport|134|0|344|0|{@{}@695000|414000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|135|0|347|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1368052545|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|136|0|349|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|137|0|354|0|{Subgraph created from graph "enrich"|{}@0|@981250|742250|0|0|0|0|11218|Get Record count|Mukesh.singh|Created 8/21/2015 9:19:48 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|497000|163000|3|}}
{2010210004|XXGflow|138|0|356|0|{@{}@384|.5|.5|{0|}11101|17|}}
{2010243001|XXGwatcher|139|0|358|0|{@{}@1|100|0||0|}}
{2010210004|XXGflow|140|0|360|0|{@{}@384|.5|.5|{0|}11099|17|}}
{2010243001|XXGwatcher|141|0|362|0|{@{}@1|100|0||0|}}
{2010501005|XXGpvertex|142|0|364|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.record_count::sum(in.record_count);
  
  out.process_type:: "$\{OUTPUT_DATASET_TYPE\}";
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@337000|36000|0|0|0|0|11102|Count -Local|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|143|0|366|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|144|0|368|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|145|0|370|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|146|0|372|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|147|0|374|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|148|0|377|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|149|0|379|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|150|0|382|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|151|0|385|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|152|0|388|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|153|0|391|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|154|0|394|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/audit_count_computed_source.dml|3|2|f$|@{0|}}
}}@0|@1210000|771500|0|0|0|0|11267|Output File|Ab Initio Software|@1|100|0|@6||33025|-1|-1|}}
{2010202004|XXGiport|155|0|396|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|156|0|399|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|157|0|401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|158|0|404|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out0_metadata|record 
decimal("\\x01") record_count="NULL";
string("\\x01") process_nm="unload";
string("\\x01") src_info="NULL";
string("\\x01") pset_name="NULL";
datetime("YYYY-MM-DD HH24:MI:SS") start_dttm="NULL";
datetime("YYYY-MM-DD HH24:MI:SS") end_dttm="NULL";
datetime("YYYY-MM-DD HH24:MI:SS") run_dttm;
end;|3|1|l|@{0|}}
{30001002|XXparameter|transform0|let datetime("YYYY-MM-DD HH24:MI:SS") current_time=now1();
out :: reformat(in) =
begin
out.pset_name :: if ( is_blank("$\{AB_PSET_NAME\}"))  "$\{AB_GRAPH_NAME\}" else "$\{AB_PSET_NAME\}";
out.process_nm :: "$\{AB_GRAPH_NAME\}";
out.src_info :: "ETL ENRICHMENT";
out.run_dttm :: current_time;
out.record_count :: string_filter( string_split(in.event_text,"(")[0],"0123456789");
end;|3|3|c|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select|string_lrtrim(event_type)=="finish"|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@171000|42500|0|0|0|0|11100|Parse Log|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|159|0|406|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|160|0|409|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|161|0|411|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|162|0|413|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|163|0|415|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|164|0|418|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|165|0|420|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|166|0|424|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|167|0|427|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|168|0|430|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|169|0|433|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|170|0|437|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|ENRICH|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
}}@0|@830000|621500|0|0|0|0|11269|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|171|0|439|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|172|0|442|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|173|0|444|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|174|0|446|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|175|0|449|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|176|0|457|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@52000|65000|0|0|0|0|11081|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|177|0|459|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|178|0|462|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|179|0|464|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|180|0|466|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|181|0|469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010203004|XXGoport|182|0|476|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|183|0|480|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|184|0|485|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FIRST_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$FIRST_FILE|3|2|$|@{0|}}
}}@0|@90000|498500|0|0|0|0|10797|Input File|Ab Initio Software|@1|1000|-1|@6||33089|-1|-1|}}
{2010203004|XXGoport|185|0|487|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|186|0|489|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|187|0|491|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|188|0|495|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[not is_blank(SORT_KEY)]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in1|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@1183000|192500|0|0|0|0|11386|Optional Sort , Scan & Rollup|Mukesh.Singh|Created 9/16/2015 2:09:15 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|812000|461000|3|}}
{2010210004|XXGflow|189|0|497|0|{@{}@384|.5|.5|{0|}5719|17|}}
{2010210004|XXGflow|190|0|499|0|{@{}@384|.5|.5|{0|}5718|529|}}
{2010210004|XXGflow|191|0|501|0|{@{}@384|.5|.5|{0|}5716|17|}}
{2010600005|XXGgraph|192|0|503|0|{Subgraph created from graph "Optional Sort , Scan & Rollup"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_DEDUP and not  USE_SCAN and not USE_ROLLUP]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@252500|117500|0|0|0|0|5705|Dedup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|363000|299000|3|}}
{2010210004|XXGflow|193|0|505|0|{@{}@384|.4888888895511627|.5|{0|}5711|2065|}}
{2010501005|XXGpvertex|194|0|507|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|30000|0|0|0|0|5712|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|195|0|509|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|196|0|511|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|197|0|514|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|198|0|516|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|199|0|518|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|200|0|520|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|201|0|522|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: dup = in
metadata type: in = out
metadata type: in = dup|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|202|0|524|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|203|0|527|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|204|0|530|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|205|0|533|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|206|0|536|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|207|0|539|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|208|0|542|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_TEMP/duplicate.$CLEAN_OUT_FILE_NAME.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/duplicate.$CLEAN_OUT_FILE_NAME.dat.gz|3|2|$|@{0|}}
}}@0|@243000|210000|0|0|0|0|5710|Duplicate File|Ab Initio Software|@1|100|0|@6|@32769|-1|-1|}}
{2010202004|XXGiport|209|0|544|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|210|0|547|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|211|0|549|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|212|0|558|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|213|0|562|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010600005|XXGgraph|214|0|566|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout||3|8|s=|@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@45000|105000|0|0|481000|303000|5717|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|215|0|568|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|216|0|570|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|217|0|572|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|218|0|575|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|219|0|579|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|220|0|581|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|221|0|583|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|222|0|588|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|223|0|592|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|224|0|595|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|HelpID|comp_partition_by_key_and_sort|3|2|R$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
}}@0|@438000|340000|0|0|481000|303000|0|Partition by Key and Sort|||1|10|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|2|}}
{2010210004|XXGflow|225|0|597|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|226|0|599|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|227|0|601|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|228|0|604|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|229|0|606|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|230|0|608|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|231|0|611|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|232|0|616|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|233|0|618|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|234|0|620|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|235|0|623|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|236|0|625|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|237|0|628|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|238|0|634|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|239|0|637|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|240|0|642|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$ROLLUP_XFR|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[USE_ROLLUP and not USE_SCAN]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@643000|120000|0|0|0|0|5710|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|644|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|242|0|646|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|243|0|648|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|244|0|650|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|245|0|652|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|246|0|655|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|247|0|657|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|248|0|660|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|249|0|663|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|250|0|666|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|251|0|669|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|252|0|676|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|$SCAN_XFR|3|2|f$|@{0|}}
{30001002|XXparameter|condition|$[USE_SCAN and not USE_ROLLUP]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@465000|119500|0|0|0|0|5720|Scan|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|253|0|678|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|254|0|681|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|255|0|683|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|256|0|685|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|257|0|687|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|258|0|690|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|259|0|692|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|260|0|695|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|261|0|698|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|262|0|701|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|263|0|704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|264|0|711|0|{@{}@0|0|0|0|out0|.3225|@@@14352|0|}}
{2010202004|XXGiport|265|0|715|0|{@{}@0|0|0|0|in1|.49891540130151846|@@@13840|0|}}
{2010600005|XXGgraph|266|0|720|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_FILE_LOCATION|$INPUT_FILE_LOCATION|3|9|RFK|Directory where files are to be read from|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$INPUT_FILE_PATTERN|3|9|RFK|Name of a single file, or pattern for reading multiple files|{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|IS_MFS|AB_PARAMETER_ENV|13|10|RKd|@{0|}}
{30001002|XXparameter|LOG_ERROR_NAME_SEED|$AB_PSET_NAME.$[string_filter_out(INPUT_FILE_PATTERN, "*?")]|3|9|RK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|IS_MFS:sandbox|$[file_information(INPUT_FILE_LOCATION + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:eme|$[[vector ""]]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:sandbox|$[directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)]|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1435873438|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|UNIQUE_ID|$EXTERNAL_RUN_ID|3|9|FK||{0|}}
{30001002|XXparameter|PROCESSED_LIST_LOG_FILENAME|$\{AB_PSET_NAME\}.$[if(is_blank(UNIQUE_ID)) "" else UNIQUE_ID + "."]fileList.log|3|9|RK||{0|}}
{30001002|XXparameter|condition|$[ READ_EXCEL =="N" ]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@27000|150500|0|0|0|0|11393|Read File(s)||@1|100|0|@9|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|857000|1343000|3|}}
{2010240003|XXGlegend|267|0|722|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|268|0|724|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|269|0|726|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|270|0|728|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|271|0|730|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|272|0|732|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|273|0|734|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2216|}}
{2010242002|XXGface|274|0|736|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|275|0|738|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|276|0|740|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|277|0|742|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|278|0|744|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|279|0|746|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|280|0|748|0|{@{}@Arial|0|100|0|}}
{2010210004|XXGflow|281|0|750|0|{@{}@384|.5|.5|{0|}2219|17|}}
{2010210004|XXGflow|282|0|752|0|{@{}@384|.5|.5|{0|}2205|1043|}}
{2010210004|XXGflow|283|0|754|0|{@{}@384|.5|.5|{0|}2264|531|}}
{2010210004|XXGflow|284|0|756|0|{@{}@384|.5|.5|{0|}2221|17|}}
{2010210004|XXGflow|285|0|758|0|{@{}@384|.5|.5|{0|}2251|18|}}
{2010210004|XXGflow|286|0|760|0|{@{}@384|.5|.5|{0|}2252|1041|}}
{2010210004|XXGflow|287|0|762|0|{@{}@384|.5|.5|{0|}2258|1041|}}
{2010210004|XXGflow|288|0|764|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}2257|530|}}
{2010210004|XXGflow|289|0|766|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|290|0|768|0|{@{}@384|.5|.5|{0|}2236|17|}}
{2010210004|XXGflow|291|0|770|0|{@{}@384|.5|.5|{0|}2234|17|}}
{2010501005|XXGpvertex|292|0|772|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|2222|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|293|0|774|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|294|0|777|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|295|0|780|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|296|0|782|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|297|0|785|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|298|0|788|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|num_records|$[length_of(INPUT_FILENAME_LIST_VEC)]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform|let string("")[] files = $[string_representation(INPUT_FILENAME_LIST_VEC)];

out::create(index) = begin
  out.file :: files[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
}}@0|@65000|424000|0|0|0|0|2220|List Files|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|299|0|790|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|300|0|793|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|301|0|795|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|302|0|797|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|303|0|799|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|304|0|802|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|305|0|805|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|306|0|810|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@264000|908000|0|0|0|0|2203|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|307|0|812|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|308|0|814|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|309|0|817|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|310|0|819|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|311|0|821|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying this Handle Errors component.|{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of escalated errors to log.|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|type1|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type for log_error and final_log_output|{0|}}
{30001002|XXparameter|num_operations|2|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(in)|3|2|H$|Called to transform the input to the error port.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(in)|3|2|H$|Called on every input record.|{0|}}
{30001002|XXparameter|port_analysis|escalate=exact(in); error=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|escalate_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|escalate,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/error-info.dml")
metadata type: escalate = in
metadata type: error = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|312|0|823|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|313|0|826|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|314|0|829|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|315|0|832|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|316|0|835|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2235|Read Errors MFS|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|317|0|837|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|318|0|840|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|319|0|842|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|320|0|848|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@124000|908000|0|0|0|0|2200|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|321|0|850|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|322|0|852|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|323|0|855|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|324|0|857|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|325|0|859|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|package||8|1|FKl|Package containing transforms and data types|{0|}}
{30001002|XXparameter|error_group||3|2|F$|Optional group name identifying this Handle Errors component.|{0|}}
{30001002|XXparameter|log_group||3|2|F$|Optional group name of a Handle Logs component to which log output can be directed.|{0|}}
{30001002|XXparameter|logging|False|13|1|Fl|Log internal events|{0|}}
{30001002|XXparameter|log|log_concat|3|13|Kv|Special log parameter|{0|}}
{30001002|XXparameter|log.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_input||15|1|Fl|Frequency of input records to log|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_input.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|log_reject||15|1|Fl|Frequency of escalated errors to log.|{7| |1|10|100|1000|10000|100000|}}
{30001002|XXparameter|log_reject.condition|param logging True|3|15|P?|@{0|}}
{30001002|XXparameter|num_types|1|1|2|H$|Number of intermediate types|{0|}}
{30001002|XXparameter|type1|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type for log_error and final_log_output|{0|}}
{30001002|XXparameter|num_operations|2|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|optional error::make_error(in)|3|2|H$|Called to transform the input to the error port.|{0|}}
{30001002|XXparameter|operation2|optional log_event::log_error(in)|3|2|H$|Called on every input record.|{0|}}
{30001002|XXparameter|port_analysis|escalate=exact(in); error=in|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|dynamic_codegen_required|True|13|1|Hl||{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|escalate_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|escalate,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: in = remote("$AB_HOME/include/error-info.dml")
metadata type: escalate = in
metadata type: error = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|326|0|861|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|327|0|864|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|328|0|867|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|329|0|870|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|330|0|873|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@126000|1089500|0|0|0|0|2237|Read Errors Serial|Ab Initio Software|@1|100|0|@6|@32897|-1|-1|}}
{2010202004|XXGiport|331|0|875|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|332|0|878|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|333|0|880|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|334|0|886|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
}}@0|@472000|909000|0|0|0|0|2204|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|335|0|888|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|336|0|891|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|337|0|893|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|338|0|895|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|339|0|898|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|340|0|902|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|341|0|904|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|342|0|907|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|343|0|910|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|344|0|912|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|345|0|915|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|346|0|918|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1|@6||164225|-1|-1|}}
{2010202004|XXGiport|347|0|920|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|348|0|923|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|349|0|925|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|350|0|931|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@752000|439500|0|0|0|0|2214|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|351|0|933|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|352|0|935|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|353|0|939|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|354|0|941|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|355|0|944|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|356|0|947|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|transform|filename::get_filename(in)=
begin
  filename :: $"INPUT_FILE_LOCATION" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|filter|Range (Read a subset of records from each file)|3|1|l|@{0|}}
{30001002|XXparameter|skip_count|$HEADER_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_threshold|Use limit/ramp|3|1|l|@{0|}}
{30001002|XXparameter|input_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|limit|1|3|2|$|@{0|}}
}}@0|@421000|334500|0|0|0|0|2253|Read All Matching Files|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|357|0|949|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|358|0|952|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|359|0|954|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|360|0|956|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|361|0|958|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|362|0|960|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|363|0|962|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|364|0|965|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|365|0|967|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|366|0|970|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|367|0|973|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|368|0|976|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|369|0|979|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|370|0|982|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|371|0|985|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|372|0|992|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2213|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|373|0|994|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|374|0|999|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|375|0|1002|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|376|0|1004|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|377|0|1007|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|378|0|1014|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|2265|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|189000|283000|3|}}
{2010210004|XXGflow|379|0|1016|0|{@{}@384|.5|.5|{0|}2202|17|}}
{2010501005|XXGpvertex|380|0|1018|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform0|out::reformat(in)=
begin
  out.file :: $"INPUT_FILE_LOCATION" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@40000|30000|0|0|0|0|2198|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32897|1|{1|0|}}}
{2010203004|XXGoport|381|0|1020|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|382|0|1023|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|383|0|1025|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|384|0|1027|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|385|0|1029|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|386|0|1031|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|387|0|1033|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|388|0|1037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|389|0|1040|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|390|0|1043|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|391|0|1046|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|392|0|1049|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$PROCESSED_LIST_LOG_FILENAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/$PROCESSED_LIST_LOG_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@52000|168500|0|0|0|0|2203|File List|Ab Initio Software|@1|100|0|@6||33153|-1|-1|}}
{2010202004|XXGiport|393|0|1051|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|394|0|1054|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|395|0|1056|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|396|0|1064|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|397|0|1069|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|transform|filename::get_filename(in)=
begin
  filename :: this_partition_path($"INPUT_FILE_LOCATION") + "/" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|filter|Range (Read a subset of records from each file)|3|1|l|@{0|}}
{30001002|XXparameter|skip_count|$HEADER_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|1|l|@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@476000|510500|0|0|0|0|2259|Read All Matching Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|398|0|1071|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|399|0|1074|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|400|0|1076|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|401|0|1078|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|402|0|1080|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|403|0|1082|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|404|0|1084|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|405|0|1087|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|406|0|1089|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|407|0|1092|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|408|0|1095|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|409|0|1098|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1101|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|411|0|1104|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|412|0|1107|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|413|0|1116|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|414|0|1120|0|{Subgraph created from graph "get.excel"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ READ_EXCEL =="Y" ]|3|9|F||{0|}}
}}@0|@25000|299500|31000|587000|448000|218000|11396|Read Single XLS File|Alex.zhao|Created 7/27/2015 7:56:29 PM|1|100|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.5771812200546265|447000|217000|3|}}
{2010203004|XXGoport|415|0|1123|0|{@{}@0|0|0|0|out0|.4838709677419355|@@@14352|0|}}
{2010600005|XXGgraph|416|0|1127|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[string_index(AB_PSET_NAME, "msawp") or string_index(AB_PSET_NAME, "crxawp")]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@1771500|417000|0|0|0|0|11279|Remove Overlaps|anwar.parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1458000|355000|3|}}
{2010210004|XXGflow|417|0|1129|0|{@{}@384|.5|.5|{0|}10708|17|}}
{2010210004|XXGflow|418|0|1131|0|{@{}@384|.5|.5|{0|}10702|17|}}
{2010243001|XXGwatcher|419|0|1133|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|420|0|1135|0|{@{}@384|.5|.5|{0|}10712|17|}}
{2010210004|XXGflow|421|0|1137|0|{@{}@384|.5|.5|{0|}10701|17|}}
{2010243001|XXGwatcher|422|0|1139|0|{@{}@1|100|-1||0|}}
{2010210004|XXGflow|423|0|1141|0|{@{}@384|.5|.5|{0|}10707|17|}}
{2010210004|XXGflow|424|0|1143|0|{@{}@384|.5|.5|{0|}10697|17|}}
{2010210004|XXGflow|425|0|1145|0|{@{}@384|.5|.5|{0|}10704|1041|}}
{2010210004|XXGflow|426|0|1147|0|{@{}@384|.5|.5|{0|}10671|1041|}}
{2010210004|XXGflow|427|0|1149|0|{@{}@384|.5|.5|{0|}10699|17|}}
{2010243001|XXGwatcher|428|0|1151|0|{@{}@1|100|-1||0|}}
{2010501005|XXGpvertex|429|0|1153|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|select_expr|overlaps == 0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1023000|242500|0|0|0|0|10694|Filter by Expression|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|430|0|1155|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|431|0|1158|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|432|0|1161|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|433|0|1163|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|434|0|1165|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|435|0|1167|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|436|0|1170|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|437|0|1172|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|438|0|1175|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|439|0|1178|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|440|0|1181|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|441|0|1184|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|442|0|1187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|443|0|1190|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout|file:$AI_SERIAL_REJECT/$AB_PSET_NAME.overlaps.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_REJECT/$AB_PSET_NAME.overlaps.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|protection|0664|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|1|l|@{0|}}
}}@0|@1311000|285000|705000|396000|56000|50000|10713|Overlaps|Ab Initio Software||1|9999999|0||6||33025|-1|-1|}}
{2010202004|XXGiport|444|0|1192|0|{@{}@695000|414000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|445|0|1195|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|mpcmodtime|1368052545|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|-1|-1|}}
{2010202004|XXGiport|446|0|1197|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|447|0|1200|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\x01", maximum_length=11) ndc /*DBTYPE_STR(11) NOT NULL*/;
  datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedate /*DBTYPE_DBTIMESTAMP NOT NULL*/;
  datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedatethru = NULL("") /*DBTYPE_DBTIMESTAMP*/;
  long overlaps;
end|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform|out::length(in)=
begin
  out :: length_of(in.intervals);
end;

out::normalize(in,index)=
begin
  out.* :: in.*;
  out.effectivedate :: in.intervals[index].effectivedate;
  out.effectivedatethru :: in.intervals[index].effectivedatethru;
  out.overlaps :: in.intervals[index].overlapsWithCount;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@834000|250000|0|0|0|0|10700|Normalize|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|448|0|1202|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|449|0|1205|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|450|0|1207|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|451|0|1209|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|452|0|1211|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|453|0|1214|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|454|0|1216|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|455|0|1219|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|456|0|1222|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|457|0|1225|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|458|0|1228|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|459|0|1232|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\x01", maximum_length=11) ndc /*DBTYPE_STR(11) NOT NULL*/;
  record
    datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedate /*DBTYPE_DBTIMESTAMP NOT NULL*/;
    datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedatethru = NULL("") /*DBTYPE_DBTIMESTAMP*/;
    long overlapsWithCount;
  end[long] intervals;
end|3|1|l|@{0|}}
{30001002|XXparameter|key|\{ndc\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::rollup(in)=
begin
  out.* :: in.*;
  out.intervals :: accumulation([record effectivedate in.effectivedate, effectivedatethru in.effectivedatethru, overlapsWithCount 0]);
end;|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@455000|248500|0|0|0|0|10698|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|460|0|1234|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|461|0|1237|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|462|0|1239|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|463|0|1241|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|464|0|1243|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|465|0|1246|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|466|0|1248|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|467|0|1251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|468|0|1254|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|469|0|1257|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|470|0|1260|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|471|0|1271|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@39000|60000|0|0|0|0|10668|Gather|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|472|0|1273|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|473|0|1276|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|474|0|1278|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|475|0|1280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|476|0|1283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|477|0|1289|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Join.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|key|\{ndc; effectivedate; effectivedatethru\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::join(in0,in1)=
begin
  out.* :: in0.*;
end;|3|1|l|@{0|}}
{30001002|XXparameter|in1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|unused0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1294000|40000|0|0|0|0|10673|Join|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|478|0|1291|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|479|0|1293|0|{@{}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|480|0|1295|0|{@{}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|481|0|1297|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|482|0|1299|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|483|0|1301|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|484|0|1303|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|485|0|1305|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|486|0|1307|0|{@{}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|487|0|1310|0|{@{}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|488|0|1313|0|{Performs inner, outer, and semi-joins with multiple flows of data records. It maximizes performance by loading input data records into main memory.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?join|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|count|2|1|1|Fl|Number of inputs to join function|{0|}}
{30001002|XXparameter|count.is_index|true|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input|True|13|1|Fl|Set this parameter to False if the input is not sorted. In this case, JOIN processes the data in-memory without sorting it.|{0|}}
{30001002|XXparameter|sorted_input.display_name|sorted-input|3|9|P|@{0|}}
{30001002|XXparameter|sorted_input.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|_min_count|2|1|2|FH$|Minimum number of inputs to join|{0|}}
{30001002|XXparameter|key||19|2|RFO$|Field(s) on which to join|{0|}}
{30001002|XXparameter|transform||8|1|RFOl|Required DML function|{0|}}
{30001002|XXparameter|join_type|Inner Join (matching records required on all inputs)|15|1|Fl|Handling for duplicate and missing key values|{3|Inner Join (matching records required on all inputs)|Full Outer Join (use null for missing records)|Explicit|}}
{30001002|XXparameter|join_type.display_name|join-type|3|9|P|@{0|}}
{30001002|XXparameter|show_interface|True|13|1|Hl|Whether to show the interface parameter|{0|}}
{30001002|XXparameter|show_interface.update_clauses|update_value True|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface|version-3-2-2|15|1|Fl|Controls whether to use the legacy interface or the improved Co>Operating System Version 3.2.2 and later parameter interface.  Specifically, it controls whether to use the legacy record-required parameter with inverted booleans or the Version 3.2.2 record-match-requied parameter with normal booleans. The choice of parameter-interface is compatible with all Co>Operating System versions except when count is greater than 5 in which case older Co>Operating Systems will fail with the version-3-2-2 interface.|{2|version-3-2-2|legacy|}}
{30001002|XXparameter|parameter_interface.display_name|parameter-interface|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface.condition|version 3.2: param show_interface True param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|parameter_interface.update_clauses|update_value legacy|3|9|P|@{0|}}
{30001002|XXparameter|parameter_interface_internal|value join-type Inner* legacy value join-type Full* legacy sameas parameter-interface default dollar_substitution version-3-2-2|3|13|v|Sets the value of the internal parameter interface|{0|}}
{30001002|XXparameter|parameter_interface_internal.display_name|parameter-interface-internal|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required1|value join-type Inner* True value join-type Full* False default constant True|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1|value join-type Inner* False value join-type Full* True default constant False|13|13|Fv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|dedup1|False|13|1|Fl|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|select0||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|select1||20|2|F$|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1|value record-match-required F* True value record-match-required T* False value record-match-required f* True value record-match-required t* False value record-match-required 0 True value record-match-required 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0|value record-match-required0 F* True value record-match-required0 T* False value record-match-required0 f* True value record-match-required0 t* False value record-match-required0 0 True value record-match-required0 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.display_name|record-match-required-not-unroll0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll0.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1|value record-match-required1 F* True value record-match-required1 T* False value record-match-required1 f* True value record-match-required1 t* False value record-match-required1 0 True value record-match-required1 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.display_name|record-match-required-not-unroll1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll1.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2|value record-match-required2 F* True value record-match-required2 T* False value record-match-required2 f* True value record-match-required2 t* False value record-match-required2 0 True value record-match-required2 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.display_name|record-match-required-not-unroll2|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll2.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3|value record-match-required3 F* True value record-match-required3 T* False value record-match-required3 f* True value record-match-required3 t* False value record-match-required3 0 True value record-match-required3 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.display_name|record-match-required-not-unroll3|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll3.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4|value record-match-required4 F* True value record-match-required4 T* False value record-match-required4 f* True value record-match-required4 t* False value record-match-required4 0 True value record-match-required4 1 False default constant True|13|13|v|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.display_name|record-match-required-not-unroll4|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not_unroll4.condition|param parameter-interface-internal version-3-2-2 version :3.2.1.r9|3|15|P?|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems|value record-match-required5 * True default constant False|13|13|Kv|Interface protection parameter|{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.display_name|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.keyword|join-mpc-interface-3-2-supports-maximum-count-of-5-in-older-cooperating-systems|3|9|P|@{0|}}
{30001002|XXparameter|join_mpc_interface_3_2_supports_maximum_count_of_5_in_older_cooperating_systems.condition|version :3.2.1.r9 param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|value join-type Inner* False value join-type Full* False value record-match-required __AB_NoSuchValue True default constant False|13|13|Kv||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_display_values|True(recordrequiredonthisinput) False(usenullformissingrecord)|3|2|H$||{0|}}
{30001002|XXparameter|record_required_display_values.display_name|record-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|dedup_display_values|Donotdedupthisinput Dedupthisinputbeforejoining|3|2|H$||{0|}}
{30001002|XXparameter|dedup_display_values.display_name|dedup-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_display_values|False(usenullformissingrecord) True(recordrequiredonthisinput)|3|2|H$||{0|}}
{30001002|XXparameter|record_match_required_display_values.display_name|record-match-required-display-values|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_positional1|sameas record-required default constant False|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|ROv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1|sameas dedup default constant False|13|13|ROv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1|sameas select|20|13|Ov|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1|sameas record-required default constant False|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1|sameas record-match-required-not-unroll sameas record-match-required-not default constant True|13|13|Kv|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1|sameas dedup default constant False|13|13|Kv|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1|sameas select|20|13|Kv|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|2|FK$|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|driving|0|1|2|FK$|The largest input; all other inputs will be read into memory|{0|}}
{30001002|XXparameter|driving.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|maintain_order|False|13|1|FKl|Exit rather than spill to disk|{0|}}
{30001002|XXparameter|maintain_order.display_name|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.keyword|maintain-order|3|9|P|@{0|}}
{30001002|XXparameter|maintain_order.condition|version 2.2.2: param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_core|67108864|1|2|FK$|Maximum memory usage (for non-driving inputs before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_core.display_name|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.keyword|max-core|3|9|P|@{0|}}
{30001002|XXparameter|max_core.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|max_memory|8388608|1|2|FK$|Maximum memory usage (before spilling to disk) in bytes|{0|}}
{30001002|XXparameter|max_memory.display_name|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.keyword|max-memory|3|9|P|@{0|}}
{30001002|XXparameter|max_memory.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|check_sort|False|13|1|FKl|Always check sort order on inputs|{0|}}
{30001002|XXparameter|check_sort.display_name|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.keyword|check-sort|3|9|P|@{0|}}
{30001002|XXparameter|check_sort.condition|version 3.0.1.r9: param sorted-input True|3|15|P?|@{0|}}
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
{30001002|XXparameter|num_operations|5|1|2|H$|Number of operations in package|{0|}}
{30001002|XXparameter|operation1|out::join(in[*])|3|2|H$|Join transform|{0|}}
{30001002|XXparameter|sorted_mpname|merge-join|3|2|H$||{0|}}
{30001002|XXparameter|sorted_mpname.display_name|sorted-mpname|3|9|P|@{0|}}
{30001002|XXparameter|memory_mpname|hash-join|3|2|H$||{0|}}
{30001002|XXparameter|memory_mpname.display_name|memory-mpname|3|9|P|@{0|}}
{30001002|XXparameter|keyword_map|limit_keyword limit ramp_keyword ramp ramp_keyword2 ramp max-memory max-core dedup singlematch dedup-keyword singlematch record-required matchoptional record-required-keyword matchoptional select-keyword select record-required-positional matchoptional dedup-positional singlematch matchoptional-keyword matchoptional matchoptional-positional matchoptional|3|2|H$||{0|}}
{30001002|XXparameter|keyword_map.display_name|keyword-map|3|9|P|@{0|}}
{30001002|XXparameter|unused_port_version|2.4.18:|3|2|H$|Version that unused ports became available|{0|}}
{30001002|XXparameter|unused_port_version.display_name|unused-port-version|3|9|P|@{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|deadlock_prone|True|13|1|l|Necessary record on one input stops read on all inputs|{0|}}
{30001002|XXparameter|deadlock_prone.display_name|deadlock-prone|3|9|P|@{0|}}
{30001002|XXparameter|port_analysis|reject*=in*; unused*=in*; error*=^error|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis||3|2|H$||{0|}}
{30001002|XXparameter|num_types|3|1|2|H$|Number of private data types in package|{0|}}
{30001002|XXparameter|type1|error_info_t error_info "record string('', charset='x-ab-internal') component; int port_index; string('', charset='x-ab-internal') parameter; string('', charset='x-ab-internal') message; record string('', charset='x-ab-internal') code; int parent_index; record string('', charset='x-ab-internal') name; string('', charset='x-ab-internal') value; end[int] attributes; end[int] details; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type2|log_event_t log_event "record string('', charset='x-ab-internal') event_type; string('', charset='x-ab-internal') event_text; end"|3|2|H$|Type of error_info|{0|}}
{30001002|XXparameter|type3|error_port_type error <parameter error0_metadata>|3|2|H$|Type for make_error output|{0|}}
{30001002|XXparameter|operation2|optional out::output_for_error(error_info, in[*])|3|2|H$|Function to create output in case of error.|{0|}}
{30001002|XXparameter|operation3|optional error::make_error(error_info, in[*])|3|2|H$|Function to create error record in case of error.|{0|}}
{30001002|XXparameter|operation4|optional log_event::log_error(error_info, in[*])|3|2|H$|Function to create log record in case of error.|{0|}}
{30001002|XXparameter|operation5|optional log_event::final_log_output()|3|2|H$|Function to create final log record.|{0|}}
{30001002|XXparameter|num_callbacks|4|1|2|H$|Number of callbacks in package|{0|}}
{30001002|XXparameter|_use_rich_error_format|True|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|True|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|main_mp_port|count in|3|1|l||{0|}}
{30001002|XXparameter|in0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|in1_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|unused0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|unused1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|reject1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error0_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error1_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,unused[*],reject[*],error[*],log::document(in[*])|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: unused = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|489|0|1315|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|490|0|1318|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused0|0.0|count|unused|0|1168|0|}}
{2010203004|XXGoport|491|0|1321|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|unused1|0.0|count|unused|1|1168|0|}}
{2010203004|XXGoport|492|0|1324|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|493|0|1327|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|494|0|1330|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|495|0|1333|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|496|0|1336|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|497|0|1339|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select0||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select0.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required0.display_name|record-match-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required0.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup0||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup0.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional0.display_name|record-required-positional0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional0.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword0||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword0.display_name|dedup-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required0||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required0.display_name|record-required0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required0.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional0||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional0.display_name|dedup-positional0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword0||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword0.display_name|select-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword0.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional0||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional0.display_name|matchoptional-positional0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional0.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword0.display_name|record-required-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword0.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword0||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword0.display_name|matchoptional-keyword0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword0.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key0||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key0.display_name|override-key0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key0.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional0||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional0.display_name|select-positional0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional0.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not0||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not0.display_name|record-match-required-not0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not0.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in0|0.0|count|in|0|1808|0|}}
{2010202004|XXGiport|498|0|1357|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|select1||20|8|F=|Filter expression before join function|{0|}}
{30001002|XXparameter|select1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select1.index_name|select|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required1.display_name|record-match-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.index_name|record-match-required|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required1.condition|param parameter-interface-internal version-3-2-2 param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup1||13|8|F=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup1.index_name|dedup|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_positional1.display_name|record-required-positional1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.index_name|record-required-positional|3|9|P|@{0|}}
{30001002|XXparameter|record_required_positional1.condition|param parameter-interface-internal legacy param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_keyword1||13|8|K=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_keyword1.display_name|dedup-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.keyword|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.index_name|dedup-keyword|3|9|P|@{0|}}
{30001002|XXparameter|dedup_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|record_required1||13|8|F=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required1.display_name|record-required1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.index_name|record-required|3|9|P|@{0|}}
{30001002|XXparameter|record_required1.condition|param parameter-interface-internal legacy param join-type Explicit|3|15|P?|@{0|}}
{30001002|XXparameter|dedup_positional1||13|8|RO=|This controls the join behavior (full vs semi)|{0|}}
{30001002|XXparameter|dedup_positional1.display_name|dedup-positional1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.index_name|dedup-positional|3|9|P|@{0|}}
{30001002|XXparameter|dedup_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|select_keyword1||20|8|K=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_keyword1.display_name|select-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.keyword|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.index_name|select-keyword|3|9|P|@{0|}}
{30001002|XXparameter|select_keyword1.condition|param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_positional1||13|8|RO=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_positional1.display_name|matchoptional-positional1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.index_name|matchoptional-positional|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_positional1.condition|param sorted-input True param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_required_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_required_keyword1.display_name|record-required-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.keyword|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.index_name|record-required-keyword|3|9|P|@{0|}}
{30001002|XXparameter|record_required_keyword1.condition|param parameter-interface-internal legacy param sorted-input False|3|15|P?|@{0|}}
{30001002|XXparameter|matchoptional_keyword1||13|8|K=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|matchoptional_keyword1.display_name|matchoptional-keyword1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.keyword|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.index_name|matchoptional-keyword|3|9|P|@{0|}}
{30001002|XXparameter|matchoptional_keyword1.condition|param sorted-input False param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|override_key1||19|8|FK=|Alternate name(s) for join key(s)|{0|}}
{30001002|XXparameter|override_key1.display_name|override-key1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.keyword|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.index_name|override-key|3|9|P|@{0|}}
{30001002|XXparameter|override_key1.condition|version 2.1:|3|15|P?|@{0|}}
{30001002|XXparameter|select_positional1||20|8|O=|Filter expression before join function|{0|}}
{30001002|XXparameter|select_positional1.display_name|select-positional1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.index_name|select-positional|3|9|P|@{0|}}
{30001002|XXparameter|select_positional1.condition|param sorted-input True|3|15|P?|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1||13|8|K=||{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.index_name|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen|3|9|P|@{0|}}
{30001002|XXparameter|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1.condition|param parameter-interface-internal version-3-2-2|3|15|P?|@{0|}}
{30001002|XXparameter|record_match_required_not1||13|8|=|This controls the join behavior (outer vs inner)|{0|}}
{30001002|XXparameter|record_match_required_not1.display_name|record-match-required-not1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.index_name|record-match-required-not|3|9|P|@{0|}}
{30001002|XXparameter|record_match_required_not1.condition|param parameter-interface-internal version-3-2-2 version 3.2.1.r10:|3|15|P?|@{0|}}
}}@0|0|0|0|in1|0.0|count|in|1|1808|0|}}
{2010501005|XXGpvertex|499|0|1385|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|out0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|transform0|type interval_type=
record
  datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedate /*DBTYPE_DBTIMESTAMP NOT NULL*/;
  datetime("YYYY-MM-DD HH24:MI:SS.NNNNNN")("\\x01") effectivedatethru = NULL("") /*DBTYPE_DBTIMESTAMP*/;
  long overlapsWithCount;
end;

out::reformat(in)=
begin
  let interval_type[long] vIntervals = in.intervals;
  
  for(let i, i < length_of(in.intervals))
  begin
    let interval = in.intervals[i];
    let long count = -1; // there will be one overlap by default with self
    let startDate = interval.effectivedate;
    for(let test_interval in in.intervals)
      if(test_interval.effectivedate >= interval.effectivedate and test_interval.effectivedate <= interval.effectivedatethru)
        count = count + 1;
    vIntervals[i].overlapsWithCount = count;
  end
  
  out.* :: in.*;
  out.intervals :: vIntervals;
end;|3|1|l|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@641000|248500|0|0|0|0|10703|Reformat|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|500|0|1387|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|501|0|1390|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|502|0|1392|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|503|0|1394|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|504|0|1396|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|505|0|1399|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|506|0|1401|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|507|0|1405|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|508|0|1408|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|509|0|1411|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|510|0|1414|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|511|0|1421|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@346000|60000|0|0|0|0|10670|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|512|0|1423|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|513|0|1427|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|514|0|1430|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|515|0|1432|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|516|0|1435|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|517|0|1442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$[
  if(string_index(AB_PSET_NAME, "msawp"))
    "\{ndc;costtypecodesub;effectivedate\}"
  else if(string_index(AB_PSET_NAME, "crxawp"))
    "\{ndc;effectivedate\}"
]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@166000|38000|0|0|0|0|10709|Sort|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|518|0|1444|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|519|0|1447|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|520|0|1450|0|{Orders your data according to a key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|521|0|1452|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|522|0|1455|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|523|0|1461|0|{@{}@0|0|0|0|out0|.3942652329749104|@@@14352|0|}}
{2010202004|XXGiport|524|0|1465|0|{@{}@0|0|0|0|in0|.3942652329749104|@@@13840|0|}}
{2010501005|XXGpvertex|525|0|1469|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@237000|268500|0|0|0|0|11223|Switch from Serial to MFS|Ab Initio Software|Built-in 1.0:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|526|0|1471|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|527|0|1474|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|528|0|1478|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|529|0|1480|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|530|0|1483|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|531|0|1489|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@40000|10000|0|0|0|0|11394|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|791000|470000|3|}}
{2010240003|XXGlegend|532|0|1491|0|{@{}@Date|92000|66000|0|0|0|0|7|}}
{2010242002|XXGface|533|0|1493|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|534|0|1495|0|{@{}@Author|217000|66000|0|0|0|0|99|}}
{2010242002|XXGface|535|0|1497|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|536|0|1499|0|{@{}@Description|417000|66000|0|0|0|0|28|}}
{2010242002|XXGface|537|0|1501|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|538|0|1503|0|{@{}@Version|17000|66000|0|0|0|0|4|}}
{2010242002|XXGface|539|0|1505|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|540|0|1507|0|{@{}@1.0|17000|88000|0|0|0|0|14|}}
{2010242002|XXGface|541|0|1509|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|542|0|1511|0|{@{}@Jun 15 2015|82000|88000|0|0|0|0|96|}}
{2010242002|XXGface|543|0|1513|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|544|0|1515|0|{@{}@Anwar.Parvez (Exusia)|187000|88000|0|0|0|0|98|}}
{2010242002|XXGface|545|0|1517|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|546|0|1519|0|{@{}@This Graph was created as part of Cogs Jun 
30 ,2015 Project and later was made as common
 graph to be used across multiple project . 
|412000|83000|0|0|0|0|95|}}
{2010242002|XXGface|547|0|1521|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|548|0|1523|0|{@{}@1.0.1|17000|178000|0|0|0|0|97|}}
{2010242002|XXGface|549|0|1525|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|550|0|1527|0|{@{}@June 25 2015|82000|178000|0|0|0|0|100|}}
{2010242002|XXGface|551|0|1529|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|552|0|1531|0|{@{}@Anwar Parvez (exusia)|192000|178000|0|0|0|0|101|}}
{2010242002|XXGface|553|0|1533|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|554|0|1535|0|{@{}@Added flow for removing overlap as well as writing serial files that
 can be used as lookup|417000|168000|0|0|0|0|102|}}
{2010242002|XXGface|555|0|1537|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|556|0|1539|0|{@{}@1.0.3|17000|303000|0|0|0|0|111|}}
{2010242002|XXGface|557|0|1541|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|558|0|1543|0|{@{}@Aug 15 2015|82000|303000|0|0|0|0|105|}}
{2010242002|XXGface|559|0|1545|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|560|0|1547|0|{@{}@Alex Zhao (exusia)|192000|303000|0|0|0|0|106|}}
{2010242002|XXGface|561|0|1549|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|562|0|1551|0|{@{}@Added an input read flow to read data from excel for
 a requirement in OPTUM|417000|298000|0|0|0|0|107|}}
{2010242002|XXGface|563|0|1553|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|564|0|1555|0|{@{}@1.0.4|17000|343000|0|0|0|0|118|}}
{2010242002|XXGface|565|0|1557|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|566|0|1559|0|{@{}@Aug 20 2015|82000|343000|0|0|0|0|113|}}
{2010242002|XXGface|567|0|1561|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|568|0|1563|0|{@{}@Mukesh Singh (exusia)|192000|343000|0|0|0|0|112|}}
{2010242002|XXGface|569|0|1565|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|570|0|1567|0|{@{}@Added Handle Log to Compute record count|412000|343000|0|0|0|0|114|}}
{2010242002|XXGface|571|0|1569|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|572|0|1571|0|{@{}@1.0.2|17000|258000|0|0|0|0|103|}}
{2010242002|XXGface|573|0|1573|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|574|0|1575|0|{@{}@Added Disabled file to view data , handle ,error and reject port|412000|258000|0|0|0|0|104|}}
{2010242002|XXGface|575|0|1577|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|576|0|1579|0|{@{}@Aug 12 2015|82000|258000|0|0|0|0|85|}}
{2010242002|XXGface|577|0|1581|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|578|0|1583|0|{@{}@Mukesh Singh (exusia)|192000|258000|0|0|0|0|84|}}
{2010242002|XXGface|579|0|1585|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|580|0|1587|0|{@{}@Mukesh Singh (exusia)|197000|388000|0|0|0|0|125|}}
{2010242002|XXGface|581|0|1589|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|582|0|1591|0|{@{}@Aug 20 2015|77000|388000|0|0|0|0|129|}}
{2010242002|XXGface|583|0|1593|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|584|0|1595|0|{@{}@Added Post filter component|432000|388000|0|0|0|0|127|}}
{2010242002|XXGface|585|0|1597|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|586|0|1599|0|{@{}@1.0.5|17000|388000|0|0|0|0|121|}}
{2010242002|XXGface|587|0|1601|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|588|0|1603|0|{@{}@1.0.6|17000|428000|0|0|0|0|130|}}
{2010242002|XXGface|589|0|1605|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|590|0|1607|0|{@{}@Oct  05, 2015|77000|428000|0|0|0|0|131|}}
{2010242002|XXGface|591|0|1609|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|592|0|1611|0|{@{}@Mukesh Singh (exusia)|192000|428000|0|0|0|0|132|}}
{2010242002|XXGface|593|0|1613|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|594|0|1615|0|{@{}@Added aggregate components|427000|423000|0|0|0|0|133|}}
{2010242002|XXGface|595|0|1617|0|{@{}@Arial Narrow|0|100|0|}}
{2010110002|XXGconstant|596|0|1619|0|{@{}@{1|5469239|}}}
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
{2010605001|XXGgraph_legend_legend|18|0|36|0|{7|}1|19|}
{2010241001|XXGlegend_face_face|19|0|38|0|{}19|20|}
{2010605001|XXGgraph_legend_legend|20|0|40|0|{8|}1|21|}
{2010241001|XXGlegend_face_face|21|0|42|0|{}21|22|}
{2010605001|XXGgraph_legend_legend|22|0|44|0|{9|}1|23|}
{2010241001|XXGlegend_face_face|23|0|46|0|{}23|24|}
{2010605001|XXGgraph_legend_legend|24|0|48|0|{10|}1|25|}
{2010241001|XXGlegend_face_face|25|0|50|0|{}25|26|}
{2010605001|XXGgraph_legend_legend|26|0|52|0|{11|}1|27|}
{2010241001|XXGlegend_face_face|27|0|54|0|{}27|28|}
{2010605001|XXGgraph_legend_legend|28|0|56|0|{12|}1|29|}
{2010241001|XXGlegend_face_face|29|0|58|0|{}29|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_1|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_10|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_11|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_12|}1|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_13|}1|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_14|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_15|}1|37|}
{2010604001|XXGgraph_flow_flow|37|0|74|0|{Flow_16|}1|38|}
{2010604001|XXGgraph_flow_flow|38|0|76|0|{Flow_17|}1|39|}
{2010604001|XXGgraph_flow_flow|39|0|78|0|{Flow_18|}1|40|}
{2010604001|XXGgraph_flow_flow|40|0|80|0|{Flow_2|}1|41|}
{2010604001|XXGgraph_flow_flow|41|0|82|0|{Flow_3|}1|42|}
{2010604001|XXGgraph_flow_flow|42|0|84|0|{Flow_4|}1|43|}
{2010604001|XXGgraph_flow_flow|43|0|86|0|{Flow_5|}1|44|}
{2010604001|XXGgraph_flow_flow|44|0|88|0|{Flow_6|}1|45|}
{2010604001|XXGgraph_flow_flow|45|0|90|0|{Flow_7|}1|46|}
{2010604001|XXGgraph_flow_flow|46|0|92|0|{Flow_8|}1|47|}
{2010604001|XXGgraph_flow_flow|47|0|94|0|{Flow_9|}1|48|}
{2010601001|XXGgraph_vertex_vertex|48|0|96|0|{APPLY_POST_FILTER|}1|49|}
{2010212001|XXGvertex_oport_oport|49|0|98|0|{0|out|}49|50|}
{2010213001|XXGoport_dst_flow|50|0|100|0|{0|}50|39|}
{2010212001|XXGvertex_oport_oport|51|0|101|0|{1|deselect|}49|51|}
{2010212001|XXGvertex_oport_oport|52|0|103|0|{2|reject|}49|52|}
{2010212001|XXGvertex_oport_oport|53|0|105|0|{3|error|}49|53|}
{2010212001|XXGvertex_oport_oport|54|0|107|0|{4|log|}49|54|}
{2010211001|XXGvertex_iport_iport|55|0|109|0|{0|in|}49|55|}
{2010214001|XXGiport_src_flow|56|0|111|0|{0|}55|38|}
{2010007001|XXGobject_proto_object|57|0|112|0|{}49|56|}
{2010212001|XXGvertex_oport_oport|58|0|114|0|{0|out|}56|57|}
{2010006001|XXGobject_psameas_object|59|0|116|0|{metadata|out_metadata|1|0|}57|56|}
{2010212001|XXGvertex_oport_oport|60|0|117|0|{1|deselect|}56|58|}
{2010006001|XXGobject_psameas_object|61|0|119|0|{metadata|deselect_metadata|1|0|}58|56|}
{2010212001|XXGvertex_oport_oport|62|0|120|0|{2|reject|}56|59|}
{2010006001|XXGobject_psameas_object|63|0|122|0|{metadata|reject_metadata|1|0|}59|56|}
{2010212001|XXGvertex_oport_oport|64|0|123|0|{3|error|}56|60|}
{2010006001|XXGobject_psameas_object|65|0|125|0|{metadata|error_metadata|1|0|}60|56|}
{2010212001|XXGvertex_oport_oport|66|0|126|0|{4|log|}56|61|}
{2010006001|XXGobject_psameas_object|67|0|128|0|{metadata|log_metadata|1|0|}61|56|}
{2010211001|XXGvertex_iport_iport|68|0|129|0|{0|in|}56|62|}
{2010006001|XXGobject_psameas_object|69|0|131|0|{metadata|in_metadata|1|0|}62|56|}
{2010006001|XXGobject_psameas_object|70|0|132|0|{Layout|Layout|0|0|}49|63|}
{2010211001|XXGvertex_iport_iport|71|0|134|0|{0|write|}63|64|}
{2010214001|XXGiport_src_flow|72|0|136|0|{0|}64|47|}
{2010007001|XXGobject_proto_object|73|0|137|0|{}63|65|}
{2010211001|XXGvertex_iport_iport|74|0|139|0|{0|write|}65|66|}
{2010006001|XXGobject_psameas_object|75|0|141|0|{metadata|write_metadata|1|0|}66|65|}
{2010006001|XXGobject_psameas_object|76|0|142|0|{deselect_metadata|write_metadata|0|0|}49|63|}
{2010006001|XXGobject_psameas_object|77|0|143|0|{in_metadata|write_metadata|0|0|}49|63|}
{2010006001|XXGobject_psameas_object|78|0|144|0|{out_metadata|write_metadata|0|0|}49|63|}
{2010006001|XXGobject_psameas_object|79|0|145|0|{reject_metadata|write_metadata|0|0|}49|63|}
{2010601001|XXGgraph_vertex_vertex|80|0|146|0|{Apply_Mappings|}1|67|}
{2010212001|XXGvertex_oport_oport|81|0|148|0|{0|out0|}67|68|}
{2010213001|XXGoport_dst_flow|82|0|150|0|{0|}68|41|}
{2010212001|XXGvertex_oport_oport|83|0|151|0|{1|reject0|}67|69|}
{2010213001|XXGoport_dst_flow|84|0|153|0|{0|}69|33|}
{2010212001|XXGvertex_oport_oport|85|0|154|0|{2|error0|}67|70|}
{2010213001|XXGoport_dst_flow|86|0|156|0|{0|}70|32|}
{2010212001|XXGvertex_oport_oport|87|0|157|0|{3|log|}67|71|}
{2010211001|XXGvertex_iport_iport|88|0|159|0|{0|in|}67|72|}
{2010214001|XXGiport_src_flow|89|0|161|0|{0|}72|48|}
{2010007001|XXGobject_proto_object|90|0|162|0|{}67|73|}
{2010212001|XXGvertex_oport_oport|91|0|164|0|{0|out0|}73|74|}
{2010006001|XXGobject_psameas_object|92|0|166|0|{metadata|out0_metadata|1|0|}74|73|}
{2010006001|XXGobject_psameas_object|93|0|167|0|{transform0|transform0|1|0|}74|73|}
{2010212001|XXGvertex_oport_oport|94|0|168|0|{1|reject0|}73|75|}
{2010006001|XXGobject_psameas_object|95|0|170|0|{metadata|reject0_metadata|1|0|}75|73|}
{2010212001|XXGvertex_oport_oport|96|0|171|0|{2|error0|}73|76|}
{2010006001|XXGobject_psameas_object|97|0|173|0|{metadata|error0_metadata|1|0|}76|73|}
{2010212001|XXGvertex_oport_oport|98|0|174|0|{3|log|}73|77|}
{2010006001|XXGobject_psameas_object|99|0|176|0|{metadata|log_metadata|1|0|}77|73|}
{2010211001|XXGvertex_iport_iport|100|0|177|0|{0|in|}73|78|}
{2010006001|XXGobject_psameas_object|101|0|179|0|{metadata|in_metadata|1|0|}78|73|}
{2010006001|XXGobject_psameas_object|102|0|180|0|{in_metadata|out_metadata|0|0|}67|79|}
{2010212001|XXGvertex_oport_oport|103|0|182|0|{0|out|}79|80|}
{2010007001|XXGobject_proto_object|104|0|184|0|{}79|81|}
{2010212001|XXGvertex_oport_oport|105|0|186|0|{0|out|}81|82|}
{2010006001|XXGobject_psameas_object|106|0|188|0|{metadata|out_metadata|1|0|}82|81|}
{2010006001|XXGobject_psameas_object|107|0|189|0|{out0_metadata|write_metadata|0|0|}67|63|}
{2010006001|XXGobject_psameas_object|108|0|190|0|{reject0_metadata|out_metadata|0|0|}67|79|}
{2010601001|XXGgraph_vertex_vertex|109|0|191|0|{Apply_Pre_Filter|}1|83|}
{2010212001|XXGvertex_oport_oport|110|0|193|0|{0|out|}83|84|}
{2010213001|XXGoport_dst_flow|111|0|195|0|{0|}84|48|}
{2010212001|XXGvertex_oport_oport|112|0|196|0|{1|deselect|}83|85|}
{2010213001|XXGoport_dst_flow|113|0|198|0|{0|}85|34|}
{2010212001|XXGvertex_oport_oport|114|0|199|0|{2|reject|}83|86|}
{2010212001|XXGvertex_oport_oport|115|0|201|0|{3|error|}83|87|}
{2010212001|XXGvertex_oport_oport|116|0|203|0|{4|log|}83|88|}
{2010211001|XXGvertex_iport_iport|117|0|205|0|{0|in|}83|89|}
{2010214001|XXGiport_src_flow|118|0|207|0|{0|}89|44|}
{2010007001|XXGobject_proto_object|119|0|208|0|{}83|90|}
{2010212001|XXGvertex_oport_oport|120|0|210|0|{0|out|}90|91|}
{2010006001|XXGobject_psameas_object|121|0|212|0|{metadata|out_metadata|1|0|}91|90|}
{2010212001|XXGvertex_oport_oport|122|0|213|0|{1|deselect|}90|92|}
{2010006001|XXGobject_psameas_object|123|0|215|0|{metadata|deselect_metadata|1|0|}92|90|}
{2010212001|XXGvertex_oport_oport|124|0|216|0|{2|reject|}90|93|}
{2010006001|XXGobject_psameas_object|125|0|218|0|{metadata|reject_metadata|1|0|}93|90|}
{2010212001|XXGvertex_oport_oport|126|0|219|0|{3|error|}90|94|}
{2010006001|XXGobject_psameas_object|127|0|221|0|{metadata|error_metadata|1|0|}94|90|}
{2010212001|XXGvertex_oport_oport|128|0|222|0|{4|log|}90|95|}
{2010006001|XXGobject_psameas_object|129|0|224|0|{metadata|log_metadata|1|0|}95|90|}
{2010211001|XXGvertex_iport_iport|130|0|225|0|{0|in|}90|96|}
{2010006001|XXGobject_psameas_object|131|0|227|0|{metadata|in_metadata|1|0|}96|90|}
{2010006001|XXGobject_psameas_object|132|0|228|0|{Layout|Layout|0|0|}83|67|}
{2010006001|XXGobject_psameas_object|133|0|229|0|{deselect_metadata|out_metadata|0|0|}83|79|}
{2010006001|XXGobject_psameas_object|134|0|230|0|{in_metadata|out_metadata|0|0|}83|79|}
{2010006001|XXGobject_psameas_object|135|0|231|0|{out_metadata|out_metadata|0|0|}83|79|}
{2010006001|XXGobject_psameas_object|136|0|232|0|{reject_metadata|out_metadata|0|0|}83|79|}
{2010601001|XXGgraph_vertex_vertex|137|0|233|0|{Deselect_O_p_file|}1|97|}
{2010211001|XXGvertex_iport_iport|138|0|235|0|{0|write|}97|98|}
{2010214001|XXGiport_src_flow|139|0|237|0|{0|}98|34|}
{2010007001|XXGobject_proto_object|140|0|238|0|{}97|99|}
{2010211001|XXGvertex_iport_iport|141|0|240|0|{0|write|}99|100|}
{2010006001|XXGobject_psameas_object|142|0|242|0|{metadata|write_metadata|1|0|}100|99|}
{2010006001|XXGobject_psameas_object|143|0|243|0|{write_metadata|out_metadata|0|0|}97|79|}
{2010601001|XXGgraph_vertex_vertex|144|0|244|0|{Dummy_Replicate|}1|101|}
{2010212001|XXGvertex_oport_oport|145|0|246|0|{0|out|}101|102|}
{2010213001|XXGoport_dst_flow|146|0|248|0|{0|}102|47|}
{2010213001|XXGoport_dst_flow|147|0|249|0|{1|}102|45|}
{2010211001|XXGvertex_iport_iport|148|0|250|0|{0|in|}101|103|}
{2010214001|XXGiport_src_flow|149|0|252|0|{0|}103|39|}
{2010007001|XXGobject_proto_object|150|0|253|0|{}101|104|}
{2010212001|XXGvertex_oport_oport|151|0|255|0|{0|out|}104|105|}
{2010006001|XXGobject_psameas_object|152|0|257|0|{metadata|out_metadata|1|0|}105|104|}
{2010211001|XXGvertex_iport_iport|153|0|258|0|{0|in|}104|106|}
{2010006001|XXGobject_psameas_object|154|0|260|0|{metadata|in_metadata|1|0|}106|104|}
{2010006001|XXGobject_psameas_object|155|0|261|0|{Layout|Layout|0|0|}101|63|}
{2010006001|XXGobject_psameas_object|156|0|262|0|{in_metadata|write_metadata|0|0|}101|63|}
{2010006001|XXGobject_psameas_object|157|0|263|0|{out_metadata|write_metadata|0|0|}101|63|}
{2010601001|XXGgraph_vertex_vertex|158|0|264|0|{Dummy_Replicate_for_flow|}1|107|}
{2010212001|XXGvertex_oport_oport|159|0|266|0|{0|out|}107|108|}
{2010213001|XXGoport_dst_flow|160|0|268|0|{0|}108|44|}
{2010211001|XXGvertex_iport_iport|161|0|269|0|{0|in|}107|109|}
{2010214001|XXGiport_src_flow|162|0|271|0|{0|}109|43|}
{2010007001|XXGobject_proto_object|163|0|272|0|{}107|110|}
{2010212001|XXGvertex_oport_oport|164|0|274|0|{0|out|}110|111|}
{2010006001|XXGobject_psameas_object|165|0|276|0|{metadata|out_metadata|1|0|}111|110|}
{2010211001|XXGvertex_iport_iport|166|0|277|0|{0|in|}110|112|}
{2010006001|XXGobject_psameas_object|167|0|279|0|{metadata|in_metadata|1|0|}112|110|}
{2010006001|XXGobject_psameas_object|168|0|280|0|{Layout|Layout|0|0|}107|67|}
{2010006001|XXGobject_psameas_object|169|0|281|0|{in_metadata|out_metadata|0|0|}107|79|}
{2010006001|XXGobject_psameas_object|170|0|282|0|{out_metadata|out_metadata|0|0|}107|79|}
{2010601001|XXGgraph_vertex_vertex|171|0|283|0|{Dummy_Replicate_for_flow_1|}1|113|}
{2010212001|XXGvertex_oport_oport|172|0|285|0|{0|out|}113|114|}
{2010213001|XXGoport_dst_flow|173|0|287|0|{0|}114|40|}
{2010211001|XXGvertex_iport_iport|174|0|288|0|{0|in|}113|115|}
{2010214001|XXGiport_src_flow|175|0|290|0|{0|}115|41|}
{2010007001|XXGobject_proto_object|176|0|291|0|{}113|116|}
{2010212001|XXGvertex_oport_oport|177|0|293|0|{0|out|}116|117|}
{2010006001|XXGobject_psameas_object|178|0|295|0|{metadata|out_metadata|1|0|}117|116|}
{2010211001|XXGvertex_iport_iport|179|0|296|0|{0|in|}116|118|}
{2010006001|XXGobject_psameas_object|180|0|298|0|{metadata|in_metadata|1|0|}118|116|}
{2010006001|XXGobject_psameas_object|181|0|299|0|{Layout|Layout|0|0|}113|67|}
{2010006001|XXGobject_psameas_object|182|0|300|0|{in_metadata|write_metadata|0|0|}113|63|}
{2010006001|XXGobject_psameas_object|183|0|301|0|{out_metadata|write_metadata|0|0|}113|63|}
{2010601001|XXGgraph_vertex_vertex|184|0|302|0|{Enrich_O_P|}1|63|}
{2010601001|XXGgraph_vertex_vertex|185|0|303|0|{Errors|}1|119|}
{2010211001|XXGvertex_iport_iport|186|0|305|0|{0|write|}119|120|}
{2010214001|XXGiport_src_flow|187|0|307|0|{0|}120|32|}
{2010007001|XXGobject_proto_object|188|0|308|0|{}119|121|}
{2010211001|XXGvertex_iport_iport|189|0|310|0|{0|write|}121|122|}
{2010006001|XXGobject_psameas_object|190|0|312|0|{metadata|write_metadata|1|0|}122|121|}
{2010006001|XXGobject_psameas_object|191|0|313|0|{write_metadata|error0_metadata|0|0|}119|67|}
{2010601001|XXGgraph_vertex_vertex|192|0|314|0|{Failed|}1|123|}
{2010211001|XXGvertex_iport_iport|193|0|316|0|{0|write|}123|124|}
{2010214001|XXGiport_src_flow|194|0|318|0|{0|}124|33|}
{2010007001|XXGobject_proto_object|195|0|319|0|{}123|125|}
{2010211001|XXGvertex_iport_iport|196|0|321|0|{0|write|}125|126|}
{2010006001|XXGobject_psameas_object|197|0|323|0|{metadata|write_metadata|1|0|}126|125|}
{2010006001|XXGobject_psameas_object|198|0|324|0|{write_metadata|out_metadata|0|0|}123|79|}
{2010601001|XXGgraph_vertex_vertex|199|0|325|0|{Gather|}1|127|}
{2010212001|XXGvertex_oport_oport|200|0|327|0|{0|out|}127|128|}
{2010213001|XXGoport_dst_flow|201|0|329|0|{0|}128|42|}
{2010211001|XXGvertex_iport_iport|202|0|330|0|{0|in|}127|129|}
{2010214001|XXGiport_src_flow|203|0|332|0|{0|}129|45|}
{2010007001|XXGobject_proto_object|204|0|333|0|{}127|130|}
{2010212001|XXGvertex_oport_oport|205|0|335|0|{0|out|}130|131|}
{2010006001|XXGobject_psameas_object|206|0|337|0|{metadata|out_metadata|1|0|}131|130|}
{2010211001|XXGvertex_iport_iport|207|0|338|0|{0|in|}130|132|}
{2010006001|XXGobject_psameas_object|208|0|340|0|{metadata|in_metadata|1|0|}132|130|}
{2010006001|XXGobject_psameas_object|209|0|341|0|{Layout|Layout|0|0|}127|133|}
{2010211001|XXGvertex_iport_iport|210|0|343|0|{0|write|}133|134|}
{2010214001|XXGiport_src_flow|211|0|345|0|{0|}134|46|}
{2010007001|XXGobject_proto_object|212|0|346|0|{}133|135|}
{2010211001|XXGvertex_iport_iport|213|0|348|0|{0|write|}135|136|}
{2010006001|XXGobject_psameas_object|214|0|350|0|{metadata|write_metadata|1|0|}136|135|}
{2010006001|XXGobject_psameas_object|215|0|351|0|{in_metadata|write_metadata|0|0|}127|63|}
{2010006001|XXGobject_psameas_object|216|0|352|0|{out_metadata|write_metadata|0|0|}127|63|}
{2010601001|XXGgraph_vertex_vertex|217|0|353|0|{Get_Record_count|}1|137|}
{2010604001|XXGgraph_flow_flow|218|0|355|0|{Flow_15|}137|138|}
{2010244001|XXGflow_watcher_watcher|219|0|357|0|{}138|139|}
{2010604001|XXGgraph_flow_flow|220|0|359|0|{Flow_16|}137|140|}
{2010244001|XXGflow_watcher_watcher|221|0|361|0|{}140|141|}
{2010601001|XXGgraph_vertex_vertex|222|0|363|0|{Count_Local|}137|142|}
{2010212001|XXGvertex_oport_oport|223|0|365|0|{0|out|}142|143|}
{2010212001|XXGvertex_oport_oport|224|0|367|0|{1|reject|}142|144|}
{2010212001|XXGvertex_oport_oport|225|0|369|0|{2|error|}142|145|}
{2010212001|XXGvertex_oport_oport|226|0|371|0|{3|log|}142|146|}
{2010211001|XXGvertex_iport_iport|227|0|373|0|{0|in|}142|147|}
{2010214001|XXGiport_src_flow|228|0|375|0|{0|}147|138|}
{2010007001|XXGobject_proto_object|229|0|376|0|{}142|148|}
{2010212001|XXGvertex_oport_oport|230|0|378|0|{0|out|}148|149|}
{2010006001|XXGobject_psameas_object|231|0|380|0|{metadata|out_metadata|1|0|}149|148|}
{2010212001|XXGvertex_oport_oport|232|0|381|0|{1|reject|}148|150|}
{2010006001|XXGobject_psameas_object|233|0|383|0|{metadata|reject_metadata|1|0|}150|148|}
{2010212001|XXGvertex_oport_oport|234|0|384|0|{2|error|}148|151|}
{2010006001|XXGobject_psameas_object|235|0|386|0|{metadata|error_metadata|1|0|}151|148|}
{2010212001|XXGvertex_oport_oport|236|0|387|0|{3|log|}148|152|}
{2010006001|XXGobject_psameas_object|237|0|389|0|{metadata|log_metadata|1|0|}152|148|}
{2010211001|XXGvertex_iport_iport|238|0|390|0|{0|in|}148|153|}
{2010006001|XXGobject_psameas_object|239|0|392|0|{metadata|in_metadata|1|0|}153|148|}
{2010006001|XXGobject_psameas_object|240|0|393|0|{Layout|Layout|0|0|}142|154|}
{2010211001|XXGvertex_iport_iport|241|0|395|0|{0|write|}154|155|}
{2010214001|XXGiport_src_flow|242|0|397|0|{0|}155|37|}
{2010007001|XXGobject_proto_object|243|0|398|0|{}154|156|}
{2010211001|XXGvertex_iport_iport|244|0|400|0|{0|write|}156|157|}
{2010006001|XXGobject_psameas_object|245|0|402|0|{metadata|write_metadata|1|0|}157|156|}
{2010006001|XXGobject_psameas_object|246|0|403|0|{in_metadata|out0_metadata|0|0|}142|158|}
{2010212001|XXGvertex_oport_oport|247|0|405|0|{0|out0|}158|159|}
{2010213001|XXGoport_dst_flow|248|0|407|0|{0|}159|138|}
{2010212001|XXGvertex_oport_oport|249|0|408|0|{1|reject0|}158|160|}
{2010212001|XXGvertex_oport_oport|250|0|410|0|{2|error0|}158|161|}
{2010212001|XXGvertex_oport_oport|251|0|412|0|{3|log|}158|162|}
{2010211001|XXGvertex_iport_iport|252|0|414|0|{0|in|}158|163|}
{2010214001|XXGiport_src_flow|253|0|416|0|{0|}163|140|}
{2010007001|XXGobject_proto_object|254|0|417|0|{}158|164|}
{2010212001|XXGvertex_oport_oport|255|0|419|0|{0|out0|}164|165|}
{2010006001|XXGobject_psameas_object|256|0|421|0|{metadata|out0_metadata|1|0|}165|164|}
{2010006001|XXGobject_psameas_object|257|0|422|0|{transform0|transform0|1|0|}165|164|}
{2010212001|XXGvertex_oport_oport|258|0|423|0|{1|reject0|}164|166|}
{2010006001|XXGobject_psameas_object|259|0|425|0|{metadata|reject0_metadata|1|0|}166|164|}
{2010212001|XXGvertex_oport_oport|260|0|426|0|{2|error0|}164|167|}
{2010006001|XXGobject_psameas_object|261|0|428|0|{metadata|error0_metadata|1|0|}167|164|}
{2010212001|XXGvertex_oport_oport|262|0|429|0|{3|log|}164|168|}
{2010006001|XXGobject_psameas_object|263|0|431|0|{metadata|log_metadata|1|0|}168|164|}
{2010211001|XXGvertex_iport_iport|264|0|432|0|{0|in|}164|169|}
{2010006001|XXGobject_psameas_object|265|0|434|0|{metadata|in_metadata|1|0|}169|164|}
{2010006001|XXGobject_psameas_object|266|0|435|0|{Layout|Layout|0|0|}158|154|}
{2010006001|XXGobject_psameas_object|267|0|436|0|{in_metadata|in_metadata|0|0|}158|170|}
{2010212001|XXGvertex_oport_oport|268|0|438|0|{0|log|}170|171|}
{2010213001|XXGoport_dst_flow|269|0|440|0|{0|}171|36|}
{2010211001|XXGvertex_iport_iport|270|0|441|0|{0|in|}170|172|}
{2010007001|XXGobject_proto_object|271|0|443|0|{}170|173|}
{2010212001|XXGvertex_oport_oport|272|0|445|0|{0|log|}173|174|}
{2010006001|XXGobject_psameas_object|273|0|447|0|{metadata|log_metadata|1|0|}174|173|}
{2010211001|XXGvertex_iport_iport|274|0|448|0|{0|in|}173|175|}
{2010006001|XXGobject_psameas_object|275|0|450|0|{metadata|in_metadata|1|0|}175|173|}
{2010006001|XXGobject_psameas_object|276|0|451|0|{Layout|Layout|0|0|}170|67|}
{2010006001|XXGobject_psameas_object|277|0|452|0|{log_metadata|in_metadata|0|0|}170|170|}
{2010006001|XXGobject_psameas_object|278|0|453|0|{reject0_metadata|in_metadata|0|0|}158|170|}
{2010006001|XXGobject_psameas_object|279|0|454|0|{out_metadata|write_metadata|0|0|}142|154|}
{2010006001|XXGobject_psameas_object|280|0|455|0|{reject_metadata|out0_metadata|0|0|}142|158|}
{2010601001|XXGgraph_vertex_vertex|281|0|456|0|{Gather_1|}137|176|}
{2010212001|XXGvertex_oport_oport|282|0|458|0|{0|out|}176|177|}
{2010213001|XXGoport_dst_flow|283|0|460|0|{0|}177|140|}
{2010211001|XXGvertex_iport_iport|284|0|461|0|{0|in|}176|178|}
{2010007001|XXGobject_proto_object|285|0|463|0|{}176|179|}
{2010212001|XXGvertex_oport_oport|286|0|465|0|{0|out|}179|180|}
{2010006001|XXGobject_psameas_object|287|0|467|0|{metadata|out_metadata|1|0|}180|179|}
{2010211001|XXGvertex_iport_iport|288|0|468|0|{0|in|}179|181|}
{2010006001|XXGobject_psameas_object|289|0|470|0|{metadata|in_metadata|1|0|}181|179|}
{2010006001|XXGobject_psameas_object|290|0|471|0|{Layout|Layout|0|0|}176|154|}
{2010006001|XXGobject_psameas_object|291|0|472|0|{in_metadata|in_metadata|0|0|}176|170|}
{2010006001|XXGobject_psameas_object|292|0|473|0|{out_metadata|in_metadata|0|0|}176|170|}
{2010601001|XXGgraph_vertex_vertex|293|0|474|0|{Parse_Log|}137|158|}
{2010212001|XXGvertex_oport_oport|294|0|475|0|{0|out0|}137|182|}
{2010216002|XXGoport_binding_oport|295|0|477|0|{.5|.5|{0|}11104|}182|143|}
{2010213001|XXGoport_dst_flow|296|0|478|0|{0|}182|37|}
{2010211001|XXGvertex_iport_iport|297|0|479|0|{0|in0|}137|183|}
{2010215002|XXGiport_binding_iport|298|0|481|0|{.5|.5|{0|}11103|}183|178|}
{2010214001|XXGiport_src_flow|299|0|482|0|{0|}183|36|}
{2010601001|XXGgraph_vertex_vertex|300|0|483|0|{Handle_Logs|}1|170|}
{2010601001|XXGgraph_vertex_vertex|301|0|484|0|{Input_File|}1|184|}
{2010212001|XXGvertex_oport_oport|302|0|486|0|{0|read|}184|185|}
{2010007001|XXGobject_proto_object|303|0|488|0|{}184|186|}
{2010212001|XXGvertex_oport_oport|304|0|490|0|{0|read|}186|187|}
{2010006001|XXGobject_psameas_object|305|0|492|0|{metadata|read_metadata|1|0|}187|186|}
{2010601001|XXGgraph_vertex_vertex|306|0|493|0|{Intermediate_LKP_File|}1|133|}
{2010601001|XXGgraph_vertex_vertex|307|0|494|0|{Optional_Sort_Scan_Rollup|}1|188|}
{2010604001|XXGgraph_flow_flow|308|0|496|0|{Flow_2|}188|189|}
{2010604001|XXGgraph_flow_flow|309|0|498|0|{Flow_3|}188|190|}
{2010604001|XXGgraph_flow_flow|310|0|500|0|{Flow_4|}188|191|}
{2010601001|XXGgraph_vertex_vertex|311|0|502|0|{Dedup|}188|192|}
{2010604001|XXGgraph_flow_flow|312|0|504|0|{Flow_4|}192|193|}
{2010601001|XXGgraph_vertex_vertex|313|0|506|0|{Dedup_Sorted|}192|194|}
{2010212001|XXGvertex_oport_oport|314|0|508|0|{0|out|}194|195|}
{2010212001|XXGvertex_oport_oport|315|0|510|0|{1|dup|}194|196|}
{2010213001|XXGoport_dst_flow|316|0|512|0|{0|}196|193|}
{2010212001|XXGvertex_oport_oport|317|0|513|0|{2|reject|}194|197|}
{2010212001|XXGvertex_oport_oport|318|0|515|0|{3|error|}194|198|}
{2010212001|XXGvertex_oport_oport|319|0|517|0|{4|log|}194|199|}
{2010211001|XXGvertex_iport_iport|320|0|519|0|{0|in|}194|200|}
{2010007001|XXGobject_proto_object|321|0|521|0|{}194|201|}
{2010212001|XXGvertex_oport_oport|322|0|523|0|{0|out|}201|202|}
{2010006001|XXGobject_psameas_object|323|0|525|0|{metadata|out_metadata|1|0|}202|201|}
{2010212001|XXGvertex_oport_oport|324|0|526|0|{1|dup|}201|203|}
{2010006001|XXGobject_psameas_object|325|0|528|0|{metadata|dup_metadata|1|0|}203|201|}
{2010212001|XXGvertex_oport_oport|326|0|529|0|{2|reject|}201|204|}
{2010006001|XXGobject_psameas_object|327|0|531|0|{metadata|reject_metadata|1|0|}204|201|}
{2010212001|XXGvertex_oport_oport|328|0|532|0|{3|error|}201|205|}
{2010006001|XXGobject_psameas_object|329|0|534|0|{metadata|error_metadata|1|0|}205|201|}
{2010212001|XXGvertex_oport_oport|330|0|535|0|{4|log|}201|206|}
{2010006001|XXGobject_psameas_object|331|0|537|0|{metadata|log_metadata|1|0|}206|201|}
{2010211001|XXGvertex_iport_iport|332|0|538|0|{0|in|}201|207|}
{2010006001|XXGobject_psameas_object|333|0|540|0|{metadata|in_metadata|1|0|}207|201|}
{2010006001|XXGobject_psameas_object|334|0|541|0|{Layout|Layout|0|0|}194|208|}
{2010211001|XXGvertex_iport_iport|335|0|543|0|{0|write|}208|209|}
{2010214001|XXGiport_src_flow|336|0|545|0|{0|}209|193|}
{2010007001|XXGobject_proto_object|337|0|546|0|{}208|210|}
{2010211001|XXGvertex_iport_iport|338|0|548|0|{0|write|}210|211|}
{2010006001|XXGobject_psameas_object|339|0|550|0|{metadata|write_metadata|1|0|}211|210|}
{2010006001|XXGobject_psameas_object|340|0|551|0|{write_metadata|write_metadata|0|0|}208|63|}
{2010006001|XXGobject_psameas_object|341|0|552|0|{dup_metadata|write_metadata|0|0|}194|63|}
{2010006001|XXGobject_psameas_object|342|0|553|0|{in_metadata|write_metadata|0|0|}194|63|}
{2010006001|XXGobject_psameas_object|343|0|554|0|{out_metadata|write_metadata|0|0|}194|63|}
{2010006001|XXGobject_psameas_object|344|0|555|0|{reject_metadata|write_metadata|0|0|}194|63|}
{2010601001|XXGgraph_vertex_vertex|345|0|556|0|{Duplicate_File|}192|208|}
{2010212001|XXGvertex_oport_oport|346|0|557|0|{0|out0|}192|212|}
{2010216002|XXGoport_binding_oport|347|0|559|0|{.5|.5|{0|}5714|}212|195|}
{2010213001|XXGoport_dst_flow|348|0|560|0|{0|}212|190|}
{2010211001|XXGvertex_iport_iport|349|0|561|0|{0|in0|}192|213|}
{2010215002|XXGiport_binding_iport|350|0|563|0|{.5|.5|{0|}5713|}213|200|}
{2010214001|XXGiport_src_flow|351|0|564|0|{0|}213|191|}
{2010601001|XXGgraph_vertex_vertex|352|0|565|0|{Partition_by_Key_and_Sort|}188|214|}
{2010604001|XXGgraph_flow_flow|353|0|567|0|{Flow_1|}214|215|}
{2010601001|XXGgraph_vertex_vertex|354|0|569|0|{Partition_by_Key|}214|216|}
{2010212001|XXGvertex_oport_oport|355|0|571|0|{0|out|}216|217|}
{2010213001|XXGoport_dst_flow|356|0|573|0|{0|}217|215|}
{2010211001|XXGvertex_iport_iport|357|0|574|0|{0|in|}216|218|}
{2010006001|XXGobject_psameas_object|358|0|576|0|{in_metadata|write_metadata|0|0|}216|63|}
{2010006001|XXGobject_psameas_object|359|0|577|0|{out_metadata|write_metadata|0|0|}216|63|}
{2010601001|XXGgraph_vertex_vertex|360|0|578|0|{Sort|}214|219|}
{2010212001|XXGvertex_oport_oport|361|0|580|0|{0|out|}219|220|}
{2010211001|XXGvertex_iport_iport|362|0|582|0|{0|in|}219|221|}
{2010214001|XXGiport_src_flow|363|0|584|0|{0|}221|215|}
{2010006001|XXGobject_psameas_object|364|0|585|0|{in_metadata|write_metadata|0|0|}219|63|}
{2010006001|XXGobject_psameas_object|365|0|586|0|{out_metadata|write_metadata|0|0|}219|63|}
{2010212001|XXGvertex_oport_oport|366|0|587|0|{0|out0|}214|222|}
{2010216002|XXGoport_binding_oport|367|0|589|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}222|220|}
{2010213001|XXGoport_dst_flow|368|0|590|0|{0|}222|191|}
{2010211001|XXGvertex_iport_iport|369|0|591|0|{0|in0|}214|223|}
{2010215002|XXGiport_binding_iport|370|0|593|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}223|218|}
{2010007001|XXGobject_proto_object|371|0|594|0|{}214|224|}
{2010604001|XXGgraph_flow_flow|372|0|596|0|{Flow_1|}224|225|}
{2010601001|XXGgraph_vertex_vertex|373|0|598|0|{Partition_by_Key|}224|226|}
{2010212001|XXGvertex_oport_oport|374|0|600|0|{0|out|}226|227|}
{2010213001|XXGoport_dst_flow|375|0|602|0|{0|}227|225|}
{2010211001|XXGvertex_iport_iport|376|0|603|0|{0|in|}226|228|}
{2010007001|XXGobject_proto_object|377|0|605|0|{}226|229|}
{2010212001|XXGvertex_oport_oport|378|0|607|0|{0|out|}229|230|}
{2010006001|XXGobject_psameas_object|379|0|609|0|{metadata|out_metadata|1|0|}230|229|}
{2010211001|XXGvertex_iport_iport|380|0|610|0|{0|in|}229|231|}
{2010006001|XXGobject_psameas_object|381|0|612|0|{metadata|in_metadata|1|0|}231|229|}
{2010006001|XXGobject_psameas_object|382|0|613|0|{Layout|InputLayout|1|0|}226|224|}
{2010006001|XXGobject_psameas_object|383|0|614|0|{key|Key|1|0|}226|224|}
{2010601001|XXGgraph_vertex_vertex|384|0|615|0|{Sort|}224|232|}
{2010212001|XXGvertex_oport_oport|385|0|617|0|{0|out|}232|233|}
{2010211001|XXGvertex_iport_iport|386|0|619|0|{0|in|}232|234|}
{2010214001|XXGiport_src_flow|387|0|621|0|{0|}234|225|}
{2010007001|XXGobject_proto_object|388|0|622|0|{}232|235|}
{2010212001|XXGvertex_oport_oport|389|0|624|0|{0|out|}235|236|}
{2010006001|XXGobject_psameas_object|390|0|626|0|{metadata|out_metadata|1|0|}236|235|}
{2010211001|XXGvertex_iport_iport|391|0|627|0|{0|in|}235|237|}
{2010006001|XXGobject_psameas_object|392|0|629|0|{metadata|in_metadata|1|0|}237|235|}
{2010006001|XXGobject_psameas_object|393|0|630|0|{Layout|OutputLayout|1|0|}232|224|}
{2010006001|XXGobject_psameas_object|394|0|631|0|{key|Key|1|0|}232|224|}
{2010006001|XXGobject_psameas_object|395|0|632|0|{max_core|Max_core|1|0|}232|224|}
{2010212001|XXGvertex_oport_oport|396|0|633|0|{0|out0|}224|238|}
{2010216002|XXGoport_binding_oport|397|0|635|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}238|233|}
{2010211001|XXGvertex_iport_iport|398|0|636|0|{0|in0|}224|239|}
{2010215002|XXGiport_binding_iport|399|0|638|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}239|228|}
{2010006001|XXGobject_psameas_object|400|0|639|0|{InputLayout|Layout|0|0|}214|67|}
{2010006001|XXGobject_psameas_object|401|0|640|0|{OutputLayout|Layout|0|0|}214|208|}
{2010601001|XXGgraph_vertex_vertex|402|0|641|0|{Rollup|}188|240|}
{2010212001|XXGvertex_oport_oport|403|0|643|0|{0|out|}240|241|}
{2010212001|XXGvertex_oport_oport|404|0|645|0|{1|reject|}240|242|}
{2010212001|XXGvertex_oport_oport|405|0|647|0|{2|error|}240|243|}
{2010212001|XXGvertex_oport_oport|406|0|649|0|{3|log|}240|244|}
{2010211001|XXGvertex_iport_iport|407|0|651|0|{0|in|}240|245|}
{2010214001|XXGiport_src_flow|408|0|653|0|{0|}245|189|}
{2010007001|XXGobject_proto_object|409|0|654|0|{}240|246|}
{2010212001|XXGvertex_oport_oport|410|0|656|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|411|0|658|0|{metadata|out_metadata|1|0|}247|246|}
{2010212001|XXGvertex_oport_oport|412|0|659|0|{1|reject|}246|248|}
{2010006001|XXGobject_psameas_object|413|0|661|0|{metadata|reject_metadata|1|0|}248|246|}
{2010212001|XXGvertex_oport_oport|414|0|662|0|{2|error|}246|249|}
{2010006001|XXGobject_psameas_object|415|0|664|0|{metadata|error_metadata|1|0|}249|246|}
{2010212001|XXGvertex_oport_oport|416|0|665|0|{3|log|}246|250|}
{2010006001|XXGobject_psameas_object|417|0|667|0|{metadata|log_metadata|1|0|}250|246|}
{2010211001|XXGvertex_iport_iport|418|0|668|0|{0|in|}246|251|}
{2010006001|XXGobject_psameas_object|419|0|670|0|{metadata|in_metadata|1|0|}251|246|}
{2010006001|XXGobject_psameas_object|420|0|671|0|{Layout|Layout|0|0|}240|63|}
{2010006001|XXGobject_psameas_object|421|0|672|0|{in_metadata|write_metadata|0|0|}240|63|}
{2010006001|XXGobject_psameas_object|422|0|673|0|{out_metadata|write_metadata|0|0|}240|63|}
{2010006001|XXGobject_psameas_object|423|0|674|0|{reject_metadata|write_metadata|0|0|}240|63|}
{2010601001|XXGgraph_vertex_vertex|424|0|675|0|{Scan|}188|252|}
{2010212001|XXGvertex_oport_oport|425|0|677|0|{0|out|}252|253|}
{2010213001|XXGoport_dst_flow|426|0|679|0|{0|}253|189|}
{2010212001|XXGvertex_oport_oport|427|0|680|0|{1|reject|}252|254|}
{2010212001|XXGvertex_oport_oport|428|0|682|0|{2|error|}252|255|}
{2010212001|XXGvertex_oport_oport|429|0|684|0|{3|log|}252|256|}
{2010211001|XXGvertex_iport_iport|430|0|686|0|{0|in|}252|257|}
{2010214001|XXGiport_src_flow|431|0|688|0|{0|}257|190|}
{2010007001|XXGobject_proto_object|432|0|689|0|{}252|258|}
{2010212001|XXGvertex_oport_oport|433|0|691|0|{0|out|}258|259|}
{2010006001|XXGobject_psameas_object|434|0|693|0|{metadata|out_metadata|1|0|}259|258|}
{2010212001|XXGvertex_oport_oport|435|0|694|0|{1|reject|}258|260|}
{2010006001|XXGobject_psameas_object|436|0|696|0|{metadata|reject_metadata|1|0|}260|258|}
{2010212001|XXGvertex_oport_oport|437|0|697|0|{2|error|}258|261|}
{2010006001|XXGobject_psameas_object|438|0|699|0|{metadata|error_metadata|1|0|}261|258|}
{2010212001|XXGvertex_oport_oport|439|0|700|0|{3|log|}258|262|}
{2010006001|XXGobject_psameas_object|440|0|702|0|{metadata|log_metadata|1|0|}262|258|}
{2010211001|XXGvertex_iport_iport|441|0|703|0|{0|in|}258|263|}
{2010006001|XXGobject_psameas_object|442|0|705|0|{metadata|in_metadata|1|0|}263|258|}
{2010006001|XXGobject_psameas_object|443|0|706|0|{Layout|Layout|0|0|}252|63|}
{2010006001|XXGobject_psameas_object|444|0|707|0|{in_metadata|write_metadata|0|0|}252|63|}
{2010006001|XXGobject_psameas_object|445|0|708|0|{out_metadata|write_metadata|0|0|}252|63|}
{2010006001|XXGobject_psameas_object|446|0|709|0|{reject_metadata|write_metadata|0|0|}252|63|}
{2010212001|XXGvertex_oport_oport|447|0|710|0|{0|out0|}188|264|}
{2010216002|XXGoport_binding_oport|448|0|712|0|{.5|.5|{0|}5722|}264|241|}
{2010213001|XXGoport_dst_flow|449|0|713|0|{0|}264|38|}
{2010211001|XXGvertex_iport_iport|450|0|714|0|{0|in1|}188|265|}
{2010215002|XXGiport_binding_iport|451|0|716|0|{.5|.5|{0|}5721|}265|223|}
{2010214001|XXGiport_src_flow|452|0|717|0|{0|}265|40|}
{2010601001|XXGgraph_vertex_vertex|453|0|718|0|{Output_File|}1|154|}
{2010601001|XXGgraph_vertex_vertex|454|0|719|0|{Read_File_s_|}1|266|}
{2010605001|XXGgraph_legend_legend|455|0|721|0|{0|}266|267|}
{2010241001|XXGlegend_face_face|456|0|723|0|{}267|268|}
{2010605001|XXGgraph_legend_legend|457|0|725|0|{1|}266|269|}
{2010241001|XXGlegend_face_face|458|0|727|0|{}269|270|}
{2010605001|XXGgraph_legend_legend|459|0|729|0|{2|}266|271|}
{2010241001|XXGlegend_face_face|460|0|731|0|{}271|272|}
{2010605001|XXGgraph_legend_legend|461|0|733|0|{3|}266|273|}
{2010241001|XXGlegend_face_face|462|0|735|0|{}273|274|}
{2010605001|XXGgraph_legend_legend|463|0|737|0|{4|}266|275|}
{2010241001|XXGlegend_face_face|464|0|739|0|{}275|276|}
{2010605001|XXGgraph_legend_legend|465|0|741|0|{5|}266|277|}
{2010241001|XXGlegend_face_face|466|0|743|0|{}277|278|}
{2010605001|XXGgraph_legend_legend|467|0|745|0|{6|}266|279|}
{2010241001|XXGlegend_face_face|468|0|747|0|{}279|280|}
{2010604001|XXGgraph_flow_flow|469|0|749|0|{Flow_1|}266|281|}
{2010604001|XXGgraph_flow_flow|470|0|751|0|{Flow_10|}266|282|}
{2010604001|XXGgraph_flow_flow|471|0|753|0|{Flow_12|}266|283|}
{2010604001|XXGgraph_flow_flow|472|0|755|0|{Flow_2|}266|284|}
{2010604001|XXGgraph_flow_flow|473|0|757|0|{Flow_3|}266|285|}
{2010604001|XXGgraph_flow_flow|474|0|759|0|{Flow_4|}266|286|}
{2010604001|XXGgraph_flow_flow|475|0|761|0|{Flow_5|}266|287|}
{2010604001|XXGgraph_flow_flow|476|0|763|0|{Flow_6|}266|288|}
{2010604001|XXGgraph_flow_flow|477|0|765|0|{Flow_7|}266|289|}
{2010604001|XXGgraph_flow_flow|478|0|767|0|{Flow_8|}266|290|}
{2010604001|XXGgraph_flow_flow|479|0|769|0|{Flow_9|}266|291|}
{2010601001|XXGgraph_vertex_vertex|480|0|771|0|{Broadcast|}266|292|}
{2010212001|XXGvertex_oport_oport|481|0|773|0|{0|out|}292|293|}
{2010213001|XXGoport_dst_flow|482|0|775|0|{0|}293|288|}
{2010211001|XXGvertex_iport_iport|483|0|776|0|{0|in|}292|294|}
{2010214001|XXGiport_src_flow|484|0|778|0|{0|}294|284|}
{2010007001|XXGobject_proto_object|485|0|779|0|{}292|295|}
{2010212001|XXGvertex_oport_oport|486|0|781|0|{0|out|}295|296|}
{2010006001|XXGobject_psameas_object|487|0|783|0|{metadata|out_metadata|1|0|}296|295|}
{2010211001|XXGvertex_iport_iport|488|0|784|0|{0|in|}295|297|}
{2010006001|XXGobject_psameas_object|489|0|786|0|{metadata|in_metadata|1|0|}297|295|}
{2010006001|XXGobject_psameas_object|490|0|787|0|{Layout|Layout|0|0|}292|298|}
{2010212001|XXGvertex_oport_oport|491|0|789|0|{0|out|}298|299|}
{2010213001|XXGoport_dst_flow|492|0|791|0|{0|}299|281|}
{2010212001|XXGvertex_oport_oport|493|0|792|0|{1|error|}298|300|}
{2010212001|XXGvertex_oport_oport|494|0|794|0|{2|log|}298|301|}
{2010007001|XXGobject_proto_object|495|0|796|0|{}298|302|}
{2010212001|XXGvertex_oport_oport|496|0|798|0|{0|out|}302|303|}
{2010006001|XXGobject_psameas_object|497|0|800|0|{metadata|out_metadata|1|0|}303|302|}
{2010212001|XXGvertex_oport_oport|498|0|801|0|{1|error|}302|304|}
{2010006001|XXGobject_psameas_object|499|0|803|0|{metadata|error_metadata|1|0|}304|302|}
{2010212001|XXGvertex_oport_oport|500|0|804|0|{2|log|}302|305|}
{2010006001|XXGobject_psameas_object|501|0|806|0|{metadata|log_metadata|1|0|}305|302|}
{2010006001|XXGobject_psameas_object|502|0|807|0|{in_metadata|out_metadata|0|0|}292|298|}
{2010006001|XXGobject_psameas_object|503|0|808|0|{out_metadata|out_metadata|0|0|}292|298|}
{2010601001|XXGgraph_vertex_vertex|504|0|809|0|{Collect_Read_Errors_MFS|}266|306|}
{2010212001|XXGvertex_oport_oport|505|0|811|0|{0|escalate|}306|307|}
{2010212001|XXGvertex_oport_oport|506|0|813|0|{1|error|}306|308|}
{2010213001|XXGoport_dst_flow|507|0|815|0|{0|}308|291|}
{2010212001|XXGvertex_oport_oport|508|0|816|0|{2|log|}306|309|}
{2010211001|XXGvertex_iport_iport|509|0|818|0|{0|in|}306|310|}
{2010007001|XXGobject_proto_object|510|0|820|0|{}306|311|}
{2010212001|XXGvertex_oport_oport|511|0|822|0|{0|escalate|}311|312|}
{2010006001|XXGobject_psameas_object|512|0|824|0|{metadata|escalate_metadata|1|0|}312|311|}
{2010212001|XXGvertex_oport_oport|513|0|825|0|{1|error|}311|313|}
{2010006001|XXGobject_psameas_object|514|0|827|0|{metadata|error_metadata|1|0|}313|311|}
{2010212001|XXGvertex_oport_oport|515|0|828|0|{2|log|}311|314|}
{2010006001|XXGobject_psameas_object|516|0|830|0|{metadata|log_metadata|1|0|}314|311|}
{2010211001|XXGvertex_iport_iport|517|0|831|0|{0|in|}311|315|}
{2010006001|XXGobject_psameas_object|518|0|833|0|{metadata|in_metadata|1|0|}315|311|}
{2010006001|XXGobject_psameas_object|519|0|834|0|{Layout|Layout|0|0|}306|316|}
{2010211001|XXGvertex_iport_iport|520|0|836|0|{0|write|}316|317|}
{2010214001|XXGiport_src_flow|521|0|838|0|{0|}317|291|}
{2010007001|XXGobject_proto_object|522|0|839|0|{}316|318|}
{2010211001|XXGvertex_iport_iport|523|0|841|0|{0|write|}318|319|}
{2010006001|XXGobject_psameas_object|524|0|843|0|{metadata|write_metadata|1|0|}319|318|}
{2010006001|XXGobject_psameas_object|525|0|844|0|{write_metadata|in_metadata|0|0|}316|306|}
{2010006001|XXGobject_psameas_object|526|0|845|0|{error_metadata|in_metadata|0|0|}306|306|}
{2010006001|XXGobject_psameas_object|527|0|846|0|{escalate_metadata|in_metadata|0|0|}306|306|}
{2010601001|XXGgraph_vertex_vertex|528|0|847|0|{Collect_Read_Errors_Serial|}266|320|}
{2010212001|XXGvertex_oport_oport|529|0|849|0|{0|escalate|}320|321|}
{2010212001|XXGvertex_oport_oport|530|0|851|0|{1|error|}320|322|}
{2010213001|XXGoport_dst_flow|531|0|853|0|{0|}322|290|}
{2010212001|XXGvertex_oport_oport|532|0|854|0|{2|log|}320|323|}
{2010211001|XXGvertex_iport_iport|533|0|856|0|{0|in|}320|324|}
{2010007001|XXGobject_proto_object|534|0|858|0|{}320|325|}
{2010212001|XXGvertex_oport_oport|535|0|860|0|{0|escalate|}325|326|}
{2010006001|XXGobject_psameas_object|536|0|862|0|{metadata|escalate_metadata|1|0|}326|325|}
{2010212001|XXGvertex_oport_oport|537|0|863|0|{1|error|}325|327|}
{2010006001|XXGobject_psameas_object|538|0|865|0|{metadata|error_metadata|1|0|}327|325|}
{2010212001|XXGvertex_oport_oport|539|0|866|0|{2|log|}325|328|}
{2010006001|XXGobject_psameas_object|540|0|868|0|{metadata|log_metadata|1|0|}328|325|}
{2010211001|XXGvertex_iport_iport|541|0|869|0|{0|in|}325|329|}
{2010006001|XXGobject_psameas_object|542|0|871|0|{metadata|in_metadata|1|0|}329|325|}
{2010006001|XXGobject_psameas_object|543|0|872|0|{Layout|Layout|0|0|}320|330|}
{2010211001|XXGvertex_iport_iport|544|0|874|0|{0|write|}330|331|}
{2010214001|XXGiport_src_flow|545|0|876|0|{0|}331|290|}
{2010007001|XXGobject_proto_object|546|0|877|0|{}330|332|}
{2010211001|XXGvertex_iport_iport|547|0|879|0|{0|write|}332|333|}
{2010006001|XXGobject_psameas_object|548|0|881|0|{metadata|write_metadata|1|0|}333|332|}
{2010006001|XXGobject_psameas_object|549|0|882|0|{write_metadata|in_metadata|0|0|}330|320|}
{2010006001|XXGobject_psameas_object|550|0|883|0|{error_metadata|in_metadata|0|0|}320|320|}
{2010006001|XXGobject_psameas_object|551|0|884|0|{escalate_metadata|in_metadata|0|0|}320|320|}
{2010601001|XXGgraph_vertex_vertex|552|0|885|0|{Collect_Read_File_s_Log|}266|334|}
{2010212001|XXGvertex_oport_oport|553|0|887|0|{0|log|}334|335|}
{2010213001|XXGoport_dst_flow|554|0|889|0|{0|}335|282|}
{2010211001|XXGvertex_iport_iport|555|0|890|0|{0|in|}334|336|}
{2010007001|XXGobject_proto_object|556|0|892|0|{}334|337|}
{2010212001|XXGvertex_oport_oport|557|0|894|0|{0|log|}337|338|}
{2010006001|XXGobject_psameas_object|558|0|896|0|{metadata|log_metadata|1|0|}338|337|}
{2010211001|XXGvertex_iport_iport|559|0|897|0|{0|in|}337|339|}
{2010006001|XXGobject_psameas_object|560|0|899|0|{metadata|in_metadata|1|0|}339|337|}
{2010006001|XXGobject_psameas_object|561|0|900|0|{log_metadata|in_metadata|0|0|}334|334|}
{2010601001|XXGgraph_vertex_vertex|562|0|901|0|{Concatenate|}266|340|}
{2010212001|XXGvertex_oport_oport|563|0|903|0|{0|out|}340|341|}
{2010213001|XXGoport_dst_flow|564|0|905|0|{0|}341|289|}
{2010211001|XXGvertex_iport_iport|565|0|906|0|{0|in|}340|342|}
{2010214001|XXGiport_src_flow|566|0|908|0|{0|}342|282|}
{2010007001|XXGobject_proto_object|567|0|909|0|{}340|343|}
{2010212001|XXGvertex_oport_oport|568|0|911|0|{0|out|}343|344|}
{2010006001|XXGobject_psameas_object|569|0|913|0|{metadata|out_metadata|1|0|}344|343|}
{2010211001|XXGvertex_iport_iport|570|0|914|0|{0|in|}343|345|}
{2010006001|XXGobject_psameas_object|571|0|916|0|{metadata|in_metadata|1|0|}345|343|}
{2010006001|XXGobject_psameas_object|572|0|917|0|{Layout|Layout|0|0|}340|346|}
{2010211001|XXGvertex_iport_iport|573|0|919|0|{0|write|}346|347|}
{2010214001|XXGiport_src_flow|574|0|921|0|{0|}347|289|}
{2010007001|XXGobject_proto_object|575|0|922|0|{}346|348|}
{2010211001|XXGvertex_iport_iport|576|0|924|0|{0|write|}348|349|}
{2010006001|XXGobject_psameas_object|577|0|926|0|{metadata|write_metadata|1|0|}349|348|}
{2010006001|XXGobject_psameas_object|578|0|927|0|{write_metadata|in_metadata|0|0|}346|334|}
{2010006001|XXGobject_psameas_object|579|0|928|0|{in_metadata|in_metadata|0|0|}340|334|}
{2010006001|XXGobject_psameas_object|580|0|929|0|{out_metadata|in_metadata|0|0|}340|334|}
{2010601001|XXGgraph_vertex_vertex|581|0|930|0|{Dummy_Concat|}266|350|}
{2010212001|XXGvertex_oport_oport|582|0|932|0|{0|out|}350|351|}
{2010211001|XXGvertex_iport_iport|583|0|934|0|{0|in|}350|352|}
{2010214001|XXGiport_src_flow|584|0|936|0|{0|}352|286|}
{2010214001|XXGiport_src_flow|585|0|937|0|{1|}352|287|}
{2010007001|XXGobject_proto_object|586|0|938|0|{}350|353|}
{2010212001|XXGvertex_oport_oport|587|0|940|0|{0|out|}353|354|}
{2010006001|XXGobject_psameas_object|588|0|942|0|{metadata|out_metadata|1|0|}354|353|}
{2010211001|XXGvertex_iport_iport|589|0|943|0|{0|in|}353|355|}
{2010006001|XXGobject_psameas_object|590|0|945|0|{metadata|in_metadata|1|0|}355|353|}
{2010006001|XXGobject_psameas_object|591|0|946|0|{Layout|Layout|0|0|}350|356|}
{2010212001|XXGvertex_oport_oport|592|0|948|0|{0|out|}356|357|}
{2010213001|XXGoport_dst_flow|593|0|950|0|{0|}357|286|}
{2010212001|XXGvertex_oport_oport|594|0|951|0|{1|filereject|}356|358|}
{2010212001|XXGvertex_oport_oport|595|0|953|0|{2|fileerror|}356|359|}
{2010212001|XXGvertex_oport_oport|596|0|955|0|{3|reject|}356|360|}
{2010212001|XXGvertex_oport_oport|597|0|957|0|{4|error|}356|361|}
{2010212001|XXGvertex_oport_oport|598|0|959|0|{5|log|}356|362|}
{2010211001|XXGvertex_iport_iport|599|0|961|0|{0|in|}356|363|}
{2010214001|XXGiport_src_flow|600|0|963|0|{0|}363|285|}
{2010007001|XXGobject_proto_object|601|0|964|0|{}356|364|}
{2010212001|XXGvertex_oport_oport|602|0|966|0|{0|out|}364|365|}
{2010006001|XXGobject_psameas_object|603|0|968|0|{metadata|out_metadata|1|0|}365|364|}
{2010212001|XXGvertex_oport_oport|604|0|969|0|{1|filereject|}364|366|}
{2010006001|XXGobject_psameas_object|605|0|971|0|{metadata|filereject_metadata|1|0|}366|364|}
{2010212001|XXGvertex_oport_oport|606|0|972|0|{2|fileerror|}364|367|}
{2010006001|XXGobject_psameas_object|607|0|974|0|{metadata|fileerror_metadata|1|0|}367|364|}
{2010212001|XXGvertex_oport_oport|608|0|975|0|{3|reject|}364|368|}
{2010006001|XXGobject_psameas_object|609|0|977|0|{metadata|reject_metadata|1|0|}368|364|}
{2010212001|XXGvertex_oport_oport|610|0|978|0|{4|error|}364|369|}
{2010006001|XXGobject_psameas_object|611|0|980|0|{metadata|error_metadata|1|0|}369|364|}
{2010212001|XXGvertex_oport_oport|612|0|981|0|{5|log|}364|370|}
{2010006001|XXGobject_psameas_object|613|0|983|0|{metadata|log_metadata|1|0|}370|364|}
{2010211001|XXGvertex_iport_iport|614|0|984|0|{0|in|}364|371|}
{2010006001|XXGobject_psameas_object|615|0|986|0|{metadata|in_metadata|1|0|}371|364|}
{2010006001|XXGobject_psameas_object|616|0|987|0|{filereject_metadata|out_metadata|0|0|}356|298|}
{2010006001|XXGobject_psameas_object|617|0|988|0|{in_metadata|out_metadata|0|0|}356|298|}
{2010006001|XXGobject_psameas_object|618|0|989|0|{in_metadata|out_metadata|0|0|}350|356|}
{2010006001|XXGobject_psameas_object|619|0|990|0|{out_metadata|out_metadata|0|0|}350|356|}
{2010601001|XXGgraph_vertex_vertex|620|0|991|0|{Dummy_Replicate|}266|372|}
{2010212001|XXGvertex_oport_oport|621|0|993|0|{0|out|}372|373|}
{2010213001|XXGoport_dst_flow|622|0|995|0|{0|}373|285|}
{2010213001|XXGoport_dst_flow|623|0|996|0|{1|}373|284|}
{2010213001|XXGoport_dst_flow|624|0|997|0|{2|}373|283|}
{2010211001|XXGvertex_iport_iport|625|0|998|0|{0|in|}372|374|}
{2010214001|XXGiport_src_flow|626|0|1000|0|{0|}374|281|}
{2010007001|XXGobject_proto_object|627|0|1001|0|{}372|375|}
{2010212001|XXGvertex_oport_oport|628|0|1003|0|{0|out|}375|376|}
{2010006001|XXGobject_psameas_object|629|0|1005|0|{metadata|out_metadata|1|0|}376|375|}
{2010211001|XXGvertex_iport_iport|630|0|1006|0|{0|in|}375|377|}
{2010006001|XXGobject_psameas_object|631|0|1008|0|{metadata|in_metadata|1|0|}377|375|}
{2010006001|XXGobject_psameas_object|632|0|1009|0|{Layout|Layout|0|0|}372|298|}
{2010006001|XXGobject_psameas_object|633|0|1010|0|{in_metadata|out_metadata|0|0|}372|298|}
{2010006001|XXGobject_psameas_object|634|0|1011|0|{out_metadata|out_metadata|0|0|}372|298|}
{2010601001|XXGgraph_vertex_vertex|635|0|1012|0|{List_Files|}266|298|}
{2010601001|XXGgraph_vertex_vertex|636|0|1013|0|{Log_the_List_of_Files|}266|378|}
{2010604001|XXGgraph_flow_flow|637|0|1015|0|{Flow_11|}378|379|}
{2010601001|XXGgraph_vertex_vertex|638|0|1017|0|{Build_Full_Path|}378|380|}
{2010212001|XXGvertex_oport_oport|639|0|1019|0|{0|out0|}380|381|}
{2010213001|XXGoport_dst_flow|640|0|1021|0|{0|}381|379|}
{2010212001|XXGvertex_oport_oport|641|0|1022|0|{1|reject0|}380|382|}
{2010212001|XXGvertex_oport_oport|642|0|1024|0|{2|error0|}380|383|}
{2010212001|XXGvertex_oport_oport|643|0|1026|0|{3|log|}380|384|}
{2010211001|XXGvertex_iport_iport|644|0|1028|0|{0|in|}380|385|}
{2010007001|XXGobject_proto_object|645|0|1030|0|{}380|386|}
{2010212001|XXGvertex_oport_oport|646|0|1032|0|{0|out0|}386|387|}
{2010006001|XXGobject_psameas_object|647|0|1034|0|{metadata|out0_metadata|1|0|}387|386|}
{2010006001|XXGobject_psameas_object|648|0|1035|0|{transform0|transform0|1|0|}387|386|}
{2010212001|XXGvertex_oport_oport|649|0|1036|0|{1|reject0|}386|388|}
{2010006001|XXGobject_psameas_object|650|0|1038|0|{metadata|reject0_metadata|1|0|}388|386|}
{2010212001|XXGvertex_oport_oport|651|0|1039|0|{2|error0|}386|389|}
{2010006001|XXGobject_psameas_object|652|0|1041|0|{metadata|error0_metadata|1|0|}389|386|}
{2010212001|XXGvertex_oport_oport|653|0|1042|0|{3|log|}386|390|}
{2010006001|XXGobject_psameas_object|654|0|1044|0|{metadata|log_metadata|1|0|}390|386|}
{2010211001|XXGvertex_iport_iport|655|0|1045|0|{0|in|}386|391|}
{2010006001|XXGobject_psameas_object|656|0|1047|0|{metadata|in_metadata|1|0|}391|386|}
{2010006001|XXGobject_psameas_object|657|0|1048|0|{Layout|Layout|0|0|}380|392|}
{2010211001|XXGvertex_iport_iport|658|0|1050|0|{0|write|}392|393|}
{2010214001|XXGiport_src_flow|659|0|1052|0|{0|}393|379|}
{2010007001|XXGobject_proto_object|660|0|1053|0|{}392|394|}
{2010211001|XXGvertex_iport_iport|661|0|1055|0|{0|write|}394|395|}
{2010006001|XXGobject_psameas_object|662|0|1057|0|{metadata|write_metadata|1|0|}395|394|}
{2010006001|XXGobject_psameas_object|663|0|1058|0|{write_metadata|out_metadata|0|0|}392|298|}
{2010006001|XXGobject_psameas_object|664|0|1059|0|{in_metadata|out_metadata|0|0|}380|298|}
{2010006001|XXGobject_psameas_object|665|0|1060|0|{out0_metadata|out_metadata|0|0|}380|298|}
{2010006001|XXGobject_psameas_object|666|0|1061|0|{reject0_metadata|out_metadata|0|0|}380|298|}
{2010601001|XXGgraph_vertex_vertex|667|0|1062|0|{File_List|}378|392|}
{2010211001|XXGvertex_iport_iport|668|0|1063|0|{0|in0|}378|396|}
{2010215002|XXGiport_binding_iport|669|0|1065|0|{.5|.5|{0|}2204|}396|385|}
{2010214001|XXGiport_src_flow|670|0|1066|0|{0|}396|283|}
{2010601001|XXGgraph_vertex_vertex|671|0|1067|0|{Read_All_Matching_Files|}266|356|}
{2010601001|XXGgraph_vertex_vertex|672|0|1068|0|{Read_All_Matching_Files_1|}266|397|}
{2010212001|XXGvertex_oport_oport|673|0|1070|0|{0|out|}397|398|}
{2010213001|XXGoport_dst_flow|674|0|1072|0|{0|}398|287|}
{2010212001|XXGvertex_oport_oport|675|0|1073|0|{1|filereject|}397|399|}
{2010212001|XXGvertex_oport_oport|676|0|1075|0|{2|fileerror|}397|400|}
{2010212001|XXGvertex_oport_oport|677|0|1077|0|{3|reject|}397|401|}
{2010212001|XXGvertex_oport_oport|678|0|1079|0|{4|error|}397|402|}
{2010212001|XXGvertex_oport_oport|679|0|1081|0|{5|log|}397|403|}
{2010211001|XXGvertex_iport_iport|680|0|1083|0|{0|in|}397|404|}
{2010214001|XXGiport_src_flow|681|0|1085|0|{0|}404|288|}
{2010007001|XXGobject_proto_object|682|0|1086|0|{}397|405|}
{2010212001|XXGvertex_oport_oport|683|0|1088|0|{0|out|}405|406|}
{2010006001|XXGobject_psameas_object|684|0|1090|0|{metadata|out_metadata|1|0|}406|405|}
{2010212001|XXGvertex_oport_oport|685|0|1091|0|{1|filereject|}405|407|}
{2010006001|XXGobject_psameas_object|686|0|1093|0|{metadata|filereject_metadata|1|0|}407|405|}
{2010212001|XXGvertex_oport_oport|687|0|1094|0|{2|fileerror|}405|408|}
{2010006001|XXGobject_psameas_object|688|0|1096|0|{metadata|fileerror_metadata|1|0|}408|405|}
{2010212001|XXGvertex_oport_oport|689|0|1097|0|{3|reject|}405|409|}
{2010006001|XXGobject_psameas_object|690|0|1099|0|{metadata|reject_metadata|1|0|}409|405|}
{2010212001|XXGvertex_oport_oport|691|0|1100|0|{4|error|}405|410|}
{2010006001|XXGobject_psameas_object|692|0|1102|0|{metadata|error_metadata|1|0|}410|405|}
{2010212001|XXGvertex_oport_oport|693|0|1103|0|{5|log|}405|411|}
{2010006001|XXGobject_psameas_object|694|0|1105|0|{metadata|log_metadata|1|0|}411|405|}
{2010211001|XXGvertex_iport_iport|695|0|1106|0|{0|in|}405|412|}
{2010006001|XXGobject_psameas_object|696|0|1108|0|{metadata|in_metadata|1|0|}412|405|}
{2010006001|XXGobject_psameas_object|697|0|1109|0|{filereject_metadata|out_metadata|0|0|}397|298|}
{2010006001|XXGobject_psameas_object|698|0|1110|0|{in_metadata|out_metadata|0|0|}397|298|}
{2010006001|XXGobject_psameas_object|699|0|1111|0|{out_metadata|out_metadata|0|0|}397|356|}
{2010601001|XXGgraph_vertex_vertex|700|0|1112|0|{Read_Errors_MFS|}266|316|}
{2010601001|XXGgraph_vertex_vertex|701|0|1113|0|{Read_Errors_Serial|}266|330|}
{2010601001|XXGgraph_vertex_vertex|702|0|1114|0|{Read_File_s_Log|}266|346|}
{2010212001|XXGvertex_oport_oport|703|0|1115|0|{0|out0|}266|413|}
{2010216002|XXGoport_binding_oport|704|0|1117|0|{.5|.5|{0|}2266|}413|351|}
{2010213001|XXGoport_dst_flow|705|0|1118|0|{0|}413|31|}
{2010601001|XXGgraph_vertex_vertex|706|0|1119|0|{Read_Single_XLS_File|}1|414|}
{2010601001|XXGgraph_vertex_vertex|707|0|1121|0|{Read_Excel_Spreadsheet|}414|79|}
{2010212001|XXGvertex_oport_oport|708|0|1122|0|{0|out0|}414|415|}
{2010216002|XXGoport_binding_oport|709|0|1124|0|{.5|.5|{0|}1|}415|80|}
{2010213001|XXGoport_dst_flow|710|0|1125|0|{0|}415|35|}
{2010601001|XXGgraph_vertex_vertex|711|0|1126|0|{Remove_Overlaps|}1|416|}
{2010604001|XXGgraph_flow_flow|712|0|1128|0|{Flow_1|}416|417|}
{2010604001|XXGgraph_flow_flow|713|0|1130|0|{Flow_12|}416|418|}
{2010244001|XXGflow_watcher_watcher|714|0|1132|0|{}418|419|}
{2010604001|XXGgraph_flow_flow|715|0|1134|0|{Flow_13|}416|420|}
{2010604001|XXGgraph_flow_flow|716|0|1136|0|{Flow_14|}416|421|}
{2010244001|XXGflow_watcher_watcher|717|0|1138|0|{}421|422|}
{2010604001|XXGgraph_flow_flow|718|0|1140|0|{Flow_2|}416|423|}
{2010604001|XXGgraph_flow_flow|719|0|1142|0|{Flow_3|}416|424|}
{2010604001|XXGgraph_flow_flow|720|0|1144|0|{Flow_4|}416|425|}
{2010604001|XXGgraph_flow_flow|721|0|1146|0|{Flow_6|}416|426|}
{2010604001|XXGgraph_flow_flow|722|0|1148|0|{Flow_9|}416|427|}
{2010244001|XXGflow_watcher_watcher|723|0|1150|0|{}427|428|}
{2010601001|XXGgraph_vertex_vertex|724|0|1152|0|{Filter_by_Expression|}416|429|}
{2010212001|XXGvertex_oport_oport|725|0|1154|0|{0|out|}429|430|}
{2010213001|XXGoport_dst_flow|726|0|1156|0|{0|}430|425|}
{2010212001|XXGvertex_oport_oport|727|0|1157|0|{1|deselect|}429|431|}
{2010213001|XXGoport_dst_flow|728|0|1159|0|{0|}431|420|}
{2010212001|XXGvertex_oport_oport|729|0|1160|0|{2|reject|}429|432|}
{2010212001|XXGvertex_oport_oport|730|0|1162|0|{3|error|}429|433|}
{2010212001|XXGvertex_oport_oport|731|0|1164|0|{4|log|}429|434|}
{2010211001|XXGvertex_iport_iport|732|0|1166|0|{0|in|}429|435|}
{2010214001|XXGiport_src_flow|733|0|1168|0|{0|}435|427|}
{2010007001|XXGobject_proto_object|734|0|1169|0|{}429|436|}
{2010212001|XXGvertex_oport_oport|735|0|1171|0|{0|out|}436|437|}
{2010006001|XXGobject_psameas_object|736|0|1173|0|{metadata|out_metadata|1|0|}437|436|}
{2010212001|XXGvertex_oport_oport|737|0|1174|0|{1|deselect|}436|438|}
{2010006001|XXGobject_psameas_object|738|0|1176|0|{metadata|deselect_metadata|1|0|}438|436|}
{2010212001|XXGvertex_oport_oport|739|0|1177|0|{2|reject|}436|439|}
{2010006001|XXGobject_psameas_object|740|0|1179|0|{metadata|reject_metadata|1|0|}439|436|}
{2010212001|XXGvertex_oport_oport|741|0|1180|0|{3|error|}436|440|}
{2010006001|XXGobject_psameas_object|742|0|1182|0|{metadata|error_metadata|1|0|}440|436|}
{2010212001|XXGvertex_oport_oport|743|0|1183|0|{4|log|}436|441|}
{2010006001|XXGobject_psameas_object|744|0|1185|0|{metadata|log_metadata|1|0|}441|436|}
{2010211001|XXGvertex_iport_iport|745|0|1186|0|{0|in|}436|442|}
{2010006001|XXGobject_psameas_object|746|0|1188|0|{metadata|in_metadata|1|0|}442|436|}
{2010006001|XXGobject_psameas_object|747|0|1189|0|{Layout|Layout|0|0|}429|443|}
{2010211001|XXGvertex_iport_iport|748|0|1191|0|{0|write|}443|444|}
{2010214001|XXGiport_src_flow|749|0|1193|0|{0|}444|420|}
{2010007001|XXGobject_proto_object|750|0|1194|0|{}443|445|}
{2010211001|XXGvertex_iport_iport|751|0|1196|0|{0|write|}445|446|}
{2010006001|XXGobject_psameas_object|752|0|1198|0|{metadata|write_metadata|1|0|}446|445|}
{2010006001|XXGobject_psameas_object|753|0|1199|0|{write_metadata|out_metadata|0|0|}443|447|}
{2010212001|XXGvertex_oport_oport|754|0|1201|0|{0|out|}447|448|}
{2010213001|XXGoport_dst_flow|755|0|1203|0|{0|}448|427|}
{2010212001|XXGvertex_oport_oport|756|0|1204|0|{1|reject|}447|449|}
{2010212001|XXGvertex_oport_oport|757|0|1206|0|{2|error|}447|450|}
{2010212001|XXGvertex_oport_oport|758|0|1208|0|{3|log|}447|451|}
{2010211001|XXGvertex_iport_iport|759|0|1210|0|{0|in|}447|452|}
{2010214001|XXGiport_src_flow|760|0|1212|0|{0|}452|418|}
{2010007001|XXGobject_proto_object|761|0|1213|0|{}447|453|}
{2010212001|XXGvertex_oport_oport|762|0|1215|0|{0|out|}453|454|}
{2010006001|XXGobject_psameas_object|763|0|1217|0|{metadata|out_metadata|1|0|}454|453|}
{2010212001|XXGvertex_oport_oport|764|0|1218|0|{1|reject|}453|455|}
{2010006001|XXGobject_psameas_object|765|0|1220|0|{metadata|reject_metadata|1|0|}455|453|}
{2010212001|XXGvertex_oport_oport|766|0|1221|0|{2|error|}453|456|}
{2010006001|XXGobject_psameas_object|767|0|1223|0|{metadata|error_metadata|1|0|}456|453|}
{2010212001|XXGvertex_oport_oport|768|0|1224|0|{3|log|}453|457|}
{2010006001|XXGobject_psameas_object|769|0|1226|0|{metadata|log_metadata|1|0|}457|453|}
{2010211001|XXGvertex_iport_iport|770|0|1227|0|{0|in|}453|458|}
{2010006001|XXGobject_psameas_object|771|0|1229|0|{metadata|in_metadata|1|0|}458|453|}
{2010006001|XXGobject_psameas_object|772|0|1230|0|{Layout|Layout|0|0|}447|443|}
{2010006001|XXGobject_psameas_object|773|0|1231|0|{in_metadata|out_metadata|0|0|}447|459|}
{2010212001|XXGvertex_oport_oport|774|0|1233|0|{0|out|}459|460|}
{2010213001|XXGoport_dst_flow|775|0|1235|0|{0|}460|421|}
{2010212001|XXGvertex_oport_oport|776|0|1236|0|{1|reject|}459|461|}
{2010212001|XXGvertex_oport_oport|777|0|1238|0|{2|error|}459|462|}
{2010212001|XXGvertex_oport_oport|778|0|1240|0|{3|log|}459|463|}
{2010211001|XXGvertex_iport_iport|779|0|1242|0|{0|in|}459|464|}
{2010214001|XXGiport_src_flow|780|0|1244|0|{0|}464|424|}
{2010007001|XXGobject_proto_object|781|0|1245|0|{}459|465|}
{2010212001|XXGvertex_oport_oport|782|0|1247|0|{0|out|}465|466|}
{2010006001|XXGobject_psameas_object|783|0|1249|0|{metadata|out_metadata|1|0|}466|465|}
{2010212001|XXGvertex_oport_oport|784|0|1250|0|{1|reject|}465|467|}
{2010006001|XXGobject_psameas_object|785|0|1252|0|{metadata|reject_metadata|1|0|}467|465|}
{2010212001|XXGvertex_oport_oport|786|0|1253|0|{2|error|}465|468|}
{2010006001|XXGobject_psameas_object|787|0|1255|0|{metadata|error_metadata|1|0|}468|465|}
{2010212001|XXGvertex_oport_oport|788|0|1256|0|{3|log|}465|469|}
{2010006001|XXGobject_psameas_object|789|0|1258|0|{metadata|log_metadata|1|0|}469|465|}
{2010211001|XXGvertex_iport_iport|790|0|1259|0|{0|in|}465|470|}
{2010006001|XXGobject_psameas_object|791|0|1261|0|{metadata|in_metadata|1|0|}470|465|}
{2010006001|XXGobject_psameas_object|792|0|1262|0|{Layout|Layout|0|0|}459|443|}
{2010006001|XXGobject_psameas_object|793|0|1263|0|{in_metadata|write_metadata|0|0|}459|133|}
{2010006001|XXGobject_psameas_object|794|0|1264|0|{reject_metadata|write_metadata|0|0|}459|133|}
{2010006001|XXGobject_psameas_object|795|0|1265|0|{reject_metadata|out_metadata|0|0|}447|459|}
{2010006001|XXGobject_psameas_object|796|0|1266|0|{deselect_metadata|out_metadata|0|0|}429|447|}
{2010006001|XXGobject_psameas_object|797|0|1267|0|{in_metadata|out_metadata|0|0|}429|447|}
{2010006001|XXGobject_psameas_object|798|0|1268|0|{out_metadata|out_metadata|0|0|}429|447|}
{2010006001|XXGobject_psameas_object|799|0|1269|0|{reject_metadata|out_metadata|0|0|}429|447|}
{2010601001|XXGgraph_vertex_vertex|800|0|1270|0|{Gather|}416|471|}
{2010212001|XXGvertex_oport_oport|801|0|1272|0|{0|out|}471|472|}
{2010213001|XXGoport_dst_flow|802|0|1274|0|{0|}472|423|}
{2010211001|XXGvertex_iport_iport|803|0|1275|0|{0|in|}471|473|}
{2010007001|XXGobject_proto_object|804|0|1277|0|{}471|474|}
{2010212001|XXGvertex_oport_oport|805|0|1279|0|{0|out|}474|475|}
{2010006001|XXGobject_psameas_object|806|0|1281|0|{metadata|out_metadata|1|0|}475|474|}
{2010211001|XXGvertex_iport_iport|807|0|1282|0|{0|in|}474|476|}
{2010006001|XXGobject_psameas_object|808|0|1284|0|{metadata|in_metadata|1|0|}476|474|}
{2010006001|XXGobject_psameas_object|809|0|1285|0|{Layout|Layout|0|0|}471|133|}
{2010006001|XXGobject_psameas_object|810|0|1286|0|{in_metadata|write_metadata|0|0|}471|63|}
{2010006001|XXGobject_psameas_object|811|0|1287|0|{out_metadata|write_metadata|0|0|}471|63|}
{2010601001|XXGgraph_vertex_vertex|812|0|1288|0|{Join|}416|477|}
{2010212001|XXGvertex_oport_oport|813|0|1290|0|{0|out|}477|478|}
{2010212001|XXGvertex_oport_oport|814|0|1292|0|{1|unused0|}477|479|}
{2010212001|XXGvertex_oport_oport|815|0|1294|0|{2|unused1|}477|480|}
{2010212001|XXGvertex_oport_oport|816|0|1296|0|{3|reject0|}477|481|}
{2010212001|XXGvertex_oport_oport|817|0|1298|0|{4|reject1|}477|482|}
{2010212001|XXGvertex_oport_oport|818|0|1300|0|{5|error0|}477|483|}
{2010212001|XXGvertex_oport_oport|819|0|1302|0|{6|error1|}477|484|}
{2010212001|XXGvertex_oport_oport|820|0|1304|0|{7|log|}477|485|}
{2010211001|XXGvertex_iport_iport|821|0|1306|0|{0|in0|}477|486|}
{2010214001|XXGiport_src_flow|822|0|1308|0|{0|}486|426|}
{2010211001|XXGvertex_iport_iport|823|0|1309|0|{1|in1|}477|487|}
{2010214001|XXGiport_src_flow|824|0|1311|0|{0|}487|425|}
{2010007001|XXGobject_proto_object|825|0|1312|0|{}477|488|}
{2010212001|XXGvertex_oport_oport|826|0|1314|0|{0|out|}488|489|}
{2010006001|XXGobject_psameas_object|827|0|1316|0|{metadata|out_metadata|1|0|}489|488|}
{2010212001|XXGvertex_oport_oport|828|0|1317|0|{1|unused0|}488|490|}
{2010006001|XXGobject_psameas_object|829|0|1319|0|{metadata|unused0_metadata|1|0|}490|488|}
{2010212001|XXGvertex_oport_oport|830|0|1320|0|{2|unused1|}488|491|}
{2010006001|XXGobject_psameas_object|831|0|1322|0|{metadata|unused1_metadata|1|0|}491|488|}
{2010212001|XXGvertex_oport_oport|832|0|1323|0|{3|reject0|}488|492|}
{2010006001|XXGobject_psameas_object|833|0|1325|0|{metadata|reject0_metadata|1|0|}492|488|}
{2010212001|XXGvertex_oport_oport|834|0|1326|0|{4|reject1|}488|493|}
{2010006001|XXGobject_psameas_object|835|0|1328|0|{metadata|reject1_metadata|1|0|}493|488|}
{2010212001|XXGvertex_oport_oport|836|0|1329|0|{5|error0|}488|494|}
{2010006001|XXGobject_psameas_object|837|0|1331|0|{metadata|error0_metadata|1|0|}494|488|}
{2010212001|XXGvertex_oport_oport|838|0|1332|0|{6|error1|}488|495|}
{2010006001|XXGobject_psameas_object|839|0|1334|0|{metadata|error1_metadata|1|0|}495|488|}
{2010212001|XXGvertex_oport_oport|840|0|1335|0|{7|log|}488|496|}
{2010006001|XXGobject_psameas_object|841|0|1337|0|{metadata|log_metadata|1|0|}496|488|}
{2010211001|XXGvertex_iport_iport|842|0|1338|0|{0|in0|}488|497|}
{2010006001|XXGobject_psameas_object|843|0|1340|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|844|0|1341|0|{dedup0|dedup0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|845|0|1342|0|{dedup_keyword0|dedup_keyword0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|846|0|1343|0|{dedup_positional0|dedup_positional0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|847|0|1344|0|{matchoptional_keyword0|matchoptional_keyword0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|848|0|1345|0|{matchoptional_positional0|matchoptional_positional0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|849|0|1346|0|{metadata|in0_metadata|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|850|0|1347|0|{override_key0|override_key0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|851|0|1348|0|{record_match_required0|record_match_required0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|852|0|1349|0|{record_match_required_not0|record_match_required_not0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|853|0|1350|0|{record_required0|record_required0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|854|0|1351|0|{record_required_keyword0|record_required_keyword0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|855|0|1352|0|{record_required_positional0|record_required_positional0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|856|0|1353|0|{select0|select0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|857|0|1354|0|{select_keyword0|select_keyword0|1|0|}497|488|}
{2010006001|XXGobject_psameas_object|858|0|1355|0|{select_positional0|select_positional0|1|0|}497|488|}
{2010211001|XXGvertex_iport_iport|859|0|1356|0|{1|in1|}488|498|}
{2010006001|XXGobject_psameas_object|860|0|1358|0|{YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|YourGdeCannotUseJoinParameterInterfaceVersion322WithLegacyCodegen1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|861|0|1359|0|{dedup1|dedup1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|862|0|1360|0|{dedup_keyword1|dedup_keyword1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|863|0|1361|0|{dedup_positional1|dedup_positional1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|864|0|1362|0|{matchoptional_keyword1|matchoptional_keyword1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|865|0|1363|0|{matchoptional_positional1|matchoptional_positional1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|866|0|1364|0|{metadata|in1_metadata|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|867|0|1365|0|{override_key1|override_key1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|868|0|1366|0|{record_match_required1|record_match_required1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|869|0|1367|0|{record_match_required_not1|record_match_required_not1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|870|0|1368|0|{record_required1|record_required1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|871|0|1369|0|{record_required_keyword1|record_required_keyword1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|872|0|1370|0|{record_required_positional1|record_required_positional1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|873|0|1371|0|{select1|select1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|874|0|1372|0|{select_keyword1|select_keyword1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|875|0|1373|0|{select_positional1|select_positional1|1|0|}498|488|}
{2010006001|XXGobject_psameas_object|876|0|1374|0|{Layout|Layout|0|0|}477|133|}
{2010006001|XXGobject_psameas_object|877|0|1375|0|{in0_metadata|write_metadata|0|0|}477|133|}
{2010006001|XXGobject_psameas_object|878|0|1376|0|{in1_metadata|out_metadata|0|0|}477|447|}
{2010006001|XXGobject_psameas_object|879|0|1377|0|{out_metadata|write_metadata|0|0|}477|133|}
{2010006001|XXGobject_psameas_object|880|0|1378|0|{reject0_metadata|write_metadata|0|0|}477|133|}
{2010006001|XXGobject_psameas_object|881|0|1379|0|{reject1_metadata|out_metadata|0|0|}477|447|}
{2010006001|XXGobject_psameas_object|882|0|1380|0|{unused0_metadata|write_metadata|0|0|}477|133|}
{2010006001|XXGobject_psameas_object|883|0|1381|0|{unused1_metadata|out_metadata|0|0|}477|447|}
{2010601001|XXGgraph_vertex_vertex|884|0|1382|0|{Normalize|}416|447|}
{2010601001|XXGgraph_vertex_vertex|885|0|1383|0|{Overlaps|}416|443|}
{2010601001|XXGgraph_vertex_vertex|886|0|1384|0|{Reformat|}416|499|}
{2010212001|XXGvertex_oport_oport|887|0|1386|0|{0|out0|}499|500|}
{2010213001|XXGoport_dst_flow|888|0|1388|0|{0|}500|418|}
{2010212001|XXGvertex_oport_oport|889|0|1389|0|{1|reject0|}499|501|}
{2010212001|XXGvertex_oport_oport|890|0|1391|0|{2|error0|}499|502|}
{2010212001|XXGvertex_oport_oport|891|0|1393|0|{3|log|}499|503|}
{2010211001|XXGvertex_iport_iport|892|0|1395|0|{0|in|}499|504|}
{2010214001|XXGiport_src_flow|893|0|1397|0|{0|}504|421|}
{2010007001|XXGobject_proto_object|894|0|1398|0|{}499|505|}
{2010212001|XXGvertex_oport_oport|895|0|1400|0|{0|out0|}505|506|}
{2010006001|XXGobject_psameas_object|896|0|1402|0|{metadata|out0_metadata|1|0|}506|505|}
{2010006001|XXGobject_psameas_object|897|0|1403|0|{transform0|transform0|1|0|}506|505|}
{2010212001|XXGvertex_oport_oport|898|0|1404|0|{1|reject0|}505|507|}
{2010006001|XXGobject_psameas_object|899|0|1406|0|{metadata|reject0_metadata|1|0|}507|505|}
{2010212001|XXGvertex_oport_oport|900|0|1407|0|{2|error0|}505|508|}
{2010006001|XXGobject_psameas_object|901|0|1409|0|{metadata|error0_metadata|1|0|}508|505|}
{2010212001|XXGvertex_oport_oport|902|0|1410|0|{3|log|}505|509|}
{2010006001|XXGobject_psameas_object|903|0|1412|0|{metadata|log_metadata|1|0|}509|505|}
{2010211001|XXGvertex_iport_iport|904|0|1413|0|{0|in|}505|510|}
{2010006001|XXGobject_psameas_object|905|0|1415|0|{metadata|in_metadata|1|0|}510|505|}
{2010006001|XXGobject_psameas_object|906|0|1416|0|{Layout|Layout|0|0|}499|443|}
{2010006001|XXGobject_psameas_object|907|0|1417|0|{in_metadata|out_metadata|0|0|}499|459|}
{2010006001|XXGobject_psameas_object|908|0|1418|0|{out0_metadata|out_metadata|0|0|}499|459|}
{2010006001|XXGobject_psameas_object|909|0|1419|0|{reject0_metadata|out_metadata|0|0|}499|459|}
{2010601001|XXGgraph_vertex_vertex|910|0|1420|0|{Replicate|}416|511|}
{2010212001|XXGvertex_oport_oport|911|0|1422|0|{0|out|}511|512|}
{2010213001|XXGoport_dst_flow|912|0|1424|0|{0|}512|426|}
{2010213001|XXGoport_dst_flow|913|0|1425|0|{1|}512|424|}
{2010211001|XXGvertex_iport_iport|914|0|1426|0|{0|in|}511|513|}
{2010214001|XXGiport_src_flow|915|0|1428|0|{0|}513|417|}
{2010007001|XXGobject_proto_object|916|0|1429|0|{}511|514|}
{2010212001|XXGvertex_oport_oport|917|0|1431|0|{0|out|}514|515|}
{2010006001|XXGobject_psameas_object|918|0|1433|0|{metadata|out_metadata|1|0|}515|514|}
{2010211001|XXGvertex_iport_iport|919|0|1434|0|{0|in|}514|516|}
{2010006001|XXGobject_psameas_object|920|0|1436|0|{metadata|in_metadata|1|0|}516|514|}
{2010006001|XXGobject_psameas_object|921|0|1437|0|{Layout|Layout|0|0|}511|133|}
{2010006001|XXGobject_psameas_object|922|0|1438|0|{in_metadata|write_metadata|0|0|}511|133|}
{2010006001|XXGobject_psameas_object|923|0|1439|0|{out_metadata|write_metadata|0|0|}511|133|}
{2010601001|XXGgraph_vertex_vertex|924|0|1440|0|{Rollup|}416|459|}
{2010601001|XXGgraph_vertex_vertex|925|0|1441|0|{Sort|}416|517|}
{2010212001|XXGvertex_oport_oport|926|0|1443|0|{0|out|}517|518|}
{2010213001|XXGoport_dst_flow|927|0|1445|0|{0|}518|417|}
{2010211001|XXGvertex_iport_iport|928|0|1446|0|{0|in|}517|519|}
{2010214001|XXGiport_src_flow|929|0|1448|0|{0|}519|423|}
{2010007001|XXGobject_proto_object|930|0|1449|0|{}517|520|}
{2010212001|XXGvertex_oport_oport|931|0|1451|0|{0|out|}520|521|}
{2010006001|XXGobject_psameas_object|932|0|1453|0|{metadata|out_metadata|1|0|}521|520|}
{2010211001|XXGvertex_iport_iport|933|0|1454|0|{0|in|}520|522|}
{2010006001|XXGobject_psameas_object|934|0|1456|0|{metadata|in_metadata|1|0|}522|520|}
{2010006001|XXGobject_psameas_object|935|0|1457|0|{Layout|Layout|0|0|}517|133|}
{2010006001|XXGobject_psameas_object|936|0|1458|0|{in_metadata|write_metadata|0|0|}517|133|}
{2010006001|XXGobject_psameas_object|937|0|1459|0|{out_metadata|write_metadata|0|0|}517|133|}
{2010212001|XXGvertex_oport_oport|938|0|1460|0|{0|out0|}416|523|}
{2010216002|XXGoport_binding_oport|939|0|1462|0|{.5|.5|{0|}10715|}523|478|}
{2010213001|XXGoport_dst_flow|940|0|1463|0|{0|}523|46|}
{2010211001|XXGvertex_iport_iport|941|0|1464|0|{0|in0|}416|524|}
{2010215002|XXGiport_binding_iport|942|0|1466|0|{.5|.5|{0|}10714|}524|473|}
{2010214001|XXGiport_src_flow|943|0|1467|0|{0|}524|42|}
{2010601001|XXGgraph_vertex_vertex|944|0|1468|0|{Switch_from_Serial_to_MFS|}1|525|}
{2010212001|XXGvertex_oport_oport|945|0|1470|0|{0|out|}525|526|}
{2010213001|XXGoport_dst_flow|946|0|1472|0|{0|}526|43|}
{2010211001|XXGvertex_iport_iport|947|0|1473|0|{0|in|}525|527|}
{2010214001|XXGiport_src_flow|948|0|1475|0|{0|}527|31|}
{2010214001|XXGiport_src_flow|949|0|1476|0|{1|}527|35|}
{2010007001|XXGobject_proto_object|950|0|1477|0|{}525|528|}
{2010212001|XXGvertex_oport_oport|951|0|1479|0|{0|out|}528|529|}
{2010006001|XXGobject_psameas_object|952|0|1481|0|{metadata|out_metadata|1|0|}529|528|}
{2010211001|XXGvertex_iport_iport|953|0|1482|0|{0|in|}528|530|}
{2010006001|XXGobject_psameas_object|954|0|1484|0|{metadata|in_metadata|1|0|}530|528|}
{2010006001|XXGobject_psameas_object|955|0|1485|0|{Layout|Layout|0|0|}525|79|}
{2010006001|XXGobject_psameas_object|956|0|1486|0|{in_metadata|out_metadata|0|0|}525|79|}
{2010006001|XXGobject_psameas_object|957|0|1487|0|{out_metadata|out_metadata|0|0|}525|79|}
{2010601001|XXGgraph_vertex_vertex|958|0|1488|0|{Version_Log|}1|531|}
{2010605001|XXGgraph_legend_legend|959|0|1490|0|{0|}531|532|}
{2010241001|XXGlegend_face_face|960|0|1492|0|{}532|533|}
{2010605001|XXGgraph_legend_legend|961|0|1494|0|{1|}531|534|}
{2010241001|XXGlegend_face_face|962|0|1496|0|{}534|535|}
{2010605001|XXGgraph_legend_legend|963|0|1498|0|{2|}531|536|}
{2010241001|XXGlegend_face_face|964|0|1500|0|{}536|537|}
{2010605001|XXGgraph_legend_legend|965|0|1502|0|{3|}531|538|}
{2010241001|XXGlegend_face_face|966|0|1504|0|{}538|539|}
{2010605001|XXGgraph_legend_legend|967|0|1506|0|{4|}531|540|}
{2010241001|XXGlegend_face_face|968|0|1508|0|{}540|541|}
{2010605001|XXGgraph_legend_legend|969|0|1510|0|{5|}531|542|}
{2010241001|XXGlegend_face_face|970|0|1512|0|{}542|543|}
{2010605001|XXGgraph_legend_legend|971|0|1514|0|{6|}531|544|}
{2010241001|XXGlegend_face_face|972|0|1516|0|{}544|545|}
{2010605001|XXGgraph_legend_legend|973|0|1518|0|{7|}531|546|}
{2010241001|XXGlegend_face_face|974|0|1520|0|{}546|547|}
{2010605001|XXGgraph_legend_legend|975|0|1522|0|{8|}531|548|}
{2010241001|XXGlegend_face_face|976|0|1524|0|{}548|549|}
{2010605001|XXGgraph_legend_legend|977|0|1526|0|{9|}531|550|}
{2010241001|XXGlegend_face_face|978|0|1528|0|{}550|551|}
{2010605001|XXGgraph_legend_legend|979|0|1530|0|{10|}531|552|}
{2010241001|XXGlegend_face_face|980|0|1532|0|{}552|553|}
{2010605001|XXGgraph_legend_legend|981|0|1534|0|{11|}531|554|}
{2010241001|XXGlegend_face_face|982|0|1536|0|{}554|555|}
{2010605001|XXGgraph_legend_legend|983|0|1538|0|{12|}531|556|}
{2010241001|XXGlegend_face_face|984|0|1540|0|{}556|557|}
{2010605001|XXGgraph_legend_legend|985|0|1542|0|{13|}531|558|}
{2010241001|XXGlegend_face_face|986|0|1544|0|{}558|559|}
{2010605001|XXGgraph_legend_legend|987|0|1546|0|{14|}531|560|}
{2010241001|XXGlegend_face_face|988|0|1548|0|{}560|561|}
{2010605001|XXGgraph_legend_legend|989|0|1550|0|{15|}531|562|}
{2010241001|XXGlegend_face_face|990|0|1552|0|{}562|563|}
{2010605001|XXGgraph_legend_legend|991|0|1554|0|{16|}531|564|}
{2010241001|XXGlegend_face_face|992|0|1556|0|{}564|565|}
{2010605001|XXGgraph_legend_legend|993|0|1558|0|{17|}531|566|}
{2010241001|XXGlegend_face_face|994|0|1560|0|{}566|567|}
{2010605001|XXGgraph_legend_legend|995|0|1562|0|{18|}531|568|}
{2010241001|XXGlegend_face_face|996|0|1564|0|{}568|569|}
{2010605001|XXGgraph_legend_legend|997|0|1566|0|{19|}531|570|}
{2010241001|XXGlegend_face_face|998|0|1568|0|{}570|571|}
{2010605001|XXGgraph_legend_legend|999|0|1570|0|{20|}531|572|}
{2010241001|XXGlegend_face_face|1000|0|1572|0|{}572|573|}
{2010605001|XXGgraph_legend_legend|1001|0|1574|0|{21|}531|574|}
{2010241001|XXGlegend_face_face|1002|0|1576|0|{}574|575|}
{2010605001|XXGgraph_legend_legend|1003|0|1578|0|{22|}531|576|}
{2010241001|XXGlegend_face_face|1004|0|1580|0|{}576|577|}
{2010605001|XXGgraph_legend_legend|1005|0|1582|0|{23|}531|578|}
{2010241001|XXGlegend_face_face|1006|0|1584|0|{}578|579|}
{2010605001|XXGgraph_legend_legend|1007|0|1586|0|{24|}531|580|}
{2010241001|XXGlegend_face_face|1008|0|1588|0|{}580|581|}
{2010605001|XXGgraph_legend_legend|1009|0|1590|0|{25|}531|582|}
{2010241001|XXGlegend_face_face|1010|0|1592|0|{}582|583|}
{2010605001|XXGgraph_legend_legend|1011|0|1594|0|{26|}531|584|}
{2010241001|XXGlegend_face_face|1012|0|1596|0|{}584|585|}
{2010605001|XXGgraph_legend_legend|1013|0|1598|0|{27|}531|586|}
{2010241001|XXGlegend_face_face|1014|0|1600|0|{}586|587|}
{2010605001|XXGgraph_legend_legend|1015|0|1602|0|{28|}531|588|}
{2010241001|XXGlegend_face_face|1016|0|1604|0|{}588|589|}
{2010605001|XXGgraph_legend_legend|1017|0|1606|0|{29|}531|590|}
{2010241001|XXGlegend_face_face|1018|0|1608|0|{}590|591|}
{2010605001|XXGgraph_legend_legend|1019|0|1610|0|{30|}531|592|}
{2010241001|XXGlegend_face_face|1020|0|1612|0|{}592|593|}
{2010605001|XXGgraph_legend_legend|1021|0|1614|0|{31|}531|594|}
{2010241001|XXGlegend_face_face|1022|0|1616|0|{}594|595|}
{2010109001|XXGobject_property_value|1023|0|1618|0|{0|TrackingThumbprint|72|}1|596|}
