@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|5|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|862|rel_count|1444|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_DML_DEFS||24|3|Kc||{0|}}
{30001002|XXparameter|___Intermediate_Pset_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|LOOKUP_PATH_SERIAL|$AI_SERIAL_LOOKUP|3|2|EK$|When creating a lookup, this path will be used for serial output|{0|}}
{30001002|XXparameter|LOOKUP_PATH_MFS|$AI_MFS_LOOKUP|3|2|EK$|When creating a lookup, this path will be used for MFS output|{0|}}
{30001002|XXparameter|AI_DML|$AI_DML|3|9|EFK|This parameter is added to resolve DML   path in scope of private project|{0|}}
{30001002|XXparameter|AI_XFR|$AI_XFR|3|9|EFK|This parameter is added to resolve XFR  path in scope of private project|{0|}}
{30001002|XXparameter|AI_CAT|$AI_CAT|3|9|EFK|This parameter is added to resolve CAT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS|$AI_MFS|3|9|FK|@{0|}}
{30001002|XXparameter|AI_MFS_PENDING|$AI_MFS_PENDING|3|9|FK|This parameter is added to resolve MFS PENDING  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS_TEMP|$AI_MFS_TEMP|3|9|FK|This parameter is added to resolve MFS TEMP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_MFS_REJECT|$AI_MFS_REJECT|3|9|FK|This parameter is added to resolve MFS REJECT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL|$AI_SERIAL|3|9|FK|@{0|}}
{30001002|XXparameter|AI_SERIAL_PENDING|$AI_SERIAL_PENDING|3|9|FK|This parameter is added to resolve SERIAL PENDING  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_TEMP|$AI_SERIAL_TEMP|3|9|FK|This parameter is added to resolve SERIAL TEMP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_LOOKUP|$AI_SERIAL_LOOKUP|3|9|FK|This parameter is added to resolve SERIAL LOOKUP  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_REJECT|$AI_SERIAL_REJECT|3|9|FK|This parameter is added to resolve REJECT  path in scope of private project|{0|}}
{30001002|XXparameter|AI_SERIAL_LOG|$AI_SERIAL_LOG|3|9|FK|This parameter is added to resolve LOG path in scope of private project|{0|}}
{30001002|XXparameter|JAVA_HOME|AI_PHASE|3|10|EFKd|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|EFK||{0|}}
{30001002|XXparameter|CURRENT_DATE|$[(string(""))(date("YYYYMMDD"))today()]|3|9|RFK|@{0|}}
{30001002|XXparameter|EXTERNAL_RUN_ID||3|9|FK|A unique identifier for the run. This is typically passed in from an outer plan that wants to keep track of tasks that ran in a single plan run. This is used, for example, in setting up the log file name of the list of files read.|{0|}}
{30001002|XXparameter|AB_CATALOG||3|2|EFK$|Catalog file containing all the lookups that will be used in the XFR|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|INPUT_FILE_PATH||3|9|RFK|Ful path of the input file to be transformed. This supports file patterns also, e.g. $AI_SERIAL_PENDING/source.*.YYYYMMDD.dat|{0|}}
{30001002|XXparameter|INPUT_FILE_DML||18|2|RFK$|File containing the record format of the input file.|{0|}}
{30001002|XXparameter|DO_IDS_ICFF_LOOKUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|LOOKUP_FILE_PATH|@18|9|FK|@{0|}}
{30001002|XXparameter|LOOKUP_FILE_DML|$[PUB_DATAHUB_DML + '/ids_rxclaim/ids_rxclaim.d_latest_claim.dml']|18|9|FK|@{0|}}
{30001002|XXparameter|READ_EXCEL|N|3|9|FK|This parameter will be passed if input file is excel|{0|}}
{30001002|XXparameter|SHEET_INDEX|3|3|2|RFK$|@{0|}}
{30001002|XXparameter|HEADER_COUNT|@3|9|FK|Number of headers in the file. Only applicable for serial input.|{0|}}
{30001002|XXparameter|READ_MULTI_ICFF|N|15|9|FK|If this parameter is true ,then multiple ICFF's will be read based on start and end date ranges|{2|N|Y|}}
{30001002|XXparameter|READ_MULTI_ICFF_KEY|@19|9|FK|@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION|AB_PARAMETER_ENV|3|10|RKd|Directory where the input file is located.|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|IS_MFS|AB_PARAMETER_ENV|13|10|RKd|Flag to signify if the source is a multifile.|{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST|$[if(length_of(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n"))==1)directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN) 
else 
for(let i =0, i<length_of(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n"))):string_substring(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[i],string_rindex(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[i], "/") + 1, 999)]|3|9|K|@{0|}}
{30001002|XXparameter|READ_MULTI_DATA_PATH|$INPUT_FILE_PATH|3|9|FK|@{0|}}
{30001002|XXparameter|READ_MULTI_FILE_MASK||3|9|FK|@{0|}}
{30001002|XXparameter|READ_MULTI_DO_ACTION_FILE_MISSING|Fail (Stop processing)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|_____OUTPUT_FILE_and__DML_PARAMETERS__|@3|9|K|@{0|}}
{30001002|XXparameter|OUTPUT_FILE_LOCATION|$AI_MFS/clean.sysadmin/clean.340b_extract_$RUN_ID.dat|18|9|RFK|Full resolved path of o/p file for eg.: $AI_SERIAL_LOOKUP/ndc.dat|{0|}}
{30001002|XXparameter|OUTPUT_FILE_DML||18|2|RFK$|Record format of the enriched output file.|{0|}}
{30001002|XXparameter|OUTPUT_FILE_TYPE|$[begin
let string("") v_file_path=OUTPUT_FILE_LOCATION;
let string("")[int] v_file_vec=string_split(v_file_path,"/");
let decimal("") v_file_separator_len=length_of(string_split(v_file_path,"/"));
let string ("") v_file_nm= string_split(v_file_path,"/")[ v_file_separator_len -1 ] ;
result ::  if ("serial" member v_file_vec and "lookup" member v_file_vec  ) "serial_lookup" 
           else if ("mfs" member v_file_vec and "lookup" member v_file_vec  and "pub_datahub" member v_file_vec  ) "icff_lookup"
           else if ("mfs" member v_file_vec and  starts_with(v_file_vec[v_file_separator_len -2],"clean.")) "clean_file"
           else if ("mfs" member v_file_vec and  starts_with(v_file_vec[v_file_separator_len -2],"source.")) "source_file" 
           else if ("mfs" member v_file_vec and  starts_with(v_file_vec[v_file_separator_len -2],"split")) "split_file"
           else "other"; //string_prefix( v_file_path ,string_rindex(v_file_path ,"/")) ; */

end ]|3|9|RK|Full path of the output file for eg. |{0|}}
{30001002|XXparameter|OUTPUT_FILE_LOC|AB_PARAMETER_ENV|28|10|RKd|Directory where the input file is located.|{0|}}
{30001002|XXparameter|OUTPUT_FILE_NM|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|OUTPUT_IS_MFS|AB_PARAMETER_ENV|13|10|RKd|Flag to signify if the source is a multifile.|{0|}}
{30001002|XXparameter|CLEAN_OUT_FILE_NAME|$[
begin
let string("") v_file_path=OUTPUT_FILE_LOCATION;
let decimal("") v_file_separator_len=length_of(string_split(v_file_path,"/"));
let string("") v_file_nm=string_split(v_file_path,"/")[ v_file_separator_len -1 ];
let string("") v_file_without_ext=if(ends_with(v_file_nm ,".dat.gz")) string_replace(v_file_nm, ".dat.gz", "")
                                  else if(ends_with(v_file_nm ,".dat")) string_replace(v_file_nm, ".dat", "")
                                  else v_file_nm;
result ::  if(OUTPUT_FILE_TYPE member [vector "clean_file", "split_file", "source_file"]) string_substring(v_file_without_ext, 1, string_rindex(v_file_without_ext, "."))
           else if(OUTPUT_FILE_TYPE member [vector "serial_lookup", "icff_lookup"]) v_file_without_ext
            else v_file_nm ;
end 
]|3|9|K|This parameter is to derive a logical name for error , reject , deselect filename without .dat or .dat.gz|{0|}}
{30001002|XXparameter|READ_MULTI_WATERMARK_FILE|$[AI_SERIAL + "/produce/produce.watermark." + string_replace(OUTPUT_FILE_NM, ".dat.gz", "") + ".dat"]|3|9|FK|@{0|}}
{30001002|XXparameter|READ_MULTI_ICFF_START_DATE|$[if(READ_MULTI_ICFF == "Y")
(date("YYYYMMDD"))datetime_add((date("YYYYMMDD"))re_replace(read_file(READ_MULTI_WATERMARK_FILE), "[\\n\\t ]+", ""), 1)
else "19000101"]|3|9|FK|@{0|}}
{30001002|XXparameter|READ_MULTI_ICFF_END_DATE|$[(date("YYYYMMDD"))now1()]|3|9|FK|@{0|}}
{30001002|XXparameter|FILTER_EXPR||20|2|FK$|Expression to filter useful records from the input file.|{0|}}
{30001002|XXparameter|USE_NORM|False|13|9|FK|@{0|}}
{30001002|XXparameter|NORM_XFR|@8|9|FK|@{0|}}
{30001002|XXparameter|NORM_OUTPUT_DML|$[read_file(INPUT_FILE_DML)]|7|9|FK|@{0|}}
{30001002|XXparameter|MAPPING_XFR||8|2|FK$|Path of external XFR file for enrichment.|{0|}}
{30001002|XXparameter|SORT_KEY|@19|9|FK|Pass this key if using any aggregate functionality or using lookup idx or icff idx|{0|}}
{30001002|XXparameter|EXTRA_SORT_KEY|\{\}|3|9|FK|@{0|}}
{30001002|XXparameter|DEDUP_KEY|$SORT_KEY|19|9|FK|Pass this key if using any aggregate functionality or using lookup idx or icff idx|{0|}}
{30001002|XXparameter|DEDUP_KEEP|first|15|1|FKl|Output record for a group of duplicates|{3|first|last|unique-only|}}
{30001002|XXparameter|ROLLUP_KEY|$SORT_KEY|19|9|FK|Pass this key if using any aggregate functionality or using lookup idx or icff idx|{0|}}
{30001002|XXparameter|SCAN_KEY|$SORT_KEY|19|9|FK|Pass this key if using any aggregate functionality or using lookup idx or icff idx|{0|}}
{30001002|XXparameter|USE_SORT|True|13|9|FK|@{0|}}
{30001002|XXparameter|USE_DEDUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|USE_SCAN|False|13|9|FK|@{0|}}
{30001002|XXparameter|USE_ROLLUP|False|13|9|FK|@{0|}}
{30001002|XXparameter|SCAN_XFR|@8|9|FK|@{0|}}
{30001002|XXparameter|ROLLUP_XFR|$AI_XFR/aggr.rt270p.xfr|8|9|FK|@{0|}}
{30001002|XXparameter|POST_FILTER_EXPR|@20|9|FK|This filter will be used to remove or drop any record after applying transformation logic|{0|}}
{30001002|XXparameter|LOOKUP_KEY||19|9|FK|@{0|}}
{30001002|XXparameter|OUTPUT_IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_IS_MFS:sandbox|$[file_information(OUTPUT_FILE_LOC + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|LOOKUP_IDX_FILE_URL|$[begin
let string("") v_file_path=OUTPUT_FILE_LOCATION;
let string("") v_file_location=string_prefix( v_file_path ,string_rindex(v_file_path ,"/"));
let string("") v_file_nm=string_split(v_file_path,"/")[length_of(string_split(v_file_path,"/")) -1 ];
let string("") v_idx_file_nm=if(string_index(v_file_nm,".dat.gz") > 0 ) string_replace(v_file_nm,".dat.gz",".idx") 
                             else if (string_index(v_file_nm,".dat") > 0 ) string_replace(v_file_nm,".dat",".idx")  
                             else force_error("An output file name should always end with .dat or .dat.gz extension ");
result :: if(OUTPUT_FILE_TYPE member [vector "serial_lookup", "icff_lookup"]) v_file_location + v_idx_file_nm else ""; 
end ]|18|9|K|Location where lookup idx file will be written|{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|5|1|1|Hnl|@{0|}}
{30001002|XXparameter|IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|IS_MFS:sandbox|$[file_information(INPUT_FILE_LOCATION + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION:eme|$[string_prefix(INPUT_FILE_PATH, string_rindex(INPUT_FILE_PATH, "/"))]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_LOCATION:sandbox|$[if(length_of(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n"))==1)
string_prefix(INPUT_FILE_PATH, string_rindex(string_replace(INPUT_FILE_PATH,"\\r",""), "/")) 
else 
string_prefix(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[0], string_rindex(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[0], "/"))]|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_FILE_LOC:eme|$[string_prefix(OUTPUT_FILE_LOCATION, string_rindex(OUTPUT_FILE_LOCATION, "/"))]|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_FILE_LOC:sandbox|$[string_prefix(OUTPUT_FILE_LOCATION, string_rindex(OUTPUT_FILE_LOCATION, "/"))]|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_FILE_NM:eme|$[ 
begin
let string("") ilm_nm = if(starts_with(CLEAN_OUT_FILE_NAME, "split.")) string_substring(CLEAN_OUT_FILE_NAME, 7, string_index(CLEAN_OUT_FILE_NAME, ".", 7) - 7) else "";

result :: if(OUTPUT_FILE_TYPE member [vector "clean_file", "source_file"] && ends_with(OUTPUT_FILE_LOCATION, ".dat.gz")) 
                CLEAN_OUT_FILE_NAME + "\{RUN_ID\}.dat.gz"
          else if(OUTPUT_FILE_TYPE == "split_file" && ends_with(OUTPUT_FILE_LOCATION, ".dat.gz")) 
                string_replace_first(CLEAN_OUT_FILE_NAME + "\{RUN_ID\}.dat.gz", ilm_nm, "\{ILM\}")
          else if(OUTPUT_FILE_TYPE member [vector "serial_lookup", "icff_lookup"] && ends_with(OUTPUT_FILE_LOCATION, ".dat"))
                CLEAN_OUT_FILE_NAME + ".dat"
          else 
                string_substring(OUTPUT_FILE_LOCATION, string_rindex(OUTPUT_FILE_LOCATION, "/") + 1, 999);
end
]|3|9||@{0|}}
{30001002|XXparameter|OUTPUT_FILE_NM:sandbox|$[string_substring(OUTPUT_FILE_LOCATION, string_rindex(OUTPUT_FILE_LOCATION, "/") + 1, 999)]|3|9||@{0|}}
{30001002|XXparameter|___Other_Parameters___|@3|9|K|@{0|}}
{30001002|XXparameter|FIRST_FILE|$[first_without_error(INPUT_FILE_LOCATION + directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0]  , "No_Matching_File" )
]|3|9|EK|This parameter is used in disabled input file to view first file in graph for resolving data and layout issues|{0|}}
{30001002|XXparameter|FIRST_FILE_NAME|$[first_without_error(directory_listing(INPUT_FILE_LOCATION, INPUT_FILE_PATTERN)[0],"No_Matching_File" ) ]|3|9|RK|Name of the file , many xfr's needs file name to publish|{0|}}
{30001002|XXparameter|JAVA_HOME:dev|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:qa|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:uat|$JAVA_HOME|3|9||@{0|}}
{30001002|XXparameter|JAVA_HOME:prod|/etc/alternatives/java_sdk_1.6.0|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN:eme|$[ 
begin
let string("") file_nm = string_substring(INPUT_FILE_PATH, string_rindex(INPUT_FILE_PATH, "/") + 1, 999);
let string("") ilm_nm = if(starts_with(file_nm, "split.")) string_substring(file_nm, 7, string_index(file_nm, ".", 7) - 7) else "";
//re_match_replace(file_nm, "([a-z._]+.)(\\\\d\{1\})(.dat.gz)", "$1\{RUN_ID\}$3");
result :: if(starts_with(file_nm, "clean.") && ends_with(file_nm, ".dat.gz")) string_substring(file_nm, 1, string_rindex(file_nm,".", string_length(".dat.gz"))) + "\{RUN_ID\}.dat.gz"
          else if(starts_with(file_nm, "split.") && ends_with(file_nm, ".dat.gz")) string_replace_first(string_substring(file_nm, 1, string_rindex(file_nm,".", string_length(".dat.gz"))) + "\{RUN_ID\}.dat.gz", ilm_nm, "\{ILM\}")
          else if(starts_with(file_nm, "lookup.") && ends_with(file_nm, ".dat")) file_nm
          else file_nm;
end
]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN:sandbox|$[if(length_of(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n"))==1)string_substring(string_replace(INPUT_FILE_PATH,"\\r",""), string_rindex(string_replace(INPUT_FILE_PATH,"\\r",""), "/") + 1, 999) 
else 
string_substring(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[0], string_rindex(string_split_no_empty(string_replace(INPUT_FILE_PATH,"\\r",""),"\\n")[0], "/") + 1, 999) ]|3|9||@{0|}}
{30001002|XXparameter|INPUT_BACKUP_FILE_PATH|$[if(INPUT_FILE_PATH == OUTPUT_FILE_LOCATION) 
  (if(ends_with(INPUT_FILE_PATH, ".dat.gz")) string_replace(INPUT_FILE_PATH, RUN_ID + ".dat.gz", "backup." + RUN_ID + ".dat.gz")
  else if(!ends_with(INPUT_FILE_PATH, ".dat.gz")) string_replace(INPUT_FILE_PATH, RUN_ID + ".dat", ".backup." + RUN_ID + ".dat"))
else ""]|18|9|FK|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|926000|588000|0|produce|anwar.parvez|Created 6/12/2015 2:24:18 PM|1|100|-1||9||34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|2055000|1027000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|3.5.1|{3|1|1|1|}Job 'produce.d_member_disenrollment' Execution Status Report


Job "produce.d_member_disenrollment" Execution started at Wednesday, August 09, 2017 09:16:24
***** Job execution failed at Wednesday, August 09, 2017 09:16:58 *****
(Application Output may contain additional information describing the failure)

------------------------------
Job Statistics:

Job status at termination: Failed
Run time (wall clock): 0:00:34
Run performed by user rshengul
Total data moved through all flows: 0 records (0 bytes)
Total CPU time (all processes): 3 seconds
Average CPU utilization across all nodes: 0.00 percent
||
if [[ "$INPUT_FILE_PATH" == "$OUTPUT_FILE_LOCATION" ]]; then
  m_cp $INPUT_FILE_PATH $INPUT_BACKUP_FILE_PATH
fi
||@|33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@DEV-apvrd55593||||1|60|0|1|1|0|0|0|0|0|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|32768|120|0|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@
Generic graph to apply business transformation/lookup and joins
 in cases. 
1.Create lookups by dropping some columns, or applying dedup or group by logic.
2.Create an ICFF lookup other than original ICFF IDS Key
3.Create a lookup that is resultant of join ( Inner & left outer join ) ,where input source 
will become main source and other tables will be used as catalog to produce joined output
|571000|101000|36000|51000|315000|64000|12030|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|7|0|13|0|{@{}@Condition:
[not IS_MFS]|224000|459000|0|0|0|0|11851|}}
{2010242002|XXGface|8|0|15|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|9|0|17|0|{@{}@Condition:
[! is_blank(FILTER_EXPR)]|484000|479000|0|0|0|0|11853|}}
{2010242002|XXGface|10|0|19|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|11|0|21|0|{@{}@Condition:
[not IS_MFS]|369000|449000|0|0|0|0|11852|}}
{2010242002|XXGface|12|0|23|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|13|0|25|0|{@{}@Disabled input file component 
to view data of first file|16000|896000|36000|51000|315000|64000|11768|}}
{2010242002|XXGface|14|0|27|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|15|0|29|0|{@{}@$AI_SERIAL_LOG : 
Count detail|1189000|969000|0|0|0|0|12081|}}
{2010242002|XXGface|16|0|31|0|{@{}@Arial|32768|110|0|}}
{2010240003|XXGlegend|17|0|33|0|{@{}@Below Subgraph will be used and enabled , if there is need for :
1.Aggregare ( Rollup) or Scan
2.Dedup or create distinct
3.Sort on Key
|1085000|240000|0|0|0|0|11861|}}
{2010242002|XXGface|18|0|35|0|{@{}@Arial Rounded MT Bold|8388608|100|0|}}
{2010240003|XXGlegend|19|0|37|0|{@{}@Produce lookups from Multiple type of sources|419000|26000|369000|36000|649000|56000|12034|}}
{2010242002|XXGface|20|0|39|0|{@{}@Arial|32768|360|1|}}
{2010240003|XXGlegend|21|0|41|0|{@{}@Condition:
$[not is_blank(POST_FILTER_EXPR)]|1398000|476000|0|0|0|0|12122|}}
{2010242002|XXGface|22|0|43|0|{@{}@Arial Rounded MT Bold|8421504|100|0|}}
{2010210004|XXGflow|23|0|45|0|{@{}@384|.5|.5|{0|}12252|529|}}
{2010210004|XXGflow|24|0|47|0|{@{}@384|.5|.5|{0|}12269|2065|}}
{2010210004|XXGflow|25|0|49|0|{@{}@384|.5|.5|{0|}12268|2065|}}
{2010210004|XXGflow|26|0|51|0|{@{}@384|.5|.5|{0|}12261|2065|}}
{2010210004|XXGflow|27|0|53|0|{@{}@384|.5|.5|{0|}12229|17|}}
{2010210004|XXGflow|28|0|55|0|{@{}@384|.5|.5|{0|}12242|19|}}
{2010210004|XXGflow|29|0|57|0|{@{}@384|.5|.5|{0|}12240|17|}}
{2010210004|XXGflow|30|0|59|0|{@{}@384|.5|.5|{0|}12264|17|}}
{2010210004|XXGflow|31|0|61|0|{@{}@384|.5|.5|{0|}12257|529|}}
{2010210004|XXGflow|32|0|63|0|{@{}@384|.5|.5|{0|}12246|19|}}
{2010210004|XXGflow|33|0|65|0|{@{}@384|.5|.5|{0|}12267|17|}}
{2010210004|XXGflow|34|0|67|0|{@{}@384|.5|.5|{0|}12263|17|}}
{2010210004|XXGflow|35|0|69|0|{@{}@384|.5|.5|{0|}11839|530|}}
{2010210004|XXGflow|36|0|71|0|{@{}@384|.5|.5|{0|}12259|17|}}
{2010210004|XXGflow|37|0|73|0|{@{}@384|.5|.5|{0|}12260|17|}}
{2010210004|XXGflow|38|0|75|0|{@{}@384|.5|.5|{0|}12255|17|}}
{2010210004|XXGflow|39|0|77|0|{@{}@384|.5|.5|{0|}12216|17|}}
{2010210004|XXGflow|40|0|79|0|{@{}@384|.5|.5|{0|}12266|17|}}
{2010501005|XXGpvertex|41|0|81|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(POST_FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|select_expr|$POST_FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@1568000|337500|0|0|0|0|12256|APPLY POST FILTER|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|42|0|83|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|43|0|86|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|44|0|88|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|45|0|90|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|46|0|92|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|47|0|94|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|48|0|97|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|49|0|99|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|50|0|102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|51|0|105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|52|0|108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|53|0|111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|54|0|114|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|55|0|117|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform0|$MAPPING_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|ENRICH|3|2|$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|out0_metadata|$OUTPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@922000|345000|515000|385000|126000|69000|12270|Apply Mappings|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|56|0|119|0|{@{}@640000|414000|11000|11000|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|57|0|122|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|58|0|125|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|59|0|128|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|60|0|130|0|{@{}@505000|414000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|61|0|133|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error0_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out[*],reject[*],error[*],log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1368052550|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: reject = in
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|62|0|135|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|63|0|139|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|64|0|142|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|65|0|145|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|66|0|148|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|67|0|151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|$NORM_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|condition|$USE_NORM|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata|$NORM_OUTPUT_DML|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Normalize|730000|350000|0|0|0|0|12228|Optional Normalize|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|68|0|153|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|69|0|156|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|70|0|158|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|71|0|160|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|72|0|162|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|73|0|165|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{2010203004|XXGoport|74|0|167|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|75|0|170|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|76|0|173|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|77|0|176|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|78|0|179|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|79|0|189|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|select_expr|$FILTER_EXPR|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Filter_by_Expression.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|deselect_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@502000|362000|317000|377000|132000|89000|12262|Apply Pre Filter|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|80|0|191|0|{@{}@448000|414000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|81|0|194|0|{@{}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|82|0|197|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|83|0|199|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|84|0|201|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|85|0|203|0|{@{}@307000|414000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|86|0|206|0|{Filters data records according to the specified DML expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|select-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
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
{2010203004|XXGoport|87|0|208|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|88|0|211|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|deselect|0.0|@@@2192|0|}}
{2010203004|XXGoport|89|0|214|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|90|0|217|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|91|0|220|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|92|0|223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|93|0|226|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/$CLEAN_OUT_FILE_NAME.$RUN_ID.deselect.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_MFS_REJECT\}/$\{CLEAN_OUT_FILE_NAME\}.\{RUN_ID\}.deselect.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ not is_blank(FILTER_EXPR)]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@658832|509106|600000|359000|56000|50000|11946|Deselect O/p file|Ab Initio Software||1|100|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|94|0|228|0|{@{}@624000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|95|0|231|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|96|0|233|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|97|0|242|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@395000|400000|0|0|0|0|11709|Dummy Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|98|0|244|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|99|0|247|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|100|0|250|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|101|0|252|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|102|0|255|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|103|0|261|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@1154000|372500|0|0|0|0|12150|Dummy - Replicate for flow|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|104|0|263|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|105|0|266|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|106|0|269|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|107|0|271|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|108|0|274|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|109|0|280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/$CLEAN_OUT_FILE_NAME.$RUN_ID.error.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$\{CLEAN_OUT_FILE_NAME\}\{RUN_ID\}.error.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@1047832|541106|600000|359000|56000|50000|12027|Errors|Ab Initio Software||1|10|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|110|0|282|0|{@{}@624000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|111|0|285|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|112|0|287|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|113|0|291|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mode|0x0462|3|2|$|@{0|}}
{30001002|XXparameter|Layout|mfile:$AI_MFS_REJECT/$CLEAN_OUT_FILE_NAME.$RUN_ID.reject.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$\{CLEAN_OUT_FILE_NAME\}\{RUN_ID\}.reject.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=j|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@912388|544354|479000|359000|56000|50000|12029|Failed|Ab Initio Software||1|10|-1||6||33153|-1|-1|}}
{2010202004|XXGiport|114|0|293|0|{@{}@504000|349000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|115|0|296|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|116|0|298|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|117|0|302|0|{Subgraph created from graph "enrich"|{}@0|@915000|845000|0|0|0|0|12238|Get Record count|Mukesh.singh|Created 8/21/2015 9:19:48 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|497000|163000|3|}}
{2010210004|XXGflow|118|0|304|0|{@{}@384|.5|.5|{0|}11105|17|}}
{2010210004|XXGflow|119|0|306|0|{@{}@384|.5|.5|{0|}11099|17|}}
{2010501005|XXGpvertex|120|0|308|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|key|\{\}|3|2|$|@{0|}}
{30001002|XXparameter|transform|out :: rollup(in) =
begin
  out.record_count::sum(in.record_count);
  
  out.process_type:: "create lookups";
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@337000|36000|0|0|0|0|11106|Count -Local|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|121|0|310|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|122|0|312|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|123|0|314|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|124|0|316|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|125|0|318|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|126|0|321|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|127|0|323|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|128|0|326|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|129|0|329|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|130|0|332|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|131|0|335|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|132|0|338|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{AI_SERIAL_LOG\}/audit_count_computed.$AB_GRAPH_NAME.$AB_PSET_NAME.dat|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DATAHUB_DML/audit_count_computed_source.dml|3|2|f$|@{0|}}
}}@0|@1210000|871500|0|0|0|0|12241|Output File|Ab Initio Software|@1|100|0||6||33025|-1|-1|}}
{2010202004|XXGiport|133|0|340|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|134|0|343|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|135|0|345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|136|0|348|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|select|string_lrtrim(event_type)=="finish"|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@171000|42500|0|0|0|0|11100|Parse Log|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|137|0|350|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|138|0|353|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|139|0|355|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|140|0|357|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|141|0|359|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|142|0|362|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|143|0|364|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|144|0|368|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|145|0|371|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|146|0|374|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|147|0|377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|148|0|381|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|log_group|ENRICH|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@755000|765000|0|0|0|0|12243|Handle Logs|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|149|0|383|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|150|0|386|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|151|0|388|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|152|0|390|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|153|0|393|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|154|0|400|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@52000|65000|0|0|0|0|11081|Gather-1|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|155|0|402|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|156|0|405|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|157|0|407|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|158|0|409|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|159|0|412|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010203004|XXGoport|160|0|419|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|161|0|423|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|162|0|428|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Block-Compressed_Lookup_Template.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[DO_IDS_ICFF_LOOKUP]|3|9||@{0|}}
{30001002|XXparameter|RecordFormat|$LOOKUP_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|key|\{dxf_hk_part1\}|3|2|$|@{0|}}
{30001002|XXparameter|cache|True|3|1|l|@{0|}}
}}@0|@210000|80000|0|0|0|0|12254|IDS ICFF LKP|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010503005|XXGfvertex|163|0|430|0|{Lookup templates are components containing only a record format and a key. Use lookup templates with the DML lookup_load and lookup_create functions.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|m_catalog_add_option_names|block_compressed keep_on_disk cache load_once direct_addressed only_last_key_instance|3|2|H$||{0|}}
{30001002|XXparameter|keep_on_disk|True|13|1|Fl|Keep on Disk|{0|}}
{30001002|XXparameter|block_compressed|True|13|1|Fl|Block-Compressed|{0|}}
{30001002|XXparameter|either_or|value keep_on_disk True True sameas block_compressed default constant True|13|13|v|Either B-C or K-o-D|{0|}}
{30001002|XXparameter|direct_addressed|False|13|1|Fl|Set to true if the block compressed lookup is direct addressed|{0|}}
{30001002|XXparameter|direct_addressed.condition|mode lookup version 2.15.5.r34: param_exact either_or True|3|15|P?|@{0|}}
{30001002|XXparameter|cache|False|13|1|Fl|Use lookup cache|{0|}}
{30001002|XXparameter|cache.condition|mode lookup version 2.15.3.r28:|3|15|P?|@{0|}}
{30001002|XXparameter|load_once|True|13|1|Fl|Load a lookup if not already loaded|{0|}}
{30001002|XXparameter|load_once.condition|mode lookup version 2.15.4.r30:|3|15|P?|@{0|}}
{30001002|XXparameter|only_last_key_instance|False|13|1|Fl|Match only the last instance of each key|{0|}}
{30001002|XXparameter|only_last_key_instance.condition|mode lookup version 3.0.2.r12.0:|3|15|P?|@{0|}}
{30001002|XXparameter|eme_dataset_mapping||40|9|F|Place in the EME to create the dataset(s) corresponding to this component.|{0|}}
{30001002|XXparameter|mpcmodtime|1461375652|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010503005|XXGfvertex|164|0|432|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|read_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$FIRST_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$FIRST_FILE|3|2|$|@{0|}}
}}@0|@40000|813500|0|0|0|0|12001|Input File|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|165|0|434|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|166|0|436|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|167|0|438|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|168|0|442|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_DEDUP \|\| USE_SCAN \|\| USE_ROLLUP \|\| not is_blank(SORT_KEY)]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|DEDUP_KEEP||15|8|FK=|Output record for a group of duplicates|{3|first|last|unique-only|}}
}}@0|@1290000|322500|0|0|0|0|12265|Optional Sort , Scan & Rollup|Mukesh.Singh|Created 9/16/2015 2:09:15 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1362000|460000|3|}}
{2010210004|XXGflow|169|0|444|0|{@{}@384|.5|.5|{0|}5923|1043|}}
{2010210004|XXGflow|170|0|446|0|{@{}@384|.5|.5|{0|}5927|17|}}
{2010210004|XXGflow|171|0|448|0|{@{}@384|.5|.5|{0|}5918|17|}}
{2010210004|XXGflow|172|0|450|0|{@{}@384|.5|.5|{0|}5895|17|}}
{2010210004|XXGflow|173|0|452|0|{@{}@384|.5|.5|{0|}5922|17|}}
{2010600005|XXGgraph|174|0|454|0|{Subgraph created from graph "Optional Sort , Scan & Rollup"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[USE_DEDUP and not  USE_SCAN and not USE_ROLLUP]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
{30001002|XXparameter|DEDUP_KEEP||15|8|FK=|Output record for a group of duplicates|{3|first|last|unique-only|}}
}}@0|@609500|117500|0|0|0|0|5924|Dedup|Mukesh.Singh|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|363000|299000|3|}}
{2010210004|XXGflow|175|0|456|0|{@{}@384|.4888888895511627|.5|{0|}5731|2065|}}
{2010501005|XXGpvertex|176|0|458|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Dedup_Sorted.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition||3|9||@{0|}}
{30001002|XXparameter|key|$DEDUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|dup_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|keep||3|8|=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@40000|30000|0|0|0|0|5732|Dedup Sorted|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|177|0|460|0|{@{}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|178|0|462|0|{@{}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|179|0|465|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|180|0|467|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|181|0|469|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|182|0|471|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|183|0|473|0|{Separates one specified data record in each group of data records from the rest of the records in the group.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|dedup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|184|0|475|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2196|0|}}
{2010203004|XXGoport|185|0|478|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|dup|0.0|@@@2192|0|}}
{2010203004|XXGoport|186|0|481|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|187|0|484|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|188|0|487|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|189|0|490|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010503005|XXGfvertex|190|0|493|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_TEMP/duplicate.$CLEAN_OUT_FILE_NAME.dat.gz", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_TEMP/duplicate.$CLEAN_OUT_FILE_NAME.dat.gz|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@243000|210000|0|0|0|0|5710|Duplicate File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|191|0|495|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|192|0|498|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|193|0|500|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010203004|XXGoport|194|0|510|0|{@{}@0|0|0|0|out0|.5|@@@14352|0|}}
{2010202004|XXGiport|195|0|514|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010501005|XXGpvertex|196|0|519|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="serial_lookup" \|\| 
(OUTPUT_FILE_TYPE=="other" && not OUTPUT_IS_MFS)]|3|9||@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
}}@0|Merge|852000|140000|0|0|0|0|5915|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|197|0|521|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|198|0|524|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|199|0|527|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|200|0|529|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|201|0|532|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010600005|XXGgraph|202|0|537|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Partition_by_Key_and_Sort.mp|3|2|Pf$|@{0|}}
{30001002|XXparameter|Key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|OutputLayout|$AI_MFS|3|2|$|@{0|}}
{30001002|XXparameter|condition|$USE_SORT|3|9||@{0|}}
{30001002|XXparameter|InputLayout||3|8|s=|@{0|}}
}}@0|@220000|105000|0|0|481000|303000|5883|Partition by Key and Sort|Ab Initio|Created 04/22/98 12:54:47|1|10|0||6||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|481000|303000|0|}}
{2010210004|XXGflow|203|0|539|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|204|0|541|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@106000|165000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|205|0|543|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|206|0|546|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|207|0|550|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@312000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|208|0|552|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|209|0|554|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|210|0|559|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|211|0|563|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010600005|XXGgraph|212|0|566|0|{Repartitions data records by key values and then sorts the records within each partition.
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
{2010210004|XXGflow|213|0|568|0|{@{}@384|.5|.5|{8|227000|171000|247000|171000|296000|171000|316000|171000|}4|20|}}
{2010501005|XXGpvertex|214|0|570|0|{Groups data according to a collator.  

A Hash Partition component is generally followed by a Local Sort component.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Partition\\Hash.mpc|3|2|Pw$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|9||@{0|}}
}}@0|@61000|118000|81000|138000|136000|68000|5|Partition by Key|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|215|0|572|0|{@{}@216000|166000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|216|0|575|0|{@{}@71000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|217|0|577|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|hash-partition|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|218|0|579|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|219|0|582|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|220|0|587|0|{Orders your data according to a collating expression.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|key||3|8|=|@{0|}}
{30001002|XXparameter|max_core||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|C:\\gui\\src\\mpc\\Sort-Merge\\Sort.mpc|3|2|Pw$|@{0|}}
}}@0|@307000|118504|327000|139000|114000|65000|3|Sort|Ab Initio Software|Built-in|1|10|-1||6||32769|1|{1|0|}}}
{2010203004|XXGoport|221|0|589|0|{@{}@440000|166000|11000|11000|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|222|0|591|0|{@{}@317000|166000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|223|0|594|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-sort|3|2|H$|The name used on the mp command line for this component|{0|}}
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
{2010203004|XXGoport|224|0|596|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|225|0|599|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|226|0|605|0|{@{}@0|0|0|0|out0|.5|@@@14736|0|}}
{2010202004|XXGiport|227|0|608|0|{@{}@0|0|0|0|in0|.5|@@@14096|0|}}
{2010501005|XXGpvertex|228|0|612|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Rollup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|key|$ROLLUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$ROLLUP_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|condition|$[USE_ROLLUP and not USE_SCAN]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@1178000|120000|0|0|0|0|5928|Rollup|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|229|0|614|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|230|0|616|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|231|0|618|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|232|0|620|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|233|0|622|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|234|0|625|0|{ROLLUP processes groups of input records that have the same key, generating one output record for each group. The input to ROLLUP can be ordered or unordered; for more information, see the sorted-input parameter. ROLLUP itself does not sort the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?rollup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|235|0|627|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|236|0|630|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|237|0|633|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|238|0|636|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|239|0|639|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|240|0|645|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Scan.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|key|$SCAN_KEY|3|2|$|@{0|}}
{30001002|XXparameter|transform|$SCAN_XFR|3|9|fj|@{0|}}
{30001002|XXparameter|condition|$[USE_SCAN and not USE_ROLLUP]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@975000|119500|0|0|0|0|5919|Scan|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|241|0|647|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|242|0|650|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|243|0|652|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|244|0|654|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|245|0|656|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|246|0|659|0|{Generates a series of cumulative summary records--such as year-to-date totals--for groups of data records.  Scan in memory maximizes performance by keeping intermediate results in main memory.  Scan sorted requires grouped input.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|?scan|3|1|Hl||{0|}}
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
{2010203004|XXGoport|247|0|661|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|248|0|664|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|249|0|667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|250|0|670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|251|0|673|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|252|0|679|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Sort/Sort_within_Groups.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|major_key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|minor_key|$EXTRA_SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[key_info(EXTRA_SORT_KEY) != [vector]]|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Sort within Groups|435000|105000|0|0|0|0|5897|Sort within Groups|Ab Initio Software|Built-in 2.1.7:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|253|0|681|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|254|0|684|0|{@{}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010501005|XXGpvertex|255|0|687|0|{Refines the sorting of data records already sorted according to one key specifier: it sorts the records within the groups formed by the first sort according to a second key specifier.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|sort-groups|3|1|Hl||{0|}}
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
{2010203004|XXGoport|256|0|689|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|257|0|692|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1936|0|}}
{2010203004|XXGoport|258|0|698|0|{@{}@0|0|0|0|out0|.3225|@@@14352|0|}}
{2010202004|XXGiport|259|0|702|0|{@{}@0|0|0|0|in0|.4391304347826087|@@@13840|0|}}
{2010600005|XXGgraph|260|0|708|0|{Subgraph created from graph "enrich"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|INPUT_FILE_LOCATION|$INPUT_FILE_LOCATION|3|9|RFK|Directory where files are to be read from|{0|}}
{30001002|XXparameter|INPUT_FILE_PATTERN|$INPUT_FILE_PATTERN|3|9|RFK|Name of a single file, or pattern for reading multiple files|{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC|AB_PARAMETER_ENV|3|10|RKd|@{0|}}
{30001002|XXparameter|IS_MFS|AB_PARAMETER_ENV|13|10|RKd|@{0|}}
{30001002|XXparameter|LOG_ERROR_NAME_SEED|$AB_PSET_NAME.$[string_filter_out(INPUT_FILE_PATTERN, "*?")]|3|9|RK|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|IS_MFS:eme|False|3|9||@{0|}}
{30001002|XXparameter|IS_MFS:sandbox|$[file_information(INPUT_FILE_LOCATION + "/.mdir").found]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:eme|$[[vector ""]]|3|9||@{0|}}
{30001002|XXparameter|INPUT_FILENAME_LIST_VEC:sandbox|$INPUT_FILENAME_LIST|3|9||@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1435873438|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|UNIQUE_ID|$EXTERNAL_RUN_ID|3|9|FK||{0|}}
{30001002|XXparameter|PROCESSED_LIST_LOG_FILENAME|$\{AB_PSET_NAME\}.$[if(is_blank(UNIQUE_ID)) "" else UNIQUE_ID + "."]fileList.log|3|9|RK||{0|}}
{30001002|XXparameter|condition|$[ READ_EXCEL =="N" and READ_MULTI_ICFF=="N" ]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hl|@{0|}}
}}@0|@17000|195500|0|0|0|0|12253|Read SERIAL or MFS Files|anwar.parvez|Created 6/20/2016 2:14:52 PM|1|100|0|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1533000|1343000|3|}}
{2010240003|XXGlegend|261|0|710|0|{@{}@Expand the list of files
based on the provided
pattern|16000|333500|0|0|0|0|2211|}}
{2010242002|XXGface|262|0|712|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|263|0|714|0|{@{}@Skips header records
from each file|426000|393500|0|0|0|0|2218|}}
{2010242002|XXGface|264|0|716|0|{@{}@Arial|8421504|100|0|}}
{2010240003|XXGlegend|265|0|718|0|{@{}@[ Always disabled ]|144000|461000|0|0|0|0|2215|}}
{2010242002|XXGface|266|0|720|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|267|0|722|0|{@{}@[ Always disabled ]|679000|451000|0|0|0|0|2216|}}
{2010242002|XXGface|268|0|724|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|269|0|726|0|{@{}@[ These components run in case the input is MFS ]|349000|641000|0|0|0|0|2217|}}
{2010242002|XXGface|270|0|728|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|271|0|730|0|{@{}@[ This component runs in
case the input is serial ]|429000|271000|0|0|0|0|2212|}}
{2010242002|XXGface|272|0|732|0|{@{}@Arial|32768|100|0|}}
{2010240003|XXGlegend|273|0|734|0|{@{}@Reads multi- or serial files by pattern. Output flow
is in the same layout as the source files.

The log and error files are created with names derived
from the calling graph name and the file pattern.

Author: Anwar.Parvez\@catamaranrx.com (Exusia)|10000|64000|0|0|0|0|2199|}}
{2010242002|XXGface|274|0|736|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|275|0|738|0|{@{}@EME Lineage
|655000|162000|0|0|0|0|11939|}}
{2010242002|XXGface|276|0|740|0|{@{}@Calibri|32768|120|0|}}
{2010210004|XXGflow|277|0|742|0|{@{}@384|.5|.49925485253334045|{0|}11963|17|}}
{2010210004|XXGflow|278|0|744|0|{@{}@384|.5|.5|{0|}2292|1043|}}
{2010210004|XXGflow|279|0|746|0|{@{}@384|.5|.5|{0|}11946|17|}}
{2010210004|XXGflow|280|0|748|0|{@{}@384|.5|.5|{0|}11965|531|}}
{2010210004|XXGflow|281|0|750|0|{@{}@384|.5|.5|{0|}11954|17|}}
{2010210004|XXGflow|282|0|752|0|{@{}@384|.5|.5|{0|}11970|18|}}
{2010210004|XXGflow|283|0|754|0|{@{}@384|.5|.5|{0|}11971|1041|}}
{2010210004|XXGflow|284|0|756|0|{@{}@384|.5|.5|{0|}11968|1041|}}
{2010210004|XXGflow|285|0|758|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}11967|530|}}
{2010210004|XXGflow|286|0|760|0|{@{}@384|.5|.5|{0|}2207|17|}}
{2010210004|XXGflow|287|0|762|0|{@{}@384|.5|.5|{0|}11943|17|}}
{2010210004|XXGflow|288|0|764|0|{@{}@384|.5|.5|{0|}2310|17|}}
{2010501005|XXGpvertex|289|0|766|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@355000|537500|723000|204000|54000|41000|11956|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|290|0|768|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|291|0|771|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|292|0|774|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|293|0|776|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|294|0|779|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|295|0|782|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|$[length_of(INPUT_FILENAME_LIST_VEC)]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|record
  string("\\n") file;
end|3|1|l|@{0|}}
{30001002|XXparameter|transform|let string("")[] files = $[string_representation(INPUT_FILENAME_LIST_VEC)];

out::create(index) = begin
  out.file :: files[index - 1];
end;|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@65000|424000|0|0|0|0|11964|List Files|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|296|0|784|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|297|0|787|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|298|0|789|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|299|0|791|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|300|0|793|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|301|0|796|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|302|0|799|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|303|0|804|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@264000|908000|0|0|0|0|2289|Collect Read Errors MFS|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|304|0|806|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|305|0|808|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|306|0|811|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|307|0|813|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|308|0|815|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|309|0|817|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|310|0|820|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|311|0|823|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|312|0|826|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|313|0|829|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_MFS_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@266000|1089500|0|0|0|0|2311|Read Errors MFS|Ab Initio Software|@1|100|0||6||32897|-1|-1|}}
{2010202004|XXGiport|314|0|831|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|315|0|834|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|316|0|836|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|317|0|842|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Errors.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_SERIAL|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|error_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|escalate_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@124000|908000|0|0|0|0|2291|Collect Read Errors - Serial|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|318|0|844|0|{@{}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|319|0|846|0|{@{}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|320|0|849|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|321|0|851|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|322|0|853|0|{Collects the output from error ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Errors|3|1|Hl||{0|}}
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
{2010203004|XXGoport|323|0|855|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|escalate|0.0|@@@1168|0|}}
{2010203004|XXGoport|324|0|858|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|error|0.0|@@@1432|0|}}
{2010203004|XXGoport|325|0|861|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|326|0|864|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010503005|XXGfvertex|327|0|867|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_REJECT/$LOG_ERROR_NAME_SEED.err|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@126000|1089500|0|0|0|0|11944|Read Errors Serial|Ab Initio Software|@1|100|0||6||32897|-1|-1|}}
{2010202004|XXGiport|328|0|869|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|329|0|872|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|330|0|874|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|331|0|880|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Handle_Logs.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|log_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@472000|909000|0|0|0|0|2293|Collect Read File(s) Log|Ab Initio Software|Built-in 2.16:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|332|0|882|0|{@{}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|333|0|885|0|{@{}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|334|0|887|0|{Collects the output from log ports of components for analysis of a graph after execution.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Handle_Logs|3|1|Hl||{0|}}
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
{2010203004|XXGoport|335|0|889|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|log|0.0|@@@1432|0|}}
{2010202004|XXGiport|336|0|892|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|in|0.0|@@@530|0|}}
{2010501005|XXGpvertex|337|0|896|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@504000|1109000|0|0|0|0|2206|Concatenate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|338|0|898|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|339|0|901|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|340|0|904|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|341|0|906|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|342|0|909|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010503005|XXGfvertex|343|0|912|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$AI_SERIAL_LOG/$LOG_ERROR_NAME_SEED.log|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@491000|1200500|0|0|0|0|2208|Read File(s) Log|Ab Initio Software|@1|1000|-1||6||164225|-1|-1|}}
{2010202004|XXGiport|344|0|914|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|345|0|917|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|346|0|919|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|347|0|925|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Concatenate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@752000|439500|0|0|0|0|2214|Dummy Concat|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|348|0|927|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|349|0|929|0|{@{}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|350|0|933|0|{Appends multiple flow partitions of data records one after another.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|concat|3|1|Hl||{0|}}
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
{2010203004|XXGoport|351|0|935|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|352|0|938|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@18195|0|}}
{2010501005|XXGpvertex|353|0|941|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|reject_threshold|Use limit/ramp|3|1|l|@{0|}}
{30001002|XXparameter|input_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|limit|1|3|2|$|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@421000|334500|0|0|0|0|11972|Read All Matching Files|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|354|0|943|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|355|0|946|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|356|0|948|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|357|0|950|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|358|0|952|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|359|0|954|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|360|0|956|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|361|0|959|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|362|0|961|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|363|0|964|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|364|0|967|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|365|0|970|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|366|0|973|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|367|0|976|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|368|0|979|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|369|0|986|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@224000|439500|0|0|0|0|2285|Dummy Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|370|0|988|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|371|0|993|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|372|0|996|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|373|0|998|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|374|0|1001|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010503005|XXGfvertex|375|0|1007|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|AB_PARAMETER_ENV|3|10|d|@{0|}}
{30001002|XXparameter|condition:eme|1|3|9||@{0|}}
{30001002|XXparameter|condition:sandbox|0|3|2|$|@{0|}}
{30001002|XXparameter|read_metadata|void(1)|3|1|l|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$INPUT_FILE_LOCATION/$INPUT_FILE_PATTERN", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION/$INPUT_FILE_PATTERN|3|2|$|@{0|}}
}}@0|@630000|88500|0|0|0|0|11947|Input File|Ab Initio Software|@1|100|0||6||32769|-1|-1|}}
{2010203004|XXGoport|376|0|1009|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|377|0|1012|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|378|0|1014|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010600005|XXGgraph|379|0|1018|0|{Subgraph created from graph "read_files_by_pattern"|{}@0|@242000|664750|0|0|0|0|11966|Log the List of Files|Anwar.Parvez|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|209000|285000|3|}}
{2010210004|XXGflow|380|0|1020|0|{@{}@384|.5|.5|{0|}2208|17|}}
{2010501005|XXGpvertex|381|0|1022|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|2|Pf$|@{0|}}
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
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@40000|30000|0|0|0|0|2198|Build Full Path|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010203004|XXGoport|382|0|1024|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|383|0|1027|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|384|0|1029|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|385|0|1031|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|386|0|1033|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|387|0|1035|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{2010203004|XXGoport|388|0|1037|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|389|0|1041|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|390|0|1044|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|391|0|1047|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|392|0|1050|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|393|0|1053|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$AI_SERIAL_LOG/$PROCESSED_LIST_LOG_FILENAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_LOG/$PROCESSED_LIST_LOG_FILENAME|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@52000|168500|0|0|0|0|2209|File List|Ab Initio Software|@1|100|0||6||33153|-1|-1|}}
{2010202004|XXGiport|394|0|1055|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|395|0|1058|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|396|0|1060|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010202004|XXGiport|397|0|1068|0|{@{}@0|0|0|0|in0|.5|@@@12816|0|}}
{2010501005|XXGpvertex|398|0|1073|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|transform|filename::get_filename(in)=
begin
  filename :: this_partition_path($"INPUT_FILE_LOCATION") + "/" + in.file;
end;|3|9||@{0|}}
{30001002|XXparameter|filter|Range (Read a subset of records from each file)|3|1|l|@{0|}}
{30001002|XXparameter|skip_count|$HEADER_COUNT|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|error_group|READ_FILES_ERROR_GROUP_MFS|3|2|$|@{0|}}
{30001002|XXparameter|log_group|READ_FILES_LOG_GROUP|3|2|$|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|fileerror_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@476000|510500|0|0|0|0|11969|Read All Matching Files-1|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|399|0|1075|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|400|0|1078|0|{@{}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|401|0|1080|0|{@{}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|402|0|1082|0|{@{}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|403|0|1084|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|404|0|1086|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|405|0|1088|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|406|0|1091|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{2010203004|XXGoport|407|0|1093|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|408|0|1096|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|409|0|1099|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|410|0|1102|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|411|0|1105|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|412|0|1108|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|413|0|1111|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|414|0|1120|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Trash|755000|80000|0|0|0|0|11936|Trash|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010202004|XXGiport|415|0|1122|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|416|0|1125|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|417|0|1127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|418|0|1132|0|{@{}@0|0|0|0|out0|.4744094488188976|@@@14352|0|}}
{2010600005|XXGgraph|419|0|1136|0|{Subgraph created from graph "get.excel"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ READ_EXCEL =="Y" && READ_MULTI_ICFF =="N" ]|3|9|F||{0|}}
}}@0|@15000|359500|31000|587000|448000|218000|12230|Read Single XLS File|Alex.zhao|Created 7/27/2015 7:56:29 PM|1|100|-1||6||32769|{0|}0|0|{0|}{0|}{0|}{0|}.5771812200546265|447000|217000|3|}}
{2010501005|XXGpvertex|420|0|1138|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|xls|$INPUT_FILE_LOCATION|3|2|$|@{0|}}
{30001002|XXparameter|sheet_header_row|1|3|2|$|@{0|}}
{30001002|XXparameter|JAVA_HOME|$JAVA_HOME|3|2|$|@{0|}}
{30001002|XXparameter|java_options|-Xmx2768m|3|2|$|@{0|}}
{30001002|XXparameter|out_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Interchange/Excel/Read_Excel.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|sheet_index|$SHEET_INDEX|3|2|$|@{0|}}
{30001002|XXparameter|dateFormat|MM/DD/YYYY|3|2|$|@{0|}}
{30001002|XXparameter|Layout|file:$AI_SERIAL_PENDING|3|2|$|@{0|}}
}}@0|@40000|57000|60000|77000|143000|113000|6654|Read Excel Spreadsheet|Ab Initio Software|Built-in 2.13.m8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|421|0|1140|0|{@{}@202000|119000|11000|11000|out|0.0|@@@2512|0|}}
{2010501005|XXGpvertex|422|0|1142|0|{Reads an Excel spreadsheet|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Read_Excel|3|1|Hl||{0|}}
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
{30001002|XXparameter|out_metadata||7|1|RFsl|Record Format|{0|}}
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
{2010203004|XXGoport|423|0|1144|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=|Record Format|{0|}}
}}@0|0|0|0|out|0.0|@@@2512|0|}}
{2010203004|XXGoport|424|0|1147|0|{@{}@0|0|0|0|out0|.4838709677419355|@@@14352|0|}}
{2010501005|XXGpvertex|425|0|1151|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|1779000|375000|0|0|0|0|12158|Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|426|0|1153|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|427|0|1157|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|428|0|1160|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|429|0|1162|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|430|0|1165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|431|0|1168|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
}}@1|@40000|536000|0|0|0|0|12080|Dummy - Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|432|0|1170|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010210004|XXGflow|433|0|1172|0|{@{}@384|.5|.2792207896709442|{0|}12085|529|}}
{2010210004|XXGflow|434|0|1174|0|{@{}@384|.5|.5|{0|}12072|2065|}}
{2010210004|XXGflow|435|0|1176|0|{@{}@384|.5|.5783972144126892|{0|}12073|2065|}}
{2010210004|XXGflow|436|0|1178|0|{@{}@384|.5|1.0|{0|}12074|17|}}
{2010210004|XXGflow|437|0|1180|0|{@{}@384|.5|.5123456716537476|{0|}12075|2065|}}
{2010210004|XXGflow|438|0|1182|0|{@{}@384|.5|.5|{0|}12082|17|}}
{2010210004|XXGflow|439|0|1184|0|{@{}@384|.5|.5|{0|}12079|17|}}
{2010202004|XXGiport|440|0|1186|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|441|0|1188|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|442|0|1190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|443|0|1193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|444|0|1200|0|{Distributes data records evenly to each output flow in round-robin fashion.

Use the Interleave component to reverse the effects of Partition by Round-robin.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Partition_by_Round-robin.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[not IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|in_metadata|$INPUT_FILE_DML|3|2|f$|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|l|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@259000|398500|0|0|0|0|11840|Switch from Serial to MFS|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|445|0|1202|0|{@{}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|446|0|1205|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|447|0|1210|0|{Distributes data records evenly to each output flow in round-robin fashion.

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
{2010203004|XXGoport|448|0|1212|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2323|0|}}
{2010202004|XXGiport|449|0|1215|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|450|0|1220|0|{Subgraph created from graph "load.redistribute.icff"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[READ_MULTI_ICFF == "Y" ]|3|9|F||{0|}}
}}@0|@1615500|878500|0|0|0|0|12250|Update Watermark|gkaur109|@1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|410000|201000|7|}}
{2010210004|XXGflow|451|0|1222|0|{@{}@384|.5|.5|{0|}58|17|}}
{2010501005|XXGpvertex|452|0|1224|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|out_metadata|record
string(8) watermark_dt;
end|3|1|l|@{0|}}
{30001002|XXparameter|num_records|1|3|2|$|@{0|}}
{30001002|XXparameter|transform|out::create(index) = begin
  out.watermark_dt :: $"READ_MULTI_ICFF_END_DATE";
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@2|Create Data|65000|102000|0|0|0|0|59|CRT: Update Watermark File|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|453|0|1226|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|454|0|1229|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|455|0|1231|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|456|0|1233|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{2010203004|XXGoport|457|0|1235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|458|0|1238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|459|0|1241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010503005|XXGfvertex|460|0|1244|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$READ_MULTI_WATERMARK_FILE", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$READ_MULTI_WATERMARK_FILE|3|2|$|@{0|}}
}}@2|@293000|104000|0|0|0|0|57|Output File|Ab Initio Software|@1|100|0||6||1|-1|-1|}}
{2010202004|XXGiport|461|0|1246|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|462|0|1249|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|463|0|1251|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010600005|XXGgraph|464|0|1256|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@35000|60000|0|0|0|0|11862|Version Log|Mukesh.singh|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|1347000|622000|3|}}
{2010240003|XXGlegend|465|0|1258|0|{@{}@Version    Date               Author                                   Description
1.0          Jun 15 2015     Anwar Parvez (Exusia)          This Graph was created as part of Cogs Jun  30 ,2015 Project and later was made as common  graph to be used across multiple project.  
1.0.1       Jun 25 2015     Anwar Parvez (Exusia)          Added flow for removing overlap as well as writing serial files that  can be used as lookup
1.0.2       Aug 12 2015    Mukesh Singh (Exusia)          Added Disabled file to view data , handle ,error and reject port
1.0.3       Aug 15 2015     Alex Zhao (Exusia)               Added an input read flow to read data from excel for  a requirement in OPTUM
1.0.4       Aug 20 2015     Mukesh Singh (Exusia)         Added Handle Log to Compute record count
1.0.5       Aug 20 2015     Mukesh Singh (Exusia)         Added Post filter component
1.0.6       Oct 05 2015     Mukesh Singh (Exusia)          Added aggregate components
1.0.7       Nov 17 2016     Sripavan Pulikonda (Exusia) Added logic to read and produce split files|19000|64000|0|0|0|0|137|}}
{2010242002|XXGface|466|0|1260|0|{@{}@Calibri|32768|120|0|}}
{2010600005|XXGgraph|467|0|1262|0|{Subgraph created from graph "produce"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[INPUT_FILE_PATH == OUTPUT_FILE_LOCATION]|3|9|F||{0|}}
}}@0|@1888000|329523|0|0|0|0|12258|Write Output File|Mukesh.Singh|Created 6/20/2016 8:00:16 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|585000|1072000|3|}}
{2010240003|XXGlegend|468|0|1264|0|{@{}@Condition:
$[OUTPUT_DATASET_TYPE==
'TRANSACTION']|70000|10000|0|0|0|0|11757|}}
{2010242002|XXGface|469|0|1266|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|470|0|1268|0|{@{}@Only One type of file will 
be written at a time|103000|42000|0|0|0|0|11768|}}
{2010242002|XXGface|471|0|1270|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|472|0|1272|0|{@{}@If Lookup Key is specified ,
data is sorted as per lookup key|107000|739000|0|0|0|0|12061|}}
{2010242002|XXGface|473|0|1274|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|474|0|1276|0|{@{}@Condition:
$[not is_blank(SORT_KEY)]|415000|755000|0|0|0|0|12062|}}
{2010242002|XXGface|475|0|1278|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|476|0|1280|0|{@{}@Condition:
$[ is_blank(SORT_KEY)]|420000|515000|0|0|0|0|12063|}}
{2010242002|XXGface|477|0|1282|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|478|0|1285|0|{@{}@384|.5|.19256757199764252|{0|}11903|17|}}
{2010210004|XXGflow|479|0|1287|0|{@{}@384|.5|.5|{0|}12059|17|}}
{2010210004|XXGflow|480|0|1289|0|{@{}@384|.5|.5|{0|}12046|17|}}
{2010501005|XXGpvertex|481|0|1297|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Compress/Deflate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="split_file"]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Deflate|380000|475000|0|0|0|0|11880|Deflate|Ab Initio Software|Built-in 2.12.2.m1:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|482|0|1299|0|{@{}@0|0|0|0|out|0.0|@@@2320|0|}}
{2010202004|XXGiport|483|0|1302|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|484|0|1305|0|{Compresses data in a manner compatible with the zip and gzip deflate method. Use Inflate to uncompress the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|compression|1|1|2|FK$|Compression level (0-9)|{0|}}
{30001002|XXparameter|HelpID|comp_deflate|3|2|FH$||{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy_in(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Deflate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|485|0|1307|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2320|0|}}
{2010202004|XXGiport|486|0|1310|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|487|0|1313|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="split_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@479913|465047|1153000|334000|56000|50000|11904|Optional: Split|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|488|0|1315|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|489|0|1318|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|490|0|1320|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|491|0|1327|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="icff_lookup" ]|3|9|F||{0|}}
}}@0|@421500|48500|0|0|0|0|12086|ICFF Output|Mukesh.Singh|Created 7/28/2015 6:06:47 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|564000|372000|3|}}
{2010210004|XXGflow|492|0|1329|0|{@{}@384|.5|.5|{0|}10687|2065|}}
{2010210004|XXGflow|493|0|1331|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010210004|XXGflow|494|0|1333|0|{@{}@384|.5|.5|{0|}10686|17|}}
{2010503005|XXGfvertex|495|0|1335|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@340000|126000|0|0|0|0|10688|ICFF Data|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|496|0|1337|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|497|0|1340|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|498|0|1343|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|499|0|1345|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|500|0|1348|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|501|0|1353|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_IDX_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_IDX_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@1|@345000|251000|0|0|0|0|10685|ICFF Index|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|502|0|1355|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|503|0|1358|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|504|0|1360|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|505|0|1363|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|block_size|104857|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@70000|120000|0|0|0|0|10682|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|506|0|1365|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|507|0|1368|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|508|0|1371|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|509|0|1373|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|510|0|1375|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|511|0|1377|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|512|0|1380|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|513|0|1383|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|514|0|1386|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|515|0|1392|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@2|@427000|110500|0|0|0|0|10622|To Enable View Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|516|0|1394|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|517|0|1397|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|518|0|1399|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|519|0|1404|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|520|0|1408|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="clean_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@451913|345047|1153000|334000|56000|50000|11954|Optional: Clean|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|521|0|1410|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|522|0|1413|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|523|0|1415|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|524|0|1419|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="serial_lookup"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@455913|850047|1153000|434000|56000|50000|12060|Optional: Lookup Data  File|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|525|0|1421|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|526|0|1424|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|527|0|1426|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|528|0|1430|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ OUTPUT_FILE_TYPE=="serial_lookup" && not  is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_IDX_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_IDX_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1)|3|3|c|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@1|@455913|970047|1153000|434000|56000|50000|11952|Optional: Lookup Idx file|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|529|0|1432|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|530|0|1435|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|531|0|1437|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|532|0|1440|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="other" && OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@484913|600047|1153000|334000|56000|50000|12000|Optional: Other|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|533|0|1442|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|534|0|1445|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|535|0|1447|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|536|0|1451|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="other" && not OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@471913|730047|1153000|334000|56000|50000|12083|Optional: Other (Serial)|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|537|0|1453|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|538|0|1456|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|539|0|1458|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|540|0|1462|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="source_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|3\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@1|@451913|215047|1153000|234000|56000|50000|11922|Optional: Source|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|541|0|1464|0|{@{}@1143000|254000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|542|0|1467|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|543|0|1469|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|544|0|1474|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="serial_lookup"]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@180000|861500|0|0|0|0|12047|Serial LookUp File for MAP|Mukesh.Singh|Created 6/20/2016 3:34:41 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|851000|406000|3|}}
{2010240003|XXGlegend|545|0|1476|0|{@{}@If Lookup Key is specified ,
data is sorted as per lookup key|67000|244000|0|0|0|0|87|}}
{2010242002|XXGface|546|0|1478|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|547|0|1480|0|{@{}@Condition:
$[not is_blank(SORT_KEY)]|375000|260000|0|0|0|0|10666|}}
{2010242002|XXGface|548|0|1482|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|549|0|1484|0|{@{}@Condition:
$[ is_blank(SORT_KEY)]|380000|20000|0|0|0|0|10671|}}
{2010242002|XXGface|550|0|1486|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|551|0|1488|0|{@{}@384|.5|.5|{0|}10696|531|}}
{2010210004|XXGflow|552|0|1490|0|{@{}@384|.5|.5|{0|}10694|1555|}}
{2010210004|XXGflow|553|0|1492|0|{@{}@384|.5|.5|{0|}10697|17|}}
{2010210004|XXGflow|554|0|1494|0|{@{}@384|.5|.5|{0|}10689|17|}}
{2010210004|XXGflow|555|0|1496|0|{@{}@384|.5|.5|{0|}10681|17|}}
{2010501005|XXGpvertex|556|0|1498|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Replicate|125000|160000|0|0|0|0|10695|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|557|0|1500|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|558|0|1504|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|559|0|1506|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|560|0|1508|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|561|0|1511|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|562|0|1517|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|735000|105000|0|0|0|0|10632|Dummy-Replicate-to Maintain flow|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|563|0|1519|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|564|0|1521|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|565|0|1525|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|566|0|1527|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|567|0|1530|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|568|0|1536|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Gather|420000|80000|0|0|0|0|10698|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|569|0|1538|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|570|0|1541|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|571|0|1544|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|572|0|1546|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|573|0|1549|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|574|0|1555|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|Merge|410000|205000|0|0|0|0|10690|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|575|0|1557|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|576|0|1560|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|577|0|1563|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|578|0|1565|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|579|0|1568|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|580|0|1574|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key0|$\{LOOKUP_KEY\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@1|@558000|181000|0|0|0|0|10682|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|581|0|1576|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|582|0|1579|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|583|0|1581|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|584|0|1584|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|585|0|1586|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|586|0|1589|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|587|0|1593|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|588|0|1599|0|{@{}@0|0|0|0|out0|.3|@@@14352|0|}}
{2010203004|XXGoport|589|0|1603|0|{@{}@0|0|0|0|out1|.7733990147783252|@@@14352|0|}}
{2010202004|XXGiport|590|0|1607|0|{@{}@0|0|0|0|in0|.46798029556650245|@@@13840|0|}}
{2010202004|XXGiport|591|0|1611|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|592|0|1615|0|{Subgraph created from graph "produce"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[INPUT_FILE_PATH != OUTPUT_FILE_LOCATION]|3|9|F||{0|}}
}}@0|@1766000|554523|0|0|0|0|12217|Write Output File-1|Mukesh.Singh|Created 6/20/2016 8:00:16 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|585000|1072000|3|}}
{2010240003|XXGlegend|593|0|1617|0|{@{}@Condition:
$[OUTPUT_DATASET_TYPE==
'TRANSACTION']|70000|10000|0|0|0|0|11757|}}
{2010242002|XXGface|594|0|1619|0|{@{}@Arial|0|100|0|}}
{2010240003|XXGlegend|595|0|1621|0|{@{}@Only One type of file will 
be written at a time|103000|42000|0|0|0|0|11768|}}
{2010242002|XXGface|596|0|1623|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010240003|XXGlegend|597|0|1625|0|{@{}@If Lookup Key is specified ,
data is sorted as per lookup key|107000|739000|0|0|0|0|12061|}}
{2010242002|XXGface|598|0|1627|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|599|0|1629|0|{@{}@Condition:
$[not is_blank(SORT_KEY)]|415000|755000|0|0|0|0|12062|}}
{2010242002|XXGface|600|0|1631|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|601|0|1633|0|{@{}@Condition:
$[ is_blank(SORT_KEY)]|420000|515000|0|0|0|0|12063|}}
{2010242002|XXGface|602|0|1635|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|603|0|1637|0|{@{}@384|.5|.5|{0|}12079|17|}}
{2010210004|XXGflow|604|0|1639|0|{@{}@384|.5|.19256757199764252|{0|}11903|17|}}
{2010210004|XXGflow|605|0|1641|0|{@{}@384|.5|.5|{0|}12059|17|}}
{2010210004|XXGflow|606|0|1643|0|{@{}@384|.5|.5|{0|}12046|17|}}
{2010210004|XXGflow|607|0|1645|0|{@{}@384|.5|.5|{0|}12072|2065|}}
{2010210004|XXGflow|608|0|1647|0|{@{}@384|.5|.5783972144126892|{0|}12073|2065|}}
{2010210004|XXGflow|609|0|1649|0|{@{}@384|.5|1.0|{0|}12074|17|}}
{2010210004|XXGflow|610|0|1651|0|{@{}@384|.5|.5123456716537476|{0|}12075|2065|}}
{2010210004|XXGflow|611|0|1653|0|{@{}@384|.5|.5|{0|}12082|17|}}
{2010210004|XXGflow|612|0|1655|0|{@{}@384|.5|.2792207896709442|{0|}12071|529|}}
{2010501005|XXGpvertex|613|0|1657|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Translate/Compress/Deflate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="split_file"]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Deflate|380000|475000|0|0|0|0|11880|Deflate|Ab Initio Software|Built-in 2.12.2.m1:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|614|0|1659|0|{@{}@0|0|0|0|out|0.0|@@@2320|0|}}
{2010202004|XXGiport|615|0|1662|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|616|0|1665|0|{Compresses data in a manner compatible with the zip and gzip deflate method. Use Inflate to uncompress the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
{30001002|XXparameter|image__|~ab_home/bin/unitool|3|2|H$||{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|conditionInputPort|in|3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort|out|3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|Replace with flow|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|compression|1|1|2|FK$|Compression level (0-9)|{0|}}
{30001002|XXparameter|HelpID|comp_deflate|3|2|FH$||{0|}}
{30001002|XXparameter|port_analysis|out=byte_copy_in(in)|3|2|H$||{0|}}
{30001002|XXparameter|continuous_analysis|broadcast, publisher|3|2|H$||{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1461375654|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|Deflate|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|617|0|1667|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2320|0|}}
{2010202004|XXGiport|618|0|1670|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|619|0|1673|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="split_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@479913|465047|1153000|334000|56000|50000|11904|Optional: Split|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|620|0|1675|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|621|0|1678|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|622|0|1680|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010501005|XXGpvertex|623|0|1686|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|1|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$OUTPUT_FILE_LOC|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|@40000|536000|0|0|0|0|12080|Dummy - Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|624|0|1688|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|625|0|1697|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|626|0|1699|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|627|0|1701|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|628|0|1704|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|629|0|1709|0|{Subgraph created from graph "create_data_source"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="icff_lookup" ]|3|9|F||{0|}}
}}@0|@421500|48500|0|0|0|0|11927|ICFF Output|Mukesh.Singh|Created 7/28/2015 6:06:47 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|564000|372000|3|}}
{2010210004|XXGflow|630|0|1711|0|{@{}@384|.5|.5|{0|}10687|2065|}}
{2010210004|XXGflow|631|0|1713|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010210004|XXGflow|632|0|1715|0|{@{}@384|.5|.5|{0|}10686|17|}}
{2010503005|XXGfvertex|633|0|1717|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Intermediate_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|mode|0x0053|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: read = write
metadata type: write = read|3|1|l|@{0|}}
{30001002|XXparameter|read_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@340000|126000|0|0|0|0|10688|ICFF Data|Ab Initio Software|@1|1000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|634|0|1719|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|635|0|1722|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|636|0|1725|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{30001002|XXparameter|read_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|_propagate_through|@3|9|FHK||{0|}}
}}@0|@0|0|0|0|0|0|0|@|@1|100|-1|@6|@1|-1|-1|}}
{2010203004|XXGoport|637|0|1727|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010202004|XXGiport|638|0|1730|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|639|0|1735|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_IDX_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_IDX_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
}}@0|@345000|251000|0|0|0|0|10685|ICFF Index|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|640|0|1737|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|641|0|1740|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|642|0|1742|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010501005|XXGpvertex|643|0|1745|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Block_Compressed_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$SORT_KEY|3|2|$|@{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|l|@{0|}}
{30001002|XXparameter|block_size|104857|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@70000|120000|0|0|0|0|10682|Write Block-Compressed Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|644|0|1747|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|645|0|1750|0|{@{}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|646|0|1753|0|{@{}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|647|0|1755|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|648|0|1757|0|{Generates compressed lookup data and an index.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup|3|1|Hl||{0|}}
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
{2010203004|XXGoport|649|0|1759|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|650|0|1762|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|index|0.0|@@@2192|0|}}
{2010203004|XXGoport|651|0|1765|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|address|0.0|@@@2192|0|}}
{2010202004|XXGiport|652|0|1768|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|653|0|1774|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@1|@427000|110500|0|0|0|0|10622|To Enable View Data|Ab Initio Software|Built-in 1.0:|1|100|0||6||32833|1|{1|0|}}}
{2010202004|XXGiport|654|0|1776|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|655|0|1779|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158954|1|1|Hl|The last modification time of this component's template|{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010202004|XXGiport|656|0|1781|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010202004|XXGiport|657|0|1786|0|{@{}@0|0|0|0|in0|.5|@@@13840|0|}}
{2010503005|XXGfvertex|658|0|1790|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="clean_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@451913|345047|1153000|334000|56000|50000|11954|Optional: Clean|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|659|0|1792|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|660|0|1795|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|661|0|1797|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|662|0|1801|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="serial_lookup"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@455913|850047|1153000|434000|56000|50000|12060|Optional: Lookup Data  File|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|663|0|1803|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|664|0|1806|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|665|0|1808|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|666|0|1812|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[ OUTPUT_FILE_TYPE=="serial_lookup" && not  is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|Layout|$LOOKUP_IDX_FILE_URL|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LOOKUP_IDX_FILE_URL", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|void(1)|3|3|c|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
}}@0|@455913|970047|1153000|434000|56000|50000|11952|Optional: Lookup Idx file|Ab Initio Software||1|100|0||6||32769|-1|-1|}}
{2010202004|XXGiport|667|0|1814|0|{@{}@1143000|454000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|668|0|1817|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|669|0|1819|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|670|0|1822|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="other" && OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|mfile:$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@484913|600047|1153000|334000|56000|50000|12000|Optional: Other|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|671|0|1824|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|672|0|1827|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|673|0|1829|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|674|0|1833|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="other" && not OUTPUT_IS_MFS]|3|9||@{0|}}
{30001002|XXparameter|Layout|file:$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@471913|730047|1153000|334000|56000|50000|12083|Optional: Other (Serial)|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|675|0|1835|0|{@{}@1143000|354000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|676|0|1838|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|677|0|1840|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|678|0|1844|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="source_file"]|3|9||@{0|}}
{30001002|XXparameter|Layout|$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("write", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$\{OUTPUT_FILE_LOC\}$\{OUTPUT_FILE_NM\}", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|2|Pf$|@{0|}}
{30001002|XXparameter|!validation_exclusions|1\|\@\{52\|3\|\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|condition\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_conditional_comp_starts_c\|\}\}\{56\|Conditional components should start with a capital C.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|1\|DA_custom_validation_id\|\{56\|AI#customValidations#check_component_naming_standards\|\}\}\{56\|Component name does not follow TU naming standards.
\|\}\}\}\{53\|error_suppression\|2\|\{56\|\|\}\{53\|status_info\|4\|\{56\|VE_validation_extension_error\|\}\{56\|CTL20300\|\}\{51\|2\|DA_parameter\|\{56\|protection\|\}DA_custom_validation_id\|\{56\|AI#customValidations#check_out_file_access\|\}\}\{56\|Output files should have 640 access
\|\}\}\}\}|3|9|P|@{0|}}
{30001002|XXparameter|write_metadata||3|8|s=|@{0|}}
}}@0|@451913|215047|1153000|234000|56000|50000|11922|Optional: Source|Ab Initio Software||1|100|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|679|0|1846|0|{@{}@1143000|254000|11000|11000|write|0.0|@@@1776|0|}}
{2010503005|XXGfvertex|680|0|1849|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|681|0|1851|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1776|0|}}
{2010600005|XXGgraph|682|0|1856|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[OUTPUT_FILE_TYPE=="serial_lookup"]|3|9|F||{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort|in0|3|1|Fl||{0|}}
{30001002|XXparameter|conditionOutputPort|out0|3|1|Fl||{0|}}
}}@0|@180000|861500|0|0|0|0|12047|Serial LookUp File for MAP|Mukesh.Singh|Created 6/20/2016 3:34:41 PM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|851000|406000|3|}}
{2010240003|XXGlegend|683|0|1858|0|{@{}@If Lookup Key is specified ,
data is sorted as per lookup key|67000|244000|0|0|0|0|87|}}
{2010242002|XXGface|684|0|1860|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|685|0|1862|0|{@{}@Condition:
$[not is_blank(SORT_KEY)]|375000|260000|0|0|0|0|10666|}}
{2010242002|XXGface|686|0|1864|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010240003|XXGlegend|687|0|1866|0|{@{}@Condition:
$[ is_blank(SORT_KEY)]|380000|20000|0|0|0|0|10671|}}
{2010242002|XXGface|688|0|1868|0|{@{}@Arial Narrow|8421504|100|0|}}
{2010210004|XXGflow|689|0|1870|0|{@{}@384|.5|.5|{0|}10696|531|}}
{2010210004|XXGflow|690|0|1872|0|{@{}@384|.5|.5|{0|}10694|1555|}}
{2010210004|XXGflow|691|0|1874|0|{@{}@384|.5|.5|{0|}10697|17|}}
{2010210004|XXGflow|692|0|1876|0|{@{}@384|.5|.5|{0|}10689|17|}}
{2010210004|XXGflow|693|0|1878|0|{@{}@384|.5|.5|{0|}10681|17|}}
{2010501005|XXGpvertex|694|0|1880|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Replicate|125000|160000|0|0|0|0|10695|Dummy-Replicate|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|695|0|1882|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|696|0|1886|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|697|0|1888|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|698|0|1890|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|699|0|1893|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|700|0|1899|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|0|3|2|$|@{0|}}
{30001002|XXparameter|Layout||3|8|=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@0|Replicate|735000|105000|0|0|0|0|10632|Dummy-Replicate-to Maintain flow|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|701|0|1901|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|702|0|1903|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|703|0|1907|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|704|0|1909|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|705|0|1912|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|706|0|1918|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Gather.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|condition|$[ is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Gather|420000|80000|0|0|0|0|10698|Gather|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|707|0|1920|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|708|0|1923|0|{@{}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|709|0|1926|0|{Combines data records from multiple flow partitions arbitrarily.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|gather|3|1|Hl||{0|}}
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
{2010203004|XXGoport|710|0|1928|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|711|0|1931|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1810|0|}}
{2010501005|XXGpvertex|712|0|1937|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Merge.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key|$LOOKUP_KEY|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|Merge|410000|205000|0|0|0|0|10690|Merge|Ab Initio Software|Built-in 1.0:|1|100|0||6||1|1|{1|0|}}}
{2010203004|XXGoport|713|0|1939|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|714|0|1942|0|{@{}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|715|0|1945|0|{Combines data records from multiple flow partitions that have been sorted according to the key specifier, and maintains the sort order.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|local-merge|3|1|Hl||{0|}}
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
{2010203004|XXGoport|716|0|1947|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010202004|XXGiport|717|0|1950|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@50962|0|}}
{2010501005|XXGpvertex|718|0|1956|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Lookup_Utilities/Write_Lookup.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|key0|$\{LOOKUP_KEY\}|3|2|$|@{0|}}
{30001002|XXparameter|condition|$[not is_blank(SORT_KEY)]|3|9||@{0|}}
{30001002|XXparameter|condition_interpretation|Remove completely|3|1|l|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@558000|181000|0|0|0|0|10682|Write Lookup|Ab Initio Software|Built-in 2.14.1:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|719|0|1958|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|720|0|1961|0|{@{}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|721|0|1963|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|722|0|1966|0|{Passes through lookup data and generates one or more indexes.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|write-lookup-indexes|3|1|Hl||{0|}}
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
{30001002|XXparameter|mpcmodtime|1432158952|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagate_through|metadata type: out = in
metadata type: in = out|3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|723|0|1968|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|724|0|1971|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|key0||19|8|RFK=|Field to lookup on|{0|}}
{30001002|XXparameter|key0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|key0.index_name|key|3|9|P|@{0|}}
}}@0|0|0|0|index0|0.0|count|index|0|2448|0|}}
{2010202004|XXGiport|725|0|1975|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010203004|XXGoport|726|0|1981|0|{@{}@0|0|0|0|out0|.3|@@@14352|0|}}
{2010203004|XXGoport|727|0|1985|0|{@{}@0|0|0|0|out1|.7733990147783252|@@@14352|0|}}
{2010202004|XXGiport|728|0|1989|0|{@{}@0|0|0|0|in0|.46798029556650245|@@@13840|0|}}
{2010202004|XXGiport|729|0|1993|0|{@{}@0|0|0|0|in0|0.0|@@@9744|0|}}
{2010600005|XXGgraph|730|0|1997|0|{select * from datalake_qa.claimsinfo_rxclaim where mxtdnb > '2015-08-15'|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$PUB_DATAHUB_COMPONENTS/read_icff_by_index_and_date_range.mp|3|9|Pf|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML|$INPUT_FILE_DML|3|9|f|@{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME|$READ_MULTI_FILE_MASK|3|9||@{0|}}
{30001002|XXparameter|INDEX_COL|$LOOKUP_KEY|3|9||@{0|}}
{30001002|XXparameter|FILE_MASK|$READ_MULTI_FILE_MASK|3|9||@{0|}}
{30001002|XXparameter|MIN_TXN_DATE|$READ_MULTI_ICFF_START_DATE|3|9||@{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$READ_MULTI_ICFF_END_DATE|3|9||@{0|}}
{30001002|XXparameter|DATA_PATH|$READ_MULTI_DATA_PATH|3|9||@{0|}}
{30001002|XXparameter|FILE_MISSING||3|8|=|@{0|}}
{30001002|XXparameter|DAYS_DML|record
  date("YYYYMMDD") day;
end;|3|1|l|@{0|}}
{30001002|XXparameter|CALCULATE_DAYS_XFR|/* This type is optional.*/
// type temporary_type = NULL_TYPE;


/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/

 let date("YYYYMMDD") start_date = '$\{MIN_TXN_DATE\}'; 
 let date("YYYYMMDD") end_date = '$\{MAX_TXN_DATE\}'; 
  
out::length(in)=
begin
  out :: date_difference_days((date("YYYYMMDD")(""))datetime_add(end_date, 1), start_date);
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.day :: (date("YYYYMMDD")(""))datetime_add(start_date, index);
  out.* :: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|RMF_XFR|type input_type = $\{DATA_SOURCE_DML\};


/*extract filename from input record*/
filename::get_filename(in)=
begin
  let dt_rec = decode_date_record(in.day);
  
  filename :: string_concat(this_partition_path("$\{DATA_PATH\}"), "/$\{FILE_MASK\}" + "." + (string(""))(date("YYYYMMDD"))in.day, ".dat.gz");
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,filename,in)=
begin
  out.* :: read.*;
  out.* :1: in.*;
end;|3|3|c|@{0|}}
{30001002|XXparameter|condition|$[READ_MULTI_ICFF == "Y" ]|3|9||@{0|}}
}}@0|@15000|523000|0|0|0|0|12247|read IDS  icff by index and date range||@1|100|0|@6|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|863000|673000|1|}}
{2010240003|XXGlegend|731|0|1999|0|{@{}@

|114000|399000|0|0|0|0|10665|}}
{2010242002|XXGface|732|0|2001|0|{@{}@Arial|32768|110|1|}}
{2010240003|XXGlegend|733|0|2003|0|{@{}@ |204000|84000|0|0|0|0|10553|}}
{2010242002|XXGface|734|0|2005|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|735|0|2007|0|{@{}@This Subgraph will read split ICFF files,
from the path , mask , date range and location specified 
via input parameters. 

Purpose : 
This Subgraph can be used as maintenence subgraph for 
all target split ICFF created for Query It datasets.To specifically read ,
update and delete anything  based on index and date range.|189000|19000|0|0|0|0|10671|}}
{2010242002|XXGface|736|0|2009|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|737|0|2011|0|{@{}@

DATA_SOURCE_DML                         	$AI_DML/rt200p_enriched.dml
DATA_SOURCE_NAME	                      claimsinfo_rxclaim
INDEX_COL	                                      mxtdnb
FILE_SUBDIR	                                   rxclaim_adjud
FILE_MASK	                                      rxclaim_adjudication_
MIN_TXN_DATE	                                 20150704
MAX_TXN_DATE	                              $[(date("YYYYMMDD")) now1()]
DATA_PATH	                                      $AI_MFS
|174000|481000|0|0|0|0|10657|}}
{2010242002|XXGface|738|0|2013|0|{@{}@Arial Narrow|0|100|1|}}
{2010240003|XXGlegend|739|0|2015|0|{@{}@Parameter Name|167000|455000|0|0|0|0|10655|}}
{2010242002|XXGface|740|0|2017|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|741|0|2019|0|{@{}@Default Value (eg.)|382000|455000|0|0|0|0|10656|}}
{2010242002|XXGface|742|0|2021|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010210004|XXGflow|743|0|2023|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010210004|XXGflow|744|0|2025|0|{@{}@384|.5|.5|{0|}10685|17|}}
{2010210004|XXGflow|745|0|2027|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}10688|530|}}
{2010501005|XXGpvertex|746|0|2029|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@400000|288500|723000|204000|54000|41000|10673|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|747|0|2031|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|748|0|2034|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|749|0|2037|0|{|{}@0|@56000|273000|0|0|0|0|10659|generate record- Kicker|Ab Initio Software|Built-in 2.15.2:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|750|0|2039|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|751|0|2042|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|752|0|2044|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|753|0|2046|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@206000|253500|301000|175000|123000|107000|10686|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|754|0|2048|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|755|0|2051|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|756|0|2053|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|757|0|2055|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|758|0|2057|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|759|0|2065|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|filereject_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|@531000|262500|866000|179000|227000|113000|10689|Read Multiple Split ICFF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|760|0|2067|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|761|0|2069|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|762|0|2071|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|763|0|2073|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|764|0|2075|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|765|0|2077|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|766|0|2079|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|767|0|2084|0|{|{}@0|@10000|12500|0|0|0|0|10676|Version Log||@1|100|-1|@6|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|661000|393000|7|}}
{2010240003|XXGlegend|768|0|2086|0|{@{}@Date|92000|46000|0|0|0|0|7|}}
{2010242002|XXGface|769|0|2088|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|770|0|2090|0|{@{}@Aug 31 2015|82000|68000|0|0|0|0|33|}}
{2010242002|XXGface|771|0|2092|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|772|0|2094|0|{@{}@This Subgraph will read split files based on index and date range 
from the location provided by user as input parameter|337000|63000|0|0|0|0|31|}}
{2010242002|XXGface|773|0|2096|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|774|0|2098|0|{@{}@Author|197000|46000|0|0|0|0|25|}}
{2010242002|XXGface|775|0|2100|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|776|0|2102|0|{@{}@Mukesh Singh|192000|68000|0|0|0|0|26|}}
{2010242002|XXGface|777|0|2104|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|778|0|2106|0|{@{}@Description|337000|46000|0|0|0|0|32|}}
{2010242002|XXGface|779|0|2108|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|780|0|2110|0|{@{}@Version|17000|46000|0|0|0|0|29|}}
{2010242002|XXGface|781|0|2112|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|782|0|2114|0|{@{}@1.0|17000|68000|0|0|0|0|30|}}
{2010242002|XXGface|783|0|2116|0|{@{}@Arial Narrow|0|100|0|}}
{2010203004|XXGoport|784|0|2119|0|{@{}@0|0|0|0|out0|.4101040118870728|@@@14352|0|}}
{2010600005|XXGgraph|785|0|2123|0|{select * from datalake_qa.claimsinfo_rxclaim where mxtdnb > '2015-08-15'|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|____Pass_as_input_parameter_____________|@3|2|K$|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML||7|9|RFKf||{0|}}
{30001002|XXparameter|DATA_SOURCE_NAME||3|9|RFK|Target split ICFF name |{0|}}
{30001002|XXparameter|INDEX_COL||3|9|FK|The field which is used as index for creating split icff files|{0|}}
{30001002|XXparameter|FILE_SUBDIR||3|9|FK|Subdirectory where splitted icff have been created|{0|}}
{30001002|XXparameter|FILE_MASK||3|9|FK|The Mask of icff files|{0|}}
{30001002|XXparameter|MIN_TXN_DATE|19000101|3|9|RFK|Start date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|MAX_TXN_DATE|$[(date("YYYYMMDD")) now1()]|3|9|RFK|End date for which queries will generate a range to read files|{0|}}
{30001002|XXparameter|DATA_PATH|$AI_MFS|3|9|RFK|Added this parameter , so that this component can be used in other priv project and can be overridden from query IT admin console|{0|}}
{30001002|XXparameter|FILE_MISSING|Notify (Continue, with a reject record and error message)|15|1|Fl|What to do if an input file is missing|{3|Fail (Stop processing)|Notify (Continue, with a reject record and error message)|Ignore (continue with no reject or error)|}}
{30001002|XXparameter|DAYS_DML|//include "~$ABSQL_DML/qe_term_type.dml";
//metadata type = 
record
  date("YYYY-MM-DD") day;
end;|7|1|RFl||{0|}}
{30001002|XXparameter|CALCULATE_DAYS_XFR|/* This type is optional.*/
// type temporary_type = NULL_TYPE;


/* This function is optional. */
/*Number of records to output.  Either this function or finished() must be defined.*/

 let date("YYYYMMDD") start_date = '$\{MIN_TXN_DATE\}'; 
 let date("YYYYMMDD") end_date = '$\{MAX_TXN_DATE\}'; 
  
out::length(in)=
begin
  out :: 1 + end_date - start_date;
end;

/*Do computation*/
out::normalize(in,index)=
begin
  out.day :: start_date + index;
  out.* :: in.*;
end;|8|3|RFOc|Required and optional DML functions|{0|}}
{30001002|XXparameter|____Run_time_parameter___________|@3|2|K$|@{0|}}
{30001002|XXparameter|DATA_SOURCE_DML_EXPANDED|$DATA_SOURCE_DML|7|9|RK||{0|}}
{30001002|XXparameter|RMF_XFR|type input_type = $\{DATA_SOURCE_DML_EXPANDED\};


/*extract filename from input record*/
filename::get_filename(in)=
begin
  let dt_rec = decode_date_record(in.day);
  
  filename :: string_concat(this_partition_path("$\{DATA_PATH\}"), "/$\{FILE_SUBDIR\}", "/$\{FILE_MASK\}", (string(""))(date("YYYYMMDD"))in.day, ".dat.gz");
end;

/* This function is optional. */
/*Create output record*/
out::reformat(read,filename,in)=
begin
  out.* :: read.*;
  out.* :1: in.*;
end;|8|3|RFOc|Package containing transforms and data types|{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|mpcmodtime|1497608787|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
}}@0|@0|0|0|0|0|0|0|read_icff_by_index_and_date_range||@1|100|-1|@6|@1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|863000|673000|7|}}
{2010240003|XXGlegend|786|0|2125|0|{@{}@

|114000|399000|0|0|0|0|10665|}}
{2010242002|XXGface|787|0|2127|0|{@{}@Arial|32768|110|1|}}
{2010240003|XXGlegend|788|0|2129|0|{@{}@ |204000|84000|0|0|0|0|10553|}}
{2010242002|XXGface|789|0|2131|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|790|0|2133|0|{@{}@This Subgraph will read split ICFF files,
from the path , mask , date range and location specified 
via input parameters. 

Purpose : 
This Subgraph can be used as maintenence subgraph for 
all target split ICFF created for Query It datasets.To specifically read ,
update and delete anything  based on index and date range.|189000|19000|0|0|0|0|10671|}}
{2010242002|XXGface|791|0|2135|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|792|0|2137|0|{@{}@

DATA_SOURCE_DML                         	$AI_DML/rt200p_enriched.dml
DATA_SOURCE_NAME	                      claimsinfo_rxclaim
INDEX_COL	                                      mxtdnb
FILE_SUBDIR	                                   rxclaim_adjud
FILE_MASK	                                      rxclaim_adjudication_
MIN_TXN_DATE	                                 20150704
MAX_TXN_DATE	                              $[(date("YYYYMMDD")) now1()]
DATA_PATH	                                      $AI_MFS
|174000|481000|0|0|0|0|10657|}}
{2010242002|XXGface|793|0|2139|0|{@{}@Arial Narrow|0|100|1|}}
{2010240003|XXGlegend|794|0|2141|0|{@{}@Parameter Name|167000|455000|0|0|0|0|10655|}}
{2010242002|XXGface|795|0|2143|0|{@{}@Arial|32768|120|1|}}
{2010240003|XXGlegend|796|0|2145|0|{@{}@Default Value (eg.)|382000|455000|0|0|0|0|10656|}}
{2010242002|XXGface|797|0|2147|0|{@{}@Arial Rounded MT Bold|32768|120|0|}}
{2010210004|XXGflow|798|0|2149|0|{@{}@384|.5|.5|{0|}10684|17|}}
{2010210004|XXGflow|799|0|2151|0|{@{}@384|.5|.5|{0|}10685|17|}}
{2010210004|XXGflow|800|0|2153|0|{@{}@384|.5|.5|{8|787000|224000|807000|224000|834000|224000|855000|224000|}10688|530|}}
{2010501005|XXGpvertex|801|0|2155|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Partitioning/Broadcast.mpc|3|2|Pf$|@{0|}}
}}@0|@400000|288500|723000|204000|54000|41000|10673|Broadcast|Ab Initio Software|Built-in|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|802|0|2157|0|{@{}@776000|219000|11000|11000|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|803|0|2160|0|{@{}@713000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|804|0|2163|0|{Distributes data by combining input data records into a single flow and writing a copy of that flow to each output flow partition.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|805|0|2165|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2322|0|}}
{2010202004|XXGiport|806|0|2168|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|807|0|2171|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|=|@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Normalize.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@206000|253500|301000|175000|123000|107000|10686|Generate Days in Range|Ab Initio Software|Built-in 2.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|808|0|2173|0|{@{}@423000|224000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|809|0|2176|0|{@{}@319000|281000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|810|0|2178|0|{@{}@359000|281000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|811|0|2180|0|{@{}@399000|281000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|812|0|2182|0|{@{}@291000|224000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|813|0|2185|0|{Generates multiple output data records from each input data record.  Normalize can separate a data record with a vector field into several individual records, each containing one element of the vector.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|normalize|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|in_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFl||{0|}}
{30001002|XXparameter|reject_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,reject,error,log::document(in)|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1367003041|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: reject = in
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|814|0|2187|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|815|0|2190|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|816|0|2193|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|817|0|2196|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|818|0|2199|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|819|0|2204|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|transform||3|8|=|@{0|}}
{30001002|XXparameter|compressed|True|3|1|l|@{0|}}
{30001002|XXparameter|Layout|$\{DATA_PATH\}|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|out_metadata|$DATA_SOURCE_DML|3|9||@{0|}}
{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Read_Multiple_Files.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|file_missing||3|8|=|@{0|}}
{30001002|XXparameter|file_unavailable|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|filename_error|Notify (Continue, with a reject record and error message)|3|1|l|@{0|}}
{30001002|XXparameter|fileerror_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|error_metadata|string('\\n')|3|1|l|@{0|}}
{30001002|XXparameter|log_metadata|record string("\|") node, timestamp, component, subcomponent, event_type; string("\|\\n") event_text; end|3|1|l|@{0|}}
}}@0|@531000|262500|866000|179000|227000|113000|10689|Read Multiple Split ICFF|Ab Initio Software|Built-in 2.11.8:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|820|0|2206|0|{@{}@1092000|219000|11000|11000|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|821|0|2208|0|{@{}@884000|291000|11000|11000|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|822|0|2210|0|{@{}@924000|291000|11000|11000|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|823|0|2212|0|{@{}@964000|291000|11000|11000|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|824|0|2214|0|{@{}@1004000|291000|11000|11000|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|825|0|2216|0|{@{}@1044000|291000|11000|11000|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|826|0|2218|0|{@{}@856000|219000|11000|11000|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|827|0|2221|0|{Sequentially reads from a list of input files.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|readfiles|3|1|Hl||{0|}}
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
{30001002|XXparameter|_use_rich_error_format|False|13|1|Hl|False means use legacy string newline format|{0|}}
{30001002|XXparameter|_use_rich_log_format|False|13|1|Hl|False means use legacy native charset format|{0|}}
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
{30001002|XXparameter|mpcmodtime|1367003023|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation||15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|condition_interpretation.display_name|condition-interpretation|3|9|P|@{0|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|_propagation|metadata type: filereject = in
metadata type: fileerror = "string('\\\\n')"
metadata type: error = "string('\\\\n')"
metadata type: log = "record string(\\"\|\\") node, timestamp, component, subcomponent, event_type; string(\\"\|\\\\n\\") event_text; end"|3|1|HKl|@{0|}}
{30001002|XXparameter|_propagate_through||3|1|FHKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@@@1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|828|0|2223|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|829|0|2226|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|filereject|0.0|@@@1168|0|}}
{2010203004|XXGoport|830|0|2229|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|fileerror|0.0|@@@1168|0|}}
{2010203004|XXGoport|831|0|2232|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject|0.0|@@@1168|0|}}
{2010203004|XXGoport|832|0|2235|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|833|0|2238|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|834|0|2241|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|835|0|2246|0|{|{}@0|@10000|12500|0|0|0|0|10676|Version Log||@1|100|-1|@6|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|661000|393000|7|}}
{2010240003|XXGlegend|836|0|2248|0|{@{}@Date|92000|46000|0|0|0|0|7|}}
{2010242002|XXGface|837|0|2250|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|838|0|2252|0|{@{}@Aug 31 2015|82000|68000|0|0|0|0|33|}}
{2010242002|XXGface|839|0|2254|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|840|0|2256|0|{@{}@This Subgraph will read split files based on index and date range 
from the location provided by user as input parameter|337000|63000|0|0|0|0|31|}}
{2010242002|XXGface|841|0|2258|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|842|0|2260|0|{@{}@Author|197000|46000|0|0|0|0|25|}}
{2010242002|XXGface|843|0|2262|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|844|0|2264|0|{@{}@Mukesh Singh|192000|68000|0|0|0|0|26|}}
{2010242002|XXGface|845|0|2266|0|{@{}@Arial Narrow|0|100|0|}}
{2010240003|XXGlegend|846|0|2268|0|{@{}@Description|337000|46000|0|0|0|0|32|}}
{2010242002|XXGface|847|0|2270|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|848|0|2272|0|{@{}@Version|17000|46000|0|0|0|0|29|}}
{2010242002|XXGface|849|0|2274|0|{@{}@Arial Rounded MT Bold|32768|100|0|}}
{2010240003|XXGlegend|850|0|2276|0|{@{}@1.0|17000|68000|0|0|0|0|30|}}
{2010242002|XXGface|851|0|2278|0|{@{}@Arial Narrow|0|100|0|}}
{2010501005|XXGpvertex|852|0|2280|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Validate/Create_Data.mpc|3|2|Pf$|@{0|}}
{30001002|XXparameter|num_records|1|3|9||@{0|}}
{30001002|XXparameter|transform|out :: create(index) =
begin
  out.start_date :: 1; //assigned Random
  out.end_date :: 1;//assigned Random
end;|3|3|c|@{0|}}
{30001002|XXparameter|Layout|file:.|3|9||@{0|}}
{30001002|XXparameter|out_metadata|metadata type = 
record
  date("YYYY-MM-DD") start_date;
  date("YYYY-MM-DD") end_date; 
end;|3|3|c|@{0|}}
{30001002|XXparameter|error_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|@56000|273000|0|0|0|0|10659|generate record- Kicker|Ab Initio Software|Built-in 2.15.2:|1|100|0|@6|@32769|1|{1|0|}}}
{2010203004|XXGoport|853|0|2282|0|{@{}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|854|0|2285|0|{@{}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|855|0|2287|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010501005|XXGpvertex|856|0|2289|0|{Creates records according to a transform.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|Create_Data|3|1|Hl||{0|}}
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
{30001002|XXparameter|Layout|@9|9|RFs||{0|}}
{30001002|XXparameter|out_metadata||7|1|RFsl||{0|}}
{30001002|XXparameter|error_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|log_metadata||7|1|Fsl||{0|}}
{30001002|XXparameter|doc_transform||8|2|FHs$|Document your transformation for dependency analysis|{0|}}
{30001002|XXparameter|doc_operation1|out,error,log::document()|3|2|RH$||{0|}}
{30001002|XXparameter|mpcmodtime|1432158955|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|metadata type: error = remote("$AB_HOME/include/error-info.dml")
metadata type: log = remote("$AB_HOME/include/log-info.dml")|3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|857|0|2291|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2448|0|}}
{2010203004|XXGoport|858|0|2294|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error|0.0|@@@1176|0|}}
{2010203004|XXGoport|859|0|2297|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010203004|XXGoport|860|0|2300|0|{@{}@0|0|0|0|out0|.4101040118870728|@@@14352|0|}}
{2010110002|XXGconstant|861|0|2304|0|{@{}@{1|8826862|}}}
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
{2010604001|XXGgraph_flow_flow|22|0|44|0|{Flow_1|}1|23|}
{2010604001|XXGgraph_flow_flow|23|0|46|0|{Flow_10|}1|24|}
{2010604001|XXGgraph_flow_flow|24|0|48|0|{Flow_11|}1|25|}
{2010604001|XXGgraph_flow_flow|25|0|50|0|{Flow_12|}1|26|}
{2010604001|XXGgraph_flow_flow|26|0|52|0|{Flow_13|}1|27|}
{2010604001|XXGgraph_flow_flow|27|0|54|0|{Flow_14|}1|28|}
{2010604001|XXGgraph_flow_flow|28|0|56|0|{Flow_15|}1|29|}
{2010604001|XXGgraph_flow_flow|29|0|58|0|{Flow_16|}1|30|}
{2010604001|XXGgraph_flow_flow|30|0|60|0|{Flow_17|}1|31|}
{2010604001|XXGgraph_flow_flow|31|0|62|0|{Flow_18|}1|32|}
{2010604001|XXGgraph_flow_flow|32|0|64|0|{Flow_2|}1|33|}
{2010604001|XXGgraph_flow_flow|33|0|66|0|{Flow_3|}1|34|}
{2010604001|XXGgraph_flow_flow|34|0|68|0|{Flow_4|}1|35|}
{2010604001|XXGgraph_flow_flow|35|0|70|0|{Flow_5|}1|36|}
{2010604001|XXGgraph_flow_flow|36|0|72|0|{Flow_6|}1|37|}
{2010604001|XXGgraph_flow_flow|37|0|74|0|{Flow_7|}1|38|}
{2010604001|XXGgraph_flow_flow|38|0|76|0|{Flow_8|}1|39|}
{2010604001|XXGgraph_flow_flow|39|0|78|0|{Flow_9|}1|40|}
{2010601001|XXGgraph_vertex_vertex|40|0|80|0|{APPLY_POST_FILTER|}1|41|}
{2010212001|XXGvertex_oport_oport|41|0|82|0|{0|out|}41|42|}
{2010213001|XXGoport_dst_flow|42|0|84|0|{0|}42|38|}
{2010212001|XXGvertex_oport_oport|43|0|85|0|{1|deselect|}41|43|}
{2010212001|XXGvertex_oport_oport|44|0|87|0|{2|reject|}41|44|}
{2010212001|XXGvertex_oport_oport|45|0|89|0|{3|error|}41|45|}
{2010212001|XXGvertex_oport_oport|46|0|91|0|{4|log|}41|46|}
{2010211001|XXGvertex_iport_iport|47|0|93|0|{0|in|}41|47|}
{2010214001|XXGiport_src_flow|48|0|95|0|{0|}47|30|}
{2010007001|XXGobject_proto_object|49|0|96|0|{}41|48|}
{2010212001|XXGvertex_oport_oport|50|0|98|0|{0|out|}48|49|}
{2010006001|XXGobject_psameas_object|51|0|100|0|{metadata|out_metadata|1|0|}49|48|}
{2010212001|XXGvertex_oport_oport|52|0|101|0|{1|deselect|}48|50|}
{2010006001|XXGobject_psameas_object|53|0|103|0|{metadata|deselect_metadata|1|0|}50|48|}
{2010212001|XXGvertex_oport_oport|54|0|104|0|{2|reject|}48|51|}
{2010006001|XXGobject_psameas_object|55|0|106|0|{metadata|reject_metadata|1|0|}51|48|}
{2010212001|XXGvertex_oport_oport|56|0|107|0|{3|error|}48|52|}
{2010006001|XXGobject_psameas_object|57|0|109|0|{metadata|error_metadata|1|0|}52|48|}
{2010212001|XXGvertex_oport_oport|58|0|110|0|{4|log|}48|53|}
{2010006001|XXGobject_psameas_object|59|0|112|0|{metadata|log_metadata|1|0|}53|48|}
{2010211001|XXGvertex_iport_iport|60|0|113|0|{0|in|}48|54|}
{2010006001|XXGobject_psameas_object|61|0|115|0|{metadata|in_metadata|1|0|}54|48|}
{2010006001|XXGobject_psameas_object|62|0|116|0|{deselect_metadata|out0_metadata|0|0|}41|55|}
{2010212001|XXGvertex_oport_oport|63|0|118|0|{0|out0|}55|56|}
{2010213001|XXGoport_dst_flow|64|0|120|0|{0|}56|33|}
{2010212001|XXGvertex_oport_oport|65|0|121|0|{1|reject0|}55|57|}
{2010213001|XXGoport_dst_flow|66|0|123|0|{0|}57|25|}
{2010212001|XXGvertex_oport_oport|67|0|124|0|{2|error0|}55|58|}
{2010213001|XXGoport_dst_flow|68|0|126|0|{0|}58|24|}
{2010212001|XXGvertex_oport_oport|69|0|127|0|{3|log|}55|59|}
{2010211001|XXGvertex_iport_iport|70|0|129|0|{0|in|}55|60|}
{2010214001|XXGiport_src_flow|71|0|131|0|{0|}60|40|}
{2010007001|XXGobject_proto_object|72|0|132|0|{}55|61|}
{2010212001|XXGvertex_oport_oport|73|0|134|0|{0|out0|}61|62|}
{2010006001|XXGobject_psameas_object|74|0|136|0|{metadata|out0_metadata|1|0|}62|61|}
{2010006001|XXGobject_psameas_object|75|0|137|0|{transform0|transform0|1|0|}62|61|}
{2010212001|XXGvertex_oport_oport|76|0|138|0|{1|reject0|}61|63|}
{2010006001|XXGobject_psameas_object|77|0|140|0|{metadata|reject0_metadata|1|0|}63|61|}
{2010212001|XXGvertex_oport_oport|78|0|141|0|{2|error0|}61|64|}
{2010006001|XXGobject_psameas_object|79|0|143|0|{metadata|error0_metadata|1|0|}64|61|}
{2010212001|XXGvertex_oport_oport|80|0|144|0|{3|log|}61|65|}
{2010006001|XXGobject_psameas_object|81|0|146|0|{metadata|log_metadata|1|0|}65|61|}
{2010211001|XXGvertex_iport_iport|82|0|147|0|{0|in|}61|66|}
{2010006001|XXGobject_psameas_object|83|0|149|0|{metadata|in_metadata|1|0|}66|61|}
{2010006001|XXGobject_psameas_object|84|0|150|0|{in_metadata|out_metadata|0|0|}55|67|}
{2010212001|XXGvertex_oport_oport|85|0|152|0|{0|out|}67|68|}
{2010213001|XXGoport_dst_flow|86|0|154|0|{0|}68|40|}
{2010212001|XXGvertex_oport_oport|87|0|155|0|{1|reject|}67|69|}
{2010212001|XXGvertex_oport_oport|88|0|157|0|{2|error|}67|70|}
{2010212001|XXGvertex_oport_oport|89|0|159|0|{3|log|}67|71|}
{2010211001|XXGvertex_iport_iport|90|0|161|0|{0|in|}67|72|}
{2010214001|XXGiport_src_flow|91|0|163|0|{0|}72|37|}
{2010007001|XXGobject_proto_object|92|0|164|0|{}67|73|}
{2010212001|XXGvertex_oport_oport|93|0|166|0|{0|out|}73|74|}
{2010006001|XXGobject_psameas_object|94|0|168|0|{metadata|out_metadata|1|0|}74|73|}
{2010212001|XXGvertex_oport_oport|95|0|169|0|{1|reject|}73|75|}
{2010006001|XXGobject_psameas_object|96|0|171|0|{metadata|reject_metadata|1|0|}75|73|}
{2010212001|XXGvertex_oport_oport|97|0|172|0|{2|error|}73|76|}
{2010006001|XXGobject_psameas_object|98|0|174|0|{metadata|error_metadata|1|0|}76|73|}
{2010212001|XXGvertex_oport_oport|99|0|175|0|{3|log|}73|77|}
{2010006001|XXGobject_psameas_object|100|0|177|0|{metadata|log_metadata|1|0|}77|73|}
{2010211001|XXGvertex_iport_iport|101|0|178|0|{0|in|}73|78|}
{2010006001|XXGobject_psameas_object|102|0|180|0|{metadata|in_metadata|1|0|}78|73|}
{2010006001|XXGobject_psameas_object|103|0|181|0|{Layout|Layout|0|0|}67|55|}
{2010006001|XXGobject_psameas_object|104|0|182|0|{reject_metadata|in_metadata|0|0|}67|67|}
{2010006001|XXGobject_psameas_object|105|0|183|0|{reject0_metadata|out_metadata|0|0|}55|67|}
{2010006001|XXGobject_psameas_object|106|0|184|0|{in_metadata|out0_metadata|0|0|}41|55|}
{2010006001|XXGobject_psameas_object|107|0|185|0|{out_metadata|out0_metadata|0|0|}41|55|}
{2010006001|XXGobject_psameas_object|108|0|186|0|{reject_metadata|out0_metadata|0|0|}41|55|}
{2010601001|XXGgraph_vertex_vertex|109|0|187|0|{Apply_Mappings|}1|55|}
{2010601001|XXGgraph_vertex_vertex|110|0|188|0|{Apply_Pre_Filter|}1|79|}
{2010212001|XXGvertex_oport_oport|111|0|190|0|{0|out|}79|80|}
{2010213001|XXGoport_dst_flow|112|0|192|0|{0|}80|37|}
{2010212001|XXGvertex_oport_oport|113|0|193|0|{1|deselect|}79|81|}
{2010213001|XXGoport_dst_flow|114|0|195|0|{0|}81|26|}
{2010212001|XXGvertex_oport_oport|115|0|196|0|{2|reject|}79|82|}
{2010212001|XXGvertex_oport_oport|116|0|198|0|{3|error|}79|83|}
{2010212001|XXGvertex_oport_oport|117|0|200|0|{4|log|}79|84|}
{2010211001|XXGvertex_iport_iport|118|0|202|0|{0|in|}79|85|}
{2010214001|XXGiport_src_flow|119|0|204|0|{0|}85|36|}
{2010007001|XXGobject_proto_object|120|0|205|0|{}79|86|}
{2010212001|XXGvertex_oport_oport|121|0|207|0|{0|out|}86|87|}
{2010006001|XXGobject_psameas_object|122|0|209|0|{metadata|out_metadata|1|0|}87|86|}
{2010212001|XXGvertex_oport_oport|123|0|210|0|{1|deselect|}86|88|}
{2010006001|XXGobject_psameas_object|124|0|212|0|{metadata|deselect_metadata|1|0|}88|86|}
{2010212001|XXGvertex_oport_oport|125|0|213|0|{2|reject|}86|89|}
{2010006001|XXGobject_psameas_object|126|0|215|0|{metadata|reject_metadata|1|0|}89|86|}
{2010212001|XXGvertex_oport_oport|127|0|216|0|{3|error|}86|90|}
{2010006001|XXGobject_psameas_object|128|0|218|0|{metadata|error_metadata|1|0|}90|86|}
{2010212001|XXGvertex_oport_oport|129|0|219|0|{4|log|}86|91|}
{2010006001|XXGobject_psameas_object|130|0|221|0|{metadata|log_metadata|1|0|}91|86|}
{2010211001|XXGvertex_iport_iport|131|0|222|0|{0|in|}86|92|}
{2010006001|XXGobject_psameas_object|132|0|224|0|{metadata|in_metadata|1|0|}92|86|}
{2010006001|XXGobject_psameas_object|133|0|225|0|{Layout|Layout|0|0|}79|93|}
{2010211001|XXGvertex_iport_iport|134|0|227|0|{0|write|}93|94|}
{2010214001|XXGiport_src_flow|135|0|229|0|{0|}94|26|}
{2010007001|XXGobject_proto_object|136|0|230|0|{}93|95|}
{2010211001|XXGvertex_iport_iport|137|0|232|0|{0|write|}95|96|}
{2010006001|XXGobject_psameas_object|138|0|234|0|{metadata|write_metadata|1|0|}96|95|}
{2010006001|XXGobject_psameas_object|139|0|235|0|{write_metadata|in_metadata|0|0|}93|67|}
{2010006001|XXGobject_psameas_object|140|0|236|0|{deselect_metadata|in_metadata|0|0|}79|67|}
{2010006001|XXGobject_psameas_object|141|0|237|0|{in_metadata|in_metadata|0|0|}79|67|}
{2010006001|XXGobject_psameas_object|142|0|238|0|{out_metadata|in_metadata|0|0|}79|67|}
{2010006001|XXGobject_psameas_object|143|0|239|0|{reject_metadata|in_metadata|0|0|}79|67|}
{2010601001|XXGgraph_vertex_vertex|144|0|240|0|{Deselect_O_p_file|}1|93|}
{2010601001|XXGgraph_vertex_vertex|145|0|241|0|{Dummy_Replicate_for_flow|}1|97|}
{2010212001|XXGvertex_oport_oport|146|0|243|0|{0|out|}97|98|}
{2010213001|XXGoport_dst_flow|147|0|245|0|{0|}98|36|}
{2010211001|XXGvertex_iport_iport|148|0|246|0|{0|in|}97|99|}
{2010214001|XXGiport_src_flow|149|0|248|0|{0|}99|35|}
{2010007001|XXGobject_proto_object|150|0|249|0|{}97|100|}
{2010212001|XXGvertex_oport_oport|151|0|251|0|{0|out|}100|101|}
{2010006001|XXGobject_psameas_object|152|0|253|0|{metadata|out_metadata|1|0|}101|100|}
{2010211001|XXGvertex_iport_iport|153|0|254|0|{0|in|}100|102|}
{2010006001|XXGobject_psameas_object|154|0|256|0|{metadata|in_metadata|1|0|}102|100|}
{2010006001|XXGobject_psameas_object|155|0|257|0|{Layout|Layout|0|0|}97|93|}
{2010006001|XXGobject_psameas_object|156|0|258|0|{in_metadata|in_metadata|0|0|}97|67|}
{2010006001|XXGobject_psameas_object|157|0|259|0|{out_metadata|in_metadata|0|0|}97|67|}
{2010601001|XXGgraph_vertex_vertex|158|0|260|0|{Dummy_Replicate_for_flow_1|}1|103|}
{2010212001|XXGvertex_oport_oport|159|0|262|0|{0|out|}103|104|}
{2010213001|XXGoport_dst_flow|160|0|264|0|{0|}104|34|}
{2010211001|XXGvertex_iport_iport|161|0|265|0|{0|in|}103|105|}
{2010214001|XXGiport_src_flow|162|0|267|0|{0|}105|33|}
{2010007001|XXGobject_proto_object|163|0|268|0|{}103|106|}
{2010212001|XXGvertex_oport_oport|164|0|270|0|{0|out|}106|107|}
{2010006001|XXGobject_psameas_object|165|0|272|0|{metadata|out_metadata|1|0|}107|106|}
{2010211001|XXGvertex_iport_iport|166|0|273|0|{0|in|}106|108|}
{2010006001|XXGobject_psameas_object|167|0|275|0|{metadata|in_metadata|1|0|}108|106|}
{2010006001|XXGobject_psameas_object|168|0|276|0|{Layout|Layout|0|0|}103|55|}
{2010006001|XXGobject_psameas_object|169|0|277|0|{in_metadata|out0_metadata|0|0|}103|55|}
{2010006001|XXGobject_psameas_object|170|0|278|0|{out_metadata|out0_metadata|0|0|}103|55|}
{2010601001|XXGgraph_vertex_vertex|171|0|279|0|{Errors|}1|109|}
{2010211001|XXGvertex_iport_iport|172|0|281|0|{0|write|}109|110|}
{2010214001|XXGiport_src_flow|173|0|283|0|{0|}110|24|}
{2010007001|XXGobject_proto_object|174|0|284|0|{}109|111|}
{2010211001|XXGvertex_iport_iport|175|0|286|0|{0|write|}111|112|}
{2010006001|XXGobject_psameas_object|176|0|288|0|{metadata|write_metadata|1|0|}112|111|}
{2010006001|XXGobject_psameas_object|177|0|289|0|{write_metadata|error0_metadata|0|0|}109|55|}
{2010601001|XXGgraph_vertex_vertex|178|0|290|0|{Failed|}1|113|}
{2010211001|XXGvertex_iport_iport|179|0|292|0|{0|write|}113|114|}
{2010214001|XXGiport_src_flow|180|0|294|0|{0|}114|25|}
{2010007001|XXGobject_proto_object|181|0|295|0|{}113|115|}
{2010211001|XXGvertex_iport_iport|182|0|297|0|{0|write|}115|116|}
{2010006001|XXGobject_psameas_object|183|0|299|0|{metadata|write_metadata|1|0|}116|115|}
{2010006001|XXGobject_psameas_object|184|0|300|0|{write_metadata|out_metadata|0|0|}113|67|}
{2010601001|XXGgraph_vertex_vertex|185|0|301|0|{Get_Record_count|}1|117|}
{2010604001|XXGgraph_flow_flow|186|0|303|0|{Flow_15|}117|118|}
{2010604001|XXGgraph_flow_flow|187|0|305|0|{Flow_16|}117|119|}
{2010601001|XXGgraph_vertex_vertex|188|0|307|0|{Count_Local|}117|120|}
{2010212001|XXGvertex_oport_oport|189|0|309|0|{0|out|}120|121|}
{2010212001|XXGvertex_oport_oport|190|0|311|0|{1|reject|}120|122|}
{2010212001|XXGvertex_oport_oport|191|0|313|0|{2|error|}120|123|}
{2010212001|XXGvertex_oport_oport|192|0|315|0|{3|log|}120|124|}
{2010211001|XXGvertex_iport_iport|193|0|317|0|{0|in|}120|125|}
{2010214001|XXGiport_src_flow|194|0|319|0|{0|}125|118|}
{2010007001|XXGobject_proto_object|195|0|320|0|{}120|126|}
{2010212001|XXGvertex_oport_oport|196|0|322|0|{0|out|}126|127|}
{2010006001|XXGobject_psameas_object|197|0|324|0|{metadata|out_metadata|1|0|}127|126|}
{2010212001|XXGvertex_oport_oport|198|0|325|0|{1|reject|}126|128|}
{2010006001|XXGobject_psameas_object|199|0|327|0|{metadata|reject_metadata|1|0|}128|126|}
{2010212001|XXGvertex_oport_oport|200|0|328|0|{2|error|}126|129|}
{2010006001|XXGobject_psameas_object|201|0|330|0|{metadata|error_metadata|1|0|}129|126|}
{2010212001|XXGvertex_oport_oport|202|0|331|0|{3|log|}126|130|}
{2010006001|XXGobject_psameas_object|203|0|333|0|{metadata|log_metadata|1|0|}130|126|}
{2010211001|XXGvertex_iport_iport|204|0|334|0|{0|in|}126|131|}
{2010006001|XXGobject_psameas_object|205|0|336|0|{metadata|in_metadata|1|0|}131|126|}
{2010006001|XXGobject_psameas_object|206|0|337|0|{Layout|Layout|0|0|}120|132|}
{2010211001|XXGvertex_iport_iport|207|0|339|0|{0|write|}132|133|}
{2010214001|XXGiport_src_flow|208|0|341|0|{0|}133|29|}
{2010007001|XXGobject_proto_object|209|0|342|0|{}132|134|}
{2010211001|XXGvertex_iport_iport|210|0|344|0|{0|write|}134|135|}
{2010006001|XXGobject_psameas_object|211|0|346|0|{metadata|write_metadata|1|0|}135|134|}
{2010006001|XXGobject_psameas_object|212|0|347|0|{in_metadata|out0_metadata|0|0|}120|136|}
{2010212001|XXGvertex_oport_oport|213|0|349|0|{0|out0|}136|137|}
{2010213001|XXGoport_dst_flow|214|0|351|0|{0|}137|118|}
{2010212001|XXGvertex_oport_oport|215|0|352|0|{1|reject0|}136|138|}
{2010212001|XXGvertex_oport_oport|216|0|354|0|{2|error0|}136|139|}
{2010212001|XXGvertex_oport_oport|217|0|356|0|{3|log|}136|140|}
{2010211001|XXGvertex_iport_iport|218|0|358|0|{0|in|}136|141|}
{2010214001|XXGiport_src_flow|219|0|360|0|{0|}141|119|}
{2010007001|XXGobject_proto_object|220|0|361|0|{}136|142|}
{2010212001|XXGvertex_oport_oport|221|0|363|0|{0|out0|}142|143|}
{2010006001|XXGobject_psameas_object|222|0|365|0|{metadata|out0_metadata|1|0|}143|142|}
{2010006001|XXGobject_psameas_object|223|0|366|0|{transform0|transform0|1|0|}143|142|}
{2010212001|XXGvertex_oport_oport|224|0|367|0|{1|reject0|}142|144|}
{2010006001|XXGobject_psameas_object|225|0|369|0|{metadata|reject0_metadata|1|0|}144|142|}
{2010212001|XXGvertex_oport_oport|226|0|370|0|{2|error0|}142|145|}
{2010006001|XXGobject_psameas_object|227|0|372|0|{metadata|error0_metadata|1|0|}145|142|}
{2010212001|XXGvertex_oport_oport|228|0|373|0|{3|log|}142|146|}
{2010006001|XXGobject_psameas_object|229|0|375|0|{metadata|log_metadata|1|0|}146|142|}
{2010211001|XXGvertex_iport_iport|230|0|376|0|{0|in|}142|147|}
{2010006001|XXGobject_psameas_object|231|0|378|0|{metadata|in_metadata|1|0|}147|142|}
{2010006001|XXGobject_psameas_object|232|0|379|0|{Layout|Layout|0|0|}136|132|}
{2010006001|XXGobject_psameas_object|233|0|380|0|{in_metadata|in_metadata|0|0|}136|148|}
{2010212001|XXGvertex_oport_oport|234|0|382|0|{0|log|}148|149|}
{2010213001|XXGoport_dst_flow|235|0|384|0|{0|}149|28|}
{2010211001|XXGvertex_iport_iport|236|0|385|0|{0|in|}148|150|}
{2010007001|XXGobject_proto_object|237|0|387|0|{}148|151|}
{2010212001|XXGvertex_oport_oport|238|0|389|0|{0|log|}151|152|}
{2010006001|XXGobject_psameas_object|239|0|391|0|{metadata|log_metadata|1|0|}152|151|}
{2010211001|XXGvertex_iport_iport|240|0|392|0|{0|in|}151|153|}
{2010006001|XXGobject_psameas_object|241|0|394|0|{metadata|in_metadata|1|0|}153|151|}
{2010006001|XXGobject_psameas_object|242|0|395|0|{log_metadata|in_metadata|0|0|}148|148|}
{2010006001|XXGobject_psameas_object|243|0|396|0|{reject0_metadata|in_metadata|0|0|}136|148|}
{2010006001|XXGobject_psameas_object|244|0|397|0|{out_metadata|write_metadata|0|0|}120|132|}
{2010006001|XXGobject_psameas_object|245|0|398|0|{reject_metadata|out0_metadata|0|0|}120|136|}
{2010601001|XXGgraph_vertex_vertex|246|0|399|0|{Gather_1|}117|154|}
{2010212001|XXGvertex_oport_oport|247|0|401|0|{0|out|}154|155|}
{2010213001|XXGoport_dst_flow|248|0|403|0|{0|}155|119|}
{2010211001|XXGvertex_iport_iport|249|0|404|0|{0|in|}154|156|}
{2010007001|XXGobject_proto_object|250|0|406|0|{}154|157|}
{2010212001|XXGvertex_oport_oport|251|0|408|0|{0|out|}157|158|}
{2010006001|XXGobject_psameas_object|252|0|410|0|{metadata|out_metadata|1|0|}158|157|}
{2010211001|XXGvertex_iport_iport|253|0|411|0|{0|in|}157|159|}
{2010006001|XXGobject_psameas_object|254|0|413|0|{metadata|in_metadata|1|0|}159|157|}
{2010006001|XXGobject_psameas_object|255|0|414|0|{Layout|Layout|0|0|}154|132|}
{2010006001|XXGobject_psameas_object|256|0|415|0|{in_metadata|in_metadata|0|0|}154|148|}
{2010006001|XXGobject_psameas_object|257|0|416|0|{out_metadata|in_metadata|0|0|}154|148|}
{2010601001|XXGgraph_vertex_vertex|258|0|417|0|{Parse_Log|}117|136|}
{2010212001|XXGvertex_oport_oport|259|0|418|0|{0|out0|}117|160|}
{2010216002|XXGoport_binding_oport|260|0|420|0|{.5|.5|{0|}11108|}160|121|}
{2010213001|XXGoport_dst_flow|261|0|421|0|{0|}160|29|}
{2010211001|XXGvertex_iport_iport|262|0|422|0|{0|in0|}117|161|}
{2010215002|XXGiport_binding_iport|263|0|424|0|{.5|.5|{0|}11107|}161|156|}
{2010214001|XXGiport_src_flow|264|0|425|0|{0|}161|28|}
{2010601001|XXGgraph_vertex_vertex|265|0|426|0|{Handle_Logs|}1|148|}
{2010601001|XXGgraph_vertex_vertex|266|0|427|0|{IDS_ICFF_LKP|}1|162|}
{2010007001|XXGobject_proto_object|267|0|429|0|{}162|163|}
{2010601001|XXGgraph_vertex_vertex|268|0|431|0|{Input_File|}1|164|}
{2010212001|XXGvertex_oport_oport|269|0|433|0|{0|read|}164|165|}
{2010007001|XXGobject_proto_object|270|0|435|0|{}164|166|}
{2010212001|XXGvertex_oport_oport|271|0|437|0|{0|read|}166|167|}
{2010006001|XXGobject_psameas_object|272|0|439|0|{metadata|read_metadata|1|0|}167|166|}
{2010601001|XXGgraph_vertex_vertex|273|0|440|0|{Optional_Normalize|}1|67|}
{2010601001|XXGgraph_vertex_vertex|274|0|441|0|{Optional_Sort_Scan_Rollup|}1|168|}
{2010604001|XXGgraph_flow_flow|275|0|443|0|{Flow_1|}168|169|}
{2010604001|XXGgraph_flow_flow|276|0|445|0|{Flow_2|}168|170|}
{2010604001|XXGgraph_flow_flow|277|0|447|0|{Flow_3|}168|171|}
{2010604001|XXGgraph_flow_flow|278|0|449|0|{Flow_4|}168|172|}
{2010604001|XXGgraph_flow_flow|279|0|451|0|{Flow_5|}168|173|}
{2010601001|XXGgraph_vertex_vertex|280|0|453|0|{Dedup|}168|174|}
{2010604001|XXGgraph_flow_flow|281|0|455|0|{Flow_4|}174|175|}
{2010601001|XXGgraph_vertex_vertex|282|0|457|0|{Dedup_Sorted|}174|176|}
{2010212001|XXGvertex_oport_oport|283|0|459|0|{0|out|}176|177|}
{2010212001|XXGvertex_oport_oport|284|0|461|0|{1|dup|}176|178|}
{2010213001|XXGoport_dst_flow|285|0|463|0|{0|}178|175|}
{2010212001|XXGvertex_oport_oport|286|0|464|0|{2|reject|}176|179|}
{2010212001|XXGvertex_oport_oport|287|0|466|0|{3|error|}176|180|}
{2010212001|XXGvertex_oport_oport|288|0|468|0|{4|log|}176|181|}
{2010211001|XXGvertex_iport_iport|289|0|470|0|{0|in|}176|182|}
{2010007001|XXGobject_proto_object|290|0|472|0|{}176|183|}
{2010212001|XXGvertex_oport_oport|291|0|474|0|{0|out|}183|184|}
{2010006001|XXGobject_psameas_object|292|0|476|0|{metadata|out_metadata|1|0|}184|183|}
{2010212001|XXGvertex_oport_oport|293|0|477|0|{1|dup|}183|185|}
{2010006001|XXGobject_psameas_object|294|0|479|0|{metadata|dup_metadata|1|0|}185|183|}
{2010212001|XXGvertex_oport_oport|295|0|480|0|{2|reject|}183|186|}
{2010006001|XXGobject_psameas_object|296|0|482|0|{metadata|reject_metadata|1|0|}186|183|}
{2010212001|XXGvertex_oport_oport|297|0|483|0|{3|error|}183|187|}
{2010006001|XXGobject_psameas_object|298|0|485|0|{metadata|error_metadata|1|0|}187|183|}
{2010212001|XXGvertex_oport_oport|299|0|486|0|{4|log|}183|188|}
{2010006001|XXGobject_psameas_object|300|0|488|0|{metadata|log_metadata|1|0|}188|183|}
{2010211001|XXGvertex_iport_iport|301|0|489|0|{0|in|}183|189|}
{2010006001|XXGobject_psameas_object|302|0|491|0|{metadata|in_metadata|1|0|}189|183|}
{2010006001|XXGobject_psameas_object|303|0|492|0|{Layout|Layout|0|0|}176|190|}
{2010211001|XXGvertex_iport_iport|304|0|494|0|{0|write|}190|191|}
{2010214001|XXGiport_src_flow|305|0|496|0|{0|}191|175|}
{2010007001|XXGobject_proto_object|306|0|497|0|{}190|192|}
{2010211001|XXGvertex_iport_iport|307|0|499|0|{0|write|}192|193|}
{2010006001|XXGobject_psameas_object|308|0|501|0|{metadata|write_metadata|1|0|}193|192|}
{2010006001|XXGobject_psameas_object|309|0|502|0|{write_metadata|out0_metadata|0|0|}190|55|}
{2010006001|XXGobject_psameas_object|310|0|503|0|{dup_metadata|out0_metadata|0|0|}176|55|}
{2010006001|XXGobject_psameas_object|311|0|504|0|{in_metadata|out0_metadata|0|0|}176|55|}
{2010006001|XXGobject_psameas_object|312|0|505|0|{keep|DEDUP_KEEP|1|0|}176|174|}
{2010006001|XXGobject_psameas_object|313|0|506|0|{out_metadata|out0_metadata|0|0|}176|55|}
{2010006001|XXGobject_psameas_object|314|0|507|0|{reject_metadata|out0_metadata|0|0|}176|55|}
{2010601001|XXGgraph_vertex_vertex|315|0|508|0|{Duplicate_File|}174|190|}
{2010212001|XXGvertex_oport_oport|316|0|509|0|{0|out0|}174|194|}
{2010216002|XXGoport_binding_oport|317|0|511|0|{.5|.5|{0|}5734|}194|177|}
{2010213001|XXGoport_dst_flow|318|0|512|0|{0|}194|169|}
{2010211001|XXGvertex_iport_iport|319|0|513|0|{0|in0|}174|195|}
{2010215002|XXGiport_binding_iport|320|0|515|0|{.5|.5|{0|}5733|}195|182|}
{2010214001|XXGiport_src_flow|321|0|516|0|{0|}195|173|}
{2010006001|XXGobject_psameas_object|322|0|517|0|{DEDUP_KEEP|DEDUP_KEEP|1|0|}174|168|}
{2010601001|XXGgraph_vertex_vertex|323|0|518|0|{Merge|}168|196|}
{2010212001|XXGvertex_oport_oport|324|0|520|0|{0|out|}196|197|}
{2010213001|XXGoport_dst_flow|325|0|522|0|{0|}197|171|}
{2010211001|XXGvertex_iport_iport|326|0|523|0|{0|in|}196|198|}
{2010214001|XXGiport_src_flow|327|0|525|0|{0|}198|169|}
{2010007001|XXGobject_proto_object|328|0|526|0|{}196|199|}
{2010212001|XXGvertex_oport_oport|329|0|528|0|{0|out|}199|200|}
{2010006001|XXGobject_psameas_object|330|0|530|0|{metadata|out_metadata|1|0|}200|199|}
{2010211001|XXGvertex_iport_iport|331|0|531|0|{0|in|}199|201|}
{2010006001|XXGobject_psameas_object|332|0|533|0|{metadata|in_metadata|1|0|}201|199|}
{2010006001|XXGobject_psameas_object|333|0|534|0|{in_metadata|out0_metadata|0|0|}196|55|}
{2010006001|XXGobject_psameas_object|334|0|535|0|{out_metadata|out0_metadata|0|0|}196|55|}
{2010601001|XXGgraph_vertex_vertex|335|0|536|0|{Partition_by_Key_and_Sort|}168|202|}
{2010604001|XXGgraph_flow_flow|336|0|538|0|{Flow_1|}202|203|}
{2010601001|XXGgraph_vertex_vertex|337|0|540|0|{Partition_by_Key|}202|204|}
{2010212001|XXGvertex_oport_oport|338|0|542|0|{0|out|}204|205|}
{2010213001|XXGoport_dst_flow|339|0|544|0|{0|}205|203|}
{2010211001|XXGvertex_iport_iport|340|0|545|0|{0|in|}204|206|}
{2010006001|XXGobject_psameas_object|341|0|547|0|{in_metadata|out0_metadata|0|0|}204|55|}
{2010006001|XXGobject_psameas_object|342|0|548|0|{out_metadata|out0_metadata|0|0|}204|55|}
{2010601001|XXGgraph_vertex_vertex|343|0|549|0|{Sort|}202|207|}
{2010212001|XXGvertex_oport_oport|344|0|551|0|{0|out|}207|208|}
{2010211001|XXGvertex_iport_iport|345|0|553|0|{0|in|}207|209|}
{2010214001|XXGiport_src_flow|346|0|555|0|{0|}209|203|}
{2010006001|XXGobject_psameas_object|347|0|556|0|{in_metadata|out0_metadata|0|0|}207|55|}
{2010006001|XXGobject_psameas_object|348|0|557|0|{out_metadata|out0_metadata|0|0|}207|55|}
{2010212001|XXGvertex_oport_oport|349|0|558|0|{0|out0|}202|210|}
{2010216002|XXGoport_binding_oport|350|0|560|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}7|}210|208|}
{2010213001|XXGoport_dst_flow|351|0|561|0|{0|}210|172|}
{2010211001|XXGvertex_iport_iport|352|0|562|0|{0|in0|}202|211|}
{2010215002|XXGiport_binding_iport|353|0|564|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}6|}211|206|}
{2010007001|XXGobject_proto_object|354|0|565|0|{}202|212|}
{2010604001|XXGgraph_flow_flow|355|0|567|0|{Flow_1|}212|213|}
{2010601001|XXGgraph_vertex_vertex|356|0|569|0|{Partition_by_Key|}212|214|}
{2010212001|XXGvertex_oport_oport|357|0|571|0|{0|out|}214|215|}
{2010213001|XXGoport_dst_flow|358|0|573|0|{0|}215|213|}
{2010211001|XXGvertex_iport_iport|359|0|574|0|{0|in|}214|216|}
{2010007001|XXGobject_proto_object|360|0|576|0|{}214|217|}
{2010212001|XXGvertex_oport_oport|361|0|578|0|{0|out|}217|218|}
{2010006001|XXGobject_psameas_object|362|0|580|0|{metadata|out_metadata|1|0|}218|217|}
{2010211001|XXGvertex_iport_iport|363|0|581|0|{0|in|}217|219|}
{2010006001|XXGobject_psameas_object|364|0|583|0|{metadata|in_metadata|1|0|}219|217|}
{2010006001|XXGobject_psameas_object|365|0|584|0|{Layout|InputLayout|1|0|}214|212|}
{2010006001|XXGobject_psameas_object|366|0|585|0|{key|Key|1|0|}214|212|}
{2010601001|XXGgraph_vertex_vertex|367|0|586|0|{Sort|}212|220|}
{2010212001|XXGvertex_oport_oport|368|0|588|0|{0|out|}220|221|}
{2010211001|XXGvertex_iport_iport|369|0|590|0|{0|in|}220|222|}
{2010214001|XXGiport_src_flow|370|0|592|0|{0|}222|213|}
{2010007001|XXGobject_proto_object|371|0|593|0|{}220|223|}
{2010212001|XXGvertex_oport_oport|372|0|595|0|{0|out|}223|224|}
{2010006001|XXGobject_psameas_object|373|0|597|0|{metadata|out_metadata|1|0|}224|223|}
{2010211001|XXGvertex_iport_iport|374|0|598|0|{0|in|}223|225|}
{2010006001|XXGobject_psameas_object|375|0|600|0|{metadata|in_metadata|1|0|}225|223|}
{2010006001|XXGobject_psameas_object|376|0|601|0|{Layout|OutputLayout|1|0|}220|212|}
{2010006001|XXGobject_psameas_object|377|0|602|0|{key|Key|1|0|}220|212|}
{2010006001|XXGobject_psameas_object|378|0|603|0|{max_core|Max_core|1|0|}220|212|}
{2010212001|XXGvertex_oport_oport|379|0|604|0|{0|out0|}212|226|}
{2010216002|XXGoport_binding_oport|380|0|606|0|{.5|.5|{8|450000|171000|470000|171000|480000|171000|500000|171000|}0|}226|221|}
{2010211001|XXGvertex_iport_iport|381|0|607|0|{0|in0|}212|227|}
{2010215002|XXGiport_binding_iport|382|0|609|0|{.5|.5|{8|71000|171000|51000|171000|40000|171000|20000|171000|}0|}227|216|}
{2010006001|XXGobject_psameas_object|383|0|610|0|{InputLayout|Layout|0|0|}202|55|}
{2010601001|XXGgraph_vertex_vertex|384|0|611|0|{Rollup|}168|228|}
{2010212001|XXGvertex_oport_oport|385|0|613|0|{0|out|}228|229|}
{2010212001|XXGvertex_oport_oport|386|0|615|0|{1|reject|}228|230|}
{2010212001|XXGvertex_oport_oport|387|0|617|0|{2|error|}228|231|}
{2010212001|XXGvertex_oport_oport|388|0|619|0|{3|log|}228|232|}
{2010211001|XXGvertex_iport_iport|389|0|621|0|{0|in|}228|233|}
{2010214001|XXGiport_src_flow|390|0|623|0|{0|}233|170|}
{2010007001|XXGobject_proto_object|391|0|624|0|{}228|234|}
{2010212001|XXGvertex_oport_oport|392|0|626|0|{0|out|}234|235|}
{2010006001|XXGobject_psameas_object|393|0|628|0|{metadata|out_metadata|1|0|}235|234|}
{2010212001|XXGvertex_oport_oport|394|0|629|0|{1|reject|}234|236|}
{2010006001|XXGobject_psameas_object|395|0|631|0|{metadata|reject_metadata|1|0|}236|234|}
{2010212001|XXGvertex_oport_oport|396|0|632|0|{2|error|}234|237|}
{2010006001|XXGobject_psameas_object|397|0|634|0|{metadata|error_metadata|1|0|}237|234|}
{2010212001|XXGvertex_oport_oport|398|0|635|0|{3|log|}234|238|}
{2010006001|XXGobject_psameas_object|399|0|637|0|{metadata|log_metadata|1|0|}238|234|}
{2010211001|XXGvertex_iport_iport|400|0|638|0|{0|in|}234|239|}
{2010006001|XXGobject_psameas_object|401|0|640|0|{metadata|in_metadata|1|0|}239|234|}
{2010006001|XXGobject_psameas_object|402|0|641|0|{in_metadata|out0_metadata|0|0|}228|55|}
{2010006001|XXGobject_psameas_object|403|0|642|0|{out_metadata|out0_metadata|0|0|}228|55|}
{2010006001|XXGobject_psameas_object|404|0|643|0|{reject_metadata|out0_metadata|0|0|}228|55|}
{2010601001|XXGgraph_vertex_vertex|405|0|644|0|{Scan|}168|240|}
{2010212001|XXGvertex_oport_oport|406|0|646|0|{0|out|}240|241|}
{2010213001|XXGoport_dst_flow|407|0|648|0|{0|}241|170|}
{2010212001|XXGvertex_oport_oport|408|0|649|0|{1|reject|}240|242|}
{2010212001|XXGvertex_oport_oport|409|0|651|0|{2|error|}240|243|}
{2010212001|XXGvertex_oport_oport|410|0|653|0|{3|log|}240|244|}
{2010211001|XXGvertex_iport_iport|411|0|655|0|{0|in|}240|245|}
{2010214001|XXGiport_src_flow|412|0|657|0|{0|}245|171|}
{2010007001|XXGobject_proto_object|413|0|658|0|{}240|246|}
{2010212001|XXGvertex_oport_oport|414|0|660|0|{0|out|}246|247|}
{2010006001|XXGobject_psameas_object|415|0|662|0|{metadata|out_metadata|1|0|}247|246|}
{2010212001|XXGvertex_oport_oport|416|0|663|0|{1|reject|}246|248|}
{2010006001|XXGobject_psameas_object|417|0|665|0|{metadata|reject_metadata|1|0|}248|246|}
{2010212001|XXGvertex_oport_oport|418|0|666|0|{2|error|}246|249|}
{2010006001|XXGobject_psameas_object|419|0|668|0|{metadata|error_metadata|1|0|}249|246|}
{2010212001|XXGvertex_oport_oport|420|0|669|0|{3|log|}246|250|}
{2010006001|XXGobject_psameas_object|421|0|671|0|{metadata|log_metadata|1|0|}250|246|}
{2010211001|XXGvertex_iport_iport|422|0|672|0|{0|in|}246|251|}
{2010006001|XXGobject_psameas_object|423|0|674|0|{metadata|in_metadata|1|0|}251|246|}
{2010006001|XXGobject_psameas_object|424|0|675|0|{in_metadata|out0_metadata|0|0|}240|55|}
{2010006001|XXGobject_psameas_object|425|0|676|0|{out_metadata|out0_metadata|0|0|}240|55|}
{2010006001|XXGobject_psameas_object|426|0|677|0|{reject_metadata|out0_metadata|0|0|}240|55|}
{2010601001|XXGgraph_vertex_vertex|427|0|678|0|{Sort_within_Groups|}168|252|}
{2010212001|XXGvertex_oport_oport|428|0|680|0|{0|out|}252|253|}
{2010213001|XXGoport_dst_flow|429|0|682|0|{0|}253|173|}
{2010211001|XXGvertex_iport_iport|430|0|683|0|{0|in|}252|254|}
{2010214001|XXGiport_src_flow|431|0|685|0|{0|}254|172|}
{2010007001|XXGobject_proto_object|432|0|686|0|{}252|255|}
{2010212001|XXGvertex_oport_oport|433|0|688|0|{0|out|}255|256|}
{2010006001|XXGobject_psameas_object|434|0|690|0|{metadata|out_metadata|1|0|}256|255|}
{2010211001|XXGvertex_iport_iport|435|0|691|0|{0|in|}255|257|}
{2010006001|XXGobject_psameas_object|436|0|693|0|{metadata|in_metadata|1|0|}257|255|}
{2010006001|XXGobject_psameas_object|437|0|694|0|{Layout|Layout|0|0|}252|190|}
{2010006001|XXGobject_psameas_object|438|0|695|0|{in_metadata|out0_metadata|0|0|}252|55|}
{2010006001|XXGobject_psameas_object|439|0|696|0|{out_metadata|out0_metadata|0|0|}252|55|}
{2010212001|XXGvertex_oport_oport|440|0|697|0|{0|out0|}168|258|}
{2010216002|XXGoport_binding_oport|441|0|699|0|{.5|.5|{0|}5930|}258|229|}
{2010213001|XXGoport_dst_flow|442|0|700|0|{0|}258|30|}
{2010211001|XXGvertex_iport_iport|443|0|701|0|{0|in0|}168|259|}
{2010215002|XXGiport_binding_iport|444|0|703|0|{.5|.5|{0|}5929|}259|211|}
{2010214001|XXGiport_src_flow|445|0|704|0|{0|}259|34|}
{2010006001|XXGobject_psameas_object|446|0|705|0|{DEDUP_KEEP|DEDUP_KEEP|1|0|}168|1|}
{2010601001|XXGgraph_vertex_vertex|447|0|706|0|{Output_File|}1|132|}
{2010601001|XXGgraph_vertex_vertex|448|0|707|0|{Read_SERIAL_or_MFS_Files|}1|260|}
{2010605001|XXGgraph_legend_legend|449|0|709|0|{0|}260|261|}
{2010241001|XXGlegend_face_face|450|0|711|0|{}261|262|}
{2010605001|XXGgraph_legend_legend|451|0|713|0|{1|}260|263|}
{2010241001|XXGlegend_face_face|452|0|715|0|{}263|264|}
{2010605001|XXGgraph_legend_legend|453|0|717|0|{2|}260|265|}
{2010241001|XXGlegend_face_face|454|0|719|0|{}265|266|}
{2010605001|XXGgraph_legend_legend|455|0|721|0|{3|}260|267|}
{2010241001|XXGlegend_face_face|456|0|723|0|{}267|268|}
{2010605001|XXGgraph_legend_legend|457|0|725|0|{4|}260|269|}
{2010241001|XXGlegend_face_face|458|0|727|0|{}269|270|}
{2010605001|XXGgraph_legend_legend|459|0|729|0|{5|}260|271|}
{2010241001|XXGlegend_face_face|460|0|731|0|{}271|272|}
{2010605001|XXGgraph_legend_legend|461|0|733|0|{6|}260|273|}
{2010241001|XXGlegend_face_face|462|0|735|0|{}273|274|}
{2010605001|XXGgraph_legend_legend|463|0|737|0|{7|}260|275|}
{2010241001|XXGlegend_face_face|464|0|739|0|{}275|276|}
{2010604001|XXGgraph_flow_flow|465|0|741|0|{Flow_1|}260|277|}
{2010604001|XXGgraph_flow_flow|466|0|743|0|{Flow_10|}260|278|}
{2010604001|XXGgraph_flow_flow|467|0|745|0|{Flow_11|}260|279|}
{2010604001|XXGgraph_flow_flow|468|0|747|0|{Flow_12|}260|280|}
{2010604001|XXGgraph_flow_flow|469|0|749|0|{Flow_2|}260|281|}
{2010604001|XXGgraph_flow_flow|470|0|751|0|{Flow_3|}260|282|}
{2010604001|XXGgraph_flow_flow|471|0|753|0|{Flow_4|}260|283|}
{2010604001|XXGgraph_flow_flow|472|0|755|0|{Flow_5|}260|284|}
{2010604001|XXGgraph_flow_flow|473|0|757|0|{Flow_6|}260|285|}
{2010604001|XXGgraph_flow_flow|474|0|759|0|{Flow_7|}260|286|}
{2010604001|XXGgraph_flow_flow|475|0|761|0|{Flow_8|}260|287|}
{2010604001|XXGgraph_flow_flow|476|0|763|0|{Flow_9|}260|288|}
{2010601001|XXGgraph_vertex_vertex|477|0|765|0|{Broadcast|}260|289|}
{2010212001|XXGvertex_oport_oport|478|0|767|0|{0|out|}289|290|}
{2010213001|XXGoport_dst_flow|479|0|769|0|{0|}290|285|}
{2010211001|XXGvertex_iport_iport|480|0|770|0|{0|in|}289|291|}
{2010214001|XXGiport_src_flow|481|0|772|0|{0|}291|281|}
{2010007001|XXGobject_proto_object|482|0|773|0|{}289|292|}
{2010212001|XXGvertex_oport_oport|483|0|775|0|{0|out|}292|293|}
{2010006001|XXGobject_psameas_object|484|0|777|0|{metadata|out_metadata|1|0|}293|292|}
{2010211001|XXGvertex_iport_iport|485|0|778|0|{0|in|}292|294|}
{2010006001|XXGobject_psameas_object|486|0|780|0|{metadata|in_metadata|1|0|}294|292|}
{2010006001|XXGobject_psameas_object|487|0|781|0|{Layout|Layout|0|0|}289|295|}
{2010212001|XXGvertex_oport_oport|488|0|783|0|{0|out|}295|296|}
{2010213001|XXGoport_dst_flow|489|0|785|0|{0|}296|277|}
{2010212001|XXGvertex_oport_oport|490|0|786|0|{1|error|}295|297|}
{2010212001|XXGvertex_oport_oport|491|0|788|0|{2|log|}295|298|}
{2010007001|XXGobject_proto_object|492|0|790|0|{}295|299|}
{2010212001|XXGvertex_oport_oport|493|0|792|0|{0|out|}299|300|}
{2010006001|XXGobject_psameas_object|494|0|794|0|{metadata|out_metadata|1|0|}300|299|}
{2010212001|XXGvertex_oport_oport|495|0|795|0|{1|error|}299|301|}
{2010006001|XXGobject_psameas_object|496|0|797|0|{metadata|error_metadata|1|0|}301|299|}
{2010212001|XXGvertex_oport_oport|497|0|798|0|{2|log|}299|302|}
{2010006001|XXGobject_psameas_object|498|0|800|0|{metadata|log_metadata|1|0|}302|299|}
{2010006001|XXGobject_psameas_object|499|0|801|0|{in_metadata|out_metadata|0|0|}289|295|}
{2010006001|XXGobject_psameas_object|500|0|802|0|{out_metadata|out_metadata|0|0|}289|295|}
{2010601001|XXGgraph_vertex_vertex|501|0|803|0|{Collect_Read_Errors_MFS|}260|303|}
{2010212001|XXGvertex_oport_oport|502|0|805|0|{0|escalate|}303|304|}
{2010212001|XXGvertex_oport_oport|503|0|807|0|{1|error|}303|305|}
{2010213001|XXGoport_dst_flow|504|0|809|0|{0|}305|288|}
{2010212001|XXGvertex_oport_oport|505|0|810|0|{2|log|}303|306|}
{2010211001|XXGvertex_iport_iport|506|0|812|0|{0|in|}303|307|}
{2010007001|XXGobject_proto_object|507|0|814|0|{}303|308|}
{2010212001|XXGvertex_oport_oport|508|0|816|0|{0|escalate|}308|309|}
{2010006001|XXGobject_psameas_object|509|0|818|0|{metadata|escalate_metadata|1|0|}309|308|}
{2010212001|XXGvertex_oport_oport|510|0|819|0|{1|error|}308|310|}
{2010006001|XXGobject_psameas_object|511|0|821|0|{metadata|error_metadata|1|0|}310|308|}
{2010212001|XXGvertex_oport_oport|512|0|822|0|{2|log|}308|311|}
{2010006001|XXGobject_psameas_object|513|0|824|0|{metadata|log_metadata|1|0|}311|308|}
{2010211001|XXGvertex_iport_iport|514|0|825|0|{0|in|}308|312|}
{2010006001|XXGobject_psameas_object|515|0|827|0|{metadata|in_metadata|1|0|}312|308|}
{2010006001|XXGobject_psameas_object|516|0|828|0|{Layout|Layout|0|0|}303|313|}
{2010211001|XXGvertex_iport_iport|517|0|830|0|{0|write|}313|314|}
{2010214001|XXGiport_src_flow|518|0|832|0|{0|}314|288|}
{2010007001|XXGobject_proto_object|519|0|833|0|{}313|315|}
{2010211001|XXGvertex_iport_iport|520|0|835|0|{0|write|}315|316|}
{2010006001|XXGobject_psameas_object|521|0|837|0|{metadata|write_metadata|1|0|}316|315|}
{2010006001|XXGobject_psameas_object|522|0|838|0|{write_metadata|in_metadata|0|0|}313|303|}
{2010006001|XXGobject_psameas_object|523|0|839|0|{error_metadata|in_metadata|0|0|}303|303|}
{2010006001|XXGobject_psameas_object|524|0|840|0|{escalate_metadata|in_metadata|0|0|}303|303|}
{2010601001|XXGgraph_vertex_vertex|525|0|841|0|{Collect_Read_Errors_Serial|}260|317|}
{2010212001|XXGvertex_oport_oport|526|0|843|0|{0|escalate|}317|318|}
{2010212001|XXGvertex_oport_oport|527|0|845|0|{1|error|}317|319|}
{2010213001|XXGoport_dst_flow|528|0|847|0|{0|}319|287|}
{2010212001|XXGvertex_oport_oport|529|0|848|0|{2|log|}317|320|}
{2010211001|XXGvertex_iport_iport|530|0|850|0|{0|in|}317|321|}
{2010007001|XXGobject_proto_object|531|0|852|0|{}317|322|}
{2010212001|XXGvertex_oport_oport|532|0|854|0|{0|escalate|}322|323|}
{2010006001|XXGobject_psameas_object|533|0|856|0|{metadata|escalate_metadata|1|0|}323|322|}
{2010212001|XXGvertex_oport_oport|534|0|857|0|{1|error|}322|324|}
{2010006001|XXGobject_psameas_object|535|0|859|0|{metadata|error_metadata|1|0|}324|322|}
{2010212001|XXGvertex_oport_oport|536|0|860|0|{2|log|}322|325|}
{2010006001|XXGobject_psameas_object|537|0|862|0|{metadata|log_metadata|1|0|}325|322|}
{2010211001|XXGvertex_iport_iport|538|0|863|0|{0|in|}322|326|}
{2010006001|XXGobject_psameas_object|539|0|865|0|{metadata|in_metadata|1|0|}326|322|}
{2010006001|XXGobject_psameas_object|540|0|866|0|{Layout|Layout|0|0|}317|327|}
{2010211001|XXGvertex_iport_iport|541|0|868|0|{0|write|}327|328|}
{2010214001|XXGiport_src_flow|542|0|870|0|{0|}328|287|}
{2010007001|XXGobject_proto_object|543|0|871|0|{}327|329|}
{2010211001|XXGvertex_iport_iport|544|0|873|0|{0|write|}329|330|}
{2010006001|XXGobject_psameas_object|545|0|875|0|{metadata|write_metadata|1|0|}330|329|}
{2010006001|XXGobject_psameas_object|546|0|876|0|{write_metadata|in_metadata|0|0|}327|317|}
{2010006001|XXGobject_psameas_object|547|0|877|0|{error_metadata|in_metadata|0|0|}317|317|}
{2010006001|XXGobject_psameas_object|548|0|878|0|{escalate_metadata|in_metadata|0|0|}317|317|}
{2010601001|XXGgraph_vertex_vertex|549|0|879|0|{Collect_Read_File_s_Log|}260|331|}
{2010212001|XXGvertex_oport_oport|550|0|881|0|{0|log|}331|332|}
{2010213001|XXGoport_dst_flow|551|0|883|0|{0|}332|278|}
{2010211001|XXGvertex_iport_iport|552|0|884|0|{0|in|}331|333|}
{2010007001|XXGobject_proto_object|553|0|886|0|{}331|334|}
{2010212001|XXGvertex_oport_oport|554|0|888|0|{0|log|}334|335|}
{2010006001|XXGobject_psameas_object|555|0|890|0|{metadata|log_metadata|1|0|}335|334|}
{2010211001|XXGvertex_iport_iport|556|0|891|0|{0|in|}334|336|}
{2010006001|XXGobject_psameas_object|557|0|893|0|{metadata|in_metadata|1|0|}336|334|}
{2010006001|XXGobject_psameas_object|558|0|894|0|{log_metadata|in_metadata|0|0|}331|331|}
{2010601001|XXGgraph_vertex_vertex|559|0|895|0|{Concatenate|}260|337|}
{2010212001|XXGvertex_oport_oport|560|0|897|0|{0|out|}337|338|}
{2010213001|XXGoport_dst_flow|561|0|899|0|{0|}338|286|}
{2010211001|XXGvertex_iport_iport|562|0|900|0|{0|in|}337|339|}
{2010214001|XXGiport_src_flow|563|0|902|0|{0|}339|278|}
{2010007001|XXGobject_proto_object|564|0|903|0|{}337|340|}
{2010212001|XXGvertex_oport_oport|565|0|905|0|{0|out|}340|341|}
{2010006001|XXGobject_psameas_object|566|0|907|0|{metadata|out_metadata|1|0|}341|340|}
{2010211001|XXGvertex_iport_iport|567|0|908|0|{0|in|}340|342|}
{2010006001|XXGobject_psameas_object|568|0|910|0|{metadata|in_metadata|1|0|}342|340|}
{2010006001|XXGobject_psameas_object|569|0|911|0|{Layout|Layout|0|0|}337|343|}
{2010211001|XXGvertex_iport_iport|570|0|913|0|{0|write|}343|344|}
{2010214001|XXGiport_src_flow|571|0|915|0|{0|}344|286|}
{2010007001|XXGobject_proto_object|572|0|916|0|{}343|345|}
{2010211001|XXGvertex_iport_iport|573|0|918|0|{0|write|}345|346|}
{2010006001|XXGobject_psameas_object|574|0|920|0|{metadata|write_metadata|1|0|}346|345|}
{2010006001|XXGobject_psameas_object|575|0|921|0|{write_metadata|in_metadata|0|0|}343|331|}
{2010006001|XXGobject_psameas_object|576|0|922|0|{in_metadata|in_metadata|0|0|}337|331|}
{2010006001|XXGobject_psameas_object|577|0|923|0|{out_metadata|in_metadata|0|0|}337|331|}
{2010601001|XXGgraph_vertex_vertex|578|0|924|0|{Dummy_Concat|}260|347|}
{2010212001|XXGvertex_oport_oport|579|0|926|0|{0|out|}347|348|}
{2010211001|XXGvertex_iport_iport|580|0|928|0|{0|in|}347|349|}
{2010214001|XXGiport_src_flow|581|0|930|0|{0|}349|283|}
{2010214001|XXGiport_src_flow|582|0|931|0|{1|}349|284|}
{2010007001|XXGobject_proto_object|583|0|932|0|{}347|350|}
{2010212001|XXGvertex_oport_oport|584|0|934|0|{0|out|}350|351|}
{2010006001|XXGobject_psameas_object|585|0|936|0|{metadata|out_metadata|1|0|}351|350|}
{2010211001|XXGvertex_iport_iport|586|0|937|0|{0|in|}350|352|}
{2010006001|XXGobject_psameas_object|587|0|939|0|{metadata|in_metadata|1|0|}352|350|}
{2010006001|XXGobject_psameas_object|588|0|940|0|{Layout|Layout|0|0|}347|353|}
{2010212001|XXGvertex_oport_oport|589|0|942|0|{0|out|}353|354|}
{2010213001|XXGoport_dst_flow|590|0|944|0|{0|}354|283|}
{2010212001|XXGvertex_oport_oport|591|0|945|0|{1|filereject|}353|355|}
{2010212001|XXGvertex_oport_oport|592|0|947|0|{2|fileerror|}353|356|}
{2010212001|XXGvertex_oport_oport|593|0|949|0|{3|reject|}353|357|}
{2010212001|XXGvertex_oport_oport|594|0|951|0|{4|error|}353|358|}
{2010212001|XXGvertex_oport_oport|595|0|953|0|{5|log|}353|359|}
{2010211001|XXGvertex_iport_iport|596|0|955|0|{0|in|}353|360|}
{2010214001|XXGiport_src_flow|597|0|957|0|{0|}360|282|}
{2010007001|XXGobject_proto_object|598|0|958|0|{}353|361|}
{2010212001|XXGvertex_oport_oport|599|0|960|0|{0|out|}361|362|}
{2010006001|XXGobject_psameas_object|600|0|962|0|{metadata|out_metadata|1|0|}362|361|}
{2010212001|XXGvertex_oport_oport|601|0|963|0|{1|filereject|}361|363|}
{2010006001|XXGobject_psameas_object|602|0|965|0|{metadata|filereject_metadata|1|0|}363|361|}
{2010212001|XXGvertex_oport_oport|603|0|966|0|{2|fileerror|}361|364|}
{2010006001|XXGobject_psameas_object|604|0|968|0|{metadata|fileerror_metadata|1|0|}364|361|}
{2010212001|XXGvertex_oport_oport|605|0|969|0|{3|reject|}361|365|}
{2010006001|XXGobject_psameas_object|606|0|971|0|{metadata|reject_metadata|1|0|}365|361|}
{2010212001|XXGvertex_oport_oport|607|0|972|0|{4|error|}361|366|}
{2010006001|XXGobject_psameas_object|608|0|974|0|{metadata|error_metadata|1|0|}366|361|}
{2010212001|XXGvertex_oport_oport|609|0|975|0|{5|log|}361|367|}
{2010006001|XXGobject_psameas_object|610|0|977|0|{metadata|log_metadata|1|0|}367|361|}
{2010211001|XXGvertex_iport_iport|611|0|978|0|{0|in|}361|368|}
{2010006001|XXGobject_psameas_object|612|0|980|0|{metadata|in_metadata|1|0|}368|361|}
{2010006001|XXGobject_psameas_object|613|0|981|0|{filereject_metadata|out_metadata|0|0|}353|295|}
{2010006001|XXGobject_psameas_object|614|0|982|0|{in_metadata|out_metadata|0|0|}353|295|}
{2010006001|XXGobject_psameas_object|615|0|983|0|{in_metadata|out_metadata|0|0|}347|353|}
{2010006001|XXGobject_psameas_object|616|0|984|0|{out_metadata|out_metadata|0|0|}347|353|}
{2010601001|XXGgraph_vertex_vertex|617|0|985|0|{Dummy_Replicate|}260|369|}
{2010212001|XXGvertex_oport_oport|618|0|987|0|{0|out|}369|370|}
{2010213001|XXGoport_dst_flow|619|0|989|0|{0|}370|282|}
{2010213001|XXGoport_dst_flow|620|0|990|0|{1|}370|281|}
{2010213001|XXGoport_dst_flow|621|0|991|0|{2|}370|280|}
{2010211001|XXGvertex_iport_iport|622|0|992|0|{0|in|}369|371|}
{2010214001|XXGiport_src_flow|623|0|994|0|{0|}371|277|}
{2010007001|XXGobject_proto_object|624|0|995|0|{}369|372|}
{2010212001|XXGvertex_oport_oport|625|0|997|0|{0|out|}372|373|}
{2010006001|XXGobject_psameas_object|626|0|999|0|{metadata|out_metadata|1|0|}373|372|}
{2010211001|XXGvertex_iport_iport|627|0|1000|0|{0|in|}372|374|}
{2010006001|XXGobject_psameas_object|628|0|1002|0|{metadata|in_metadata|1|0|}374|372|}
{2010006001|XXGobject_psameas_object|629|0|1003|0|{Layout|Layout|0|0|}369|295|}
{2010006001|XXGobject_psameas_object|630|0|1004|0|{in_metadata|out_metadata|0|0|}369|295|}
{2010006001|XXGobject_psameas_object|631|0|1005|0|{out_metadata|out_metadata|0|0|}369|295|}
{2010601001|XXGgraph_vertex_vertex|632|0|1006|0|{Input_File|}260|375|}
{2010212001|XXGvertex_oport_oport|633|0|1008|0|{0|read|}375|376|}
{2010213001|XXGoport_dst_flow|634|0|1010|0|{0|}376|279|}
{2010007001|XXGobject_proto_object|635|0|1011|0|{}375|377|}
{2010212001|XXGvertex_oport_oport|636|0|1013|0|{0|read|}377|378|}
{2010006001|XXGobject_psameas_object|637|0|1015|0|{metadata|read_metadata|1|0|}378|377|}
{2010601001|XXGgraph_vertex_vertex|638|0|1016|0|{List_Files|}260|295|}
{2010601001|XXGgraph_vertex_vertex|639|0|1017|0|{Log_the_List_of_Files|}260|379|}
{2010604001|XXGgraph_flow_flow|640|0|1019|0|{Flow_11|}379|380|}
{2010601001|XXGgraph_vertex_vertex|641|0|1021|0|{Build_Full_Path|}379|381|}
{2010212001|XXGvertex_oport_oport|642|0|1023|0|{0|out0|}381|382|}
{2010213001|XXGoport_dst_flow|643|0|1025|0|{0|}382|380|}
{2010212001|XXGvertex_oport_oport|644|0|1026|0|{1|reject0|}381|383|}
{2010212001|XXGvertex_oport_oport|645|0|1028|0|{2|error0|}381|384|}
{2010212001|XXGvertex_oport_oport|646|0|1030|0|{3|log|}381|385|}
{2010211001|XXGvertex_iport_iport|647|0|1032|0|{0|in|}381|386|}
{2010007001|XXGobject_proto_object|648|0|1034|0|{}381|387|}
{2010212001|XXGvertex_oport_oport|649|0|1036|0|{0|out0|}387|388|}
{2010006001|XXGobject_psameas_object|650|0|1038|0|{metadata|out0_metadata|1|0|}388|387|}
{2010006001|XXGobject_psameas_object|651|0|1039|0|{transform0|transform0|1|0|}388|387|}
{2010212001|XXGvertex_oport_oport|652|0|1040|0|{1|reject0|}387|389|}
{2010006001|XXGobject_psameas_object|653|0|1042|0|{metadata|reject0_metadata|1|0|}389|387|}
{2010212001|XXGvertex_oport_oport|654|0|1043|0|{2|error0|}387|390|}
{2010006001|XXGobject_psameas_object|655|0|1045|0|{metadata|error0_metadata|1|0|}390|387|}
{2010212001|XXGvertex_oport_oport|656|0|1046|0|{3|log|}387|391|}
{2010006001|XXGobject_psameas_object|657|0|1048|0|{metadata|log_metadata|1|0|}391|387|}
{2010211001|XXGvertex_iport_iport|658|0|1049|0|{0|in|}387|392|}
{2010006001|XXGobject_psameas_object|659|0|1051|0|{metadata|in_metadata|1|0|}392|387|}
{2010006001|XXGobject_psameas_object|660|0|1052|0|{Layout|Layout|0|0|}381|393|}
{2010211001|XXGvertex_iport_iport|661|0|1054|0|{0|write|}393|394|}
{2010214001|XXGiport_src_flow|662|0|1056|0|{0|}394|380|}
{2010007001|XXGobject_proto_object|663|0|1057|0|{}393|395|}
{2010211001|XXGvertex_iport_iport|664|0|1059|0|{0|write|}395|396|}
{2010006001|XXGobject_psameas_object|665|0|1061|0|{metadata|write_metadata|1|0|}396|395|}
{2010006001|XXGobject_psameas_object|666|0|1062|0|{write_metadata|out_metadata|0|0|}393|295|}
{2010006001|XXGobject_psameas_object|667|0|1063|0|{in_metadata|out_metadata|0|0|}381|295|}
{2010006001|XXGobject_psameas_object|668|0|1064|0|{out0_metadata|out_metadata|0|0|}381|295|}
{2010006001|XXGobject_psameas_object|669|0|1065|0|{reject0_metadata|out_metadata|0|0|}381|295|}
{2010601001|XXGgraph_vertex_vertex|670|0|1066|0|{File_List|}379|393|}
{2010211001|XXGvertex_iport_iport|671|0|1067|0|{0|in0|}379|397|}
{2010215002|XXGiport_binding_iport|672|0|1069|0|{.5|.5|{0|}2210|}397|386|}
{2010214001|XXGiport_src_flow|673|0|1070|0|{0|}397|280|}
{2010601001|XXGgraph_vertex_vertex|674|0|1071|0|{Read_All_Matching_Files|}260|353|}
{2010601001|XXGgraph_vertex_vertex|675|0|1072|0|{Read_All_Matching_Files_1|}260|398|}
{2010212001|XXGvertex_oport_oport|676|0|1074|0|{0|out|}398|399|}
{2010213001|XXGoport_dst_flow|677|0|1076|0|{0|}399|284|}
{2010212001|XXGvertex_oport_oport|678|0|1077|0|{1|filereject|}398|400|}
{2010212001|XXGvertex_oport_oport|679|0|1079|0|{2|fileerror|}398|401|}
{2010212001|XXGvertex_oport_oport|680|0|1081|0|{3|reject|}398|402|}
{2010212001|XXGvertex_oport_oport|681|0|1083|0|{4|error|}398|403|}
{2010212001|XXGvertex_oport_oport|682|0|1085|0|{5|log|}398|404|}
{2010211001|XXGvertex_iport_iport|683|0|1087|0|{0|in|}398|405|}
{2010214001|XXGiport_src_flow|684|0|1089|0|{0|}405|285|}
{2010007001|XXGobject_proto_object|685|0|1090|0|{}398|406|}
{2010212001|XXGvertex_oport_oport|686|0|1092|0|{0|out|}406|407|}
{2010006001|XXGobject_psameas_object|687|0|1094|0|{metadata|out_metadata|1|0|}407|406|}
{2010212001|XXGvertex_oport_oport|688|0|1095|0|{1|filereject|}406|408|}
{2010006001|XXGobject_psameas_object|689|0|1097|0|{metadata|filereject_metadata|1|0|}408|406|}
{2010212001|XXGvertex_oport_oport|690|0|1098|0|{2|fileerror|}406|409|}
{2010006001|XXGobject_psameas_object|691|0|1100|0|{metadata|fileerror_metadata|1|0|}409|406|}
{2010212001|XXGvertex_oport_oport|692|0|1101|0|{3|reject|}406|410|}
{2010006001|XXGobject_psameas_object|693|0|1103|0|{metadata|reject_metadata|1|0|}410|406|}
{2010212001|XXGvertex_oport_oport|694|0|1104|0|{4|error|}406|411|}
{2010006001|XXGobject_psameas_object|695|0|1106|0|{metadata|error_metadata|1|0|}411|406|}
{2010212001|XXGvertex_oport_oport|696|0|1107|0|{5|log|}406|412|}
{2010006001|XXGobject_psameas_object|697|0|1109|0|{metadata|log_metadata|1|0|}412|406|}
{2010211001|XXGvertex_iport_iport|698|0|1110|0|{0|in|}406|413|}
{2010006001|XXGobject_psameas_object|699|0|1112|0|{metadata|in_metadata|1|0|}413|406|}
{2010006001|XXGobject_psameas_object|700|0|1113|0|{filereject_metadata|out_metadata|0|0|}398|295|}
{2010006001|XXGobject_psameas_object|701|0|1114|0|{in_metadata|out_metadata|0|0|}398|295|}
{2010006001|XXGobject_psameas_object|702|0|1115|0|{out_metadata|out_metadata|0|0|}398|353|}
{2010601001|XXGgraph_vertex_vertex|703|0|1116|0|{Read_Errors_MFS|}260|313|}
{2010601001|XXGgraph_vertex_vertex|704|0|1117|0|{Read_Errors_Serial|}260|327|}
{2010601001|XXGgraph_vertex_vertex|705|0|1118|0|{Read_File_s_Log|}260|343|}
{2010601001|XXGgraph_vertex_vertex|706|0|1119|0|{Trash|}260|414|}
{2010211001|XXGvertex_iport_iport|707|0|1121|0|{0|in|}414|415|}
{2010214001|XXGiport_src_flow|708|0|1123|0|{0|}415|279|}
{2010007001|XXGobject_proto_object|709|0|1124|0|{}414|416|}
{2010211001|XXGvertex_iport_iport|710|0|1126|0|{0|in|}416|417|}
{2010006001|XXGobject_psameas_object|711|0|1128|0|{metadata|in_metadata|1|0|}417|416|}
{2010006001|XXGobject_psameas_object|712|0|1129|0|{Layout|Layout|0|0|}414|375|}
{2010006001|XXGobject_psameas_object|713|0|1130|0|{in_metadata|read_metadata|0|0|}414|375|}
{2010212001|XXGvertex_oport_oport|714|0|1131|0|{0|out0|}260|418|}
{2010216002|XXGoport_binding_oport|715|0|1133|0|{.5|.5|{0|}11973|}418|348|}
{2010213001|XXGoport_dst_flow|716|0|1134|0|{0|}418|23|}
{2010601001|XXGgraph_vertex_vertex|717|0|1135|0|{Read_Single_XLS_File|}1|419|}
{2010601001|XXGgraph_vertex_vertex|718|0|1137|0|{Read_Excel_Spreadsheet|}419|420|}
{2010212001|XXGvertex_oport_oport|719|0|1139|0|{0|out|}420|421|}
{2010007001|XXGobject_proto_object|720|0|1141|0|{}420|422|}
{2010212001|XXGvertex_oport_oport|721|0|1143|0|{0|out|}422|423|}
{2010006001|XXGobject_psameas_object|722|0|1145|0|{metadata|out_metadata|1|0|}423|422|}
{2010212001|XXGvertex_oport_oport|723|0|1146|0|{0|out0|}419|424|}
{2010216002|XXGoport_binding_oport|724|0|1148|0|{.5|.5|{0|}6655|}424|421|}
{2010213001|XXGoport_dst_flow|725|0|1149|0|{0|}424|27|}
{2010601001|XXGgraph_vertex_vertex|726|0|1150|0|{Replicate|}1|425|}
{2010212001|XXGvertex_oport_oport|727|0|1152|0|{0|out|}425|426|}
{2010213001|XXGoport_dst_flow|728|0|1154|0|{0|}426|31|}
{2010213001|XXGoport_dst_flow|729|0|1155|0|{1|}426|39|}
{2010211001|XXGvertex_iport_iport|730|0|1156|0|{0|in|}425|427|}
{2010214001|XXGiport_src_flow|731|0|1158|0|{0|}427|38|}
{2010007001|XXGobject_proto_object|732|0|1159|0|{}425|428|}
{2010212001|XXGvertex_oport_oport|733|0|1161|0|{0|out|}428|429|}
{2010006001|XXGobject_psameas_object|734|0|1163|0|{metadata|out_metadata|1|0|}429|428|}
{2010211001|XXGvertex_iport_iport|735|0|1164|0|{0|in|}428|430|}
{2010006001|XXGobject_psameas_object|736|0|1166|0|{metadata|in_metadata|1|0|}430|428|}
{2010006001|XXGobject_psameas_object|737|0|1167|0|{Layout|Layout|0|0|}425|431|}
{2010212001|XXGvertex_oport_oport|738|0|1169|0|{0|out|}431|432|}
{2010213001|XXGoport_dst_flow|739|0|1171|0|{0|}432|433|}
{2010213001|XXGoport_dst_flow|740|0|1173|0|{1|}432|434|}
{2010213001|XXGoport_dst_flow|741|0|1175|0|{2|}432|435|}
{2010213001|XXGoport_dst_flow|742|0|1177|0|{3|}432|436|}
{2010213001|XXGoport_dst_flow|743|0|1179|0|{4|}432|437|}
{2010213001|XXGoport_dst_flow|744|0|1181|0|{5|}432|438|}
{2010213001|XXGoport_dst_flow|745|0|1183|0|{6|}432|439|}
{2010211001|XXGvertex_iport_iport|746|0|1185|0|{0|in|}431|440|}
{2010007001|XXGobject_proto_object|747|0|1187|0|{}431|441|}
{2010212001|XXGvertex_oport_oport|748|0|1189|0|{0|out|}441|442|}
{2010006001|XXGobject_psameas_object|749|0|1191|0|{metadata|out_metadata|1|0|}442|441|}
{2010211001|XXGvertex_iport_iport|750|0|1192|0|{0|in|}441|443|}
{2010006001|XXGobject_psameas_object|751|0|1194|0|{metadata|in_metadata|1|0|}443|441|}
{2010006001|XXGobject_psameas_object|752|0|1195|0|{in_metadata|out0_metadata|0|0|}431|55|}
{2010006001|XXGobject_psameas_object|753|0|1196|0|{out_metadata|out0_metadata|0|0|}431|55|}
{2010006001|XXGobject_psameas_object|754|0|1197|0|{in_metadata|out0_metadata|0|0|}425|55|}
{2010006001|XXGobject_psameas_object|755|0|1198|0|{out_metadata|out0_metadata|0|0|}425|55|}
{2010601001|XXGgraph_vertex_vertex|756|0|1199|0|{Switch_from_Serial_to_MFS|}1|444|}
{2010212001|XXGvertex_oport_oport|757|0|1201|0|{0|out|}444|445|}
{2010213001|XXGoport_dst_flow|758|0|1203|0|{0|}445|35|}
{2010211001|XXGvertex_iport_iport|759|0|1204|0|{0|in|}444|446|}
{2010214001|XXGiport_src_flow|760|0|1206|0|{0|}446|23|}
{2010214001|XXGiport_src_flow|761|0|1207|0|{1|}446|27|}
{2010214001|XXGiport_src_flow|762|0|1208|0|{2|}446|32|}
{2010007001|XXGobject_proto_object|763|0|1209|0|{}444|447|}
{2010212001|XXGvertex_oport_oport|764|0|1211|0|{0|out|}447|448|}
{2010006001|XXGobject_psameas_object|765|0|1213|0|{metadata|out_metadata|1|0|}448|447|}
{2010211001|XXGvertex_iport_iport|766|0|1214|0|{0|in|}447|449|}
{2010006001|XXGobject_psameas_object|767|0|1216|0|{metadata|in_metadata|1|0|}449|447|}
{2010006001|XXGobject_psameas_object|768|0|1217|0|{Layout|Layout|0|0|}444|420|}
{2010006001|XXGobject_psameas_object|769|0|1218|0|{out_metadata|in_metadata|0|0|}444|67|}
{2010601001|XXGgraph_vertex_vertex|770|0|1219|0|{Update_Watermark|}1|450|}
{2010604001|XXGgraph_flow_flow|771|0|1221|0|{Flow_3|}450|451|}
{2010601001|XXGgraph_vertex_vertex|772|0|1223|0|{CRT_Update_Watermark_File|}450|452|}
{2010212001|XXGvertex_oport_oport|773|0|1225|0|{0|out|}452|453|}
{2010213001|XXGoport_dst_flow|774|0|1227|0|{0|}453|451|}
{2010212001|XXGvertex_oport_oport|775|0|1228|0|{1|error|}452|454|}
{2010212001|XXGvertex_oport_oport|776|0|1230|0|{2|log|}452|455|}
{2010007001|XXGobject_proto_object|777|0|1232|0|{}452|456|}
{2010212001|XXGvertex_oport_oport|778|0|1234|0|{0|out|}456|457|}
{2010006001|XXGobject_psameas_object|779|0|1236|0|{metadata|out_metadata|1|0|}457|456|}
{2010212001|XXGvertex_oport_oport|780|0|1237|0|{1|error|}456|458|}
{2010006001|XXGobject_psameas_object|781|0|1239|0|{metadata|error_metadata|1|0|}458|456|}
{2010212001|XXGvertex_oport_oport|782|0|1240|0|{2|log|}456|459|}
{2010006001|XXGobject_psameas_object|783|0|1242|0|{metadata|log_metadata|1|0|}459|456|}
{2010006001|XXGobject_psameas_object|784|0|1243|0|{Layout|Layout|0|0|}452|460|}
{2010211001|XXGvertex_iport_iport|785|0|1245|0|{0|write|}460|461|}
{2010214001|XXGiport_src_flow|786|0|1247|0|{0|}461|451|}
{2010007001|XXGobject_proto_object|787|0|1248|0|{}460|462|}
{2010211001|XXGvertex_iport_iport|788|0|1250|0|{0|write|}462|463|}
{2010006001|XXGobject_psameas_object|789|0|1252|0|{metadata|write_metadata|1|0|}463|462|}
{2010006001|XXGobject_psameas_object|790|0|1253|0|{write_metadata|out_metadata|0|0|}460|452|}
{2010601001|XXGgraph_vertex_vertex|791|0|1254|0|{Output_File|}450|460|}
{2010601001|XXGgraph_vertex_vertex|792|0|1255|0|{Version_Log|}1|464|}
{2010605001|XXGgraph_legend_legend|793|0|1257|0|{0|}464|465|}
{2010241001|XXGlegend_face_face|794|0|1259|0|{}465|466|}
{2010601001|XXGgraph_vertex_vertex|795|0|1261|0|{Write_Output_File|}1|467|}
{2010605001|XXGgraph_legend_legend|796|0|1263|0|{0|}467|468|}
{2010241001|XXGlegend_face_face|797|0|1265|0|{}468|469|}
{2010605001|XXGgraph_legend_legend|798|0|1267|0|{1|}467|470|}
{2010241001|XXGlegend_face_face|799|0|1269|0|{}470|471|}
{2010605001|XXGgraph_legend_legend|800|0|1271|0|{2|}467|472|}
{2010241001|XXGlegend_face_face|801|0|1273|0|{}472|473|}
{2010605001|XXGgraph_legend_legend|802|0|1275|0|{3|}467|474|}
{2010241001|XXGlegend_face_face|803|0|1277|0|{}474|475|}
{2010605001|XXGgraph_legend_legend|804|0|1279|0|{4|}467|476|}
{2010241001|XXGlegend_face_face|805|0|1281|0|{}476|477|}
{2010604001|XXGgraph_flow_flow|806|0|1283|0|{Flow_1|}467|439|}
{2010604001|XXGgraph_flow_flow|807|0|1284|0|{Flow_2|}467|478|}
{2010604001|XXGgraph_flow_flow|808|0|1286|0|{Flow_20|}467|479|}
{2010604001|XXGgraph_flow_flow|809|0|1288|0|{Flow_21|}467|480|}
{2010604001|XXGgraph_flow_flow|810|0|1290|0|{Flow_22|}467|434|}
{2010604001|XXGgraph_flow_flow|811|0|1291|0|{Flow_3|}467|435|}
{2010604001|XXGgraph_flow_flow|812|0|1292|0|{Flow_4|}467|436|}
{2010604001|XXGgraph_flow_flow|813|0|1293|0|{Flow_5|}467|437|}
{2010604001|XXGgraph_flow_flow|814|0|1294|0|{Flow_6|}467|438|}
{2010604001|XXGgraph_flow_flow|815|0|1295|0|{Flow_8|}467|433|}
{2010601001|XXGgraph_vertex_vertex|816|0|1296|0|{Deflate|}467|481|}
{2010212001|XXGvertex_oport_oport|817|0|1298|0|{0|out|}481|482|}
{2010213001|XXGoport_dst_flow|818|0|1300|0|{0|}482|478|}
{2010211001|XXGvertex_iport_iport|819|0|1301|0|{0|in|}481|483|}
{2010214001|XXGiport_src_flow|820|0|1303|0|{0|}483|436|}
{2010007001|XXGobject_proto_object|821|0|1304|0|{}481|484|}
{2010212001|XXGvertex_oport_oport|822|0|1306|0|{0|out|}484|485|}
{2010006001|XXGobject_psameas_object|823|0|1308|0|{metadata|out_metadata|1|0|}485|484|}
{2010211001|XXGvertex_iport_iport|824|0|1309|0|{0|in|}484|486|}
{2010006001|XXGobject_psameas_object|825|0|1311|0|{metadata|in_metadata|1|0|}486|484|}
{2010006001|XXGobject_psameas_object|826|0|1312|0|{Layout|Layout|0|0|}481|487|}
{2010211001|XXGvertex_iport_iport|827|0|1314|0|{0|write|}487|488|}
{2010214001|XXGiport_src_flow|828|0|1316|0|{0|}488|478|}
{2010007001|XXGobject_proto_object|829|0|1317|0|{}487|489|}
{2010211001|XXGvertex_iport_iport|830|0|1319|0|{0|write|}489|490|}
{2010006001|XXGobject_psameas_object|831|0|1321|0|{metadata|write_metadata|1|0|}490|489|}
{2010006001|XXGobject_psameas_object|832|0|1322|0|{write_metadata|out0_metadata|0|0|}487|55|}
{2010006001|XXGobject_psameas_object|833|0|1323|0|{in_metadata|out0_metadata|0|0|}481|55|}
{2010006001|XXGobject_psameas_object|834|0|1324|0|{out_metadata|out0_metadata|0|0|}481|55|}
{2010601001|XXGgraph_vertex_vertex|835|0|1325|0|{Dummy_Replicate|}467|431|}
{2010601001|XXGgraph_vertex_vertex|836|0|1326|0|{ICFF_Output|}467|491|}
{2010604001|XXGgraph_flow_flow|837|0|1328|0|{Flow_1|}491|492|}
{2010604001|XXGgraph_flow_flow|838|0|1330|0|{Flow_10|}491|493|}
{2010604001|XXGgraph_flow_flow|839|0|1332|0|{Flow_8|}491|494|}
{2010601001|XXGgraph_vertex_vertex|840|0|1334|0|{ICFF_Data|}491|495|}
{2010212001|XXGvertex_oport_oport|841|0|1336|0|{0|read|}495|496|}
{2010213001|XXGoport_dst_flow|842|0|1338|0|{0|}496|492|}
{2010211001|XXGvertex_iport_iport|843|0|1339|0|{0|write|}495|497|}
{2010214001|XXGiport_src_flow|844|0|1341|0|{0|}497|494|}
{2010007001|XXGobject_proto_object|845|0|1342|0|{}495|498|}
{2010212001|XXGvertex_oport_oport|846|0|1344|0|{0|read|}498|499|}
{2010006001|XXGobject_psameas_object|847|0|1346|0|{metadata|read_metadata|1|0|}499|498|}
{2010211001|XXGvertex_iport_iport|848|0|1347|0|{0|write|}498|500|}
{2010006001|XXGobject_psameas_object|849|0|1349|0|{metadata|write_metadata|1|0|}500|498|}
{2010006001|XXGobject_psameas_object|850|0|1350|0|{read_metadata|out0_metadata|0|0|}495|55|}
{2010006001|XXGobject_psameas_object|851|0|1351|0|{write_metadata|out0_metadata|0|0|}495|55|}
{2010601001|XXGgraph_vertex_vertex|852|0|1352|0|{ICFF_Index|}491|501|}
{2010211001|XXGvertex_iport_iport|853|0|1354|0|{0|write|}501|502|}
{2010214001|XXGiport_src_flow|854|0|1356|0|{0|}502|493|}
{2010007001|XXGobject_proto_object|855|0|1357|0|{}501|503|}
{2010211001|XXGvertex_iport_iport|856|0|1359|0|{0|write|}503|504|}
{2010006001|XXGobject_psameas_object|857|0|1361|0|{metadata|write_metadata|1|0|}504|503|}
{2010006001|XXGobject_psameas_object|858|0|1362|0|{write_metadata|index_metadata|0|0|}501|505|}
{2010212001|XXGvertex_oport_oport|859|0|1364|0|{0|out|}505|506|}
{2010213001|XXGoport_dst_flow|860|0|1366|0|{0|}506|494|}
{2010212001|XXGvertex_oport_oport|861|0|1367|0|{1|index|}505|507|}
{2010213001|XXGoport_dst_flow|862|0|1369|0|{0|}507|493|}
{2010212001|XXGvertex_oport_oport|863|0|1370|0|{2|address|}505|508|}
{2010211001|XXGvertex_iport_iport|864|0|1372|0|{0|in|}505|509|}
{2010007001|XXGobject_proto_object|865|0|1374|0|{}505|510|}
{2010212001|XXGvertex_oport_oport|866|0|1376|0|{0|out|}510|511|}
{2010006001|XXGobject_psameas_object|867|0|1378|0|{metadata|out_metadata|1|0|}511|510|}
{2010212001|XXGvertex_oport_oport|868|0|1379|0|{1|index|}510|512|}
{2010006001|XXGobject_psameas_object|869|0|1381|0|{metadata|index_metadata|1|0|}512|510|}
{2010212001|XXGvertex_oport_oport|870|0|1382|0|{2|address|}510|513|}
{2010006001|XXGobject_psameas_object|871|0|1384|0|{metadata|address_metadata|1|0|}513|510|}
{2010211001|XXGvertex_iport_iport|872|0|1385|0|{0|in|}510|514|}
{2010006001|XXGobject_psameas_object|873|0|1387|0|{metadata|in_metadata|1|0|}514|510|}
{2010006001|XXGobject_psameas_object|874|0|1388|0|{Layout|Layout|0|0|}505|495|}
{2010006001|XXGobject_psameas_object|875|0|1389|0|{in_metadata|out0_metadata|0|0|}505|55|}
{2010006001|XXGobject_psameas_object|876|0|1390|0|{out_metadata|out0_metadata|0|0|}505|55|}
{2010601001|XXGgraph_vertex_vertex|877|0|1391|0|{To_Enable_View_Data|}491|515|}
{2010211001|XXGvertex_iport_iport|878|0|1393|0|{0|in|}515|516|}
{2010214001|XXGiport_src_flow|879|0|1395|0|{0|}516|492|}
{2010007001|XXGobject_proto_object|880|0|1396|0|{}515|517|}
{2010211001|XXGvertex_iport_iport|881|0|1398|0|{0|in|}517|518|}
{2010006001|XXGobject_psameas_object|882|0|1400|0|{metadata|in_metadata|1|0|}518|517|}
{2010006001|XXGobject_psameas_object|883|0|1401|0|{in_metadata|out0_metadata|0|0|}515|55|}
{2010601001|XXGgraph_vertex_vertex|884|0|1402|0|{Write_Block_Compressed_Lookup|}491|505|}
{2010211001|XXGvertex_iport_iport|885|0|1403|0|{0|in0|}491|519|}
{2010215002|XXGiport_binding_iport|886|0|1405|0|{.5|.5|{0|}10689|}519|509|}
{2010214001|XXGiport_src_flow|887|0|1406|0|{0|}519|433|}
{2010601001|XXGgraph_vertex_vertex|888|0|1407|0|{Optional_Clean|}467|520|}
{2010211001|XXGvertex_iport_iport|889|0|1409|0|{0|write|}520|521|}
{2010214001|XXGiport_src_flow|890|0|1411|0|{0|}521|435|}
{2010007001|XXGobject_proto_object|891|0|1412|0|{}520|522|}
{2010211001|XXGvertex_iport_iport|892|0|1414|0|{0|write|}522|523|}
{2010006001|XXGobject_psameas_object|893|0|1416|0|{metadata|write_metadata|1|0|}523|522|}
{2010006001|XXGobject_psameas_object|894|0|1417|0|{write_metadata|out0_metadata|0|0|}520|55|}
{2010601001|XXGgraph_vertex_vertex|895|0|1418|0|{Optional_Lookup_Data_File|}467|524|}
{2010211001|XXGvertex_iport_iport|896|0|1420|0|{0|write|}524|525|}
{2010214001|XXGiport_src_flow|897|0|1422|0|{0|}525|479|}
{2010007001|XXGobject_proto_object|898|0|1423|0|{}524|526|}
{2010211001|XXGvertex_iport_iport|899|0|1425|0|{0|write|}526|527|}
{2010006001|XXGobject_psameas_object|900|0|1427|0|{metadata|write_metadata|1|0|}527|526|}
{2010006001|XXGobject_psameas_object|901|0|1428|0|{write_metadata|out0_metadata|0|0|}524|55|}
{2010601001|XXGgraph_vertex_vertex|902|0|1429|0|{Optional_Lookup_Idx_file|}467|528|}
{2010211001|XXGvertex_iport_iport|903|0|1431|0|{0|write|}528|529|}
{2010214001|XXGiport_src_flow|904|0|1433|0|{0|}529|480|}
{2010007001|XXGobject_proto_object|905|0|1434|0|{}528|530|}
{2010211001|XXGvertex_iport_iport|906|0|1436|0|{0|write|}530|531|}
{2010006001|XXGobject_psameas_object|907|0|1438|0|{metadata|write_metadata|1|0|}531|530|}
{2010601001|XXGgraph_vertex_vertex|908|0|1439|0|{Optional_Other|}467|532|}
{2010211001|XXGvertex_iport_iport|909|0|1441|0|{0|write|}532|533|}
{2010214001|XXGiport_src_flow|910|0|1443|0|{0|}533|437|}
{2010007001|XXGobject_proto_object|911|0|1444|0|{}532|534|}
{2010211001|XXGvertex_iport_iport|912|0|1446|0|{0|write|}534|535|}
{2010006001|XXGobject_psameas_object|913|0|1448|0|{metadata|write_metadata|1|0|}535|534|}
{2010006001|XXGobject_psameas_object|914|0|1449|0|{write_metadata|out0_metadata|0|0|}532|55|}
{2010601001|XXGgraph_vertex_vertex|915|0|1450|0|{Optional_Other_Serial_|}467|536|}
{2010211001|XXGvertex_iport_iport|916|0|1452|0|{0|write|}536|537|}
{2010214001|XXGiport_src_flow|917|0|1454|0|{0|}537|438|}
{2010007001|XXGobject_proto_object|918|0|1455|0|{}536|538|}
{2010211001|XXGvertex_iport_iport|919|0|1457|0|{0|write|}538|539|}
{2010006001|XXGobject_psameas_object|920|0|1459|0|{metadata|write_metadata|1|0|}539|538|}
{2010006001|XXGobject_psameas_object|921|0|1460|0|{write_metadata|out0_metadata|0|0|}536|55|}
{2010601001|XXGgraph_vertex_vertex|922|0|1461|0|{Optional_Source|}467|540|}
{2010211001|XXGvertex_iport_iport|923|0|1463|0|{0|write|}540|541|}
{2010214001|XXGiport_src_flow|924|0|1465|0|{0|}541|434|}
{2010007001|XXGobject_proto_object|925|0|1466|0|{}540|542|}
{2010211001|XXGvertex_iport_iport|926|0|1468|0|{0|write|}542|543|}
{2010006001|XXGobject_psameas_object|927|0|1470|0|{metadata|write_metadata|1|0|}543|542|}
{2010006001|XXGobject_psameas_object|928|0|1471|0|{write_metadata|out0_metadata|0|0|}540|55|}
{2010601001|XXGgraph_vertex_vertex|929|0|1472|0|{Optional_Split|}467|487|}
{2010601001|XXGgraph_vertex_vertex|930|0|1473|0|{Serial_LookUp_File_for_MAP|}467|544|}
{2010605001|XXGgraph_legend_legend|931|0|1475|0|{0|}544|545|}
{2010241001|XXGlegend_face_face|932|0|1477|0|{}545|546|}
{2010605001|XXGgraph_legend_legend|933|0|1479|0|{1|}544|547|}
{2010241001|XXGlegend_face_face|934|0|1481|0|{}547|548|}
{2010605001|XXGgraph_legend_legend|935|0|1483|0|{2|}544|549|}
{2010241001|XXGlegend_face_face|936|0|1485|0|{}549|550|}
{2010604001|XXGgraph_flow_flow|937|0|1487|0|{Flow_1|}544|551|}
{2010604001|XXGgraph_flow_flow|938|0|1489|0|{Flow_3|}544|552|}
{2010604001|XXGgraph_flow_flow|939|0|1491|0|{Flow_4|}544|553|}
{2010604001|XXGgraph_flow_flow|940|0|1493|0|{Flow_5|}544|554|}
{2010604001|XXGgraph_flow_flow|941|0|1495|0|{Flow_6|}544|555|}
{2010601001|XXGgraph_vertex_vertex|942|0|1497|0|{Dummy_Replicate|}544|556|}
{2010212001|XXGvertex_oport_oport|943|0|1499|0|{0|out|}556|557|}
{2010213001|XXGoport_dst_flow|944|0|1501|0|{0|}557|551|}
{2010213001|XXGoport_dst_flow|945|0|1502|0|{1|}557|552|}
{2010211001|XXGvertex_iport_iport|946|0|1503|0|{0|in|}556|558|}
{2010007001|XXGobject_proto_object|947|0|1505|0|{}556|559|}
{2010212001|XXGvertex_oport_oport|948|0|1507|0|{0|out|}559|560|}
{2010006001|XXGobject_psameas_object|949|0|1509|0|{metadata|out_metadata|1|0|}560|559|}
{2010211001|XXGvertex_iport_iport|950|0|1510|0|{0|in|}559|561|}
{2010006001|XXGobject_psameas_object|951|0|1512|0|{metadata|in_metadata|1|0|}561|559|}
{2010006001|XXGobject_psameas_object|952|0|1513|0|{Layout|Layout|0|0|}556|431|}
{2010006001|XXGobject_psameas_object|953|0|1514|0|{in_metadata|out0_metadata|0|0|}556|55|}
{2010006001|XXGobject_psameas_object|954|0|1515|0|{out_metadata|out0_metadata|0|0|}556|55|}
{2010601001|XXGgraph_vertex_vertex|955|0|1516|0|{Dummy_Replicate_to_Maintain_flow|}544|562|}
{2010212001|XXGvertex_oport_oport|956|0|1518|0|{0|out|}562|563|}
{2010211001|XXGvertex_iport_iport|957|0|1520|0|{0|in|}562|564|}
{2010214001|XXGiport_src_flow|958|0|1522|0|{0|}564|553|}
{2010214001|XXGiport_src_flow|959|0|1523|0|{1|}564|555|}
{2010007001|XXGobject_proto_object|960|0|1524|0|{}562|565|}
{2010212001|XXGvertex_oport_oport|961|0|1526|0|{0|out|}565|566|}
{2010006001|XXGobject_psameas_object|962|0|1528|0|{metadata|out_metadata|1|0|}566|565|}
{2010211001|XXGvertex_iport_iport|963|0|1529|0|{0|in|}565|567|}
{2010006001|XXGobject_psameas_object|964|0|1531|0|{metadata|in_metadata|1|0|}567|565|}
{2010006001|XXGobject_psameas_object|965|0|1532|0|{Layout|Layout|0|0|}562|524|}
{2010006001|XXGobject_psameas_object|966|0|1533|0|{in_metadata|out0_metadata|0|0|}562|55|}
{2010006001|XXGobject_psameas_object|967|0|1534|0|{out_metadata|out0_metadata|0|0|}562|55|}
{2010601001|XXGgraph_vertex_vertex|968|0|1535|0|{Gather|}544|568|}
{2010212001|XXGvertex_oport_oport|969|0|1537|0|{0|out|}568|569|}
{2010213001|XXGoport_dst_flow|970|0|1539|0|{0|}569|553|}
{2010211001|XXGvertex_iport_iport|971|0|1540|0|{0|in|}568|570|}
{2010214001|XXGiport_src_flow|972|0|1542|0|{0|}570|551|}
{2010007001|XXGobject_proto_object|973|0|1543|0|{}568|571|}
{2010212001|XXGvertex_oport_oport|974|0|1545|0|{0|out|}571|572|}
{2010006001|XXGobject_psameas_object|975|0|1547|0|{metadata|out_metadata|1|0|}572|571|}
{2010211001|XXGvertex_iport_iport|976|0|1548|0|{0|in|}571|573|}
{2010006001|XXGobject_psameas_object|977|0|1550|0|{metadata|in_metadata|1|0|}573|571|}
{2010006001|XXGobject_psameas_object|978|0|1551|0|{Layout|Layout|0|0|}568|524|}
{2010006001|XXGobject_psameas_object|979|0|1552|0|{in_metadata|out0_metadata|0|0|}568|55|}
{2010006001|XXGobject_psameas_object|980|0|1553|0|{out_metadata|out0_metadata|0|0|}568|55|}
{2010601001|XXGgraph_vertex_vertex|981|0|1554|0|{Merge|}544|574|}
{2010212001|XXGvertex_oport_oport|982|0|1556|0|{0|out|}574|575|}
{2010213001|XXGoport_dst_flow|983|0|1558|0|{0|}575|554|}
{2010211001|XXGvertex_iport_iport|984|0|1559|0|{0|in|}574|576|}
{2010214001|XXGiport_src_flow|985|0|1561|0|{0|}576|552|}
{2010007001|XXGobject_proto_object|986|0|1562|0|{}574|577|}
{2010212001|XXGvertex_oport_oport|987|0|1564|0|{0|out|}577|578|}
{2010006001|XXGobject_psameas_object|988|0|1566|0|{metadata|out_metadata|1|0|}578|577|}
{2010211001|XXGvertex_iport_iport|989|0|1567|0|{0|in|}577|579|}
{2010006001|XXGobject_psameas_object|990|0|1569|0|{metadata|in_metadata|1|0|}579|577|}
{2010006001|XXGobject_psameas_object|991|0|1570|0|{Layout|Layout|0|0|}574|524|}
{2010006001|XXGobject_psameas_object|992|0|1571|0|{in_metadata|out0_metadata|0|0|}574|55|}
{2010006001|XXGobject_psameas_object|993|0|1572|0|{out_metadata|out0_metadata|0|0|}574|55|}
{2010601001|XXGgraph_vertex_vertex|994|0|1573|0|{Write_Lookup|}544|580|}
{2010212001|XXGvertex_oport_oport|995|0|1575|0|{0|out|}580|581|}
{2010213001|XXGoport_dst_flow|996|0|1577|0|{0|}581|555|}
{2010212001|XXGvertex_oport_oport|997|0|1578|0|{1|index0|}580|582|}
{2010211001|XXGvertex_iport_iport|998|0|1580|0|{0|in|}580|583|}
{2010214001|XXGiport_src_flow|999|0|1582|0|{0|}583|554|}
{2010007001|XXGobject_proto_object|1000|0|1583|0|{}580|584|}
{2010212001|XXGvertex_oport_oport|1001|0|1585|0|{0|out|}584|585|}
{2010006001|XXGobject_psameas_object|1002|0|1587|0|{metadata|out_metadata|1|0|}585|584|}
{2010212001|XXGvertex_oport_oport|1003|0|1588|0|{1|index0|}584|586|}
{2010006001|XXGobject_psameas_object|1004|0|1590|0|{key0|key0|1|0|}586|584|}
{2010006001|XXGobject_psameas_object|1005|0|1591|0|{metadata|index0_metadata|1|0|}586|584|}
{2010211001|XXGvertex_iport_iport|1006|0|1592|0|{0|in|}584|587|}
{2010006001|XXGobject_psameas_object|1007|0|1594|0|{metadata|in_metadata|1|0|}587|584|}
{2010006001|XXGobject_psameas_object|1008|0|1595|0|{Layout|Layout|0|0|}580|524|}
{2010006001|XXGobject_psameas_object|1009|0|1596|0|{in_metadata|out0_metadata|0|0|}580|55|}
{2010006001|XXGobject_psameas_object|1010|0|1597|0|{out_metadata|out0_metadata|0|0|}580|55|}
{2010212001|XXGvertex_oport_oport|1011|0|1598|0|{0|out0|}544|588|}
{2010216002|XXGoport_binding_oport|1012|0|1600|0|{.5|.5|{0|}10700|}588|563|}
{2010213001|XXGoport_dst_flow|1013|0|1601|0|{0|}588|479|}
{2010212001|XXGvertex_oport_oport|1014|0|1602|0|{1|out1|}544|589|}
{2010216002|XXGoport_binding_oport|1015|0|1604|0|{.5|.5|{0|}10701|}589|582|}
{2010213001|XXGoport_dst_flow|1016|0|1605|0|{0|}589|480|}
{2010211001|XXGvertex_iport_iport|1017|0|1606|0|{0|in0|}544|590|}
{2010215002|XXGiport_binding_iport|1018|0|1608|0|{.5|.5|{0|}10699|}590|558|}
{2010214001|XXGiport_src_flow|1019|0|1609|0|{0|}590|439|}
{2010211001|XXGvertex_iport_iport|1020|0|1610|0|{0|in0|}467|591|}
{2010215002|XXGiport_binding_iport|1021|0|1612|0|{.5|.5|{0|}12087|}591|440|}
{2010214001|XXGiport_src_flow|1022|0|1613|0|{0|}591|31|}
{2010601001|XXGgraph_vertex_vertex|1023|0|1614|0|{Write_Output_File_1|}1|592|}
{2010605001|XXGgraph_legend_legend|1024|0|1616|0|{0|}592|593|}
{2010241001|XXGlegend_face_face|1025|0|1618|0|{}593|594|}
{2010605001|XXGgraph_legend_legend|1026|0|1620|0|{1|}592|595|}
{2010241001|XXGlegend_face_face|1027|0|1622|0|{}595|596|}
{2010605001|XXGgraph_legend_legend|1028|0|1624|0|{2|}592|597|}
{2010241001|XXGlegend_face_face|1029|0|1626|0|{}597|598|}
{2010605001|XXGgraph_legend_legend|1030|0|1628|0|{3|}592|599|}
{2010241001|XXGlegend_face_face|1031|0|1630|0|{}599|600|}
{2010605001|XXGgraph_legend_legend|1032|0|1632|0|{4|}592|601|}
{2010241001|XXGlegend_face_face|1033|0|1634|0|{}601|602|}
{2010604001|XXGgraph_flow_flow|1034|0|1636|0|{Flow_1|}592|603|}
{2010604001|XXGgraph_flow_flow|1035|0|1638|0|{Flow_2|}592|604|}
{2010604001|XXGgraph_flow_flow|1036|0|1640|0|{Flow_20|}592|605|}
{2010604001|XXGgraph_flow_flow|1037|0|1642|0|{Flow_21|}592|606|}
{2010604001|XXGgraph_flow_flow|1038|0|1644|0|{Flow_22|}592|607|}
{2010604001|XXGgraph_flow_flow|1039|0|1646|0|{Flow_3|}592|608|}
{2010604001|XXGgraph_flow_flow|1040|0|1648|0|{Flow_4|}592|609|}
{2010604001|XXGgraph_flow_flow|1041|0|1650|0|{Flow_5|}592|610|}
{2010604001|XXGgraph_flow_flow|1042|0|1652|0|{Flow_6|}592|611|}
{2010604001|XXGgraph_flow_flow|1043|0|1654|0|{Flow_8|}592|612|}
{2010601001|XXGgraph_vertex_vertex|1044|0|1656|0|{Deflate|}592|613|}
{2010212001|XXGvertex_oport_oport|1045|0|1658|0|{0|out|}613|614|}
{2010213001|XXGoport_dst_flow|1046|0|1660|0|{0|}614|604|}
{2010211001|XXGvertex_iport_iport|1047|0|1661|0|{0|in|}613|615|}
{2010214001|XXGiport_src_flow|1048|0|1663|0|{0|}615|609|}
{2010007001|XXGobject_proto_object|1049|0|1664|0|{}613|616|}
{2010212001|XXGvertex_oport_oport|1050|0|1666|0|{0|out|}616|617|}
{2010006001|XXGobject_psameas_object|1051|0|1668|0|{metadata|out_metadata|1|0|}617|616|}
{2010211001|XXGvertex_iport_iport|1052|0|1669|0|{0|in|}616|618|}
{2010006001|XXGobject_psameas_object|1053|0|1671|0|{metadata|in_metadata|1|0|}618|616|}
{2010006001|XXGobject_psameas_object|1054|0|1672|0|{Layout|Layout|0|0|}613|619|}
{2010211001|XXGvertex_iport_iport|1055|0|1674|0|{0|write|}619|620|}
{2010214001|XXGiport_src_flow|1056|0|1676|0|{0|}620|604|}
{2010007001|XXGobject_proto_object|1057|0|1677|0|{}619|621|}
{2010211001|XXGvertex_iport_iport|1058|0|1679|0|{0|write|}621|622|}
{2010006001|XXGobject_psameas_object|1059|0|1681|0|{metadata|write_metadata|1|0|}622|621|}
{2010006001|XXGobject_psameas_object|1060|0|1682|0|{write_metadata|out0_metadata|0|0|}619|55|}
{2010006001|XXGobject_psameas_object|1061|0|1683|0|{in_metadata|out0_metadata|0|0|}613|55|}
{2010006001|XXGobject_psameas_object|1062|0|1684|0|{out_metadata|out0_metadata|0|0|}613|55|}
{2010601001|XXGgraph_vertex_vertex|1063|0|1685|0|{Dummy_Replicate|}592|623|}
{2010212001|XXGvertex_oport_oport|1064|0|1687|0|{0|out|}623|624|}
{2010213001|XXGoport_dst_flow|1065|0|1689|0|{0|}624|612|}
{2010213001|XXGoport_dst_flow|1066|0|1690|0|{1|}624|607|}
{2010213001|XXGoport_dst_flow|1067|0|1691|0|{2|}624|608|}
{2010213001|XXGoport_dst_flow|1068|0|1692|0|{3|}624|609|}
{2010213001|XXGoport_dst_flow|1069|0|1693|0|{4|}624|610|}
{2010213001|XXGoport_dst_flow|1070|0|1694|0|{5|}624|611|}
{2010213001|XXGoport_dst_flow|1071|0|1695|0|{6|}624|603|}
{2010211001|XXGvertex_iport_iport|1072|0|1696|0|{0|in|}623|625|}
{2010007001|XXGobject_proto_object|1073|0|1698|0|{}623|626|}
{2010212001|XXGvertex_oport_oport|1074|0|1700|0|{0|out|}626|627|}
{2010006001|XXGobject_psameas_object|1075|0|1702|0|{metadata|out_metadata|1|0|}627|626|}
{2010211001|XXGvertex_iport_iport|1076|0|1703|0|{0|in|}626|628|}
{2010006001|XXGobject_psameas_object|1077|0|1705|0|{metadata|in_metadata|1|0|}628|626|}
{2010006001|XXGobject_psameas_object|1078|0|1706|0|{in_metadata|out0_metadata|0|0|}623|55|}
{2010006001|XXGobject_psameas_object|1079|0|1707|0|{out_metadata|out0_metadata|0|0|}623|55|}
{2010601001|XXGgraph_vertex_vertex|1080|0|1708|0|{ICFF_Output|}592|629|}
{2010604001|XXGgraph_flow_flow|1081|0|1710|0|{Flow_1|}629|630|}
{2010604001|XXGgraph_flow_flow|1082|0|1712|0|{Flow_10|}629|631|}
{2010604001|XXGgraph_flow_flow|1083|0|1714|0|{Flow_8|}629|632|}
{2010601001|XXGgraph_vertex_vertex|1084|0|1716|0|{ICFF_Data|}629|633|}
{2010212001|XXGvertex_oport_oport|1085|0|1718|0|{0|read|}633|634|}
{2010213001|XXGoport_dst_flow|1086|0|1720|0|{0|}634|630|}
{2010211001|XXGvertex_iport_iport|1087|0|1721|0|{0|write|}633|635|}
{2010214001|XXGiport_src_flow|1088|0|1723|0|{0|}635|632|}
{2010007001|XXGobject_proto_object|1089|0|1724|0|{}633|636|}
{2010212001|XXGvertex_oport_oport|1090|0|1726|0|{0|read|}636|637|}
{2010006001|XXGobject_psameas_object|1091|0|1728|0|{metadata|read_metadata|1|0|}637|636|}
{2010211001|XXGvertex_iport_iport|1092|0|1729|0|{0|write|}636|638|}
{2010006001|XXGobject_psameas_object|1093|0|1731|0|{metadata|write_metadata|1|0|}638|636|}
{2010006001|XXGobject_psameas_object|1094|0|1732|0|{read_metadata|out0_metadata|0|0|}633|55|}
{2010006001|XXGobject_psameas_object|1095|0|1733|0|{write_metadata|out0_metadata|0|0|}633|55|}
{2010601001|XXGgraph_vertex_vertex|1096|0|1734|0|{ICFF_Index|}629|639|}
{2010211001|XXGvertex_iport_iport|1097|0|1736|0|{0|write|}639|640|}
{2010214001|XXGiport_src_flow|1098|0|1738|0|{0|}640|631|}
{2010007001|XXGobject_proto_object|1099|0|1739|0|{}639|641|}
{2010211001|XXGvertex_iport_iport|1100|0|1741|0|{0|write|}641|642|}
{2010006001|XXGobject_psameas_object|1101|0|1743|0|{metadata|write_metadata|1|0|}642|641|}
{2010006001|XXGobject_psameas_object|1102|0|1744|0|{write_metadata|index_metadata|0|0|}639|643|}
{2010212001|XXGvertex_oport_oport|1103|0|1746|0|{0|out|}643|644|}
{2010213001|XXGoport_dst_flow|1104|0|1748|0|{0|}644|632|}
{2010212001|XXGvertex_oport_oport|1105|0|1749|0|{1|index|}643|645|}
{2010213001|XXGoport_dst_flow|1106|0|1751|0|{0|}645|631|}
{2010212001|XXGvertex_oport_oport|1107|0|1752|0|{2|address|}643|646|}
{2010211001|XXGvertex_iport_iport|1108|0|1754|0|{0|in|}643|647|}
{2010007001|XXGobject_proto_object|1109|0|1756|0|{}643|648|}
{2010212001|XXGvertex_oport_oport|1110|0|1758|0|{0|out|}648|649|}
{2010006001|XXGobject_psameas_object|1111|0|1760|0|{metadata|out_metadata|1|0|}649|648|}
{2010212001|XXGvertex_oport_oport|1112|0|1761|0|{1|index|}648|650|}
{2010006001|XXGobject_psameas_object|1113|0|1763|0|{metadata|index_metadata|1|0|}650|648|}
{2010212001|XXGvertex_oport_oport|1114|0|1764|0|{2|address|}648|651|}
{2010006001|XXGobject_psameas_object|1115|0|1766|0|{metadata|address_metadata|1|0|}651|648|}
{2010211001|XXGvertex_iport_iport|1116|0|1767|0|{0|in|}648|652|}
{2010006001|XXGobject_psameas_object|1117|0|1769|0|{metadata|in_metadata|1|0|}652|648|}
{2010006001|XXGobject_psameas_object|1118|0|1770|0|{Layout|Layout|0|0|}643|633|}
{2010006001|XXGobject_psameas_object|1119|0|1771|0|{in_metadata|out0_metadata|0|0|}643|55|}
{2010006001|XXGobject_psameas_object|1120|0|1772|0|{out_metadata|out0_metadata|0|0|}643|55|}
{2010601001|XXGgraph_vertex_vertex|1121|0|1773|0|{To_Enable_View_Data|}629|653|}
{2010211001|XXGvertex_iport_iport|1122|0|1775|0|{0|in|}653|654|}
{2010214001|XXGiport_src_flow|1123|0|1777|0|{0|}654|630|}
{2010007001|XXGobject_proto_object|1124|0|1778|0|{}653|655|}
{2010211001|XXGvertex_iport_iport|1125|0|1780|0|{0|in|}655|656|}
{2010006001|XXGobject_psameas_object|1126|0|1782|0|{metadata|in_metadata|1|0|}656|655|}
{2010006001|XXGobject_psameas_object|1127|0|1783|0|{in_metadata|out0_metadata|0|0|}653|55|}
{2010601001|XXGgraph_vertex_vertex|1128|0|1784|0|{Write_Block_Compressed_Lookup|}629|643|}
{2010211001|XXGvertex_iport_iport|1129|0|1785|0|{0|in0|}629|657|}
{2010215002|XXGiport_binding_iport|1130|0|1787|0|{.5|.5|{0|}10689|}657|647|}
{2010214001|XXGiport_src_flow|1131|0|1788|0|{0|}657|612|}
{2010601001|XXGgraph_vertex_vertex|1132|0|1789|0|{Optional_Clean|}592|658|}
{2010211001|XXGvertex_iport_iport|1133|0|1791|0|{0|write|}658|659|}
{2010214001|XXGiport_src_flow|1134|0|1793|0|{0|}659|608|}
{2010007001|XXGobject_proto_object|1135|0|1794|0|{}658|660|}
{2010211001|XXGvertex_iport_iport|1136|0|1796|0|{0|write|}660|661|}
{2010006001|XXGobject_psameas_object|1137|0|1798|0|{metadata|write_metadata|1|0|}661|660|}
{2010006001|XXGobject_psameas_object|1138|0|1799|0|{write_metadata|out0_metadata|0|0|}658|55|}
{2010601001|XXGgraph_vertex_vertex|1139|0|1800|0|{Optional_Lookup_Data_File|}592|662|}
{2010211001|XXGvertex_iport_iport|1140|0|1802|0|{0|write|}662|663|}
{2010214001|XXGiport_src_flow|1141|0|1804|0|{0|}663|605|}
{2010007001|XXGobject_proto_object|1142|0|1805|0|{}662|664|}
{2010211001|XXGvertex_iport_iport|1143|0|1807|0|{0|write|}664|665|}
{2010006001|XXGobject_psameas_object|1144|0|1809|0|{metadata|write_metadata|1|0|}665|664|}
{2010006001|XXGobject_psameas_object|1145|0|1810|0|{write_metadata|out0_metadata|0|0|}662|55|}
{2010601001|XXGgraph_vertex_vertex|1146|0|1811|0|{Optional_Lookup_Idx_file|}592|666|}
{2010211001|XXGvertex_iport_iport|1147|0|1813|0|{0|write|}666|667|}
{2010214001|XXGiport_src_flow|1148|0|1815|0|{0|}667|606|}
{2010007001|XXGobject_proto_object|1149|0|1816|0|{}666|668|}
{2010211001|XXGvertex_iport_iport|1150|0|1818|0|{0|write|}668|669|}
{2010006001|XXGobject_psameas_object|1151|0|1820|0|{metadata|write_metadata|1|0|}669|668|}
{2010601001|XXGgraph_vertex_vertex|1152|0|1821|0|{Optional_Other|}592|670|}
{2010211001|XXGvertex_iport_iport|1153|0|1823|0|{0|write|}670|671|}
{2010214001|XXGiport_src_flow|1154|0|1825|0|{0|}671|610|}
{2010007001|XXGobject_proto_object|1155|0|1826|0|{}670|672|}
{2010211001|XXGvertex_iport_iport|1156|0|1828|0|{0|write|}672|673|}
{2010006001|XXGobject_psameas_object|1157|0|1830|0|{metadata|write_metadata|1|0|}673|672|}
{2010006001|XXGobject_psameas_object|1158|0|1831|0|{write_metadata|out0_metadata|0|0|}670|55|}
{2010601001|XXGgraph_vertex_vertex|1159|0|1832|0|{Optional_Other_Serial_|}592|674|}
{2010211001|XXGvertex_iport_iport|1160|0|1834|0|{0|write|}674|675|}
{2010214001|XXGiport_src_flow|1161|0|1836|0|{0|}675|611|}
{2010007001|XXGobject_proto_object|1162|0|1837|0|{}674|676|}
{2010211001|XXGvertex_iport_iport|1163|0|1839|0|{0|write|}676|677|}
{2010006001|XXGobject_psameas_object|1164|0|1841|0|{metadata|write_metadata|1|0|}677|676|}
{2010006001|XXGobject_psameas_object|1165|0|1842|0|{write_metadata|out0_metadata|0|0|}674|55|}
{2010601001|XXGgraph_vertex_vertex|1166|0|1843|0|{Optional_Source|}592|678|}
{2010211001|XXGvertex_iport_iport|1167|0|1845|0|{0|write|}678|679|}
{2010214001|XXGiport_src_flow|1168|0|1847|0|{0|}679|607|}
{2010007001|XXGobject_proto_object|1169|0|1848|0|{}678|680|}
{2010211001|XXGvertex_iport_iport|1170|0|1850|0|{0|write|}680|681|}
{2010006001|XXGobject_psameas_object|1171|0|1852|0|{metadata|write_metadata|1|0|}681|680|}
{2010006001|XXGobject_psameas_object|1172|0|1853|0|{write_metadata|out0_metadata|0|0|}678|55|}
{2010601001|XXGgraph_vertex_vertex|1173|0|1854|0|{Optional_Split|}592|619|}
{2010601001|XXGgraph_vertex_vertex|1174|0|1855|0|{Serial_LookUp_File_for_MAP|}592|682|}
{2010605001|XXGgraph_legend_legend|1175|0|1857|0|{0|}682|683|}
{2010241001|XXGlegend_face_face|1176|0|1859|0|{}683|684|}
{2010605001|XXGgraph_legend_legend|1177|0|1861|0|{1|}682|685|}
{2010241001|XXGlegend_face_face|1178|0|1863|0|{}685|686|}
{2010605001|XXGgraph_legend_legend|1179|0|1865|0|{2|}682|687|}
{2010241001|XXGlegend_face_face|1180|0|1867|0|{}687|688|}
{2010604001|XXGgraph_flow_flow|1181|0|1869|0|{Flow_1|}682|689|}
{2010604001|XXGgraph_flow_flow|1182|0|1871|0|{Flow_3|}682|690|}
{2010604001|XXGgraph_flow_flow|1183|0|1873|0|{Flow_4|}682|691|}
{2010604001|XXGgraph_flow_flow|1184|0|1875|0|{Flow_5|}682|692|}
{2010604001|XXGgraph_flow_flow|1185|0|1877|0|{Flow_6|}682|693|}
{2010601001|XXGgraph_vertex_vertex|1186|0|1879|0|{Dummy_Replicate|}682|694|}
{2010212001|XXGvertex_oport_oport|1187|0|1881|0|{0|out|}694|695|}
{2010213001|XXGoport_dst_flow|1188|0|1883|0|{0|}695|689|}
{2010213001|XXGoport_dst_flow|1189|0|1884|0|{1|}695|690|}
{2010211001|XXGvertex_iport_iport|1190|0|1885|0|{0|in|}694|696|}
{2010007001|XXGobject_proto_object|1191|0|1887|0|{}694|697|}
{2010212001|XXGvertex_oport_oport|1192|0|1889|0|{0|out|}697|698|}
{2010006001|XXGobject_psameas_object|1193|0|1891|0|{metadata|out_metadata|1|0|}698|697|}
{2010211001|XXGvertex_iport_iport|1194|0|1892|0|{0|in|}697|699|}
{2010006001|XXGobject_psameas_object|1195|0|1894|0|{metadata|in_metadata|1|0|}699|697|}
{2010006001|XXGobject_psameas_object|1196|0|1895|0|{Layout|Layout|0|0|}694|623|}
{2010006001|XXGobject_psameas_object|1197|0|1896|0|{in_metadata|out0_metadata|0|0|}694|55|}
{2010006001|XXGobject_psameas_object|1198|0|1897|0|{out_metadata|out0_metadata|0|0|}694|55|}
{2010601001|XXGgraph_vertex_vertex|1199|0|1898|0|{Dummy_Replicate_to_Maintain_flow|}682|700|}
{2010212001|XXGvertex_oport_oport|1200|0|1900|0|{0|out|}700|701|}
{2010211001|XXGvertex_iport_iport|1201|0|1902|0|{0|in|}700|702|}
{2010214001|XXGiport_src_flow|1202|0|1904|0|{0|}702|691|}
{2010214001|XXGiport_src_flow|1203|0|1905|0|{1|}702|693|}
{2010007001|XXGobject_proto_object|1204|0|1906|0|{}700|703|}
{2010212001|XXGvertex_oport_oport|1205|0|1908|0|{0|out|}703|704|}
{2010006001|XXGobject_psameas_object|1206|0|1910|0|{metadata|out_metadata|1|0|}704|703|}
{2010211001|XXGvertex_iport_iport|1207|0|1911|0|{0|in|}703|705|}
{2010006001|XXGobject_psameas_object|1208|0|1913|0|{metadata|in_metadata|1|0|}705|703|}
{2010006001|XXGobject_psameas_object|1209|0|1914|0|{Layout|Layout|0|0|}700|662|}
{2010006001|XXGobject_psameas_object|1210|0|1915|0|{in_metadata|out0_metadata|0|0|}700|55|}
{2010006001|XXGobject_psameas_object|1211|0|1916|0|{out_metadata|out0_metadata|0|0|}700|55|}
{2010601001|XXGgraph_vertex_vertex|1212|0|1917|0|{Gather|}682|706|}
{2010212001|XXGvertex_oport_oport|1213|0|1919|0|{0|out|}706|707|}
{2010213001|XXGoport_dst_flow|1214|0|1921|0|{0|}707|691|}
{2010211001|XXGvertex_iport_iport|1215|0|1922|0|{0|in|}706|708|}
{2010214001|XXGiport_src_flow|1216|0|1924|0|{0|}708|689|}
{2010007001|XXGobject_proto_object|1217|0|1925|0|{}706|709|}
{2010212001|XXGvertex_oport_oport|1218|0|1927|0|{0|out|}709|710|}
{2010006001|XXGobject_psameas_object|1219|0|1929|0|{metadata|out_metadata|1|0|}710|709|}
{2010211001|XXGvertex_iport_iport|1220|0|1930|0|{0|in|}709|711|}
{2010006001|XXGobject_psameas_object|1221|0|1932|0|{metadata|in_metadata|1|0|}711|709|}
{2010006001|XXGobject_psameas_object|1222|0|1933|0|{Layout|Layout|0|0|}706|662|}
{2010006001|XXGobject_psameas_object|1223|0|1934|0|{in_metadata|out0_metadata|0|0|}706|55|}
{2010006001|XXGobject_psameas_object|1224|0|1935|0|{out_metadata|out0_metadata|0|0|}706|55|}
{2010601001|XXGgraph_vertex_vertex|1225|0|1936|0|{Merge|}682|712|}
{2010212001|XXGvertex_oport_oport|1226|0|1938|0|{0|out|}712|713|}
{2010213001|XXGoport_dst_flow|1227|0|1940|0|{0|}713|692|}
{2010211001|XXGvertex_iport_iport|1228|0|1941|0|{0|in|}712|714|}
{2010214001|XXGiport_src_flow|1229|0|1943|0|{0|}714|690|}
{2010007001|XXGobject_proto_object|1230|0|1944|0|{}712|715|}
{2010212001|XXGvertex_oport_oport|1231|0|1946|0|{0|out|}715|716|}
{2010006001|XXGobject_psameas_object|1232|0|1948|0|{metadata|out_metadata|1|0|}716|715|}
{2010211001|XXGvertex_iport_iport|1233|0|1949|0|{0|in|}715|717|}
{2010006001|XXGobject_psameas_object|1234|0|1951|0|{metadata|in_metadata|1|0|}717|715|}
{2010006001|XXGobject_psameas_object|1235|0|1952|0|{Layout|Layout|0|0|}712|662|}
{2010006001|XXGobject_psameas_object|1236|0|1953|0|{in_metadata|out0_metadata|0|0|}712|55|}
{2010006001|XXGobject_psameas_object|1237|0|1954|0|{out_metadata|out0_metadata|0|0|}712|55|}
{2010601001|XXGgraph_vertex_vertex|1238|0|1955|0|{Write_Lookup|}682|718|}
{2010212001|XXGvertex_oport_oport|1239|0|1957|0|{0|out|}718|719|}
{2010213001|XXGoport_dst_flow|1240|0|1959|0|{0|}719|693|}
{2010212001|XXGvertex_oport_oport|1241|0|1960|0|{1|index0|}718|720|}
{2010211001|XXGvertex_iport_iport|1242|0|1962|0|{0|in|}718|721|}
{2010214001|XXGiport_src_flow|1243|0|1964|0|{0|}721|692|}
{2010007001|XXGobject_proto_object|1244|0|1965|0|{}718|722|}
{2010212001|XXGvertex_oport_oport|1245|0|1967|0|{0|out|}722|723|}
{2010006001|XXGobject_psameas_object|1246|0|1969|0|{metadata|out_metadata|1|0|}723|722|}
{2010212001|XXGvertex_oport_oport|1247|0|1970|0|{1|index0|}722|724|}
{2010006001|XXGobject_psameas_object|1248|0|1972|0|{key0|key0|1|0|}724|722|}
{2010006001|XXGobject_psameas_object|1249|0|1973|0|{metadata|index0_metadata|1|0|}724|722|}
{2010211001|XXGvertex_iport_iport|1250|0|1974|0|{0|in|}722|725|}
{2010006001|XXGobject_psameas_object|1251|0|1976|0|{metadata|in_metadata|1|0|}725|722|}
{2010006001|XXGobject_psameas_object|1252|0|1977|0|{Layout|Layout|0|0|}718|662|}
{2010006001|XXGobject_psameas_object|1253|0|1978|0|{in_metadata|out0_metadata|0|0|}718|55|}
{2010006001|XXGobject_psameas_object|1254|0|1979|0|{out_metadata|out0_metadata|0|0|}718|55|}
{2010212001|XXGvertex_oport_oport|1255|0|1980|0|{0|out0|}682|726|}
{2010216002|XXGoport_binding_oport|1256|0|1982|0|{.5|.5|{0|}10700|}726|701|}
{2010213001|XXGoport_dst_flow|1257|0|1983|0|{0|}726|605|}
{2010212001|XXGvertex_oport_oport|1258|0|1984|0|{1|out1|}682|727|}
{2010216002|XXGoport_binding_oport|1259|0|1986|0|{.5|.5|{0|}10701|}727|720|}
{2010213001|XXGoport_dst_flow|1260|0|1987|0|{0|}727|606|}
{2010211001|XXGvertex_iport_iport|1261|0|1988|0|{0|in0|}682|728|}
{2010215002|XXGiport_binding_iport|1262|0|1990|0|{.5|.5|{0|}10699|}728|696|}
{2010214001|XXGiport_src_flow|1263|0|1991|0|{0|}728|603|}
{2010211001|XXGvertex_iport_iport|1264|0|1992|0|{0|in0|}592|729|}
{2010215002|XXGiport_binding_iport|1265|0|1994|0|{.5|.5|{0|}12084|}729|625|}
{2010214001|XXGiport_src_flow|1266|0|1995|0|{0|}729|39|}
{2010601001|XXGgraph_vertex_vertex|1267|0|1996|0|{read_IDS_icff_by_index_and_date_range|}1|730|}
{2010605001|XXGgraph_legend_legend|1268|0|1998|0|{0|}730|731|}
{2010241001|XXGlegend_face_face|1269|0|2000|0|{}731|732|}
{2010605001|XXGgraph_legend_legend|1270|0|2002|0|{1|}730|733|}
{2010241001|XXGlegend_face_face|1271|0|2004|0|{}733|734|}
{2010605001|XXGgraph_legend_legend|1272|0|2006|0|{2|}730|735|}
{2010241001|XXGlegend_face_face|1273|0|2008|0|{}735|736|}
{2010605001|XXGgraph_legend_legend|1274|0|2010|0|{3|}730|737|}
{2010241001|XXGlegend_face_face|1275|0|2012|0|{}737|738|}
{2010605001|XXGgraph_legend_legend|1276|0|2014|0|{4|}730|739|}
{2010241001|XXGlegend_face_face|1277|0|2016|0|{}739|740|}
{2010605001|XXGgraph_legend_legend|1278|0|2018|0|{5|}730|741|}
{2010241001|XXGlegend_face_face|1279|0|2020|0|{}741|742|}
{2010604001|XXGgraph_flow_flow|1280|0|2022|0|{Flow_1|}730|743|}
{2010604001|XXGgraph_flow_flow|1281|0|2024|0|{Flow_5|}730|744|}
{2010604001|XXGgraph_flow_flow|1282|0|2026|0|{Flow_6|}730|745|}
{2010601001|XXGgraph_vertex_vertex|1283|0|2028|0|{Broadcast|}730|746|}
{2010212001|XXGvertex_oport_oport|1284|0|2030|0|{0|out|}746|747|}
{2010213001|XXGoport_dst_flow|1285|0|2032|0|{0|}747|745|}
{2010211001|XXGvertex_iport_iport|1286|0|2033|0|{0|in|}746|748|}
{2010214001|XXGiport_src_flow|1287|0|2035|0|{0|}748|744|}
{2010006001|XXGobject_psameas_object|1288|0|2036|0|{Layout|Layout|0|0|}746|749|}
{2010212001|XXGvertex_oport_oport|1289|0|2038|0|{0|out|}749|750|}
{2010213001|XXGoport_dst_flow|1290|0|2040|0|{0|}750|743|}
{2010212001|XXGvertex_oport_oport|1291|0|2041|0|{1|error|}749|751|}
{2010212001|XXGvertex_oport_oport|1292|0|2043|0|{2|log|}749|752|}
{2010006001|XXGobject_psameas_object|1293|0|2045|0|{in_metadata|out_metadata|0|0|}746|753|}
{2010212001|XXGvertex_oport_oport|1294|0|2047|0|{0|out|}753|754|}
{2010213001|XXGoport_dst_flow|1295|0|2049|0|{0|}754|744|}
{2010212001|XXGvertex_oport_oport|1296|0|2050|0|{1|reject|}753|755|}
{2010212001|XXGvertex_oport_oport|1297|0|2052|0|{2|error|}753|756|}
{2010212001|XXGvertex_oport_oport|1298|0|2054|0|{3|log|}753|757|}
{2010211001|XXGvertex_iport_iport|1299|0|2056|0|{0|in|}753|758|}
{2010214001|XXGiport_src_flow|1300|0|2058|0|{0|}758|743|}
{2010006001|XXGobject_psameas_object|1301|0|2059|0|{Layout|Layout|0|0|}753|749|}
{2010006001|XXGobject_psameas_object|1302|0|2060|0|{in_metadata|out_metadata|0|0|}753|749|}
{2010006001|XXGobject_psameas_object|1303|0|2061|0|{reject_metadata|out_metadata|0|0|}753|749|}
{2010006001|XXGobject_psameas_object|1304|0|2062|0|{out_metadata|out_metadata|0|0|}746|753|}
{2010601001|XXGgraph_vertex_vertex|1305|0|2063|0|{Generate_Days_in_Range|}730|753|}
{2010601001|XXGgraph_vertex_vertex|1306|0|2064|0|{Read_Multiple_Split_ICFF|}730|759|}
{2010212001|XXGvertex_oport_oport|1307|0|2066|0|{0|out|}759|760|}
{2010212001|XXGvertex_oport_oport|1308|0|2068|0|{1|filereject|}759|761|}
{2010212001|XXGvertex_oport_oport|1309|0|2070|0|{2|fileerror|}759|762|}
{2010212001|XXGvertex_oport_oport|1310|0|2072|0|{3|reject|}759|763|}
{2010212001|XXGvertex_oport_oport|1311|0|2074|0|{4|error|}759|764|}
{2010212001|XXGvertex_oport_oport|1312|0|2076|0|{5|log|}759|765|}
{2010211001|XXGvertex_iport_iport|1313|0|2078|0|{0|in|}759|766|}
{2010214001|XXGiport_src_flow|1314|0|2080|0|{0|}766|745|}
{2010006001|XXGobject_psameas_object|1315|0|2081|0|{filereject_metadata|out_metadata|0|0|}759|753|}
{2010006001|XXGobject_psameas_object|1316|0|2082|0|{in_metadata|out_metadata|0|0|}759|753|}
{2010601001|XXGgraph_vertex_vertex|1317|0|2083|0|{Version_Log|}730|767|}
{2010605001|XXGgraph_legend_legend|1318|0|2085|0|{0|}767|768|}
{2010241001|XXGlegend_face_face|1319|0|2087|0|{}768|769|}
{2010605001|XXGgraph_legend_legend|1320|0|2089|0|{1|}767|770|}
{2010241001|XXGlegend_face_face|1321|0|2091|0|{}770|771|}
{2010605001|XXGgraph_legend_legend|1322|0|2093|0|{2|}767|772|}
{2010241001|XXGlegend_face_face|1323|0|2095|0|{}772|773|}
{2010605001|XXGgraph_legend_legend|1324|0|2097|0|{3|}767|774|}
{2010241001|XXGlegend_face_face|1325|0|2099|0|{}774|775|}
{2010605001|XXGgraph_legend_legend|1326|0|2101|0|{4|}767|776|}
{2010241001|XXGlegend_face_face|1327|0|2103|0|{}776|777|}
{2010605001|XXGgraph_legend_legend|1328|0|2105|0|{5|}767|778|}
{2010241001|XXGlegend_face_face|1329|0|2107|0|{}778|779|}
{2010605001|XXGgraph_legend_legend|1330|0|2109|0|{6|}767|780|}
{2010241001|XXGlegend_face_face|1331|0|2111|0|{}780|781|}
{2010605001|XXGgraph_legend_legend|1332|0|2113|0|{7|}767|782|}
{2010241001|XXGlegend_face_face|1333|0|2115|0|{}782|783|}
{2010601001|XXGgraph_vertex_vertex|1334|0|2117|0|{generate_record_Kicker|}730|749|}
{2010212001|XXGvertex_oport_oport|1335|0|2118|0|{0|out0|}730|784|}
{2010216002|XXGoport_binding_oport|1336|0|2120|0|{.5|.5|{0|}10690|}784|760|}
{2010213001|XXGoport_dst_flow|1337|0|2121|0|{0|}784|32|}
{2010007001|XXGobject_proto_object|1338|0|2122|0|{}730|785|}
{2010605001|XXGgraph_legend_legend|1339|0|2124|0|{0|}785|786|}
{2010241001|XXGlegend_face_face|1340|0|2126|0|{}786|787|}
{2010605001|XXGgraph_legend_legend|1341|0|2128|0|{1|}785|788|}
{2010241001|XXGlegend_face_face|1342|0|2130|0|{}788|789|}
{2010605001|XXGgraph_legend_legend|1343|0|2132|0|{2|}785|790|}
{2010241001|XXGlegend_face_face|1344|0|2134|0|{}790|791|}
{2010605001|XXGgraph_legend_legend|1345|0|2136|0|{3|}785|792|}
{2010241001|XXGlegend_face_face|1346|0|2138|0|{}792|793|}
{2010605001|XXGgraph_legend_legend|1347|0|2140|0|{4|}785|794|}
{2010241001|XXGlegend_face_face|1348|0|2142|0|{}794|795|}
{2010605001|XXGgraph_legend_legend|1349|0|2144|0|{5|}785|796|}
{2010241001|XXGlegend_face_face|1350|0|2146|0|{}796|797|}
{2010604001|XXGgraph_flow_flow|1351|0|2148|0|{Flow_1|}785|798|}
{2010604001|XXGgraph_flow_flow|1352|0|2150|0|{Flow_5|}785|799|}
{2010604001|XXGgraph_flow_flow|1353|0|2152|0|{Flow_6|}785|800|}
{2010601001|XXGgraph_vertex_vertex|1354|0|2154|0|{Broadcast|}785|801|}
{2010212001|XXGvertex_oport_oport|1355|0|2156|0|{0|out|}801|802|}
{2010213001|XXGoport_dst_flow|1356|0|2158|0|{0|}802|800|}
{2010211001|XXGvertex_iport_iport|1357|0|2159|0|{0|in|}801|803|}
{2010214001|XXGiport_src_flow|1358|0|2161|0|{0|}803|799|}
{2010007001|XXGobject_proto_object|1359|0|2162|0|{}801|804|}
{2010212001|XXGvertex_oport_oport|1360|0|2164|0|{0|out|}804|805|}
{2010006001|XXGobject_psameas_object|1361|0|2166|0|{metadata|out_metadata|1|0|}805|804|}
{2010211001|XXGvertex_iport_iport|1362|0|2167|0|{0|in|}804|806|}
{2010006001|XXGobject_psameas_object|1363|0|2169|0|{metadata|in_metadata|1|0|}806|804|}
{2010601001|XXGgraph_vertex_vertex|1364|0|2170|0|{Generate_Days_in_Range|}785|807|}
{2010212001|XXGvertex_oport_oport|1365|0|2172|0|{0|out|}807|808|}
{2010213001|XXGoport_dst_flow|1366|0|2174|0|{0|}808|799|}
{2010212001|XXGvertex_oport_oport|1367|0|2175|0|{1|reject|}807|809|}
{2010212001|XXGvertex_oport_oport|1368|0|2177|0|{2|error|}807|810|}
{2010212001|XXGvertex_oport_oport|1369|0|2179|0|{3|log|}807|811|}
{2010211001|XXGvertex_iport_iport|1370|0|2181|0|{0|in|}807|812|}
{2010214001|XXGiport_src_flow|1371|0|2183|0|{0|}812|798|}
{2010007001|XXGobject_proto_object|1372|0|2184|0|{}807|813|}
{2010212001|XXGvertex_oport_oport|1373|0|2186|0|{0|out|}813|814|}
{2010006001|XXGobject_psameas_object|1374|0|2188|0|{metadata|out_metadata|1|0|}814|813|}
{2010212001|XXGvertex_oport_oport|1375|0|2189|0|{1|reject|}813|815|}
{2010006001|XXGobject_psameas_object|1376|0|2191|0|{metadata|reject_metadata|1|0|}815|813|}
{2010212001|XXGvertex_oport_oport|1377|0|2192|0|{2|error|}813|816|}
{2010006001|XXGobject_psameas_object|1378|0|2194|0|{metadata|error_metadata|1|0|}816|813|}
{2010212001|XXGvertex_oport_oport|1379|0|2195|0|{3|log|}813|817|}
{2010006001|XXGobject_psameas_object|1380|0|2197|0|{metadata|log_metadata|1|0|}817|813|}
{2010211001|XXGvertex_iport_iport|1381|0|2198|0|{0|in|}813|818|}
{2010006001|XXGobject_psameas_object|1382|0|2200|0|{metadata|in_metadata|1|0|}818|813|}
{2010006001|XXGobject_psameas_object|1383|0|2201|0|{out_metadata|DAYS_DML|1|0|}807|785|}
{2010006001|XXGobject_psameas_object|1384|0|2202|0|{transform|CALCULATE_DAYS_XFR|1|0|}807|785|}
{2010601001|XXGgraph_vertex_vertex|1385|0|2203|0|{Read_Multiple_Split_ICFF|}785|819|}
{2010212001|XXGvertex_oport_oport|1386|0|2205|0|{0|out|}819|820|}
{2010212001|XXGvertex_oport_oport|1387|0|2207|0|{1|filereject|}819|821|}
{2010212001|XXGvertex_oport_oport|1388|0|2209|0|{2|fileerror|}819|822|}
{2010212001|XXGvertex_oport_oport|1389|0|2211|0|{3|reject|}819|823|}
{2010212001|XXGvertex_oport_oport|1390|0|2213|0|{4|error|}819|824|}
{2010212001|XXGvertex_oport_oport|1391|0|2215|0|{5|log|}819|825|}
{2010211001|XXGvertex_iport_iport|1392|0|2217|0|{0|in|}819|826|}
{2010214001|XXGiport_src_flow|1393|0|2219|0|{0|}826|800|}
{2010007001|XXGobject_proto_object|1394|0|2220|0|{}819|827|}
{2010212001|XXGvertex_oport_oport|1395|0|2222|0|{0|out|}827|828|}
{2010006001|XXGobject_psameas_object|1396|0|2224|0|{metadata|out_metadata|1|0|}828|827|}
{2010212001|XXGvertex_oport_oport|1397|0|2225|0|{1|filereject|}827|829|}
{2010006001|XXGobject_psameas_object|1398|0|2227|0|{metadata|filereject_metadata|1|0|}829|827|}
{2010212001|XXGvertex_oport_oport|1399|0|2228|0|{2|fileerror|}827|830|}
{2010006001|XXGobject_psameas_object|1400|0|2230|0|{metadata|fileerror_metadata|1|0|}830|827|}
{2010212001|XXGvertex_oport_oport|1401|0|2231|0|{3|reject|}827|831|}
{2010006001|XXGobject_psameas_object|1402|0|2233|0|{metadata|reject_metadata|1|0|}831|827|}
{2010212001|XXGvertex_oport_oport|1403|0|2234|0|{4|error|}827|832|}
{2010006001|XXGobject_psameas_object|1404|0|2236|0|{metadata|error_metadata|1|0|}832|827|}
{2010212001|XXGvertex_oport_oport|1405|0|2237|0|{5|log|}827|833|}
{2010006001|XXGobject_psameas_object|1406|0|2239|0|{metadata|log_metadata|1|0|}833|827|}
{2010211001|XXGvertex_iport_iport|1407|0|2240|0|{0|in|}827|834|}
{2010006001|XXGobject_psameas_object|1408|0|2242|0|{metadata|in_metadata|1|0|}834|827|}
{2010006001|XXGobject_psameas_object|1409|0|2243|0|{file_missing|FILE_MISSING|1|0|}819|785|}
{2010006001|XXGobject_psameas_object|1410|0|2244|0|{transform|RMF_XFR|1|0|}819|785|}
{2010601001|XXGgraph_vertex_vertex|1411|0|2245|0|{Version_Log|}785|835|}
{2010605001|XXGgraph_legend_legend|1412|0|2247|0|{0|}835|836|}
{2010241001|XXGlegend_face_face|1413|0|2249|0|{}836|837|}
{2010605001|XXGgraph_legend_legend|1414|0|2251|0|{1|}835|838|}
{2010241001|XXGlegend_face_face|1415|0|2253|0|{}838|839|}
{2010605001|XXGgraph_legend_legend|1416|0|2255|0|{2|}835|840|}
{2010241001|XXGlegend_face_face|1417|0|2257|0|{}840|841|}
{2010605001|XXGgraph_legend_legend|1418|0|2259|0|{3|}835|842|}
{2010241001|XXGlegend_face_face|1419|0|2261|0|{}842|843|}
{2010605001|XXGgraph_legend_legend|1420|0|2263|0|{4|}835|844|}
{2010241001|XXGlegend_face_face|1421|0|2265|0|{}844|845|}
{2010605001|XXGgraph_legend_legend|1422|0|2267|0|{5|}835|846|}
{2010241001|XXGlegend_face_face|1423|0|2269|0|{}846|847|}
{2010605001|XXGgraph_legend_legend|1424|0|2271|0|{6|}835|848|}
{2010241001|XXGlegend_face_face|1425|0|2273|0|{}848|849|}
{2010605001|XXGgraph_legend_legend|1426|0|2275|0|{7|}835|850|}
{2010241001|XXGlegend_face_face|1427|0|2277|0|{}850|851|}
{2010601001|XXGgraph_vertex_vertex|1428|0|2279|0|{generate_record_Kicker|}785|852|}
{2010212001|XXGvertex_oport_oport|1429|0|2281|0|{0|out|}852|853|}
{2010213001|XXGoport_dst_flow|1430|0|2283|0|{0|}853|798|}
{2010212001|XXGvertex_oport_oport|1431|0|2284|0|{1|error|}852|854|}
{2010212001|XXGvertex_oport_oport|1432|0|2286|0|{2|log|}852|855|}
{2010007001|XXGobject_proto_object|1433|0|2288|0|{}852|856|}
{2010212001|XXGvertex_oport_oport|1434|0|2290|0|{0|out|}856|857|}
{2010006001|XXGobject_psameas_object|1435|0|2292|0|{metadata|out_metadata|1|0|}857|856|}
{2010212001|XXGvertex_oport_oport|1436|0|2293|0|{1|error|}856|858|}
{2010006001|XXGobject_psameas_object|1437|0|2295|0|{metadata|error_metadata|1|0|}858|856|}
{2010212001|XXGvertex_oport_oport|1438|0|2296|0|{2|log|}856|859|}
{2010006001|XXGobject_psameas_object|1439|0|2298|0|{metadata|log_metadata|1|0|}859|856|}
{2010212001|XXGvertex_oport_oport|1440|0|2299|0|{0|out0|}785|860|}
{2010216002|XXGoport_binding_oport|1441|0|2301|0|{.5|.5|{0|}10687|}860|820|}
{2010006001|XXGobject_psameas_object|1442|0|2302|0|{FILE_MISSING|READ_MULTI_DO_ACTION_FILE_MISSING|1|0|}730|1|}
{2010109001|XXGobject_property_value|1443|0|2303|0|{0|TrackingThumbprint|72|}1|861|}
