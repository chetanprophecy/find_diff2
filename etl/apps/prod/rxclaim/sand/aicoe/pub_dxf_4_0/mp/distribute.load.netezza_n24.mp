@
{18|Type|XXGrepository|Primary_Name|XXGgraph|_ab_object_schema|0|_ab_semantic_schema|6|eme_flatten_format|1|schema_version|34|root_id|0|ent_count|123|rel_count|181|}
{2010001002|XXGdirectory|0|1|1|0|{@{}@}}
{2010600005|XXGgraph|1|0|1|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|AB_GRAPH_RUN_MODE|batch|3|1|REKl|The graph run mode.|{0|}}
{30001002|XXparameter|AB_DML_DEFS|include "/~$PUB_DB_XFR/db_list.xfr";
include "~$PUB_DXF_XFR/event/event_registration.xfr";
include "~$PUB_DXF_XFR/ids/ids_table_properties.xfr";|8|1|RKl|Provides functions and types to use in PDL.|{0|}}
{30001002|XXparameter|DATA_MART_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|TABLE_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SOURCE_NAME|$TABLE_NAME|3|9|FK|@{0|}}
{30001002|XXparameter|TGT_DB_PROJECT||3|9|FK|@{0|}}
{30001002|XXparameter|DO_PROCESS_ILM_EVENTS|0|3|9|FK|@{0|}}
{30001002|XXparameter|ILM_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|VARIATION|@3|9|FK|@{0|}}
{30001002|XXparameter|___Intermediate_PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|RUN_ID|0|3|9|REFK|The numeric ID that identifies this run uniquely.  Defaults to 0, but should be set the same for all tables loaded in a single job by the invoking plan.|{0|}}
{30001002|XXparameter|EVENT_CONSUMPTION_FILE_PATH|$\{AI_SERIAL\}/consumption_log/consumption_log.$\{DATA_MART_NAME\}_n24.$\{TABLE_NAME\}.dat|3|9|RK|@{0|}}
{30001002|XXparameter|LOAD_READY_DML|$[
begin
result :: join_types("record\\n string(1) event_indicator; //Flag that would differentiate the records. I-Insert \| U-Update \| D- Delete\\n end", read_file(DB_RXCLAIM_DML + "/" + DATA_MART_NAME + "/" + DATA_MART_NAME + "." + TABLE_NAME +".dml")  ) ;
end]|3|9|RFK|@{0|}}
{30001002|XXparameter|TARGET_DB_LIST|# Each DataMart Target ave the below 3 entries. The first entry is to validate the DML, DBMS Type & Target SYSTEM to have same vlaues as fr Staging & Main
# DB Param First , Staging Data Second, Target Data Third
# Logical  Physical              DML Directory  DBMS Type     Param Prefix  Optional: DBC File Name
yyy        $DB_XXX_YYY_DB        $DB_XXX_DML    $DB_XXX_DBMS  DB_XXX
yyy_stage  $DB_XXX_YYY_STAGE_DB  $DB_XXX_DML    $DB_XXX_DBMS  DB_XXX        $DB_XXX_DBMS.gateway.yyy_stage.dbc
yyy        $DB_XXX_YYY_DB        $DB_XXX_DML    $DB_XXX_DBMS  DB_XXX        $DB_XXX_DBMS.gateway.yyy.dbc|3|9|RFK|A list with the target and staging databases, one per line, with the fields separated by spaces.  The first of these is used for staging, the second is the target.  Comments beginning with # are ignored.|{0|}}
{30001002|XXparameter|TARGET_DB_INFO_VEC|$[ get_db_info_vec_db_project(TARGET_DB_LIST, TGT_DB_PROJECT, AI_SERIAL, AI_MFS) ]|3|9|RK|A vector of information about the source databases.|{0|}}
{30001002|XXparameter|COMBINE_PSET_PARAMETER_INFO|$[
begin
let combine_pset = 
if(DO_PROCESS_ILM_EVENTS == "0")
  (if(IDS_SOURCE_NAME != TABLE_NAME) AI_PSET + "/combine." + DATA_MART_NAME + "/combine." + DATA_MART_NAME + "." + TABLE_NAME + "." + IDS_SOURCE_NAME + ".pset"
  else AI_PSET + "/combine." + DATA_MART_NAME + "/combine." + DATA_MART_NAME + "." + TABLE_NAME + ".pset")
else 
  (if(VARIATION == "") AI_PSET + "/combine." + DATA_MART_NAME + "/combine." + DATA_MART_NAME + "." + TABLE_NAME + "." + ILM_NAME + ".pset"
  else AI_PSET + "/combine." + DATA_MART_NAME + "/combine." + DATA_MART_NAME + "." + TABLE_NAME + "." + ILM_NAME + "." + VARIATION + ".pset");

result :: pset_info(read_file(combine_pset)).parameters;
end
]|3|9|RK|@{0|}}
{30001002|XXparameter|TARGET_DATASET_TYPE|$[
begin
let parameter_info_type prm_info = allocate_with_defaults();
let target_dataset_type_index = -1;
prm_info.name = "TARGET_DATASET_TYPE";
target_dataset_type_index = vector_search(COMBINE_PSET_PARAMETER_INFO, prm_info, \{name\});
result :: if(target_dataset_type_index == -1) "Delta" else COMBINE_PSET_PARAMETER_INFO[target_dataset_type_index].value;
end
]|3|9|RK|@{2|Delta|Full|}}
{30001002|XXparameter|TARGET_SQL_DB_INFO|$[ TARGET_DB_INFO_VEC[0] ]|3|9|RK|The DB info to use for running SQL commands on the target table.|{0|}}
{30001002|XXparameter|STAGING_DATA_DB_INFO|$[ TARGET_DB_INFO_VEC[1] ]|3|9|RK|The DB info to use for loading data into the staging tables.|{0|}}
{30001002|XXparameter|TARGET_DATA_DB_INFO|$[ TARGET_DB_INFO_VEC[2] ]|3|9|RK|The DB info to use for loading data directly into the target table.|{0|}}
{30001002|XXparameter|TARGET_DML|$[ TARGET_SQL_DB_INFO.dml_directory ]|3|9|RK|The DML directory in the target DB project.|{0|}}
{30001002|XXparameter|TARGET_XFR|$[ TARGET_SQL_DB_INFO.xfr_directory ]|3|9|RK|The XFR directory in the target DB project.|{0|}}
{30001002|XXparameter|TARGET_DBMS|$[ TARGET_SQL_DB_INFO.dbms_type ]|3|9|RK|The type of database.|{0|}}
{30001002|XXparameter|TARGET_LOGICAL_DB_NAME|$[ TARGET_SQL_DB_INFO.logical_schema ]|3|9|RK|The business-friendly or "logical" name of the schema/user/database for the main tables.|{0|}}
{30001002|XXparameter|STAGING_SYSTEM|$[ STAGING_DATA_DB_INFO.logical_schema ]|3|9|RK|The business-friendly or "logical" name of the schema/user/database for the staging tables.|{0|}}
{30001002|XXparameter|TARGET_MAIN_DB|$[ TARGET_SQL_DB_INFO.physical_schema ]|3|9|RK|The name of the schema/user/database for the main tables.  This should normally be a reference to a $DB_XXX_YYY_DB project parameter.|{0|}}
{30001002|XXparameter|TARGET_STAGING_DB|$[ STAGING_DATA_DB_INFO.physical_schema ]|3|9|RK|The name of the schema/user/database for the staging tables.  This should normally be a reference to a $DB_XXX_STAGING_YYY_DB project parameter.|{0|}}
{30001002|XXparameter|TARGET_SQL_DBC_FILE|$[ other_directory(TARGET_DML, "db") + "/" + TARGET_SQL_DB_INFO.dbc_file ]|3|9|RK|The filename of the DBC file for running SQL that impacts the target table.|{0|}}
{30001002|XXparameter|STAGING_DATA_DBC_FILE|$[ other_directory(TARGET_DML, "db") + "/" + STAGING_DATA_DB_INFO.dbc_file ]|3|9|RK|The filename of the DBC file for loading the staging tables.|{0|}}
{30001002|XXparameter|TARGET_DATA_DBC_FILE|$[ other_directory(TARGET_DML, "db") + "/" + TARGET_DATA_DB_INFO.dbc_file ]|3|9|RK|The filename of the DBC file for reading or loading the staging tables.|{0|}}
{30001002|XXparameter|SERIAL_LAYOUT|$[ TARGET_DATA_DB_INFO.serial_layout ]|3|9|RK|@{0|}}
{30001002|XXparameter|LOAD_INTERFACE|utility|15|9|RFK|utility or api: The type of interface to use for the load.|{2|utility|api|}}
{30001002|XXparameter|LOAD_IN_PARALLEL|$[if(LOAD_INTERFACE == "utility") "True" else "False"]|13|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DB_LAYOUT|$[ if(LOAD_IN_PARALLEL) TARGET_DATA_DB_INFO.mfs_layout else TARGET_DATA_DB_INFO.serial_layout ]|3|9|RK|The layout used for the loads of the staging tables.  This can be on a remote (gateway) machine, and it can have a different degree of parallelism than $AI_MFS.  The default is $AI_MFS.|{0|}}
{30001002|XXparameter|___PSet_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|TARGET_NAME|$[DATA_MART_NAME + "." +TABLE_NAME]|3|9|RK|The name of the target table to load, including its "logical" schema name.|{0|}}
{30001002|XXparameter|TARGET_LOWER|$[ string_replace(string_downcase(TARGET_NAME), "-", "_") ]|3|9|RK|The cananonical form of the full "logical" target table name.|{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$[ re_replace(TARGET_NAME, "[.].*", "") ]|3|9|RK|The business-friendly or "logical" name of the schema/user/database for the target table.|{0|}}
{30001002|XXparameter|CHECK_DB_PARAMETERS|$[(if ( TARGET_SYSTEM == TARGET_LOGICAL_DB_NAME ) "" else
    force_error("The PSet Prefix does not match the Target Schema: " +
      TARGET_SYSTEM + ", " + TARGET_LOGICAL_DB_NAME)) +
  // Check the DML Directory
  (if ( TARGET_DML == STAGING_DATA_DB_INFO.dml_directory ) "" else
    force_error("The DML Directory does not match the Target Schema: " +
      TARGET_DML + ", " + STAGING_DATA_DB_INFO.dml_directory)) +
  (if ( TARGET_DML == TARGET_DATA_DB_INFO.dml_directory ) "" else
    force_error("The DML Directory does not match the Target Schema: " +
      TARGET_DML + ", " + TARGET_DATA_DB_INFO.dml_directory)) +
  // Check the XFR Directory
  (if ( TARGET_XFR == STAGING_DATA_DB_INFO.xfr_directory ) "" else
    force_error("The XFR Directory does not match the Target Schema: " +
      TARGET_XFR + ", " + STAGING_DATA_DB_INFO.xfr_directory)) +
  (if ( TARGET_XFR == TARGET_DATA_DB_INFO.xfr_directory ) "" else
    force_error("The XFR Directory does not match the Target Schema: " +
      TARGET_XFR + ", " + TARGET_DATA_DB_INFO.xfr_directory)) +
  // Check the DBMS Type
  (if ( TARGET_DBMS == STAGING_DATA_DB_INFO.dbms_type ) "" else
    force_error("The DBMS Type does not match the Target Schema: " +
      TARGET_DBMS + ", " + STAGING_DATA_DB_INFO.dbms_type)) +
  (if ( TARGET_DBMS == TARGET_DATA_DB_INFO.dbms_type ) "" else
    force_error("The DBMS Type does not match the Target Schema: " +
      TARGET_DBMS + ", " + TARGET_DATA_DB_INFO.dbms_type)) +
  // Check the Physical DB Name
  (if ( TARGET_MAIN_DB == TARGET_DATA_DB_INFO.physical_schema ) "" else
    force_error("The Physical DB Name does not match the Target Schema: " +
      TARGET_MAIN_DB + ", " + TARGET_DATA_DB_INFO.physical_schema)) +
  ""
]|3|9|RK|Cross checks the schema implied by the pset name with the one given by the db and returns "" if they match.|{0|}}
{30001002|XXparameter|TARGET_ENTITY|$[ re_replace(TARGET_NAME, ".*[.]", "") + CHECK_DB_PARAMETERS ]|3|9|RK|The target table name, excluding its schema part.|{0|}}
{30001002|XXparameter|STAGING_TABLE_PREFIX|$TARGET_STAGING_DB.$TARGET_ENTITY|3|9|RK|The fully qualified "physical" prefix for target staging tables, excluding the _k, _u, or _i suffix.|{0|}}
{30001002|XXparameter|TARGET_TABLE|$TARGET_MAIN_DB.$TARGET_ENTITY|3|9|RK|The fully qualified "physical" name of the target table.|{0|}}
{30001002|XXparameter|STAGING_DML_FILE_PREFIX|$TARGET_DML/$STAGING_SYSTEM/$STAGING_SYSTEM.$TARGET_ENTITY|3|9|RK|The DML for the staging tables, excluding the _k.dml or _u.dml suffix.  (The insert staging table just uses the target DML.)|{0|}}
{30001002|XXparameter|TARGET_DML_FILE|$[ TARGET_DML + "/" + DATA_MART_NAME + "/" + TARGET_LOWER + ".dml" ]|3|9|RK|The DML for the target table.|{0|}}
{30001002|XXparameter|TARGET_INFO_VEC|$[ for ( let info in record_info(read_type(TARGET_DML_FILE)) ) :
    if ( info.name != "newline" )
      info
]|3|9|K|A vector of information about all of the fields in the target DML, excluding "newline".|{0|}}
{30001002|XXparameter|TARGET_FIELDS_VEC|$[ for ( let i in TARGET_INFO_VEC ) :
    i.name
]|3|9|K|A vector of field names in the target table, excluding "newline".|{0|}}
{30001002|XXparameter|TARGET_FIELDS_WIDTH|$[ vector_max(
    for ( let n in TARGET_FIELDS_VEC ) :
      (decimal(""))string_length(n))
]|3|9|RK|The length of the widest field name in the target table.|{0|}}
{30001002|XXparameter|TARGET_FIELDS_DIST_VEC|$[vector_sort(TARGET_FIELDS_VEC)]|3|9|K|@{0|}}
{30001002|XXparameter|LR_FILE_NAME|AB_PARAMETER_ENV|3|10|RKd|A vector of shred file names that match both the ILM pattern and the "logical" target table name.|{0|}}
{30001002|XXparameter|NATURAL_KEY||3|9|RFK|\{field_1; ...; field_n\}: The natural key for the target table, without an effective date field.|{0|}}
{30001002|XXparameter|NZ_DISTRIBUTION_KEY|@3|9|FK|Applicable only for Netezza target tables, and only when the distribution columns are not part of the natural key. pass the key, or set of columns, on which the target Netezza table is distributed. Since such columns can not be directly updated using an update statement, the graph will process updates to these columns differently.|{0|}}
{30001002|XXparameter|VALIDATE_NZ_DISTRIBUTION_KEY|$[
  if(is_blank(NZ_DISTRIBUTION_KEY))
    1
  else if(string_downcase(TARGET_DBMS) != "netezza")
    force_error("===== ERROR: The parameter NZ_DISTRIBUTION_KEY can only be used when the target is Netezza. Value supplied: \\"" + NZ_DISTRIBUTION_KEY + "\\"")
  else
  begin
    let decimal(1) ok = 1;
    let nks = for(let k in key_info(NATURAL_KEY)):k.field_name;
    let dks = for(let k in key_info(NZ_DISTRIBUTION_KEY)):k.field_name;
    for(let dk in dks)
      if(dk member nks) ok = 0;

    result :: if(ok) ok else force_error("===== ERROR: When Distribution Key (" + NZ_DISTRIBUTION_KEY + ") is a part of the Natural Key (" + NATURAL_KEY + ") leave the distribution key blank. See description of parameter NZ_DISTRIBUTION_KEY.");
  end
]|3|9|K|@{0|}}
{30001002|XXparameter|NATURAL_KEY_FIELDS_VEC|$[ for ( let k in key_info(NATURAL_KEY) ) : k.field_name ]|3|9|RK|A vector of natural key field names.|{0|}}
{30001002|XXparameter|NATURAL_KEY_INFO_VEC|$[ for ( let info in TARGET_INFO_VEC ) :
    if ( info.name member NATURAL_KEY_FIELDS_VEC )
      info
]|3|9|RK|A vector of information about all of the fields in the list natural key DML, or the full natural key DML, if there is no list natural key.|{0|}}
{30001002|XXparameter|NATURAL_KEY_WIDTH|$[ vector_max(
    for ( let info in NATURAL_KEY_INFO_VEC ) :
      (decimal(""))(string_length(info.name) + if ( info.nullable ) 15 else 0))
]|3|9|RK|The length of the widest natural key field name.|{0|}}
{30001002|XXparameter|NATURAL_KEY_CLAUSE|$[ string_join(
    for ( let info in NATURAL_KEY_INFO_VEC ) :
      if ( (decimal(""))info.nullable )
        printf(string_replace(
            switch ( info.form )
              case "string":  "(COALESCE(stg.%-999s, ' ') = COALESCE(tgt.%-999s, ' '))";
              case "date":    "(COALESCE(stg.%s, '0000-01-01') = COALESCE(tgt.%s, '0000-01-01'))";
              case "datetime":"(COALESCE(stg.%s, '0000-01-01') = COALESCE(tgt.%s, '0000-01-01'))";
              case "decimal": "(COALESCE(stg.%s, -9223372036854775808) = COALESCE(tgt.%s, -9223372036854775808))";
              default: force_error("Unknown DML Type: " + info.form);
            end,
            "999", NATURAL_KEY_WIDTH - 15),
          info.name, info.name)
      else
        printf(string_replace("(stg.%-999s = tgt.%-999s)%s",
            "999", NATURAL_KEY_WIDTH),
          info.name, info.name,first_defined(" /* "+scomment_info(info.scomment).parts[0].value+" */","")),
    "\\n   AND  ") ]|3|9|RK|A WHERE clause fragment that matches the natural key between a target and staging table.  Used to update the target table.|{0|}}
{30001002|XXparameter|COMPARE_FIELDS_VEC|$[  string_split_no_empty(
       string_downcase(
         string_join(
           for ( let n in TARGET_FIELDS_VEC ) :
           if ( n not member NATURAL_KEY_FIELDS_VEC )
                   n,
           "\\n")
        ), "\\n"
        )
]|3|9|RK|@{0|}}
{30001002|XXparameter|___Dependent_Intermediate_PSet_Parameters___|// These may be left writable in the intermediate pset, so that individual psets can override, or they may need access to the pset parameters, such as TABLE_NAME.|3|1|Kl||{0|}}
{30001002|XXparameter|LOAD_TARGET_DB_IMPLEMENTATION|$[ if (TARGET_DBMS == 'netezza' ) PUB_DXF_COMPONENTS + "/target_load_db.netezza.mp" else "" ]|3|9|FK|@{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD|0|13|9|RFK|0 or 1: Whether to trucate and load the target table (as oppsed to comparing the data and updating).  Defaults to 0 (false).|{0|}}
{30001002|XXparameter|FAIL_FOR_REJ_FLG|@13|9|FK|@{0|}}
{30001002|XXparameter|TRUNCATE_SQL|TRUNCATE TABLE $TARGET_TABLE;|3|9|RK|The SQL used to truncate the target table.|{0|}}
{30001002|XXparameter|REMOVE_FLDS_ISRT_STMT|update_uid|3|9|FK|@{0|}}
{30001002|XXparameter|REMOVE_FLDS_UPDT_STMT|insert_uid,insert_ts|3|9|FK|@{0|}}
{30001002|XXparameter|UPDATE_DB_SQL|$[begin

let string("")[int] update_fields = TARGET_FIELDS_VEC;
let string("")[int] remove_fields = string_split_no_empty(string_replace(REMOVE_FLDS_UPDT_STMT," ",""),",");
//let string("")[int] remove_fields = [vector "insert_uid","insert_ts"];

// If Netezza distribution key is specified then we do not want to update the columns in that key otherwise the update will fail. Updates to distribution columns are handled indirectly via the _di staging table.
if(not is_blank(NZ_DISTRIBUTION_KEY)) for(let k in key_info(NZ_DISTRIBUTION_KEY)) remove_fields = vector_append(remove_fields, k.field_name);

update_fields = vector_difference(update_fields,remove_fields);

result ::
"UPDATE " + TARGET_TABLE + " tgt
   SET " + string_join(
      for ( let n in update_fields ) :
        if ( n not member NATURAL_KEY_FIELDS_VEC and
             (n member COMPARE_FIELDS_VEC ) )  // Do not update fields we did not compare.
          printf(string_replace(
            "%-999s = stg.%s", "999", TARGET_FIELDS_WIDTH), // Do not use "tgt."... here, because Postgres does not like it.
            n, n),
      "\\n     , ")
+
"\\nFROM " + STAGING_TABLE_PREFIX + "_u  stg\\n" +
"WHERE " + NATURAL_KEY_CLAUSE + ";";
end]|3|9|RFK|@{0|}}
{30001002|XXparameter|INSERT_DB_SQL|$[
begin

let string("")[int] insert_fields = TARGET_FIELDS_VEC;
let string("")[int] remove_fields = string_split_no_empty(string_replace(REMOVE_FLDS_ISRT_STMT," ",""),",");
//let string("")[int] remove_fields = [vector "update_uid"];

insert_fields = vector_difference(insert_fields,remove_fields);

result :: "INSERT INTO " + TARGET_TABLE
+"\\n(\\n" +
string_join(insert_fields,"\\n, " )
+"\\n)
(
SELECT " +
string_join( insert_fields,  "\\n     , ")
+ 
"\\nFROM " + STAGING_TABLE_PREFIX + "_i
);";



end]|3|9|RFK|@{0|}}
{30001002|XXparameter|___Runtime_Parameters___||3|1|Kl||{0|}}
{30001002|XXparameter|EFF_DATE|$[ (string(""))(date("YYYY-MM-DD"))(today1() - 1) ]|3|9|RFK|YYYY-MM-DD: The date that the incoming data was created.  Defaults to yesterday.|{0|}}
{30001002|XXparameter|NATIVE_OPTIONS||3|9|FK|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
{30001002|XXparameter|_ab_has_render_fixups|2|1|1|Hl||{0|}}
{30001002|XXparameter|!ab_compatibility|4.0.2.0|3|9|P|@{0|}}
{30001002|XXparameter|LR_FILE_NAME:eme|$[AI_MFS +"/" + DATA_MART_NAME + "_n24/" + TARGET_LOWER + ".\{RUN_ID\}.dat.gz" ]|3|9||@{0|}}
{30001002|XXparameter|LR_FILE_NAME:sandbox|$[
 begin
  let file_dir = AI_MFS + "/" + DATA_MART_NAME + "_n24";
  let string("") v_run_id= if( RUN_ID == "0" ) "??????????????" else  RUN_ID ;
// There would a unique RUN_ID for the Distribute Engine if not it takes the latest timestamp 
  let pattern =  string_split(TARGET_LOWER,".")[1] + "." + v_run_id + ".dat.gz";  // Load ready file should have RUN_ID in the file pattern. By default it would be 

  let file_name_vec = directory_listing(file_dir,pattern);
  let latest_file_vec = vector_sort(file_name_vec, \{descending\}) ;  // CHecking for the latest LR file for the IDS Table 
  //let string("") file_nm ;
  if ( length_of(file_name_vec) == 0 )
   force_error("No load ready files found" +
     ": Target Table: " + TARGET_LOWER +
     ", Pattern:\\n" + file_dir + "/" + pattern);
				
   result ::  if( RUN_ID != "0" ) 
                file_dir + "/" + pattern
                  else 			   
                file_dir + "/" + latest_file_vec[0] ;

  //result :: string_join(file_vec,"\\n");

end 
]|3|9||@{0|}}
{30001002|XXparameter|analysis_level|none|3|1|Kl|@{0|}}
{30001002|XXparameter|_UseNewErrorLogDML|True|13|1|Hl||{0|}}
}}@0|@0|0|0|0|0|0|0|distribute.load.netezza|Swayam Mishra|Created 1/31/2017 9:15:25 AM|1|100|-1|@9|@34817|{0|}0|0|{0|}{0|}{0|}{0|}1.0|923000|666000|3|}}
{2010703001|XXGgraphinfo|2|0|3|0|{@{}@1|4.0.2.0|{2|1|1|}Job 'distribute.load.netezza_n24' Execution Status Report

Job completed successfully at Tuesday, September 29, 2020 20:32:21
Run performed by user rjadha14
||# Make sure the multifile/serial directories exist.
for dir in "$TARGET_DB_LAYOUT/load.$TARGET_SYSTEM" \\
		   "$TARGET_DB_LAYOUT/../log/load.$TARGET_SYSTEM" \\
		   "$TARGET_DB_LAYOUT/../reject/load.$TARGET_SYSTEM" \\
                   "$TARGET_DB_LAYOUT/../error/load.$TARGET_SYSTEM" \\
		   "$AI_SERIAL_LOG/load.$TARGET_SYSTEM" \\
                   "$AI_SERIAL_ERROR/load.$TARGET_SYSTEM" \\
                   "$AI_SERIAL_REJECT/load.$TARGET_SYSTEM"; do

  dir="$(echo $dir \| sed -e 's/file://;s/mfile://')"
  p="$(dirname "$d")"
  [[ -d "$p" ]] \|\| m_mkdir -mode 2775 "$p"
  [[ -d "$dir" ]] \|\| m_mkdir -mode 2775 -p "$dir"
done




# Write the summary tracking info.
export AB_REPORT="summary=$AI_SERIAL_LOG/load.$TARGET_SYSTEM/distribute.netezza.$TARGET_LOWER.summary.log $AB_REPORT"
||@@33207807|}}
{2010705002|XXGrunsettings|3|0|5|0|{@{}@Dev-4||||1|60|0|1|1|0|0|0|0|1|1|0|0|1|2|1|1|0|0|0|@16|}}
{2010242002|XXGface|4|0|7|0|{@{}@Calibri|128|140|1|}}
{2010240003|XXGlegend|5|0|9|0|{@{}@Type 1: Update/Insert or Truncate & Load Target|51103|56494|40000|45000|1143000|56000|11352|}}
{2010242002|XXGface|6|0|11|0|{@{}@Arial|32768|280|1|}}
{2010240003|XXGlegend|7|0|13|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!is_dynamic|true|3|9|P|@{0|}}
}}@DATA MART NAME: $DATA_MART_NAME
TABLE NAME: $TABLE_NAME
TRUNCATE AND LOAD: $TRUNCATE_AND_LOAD  |46000|143000|333000|83000|111000|48000|11351|}}
{2010242002|XXGface|8|0|15|0|{@{}@Calibri|128|140|1|}}
{2010210004|XXGflow|9|0|17|0|{@{}@384|.5|.5|{0|}14057|2065|}}
{2010210004|XXGflow|10|0|19|0|{@{}@384|.5|.5|{0|}14059|17|}}
{2010210004|XXGflow|11|0|21|0|{@{}@384|.5|.5|{0|}11339|17|}}
{2010210004|XXGflow|12|0|23|0|{@{}@384|.5|.5|{0|}14060|17|}}
{2010210004|XXGflow|13|0|25|0|{@{}@384|.5|.5|{0|}14061|17|}}
{2010501005|XXGpvertex|14|0|27|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Trash.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
}}@0|Trash|460000|526000|0|0|0|0|14063|Delete Records|Ab Initio Software|Built-in 1.0:|1|100|0||6||32897|1|{1|0|}}}
{2010202004|XXGiport|15|0|29|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|16|0|32|0|{Ends a flow by discarding all input data records.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010202004|XXGiport|17|0|34|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010503005|XXGfvertex|18|0|37|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$LR_FILE_NAME|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 1 datasets [vector [record variable _interp_("read", "pdl") map_dataset 1 mapping [record dataset_path _interp_("$LR_FILE_NAME", "pdl") create_update 1 is_db 0 dml_info NULL]]]]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$LOAD_READY_DML|3|9||@{0|}}
}}@0|Input File|119000|363500|0|0|0|0|14064|Load Ready File|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|19|0|39|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|20|0|42|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|21|0|44|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|22|0|47|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Transform/Reformat.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|output_index|/*Function returning index of output port*/
out ::output_index(in)=
begin
out :: if ( in.event_indicator == 'I' && $[TRUNCATE_AND_LOAD] ) 1 
        else if ( in.event_indicator == 'I' ) 0
        else if ( in.event_indicator == 'U') 2
        else 3;
       
end;|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out0_metadata|$TARGET_DML_FILE|3|2|f$|@{0|}}
{30001002|XXparameter|out1_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out2_metadata||3|8|=|@{0|}}
{30001002|XXparameter|out3_metadata||3|8|=|@{0|}}
{30001002|XXparameter|reject0_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject1_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject2_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|reject3_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|error0_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error1_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error2_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|error3_metadata|$AB_HOME/include/error-info.dml|3|2|f$|@{0|}}
{30001002|XXparameter|log_metadata|$AB_HOME/include/log-info.dml|3|2|f$|@{0|}}
}}@0|Reformat|307000|318500|0|0|0|0|14065|RFMT: Determine Actions|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|23|0|49|0|{@{}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|24|0|52|0|{@{}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|25|0|55|0|{@{}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|26|0|58|0|{@{}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|27|0|61|0|{@{}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|28|0|63|0|{@{}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|29|0|65|0|{@{}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|30|0|67|0|{@{}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|31|0|69|0|{@{}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|32|0|71|0|{@{}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|33|0|73|0|{@{}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|34|0|75|0|{@{}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|35|0|77|0|{@{}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|36|0|79|0|{@{}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010501005|XXGpvertex|37|0|82|0|{Changes the record format of your data by dropping fields or by using DML expressions to add fields, combine fields, or modify the data.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|reformat-transform|3|1|Hl||{0|}}
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
{30001002|XXparameter|transform3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_name|transform|3|9|P|@{0|}}
}}@0|Reformat|0|0|0|0|0|0|0|@||1|100|-1|@6|@1|1|{1|0|}}}
{2010203004|XXGoport|38|0|84|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform0||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform0.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_value|0|3|9|P|@{0|}}
{30001002|XXparameter|transform0.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out0|0.0|count|out|0|2448|0|}}
{2010203004|XXGoport|39|0|88|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform1||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform1.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_value|1|3|9|P|@{0|}}
{30001002|XXparameter|transform1.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out1|0.0|count|out|1|2448|0|}}
{2010203004|XXGoport|40|0|92|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform2||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform2.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_value|2|3|9|P|@{0|}}
{30001002|XXparameter|transform2.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out2|0.0|count|out|2|2448|0|}}
{2010203004|XXGoport|41|0|96|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
{30001002|XXparameter|transform3||8|8|FO=|Reformat transform|{0|}}
{30001002|XXparameter|transform3.index|count|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_value|3|3|9|P|@{0|}}
{30001002|XXparameter|transform3.index_name|transform|3|9|P|@{0|}}
}}@0|0|0|0|out3|0.0|count|out|3|2448|0|}}
{2010203004|XXGoport|42|0|100|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject0|0.0|count|reject|0|1168|0|}}
{2010203004|XXGoport|43|0|103|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject1|0.0|count|reject|1|1168|0|}}
{2010203004|XXGoport|44|0|106|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject2|0.0|count|reject|2|1168|0|}}
{2010203004|XXGoport|45|0|109|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|reject3|0.0|count|reject|3|1168|0|}}
{2010203004|XXGoport|46|0|112|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error0|0.0|count|error|0|1176|0|}}
{2010203004|XXGoport|47|0|115|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error1|0.0|count|error|1|1176|0|}}
{2010203004|XXGoport|48|0|118|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error2|0.0|count|error|2|1176|0|}}
{2010203004|XXGoport|49|0|121|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|error3|0.0|count|error|3|1176|0|}}
{2010203004|XXGoport|50|0|124|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|F=||{0|}}
}}@0|0|0|0|log|0.0|@@@1176|0|}}
{2010202004|XXGiport|51|0|127|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1808|0|}}
{2010600005|XXGgraph|52|0|141|0|{Subgraph created from graph "distribute.load.netezza"|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|$[TARGET_DATASET_TYPE == "Delta"]|3|9|F||{0|}}
}}@0|@696500|158750|0|0|0|0|14056|Update Consumption Log|Swayam Mishra|Created 2/6/2017 9:02:32 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|440000|178000|3|}}
{2010210004|XXGflow|53|0|143|0|{@{}@384|.5|.5|{0|}11286|17|}}
{2010210004|XXGflow|54|0|145|0|{@{}@384|.5|.5|{0|}11284|17|}}
{2010503005|XXGfvertex|55|0|147|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Output_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|mode|0x0052|3|2|$|@{0|}}
{30001002|XXparameter|Layout|$EVENT_CONSUMPTION_FILE_PATH|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|write_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@1|Output File|317000|89500|0|0|0|0|11288|Consumption Log|Ab Initio Software|@1|10000|-1||6||33025|-1|-1|}}
{2010202004|XXGiport|56|0|149|0|{@{}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|57|0|152|0|{Represents one file, many files, or a multifile as an output from your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010202004|XXGiport|58|0|154|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|write|0.0|@@@1780|0|}}
{2010503005|XXGfvertex|59|0|157|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Datasets/Input_File.mdc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout|$\{AI_SERIAL\}/consumption_log/interim_log.$\{DATA_MART_NAME\}_n24.$\{TABLE_NAME\}.dat|3|2|$|@{0|}}
{30001002|XXparameter|eme_dataset_mapping|$[[record map_component 0 datasets NULL]]|3|9||@{0|}}
{30001002|XXparameter|read_metadata|$PUB_DXF_DML/event/event_consumption_log.dml|3|2|f$|@{0|}}
}}@1|Input File|55000|85000|0|0|0|0|11289|Interim Events Log|Ab Initio Software|@1|100|-1||6||33025|-1|-1|}}
{2010203004|XXGoport|60|0|159|0|{@{}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010503005|XXGfvertex|61|0|162|0|{Represents one file, many files, or a multifile as an input to your graph.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|protection|0666|12|2|RF$||{0|}}
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
{2010203004|XXGoport|62|0|164|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|read|0.0|@@@2164|0|}}
{2010501005|XXGpvertex|63|0|167|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!prototype_path|$AB_COMPONENTS/Miscellaneous/Replicate.mpc|3|9|Pf|@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
{30001002|XXparameter|in_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|out_metadata||3|8|s=|@{0|}}
}}@1|Replicate|210000|99500|0|0|0|0|11290|Updating Consumption Entry|Ab Initio Software|Built-in 1.0:|1|100|0||6||32769|1|{1|0|}}}
{2010203004|XXGoport|64|0|169|0|{@{}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|65|0|172|0|{@{}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010501005|XXGpvertex|66|0|175|0|{Arbitrarily combines all the data records it receives into a single flow and writes a copy of that flow to each of its output flows.|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|mpname|broadcast|3|1|Hl||{0|}}
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
{2010203004|XXGoport|67|0|177|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|out|0.0|@@@2068|0|}}
{2010202004|XXGiport|68|0|180|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|in|0.0|@@@1812|0|}}
{2010600005|XXGgraph|69|0|186|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition|0|3|2|F$||{0|}}
}}@0|@540000|160000|0|0|0|0|14055|Version Log|Swayam Mishra|Created 8/21/2015 9:19:55 AM|1|100|-1|@9|@32769|{0|}0|0|{0|}{0|}{0|}{0|}1.0|996000|497000|3|}}
{2010240003|XXGlegend|70|0|188|0|{@{}@Date|92000|231000|0|0|0|0|1460|}}
{2010242002|XXGface|71|0|190|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|72|0|192|0|{@{}@Author|217000|231000|0|0|0|0|1459|}}
{2010242002|XXGface|73|0|194|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|74|0|196|0|{@{}@Description|417000|231000|0|0|0|0|1458|}}
{2010242002|XXGface|75|0|198|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|76|0|200|0|{@{}@Version|17000|231000|0|0|0|0|1443|}}
{2010242002|XXGface|77|0|202|0|{@{}@Candara|32768|100|0|}}
{2010240003|XXGlegend|78|0|204|0|{@{}@Initial version|412000|248000|0|0|0|0|1476|}}
{2010242002|XXGface|79|0|206|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|80|0|208|0|{@{}@May 26 2016|82000|248000|0|0|0|0|1477|}}
{2010242002|XXGface|81|0|210|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|82|0|212|0|{@{}@1.0|17000|248000|0|0|0|0|1474|}}
{2010242002|XXGface|83|0|214|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|84|0|216|0|{@{}@Swayam Mishra (Exusia)|187000|248000|0|0|0|0|1475|}}
{2010242002|XXGface|85|0|218|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|86|0|220|0|{@{}@Summary:

This graph loads the load ready file created in combine process into IDW tables.|15000|42500|0|0|0|0|1442|}}
{2010242002|XXGface|87|0|222|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|88|0|224|0|{@{}@3.0|17000|288000|0|0|0|0|1487|}}
{2010242002|XXGface|89|0|226|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|90|0|228|0|{@{}@Dec 16 2016|82000|288000|0|0|0|0|1485|}}
{2010242002|XXGface|91|0|230|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|92|0|232|0|{@{}@Gunit Kaur (Exusia)|187000|288000|0|0|0|0|1484|}}
{2010242002|XXGface|93|0|234|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|94|0|236|0|{@{}@Read ILM Events|412000|288000|0|0|0|0|1486|}}
{2010242002|XXGface|95|0|238|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|96|0|240|0|{@{}@4.0|17000|308000|0|0|0|0|1490|}}
{2010242002|XXGface|97|0|242|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|98|0|244|0|{@{}@Feb 01 2017|82000|308000|0|0|0|0|1489|}}
{2010242002|XXGface|99|0|246|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|100|0|248|0|{@{}@Gunit Kaur (Exusia)|187000|308000|0|0|0|0|1488|}}
{2010242002|XXGface|101|0|250|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|102|0|252|0|{@{}@Load utilities and load layouts (serial/parallel load) support added|412000|308000|0|0|0|0|1491|}}
{2010242002|XXGface|103|0|254|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|104|0|256|0|{@{}@Swayam Mishra (Exusia)|187000|268000|0|0|0|0|1478|}}
{2010242002|XXGface|105|0|258|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|106|0|260|0|{@{}@Truncate & Load feature added|412000|268000|0|0|0|0|1481|}}
{2010242002|XXGface|107|0|262|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|108|0|264|0|{@{}@July 18 2016|82000|268000|0|0|0|0|1482|}}
{2010242002|XXGface|109|0|266|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|110|0|268|0|{@{}@2.0|17000|268000|0|0|0|0|1483|}}
{2010242002|XXGface|111|0|270|0|{@{}@Candara|0|100|0|}}
{2010240003|XXGlegend|112|0|272|0|{@{}@High Level Design conceived by:
Anwar Parvez, Alex Zhao

ETL Design conceived by:
Manav Jindal|18000|110000|0|0|0|0|1492|}}
{2010242002|XXGface|113|0|274|0|{@{}@Candara|0|100|0|}}
{2010600005|XXGgraph|114|0|276|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!_ab_interface_instance|1|3|9|P|@{0|}}
{30001002|XXparameter|!_ab_interface_multiphase|1|3|9|P|@{0|}}
{30001002|XXparameter|!prototype|$PUB_DXF_COMPONENTS/target_load_db.mgi|3|9|Pf|@{0|}}
{30001002|XXparameter|implementation|$LOAD_TARGET_DB_IMPLEMENTATION|3|9|f|@{0|}}
{30001002|XXparameter|DATA_MART_NAME|$DATA_MART_NAME|3|2|$|@{0|}}
{30001002|XXparameter|TABLE_NAME|$TABLE_NAME|3|9||@{0|}}
{30001002|XXparameter|TGT_DB_PROJECT|$TGT_DB_PROJECT|3|9||@{0|}}
{30001002|XXparameter|RUN_ID|$RUN_ID|3|9||@{0|}}
{30001002|XXparameter|LOAD_READY_DML|$LOAD_READY_DML|3|9||@{0|}}
{30001002|XXparameter|TARGET_DB_LIST|$TARGET_DB_LIST|3|9||@{0|}}
{30001002|XXparameter|TARGET_DB_INFO_VEC|$TARGET_DB_INFO_VEC|3|9||@{0|}}
{30001002|XXparameter|TARGET_SQL_DB_INFO|$TARGET_SQL_DB_INFO|3|9||@{0|}}
{30001002|XXparameter|STAGING_DATA_DB_INFO|$STAGING_DATA_DB_INFO|3|9||@{0|}}
{30001002|XXparameter|TARGET_DATA_DB_INFO|$TARGET_DATA_DB_INFO|3|9||@{0|}}
{30001002|XXparameter|TARGET_SQL_DBC_FILE|$TARGET_SQL_DBC_FILE|3|9||@{0|}}
{30001002|XXparameter|STAGING_DATA_DBC_FILE|$STAGING_DATA_DBC_FILE|3|9||@{0|}}
{30001002|XXparameter|TARGET_DATA_DBC_FILE|$TARGET_DATA_DBC_FILE|3|9||@{0|}}
{30001002|XXparameter|TARGET_DML|$TARGET_DML|3|9||@{0|}}
{30001002|XXparameter|TARGET_MAIN_DB|$TARGET_MAIN_DB|3|9||@{0|}}
{30001002|XXparameter|TARGET_STAGING_DB|$TARGET_STAGING_DB|3|9||@{0|}}
{30001002|XXparameter|SERIAL_LAYOUT|$SERIAL_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|TARGET_DB_LAYOUT|$TARGET_DB_LAYOUT|3|9||@{0|}}
{30001002|XXparameter|TARGET_NAME|$TARGET_NAME|3|9||@{0|}}
{30001002|XXparameter|TARGET_LOWER|$TARGET_LOWER|3|9||@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|$TARGET_SYSTEM|3|9||@{0|}}
{30001002|XXparameter|CHECK_DB_PARAMETERS|$CHECK_DB_PARAMETERS|3|9||@{0|}}
{30001002|XXparameter|TARGET_ENTITY|$TARGET_ENTITY|3|9||@{0|}}
{30001002|XXparameter|STAGING_TABLE_PREFIX|$STAGING_TABLE_PREFIX|3|9||@{0|}}
{30001002|XXparameter|TARGET_TABLE|$TABLE_NAME|3|9||@{0|}}
{30001002|XXparameter|TARGET_DML_FILE|$TARGET_DML_FILE|3|9||@{0|}}
{30001002|XXparameter|NATURAL_KEY|$NATURAL_KEY|3|9||@{0|}}
{30001002|XXparameter|DB_LOAD_INTERFACE|utility|3|9||@{0|}}
{30001002|XXparameter|FAIL_FOR_REJ_FLG|$FAIL_FOR_REJ_FLG|3|9||@{0|}}
{30001002|XXparameter|TRUNCATE_SQL|$TRUNCATE_SQL|3|9||@{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD|$TRUNCATE_AND_LOAD|3|9||@{0|}}
{30001002|XXparameter|UPDATE_DB_SQL|$UPDATE_DB_SQL|3|9||@{0|}}
{30001002|XXparameter|INSERT_DB_SQL|$INSERT_DB_SQL|3|9||@{0|}}
{30001002|XXparameter|EFF_DATE|$EFF_DATE|3|9||@{0|}}
{30001002|XXparameter|NATIVE_OPTIONS|$NATIVE_OPTIONS|3|9||@{0|}}
{30001002|XXparameter|insert_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|load_to_main_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|update_metadata||3|8|s=|@{0|}}
{30001002|XXparameter|NZ_DISTRIBUTION_KEY|$NZ_DISTRIBUTION_KEY|3|9||@{0|}}
{30001002|XXparameter|Layout||3|8|s=|@{0|}}
}}@0|@632000|320500|0|0|0|0|14062|target load db||@1|100|0||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|5|}}
{2010600005|XXGgraph|115|0|278|0|{|{30100001|XXparameter_set|@@@@{{30001002|XXparameter|condition||3|2|F$||{0|}}
{30001002|XXparameter|condition_interpretation|@15|1|Fl||{2|Replace with flow|Remove completely|}}
{30001002|XXparameter|conditionInputPort||3|2|F$||{0|}}
{30001002|XXparameter|conditionOutputPort||3|2|F$||{0|}}
{30001002|XXparameter|implementation|@44|9|RFf|A target subgraph that implements this interface, or a pset for one.|{0|}}
{30001002|XXparameter|!_ab_graph_interface|1|3|9|P|@{0|}}
{30001002|XXparameter|_ab_semantic_schema|6|1|1|Hnl|@{0|}}
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
{30001002|XXparameter|DATA_MART_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|TABLE_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|IDS_SOURCE_NAME|$TABLE_NAME|3|9|FK|@{0|}}
{30001002|XXparameter|TGT_DB_PROJECT|@3|9|FK|@{0|}}
{30001002|XXparameter|RUN_ID|@3|9|FK|@{0|}}
{30001002|XXparameter|LOAD_READY_DML|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DB_LIST|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DB_INFO_VEC|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_SQL_DB_INFO|@3|9|FK|@{0|}}
{30001002|XXparameter|STAGING_DATA_DB_INFO|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DATA_DB_INFO|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_SQL_DBC_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|STAGING_DATA_DBC_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DATA_DBC_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DML|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_MAIN_DB|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_STAGING_DB|@3|9|FK|@{0|}}
{30001002|XXparameter|SERIAL_LAYOUT|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DB_LAYOUT|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_NAME|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_LOWER|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_SYSTEM|@3|9|FK|@{0|}}
{30001002|XXparameter|CHECK_DB_PARAMETERS|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_ENTITY|@3|9|FK|@{0|}}
{30001002|XXparameter|STAGING_TABLE_PREFIX|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_TABLE|@3|9|FK|@{0|}}
{30001002|XXparameter|TARGET_DML_FILE|@3|9|FK|@{0|}}
{30001002|XXparameter|NATURAL_KEY|@3|9|FK|@{0|}}
{30001002|XXparameter|NZ_DISTRIBUTION_KEY|@3|9|FK|@{0|}}
{30001002|XXparameter|DB_LOAD_INTERFACE|@15|9|FK|@{2|utility|api|}}
{30001002|XXparameter|FAIL_FOR_REJ_FLG|@3|9|FK|@{0|}}
{30001002|XXparameter|TRUNCATE_SQL|@3|9|FK|@{0|}}
{30001002|XXparameter|TRUNCATE_AND_LOAD|@13|9|FK|@{0|}}
{30001002|XXparameter|UPDATE_DB_SQL|@3|9|FK|@{0|}}
{30001002|XXparameter|INSERT_DB_SQL|@3|9|FK|@{0|}}
{30001002|XXparameter|EFF_DATE|@3|9|FK|@{0|}}
{30001002|XXparameter|NATIVE_OPTIONS|@3|9|FK|@{0|}}
{30001002|XXparameter|Layout|@9|2|RFs$||{0|}}
{30001002|XXparameter|Layout.layout_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!_ab_interface_multiphase|1|3|9|P|@{0|}}
{30001002|XXparameter|insert_metadata||7|9|RF||{0|}}
{30001002|XXparameter|insert_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|load_to_main_metadata||7|9|RF||{0|}}
{30001002|XXparameter|load_to_main_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|update_metadata||7|9|RF||{0|}}
{30001002|XXparameter|update_metadata.group|dsg.ports|3|9|P|@{0|}}
{30001002|XXparameter|mpcmodtime|1532535364|1|1|Hl|The last modification time of this component's template|{0|}}
{30001002|XXparameter|_propagation|@3|1|HKl|@{0|}}
}}@0|@0|0|0|0|0|0|0|Graph Interface||@1|100|-1||9||1|{0|}0|0|{0|}{0|}{0|}{0|}1.0|600000|400000|5|}}
{2010202004|XXGiport|116|0|280|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|insert|0.0|@@@14224|0|}}
{2010202004|XXGiport|117|0|283|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|load_to_main|0.0|@@@14224|0|}}
{2010202004|XXGiport|118|0|286|0|{@{30100001|XXparameter_set|@@@@{{30001002|XXparameter|!metadata_propagation_direction|inward|3|9|P|@{0|}}
{30001002|XXparameter|!propagation_supporting_layout|Layout|3|9|P|@{0|}}
{30001002|XXparameter|metadata||7|8|RF=||{0|}}
}}@0|0|0|0|update|0.0|@@@14224|0|}}
{2010202004|XXGiport|119|0|289|0|{@{}@0|0|0|0|insert|0.0|@@@14224|0|}}
{2010202004|XXGiport|120|0|292|0|{@{}@0|0|0|0|load_to_main|0.0|@@@14224|0|}}
{2010202004|XXGiport|121|0|295|0|{@{}@0|0|0|0|update|0.0|@@@14224|0|}}
{2010110002|XXGconstant|122|0|302|0|{@{}@{1|9175615|}}}
{2010002001|XXGdirectory_object_object|0|1|2|0|{XXGgraph|}0|1|}
{2010704001|XXGgraph_graphinfo_graphinfo|1|0|2|0|{}1|2|}
{2010706001|XXGgraphinfo_runsettings_runsettings|2|0|4|0|{}2|3|}
{2010109001|XXGobject_property_value|3|0|6|0|{0|legend_face|92|}2|4|}
{2010605001|XXGgraph_legend_legend|4|0|8|0|{0|}1|5|}
{2010241001|XXGlegend_face_face|5|0|10|0|{}5|6|}
{2010605001|XXGgraph_legend_legend|6|0|12|0|{1|}1|7|}
{2010241001|XXGlegend_face_face|7|0|14|0|{}7|8|}
{2010604001|XXGgraph_flow_flow|8|0|16|0|{Flow_1|}1|9|}
{2010604001|XXGgraph_flow_flow|9|0|18|0|{Flow_2|}1|10|}
{2010604001|XXGgraph_flow_flow|10|0|20|0|{Flow_21|}1|11|}
{2010604001|XXGgraph_flow_flow|11|0|22|0|{Flow_3|}1|12|}
{2010604001|XXGgraph_flow_flow|12|0|24|0|{Flow_4|}1|13|}
{2010601001|XXGgraph_vertex_vertex|13|0|26|0|{Delete_Records|}1|14|}
{2010211001|XXGvertex_iport_iport|14|0|28|0|{0|in|}14|15|}
{2010214001|XXGiport_src_flow|15|0|30|0|{0|}15|11|}
{2010007001|XXGobject_proto_object|16|0|31|0|{}14|16|}
{2010211001|XXGvertex_iport_iport|17|0|33|0|{0|in|}16|17|}
{2010006001|XXGobject_psameas_object|18|0|35|0|{metadata|in_metadata|1|0|}17|16|}
{2010006001|XXGobject_psameas_object|19|0|36|0|{Layout|Layout|0|0|}14|18|}
{2010212001|XXGvertex_oport_oport|20|0|38|0|{0|read|}18|19|}
{2010213001|XXGoport_dst_flow|21|0|40|0|{0|}19|9|}
{2010007001|XXGobject_proto_object|22|0|41|0|{}18|20|}
{2010212001|XXGvertex_oport_oport|23|0|43|0|{0|read|}20|21|}
{2010006001|XXGobject_psameas_object|24|0|45|0|{metadata|read_metadata|1|0|}21|20|}
{2010006001|XXGobject_psameas_object|25|0|46|0|{in_metadata|out0_metadata|0|0|}14|22|}
{2010212001|XXGvertex_oport_oport|26|0|48|0|{0|out0|}22|23|}
{2010213001|XXGoport_dst_flow|27|0|50|0|{0|}23|10|}
{2010212001|XXGvertex_oport_oport|28|0|51|0|{1|out1|}22|24|}
{2010213001|XXGoport_dst_flow|29|0|53|0|{0|}24|12|}
{2010212001|XXGvertex_oport_oport|30|0|54|0|{2|out2|}22|25|}
{2010213001|XXGoport_dst_flow|31|0|56|0|{0|}25|13|}
{2010212001|XXGvertex_oport_oport|32|0|57|0|{3|out3|}22|26|}
{2010213001|XXGoport_dst_flow|33|0|59|0|{0|}26|11|}
{2010212001|XXGvertex_oport_oport|34|0|60|0|{4|reject0|}22|27|}
{2010212001|XXGvertex_oport_oport|35|0|62|0|{5|reject1|}22|28|}
{2010212001|XXGvertex_oport_oport|36|0|64|0|{6|reject2|}22|29|}
{2010212001|XXGvertex_oport_oport|37|0|66|0|{7|reject3|}22|30|}
{2010212001|XXGvertex_oport_oport|38|0|68|0|{8|error0|}22|31|}
{2010212001|XXGvertex_oport_oport|39|0|70|0|{9|error1|}22|32|}
{2010212001|XXGvertex_oport_oport|40|0|72|0|{10|error2|}22|33|}
{2010212001|XXGvertex_oport_oport|41|0|74|0|{11|error3|}22|34|}
{2010212001|XXGvertex_oport_oport|42|0|76|0|{12|log|}22|35|}
{2010211001|XXGvertex_iport_iport|43|0|78|0|{0|in|}22|36|}
{2010214001|XXGiport_src_flow|44|0|80|0|{0|}36|9|}
{2010007001|XXGobject_proto_object|45|0|81|0|{}22|37|}
{2010212001|XXGvertex_oport_oport|46|0|83|0|{0|out0|}37|38|}
{2010006001|XXGobject_psameas_object|47|0|85|0|{metadata|out0_metadata|1|0|}38|37|}
{2010006001|XXGobject_psameas_object|48|0|86|0|{transform0|transform0|1|0|}38|37|}
{2010212001|XXGvertex_oport_oport|49|0|87|0|{1|out1|}37|39|}
{2010006001|XXGobject_psameas_object|50|0|89|0|{metadata|out1_metadata|1|0|}39|37|}
{2010006001|XXGobject_psameas_object|51|0|90|0|{transform1|transform1|1|0|}39|37|}
{2010212001|XXGvertex_oport_oport|52|0|91|0|{2|out2|}37|40|}
{2010006001|XXGobject_psameas_object|53|0|93|0|{metadata|out2_metadata|1|0|}40|37|}
{2010006001|XXGobject_psameas_object|54|0|94|0|{transform2|transform2|1|0|}40|37|}
{2010212001|XXGvertex_oport_oport|55|0|95|0|{3|out3|}37|41|}
{2010006001|XXGobject_psameas_object|56|0|97|0|{metadata|out3_metadata|1|0|}41|37|}
{2010006001|XXGobject_psameas_object|57|0|98|0|{transform3|transform3|1|0|}41|37|}
{2010212001|XXGvertex_oport_oport|58|0|99|0|{4|reject0|}37|42|}
{2010006001|XXGobject_psameas_object|59|0|101|0|{metadata|reject0_metadata|1|0|}42|37|}
{2010212001|XXGvertex_oport_oport|60|0|102|0|{5|reject1|}37|43|}
{2010006001|XXGobject_psameas_object|61|0|104|0|{metadata|reject1_metadata|1|0|}43|37|}
{2010212001|XXGvertex_oport_oport|62|0|105|0|{6|reject2|}37|44|}
{2010006001|XXGobject_psameas_object|63|0|107|0|{metadata|reject2_metadata|1|0|}44|37|}
{2010212001|XXGvertex_oport_oport|64|0|108|0|{7|reject3|}37|45|}
{2010006001|XXGobject_psameas_object|65|0|110|0|{metadata|reject3_metadata|1|0|}45|37|}
{2010212001|XXGvertex_oport_oport|66|0|111|0|{8|error0|}37|46|}
{2010006001|XXGobject_psameas_object|67|0|113|0|{metadata|error0_metadata|1|0|}46|37|}
{2010212001|XXGvertex_oport_oport|68|0|114|0|{9|error1|}37|47|}
{2010006001|XXGobject_psameas_object|69|0|116|0|{metadata|error1_metadata|1|0|}47|37|}
{2010212001|XXGvertex_oport_oport|70|0|117|0|{10|error2|}37|48|}
{2010006001|XXGobject_psameas_object|71|0|119|0|{metadata|error2_metadata|1|0|}48|37|}
{2010212001|XXGvertex_oport_oport|72|0|120|0|{11|error3|}37|49|}
{2010006001|XXGobject_psameas_object|73|0|122|0|{metadata|error3_metadata|1|0|}49|37|}
{2010212001|XXGvertex_oport_oport|74|0|123|0|{12|log|}37|50|}
{2010006001|XXGobject_psameas_object|75|0|125|0|{metadata|log_metadata|1|0|}50|37|}
{2010211001|XXGvertex_iport_iport|76|0|126|0|{0|in|}37|51|}
{2010006001|XXGobject_psameas_object|77|0|128|0|{metadata|in_metadata|1|0|}51|37|}
{2010006001|XXGobject_psameas_object|78|0|129|0|{Layout|Layout|0|0|}22|18|}
{2010006001|XXGobject_psameas_object|79|0|130|0|{in_metadata|read_metadata|0|0|}22|18|}
{2010006001|XXGobject_psameas_object|80|0|131|0|{out1_metadata|out0_metadata|0|0|}22|22|}
{2010006001|XXGobject_psameas_object|81|0|132|0|{out2_metadata|out0_metadata|0|0|}22|22|}
{2010006001|XXGobject_psameas_object|82|0|133|0|{out3_metadata|out0_metadata|0|0|}22|22|}
{2010006001|XXGobject_psameas_object|83|0|134|0|{reject0_metadata|read_metadata|0|0|}22|18|}
{2010006001|XXGobject_psameas_object|84|0|135|0|{reject1_metadata|read_metadata|0|0|}22|18|}
{2010006001|XXGobject_psameas_object|85|0|136|0|{reject2_metadata|read_metadata|0|0|}22|18|}
{2010006001|XXGobject_psameas_object|86|0|137|0|{reject3_metadata|read_metadata|0|0|}22|18|}
{2010601001|XXGgraph_vertex_vertex|87|0|138|0|{Load_Ready_File|}1|18|}
{2010601001|XXGgraph_vertex_vertex|88|0|139|0|{RFMT_Determine_Actions|}1|22|}
{2010601001|XXGgraph_vertex_vertex|89|0|140|0|{Update_Consumption_Log|}1|52|}
{2010604001|XXGgraph_flow_flow|90|0|142|0|{Flow_17|}52|53|}
{2010604001|XXGgraph_flow_flow|91|0|144|0|{Flow_22|}52|54|}
{2010601001|XXGgraph_vertex_vertex|92|0|146|0|{Consumption_Log|}52|55|}
{2010211001|XXGvertex_iport_iport|93|0|148|0|{0|write|}55|56|}
{2010214001|XXGiport_src_flow|94|0|150|0|{0|}56|53|}
{2010007001|XXGobject_proto_object|95|0|151|0|{}55|57|}
{2010211001|XXGvertex_iport_iport|96|0|153|0|{0|write|}57|58|}
{2010006001|XXGobject_psameas_object|97|0|155|0|{metadata|write_metadata|1|0|}58|57|}
{2010601001|XXGgraph_vertex_vertex|98|0|156|0|{Interim_Events_Log|}52|59|}
{2010212001|XXGvertex_oport_oport|99|0|158|0|{0|read|}59|60|}
{2010213001|XXGoport_dst_flow|100|0|160|0|{0|}60|54|}
{2010007001|XXGobject_proto_object|101|0|161|0|{}59|61|}
{2010212001|XXGvertex_oport_oport|102|0|163|0|{0|read|}61|62|}
{2010006001|XXGobject_psameas_object|103|0|165|0|{metadata|read_metadata|1|0|}62|61|}
{2010601001|XXGgraph_vertex_vertex|104|0|166|0|{Updating_Consumption_Entry|}52|63|}
{2010212001|XXGvertex_oport_oport|105|0|168|0|{0|out|}63|64|}
{2010213001|XXGoport_dst_flow|106|0|170|0|{0|}64|53|}
{2010211001|XXGvertex_iport_iport|107|0|171|0|{0|in|}63|65|}
{2010214001|XXGiport_src_flow|108|0|173|0|{0|}65|54|}
{2010007001|XXGobject_proto_object|109|0|174|0|{}63|66|}
{2010212001|XXGvertex_oport_oport|110|0|176|0|{0|out|}66|67|}
{2010006001|XXGobject_psameas_object|111|0|178|0|{metadata|out_metadata|1|0|}67|66|}
{2010211001|XXGvertex_iport_iport|112|0|179|0|{0|in|}66|68|}
{2010006001|XXGobject_psameas_object|113|0|181|0|{metadata|in_metadata|1|0|}68|66|}
{2010006001|XXGobject_psameas_object|114|0|182|0|{Layout|Layout|0|0|}63|55|}
{2010006001|XXGobject_psameas_object|115|0|183|0|{in_metadata|read_metadata|0|0|}63|59|}
{2010006001|XXGobject_psameas_object|116|0|184|0|{out_metadata|read_metadata|0|0|}63|59|}
{2010601001|XXGgraph_vertex_vertex|117|0|185|0|{Version_Log|}1|69|}
{2010605001|XXGgraph_legend_legend|118|0|187|0|{0|}69|70|}
{2010241001|XXGlegend_face_face|119|0|189|0|{}70|71|}
{2010605001|XXGgraph_legend_legend|120|0|191|0|{1|}69|72|}
{2010241001|XXGlegend_face_face|121|0|193|0|{}72|73|}
{2010605001|XXGgraph_legend_legend|122|0|195|0|{2|}69|74|}
{2010241001|XXGlegend_face_face|123|0|197|0|{}74|75|}
{2010605001|XXGgraph_legend_legend|124|0|199|0|{3|}69|76|}
{2010241001|XXGlegend_face_face|125|0|201|0|{}76|77|}
{2010605001|XXGgraph_legend_legend|126|0|203|0|{4|}69|78|}
{2010241001|XXGlegend_face_face|127|0|205|0|{}78|79|}
{2010605001|XXGgraph_legend_legend|128|0|207|0|{5|}69|80|}
{2010241001|XXGlegend_face_face|129|0|209|0|{}80|81|}
{2010605001|XXGgraph_legend_legend|130|0|211|0|{6|}69|82|}
{2010241001|XXGlegend_face_face|131|0|213|0|{}82|83|}
{2010605001|XXGgraph_legend_legend|132|0|215|0|{7|}69|84|}
{2010241001|XXGlegend_face_face|133|0|217|0|{}84|85|}
{2010605001|XXGgraph_legend_legend|134|0|219|0|{8|}69|86|}
{2010241001|XXGlegend_face_face|135|0|221|0|{}86|87|}
{2010605001|XXGgraph_legend_legend|136|0|223|0|{9|}69|88|}
{2010241001|XXGlegend_face_face|137|0|225|0|{}88|89|}
{2010605001|XXGgraph_legend_legend|138|0|227|0|{10|}69|90|}
{2010241001|XXGlegend_face_face|139|0|229|0|{}90|91|}
{2010605001|XXGgraph_legend_legend|140|0|231|0|{11|}69|92|}
{2010241001|XXGlegend_face_face|141|0|233|0|{}92|93|}
{2010605001|XXGgraph_legend_legend|142|0|235|0|{12|}69|94|}
{2010241001|XXGlegend_face_face|143|0|237|0|{}94|95|}
{2010605001|XXGgraph_legend_legend|144|0|239|0|{13|}69|96|}
{2010241001|XXGlegend_face_face|145|0|241|0|{}96|97|}
{2010605001|XXGgraph_legend_legend|146|0|243|0|{14|}69|98|}
{2010241001|XXGlegend_face_face|147|0|245|0|{}98|99|}
{2010605001|XXGgraph_legend_legend|148|0|247|0|{15|}69|100|}
{2010241001|XXGlegend_face_face|149|0|249|0|{}100|101|}
{2010605001|XXGgraph_legend_legend|150|0|251|0|{16|}69|102|}
{2010241001|XXGlegend_face_face|151|0|253|0|{}102|103|}
{2010605001|XXGgraph_legend_legend|152|0|255|0|{17|}69|104|}
{2010241001|XXGlegend_face_face|153|0|257|0|{}104|105|}
{2010605001|XXGgraph_legend_legend|154|0|259|0|{18|}69|106|}
{2010241001|XXGlegend_face_face|155|0|261|0|{}106|107|}
{2010605001|XXGgraph_legend_legend|156|0|263|0|{19|}69|108|}
{2010241001|XXGlegend_face_face|157|0|265|0|{}108|109|}
{2010605001|XXGgraph_legend_legend|158|0|267|0|{20|}69|110|}
{2010241001|XXGlegend_face_face|159|0|269|0|{}110|111|}
{2010605001|XXGgraph_legend_legend|160|0|271|0|{21|}69|112|}
{2010241001|XXGlegend_face_face|161|0|273|0|{}112|113|}
{2010601001|XXGgraph_vertex_vertex|162|0|275|0|{target_load_db|}1|114|}
{2010401001|XXGvertex_prototype_vertex|163|0|277|0|{}114|115|}
{2010211001|XXGvertex_iport_iport|164|0|279|0|{0|insert|}115|116|}
{2010006001|XXGobject_psameas_object|165|0|281|0|{metadata|insert_metadata|1|0|}116|115|}
{2010211001|XXGvertex_iport_iport|166|0|282|0|{1|load_to_main|}115|117|}
{2010006001|XXGobject_psameas_object|167|0|284|0|{metadata|load_to_main_metadata|1|0|}117|115|}
{2010211001|XXGvertex_iport_iport|168|0|285|0|{2|update|}115|118|}
{2010006001|XXGobject_psameas_object|169|0|287|0|{metadata|update_metadata|1|0|}118|115|}
{2010211001|XXGvertex_iport_iport|170|0|288|0|{0|insert|}114|119|}
{2010214001|XXGiport_src_flow|171|0|290|0|{0|}119|10|}
{2010211001|XXGvertex_iport_iport|172|0|291|0|{1|load_to_main|}114|120|}
{2010214001|XXGiport_src_flow|173|0|293|0|{0|}120|12|}
{2010211001|XXGvertex_iport_iport|174|0|294|0|{2|update|}114|121|}
{2010214001|XXGiport_src_flow|175|0|296|0|{0|}121|13|}
{2010006001|XXGobject_psameas_object|176|0|297|0|{Layout|Layout|0|0|}114|18|}
{2010006001|XXGobject_psameas_object|177|0|298|0|{insert_metadata|out0_metadata|0|0|}114|22|}
{2010006001|XXGobject_psameas_object|178|0|299|0|{load_to_main_metadata|out0_metadata|0|0|}114|22|}
{2010006001|XXGobject_psameas_object|179|0|300|0|{update_metadata|out0_metadata|0|0|}114|22|}
{2010109001|XXGobject_property_value|180|0|301|0|{0|TrackingThumbprint|72|}1|122|}
